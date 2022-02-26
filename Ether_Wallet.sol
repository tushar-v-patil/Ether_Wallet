// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint amount) external {
        require(msg.sender == owner, "caller is not owner");
        // owner.transfer(amount);
        payable(msg.sender).transfer(amount); // this saves gas
    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}

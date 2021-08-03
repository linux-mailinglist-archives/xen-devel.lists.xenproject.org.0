Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F73DE70A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 09:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163301.299165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoac-0007p2-Ie; Tue, 03 Aug 2021 07:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163301.299165; Tue, 03 Aug 2021 07:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoac-0007nD-EP; Tue, 03 Aug 2021 07:11:50 +0000
Received: by outflank-mailman (input) for mailman id 163301;
 Tue, 03 Aug 2021 07:11:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IREm=M2=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mAoaa-0007n4-P1
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 07:11:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 10db4cca-f42a-11eb-9a89-12813bfff9fa;
 Tue, 03 Aug 2021 07:11:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04DF2D6E;
 Tue,  3 Aug 2021 00:11:47 -0700 (PDT)
Received: from [10.57.8.137] (unknown [10.57.8.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACAF13F70D;
 Tue,  3 Aug 2021 00:11:45 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 10db4cca-f42a-11eb-9a89-12813bfff9fa
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, christopher.w.clark@gmail.com,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@arm.com>
Subject: XTF on arm
Message-ID: <b02d1b59-382b-0d7d-c032-ef485e0fc02e@arm.com>
Date: Tue, 3 Aug 2021 09:11:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello guys,

During the last Xen community call I was talking about my work to port XTF to arm(more specifically arm64).
There was quite a bigh interest in this topic hence I created a pull request for Andrew's XTF on github with the first patch series.
It consists of several patches creating a base for further implementations.

Support for arm64 allows to run a hello-world test(tests/example) with 2 environments:
-64le: arm64, little endian, no MMU
-mmu64le: arm64, little endian, MMU
Support for arm32 allows to run only a startup code.

This series was tested using qemu-system-aarch64 and FVP_Base_RevC-2xAEMvA with XTF running
as dom0 or domU.

Please review, test, comment and feel free to ask questions(please do that on github).

Pull request:
https://github.com/andyhhp/xtf/pull/4

How to download pull request from github:
https://patch-diff.githubusercontent.com/raw/andyhhp/xtf/pull/4.patch

Instructions on how to prepare base setup for testing XTF on arm64 using QEMU:

1. Build XTF:
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CONFIG_LOAD_ADDRESS=0x80000000
-this will result in 2 binaries inside tests/example:
->test-arm-64le-example - no MMU(uses 0x80000000 as a start address)
->test-arm-mmu64le-example - with MMU

2. Build Xen for arm64
-select early printk for PL011, 0x9000000, 115200

3. Generate device tree:
qemu-system-aarch64 -machine virt,gic_version=3 -machine virtualization=true -cpu cortex-a57 -machine type=virt -m 4096 -smp 4 -display none -machine dumpdtb=virt-gicv3.dtb

4. Add chosen node:
chosen {
xen,xen-bootargs = "noreboot dom0_mem=1024M console=dtuart dtuart=serial0 bootscrub=0 iommu=no";

modules {
#size-cells = <0x1>;
#address-cells = <0x1>;

module@0 {
reg = <0x47000000 0x1000000>;
compatible = "xen,linux-zimage", "multiboot,module";
};

};
};

5. Build u-boot for qemu arm64

6. Run Xen on QEMU with XTF as dom0:
    qemu-system-aarch64
    -machine virt,gic_version=3
    -machine virtualization=true
    -cpu cortex-a57
    -machine type=virt -m 4096 -smp 4
    -bios <u_boot_binary>
    -device loader,file=<xen_binary>,force-raw=on,addr=0x49000000
    -device loader,file=test-arm-mmu64le-example,addr=0x47000000
    -device loader,file=virt-gicv3.dtb,addr=0x44000000
    -nographic -no-reboot
    -chardev socket,id=qemu-monitor,host=localhost,port=7777,server,nowait,telnet
    -mon qemu-monitor,mode=readline


Cheers,
Michal


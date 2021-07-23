Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CE3D4160
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 22:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160368.294838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71Z5-00023v-KR; Fri, 23 Jul 2021 20:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160368.294838; Fri, 23 Jul 2021 20:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71Z5-00020e-H0; Fri, 23 Jul 2021 20:14:35 +0000
Received: by outflank-mailman (input) for mailman id 160368;
 Fri, 23 Jul 2021 20:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvTO=MP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m71Z4-00020Y-9F
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 20:14:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 553130fe-a579-4411-9367-c24061081922;
 Fri, 23 Jul 2021 20:14:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50ED460E99;
 Fri, 23 Jul 2021 20:14:32 +0000 (UTC)
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
X-Inumbo-ID: 553130fe-a579-4411-9367-c24061081922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627071272;
	bh=x/j/4P3YYWm6jqvih0Jy191/jlSekWUSAAPEQjpOFyI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d2aaj7yZo4tWbOO5yte56+PgIJ16EXR5K8t9L8LYXxfCcsDO9ZT2r4TO9qw8npwXs
	 UPttS7O4fD6ikI6WV7qEs845Wm6K8c10xgnTpL+Y9VLmVeV3xcZyITxC+KcTQx063h
	 qJ/d/1MN2x0HwFNpzCr+2KOEF6hLlVnA3P6YkfPVNRZoyENC6Ro6v1iEf8wD/teRAO
	 UfY7hWRgGOenGG0kB7RR5K4hYXFn6r6kGedUr5AKh1vXp/Hk1gGHIhBegRLzJIuuBT
	 lghKMIn7tP+QwwTO7YAJ2GF1ES28Fzmcz3hK3uKC6v12r/NIw+oWBIvR2SktP1qLkg
	 lmFbc10NXTNQA==
Date: Fri, 23 Jul 2021 13:14:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
In-Reply-To: <206a7bc1-4093-d3f5-a54f-8466be06695c@xen.org>
Message-ID: <alpine.DEB.2.21.2107231113260.10122@sstabellini-ThinkPad-T480s>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org> <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org> <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s> <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org> <alpine.DEB.2.21.2107221437120.10122@sstabellini-ThinkPad-T480s> <88c43f6c-9d76-1cab-93f5-ddecc76b487f@xen.org>
 <alpine.DEB.2.21.2107230928460.10122@sstabellini-ThinkPad-T480s> <206a7bc1-4093-d3f5-a54f-8466be06695c@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/07/2021 17:42, Stefano Stabellini wrote:
> > On Fri, 23 Jul 2021, Julien Grall wrote:
> > > On 22/07/2021 22:39, Stefano Stabellini wrote:
> > > > On Thu, 22 Jul 2021, Julien Grall wrote:
> > > > > > You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to
> > > > > > change
> > > > > > from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should
> > > > > > all
> > > > > > work the same.
> > > > > > 
> > > > > > Looking at the boot logs on pastebin I noticed that Xen is not
> > > > > > loaded at
> > > > > > a 2MB aligned address. I recommend you change Xen loading address to
> > > > > > 0x500200000. And the kernel loading address to 0x500400000.
> > > > > 
> > > > > I am curious to know why you recommend to load at 2MB aligned address.
> > > > > The
> > > > > Image protocol doesn't require to load a 2MB aligned address. In fact,
> > > > > we
> > > > > add
> > > > > issue on Juno because the bootloader would load Xen at a 4KB address.
> > > > > UEFI
> > > > > will also load at a 4KB align address.
> > > > 
> > > > It is from empirical evidence :-)
> > > 
> > > Right...
> > > 
> > > > I cannot tell you the exact reason but I saw "strange" problems in the
> > > > past that went away after choosing a 2MB alignment. So we settled for
> > > > using 2MB in ImageBuilder and we haven't seen any more issues.
> > > 
> > > It would have been good to report such issue back then so it could have
> > > been
> > > analyzed and possibly fixed.
> > > 
> > > > However, it could have been anything: a bug in U-Boot not relevant
> > > > anymore, a bug in Linux, etc. I don't know for sure.
> > > 
> > > This is the worrying part. We have a potential bug that no one knows why
> > > it
> > > happened. Can this be reproduced?
> > 
> > I managed to reproduce the problem. I switched ImageBuilder to use 4K
> > alignment (just by changing the variable "offset" at the top of
> > scripts/uboot-script-gen).
> 
> Thank you for reproducing it!
> 
> > It generated a boot.source file like this:
> > 
> > tftpb 0xC01000 2021.1/xen
> > tftpb 0xCEA000 2021.1/xen-Image-5.10
> > tftpb 0x18D1000 2021.1/initrd.cpio
> > tftpb 0x1A55000 2021.1/xen.dtb
> > [trimmed because the rest is not too relevant]
> > 
> > 
> > These are the sizes:
> > 
> > 12479370 Jul  21 19:02 xen-Image-5.10
> > 40577    Jul  21 18:25 xen.dtb
> > 950280   Jul  19 16:58 xen
> > 1586176  Jun  4  17:14 initrd.cpio
> > 
> > 
> > I did the calculations by hand and there are no overlaps. This is the
> > output from u-boot and boot log failure: https://pastebin.com/rbTBPn5g
> 
> FWIW, I just gave a try on the foundation model with bootwrapper. My default
> setup load Xen and the kernel at the following:
> 
> (XEN) MODULE[0]: 0000000088200000 - 000000008835a8f8 Xen
> (XEN) MODULE[1]: 0000000088000000 - 000000008800167f Device Tree
> (XEN) MODULE[2]: 0000000080080000 - 0000000081e7ca00 Kernel
> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
> 
> Xen is 2MB aligned, but the kernel not. I couldn't see any failure.
> 
> I have also tried to load Xen at different address (this time not 2MB aligned)
> and still couldn't spot any issue:
> 
> (XEN) MODULE[0]: 0000000088201000 - 000000008835b8f8 Xen
> (XEN) MODULE[1]: 0000000088000000 - 000000008800167f Device Tree
> (XEN) MODULE[2]: 0000000080081000 - 0000000081e7da00 Kernel
> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
> 
> So this looks something specific to your setup. Looking at the log:
> 
> > (XEN) Latest ChangeSet: Tue Apr 13 10:59:05 2021 -0700 git:f44b1a6ede
> 
> I couldn't find this commit in the tree. What baseline are you using? From my
> side, I tested with 3a98c1a4cec1.

I was just using 57e761b60 plus my 4 recent smmu patches.


> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) invalid compressed format (err=1)
> > (XEN) ****************************************
> 
> This implies Xen think the kernel module was a GZIP image and Xen is trying to
> decompress it. However, from your e-mail above the name of the kernel module
> is xen-Image-5.10 which implies this is not a compressed image.
> 
> Can you confirm what is the format of xen-Image-5.10?

gzip (arch/arm64/boot/Image.gz)


> > Using 2MB works. I tried 1MB for curiosity and got a different
> > error: https://pastebin.com/UHFUHyxN
> 
> > (XEN) pg[0] MFN 00f50 c=0x180000000000000 o=4 v=0x7ffff t=0
> > (XEN) Xen BUG at page_alloc.c:1425
> 
> This looks like two ranges has overlapped each other. Above, you confirmed
> there was no overlap, was it for both 4KB and 1MB alignment?

There don't seem to be any overlaps in the 1MB case also:

tftpb 0xD00000 2021.1/xen
tftpb 0xF00000 2021.1/xen-Image-5.10
tftpb 0x1B00000 2021.1/initrd.cpio
tftpb 0x1D00000 2021.1/xen.dtb


> > Do you think it is worth investigating further?
> 
> Definitely, I have got a setup where 4KB aligned (but not 2MB aligned) works.
> This is a hint that something odd is happening on your setup and I would like
> to understand what.
 
I tried everything 4K aligned except for Linux:

tftpb 0xC01000 2021.1/xen
tftpb 0x2000000 2021.1/xen-Image-5.10
tftpb 0x18F1000 2021.1/initrd.cpio
tftpb 0x1A75000 2021.1/xen.dtb

And I also tried everything 4K aligned except for Xen:

tftpb 0x2000000 2021.1/xen
tftpb 0xD0A000 2021.1/xen-Image-5.10
tftpb 0x18F1000 2021.1/initrd.cpio
tftpb 0x1A75000 2021.1/xen.dtb

For both tests, I just moved one binary higher to 0x2000000. Both tests
worked OK. It is only when everything is 4K that we have a problem.


> I have a Xilinx board at home (I haven't used it recently though), so I am
> happy to help debugging it. Alternatively, do you know if it reproduces on the
> Xilinx QEMU?

Yeah I am using the same Xilinx board that you have.

I also managed to repro the issue on upstream QEMU 2.11 (it might happen
with newer versions but all my scripts and dtbs were already based on
2.11) and upstream U-Boot 2021.04-rc1-00009-gfdcb93e170:


/local/arm-vm/qemu-system-aarch64 \
    -machine virt,gic_version=3 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -smp 4 -m 4096 \
    -serial mon:stdio \
    -bios /local/arm-vm/u-boot.bin \
    -device loader,file=/var/lib/tftpboot/2021.1/xen,force-raw=on,addr=0x40C01000 \
    -device loader,file=/var/lib/tftpboot/2021.1/xen-Image-5.10,force-raw=on,addr=0x40D0A000 \
    -device loader,file=/var/lib/tftpboot/2021.1/initrd.cpio,force-raw=on,addr=0x418F1000 \
    -device loader,file=/local/arm-vm/virt-gicv3-2.dtb,force-raw=on,addr=0x41A75000 \
    -device loader,file=/local/arm-vm/boot.scr,force-raw=on,addr=0x40C00000


With the following boot.scr:

fdt addr 0x41A75000
fdt resize 1024
fdt set /chosen \#address-cells <0x2>
fdt set /chosen \#size-cells <0x2>
fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=2G dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
fdt mknod /chosen dom0
fdt set /chosen/dom0 compatible "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
fdt set /chosen/dom0 reg <0x0 0xD0A000 0x0 0xbe6b8a>
fdt set /chosen xen,dom0-bootargs "console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused root=/dev/ram0"
fdt mknod /chosen dom0-ramdisk
fdt set /chosen/dom0-ramdisk compatible "xen,linux-initrd" "xen,multiboot-module" "multiboot,module"
fdt set /chosen/dom0-ramdisk reg <0x0 0x18F1000 0x0 0x183400>
setenv fdt_high 0xffffffffffffffff
booti 0x40C01000 - 0x41A75000

I get the error:

(XEN) Panic on CPU 0:
(XEN) invalid compressed format (err=1)


I confirmed that it worked after changing the kernel loading address to
0x42000000.


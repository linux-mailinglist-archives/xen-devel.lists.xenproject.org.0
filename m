Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF13D4837
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jul 2021 16:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160487.295078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7J5u-00032d-SE; Sat, 24 Jul 2021 14:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160487.295078; Sat, 24 Jul 2021 14:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7J5u-0002zZ-Ow; Sat, 24 Jul 2021 14:57:38 +0000
Received: by outflank-mailman (input) for mailman id 160487;
 Sat, 24 Jul 2021 14:57:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m7J5t-0002zT-17
 for xen-devel@lists.xenproject.org; Sat, 24 Jul 2021 14:57:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m7J5s-0001DT-RE; Sat, 24 Jul 2021 14:57:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m7J5s-0000Im-LB; Sat, 24 Jul 2021 14:57:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ic6dSPz1O5l70NW83f68iCZeb8m2ZD+vnU0wDHUKzF0=; b=VoajJAl/ZLZZZJeJATxbsfVfj1
	lvzuEMpp0BSdzux/12VlPNlKUB+ofl6PL8iQY3lFr39BVDWYOEQwjcZtSdX9fCh/ALF2oM0aQZQd5
	s036/naaAk9fpDPBqHRhpdHBjtTre8uud+1Eq2Hb53YYwSlC5wgVQDipFC/q02k8w/Fo=;
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
 <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org>
 <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s>
 <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
 <alpine.DEB.2.21.2107221437120.10122@sstabellini-ThinkPad-T480s>
 <88c43f6c-9d76-1cab-93f5-ddecc76b487f@xen.org>
 <alpine.DEB.2.21.2107230928460.10122@sstabellini-ThinkPad-T480s>
 <206a7bc1-4093-d3f5-a54f-8466be06695c@xen.org>
 <alpine.DEB.2.21.2107231113260.10122@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <26451fa3-56c9-0f21-ce05-e5e91088a173@xen.org>
Date: Sat, 24 Jul 2021 15:57:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107231113260.10122@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/07/2021 21:14, Stefano Stabellini wrote:
> On Fri, 23 Jul 2021, Julien Grall wrote:
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) invalid compressed format (err=1)
>>> (XEN) ****************************************
>>
>> This implies Xen think the kernel module was a GZIP image and Xen is trying to
>> decompress it. However, from your e-mail above the name of the kernel module
>> is xen-Image-5.10 which implies this is not a compressed image.
>>
>> Can you confirm what is the format of xen-Image-5.10?
> 
> gzip (arch/arm64/boot/Image.gz)

Ok. I tried to use a compressed Image with bootwrapper on the foundation 
model but I saw no issue (see more below).

[...]

>> I have a Xilinx board at home (I haven't used it recently though), so I am
>> happy to help debugging it. Alternatively, do you know if it reproduces on the
>> Xilinx QEMU?
> 
> Yeah I am using the same Xilinx board that you have.
> 
> I also managed to repro the issue on upstream QEMU 2.11 (it might happen
> with newer versions but all my scripts and dtbs were already based on
> 2.11) and upstream U-Boot 2021.04-rc1-00009-gfdcb93e170:
> 
> 
> /local/arm-vm/qemu-system-aarch64 \
>      -machine virt,gic_version=3 \
>      -machine virtualization=true \
>      -cpu cortex-a57 -machine type=virt \
>      -smp 4 -m 4096 \
>      -serial mon:stdio \
>      -bios /local/arm-vm/u-boot.bin \
>      -device loader,file=/var/lib/tftpboot/2021.1/xen,force-raw=on,addr=0x40C01000 \
>      -device loader,file=/var/lib/tftpboot/2021.1/xen-Image-5.10,force-raw=on,addr=0x40D0A000 \
>      -device loader,file=/var/lib/tftpboot/2021.1/initrd.cpio,force-raw=on,addr=0x418F1000 \
>      -device loader,file=/local/arm-vm/virt-gicv3-2.dtb,force-raw=on,addr=0x41A75000 \
>      -device loader,file=/local/arm-vm/boot.scr,force-raw=on,addr=0x40C00000
> 
> 
> With the following boot.scr:
> 
> fdt addr 0x41A75000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=2G dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0xD0A000 0x0 0xbe6b8a>
> fdt set /chosen xen,dom0-bootargs "console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused root=/dev/ram0"
> fdt mknod /chosen dom0-ramdisk
> fdt set /chosen/dom0-ramdisk compatible "xen,linux-initrd" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0-ramdisk reg <0x0 0x18F1000 0x0 0x183400>
> setenv fdt_high 0xffffffffffffffff
> booti 0x40C01000 - 0x41A75000
> 
> I get the error:
> 
> (XEN) Panic on CPU 0:
> (XEN) invalid compressed format (err=1)

Thanks for the runes. I managed to reproduce it with a recent QEMU. 
Comparing with a working setup on the Foundation model, I noticed that 
some of the byte in memory were different towards the end of the binary.

I have used gdb to watch the memory changed and it stopped in the middle 
of U-boot. In fact the log from U-boot has:

=> booti 0x40C01000 - 0x41A75000
Moving Image from 0x40c01000 to 0x40e00000, end=40f5a8f8
## Flattened Device Tree blob at 41a75000
    Booting using the fdt blob at 0x41a75000
    Using Device Tree in place at 0000000041a75000, end 0000000041a7afff

The second line shows that U-boot relocated Xen in middle of the kernel 
Image.

Looking at the U-boot code, it contains:

	/*
	 * If bit 3 of the flags field is set, the 2MB aligned base of the
	 * kernel image can be anywhere in physical memory, so respect
	 * images->ep.  Otherwise, relocate the image to the base of RAM
	 * since memory below it is not accessible via the linear mapping.
	 */
	if (!force_reloc && (le64_to_cpu(ih->flags) & BIT(3)))
		dst = image - text_offset;
	else
		dst = gd->bd->bi_dram[0].start;

	*relocated_addr = ALIGN(dst, SZ_2M) + text_offset;

This will force the kernel to be at 2MB aligned around the address it 
where loaded (if bit 3 is set) or at the start of the RAM.

Looking again at the Image protocol, they indeed have a requirement to 
be loaded at a 2MB aligned base address. So I was wrong about the 
alignment :/. Apologies, I should have check 
Documentation/arm64/booting.rst rather than relying solely on our changelog.

TBH, I think this is a bit naughty for U-boot to overwrite some modules. 
But I guess it doesn't know them at least when already loaded in the 
memory (not sure for tftp).

Now, I wonder why the following commit introduced the 4KB alignment:

commit ca59618967fe0c3ecc6cb7bd8bd0f5651b4e9dea
Author: Ian Campbell <ian.campbell@citrix.com>
Date:   Mon Jul 21 13:59:56 2014 +0100

     xen: arm: Handle 4K aligned hypervisor load address.

     Currently the boot page tables map Xen at XEN_VIRT_START using a 
2MB section
     mapping. This means that the bootloader must load Xen at a 2MB 
aligned address.
     Unfortunately this is not the case with UEFI on the Juno platform 
where Xen
     fails to boot. Furthermore the Linux boot protocol (which Xen 
claims to adhere
     to) does not have this restriction, therefore this is our bug and 
not the
     bootloader's.

     Fix this by adding third level pagetables to the boot time 
pagetables, allowing
     us to map a Xen which is aligned only to a 4K boundary. This only 
affects the
     boot time page tables since Xen will later relocate itself to a 2MB 
aligned
     address. Strictly speaking the non-boot processors could make use 
of this and
     use a section mapping, but it is simpler if all processors follow 
the same boot
     path.

     Strictly speaking the Linux boot protocol doesn't even require 4K 
alignment
     (and apparently Linux can cope with this), but so far all 
bootloaders appear to
     provide it, so support for this is left for another day.

     In order to use LPAE_ENTRIES in head.S we need to define it in an 
asm friendly
     way.

     Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
     Acked-by: Julien Grall <julien.grall@linaro.org>
     [ ijc -- properly format message "- FOO -\r\n" ]

IIRC, Juno (both r1 and r2) are Armv8 processor (supporting both 32-bit 
and 64-bit). From the commit message it is not entirely clear whether 
the issue was found on 64-bit or 32-bit.

I am tempted to force the 2MB alignment on Arm64 again (AFAICT zImage 
doesn't require a 2MB alignment) because the assembly code should be 
shorter. I would need to check what alignment UEFI requires first.

Anyway, that was a fun issue to debug. For Xen, we may want to consider 
to check overlapping of the modules in very early boot. This would help 
diagnosing such issues.

Cheers,

-- 
Julien Grall


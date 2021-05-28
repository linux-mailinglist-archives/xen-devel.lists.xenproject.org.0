Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B4394513
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 17:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134005.249555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmePZ-000359-TM; Fri, 28 May 2021 15:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134005.249555; Fri, 28 May 2021 15:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmePZ-00032W-Q2; Fri, 28 May 2021 15:28:33 +0000
Received: by outflank-mailman (input) for mailman id 134005;
 Fri, 28 May 2021 15:28:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lmePY-00032Q-F6
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 15:28:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmePU-0000l4-6J; Fri, 28 May 2021 15:28:28 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmePT-0002Gs-Vj; Fri, 28 May 2021 15:28:28 +0000
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
	bh=R/moMEWBQRAgkgeccBxxZhe4pxMQezg1ErEy4FNVmVM=; b=1+LWuObCW3ZRGkbMxmFe9e6X4x
	5ERaKvgkGNJkji2RPYd8fm+KB3Awjq8rzwh7GU9ep6vMteAtP+p/qy5fW1Xd4nBVUvHSnTj+uXwFO
	adcZ4/geumUKmltrOF6ov/EVb+7L+6v4ksND5SCYBBbUuAdOqMF3YE2qRf53XK0hhHsQ=;
Subject: Re: What's missing for arm64 Xen boot with FDT via Grub in Debian
 Bullseye?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Debian Install System Team <debian-boot@lists.debian.org>,
 pkg-grub-devel@alioth-lists.debian.net,
 pkg-xen-devel@lists.alioth.debian.org, xen-devel@lists.xenproject.org
Cc: Steve McIntyre <93sam@debian.org>,
 Ruchika Gupta <ruchika.gupta@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <87mtse2ac8.fsf@linaro.org>
From: Julien Grall <julien@xen.org>
Message-ID: <0df82c26-078a-83de-952c-cbad06b3ad2d@xen.org>
Date: Fri, 28 May 2021 16:28:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <87mtse2ac8.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/05/2021 13:49, Alex Bennée wrote:
> 
> Hi,

Hi Alex,

> I'm currently trying to pull together the threads for booting Xen on
> Debian. I'm currently doing this within QEMU's TCG emulation and the
> "virt" machine model:
> 
>    -machine type=virt,virtualization=on,gic-version=3 \
>    -cpu max,pauth-impdef=on
> 
> with the firmware on my Ubuntu machine:
> 
>    -drive if=pflash,file=/usr/share/AAVMF/AAVMF_CODE.fd,format=raw,readonly=on -drive if=pflash,file=$HOME/images/AAVMF_VARS.fd,format=raw
> 
> (qemu-efi-aarch64 Version: 0~20180205.c0d9813c-2ubuntu0.3)
> 
> When booting this way I get the Grub menu and Xen is loaded by Grub but
> falls over later:
> 
>    (XEN) MODULE[0]: 00000000f5869000 - 00000000f59b60c8 Xen
>    (XEN) MODULE[1]: 000000013857d000 - 0000000138580000 Device Tree
>    (XEN) MODULE[2]: 00000000f73a1000 - 00000000f8da0780 Kernel
>    (XEN) MODULE[3]: 00000000f59b7000 - 00000000f739f99b Ramdisk
>    (XEN)
>    (XEN) CMDLINE[00000000f73a1000]:chosen placeholder root=UUID=435201aa-c5cf-4e7a-8107-5eef28844188 ro console=hvc0
>    (XEN)
>    (XEN) Command line: placeholder dom0_mem=2G loglvl=all guest_loglvl=all no-real-mode edd=off
>    (XEN) parameter "placeholder" unknown!
>    (XEN) parameter "no-real-mode" unknown!
>    (XEN) parameter "edd" unknown!
>    (XEN) Domain heap initialised
>    (XEN) Booting using Device Tree
>    (XEN) Platform: Generic System
>    (XEN)
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) Unable to find a compatible timer in the device tree
>    (XEN) ****************************************
> 
> It seems like there are bits of the DT missing. I can however
> successfully boot Xen with the Linux guest using the guest-loader device
> and bypassing the firmware/boot code step. This gives:
> 
>    (XEN) MODULE[0]: 0000000040200000 - 000000004034d0c8 Xen
>    (XEN) MODULE[1]: 0000000048000000 - 0000000048100000 Device Tree
>    (XEN) MODULE[2]: 0000000046000000 - 0000000046eb2200 Kernel
>    (XEN)
>    (XEN) CMDLINE[0000000046000000]:chosen root=/dev/sda2 console=hvc0 earlyprintk=xen
>    (XEN)
>    (XEN) Command line: dom0_mem=4G dom0_max_vcpus=4
>    (XEN) Domain heap initialised
>    (XEN) Booting using Device Tree
>    (XEN) Platform: Generic System
>    (XEN) Taking dtuart configuration from /chosen/stdout-path
>    (XEN) Looking for dtuart at "/pl011@9000000", options ""
>     Xen 4.15.1-pre
>    (XEN) Xen version 4.15.1-pre (alex.bennee@) (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0) debug=y Tue May 18 09:34:55 UTC 2021
>    (XEN) Latest ChangeSet:
>    (XEN) build-id: a50d8f03a1a15662ac7c4e5f73f2f544a6739df2
>    (XEN) Processor: 411fd070: "ARM Limited", variant: 0x1, part 0xd07, rev 0x0
>    (XEN) 64-bit Execution:
>    (XEN)   Processor Features: 0000000001000222 0000000000000000
>    (XEN)     Exception Levels: EL3:No EL2:64+32 EL1:64+32 EL0:64+32
>    (XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
>    (XEN)   Debug Features: 0000000010305106 0000000000000000
>    (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
>    (XEN)   Memory Model Features: 0000000000001124 0000000000000000
>    (XEN)   ISA Features:  0000000000011120 0000000000000000
>    (XEN) 32-bit Execution:
>    (XEN)   Processor Features: 00000131:10011001
>    (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
>    (XEN)     Extensions: GenericTimer
>    (XEN)   Debug Features: 03010066
>    (XEN)   Auxiliary Features: 00000000
>    (XEN)   Memory Model Features: 10101105 40000000 01260000 02102211
>    (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
>    (XEN) Using SMC Calling Convention v1.0
>    (XEN) Using PSCI v0.2
>    (XEN) SMP: Allowing 8 CPUs
>    (XEN) enabled workaround for: ARM erratum 832075
>    (XEN) enabled workaround for: ARM erratum 834220
>    (XEN) enabled workaround for: ARM erratum 1319367
>    (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 62500 KHz
>    (XEN) GICv3 initialization:
>    (XEN)       gic_dist_addr=0x00000008000000
>    (XEN)       gic_maintenance_irq=25
>    (XEN)       gic_rdist_stride=0
>    (XEN)       gic_rdist_regions=1
>    (XEN)       redistributor regions:
>    (XEN)         - region 0: 0x000000080a0000 - 0x00000009000000
>    (XEN) GICv3: 256 lines, (IID 0000043b).
>    (XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000
> 
> Attempting to boot with acpi=on still sees Grub attempt to use DT to
> boot the hypervisor. However selecting the kernel directly boots with
> ACPI (which is a shame as I'd like to see what FDT it gets presented
> with).

ACPI is not built by default in Xen on Arm. You will need to select it 
from Kconfig and rebuild the hypervisor.

> 
> The full command line for booting via the guest-loader is:
> 
>    ./qemu-system-aarch64 \
>      -machine virt,virtualization=on,gic-version=3 \
>      -cpu max,pauth-impdef=on \
>      -serial mon:stdio \
>      -netdev user,id=net1,hostfwd=tcp::2222-:22 \
>      -device virtio-net-pci,netdev=net1 \
>      -device virtio-scsi-pci \
>      -drive file=/dev/zvol/hackpool-0/debian-buster-arm64,id=hd0,index=0,if=none,format=raw \
>      -device scsi-hd,drive=hd0 \
>      -display none \
>      -m 16384 \
>      -kernel ~/lsrc/xen/xen.build.arm64-xen/xen/xen \
>      -append "dom0_mem=4G dom0_max_vcpus=4" \
>      -device guest-loader,addr=0x46000000,kernel=$HOME/lsrc/linux.git/builds/arm64/arch/arm64/boot/Image,bootargs="root=/dev/sda2 console=hvc0 earlyprintk=xen" \
>      -smp 8
> 
> So some questions:
> 
>    - is Xen on arm64 tested on Debian Bullseye? If so what platform?

I am using Debian Bullseye on QEMU and also the FVP. We are also using 
Debian in Osstest for all the testing (it is possible an older version 
of Debian).

>    - how do I tell Grub to do a straight FDT boot with the DT from the firmware?

Is the firmware actually providing a DT? You could try to boot Xen from 
UEFI directly to confirm that.

However, I vaguely recall that GRUB may only pass ACPI if it is provided.

>    - are there any missing pieces I should be aware of?

Other than re-building Xen with ACPI=y, I am not aware of any issue to 
use Xen with Debian bullseye.

Cheers,

-- 
Julien Grall


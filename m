Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D96820446
	for <lists+xen-devel@lfdr.de>; Sat, 30 Dec 2023 11:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660281.1029853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJWDX-0000j2-V6; Sat, 30 Dec 2023 10:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660281.1029853; Sat, 30 Dec 2023 10:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJWDX-0000fg-SB; Sat, 30 Dec 2023 10:05:19 +0000
Received: by outflank-mailman (input) for mailman id 660281;
 Sat, 30 Dec 2023 10:05:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rJWDV-0000fa-SF
 for xen-devel@lists.xenproject.org; Sat, 30 Dec 2023 10:05:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rJWDP-0002n0-JL; Sat, 30 Dec 2023 10:05:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rJWDP-0005i4-8t; Sat, 30 Dec 2023 10:05:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=EQ6L6EU+v2PxmAQQndgR2dbv4cYftD9K97Zi6vDcJgU=; b=Xvt6sYkwnTEkC01KhYOQFl0UuD
	rWy6W3Sk0vq7+V6ePpOCRCyufsWmkY2HMHRytD3cWiopUIuZEza9ESrZxDa97Hzyhk3B3FZG0Zfbp
	CC4FC3mLS5H3/53VtSP/qVdVaUHEXBipoanqRTLjqlR9cVPHRN7oDSeXEsQDFfOp4YTA=;
Message-ID: <5ce9eea4-500c-4f06-a7f5-363a0e0d5178@xen.org>
Date: Sat, 30 Dec 2023 10:05:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to boot FreeBSD for arm 32 bit as DomU with u-boot on my ARM
 Chromebook
To: Mario Marietto <marietto2008@gmail.com>, Warner Losh <imp@bsdimp.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Stanislav Silnicki <stanislav.silnicki@mailgate.us>,
 freebsd-arm@freebsd.org, Michal.Orzel@amd.com,
 xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
References: <CA+1FSiit5NJ_W7f5mssivkGGLevXh_XmSB7ZxZbQe1dgev0_Pg@mail.gmail.com>
 <97aa980b9b44.6eb7f9d5c54e7@mailgate.us>
 <CA+1FSiheSwrO7Tz3F3Nmu4vcC2E=ONRX8nF3bhQGV0UDOFTrww@mail.gmail.com>
 <da024d1687f3a.2f0c601bba502@mailgate.us>
 <CA+1FSih7C0HEun99LHEwvyYRiH0PaLwwgnoQLHB69TWz2ykDZg@mail.gmail.com>
 <CA+1FSijoPkRZRaU6tujaMJZeFd3CSyUN+h4y0_NrrB5VWLgwpA@mail.gmail.com>
 <CA+1FSiib3uu9Ky8N5rSSt+H1nfzUnChKhGs2ERWmsbp2T4=2uA@mail.gmail.com>
 <CA+1FSihtb3+bm-pSqa7JGBjy3JUXYD6i0c6J2KHy+EO8rmZ5PA@mail.gmail.com>
 <alpine.DEB.2.22.394.2312191131290.3175268@ubuntu-linux-20-04-desktop>
 <CA+1FSigh=fc07o-RSMZ+hf9-YBUudAwnGcN9k8bP1RnPBP7tRA@mail.gmail.com>
 <CANCZdfpRJxJw2_ma0cCcoGGmAat4KVj5sOfdnGMR9w+OQCYxaQ@mail.gmail.com>
 <CA+1FSigREr=aSHOBMbEK9CaoKzNnKC-6sE=Ui8ovVwnMaZgZhQ@mail.gmail.com>
 <CA+1FSigVW+kS37ZuGeBsr58BfPS10fjptfOnvTbaUOZ7VrUBgg@mail.gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+1FSigVW+kS37ZuGeBsr58BfPS10fjptfOnvTbaUOZ7VrUBgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/12/2023 16:25, Mario Marietto wrote:
> Hello.

Hi,

> I'm trying to compile u-boot-2017.05 (because it can boot a 32-bit ARM
> board. It is an out-of-tree u-boot build that can execute the ubldr to
> boot FreeBSD. I found it here :
> 
> https://src.fedoraproject.org/repo/pkgs/uboot-tools/u-boot-2017.05.tar.bz2/sha512/be270f9242a72b05463092a022bbabd54996762de1ff23bf7575124ac02e62f49572a4e2f6f571a5019047d40027e56e35593b5cc373c4a5a39b100c3377ba93/

This source code has no support for Xen guests. This was only added in 
2020. Can you clarify why you can't use the latest upstream U-boot?

> 
> It has been suggested to me by the U-Boot Xen maintainers. Infact one
> of them said :
> 
> 
> Yes, it can boot a 32-bit ARM board. I'm not a FreeBSD person, but
> I've helped a FreeBSD user booting a 32-bit ARM box with u-boot
> (GoFlexHome Marvell Kirkwood 6281). The u-boot version was 2017.05.
> I used an out-of-tree u-boot build. This u-boot executed the ubldr to
> boot FreeBSD. Please see here :
> https://forum.doozan.com/read.php?3,49039,82059#msg-82059 >
> 
> So. I tried to compile it directly on my ARM Chromebook,but it failed.
> And it also fails if compiled with "ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf-" on my Ubuntu 23.04 x86_64
> workstation :
> 
> 
> /Chromebook/freebsd-xen/domU-freebsd/bootloaders/u-boot-2017.05# make
> snow_defconfig

IIUC, you want to boot FreeBSD in a DomU. So you need to build U-boot 
using a Xen specific configuration. Looking at the code, I can find 
xenguest_arm64_defconfig but there are no equivalent for arm32.

In fact, there are some missing low-level layer (e.g. hypercalls) in 
order to properly use it for 32-bit domU. I don't know if there are 
support out-of-tree.

So you will probably need to tweak U-boot for your setup.

Looking at the other thread, you seem to have also tried to load the 
binary from xl.

 From the below error, it sounds like you are trying to boot an ELF 
rather than a zImage:

xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image not
capable of booting inside a HVM container: Invalid kernel

Do you have a tree with FreeBSD + your patches? I would like to check 
the zImage code.

Cheers,

[1] 
http://lore.kernel.org/CA+1FSii6RRM7G52kPrD80+yR=giWcB8--kpGDDQkkEK=0dnCmw@mail.gmail.com

> 
>   HOSTCC  scripts/basic/fixdep
>    HOSTCC  scripts/kconfig/conf.o
>    HOSTCC  scripts/kconfig/zconf.tab.o
>    HOSTLD  scripts/kconfig/conf
> #
> # configuration written to .config
> #
> 
> 
> /Chromebook/freebsd-xen/domU-freebsd/bootloaders/u-boot-2017.05# make
> 
> scripts/kconfig/conf  --silentoldconfig Kconfig
>    CHK     include/config.h
>    CFG     u-boot.cfg
>    GEN     include/autoconf.mk
>    GEN     include/autoconf.mk.dep
>    CFG     spl/u-boot.cfg
>    GEN     spl/include/autoconf.mk
>    CHK     include/config/uboot.release
>    CHK     include/generated/version_autogenerated.h
>    UPD     include/generated/version_autogenerated.h
>    CHK     include/generated/timestamp_autogenerated.h
>    UPD     include/generated/timestamp_autogenerated.h
>    CC      lib/asm-offsets.s
> gcc: error: unrecognized -march target: armv5
> gcc: note: valid arguments are: armv4 armv4t armv5t armv5te armv5tej
> armv6 armv6j armv6k armv6z armv6kz armv6zk armv6t2 armv6-m armv6s-m
> armv7 armv7-a armv7ve armv7-r armv7-m armv7e-m armv8-a armv8.1-a
> armv8.2-a armv8.3-a armv8.4-a
> armv8.5-a armv8.6-a armv8-m.base armv8-m.main armv8-r armv8.1-m.main
> armv9-a iwmmxt iwmmxt2 native; did you mean ‘armv4’?
> gcc: error: missing argument to ‘-march=’
> make[1]: *** [Kbuild:44: lib/asm-offsets.s] Errore 1
> make: *** [Makefile:1287: prepare0] Errore 2
> 
> What should I do to compile it succesfully ?
> 
> On Sat, Dec 23, 2023 at 7:36 PM Mario Marietto <marietto2008@gmail.com> wrote:
>>
>> I've added this parameter to bootxen.source :
>>
>> guest_loglvl=all
>>
>> bootxen.source :
>>
>> mmc dev 1
>> ext2load mmc 1:3 0x42000000 zImage-5.4.261-iommu-dma-on-xen
>> ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
>> ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
>> fdt addr 0x5ffec000
>> fdt resize 1024
>> fdt set /chosen \#address-cells <0x2>
>> fdt set /chosen \#size-cells <0x2>
>> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native guest_loglvl=all"
>> fdt mknod /chosen dom0
>> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
>> fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x49F9A8 >
>> fdt set /chosen xen,dom0-bootargs "console=tty1 root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused --no-log"
>> bootm 0x51000000 - 0x5ffec000
>>
>>
>> but when I try to boot FreeBSD I don't get more informations than usual :
>>
>> root@devuan-bunsen:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen# ./start-freebsd
>>
>> Parsing config from freebsd.cfg
>> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
>> libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
>> libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
>> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-existent domain
>> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unable to destroy guest
>> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction of domain failed
>> freebsd is an invalid domain identifier (rc=-6)
>>
>> Are you aware about a new parameter that I can use to have more detailed debug information ?
>>
>> On Wed, Dec 20, 2023 at 5:52 AM Warner Losh <imp@bsdimp.com> wrote:
>>>
>>> I'd think you'd need the right virtualization loader. I'm not entirely sure the u-boot.bin you've been creating is for a dom-u..
>>> If I misunderstood, then the below isn't good advice. Chain booting the u-boot, the first u-boot initializes things so you want
>>> to start with stage after the SPL. But the different error messages suggest that it's trying to reboot with kexec, which
>>> isn't supported on armv7 at the moment.
>>>
>>> If you could boot in kvm, I think that the following would work....  Though I'm not entirely sure how to
>>> specify the two .fd files in your setup. The use of qemu is to have an easy env to debug things... I don't
>>> have a chromebook to try...
>>>
>>> My first instinct would be to try qemu on x86 (this is the first step of many to get to your destination).
>>>
>>> If you could boot the GENERIC_SD image that we produce using qemu + edk2-arm-code.fd that would
>>> be a huge first step. This will give you the boot loader, I believe, to boot in the VM that you need better
>>> than going via the u-boot route. Since you are booting in a virtualized environment, I think it wouldn't
>>> matter which one :).
>>>
>>> So, I did the following to boot the virtualized armv7 FreeBSD environment, following a post on the forums I found and knew to have the right recipe:
>>> https://forums.freebsd.org/threads/run-boot-freebsd-arm-32bit-image-in-qemu.80765/
>>>
>>> 1. pkg install qemu
>>> 2. mkdir qemu-armv7-env
>>> 3. cd qemu-armv7-env
>>> 4. fetch https://download.freebsd.org/releases/arm/armv7/ISO-IMAGES/14.0/FreeBSD-14.0-RELEASE-arm-armv7-GENERICSD.img.xz
>>> 5. xz -d -T 0 FreeBSD-14.0-RELEASE-arm-armv7-GENERICSD.img.xz
>>> 6. dd if=/dev/zero of=pflash0.img bs=1m count=64
>>> 7. dd if=/dev/zero of=pflash1.img bs=1m count=64
>>> 8. dd if=/usr/local/share/qemu/edk2-arm-code.fd of=pflash0.img conv=notrunc
>>> 9. dd if=/usr/local/share/qemu/edk2-arm-vars.fd of=pflash1.img conv=notrunc
>>> 10. cat > start-freebsd-arm.sh
>>> #!/bin/sh
>>> qemu-system-arm \
>>>    -M virt \
>>>    -m 1024 \
>>>    -drive file=pflash0.img,format=raw,if=pflash,readonly=on \
>>>    -drive file=pflash1.img,format=raw,if=pflash \
>>>    -drive file=$1.img,if=virtio,cache=writethrough \
>>>    -nographic \
>>>    -serial mon:stdio
>>> ^D
>>> 11. chmod +x start-freebsd-arm.sh
>>> 12. ./start-freebsd-arm.sh FreeBSD-14.0-RELEASE-arm-armv7-GENERICSD
>>>
>>> But I hit a snag with this on qemu 8.1.2 and 8.1.3 with both 13.2 and 140:
>>>
>>> Starting devd.
>>> Starting dhclient.
>>> DHCPDISCOVER on vtnet0 to 255.255.255.255 port 67 interval 7
>>> Fatal kernel mode data abort: 'Alignment Fault' on read
>>> trapframe: 0xc4b36a60
>>> FSR=00000001, FAR=dd96701a, spsr=20000013
>>> r0 =00000000, r1 =00000001, r2 =00000001, r3 =c4b36b4c
>>> r4 =00000014, r5 =d6618800, r6 =dd96702e, r7 =0000022c
>>> r8 =00000000, r9 =0000022c, r10=dd96701a, r11=c4b36b90
>>> r12=4300ffff, ssp=c4b36af0, slr=c04a9728, pc =c04a9750
>>>
>>> panic: Fatal abort
>>> cpuid = 0
>>> time = 1680843057
>>> KDB: stack backtrace:
>>> #0 0xc035786c at kdb_backtrace+0x48
>>> #1 0xc02fdd20 at vpanic+0x140
>>> #2 0xc02fdbe0 at vpanic+0
>>> #3 0xc06304ac at abort_align+0
>>> #4 0xc063052c at abort_align+0x80
>>> #5 0xc063017c at abort_handler+0x480
>>> #6 0xc060f480 at exception_exit+0
>>> #7 0xc04a9750 at udp_input+0x288
>>> #8 0xc0473f54 at ip_input+0x1e0
>>> #9 0xc04447c0 at netisr_dispatch_src+0xf8
>>> #10 0xc043bf2c at ether_demux+0x1a4
>>> #11 0xc043d5e4 at ether_nh_input+0x480
>>> #12 0xc04447c0 at netisr_dispatch_src+0xf8
>>> #13 0xc043c404 at ether_input+0x50
>>> #14 0xc01c0838 at vtnet_rx_vq_process+0x880
>>> #15 0xc01b70d0 at vtpci_intx_intr+0xac
>>> #16 0xc02b87f0 at ithread_loop+0x2ec
>>> #17 0xc02b465c at fork_exit+0xc0
>>> Uptime: 19s
>>>
>>> I don't know if this is a problem with qemu or FreeBSD's kernel...
>>>
>>> Warner
>>>
>>> On Tue, Dec 19, 2023 at 3:25 PM Mario Marietto <marietto2008@gmail.com> wrote:
>>>>
>>>> I've asked some help on the channel #arm on Reddit and someone replied :
>>>>
>>>> https://www.reddit.com/r/arm/comments/18mcir8/i_cant_boot_freebsd_for_arm32_bit_as_domu_with/
>>>>
>>>> Maybe his answer can be useful to understand why it does not work.
>>>>
>>>> On Tue, Dec 19, 2023 at 8:33 PM Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>
>>>>> +Michal
>>>>>
>>>>> Hi Mario,
>>>>>
>>>>> I am not sure about booting FreeBSD, but I am certain that u-boot works
>>>>> fine as DomU kernel on ARMv8 (not sure about ARMv7). With this config
>>>>> file:
>>>>>
>>>>> name="test"
>>>>> kernel="u-boot.bin"
>>>>> extra = "console=hvc0"
>>>>> memory=256
>>>>> vcpus=1
>>>>> disk = [ 'FreeBSD-13.2-RELEASE-armv7.img,raw,xvda' ]
>>>>>
>>>>> I don't know for sure if you can boot FreeBSD but you should definitely
>>>>> be able to see the u-boot command line prompt. The fact that you are
>>>>> getting this message:
>>>>>
>>>>> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
>>>>>
>>>>> Means that something is not right in the u-boot configuration or u-boot
>>>>> build. Michal and Artem (CCed) might know more. From what I recall,
>>>>> there was nothing special required to get u-boot.bin to boot as domU
>>>>> kernel, so now I wonder if it is an ARMv7 vs. ARMv8 issue.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Stefano
>>>>>
>>>>>
>>>>> On Tue, 19 Dec 2023, Mario Marietto wrote:
>>>>>> ....I see that some other interesting files have been produced by u-boot when I have compiled it :
>>>>>>
>>>>>> u-boot
>>>>>> u-boot.lds
>>>>>> u-boot.bin
>>>>>> u-boot.map
>>>>>> u-boot-nodtb.bin
>>>>>> u-boot.dtb
>>>>>> u-boot.srec
>>>>>> u-boot-dtb.bin
>>>>>> u-boot.sym
>>>>>>
>>>>>> So,maybe I should use a different u-boot* file for booting FreeBSD ?
>>>>>>
>>>>>>
>>>>>> On Tue, Dec 19, 2023 at 4:28 PM Mario Marietto <marietto2008@gmail.com> wrote:
>>>>>>        Hello to everyone.
>>>>>>
>>>>>> I have compiled the needed u-boot.bin from scratch using this procedure :
>>>>>>
>>>>>> # git clone https://github.com/u-boot/u-boot.git
>>>>>> # cd u-boot
>>>>>> # ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make snow_defconfig : this line generates the file .config
>>>>>> # nano .config and I've added these parameters :
>>>>>>
>>>>>> CONFIG_ARMV7_NONSEC=n
>>>>>> CONFIG_EFI_GRUB_ARM32_WORKAROUND=y
>>>>>>
>>>>>> the uboot-bin file is generated with this command :
>>>>>>
>>>>>> # ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make
>>>>>>
>>>>>> At this point,I took a look inside the .config file and I saw that the parameter "CONFIG_ARMV7_NONSEC=n" has been removed. So,for
>>>>>> some reason,it is not accepted and this could be a problem....
>>>>>>
>>>>>> These are the xen config files that I've used :
>>>>>>
>>>>>> nano freebsd.cfg
>>>>>>
>>>>>> name="test"
>>>>>> kernel="u-boot.bin"
>>>>>> extra = "console=hvc0"
>>>>>> memory=256
>>>>>> vcpus=1
>>>>>> disk = [ 'FreeBSD-13.2-RELEASE-armv7.img,raw,xvda' ]
>>>>>>
>>>>>> nano start-freebsd
>>>>>>
>>>>>> xl create freebsd.cfg
>>>>>> xl console freebsd
>>>>>>
>>>>>> This is what happens when I launch the vm :
>>>>>>
>>>>>> # ./start-freebsd
>>>>>>
>>>>>> Parsing config from freebsd.cfg
>>>>>> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
>>>>>> libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
>>>>>> libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
>>>>>> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-existent domain
>>>>>> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unable to destroy guest
>>>>>> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction of domain failed
>>>>>> freebsd is an invalid domain identifier (rc=-6)
>>>>>>
>>>>>>
>>>>>> On Mon, Dec 18, 2023 at 12:39 PM Mario Marietto <marietto2008@gmail.com> wrote:
>>>>>>        So,ok,I should have said "the second u-boot" ; since the first u-boot binary is the "u-boot binary located in the RO
>>>>>>        memory" of the Chromebook". Sorry for the confusion.
>>>>>>
>>>>>> On Mon, Dec 18, 2023 at 12:35 PM Mario Marietto <marietto2008@gmail.com> wrote:
>>>>>>        ---> There are no specific options in u-boot devoted to FreeBSD
>>>>>>
>>>>>> This is an important factor. So,what about if,instead of compiling a new version of u-boot on the partition 2,I will
>>>>>> recompile the u-boot customized version created by the virtual open system in 2014,that should be installed on the first
>>>>>> partition ? It could work if there are no differences between the u-boot that should boot Linux and the u-boot that
>>>>>> should boot FreeBSD.
>>>>>>
>>>>>> Can you give a look at the u-boot source code created by virtual open systems ? You can find it on my google drive :
>>>>>>
>>>>>> https://drive.google.com/file/d/1eAaZMfd6CU0xiqQfH7sq5wGVzzO09BRm/view?usp=sharing
>>>>>>
>>>>>> I need to understand if I can recompile it without problem so that it can satisfy my needs (the ability of the file
>>>>>> u-boot.bin to boot FreeBSD as domU under Xen,as explained by Stefano Stabellini,the xen developer that suggested to me
>>>>>> what I could do to have FreeBSD virtualized under Xen on my Arm Chromebook) ; otherwise the risk is to find later
>>>>>> problems that will make me troubles and that I will not able to fix.
>>>>>>
>>>>>> I gave a look at the virtual open system u-boot and I didn't see any arndale_defconfig inside. So,If I have understood
>>>>>> correctly,I should put that file inside the root of the u-boot source code,let's say here :
>>>>>>
>>>>>> marietto:/home/marietto/Desktop/Files/u-boot_FreeBSD/u-boot-vos # ls
>>>>>>
>>>>>> .checkpatch.conf        README                  doc                     net
>>>>>> .git                    api                     drivers                 onenand_ipl
>>>>>> .gitignore              arch                    dts                     post
>>>>>> COPYING                 board                   examples                rules.mk
>>>>>> CREDITS                 boards.cfg              fs                      scripts
>>>>>> MAINTAINERS             common                  include                 snapshot.commit
>>>>>> MAKEALL                 config.mk               lib                     spl
>>>>>> Makefile                cros                    mkconfig                test
>>>>>> PRESUBMIT.cfg           disk                    nand_spl                tools
>>>>>>
>>>>>> and I should do : make and make install ? and the file I need,u-bootbin will be generated ?
>>>>>>
>>>>>> I didn't find any pre made configuration file inside :
>>>>>>
>>>>>> u-boot-vos # find . -type f -name "exynos*"
>>>>>>
>>>>>> ./include/exynos-fb.h
>>>>>> ./include/configs/exynos5-common.h
>>>>>> ./doc/device-tree-bindings/spi/exynos-spi.txt
>>>>>> ./doc/device-tree-bindings/usb/exynos-usb.txt
>>>>>> ./drivers/power/exynos-tmu.c
>>>>>> ./drivers/power/exynos-cpufreq.c
>>>>>> ./drivers/video/exynos-fb.c
>>>>>> ./drivers/spi/exynos_spi.c
>>>>>> ./board/samsung/dts/exynos5250-spring.dts
>>>>>> ./board/samsung/dts/exynos5250-smdk5250.dts
>>>>>> ./board/samsung/dts/exynos5250-snow.dts
>>>>>> ./board/samsung/dts/exynos5250-daisy.dts
>>>>>> ./arch/arm/include/asm/arch-exynos5/exynos-cpufreq.h
>>>>>> ./arch/arm/include/asm/arch-exynos5/exynos-tmu.h
>>>>>> ./arch/arm/dts/exynos5250.dtsi
>>>>>> ./arch/arm/dts/exynos-periph-id.dtsi
>>>>>> ./arch/arm/cpu/armv7/exynos5/exynos_cache.c
>>>>>>
>>>>>> u-boot-vos # find . -type f -name "arndale*"
>>>>>>
>>>>>> For sure I can't use a newer version of u-boot because otherwise the patches needed to bypass the bootloader protections
>>>>>> of the Arm Chromebook (such as a lot of different patches needed to boot correctly Linux) will be broken ; anyway,since
>>>>>> it works,I don't need to use an updated version of u-boot.
>>>>>>
>>>>>> ----> As per my experience, you have to respect these two options, compiling u-boot for
>>>>>> FreeBSD: https://github.com/freebsd/freebsd-ports/blob/main/sysutils/u-boot-master/files/FreeBSD_Fragment
>>>>>>
>>>>>> It says that I should use these parameters :
>>>>>>
>>>>>> CONFIG_ARMV7_NONSEC=n
>>>>>> CONFIG_EFI_GRUB_ARM32_WORKAROUND=y
>>>>>>
>>>>>> These are the parameters used to configure a Linux kernel. I don't understand what's the relation between the compilation
>>>>>> of a linux kernel and u-boot. In the past I tried to recompile u-boot,but I didn't have the need to set up those
>>>>>> parameters,so I don't know how to do it (but I know how to recompile a Linux kernel).
>>>>>>
>>>>>> ---> I'm not sure that I'm getting you right, as I don't understand what you mean under "the first u-boot".
>>>>>>
>>>>>>
>>>>>> I'm talking about first u-boot because the whole procedure to boot Linux on the ARM Chromebook,that's explained here :
>>>>>>
>>>>>> http://www.virtualopensystems.com/en/solutions/guides/kvm-on-chromebook/
>>>>>>
>>>>>>
>>>>>> at some point they say :
>>>>>>
>>>>>>
>>>>>> To be able to run KVM on ARM platforms, the kernel has to be booted in hypervisor mode. Because of this relatively recent
>>>>>> requirement (due to the introduction of the virtualization extensions), up until now all booting methods would boot the
>>>>>> kernel in the standard Supervisor mode.
>>>>>>
>>>>>> For the ARM Chromebook the default boot procedure doesn't allow us to boot in hypervisor mode. Although the laptop's boot
>>>>>> mechanism is based on the frequently used u-boot, the binary is located in RO memory. Fortunately, a chained u-boot
>>>>>> mechanism can be used (i.e. starting another u-boot after the original). We can then enter hypervisor mode from our
>>>>>> custom iteration of u-boot and subsequently load our kernel and userspace.
>>>>>>
>>>>>> So,the first u-boot is the u-boot provided by virtual open systems,that's able to chainload the "u-boot binary located in
>>>>>> RO memory" , that does not boot Chrome OS in hypervisor mode. We don't need it if we want to boot Linux with kvm or xen
>>>>>> enabled.
>>>>>>
>>>>>>
>>>>>> On Sun, Dec 17, 2023 at 1:28 AM Stanislav Silnicki <stanislav.silnicki@mailgate.us> wrote:
>>>>>>        I'm not an expert in the topic, I only know, that ARM has divided hardware into two worlds - Secure and
>>>>>>        Not-So, strictly limiting any software, running in non-secure world with access to functions and
>>>>>>        resources. https://developer.arm.com/documentation/den0013/d/Security/TrustZone-hardware-architecture?lang=en
>>>>>>
>>>>>> I'm not sure, that I'm getting you right, as I don't understand what you mean under "the first u-boot".
>>>>>>
>>>>>> As I understand, virtualization (HYP) is running in non-secure world(https://developer.arm.com/documentation/ddi0406/c/System-Level-Architecture/The-System-Level-Programmers--Model/The-Virtualization-Extens
>>>>>> ions), so my guess (only guess!!!), virtualization software has to prepare (configure) HW platform in the way,
>>>>>> that FreeBSD kernel will not lack any resources, required to configure MPU, VA, etc.
>>>>>> So, if you lucky to boot virtualizer, which is aware of target OS, that maybe you can boot the kernel. Although, I
>>>>>> doubt, that you need to boot 'second' u-boot to boot the kernel - there is simply ubldr, which you can hook somehow
>>>>>> from virtualizer....
>>>>>>
>>>>>> Stan
>>>>>>
>>>>>>
>>>>>>
>>>>>> Mario Marietto wrote:
>>>>>>
>>>>>>
>>>>>>        ---> As I understand, it makes sure that u-boot keeps in secure mode during boot and passes control to
>>>>>>        ubldr, which boots FreeBSD kernel, in that mode.
>>>>>>
>>>>>> Can you elaborate your sentence more ? I know that the bootloader secure mode is bypassed by the virtual open
>>>>>> systems u-boot. Are you saying that when the control passes to the second u-boot,it will happen in secure
>>>>>> mode,so that the bypass that happened loading the first u-boot,is annulled ? If this is true,maybe can I boot
>>>>>> FreeBSD using the virtual-open-system custom u-boot ? Is this compatible with FreeBSD ? Where can I find the
>>>>>> u-boot.bin that the xen developer talked about ? thanks bro'.
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Sun, Dec 17, 2023 at 12:35 AM Stanislav Silnicki <stanislav.silnicki@mailgate.us> wrote:
>>>>>>        Hi Mario,
>>>>>>
>>>>>> U-Boot  beast is hiding in this den: https://source.denx.de/u-boot/u-boot.git
>>>>>> I took a brief look at your post and it seems to me, that option CONFIG_CMO_BY_VA_ONLY is irrelevant to
>>>>>> your target armv7 32 bit
>>>>>> platform: https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/cpu/armv8/Kconfig?ref_type=heads#L3
>>>>>>
>>>>>> As for compiling the u-boot, it is a doable task, given that you understand what you are doing. There
>>>>>> are no specific options in u-boot devoted to FreeBSD. It is a boot loader, whose mission to make basic
>>>>>> hardware initialization, read you kernel file from some media into RAM and then pass it control.
>>>>>>
>>>>>> Basically, you can grab some defconfig, prepared for any other Exynos5250 based board  (say, this one:
>>>>>> https://source.denx.de/u-boot/u-boot/-/blob/master/configs/arndale_defconfig?ref_type=heads) and adopt
>>>>>> it somehow.
>>>>>>
>>>>>> As per my experience, you have to respect these two options, compiling u-boot for
>>>>>> FreeBSD: https://github.com/freebsd/freebsd-ports/blob/main/sysutils/u-boot-master/files/FreeBSD_Fragment
>>>>>>
>>>>>> As I understand, it makes sure, that u-boot keeps in secure mode during boot and passes control to
>>>>>> ubldr, which boots FreBSD kernel, in that mode. Otherwise, there a lot of surprises you may realize.
>>>>>>
>>>>>> Hope, this will help to progress you tasks
>>>>>> Stan
>>>>>>
>>>>>> Mario Marietto wrote:
>>>>>>
>>>>>>
>>>>>>        Hello.
>>>>>>
>>>>>>        I'm trying to boot FreeBSD for arm32 bit as DomU on my ARM Chromebook. Basically there are
>>>>>>        two ways to accomplish this task :
>>>>>>
>>>>>>        1) to write a patch that allows the FreeBSD kernel to boot as a zImage file. This could be
>>>>>>        accomplished applying this patch to a specific file that's on the source code of FreeBSD :
>>>>>>
>>>>>>
>>>>>>        https://xenbits.xen.org/gitweb/?p=p...8;hb=0782e25d98cc1391472717035f986c979edef0c9
>>>>>>
>>>>>>
>>>>>>        This patch was written by Julien Grall a lot of time ago and now it does not work anymore.
>>>>>>        This is the reason :
>>>>>>
>>>>>>
>>>>>>              It appears FreeBSD-CURRENT removed the last step converting the kernel file to
>>>>>>              kernel.bin. The patch can be readily rebased, but without kernel.bin that
>>>>>>              doesn't do too much
>>>>>>
>>>>>>
>>>>>>
>>>>>> So,without a rebase of that patch the first option is not applicable And I'm not able to fix it.
>>>>>>
>>>>>> 2) booting FreeBSD using U-Boot,as explained to me by a xen developer :
>>>>>>
>>>>>>
>>>>>>        I was trying to explain why and how Julien's patch works so that you could be the one
>>>>>>        to re-do something similar or fix the patch on the FreeBSD kernel that you are
>>>>>>        working with. I am happy to help review and write patches but I don't work with the
>>>>>>        FreeBSD kernel so I wouldn't be able to help you quickly. However, I might have a
>>>>>>        suggestion. Do you know if FreeBSD can be booted by U-Boot ? Because U-Boot
>>>>>>        definitely boots as Xen on ARM guest firmware/bootloader. You should be able to build
>>>>>>        U-Boot and use the U-Boot binary as Xen guest kernel, then U-Boot could load FreeBSD
>>>>>>        from disk or network and start it. For instance as domU config file:
>>>>>>
>>>>>>        kernel="/home/petalinux/u-boot.bin"
>>>>>>        disk = [ '/home/petalinux/test.img,raw,xvda' ]
>>>>>>
>>>>>>        I know it is important to build u-boot with the following config to make it work on
>>>>>>        Xen.
>>>>>>
>>>>>>        CONFIG_CMO_BY_VA_ONLY=y
>>>>>>
>>>>>>
>>>>>>
>>>>>> This option seems more doable to me according to my knowledge. But I need to understand how to do
>>>>>> it.
>>>>>>
>>>>>> Well,let's say that on the ARM Chromebook I'm forced to use and install a customized version of
>>>>>> u-boot,created by virtual open systems,because it is the only one that allows bypassing its
>>>>>> bootloader protection. You can find more information here :
>>>>>>
>>>>>> http://www.virtualopensystems.com/en/solutions/guides/kvm-on-chromebook/?vos=tech
>>>>>>
>>>>>> This is the relevant section to read :
>>>>>>
>>>>>>
>>>>>>        Bootloader :
>>>>>>
>>>>>>        If you wish to skip this chapter you can download a pre-compiled binary of the
>>>>>>        bootloader:
>>>>>>
>>>>>>
>>>>>>        $ wget
>>>>>>        http://www.virtualopensystems.com/downloads/guides/kvm_on_chromebook/nv_u-boot-snow.kpart
>>>>>>
>>>>>>
>>>>>>        To be able to run KVM on ARM platforms, the kernel has to be booted in hypervisor
>>>>>>        mode. Because of this relatively recent requirement (due to the introduction of the
>>>>>>        virtualization extensions), up until now all booting methods would boot the kernel in
>>>>>>        the standard Supervisor mode. For the ARM Chromebook the default boot procedure
>>>>>>        doesn't allow us to boot in hypervisor mode. Although the laptop's boot mechanism is
>>>>>>        based on the frequently used u-boot, the binary is located in RO memory. Fortunately,
>>>>>>        a chained u-boot mechanism can be used (i.e. starting another u-boot after the
>>>>>>        original). We can then enter hypervisor mode from our custom iteration of u-boot and
>>>>>>        subsequently load our kernel and userspace.
>>>>>>
>>>>>>        Checkout the needed u-boot code :
>>>>>>
>>>>>>
>>>>>>        $ git clone git://github.com/virtualopensystems/u-boot.git$ cd u-boot$
>>>>>>        ./scripts/build.sh
>>>>>>
>>>>>>
>>>>>>        If successful, a message about how to copy the bootloader on the USB flash disk or SD
>>>>>>        card will appear. We will use it later when preparing the boot medium to start our
>>>>>>        system. If you have followed the Setting up the boot medium chapter and you have a
>>>>>>        prepared boot device, then you can update u-boot by running :
>>>>>>
>>>>>>
>>>>>>        $ sudo dd if=nv_uboot-snow.kpart of=/dev/sdX1
>>>>>>
>>>>>>
>>>>>>
>>>>>> so,the needed u-boot that we must use should be installed on the first partition of the sd card.
>>>>>>
>>>>>> There is another relevant section to read :
>>>>>>
>>>>>>
>>>>>>        Setting up the boot medium
>>>>>>
>>>>>>        Now it is time to copy all the relevant files that we created in the previous
>>>>>>        chapters,and use them to boot Chromebook with a different kernel and OS. In all these
>>>>>>        examples the device /dev/sdX is used. Take extra care to change the examples to the
>>>>>>        device that you have attached. Insert the boot medium on your workstation and
>>>>>>        carefully execute the following step. First we need to properly format the boot
>>>>>>        medium.
>>>>>>
>>>>>>        In the uboot source directory :
>>>>>>
>>>>>>
>>>>>>        $ sudo ./scripts/sdcard.sh /dev/sdX
>>>>>>
>>>>>>
>>>>>>        This will erase all data and create 4 partitions in the medium, along with copying
>>>>>>        the u-boot binary to the first partition:
>>>>>>
>>>>>>
>>>>>>        Partition 1 = ChromeOS signed binary (V.O.S chained u-boot)
>>>>>>        Partition 2 = not used
>>>>>>        Partition 3 = EXT2 partition for u-boot files (uImage and exynos5250-snow.dtb)
>>>>>>        Partition 4 = EXT4 partition for userspace files
>>>>>>
>>>>>>
>>>>>>        With u-boot being copied, next is the kernel image and DTB file. From the kernel
>>>>>>        source execute :
>>>>>>
>>>>>>
>>>>>>        $ mkdir ../mnt/
>>>>>>        $ sudo mount /dev/sdX3 ../mnt/
>>>>>>        $ sudo cp arch/arm/boot/uImage ../mnt/
>>>>>>        $ sudo cp arch/arm/boot/dts/exynos5250-snow.dtb ../mnt/
>>>>>>        $ sudo umount /dev/sdX3
>>>>>>
>>>>>>
>>>>>>        Finally, we have to copy the Ubuntu userspace filesystem that we created earlier:
>>>>>>
>>>>>>
>>>>>>        $ sudo mount /dev/sdX4 mnt/$ sudo cp -a ./precise/* mnt/$ sudo umount /dev/sdX4
>>>>>>
>>>>>>
>>>>>>
>>>>>> Now,my idea is to chainload the already chain loaded u-boot created by V.O.S to the new u-boot
>>>>>> that we need for booting FreeBSD and that can be installed in the partition n.2,as shown in this
>>>>>> scheme,because it is not used :
>>>>>>
>>>>>>
>>>>>> Partition 1 = ChromeOS signed binary (V.O.S chained u-boot)
>>>>>> Partition 2 = not used (maybe we can install the u-boot for arm 32 bit,compatible with FreeBSD on
>>>>>> this partition)
>>>>>> Partition 3 = EXT2 partition for u-boot files (uImage and exynos5250-snow.dtb)
>>>>>> Partition 4 = EXT4 partition for userspace files
>>>>>>
>>>>>>
>>>>>> Take in consideration that default boot string is hardcoded here,in the snow.h file of the custom
>>>>>> u-boot created by VOS :
>>>>>>
>>>>>>
>>>>>> https://github.com/virtualopensyste...18a39b6c177dff58a/include/configs/snow.h#L101
>>>>>>
>>>>>>
>>>>>> and it needs to be recompiled because it should point to the partition n.2,where I will install
>>>>>> the u-boot files as explained here :
>>>>>>
>>>>>>
>>>>>> https://wiki.freebsd.org/arm/Chromebook
>>>>>>
>>>>>>
>>>>>> I have some questions to ask before I start working on this.
>>>>>>
>>>>>> 1) The xen developer said :
>>>>>>
>>>>>>
>>>>>>        You should be able to build U-Boot and use the U-Boot binary as Xen guest kernel...
>>>>>>
>>>>>>
>>>>>>
>>>>>> where is the u-boot binary,according to this document ?
>>>>>>
>>>>>> https://wiki.freebsd.org/arm/Chromebook
>>>>>>
>>>>>> I don't see it.
>>>>>>
>>>>>>
>>>>>> 2) where is the source code of the file that I can get here :
>>>>>>
>>>>>> http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/nv_uboot-snow-simplefb.kpart.bz2
>>>>>>
>>>>>> I need the source code if I want to recompile u-boot so that it can point to the partition 4.
>>>>>>
>>>>>> Maybe it can be found on this link :
>>>>>>
>>>>>> http://linux-exynos.org/dist/chromebook/nv_uboot/
>>>>>>
>>>>>> but it can't be opened....
>>>>>>
>>>>>>
>>>>>> 3) in this specific scenario the source code of u-boot should run on arm 32 bit,not on arm
>>>>>> 64,because I have the Samsung Chromebook "SNOW" model XE303C12,that's powered by a Samsung Exynos
>>>>>> 5250 (ARMv7 32 bit Cortex A15) Soc.
>>>>>>
>>>>>>
>>>>>> 4) I'm not sure if I can chainload the customized u-boot created by V.O.S that should be
>>>>>> installed on the first partition with the u-boot tailored for booting FreeBSD that should be
>>>>>> installed on the partition 2....
>>>>>>
>>>>>>
>>>>>> 5) the xen developer said that u-boot should be compiled enabling this option :
>>>>>>
>>>>>>
>>>>>> Code:
>>>>>>
>>>>>> CONFIG_CMO_BY_VA_ONLY=y
>>>>>>
>>>>>>
>>>>>> Well,can you provide some good source that can help me to understand how I can recompile u-boot
>>>>>> for FreeBSD ? thanks.
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Mario.
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> Mario.
>>
>>
>>
>> --
>> Mario.
> 
> 
> 
> --
> Mario.
> 

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E498D81F9EF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Dec 2023 17:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660218.1029770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rItD3-00019c-J6; Thu, 28 Dec 2023 16:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660218.1029770; Thu, 28 Dec 2023 16:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rItD3-00017m-GA; Thu, 28 Dec 2023 16:26:13 +0000
Received: by outflank-mailman (input) for mailman id 660218;
 Thu, 28 Dec 2023 16:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTGa=IH=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rItD1-00017g-Ta
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2023 16:26:12 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb14d78-a59d-11ee-9b0f-b553b5be7939;
 Thu, 28 Dec 2023 17:26:07 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-552d39ac3ccso12550785a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Dec 2023 08:26:07 -0800 (PST)
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
X-Inumbo-ID: cdb14d78-a59d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703780767; x=1704385567; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICPnFp8wXjc1Lixg9nlLaHLRitrp039JWrs0VeIvy5U=;
        b=hCYO++ZFaRB91ySuHd2IUakDtl8CtJjd/Ymg1HtqB5jdu7hN77WJWgSHWNgTd+H5B4
         3qPSy4GfuMS7mErUsVHbLVJ65Oew3A5VCQHDgDQnPoIPcyF5eoI1uroWkwPBZzb9FZVv
         YpPgA2horDcQEe3z2J10TpJHzSyaX06m+mpwY/Lhzbf9iYEDJqoVVREhwCkObR11Rmt6
         xhADEIZJwZulEDYj+q5KyJdbJ8cMN2wCTA1qIAhxKyttvHcQKOlb5yVVE8LCpxijrUlK
         Kqab5eJQXIMjQ/L6Flz5VDKU2TA8LVyWtOOjonmPvyIbDR6dH5kLvl1ctaiBcpy/Ez8C
         JDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703780767; x=1704385567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICPnFp8wXjc1Lixg9nlLaHLRitrp039JWrs0VeIvy5U=;
        b=CVAR0IuVG/Di+Z1f70E+gCIXCHCpBh5kwsYHDMPPT8pdMJwGQ3sU5oU7T5KOPrQreA
         obvGKdyp74tTCQ7ueIlqaNvBr+glb/UX0r7wJelt4uqIhDjBA3LvmZ+7uFOzvQEeE1Su
         vcYSHJVsfvplTzYgpXeoUexULSR8SKkPP/g1msN/MB636cNkBAxlWWnfhNc7IZPQesEZ
         MO6i9i1UjsBqZr8AXG4Qb5+4f9XbeDdEq6aTwAR/H00Lg5XeB4UkwRYA7AVdPArPdocN
         LAJrw1xPo1ZCEs4NkTGDAPTpMinwh9a7U8aBRQbQKHPFsuy1ilmSGmBRKeR8XkYJzerD
         rGYQ==
X-Gm-Message-State: AOJu0Yzh7BoHXGxBL1hvqLoeXf5vO/Bp898jwHySLQ77mmV59XngAp7g
	e5pj8PAO+7DAl9038GSpSRusN2bqgVbJjkiaNn4=
X-Google-Smtp-Source: AGHT+IGA8yR0RGbKo/HX3+45DGyTMLJbIC6E4yS56LEd7fRLBZtqeSlDmMFPEhPN5fSH7OnGkXLSNIl2l3jSx9sxAiY=
X-Received: by 2002:a17:907:1a51:b0:a23:3753:4d3 with SMTP id
 mf17-20020a1709071a5100b00a23375304d3mr8071300ejc.14.1703780766359; Thu, 28
 Dec 2023 08:26:06 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiit5NJ_W7f5mssivkGGLevXh_XmSB7ZxZbQe1dgev0_Pg@mail.gmail.com>
 <97aa980b9b44.6eb7f9d5c54e7@mailgate.us> <CA+1FSiheSwrO7Tz3F3Nmu4vcC2E=ONRX8nF3bhQGV0UDOFTrww@mail.gmail.com>
 <da024d1687f3a.2f0c601bba502@mailgate.us> <CA+1FSih7C0HEun99LHEwvyYRiH0PaLwwgnoQLHB69TWz2ykDZg@mail.gmail.com>
 <CA+1FSijoPkRZRaU6tujaMJZeFd3CSyUN+h4y0_NrrB5VWLgwpA@mail.gmail.com>
 <CA+1FSiib3uu9Ky8N5rSSt+H1nfzUnChKhGs2ERWmsbp2T4=2uA@mail.gmail.com>
 <CA+1FSihtb3+bm-pSqa7JGBjy3JUXYD6i0c6J2KHy+EO8rmZ5PA@mail.gmail.com>
 <alpine.DEB.2.22.394.2312191131290.3175268@ubuntu-linux-20-04-desktop>
 <CA+1FSigh=fc07o-RSMZ+hf9-YBUudAwnGcN9k8bP1RnPBP7tRA@mail.gmail.com>
 <CANCZdfpRJxJw2_ma0cCcoGGmAat4KVj5sOfdnGMR9w+OQCYxaQ@mail.gmail.com> <CA+1FSigREr=aSHOBMbEK9CaoKzNnKC-6sE=Ui8ovVwnMaZgZhQ@mail.gmail.com>
In-Reply-To: <CA+1FSigREr=aSHOBMbEK9CaoKzNnKC-6sE=Ui8ovVwnMaZgZhQ@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 28 Dec 2023 17:25:30 +0100
Message-ID: <CA+1FSigVW+kS37ZuGeBsr58BfPS10fjptfOnvTbaUOZ7VrUBgg@mail.gmail.com>
Subject: Re: How to boot FreeBSD for arm 32 bit as DomU with u-boot on my ARM Chromebook
To: Warner Losh <imp@bsdimp.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
	Stanislav Silnicki <stanislav.silnicki@mailgate.us>, freebsd-arm@freebsd.org, 
	Michal.Orzel@amd.com, xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.

I'm trying to compile u-boot-2017.05 (because it can boot a 32-bit ARM
board. It is an out-of-tree u-boot build that can execute the ubldr to
boot FreeBSD. I found it here :

https://src.fedoraproject.org/repo/pkgs/uboot-tools/u-boot-2017.05.tar.bz2/=
sha512/be270f9242a72b05463092a022bbabd54996762de1ff23bf7575124ac02e62f49572=
a4e2f6f571a5019047d40027e56e35593b5cc373c4a5a39b100c3377ba93/

It has been suggested to me by the U-Boot Xen maintainers. Infact one
of them said :


Yes, it can boot a 32-bit ARM board. I'm not a FreeBSD person, but
I've helped a FreeBSD user booting a 32-bit ARM box with u-boot
(GoFlexHome Marvell Kirkwood 6281). The u-boot version was 2017.05.
I used an out-of-tree u-boot build. This u-boot executed the ubldr to
boot FreeBSD. Please see here :
https://forum.doozan.com/read.php?3,49039,82059#msg-82059


So. I tried to compile it directly on my ARM Chromebook,but it failed.
And it also fails if compiled with "ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnueabihf-" on my Ubuntu 23.04 x86_64
workstation :


/Chromebook/freebsd-xen/domU-freebsd/bootloaders/u-boot-2017.05# make
snow_defconfig

 HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#


/Chromebook/freebsd-xen/domU-freebsd/bootloaders/u-boot-2017.05# make

scripts/kconfig/conf  --silentoldconfig Kconfig
  CHK     include/config.h
  CFG     u-boot.cfg
  GEN     include/autoconf.mk
  GEN     include/autoconf.mk.dep
  CFG     spl/u-boot.cfg
  GEN     spl/include/autoconf.mk
  CHK     include/config/uboot.release
  CHK     include/generated/version_autogenerated.h
  UPD     include/generated/version_autogenerated.h
  CHK     include/generated/timestamp_autogenerated.h
  UPD     include/generated/timestamp_autogenerated.h
  CC      lib/asm-offsets.s
gcc: error: unrecognized -march target: armv5
gcc: note: valid arguments are: armv4 armv4t armv5t armv5te armv5tej
armv6 armv6j armv6k armv6z armv6kz armv6zk armv6t2 armv6-m armv6s-m
armv7 armv7-a armv7ve armv7-r armv7-m armv7e-m armv8-a armv8.1-a
armv8.2-a armv8.3-a armv8.4-a
armv8.5-a armv8.6-a armv8-m.base armv8-m.main armv8-r armv8.1-m.main
armv9-a iwmmxt iwmmxt2 native; did you mean =E2=80=98armv4=E2=80=99?
gcc: error: missing argument to =E2=80=98-march=3D=E2=80=99
make[1]: *** [Kbuild:44: lib/asm-offsets.s] Errore 1
make: *** [Makefile:1287: prepare0] Errore 2

What should I do to compile it succesfully ?

On Sat, Dec 23, 2023 at 7:36=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com> wrote:
>
> I've added this parameter to bootxen.source :
>
> guest_loglvl=3Dall
>
> bootxen.source :
>
> mmc dev 1
> ext2load mmc 1:3 0x42000000 zImage-5.4.261-iommu-dma-on-xen
> ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
> ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
> fdt addr 0x5ffec000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3Dserial0 dom0_=
mem=3D1152M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative guest_loglvl=3Da=
ll"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module=
" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x49F9A8 >
> fdt set /chosen xen,dom0-bootargs "console=3Dtty1 root=3D/dev/mmcblk1p4 r=
w rootwait clk_ignore_unused --no-log"
> bootm 0x51000000 - 0x5ffec000
>
>
> but when I try to boot FreeBSD I don't get more informations than usual :
>
> root@devuan-bunsen:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen# ./s=
tart-freebsd
>
> Parsing config from freebsd.cfg
> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found:=
 Invalid kernel
> libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
> libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:cannot=
 (re-)build domain: -3
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-exis=
tent domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unabl=
e to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction=
 of domain failed
> freebsd is an invalid domain identifier (rc=3D-6)
>
> Are you aware about a new parameter that I can use to have more detailed =
debug information ?
>
> On Wed, Dec 20, 2023 at 5:52=E2=80=AFAM Warner Losh <imp@bsdimp.com> wrot=
e:
>>
>> I'd think you'd need the right virtualization loader. I'm not entirely s=
ure the u-boot.bin you've been creating is for a dom-u..
>> If I misunderstood, then the below isn't good advice. Chain booting the =
u-boot, the first u-boot initializes things so you want
>> to start with stage after the SPL. But the different error messages sugg=
est that it's trying to reboot with kexec, which
>> isn't supported on armv7 at the moment.
>>
>> If you could boot in kvm, I think that the following would work....  Tho=
ugh I'm not entirely sure how to
>> specify the two .fd files in your setup. The use of qemu is to have an e=
asy env to debug things... I don't
>> have a chromebook to try...
>>
>> My first instinct would be to try qemu on x86 (this is the first step of=
 many to get to your destination).
>>
>> If you could boot the GENERIC_SD image that we produce using qemu + edk2=
-arm-code.fd that would
>> be a huge first step. This will give you the boot loader, I believe, to =
boot in the VM that you need better
>> than going via the u-boot route. Since you are booting in a virtualized =
environment, I think it wouldn't
>> matter which one :).
>>
>> So, I did the following to boot the virtualized armv7 FreeBSD environmen=
t, following a post on the forums I found and knew to have the right recipe=
:
>> https://forums.freebsd.org/threads/run-boot-freebsd-arm-32bit-image-in-q=
emu.80765/
>>
>> 1. pkg install qemu
>> 2. mkdir qemu-armv7-env
>> 3. cd qemu-armv7-env
>> 4. fetch https://download.freebsd.org/releases/arm/armv7/ISO-IMAGES/14.0=
/FreeBSD-14.0-RELEASE-arm-armv7-GENERICSD.img.xz
>> 5. xz -d -T 0 FreeBSD-14.0-RELEASE-arm-armv7-GENERICSD.img.xz
>> 6. dd if=3D/dev/zero of=3Dpflash0.img bs=3D1m count=3D64
>> 7. dd if=3D/dev/zero of=3Dpflash1.img bs=3D1m count=3D64
>> 8. dd if=3D/usr/local/share/qemu/edk2-arm-code.fd of=3Dpflash0.img conv=
=3Dnotrunc
>> 9. dd if=3D/usr/local/share/qemu/edk2-arm-vars.fd of=3Dpflash1.img conv=
=3Dnotrunc
>> 10. cat > start-freebsd-arm.sh
>> #!/bin/sh
>> qemu-system-arm \
>>   -M virt \
>>   -m 1024 \
>>   -drive file=3Dpflash0.img,format=3Draw,if=3Dpflash,readonly=3Don \
>>   -drive file=3Dpflash1.img,format=3Draw,if=3Dpflash \
>>   -drive file=3D$1.img,if=3Dvirtio,cache=3Dwritethrough \
>>   -nographic \
>>   -serial mon:stdio
>> ^D
>> 11. chmod +x start-freebsd-arm.sh
>> 12. ./start-freebsd-arm.sh FreeBSD-14.0-RELEASE-arm-armv7-GENERICSD
>>
>> But I hit a snag with this on qemu 8.1.2 and 8.1.3 with both 13.2 and 14=
.0:
>>
>> Starting devd.
>> Starting dhclient.
>> DHCPDISCOVER on vtnet0 to 255.255.255.255 port 67 interval 7
>> Fatal kernel mode data abort: 'Alignment Fault' on read
>> trapframe: 0xc4b36a60
>> FSR=3D00000001, FAR=3Ddd96701a, spsr=3D20000013
>> r0 =3D00000000, r1 =3D00000001, r2 =3D00000001, r3 =3Dc4b36b4c
>> r4 =3D00000014, r5 =3Dd6618800, r6 =3Ddd96702e, r7 =3D0000022c
>> r8 =3D00000000, r9 =3D0000022c, r10=3Ddd96701a, r11=3Dc4b36b90
>> r12=3D4300ffff, ssp=3Dc4b36af0, slr=3Dc04a9728, pc =3Dc04a9750
>>
>> panic: Fatal abort
>> cpuid =3D 0
>> time =3D 1680843057
>> KDB: stack backtrace:
>> #0 0xc035786c at kdb_backtrace+0x48
>> #1 0xc02fdd20 at vpanic+0x140
>> #2 0xc02fdbe0 at vpanic+0
>> #3 0xc06304ac at abort_align+0
>> #4 0xc063052c at abort_align+0x80
>> #5 0xc063017c at abort_handler+0x480
>> #6 0xc060f480 at exception_exit+0
>> #7 0xc04a9750 at udp_input+0x288
>> #8 0xc0473f54 at ip_input+0x1e0
>> #9 0xc04447c0 at netisr_dispatch_src+0xf8
>> #10 0xc043bf2c at ether_demux+0x1a4
>> #11 0xc043d5e4 at ether_nh_input+0x480
>> #12 0xc04447c0 at netisr_dispatch_src+0xf8
>> #13 0xc043c404 at ether_input+0x50
>> #14 0xc01c0838 at vtnet_rx_vq_process+0x880
>> #15 0xc01b70d0 at vtpci_intx_intr+0xac
>> #16 0xc02b87f0 at ithread_loop+0x2ec
>> #17 0xc02b465c at fork_exit+0xc0
>> Uptime: 19s
>>
>> I don't know if this is a problem with qemu or FreeBSD's kernel...
>>
>> Warner
>>
>> On Tue, Dec 19, 2023 at 3:25=E2=80=AFPM Mario Marietto <marietto2008@gma=
il.com> wrote:
>>>
>>> I've asked some help on the channel #arm on Reddit and someone replied =
:
>>>
>>> https://www.reddit.com/r/arm/comments/18mcir8/i_cant_boot_freebsd_for_a=
rm32_bit_as_domu_with/
>>>
>>> Maybe his answer can be useful to understand why it does not work.
>>>
>>> On Tue, Dec 19, 2023 at 8:33=E2=80=AFPM Stefano Stabellini <sstabellini=
@kernel.org> wrote:
>>>>
>>>> +Michal
>>>>
>>>> Hi Mario,
>>>>
>>>> I am not sure about booting FreeBSD, but I am certain that u-boot work=
s
>>>> fine as DomU kernel on ARMv8 (not sure about ARMv7). With this config
>>>> file:
>>>>
>>>> name=3D"test"
>>>> kernel=3D"u-boot.bin"
>>>> extra =3D "console=3Dhvc0"
>>>> memory=3D256
>>>> vcpus=3D1
>>>> disk =3D [ 'FreeBSD-13.2-RELEASE-armv7.img,raw,xvda' ]
>>>>
>>>> I don't know for sure if you can boot FreeBSD but you should definitel=
y
>>>> be able to see the u-boot command line prompt. The fact that you are
>>>> getting this message:
>>>>
>>>> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader fou=
nd: Invalid kernel
>>>>
>>>> Means that something is not right in the u-boot configuration or u-boo=
t
>>>> build. Michal and Artem (CCed) might know more. From what I recall,
>>>> there was nothing special required to get u-boot.bin to boot as domU
>>>> kernel, so now I wonder if it is an ARMv7 vs. ARMv8 issue.
>>>>
>>>> Cheers,
>>>>
>>>> Stefano
>>>>
>>>>
>>>> On Tue, 19 Dec 2023, Mario Marietto wrote:
>>>> > ....I see that some other interesting files have been produced by u-=
boot when I have compiled it :
>>>> >
>>>> > u-boot
>>>> > u-boot.lds
>>>> > u-boot.bin
>>>> > u-boot.map
>>>> > u-boot-nodtb.bin
>>>> > u-boot.dtb
>>>> > u-boot.srec
>>>> > u-boot-dtb.bin
>>>> > u-boot.sym
>>>> >
>>>> > So,maybe I should use a different u-boot* file for booting FreeBSD ?
>>>> >
>>>> >
>>>> > On Tue, Dec 19, 2023 at 4:28=E2=80=AFPM Mario Marietto <marietto2008=
@gmail.com> wrote:
>>>> >       Hello to everyone.
>>>> >
>>>> > I have compiled the needed u-boot.bin from scratch using this proced=
ure :
>>>> >
>>>> > # git clone https://github.com/u-boot/u-boot.git
>>>> > # cd u-boot
>>>> > # ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make snow_defconfi=
g : this line generates the file .config
>>>> > # nano .config and I've added these parameters :
>>>> >
>>>> > CONFIG_ARMV7_NONSEC=3Dn
>>>> > CONFIG_EFI_GRUB_ARM32_WORKAROUND=3Dy
>>>> >
>>>> > the uboot-bin file is generated with this command :
>>>> >
>>>> > # ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make
>>>> >
>>>> > At this point,I took a look inside the .config file and I saw that t=
he parameter "CONFIG_ARMV7_NONSEC=3Dn" has been removed. So,for
>>>> > some reason,it is not accepted and this could be a problem....
>>>> >
>>>> > These are the xen config files that I've used :
>>>> >
>>>> > nano freebsd.cfg
>>>> >
>>>> > name=3D"test"
>>>> > kernel=3D"u-boot.bin"
>>>> > extra =3D "console=3Dhvc0"
>>>> > memory=3D256
>>>> > vcpus=3D1
>>>> > disk =3D [ 'FreeBSD-13.2-RELEASE-armv7.img,raw,xvda' ]
>>>> >
>>>> > nano start-freebsd
>>>> >
>>>> > xl create freebsd.cfg
>>>> > xl console freebsd
>>>> >
>>>> > This is what happens when I launch the vm :
>>>> >
>>>> > # ./start-freebsd
>>>> >
>>>> > Parsing config from freebsd.cfg
>>>> > xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader f=
ound: Invalid kernel
>>>> > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image f=
ailed
>>>> > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:c=
annot (re-)build domain: -3
>>>> > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non=
-existent domain
>>>> > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:=
Unable to destroy guest
>>>> > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destru=
ction of domain failed
>>>> > freebsd is an invalid domain identifier (rc=3D-6)
>>>> >
>>>> >
>>>> > On Mon, Dec 18, 2023 at 12:39=E2=80=AFPM Mario Marietto <marietto200=
8@gmail.com> wrote:
>>>> >       So,ok,I should have said "the second u-boot" ; since the first=
 u-boot binary is the "u-boot binary located in the RO
>>>> >       memory" of the Chromebook". Sorry for the confusion.
>>>> >
>>>> > On Mon, Dec 18, 2023 at 12:35=E2=80=AFPM Mario Marietto <marietto200=
8@gmail.com> wrote:
>>>> >       ---> There are no specific options in u-boot devoted to FreeBS=
D
>>>> >
>>>> > This is an important factor. So,what about if,instead of compiling a=
 new version of u-boot on the partition 2,I will
>>>> > recompile the u-boot customized version created by the virtual open =
system in 2014,that should be installed on the first
>>>> > partition ? It could work if there are no differences between the u-=
boot that should boot Linux and the u-boot that
>>>> > should boot FreeBSD.
>>>> >
>>>> > Can you give a look at the u-boot source code created by virtual ope=
n systems ? You can find it on my google drive :
>>>> >
>>>> > https://drive.google.com/file/d/1eAaZMfd6CU0xiqQfH7sq5wGVzzO09BRm/vi=
ew?usp=3Dsharing
>>>> >
>>>> > I need to understand if I can recompile it without problem so that i=
t can satisfy my needs (the ability of the file
>>>> > u-boot.bin to boot FreeBSD as domU under Xen,as explained by Stefano=
 Stabellini,the xen developer that suggested to me
>>>> > what I could do to have FreeBSD virtualized under Xen on my Arm Chro=
mebook) ; otherwise the risk is to find later
>>>> > problems that will make me troubles and that I will not able to fix.
>>>> >
>>>> > I gave a look at the virtual open system u-boot and I didn't see any=
 arndale_defconfig inside. So,If I have understood
>>>> > correctly,I should put that file inside the root of the u-boot sourc=
e code,let's say here :
>>>> >
>>>> > marietto:/home/marietto/Desktop/Files/u-boot_FreeBSD/u-boot-vos # ls
>>>> >
>>>> > .checkpatch.conf        README                  doc                 =
    net
>>>> > .git                    api                     drivers             =
    onenand_ipl
>>>> > .gitignore              arch                    dts                 =
    post
>>>> > COPYING                 board                   examples            =
    rules.mk
>>>> > CREDITS                 boards.cfg              fs                  =
    scripts
>>>> > MAINTAINERS             common                  include             =
    snapshot.commit
>>>> > MAKEALL                 config.mk               lib                 =
    spl
>>>> > Makefile                cros                    mkconfig            =
    test
>>>> > PRESUBMIT.cfg           disk                    nand_spl            =
    tools
>>>> >
>>>> > and I should do : make and make install ? and the file I need,u-boot=
.bin will be generated ?
>>>> >
>>>> > I didn't find any pre made configuration file inside :
>>>> >
>>>> > u-boot-vos # find . -type f -name "exynos*"
>>>> >
>>>> > ./include/exynos-fb.h
>>>> > ./include/configs/exynos5-common.h
>>>> > ./doc/device-tree-bindings/spi/exynos-spi.txt
>>>> > ./doc/device-tree-bindings/usb/exynos-usb.txt
>>>> > ./drivers/power/exynos-tmu.c
>>>> > ./drivers/power/exynos-cpufreq.c
>>>> > ./drivers/video/exynos-fb.c
>>>> > ./drivers/spi/exynos_spi.c
>>>> > ./board/samsung/dts/exynos5250-spring.dts
>>>> > ./board/samsung/dts/exynos5250-smdk5250.dts
>>>> > ./board/samsung/dts/exynos5250-snow.dts
>>>> > ./board/samsung/dts/exynos5250-daisy.dts
>>>> > ./arch/arm/include/asm/arch-exynos5/exynos-cpufreq.h
>>>> > ./arch/arm/include/asm/arch-exynos5/exynos-tmu.h
>>>> > ./arch/arm/dts/exynos5250.dtsi
>>>> > ./arch/arm/dts/exynos-periph-id.dtsi
>>>> > ./arch/arm/cpu/armv7/exynos5/exynos_cache.c
>>>> >
>>>> > u-boot-vos # find . -type f -name "arndale*"
>>>> >
>>>> > For sure I can't use a newer version of u-boot because otherwise the=
 patches needed to bypass the bootloader protections
>>>> > of the Arm Chromebook (such as a lot of different patches needed to =
boot correctly Linux) will be broken ; anyway,since
>>>> > it works,I don't need to use an updated version of u-boot.
>>>> >
>>>> > ----> As per my experience, you have to respect these two options, c=
ompiling u-boot for
>>>> > FreeBSD: https://github.com/freebsd/freebsd-ports/blob/main/sysutils=
/u-boot-master/files/FreeBSD_Fragment
>>>> >
>>>> > It says that I should use these parameters :
>>>> >
>>>> > CONFIG_ARMV7_NONSEC=3Dn
>>>> > CONFIG_EFI_GRUB_ARM32_WORKAROUND=3Dy
>>>> >
>>>> > These are the parameters used to configure a Linux kernel. I don't u=
nderstand what's the relation between the compilation
>>>> > of a linux kernel and u-boot. In the past I tried to recompile u-boo=
t,but I didn't have the need to set up those
>>>> > parameters,so I don't know how to do it (but I know how to recompile=
 a Linux kernel).
>>>> >
>>>> > ---> I'm not sure that I'm getting you right, as I don't understand =
what you mean under "the first u-boot".
>>>> >
>>>> >
>>>> > I'm talking about first u-boot because the whole procedure to boot L=
inux on the ARM Chromebook,that's explained here :
>>>> >
>>>> > http://www.virtualopensystems.com/en/solutions/guides/kvm-on-chromeb=
ook/
>>>> >
>>>> >
>>>> > at some point they say :
>>>> >
>>>> >
>>>> > To be able to run KVM on ARM platforms, the kernel has to be booted =
in hypervisor mode. Because of this relatively recent
>>>> > requirement (due to the introduction of the virtualization extension=
s), up until now all booting methods would boot the
>>>> > kernel in the standard Supervisor mode.
>>>> >
>>>> > For the ARM Chromebook the default boot procedure doesn't allow us t=
o boot in hypervisor mode. Although the laptop's boot
>>>> > mechanism is based on the frequently used u-boot, the binary is loca=
ted in RO memory. Fortunately, a chained u-boot
>>>> > mechanism can be used (i.e. starting another u-boot after the origin=
al). We can then enter hypervisor mode from our
>>>> > custom iteration of u-boot and subsequently load our kernel and user=
space.
>>>> >
>>>> > So,the first u-boot is the u-boot provided by virtual open systems,t=
hat's able to chainload the "u-boot binary located in
>>>> > RO memory" , that does not boot Chrome OS in hypervisor mode. We don=
't need it if we want to boot Linux with kvm or xen
>>>> > enabled.
>>>> >
>>>> >
>>>> > On Sun, Dec 17, 2023 at 1:28=E2=80=AFAM Stanislav Silnicki <stanisla=
v.silnicki@mailgate.us> wrote:
>>>> >       I'm not an expert in the topic, I only know, that ARM has divi=
ded hardware into two worlds - Secure and
>>>> >       Not-So, strictly limiting any software, running in non-secure =
world with access to functions and
>>>> >       resources. https://developer.arm.com/documentation/den0013/d/S=
ecurity/TrustZone-hardware-architecture?lang=3Den
>>>> >
>>>> > I'm not sure, that I'm getting you right, as I don't understand what=
 you mean under "the first u-boot".
>>>> >
>>>> > As I understand, virtualization (HYP) is running in non-secure world=
(https://developer.arm.com/documentation/ddi0406/c/System-Level-Architectur=
e/The-System-Level-Programmers--Model/The-Virtualization-Extens
>>>> > ions), so my guess (only guess!!!), virtualization software has to p=
repare (configure) HW platform in the way,
>>>> > that FreeBSD kernel will not lack any resources, required to configu=
re MPU, VA, etc.
>>>> > So, if you lucky to boot virtualizer, which is aware of target OS, t=
hat maybe you can boot the kernel. Although, I
>>>> > doubt, that you need to boot 'second' u-boot to boot the kernel - th=
ere is simply ubldr, which you can hook somehow
>>>> > from virtualizer....
>>>> >
>>>> > Stan
>>>> >
>>>> >
>>>> >
>>>> > Mario Marietto wrote:
>>>> >
>>>> >
>>>> >       ---> As I understand, it makes sure that u-boot keeps in secur=
e mode during boot and passes control to
>>>> >       ubldr, which boots FreeBSD kernel, in that mode.
>>>> >
>>>> > Can you elaborate your sentence more ? I know that the bootloader se=
cure mode is bypassed by the virtual open
>>>> > systems u-boot. Are you saying that when the control passes to the s=
econd u-boot,it will happen in secure
>>>> > mode,so that the bypass that happened loading the first u-boot,is an=
nulled ? If this is true,maybe can I boot
>>>> > FreeBSD using the virtual-open-system custom u-boot ? Is this compat=
ible with FreeBSD ? Where can I find the
>>>> > u-boot.bin that the xen developer talked about ? thanks bro'.
>>>> >
>>>> >
>>>> >
>>>> > On Sun, Dec 17, 2023 at 12:35=E2=80=AFAM Stanislav Silnicki <stanisl=
av.silnicki@mailgate.us> wrote:
>>>> >       Hi Mario,
>>>> >
>>>> > U-Boot  beast is hiding in this den: https://source.denx.de/u-boot/u=
-boot.git
>>>> > I took a brief look at your post and it seems to me, that option CON=
FIG_CMO_BY_VA_ONLY is irrelevant to
>>>> > your target armv7 32 bit
>>>> > platform: https://source.denx.de/u-boot/u-boot/-/blob/master/arch/ar=
m/cpu/armv8/Kconfig?ref_type=3Dheads#L3
>>>> >
>>>> > As for compiling the u-boot, it is a doable task, given that you und=
erstand what you are doing. There
>>>> > are no specific options in u-boot devoted to FreeBSD. It is a boot l=
oader, whose mission to make basic
>>>> > hardware initialization, read you kernel file from some media into R=
AM and then pass it control.
>>>> >
>>>> > Basically, you can grab some defconfig, prepared for any other Exyno=
s5250 based board  (say, this one:
>>>> > https://source.denx.de/u-boot/u-boot/-/blob/master/configs/arndale_d=
efconfig?ref_type=3Dheads) and adopt
>>>> > it somehow.
>>>> >
>>>> > As per my experience, you have to respect these two options, compili=
ng u-boot for
>>>> > FreeBSD: https://github.com/freebsd/freebsd-ports/blob/main/sysutils=
/u-boot-master/files/FreeBSD_Fragment
>>>> >
>>>> > As I understand, it makes sure, that u-boot keeps in secure mode dur=
ing boot and passes control to
>>>> > ubldr, which boots FreBSD kernel, in that mode. Otherwise, there a l=
ot of surprises you may realize.
>>>> >
>>>> > Hope, this will help to progress you tasks
>>>> > Stan
>>>> >
>>>> > Mario Marietto wrote:
>>>> >
>>>> >
>>>> >       Hello.
>>>> >
>>>> >       I'm trying to boot FreeBSD for arm32 bit as DomU on my ARM Chr=
omebook. Basically there are
>>>> >       two ways to accomplish this task :
>>>> >
>>>> >       1) to write a patch that allows the FreeBSD kernel to boot as =
a zImage file. This could be
>>>> >       accomplished applying this patch to a specific file that's on =
the source code of FreeBSD :
>>>> >
>>>> >
>>>> >       https://xenbits.xen.org/gitweb/?p=3Dp...8;hb=3D0782e25d98cc139=
1472717035f986c979edef0c9
>>>> >
>>>> >
>>>> >       This patch was written by Julien Grall a lot of time ago and n=
ow it does not work anymore.
>>>> >       This is the reason :
>>>> >
>>>> >
>>>> >             It appears FreeBSD-CURRENT removed the last step convert=
ing the kernel file to
>>>> >             kernel.bin. The patch can be readily rebased, but withou=
t kernel.bin that
>>>> >             doesn't do too much
>>>> >
>>>> >
>>>> >
>>>> > So,without a rebase of that patch the first option is not applicable=
. And I'm not able to fix it.
>>>> >
>>>> > 2) booting FreeBSD using U-Boot,as explained to me by a xen develope=
r :
>>>> >
>>>> >
>>>> >       I was trying to explain why and how Julien's patch works so th=
at you could be the one
>>>> >       to re-do something similar or fix the patch on the FreeBSD ker=
nel that you are
>>>> >       working with. I am happy to help review and write patches but =
I don't work with the
>>>> >       FreeBSD kernel so I wouldn't be able to help you quickly. Howe=
ver, I might have a
>>>> >       suggestion. Do you know if FreeBSD can be booted by U-Boot ? B=
ecause U-Boot
>>>> >       definitely boots as Xen on ARM guest firmware/bootloader. You =
should be able to build
>>>> >       U-Boot and use the U-Boot binary as Xen guest kernel, then U-B=
oot could load FreeBSD
>>>> >       from disk or network and start it. For instance as domU config=
 file:
>>>> >
>>>> >       kernel=3D"/home/petalinux/u-boot.bin"
>>>> >       disk =3D [ '/home/petalinux/test.img,raw,xvda' ]
>>>> >
>>>> >       I know it is important to build u-boot with the following conf=
ig to make it work on
>>>> >       Xen.
>>>> >
>>>> >       CONFIG_CMO_BY_VA_ONLY=3Dy
>>>> >
>>>> >
>>>> >
>>>> > This option seems more doable to me according to my knowledge. But I=
 need to understand how to do
>>>> > it.
>>>> >
>>>> > Well,let's say that on the ARM Chromebook I'm forced to use and inst=
all a customized version of
>>>> > u-boot,created by virtual open systems,because it is the only one th=
at allows bypassing its
>>>> > bootloader protection. You can find more information here :
>>>> >
>>>> > http://www.virtualopensystems.com/en/solutions/guides/kvm-on-chromeb=
ook/?vos=3Dtech
>>>> >
>>>> > This is the relevant section to read :
>>>> >
>>>> >
>>>> >       Bootloader :
>>>> >
>>>> >       If you wish to skip this chapter you can download a pre-compil=
ed binary of the
>>>> >       bootloader:
>>>> >
>>>> >
>>>> >       $ wget
>>>> >       http://www.virtualopensystems.com/downloads/guides/kvm_on_chro=
mebook/nv_u-boot-snow.kpart
>>>> >
>>>> >
>>>> >       To be able to run KVM on ARM platforms, the kernel has to be b=
ooted in hypervisor
>>>> >       mode. Because of this relatively recent requirement (due to th=
e introduction of the
>>>> >       virtualization extensions), up until now all booting methods w=
ould boot the kernel in
>>>> >       the standard Supervisor mode. For the ARM Chromebook the defau=
lt boot procedure
>>>> >       doesn't allow us to boot in hypervisor mode. Although the lapt=
op's boot mechanism is
>>>> >       based on the frequently used u-boot, the binary is located in =
RO memory. Fortunately,
>>>> >       a chained u-boot mechanism can be used (i.e. starting another =
u-boot after the
>>>> >       original). We can then enter hypervisor mode from our custom i=
teration of u-boot and
>>>> >       subsequently load our kernel and userspace.
>>>> >
>>>> >       Checkout the needed u-boot code :
>>>> >
>>>> >
>>>> >       $ git clone git://github.com/virtualopensystems/u-boot.git$ cd=
 u-boot$
>>>> >       ./scripts/build.sh
>>>> >
>>>> >
>>>> >       If successful, a message about how to copy the bootloader on t=
he USB flash disk or SD
>>>> >       card will appear. We will use it later when preparing the boot=
 medium to start our
>>>> >       system. If you have followed the Setting up the boot medium ch=
apter and you have a
>>>> >       prepared boot device, then you can update u-boot by running :
>>>> >
>>>> >
>>>> >       $ sudo dd if=3Dnv_uboot-snow.kpart of=3D/dev/sdX1
>>>> >
>>>> >
>>>> >
>>>> > so,the needed u-boot that we must use should be installed on the fir=
st partition of the sd card.
>>>> >
>>>> > There is another relevant section to read :
>>>> >
>>>> >
>>>> >       Setting up the boot medium
>>>> >
>>>> >       Now it is time to copy all the relevant files that we created =
in the previous
>>>> >       chapters,and use them to boot Chromebook with a different kern=
el and OS. In all these
>>>> >       examples the device /dev/sdX is used. Take extra care to chang=
e the examples to the
>>>> >       device that you have attached. Insert the boot medium on your =
workstation and
>>>> >       carefully execute the following step. First we need to properl=
y format the boot
>>>> >       medium.
>>>> >
>>>> >       In the uboot source directory :
>>>> >
>>>> >
>>>> >       $ sudo ./scripts/sdcard.sh /dev/sdX
>>>> >
>>>> >
>>>> >       This will erase all data and create 4 partitions in the medium=
, along with copying
>>>> >       the u-boot binary to the first partition:
>>>> >
>>>> >
>>>> >       Partition 1 =3D ChromeOS signed binary (V.O.S chained u-boot)
>>>> >       Partition 2 =3D not used
>>>> >       Partition 3 =3D EXT2 partition for u-boot files (uImage and ex=
ynos5250-snow.dtb)
>>>> >       Partition 4 =3D EXT4 partition for userspace files
>>>> >
>>>> >
>>>> >       With u-boot being copied, next is the kernel image and DTB fil=
e. From the kernel
>>>> >       source execute :
>>>> >
>>>> >
>>>> >       $ mkdir ../mnt/
>>>> >       $ sudo mount /dev/sdX3 ../mnt/
>>>> >       $ sudo cp arch/arm/boot/uImage ../mnt/
>>>> >       $ sudo cp arch/arm/boot/dts/exynos5250-snow.dtb ../mnt/
>>>> >       $ sudo umount /dev/sdX3
>>>> >
>>>> >
>>>> >       Finally, we have to copy the Ubuntu userspace filesystem that =
we created earlier:
>>>> >
>>>> >
>>>> >       $ sudo mount /dev/sdX4 mnt/$ sudo cp -a ./precise/* mnt/$ sudo=
 umount /dev/sdX4
>>>> >
>>>> >
>>>> >
>>>> > Now,my idea is to chainload the already chain loaded u-boot created =
by V.O.S to the new u-boot
>>>> > that we need for booting FreeBSD and that can be installed in the pa=
rtition n.2,as shown in this
>>>> > scheme,because it is not used :
>>>> >
>>>> >
>>>> > Partition 1 =3D ChromeOS signed binary (V.O.S chained u-boot)
>>>> > Partition 2 =3D not used (maybe we can install the u-boot for arm 32=
 bit,compatible with FreeBSD on
>>>> > this partition)
>>>> > Partition 3 =3D EXT2 partition for u-boot files (uImage and exynos52=
50-snow.dtb)
>>>> > Partition 4 =3D EXT4 partition for userspace files
>>>> >
>>>> >
>>>> > Take in consideration that default boot string is hardcoded here,in =
the snow.h file of the custom
>>>> > u-boot created by VOS :
>>>> >
>>>> >
>>>> > https://github.com/virtualopensyste...18a39b6c177dff58a/include/conf=
igs/snow.h#L101
>>>> >
>>>> >
>>>> > and it needs to be recompiled because it should point to the partiti=
on n.2,where I will install
>>>> > the u-boot files as explained here :
>>>> >
>>>> >
>>>> > https://wiki.freebsd.org/arm/Chromebook
>>>> >
>>>> >
>>>> > I have some questions to ask before I start working on this.
>>>> >
>>>> > 1) The xen developer said :
>>>> >
>>>> >
>>>> >       You should be able to build U-Boot and use the U-Boot binary a=
s Xen guest kernel...
>>>> >
>>>> >
>>>> >
>>>> > where is the u-boot binary,according to this document ?
>>>> >
>>>> > https://wiki.freebsd.org/arm/Chromebook
>>>> >
>>>> > I don't see it.
>>>> >
>>>> >
>>>> > 2) where is the source code of the file that I can get here :
>>>> >
>>>> > http://commondatastorage.googleapis.com/chromeos-localmirror/distfil=
es/nv_uboot-snow-simplefb.kpart.bz2
>>>> >
>>>> > I need the source code if I want to recompile u-boot so that it can =
point to the partition 4.
>>>> >
>>>> > Maybe it can be found on this link :
>>>> >
>>>> > http://linux-exynos.org/dist/chromebook/nv_uboot/
>>>> >
>>>> > but it can't be opened....
>>>> >
>>>> >
>>>> > 3) in this specific scenario the source code of u-boot should run on=
 arm 32 bit,not on arm
>>>> > 64,because I have the Samsung Chromebook "SNOW" model XE303C12,that'=
s powered by a Samsung Exynos
>>>> > 5250 (ARMv7 32 bit Cortex A15) Soc.
>>>> >
>>>> >
>>>> > 4) I'm not sure if I can chainload the customized u-boot created by =
V.O.S that should be
>>>> > installed on the first partition with the u-boot tailored for bootin=
g FreeBSD that should be
>>>> > installed on the partition 2....
>>>> >
>>>> >
>>>> > 5) the xen developer said that u-boot should be compiled enabling th=
is option :
>>>> >
>>>> >
>>>> > Code:
>>>> >
>>>> > CONFIG_CMO_BY_VA_ONLY=3Dy
>>>> >
>>>> >
>>>> > Well,can you provide some good source that can help me to understand=
 how I can recompile u-boot
>>>> > for FreeBSD ? thanks.
>>>> >
>>>> > --
>>>> > Mario.
>>>> >
>>>> >
>>>> >
>>>> > --
>>>> > Mario.
>>>> >
>>>> >
>>>> >
>>>> > --
>>>> > Mario.
>>>> >
>>>> >
>>>> >
>>>> > --
>>>> > Mario.
>>>> >
>>>> >
>>>> >
>>>> > --
>>>> > Mario.
>>>> >
>>>> >
>>>> >
>>>> > --
>>>> > Mario.
>>>> >
>>>> >
>>>
>>>
>>>
>>> --
>>> Mario.
>
>
>
> --
> Mario.



--
Mario.


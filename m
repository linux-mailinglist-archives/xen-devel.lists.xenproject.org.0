Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9553819378
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 23:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657226.1025963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFiWK-0004tH-0c; Tue, 19 Dec 2023 22:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657226.1025963; Tue, 19 Dec 2023 22:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFiWJ-0004rF-U3; Tue, 19 Dec 2023 22:24:59 +0000
Received: by outflank-mailman (input) for mailman id 657226;
 Tue, 19 Dec 2023 22:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tc1R=H6=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rFiWI-0004r7-MX
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 22:24:59 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ea6b5ea-9ebd-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 23:24:53 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a233a60f8feso397286766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 14:24:53 -0800 (PST)
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
X-Inumbo-ID: 6ea6b5ea-9ebd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703024693; x=1703629493; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0eOzDCsyfuMSa6M6LrXPX8dBBvwfNWLujpYs2rzQWH4=;
        b=IRnumfCV8XeETr3iRxmCAM7STt4ri109Ce7WYqIbw+kSw/I88jO1z1itZiK3o+NFZG
         RkOLIlC8j3T1yN3UGTNylzq6MXIP7E7HoNo69V8SWdXNneQKQw4If1xeujiKDJ1cFxjl
         8zo9TJyFAz3iZfjc2AbrFjBM6aLKVMieCqVtfU6l71OlU3rdg5JGPHIaSkrjQoOli2il
         MArc/l0U49D/LTZJZ8u0WbDBqoLr79s9lpya4/zcl6VCqmHTcnXBpy2YZ+7mZNouwQdY
         2aa1l6wF/ZQmqEHQksC5OveM83Jhnq1d4UwmfNSYw666seqoYoYPVy62bF4EFsx72CrI
         SCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703024693; x=1703629493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eOzDCsyfuMSa6M6LrXPX8dBBvwfNWLujpYs2rzQWH4=;
        b=uoGEcXAKH49Jhyryq0Dj3e+PCEZf5E60uzMjADvhYKx42EGmFn2ulfEvXoIOGZN6xT
         QZA5QQraFnruzAd0nq6F+F0oshxPPzl7gpAhdesPCDnHTAzF+awwlWWA5xIU5QFd4hxU
         wVlG1wTMaNVFgh8vyr/5YwNfbXdXir2X8sBKPIrm4lNOLAcdKHJ+YwAo71dpv3xragP4
         oR2asjmHvEDDgOYuKkh7uF5dA6zdZJqPabYpjPqCsvKfvJ1N+uWkX7VDPZ5p8CHXoX5h
         ExG77qFAUv6VENjmwChLrcPl/4GY+sjpZpddBTZLhj3Aj0ffDIgIcHIte2b0CEbr1U7O
         Blcg==
X-Gm-Message-State: AOJu0Yxvn78SzbhwUr8efsI/A82RPxyBYXYDI1ogyDVAelpJHJhXlW5h
	A+RHEmpzNljQG32wnGcx9/VmOPV4o4nz2ArQAhY=
X-Google-Smtp-Source: AGHT+IEUvErGAJWXxWFGKHszFTZRzmVDbF5bYa8nT2DFia8es+NuQhgNVljrkFC4ZcGfIwP4QKnAq8BzTq5krof+N70=
X-Received: by 2002:a17:906:30ca:b0:a1e:997a:574f with SMTP id
 b10-20020a17090630ca00b00a1e997a574fmr7830411ejb.122.1703024692828; Tue, 19
 Dec 2023 14:24:52 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiit5NJ_W7f5mssivkGGLevXh_XmSB7ZxZbQe1dgev0_Pg@mail.gmail.com>
 <97aa980b9b44.6eb7f9d5c54e7@mailgate.us> <CA+1FSiheSwrO7Tz3F3Nmu4vcC2E=ONRX8nF3bhQGV0UDOFTrww@mail.gmail.com>
 <da024d1687f3a.2f0c601bba502@mailgate.us> <CA+1FSih7C0HEun99LHEwvyYRiH0PaLwwgnoQLHB69TWz2ykDZg@mail.gmail.com>
 <CA+1FSijoPkRZRaU6tujaMJZeFd3CSyUN+h4y0_NrrB5VWLgwpA@mail.gmail.com>
 <CA+1FSiib3uu9Ky8N5rSSt+H1nfzUnChKhGs2ERWmsbp2T4=2uA@mail.gmail.com>
 <CA+1FSihtb3+bm-pSqa7JGBjy3JUXYD6i0c6J2KHy+EO8rmZ5PA@mail.gmail.com> <alpine.DEB.2.22.394.2312191131290.3175268@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2312191131290.3175268@ubuntu-linux-20-04-desktop>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 19 Dec 2023 23:24:16 +0100
Message-ID: <CA+1FSigh=fc07o-RSMZ+hf9-YBUudAwnGcN9k8bP1RnPBP7tRA@mail.gmail.com>
Subject: Re: How to boot FreeBSD for arm 32 bit as DomU with u-boot on my ARM Chromebook
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stanislav Silnicki <stanislav.silnicki@mailgate.us>, freebsd-arm@freebsd.org, 
	Michal.Orzel@amd.com, xen-devel@lists.xenproject.org, Artem_Mygaiev@epam.com
Content-Type: multipart/alternative; boundary="000000000000dc1fa1060ce45558"

--000000000000dc1fa1060ce45558
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've asked some help on the channel #arm on Reddit and someone replied :

https://www.reddit.com/r/arm/comments/18mcir8/i_cant_boot_freebsd_for_arm32=
_bit_as_domu_with/

Maybe his answer can be useful to understand why it does not work.

On Tue, Dec 19, 2023 at 8:33=E2=80=AFPM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> +Michal
>
> Hi Mario,
>
> I am not sure about booting FreeBSD, but I am certain that u-boot works
> fine as DomU kernel on ARMv8 (not sure about ARMv7). With this config
> file:
>
> name=3D"test"
> kernel=3D"u-boot.bin"
> extra =3D "console=3Dhvc0"
> memory=3D256
> vcpus=3D1
> disk =3D [ 'FreeBSD-13.2-RELEASE-armv7.img,raw,xvda' ]
>
> I don't know for sure if you can boot FreeBSD but you should definitely
> be able to see the u-boot command line prompt. The fact that you are
> getting this message:
>
> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found:
> Invalid kernel
>
> Means that something is not right in the u-boot configuration or u-boot
> build. Michal and Artem (CCed) might know more. From what I recall,
> there was nothing special required to get u-boot.bin to boot as domU
> kernel, so now I wonder if it is an ARMv7 vs. ARMv8 issue.
>
> Cheers,
>
> Stefano
>
>
> On Tue, 19 Dec 2023, Mario Marietto wrote:
> > ....I see that some other interesting files have been produced by u-boo=
t
> when I have compiled it :
> >
> > u-boot
> > u-boot.lds
> > u-boot.bin
> > u-boot.map
> > u-boot-nodtb.bin
> > u-boot.dtb
> > u-boot.srec
> > u-boot-dtb.bin
> > u-boot.sym
> >
> > So,maybe I should use a different u-boot* file for booting FreeBSD ?
> >
> >
> > On Tue, Dec 19, 2023 at 4:28=E2=80=AFPM Mario Marietto <marietto2008@gm=
ail.com>
> wrote:
> >       Hello to everyone.
> >
> > I have compiled the needed u-boot.bin from scratch using this procedure=
 :
> >
> > # git clone https://github.com/u-boot/u-boot.git
> > # cd u-boot
> > # ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make snow_defconfig :=
 this
> line generates the file .config
> > # nano .config and I've added these parameters :
> >
> > CONFIG_ARMV7_NONSEC=3Dn
> > CONFIG_EFI_GRUB_ARM32_WORKAROUND=3Dy
> >
> > the uboot-bin file is generated with this command :
> >
> > # ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make
> >
> > At this point,I took a look inside the .config file and I saw that the
> parameter "CONFIG_ARMV7_NONSEC=3Dn" has been removed. So,for
> > some reason,it is not accepted and this could be a problem....
> >
> > These are the xen config files that I've used :
> >
> > nano freebsd.cfg
> >
> > name=3D"test"
> > kernel=3D"u-boot.bin"
> > extra =3D "console=3Dhvc0"
> > memory=3D256
> > vcpus=3D1
> > disk =3D [ 'FreeBSD-13.2-RELEASE-armv7.img,raw,xvda' ]
> >
> > nano start-freebsd
> >
> > xl create freebsd.cfg
> > xl console freebsd
> >
> > This is what happens when I launch the vm :
> >
> > # ./start-freebsd
> >
> > Parsing config from freebsd.cfg
> > xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader
> found: Invalid kernel
> > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fail=
ed
> > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain
> 1:cannot (re-)build domain: -3
> > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 1:Non-existent domain
> > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 1:Unable to destroy guest
> > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 1:Destruction of domain failed
> > freebsd is an invalid domain identifier (rc=3D-6)
> >
> >
> > On Mon, Dec 18, 2023 at 12:39=E2=80=AFPM Mario Marietto <marietto2008@g=
mail.com>
> wrote:
> >       So,ok,I should have said "the second u-boot" ; since the first
> u-boot binary is the "u-boot binary located in the RO
> >       memory" of the Chromebook". Sorry for the confusion.
> >
> > On Mon, Dec 18, 2023 at 12:35=E2=80=AFPM Mario Marietto <marietto2008@g=
mail.com>
> wrote:
> >       ---> There are no specific options in u-boot devoted to FreeBSD
> >
> > This is an important factor. So,what about if,instead of compiling a ne=
w
> version of u-boot on the partition 2,I will
> > recompile the u-boot customized version created by the virtual open
> system in 2014,that should be installed on the first
> > partition ? It could work if there are no differences between the u-boo=
t
> that should boot Linux and the u-boot that
> > should boot FreeBSD.
> >
> > Can you give a look at the u-boot source code created by virtual open
> systems ? You can find it on my google drive :
> >
> >
> https://drive.google.com/file/d/1eAaZMfd6CU0xiqQfH7sq5wGVzzO09BRm/view?us=
p=3Dsharing
> >
> > I need to understand if I can recompile it without problem so that it
> can satisfy my needs (the ability of the file
> > u-boot.bin to boot FreeBSD as domU under Xen,as explained by Stefano
> Stabellini,the xen developer that suggested to me
> > what I could do to have FreeBSD virtualized under Xen on my Arm
> Chromebook) ; otherwise the risk is to find later
> > problems that will make me troubles and that I will not able to fix.
> >
> > I gave a look at the virtual open system u-boot and I didn't see any
> arndale_defconfig inside. So,If I have understood
> > correctly,I should put that file inside the root of the u-boot source
> code,let's say here :
> >
> > marietto:/home/marietto/Desktop/Files/u-boot_FreeBSD/u-boot-vos # ls
> >
> > .checkpatch.conf        README                  doc
>                     net
> > .git                    api                     drivers
>                 onenand_ipl
> > .gitignore              arch                    dts
>                     post
> > COPYING                 board                   examples
> rules.mk
> > CREDITS                 boards.cfg              fs
>                      scripts
> > MAINTAINERS             common                  include
>                 snapshot.commit
> > MAKEALL                 config.mk               lib
>                     spl
> > Makefile                cros                    mkconfig
>                test
> > PRESUBMIT.cfg           disk                    nand_spl
>                tools
> >
> > and I should do : make and make install ? and the file I need,u-boot.bi=
n
> will be generated ?
> >
> > I didn't find any pre made configuration file inside :
> >
> > u-boot-vos # find . -type f -name "exynos*"
> >
> > ./include/exynos-fb.h
> > ./include/configs/exynos5-common.h
> > ./doc/device-tree-bindings/spi/exynos-spi.txt
> > ./doc/device-tree-bindings/usb/exynos-usb.txt
> > ./drivers/power/exynos-tmu.c
> > ./drivers/power/exynos-cpufreq.c
> > ./drivers/video/exynos-fb.c
> > ./drivers/spi/exynos_spi.c
> > ./board/samsung/dts/exynos5250-spring.dts
> > ./board/samsung/dts/exynos5250-smdk5250.dts
> > ./board/samsung/dts/exynos5250-snow.dts
> > ./board/samsung/dts/exynos5250-daisy.dts
> > ./arch/arm/include/asm/arch-exynos5/exynos-cpufreq.h
> > ./arch/arm/include/asm/arch-exynos5/exynos-tmu.h
> > ./arch/arm/dts/exynos5250.dtsi
> > ./arch/arm/dts/exynos-periph-id.dtsi
> > ./arch/arm/cpu/armv7/exynos5/exynos_cache.c
> >
> > u-boot-vos # find . -type f -name "arndale*"
> >
> > For sure I can't use a newer version of u-boot because otherwise the
> patches needed to bypass the bootloader protections
> > of the Arm Chromebook (such as a lot of different patches needed to boo=
t
> correctly Linux) will be broken ; anyway,since
> > it works,I don't need to use an updated version of u-boot.
> >
> > ----> As per my experience, you have to respect these two options,
> compiling u-boot for
> > FreeBSD:
> https://github.com/freebsd/freebsd-ports/blob/main/sysutils/u-boot-master=
/files/FreeBSD_Fragment
> >
> > It says that I should use these parameters :
> >
> > CONFIG_ARMV7_NONSEC=3Dn
> > CONFIG_EFI_GRUB_ARM32_WORKAROUND=3Dy
> >
> > These are the parameters used to configure a Linux kernel. I don't
> understand what's the relation between the compilation
> > of a linux kernel and u-boot. In the past I tried to recompile
> u-boot,but I didn't have the need to set up those
> > parameters,so I don't know how to do it (but I know how to recompile a
> Linux kernel).
> >
> > ---> I'm not sure that I'm getting you right, as I don't understand wha=
t
> you mean under "the first u-boot".
> >
> >
> > I'm talking about first u-boot because the whole procedure to boot Linu=
x
> on the ARM Chromebook,that's explained here :
> >
> > http://www.virtualopensystems.com/en/solutions/guides/kvm-on-chromebook=
/
> >
> >
> > at some point they say :
> >
> >
> > To be able to run KVM on ARM platforms, the kernel has to be booted in
> hypervisor mode. Because of this relatively recent
> > requirement (due to the introduction of the virtualization extensions),
> up until now all booting methods would boot the
> > kernel in the standard Supervisor mode.
> >
> > For the ARM Chromebook the default boot procedure doesn't allow us to
> boot in hypervisor mode. Although the laptop's boot
> > mechanism is based on the frequently used u-boot, the binary is located
> in RO memory. Fortunately, a chained u-boot
> > mechanism can be used (i.e. starting another u-boot after the original)=
.
> We can then enter hypervisor mode from our
> > custom iteration of u-boot and subsequently load our kernel and
> userspace.
> >
> > So,the first u-boot is the u-boot provided by virtual open
> systems,that's able to chainload the "u-boot binary located in
> > RO memory" , that does not boot Chrome OS in hypervisor mode. We don't
> need it if we want to boot Linux with kvm or xen
> > enabled.
> >
> >
> > On Sun, Dec 17, 2023 at 1:28=E2=80=AFAM Stanislav Silnicki <
> stanislav.silnicki@mailgate.us> wrote:
> >       I'm not an expert in the topic, I only know, that ARM has divided
> hardware into two worlds - Secure and
> >       Not-So, strictly limiting any software, running in non-secure
> world with access to functions and
> >       resources.
> https://developer.arm.com/documentation/den0013/d/Security/TrustZone-hard=
ware-architecture?lang=3Den
> >
> > I'm not sure, that I'm getting you right, as I don't understand what yo=
u
> mean under "the first u-boot".
> >
> > As I understand, virtualization (HYP) is running in non-secure world(
> https://developer.arm.com/documentation/ddi0406/c/System-Level-Architectu=
re/The-System-Level-Programmers--Model/The-Virtualization-Extens
> > ions), so my guess (only guess!!!), virtualization software has to
> prepare (configure) HW platform in the way,
> > that FreeBSD kernel will not lack any resources, required to configure
> MPU, VA, etc.
> > So, if you lucky to boot virtualizer, which is aware of target OS, that
> maybe you can boot the kernel. Although, I
> > doubt, that you need to boot 'second' u-boot to boot the kernel - there
> is simply ubldr, which you can hook somehow
> > from virtualizer....
> >
> > Stan
> >
> >
> >
> > Mario Marietto wrote:
> >
> >
> >       ---> As I understand, it makes sure that u-boot keeps in secure
> mode during boot and passes control to
> >       ubldr, which boots FreeBSD kernel, in that mode.
> >
> > Can you elaborate your sentence more ? I know that the bootloader secur=
e
> mode is bypassed by the virtual open
> > systems u-boot. Are you saying that when the control passes to the
> second u-boot,it will happen in secure
> > mode,so that the bypass that happened loading the first u-boot,is
> annulled ? If this is true,maybe can I boot
> > FreeBSD using the virtual-open-system custom u-boot ? Is this compatibl=
e
> with FreeBSD ? Where can I find the
> > u-boot.bin that the xen developer talked about ? thanks bro'.
> >
> >
> >
> > On Sun, Dec 17, 2023 at 12:35=E2=80=AFAM Stanislav Silnicki <
> stanislav.silnicki@mailgate.us> wrote:
> >       Hi Mario,
> >
> > U-Boot  beast is hiding in this den:
> https://source.denx.de/u-boot/u-boot.git
> > I took a brief look at your post and it seems to me, that
> option CONFIG_CMO_BY_VA_ONLY is irrelevant to
> > your target armv7 32 bit
> > platform:
> https://source.denx.de/u-boot/u-boot/-/blob/master/arch/arm/cpu/armv8/Kco=
nfig?ref_type=3Dheads#L3
> >
> > As for compiling the u-boot, it is a doable task, given that you
> understand what you are doing. There
> > are no specific options in u-boot devoted to FreeBSD. It is a boot
> loader, whose mission to make basic
> > hardware initialization, read you kernel file from some media into RAM
> and then pass it control.
> >
> > Basically, you can grab some defconfig, prepared for any other
> Exynos5250 based board  (say, this one:
> >
> https://source.denx.de/u-boot/u-boot/-/blob/master/configs/arndale_defcon=
fig?ref_type=3Dheads)
> and adopt
> > it somehow.
> >
> > As per my experience, you have to respect these two options, compiling
> u-boot for
> > FreeBSD:
> https://github.com/freebsd/freebsd-ports/blob/main/sysutils/u-boot-master=
/files/FreeBSD_Fragment
> >
> > As I understand, it makes sure, that u-boot keeps in secure mode during
> boot and passes control to
> > ubldr, which boots FreBSD kernel, in that mode. Otherwise, there a lot
> of surprises you may realize.
> >
> > Hope, this will help to progress you tasks
> > Stan
> >
> > Mario Marietto wrote:
> >
> >
> >       Hello.
> >
> >       I'm trying to boot FreeBSD for arm32 bit as DomU on my ARM
> Chromebook. Basically there are
> >       two ways to accomplish this task :
> >
> >       1) to write a patch that allows the FreeBSD kernel to boot as a
> zImage file. This could be
> >       accomplished applying this patch to a specific file that's on the
> source code of FreeBSD :
> >
> >
> >
> https://xenbits.xen.org/gitweb/?p=3Dp...8;hb=3D0782e25d98cc1391472717035f=
986c979edef0c9
> >
> >
> >       This patch was written by Julien Grall a lot of time ago and now
> it does not work anymore.
> >       This is the reason :
> >
> >
> >             It appears FreeBSD-CURRENT removed the last step converting
> the kernel file to
> >             kernel.bin. The patch can be readily rebased, but without
> kernel.bin that
> >             doesn't do too much.
> >
> >
> >
> > So,without a rebase of that patch the first option is not applicable.
> And I'm not able to fix it.
> >
> > 2) booting FreeBSD using U-Boot,as explained to me by a xen developer :
> >
> >
> >       I was trying to explain why and how Julien's patch works so that
> you could be the one
> >       to re-do something similar or fix the patch on the FreeBSD kernel
> that you are
> >       working with. I am happy to help review and write patches but I
> don't work with the
> >       FreeBSD kernel so I wouldn't be able to help you quickly. However=
,
> I might have a
> >       suggestion. Do you know if FreeBSD can be booted by U-Boot ?
> Because U-Boot
> >       definitely boots as Xen on ARM guest firmware/bootloader. You
> should be able to build
> >       U-Boot and use the U-Boot binary as Xen guest kernel, then U-Boot
> could load FreeBSD
> >       from disk or network and start it. For instance as domU config
> file:
> >
> >       kernel=3D"/home/petalinux/u-boot.bin"
> >       disk =3D [ '/home/petalinux/test.img,raw,xvda' ]
> >
> >       I know it is important to build u-boot with the following config
> to make it work on
> >       Xen.
> >
> >       CONFIG_CMO_BY_VA_ONLY=3Dy
> >
> >
> >
> > This option seems more doable to me according to my knowledge. But I
> need to understand how to do
> > it.
> >
> > Well,let's say that on the ARM Chromebook I'm forced to use and install
> a customized version of
> > u-boot,created by virtual open systems,because it is the only one that
> allows bypassing its
> > bootloader protection. You can find more information here :
> >
> >
> http://www.virtualopensystems.com/en/solutions/guides/kvm-on-chromebook/?=
vos=3Dtech
> >
> > This is the relevant section to read :
> >
> >
> >       Bootloader :
> >
> >       If you wish to skip this chapter you can download a pre-compiled
> binary of the
> >       bootloader:
> >
> >
> >       $ wget
> >
> http://www.virtualopensystems.com/downloads/guides/kvm_on_chromebook/nv_u=
-boot-snow.kpart
> >
> >
> >       To be able to run KVM on ARM platforms, the kernel has to be
> booted in hypervisor
> >       mode. Because of this relatively recent requirement (due to the
> introduction of the
> >       virtualization extensions), up until now all booting methods woul=
d
> boot the kernel in
> >       the standard Supervisor mode. For the ARM Chromebook the default
> boot procedure
> >       doesn't allow us to boot in hypervisor mode. Although the laptop'=
s
> boot mechanism is
> >       based on the frequently used u-boot, the binary is located in RO
> memory. Fortunately,
> >       a chained u-boot mechanism can be used (i.e. starting another
> u-boot after the
> >       original). We can then enter hypervisor mode from our custom
> iteration of u-boot and
> >       subsequently load our kernel and userspace.
> >
> >       Checkout the needed u-boot code :
> >
> >
> >       $ git clone git://github.com/virtualopensystems/u-boot.git$ cd
> u-boot$
> >       ./scripts/build.sh
> >
> >
> >       If successful, a message about how to copy the bootloader on the
> USB flash disk or SD
> >       card will appear. We will use it later when preparing the boot
> medium to start our
> >       system. If you have followed the Setting up the boot medium
> chapter and you have a
> >       prepared boot device, then you can update u-boot by running :
> >
> >
> >       $ sudo dd if=3Dnv_uboot-snow.kpart of=3D/dev/sdX1
> >
> >
> >
> > so,the needed u-boot that we must use should be installed on the first
> partition of the sd card.
> >
> > There is another relevant section to read :
> >
> >
> >       Setting up the boot medium
> >
> >       Now it is time to copy all the relevant files that we created in
> the previous
> >       chapters,and use them to boot Chromebook with a different kernel
> and OS. In all these
> >       examples the device /dev/sdX is used. Take extra care to change
> the examples to the
> >       device that you have attached. Insert the boot medium on your
> workstation and
> >       carefully execute the following step. First we need to properly
> format the boot
> >       medium.
> >
> >       In the uboot source directory :
> >
> >
> >       $ sudo ./scripts/sdcard.sh /dev/sdX
> >
> >
> >       This will erase all data and create 4 partitions in the medium,
> along with copying
> >       the u-boot binary to the first partition:
> >
> >
> >       Partition 1 =3D ChromeOS signed binary (V.O.S chained u-boot)
> >       Partition 2 =3D not used
> >       Partition 3 =3D EXT2 partition for u-boot files (uImage and
> exynos5250-snow.dtb)
> >       Partition 4 =3D EXT4 partition for userspace files
> >
> >
> >       With u-boot being copied, next is the kernel image and DTB file.
> From the kernel
> >       source execute :
> >
> >
> >       $ mkdir ../mnt/
> >       $ sudo mount /dev/sdX3 ../mnt/
> >       $ sudo cp arch/arm/boot/uImage ../mnt/
> >       $ sudo cp arch/arm/boot/dts/exynos5250-snow.dtb ../mnt/
> >       $ sudo umount /dev/sdX3
> >
> >
> >       Finally, we have to copy the Ubuntu userspace filesystem that we
> created earlier:
> >
> >
> >       $ sudo mount /dev/sdX4 mnt/$ sudo cp -a ./precise/* mnt/$ sudo
> umount /dev/sdX4
> >
> >
> >
> > Now,my idea is to chainload the already chain loaded u-boot created by
> V.O.S to the new u-boot
> > that we need for booting FreeBSD and that can be installed in the
> partition n.2,as shown in this
> > scheme,because it is not used :
> >
> >
> > Partition 1 =3D ChromeOS signed binary (V.O.S chained u-boot)
> > Partition 2 =3D not used (maybe we can install the u-boot for arm 32
> bit,compatible with FreeBSD on
> > this partition)
> > Partition 3 =3D EXT2 partition for u-boot files (uImage and
> exynos5250-snow.dtb)
> > Partition 4 =3D EXT4 partition for userspace files
> >
> >
> > Take in consideration that default boot string is hardcoded here,in the
> snow.h file of the custom
> > u-boot created by VOS :
> >
> >
> >
> https://github.com/virtualopensyste...18a39b6c177dff58a/include/configs/s=
now.h#L101
> >
> >
> > and it needs to be recompiled because it should point to the partition
> n.2,where I will install
> > the u-boot files as explained here :
> >
> >
> > https://wiki.freebsd.org/arm/Chromebook
> >
> >
> > I have some questions to ask before I start working on this.
> >
> > 1) The xen developer said :
> >
> >
> >       You should be able to build U-Boot and use the U-Boot binary as
> Xen guest kernel...
> >
> >
> >
> > where is the u-boot binary,according to this document ?
> >
> > https://wiki.freebsd.org/arm/Chromebook
> >
> > I don't see it.
> >
> >
> > 2) where is the source code of the file that I can get here :
> >
> >
> http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/nv=
_uboot-snow-simplefb.kpart.bz2
> >
> > I need the source code if I want to recompile u-boot so that it can
> point to the partition 4.
> >
> > Maybe it can be found on this link :
> >
> > http://linux-exynos.org/dist/chromebook/nv_uboot/
> >
> > but it can't be opened....
> >
> >
> > 3) in this specific scenario the source code of u-boot should run on ar=
m
> 32 bit,not on arm
> > 64,because I have the Samsung Chromebook "SNOW" model XE303C12,that's
> powered by a Samsung Exynos
> > 5250 (ARMv7 32 bit Cortex A15) Soc.
> >
> >
> > 4) I'm not sure if I can chainload the customized u-boot created by
> V.O.S that should be
> > installed on the first partition with the u-boot tailored for booting
> FreeBSD that should be
> > installed on the partition 2....
> >
> >
> > 5) the xen developer said that u-boot should be compiled enabling this
> option :
> >
> >
> > Code:
> >
> > CONFIG_CMO_BY_VA_ONLY=3Dy
> >
> >
> > Well,can you provide some good source that can help me to understand ho=
w
> I can recompile u-boot
> > for FreeBSD ? thanks.
> >
> > --
> > Mario.
> >
> >
> >
> > --
> > Mario.
> >
> >
> >
> > --
> > Mario.
> >
> >
> >
> > --
> > Mario.
> >
> >
> >
> > --
> > Mario.
> >
> >
> >
> > --
> > Mario.
> >
> >



--=20
Mario.

--000000000000dc1fa1060ce45558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve asked some help on the channel #arm on Reddi=
t and someone replied :</div><div><br></div><div><a href=3D"https://www.red=
dit.com/r/arm/comments/18mcir8/i_cant_boot_freebsd_for_arm32_bit_as_domu_wi=
th/">https://www.reddit.com/r/arm/comments/18mcir8/i_cant_boot_freebsd_for_=
arm32_bit_as_domu_with/</a></div><div><br></div><div>Maybe his answer can b=
e useful to understand why it does not work. <br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 19, 2023=
 at 8:33=E2=80=AFPM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@ke=
rnel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+Michal<br>
<br>
Hi Mario,<br>
<br>
I am not sure about booting FreeBSD, but I am certain that u-boot works<br>
fine as DomU kernel on ARMv8 (not sure about ARMv7). With this config<br>
file:<br>
<br>
name=3D&quot;test&quot;<br>
kernel=3D&quot;u-boot.bin&quot;<br>
extra =3D &quot;console=3Dhvc0&quot;<br>
memory=3D256<br>
vcpus=3D1<br>
disk =3D [ &#39;FreeBSD-13.2-RELEASE-armv7.img,raw,xvda&#39; ]<br>
<br>
I don&#39;t know for sure if you can boot FreeBSD but you should definitely=
<br>
be able to see the u-boot command line prompt. The fact that you are<br>
getting this message:<br>
<br>
xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: I=
nvalid kernel<br>
<br>
Means that something is not right in the u-boot configuration or u-boot<br>
build. Michal and Artem (CCed) might know more. From what I recall,<br>
there was nothing special required to get u-boot.bin to boot as domU<br>
kernel, so now I wonder if it is an ARMv7 vs. ARMv8 issue.<br>
<br>
Cheers,<br>
<br>
Stefano<br>
<br>
<br>
On Tue, 19 Dec 2023, Mario Marietto wrote:<br>
&gt; ....I see that some other interesting files have been produced by u-bo=
ot when I have compiled it :<br>
&gt; <br>
&gt; u-boot<br>
&gt; u-boot.lds<br>
&gt; u-boot.bin<br>
&gt; u-boot.map<br>
&gt; u-boot-nodtb.bin<br>
&gt; u-boot.dtb<br>
&gt; u-boot.srec<br>
&gt; u-boot-dtb.bin<br>
&gt; u-boot.sym<br>
&gt; <br>
&gt; So,maybe I should use a different u-boot* file for booting FreeBSD ?<b=
r>
&gt; <br>
&gt; <br>
&gt; On Tue, Dec 19, 2023 at 4:28=E2=80=AFPM Mario Marietto &lt;<a href=3D"=
mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>=
&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hello to everyone.<br>
&gt; <br>
&gt; I have compiled the needed u-boot.bin from scratch using this procedur=
e :<br>
&gt; <br>
&gt; # git clone <a href=3D"https://github.com/u-boot/u-boot.git" rel=3D"no=
referrer" target=3D"_blank">https://github.com/u-boot/u-boot.git</a><br>
&gt; # cd u-boot<br>
&gt; # ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make snow_defconfig =
: this line generates the file .config<br>
&gt; # nano .config and I&#39;ve added these parameters :<br>
&gt; <br>
&gt; CONFIG_ARMV7_NONSEC=3Dn<br>
&gt; CONFIG_EFI_GRUB_ARM32_WORKAROUND=3Dy<br>
&gt; <br>
&gt; the uboot-bin file is generated with this command :<br>
&gt; <br>
&gt; # ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- make<br>
&gt; <br>
&gt; At this point,I took a look inside the .config file and I saw that the=
 parameter &quot;CONFIG_ARMV7_NONSEC=3Dn&quot; has been removed. So,for<br>
&gt; some reason,it is not accepted and this could be a problem....<br>
&gt; <br>
&gt; These are the xen config files that I&#39;ve used :<br>
&gt; <br>
&gt; nano freebsd.cfg<br>
&gt; <br>
&gt; name=3D&quot;test&quot;<br>
&gt; kernel=3D&quot;u-boot.bin&quot;<br>
&gt; extra =3D &quot;console=3Dhvc0&quot;<br>
&gt; memory=3D256<br>
&gt; vcpus=3D1<br>
&gt; disk =3D [ &#39;FreeBSD-13.2-RELEASE-armv7.img,raw,xvda&#39; ]<br>
&gt; <br>
&gt; nano start-freebsd<br>
&gt; <br>
&gt; xl create freebsd.cfg<br>
&gt; xl console freebsd<br>
&gt; <br>
&gt; This is what happens when I launch the vm :<br>
&gt; <br>
&gt; # ./start-freebsd<br>
&gt; =C2=A0<br>
&gt; Parsing config from freebsd.cfg<br>
&gt; xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader fou=
nd: Invalid kernel<br>
&gt; libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fai=
led<br>
&gt; libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:can=
not (re-)build domain: -3<br>
&gt; libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-e=
xistent domain<br>
&gt; libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Un=
able to destroy guest<br>
&gt; libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruct=
ion of domain failed<br>
&gt; freebsd is an invalid domain identifier (rc=3D-6)<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Dec 18, 2023 at 12:39=E2=80=AFPM Mario Marietto &lt;<a href=3D=
"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a=
>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So,ok,I should have said &quot;the second u-=
boot&quot; ; since the first u-boot binary is the &quot;u-boot binary locat=
ed in the RO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory&quot; of the Chromebook&quot;. Sorry =
for the confusion.<br>
&gt; <br>
&gt; On Mon, Dec 18, 2023 at 12:35=E2=80=AFPM Mario Marietto &lt;<a href=3D=
"mailto:marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a=
>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---&gt; There are no specific options in u-b=
oot devoted to FreeBSD<br>
&gt; <br>
&gt; This is an important factor. So,what about if,instead of compiling a n=
ew version of u-boot on the partition 2,I will<br>
&gt; recompile the u-boot customized version created by the virtual open sy=
stem in 2014,that should be installed on the first<br>
&gt; partition ? It could work if there are no differences between the u-bo=
ot that should boot Linux and the u-boot that<br>
&gt; should boot FreeBSD.<br>
&gt; <br>
&gt; Can you give a look at the u-boot source code created by virtual open =
systems ? You can find it on my google drive :<br>
&gt; <br>
&gt; <a href=3D"https://drive.google.com/file/d/1eAaZMfd6CU0xiqQfH7sq5wGVzz=
O09BRm/view?usp=3Dsharing" rel=3D"noreferrer" target=3D"_blank">https://dri=
ve.google.com/file/d/1eAaZMfd6CU0xiqQfH7sq5wGVzzO09BRm/view?usp=3Dsharing</=
a><br>
&gt; <br>
&gt; I need to understand if I can recompile it without problem so that it =
can satisfy my needs (the ability of the file<br>
&gt; u-boot.bin to boot FreeBSD as domU under Xen,as explained by Stefano S=
tabellini,the xen developer that suggested to me<br>
&gt; what I could do to have FreeBSD virtualized under Xen on my Arm Chrome=
book) ; otherwise the risk is to find later<br>
&gt; problems that will make me troubles and that I will not able to fix.<b=
r>
&gt; <br>
&gt; I gave a look at the virtual open system u-boot and I didn&#39;t see a=
ny arndale_defconfig inside. So,If I have understood<br>
&gt; correctly,I should put that file inside the root of the u-boot source =
code,let&#39;s say here :<br>
&gt; <br>
&gt; marietto:/home/marietto/Desktop/Files/u-boot_FreeBSD/u-boot-vos # ls<b=
r>
&gt; =C2=A0<br>
&gt; .checkpatch.conf =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0README =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0doc =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
net<br>
&gt; .git =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0api =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0onenand_ipl<br>
&gt; .gitignore =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0arch =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dts =C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0post<br>
&gt; COPYING =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0board =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
examples =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"http://rules.mk" rel=3D"noreferrer" targ=
et=3D"_blank">rules.mk</a><br>
&gt; CREDITS =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0boards.cfg =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fs =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0scripts<br>
&gt; MAINTAINERS =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0common =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0snapshot.commit<br>
&gt; MAKEALL =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"http://config.mk" rel=3D"nor=
eferrer" target=3D"_blank">config.mk</a> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lib =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0spl<br>
&gt; Makefile =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cros =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
mkconfig =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0test<br>
&gt; PRESUBMIT.cfg =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0disk =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nand_spl =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
tools<br>
&gt; <br>
&gt; and I should do : make and make install ? and the file I need,u-boot.b=
in will be generated ?=C2=A0<br>
&gt; <br>
&gt; I didn&#39;t find any pre made configuration file inside :<br>
&gt; <br>
&gt; u-boot-vos # find . -type f -name &quot;exynos*&quot;=C2=A0<br>
&gt; <br>
&gt; ./include/exynos-fb.h<br>
&gt; ./include/configs/exynos5-common.h<br>
&gt; ./doc/device-tree-bindings/spi/exynos-spi.txt<br>
&gt; ./doc/device-tree-bindings/usb/exynos-usb.txt<br>
&gt; ./drivers/power/exynos-tmu.c<br>
&gt; ./drivers/power/exynos-cpufreq.c<br>
&gt; ./drivers/video/exynos-fb.c<br>
&gt; ./drivers/spi/exynos_spi.c<br>
&gt; ./board/samsung/dts/exynos5250-spring.dts<br>
&gt; ./board/samsung/dts/exynos5250-smdk5250.dts<br>
&gt; ./board/samsung/dts/exynos5250-snow.dts<br>
&gt; ./board/samsung/dts/exynos5250-daisy.dts<br>
&gt; ./arch/arm/include/asm/arch-exynos5/exynos-cpufreq.h<br>
&gt; ./arch/arm/include/asm/arch-exynos5/exynos-tmu.h<br>
&gt; ./arch/arm/dts/exynos5250.dtsi<br>
&gt; ./arch/arm/dts/exynos-periph-id.dtsi<br>
&gt; ./arch/arm/cpu/armv7/exynos5/exynos_cache.c=C2=A0<br>
&gt; <br>
&gt; u-boot-vos # find . -type f -name &quot;arndale*&quot;<br>
&gt; <br>
&gt; For sure I can&#39;t use a newer version of u-boot because otherwise t=
he patches needed to bypass the bootloader protections<br>
&gt; of the Arm Chromebook (such as a lot of different patches needed to bo=
ot correctly Linux) will be broken ; anyway,since<br>
&gt; it works,I don&#39;t need to use an updated version of u-boot.<br>
&gt; <br>
&gt; ----&gt; As per my experience, you have to respect these two options, =
compiling u-boot for<br>
&gt; FreeBSD:=C2=A0<a href=3D"https://github.com/freebsd/freebsd-ports/blob=
/main/sysutils/u-boot-master/files/FreeBSD_Fragment" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/freebsd/freebsd-ports/blob/main/sysutils/=
u-boot-master/files/FreeBSD_Fragment</a><br>
&gt; <br>
&gt; It says that I should use these parameters :<br>
&gt; <br>
&gt; CONFIG_ARMV7_NONSEC=3Dn<br>
&gt; CONFIG_EFI_GRUB_ARM32_WORKAROUND=3Dy<br>
&gt; <br>
&gt; These are the parameters used to configure a Linux kernel. I don&#39;t=
 understand what&#39;s the relation between the compilation<br>
&gt; of a linux kernel and u-boot. In the past I tried to recompile u-boot,=
but I didn&#39;t have the need to set up those<br>
&gt; parameters,so I don&#39;t know how to do it (but I know how to recompi=
le a Linux kernel).<br>
&gt; <br>
&gt; ---&gt; I&#39;m not sure that I&#39;m getting you right, as I don&#39;=
t understand what you mean under &quot;the first u-boot&quot;.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m talking about first u-boot because the whole procedure to boot=
 Linux on the ARM Chromebook,that&#39;s explained here :<br>
&gt; <br>
&gt; <a href=3D"http://www.virtualopensystems.com/en/solutions/guides/kvm-o=
n-chromebook/" rel=3D"noreferrer" target=3D"_blank">http://www.virtualopens=
ystems.com/en/solutions/guides/kvm-on-chromebook/</a><br>
&gt; <br>
&gt; <br>
&gt; at some point they say :<br>
&gt; <br>
&gt; <br>
&gt; To be able to run KVM on ARM platforms, the kernel has to be booted in=
 hypervisor mode. Because of this relatively recent<br>
&gt; requirement (due to the introduction of the virtualization extensions)=
, up until now all booting methods would boot the<br>
&gt; kernel in the standard Supervisor mode.<br>
&gt; <br>
&gt; For the ARM Chromebook the default boot procedure doesn&#39;t allow us=
 to boot in hypervisor mode. Although the laptop&#39;s boot<br>
&gt; mechanism is based on the frequently used u-boot, the binary is locate=
d in RO memory. Fortunately, a chained u-boot<br>
&gt; mechanism can be used (i.e. starting another u-boot after the original=
). We can then enter hypervisor mode from our<br>
&gt; custom iteration of u-boot and subsequently load our kernel and usersp=
ace.<br>
&gt; <br>
&gt; So,the first u-boot is the u-boot provided by virtual open systems,tha=
t&#39;s able to chainload the &quot;u-boot binary located in<br>
&gt; RO memory&quot; , that does not boot Chrome OS in hypervisor mode. We =
don&#39;t need it if we want to boot Linux with kvm or xen<br>
&gt; enabled.<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Dec 17, 2023 at 1:28=E2=80=AFAM Stanislav Silnicki &lt;<a href=
=3D"mailto:stanislav.silnicki@mailgate.us" target=3D"_blank">stanislav.siln=
icki@mailgate.us</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;m not an expert in the topic, I only k=
now, that ARM has divided hardware into two worlds - Secure and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Not-So, strictly limiting any software, runn=
ing in non-secure world with access to functions and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0resources.=C2=A0<a href=3D"https://developer=
.arm.com/documentation/den0013/d/Security/TrustZone-hardware-architecture?l=
ang=3Den" rel=3D"noreferrer" target=3D"_blank">https://developer.arm.com/do=
cumentation/den0013/d/Security/TrustZone-hardware-architecture?lang=3Den</a=
><br>
&gt; <br>
&gt; I&#39;m not sure, that I&#39;m getting you right, as I don&#39;t under=
stand what you mean under &quot;the first u-boot&quot;.<br>
&gt; <br>
&gt; As I understand, virtualization (HYP) is running in non-secure world(<=
a href=3D"https://developer.arm.com/documentation/ddi0406/c/System-Level-Ar=
chitecture/The-System-Level-Programmers--Model/The-Virtualization-Extens" r=
el=3D"noreferrer" target=3D"_blank">https://developer.arm.com/documentation=
/ddi0406/c/System-Level-Architecture/The-System-Level-Programmers--Model/Th=
e-Virtualization-Extens</a><br>
&gt; ions), so my guess (only guess!!!), virtualization software has to pre=
pare (configure) HW platform in the way,<br>
&gt; that FreeBSD kernel will not lack any resources, required to configure=
 MPU, VA, etc.<br>
&gt; So, if you lucky to boot virtualizer, which is aware of target OS, tha=
t maybe you can boot the kernel. Although, I<br>
&gt; doubt, that you need to boot &#39;second&#39; u-boot to boot the kerne=
l - there is simply ubldr, which you can hook somehow<br>
&gt; from virtualizer....<br>
&gt; <br>
&gt; Stan<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Mario Marietto wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0---&gt; As I understand, it makes sure that =
u-boot keeps in secure mode during boot and passes control to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ubldr, which boots FreeBSD kernel, in that m=
ode.<br>
&gt; <br>
&gt; Can you elaborate your sentence more ? I know that the bootloader secu=
re mode is bypassed by the virtual open<br>
&gt; systems u-boot. Are you saying that when the control passes to the sec=
ond u-boot,it will happen in secure<br>
&gt; mode,so that the bypass that happened loading the first u-boot,is annu=
lled ? If this is true,maybe can I boot<br>
&gt; FreeBSD using the virtual-open-system custom u-boot ? Is this compatib=
le with FreeBSD ? Where can I find the<br>
&gt; u-boot.bin that the xen developer talked about ? thanks bro&#39;.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Sun, Dec 17, 2023 at 12:35=E2=80=AFAM Stanislav Silnicki &lt;<a hre=
f=3D"mailto:stanislav.silnicki@mailgate.us" target=3D"_blank">stanislav.sil=
nicki@mailgate.us</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Mario,<br>
&gt; <br>
&gt; U-Boot=C2=A0 beast is hiding in this den: <a href=3D"https://source.de=
nx.de/u-boot/u-boot.git" rel=3D"noreferrer" target=3D"_blank">https://sourc=
e.denx.de/u-boot/u-boot.git</a><br>
&gt; I took a brief look at your post and it seems to me, that option=C2=A0=
CONFIG_CMO_BY_VA_ONLY=C2=A0is irrelevant to<br>
&gt; your target armv7 32 bit<br>
&gt; platform:=C2=A0<a href=3D"https://source.denx.de/u-boot/u-boot/-/blob/=
master/arch/arm/cpu/armv8/Kconfig?ref_type=3Dheads#L3" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.denx.de/u-boot/u-boot/-/blob/master/arch/ar=
m/cpu/armv8/Kconfig?ref_type=3Dheads#L3</a><br>
&gt; <br>
&gt; As for compiling the u-boot, it is a doable task, given that you under=
stand what you are doing. There<br>
&gt; are no specific options in u-boot devoted to FreeBSD. It is a boot loa=
der, whose mission to make basic<br>
&gt; hardware initialization, read you kernel file from some media into RAM=
 and then pass it control.<br>
&gt; <br>
&gt; Basically, you can grab some defconfig, prepared for any other Exynos5=
250 based board=C2=A0 (say, this one:<br>
&gt; <a href=3D"https://source.denx.de/u-boot/u-boot/-/blob/master/configs/=
arndale_defconfig?ref_type=3Dheads" rel=3D"noreferrer" target=3D"_blank">ht=
tps://source.denx.de/u-boot/u-boot/-/blob/master/configs/arndale_defconfig?=
ref_type=3Dheads</a>) and adopt<br>
&gt; it somehow.<br>
&gt; <br>
&gt; As per my experience, you have to respect these two options, compiling=
 u-boot for<br>
&gt; FreeBSD:=C2=A0<a href=3D"https://github.com/freebsd/freebsd-ports/blob=
/main/sysutils/u-boot-master/files/FreeBSD_Fragment" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/freebsd/freebsd-ports/blob/main/sysutils/=
u-boot-master/files/FreeBSD_Fragment</a><br>
&gt; <br>
&gt; As I understand, it makes sure, that u-boot keeps in secure mode durin=
g boot and passes control to<br>
&gt; ubldr, which boots FreBSD kernel, in that mode. Otherwise, there a lot=
 of surprises you may realize.<br>
&gt; <br>
&gt; Hope, this will help to progress you tasks<br>
&gt; Stan<br>
&gt; <br>
&gt; Mario Marietto wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hello.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;m trying to boot FreeBSD for arm32 bit=
 as DomU on my ARM Chromebook. Basically there are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0two ways to accomplish this task :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01) to write a patch that allows the FreeBSD =
kernel to boot as a zImage file. This could be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0accomplished applying this patch to a specif=
ic file that&#39;s on the source code of FreeBSD :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/gitweb/?p=
=3Dp...8;hb=3D0782e25d98cc1391472717035f986c979edef0c9" rel=3D"noreferrer" =
target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dp...8;hb=3D0782e25d98=
cc1391472717035f986c979edef0c9</a><br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This patch was written by Julien Grall a lot=
 of time ago and now it does not work anymore.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is the reason :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It appears FreeBSD-CURR=
ENT removed the last step converting the kernel file to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel.bin. The patch c=
an be readily rebased, but without kernel.bin that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doesn&#39;t do too much=
.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; So,without a rebase of that patch the first option is not applicable. =
And I&#39;m not able to fix it.<br>
&gt; <br>
&gt; 2) booting FreeBSD using U-Boot,as explained to me by a xen developer =
:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I was trying to explain why and how Julien&#=
39;s patch works so that you could be the one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to re-do something similar or fix the patch =
on the FreeBSD kernel that you are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0working with. I am happy to help review and =
write patches but I don&#39;t work with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0FreeBSD kernel so I wouldn&#39;t be able to =
help you quickly. However, I might have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0suggestion. Do you know if FreeBSD can be bo=
oted by U-Boot ? Because U-Boot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0definitely boots as Xen on ARM guest firmwar=
e/bootloader. You should be able to build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0U-Boot and use the U-Boot binary as Xen gues=
t kernel, then U-Boot could load FreeBSD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0from disk or network and start it. For insta=
nce as domU config file:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel=3D&quot;/home/petalinux/u-boot.bin&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disk =3D [ &#39;/home/petalinux/test.img,raw=
,xvda&#39; ]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I know it is important to build u-boot with =
the following config to make it work on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Xen.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_CMO_BY_VA_ONLY=3Dy<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; This option seems more doable to me according to my knowledge. But I n=
eed to understand how to do<br>
&gt; it.<br>
&gt; <br>
&gt; Well,let&#39;s say that on the ARM Chromebook I&#39;m forced to use an=
d install a customized version of<br>
&gt; u-boot,created by virtual open systems,because it is the only one that=
 allows bypassing its<br>
&gt; bootloader protection. You can find more information here :<br>
&gt; <br>
&gt; <a href=3D"http://www.virtualopensystems.com/en/solutions/guides/kvm-o=
n-chromebook/?vos=3Dtech" rel=3D"noreferrer" target=3D"_blank">http://www.v=
irtualopensystems.com/en/solutions/guides/kvm-on-chromebook/?vos=3Dtech</a>=
<br>
&gt; <br>
&gt; This is the relevant section to read :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Bootloader :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If you wish to skip this chapter you can dow=
nload a pre-compiled binary of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootloader:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ wget<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.virtualopensystems.com=
/downloads/guides/kvm_on_chromebook/nv_u-boot-snow.kpart" rel=3D"noreferrer=
" target=3D"_blank">http://www.virtualopensystems.com/downloads/guides/kvm_=
on_chromebook/nv_u-boot-snow.kpart</a><br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0To be able to run KVM on ARM platforms, the =
kernel has to be booted in hypervisor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mode. Because of this relatively recent requ=
irement (due to the introduction of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtualization extensions), up until now all=
 booting methods would boot the kernel in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the standard Supervisor mode. For the ARM Ch=
romebook the default boot procedure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0doesn&#39;t allow us to boot in hypervisor m=
ode. Although the laptop&#39;s boot mechanism is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0based on the frequently used u-boot, the bin=
ary is located in RO memory. Fortunately,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a chained u-boot mechanism can be used (i.e.=
 starting another u-boot after the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0original). We can then enter hypervisor mode=
 from our custom iteration of u-boot and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0subsequently load our kernel and userspace.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Checkout the needed u-boot code :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ git clone git://<a href=3D"http://github.c=
om/virtualopensystems/u-boot.git$" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/virtualopensystems/u-boot.git$</a> cd u-boot$<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0./scripts/build.sh<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If successful, a message about how to copy t=
he bootloader on the USB flash disk or SD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0card will appear. We will use it later when =
preparing the boot medium to start our<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0system. If you have followed the Setting up =
the boot medium chapter and you have a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0prepared boot device, then you can update u-=
boot by running :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo dd if=3Dnv_uboot-snow.kpart of=3D/dev=
/sdX1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; so,the needed u-boot that we must use should be installed on the first=
 partition of the sd card.<br>
&gt; <br>
&gt; There is another relevant section to read :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Setting up the boot medium<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Now it is time to copy all the relevant file=
s that we created in the previous<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chapters,and use them to boot Chromebook wit=
h a different kernel and OS. In all these<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0examples the device /dev/sdX is used. Take e=
xtra care to change the examples to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0device that you have attached. Insert the bo=
ot medium on your workstation and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0carefully execute the following step. First =
we need to properly format the boot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0medium.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0In the uboot source directory :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo ./scripts/sdcard.sh /dev/sdX<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This will erase all data and create 4 partit=
ions in the medium, along with copying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the u-boot binary to the first partition:<br=
>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Partition 1 =3D ChromeOS signed binary (V.O.=
S chained u-boot)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Partition 2 =3D not used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Partition 3 =3D EXT2 partition for u-boot fi=
les (uImage and exynos5250-snow.dtb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Partition 4 =3D EXT4 partition for userspace=
 files<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0With u-boot being copied, next is the kernel=
 image and DTB file. From the kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source execute :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ mkdir ../mnt/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo mount /dev/sdX3 ../mnt/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo cp arch/arm/boot/uImage ../mnt/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo cp arch/arm/boot/dts/exynos5250-snow.=
dtb ../mnt/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo umount /dev/sdX3<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Finally, we have to copy the Ubuntu userspac=
e filesystem that we created earlier:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$ sudo mount /dev/sdX4 mnt/$ sudo cp -a ./pr=
ecise/* mnt/$ sudo umount /dev/sdX4<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Now,my idea is to chainload the already chain loaded u-boot created by=
 V.O.S to the new u-boot<br>
&gt; that we need for booting FreeBSD and that can be installed in the part=
ition n.2,as shown in this<br>
&gt; scheme,because it is not used :<br>
&gt; <br>
&gt; <br>
&gt; Partition 1 =3D ChromeOS signed binary (V.O.S chained u-boot)<br>
&gt; Partition 2 =3D not used (maybe we can install the u-boot for arm 32 b=
it,compatible with FreeBSD on<br>
&gt; this partition)<br>
&gt; Partition 3 =3D EXT2 partition for u-boot files (uImage and exynos5250=
-snow.dtb)<br>
&gt; Partition 4 =3D EXT4 partition for userspace files<br>
&gt; <br>
&gt; <br>
&gt; Take in consideration that default boot string is hardcoded here,in th=
e snow.h file of the custom<br>
&gt; u-boot created by VOS :<br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"https://github.com/virtualopensyste...18a39b6c177dff58a/inc=
lude/configs/snow.h#L101" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/virtualopensyste...18a39b6c177dff58a/include/configs/snow.h#L101</a>=
<br>
&gt; <br>
&gt; <br>
&gt; and it needs to be recompiled because it should point to the partition=
 n.2,where I will install<br>
&gt; the u-boot files as explained here :<br>
&gt; <br>
&gt; <br>
&gt; <a href=3D"https://wiki.freebsd.org/arm/Chromebook" rel=3D"noreferrer"=
 target=3D"_blank">https://wiki.freebsd.org/arm/Chromebook</a><br>
&gt; <br>
&gt; <br>
&gt; I have some questions to ask before I start working on this.<br>
&gt; <br>
&gt; 1) The xen developer said :<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0You should be able to build U-Boot and use t=
he U-Boot binary as Xen guest kernel...<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; where is the u-boot binary,according to this document ?<br>
&gt; <br>
&gt; <a href=3D"https://wiki.freebsd.org/arm/Chromebook" rel=3D"noreferrer"=
 target=3D"_blank">https://wiki.freebsd.org/arm/Chromebook</a><br>
&gt; <br>
&gt; I don&#39;t see it.<br>
&gt; <br>
&gt; <br>
&gt; 2) where is the source code of the file that I can get here :<br>
&gt; <br>
&gt; <a href=3D"http://commondatastorage.googleapis.com/chromeos-localmirro=
r/distfiles/nv_uboot-snow-simplefb.kpart.bz2" rel=3D"noreferrer" target=3D"=
_blank">http://commondatastorage.googleapis.com/chromeos-localmirror/distfi=
les/nv_uboot-snow-simplefb.kpart.bz2</a><br>
&gt; <br>
&gt; I need the source code if I want to recompile u-boot so that it can po=
int to the partition 4.<br>
&gt; <br>
&gt; Maybe it can be found on this link :<br>
&gt; <br>
&gt; <a href=3D"http://linux-exynos.org/dist/chromebook/nv_uboot/" rel=3D"n=
oreferrer" target=3D"_blank">http://linux-exynos.org/dist/chromebook/nv_ubo=
ot/</a><br>
&gt; <br>
&gt; but it can&#39;t be opened....<br>
&gt; <br>
&gt; <br>
&gt; 3) in this specific scenario the source code of u-boot should run on a=
rm 32 bit,not on arm<br>
&gt; 64,because I have the Samsung Chromebook &quot;SNOW&quot; model XE303C=
12,that&#39;s powered by a Samsung Exynos<br>
&gt; 5250 (ARMv7 32 bit Cortex A15) Soc.<br>
&gt; <br>
&gt; <br>
&gt; 4) I&#39;m not sure if I can chainload the customized u-boot created b=
y V.O.S that should be<br>
&gt; installed on the first partition with the u-boot tailored for booting =
FreeBSD that should be<br>
&gt; installed on the partition 2....<br>
&gt; <br>
&gt; <br>
&gt; 5) the xen developer said that u-boot should be compiled enabling this=
 option :<br>
&gt; <br>
&gt; <br>
&gt; Code:<br>
&gt; <br>
&gt; CONFIG_CMO_BY_VA_ONLY=3Dy<br>
&gt; <br>
&gt; <br>
&gt; Well,can you provide some good source that can help me to understand h=
ow I can recompile u-boot<br>
&gt; for FreeBSD ? thanks.<br>
&gt; <br>
&gt; --<br>
&gt; Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Mario.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Mario.<br>
&gt; <br>
&gt; </blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signatur=
e_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<b=
r></div>

--000000000000dc1fa1060ce45558--


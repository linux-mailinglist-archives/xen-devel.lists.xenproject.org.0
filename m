Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE95573772
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 15:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366589.597513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBcTT-000247-P9; Wed, 13 Jul 2022 13:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366589.597513; Wed, 13 Jul 2022 13:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBcTT-00021U-Lp; Wed, 13 Jul 2022 13:32:19 +0000
Received: by outflank-mailman (input) for mailman id 366589;
 Wed, 13 Jul 2022 13:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dsPN=XS=cachengo.com=brad@srs-se1.protection.inumbo.net>)
 id 1oBcTR-00021O-Ad
 for xen-devel@lists.xen.org; Wed, 13 Jul 2022 13:32:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3530b702-02b0-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 15:32:15 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id e15so14122886edj.2
 for <xen-devel@lists.xen.org>; Wed, 13 Jul 2022 06:32:15 -0700 (PDT)
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
X-Inumbo-ID: 3530b702-02b0-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cachengo.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ig3WjwMZfKUi3vc5J65h6U8WT2JkP23SC5xNpqH5mXA=;
        b=pK2Zd7hNn8yr+kPQGNmEep1zpuqzN61Tdli7XpjlpLe/0Jpkpka/JjN37uncBfRwrT
         +4vKTY2o0xSt2i71QKlwhxuw9uKCwy5AXhho4O0wKjyX7gPxaHJHiVQFlAO4S7WNnbtH
         mIcdg7Gv7YhJODWVtyyM34B7ztIdgSJudG9/kHRT4NfgiF1M28ZdijukD5I+tduxi8AM
         n+sB6krmaxwGxu0TSGWB3kFqruP42wWlc5/zszIcDET5JbHzLhhi5GrRjWCgWznDWhGV
         yo/uYyECSPjzvJ9yjdWH7lDt2n2fKTSpy9yTswoGGqfvipgj8FcqxmukjXQSGMJ6AZs0
         3T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ig3WjwMZfKUi3vc5J65h6U8WT2JkP23SC5xNpqH5mXA=;
        b=LfS4Dbgrrir2wr9IO7+SCscF9gKFeP04EDSHIVC9o8FlPaOZXjhE1VCE13KtJXKYob
         ElyM+m7OsXCFi7N3Wh/FAkEFp9lg8JpIaMKKmGG54CtdqgP+pULPtDgK2GXFxA4KaJGk
         vui8Z5PZTmPpfJMc89dHm1Lj05n++LcXEVJRSr4bJ3Mh1EeJyb4j+HrjA7QEzmPHpqPH
         ZSWte3nqqz1Cj0WXM3QwNUgOQHJ4ysV2Bg9k/C3feNd8IClQCU3dkO73nulgXMDdG33a
         By/x30xQgmyzG1l5j1dop+zRyUmnTD3GswMonCX7tuF566JscZSDObgtRSaKvoZmZsIt
         jYTg==
X-Gm-Message-State: AJIora/VQDtelXt0JgVcktmjwh98WQEiJ10WN42lrMiLc5qh37hTbQDH
	7QJaSFlNRe8APs1QEgeKQj++iKjL0LdC/kM+YGhhdSYVVvAn3Q==
X-Google-Smtp-Source: AGRyM1vuBWeEfmMXQT/5C1ME06+p3Y6hqjHJnpI2/kHL4gQloy0fSCCbMlr1rr42jCeI2ch5JFOZdMoTweTQ9d0gig0=
X-Received: by 2002:a05:6402:3290:b0:43a:86c4:af70 with SMTP id
 f16-20020a056402329000b0043a86c4af70mr4778668eda.313.1657719134248; Wed, 13
 Jul 2022 06:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com> <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
 <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com> <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
 <81265FD0-2D00-48D7-ACBA-0F7A4FF3DCAA@arm.com>
In-Reply-To: <81265FD0-2D00-48D7-ACBA-0F7A4FF3DCAA@arm.com>
From: Brad Churchwell <brad@cachengo.com>
Date: Wed, 13 Jul 2022 08:32:02 -0500
Message-ID: <CAMdBLPO8YZbti9x-w2WEm-s8LTUmQPLJmZRsHStGTGCHFjPrFQ@mail.gmail.com>
Subject: Re: Xen on rk3399
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="00000000000022749805e3afd07e"

--00000000000022749805e3afd07e
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

I did this yesterday and it does indeed silence the warnings saying to
disable those cores, however the IRQ errors still remain.

I think I made some progress by changing "interrupts = <GIC_PPI 9
IRQ_TYPE_LEVEL_HIGH 0>;" to "interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH
0>;". I noticed when trying to use XEN-4.10 that it said "IRQ only through
SPI" and failed to boot XEN where 4.17 unstable boots without this error.
Now that I changed GIC_PPI to GIC_SPI, I get the following output:
zaku => run boot_pci_enum; run nvme_init; fatload nvme 0:1 0x02000000
xen4.10-uImage; fatload nvme 0:1 0x01f00000 rk3399-zaku.dtb; fatload nvme
0:1 0x03F80000 Image;fatload nvme 0:1 0
885136 bytes read in 5 ms (168.8 MiB/s)
56185 bytes read in 3 ms (17.9 MiB/s)
27885576 bytes read in 65 ms (409.1 MiB/s)
8674182 bytes read in 22 ms (376 MiB/s)
## Booting kernel from Legacy Image at 02000000 ...
   Image Name:
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    885072 Bytes = 864.3 KiB
   Load Address: 02000000
   Entry Point:  02000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 01f00000
   Booting using the fdt blob at 0x1f00000
   Loading Kernel Image
   Loading Device Tree to 00000000f1efd000, end 00000000f1f0db78 ... OK

Starting kernel ...

- UART enabled -
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000000200000 - 00000000f7ffffff
(XEN)
(XEN) MODULE[0]: 00000000f1efd000 - 00000000f1f0b000 Device Tree
(XEN) MODULE[1]: 0000000003f80000 - 0000000005a28008 Kernel
(XEN) MODULE[2]: 0000000006000000 - 0000000008000000 Ramdisk
(XEN)
(XEN) Command line: <NULL>
(XEN) Placing Xen at 0x00000000f7e00000-0x00000000f8000000
(XEN) Update BOOTMOD_XEN from 0000000002000000-0000000002120d81 =>
00000000f7e00000-00000000f7f20d81
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Taking dtuart configuration from /chosen/stdout-path
(XEN) Looking for dtuart at "serial2", options "1500000n8"
 Xen 4.10.1
(XEN) Xen version 4.10.1 (root@) (aarch64-linux-gnu-gcc (Linaro GCC
7.3-2018.05) 7.3.1 20180425 [linaro-7.3-2018.05 revision
d29120a424ecfbc167ef90065c0eeb7f91977701]) debug=y  Tue J2
(XEN) Latest ChangeSet:
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000001002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:10011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v1.0
(XEN) SMP: Allowing 4 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 24000 KHz
(XEN) GICv3 initialization:
(XEN)       gic_dist_addr=0x000000fee00000
(XEN)       gic_maintenance_irq=41
(XEN)       gic_rdist_stride=0
(XEN)       gic_rdist_regions=1
(XEN)       redistributor regions:
(XEN)         - region 0: 0x000000fef00000 - 0x000000fefc0000
(XEN) GICv3 compatible with GICv2 cbase 0x000000fff00000 vbase
0x000000fff20000
(XEN) GICv3: 288 lines, (IID 0001143b).
(XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 32 KiB.
(XEN) Bringing up CPU1
- CPU 00000001 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) GICv3: CPU1: Found redistributor in region 0 @000000004003c000
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 00000002 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) GICv3: CPU2: Found redistributor in region 0 @000000004005c000
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
- CPU 00000003 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) GICv3: CPU3: Found redistributor in region 0 @000000004007c000
(XEN) CPU 3 booted.
(XEN) Brought up 4 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: b7279757e82e3e9ea4c4115dabdbfe25d56d762b
(XEN) alternatives: Patching with alt table 000000004018fe70 ->
0000000040190350
(XEN) grant_table.c:1731:IDLEv0 Expanding d0 grant table from 0 to 1 frames
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 0000000003f80000
(XEN) Loading ramdisk from boot module @ 0000000006000000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x00000020000000-0x00000040000000 (512MB)
(XEN) Grant table range: 0x000000f7e00000-0x000000f7e40000
(XEN) IRQ 41 is already used by Xen
(XEN) Unable to map IRQ41 to dom0
(XEN) Device tree generation failed (-16).
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not set up DOM0 guest OS
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

It looks like XEN is now using the interrupt controller but there are
conflicts. I was able to get this error to change to "Unable to map IRQ43
to dom0" by changing all instances of "IRQ_TYPE_LEVEL_HIGH " to
"IRQ_TYPE_LEVEL_LOW", but I can't get any further. I made sure that there
was nothing in the device tree that is obviously using IRQ 43 as well.

Any thoughts on this?

Cheers,
Brad


On Wed, Jul 13, 2022, 8:00 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Brad
>
> > On 12 Jul 2022, at 17:24, Brad Churchwell <brad@cachengo.com> wrote:
> >
> > Hi Bertrand,
> >
> > I believe I understand, but just to clarify, should I leave the
> ppi-partitions block in rk3399.dtsi as is and disable the little cores, or
> should I also modify that block?
>
> Disable the little cores and remove the partitions.
>
> Cheers
> Bertrand
>
> >
> > Brad
> >
> > On Tue, Jul 12, 2022 at 11:11 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > Hi Brad,
> >
> > > On 12 Jul 2022, at 16:59, Brad Churchwell <brad@cachengo.com> wrote:
> > >
> > > Hi Bertrand,
> > >
> > > Thanks so much for the quick response!
> > >
> > > I should have mentioned previously that this device tree and kernel
> Image (5.15.16) does boot properly with the rootfs without XEN. The
> interrupt errors are only present when booting with XEN.
> > >
> > > These are custom boards and they do have usb c, however we are unable
> to boot from usb as it doesn't receive power.  We currently only use the
> usb to flash u-boot to spi which requires us to use a separate power
> adapter. These boards get power and networking through a custom backplane
> and interface with the backplane via a sata style justice (I'm not sure
> what the proper terminology would be here).
> > >
> > > Since I cannot boot to rootfs with XEN, I'm unable to show the device
> tree there. The only bit that I added to accommodate XEN is this bit here:
> > >
> > > chosen {
> > >     stdout-path = "serial2:1500000n8";
> > >     bootargs = "hmp-unsafe=true";
> > >     xen,dom0-bootargs = "console=hvc0 earlyprintk=xen
> clk_ignore_unused root=/dev/nvme0n1p2 rw init=/sbin/init rootwait
> rootfstype=ext4 ignore_loglevel";
> > >     modules {
> > >         #address-cells = <2>;
> > >         #size-cells = <2>;
> > >
> > >         module@1 {
> > >             compatible = "xen,linux-zimage", "xen,multiboot-module";
> > >             reg = <0x0 0x03F80000 0x0 0x01aa8008>;
> > >         };
> > >         module@2 {
> > >             compatible = "xen,linux-initrd", "xen,multiboot-module";
> > >             reg = <0x0 0x06000000 0x0 0x02000000>;
> > >         };
> > >     };
> > >
> > > };
> > >
> > > The gic declaration is in the vanilla rk3399.dtsi file and hasn't been
> modified:
> > >
> > >         gic: interrupt-controller@fee00000 {
> > >                 compatible = "arm,gic-v3";
> > >                 #interrupt-cells = <4>;
> > >                 #address-cells = <2>;
> > >                 #size-cells = <2>;
> > >                 ranges;
> > >                 interrupt-controller;
> > >
> > >                 reg = <0x0 0xfee00000 0 0x10000>, /* GICD */
> > >                       <0x0 0xfef00000 0 0xc0000>, /* GICR */
> > >                       <0x0 0xfff00000 0 0x10000>, /* GICC */
> > >                       <0x0 0xfff10000 0 0x10000>, /* GICH */
> > >                       <0x0 0xfff20000 0 0x10000>; /* GICV */
> > >                 interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> > >                 its: interrupt-controller@fee20000 {
> > >                         compatible = "arm,gic-v3-its";
> > >                         msi-controller;
> > >                         #msi-cells = <1>;
> > >                         reg = <0x0 0xfee20000 0x0 0x20000>;
> > >                 };
> > >
> > >                 ppi-partitions {
> > >                         ppi_cluster0: interrupt-partition-0 {
> > >                                 affinity = <&cpu_l0 &cpu_l1 &cpu_l2
> &cpu_l3>;
> > >                         };
> > >
> > >                         ppi_cluster1: interrupt-partition-1 {
> > >                                 affinity = <&cpu_b0 &cpu_b1>;
> > >                         };
> > >                 };
> >
> > Xen is not supporting PPI partitions.
> > I also saw that your booting using SMP unsafe so all core are enabled by
> Xen.
> >
> > Right now big/little is not supported by Xen and here you might have
> some interrupts in your system which can only occur on some specific cores.
> > I would suggest to try the following:
> > - only boot enable in your dtb the cores with the same type than the
> boot core
> > - check in your device tree which devices are assign to the ppi_cluster
> not available and disable them
> >
> > This kind of configuration will be tricky to handle so it will depend on
> which devices have interrupts that can only be fired on one cluster type.
> >
> > Sorry but I cannot right now check in the device tree and do those
> checks myself but if you do get the idea send back a mail :-)
> >
> > Cheers
> > Bertrand
> >
> > >         };
> > >
> > > I've attached the device tree and include files just in case you'd
> like to take a look at those.
> > >
> > > Thanks so much for your help! I've been at this for weeks with very
> little progress.
> > >
> > > Cheers,
> > > Brad
> > >
> > >
> > > On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > > Hi Brad,
> > >
> > > > On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > I've been trying to get Xen to boot dom0 with my kernel for weeks on
> an rk3399 based board and thought I'd reach out for help. It looks like
> either Xen is not properly recreating the device tree or the interrupt
> controller is just failing. The hypervisor boots but falls to initramfs
> because it cannot find the root device (nvme on pcie). Any help would be
> greatly appreciated. Here is the complete boot log
> > >
> > > From the logs you have an issue with the interrupt controller and the
> fact that your NVME is behind PCIE and as such depends on ITS is probably
> not helping.
> > >
> > > I would suggest to try to boot on usb as root fs for a try.
> > >
> > > Also it could be useful to compare the device tree on xen and without
> xen to understand what is going on (using /proc/device-tree).
> > >
> > > Xen seems to be ok but Linux is not happy with interrupts and is
> showing several issues around this area on your logs.
> > > Could you show us an extract of your device tree around the gic
> declaration ?
> > >
> > > Cheers
> > > Bertrand
> > >
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> > > <rk3399-zaku.dts><rk3399-zaku.dtsi><rk3399.dtsi>
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>

--00000000000022749805e3afd07e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Bertrand,<div dir=3D"auto"><br></div>=
<div dir=3D"auto">I did this yesterday and it does indeed silence the warni=
ngs saying to disable those cores, however the IRQ errors still remain.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think I made some =
progress by changing &quot;interrupts =3D &lt;GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH=
 0&gt;;&quot; to &quot;interrupts =3D &lt;GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0&g=
t;;&quot;. I noticed when trying to use XEN-4.10 that it said &quot;IRQ onl=
y through SPI&quot; and failed to boot XEN where 4.17 unstable=C2=A0boots w=
ithout this error. Now that I changed GIC_PPI to GIC_SPI, I get the followi=
ng output:</div><div dir=3D"auto">zaku =3D&gt; run boot_pci_enum; run nvme_=
init; fatload nvme 0:1 0x02000000 xen4.10-uImage; fatload nvme 0:1 0x01f000=
00 rk3399-zaku.dtb; fatload nvme 0:1 0x03F80000 Image;fatload nvme 0:1 0<br=
>885136 bytes read in 5 ms (168.8 MiB/s)<br>56185 bytes read in 3 ms (17.9 =
MiB/s)<br>27885576 bytes read in 65 ms (409.1 MiB/s)<br>8674182 bytes read =
in 22 ms (376 MiB/s)<br>## Booting kernel from Legacy Image at 02000000 ...=
<br>=C2=A0 =C2=A0Image Name: =C2=A0 <br>=C2=A0 =C2=A0Image Type: =C2=A0 AAr=
ch64 Linux Kernel Image (uncompressed)<br>=C2=A0 =C2=A0Data Size: =C2=A0 =
=C2=A0885072 Bytes =3D 864.3 KiB<br>=C2=A0 =C2=A0Load Address: 02000000<br>=
=C2=A0 =C2=A0Entry Point: =C2=A002000000<br>=C2=A0 =C2=A0Verifying Checksum=
 ... OK<br>## Flattened Device Tree blob at 01f00000<br>=C2=A0 =C2=A0Bootin=
g using the fdt blob at 0x1f00000<br>=C2=A0 =C2=A0Loading Kernel Image<br>=
=C2=A0 =C2=A0Loading Device Tree to 00000000f1efd000, end 00000000f1f0db78 =
... OK<br><br>Starting kernel ...<br><br>- UART enabled -<br>- CPU 00000000=
 booting -<br>- Current EL 00000008 -<br>- Xen starting at EL2 -<br>- Zero =
BSS -<br>- Setting up control registers -<br>- Turning on paging -<br>- Rea=
dy -<br>(XEN) Checking for initrd in /chosen<br>(XEN) RAM: 0000000000200000=
 - 00000000f7ffffff<br>(XEN) <br>(XEN) MODULE[0]: 00000000f1efd000 - 000000=
00f1f0b000 Device Tree =C2=A0<br>(XEN) MODULE[1]: 0000000003f80000 - 000000=
0005a28008 Kernel =C2=A0 =C2=A0 =C2=A0 <br>(XEN) MODULE[2]: 000000000600000=
0 - 0000000008000000 Ramdisk =C2=A0 =C2=A0 =C2=A0<br>(XEN) <br>(XEN) Comman=
d line: &lt;NULL&gt;<br>(XEN) Placing Xen at 0x00000000f7e00000-0x00000000f=
8000000<br>(XEN) Update BOOTMOD_XEN from 0000000002000000-0000000002120d81 =
=3D&gt; 00000000f7e00000-00000000f7f20d81<br>(XEN) Domain heap initialised<=
br>(XEN) Booting using Device Tree<br>(XEN) Platform: Generic System<br>(XE=
N) Taking dtuart configuration from /chosen/stdout-path<br>(XEN) Looking fo=
r dtuart at &quot;serial2&quot;, options &quot;1500000n8&quot;<br>=C2=A0Xen=
 4.10.1<br>(XEN) Xen version 4.10.1 (root@) (aarch64-linux-gnu-gcc (Linaro =
GCC 7.3-2018.05) 7.3.1 20180425 [linaro-7.3-2018.05 revision d29120a424ecfb=
c167ef90065c0eeb7f91977701]) debug=3Dy =C2=A0Tue J2<br>(XEN) Latest ChangeS=
et: <br>(XEN) Processor: 410fd034: &quot;ARM Limited&quot;, variant: 0x0, p=
art 0xd03, rev 0x4<br>(XEN) 64-bit Execution:<br>(XEN) =C2=A0 Processor Fea=
tures: 0000000001002222 0000000000000000<br>(XEN) =C2=A0 =C2=A0 Exception L=
evels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32<br>(XEN) =C2=A0 =C2=A0 Exten=
sions: FloatingPoint AdvancedSIMD GICv3-SysReg<br>(XEN) =C2=A0 Debug Featur=
es: 0000000010305106 0000000000000000<br>(XEN) =C2=A0 Auxiliary Features: 0=
000000000000000 0000000000000000<br>(XEN) =C2=A0 Memory Model Features: 000=
0000000001122 0000000000000000<br>(XEN) =C2=A0 ISA Features: =C2=A000000000=
00011120 0000000000000000<br>(XEN) 32-bit Execution:<br>(XEN) =C2=A0 Proces=
sor Features: 00000131:10011011<br>(XEN) =C2=A0 =C2=A0 Instruction Sets: AA=
rch32 A32 Thumb Thumb-2 Jazelle<br>(XEN) =C2=A0 =C2=A0 Extensions: GenericT=
imer Security<br>(XEN) =C2=A0 Debug Features: 03010066<br>(XEN) =C2=A0 Auxi=
liary Features: 00000000<br>(XEN) =C2=A0 Memory Model Features: 10201105 40=
000000 01260000 02102211<br>(XEN) =C2=A0ISA Features: 02101110 13112111 212=
32042 01112131 00011142 00011121<br>(XEN) Using SMC Calling Convention v1.0=
<br>(XEN) Using PSCI v1.0<br>(XEN) SMP: Allowing 4 CPUs<br>(XEN) Generic Ti=
mer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 24000 KHz<br>(XEN) GICv3 initia=
lization:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 gic_dist_addr=3D0x000000fee00000<br=
>(XEN) =C2=A0 =C2=A0 =C2=A0 gic_maintenance_irq=3D41<br>(XEN) =C2=A0 =C2=A0=
 =C2=A0 gic_rdist_stride=3D0<br>(XEN) =C2=A0 =C2=A0 =C2=A0 gic_rdist_region=
s=3D1<br>(XEN) =C2=A0 =C2=A0 =C2=A0 redistributor regions:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 - region 0: 0x000000fef00000 - 0x000000fefc0000<br>(XE=
N) GICv3 compatible with GICv2 cbase 0x000000fff00000 vbase 0x000000fff2000=
0<br>(XEN) GICv3: 288 lines, (IID 0001143b).<br>(XEN) GICv3: CPU0: Found re=
distributor in region 0 @000000004001c000<br>(XEN) Using scheduler: SMP Cre=
dit Scheduler (credit)<br>(XEN) Allocated console ring of 32 KiB.<br>(XEN) =
Bringing up CPU1<br>- CPU 00000001 booting -<br>- Current EL 00000008 -<br>=
- Xen starting at EL2 -<br>- Setting up control registers -<br>- Turning on=
 paging -<br>- Ready -<br>(XEN) GICv3: CPU1: Found redistributor in region =
0 @000000004003c000<br>(XEN) CPU 1 booted.<br>(XEN) Bringing up CPU2<br>- C=
PU 00000002 booting -<br>- Current EL 00000008 -<br>- Xen starting at EL2 -=
<br>- Setting up control registers -<br>- Turning on paging -<br>- Ready -<=
br>(XEN) GICv3: CPU2: Found redistributor in region 0 @000000004005c000<br>=
(XEN) CPU 2 booted.<br>(XEN) Bringing up CPU3<br>- CPU 00000003 booting -<b=
r>- Current EL 00000008 -<br>- Xen starting at EL2 -<br>- Setting up contro=
l registers -<br>- Turning on paging -<br>- Ready -<br>(XEN) GICv3: CPU3: F=
ound redistributor in region 0 @000000004007c000<br>(XEN) CPU 3 booted.<br>=
(XEN) Brought up 4 CPUs<br>(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit V=
MID<br>(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558<br>(XEN) I/O =
virtualisation disabled<br>(XEN) build-id: b7279757e82e3e9ea4c4115dabdbfe25=
d56d762b<br>(XEN) alternatives: Patching with alt table 000000004018fe70 -&=
gt; 0000000040190350<br>(XEN) grant_table.c:1731:IDLEv0 Expanding d0 grant =
table from 0 to 1 frames<br>(XEN) *** LOADING DOMAIN 0 ***<br>(XEN) Loading=
 kernel from boot module @ 0000000003f80000<br>(XEN) Loading ramdisk from b=
oot module @ 0000000006000000<br>(XEN) Allocating 1:1 mappings totalling 51=
2MB for dom0:<br>(XEN) BANK[0] 0x00000020000000-0x00000040000000 (512MB)<br=
>(XEN) Grant table range: 0x000000f7e00000-0x000000f7e40000<br>(XEN) IRQ 41=
 is already used by Xen<br>(XEN) Unable to map IRQ41 to dom0<br>(XEN) Devic=
e tree generation failed (-16).<br>(XEN) <br>(XEN) ************************=
****************<br>(XEN) Panic on CPU 0:<br>(XEN) Could not set up DOM0 gu=
est OS<br>(XEN) ****************************************<br>(XEN) <br>(XEN)=
 Reboot in five seconds...<br></div><div dir=3D"auto"><br></div><div>It loo=
ks like XEN is now using the interrupt controller but there are conflicts. =
I was able to get this error to change to &quot;Unable to map IRQ43 to dom0=
&quot; by changing all instances of &quot;IRQ_TYPE_LEVEL_HIGH &quot; to &qu=
ot;IRQ_TYPE_LEVEL_LOW&quot;, but I can&#39;t get any further. I made sure t=
hat there was nothing in the device tree that is obviously using IRQ 43 as =
well.=C2=A0</div><div><br></div><div>Any thoughts on this?</div><div><br></=
div><div>Cheers,</div><div>Brad</div><div dir=3D"auto">=C2=A0</div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Jul 13, 2022, 8:00 AM Bertrand Marquis &lt;<a href=3D"mailto:Bertrand=
.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Brad<br>
<br>
&gt; On 12 Jul 2022, at 17:24, Brad Churchwell &lt;<a href=3D"mailto:brad@c=
achengo.com" rel=3D"noreferrer" target=3D"_blank">brad@cachengo.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Hi Bertrand,<br>
&gt;<br>
&gt; I believe I understand, but just to clarify, should I leave the ppi-pa=
rtitions block in rk3399.dtsi as is and disable the little cores, or should=
 I also modify that block?<br>
<br>
Disable the little cores and remove the partitions.<br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt;<br>
&gt; Brad<br>
&gt;<br>
&gt; On Tue, Jul 12, 2022 at 11:11 AM Bertrand Marquis &lt;<a href=3D"mailt=
o:Bertrand.Marquis@arm.com" rel=3D"noreferrer" target=3D"_blank">Bertrand.M=
arquis@arm.com</a>&gt; wrote:<br>
&gt; Hi Brad,<br>
&gt;<br>
&gt; &gt; On 12 Jul 2022, at 16:59, Brad Churchwell &lt;<a href=3D"mailto:b=
rad@cachengo.com" rel=3D"noreferrer" target=3D"_blank">brad@cachengo.com</a=
>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Bertrand,<br>
&gt; &gt;<br>
&gt; &gt; Thanks so much for the quick response!<br>
&gt; &gt;<br>
&gt; &gt; I should have mentioned previously that this device tree and kern=
el Image (5.15.16) does boot properly with the rootfs without XEN. The inte=
rrupt errors are only present when booting with XEN.<br>
&gt; &gt;<br>
&gt; &gt; These are custom boards and they do have usb c, however we are un=
able to boot from usb as it doesn&#39;t receive power.=C2=A0 We currently o=
nly use the usb to flash u-boot to spi which requires us to use a separate =
power adapter. These boards get power and networking through a custom backp=
lane and interface with the backplane via a sata style justice (I&#39;m not=
 sure what the proper terminology would be here).<br>
&gt; &gt;<br>
&gt; &gt; Since I cannot boot to rootfs with XEN, I&#39;m unable to show th=
e device tree there. The only bit that I added to accommodate XEN is this b=
it here:<br>
&gt; &gt;<br>
&gt; &gt; chosen {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0stdout-path =3D &quot;serial2:1500000n8&quot;;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bootargs =3D &quot;hmp-unsafe=3Dtrue&quot;;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0xen,dom0-bootargs =3D &quot;console=3Dhvc0 ear=
lyprintk=3Dxen clk_ignore_unused root=3D/dev/nvme0n1p2 rw init=3D/sbin/init=
 rootwait rootfstype=3Dext4 ignore_loglevel&quot;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0modules {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module@1 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &qu=
ot;xen,linux-zimage&quot;, &quot;xen,multiboot-module&quot;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x=
03F80000 0x0 0x01aa8008&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module@2 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &qu=
ot;xen,linux-initrd&quot;, &quot;xen,multiboot-module&quot;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x=
06000000 0x0 0x02000000&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;<br>
&gt; &gt; };<br>
&gt; &gt;<br>
&gt; &gt; The gic declaration is in the vanilla rk3399.dtsi file and hasn&#=
39;t been modified:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic: interrupt-controller@fee000=
00 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp=
atible =3D &quot;arm,gic-v3&quot;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#int=
errupt-cells =3D &lt;4&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#add=
ress-cells =3D &lt;2&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#siz=
e-cells =3D &lt;2&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rang=
es;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rrupt-controller;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =
=3D &lt;0x0 0xfee00000 0 0x10000&gt;, /* GICD */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;0x0 0xfef00000 0 0xc0000&gt;, /* GICR */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;0x0 0xfff00000 0 0x10000&gt;, /* GICC */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;0x0 0xfff10000 0 0x10000&gt;, /* GICH */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&lt;0x0 0xfff20000 0 0x10000&gt;; /* GICV */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rrupts =3D &lt;GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its:=
 interrupt-controller@fee20000 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,gic-v3-its&quot;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msi-controller;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#msi-cells =3D &lt;1&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0xfee20000 0x0 0x20000&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<b=
r>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppi-=
partitions {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ppi_cluster0: interrupt-partition-0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affinity =3D &lt;&amp;c=
pu_l0 &amp;cpu_l1 &amp;cpu_l2 &amp;cpu_l3&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ppi_cluster1: interrupt-partition-1 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affinity =3D &lt;&amp;c=
pu_b0 &amp;cpu_b1&gt;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<b=
r>
&gt;<br>
&gt; Xen is not supporting PPI partitions.<br>
&gt; I also saw that your booting using SMP unsafe so all core are enabled =
by Xen.<br>
&gt;<br>
&gt; Right now big/little is not supported by Xen and here you might have s=
ome interrupts in your system which can only occur on some specific cores.<=
br>
&gt; I would suggest to try the following:<br>
&gt; - only boot enable in your dtb the cores with the same type than the b=
oot core<br>
&gt; - check in your device tree which devices are assign to the ppi_cluste=
r not available and disable them<br>
&gt;<br>
&gt; This kind of configuration will be tricky to handle so it will depend =
on which devices have interrupts that can only be fired on one cluster type=
.<br>
&gt;<br>
&gt; Sorry but I cannot right now check in the device tree and do those che=
cks myself but if you do get the idea send back a mail :-)<br>
&gt;<br>
&gt; Cheers<br>
&gt; Bertrand<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve attached the device tree and include files just in case =
you&#39;d like to take a look at those.<br>
&gt; &gt;<br>
&gt; &gt; Thanks so much for your help! I&#39;ve been at this for weeks wit=
h very little progress.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Brad<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis &lt;<a href=3D"=
mailto:Bertrand.Marquis@arm.com" rel=3D"noreferrer" target=3D"_blank">Bertr=
and.Marquis@arm.com</a>&gt; wrote:<br>
&gt; &gt; Hi Brad,<br>
&gt; &gt;<br>
&gt; &gt; &gt; On 11 Jul 2022, at 19:38, Brad Churchwell &lt;<a href=3D"mai=
lto:brad@cachengo.com" rel=3D"noreferrer" target=3D"_blank">brad@cachengo.c=
om</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve been trying to get Xen to boot dom0 with my kernel =
for weeks on an rk3399 based board and thought I&#39;d reach out for help. =
It looks like either Xen is not properly recreating the device tree or the =
interrupt controller is just failing. The hypervisor boots but falls to ini=
tramfs because it cannot find the root device (nvme on pcie). Any help woul=
d be greatly appreciated. Here is the complete boot log<br>
&gt; &gt;<br>
&gt; &gt; From the logs you have an issue with the interrupt controller and=
 the fact that your NVME is behind PCIE and as such depends on ITS is proba=
bly not helping.<br>
&gt; &gt;<br>
&gt; &gt; I would suggest to try to boot on usb as root fs for a try.<br>
&gt; &gt;<br>
&gt; &gt; Also it could be useful to compare the device tree on xen and wit=
hout xen to understand what is going on (using /proc/device-tree).<br>
&gt; &gt;<br>
&gt; &gt; Xen seems to be ok but Linux is not happy with interrupts and is =
showing several issues around this area on your logs.<br>
&gt; &gt; Could you show us an extract of your device tree around the gic d=
eclaration ?<br>
&gt; &gt;<br>
&gt; &gt; Cheers<br>
&gt; &gt; Bertrand<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; IMPORTANT NOTICE: The contents of this email and any attachments =
are confidential and may also be privileged. If you are not the intended re=
cipient, please notify the sender immediately and do not disclose the conte=
nts to any other person, use it for any purpose, or store or copy the infor=
mation in any medium. Thank you.<br>
&gt; &gt; &lt;rk3399-zaku.dts&gt;&lt;rk3399-zaku.dtsi&gt;&lt;rk3399.dtsi&gt=
;<br>
&gt;<br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div>

--00000000000022749805e3afd07e--


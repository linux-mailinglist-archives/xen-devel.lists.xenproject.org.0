Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F048D1C223F
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 04:18:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUhi5-0000xi-7Z; Sat, 02 May 2020 02:16:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zGBs=6Q=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jUhi3-0000xd-Er
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 02:16:55 +0000
X-Inumbo-ID: fc6c6936-8c1a-11ea-ae69-bc764e2007e4
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc6c6936-8c1a-11ea-ae69-bc764e2007e4;
 Sat, 02 May 2020 02:16:52 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id r66so1473300oie.5
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 19:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n5Ul91/uMGfL3z94+8q3hg8YyBQNrBPJwdvuXrDPA0A=;
 b=SIU7P8NAtiNjIALTo2zvBkID5PzltWD32ZO7ZKicxpWcd1W5PxSIuZoyhwrNWyKShl
 0RrrTwUswaVQXpKSdXikH0ioDeGtgu5zmcwsm3EAQCSp7lcretigQiCy+g/3e788Plrk
 BQ2cRXpax8IVZFmC4XY9qFWKDwddC3oMrWlglrugY5qnJXDZP7HhT64KzzohkQhyNUBu
 BIsV+OWdHMlZDnWSdZYxJsuaUMebe5kP+mnwKxKVQG9pF3CpJ2uaEdmCHpdd9g6Eum7k
 1BDne3npOfWgoZRaIaVdInOscXPF25vDfJDVIih7NaoesVPv93mtNZoxGpghBDtDttik
 3Bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=n5Ul91/uMGfL3z94+8q3hg8YyBQNrBPJwdvuXrDPA0A=;
 b=LKfIxX48NLsPbCRIC6OxP9l47UuGeCV0Gbmderv3DWbmayE1HfcgRub5k3r6KnmeRk
 o6dfms2t9J8faJfNbm106/uFj0KbZiuXcteR4Ge2C97mw+ZbzzJfrCudS+Cn91+3YAC8
 /NtofuavNj6JESqh62xqWnRQR9wwEk+wXVcRp1XBt5ykxoneXjuDgUDrjAWC6lRumusy
 Tz974CFfe4mbpDhvoMrzD0AAXCriZPppFkdpef2R6h7kD1DI5HqnGD7BGXR4Nf54r1R1
 QIVuE6KzSyl9TD1nQKcRbNqv3tkHDsOlxd/xcabmpBZw0VEah8RKcyQ1Mfbdpqcw90Vx
 3FLw==
X-Gm-Message-State: AGi0PuYK0jWk3r84zd3cfCVwFuKbshKMSUCpzSFUzVh9KW/VG3bk5p0y
 0gDy45MtxicrrfLL/NsZTQ==
X-Google-Smtp-Source: APiQypJUw8EL+gwPZRWJ40KOpmVGIJsPyty4rKgr5mQIsyQgu+SRmRW7tdLVM3eSiDZj0MRC2vQC2A==
X-Received: by 2002:aca:5643:: with SMTP id k64mr1782926oib.152.1588385811155; 
 Fri, 01 May 2020 19:16:51 -0700 (PDT)
Received: from serve.minyard.net ([47.184.149.130])
 by smtp.gmail.com with ESMTPSA id z24sm1293483otq.75.2020.05.01.19.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 19:16:49 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 412AD180042;
 Sat,  2 May 2020 02:16:48 +0000 (UTC)
Date: Fri, 1 May 2020 21:16:47 -0500
From: Corey Minyard <minyard@acm.org>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200502021647.GG9902@minyard.net>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: minyard@acm.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 jeff.kubascik@dornerworks.com, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 01, 2020 at 06:06:11PM -0700, Roman Shaposhnik wrote:
> On Fri, May 1, 2020 at 4:42 AM Corey Minyard <minyard@acm.org> wrote:
> >
> > On Thu, Apr 30, 2020 at 07:20:05PM -0700, Roman Shaposhnik wrote:
> > > Hi!
> > >
> > > I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
> > > upstream kernel. The kernel itself works perfectly well
> > > on the board. When I try booting it as Dom0 under Xen,
> > > it goes into a stacktrace (attached).
> >
> > Getting Xen working on the Pi4 requires a lot of moving parts, and they
> > all have to be right.
> 
> Tell me about it! It is a pretty frustrating journey to align
> everything just right.
> On the other hand -- it seems worth to enable RPi as an ARM development
> platform for Xen given how ubiquitous it is.
> 
> Hence me trying to combine pristine upstream kernel (5.6.1) with
> pristine upstream
> Xen to enable 100% upstream developer workflow on RPi.
> 
> > > Looking at what nice folks over at Dornerworks have previously
> > > done to make RPi kernels boot as Dom0 I've come across these
> > > 3 patches:
> > >     https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux
> > >
> > > The first patch seems irrelevant (unless I'm missing something
> > > really basic here).
> >
> > It might be irrelevant for your configuration, assuming that Xen gets
> > the right information from EFI.  I haven't tried EFI booting.
> 
> I'd doing a bit of belt-and-suspenders strategy really -- I'm actually
> using UEFI u-boot implementation that pre-populates device trees
> and then I'm also forcing an extra copy of it to be load explicitly
> via the GRUB devicetree command (GRUB runs as a UEFI payload).
> 
> I also have access to the semi-official TianoCore RPi4 port that seems
> to be working pretty well: https://github.com/pftf/RPi4/releases/tag/v1.5
> for booting all sort of UEFI payloads on RPi4.
> 
> > > The 2nd patch applied with no issue (but
> > > I don't think it is related) but the 3d patch failed to apply on
> > > account of 5.6.1 kernel no longer having:
> > >     dev->archdata.dev_dma_ops
> > > E.g.
> > >     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55
> > >
> > > I've tried to emulate the effect of the patch by simply introducing
> > > a static variable that would signal that we already initialized
> > > dev->dma_ops -- but that didn't help at all.
> > >
> > > I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
> > > to see if may be they have any suggestions on how this may be dealt
> > > with.
> > >
> > > Any advice would be greatly appreciated!
> >
> > What's your Pi4 config.txt file look like? The GIC is not being handled
> > correctly, and I'm guessing that configuration is wrong.  You can't use
> > the stock config.txt file with Xen, you have to modify the configuration a
> > bit.
> 
> Understood. I'm actually using a custom one:
>     https://github.com/lf-edge/eve/blob/master/pkg/u-boot/rpi/config.txt
> 
> I could swear that I had a GIC setting in it -- but apparently no -- so
> I added the following at the top of what you could see at the URL above:
> 
> total_mem=4096
> enable_gic=1
> 
> > I think just adding:
> >
> > enable_gic=1
> > total_mem=1024
> 
> Right -- but my board has 4G memory -- so I think what I did above should work.

Nope.  If you say 4096M of RAM, your issue is almost certainly DMA, but
it's not (just) the Linux code.  On the Raspberry Pi 4, several devices
cannot DMA to above 1024M of RAM, but Xen does not handle this.  The
1024M of RAM is a limitation you will have to live with until Xen has a
fix.

I know I saw a reference for this, but I can't find it now.  I saw
someone say it booted with 4G, but I was unable to get it to boot with
without setting total_mem=1024.

-corey

> 
> > might get it working, or at least solve one problem.  It's required either
> > way.  That might get rid of the GIC errors at the beginning.  I see a
> > few of those, but not that many.
> >
> > My kernel command line is:
> >
> > coherent_pool=1M 8250.nr_uarts=1 cma=64M cma=256M  smsc95xx.macaddr=DC:A6:32:4F:3A:CD vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  console=hvc0 clk_ignore_unused root=/dev/mmcblk0p2 rootwait
> >
> > A lot of that configuration gets pulled from the initialization done by
> > the GPU at startup which it put into the device tree.  I'm not sure what a
> > lot of it means.  Some of it is added by Xen, too.
> 
> Just to be on the safe side -- I'm now using Device Tree from Dornerworks build.
> The file is attached.
> 
> > I can verify the DMA patch is important.  I'm not sure how to apply it
> > to a 5.6 kernel, though.
> 
> OK, after chatting with Stefano it definitely seems that there's some kind of
> an issue with DMA. It just seems different to what the original issue with
> 4.19.x kernel used to be.
> 
> Here's the clue. When I disable Xen DMA operations altogether with
> the following. I get the Linux kernel that is booting all the way to trying
> mounting a root filesystem (which sadly can't be found since eMMC
> requires DMA FWIU). I hope this will provide enough of a clue to
> figure out what may be wrong with the 5.x kernel. I'm attaching the
> boo log with the following patch applied:
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index d40e9e5fc52b..c25ead822de0 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -137,8 +137,7 @@ void xen_destroy_contiguous_region(phys_addr_t
> pstart, unsigned int order)
>  static int __init xen_mm_init(void)
>  {
>         struct gnttab_cache_flush cflush;
> -       if (!xen_initial_domain())
> -               return 0;
> +       return 0;
>         xen_swiotlb_init(1, false);
> 
>         cflush.op = 0;
> 
> Thanks,
> Roman.

> Using modules provided by bootloader in FDT
> Xen 4.14-unstable (c/s Mon Apr 20 14:36:53 2020 +0100 git:8065e1b416-dirty) EFI loader
> Warning: Could not query variable store: 0x8000000000000003
> - UART enabled -
> - Boot CPU booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000000001000 - 0000000007ef1fff
> (XEN) RAM: 0000000007ef2000 - 0000000007f0dfff
> (XEN) RAM: 0000000007f0e000 - 000000002bc45fff
> (XEN) RAM: 000000002bc46000 - 000000002bc50fff
> (XEN) RAM: 000000002bc51000 - 000000002bd93fff
> (XEN) RAM: 000000002bd94000 - 000000002d780fff
> (XEN) RAM: 000000002d781000 - 000000003c9f6fff
> (XEN) RAM: 000000003c9f7000 - 000000003c9f8fff
> (XEN) RAM: 000000003c9fb000 - 000000003c9fdfff
> (XEN) RAM: 000000003c9fe000 - 000000003cb08fff
> (XEN) RAM: 000000003cb10000 - 000000003cb10fff
> (XEN) RAM: 000000003cb12000 - 000000003cb13fff
> (XEN) RAM: 000000003cb1b000 - 000000003cb1cfff
> (XEN) RAM: 000000003cb1e000 - 000000003df3ffff
> (XEN) RAM: 000000003df50000 - 000000003dffffff
> (XEN) RAM: 0000000040000000 - 00000000fbffffff
> (XEN)
> (XEN) MODULE[0]: 000000002bc51000 - 000000002bd930c8 Xen
> (XEN) MODULE[1]: 000000002bc47000 - 000000002bc51000 Device Tree
> (XEN) MODULE[2]: 000000002bd9d000 - 000000002d67c200 Kernel
> (XEN)
> (XEN) CMDLINE[000000002bd9d000]:chosen console=hvc0 earlyprintk=xen nomodeset
> (XEN)
> (XEN) Command line: dom0_mem=1024M,max:1024M dom0_max_vcpus=1
> (XEN) parameter "dom0_mem" has invalid value "1024M,max:1024M", rc=-22!
> (XEN) Domain heap initialised
> (XEN) Booting using Device Tree
> (XEN) Platform: Raspberry Pi 4
> (XEN) No dtuart path configured
> (XEN) Bad console= option 'dtuart'
>  Xen 4.14-unstable
> (XEN) Xen version 4.14-unstable (@) (aarch64-linux-gnu-gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0) debug=y  Thu Apr 30 17:43:33 PDT 2020
> (XEN) Latest ChangeSet: Mon Apr 20 14:36:53 2020 +0100 git:8065e1b416-dirty
> (XEN) build-id: 988ba8f5257c494645df6d5c4c2d5fd9f39e2539
> (XEN) Processor: 410fd083: "ARM Limited", variant: 0x0, part 0xd08, rev 0x3
> (XEN) 64-bit Execution:
> (XEN)   Processor Features: 0000000000002222 0000000000000000
> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> (XEN)     Extensions: FloatingPoint AdvancedSIMD
> (XEN)   Debug Features: 0000000010305106 0000000000000000
> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> (XEN)   Memory Model Features: 0000000000001124 0000000000000000
> (XEN)   ISA Features:  0000000000010000 0000000000000000
> (XEN) 32-bit Execution:
> (XEN)   Processor Features: 00000131:00011011
> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> (XEN)     Extensions: GenericTimer Security
> (XEN)   Debug Features: 03010066
> (XEN)   Auxiliary Features: 00000000
> (XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
> (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00010001
> (XEN) SMP: Allowing 4 CPUs
> (XEN) enabled workaround for: ARM erratum 1319537
> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 54000 KHz
> (XEN) GICv2 initialization:
> (XEN)         gic_dist_addr=00000000ff841000
> (XEN)         gic_cpu_addr=00000000ff842000
> (XEN)         gic_hyp_addr=00000000ff844000
> (XEN)         gic_vcpu_addr=00000000ff846000
> (XEN)         gic_maintenance_irq=25
> (XEN) GICv2: 256 lines, 4 cpus, secure (IID 0200143b).
> (XEN) XSM Framework v1.0.0 initialized
> (XEN) Initialising XSM SILO mode
> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Initializing Credit2 scheduler
> (XEN)  load_precision_shift: 18
> (XEN)  load_window_shift: 30
> (XEN)  underload_balance_tolerance: 0
> (XEN)  overload_balance_tolerance: -3
> (XEN)  runqueues arrangement: socket
> (XEN)  cap enforcement granularity: 10ms
> (XEN) load tracking window length 1073741824 ns
> (XEN) Allocated console ring of 32 KiB.
> (XEN) CPU0: Guest atomics will try 5 times before pausing the domain
> (XEN) Bringing up CPU1
> - CPU 00000001 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) CPU1: Guest atomics will try 5 times before pausing the domain
> (XEN) CPU 1 booted.
> (XEN) Bringing up CPU2
> - CPU 00000002 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) CPU2: Guest atomics will try 5 times before pausing the domain
> (XEN) CPU 2 booted.
> (XEN) Bringing up CPU3
> - CPU 00000003 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) CPU3: Guest atomics will try 5 times before pausing the domain
> (XEN) CPU 3 booted.
> (XEN) Brought up 4 CPUs
> (XEN) I/O virtualisation disabled
> (XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
> (XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594
> (XEN) Adding cpu 0 to runqueue 0
> (XEN)  First cpu on runqueue, activating
> (XEN) Adding cpu 1 to runqueue 0
> (XEN) Adding cpu 2 to runqueue 0
> (XEN) Adding cpu 3 to runqueue 0
> (XEN) alternatives: Patching with alt table 00000000002d4208 -> 00000000002d491c
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 000000002bd9d000
> (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
> (XEN) BANK[0] 0x00000040000000-0x00000080000000 (1024MB)
> (XEN) Grant table range: 0x0000002bc51000-0x0000002bc91000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading zImage from 000000002bd9d000 to 0000000040080000-000000004195f200
> (XEN) Loading d0 DTB to 0x0000000048000000-0x0000000048006e0a
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Scrubbing Free RAM in background
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) ***************************************************
> (XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
> (XEN) Please update your firmware.
> (XEN) ***************************************************
> (XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
> (XEN) Please update your firmware.
> (XEN) ***************************************************
> (XEN) No support for ARM_SMCCC_ARCH_WORKAROUND_1.
> (XEN) Please update your firmware.
> (XEN) ***************************************************
> (XEN) 3... 2... 1...
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 348kB init memory.
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 5.6.1-default (root@13024eb1d2cf) (gcc version 8.3.0 (Alpine 8.3.0)) #6 SMP Sat May 2 00:10:36 UTC 2020
> [    0.000000] Machine model: Raspberry Pi 4 Model B
> [    0.000000] Xen 4.14 support found
> [    0.000000] efi: Getting EFI parameters from FDT:
> [    0.000000] efi: UEFI not found.
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0x7fdd42c0-0x7fdd7fff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] percpu: Embedded 23 pages/cpu s54232 r8192 d31784 u94208
> [    0.000000] Detected PIPT I-cache on CPU0
> [    0.000000] CPU features: detected: EL2 vector hardening
> [    0.000000] CPU features: detected: Speculative Store Bypass Disable
> [    0.000000] CPU features: detected: ARM erratum 1319367
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258048
> [    0.000000] Policy zone: DMA
> [    0.000000] Kernel command line: console=hvc0 earlyprintk=xen nomodeset
> [    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 1002060K/1048576K available (12732K kernel code, 1852K rwdata, 6184K rodata, 4672K init, 758K bss, 46516K reserved, 0K cma-reserved)
> [    0.000000] random: get_random_u64 called from __kmem_cache_create+0x40/0x578 with crng_init=0
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=480 to nr_cpu_ids=1.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
> [    0.000005] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
> [    0.000273] Console: colour dummy device 80x25
> [    0.270836] printk: console [hvc0] enabled
> [    0.275124] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=540000)
> [    0.285678] pid_max: default: 32768 minimum: 301
> [    0.290511] LSM: Security Framework initializing
> [    0.295221] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.302730] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.313228] xen:grant_table: Grant tables using version 1 layout
> [    0.318714] Grant table initialized
> [    0.322312] xen:events: Using FIFO-based ABI
> [    0.326760] Xen: initializing cpu0
> [    0.330353] rcu: Hierarchical SRCU implementation.
> [    0.338817] EFI services will not be available.
> [    0.342959] smp: Bringing up secondary CPUs ...
> [    0.347479] smp: Brought up 1 node, 1 CPU
> [    0.351575] SMP: Total of 1 processors activated.
> [    0.356408] CPU features: detected: 32-bit EL0 Support
> [    0.361689] CPU features: detected: CRC32 instructions
> [    0.396295] CPU: All CPU(s) started at EL1
> [    0.399867] alternatives: patching kernel code
> [    0.405872] devtmpfs: initialized
> [    0.413580] Registered cp15_barrier emulation handler
> [    0.418164] Registered setend emulation handler
> [    0.422741] KASLR disabled due to lack of seed
> [    0.427659] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.437360] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
> [    0.444449] pinctrl core: initialized pinctrl subsystem
> [    0.450684] thermal_sys: Registered thermal governor 'fair_share'
> [    0.450687] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.456235] thermal_sys: Registered thermal governor 'step_wise'
> [    0.462423] thermal_sys: Registered thermal governor 'user_space'
> [    0.468654] DMI not present or invalid.
> [    0.479281] NET: Registered protocol family 16
> [    0.483559] DMA: preallocated 256 KiB pool for atomic allocations
> [    0.489539] audit: initializing netlink subsys (disabled)
> [    0.496103] audit: type=2000 audit(0.370:1): state=initialized audit_enabled=0 res=1
> [    0.503951] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.510341] ASID allocator initialised with 65536 entries
> [    0.516925] Serial: AMBA PL011 UART driver
> [    0.539528] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.545702] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
> [    0.552578] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.559398] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
> [    0.570438] cryptd: max_cpu_qlen set to 1000
> [    0.580347] ACPI: Interpreter disabled.
> [    0.584023] xen:balloon: Initialising balloon driver
> [    0.590395] iommu: Default domain type: Translated
> [    0.595026] vgaarb: loaded
> [    0.597933] SCSI subsystem initialized
> [    0.601940] usbcore: registered new interface driver usbfs
> [    0.607076] usbcore: registered new interface driver hub
> [    0.612627] usbcore: registered new device driver usb
> [    0.617790] usb_phy_generic phy: phy supply vcc not found, using dummy regulator
> [    0.625532] pps_core: LinuxPPS API ver. 1 registered
> [    0.630281] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.639665] PTP clock support registered
> [    0.643762] EDAC MC: Ver: 3.0.0
> [    0.648106] NetLabel: Initializing
> [    0.650959] NetLabel:  domain hash size = 128
> [    0.655412] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    0.661291] NetLabel:  unlabeled traffic allowed by default
> [    0.667445] clocksource: Switched to clocksource arch_sys_counter
> [    0.673415] VFS: Disk quotas dquot_6.6.0
> [    0.677266] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.684429] pnp: PnP ACPI: disabled
> [    0.694684] NET: Registered protocol family 2
> [    0.699014] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
> [    0.707026] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.714970] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, linear)
> [    0.722397] TCP: Hash tables configured (established 8192 bind 8192)
> [    0.728962] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.735547] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.742928] NET: Registered protocol family 1
> [    0.747235] PCI: CLS 0 bytes, default 64
> [    0.751794] kvm [1]: HYP mode not available
> [    0.762848] Initialise system trusted keyrings
> [    0.766865] workingset: timestamp_bits=40 max_order=18 bucket_order=0
> [    0.779692] zbud: loaded
> [    0.783113] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.788995] 9p: Installing v9fs 9p2000 file system support
> [    0.818061] Key type asymmetric registered
> [    0.821593] Asymmetric key parser 'x509' registered
> [    0.826628] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
> [    0.834307] io scheduler mq-deadline registered
> [    0.838829] io scheduler kyber registered
> [    0.843090] io scheduler bfq registered
> [    0.851833] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    0.859316] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
> [    0.865766] brcm-pcie fd500000.pcie:      MEM 0x0600000000..0x0603ffffff -> 0x00f8000000
> [    0.874065] brcm-pcie fd500000.pcie:   IB MEM 0x0000000000..0x00ffffffff -> 0x0000000000
> [    0.937473] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (!SSC)
> [    0.942977] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
> [    0.949188] pci_bus 0000:00: root bus resource [bus 00-01]
> [    0.954793] pci_bus 0000:00: root bus resource [mem 0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
> [    0.965361] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
> [    0.971562] pci 0000:00:00.0: PME# supported from D0 D3hot
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    0.987468] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> [    0.997325] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [    1.004931] pci 0000:01:00.0: [1106:3483] type 00 class 0x0c0330
> [    1.010995] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
> [    1.018002] pci 0000:01:00.0: PME# supported from D0 D3cold
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    1.028797] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> [    1.038631] pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> [    1.044464] pci 0000:00:00.0: BAR 14: assigned [mem 0x600000000-0x6000fffff]
> [    1.051664] pci 0000:01:00.0: BAR 0: assigned [mem 0x600000000-0x600000fff 64bit]
> [    1.059305] pci 0000:00:00.0: PCI bridge to [bus 01]
> [    1.064377] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
> [    1.071642] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
> [    1.077882] pcieport 0000:00:00.0: PME: Signaling with IRQ 32
> [    1.083871] pcieport 0000:00:00.0: AER: enabled with IRQ 32
> [    1.089489] pci 0000:01:00.0: enabling device (0000 -> 0002)
> [    1.103732] ------------[ cut here ]------------
> [    1.107828] bcm2835-dma fe007000.dma: DMA addr 0x0000000101963000+4096 overflow (mask ffffffff, bus limit fbffffff).
> [    1.118549] WARNING: CPU: 0 PID: 1 at kernel/dma/direct.c:364 dma_direct_map_page+0x16c/0x180
> [    1.127194] Modules linked in:
> [    1.130360] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.1-default #6
> [    1.137028] Hardware name: Raspberry Pi 4 Model B (DT)
> [    1.142309] pstate: 60000005 (nZCv daif -PAN -UAO)
> [    1.147217] pc : dma_direct_map_page+0x16c/0x180
> [    1.151967] lr : dma_direct_map_page+0x16c/0x180
> [    1.156695] sp : ffff800010013ad0
> [    1.160121] x29: ffff800010013ad0 x28: 0000000000000000
> [    1.165564] x27: ffff80001130044c x26: ffff8000113d3960
> [    1.171007] x25: ffff8000112f40a8 x24: 0000000000000000
> [    1.176451] x23: ffff80001179b548 x22: ffff00003f9e6c10
> [    1.181904] x21: ffff00003f9e6c00 x20: ffff00003f9e6c10
> [    1.187339] x19: ffff80001179b548 x18: 0000000000000010
> [    1.192792] x17: 0000000000000001 x16: 00000000deadbeef
> [    1.198226] x15: ffffffffffffffff x14: 20776f6c66726576
> [    1.203671] x13: 6f20363930342b30 x12: 3030333639313031
> [    1.209114] x11: 3030303030303078 x10: 3020726464612041
> [    1.214558] x9 : 4d44203a616d642e x8 : ffff80001071e900
> [    1.220002] x7 : 00000000000000a5 x6 : ffff80001197a6f7
> [    1.225446] x5 : ffff800010e19d18 x4 : 0000000000000000
> [    1.230889] x3 : 0000000000000000 x2 : 00000000ffffffff
> [    1.236333] x1 : 745b439e6d834000 x0 : 0000000000000000
> [    1.241778] Call trace:
> [    1.244330]  dma_direct_map_page+0x16c/0x180
> [    1.248722]  bcm2835_dma_probe+0x4bc/0x558
> [    1.252942]  platform_drv_probe+0x50/0xa0
> [    1.257061]  really_probe+0xd8/0x438
> [    1.260748]  driver_probe_device+0xdc/0x130
> [    1.265051]  device_driver_attach+0x6c/0x78
> [    1.269352]  __driver_attach+0x9c/0x168
> [    1.273303]  bus_for_each_dev+0x70/0xc0
> [    1.277254]  driver_attach+0x20/0x28
> [    1.280942]  bus_add_driver+0x190/0x220
> [    1.284894]  driver_register+0x60/0x110
> [    1.288843]  __platform_driver_register+0x44/0x50
> [    1.293678]  bcm2835_dma_driver_init+0x18/0x20
> [    1.298240]  do_one_initcall+0x74/0x1b0
> [    1.302200]  kernel_init_freeable+0x214/0x2b0
> [    1.306669]  kernel_init+0x10/0x100
> [    1.310267]  ret_from_fork+0x10/0x18
> [    1.313960] ---[ end trace 2f723f6ea1e0757e ]---
> [    1.318726] bcm2835-dma fe007000.dma: Failed to map zero page
> [    1.324687] bcm2835-dma: probe of fe007000.dma failed with error -12
> [    1.334169] xen:xen_evtchn: Event-channel device installed
> [    1.339414] Initialising Xen pvcalls frontend driver
> [    1.345880] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    1.359258] bcm2835-aux-uart fe215040.serial: there is not valid maps for state default
> [    1.366842] OF: /soc/serial@7e215040: could not find phandle
> [    1.372605] bcm2835-aux-uart fe215040.serial: could not get clk: -2
> [    1.378998] bcm2835-aux-uart: probe of fe215040.serial failed with error -2
> [    1.386564] Serial: AMBA driver
> [    1.389877] msm_serial: driver initialized
> [    1.394719] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    1.409630] brd: module loaded
> [    1.419607] loop: module loaded
> [    1.438031] Invalid max_queues (4), will use default max: 1.
> [    1.454031] drbd: initialized. Version: 8.4.11 (api:1/proto:86-101)
> [    1.459804] drbd: built-in
> [    1.462592] drbd: registered as block device major 147
> [    1.468739] bcm2835-power bcm2835-power: Broadcom BCM2835 power domains driver
> [    1.476559] wireguard: allowedips self-tests: pass
> [    1.483341] wireguard: nonce counter self-tests: pass
> [    1.908628] wireguard: ratelimiter self-tests: pass
> [    1.913030] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for information.
> [    1.920984] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> [    1.932354] libphy: Fixed MDIO Bus: probed
> [    1.936408] bcmgenet fd580000.genet: using random Ethernet MAC
> [    1.941902] bcmgenet fd580000.genet: failed to get enet clock
> [    1.947758] bcmgenet fd580000.genet: GENET 5.0 EPHY: 0x0000
> [    1.953455] bcmgenet fd580000.genet: failed to get enet-wol clock
> [    1.959700] bcmgenet fd580000.genet: failed to get enet-eee clock
> [    1.977496] libphy: bcmgenet MII bus: probed
> [    2.057539] unimac-mdio unimac-mdio.-19: Broadcom UniMAC MDIO bus
> [    2.063755] xen_netfront: Initialising Xen virtual ethernet driver
> [    2.069721] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    2.074800] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
> [    2.082779] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci version 0x100 quirks 0x0000000000000090
> [    2.092132] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.06
> [    2.100076] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    2.107449] usb usb1: Product: xHCI Host Controller
> [    2.112437] usb usb1: Manufacturer: Linux 5.6.1-default xhci-hcd
> [    2.118595] usb usb1: SerialNumber: 0000:01:00.0
> [    2.123766] hub 1-0:1.0: USB hub found
> [    2.127217] hub 1-0:1.0: 1 port detected
> [    2.131662] xhci_hcd 0000:01:00.0: xHCI Host Controller
> [    2.136591] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
> [    2.144182] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
> [    2.150673] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> [    2.158916] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.06
> [    2.167228] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    2.174618] usb usb2: Product: xHCI Host Controller
> [    2.179618] usb usb2: Manufacturer: Linux 5.6.1-default xhci-hcd
> [    2.185753] usb usb2: SerialNumber: 0000:01:00.0
> [    2.190885] hub 2-0:1.0: USB hub found
> [    2.194405] hub 2-0:1.0: 4 ports detected
> [    2.199145] usbcore: registered new interface driver usb-storage
> [    2.204877] mousedev: PS/2 mouse device common for all mice
> [    2.212659] bcm2835-wdt bcm2835-wdt: Broadcom BCM2835 watchdog timer
> [    2.219119] xen_wdt xen_wdt: initialized (timeout=60s, nowayout=0)
> [    2.225473] sdhci: Secure Digital Host Controller Interface driver
> [    2.231146] sdhci: Copyright(c) Pierre Ossman
> [    2.235825] sdhci-pltfm: SDHCI platform and OF driver helper
> [    2.273506] mmc0: SDHCI controller on fe300000.mmcnr [fe300000.mmcnr] using PIO
> [    2.281417] ledtrig-cpu: registered to indicate activity on CPUs
> [    2.287786] hid: raw HID events driver (C) Jiri Kosina
> [    2.292597] usbcore: registered new interface driver usbhid
> [    2.298095] usbhid: USB HID core driver
> [    2.302529] bcm2835-mbox fe00b880.mailbox: mailbox enabled
> [    2.311675] xt_time: kernel timezone is -0000
> [    2.315576] IPVS: Registered protocols ()
> [    2.319735] IPVS: Connection hash table configured (size=4096, memory=64Kbytes)
> [    2.327337] IPVS: ipvs loaded.
> [    2.330487] ipip: IPv4 and MPLS over IPv4 tunneling driver
> [    2.336456] gre: GRE over IPv4 demultiplexor driver
> [    2.341162] ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
> [    2.347888] Initializing XFRM netlink socket
> [    2.352567] NET: Registered protocol family 10
> [    2.357853] Segment Routing with IPv6
> [    2.362140] NET: Registered protocol family 17
> [    2.366065] mmc0: queuing unknown CIS tuple 0x80 (2 bytes)
> [    2.371775] NET: Registered protocol family 15
> [    2.376292] Bridge firewalling registered
> [    2.380510] 8021q: 802.1Q VLAN Support v1.8
> [    2.384881] 9pnet: Installing 9P2000 support
> [    2.389081] Initialising Xen transport for 9pfs
> [    2.393833] Key type dns_resolver registered
> [    2.398505] registered taskstats version 1
> [    2.402322] Loading compiled-in X.509 certificates
> [    2.407212] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    2.416914] Loaded X.509 cert 'Build time autogenerated kernel key: ca85232d2e7ebc2af2feaa4812e2d651700446d8'
> [    2.426514] zswap: loaded using pool lzo/zbud
> [    2.431307] Key type ._fscrypt registered
> [    2.434991] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    2.440690] Key type .fscrypt registered
> [    2.444619] Key type fscrypt-provisioning registered
> [    2.452476] mmc0: queuing unknown CIS tuple 0x80 (7 bytes)
> [    2.459548] uart-pl011 fe201000.serial: there is not valid maps for state default
> [    2.466774] fe201000.serial: ttyAMA1 at MMIO 0xfe201000 (irq = 18, base_baud = 0) is a PL011 rev2
> [    2.476384] mmc0: queuing unknown CIS tuple 0x80 (3 bytes)
> [    2.485092] raspberrypi-firmware soc:firmware: Request 0x00000001 returned status 0x00000000
> [    2.493157] raspberrypi-firmware soc:firmware: Request 0x00030046 returned status 0x00000000
> [    2.501734] usb 1-1: new high-speed USB device number 2 using xhci_hcd
> [    2.508813] raspberrypi-firmware soc:firmware: Request 0x00030007 returned status 0x00000000
> [    2.516938] raspberrypi-clk raspberrypi-clk: Failed to get pllb min freq: -22
> [    2.524205] raspberrypi-clk raspberrypi-clk: Failed to initialize pllb, -22
> [    2.531389] raspberrypi-clk: probe of raspberrypi-clk failed with error -22
> [    2.540422] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.548407] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 0 config (-22 80)
> [    2.556682] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.565255] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 1 config (-22 81)
> [    2.573574] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.582132] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 2 config (-22 82)
> [    2.590442] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.598984] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 3 config (-22 83)
> [    2.607290] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.615847] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 4 config (-22 84)
> [    2.624141] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.632700] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 5 config (-22 85)
> [    2.641020] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.649559] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 6 config (-22 86)
> [    2.657868] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.666409] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 7 config (-22 87)
> [    2.675053] usb 1-1: New USB device found, idVendor=2109, idProduct=3431, bcdDevice= 4.20
> [    2.683004] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
> [    2.690253] usb 1-1: Product: USB2.0 Hub
> [    2.694944] raspberrypi-firmware soc:firmware: Request 0x00030030 returned status 0x00000000
> [    2.704156] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.712138] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 6 config (-22 86)
> [    2.720869] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.729006] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 6 config (-22 86)
> [    2.737296] reg-fixed-voltage: probe of sd_vcc_reg failed with error -22
> [    2.745091] hub 1-1:1.0: USB hub found
> [    2.748447] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.756917] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 4 config (-22 84)
> [    2.765256] raspberrypi-firmware soc:firmware: Request 0x00030043 returned status 0x00000000
> [    2.773801] raspberrypi-exp-gpio soc:firmware:gpio: Failed to get GPIO 4 config (-22 84)
> [    2.782067] hub 1-1:1.0: 4 ports detected
> [    2.786222] gpio-regulator: probe of sd_io_1v8_reg failed with error -22
> [    2.795347] hctosys: unable to open rtc device (rtc0)
> [    2.806267] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
> [    2.813313] Please append a correct "root=" boot option; here are the available partitions:
> [    2.821773] 0100          131072 ram0
> [    2.821776]  (driver?)
> [    2.828101] 0101          131072 ram1
> [    2.828103]  (driver?)
> [    2.834393] 0102          131072 ram2
> [    2.834395]  (driver?)
> [    2.840716] 0103          131072 ram3
> [    2.840718]  (driver?)
> [    2.847037] 0104          131072 ram4
> [    2.847039]  (driver?)
> [    2.853359] 0105          131072 ram5
> [    2.853361]  (driver?)
> [    2.859693] 0106          131072 ram6
> [    2.859695]  (driver?)
> [    2.866002] 0107          131072 ram7
> [    2.866003]  (driver?)
> [    2.872325] 0108          131072 ram8
> [    2.872327]  (driver?)
> [    2.878669] 0109          131072 ram9
> [    2.878671]  (driver?)
> [    2.884968] 010a          131072 ram10
> [    2.884969]  (driver?)
> [    2.891378] 010b          131072 ram11
> [    2.891380]  (driver?)
> [    2.897813] 010c          131072 ram12
> [    2.897815]  (driver?)
> [    2.904197] 010d          131072 ram13
> [    2.904198]  (driver?)
> [    2.910607] 010e          131072 ram14
> [    2.910609]  (driver?)
> [    2.917016] 010f          131072 ram15
> [    2.917017]  (driver?)
> [    2.923453] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [    2.931858] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.6.1-default #6
> [    2.939931] Hardware name: Raspberry Pi 4 Model B (DT)
> [    2.945199] Call trace:
> [    2.947753]  dump_backtrace+0x0/0x1d0
> [    2.951524]  show_stack+0x14/0x20
> [    2.954950]  dump_stack+0xbc/0x100
> [    2.958472]  panic+0x150/0x324
> [    2.961622]  mount_block_root+0x28c/0x32c
> [    2.965746]  mount_root+0x7c/0x88
> [    2.969171]  prepare_namespace+0x158/0x198
> [    2.973385]  kernel_init_freeable+0x264/0x2b0
> [    2.977876]  kernel_init+0x10/0x100
> [    2.981465]  ret_from_fork+0x10/0x18
> [    2.985157] Kernel Offset: disabled
> [    2.988751] CPU features: 0x10002,61006000
> [    2.992963] Memory Limit: none
> [    2.996131] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---




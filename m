Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23D1C119A
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 13:42:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUU3b-0000wK-C5; Fri, 01 May 2020 11:42:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKOD=6P=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1jUU3Z-0000wF-P2
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 11:42:13 +0000
X-Inumbo-ID: cb95441a-8ba0-11ea-9887-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb95441a-8ba0-11ea-9887-bc764e2007e4;
 Fri, 01 May 2020 11:42:11 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id b13so2356293oti.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pFoeUECwVIrcEgps9xEKluuyWqbnMaowz1zKu/YRL4Q=;
 b=BzCKTuuIg9xSrsgZpn+sFAcp98pGTLUIoiJnRWVW+nMPDbXNIm0+vhoK3v94uv0sCR
 +rFpxbPEBsRU/37fzIKwtYmraWAt9YY8AXkPTBokZ1U0vcKT1qwk2cI8InHlFEmphf5D
 rntuetAF1oN7KdGNZiuH3y51iZ4FL6nzXmFl4XKlxpHuJ+q3jCkCEYefZx96lY0l/fwc
 ZeAhUNbVG4OzY7b4QikLUyfmtzU8vuu7Gfan3ulGxW9hx55MNp8kPZo54ibK9lbMsZAl
 mpDFr/C6cDEFgmZIuAyRC1qhoWn5Iz+CfQ/rNONuAsbzIen0w9WVAgg2o5oskybVsSw3
 DFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=pFoeUECwVIrcEgps9xEKluuyWqbnMaowz1zKu/YRL4Q=;
 b=jAzci+N4ztuzOt/e2DKPzpmFFSgMmVQAEEwP+oziVyBAP/pnXWxsGvwumynNFtyJAj
 mBqZDu5guyL1I1HTozmJdPz2pfEqwFScWlaOq/QxJZeP+8zoFf5Buk/pg8lgl5kk/UL6
 7mP1e9TknggQCVk4h0s/u1+hI9gwrBW1pio/cO5NMwJxMnz1/J6J3fbBWgBMCq9nWxHy
 yento1ZVbKMjRwAlFpJbNprc1lVPDebxxAfDDq7bUE7sKB7aIBLTYqire/bKKIVv976B
 tMCXmeHnYEd8nr4mxNL5HlOGe4yBd6JqlKPKrFKvu0IvFK30h4rC4AubenpPoCfyux/1
 uRTQ==
X-Gm-Message-State: AGi0PuaflUumE5JyzZdatJUnqvt5thLUXum7PHiB/7tIZJoyaoDDl06k
 h1kwmpgdET8NjMUvu8afaA==
X-Google-Smtp-Source: APiQypLzjXUHnDec8+yGA/oweUwhFmXemSt1CRyFY6Ep/YjMwlGirejm9neQiWOUbQqTqUVY+4VDpg==
X-Received: by 2002:a9d:37c9:: with SMTP id x67mr3104736otb.207.1588333330528; 
 Fri, 01 May 2020 04:42:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id w14sm755042oou.46.2020.05.01.04.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 04:42:09 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:8b39:c3f3:f502:5c4e])
 by serve.minyard.net (Postfix) with ESMTPSA id 83BCB18000D;
 Fri,  1 May 2020 11:42:08 +0000 (UTC)
Date: Fri, 1 May 2020 06:42:01 -0500
From: Corey Minyard <minyard@acm.org>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200501114201.GE9902@minyard.net>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
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

On Thu, Apr 30, 2020 at 07:20:05PM -0700, Roman Shaposhnik wrote:
> Hi!
> 
> I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
> upstream kernel. The kernel itself works perfectly well
> on the board. When I try booting it as Dom0 under Xen,
> it goes into a stacktrace (attached).

Getting Xen working on the Pi4 requires a lot of moving parts, and they
all have to be right.

> 
> Looking at what nice folks over at Dornerworks have previously
> done to make RPi kernels boot as Dom0 I've come across these
> 3 patches:
>     https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux
> 
> The first patch seems irrelevant (unless I'm missing something
> really basic here). 

It might be irrelevant for your configuration, assuming that Xen gets
the right information from EFI.  I haven't tried EFI booting.

> The 2nd patch applied with no issue (but
> I don't think it is related) but the 3d patch failed to apply on
> account of 5.6.1 kernel no longer having:
>     dev->archdata.dev_dma_ops
> E.g.
>     https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55
> 
> I've tried to emulate the effect of the patch by simply introducing
> a static variable that would signal that we already initialized
> dev->dma_ops -- but that didn't help at all.
> 
> I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
> to see if may be they have any suggestions on how this may be dealt
> with.
> 
> Any advice would be greatly appreciated!

What's your Pi4 config.txt file look like?  The GIC is not being handled
correctly, and I'm guessing that configuration is wrong.  You can't use
the stock config.txt file with Xen, you have to modify the configuration a
bit. 

I think just adding:

enable_gic=1
total_mem=1024

might get it working, or at least solve one problem.  It's required either
way.  That might get rid of the GIC errors at the beginning.  I see a
few of those, but not that many.

My kernel command line is:

coherent_pool=1M 8250.nr_uarts=1 cma=64M cma=256M  smsc95xx.macaddr=DC:A6:32:4F:3A:CD vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000  console=hvc0 clk_ignore_unused root=/dev/mmcblk0p2 rootwait

A lot of that configuration gets pulled from the initialization done by
the GPU at startup which it put into the device tree.  I'm not sure what a
lot of it means.  Some of it is added by Xen, too.

I can verify the DMA patch is important.  I'm not sure how to apply it
to a 5.6 kernel, though.

Keep us informed when you get it working.

-corey

> 
> Thanks,
> Roman.

> grub> xen_hypervisor (hd0,gpt1)/xen dom0_mem=1024M,max:1024M dom0_max_vcpus=1
> grub> xen_module (hd0,gpt1)/kernel console=hvc0 earlyprintk=xen nomodeset
> grub> devicetree (hd0,gpt1)/bcm2711-rpi-4-b.dtb
> grub> boot
> Using modules provided by bootloader in FDT
> Xen 4.13.0 (c/s Tue Dec 17 14:19:49 2019 +0000 git:a2e84d8e42-dirty) EFI loader
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
> (XEN) RAM: 0000000007f0e000 - 000000002bc4dfff
> (XEN) RAM: 000000003cb10000 - 000000003cb10fff
> (XEN) RAM: 000000003cb12000 - 000000003cb13fff
> (XEN) RAM: 000000003cb1b000 - 000000003cb1cfff
> (XEN) RAM: 0000000040000000 - 00000000fbffffff
> (XEN)
> (XEN) MODULE[0]: 000000002bc5d000 - 000000002bd978f0 Xen
> (XEN) MODULE[1]: 000000002bc4f000 - 000000002bc5d000 Device Tree
> (XEN) MODULE[2]: 000000002bda5000 - 000000002d684200 Kernel
> (XEN)
> (XEN) CMDLINE[000000002bda5000]:chosen console=hvc0 earlyprintk=xen nomodeset
> (XEN)
> (XEN) Command line: dom0_mem=1024M,max:1024M dom0_max_vcpus=1
> (XEN) parameter "dom0_mem" has invalid value "1024M,max:1024M", rc=-22!
> (XEN) Domain heap initialised
> (XEN) Booting using Device Tree
> (XEN) Platform: Raspberry Pi 4
> (XEN) No dtuart path configured
> (XEN) Bad console= option 'dtuart'
>  Xen 4.13.0
> (XEN) Xen version 4.13.0 (@) (aarch64-linux-gnu-gcc (Ubuntu 9.3.0-10ubuntu2) 9.3.0) debug=y  Thu Apr 30 17:06:40 PDT 2020
> (XEN) Latest ChangeSet: Tue Dec 17 14:19:49 2019 +0000 git:a2e84d8e42-dirty
> (XEN) build-id: 7efa3c5cb27a98e9eb2e750fa71c8a065b9b5cb6
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
> (XEN) CPU0: Guest atomics will try 6 times before pausing the domain
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
> (XEN) alternatives: Patching with alt table 00000000002cc0b8 -> 00000000002cc7cc
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 000000002bda5000
> (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
> (XEN) BANK[0] 0x00000040000000-0x00000080000000 (1024MB)
> (XEN) Grant table range: 0x0000002bc5d000-0x0000002bc9d000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading zImage from 000000002bda5000 to 0000000040080000-000000004195f200
> (XEN) Loading d0 DTB to 0x0000000048000000-0x000000004800a45d
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
> (XEN) Freed 336kB init memory.
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
> [    0.000000] Linux version 5.6.1-default (root@0fd6d133dd12) (gcc version 8.3.0 (Alpine 8.3.0)) #1 SMP Fri May 1 00:57:26 UTC 2020
> [    0.000000] Machine model: Raspberry Pi 4 Model B
> [    0.000000] Xen 4.13 support found
> [    0.000000] efi: Getting EFI parameters from FDT:
> [    0.000000] efi: UEFI not found.
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000007fffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0x7fdc62c0-0x7fdc9fff]
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
> [    0.000000] Memory: 1001988K/1048576K available (12732K kernel code, 1852K rwdata, 6184K rodata, 4672K init, 758K bss, 46588K reserved, 0K cma-reserved)
> [    0.000000] random: get_random_u64 called from __kmem_cache_create+0x40/0x578 with crng_init=0
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=480 to nr_cpu_ids=1.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] arch_timer: cp15 timer(s) running at 54.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
> [    0.000006] sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns
> [    0.000407] Console: colour dummy device 80x25
> [    0.270969] printk: console [hvc0] enabled
> [    0.275256] Calibrating delay loop (skipped), value calculated using timer frequency.. 108.00 BogoMIPS (lpj=540000)
> [    0.285812] pid_max: default: 32768 minimum: 301
> [    0.290656] LSM: Security Framework initializing
> [    0.295354] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.302862] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.313372] xen:grant_table: Grant tables using version 1 layout
> [    0.318858] Grant table initialized
> [    0.322458] xen:events: Using FIFO-based ABI
> [    0.326906] Xen: initializing cpu0
> [    0.330509] rcu: Hierarchical SRCU implementation.
> [    0.339497] EFI services will not be available.
> [    0.343644] smp: Bringing up secondary CPUs ...
> [    0.348157] smp: Brought up 1 node, 1 CPU
> [    0.352255] SMP: Total of 1 processors activated.
> [    0.357090] CPU features: detected: 32-bit EL0 Support
> [    0.362370] CPU features: detected: CRC32 instructions
> [    0.396969] CPU: All CPU(s) started at EL1
> [    0.400556] alternatives: patching kernel code
> [    0.406538] devtmpfs: initialized
> [    0.415913] Registered cp15_barrier emulation handler
> [    0.420448] Registered setend emulation handler
> [    0.425075] KASLR disabled due to lack of seed
> [    0.430042] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.439701] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
> [    0.446817] pinctrl core: initialized pinctrl subsystem
> [    0.453132] thermal_sys: Registered thermal governor 'fair_share'
> [    0.453135] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.458685] thermal_sys: Registered thermal governor 'step_wise'
> [    0.464876] thermal_sys: Registered thermal governor 'user_space'
> [    0.471103] DMI not present or invalid.
> [    0.481720] NET: Registered protocol family 16
> [    0.486012] DMA: preallocated 256 KiB pool for atomic allocations
> [    0.491985] audit: initializing netlink subsys (disabled)
> [    0.498698] audit: type=2000 audit(0.380:1): state=initialized audit_enabled=0 res=1
> [    0.506554] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.512934] ASID allocator initialised with 65536 entries
> [    0.518458] xen:swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB
> [    0.528189] software IO TLB: mapped [mem 0x7f000000-0x7f400000] (4MB)
> [    0.535335] Serial: AMBA PL011 UART driver
> [    0.558051] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.564260] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
> [    0.571085] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.577937] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
> [    0.589021] cryptd: max_cpu_qlen set to 1000
> [    0.599047] ACPI: Interpreter disabled.
> [    0.602732] xen:balloon: Initialising balloon driver
> [    0.608655] iommu: Default domain type: Translated
> [    0.613276] vgaarb: loaded
> [    0.616165] SCSI subsystem initialized
> [    0.620387] usbcore: registered new interface driver usbfs
> [    0.625355] usbcore: registered new interface driver hub
> [    0.630873] usbcore: registered new device driver usb
> [    0.636092] usb_phy_generic phy: phy supply vcc not found, using dummy regulator
> [    0.643895] pps_core: LinuxPPS API ver. 1 registered
> [    0.648588] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    0.657925] PTP clock support registered
> [    0.662062] EDAC MC: Ver: 3.0.0
> [    0.666429] NetLabel: Initializing
> [    0.669282] NetLabel:  domain hash size = 128
> [    0.673736] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    0.679613] NetLabel:  unlabeled traffic allowed by default
> [    0.685781] clocksource: Switched to clocksource arch_sys_counter
> [    0.691755] VFS: Disk quotas dquot_6.6.0
> [    0.695574] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.702750] pnp: PnP ACPI: disabled
> [    0.712964] NET: Registered protocol family 2
> [    0.717281] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
> [    0.725295] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.733251] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, linear)
> [    0.740681] TCP: Hash tables configured (established 8192 bind 8192)
> [    0.747237] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.753829] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.761207] NET: Registered protocol family 1
> [    0.765514] PCI: CLS 0 bytes, default 64
> [    0.770055] kvm [1]: HYP mode not available
> [    0.781176] Initialise system trusted keyrings
> [    0.785193] workingset: timestamp_bits=40 max_order=18 bucket_order=0
> [    0.798000] zbud: loaded
> [    0.801467] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.807330] 9p: Installing v9fs 9p2000 file system support
> [    0.836097] Key type asymmetric registered
> [    0.839630] Asymmetric key parser 'x509' registered
> [    0.844666] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
> [    0.852346] io scheduler mq-deadline registered
> [    0.856864] io scheduler kyber registered
> [    0.861133] io scheduler bfq registered
> [    0.869795] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [    0.877226] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
> [    0.883677] brcm-pcie fd500000.pcie:      MEM 0x0600000000..0x0603ffffff -> 0x00f8000000
> [    0.891977] brcm-pcie fd500000.pcie:   IB MEM 0x0000000000..0x00bfffffff -> 0x0000000000
> [    0.955808] brcm-pcie fd500000.pcie: link up, 5 GT/s x1 (!SSC)
> [    0.961312] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
> [    0.967524] pci_bus 0000:00: root bus resource [bus 00-01]
> [    0.973126] pci_bus 0000:00: root bus resource [mem 0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
> [    0.983696] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
> [    0.989897] pci 0000:00:00.0: PME# supported from D0 D3hot
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    1.005812] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> [    1.016400] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> [    1.023993] pci 0000:01:00.0: [1106:3483] type 00 class 0x0c0330
> [    1.030073] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
> [    1.037089] pci 0000:01:00.0: PME# supported from D0 D3cold
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    1.047883] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> [    1.058420] pci_bus 0000:01: busn_res: [bus 01] end is updated to 01
> [    1.064252] pci 0000:00:00.0: BAR 14: assigned [mem 0x600000000-0x6000fffff]
> [    1.071453] pci 0000:01:00.0: BAR 0: assigned [mem 0x600000000-0x600000fff 64bit]
> [    1.079094] pci 0000:00:00.0: PCI bridge to [bus 01]
> [    1.084165] pci 0000:00:00.0:   bridge window [mem 0x600000000-0x6000fffff]
> [    1.091426] pcieport 0000:00:00.0: enabling device (0000 -> 0002)
> [    1.097659] pcieport 0000:00:00.0: PME: Signaling with IRQ 36
> [    1.103675] pcieport 0000:00:00.0: AER: enabled with IRQ 36
> [    1.109273] pci 0000:01:00.0: enabling device (0000 -> 0002)
> (XEN) traps.c:1972:d0v0 HSR=0x93800005 pc=0xffff8000108e3564 gva=0xffff80001001d010 gpa=0x00000600000010
> [    1.124234] Unhandled fault at 0xffff80001001d010
> [    1.129039] Mem abort info:
> [    1.131926]   ESR = 0x96000000
> [    1.135089]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.140542]   SET = 0, FnV = 0
> [    1.143691]   EA = 0, S1PTW = 0
> [    1.146950] Data abort info:
> [    1.149926]   ISV = 0, ISS = 0x00000000
> [    1.153877]   CM = 0, WnR = 0
> [    1.156965] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000412fe000
> [    1.163800] [ffff80001001d010] pgd=000000007ffff003, pud=000000007fffe003, pmd=000000007fffd003, pte=0068000600000707
> [    1.174614] Internal error: ttbr address size fault: 96000000 [#1] SMP
> [    1.181272] Modules linked in:
> [    1.184438] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.1-default #1
> [    1.191106] Hardware name: Raspberry Pi 4 Model B (DT)
> [    1.196386] pstate: 60000005 (nZCv daif -PAN -UAO)
> [    1.201307] pc : quirk_usb_early_handoff+0x4fc/0x870
> [    1.206398] lr : quirk_usb_early_handoff+0x4ec/0x870
> [    1.211476] sp : ffff8000100139f0
> [    1.214901] x29: ffff8000100139f0 x28: ffff00003dd8c080
> [    1.220345] x27: ffff00003fdf4c70 x26: ffff8000108e3068
> [    1.225797] x25: ffff800011964050 x24: 00000000396dfbf8
> [    1.231232] x23: 000000000000ffff x22: ffff80001001d000
> [    1.236684] x21: 0000000000001000 x20: ffff80001179b548
> [    1.242119] x19: ffff00003dcac000 x18: ffff8000111dba48
> [    1.247564] x17: 0000000000000001 x16: 00000000deadbeef
> [    1.253007] x15: 0000000600000000 x14: ffff800010025000
> [    1.258451] x13: ffff80001001d000 x12: ffff00003f804440
> [    1.263895] x11: ffff800011461928 x10: ffff800010013510
> [    1.269339] x9 : 0000000000001000 x8 : ffff8000117b2d58
> [    1.274782] x7 : 0000000000000000 x6 : ffff80001001d000
> [    1.280226] x5 : ffff00003ffff000 x4 : ffff00003fffe400
> [    1.285670] x3 : 0068000000000707 x2 : 0140000000000000
> [    1.291114] x1 : 00008005effe3000 x0 : ffff80001001d010
> [    1.296567] Call trace:
> [    1.299111]  quirk_usb_early_handoff+0x4fc/0x870
> [    1.303850]  pci_do_fixups+0xe0/0x138
> [    1.307625]  pci_fixup_device+0x4c/0x130
> [    1.311664]  pci_bus_add_device+0x20/0xb8
> [    1.315799]  pci_bus_add_devices+0x38/0x88
> [    1.320004]  pci_bus_add_devices+0x68/0x88
> [    1.324220]  brcm_pcie_probe+0x768/0xb28
> [    1.328259]  platform_drv_probe+0x50/0xa0
> [    1.332387]  really_probe+0xd8/0x438
> [    1.336083]  driver_probe_device+0xdc/0x130
> [    1.340376]  device_driver_attach+0x6c/0x78
> [    1.344679]  __driver_attach+0x9c/0x168
> [    1.348630]  bus_for_each_dev+0x70/0xc0
> [    1.352581]  driver_attach+0x20/0x28
> [    1.356278]  bus_add_driver+0x190/0x220
> [    1.360220]  driver_register+0x60/0x110
> [    1.364169]  __platform_driver_register+0x44/0x50
> [    1.369001]  brcm_pcie_driver_init+0x18/0x20
> [    1.373391]  do_one_initcall+0x74/0x1b0
> [    1.377342]  kernel_init_freeable+0x214/0x2b0
> [    1.381820]  kernel_init+0x10/0x100
> [    1.385418]  ret_from_fork+0x10/0x18
> [    1.389112] Code: aa0003f6 b4ffdce0 91004000 a90363f7 (b9400000)
> [    1.395351] ---[ end trace 8a644ac18423f457 ]---
> [    1.400143] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    1.407898] Kernel Offset: disabled
> [    1.411496] CPU features: 0x10002,61006000
> [    1.415717] Memory Limit: none
> [    1.418874] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---



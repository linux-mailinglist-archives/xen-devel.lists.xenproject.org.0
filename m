Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB36F00F9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 08:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526885.818934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prvKE-0004w1-F4; Thu, 27 Apr 2023 06:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526885.818934; Thu, 27 Apr 2023 06:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prvKE-0004uG-Be; Thu, 27 Apr 2023 06:41:54 +0000
Received: by outflank-mailman (input) for mailman id 526885;
 Thu, 27 Apr 2023 06:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8CS=AS=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1prvKC-0004uA-Oy
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 06:41:53 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c352b0-e4c6-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 08:41:47 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-52079a12451so6062737a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 23:41:48 -0700 (PDT)
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
X-Inumbo-ID: 94c352b0-e4c6-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682577707; x=1685169707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EP2CuVw1sQBqyKNWGbgs/xR1rv9yEs96g44ek0mlGcE=;
        b=Iv+EakVmXXSmeMeWfZiW7FzPdbI+mQ1nB1rIkn35yBqaNqy4vDlpl1FYNKbhn2Ayyr
         +/LArkarvQhV7v41GB0Z5Y4obMIqv8xBUhdXAniyfcAA6mGhvVQb3IzFurnAGn9KBBb7
         NMG41KVz2IG5lc5vthagQOYcUHvkjGLlb6L4m1n5RyAeO3H7a9QjfZ6aMXpui+V7pdqT
         5pKLzV0K2uC5eur3/jHIQ02WP4Syer3L1dhKLp5fbJwUpPPPRqrMrCunHid70XeHQeX8
         x5Ev6li9PLQvNi/wlGGJdM0sBdV2FIRzs7tI1Y2HOaQMWpV7aKhPAXddyP6p05oevSi9
         mrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682577707; x=1685169707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EP2CuVw1sQBqyKNWGbgs/xR1rv9yEs96g44ek0mlGcE=;
        b=U/j+pID0LFRXR845ccbRpTXdTZ+7wMZOzCREWc6kpvYUH6ac21VcPz6QCHpCoUfK8m
         LB15T6sKjfk6HBx38Esf9TAOaytyojeZyz1pBfUfs8HOHveoR49CReEpMdNHqbVH2DNa
         6VR3mpo8CbH79DKgbQxnlQu12YYkLBF8KE4ZogTKHNI9zoyJqdDluHVx/7rhRMy8xQA+
         k10i578icxniMjupQ7zp92bA9KmA8suv3xX3cdYhh8HaxR1sKmLur28E8TaJOhZ0MY3o
         ZuSe+umrbq7lTs0fJq6HiGvxQ+6quxkvnzWkafesyoHqrD6mCA3/OYWLbH5YLbfkEQF+
         qUPA==
X-Gm-Message-State: AC+VfDxa1AMVk+x3s0wb2ipvMdMEiQYjhELHhtuMVTp2AijPgZbEfIWI
	tDTg9CdUBTWn65KoLn/f6MzYFP9/N008QIg7IxE=
X-Google-Smtp-Source: ACHHUZ4tUXVsEGineD0PrAwrJrzskV+t+pwwZvOM3dkEFqDrWLZGDAeap5EXnL18PpA/GkHudmVHp3oMrx8A7WiOv+w=
X-Received: by 2002:a17:90b:1645:b0:247:e4c:d168 with SMTP id
 il5-20020a17090b164500b002470e4cd168mr862046pjb.10.1682577706201; Wed, 26 Apr
 2023 23:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
 <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop>
 <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com>
 <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
 <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com>
 <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com> <CA+SAi2upd1P=KzbQS2BpD5zr3+OA=mrq7JiC7Zou9XSEJ_OYhA@mail.gmail.com>
 <43f5fdaa-47c7-6ec9-c477-dac62a5bceae@amd.com> <CA+SAi2uBmnUA0Z=+Ji_jaoOGjS8H8ea1_aRuRm=_B89oidxHCA@mail.gmail.com>
 <alpine.DEB.2.22.394.2304241337280.3419@ubuntu-linux-20-04-desktop>
 <CA+SAi2tPrvUYhkF2cmch5zowRqmpvJ6Cq0scxGHEaczhiDaJnw@mail.gmail.com> <alpine.DEB.2.22.394.2304251120530.3419@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2304251120530.3419@ubuntu-linux-20-04-desktop>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Thu, 27 Apr 2023 09:46:16 +0300
Message-ID: <CA+SAi2vWP76fxNS3wCWumNFSBd9knVmdSdStsfRpfOr1iQQw+A@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>, 
	Stewart.Hildebrand@amd.com
Content-Type: multipart/alternative; boundary="0000000000007c382805fa4ba681"

--0000000000007c382805fa4ba681
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefano,

Thanks for clarification.
We nighter use ImageBuilder nor uboot boot script.
A model is zcu102 compatible.

Regards,
O.

=D0=B2=D1=82, 25 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 21:21, Ste=
fano Stabellini <sstabellini@kernel.org>:

> This is interesting. Are you using Xilinx hardware by any chance? If so,
> which board?
>
> Are you using ImageBuilder to generate your boot.scr boot script? If so,
> could you please post your ImageBuilder config file? If not, can you
> post the source of your uboot boot script?
>
> SErrors are supposed to be related to a hardware failure of some kind.
> You are not supposed to be able to trigger an SError easily by
> "mistake". I have not seen SErrors due to wrong cache coloring
> configurations on any Xilinx board before.
>
> The differences between Xen with and without cache coloring from a
> hardware perspective are:
>
> - With cache coloring, the SMMU is enabled and does address translations
>   even for dom0. Without cache coloring the SMMU could be disabled, and
>   if enabled, the SMMU doesn't do any address translations for Dom0. If
>   there is a hardware failure related to SMMU address translation it
>   could only trigger with cache coloring. This would be my normal
>   suggestion for you to explore, but the failure happens too early
>   before any DMA-capable device is programmed. So I don't think this can
>   be the issue.
>
> - With cache coloring, the memory allocation is very different so you'll
>   end up using different DDR regions for Dom0. So if your DDR is
>   defective, you might only see a failure with cache coloring enabled
>   because you end up using different regions.
>
>
> On Tue, 25 Apr 2023, Oleg Nikitenko wrote:
> > Hi Stefano,
> >
> > Thank you.
> > If I build xen without colors support there is not this error.
> > All the domains are booted well.
> > Hense it can not be a hardware issue.
> > This panic arrived during unpacking the rootfs.
> > Here I attached the boot log xen/Dom0 without color.
> > A highlighted strings printed exactly after the place where 1-st time
> panic arrived.
> >
> >  Xen 4.16.1-pre
> > (XEN) Xen version 4.16.1-pre (nole2390@(none))
> (aarch64-portable-linux-gcc (GCC) 11.3.0) debug=3Dy 2023-04-21
> > (XEN) Latest ChangeSet: Wed Apr 19 12:56:14 2023 +0300
> git:321687b231-dirty
> > (XEN) build-id: c1847258fdb1b79562fc710dda40008f96c0fde5
> > (XEN) Processor: 00000000410fd034: "ARM Limited", variant: 0x0, part
> 0xd03,rev 0x4
> > (XEN) 64-bit Execution:
> > (XEN)   Processor Features: 0000000000002222 0000000000000000
> > (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> > (XEN)     Extensions: FloatingPoint AdvancedSIMD
> > (XEN)   Debug Features: 0000000010305106 0000000000000000
> > (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> > (XEN)   Memory Model Features: 0000000000001122 0000000000000000
> > (XEN)   ISA Features:  0000000000011120 0000000000000000
> > (XEN) 32-bit Execution:
> > (XEN)   Processor Features: 0000000000000131:0000000000011011
> > (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> > (XEN)     Extensions: GenericTimer Security
> > (XEN)   Debug Features: 0000000003010066
> > (XEN)   Auxiliary Features: 0000000000000000
> > (XEN)   Memory Model Features: 0000000010201105 0000000040000000
> > (XEN)                          0000000001260000 0000000002102211
> > (XEN)   ISA Features: 0000000002101110 0000000013112111 000000002123204=
2
> > (XEN)                 0000000001112131 0000000000011142 000000000001112=
1
> > (XEN) Using SMC Calling Convention v1.2
> > (XEN) Using PSCI v1.1
> > (XEN) SMP: Allowing 4 CPUs
> > (XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 100000 KHz
> > (XEN) GICv2 initialization:
> > (XEN)         gic_dist_addr=3D00000000f9010000
> > (XEN)         gic_cpu_addr=3D00000000f9020000
> > (XEN)         gic_hyp_addr=3D00000000f9040000
> > (XEN)         gic_vcpu_addr=3D00000000f9060000
> > (XEN)         gic_maintenance_irq=3D25
> > (XEN) GICv2: Adjusting CPU interface base to 0xf902f000
> > (XEN) GICv2: 192 lines, 4 cpus, secure (IID 0200143b).
> > (XEN) Using scheduler: null Scheduler (null)
> > (XEN) Initializing null scheduler
> > (XEN) WARNING: This is experimental software in development.
> > (XEN) Use at your own risk.
> > (XEN) Allocated console ring of 32 KiB.
> > (XEN) CPU0: Guest atomics will try 12 times before pausing the domain
> > (XEN) Bringing up CPU1
> > (XEN) CPU1: Guest atomics will try 13 times before pausing the domain
> > (XEN) CPU 1 booted.
> > (XEN) Bringing up CPU2
> > (XEN) CPU2: Guest atomics will try 13 times before pausing the domain
> > (XEN) CPU 2 booted.
> > (XEN) Bringing up CPU3
> > (XEN) CPU3: Guest atomics will try 13 times before pausing the domain
> > (XEN) Brought up 4 CPUs
> > (XEN) CPU 3 booted.
> > (XEN) smmu: /axi/smmu@fd800000: probing hardware configuration...
> > (XEN) smmu: /axi/smmu@fd800000: SMMUv2 with:
> > (XEN) smmu: /axi/smmu@fd800000: stage 2 translation
> > (XEN) smmu: /axi/smmu@fd800000: stream matching with 48 register
> groups, mask 0x7fff<2>smmu: /axi/smmu@fd800000: 16 context banks (0
> > stage-2 only)
> > (XEN) smmu: /axi/smmu@fd800000: Stage-2: 48-bit IPA -> 48-bit PA
> > (XEN) smmu: /axi/smmu@fd800000: registered 29 master devices
> > (XEN) I/O virtualisation enabled
> > (XEN)  - Dom0 mode: Relaxed
> > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> > (XEN) alternatives: Patching with alt table 00000000002cc5c8 ->
> 00000000002ccb2c
> > (XEN) *** LOADING DOMAIN 0 ***
> > (XEN) Loading d0 kernel from boot module @ 0000000001000000
> > (XEN) Loading ramdisk from boot module @ 0000000002000000
> > (XEN) Allocating 1:1 mappings totalling 1600MB for dom0:
> > (XEN) BANK[0] 0x00000010000000-0x00000020000000 (256MB)
> > (XEN) BANK[1] 0x00000024000000-0x00000028000000 (64MB)
> > (XEN) BANK[2] 0x00000030000000-0x00000080000000 (1280MB)
> > (XEN) Grant table range: 0x00000000e00000-0x00000000e40000
> > (XEN) smmu: /axi/smmu@fd800000: d0: p2maddr 0x000000087bf94000
> > (XEN) Allocating PPI 16 for event channel interrupt
> > (XEN) Extended region 0: 0x81200000->0xa0000000
> > (XEN) Extended region 1: 0xb1200000->0xc0000000
> > (XEN) Extended region 2: 0xc8000000->0xe0000000
> > (XEN) Extended region 3: 0xf0000000->0xf9000000
> > (XEN) Extended region 4: 0x100000000->0x600000000
> > (XEN) Extended region 5: 0x880000000->0x8000000000
> > (XEN) Extended region 6: 0x8001000000->0x10000000000
> > (XEN) Loading zImage from 0000000001000000 to
> 0000000010000000-0000000010e41008
> > (XEN) Loading d0 initrd from 0000000002000000 to
> 0x0000000013600000-0x000000001ff3a617
> > (XEN) Loading d0 DTB to 0x0000000013400000-0x000000001340cbdc
> > (XEN) Initial low memory virq threshold set at 0x4000 pages.
> > (XEN) Std. Loglevel: All
> > (XEN) Guest Loglevel: All
> > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch
> input)
> > (XEN) null.c:353: 0 <-- d0v0
> > (XEN) Freed 356kB init memory.
> > (XEN) d0v0 Unhandled SMC/HVC: 0x84000050
> > (XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01
> > (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> > (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> > (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> > (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> > (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> > (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> > [    0.000000] Linux version 5.15.72-xilinx-v2022.1 (oe-user@oe-host)
> (aarch64-portable-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils)
> > 2.38.20220708) #1 SMP Tue Feb 21 05:47:54 UTC 2023
> > [    0.000000] Machine model: D14 Viper Board - White Unit
> > [    0.000000] Xen 4.16 support found
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000010000000-0x000000007fffffff]
> > [    0.000000]   DMA32    empty
> > [    0.000000]   Normal   empty
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000010000000-0x000000001fffffff]
> > [    0.000000]   node   0: [mem 0x0000000022000000-0x0000000022147fff]
> > [    0.000000]   node   0: [mem 0x0000000022200000-0x0000000022347fff]
> > [    0.000000]   node   0: [mem 0x0000000024000000-0x0000000027ffffff]
> > [    0.000000]   node   0: [mem 0x0000000030000000-0x000000007fffffff]
> > [    0.000000] Initmem setup node 0 [mem
> 0x0000000010000000-0x000000007fffffff]
> > [    0.000000] On node 0, zone DMA: 8192 pages in unavailable ranges
> > [    0.000000] On node 0, zone DMA: 184 pages in unavailable ranges
> > [    0.000000] On node 0, zone DMA: 7352 pages in unavailable ranges
> > [    0.000000] cma: Reserved 256 MiB at 0x000000006e000000
> > [    0.000000] psci: probing for conduit method from DT.
> > [    0.000000] psci: PSCIv1.1 detected in firmware.
> > [    0.000000] psci: Using standard PSCI v0.2 function IDs
> > [    0.000000] psci: Trusted OS migration not required
> > [    0.000000] psci: SMC Calling Convention v1.1
> > [    0.000000] percpu: Embedded 16 pages/cpu s32792 r0 d32744 u65536
> > [    0.000000] Detected VIPT I-cache on CPU0
> > [    0.000000] CPU features: kernel page table isolation forced ON by
> KASLR
> > [    0.000000] CPU features: detected: Kernel page table isolation (KPT=
I)
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
> 403845
> > [    0.000000] Kernel command line: console=3Dhvc0 earlycon=3Dxen
> earlyprintk=3Dxen clk_ignore_unused fips=3D1 root=3D/dev/ram0 maxcpus=3D2
> > [    0.000000] Unknown kernel command line parameters "earlyprintk=3Dxe=
n
> fips=3D1", will be passed to user space.
> > [    0.000000] Dentry cache hash table entries: 262144 (order: 9,
> 2097152 bytes, linear)
> > [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 104857=
6
> bytes, linear)
> > [    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:on
> > [    0.000000] mem auto-init: clearing system memory may take some
> time...
> > [    0.000000] Memory: 1121936K/1641024K available (9728K kernel code,
> 836K rwdata, 2396K rodata, 1536K init, 262K bss, 256944K reserved,
> > 262144K cma-reserved)
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
2, Nodes=3D1
> > [    0.000000] rcu: Hierarchical RCU implementation.
> > [    0.000000] rcu: RCU event tracing is enabled.
> > [    0.000000] rcu: RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=
=3D2.
> > [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> is 25 jiffies.
> > [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16,
> nr_cpu_ids=3D2
> > [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> > [    0.000000] Root IRQ handler: gic_handle_irq
> > [    0.000000] arch_timer: cp15 timer(s) running at 100.00MHz (virt).
> > [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
> max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
> > [    0.000000] sched_clock: 56 bits at 100MHz, resolution 10ns, wraps
> every 4398046511100ns
> > [    0.000258] Console: colour dummy device 80x25
> > [    0.310231] printk: console [hvc0] enabled
> > [    0.314403] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 200.00 BogoMIPS (lpj=3D400000)
> > [    0.324851] pid_max: default: 32768 minimum: 301
> > [    0.329706] LSM: Security Framework initializing
> > [    0.334204] Yama: becoming mindful.
> > [    0.337865] Mount-cache hash table entries: 4096 (order: 3, 32768
> bytes, linear)
> > [    0.345180] Mountpoint-cache hash table entries: 4096 (order: 3,
> 32768 bytes, linear)
> > [    0.354743] xen:grant_table: Grant tables using version 1 layout
> > [    0.359132] Grant table initialized
> > [    0.362664] xen:events: Using FIFO-based ABI
> > [    0.366993] Xen: initializing cpu0
> > [    0.370515] rcu: Hierarchical SRCU implementation.
> > [    0.375930] smp: Bringing up secondary CPUs ...
> > (XEN) null.c:353: 1 <-- d0v1
> > (XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> > [    0.382549] Detected VIPT I-cache on CPU1
> > [    0.388712] Xen: initializing cpu1
> > [    0.388743] CPU1: Booted secondary processor 0x0000000001 [0x410fd03=
4]
> > [    0.388829] smp: Brought up 1 node, 2 CPUs
> > [    0.406941] SMP: Total of 2 processors activated.
> > [    0.411698] CPU features: detected: 32-bit EL0 Support
> > [    0.416888] CPU features: detected: CRC32 instructions
> > [    0.422121] CPU: All CPU(s) started at EL1
> > [    0.426248] alternatives: patching kernel code
> > [    0.431424] devtmpfs: initialized
> > [    0.441454] KASLR enabled
> > [    0.441602] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> > [    0.448321] futex hash table entries: 512 (order: 3, 32768 bytes,
> linear)
> > [    0.496183] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> > [    0.498277] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic
> allocations
> > [    0.503772] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for
> atomic allocations
> > [    0.511610] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for
> atomic allocations
> > [    0.519478] audit: initializing netlink subsys (disabled)
> > [    0.524985] audit: type=3D2000 audit(0.336:1): state=3Dinitialized
> audit_enabled=3D0 res=3D1
> > [    0.529169] thermal_sys: Registered thermal governor 'step_wise'
> > [    0.533023] hw-breakpoint: found 6 breakpoint and 4 watchpoint
> registers.
> > [    0.545608] ASID allocator initialised with 32768 entries
> > [    0.551030] xen:swiotlb_xen: Warning: only able to allocate 4 MB for
> software IO TLB
> > [    0.559332] software IO TLB: mapped [mem
> 0x0000000011800000-0x0000000011c00000] (4MB)
> > [    0.583565] HugeTLB registered 1.00 GiB page size, pre-allocated 0
> pages
> > [    0.584721] HugeTLB registered 32.0 MiB page size, pre-allocated 0
> pages
> > [    0.591478] HugeTLB registered 2.00 MiB page size, pre-allocated 0
> pages
> > [    0.598225] HugeTLB registered 64.0 KiB page size, pre-allocated 0
> pages
> > [    0.636520] DRBG: Continuing without Jitter RNG
> > [    0.737187] raid6: neonx8   gen()  2143 MB/s
> > [    0.805294] raid6: neonx8   xor()  1589 MB/s
> > [    0.873406] raid6: neonx4   gen()  2177 MB/s
> > [    0.941499] raid6: neonx4   xor()  1556 MB/s
> > [    1.009612] raid6: neonx2   gen()  2072 MB/s
> > [    1.077715] raid6: neonx2   xor()  1430 MB/s
> > [    1.145834] raid6: neonx1   gen()  1769 MB/s
> > [    1.213935] raid6: neonx1   xor()  1214 MB/s
> > [    1.282046] raid6: int64x8  gen()  1366 MB/s
> > [    1.350132] raid6: int64x8  xor()   773 MB/s
> > [    1.418259] raid6: int64x4  gen()  1602 MB/s
> > [    1.486349] raid6: int64x4  xor()   851 MB/s
> > [    1.554464] raid6: int64x2  gen()  1396 MB/s
> > [    1.622561] raid6: int64x2  xor()   744 MB/s
> > [    1.690687] raid6: int64x1  gen()  1033 MB/s
> > [    1.758770] raid6: int64x1  xor()   517 MB/s
> > [    1.758809] raid6: using algorithm neonx4 gen() 2177 MB/s
> > [    1.762941] raid6: .... xor() 1556 MB/s, rmw enabled
> > [    1.767957] raid6: using neon recovery algorithm
> > [    1.772824] xen:balloon: Initialising balloon driver
> > [    1.778021] iommu: Default domain type: Translated
> > [    1.782584] iommu: DMA domain TLB invalidation policy: strict mode
> > [    1.789149] SCSI subsystem initialized
> > [    1.792820] usbcore: registered new interface driver usbfs
> > [    1.798254] usbcore: registered new interface driver hub
> > [    1.803626] usbcore: registered new device driver usb
> > [    1.808761] pps_core: LinuxPPS API ver. 1 registered
> > [    1.813716] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
> Rodolfo Giometti <giometti@linux.it>
> > [    1.822903] PTP clock support registered
> > [    1.826893] EDAC MC: Ver: 3.0.0
> > [    1.830375] zynqmp-ipi-mbox mailbox@ff990400: Registered ZynqMP IPI
> mbox with TX/RX channels.
> > [    1.838863] zynqmp-ipi-mbox mailbox@ff990600: Registered ZynqMP IPI
> mbox with TX/RX channels.
> > [    1.847356] zynqmp-ipi-mbox mailbox@ff990800: Registered ZynqMP IPI
> mbox with TX/RX channels.
> > [    1.855907] FPGA manager framework
> > [    1.859952] clocksource: Switched to clocksource arch_sys_counter
> > [    1.871712] NET: Registered PF_INET protocol family
> > [    1.871838] IP idents hash table entries: 32768 (order: 6, 262144
> bytes, linear)
> > [    1.879392] tcp_listen_portaddr_hash hash table entries: 1024 (order=
:
> 2, 16384 bytes, linear)
> > [    1.887078] Table-perturb hash table entries: 65536 (order: 6, 26214=
4
> bytes, linear)
> > [    1.894846] TCP established hash table entries: 16384 (order: 5,
> 131072 bytes, linear)
> > [    1.902900] TCP bind hash table entries: 16384 (order: 6, 262144
> bytes, linear)
> > [    1.910350] TCP: Hash tables configured (established 16384 bind 1638=
4)
> > [    1.916778] UDP hash table entries: 1024 (order: 3, 32768 bytes,
> linear)
> > [    1.923509] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes=
,
> linear)
> > [    1.930759] NET: Registered PF_UNIX/PF_LOCAL protocol family
> > [    1.936834] RPC: Registered named UNIX socket transport module.
> > [    1.942342] RPC: Registered udp transport module.
> > [    1.947088] RPC: Registered tcp transport module.
> > [    1.951843] RPC: Registered tcp NFSv4.1 backchannel transport module=
.
> > [    1.958334] PCI: CLS 0 bytes, default 64
> > [    1.962709] Trying to unpack rootfs image as initramfs...
> > [    1.977090] workingset: timestamp_bits=3D62 max_order=3D19 bucket_or=
der=3D0
> > [    1.982863] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
> > [    2.021045] NET: Registered PF_ALG protocol family
> > [    2.021122] xor: measuring software checksum speed
> > [    2.029347]    8regs           :  2366 MB/sec
> > [    2.033081]    32regs          :  2802 MB/sec
> > [    2.038223]    arm64_neon      :  2320 MB/sec
> > [    2.038385] xor: using function: 32regs (2802 MB/sec)
> > [    2.043614] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 247)
> > [    2.050959] io scheduler mq-deadline registered
> > [    2.055521] io scheduler kyber registered
> > [    2.068227] xen:xen_evtchn: Event-channel device installed
> > [    2.069281] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> > [    2.076190] cacheinfo: Unable to detect cache hierarchy for CPU 0
> > [    2.085548] brd: module loaded
> > [    2.089290] loop: module loaded
> > [    2.089341] Invalid max_queues (4), will use default max: 2.
> > [    2.094565] tun: Universal TUN/TAP device driver, 1.6
> > [    2.098655] xen_netfront: Initialising Xen virtual ethernet driver
> > [    2.104156] usbcore: registered new interface driver rtl8150
> > [    2.109813] usbcore: registered new interface driver r8152
> > [    2.115367] usbcore: registered new interface driver asix
> > [    2.120794] usbcore: registered new interface driver ax88179_178a
> > [    2.126934] usbcore: registered new interface driver cdc_ether
> > [    2.132816] usbcore: registered new interface driver cdc_eem
> > [    2.138527] usbcore: registered new interface driver net1080
> > [    2.144256] usbcore: registered new interface driver cdc_subset
> > [    2.150205] usbcore: registered new interface driver zaurus
> > [    2.155837] usbcore: registered new interface driver cdc_ncm
> > [    2.161550] usbcore: registered new interface driver r8153_ecm
> > [    2.168240] usbcore: registered new interface driver cdc_acm
> > [    2.173109] cdc_acm: USB Abstract Control Model driver for USB modem=
s
> and ISDN adapters
> > [    2.181358] usbcore: registered new interface driver uas
> > [    2.186547] usbcore: registered new interface driver usb-storage
> > [    2.192643] usbcore: registered new interface driver ftdi_sio
> > [    2.198384] usbserial: USB Serial support registered for FTDI USB
> Serial Device
> > [    2.206118] udc-core: couldn't find an available UDC - added
> [g_mass_storage] to list of pending drivers
> > [    2.215332] i2c_dev: i2c /dev entries driver
> > [    2.220467] xen_wdt xen_wdt: initialized (timeout=3D60s, nowayout=3D=
0)
> > [    2.225923] device-mapper: uevent: version 1.0.3
> > [    2.230668] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22)
> initialised: dm-devel@redhat.com
> > [    2.239315] EDAC MC0: Giving out device to module 1 controller
> synps_ddr_controller: DEV synps_edac (INTERRUPT)
> > [    2.249405] EDAC DEVICE0: Giving out device to module zynqmp-ocm-eda=
c
> controller zynqmp_ocm: DEV ff960000.memory-controller (INTERRUPT)
> > [    2.261719] sdhci: Secure Digital Host Controller Interface driver
> > [    2.267487] sdhci: Copyright(c) Pierre Ossman
> > [    2.271890] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    2.278157] ledtrig-cpu: registered to indicate activity on CPUs
> > [    2.283816] zynqmp_firmware_probe Platform Management API v1.1
> > [    2.289554] zynqmp_firmware_probe Trustzone version v1.0
> > [    2.327875] securefw securefw: securefw probed
> > [    2.328324] alg: No test for xilinx-zynqmp-aes (zynqmp-aes)
> > [    2.332563] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: AES
> Successfully Registered
> > [    2.341183] alg: No test for xilinx-zynqmp-rsa (zynqmp-rsa)
> > [    2.347667] remoteproc remoteproc0: ff9a0000.rf5ss:r5f_0 is availabl=
e
> > [    2.353003] remoteproc remoteproc1: ff9a0000.rf5ss:r5f_1 is availabl=
e
> > [    2.362605] fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registere=
d
> > [    2.366540] viper-xen-proxy viper-xen-proxy: Viper Xen Proxy
> registered
> > [    2.372525] viper-vdpp a4000000.vdpp: Device Tree Probing
> > [    2.377778] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info:
> 1.512.15.0 KeyLen: 32
> > [    2.386432] viper-vdpp a4000000.vdpp: Unable to register tamper
> handler. Retrying...
> > [    2.394094] viper-vdpp-net a5000000.vdpp_net: Device Tree Probing
> > [    2.399854] viper-vdpp-net a5000000.vdpp_net: Device registered
> > [    2.405931] viper-vdpp-stat a8000000.vdpp_stat: Device Tree Probing
> > [    2.412037] viper-vdpp-stat a8000000.vdpp_stat: Build parameters: VT=
I
> Count: 512 Event Count: 32
> > [    2.420856] default preset
> > [    2.423797] viper-vdpp-stat a8000000.vdpp_stat: Device registered
> > [    2.430054] viper-vdpp-rng ac000000.vdpp_rng: Device Tree Probing
> > [    2.435948] viper-vdpp-rng ac000000.vdpp_rng: Device registered
> > [    2.441976] vmcu driver init
> > [    2.444922] VMCU: : (240:0) registered
> > [    2.444956] In K81 Updater init
> > [    2.449003] pktgen: Packet Generator for packet performance testing.
> Version: 2.75
> > [    2.468833] Initializing XFRM netlink socket
> > [    2.468902] NET: Registered PF_PACKET protocol family
> > [    2.472729] Bridge firewalling registered
> > [    2.476785] 8021q: 802.1Q VLAN Support v1.8
> > [    2.481341] registered taskstats version 1
> > [    2.486394] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dno, fsver=
ity=3Dno
> > [    2.503145] ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq =3D 36,
> base_baud =3D 6250000) is a xuartps
> > [    2.507103] of-fpga-region fpga-full: FPGA Region probed
> > [    2.512986] xilinx-zynqmp-dma fd500000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.520267] xilinx-zynqmp-dma fd510000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.528239] xilinx-zynqmp-dma fd520000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.536152] xilinx-zynqmp-dma fd530000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.544153] xilinx-zynqmp-dma fd540000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.552127] xilinx-zynqmp-dma fd550000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.560178] xilinx-zynqmp-dma ffa80000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.567987] xilinx-zynqmp-dma ffa90000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.576018] xilinx-zynqmp-dma ffaa0000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.583889] xilinx-zynqmp-dma ffab0000.dma-controller: ZynqMP DMA
> driver Probe success
> > [    2.946379] spi-nor spi0.0: mt25qu512a (131072 Kbytes)
> > [    2.946467] 2 fixed-partitions partitions found on MTD device spi0.0
> > [    2.952393] Creating 2 MTD partitions on "spi0.0":
> > [    2.957231] 0x000004000000-0x000008000000 : "bank A"
> > [    2.963332] 0x000000000000-0x000004000000 : "bank B"
> > [    2.968694] macb ff0b0000.ethernet: Not enabling partial store and
> forward
> > [    2.975333] macb ff0b0000.ethernet eth0: Cadence GEM rev 0x50070106
> at 0xff0b0000 irq 25 (18:41:fe:0f:ff:02)
> > [    2.984472] macb ff0c0000.ethernet: Not enabling partial store and
> forward
> > [    2.992144] macb ff0c0000.ethernet eth1: Cadence GEM rev 0x50070106
> at 0xff0c0000 irq 26 (18:41:fe:0f:ff:03)
> > [    3.001043] viper_enet viper_enet: Viper power GPIOs initialised
> > [    3.007313] viper_enet viper_enet vnet0 (uninitialized): Validate
> interface QSGMII
> > [    3.014914] viper_enet viper_enet vnet1 (uninitialized): Validate
> interface QSGMII
> > [    3.022138] viper_enet viper_enet vnet1 (uninitialized): Validate
> interface type 18
> > [    3.030274] viper_enet viper_enet vnet2 (uninitialized): Validate
> interface QSGMII
> > [    3.037785] viper_enet viper_enet vnet3 (uninitialized): Validate
> interface QSGMII
> > [    3.045301] viper_enet viper_enet: Viper enet registered
> > [    3.050958] xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM
> > [    3.057135] xilinx-axipmon fd0b0000.perf-monitor: Probed Xilinx APM
> > [    3.063538] xilinx-axipmon fd490000.perf-monitor: Probed Xilinx APM
> > [    3.069920] xilinx-axipmon ffa10000.perf-monitor: Probed Xilinx APM
> > [    3.097729] si70xx: probe of 2-0040 failed with error -5
> > [    3.098042] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer with
> timeout 60s
> > [    3.105111] cdns-wdt ff150000.watchdog: Xilinx Watchdog Timer with
> timeout 10s
> > [    3.112457] viper-tamper viper-tamper: Device registered
> > [    3.117593] active_bank active_bank: boot bank: 1
> > [    3.122184] active_bank active_bank: boot mode: (0x02) qspi32
> > [    3.128247] viper-vdpp a4000000.vdpp: Device Tree Probing
> > [    3.133439] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info:
> 1.512.15.0 KeyLen: 32
> > [    3.142151] viper-vdpp a4000000.vdpp: Tamper handler registered
> > [    3.147438] viper-vdpp a4000000.vdpp: Device registered
> > [    3.153007] lpc55_l2 spi1.0: registered handler for protocol 0
> > [    3.158582] lpc55_user lpc55_user: The major number for your device
> is 236
> > [    3.165976] lpc55_l2 spi1.0: registered handler for protocol 1
> > [    3.181999] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> > [    3.182856] rtc-lpc55 rtc_lpc55: registered as rtc0
> > [    3.188656] lpc55_l2 spi1.0: (2) mcu still not ready?
> > [    3.193744] lpc55_l2 spi1.0: (3) mcu still not ready?
> > [    3.198848] lpc55_l2 spi1.0: (4) mcu still not ready?
> > [    3.202932] mmc0: SDHCI controller on ff160000.mmc [ff160000.mmc]
> using ADMA 64-bit
> > [    3.210689] lpc55_l2 spi1.0: (5) mcu still not ready?
> > [    3.215694] lpc55_l2 spi1.0: rx error: -110
> > [    3.284438] mmc0: new HS200 MMC card at address 0001
> > [    3.285179] mmcblk0: mmc0:0001 SEM16G 14.6 GiB
> > [    3.291784]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8
> > [    3.293915] mmcblk0boot0: mmc0:0001 SEM16G 4.00 MiB
> > [    3.299054] mmcblk0boot1: mmc0:0001 SEM16G 4.00 MiB
> > [    3.303905] mmcblk0rpmb: mmc0:0001 SEM16G 4.00 MiB, chardev (244:0)
> > [    3.582676] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> > [    3.583332] rtc-lpc55 rtc_lpc55: hctosys: unable to read the hardwar=
e
> clock
> > [    3.591252] cdns-i2c ff020000.i2c: recovery information complete
> > [    3.597085] at24 0-0050: supply vcc not found, using dummy regulator
> > [    3.603011] lpc55_l2 spi1.0: (2) mcu still not ready?
> > [    3.608093] at24 0-0050: 256 byte spd EEPROM, read-only
> > [    3.613620] lpc55_l2 spi1.0: (3) mcu still not ready?
> > [    3.619362] lpc55_l2 spi1.0: (4) mcu still not ready?
> > [    3.624224] rtc-rv3028 0-0052: registered as rtc1
> > [    3.628343] lpc55_l2 spi1.0: (5) mcu still not ready?
> > [    3.633253] lpc55_l2 spi1.0: rx error: -110
> > [    3.639104] k81_bootloader 0-0010: probe
> > [    3.641628] VMCU: : (235:0) registered
> > [    3.641635] k81_bootloader 0-0010: probe completed
> > [    3.668346] cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 28
> > [    3.669154] cdns-i2c ff030000.i2c: recovery information complete
> > [    3.675412] lm75 1-0048: supply vs not found, using dummy regulator
> > [    3.682920] lm75 1-0048: hwmon1: sensor 'tmp112'
> > [    3.686548] i2c i2c-1: Added multiplexed i2c bus 3
> > [    3.690795] i2c i2c-1: Added multiplexed i2c bus 4
> > [    3.695629] i2c i2c-1: Added multiplexed i2c bus 5
> > [    3.700492] i2c i2c-1: Added multiplexed i2c bus 6
> > [    3.705157] pca954x 1-0070: registered 4 multiplexed busses for I2C
> switch pca9546
> > [    3.713049] at24 1-0054: supply vcc not found, using dummy regulator
> > [    3.720067] at24 1-0054: 1024 byte 24c08 EEPROM, read-only
> > [    3.724761] cdns-i2c ff030000.i2c: 100 kHz mmio ff030000 irq 29
> > [    3.731272] sfp viper_enet:sfp-eth1: Host maximum power 2.0W
> > [    3.737549] sfp_register_socket: got sfp_bus
> > [    3.740709] sfp_register_socket: register sfp_bus
> > [    3.745459] sfp_register_bus: ops ok!
> > [    3.749179] sfp_register_bus: Try to attach
> > [    3.753419] sfp_register_bus: Attach succeeded
> > [    3.757914] sfp_register_bus: upstream ops attach
> > [    3.762677] sfp_register_bus: Bus registered
> > [    3.766999] sfp_register_socket: register sfp_bus succeeded
> > [    3.775870] of_cfs_init
> > [    3.776000] of_cfs_init: OK
> > [    3.778211] clk: Not disabling unused clocks
> > [   11.278477] Freeing initrd memory: 206056K
> > [   11.279406] Freeing unused kernel memory: 1536K
> > [   11.314006] Checked W+X mappings: passed, no W+X pages found
> > [   11.314142] Run /init as init process
> > INIT: version 3.01 booting
> > fsck (busybox 1.35.0)
> > /dev/mmcblk0p1: clean, 12/102400 files, 238162/409600 blocks
> > /dev/mmcblk0p2: clean, 12/102400 files, 171972/409600 blocks
> > /dev/mmcblk0p3 was not cleanly unmounted, check forced.
> > /dev/mmcblk0p3: 20/4096 files (0.0% non-contiguous), 663/16384 blocks
> > [   11.553073] EXT4-fs (mmcblk0p3): mounted filesystem without journal.
> Opts: (null). Quota mode: disabled.
> > Starting random number generator daemon.
> > [   11.580662] random: crng init done
> > Starting udev
> > [   11.613159] udevd[142]: starting version 3.2.10
> > [   11.620385] udevd[143]: starting eudev-3.2.10
> > [   11.704481] macb ff0b0000.ethernet control_red: renamed from eth0
> > [   11.720264] macb ff0c0000.ethernet control_black: renamed from eth1
> > [   12.063396] ip_local_port_range: prefer different parity for
> start/end values.
> > [   12.084801] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> > hwclock: RTC_RD_TIME: Invalid exchange
> > Mon Feb 27 08:40:53 UTC 2023
> > [   12.115309] rtc-lpc55 rtc_lpc55: lpc55_rtc_set_time: bad result
> > hwclock: RTC_SET_TIME: Invalid exchange
> > [   12.131027] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> > Starting mcud
> > INIT: Entering runlevel: 5
> > Configuring network interfaces... done.
> > resetting network interface
> > [   12.718295] macb ff0b0000.ethernet control_red: PHY
> [ff0b0000.ethernet-ffffffff:02] driver [Xilinx PCS/PMA PHY] (irq=3DPOLL)
> > [   12.723919] macb ff0b0000.ethernet control_red: configuring for
> phy/gmii link mode
> > [   12.732151] pps pps0: new PPS source ptp0
> > [   12.735563] macb ff0b0000.ethernet: gem-ptp-timer ptp clock
> registered.
> > [   12.745724] macb ff0c0000.ethernet control_black: PHY
> [ff0c0000.ethernet-ffffffff:01] driver [Xilinx PCS/PMA PHY] (irq=3DPOLL)
> > [   12.753469] macb ff0c0000.ethernet control_black: configuring for
> phy/gmii link mode
> > [   12.761804] pps pps1: new PPS source ptp1
> > [   12.765398] macb ff0c0000.ethernet: gem-ptp-timer ptp clock
> registered.
> > Auto-negotiation: off
> > Auto-negotiation: off
> > [   16.828151] macb ff0b0000.ethernet control_red: unable to generate
> target frequency: 125000000 Hz
> > [   16.834553] macb ff0b0000.ethernet control_red: Link is Up -
> 1Gbps/Full - flow control off
> > [   16.860552] macb ff0c0000.ethernet control_black: unable to generate
> target frequency: 125000000 Hz
> > [   16.867052] macb ff0c0000.ethernet control_black: Link is Up -
> 1Gbps/Full - flow control off
> > Starting Failsafe Secure Shell server in port 2222: sshd
> > done.
> > Starting rpcbind daemon...done.
> >
> > [   17.093019] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> > hwclock: RTC_RD_TIME: Invalid exchange
> > Starting State Manager Service
> > Start state-manager restarter...
> > (XEN) d0v1 Forwarding AES operation: 3254779951
> > Starting /usr/sbin/xenstored....[   17.265256] BTRFS: device fsid
> 80efc224-c202-4f8e-a949-4dae7f04a0aa devid 1 transid 744 /dev/dm-0
> > scanned by udevd (385)
> > [   17.349933] BTRFS info (device dm-0): disk space caching is enabled
> > [   17.350670] BTRFS info (device dm-0): has skinny extents
> > [   17.364384] BTRFS info (device dm-0): enabling ssd optimizations
> > [   17.830462] BTRFS: device fsid 27ff666b-f4e5-4f90-9054-c210db5b2e2e
> devid 1 transid 6 /dev/mapper/client_prov scanned by mkfs.btrfs
> > (526)
> > [   17.872699] BTRFS info (device dm-1): using free space tree
> > [   17.872771] BTRFS info (device dm-1): has skinny extents
> > [   17.878114] BTRFS info (device dm-1): flagging fs with big metadata
> feature
> > [   17.894289] BTRFS info (device dm-1): enabling ssd optimizations
> > [   17.895695] BTRFS info (device dm-1): checking UUID tree
> >
> > Setting domain 0 name, domid and JSON config...
> > Done setting up Dom0
> > Starting xenconsoled...
> > Starting QEMU as disk backend for dom0
> > Starting domain watchdog daemon: xenwatchdogd startup
> >
> > [   18.408647] BTRFS: device fsid 5e08d5e9-bc2a-46b9-af6a-44c7087b8921
> devid 1 transid 6 /dev/mapper/client_config scanned by mkfs.btrfs
> > (574)
> > [done]
> > [   18.465552] BTRFS info (device dm-2): using free space tree
> > [   18.465629] BTRFS info (device dm-2): has skinny extents
> > [   18.471002] BTRFS info (device dm-2): flagging fs with big metadata
> feature
> > Starting crond: [   18.482371] BTRFS info (device dm-2): enabling ssd
> optimizations
> > [   18.486659] BTRFS info (device dm-2): checking UUID tree
> > OK
> > starting rsyslogd ... Log partition ready after 0 poll loops
> > done
> > rsyslogd: cannot connect to 172.18.0.1:514: Network is unreachable
> [v8.2208.0 try https://www.rsyslog.com/e/2027 ]
> > [   18.670637] BTRFS: device fsid 39d7d9e1-967d-478e-94ae-690deb722095
> devid 1 transid 608 /dev/dm-3 scanned by udevd (518)
> >
> > Please insert USB token and enter your role in login prompt.
> >
> > login:
> >
> > Regards,
> > O.
> >
> >
> > =D0=BF=D0=BD, 24 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:39,=
 Stefano Stabellini <sstabellini@kernel.org
> >:
> >       Hi Oleg,
> >
> >       Here is the issue from your logs:
> >
> >       SError Interrupt on CPU0, code 0xbe000000 -- SError
> >
> >       SErrors are special signals to notify software of serious hardwar=
e
> >       errors.  Something is going very wrong. Defective hardware is a
> >       possibility.  Another possibility if software accessing address
> ranges
> >       that it is not supposed to, sometimes it causes SErrors.
> >
> >       Cheers,
> >
> >       Stefano
> >
> >
> >
> >       On Mon, 24 Apr 2023, Oleg Nikitenko wrote:
> >
> >       > Hello,
> >       >
> >       > Thanks guys.
> >       > I found out where the problem was.
> >       > Now dom0 booted more. But I have a new one.
> >       > This is a kernel panic during Dom0 loading.
> >       > Maybe someone is able to suggest something ?
> >       >
> >       > Regards,
> >       > O.
> >       >
> >       > [    3.771362] sfp_register_bus: upstream ops attach
> >       > [    3.776119] sfp_register_bus: Bus registered
> >       > [    3.780459] sfp_register_socket: register sfp_bus succeeded
> >       > [    3.789399] of_cfs_init
> >       > [    3.789499] of_cfs_init: OK
> >       > [    3.791685] clk: Not disabling unused clocks
> >       > [   11.010355] SError Interrupt on CPU0, code 0xbe000000 --
> SError
> >       > [   11.010380] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted
> 5.15.72-xilinx-v2022.1 #1
> >       > [   11.010393] Workqueue: events_unbound async_run_entry_fn
> >       > [   11.010414] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT
> -SSBS BTYPE=3D--)
> >       > [   11.010422] pc : simple_write_end+0xd0/0x130
> >       > [   11.010431] lr : generic_perform_write+0x118/0x1e0
> >       > [   11.010438] sp : ffffffc00809b910
> >       > [   11.010441] x29: ffffffc00809b910 x28: 0000000000000000 x27:
> ffffffef69ba88c0
> >       > [   11.010451] x26: 0000000000003eec x25: ffffff807515db00 x24:
> 0000000000000000
> >       > [   11.010459] x23: ffffffc00809ba90 x22: 0000000002aac000 x21:
> ffffff807315a260
> >       > [   11.010472] x20: 0000000000001000 x19: fffffffe02000000 x18:
> 0000000000000000
> >       > [   11.010481] x17: 00000000ffffffff x16: 0000000000008000 x15:
> 0000000000000000
> >       > [   11.010490] x14: 0000000000000000 x13: 0000000000000000 x12:
> 0000000000000000
> >       > [   11.010498] x11: 0000000000000000 x10: 0000000000000000 x9 :
> 0000000000000000
> >       > [   11.010507] x8 : 0000000000000000 x7 : ffffffef693ba680 x6 :
> 000000002d89b700
> >       > [   11.010515] x5 : fffffffe02000000 x4 : ffffff807315a3c8 x3 :
> 0000000000001000
> >       > [   11.010524] x2 : 0000000002aab000 x1 : 0000000000000001 x0 :
> 0000000000000005
> >       > [   11.010534] Kernel panic - not syncing: Asynchronous SError
> Interrupt
> >       > [   11.010539] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted
> 5.15.72-xilinx-v2022.1 #1
> >       > [   11.010545] Hardware name: D14 Viper Board - White Unit (DT)
> >       > [   11.010548] Workqueue: events_unbound async_run_entry_fn
> >       > [   11.010556] Call trace:
> >       > [   11.010558]  dump_backtrace+0x0/0x1c4
> >       > [   11.010567]  show_stack+0x18/0x2c
> >       > [   11.010574]  dump_stack_lvl+0x7c/0xa0
> >       > [   11.010583]  dump_stack+0x18/0x34
> >       > [   11.010588]  panic+0x14c/0x2f8
> >       > [   11.010597]  print_tainted+0x0/0xb0
> >       > [   11.010606]  arm64_serror_panic+0x6c/0x7c
> >       > [   11.010614]  do_serror+0x28/0x60
> >       > [   11.010621]  el1h_64_error_handler+0x30/0x50
> >       > [   11.010628]  el1h_64_error+0x78/0x7c
> >       > [   11.010633]  simple_write_end+0xd0/0x130
> >       > [   11.010639]  generic_perform_write+0x118/0x1e0
> >       > [   11.010644]  __generic_file_write_iter+0x138/0x1c4
> >       > [   11.010650]  generic_file_write_iter+0x78/0xd0
> >       > [   11.010656]  __kernel_write+0xfc/0x2ac
> >       > [   11.010665]  kernel_write+0x88/0x160
> >       > [   11.010673]  xwrite+0x44/0x94
> >       > [   11.010680]  do_copy+0xa8/0x104
> >       > [   11.010686]  write_buffer+0x38/0x58
> >       > [   11.010692]  flush_buffer+0x4c/0xbc
> >       > [   11.010698]  __gunzip+0x280/0x310
> >       > [   11.010704]  gunzip+0x1c/0x28
> >       > [   11.010709]  unpack_to_rootfs+0x170/0x2b0
> >       > [   11.010715]  do_populate_rootfs+0x80/0x164
> >       > [   11.010722]  async_run_entry_fn+0x48/0x164
> >       > [   11.010728]  process_one_work+0x1e4/0x3a0
> >       > [   11.010736]  worker_thread+0x7c/0x4c0
> >       > [   11.010743]  kthread+0x120/0x130
> >       > [   11.010750]  ret_from_fork+0x10/0x20
> >       > [   11.010757] SMP: stopping secondary CPUs
> >       > [   11.010784] Kernel Offset: 0x2f61200000 from
> 0xffffffc008000000
> >       > [   11.010788] PHYS_OFFSET: 0x0
> >       > [   11.010790] CPU features: 0x00000401,00000842
> >       > [   11.010795] Memory Limit: none
> >       > [   11.277509] ---[ end Kernel panic - not syncing: Asynchronou=
s
> SError Interrupt ]---
> >       >
> >       > =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=
=B2 15:52, Michal Orzel <michal.orzel@amd.com
> >:
> >       >       Hi Oleg,
> >       >
> >       >       On 21/04/2023 14:49, Oleg Nikitenko wrote:
> >       >       >
> >       >       >
> >       >       >
> >       >       > Hello Michal,
> >       >       >
> >       >       > I was not able to enable earlyprintk in the xen for now=
.
> >       >       > I decided to choose another way.
> >       >       > This is a xen's command line that I found out completel=
y.
> >       >       >
> >       >       > (XEN) $$$$ console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D1600M
> dom0_max_vcpus=3D2 dom0_vcpus_pin bootscrub=3D0 vwfi=3Dnative
> >       sched=3Dnull
> >       >       timer_slop=3D0
> >       >       Yes, adding a printk() in Xen was also a good idea.
> >       >
> >       >       >
> >       >       > So you are absolutely right about a command line.
> >       >       > Now I am going to find out why xen did not have the
> correct parameters from the device tree.
> >       >       Maybe you will find this document helpful:
> >       >
> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-=
tree/booting.txt
> >       >
> >       >       ~Michal
> >       >
> >       >       >
> >       >       > Regards,
> >       >       > Oleg
> >       >       >
> >       >       > =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=
=B3. =D0=B2 11:16, Michal Orzel <
> michal.orzel@amd.com <mailto:michal.orzel@amd.com>>:
> >       >       >
> >       >       >
> >       >       >     On 21/04/2023 10:04, Oleg Nikitenko wrote:
> >       >       >     >
> >       >       >     >
> >       >       >     >
> >       >       >     > Hello Michal,
> >       >       >     >
> >       >       >     > Yes, I use yocto.
> >       >       >     >
> >       >       >     > Yesterday all day long I tried to follow your
> suggestions.
> >       >       >     > I faced a problem.
> >       >       >     > Manually in the xen config build file I pasted th=
e
> strings:
> >       >       >     In the .config file or in some Yocto file (listing
> additional Kconfig options) added to SRC_URI?
> >       >       >     You shouldn't really modify .config file but if you
> do, you should execute "make olddefconfig" afterwards.
> >       >       >
> >       >       >     >
> >       >       >     > CONFIG_EARLY_PRINTK
> >       >       >     > CONFIG_EARLY_PRINTK_ZYNQMP
> >       >       >     > CONFIG_EARLY_UART_CHOICE_CADENCE
> >       >       >     I hope you added =3Dy to them.
> >       >       >
> >       >       >     Anyway, you have at least the following solutions:
> >       >       >     1) Run bitbake xen -c menuconfig to properly set
> early printk
> >       >       >     2) Find out how you enable other Kconfig options in
> your project (e.g. CONFIG_COLORING=3Dy that is not enabled by
> >       default)
> >       >       >     3) Append the following to
> "xen/arch/arm/configs/arm64_defconfig":
> >       >       >     CONFIG_EARLY_PRINTK_ZYNQMP=3Dy
> >       >       >
> >       >       >     ~Michal
> >       >       >
> >       >       >     >
> >       >       >     > Host hangs in build time.
> >       >       >     > Maybe I did not set something in the config build
> file ?
> >       >       >     >
> >       >       >     > Regards,
> >       >       >     > Oleg
> >       >       >     >
> >       >       >     > =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=
=AF=D0=B3. =D0=B2 11:57, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >       >       <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>:
> >       >       >     >
> >       >       >     >     Thanks Michal,
> >       >       >     >
> >       >       >     >     You gave me an idea.
> >       >       >     >     I am going to try it today.
> >       >       >     >
> >       >       >     >     Regards,
> >       >       >     >     O.
> >       >       >     >
> >       >       >     >     =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=
=80=AF=D0=B3. =D0=B2 11:56, Oleg Nikitenko <
> oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >       >       <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>:
> >       >       >     >
> >       >       >     >         Thanks Stefano.
> >       >       >     >
> >       >       >     >         I am going to do it today.
> >       >       >     >
> >       >       >     >         Regards,
> >       >       >     >         O.
> >       >       >     >
> >       >       >     >         =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=
=E2=80=AF=D0=B3. =D0=B2 23:05, Stefano
> Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>
> >       >       <mailto:sstabellini@kernel.org <mailto:
> sstabellini@kernel.org>>>:
> >       >       >     >
> >       >       >     >             On Wed, 19 Apr 2023, Oleg Nikitenko
> wrote:
> >       >       >     >             > Hi Michal,
> >       >       >     >             >
> >       >       >     >             > I corrected xen's command line.
> >       >       >     >             > Now it is
> >       >       >     >             > xen,xen-bootargs =3D "console=3Ddtu=
art
> dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 dom0_vcpus_pin
> >       >       bootscrub=3D0 vwfi=3Dnative sched=3Dnull
> >       >       >     >             > timer_slop=3D0 way_size=3D65536
> xen_colors=3D0-3 dom0_colors=3D4-7";
> >       >       >     >
> >       >       >     >             4 colors is way too many for xen, jus=
t
> do xen_colors=3D0-0. There is no
> >       >       >     >             advantage in using more than 1 color
> for Xen.
> >       >       >     >
> >       >       >     >             4 colors is too few for dom0, if you
> are giving 1600M of memory to Dom0.
> >       >       >     >             Each color is 256M. For 1600M you
> should give at least 7 colors. Try:
> >       >       >     >
> >       >       >     >             xen_colors=3D0-0 dom0_colors=3D1-8
> >       >       >     >
> >       >       >     >
> >       >       >     >
> >       >       >     >             > Unfortunately the result was the
> same.
> >       >       >     >             >
> >       >       >     >             > (XEN)  - Dom0 mode: Relaxed
> >       >       >     >             > (XEN) P2M: 40-bit IPA with 40-bit P=
A
> and 8-bit VMID
> >       >       >     >             > (XEN) P2M: 3 levels with order-1
> root, VTCR 0x0000000080023558
> >       >       >     >             > (XEN) Scheduling granularity: cpu, =
1
> CPU per sched-resource
> >       >       >     >             > (XEN) Coloring general information
> >       >       >     >             > (XEN) Way size: 64kB
> >       >       >     >             > (XEN) Max. number of colors
> available: 16
> >       >       >     >             > (XEN) Xen color(s): [ 0 ]
> >       >       >     >             > (XEN) alternatives: Patching with
> alt table 00000000002cc690 -> 00000000002ccc0c
> >       >       >     >             > (XEN) Color array allocation failed
> for dom0
> >       >       >     >             > (XEN)
> >       >       >     >             > (XEN)
> ****************************************
> >       >       >     >             > (XEN) Panic on CPU 0:
> >       >       >     >             > (XEN) Error creating domain 0
> >       >       >     >             > (XEN)
> ****************************************
> >       >       >     >             > (XEN)
> >       >       >     >             > (XEN) Reboot in five seconds...
> >       >       >     >             >
> >       >       >     >             > I am going to find out how command
> line arguments passed and parsed.
> >       >       >     >             >
> >       >       >     >             > Regards,
> >       >       >     >             > Oleg
> >       >       >     >             >
> >       >       >     >             > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80=
. 2023=E2=80=AF=D0=B3. =D0=B2 11:25, Oleg
> Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
> >       >       <mailto:oleshiiwood@gmail.com <mailto:
> oleshiiwood@gmail.com>>>:
> >       >       >     >             >       Hi Michal,
> >       >       >     >             >
> >       >       >     >             > You put my nose into the problem.
> Thank you.
> >       >       >     >             > I am going to use your point.
> >       >       >     >             > Let's see what happens.
> >       >       >     >             >
> >       >       >     >             > Regards,
> >       >       >     >             > Oleg
> >       >       >     >             >
> >       >       >     >             >
> >       >       >     >             > =D1=81=D1=80, 19 =D0=B0=D0=BF=D1=80=
. 2023=E2=80=AF=D0=B3. =D0=B2 10:37, Michal
> Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>
> >       >       <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com
> >>>:
> >       >       >     >             >       Hi Oleg,
> >       >       >     >             >
> >       >       >     >             >       On 19/04/2023 09:03, Oleg
> Nikitenko wrote:
> >       >       >     >             >       >
> >       >       >     >             >       >
> >       >       >     >             >       >
> >       >       >     >             >       > Hello Stefano,
> >       >       >     >             >       >
> >       >       >     >             >       > Thanks for the clarificatio=
n.
> >       >       >     >             >       > My company uses yocto for
> image generation.
> >       >       >     >             >       > What kind of information do
> you need to consult me in this case ?
> >       >       >     >             >       >
> >       >       >     >             >       > Maybe modules
> sizes/addresses which were mentioned by @Julien Grall
> >       <mailto:julien@xen.org
> >       >       <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:
> julien@xen.org>>> ?
> >       >       >     >             >
> >       >       >     >             >       Sorry for jumping into
> discussion, but FWICS the Xen command line you provided seems to be
> >       not the
> >       >       one
> >       >       >     >             >       Xen booted with. The error yo=
u
> are observing most likely is due to dom0 colors
> >       configuration not
> >       >       being
> >       >       >     >             >       specified (i.e. lack of
> dom0_colors=3D<> parameter). Although in the command line you
> >       provided, this
> >       >       parameter
> >       >       >     >             >       is set, I strongly doubt that
> this is the actual command line in use.
> >       >       >     >             >
> >       >       >     >             >       You wrote:
> >       >       >     >             >       xen,xen-bootargs =3D
> "console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2
> >       dom0_vcpus_pin
> >       >       bootscrub=3D0 vwfi=3Dnative
> >       >       >     >             >       sched=3Dnull timer_slop=3D0
> way_szize=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7";
> >       >       >     >             >
> >       >       >     >             >       but:
> >       >       >     >             >       1) way_szize has a typo
> >       >       >     >             >       2) you specified 4 colors
> (0-3) for Xen, but the boot log says that Xen has only one:
> >       >       >     >             >       (XEN) Xen color(s): [ 0 ]
> >       >       >     >             >
> >       >       >     >             >       This makes me believe that no
> colors configuration actually end up in command line that Xen
> >       booted
> >       >       with.
> >       >       >     >             >       Single color for Xen is a
> "default if not specified" and way size was probably calculated
> >       by asking
> >       >       HW.
> >       >       >     >             >
> >       >       >     >             >       So I would suggest to first
> cross-check the command line in use.
> >       >       >     >             >
> >       >       >     >             >       ~Michal
> >       >       >     >             >
> >       >       >     >             >
> >       >       >     >             >       >
> >       >       >     >             >       > Regards,
> >       >       >     >             >       > Oleg
> >       >       >     >             >       >
> >       >       >     >             >       > =D0=B2=D1=82, 18 =D0=B0=D0=
=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 20:44,
> Stefano Stabellini <sstabellini@kernel.org
> >       >       <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>
> >       <mailto:sstabellini@kernel.org
> >       >       <mailto:sstabellini@kernel.org> <mailto:
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>:
> >       >       >     >             >       >
> >       >       >     >             >       >     On Tue, 18 Apr 2023,
> Oleg Nikitenko wrote:
> >       >       >     >             >       >     > Hi Julien,
> >       >       >     >             >       >     >
> >       >       >     >             >       >     > >> This feature has
> not been merged in Xen upstream yet
> >       >       >     >             >       >     >
> >       >       >     >             >       >     > > would assume that
> upstream + the series on the ML [1] work
> >       >       >     >             >       >     >
> >       >       >     >             >       >     > Please clarify this
> point.
> >       >       >     >             >       >     > Because the two
> thoughts are controversial.
> >       >       >     >             >       >
> >       >       >     >             >       >     Hi Oleg,
> >       >       >     >             >       >
> >       >       >     >             >       >     As Julien wrote, there
> is nothing controversial. As you are aware,
> >       >       >     >             >       >     Xilinx maintains a
> separate Xen tree specific for Xilinx here:
> >       >       >     >             >       >
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>
> >       <https://github.com/xilinx/xen
> >       >       <https://github.com/xilinx/xen>> <
> https://github.com/xilinx/xen <https://github.com/xilinx/xen>
> >       <https://github.com/xilinx/xen
> >       >       <https://github.com/xilinx/xen>>>
> >       >       >     >             >       >
> >       >       >     >             >       >     and the branch you are
> using (xlnx_rebase_4.16) comes from there.
> >       >       >     >             >       >
> >       >       >     >             >       >
> >       >       >     >             >       >     Instead, the upstream
> Xen tree lives here:
> >       >       >     >             >       >
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >       >       <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>=
 <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >       >       <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>=
> <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >       >       <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>=
 <
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
> >       >       <https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary>=
>>
> >       >       >     >             >       >
> >       >       >     >             >       >
> >       >       >     >             >       >     The Cache Coloring
> feature that you are trying to configure is present
> >       >       >     >             >       >     in xlnx_rebase_4.16, bu=
t
> not yet present upstream (there is an
> >       >       >     >             >       >     outstanding patch serie=
s
> to add cache coloring to Xen upstream but it
> >       >       >     >             >       >     hasn't been merged yet.=
)
> >       >       >     >             >       >
> >       >       >     >             >       >
> >       >       >     >             >       >     Anyway, if you are usin=
g
> xlnx_rebase_4.16 it doesn't matter too much for
> >       >       >     >             >       >     you as you already have
> Cache Coloring as a feature there.
> >       >       >     >             >       >
> >       >       >     >             >       >
> >       >       >     >             >       >     I take you are using
> ImageBuilder to generate the boot configuration? If
> >       >       >     >             >       >     so, please post the
> ImageBuilder config file that you are using.
> >       >       >     >             >       >
> >       >       >     >             >       >     But from the boot
> message, it looks like the colors configuration for
> >       >       >     >             >       >     Dom0 is incorrect.
> >       >       >     >             >       >
> >       >       >     >             >
> >       >       >     >             >
> >       >       >     >             >
> >       >       >     >
> >       >       >
> >       >
> >       >
> >       >
> >
> >
> >

--0000000000007c382805fa4ba681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Stefano,</div><div><br></div><div>Thanks for cl=
arification.</div><div>We nighter use ImageBuilder nor uboot boot script.</=
div><div>A model is zcu102 compatible.</div><div><br></div><div>Regards,</d=
iv><div>O.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">=D0=B2=D1=82, 25 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=
=B3. =D0=B2 21:21, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@ker=
nel.org">sstabellini@kernel.org</a>&gt;:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">This is interesting. Are you using Xilinx hardware=
 by any chance? If so,<br>
which board?<br>
<br>
Are you using ImageBuilder to generate your boot.scr boot script? If so,<br=
>
could you please post your ImageBuilder config file? If not, can you<br>
post the source of your uboot boot script?<br>
<br>
SErrors are supposed to be related to a hardware failure of some kind.<br>
You are not supposed to be able to trigger an SError easily by<br>
&quot;mistake&quot;. I have not seen SErrors due to wrong cache coloring<br=
>
configurations on any Xilinx board before.<br>
<br>
The differences between Xen with and without cache coloring from a<br>
hardware perspective are:<br>
<br>
- With cache coloring, the SMMU is enabled and does address translations<br=
>
=C2=A0 even for dom0. Without cache coloring the SMMU could be disabled, an=
d<br>
=C2=A0 if enabled, the SMMU doesn&#39;t do any address translations for Dom=
0. If<br>
=C2=A0 there is a hardware failure related to SMMU address translation it<b=
r>
=C2=A0 could only trigger with cache coloring. This would be my normal<br>
=C2=A0 suggestion for you to explore, but the failure happens too early<br>
=C2=A0 before any DMA-capable device is programmed. So I don&#39;t think th=
is can<br>
=C2=A0 be the issue.<br>
<br>
- With cache coloring, the memory allocation is very different so you&#39;l=
l<br>
=C2=A0 end up using different DDR regions for Dom0. So if your DDR is<br>
=C2=A0 defective, you might only see a failure with cache coloring enabled<=
br>
=C2=A0 because you end up using different regions.<br>
<br>
<br>
On Tue, 25 Apr 2023, Oleg Nikitenko wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; Thank you.<br>
&gt; If I build xen without colors support there is not this error.<br>
&gt; All the domains are booted well.<br>
&gt; Hense it can not be a hardware issue.<br>
&gt; This panic arrived during unpacking the rootfs.<br>
&gt; Here I attached the boot log xen/Dom0 without color.<br>
&gt; A highlighted strings printed exactly after the place where 1-st time =
panic arrived.<br>
&gt; <br>
&gt; =C2=A0Xen 4.16.1-pre<br>
&gt; (XEN) Xen version 4.16.1-pre (nole2390@(none)) (aarch64-portable-linux=
-gcc (GCC) 11.3.0) debug=3Dy 2023-04-21<br>
&gt; (XEN) Latest ChangeSet: Wed Apr 19 12:56:14 2023 +0300 git:321687b231-=
dirty<br>
&gt; (XEN) build-id: c1847258fdb1b79562fc710dda40008f96c0fde5<br>
&gt; (XEN) Processor: 00000000410fd034: &quot;ARM Limited&quot;, variant: 0=
x0, part 0xd03,rev 0x4<br>
&gt; (XEN) 64-bit Execution:<br>
&gt; (XEN) =C2=A0 Processor Features: 0000000000002222 0000000000000000<br>
&gt; (XEN) =C2=A0 =C2=A0 Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL=
0:64+32<br>
&gt; (XEN) =C2=A0 =C2=A0 Extensions: FloatingPoint AdvancedSIMD<br>
&gt; (XEN) =C2=A0 Debug Features: 0000000010305106 0000000000000000<br>
&gt; (XEN) =C2=A0 Auxiliary Features: 0000000000000000 0000000000000000<br>
&gt; (XEN) =C2=A0 Memory Model Features: 0000000000001122 0000000000000000<=
br>
&gt; (XEN) =C2=A0 ISA Features: =C2=A00000000000011120 0000000000000000<br>
&gt; (XEN) 32-bit Execution:<br>
&gt; (XEN) =C2=A0 Processor Features: 0000000000000131:0000000000011011<br>
&gt; (XEN) =C2=A0 =C2=A0 Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazell=
e<br>
&gt; (XEN) =C2=A0 =C2=A0 Extensions: GenericTimer Security<br>
&gt; (XEN) =C2=A0 Debug Features: 0000000003010066<br>
&gt; (XEN) =C2=A0 Auxiliary Features: 0000000000000000<br>
&gt; (XEN) =C2=A0 Memory Model Features: 0000000010201105 0000000040000000<=
br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00000000001260000 0000000002102211<br>
&gt; (XEN) =C2=A0 ISA Features: 0000000002101110 0000000013112111 000000002=
1232042<br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 00000000=
01112131 0000000000011142 0000000000011121<br>
&gt; (XEN) Using SMC Calling Convention v1.2<br>
&gt; (XEN) Using PSCI v1.1<br>
&gt; (XEN) SMP: Allowing 4 CPUs<br>
&gt; (XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 100000 KHz=
<br>
&gt; (XEN) GICv2 initialization:<br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_dist_addr=3D00000000f9010000<br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_cpu_addr=3D00000000f9020000<br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_hyp_addr=3D00000000f9040000<br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_vcpu_addr=3D00000000f9060000<br>
&gt; (XEN) =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_maintenance_irq=3D25<br>
&gt; (XEN) GICv2: Adjusting CPU interface base to 0xf902f000<br>
&gt; (XEN) GICv2: 192 lines, 4 cpus, secure (IID 0200143b).<br>
&gt; (XEN) Using scheduler: null Scheduler (null)<br>
&gt; (XEN) Initializing null scheduler<br>
&gt; (XEN) WARNING: This is experimental software in development.<br>
&gt; (XEN) Use at your own risk.<br>
&gt; (XEN) Allocated console ring of 32 KiB.<br>
&gt; (XEN) CPU0: Guest atomics will try 12 times before pausing the domain<=
br>
&gt; (XEN) Bringing up CPU1<br>
&gt; (XEN) CPU1: Guest atomics will try 13 times before pausing the domain<=
br>
&gt; (XEN) CPU 1 booted.<br>
&gt; (XEN) Bringing up CPU2<br>
&gt; (XEN) CPU2: Guest atomics will try 13 times before pausing the domain<=
br>
&gt; (XEN) CPU 2 booted.<br>
&gt; (XEN) Bringing up CPU3<br>
&gt; (XEN) CPU3: Guest atomics will try 13 times before pausing the domain<=
br>
&gt; (XEN) Brought up 4 CPUs<br>
&gt; (XEN) CPU 3 booted.<br>
&gt; (XEN) smmu: /axi/smmu@fd800000: probing hardware configuration...<br>
&gt; (XEN) smmu: /axi/smmu@fd800000: SMMUv2 with:<br>
&gt; (XEN) smmu: /axi/smmu@fd800000: stage 2 translation<br>
&gt; (XEN) smmu: /axi/smmu@fd800000: stream matching with 48 register group=
s, mask 0x7fff&lt;2&gt;smmu: /axi/smmu@fd800000: 16 context banks (0<br>
&gt; stage-2 only)<br>
&gt; (XEN) smmu: /axi/smmu@fd800000: Stage-2: 48-bit IPA -&gt; 48-bit PA<br=
>
&gt; (XEN) smmu: /axi/smmu@fd800000: registered 29 master devices<br>
&gt; (XEN) I/O virtualisation enabled<br>
&gt; (XEN) =C2=A0- Dom0 mode: Relaxed<br>
&gt; (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
&gt; (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558<br>
&gt; (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource<br>
&gt; (XEN) alternatives: Patching with alt table 00000000002cc5c8 -&gt; 000=
00000002ccb2c<br>
&gt; (XEN) *** LOADING DOMAIN 0 ***<br>
&gt; (XEN) Loading d0 kernel from boot module @ 0000000001000000<br>
&gt; (XEN) Loading ramdisk from boot module @ 0000000002000000<br>
&gt; (XEN) Allocating 1:1 mappings totalling 1600MB for dom0:<br>
&gt; (XEN) BANK[0] 0x00000010000000-0x00000020000000 (256MB)<br>
&gt; (XEN) BANK[1] 0x00000024000000-0x00000028000000 (64MB)<br>
&gt; (XEN) BANK[2] 0x00000030000000-0x00000080000000 (1280MB)<br>
&gt; (XEN) Grant table range: 0x00000000e00000-0x00000000e40000<br>
&gt; (XEN) smmu: /axi/smmu@fd800000: d0: p2maddr 0x000000087bf94000<br>
&gt; (XEN) Allocating PPI 16 for event channel interrupt<br>
&gt; (XEN) Extended region 0: 0x81200000-&gt;0xa0000000<br>
&gt; (XEN) Extended region 1: 0xb1200000-&gt;0xc0000000<br>
&gt; (XEN) Extended region 2: 0xc8000000-&gt;0xe0000000<br>
&gt; (XEN) Extended region 3: 0xf0000000-&gt;0xf9000000<br>
&gt; (XEN) Extended region 4: 0x100000000-&gt;0x600000000<br>
&gt; (XEN) Extended region 5: 0x880000000-&gt;0x8000000000<br>
&gt; (XEN) Extended region 6: 0x8001000000-&gt;0x10000000000<br>
&gt; (XEN) Loading zImage from 0000000001000000 to 0000000010000000-0000000=
010e41008<br>
&gt; (XEN) Loading d0 initrd from 0000000002000000 to 0x0000000013600000-0x=
000000001ff3a617<br>
&gt; (XEN) Loading d0 DTB to 0x0000000013400000-0x000000001340cbdc<br>
&gt; (XEN) Initial low memory virq threshold set at 0x4000 pages.<br>
&gt; (XEN) Std. Loglevel: All<br>
&gt; (XEN) Guest Loglevel: All<br>
&gt; (XEN) *** Serial input to DOM0 (type &#39;CTRL-a&#39; three times to s=
witch input)<br>
&gt; (XEN) null.c:353: 0 &lt;-- d0v0<br>
&gt; (XEN) Freed 356kB init memory.<br>
&gt; (XEN) d0v0 Unhandled SMC/HVC: 0x84000050<br>
&gt; (XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01<br>
&gt; (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4=
<br>
&gt; (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8=
<br>
&gt; (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER1=
2<br>
&gt; (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER1=
6<br>
&gt; (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER2=
0<br>
&gt; (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0=
<br>
&gt; [ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0000000000 [0=
x410fd034]<br>
&gt; [ =C2=A0 =C2=A00.000000] Linux version 5.15.72-xilinx-v2022.1 (oe-user=
@oe-host) (aarch64-portable-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils)<b=
r>
&gt; 2.38.20220708) #1 SMP Tue Feb 21 05:47:54 UTC 2023<br>
&gt; [ =C2=A0 =C2=A00.000000] Machine model: D14 Viper Board - White Unit<b=
r>
&gt; [ =C2=A0 =C2=A00.000000] Xen 4.16 support found<br>
&gt; [ =C2=A0 =C2=A00.000000] Zone ranges:<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x0000000=
010000000-0x000000007fffffff]<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 DMA32 =C2=A0 =C2=A0empty<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 empty<br>
&gt; [ =C2=A0 =C2=A00.000000] Movable zone start for each node<br>
&gt; [ =C2=A0 =C2=A00.000000] Early memory node ranges<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x0000000010000000=
-0x000000001fffffff]<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x0000000022000000=
-0x0000000022147fff]<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x0000000022200000=
-0x0000000022347fff]<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x0000000024000000=
-0x0000000027ffffff]<br>
&gt; [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x0000000030000000=
-0x000000007fffffff]<br>
&gt; [ =C2=A0 =C2=A00.000000] Initmem setup node 0 [mem 0x0000000010000000-=
0x000000007fffffff]<br>
&gt; [ =C2=A0 =C2=A00.000000] On node 0, zone DMA: 8192 pages in unavailabl=
e ranges<br>
&gt; [ =C2=A0 =C2=A00.000000] On node 0, zone DMA: 184 pages in unavailable=
 ranges<br>
&gt; [ =C2=A0 =C2=A00.000000] On node 0, zone DMA: 7352 pages in unavailabl=
e ranges<br>
&gt; [ =C2=A0 =C2=A00.000000] cma: Reserved 256 MiB at 0x000000006e000000<b=
r>
&gt; [ =C2=A0 =C2=A00.000000] psci: probing for conduit method from DT.<br>
&gt; [ =C2=A0 =C2=A00.000000] psci: PSCIv1.1 detected in firmware.<br>
&gt; [ =C2=A0 =C2=A00.000000] psci: Using standard PSCI v0.2 function IDs<b=
r>
&gt; [ =C2=A0 =C2=A00.000000] psci: Trusted OS migration not required<br>
&gt; [ =C2=A0 =C2=A00.000000] psci: SMC Calling Convention v1.1<br>
&gt; [ =C2=A0 =C2=A00.000000] percpu: Embedded 16 pages/cpu s32792 r0 d3274=
4 u65536<br>
&gt; [ =C2=A0 =C2=A00.000000] Detected VIPT I-cache on CPU0<br>
&gt; [ =C2=A0 =C2=A00.000000] CPU features: kernel page table isolation for=
ced ON by KASLR<br>
&gt; [ =C2=A0 =C2=A00.000000] CPU features: detected: Kernel page table iso=
lation (KPTI)<br>
&gt; [ =C2=A0 =C2=A00.000000] Built 1 zonelists, mobility grouping on.=C2=
=A0 Total pages: 403845<br>
&gt; [ =C2=A0 =C2=A00.000000] Kernel command line: console=3Dhvc0 earlycon=
=3Dxen earlyprintk=3Dxen clk_ignore_unused fips=3D1 root=3D/dev/ram0 maxcpu=
s=3D2<br>
&gt; [ =C2=A0 =C2=A00.000000] Unknown kernel command line parameters &quot;=
earlyprintk=3Dxen fips=3D1&quot;, will be passed to user space.<br>
&gt; [ =C2=A0 =C2=A00.000000] Dentry cache hash table entries: 262144 (orde=
r: 9, 2097152 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A00.000000] Inode-cache hash table entries: 131072 (order=
: 8, 1048576 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A00.000000] mem auto-init: stack:off, heap alloc:on, heap=
 free:on<br>
&gt; [ =C2=A0 =C2=A00.000000] mem auto-init: clearing system memory may tak=
e some time...<br>
&gt; [ =C2=A0 =C2=A00.000000] Memory: 1121936K/1641024K available (9728K ke=
rnel code, 836K rwdata, 2396K rodata, 1536K init, 262K bss, 256944K reserve=
d,<br>
&gt; 262144K cma-reserved)<br>
&gt; [ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D2, Nodes=3D1<br>
&gt; [ =C2=A0 =C2=A00.000000] rcu: Hierarchical RCU implementation.<br>
&gt; [ =C2=A0 =C2=A00.000000] rcu: RCU event tracing is enabled.<br>
&gt; [ =C2=A0 =C2=A00.000000] rcu: RCU restricting CPUs from NR_CPUS=3D8 to=
 nr_cpu_ids=3D2.<br>
&gt; [ =C2=A0 =C2=A00.000000] rcu: RCU calculated value of scheduler-enlist=
ment delay is 25 jiffies.<br>
&gt; [ =C2=A0 =C2=A00.000000] rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16, nr_cpu_ids=3D2<br>
&gt; [ =C2=A0 =C2=A00.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: =
0<br>
&gt; [ =C2=A0 =C2=A00.000000] Root IRQ handler: gic_handle_irq<br>
&gt; [ =C2=A0 =C2=A00.000000] arch_timer: cp15 timer(s) running at 100.00MH=
z (virt).<br>
&gt; [ =C2=A0 =C2=A00.000000] clocksource: arch_sys_counter: mask: 0xffffff=
ffffffff max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns<br>
&gt; [ =C2=A0 =C2=A00.000000] sched_clock: 56 bits at 100MHz, resolution 10=
ns, wraps every 4398046511100ns<br>
&gt; [ =C2=A0 =C2=A00.000258] Console: colour dummy device 80x25<br>
&gt; [ =C2=A0 =C2=A00.310231] printk: console [hvc0] enabled<br>
&gt; [ =C2=A0 =C2=A00.314403] Calibrating delay loop (skipped), value calcu=
lated using timer frequency.. 200.00 BogoMIPS (lpj=3D400000)<br>
&gt; [ =C2=A0 =C2=A00.324851] pid_max: default: 32768 minimum: 301<br>
&gt; [ =C2=A0 =C2=A00.329706] LSM: Security Framework initializing<br>
&gt; [ =C2=A0 =C2=A00.334204] Yama: becoming mindful.<br>
&gt; [ =C2=A0 =C2=A00.337865] Mount-cache hash table entries: 4096 (order: =
3, 32768 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A00.345180] Mountpoint-cache hash table entries: 4096 (or=
der: 3, 32768 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A00.354743] xen:grant_table: Grant tables using version 1=
 layout<br>
&gt; [ =C2=A0 =C2=A00.359132] Grant table initialized<br>
&gt; [ =C2=A0 =C2=A00.362664] xen:events: Using FIFO-based ABI<br>
&gt; [ =C2=A0 =C2=A00.366993] Xen: initializing cpu0<br>
&gt; [ =C2=A0 =C2=A00.370515] rcu: Hierarchical SRCU implementation.<br>
&gt; [ =C2=A0 =C2=A00.375930] smp: Bringing up secondary CPUs ...<br>
&gt; (XEN) null.c:353: 1 &lt;-- d0v1<br>
&gt; (XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0=
<br>
&gt; [ =C2=A0 =C2=A00.382549] Detected VIPT I-cache on CPU1<br>
&gt; [ =C2=A0 =C2=A00.388712] Xen: initializing cpu1<br>
&gt; [ =C2=A0 =C2=A00.388743] CPU1: Booted secondary processor 0x0000000001=
 [0x410fd034]<br>
&gt; [ =C2=A0 =C2=A00.388829] smp: Brought up 1 node, 2 CPUs<br>
&gt; [ =C2=A0 =C2=A00.406941] SMP: Total of 2 processors activated.<br>
&gt; [ =C2=A0 =C2=A00.411698] CPU features: detected: 32-bit EL0 Support<br=
>
&gt; [ =C2=A0 =C2=A00.416888] CPU features: detected: CRC32 instructions<br=
>
&gt; [ =C2=A0 =C2=A00.422121] CPU: All CPU(s) started at EL1<br>
&gt; [ =C2=A0 =C2=A00.426248] alternatives: patching kernel code<br>
&gt; [ =C2=A0 =C2=A00.431424] devtmpfs: initialized<br>
&gt; [ =C2=A0 =C2=A00.441454] KASLR enabled<br>
&gt; [ =C2=A0 =C2=A00.441602] clocksource: jiffies: mask: 0xffffffff max_cy=
cles: 0xffffffff, max_idle_ns: 7645041785100000 ns<br>
&gt; [ =C2=A0 =C2=A00.448321] futex hash table entries: 512 (order: 3, 3276=
8 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A00.496183] NET: Registered PF_NETLINK/PF_ROUTE protocol =
family<br>
&gt; [ =C2=A0 =C2=A00.498277] DMA: preallocated 256 KiB GFP_KERNEL pool for=
 atomic allocations<br>
&gt; [ =C2=A0 =C2=A00.503772] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA =
pool for atomic allocations<br>
&gt; [ =C2=A0 =C2=A00.511610] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA3=
2 pool for atomic allocations<br>
&gt; [ =C2=A0 =C2=A00.519478] audit: initializing netlink subsys (disabled)=
<br>
&gt; [ =C2=A0 =C2=A00.524985] audit: type=3D2000 audit(0.336:1): state=3Din=
itialized audit_enabled=3D0 res=3D1<br>
&gt; [ =C2=A0 =C2=A00.529169] thermal_sys: Registered thermal governor &#39=
;step_wise&#39;<br>
&gt; [ =C2=A0 =C2=A00.533023] hw-breakpoint: found 6 breakpoint and 4 watch=
point registers.<br>
&gt; [ =C2=A0 =C2=A00.545608] ASID allocator initialised with 32768 entries=
<br>
&gt; [ =C2=A0 =C2=A00.551030] xen:swiotlb_xen: Warning: only able to alloca=
te 4 MB for software IO TLB<br>
&gt; [ =C2=A0 =C2=A00.559332] software IO TLB: mapped [mem 0x00000000118000=
00-0x0000000011c00000] (4MB)<br>
&gt; [ =C2=A0 =C2=A00.583565] HugeTLB registered 1.00 GiB page size, pre-al=
located 0 pages<br>
&gt; [ =C2=A0 =C2=A00.584721] HugeTLB registered 32.0 MiB page size, pre-al=
located 0 pages<br>
&gt; [ =C2=A0 =C2=A00.591478] HugeTLB registered 2.00 MiB page size, pre-al=
located 0 pages<br>
&gt; [ =C2=A0 =C2=A00.598225] HugeTLB registered 64.0 KiB page size, pre-al=
located 0 pages<br>
&gt; [ =C2=A0 =C2=A00.636520] DRBG: Continuing without Jitter RNG<br>
&gt; [ =C2=A0 =C2=A00.737187] raid6: neonx8 =C2=A0 gen() =C2=A02143 MB/s<br=
>
&gt; [ =C2=A0 =C2=A00.805294] raid6: neonx8 =C2=A0 xor() =C2=A01589 MB/s<br=
>
&gt; [ =C2=A0 =C2=A00.873406] raid6: neonx4 =C2=A0 gen() =C2=A02177 MB/s<br=
>
&gt; [ =C2=A0 =C2=A00.941499] raid6: neonx4 =C2=A0 xor() =C2=A01556 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.009612] raid6: neonx2 =C2=A0 gen() =C2=A02072 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.077715] raid6: neonx2 =C2=A0 xor() =C2=A01430 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.145834] raid6: neonx1 =C2=A0 gen() =C2=A01769 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.213935] raid6: neonx1 =C2=A0 xor() =C2=A01214 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.282046] raid6: int64x8 =C2=A0gen() =C2=A01366 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.350132] raid6: int64x8 =C2=A0xor() =C2=A0 773 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.418259] raid6: int64x4 =C2=A0gen() =C2=A01602 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.486349] raid6: int64x4 =C2=A0xor() =C2=A0 851 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.554464] raid6: int64x2 =C2=A0gen() =C2=A01396 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.622561] raid6: int64x2 =C2=A0xor() =C2=A0 744 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.690687] raid6: int64x1 =C2=A0gen() =C2=A01033 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.758770] raid6: int64x1 =C2=A0xor() =C2=A0 517 MB/s<br=
>
&gt; [ =C2=A0 =C2=A01.758809] raid6: using algorithm neonx4 gen() 2177 MB/s=
<br>
&gt; [ =C2=A0 =C2=A01.762941] raid6: .... xor() 1556 MB/s, rmw enabled<br>
&gt; [ =C2=A0 =C2=A01.767957] raid6: using neon recovery algorithm<br>
&gt; [ =C2=A0 =C2=A01.772824] xen:balloon: Initialising balloon driver<br>
&gt; [ =C2=A0 =C2=A01.778021] iommu: Default domain type: Translated<br>
&gt; [ =C2=A0 =C2=A01.782584] iommu: DMA domain TLB invalidation policy: st=
rict mode<br>
&gt; [ =C2=A0 =C2=A01.789149] SCSI subsystem initialized<br>
&gt; [ =C2=A0 =C2=A01.792820] usbcore: registered new interface driver usbf=
s<br>
&gt; [ =C2=A0 =C2=A01.798254] usbcore: registered new interface driver hub<=
br>
&gt; [ =C2=A0 =C2=A01.803626] usbcore: registered new device driver usb<br>
&gt; [ =C2=A0 =C2=A01.808761] pps_core: LinuxPPS API ver. 1 registered<br>
&gt; [ =C2=A0 =C2=A01.813716] pps_core: Software ver. 5.3.6 - Copyright 200=
5-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it" target=3D"=
_blank">giometti@linux.it</a>&gt;<br>
&gt; [ =C2=A0 =C2=A01.822903] PTP clock support registered<br>
&gt; [ =C2=A0 =C2=A01.826893] EDAC MC: Ver: 3.0.0<br>
&gt; [ =C2=A0 =C2=A01.830375] zynqmp-ipi-mbox mailbox@ff990400: Registered =
ZynqMP IPI mbox with TX/RX channels.<br>
&gt; [ =C2=A0 =C2=A01.838863] zynqmp-ipi-mbox mailbox@ff990600: Registered =
ZynqMP IPI mbox with TX/RX channels.<br>
&gt; [ =C2=A0 =C2=A01.847356] zynqmp-ipi-mbox mailbox@ff990800: Registered =
ZynqMP IPI mbox with TX/RX channels.<br>
&gt; [ =C2=A0 =C2=A01.855907] FPGA manager framework<br>
&gt; [ =C2=A0 =C2=A01.859952] clocksource: Switched to clocksource arch_sys=
_counter<br>
&gt; [ =C2=A0 =C2=A01.871712] NET: Registered PF_INET protocol family<br>
&gt; [ =C2=A0 =C2=A01.871838] IP idents hash table entries: 32768 (order: 6=
, 262144 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.879392] tcp_listen_portaddr_hash hash table entries: =
1024 (order: 2, 16384 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.887078] Table-perturb hash table entries: 65536 (orde=
r: 6, 262144 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.894846] TCP established hash table entries: 16384 (or=
der: 5, 131072 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.902900] TCP bind hash table entries: 16384 (order: 6,=
 262144 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.910350] TCP: Hash tables configured (established 1638=
4 bind 16384)<br>
&gt; [ =C2=A0 =C2=A01.916778] UDP hash table entries: 1024 (order: 3, 32768=
 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.923509] UDP-Lite hash table entries: 1024 (order: 3, =
32768 bytes, linear)<br>
&gt; [ =C2=A0 =C2=A01.930759] NET: Registered PF_UNIX/PF_LOCAL protocol fam=
ily<br>
&gt; [ =C2=A0 =C2=A01.936834] RPC: Registered named UNIX socket transport m=
odule.<br>
&gt; [ =C2=A0 =C2=A01.942342] RPC: Registered udp transport module.<br>
&gt; [ =C2=A0 =C2=A01.947088] RPC: Registered tcp transport module.<br>
&gt; [ =C2=A0 =C2=A01.951843] RPC: Registered tcp NFSv4.1 backchannel trans=
port module.<br>
&gt; [ =C2=A0 =C2=A01.958334] PCI: CLS 0 bytes, default 64<br>
&gt; [ =C2=A0 =C2=A01.962709] Trying to unpack rootfs image as initramfs...=
<br>
&gt; [ =C2=A0 =C2=A01.977090] workingset: timestamp_bits=3D62 max_order=3D1=
9 bucket_order=3D0<br>
&gt; [ =C2=A0 =C2=A01.982863] Installing knfsd (copyright (C) 1996 <a href=
=3D"mailto:okir@monad.swb.de" target=3D"_blank">okir@monad.swb.de</a>).<br>
&gt; [ =C2=A0 =C2=A02.021045] NET: Registered PF_ALG protocol family<br>
&gt; [ =C2=A0 =C2=A02.021122] xor: measuring software checksum speed<br>
&gt; [ =C2=A0 =C2=A02.029347] =C2=A0 =C2=A08regs =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 : =C2=A02366 MB/sec<br>
&gt; [ =C2=A0 =C2=A02.033081] =C2=A0 =C2=A032regs =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0: =C2=A02802 MB/sec<br>
&gt; [ =C2=A0 =C2=A02.038223] =C2=A0 =C2=A0arm64_neon =C2=A0 =C2=A0 =C2=A0:=
 =C2=A02320 MB/sec<br>
&gt; [ =C2=A0 =C2=A02.038385] xor: using function: 32regs (2802 MB/sec)<br>
&gt; [ =C2=A0 =C2=A02.043614] Block layer SCSI generic (bsg) driver version=
 0.4 loaded (major 247)<br>
&gt; [ =C2=A0 =C2=A02.050959] io scheduler mq-deadline registered<br>
&gt; [ =C2=A0 =C2=A02.055521] io scheduler kyber registered<br>
&gt; [ =C2=A0 =C2=A02.068227] xen:xen_evtchn: Event-channel device installe=
d<br>
&gt; [ =C2=A0 =C2=A02.069281] Serial: 8250/16550 driver, 4 ports, IRQ shari=
ng disabled<br>
&gt; [ =C2=A0 =C2=A02.076190] cacheinfo: Unable to detect cache hierarchy f=
or CPU 0<br>
&gt; [ =C2=A0 =C2=A02.085548] brd: module loaded<br>
&gt; [ =C2=A0 =C2=A02.089290] loop: module loaded<br>
&gt; [ =C2=A0 =C2=A02.089341] Invalid max_queues (4), will use default max:=
 2.<br>
&gt; [ =C2=A0 =C2=A02.094565] tun: Universal TUN/TAP device driver, 1.6<br>
&gt; [ =C2=A0 =C2=A02.098655] xen_netfront: Initialising Xen virtual ethern=
et driver<br>
&gt; [ =C2=A0 =C2=A02.104156] usbcore: registered new interface driver rtl8=
150<br>
&gt; [ =C2=A0 =C2=A02.109813] usbcore: registered new interface driver r815=
2<br>
&gt; [ =C2=A0 =C2=A02.115367] usbcore: registered new interface driver asix=
<br>
&gt; [ =C2=A0 =C2=A02.120794] usbcore: registered new interface driver ax88=
179_178a<br>
&gt; [ =C2=A0 =C2=A02.126934] usbcore: registered new interface driver cdc_=
ether<br>
&gt; [ =C2=A0 =C2=A02.132816] usbcore: registered new interface driver cdc_=
eem<br>
&gt; [ =C2=A0 =C2=A02.138527] usbcore: registered new interface driver net1=
080<br>
&gt; [ =C2=A0 =C2=A02.144256] usbcore: registered new interface driver cdc_=
subset<br>
&gt; [ =C2=A0 =C2=A02.150205] usbcore: registered new interface driver zaur=
us<br>
&gt; [ =C2=A0 =C2=A02.155837] usbcore: registered new interface driver cdc_=
ncm<br>
&gt; [ =C2=A0 =C2=A02.161550] usbcore: registered new interface driver r815=
3_ecm<br>
&gt; [ =C2=A0 =C2=A02.168240] usbcore: registered new interface driver cdc_=
acm<br>
&gt; [ =C2=A0 =C2=A02.173109] cdc_acm: USB Abstract Control Model driver fo=
r USB modems and ISDN adapters<br>
&gt; [ =C2=A0 =C2=A02.181358] usbcore: registered new interface driver uas<=
br>
&gt; [ =C2=A0 =C2=A02.186547] usbcore: registered new interface driver usb-=
storage<br>
&gt; [ =C2=A0 =C2=A02.192643] usbcore: registered new interface driver ftdi=
_sio<br>
&gt; [ =C2=A0 =C2=A02.198384] usbserial: USB Serial support registered for =
FTDI USB Serial Device<br>
&gt; [ =C2=A0 =C2=A02.206118] udc-core: couldn&#39;t find an available UDC =
- added [g_mass_storage] to list of pending drivers<br>
&gt; [ =C2=A0 =C2=A02.215332] i2c_dev: i2c /dev entries driver<br>
&gt; [ =C2=A0 =C2=A02.220467] xen_wdt xen_wdt: initialized (timeout=3D60s, =
nowayout=3D0)<br>
&gt; [ =C2=A0 =C2=A02.225923] device-mapper: uevent: version 1.0.3<br>
&gt; [ =C2=A0 =C2=A02.230668] device-mapper: ioctl: 4.45.0-ioctl (2021-03-2=
2) initialised: <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm=
-devel@redhat.com</a><br>
&gt; [ =C2=A0 =C2=A02.239315] EDAC MC0: Giving out device to module 1 contr=
oller synps_ddr_controller: DEV synps_edac (INTERRUPT)<br>
&gt; [ =C2=A0 =C2=A02.249405] EDAC DEVICE0: Giving out device to module zyn=
qmp-ocm-edac controller zynqmp_ocm: DEV ff960000.memory-controller (INTERRU=
PT)<br>
&gt; [ =C2=A0 =C2=A02.261719] sdhci: Secure Digital Host Controller Interfa=
ce driver<br>
&gt; [ =C2=A0 =C2=A02.267487] sdhci: Copyright(c) Pierre Ossman<br>
&gt; [ =C2=A0 =C2=A02.271890] sdhci-pltfm: SDHCI platform and OF driver hel=
per<br>
&gt; [ =C2=A0 =C2=A02.278157] ledtrig-cpu: registered to indicate activity =
on CPUs<br>
&gt; [ =C2=A0 =C2=A02.283816] zynqmp_firmware_probe Platform Management API=
 v1.1<br>
&gt; [ =C2=A0 =C2=A02.289554] zynqmp_firmware_probe Trustzone version v1.0<=
br>
&gt; [ =C2=A0 =C2=A02.327875] securefw securefw: securefw probed<br>
&gt; [ =C2=A0 =C2=A02.328324] alg: No test for xilinx-zynqmp-aes (zynqmp-ae=
s)<br>
&gt; [ =C2=A0 =C2=A02.332563] zynqmp_aes firmware:zynqmp-firmware:zynqmp-ae=
s: AES Successfully Registered<br>
&gt; [ =C2=A0 =C2=A02.341183] alg: No test for xilinx-zynqmp-rsa (zynqmp-rs=
a)<br>
&gt; [ =C2=A0 =C2=A02.347667] remoteproc remoteproc0: ff9a0000.rf5ss:r5f_0 =
is available<br>
&gt; [ =C2=A0 =C2=A02.353003] remoteproc remoteproc1: ff9a0000.rf5ss:r5f_1 =
is available<br>
&gt; [ =C2=A0 =C2=A02.362605] fpga_manager fpga0: Xilinx ZynqMP FPGA Manage=
r registered<br>
&gt; [ =C2=A0 =C2=A02.366540] viper-xen-proxy viper-xen-proxy: Viper Xen Pr=
oxy registered<br>
&gt; [ =C2=A0 =C2=A02.372525] viper-vdpp a4000000.vdpp: Device Tree Probing=
<br>
&gt; [ =C2=A0 =C2=A02.377778] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9=
.0 Info: 1.512.15.0 KeyLen: 32<br>
&gt; [ =C2=A0 =C2=A02.386432] viper-vdpp a4000000.vdpp: Unable to register =
tamper handler. Retrying...<br>
&gt; [ =C2=A0 =C2=A02.394094] viper-vdpp-net a5000000.vdpp_net: Device Tree=
 Probing<br>
&gt; [ =C2=A0 =C2=A02.399854] viper-vdpp-net a5000000.vdpp_net: Device regi=
stered<br>
&gt; [ =C2=A0 =C2=A02.405931] viper-vdpp-stat a8000000.vdpp_stat: Device Tr=
ee Probing<br>
&gt; [ =C2=A0 =C2=A02.412037] viper-vdpp-stat a8000000.vdpp_stat: Build par=
ameters: VTI Count: 512 Event Count: 32<br>
&gt; [ =C2=A0 =C2=A02.420856] default preset<br>
&gt; [ =C2=A0 =C2=A02.423797] viper-vdpp-stat a8000000.vdpp_stat: Device re=
gistered<br>
&gt; [ =C2=A0 =C2=A02.430054] viper-vdpp-rng ac000000.vdpp_rng: Device Tree=
 Probing<br>
&gt; [ =C2=A0 =C2=A02.435948] viper-vdpp-rng ac000000.vdpp_rng: Device regi=
stered<br>
&gt; [ =C2=A0 =C2=A02.441976] vmcu driver init<br>
&gt; [ =C2=A0 =C2=A02.444922] VMCU: : (240:0) registered<br>
&gt; [ =C2=A0 =C2=A02.444956] In K81 Updater init<br>
&gt; [ =C2=A0 =C2=A02.449003] pktgen: Packet Generator for packet performan=
ce testing. Version: 2.75<br>
&gt; [ =C2=A0 =C2=A02.468833] Initializing XFRM netlink socket<br>
&gt; [ =C2=A0 =C2=A02.468902] NET: Registered PF_PACKET protocol family<br>
&gt; [ =C2=A0 =C2=A02.472729] Bridge firewalling registered<br>
&gt; [ =C2=A0 =C2=A02.476785] 8021q: 802.1Q VLAN Support v1.8<br>
&gt; [ =C2=A0 =C2=A02.481341] registered taskstats version 1<br>
&gt; [ =C2=A0 =C2=A02.486394] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=
=3Dno, fsverity=3Dno<br>
&gt; [ =C2=A0 =C2=A02.503145] ff010000.serial: ttyPS1 at MMIO 0xff010000 (i=
rq =3D 36, base_baud =3D 6250000) is a xuartps<br>
&gt; [ =C2=A0 =C2=A02.507103] of-fpga-region fpga-full: FPGA Region probed<=
br>
&gt; [ =C2=A0 =C2=A02.512986] xilinx-zynqmp-dma fd500000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.520267] xilinx-zynqmp-dma fd510000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.528239] xilinx-zynqmp-dma fd520000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.536152] xilinx-zynqmp-dma fd530000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.544153] xilinx-zynqmp-dma fd540000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.552127] xilinx-zynqmp-dma fd550000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.560178] xilinx-zynqmp-dma ffa80000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.567987] xilinx-zynqmp-dma ffa90000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.576018] xilinx-zynqmp-dma ffaa0000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.583889] xilinx-zynqmp-dma ffab0000.dma-controller: Zy=
nqMP DMA driver Probe success<br>
&gt; [ =C2=A0 =C2=A02.946379] spi-nor spi0.0: mt25qu512a (131072 Kbytes)<br=
>
&gt; [ =C2=A0 =C2=A02.946467] 2 fixed-partitions partitions found on MTD de=
vice spi0.0<br>
&gt; [ =C2=A0 =C2=A02.952393] Creating 2 MTD partitions on &quot;spi0.0&quo=
t;:<br>
&gt; [ =C2=A0 =C2=A02.957231] 0x000004000000-0x000008000000 : &quot;bank A&=
quot;<br>
&gt; [ =C2=A0 =C2=A02.963332] 0x000000000000-0x000004000000 : &quot;bank B&=
quot;<br>
&gt; [ =C2=A0 =C2=A02.968694] macb ff0b0000.ethernet: Not enabling partial =
store and forward<br>
&gt; [ =C2=A0 =C2=A02.975333] macb ff0b0000.ethernet eth0: Cadence GEM rev =
0x50070106 at 0xff0b0000 irq 25 (18:41:fe:0f:ff:02)<br>
&gt; [ =C2=A0 =C2=A02.984472] macb ff0c0000.ethernet: Not enabling partial =
store and forward<br>
&gt; [ =C2=A0 =C2=A02.992144] macb ff0c0000.ethernet eth1: Cadence GEM rev =
0x50070106 at 0xff0c0000 irq 26 (18:41:fe:0f:ff:03)<br>
&gt; [ =C2=A0 =C2=A03.001043] viper_enet viper_enet: Viper power GPIOs init=
ialised<br>
&gt; [ =C2=A0 =C2=A03.007313] viper_enet viper_enet vnet0 (uninitialized): =
Validate interface QSGMII<br>
&gt; [ =C2=A0 =C2=A03.014914] viper_enet viper_enet vnet1 (uninitialized): =
Validate interface QSGMII<br>
&gt; [ =C2=A0 =C2=A03.022138] viper_enet viper_enet vnet1 (uninitialized): =
Validate interface type 18<br>
&gt; [ =C2=A0 =C2=A03.030274] viper_enet viper_enet vnet2 (uninitialized): =
Validate interface QSGMII<br>
&gt; [ =C2=A0 =C2=A03.037785] viper_enet viper_enet vnet3 (uninitialized): =
Validate interface QSGMII<br>
&gt; [ =C2=A0 =C2=A03.045301] viper_enet viper_enet: Viper enet registered<=
br>
&gt; [ =C2=A0 =C2=A03.050958] xilinx-axipmon ffa00000.perf-monitor: Probed =
Xilinx APM<br>
&gt; [ =C2=A0 =C2=A03.057135] xilinx-axipmon fd0b0000.perf-monitor: Probed =
Xilinx APM<br>
&gt; [ =C2=A0 =C2=A03.063538] xilinx-axipmon fd490000.perf-monitor: Probed =
Xilinx APM<br>
&gt; [ =C2=A0 =C2=A03.069920] xilinx-axipmon ffa10000.perf-monitor: Probed =
Xilinx APM<br>
&gt; [ =C2=A0 =C2=A03.097729] si70xx: probe of 2-0040 failed with error -5<=
br>
&gt; [ =C2=A0 =C2=A03.098042] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog T=
imer with timeout 60s<br>
&gt; [ =C2=A0 =C2=A03.105111] cdns-wdt ff150000.watchdog: Xilinx Watchdog T=
imer with timeout 10s<br>
&gt; [ =C2=A0 =C2=A03.112457] viper-tamper viper-tamper: Device registered<=
br>
&gt; [ =C2=A0 =C2=A03.117593] active_bank active_bank: boot bank: 1<br>
&gt; [ =C2=A0 =C2=A03.122184] active_bank active_bank: boot mode: (0x02) qs=
pi32<br>
&gt; [ =C2=A0 =C2=A03.128247] viper-vdpp a4000000.vdpp: Device Tree Probing=
<br>
&gt; [ =C2=A0 =C2=A03.133439] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9=
.0 Info: 1.512.15.0 KeyLen: 32<br>
&gt; [ =C2=A0 =C2=A03.142151] viper-vdpp a4000000.vdpp: Tamper handler regi=
stered<br>
&gt; [ =C2=A0 =C2=A03.147438] viper-vdpp a4000000.vdpp: Device registered<b=
r>
&gt; [ =C2=A0 =C2=A03.153007] lpc55_l2 spi1.0: registered handler for proto=
col 0<br>
&gt; [ =C2=A0 =C2=A03.158582] lpc55_user lpc55_user: The major number for y=
our device is 236<br>
&gt; [ =C2=A0 =C2=A03.165976] lpc55_l2 spi1.0: registered handler for proto=
col 1<br>
&gt; [ =C2=A0 =C2=A03.181999] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad =
result: 1<br>
&gt; [ =C2=A0 =C2=A03.182856] rtc-lpc55 rtc_lpc55: registered as rtc0<br>
&gt; [ =C2=A0 =C2=A03.188656] lpc55_l2 spi1.0: (2) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.193744] lpc55_l2 spi1.0: (3) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.198848] lpc55_l2 spi1.0: (4) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.202932] mmc0: SDHCI controller on ff160000.mmc [ff160=
000.mmc] using ADMA 64-bit<br>
&gt; [ =C2=A0 =C2=A03.210689] lpc55_l2 spi1.0: (5) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.215694] lpc55_l2 spi1.0: rx error: -110<br>
&gt; [ =C2=A0 =C2=A03.284438] mmc0: new HS200 MMC card at address 0001<br>
&gt; [ =C2=A0 =C2=A03.285179] mmcblk0: mmc0:0001 SEM16G 14.6 GiB<br>
&gt; [ =C2=A0 =C2=A03.291784] =C2=A0mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8<br>
&gt; [ =C2=A0 =C2=A03.293915] mmcblk0boot0: mmc0:0001 SEM16G 4.00 MiB<br>
&gt; [ =C2=A0 =C2=A03.299054] mmcblk0boot1: mmc0:0001 SEM16G 4.00 MiB<br>
&gt; [ =C2=A0 =C2=A03.303905] mmcblk0rpmb: mmc0:0001 SEM16G 4.00 MiB, chard=
ev (244:0)<br>
&gt; [ =C2=A0 =C2=A03.582676] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad =
result: 1<br>
&gt; [ =C2=A0 =C2=A03.583332] rtc-lpc55 rtc_lpc55: hctosys: unable to read =
the hardware clock<br>
&gt; [ =C2=A0 =C2=A03.591252] cdns-i2c ff020000.i2c: recovery information c=
omplete<br>
&gt; [ =C2=A0 =C2=A03.597085] at24 0-0050: supply vcc not found, using dumm=
y regulator<br>
&gt; [ =C2=A0 =C2=A03.603011] lpc55_l2 spi1.0: (2) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.608093] at24 0-0050: 256 byte spd EEPROM, read-only<b=
r>
&gt; [ =C2=A0 =C2=A03.613620] lpc55_l2 spi1.0: (3) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.619362] lpc55_l2 spi1.0: (4) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.624224] rtc-rv3028 0-0052: registered as rtc1<br>
&gt; [ =C2=A0 =C2=A03.628343] lpc55_l2 spi1.0: (5) mcu still not ready?<br>
&gt; [ =C2=A0 =C2=A03.633253] lpc55_l2 spi1.0: rx error: -110<br>
&gt; [ =C2=A0 =C2=A03.639104] k81_bootloader 0-0010: probe<br>
&gt; [ =C2=A0 =C2=A03.641628] VMCU: : (235:0) registered<br>
&gt; [ =C2=A0 =C2=A03.641635] k81_bootloader 0-0010: probe completed<br>
&gt; [ =C2=A0 =C2=A03.668346] cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 =
irq 28<br>
&gt; [ =C2=A0 =C2=A03.669154] cdns-i2c ff030000.i2c: recovery information c=
omplete<br>
&gt; [ =C2=A0 =C2=A03.675412] lm75 1-0048: supply vs not found, using dummy=
 regulator<br>
&gt; [ =C2=A0 =C2=A03.682920] lm75 1-0048: hwmon1: sensor &#39;tmp112&#39;<=
br>
&gt; [ =C2=A0 =C2=A03.686548] i2c i2c-1: Added multiplexed i2c bus 3<br>
&gt; [ =C2=A0 =C2=A03.690795] i2c i2c-1: Added multiplexed i2c bus 4<br>
&gt; [ =C2=A0 =C2=A03.695629] i2c i2c-1: Added multiplexed i2c bus 5<br>
&gt; [ =C2=A0 =C2=A03.700492] i2c i2c-1: Added multiplexed i2c bus 6<br>
&gt; [ =C2=A0 =C2=A03.705157] pca954x 1-0070: registered 4 multiplexed buss=
es for I2C switch pca9546<br>
&gt; [ =C2=A0 =C2=A03.713049] at24 1-0054: supply vcc not found, using dumm=
y regulator<br>
&gt; [ =C2=A0 =C2=A03.720067] at24 1-0054: 1024 byte 24c08 EEPROM, read-onl=
y<br>
&gt; [ =C2=A0 =C2=A03.724761] cdns-i2c ff030000.i2c: 100 kHz mmio ff030000 =
irq 29<br>
&gt; [ =C2=A0 =C2=A03.731272] sfp viper_enet:sfp-eth1: Host maximum power 2=
.0W<br>
&gt; [ =C2=A0 =C2=A03.737549] sfp_register_socket: got sfp_bus<br>
&gt; [ =C2=A0 =C2=A03.740709] sfp_register_socket: register sfp_bus<br>
&gt; [ =C2=A0 =C2=A03.745459] sfp_register_bus: ops ok!<br>
&gt; [ =C2=A0 =C2=A03.749179] sfp_register_bus: Try to attach<br>
&gt; [ =C2=A0 =C2=A03.753419] sfp_register_bus: Attach succeeded<br>
&gt; [ =C2=A0 =C2=A03.757914] sfp_register_bus: upstream ops attach<br>
&gt; [ =C2=A0 =C2=A03.762677] sfp_register_bus: Bus registered<br>
&gt; [ =C2=A0 =C2=A03.766999] sfp_register_socket: register sfp_bus succeed=
ed<br>
&gt; [ =C2=A0 =C2=A03.775870] of_cfs_init<br>
&gt; [ =C2=A0 =C2=A03.776000] of_cfs_init: OK<br>
&gt; [ =C2=A0 =C2=A03.778211] clk: Not disabling unused clocks<br>
&gt; [ =C2=A0 11.278477] Freeing initrd memory: 206056K<br>
&gt; [ =C2=A0 11.279406] Freeing unused kernel memory: 1536K<br>
&gt; [ =C2=A0 11.314006] Checked W+X mappings: passed, no W+X pages found<b=
r>
&gt; [ =C2=A0 11.314142] Run /init as init process<br>
&gt; INIT: version 3.01 booting<br>
&gt; fsck (busybox 1.35.0)<br>
&gt; /dev/mmcblk0p1: clean, 12/102400 files, 238162/409600 blocks<br>
&gt; /dev/mmcblk0p2: clean, 12/102400 files, 171972/409600 blocks<br>
&gt; /dev/mmcblk0p3 was not cleanly unmounted, check forced.<br>
&gt; /dev/mmcblk0p3: 20/4096 files (0.0% non-contiguous), 663/16384 blocks<=
br>
&gt; [ =C2=A0 11.553073] EXT4-fs (mmcblk0p3): mounted filesystem without jo=
urnal. Opts: (null). Quota mode: disabled.<br>
&gt; Starting random number generator daemon.<br>
&gt; [ =C2=A0 11.580662] random: crng init done<br>
&gt; Starting udev<br>
&gt; [ =C2=A0 11.613159] udevd[142]: starting version 3.2.10<br>
&gt; [ =C2=A0 11.620385] udevd[143]: starting eudev-3.2.10<br>
&gt; [ =C2=A0 11.704481] macb ff0b0000.ethernet control_red: renamed from e=
th0<br>
&gt; [ =C2=A0 11.720264] macb ff0c0000.ethernet control_black: renamed from=
 eth1<br>
&gt; [ =C2=A0 12.063396] ip_local_port_range: prefer different parity for s=
tart/end values.<br>
&gt; [ =C2=A0 12.084801] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad resul=
t: 1<br>
&gt; hwclock: RTC_RD_TIME: Invalid exchange<br>
&gt; Mon Feb 27 08:40:53 UTC 2023<br>
&gt; [ =C2=A0 12.115309] rtc-lpc55 rtc_lpc55: lpc55_rtc_set_time: bad resul=
t<br>
&gt; hwclock: RTC_SET_TIME: Invalid exchange<br>
&gt; [ =C2=A0 12.131027] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad resul=
t: 1<br>
&gt; Starting mcud<br>
&gt; INIT: Entering runlevel: 5<br>
&gt; Configuring network interfaces... done.<br>
&gt; resetting network interface<br>
&gt; [ =C2=A0 12.718295] macb ff0b0000.ethernet control_red: PHY [ff0b0000.=
ethernet-ffffffff:02] driver [Xilinx PCS/PMA PHY] (irq=3DPOLL)<br>
&gt; [ =C2=A0 12.723919] macb ff0b0000.ethernet control_red: configuring fo=
r phy/gmii link mode<br>
&gt; [ =C2=A0 12.732151] pps pps0: new PPS source ptp0<br>
&gt; [ =C2=A0 12.735563] macb ff0b0000.ethernet: gem-ptp-timer ptp clock re=
gistered.<br>
&gt; [ =C2=A0 12.745724] macb ff0c0000.ethernet control_black: PHY [ff0c000=
0.ethernet-ffffffff:01] driver [Xilinx PCS/PMA PHY] (irq=3DPOLL)<br>
&gt; [ =C2=A0 12.753469] macb ff0c0000.ethernet control_black: configuring =
for phy/gmii link mode<br>
&gt; [ =C2=A0 12.761804] pps pps1: new PPS source ptp1<br>
&gt; [ =C2=A0 12.765398] macb ff0c0000.ethernet: gem-ptp-timer ptp clock re=
gistered.<br>
&gt; Auto-negotiation: off<br>
&gt; Auto-negotiation: off<br>
&gt; [ =C2=A0 16.828151] macb ff0b0000.ethernet control_red: unable to gene=
rate target frequency: 125000000 Hz<br>
&gt; [ =C2=A0 16.834553] macb ff0b0000.ethernet control_red: Link is Up - 1=
Gbps/Full - flow control off<br>
&gt; [ =C2=A0 16.860552] macb ff0c0000.ethernet control_black: unable to ge=
nerate target frequency: 125000000 Hz<br>
&gt; [ =C2=A0 16.867052] macb ff0c0000.ethernet control_black: Link is Up -=
 1Gbps/Full - flow control off<br>
&gt; Starting Failsafe Secure Shell server in port 2222: sshd<br>
&gt; done.<br>
&gt; Starting rpcbind daemon...done.<br>
&gt; <br>
&gt; [ =C2=A0 17.093019] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad resul=
t: 1<br>
&gt; hwclock: RTC_RD_TIME: Invalid exchange<br>
&gt; Starting State Manager Service<br>
&gt; Start state-manager restarter...<br>
&gt; (XEN) d0v1 Forwarding AES operation: 3254779951<br>
&gt; Starting /usr/sbin/xenstored....[ =C2=A0 17.265256] BTRFS: device fsid=
 80efc224-c202-4f8e-a949-4dae7f04a0aa devid 1 transid 744 /dev/dm-0<br>
&gt; scanned by udevd (385)<br>
&gt; [ =C2=A0 17.349933] BTRFS info (device dm-0): disk space caching is en=
abled<br>
&gt; [ =C2=A0 17.350670] BTRFS info (device dm-0): has skinny extents<br>
&gt; [ =C2=A0 17.364384] BTRFS info (device dm-0): enabling ssd optimizatio=
ns<br>
&gt; [ =C2=A0 17.830462] BTRFS: device fsid 27ff666b-f4e5-4f90-9054-c210db5=
b2e2e devid 1 transid 6 /dev/mapper/client_prov scanned by mkfs.btrfs<br>
&gt; (526)<br>
&gt; [ =C2=A0 17.872699] BTRFS info (device dm-1): using free space tree<br=
>
&gt; [ =C2=A0 17.872771] BTRFS info (device dm-1): has skinny extents<br>
&gt; [ =C2=A0 17.878114] BTRFS info (device dm-1): flagging fs with big met=
adata feature<br>
&gt; [ =C2=A0 17.894289] BTRFS info (device dm-1): enabling ssd optimizatio=
ns<br>
&gt; [ =C2=A0 17.895695] BTRFS info (device dm-1): checking UUID tree<br>
&gt; <br>
&gt; Setting domain 0 name, domid and JSON config...<br>
&gt; Done setting up Dom0<br>
&gt; Starting xenconsoled...<br>
&gt; Starting QEMU as disk backend for dom0<br>
&gt; Starting domain watchdog daemon: xenwatchdogd startup<br>
&gt; <br>
&gt; [ =C2=A0 18.408647] BTRFS: device fsid 5e08d5e9-bc2a-46b9-af6a-44c7087=
b8921 devid 1 transid 6 /dev/mapper/client_config scanned by mkfs.btrfs<br>
&gt; (574)<br>
&gt; [done]<br>
&gt; [ =C2=A0 18.465552] BTRFS info (device dm-2): using free space tree<br=
>
&gt; [ =C2=A0 18.465629] BTRFS info (device dm-2): has skinny extents<br>
&gt; [ =C2=A0 18.471002] BTRFS info (device dm-2): flagging fs with big met=
adata feature<br>
&gt; Starting crond: [ =C2=A0 18.482371] BTRFS info (device dm-2): enabling=
 ssd optimizations<br>
&gt; [ =C2=A0 18.486659] BTRFS info (device dm-2): checking UUID tree<br>
&gt; OK<br>
&gt; starting rsyslogd ... Log partition ready after 0 poll loops<br>
&gt; done<br>
&gt; rsyslogd: cannot connect to <a href=3D"http://172.18.0.1:514" rel=3D"n=
oreferrer" target=3D"_blank">172.18.0.1:514</a>: Network is unreachable [v8=
.2208.0 try <a href=3D"https://www.rsyslog.com/e/2027" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.rsyslog.com/e/2027</a> ]<br>
&gt; [ =C2=A0 18.670637] BTRFS: device fsid 39d7d9e1-967d-478e-94ae-690deb7=
22095 devid 1 transid 608 /dev/dm-3 scanned by udevd (518)<br>
&gt; <br>
&gt; Please insert USB token and enter your role in login prompt.<br>
&gt; <br>
&gt; login:<br>
&gt; <br>
&gt; Regards,<br>
&gt; O.<br>
&gt; <br>
&gt; <br>
&gt; =D0=BF=D0=BD, 24 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:39=
, Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a>&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Here is the issue from your logs:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SError Interrupt on CPU0, code 0xbe000000 --=
 SError<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SErrors are special signals to notify softwa=
re of serious hardware<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0errors.=C2=A0 Something is going very wrong.=
 Defective hardware is a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0possibility.=C2=A0 Another possibility if so=
ftware accessing address ranges<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0that it is not supposed to, sometimes it cau=
ses SErrors.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 24 Apr 2023, Oleg Nikitenko wrote:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks guys.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I found out where the problem was.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Now dom0 booted more. But I have a new =
one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This is a kernel panic during Dom0 load=
ing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Maybe someone is able to suggest someth=
ing ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.771362] sfp_register_b=
us: upstream ops attach<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.776119] sfp_register_b=
us: Bus registered<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.780459] sfp_register_s=
ocket: register sfp_bus succeeded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.789399] of_cfs_init<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.789499] of_cfs_init: O=
K<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 =C2=A03.791685] clk: Not disab=
ling unused clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010355] SError Interrupt on=
 CPU0, code 0xbe000000 -- SError<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010380] CPU: 0 PID: 9 Comm:=
 kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010393] Workqueue: events_u=
nbound async_run_entry_fn<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010414] pstate: 60000005 (n=
ZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010422] pc : simple_write_e=
nd+0xd0/0x130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010431] lr : generic_perfor=
m_write+0x118/0x1e0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010438] sp : ffffffc00809b9=
10<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010441] x29: ffffffc00809b9=
10 x28: 0000000000000000 x27: ffffffef69ba88c0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010451] x26: 0000000000003e=
ec x25: ffffff807515db00 x24: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010459] x23: ffffffc00809ba=
90 x22: 0000000002aac000 x21: ffffff807315a260<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010472] x20: 00000000000010=
00 x19: fffffffe02000000 x18: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010481] x17: 00000000ffffff=
ff x16: 0000000000008000 x15: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010490] x14: 00000000000000=
00 x13: 0000000000000000 x12: 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010498] x11: 00000000000000=
00 x10: 0000000000000000 x9 : 0000000000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010507] x8 : 00000000000000=
00 x7 : ffffffef693ba680 x6 : 000000002d89b700<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010515] x5 : fffffffe020000=
00 x4 : ffffff807315a3c8 x3 : 0000000000001000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010524] x2 : 0000000002aab0=
00 x1 : 0000000000000001 x0 : 0000000000000005<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010534] Kernel panic - not =
syncing: Asynchronous SError Interrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010539] CPU: 0 PID: 9 Comm:=
 kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010545] Hardware name: D14 =
Viper Board - White Unit (DT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010548] Workqueue: events_u=
nbound async_run_entry_fn<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010556] Call trace:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010558] =C2=A0dump_backtrac=
e+0x0/0x1c4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010567] =C2=A0show_stack+0x=
18/0x2c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010574] =C2=A0dump_stack_lv=
l+0x7c/0xa0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010583] =C2=A0dump_stack+0x=
18/0x34<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010588] =C2=A0panic+0x14c/0=
x2f8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010597] =C2=A0print_tainted=
+0x0/0xb0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010606] =C2=A0arm64_serror_=
panic+0x6c/0x7c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010614] =C2=A0do_serror+0x2=
8/0x60<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010621] =C2=A0el1h_64_error=
_handler+0x30/0x50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010628] =C2=A0el1h_64_error=
+0x78/0x7c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010633] =C2=A0simple_write_=
end+0xd0/0x130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010639] =C2=A0generic_perfo=
rm_write+0x118/0x1e0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010644] =C2=A0__generic_fil=
e_write_iter+0x138/0x1c4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010650] =C2=A0generic_file_=
write_iter+0x78/0xd0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010656] =C2=A0__kernel_writ=
e+0xfc/0x2ac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010665] =C2=A0kernel_write+=
0x88/0x160<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010673] =C2=A0xwrite+0x44/0=
x94<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010680] =C2=A0do_copy+0xa8/=
0x104<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010686] =C2=A0write_buffer+=
0x38/0x58<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010692] =C2=A0flush_buffer+=
0x4c/0xbc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010698] =C2=A0__gunzip+0x28=
0/0x310<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010704] =C2=A0gunzip+0x1c/0=
x28<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010709] =C2=A0unpack_to_roo=
tfs+0x170/0x2b0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010715] =C2=A0do_populate_r=
ootfs+0x80/0x164<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010722] =C2=A0async_run_ent=
ry_fn+0x48/0x164<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010728] =C2=A0process_one_w=
ork+0x1e4/0x3a0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010736] =C2=A0worker_thread=
+0x7c/0x4c0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010743] =C2=A0kthread+0x120=
/0x130<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010750] =C2=A0ret_from_fork=
+0x10/0x20<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010757] SMP: stopping secon=
dary CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010784] Kernel Offset: 0x2f=
61200000 from 0xffffffc008000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010788] PHYS_OFFSET: 0x0<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010790] CPU features: 0x000=
00401,00000842<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.010795] Memory Limit: none<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 11.277509] ---[ end Kernel pan=
ic - not syncing: Asynchronous SError Interrupt ]---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=D1=82, 21 =D0=B0=D0=BF=D1=80. 20=
23=E2=80=AF=D0=B3. =D0=B2 15:52, Michal Orzel &lt;<a href=3D"mailto:michal.=
orzel@amd.com" target=3D"_blank">michal.orzel@amd.com</a>&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 21/04/2023=
 14:49, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello Mi=
chal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I was no=
t able to enable earlyprintk in the xen for now.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I decide=
d to choose another way.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This is =
a xen&#39;s command line that I found out completely.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) $$=
$$ console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M dom0_max_vcpus=3D2 do=
m0_vcpus_pin bootscrub=3D0 vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sched=3Dnull<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0timer_slop=3D=
0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yes, adding a=
 printk() in Xen was also a good idea.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; So you a=
re absolutely right about a command line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Now I am=
 going to find out why xen did not have the correct parameters from the dev=
ice tree.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Maybe you wil=
l find this document helpful:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tps://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree=
/booting.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/Xilin=
x/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D0=BF=
=D1=82, 21 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:16, Michal Or=
zel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.or=
zel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=
=3D"_blank">michal.orzel@amd.com</a>&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0On 21/04/2023 10:04, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Hello Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Yes, I use yocto.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Yesterday all day long I tried to follow your suggestions=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; I faced a problem.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Manually in the xen config build file I pasted the string=
s:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0In the .config file or in some Yocto file (listing additional =
Kconfig options) added to SRC_URI?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0You shouldn&#39;t really modify .config file but if you do, yo=
u should execute &quot;make olddefconfig&quot; afterwards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; CONFIG_EARLY_PRINTK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; CONFIG_EARLY_PRINTK_ZYNQMP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; CONFIG_EARLY_UART_CHOICE_CADENCE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0I hope you added =3Dy to them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Anyway, you have at least the following solutions:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A01) Run bitbake xen -c menuconfig to properly set early printk<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A02) Find out how you enable other Kconfig options in your proje=
ct (e.g. CONFIG_COLORING=3Dy that is not enabled by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A03) Append the following to &quot;xen/arch/arm/configs/arm64_de=
fconfig&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0CONFIG_EARLY_PRINTK_ZYNQMP=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Host hangs in build time.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Maybe I did not set something in the config build file ?<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt; =D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3.=
 =D0=B2 11:57, Oleg Nikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" =
target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:ol=
eshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.=
com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thanks Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You gave me an idea.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I am going to try it today.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=D1=87=D1=82, 20 =D0=B0=D0=BF=D1=80. 2=
023=E2=80=AF=D0=B3. =D0=B2 11:56, Oleg Nikitenko &lt;<a href=3D"mailto:oles=
hiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.=
com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks Stefano.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I am going to do it toda=
y.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=D1=81=D1=80, 19 =D0=B0=
=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 23:05, Stefano Stabellini &lt;<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel=
.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_bl=
ank">sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kerne=
l.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_b=
lank">sstabellini@kernel.org</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, 19=
 Apr 2023, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Mi=
chal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I cor=
rected xen&#39;s command line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Now i=
t is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; xen,x=
en-bootargs =3D &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1600M do=
m0_max_vcpus=3D2 dom0_vcpus_pin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootscrub=3D0=
 vwfi=3Dnative sched=3Dnull<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; timer=
_slop=3D0 way_size=3D65536 xen_colors=3D0-3 dom0_colors=3D4-7&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 colors i=
s way too many for xen, just do xen_colors=3D0-0. There is no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0advantage =
in using more than 1 color for Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 colors i=
s too few for dom0, if you are giving 1600M of memory to Dom0.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Each color=
 is 256M. For 1600M you should give at least 7 colors. Try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_colors=
=3D0-0 dom0_colors=3D1-8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Unfor=
tunately the result was the same.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 =C2=A0- Dom0 mode: Relaxed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 P2M: 3 levels with order-1 root, VTCR 0x0000000080023558<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Scheduling granularity: cpu, 1 CPU per sched-resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Coloring general information<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Way size: 64kB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Max. number of colors available: 16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Xen color(s): [ 0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 alternatives: Patching with alt table 00000000002cc690 -&gt; 00000000002cc=
c0c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Color array allocation failed for dom0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 ****************************************<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Panic on CPU 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Error creating domain 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 ****************************************<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN)=
 Reboot in five seconds...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am =
going to find out how command line arguments passed and parsed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regar=
ds,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D1=
=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 11:25, Oleg N=
ikitenko &lt;<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">ole=
shiiwood@gmail.com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" =
target=3D"_blank">oleshiiwood@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blank">oleshiiwood@gmail.=
com</a> &lt;mailto:<a href=3D"mailto:oleshiiwood@gmail.com" target=3D"_blan=
k">oleshiiwood@gmail.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0Hi Michal,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; You p=
ut my nose into the problem. Thank you.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am =
going to use your point.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Let&#=
39;s see what happens.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regar=
ds,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =D1=
=81=D1=80, 19 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 10:37, Michal=
 Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal=
.orzel@amd.com</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" targe=
t=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">michal.orzel@amd.co=
m</a> &lt;mailto:<a href=3D"mailto:michal.orzel@amd.com" target=3D"_blank">=
michal.orzel@amd.com</a>&gt;&gt;&gt;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0On 19/04/2023 09:03, Oleg Nikitenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; Hello Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the clarification.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; My company uses yocto for image generation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; What kind of information do you need to consult m=
e in this case ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; Maybe modules sizes/addresses which were mentione=
d by @Julien Grall<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:julien@xen.org"=
 target=3D"_blank">julien@xen.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org</a>&gt; &l=
t;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.org=
</a> &lt;mailto:<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@=
xen.org</a>&gt;&gt;&gt; ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0Sorry for jumping into discussion, but FWICS the Xen c=
ommand line you provided seems to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0not the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0one<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0Xen booted with. The error you are observing most like=
ly is due to dom0 colors<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0specified (i.e. lack of dom0_colors=3D&lt;&gt; paramet=
er). Although in the command line you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0provided, this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parameter<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0is set, I strongly doubt that this is the actual comma=
nd line in use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0You wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0xen,xen-bootargs =3D &quot;console=3Ddtuart dtuart=3Ds=
erial0 dom0_mem=3D1600M dom0_max_vcpus=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0_vcpus_pin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootscrub=3D0=
 vwfi=3Dnative<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0sched=3Dnull timer_slop=3D0 way_szize=3D65536 xen_colo=
rs=3D0-3 dom0_colors=3D4-7&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0but:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A01) way_szize has a typo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A02) you specified 4 colors (0-3) for Xen, but the boot =
log says that Xen has only one:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0(XEN) Xen color(s): [ 0 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0This makes me believe that no colors configuration act=
ually end up in command line that Xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0booted<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0with.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0Single color for Xen is a &quot;default if not specifi=
ed&quot; and way size was probably calculated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0by asking<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0HW.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0So I would suggest to first cross-check the command li=
ne in use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0~Michal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; Oleg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt; =D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=
=AF=D0=B3. =D0=B2 20:44, Stefano Stabellini &lt;<a href=3D"mailto:sstabelli=
ni@kernel.org" target=3D"_blank">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kerne=
l.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:sstabellini@ker=
nel.org" target=3D"_blank">sstabellini@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kerne=
l.org</a>&gt; &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=
=3D"_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabel=
lini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt;&gt;&g=
t;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 18 Apr 2023, Oleg Niki=
tenko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Julien,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; This feature has=
 not been merged in Xen upstream yet<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; would assume that up=
stream + the series on the ML [1] work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please clarify this point=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Because the two thoughts =
are controversial.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Oleg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0As Julien wrote, there is noth=
ing controversial. As you are aware,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Xilinx maintains a separate Xe=
n tree specific for Xilinx here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/=
xilinx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/=
xen</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/xilinx/xen</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt;&gt; &lt;<a href=3D"https://github.com/xi=
linx/xen" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xe=
n</a> &lt;<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/xilinx/xen</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/xilinx/xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/xilinx/xen</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xilinx/xen</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and the branch you are using (=
xlnx_rebase_4.16) comes from there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Instead, the upstream Xen tree=
 lives here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen=
.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">=
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"norefer=
rer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsumm=
ary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"norefer=
rer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsumm=
ary</a>&gt;&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dsummary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/g=
itweb/?p=3Dxen.git;a=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"norefer=
rer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsumm=
ary</a>&gt; &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3D=
summary" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitwe=
b/?p=3Dxen.git;a=3Dsummary</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"norefer=
rer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsumm=
ary</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The Cache Coloring feature tha=
t you are trying to configure is present<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0in xlnx_rebase_4.16, but not y=
et present upstream (there is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0outstanding patch series to ad=
d cache coloring to Xen upstream but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0hasn&#39;t been merged yet.)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Anyway, if you are using xlnx_=
rebase_4.16 it doesn&#39;t matter too much for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0you as you already have Cache =
Coloring as a feature there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I take you are using ImageBuil=
der to generate the boot configuration? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0so, please post the ImageBuild=
er config file that you are using.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0But from the boot message, it =
looks like the colors configuration for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Dom0 is incorrect.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--0000000000007c382805fa4ba681--


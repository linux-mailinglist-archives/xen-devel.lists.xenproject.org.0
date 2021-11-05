Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D514445D61
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 02:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221962.383913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mio9F-00042X-Ah; Fri, 05 Nov 2021 01:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221962.383913; Fri, 05 Nov 2021 01:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mio9F-00040i-48; Fri, 05 Nov 2021 01:36:05 +0000
Received: by outflank-mailman (input) for mailman id 221962;
 Fri, 05 Nov 2021 01:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvBC=PY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mio9C-00040c-OU
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 01:36:03 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9e875bb-3dd8-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 02:36:00 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A309561245;
 Fri,  5 Nov 2021 01:35:57 +0000 (UTC)
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
X-Inumbo-ID: b9e875bb-3dd8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636076157;
	bh=KUSZRoT9wMvTtStTHiRtYeUgAcZUABArhGpHv8fdJO0=;
	h=Date:From:To:cc:Subject:From;
	b=onVueMSD43mzVi+WxkhJG+dVXz0s3Z05aj3c4jBp5AfeHq09ICxAkYCtG6gckA1Eh
	 l55niUDyjeSwK+Gw/FL1/c6vzdX90+W0C0jDQS0gqeG3PqNLWKlqp0PvYcM/68fpCH
	 KdPE76WNP2SdmOMXzFXO6jaHDuXLi9x2p71J+Tg7msp5PSfEVfnsRN799eMilfGAV/
	 OFD1CfXholgRdFST26CcJFOSjb+EyRNe6B0QIOB0CpjaSbaEYXBHbGdq0ElbP8IZMh
	 nx9JOJjZdRim6M9/Z2AtPdNWBnT7GdIzkpWoxsUqxHJY6hmIDdVaUsKrDz7TnG7tTz
	 w3PSsCq1NXVOQ==
Date: Thu, 4 Nov 2021 18:35:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny.Zheng@arm.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: static-mem preventing dom0 from booting
Message-ID: <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1172480714-1636076013=:284830"
Content-ID: <alpine.DEB.2.22.394.2111041833390.284830@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1172480714-1636076013=:284830
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2111041833391.284830@ubuntu-linux-20-04-desktop>

Hi Penny,

I am trying to test the static-mem feature in Xen 4.16 but I am having
some issues. I can boot a dom0less domU with static-mem configured
correctly, but when I do so, dom0 doesn't boot any longer.

In the same configuration, if I remove the static-mem related lines from
the domU node on device tree, both dom0 and domU boot successfully.

I am sure the dom0 memory range, allocated by Xen automatically, and the
domU memory range, hand-picked by me, do not clash as you can see from
the boot logs (appended).

Am I missing anything in the configuration? I am using a ZCU102 board,
the memory node on the host device tree is:

	memory {
		device_type = "memory";
		reg = <0x00 0x00 0x00 0x7ff00000 0x08 0x00 0x00 0x80000000>;
	};

I am attaching my u-boot boot.scr script with the device tree
modification to add static memory.

Many thanks for your help!

Cheers,

Stefano


(XEN) Xen version 4.16-rc (sstabellini@) (gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0) debug=y Thu Nov  4 18:28:30 PDT 2021
(XEN) Latest ChangeSet: Mon Nov 1 12:36:26 2021 +0000 git:9f8434d778-dirty
(XEN) Processor: 00000000410fd034: "ARM Limited", variant: 0x0, part 0xd03,rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 1100000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 0000000000001231:0000000000011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 0000000003010066
(XEN)   Auxiliary Features: 0000000000000000
(XEN)   Memory Model Features: 0000000010101105 0000000040000000
(XEN)                          0000000001260000 0000000002102211
(XEN)   ISA Features: 0000000002101110 0000000013112111 0000000021232042
(XEN)                 0000000001112131 0000000000011142 0000000000011121
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 65000 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000f9010000
(XEN)         gic_cpu_addr=00000000f9020000
(XEN)         gic_hyp_addr=00000000f9040000
(XEN)         gic_vcpu_addr=00000000f9060000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: Adjusting CPU interface base to 0xf902f000
(XEN) GICv2: 192 lines, 4 cpus, secure (IID 00000000).
(XEN) XSM Framework v1.0.1 initialized
(XEN) Initialising XSM SILO mode
(XEN) Using scheduler: null Scheduler (null)
(XEN) Initializing null scheduler
(XEN) WARNING: This is experimental software in development.
(XEN) Use at your own risk.
(XEN) Allocated console ring of 16 KiB.
(XEN) Bringing up CPU1
(XEN) Bringing up CPU2
(XEN) Bringing up CPU3
(XEN) Brought up 4 CPUs
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000000e00000
(XEN) Loading ramdisk from boot module @ 0000000002200000
(XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
(XEN) BANK[0] 0x00000020000000-0x00000060000000 (1024MB)
(XEN) Grant table range: 0x00000005600000-0x00000005640000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Extended region 0: 0x80000000->0xc0000000
(XEN) Extended region 1: 0xc8000000->0xe0000000
(XEN) Extended region 2: 0xf0000000->0xf9000000
(XEN) Extended region 3: 0xffc00000->0x600000000
(XEN) Extended region 4: 0x880000000->0x8000000000
(XEN) Extended region 5: 0x8001000000->0x10000000000
(XEN) Loading zImage from 0000000000e00000 to 0000000020000000-0000000021367a00
(XEN) Loading d0 initrd from 0000000002200000 to 0x0000000028200000-0x0000000029d60ac0
(XEN) Loading d0 DTB to 0x0000000028000000-0x00000000280096d4
(XEN) *** LOADING DOMU cpus=1 memory=80000KB ***
(XEN) Loading d1 kernel from boot module @ 0000000003e00000
(XEN) Loading ramdisk from boot module @ 0000000005200000
(XEN) Loading zImage from 0000000003e00000 to 0000000040000000-0000000041367a00
(XEN) Loading d1 initrd from 0000000005200000 to 0x0000000048200000-0x0000000048383400
(XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480007f3
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: Errors and warnings
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) DEBUG start_xen 1054 id=0
(XEN) null.c:353: 0 <-- d0v0
(XEN) DEBUG start_xen 1054 id=1
(XEN) null.c:353: 1 <-- d1v0
(XEN) Freed 348kB init memory.
(XEN) traps.c:2013:d0v0 HSR=0x00000092000045 pc=0xffffffc0105300ec gva=0xfffffffdfda3b000 gpa=0x0000081ffff000
(XEN) d1v0 Unhandled SMC/HVC: 0x84000050
(XEN) d1v0 Unhandled SMC/HVC: 0x8600ff01
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
(XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) DOM1: [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
(XEN) DOM1: [    0.000000] Linux version 5.14.0-00002-g9c4bc20097e8 (sstabellini@ubuntu-linux-20-04-desktop) (gcc (Ubuntu 9.3.0-17ubuntu1~
(XEN) DOM1: 20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #9 SMP Wed Nov 3 16:50:00 PDT 2021
(XEN) DOM1: [    0.000000] efi: UEFI not found.
(XEN) DOM1: [    0.000000] Zone ranges:
(XEN) DOM1: [    0.000000]   DMA32    [mem 0x0000000040000000-0x000000005fffffff]
(XEN) DOM1: [    0.000000]   Normal   empty
(XEN) DOM1: [    0.000000] Movable zone start for each node
(XEN) DOM1: [    0.000000] Early memory node ranges
(XEN) DOM1: [    0.000000]   node   0: [mem 0x0000000040000000-0x000000005fffffff]
(XEN) DOM1: [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000005fffffff]
(XEN) DOM1: [    0.000000] cma: Reserved 256 MiB at 0x000000004f400000
(XEN) DOM1: [    0.000000] psci: probing for conduit method from DT.
(XEN) DOM1: [    0.000000] psci: PSCIv1.1 detected in firmware.
(XEN) DOM1: [    0.000000] psci: Using standard PSCI v0.2 function IDs
(XEN) DOM1: [    0.000000] psci: Trusted OS migration not required
(XEN) DOM1: [    0.000000] psci: SMC Calling Convention v1.1
(XEN) DOM1: [    0.000000] percpu: Embedded 22 pages/cpu s51672 r8192 d30248 u90112
(XEN) DOM1: [    0.000000] Detected VIPT I-cache on CPU0
(XEN) DOM1: [    0.000000] CPU features: detected: ARM erratum 843419
(XEN) DOM1: [    0.000000] CPU features: detected: ARM erratum 845719
(XEN) DOM1: [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129280
(XEN) DOM1: [    0.000000] Kernel command line: console=ttyAMA0
(XEN) DOM1: [    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
(XEN) DOM1: [    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
(XEN) DOM1: [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
(XEN) DOM1: [    0.000000] Memory: 230280K/524288K available (13184K kernel code, 862K rwdata, 3636K rodata, 2048K init, 315K bss, 31864K 
(XEN) DOM1: reserved, 262144K cma-reserved)
(XEN) DOM1: [    0.000000] rcu: Hierarchical RCU implementation.
(XEN) DOM1: [    0.000000] rcu:         RCU event tracing is enabled.
(XEN) DOM1: [    0.000000] rcu:         RCU restricting CPUs from NR_CPUS=4 to nr_cpu_ids=1.
(XEN) DOM1: [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
(XEN) DOM1: [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
(XEN) DOM1: [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
(XEN) DOM1: [    0.000000] Root IRQ handler: gic_handle_irq
(XEN) DOM1: [    0.000000] random: get_random_bytes called from start_kernel+0x4a8/0x728 with crng_init=0
(XEN) DOM1: [    0.000000] arch_timer: cp15 timer(s) running at 65.00MHz (virt).
(XEN) DOM1: [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xefdb196da, max_idle_ns: 440795204367 ns
(XEN) DOM1: [    0.000055] sched_clock: 56 bits at 65MHz, resolution 15ns, wraps every 2199023255550ns
(XEN) DOM1: [    0.015323] Console: colour dummy device 80x25
(XEN) DOM1: [    0.017224] Calibrating delay loop (skipped), value calculated using timer frequency.. 130.00 BogoMIPS (lpj=260000)
(XEN) DOM1: [    0.017335] pid_max: default: 32768 minimum: 301
(XEN) DOM1: [    0.019932] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
(XEN) DOM1: [    0.020022] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 bytes, linear)
(XEN) DOM1: [    0.070463] rcu: Hierarchical SRCU implementation.
(XEN) DOM1: [    0.073611] EFI services will not be available.
(XEN) DOM1: [    0.074889] smp: Bringing up secondary CPUs ...
(XEN) DOM1: [    0.075178] smp: Brought up 1 node, 1 CPU
(XEN) DOM1: [    0.075205] SMP: Total of 1 processors activated.
(XEN) DOM1: [    0.075253] CPU features: detected: 32-bit EL0 Support
(XEN) DOM1: [    0.075304] CPU features: detected: CRC32 instructions
(XEN) DOM1: [    0.076596] CPU: All CPU(s) started at EL1
(XEN) DOM1: [    0.076717] alternatives: patching kernel code
(XEN) DOM1: [    0.092884] devtmpfs: initialized
(XEN) DOM1: [    0.109553] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
(XEN) DOM1: [    0.109716] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
(XEN) DOM1: [    0.124058] pinctrl core: initialized pinctrl subsystem
(XEN) DOM1: [    0.143628] NET: Registered PF_NETLINK/PF_ROUTE protocol family
(XEN) DOM1: [    0.157764] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
(XEN) DOM1: [    0.158089] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
(XEN) DOM1: [    0.158426] audit: initializing netlink subsys (disabled)
(XEN) DOM1: [    0.166578] cpuidle: using governor menu
(XEN) DOM1: [    0.167213] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
(XEN) DOM1: [    0.168930] audit: type=2000 audit(0.140:1): state=initialized audit_enabled=0 res=1
(XEN) DOM1: [    0.169475] ASID allocator initialised with 65536 entries
(XEN) DOM1: [    0.171250] Serial: AMBA PL011 UART driver
(XEN) DOM1: [    0.181920] 22000000.sbsa-uart: ttyAMA0 at MMIO 0x22000000 (irq = 13, base_baud = 0) is a SBSA
(XEN) DOM1: [    0.533061] printk: console [ttyAMA0] enabled

[... cutting here, DOM1 boots until the end, no signs of dom0]
--8323329-1172480714-1636076013=:284830
Content-Type: text/plain; CHARSET=US-ASCII; NAME=boot.source
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2111041833330.284830@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=boot.source

dGZ0cGIgMHhFMDAwMDAgNC4xNi0yMDIyLjEvSW1hZ2UtZG9tVQ0KdGZ0cGIg
MHgyMjAwMDAwIDQuMTYtMjAyMi4xL3hlbi1yb290ZnMuY3Bpby5neg0KdGZ0
cGIgMHgzRTAwMDAwIDQuMTYtMjAyMi4xL0ltYWdlLWRvbVUNCnRmdHBiIDB4
NTIwMDAwMCA0LjE2LTIwMjIuMS9pbml0cmQuY3Bpbw0KdGZ0cGIgMHg1NDAw
MDAwIDQuMTYtMjAyMi4xL3Bhc3N0aHJvdWdoLWV4YW1wbGUtcGFydC5kdGIN
CnRmdHBiIDB4NTYwMDAwMCA0LjE2LTIwMjIuMS94ZW4NCnRmdHBiIDB4NTgw
MDAwMCA0LjE2LTIwMjIuMS9tcHNvYy5kdGINCmZkdCBhZGRyIDB4NTgwMDAw
MA0KZmR0IHJlc2l6ZSAxMDI0DQpmZHQgc2V0IC9jaG9zZW4gXCNhZGRyZXNz
LWNlbGxzIDwweDI+DQpmZHQgc2V0IC9jaG9zZW4gXCNzaXplLWNlbGxzIDww
eDI+DQpmZHQgc2V0IC9jaG9zZW4geGVuLHhlbi1ib290YXJncyAiY29uc29s
ZT1kdHVhcnQgZHR1YXJ0PXNlcmlhbDAgZG9tMF9tZW09MUcgZG9tMF9tYXhf
dmNwdXM9MSBib290c2NydWI9MCB2d2ZpPW5hdGl2ZSBzY2hlZD1udWxsIGxv
Z2x2bD05Ig0KZmR0IG1rbm9kIC9jaG9zZW4gZG9tMA0KZmR0IHNldCAvY2hv
c2VuL2RvbTAgY29tcGF0aWJsZSAgInhlbixsaW51eC16aW1hZ2UiICJ4ZW4s
bXVsdGlib290LW1vZHVsZSIgIm11bHRpYm9vdCxtb2R1bGUiDQpmZHQgc2V0
IC9jaG9zZW4vZG9tMCByZWcgPDB4MCAweEUwMDAwMCAweDAgMHgxMzY3YTAw
Pg0KZmR0IHNldCAvY2hvc2VuIHhlbixkb20wLWJvb3RhcmdzICJjb25zb2xl
PWh2YzAgZWFybHljb249eGVuIGVhcmx5cHJpbnRrPXhlbiBjbGtfaWdub3Jl
X3VudXNlZCByb290PS9kZXYvcmFtMCINCmZkdCBta25vZCAvY2hvc2VuIGRv
bTAtcmFtZGlzaw0KZmR0IHNldCAvY2hvc2VuL2RvbTAtcmFtZGlzayBjb21w
YXRpYmxlICAieGVuLGxpbnV4LWluaXRyZCIgInhlbixtdWx0aWJvb3QtbW9k
dWxlIiAibXVsdGlib290LG1vZHVsZSINCmZkdCBzZXQgL2Nob3Nlbi9kb20w
LXJhbWRpc2sgcmVnIDwweDAgMHgyMjAwMDAwIDB4MCAweDFiNjBhYzA+DQpm
ZHQgbWtub2QgL2Nob3NlbiBkb21VMA0KZmR0IHNldCAvY2hvc2VuL2RvbVUw
IGNvbXBhdGlibGUgInhlbixkb21haW4iDQpmZHQgc2V0IC9jaG9zZW4vZG9t
VTAgXCNhZGRyZXNzLWNlbGxzIDwweDI+DQpmZHQgc2V0IC9jaG9zZW4vZG9t
VTAgXCNzaXplLWNlbGxzIDwweDI+DQpmZHQgc2V0IC9jaG9zZW4vZG9tVTAg
bWVtb3J5IDwwIDB4ODAwMDA+DQpmZHQgc2V0IC9jaG9zZW4vZG9tVTAgXCN4
ZW4sc3RhdGljLW1lbS1hZGRyZXNzLWNlbGxzIDwweDI+DQpmZHQgc2V0IC9j
aG9zZW4vZG9tVTAgXCN4ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzIDwweDE+
DQpmZHQgc2V0IC9jaG9zZW4vZG9tVTAgeGVuLHN0YXRpYy1tZW0gPDB4OCAw
eDAgMHgyMDAwMDAwMD4NCmZkdCBzZXQgL2Nob3Nlbi9kb21VMCBjcHVzIDwx
Pg0KZmR0IHNldCAvY2hvc2VuL2RvbVUwIHZwbDAxMSA8MHgxPg0KZmR0IG1r
bm9kIC9jaG9zZW4vZG9tVTAgbW9kdWxlMHgzRTAwMDAwDQpmZHQgc2V0IC9j
aG9zZW4vZG9tVTAvbW9kdWxlMHgzRTAwMDAwIGNvbXBhdGlibGUgICJtdWx0
aWJvb3Qsa2VybmVsIiAibXVsdGlib290LG1vZHVsZSINCmZkdCBzZXQgL2No
b3Nlbi9kb21VMC9tb2R1bGUweDNFMDAwMDAgcmVnIDwweDAgMHgzRTAwMDAw
IDB4MCAweDEzNjdhMDA+DQpmZHQgc2V0IC9jaG9zZW4vZG9tVTAvbW9kdWxl
MHgzRTAwMDAwIGJvb3RhcmdzICJjb25zb2xlPXR0eUFNQTAiDQpmZHQgbWtu
b2QgL2Nob3Nlbi9kb21VMCBtb2R1bGUweDUyMDAwMDANCmZkdCBzZXQgL2No
b3Nlbi9kb21VMC9tb2R1bGUweDUyMDAwMDAgY29tcGF0aWJsZSAgIm11bHRp
Ym9vdCxyYW1kaXNrIiAibXVsdGlib290LG1vZHVsZSINCmZkdCBzZXQgL2No
b3Nlbi9kb21VMC9tb2R1bGUweDUyMDAwMDAgcmVnIDwweDAgMHg1MjAwMDAw
IDB4MCAweDE4MzQwMD4NCmZkdCBta25vZCAvY2hvc2VuL2RvbVUwIG1vZHVs
ZTB4NTQwMDAwMA0KZmR0IHNldCAvY2hvc2VuL2RvbVUwL21vZHVsZTB4NTQw
MDAwMCBjb21wYXRpYmxlICAibXVsdGlib290LGRldmljZS10cmVlIiAibXVs
dGlib290LG1vZHVsZSINCmZkdCBzZXQgL2Nob3Nlbi9kb21VMC9tb2R1bGUw
eDU0MDAwMDAgcmVnIDwweDAgMHg1NDAwMDAwIDB4MCAweDQ1Yj4NCnNldGVu
diBmZHRfaGlnaCAweGZmZmZmZmZmZmZmZmZmZmYNCmJvb3RpIDB4NTYwMDAw
MCAtIDB4NTgwMDAwMA0K

--8323329-1172480714-1636076013=:284830--


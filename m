Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080AE7178A3
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541629.844583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Gaa-0007mI-W2; Wed, 31 May 2023 07:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541629.844583; Wed, 31 May 2023 07:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Gaa-0007jC-Rl; Wed, 31 May 2023 07:49:48 +0000
Received: by outflank-mailman (input) for mailman id 541629;
 Wed, 31 May 2023 07:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RxVg=BU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1q4GaY-0007j6-HU
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:49:47 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b16dae06-ff87-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 09:49:39 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9BB06320097C
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 03:49:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 31 May 2023 03:49:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 03:49:34 -0400 (EDT)
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
X-Inumbo-ID: b16dae06-ff87-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685519376; x=1685605776; bh=GO
	lGGLQsjK0DFARcfo5fcT/jqEPAPCA7tnl79juiUgQ=; b=HJBB9JQxN7lSH1rCxr
	hcXI4Mrl9Ri93qzXHryFYGFndXjprE8dCg+M27EmRmWuFHiTG7qSoLu4ATyieeQ7
	sCVsHwYXJ6Xyqf1safUmFxAU6l8H2pE6lRsWqGwFWnE7uVa7a4kgFoD+ih+/JbTD
	XTAruQZppIebn+deaC7gSgRjnP4iAAD1d92ansyBqp99uxGa4S/bqyjERIs7xWXY
	FqFUkU6rWmEA1+vMzZex7HyqtlUORDs+emJUTfs60qE1YnavFy9h0eL6botp0xRs
	nHfvtZ4kcCL1nFvgEqYwXiJh0x73QUnjcCu0kV65xjbF/mEJOaaXy9o7if0wzlYG
	VaKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1685519376; x=1685605776; bh=GOlGGLQsjK0DFARcfo5fcT/jqEPAPCA7tnl
	79juiUgQ=; b=sdW1I8vEPxeQpCriHO2Sq0IOz27DU3Rb4i/ny2wA0KibuhKc6c0
	4IoTSxE42NTsebE9IrHzoMPraULx0Owzih4CTq3SMn2sQIAUlWGSiLx12VJ6/WUc
	9YCPT7Br/DaLdM+BIY9GtEF46FDphcLRY6Ds+IEEPzQNKqdjawcMV3CaLpymq8at
	MiZws5bS4d5SwQGbX99KYkJOd+iuACTOEtv9vT0RiQQmh9uNGKpz7EUXUoSdt/ZB
	yJ3bOw6VpdEsAyq+CEUQxI4HhjOOraEqovEsbYbFARPcCq7K/rb2wAfLsJ+/qrTS
	K7/wjHC+ehnAdcYmufz9xVdtmBRcmyXss+w==
X-ME-Sender: <xms:EPx2ZHci5sywf8VlSIbwvkqW9ifNA4oSX9hEYqDjboh9i8eOfQqPiA>
    <xme:EPx2ZNOynUCnAls0fSARipB1oyiMRxhpvvsnh2WkI772_qMZ1vpTqRwUH_MSX_g2R
    9OUgUzFUHA_Bw>
X-ME-Received: <xmr:EPx2ZAgOs_3gBDwPbBdQWD54KhOUKesk_vtcSXRK1ltv9-643gklYli7TpaF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekkedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpedtudfgteduveduieevvefgteeujeelgffggffhhffhhedt
    ffeffefgudeugeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:EPx2ZI-VGwh8Ze01RoFNGYmN1ahg--csBWJZ4axdvqKfBk7RfGjgtQ>
    <xmx:EPx2ZDvsNFqIGYI8gjzAdHM5ZqU1dbTmdYKgp1f6HwkTeGML4xQImw>
    <xmx:EPx2ZHEzEGarS6fxdJe0Beso_Skjdo5DQYO0_-rrhCqHYgQkso3t_A>
    <xmx:EPx2ZB7FlckwQISl-ETSLkb5wIQzNac_lGEw00ZGsJMq-eEsxwT71g>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 31 May 2023 09:49:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: HVM performance once again
Message-ID: <ZHb8DBbRuklAXhCE@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0/lXUo8O37WGBCUc"
Content-Disposition: inline


--0/lXUo8O37WGBCUc
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="T1KEJXkE9CKFKvx+"
Content-Disposition: inline
Date: Wed, 31 May 2023 09:49:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: HVM performance once again


--T1KEJXkE9CKFKvx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I returned to HVM performance once again, this time looking at PCI
passthrough impact evaluating network throughput.
The setup:
 - Xen 4.17
 - Linux 6.3.2 in all domU
 - iperf -c running in a PVH (call it "client")
 - iperf -s running in a HVM (call it "server")
 - client's netfront has a backend directly in server
 - frontend's "trusted" is set to 0
 - HVM have qemu in a stubdomain in all the cases
 - no intentional differences about HVM besides presence of a PCI device
   (it is a network card, but it was not involved in the traffic)

And now the results:
 - server is plain HVM: ~6Gbps
 - server is HVM and has some PCI passthrough: ~3Gbps

Any idea why such huge difference?

One difference I see when comparing the logs, is 64MB swiotlb initalized
in no-PCI case, but I'm not sure if that's really relevant...

Both dmesg attached.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--T1KEJXkE9CKFKvx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="hvm-pci.log"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.3.2-1.qubes.fc37.x86_64 (mockbuild@0c424897d=
4764da983d21c08af6d60ea) (gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4), GNU=
 ld version 2.38-27.fc37) #1 SMP PREEMPT_DYNAMIC Thu May 11 22:08:07 GMT 20=
23
[    0.000000] Command line: root=3D/dev/mapper/dmroot ro nomodeset console=
=3Dhvc0 rd_NO_PLYMOUTH rd.plymouth.enable=3D0 plymouth.enable=3D0 clocksour=
ce=3Dtsc xen_scrub_pages=3D0  selinux=3D1 security=3Dselinux
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.000000] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.000000] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.000000] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.000000] x86/fpu: Enabled xstate features 0x2e7, context size is 2440=
 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 3632
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003effefff] usable
[    0.000000] BIOS-e820: [mem 0x000000003efff000-0x000000003effffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fc000000-0x00000000fc00afff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000fc00b000-0x00000000ffffffff] reser=
ved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Xen HVM domU, BIOS 4.17.0 04/25/2023
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.17.
[    0.000000] platform_pci_unplug: Netfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated NICs.
[    0.000000] platform_pci_unplug: Blkfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated disks.
               You might have to change the root device
               from /dev/hd[a-d] to /dev/xvd[a-d]
               in your root=3D kernel command line option
[    0.000022] HVMOP_pagetable_dying not supported
[    0.018916] tsc: Fast TSC calibration using PIT
[    0.018919] tsc: Detected 2803.078 MHz processor
[    0.018920] tsc: Detected 2803.186 MHz TSC
[    0.019389] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.019392] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.019396] last_pfn =3D 0x3efff max_arch_pfn =3D 0x400000000
[    0.019435] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.027602] found SMP MP-table at [mem 0x000f5a80-0x000f5a8f]
[    0.027631] Using GB pages for direct mapping
[    0.027759] RAMDISK: [mem 0x3e8d5000-0x3efeffff]
[    0.027769] ACPI: Early table checksum verification disabled
[    0.027777] ACPI: RSDP 0x00000000000F59D0 000024 (v02 Xen   )
[    0.027786] ACPI: XSDT 0x00000000FC00A650 000054 (v01 Xen    HVM      00=
000000 HVML 00000000)
[    0.027790] ACPI: FACP 0x00000000FC00A370 0000F4 (v04 Xen    HVM      00=
000000 HVML 00000000)
[    0.027795] ACPI: DSDT 0x00000000FC001040 0092A3 (v02 Xen    HVM      00=
000000 INTL 20220331)
[    0.027798] ACPI: FACS 0x00000000FC001000 000040
[    0.027800] ACPI: FACS 0x00000000FC001000 000040
[    0.027802] ACPI: APIC 0x00000000FC00A470 000070 (v02 Xen    HVM      00=
000000 HVML 00000000)
[    0.027804] ACPI: HPET 0x00000000FC00A560 000038 (v01 Xen    HVM      00=
000000 HVML 00000000)
[    0.027807] ACPI: WAET 0x00000000FC00A5A0 000028 (v01 Xen    HVM      00=
000000 HVML 00000000)
[    0.027809] ACPI: SSDT 0x00000000FC00A5D0 000031 (v02 Xen    HVM      00=
000000 INTL 20220331)
[    0.027811] ACPI: SSDT 0x00000000FC00A610 000031 (v02 Xen    HVM      00=
000000 INTL 20220331)
[    0.027813] ACPI: Reserving FACP table memory at [mem 0xfc00a370-0xfc00a=
463]
[    0.027814] ACPI: Reserving DSDT table memory at [mem 0xfc001040-0xfc00a=
2e2]
[    0.027815] ACPI: Reserving FACS table memory at [mem 0xfc001000-0xfc001=
03f]
[    0.027815] ACPI: Reserving FACS table memory at [mem 0xfc001000-0xfc001=
03f]
[    0.027816] ACPI: Reserving APIC table memory at [mem 0xfc00a470-0xfc00a=
4df]
[    0.027817] ACPI: Reserving HPET table memory at [mem 0xfc00a560-0xfc00a=
597]
[    0.027817] ACPI: Reserving WAET table memory at [mem 0xfc00a5a0-0xfc00a=
5c7]
[    0.027818] ACPI: Reserving SSDT table memory at [mem 0xfc00a5d0-0xfc00a=
600]
[    0.027818] ACPI: Reserving SSDT table memory at [mem 0xfc00a610-0xfc00a=
640]
[    0.028833] No NUMA configuration found
[    0.028835] Faking a node at [mem 0x0000000000000000-0x000000003effefff]
[    0.028843] NODE_DATA(0) allocated [mem 0x3e8aa000-0x3e8d4fff]
[    0.030170] Zone ranges:
[    0.030171]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.030173]   DMA32    [mem 0x0000000001000000-0x000000003effefff]
[    0.030174]   Normal   empty
[    0.030175]   Device   empty
[    0.030175] Movable zone start for each node
[    0.030178] Early memory node ranges
[    0.030178]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.030179]   node   0: [mem 0x0000000000100000-0x000000003effefff]
[    0.030181] Initmem setup node 0 [mem 0x0000000000001000-0x000000003effe=
fff]
[    0.030184] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.030198] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.031209] On node 0, zone DMA32: 4097 pages in unavailable ranges
[    0.033405] ACPI: PM-Timer IO Port: 0xb008
[    0.033449] IOAPIC[0]: apic_id 1, version 17, address 0xfec00000, GSI 0-=
47
[    0.033451] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.033453] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)
[    0.033453] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low level)
[    0.033454] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 low level)
[    0.033457] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.033458] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.033461] TSC deadline timer available
[    0.033461] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.033468] [mem 0x3f000000-0xfbffffff] available for PCI devices
[    0.033469] Booting paravirtualized kernel on Xen HVM
[    0.033471] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.038575] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr=
_node_ids:1
[    0.038767] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u1048576
[    0.038771] pcpu-alloc: s221184 r8192 d28672 u1048576 alloc=3D1*2097152
[    0.038773] pcpu-alloc: [0] 0 1=20
[    0.038790] xen: PV spinlocks enabled
[    0.038792] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, =
linear)
[    0.038795] Fallback order for Node 0: 0=20
[    0.038797] Built 1 zonelists, mobility grouping on.  Total pages: 253759
[    0.038798] Policy zone: DMA32
[    0.038799] Kernel command line: root=3D/dev/mapper/dmroot ro nomodeset =
console=3Dhvc0 rd_NO_PLYMOUTH rd.plymouth.enable=3D0 plymouth.enable=3D0 cl=
ocksource=3Dtsc xen_scrub_pages=3D0  selinux=3D1 security=3Dselinux
[    0.038824] Booted with the nomodeset parameter. Only the system framebu=
ffer will be available
[    0.038883] Unknown kernel command line parameters "rd_NO_PLYMOUTH", wil=
l be passed to user space.
[    0.038944] random: crng init done
[    0.039025] Dentry cache hash table entries: 131072 (order: 8, 1048576 b=
ytes, linear)
[    0.039079] Inode-cache hash table entries: 65536 (order: 7, 524288 byte=
s, linear)
[    0.039287] mem auto-init: stack:all(zero), heap alloc:on, heap free:on
[    0.039288] mem auto-init: clearing system memory may take some time...
[    0.103114] Memory: 941396K/1031796K available (18432K kernel code, 3208=
K rwdata, 8692K rodata, 4992K init, 18632K bss, 90140K reserved, 0K cma-res=
erved)
[    0.103189] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.103197] Kernel/User page tables isolation: enabled
[    0.103217] ftrace: allocating 54208 entries in 212 pages
[    0.109785] ftrace: allocated 212 pages with 4 groups
[    0.110437] Dynamic Preempt: voluntary
[    0.110453] rcu: Preemptible hierarchical RCU implementation.
[    0.110454] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D2.
[    0.110454] 	Trampoline variant of Tasks RCU enabled.
[    0.110455] 	Rude variant of Tasks RCU enabled.
[    0.110455] 	Tracing variant of Tasks RCU enabled.
[    0.110455] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.110456] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.112571] NR_IRQS: 524544, nr_irqs: 512, preallocated irqs: 16
[    0.112596] xen:events: Using FIFO-based ABI
[    0.112611] xen:events: Xen HVM callback vector for event delivery is en=
abled
[    0.112774] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.112867] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.175986] Console: colour VGA+ 80x25
[    0.176004] printk: console [hvc0] enabled
[    0.177192] ACPI: Core revision 20221020
[    0.177290] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 30580167144 ns
[    0.177370] APIC: Switch to symmetric I/O mode setup
[    0.177906] x2apic enabled
[    0.178418] Switched APIC routing to physical x2apic.
[    0.180149] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
[    0.184902] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2868027b22e, max_idle_ns: 440795325881 ns
[    0.184924] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5606.37 BogoMIPS (lpj=3D2803186)
[    0.184941] pid_max: default: 32768 minimum: 301
[    0.184968] LSM: initializing lsm=3Dlockdown,capability,yama,integrity,s=
elinux
[    0.184987] Yama: becoming mindful.
[    0.184998] SELinux:  Initializing.
[    0.185031] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes,=
 linear)
[    0.185043] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 b=
ytes, linear)
[    0.185274] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.185338] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.185347] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.185360] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.185374] Spectre V2 : Mitigation: Retpolines
[    0.185382] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.185393] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.185402] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.185413] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.185426] Spectre V2 : User space: Mitigation: STIBP via prctl
[    0.185437] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.185452] MDS: Mitigation: Clear CPU buffers
[    0.198292] Freeing SMP alternatives memory: 48K
[    0.198355] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
[    0.198374] Xen: using vcpuop timer interface
[    0.198380] installing Xen timer for CPU 0
[    0.198441] smpboot: CPU0: 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GH=
z (family: 0x6, model: 0x8c, stepping: 0x1)
[    0.198475] cpu 0 spinlock event irq 52
[    0.198573] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.198585] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.198604] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.198621] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.198638] Performance Events: unsupported p6 CPU model 140 no PMU driv=
er, software events only.
[    0.198671] rcu: Hierarchical SRCU implementation.
[    0.198679] rcu: 	Max phase no-delay instances is 400.
[    0.198900] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.198921] smp: Bringing up secondary CPUs ...
[    0.198921] installing Xen timer for CPU 1
[    0.198945] x86: Booting SMP configuration:
[    0.198952] .... node  #0, CPUs:      #1
[    0.065145] APIC: Stale IRR: 00080000,00000000,00000000,00000000,0000000=
0,00000000,00000000,00000000 ISR: 00000000,00000000,00000000,00000000,00000=
000,00000000,00000000,00000000
[    0.201461] cpu 1 spinlock event irq 57
[    0.201964] smp: Brought up 1 node, 2 CPUs
[    0.201973] smpboot: Max logical packages: 1
[    0.201982] smpboot: Total of 2 processors activated (11212.74 BogoMIPS)
[    0.203069] devtmpfs: initialized
[    0.203069] x86/mm: Memory block size: 128MB
[    0.203137] ACPI: PM: Registering ACPI NVS region [mem 0xfc000000-0xfc00=
afff] (45056 bytes)
[    0.203137] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.203936] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.204006] pinctrl core: initialized pinctrl subsystem
[    0.204123] PM: RTC time: 07:34:45, date: 2023-05-31
[    0.204353] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.204460] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocat=
ions
[    0.204476] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic=
 allocations
[    0.204489] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atom=
ic allocations
[    0.204510] audit: initializing netlink subsys (disabled)
[    0.204927] audit: type=3D2000 audit(1685518485.303:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.205011] thermal_sys: Registered thermal governor 'fair_share'
[    0.205037] thermal_sys: Registered thermal governor 'bang_bang'
[    0.205049] thermal_sys: Registered thermal governor 'step_wise'
[    0.205059] thermal_sys: Registered thermal governor 'user_space'
[    0.205079] cpuidle: using governor menu
[    0.205963] PCI: Using configuration type 1 for base access
[    0.206083] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.244027] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.244027] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.244027] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.244027] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.244960] cryptd: max_cpu_qlen set to 1000
[    0.244970] raid6: skipped pq benchmark and selected avx512x4
[    0.244970] raid6: using avx512x2 recovery algorithm
[    0.245004] ACPI: Added _OSI(Module Device)
[    0.245012] ACPI: Added _OSI(Processor Device)
[    0.245020] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.245028] ACPI: Added _OSI(Processor Aggregator Device)
[    0.250484] ACPI: 3 ACPI AML tables successfully acquired and loaded
[    0.251325] xen: --> pirq=3D16 -> irq=3D9 (gsi=3D9)
[    0.253462] ACPI: Interpreter enabled
[    0.253477] ACPI: PM: (supports S0 S3 S5)
[    0.253486] ACPI: Using IOAPIC for interrupt routing
[    0.254157] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.254172] PCI: Ignoring E820 reservations for host bridge windows
[    0.254431] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.262927] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.262943] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MS=
I EDR HPX-Type3]
[    0.262957] acpi PNP0A03:00: _OSC: not requesting OS control; OS require=
s [ExtendedConfig ASPM ClockPM MSI]
[    0.262977] acpi PNP0A03:00: fail to add MMCONFIG information, can't acc=
ess extended configuration space under this bridge
[    0.263236] PCI host bridge to bus 0000:00
[    0.263243] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.263254] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.263265] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.263277] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfbfffff=
f window]
[    0.263289] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.263482] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.267278] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.271370] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.273924] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
[    0.274967] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x=
01f7]
[    0.274981] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.274991] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x=
0177]
[    0.275003] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.276018] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.279145] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PIIX=
4 ACPI
[    0.279203] pci 0000:00:01.3: quirk: [io  0xb100-0xb10f] claimed by PIIX=
4 SMB
[    0.280529] pci 0000:00:02.0: [5853:0001] type 00 class 0xff8000
[    0.281924] pci 0000:00:02.0: reg 0x10: [io  0xc000-0xc0ff]
[    0.282453] pci 0000:00:02.0: reg 0x14: [mem 0xf0000000-0xf0ffffff pref]
[    0.288336] pci 0000:00:04.0: [1234:1111] type 00 class 0x030000
[    0.289497] pci 0000:00:04.0: reg 0x10: [mem 0xf1000000-0xf1ffffff pref]
[    0.291280] pci 0000:00:04.0: reg 0x18: [mem 0xf2016000-0xf2016fff]
[    0.294277] pci 0000:00:04.0: reg 0x30: [mem 0xf2000000-0xf200ffff pref]
[    0.294521] pci 0000:00:04.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.295539] pci 0000:00:05.0: [8086:24cd] type 00 class 0x0c0320
[    0.296924] pci 0000:00:05.0: reg 0x10: [mem 0xf2017000-0xf2017fff]
[    0.305422] pci 0000:00:06.0: [8086:2725] type 00 class 0x028000
[    0.314490] pci 0000:00:06.0: reg 0x10: [mem 0xf2010000-0xf2013fff 64bit]
[    0.349073] ACPI: PCI: Interrupt link LNKA configured for IRQ 5
[    0.349355] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    0.349980] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.350250] ACPI: PCI: Interrupt link LNKD configured for IRQ 5
[    0.353021] xen:balloon: Initialising balloon driver
[    0.353048] iommu: Default domain type: Translated=20
[    0.353048] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    0.353048] SCSI subsystem initialized
[    0.353048] libata version 3.00 loaded.
[    0.353048] ACPI: bus type USB registered
[    0.353048] usbcore: registered new interface driver usbfs
[    0.353048] usbcore: registered new interface driver hub
[    0.353048] usbcore: registered new device driver usb
[    0.353048] pps_core: LinuxPPS API ver. 1 registered
[    0.353048] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.353048] PTP clock support registered
[    0.353048] EDAC MC: Ver: 3.0.0
[    0.355174] NetLabel: Initializing
[    0.355174] NetLabel:  domain hash size =3D 128
[    0.355174] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.355174] NetLabel:  unlabeled traffic allowed by default
[    0.355174] mctp: management component transport protocol core
[    0.355174] NET: Registered PF_MCTP protocol family
[    0.355174] PCI: Using ACPI for IRQ routing
[    0.355174] PCI: pci_cache_line_size set to 64 bytes
[    0.357429] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    0.357431] e820: reserve RAM buffer [mem 0x3efff000-0x3fffffff]
[    0.357455] pci 0000:00:04.0: vgaarb: setting as boot VGA device
[    0.357455] pci 0000:00:04.0: vgaarb: bridge control possible
[    0.357455] pci 0000:00:04.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.357925] vgaarb: loaded
[    0.357983] hpet: 3 channels of 0 reserved for per-cpu timers
[    0.358003] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.358014] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
[    0.360958] clocksource: Switched to clocksource xen
[    0.369190] VFS: Disk quotas dquot_6.6.0
[    0.369205] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.369249] pnp: PnP ACPI init
[    0.369297] system 00:00: [mem 0x00000000-0x0009ffff] could not be reser=
ved
[    0.369351] system 00:01: [io  0x08a0-0x08a3] has been reserved
[    0.369363] system 00:01: [io  0x0cc0-0x0ccf] has been reserved
[    0.369374] system 00:01: [io  0x04d0-0x04d1] has been reserved
[    0.369402] xen: --> pirq=3D18 -> irq=3D8 (gsi=3D8)
[    0.369421] xen: --> pirq=3D19 -> irq=3D12 (gsi=3D12)
[    0.369442] xen: --> pirq=3D20 -> irq=3D1 (gsi=3D1)
[    0.369460] xen: --> pirq=3D21 -> irq=3D6 (gsi=3D6)
[    0.369461] pnp 00:05: [dma 2]
[    0.369499] system 00:06: [io  0xae00-0xae0f] has been reserved
[    0.369511] system 00:06: [io  0xb044-0xb047] has been reserved
[    0.370633] pnp: PnP ACPI: found 7 devices
[    0.377652] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.377698] NET: Registered PF_INET protocol family
[    0.377727] IP idents hash table entries: 16384 (order: 5, 131072 bytes,=
 linear)
[    0.377918] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, =
8192 bytes, linear)
[    0.377933] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.377947] TCP established hash table entries: 8192 (order: 4, 65536 by=
tes, linear)
[    0.377965] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, l=
inear)
[    0.377997] TCP: Hash tables configured (established 8192 bind 8192)
[    0.378027] MPTCP token hash table entries: 1024 (order: 2, 24576 bytes,=
 linear)
[    0.378046] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.378059] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, lin=
ear)
[    0.378087] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.378102] NET: Registered PF_XDP protocol family
[    0.378115] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.378126] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.378137] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.378147] pci_bus 0000:00: resource 7 [mem 0xf0000000-0xfbffffff windo=
w]
[    0.378257] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.517324] pci 0000:00:00.0: quirk_passive_release+0x0/0xb0 took 135884=
 usecs
[    0.517345] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.517880] xen: --> pirq=3D22 -> irq=3D39 (gsi=3D39)
[    0.519007] PCI: CLS 0 bytes, default 64
[    0.519082] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x286=
8027b22e, max_idle_ns: 440795325881 ns
[    0.519086] Trying to unpack rootfs image as initramfs...
[    0.519163] clocksource: Switched to clocksource tsc
[    0.519751] Initialise system trusted keyrings
[    0.519769] Key type blacklist registered
[    0.519895] workingset: timestamp_bits=3D36 max_order=3D18 bucket_order=
=3D0
[    0.519921] zbud: loaded
[    0.520409] integrity: Platform Keyring initialized
[    0.520419] integrity: Machine keyring initialized
[    0.527409] NET: Registered PF_ALG protocol family
[    0.527422] xor: automatically using best checksumming function   avx   =
   =20
[    0.527435] Key type asymmetric registered
[    0.527442] Asymmetric key parser 'x509' registered
[    0.592548] Freeing initrd memory: 7276K
[    0.594089] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.594169] io scheduler mq-deadline registered
[    0.594179] io scheduler kyber registered
[    0.594191] io scheduler bfq registered
[    0.595314] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    0.595586] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[    0.595620] ACPI: button: Power Button [PWRF]
[    0.595653] input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/inpu=
t/input1
[    0.595675] ACPI: button: Sleep Button [SLPF]
[    0.619696] xen: --> pirq=3D23 -> irq=3D24 (gsi=3D24)
[    0.620050] xen:grant_table: Grant tables using version 1 layout
[    0.620137] Grant table initialized
[    0.620347] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.621375] Non-volatile memory driver v1.3
[    0.621407] Linux agpgart interface v0.103
[    0.621640] ACPI: bus type drm_connector registered
[    0.630212] ata_piix 0000:00:01.1: version 2.13
[    0.630265] ata_piix 0000:00:01.1: enabling device (0000 -> 0001)
[    0.631280] scsi host0: ata_piix
[    0.631371] scsi host1: ata_piix
[    0.631392] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc200 irq 14
[    0.631403] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc208 irq 15
[    0.631569] usbcore: registered new interface driver usbserial_generic
[    0.631583] usbserial: USB Serial support registered for generic
[    0.631613] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[    0.634445] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.634459] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.634530] mousedev: PS/2 mouse device common for all mice
[    0.635781] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input2
[    0.636593] rtc_cmos 00:02: registered as rtc0
[    0.636631] rtc_cmos 00:02: setting system clock to 2023-05-31T07:34:45 =
UTC (1685518485)
[    0.636664] rtc_cmos 00:02: alarms up to one day, 114 bytes nvram
[    0.636686] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. =
Duplicate IMA measurements will not be recorded in the IMA log.
[    0.636707] device-mapper: uevent: version 1.0.3
[    0.642574] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised:=
 dm-devel@redhat.com
[    0.643434] intel_pstate: CPU model not supported
[    0.643499] hid: raw HID events driver (C) Jiri Kosina
[    0.643525] usbcore: registered new interface driver usbhid
[    0.643534] usbhid: USB HID core driver
[    0.643611] drop_monitor: Initializing network drop monitor service
[    0.643673] Initializing XFRM netlink socket
[    0.643693] NET: Registered PF_INET6 protocol family
[    0.644937] Segment Routing with IPv6
[    0.644946] RPL Segment Routing with IPv6
[    0.644957] In-situ OAM (IOAM) with IPv6
[    0.644978] mip6: Mobile IPv6
[    0.644987] NET: Registered PF_PACKET protocol family
[    0.645179] IPI shorthand broadcast: enabled
[    0.717748] AVX2 version of gcm_enc/dec engaged.
[    0.717839] AES CTR mode by8 optimization enabled
[    0.719003] sched_clock: Marking stable (654403398, 64145092)->(86199716=
3, -143448673)
[    0.719159] registered taskstats version 1
[    0.719246] Loading compiled-in X.509 certificates
[    0.725713] Loaded X.509 cert 'Build time autogenerated kernel key: 71b1=
2e3caf24d55eb39a8d585ceb01a5ebb6ae3a'
[    0.725826] zswap: loaded using pool lzo/zbud
[    0.727372] page_owner is disabled
[    0.727468] Key type .fscrypt registered
[    0.727476] Key type fscrypt-provisioning registered
[    0.727703] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dyes, fsverity=
=3Dyes
[    0.727727] Key type big_key registered
[    0.728980] Key type encrypted registered
[    0.728996] ima: No TPM chip found, activating TPM-bypass!
[    0.729007] Loading compiled-in module X.509 certificates
[    0.729379] Loaded X.509 cert 'Build time autogenerated kernel key: 71b1=
2e3caf24d55eb39a8d585ceb01a5ebb6ae3a'
[    0.729399] ima: Allocated hash algorithm: sha256
[    0.729415] ima: No architecture policies found
[    0.729430] evm: Initialising EVM extended attributes:
[    0.729438] evm: security.selinux
[    0.729445] evm: security.SMACK64 (disabled)
[    0.729453] evm: security.SMACK64EXEC (disabled)
[    0.729461] evm: security.SMACK64TRANSMUTE (disabled)
[    0.729469] evm: security.SMACK64MMAP (disabled)
[    0.729477] evm: security.apparmor
[    0.729483] evm: security.ima
[    0.729489] evm: security.capability
[    0.729495] evm: HMAC attrs: 0x1
[    0.749002] alg: No test for 842 (842-scomp)
[    0.749038] alg: No test for 842 (842-generic)
[    0.827965] xenbus_probe_frontend: Device with no driver: device/vbd/517=
12
[    0.827981] xenbus_probe_frontend: Device with no driver: device/vbd/517=
28
[    0.828003] xenbus_probe_frontend: Device with no driver: device/vbd/517=
44
[    0.828014] xenbus_probe_frontend: Device with no driver: device/vbd/517=
60
[    0.828070] PM:   Magic number: 7:95:573
[    0.828147] RAS: Correctable Errors collector initialized.
[    0.833775] Freeing unused decrypted memory: 2036K
[    0.834286] Freeing unused kernel image (initmem) memory: 4992K
[    0.835596] Write protecting the kernel read-only data: 28672k
[    0.835880] Freeing unused kernel image (rodata/data gap) memory: 1548K
[    0.835920] rodata_test: all tests were successful
[    0.835933] Run /init as init process
[    0.835940]   with arguments:
[    0.835941]     /init
[    0.835942]     rd_NO_PLYMOUTH
[    0.835942]   with environment:
[    0.835943]     HOME=3D/
[    0.835943]     TERM=3Dlinux
[    0.838682] Invalid max_queues (4), will use default max: 2.
[    0.846432] blkfront: xvda: flush diskcache: enabled; persistent grants:=
 enabled; indirect descriptors: enabled; bounce buffer: enabled
[    0.862006]  xvda: xvda1 xvda2 xvda3
[    0.863374] blkfront: xvdb: flush diskcache: enabled; persistent grants:=
 enabled; indirect descriptors: enabled; bounce buffer: enabled
[    0.864929] blkfront: xvdc: flush diskcache: enabled; persistent grants:=
 enabled; indirect descriptors: enabled; bounce buffer: enabled
[    0.866067] blkfront: xvdd: barrier or flush: disabled; persistent grant=
s: enabled; indirect descriptors: enabled; bounce buffer: enabled
[    1.235755]  xvdc: xvdc1 xvdc3
[    1.260299] EXT4-fs (xvda3): mounted filesystem f76da228-62b7-4543-835d-=
9ab0d57bbc45 with ordered data mode. Quota mode: none.
[    1.265182] /dev/xvdd: Can't open blockdev
[    1.266137] EXT4-fs (xvdd): mounting ext3 file system using the ext4 sub=
system
[    1.269835] EXT4-fs (xvdd): mounted filesystem 63438b4b-f5d8-462a-82fe-9=
d52951a6722 with ordered data mode. Quota mode: none.
[    1.349081] audit: type=3D1404 audit(1685518486.211:2): enforcing=3D1 ol=
d_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=3D1 old-enabled=
=3D1 lsm=3Dselinux res=3D1
[    1.373517] SELinux:  Class user_namespace not defined in policy.
[    1.373537] SELinux: the above unknown classes and permissions will be a=
llowed
[    1.375284] SELinux:  policy capability network_peer_controls=3D1
[    1.375297] SELinux:  policy capability open_perms=3D1
[    1.375306] SELinux:  policy capability extended_socket_class=3D1
[    1.375316] SELinux:  policy capability always_check_network=3D0
[    1.375326] SELinux:  policy capability cgroup_seclabel=3D1
[    1.375334] SELinux:  policy capability nnp_nosuid_transition=3D1
[    1.375344] SELinux:  policy capability genfs_seclabel_symlinks=3D1
[    1.375357] SELinux:  policy capability ioctl_skip_cloexec=3D0
[    1.406404] audit: type=3D1403 audit(1685518486.268:3): auid=3D429496729=
5 ses=3D4294967295 lsm=3Dselinux res=3D1
[    1.408271] systemd[1]: Successfully loaded SELinux policy in 59.906ms.
[    1.433151] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 9.663ms.
[    1.439705] systemd[1]: systemd 251.14-2.fc37 running in system mode (+P=
AM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL =
+ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +L=
IBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZS=
TD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
[    1.439761] systemd[1]: Detected virtualization xen.
[    1.439773] systemd[1]: Detected architecture x86-64.
[    1.441169] systemd[1]: No hostname configured, using default hostname.
[    1.441214] systemd[1]: Hostname set to <fedora>.
[    1.489698] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the kernel,=
 BPF LSM not supported
[    1.490215] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D1=
 'systemd'
[    1.525856] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input4
[    1.648265] block xvda: the capability attribute has been deprecated.
[    1.648419] systemd-gpt-auto-generator[226]: Failed to dissect: Permissi=
on denied
[    1.648724] (sd-execut[218]: /usr/lib/systemd/system-generators/systemd-=
gpt-auto-generator failed with exit status 1.
[    1.725139] systemd[1]: /usr/lib/systemd/system/qubes-gui-agent.service:=
15: Standard output type syslog is obsolete, automatically updating to jour=
nal. Please update your unit file, and consider removing the setting altoge=
ther.
[    1.787876] systemd[1]: Queued start job for default target multi-user.t=
arget.
[    1.799152] systemd[1]: Created slice system-getty.slice - Slice /system=
/getty.
[    1.800100] systemd[1]: Created slice system-modprobe.slice - Slice /sys=
tem/modprobe.
[    1.800859] systemd[1]: Created slice system-serial\x2dgetty.slice - Sli=
ce /system/serial-getty.
[    1.801470] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[    1.801830] systemd[1]: Started systemd-ask-password-console.path - Disp=
atch Password Requests to Console Directory Watch.
[    1.802132] systemd[1]: Started systemd-ask-password-wall.path - Forward=
 Password Requests to Wall Directory Watch.
[    1.802835] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automou=
nt - Arbitrary Executable File Formats File System Automount Point.
[    1.803025] systemd[1]: Reached target cryptsetup.target - Local Encrypt=
ed Volumes.
[    1.803158] systemd[1]: Reached target integritysetup.target - Local Int=
egrity Protected Volumes.
[    1.803306] systemd[1]: Reached target remote-fs.target - Remote File Sy=
stems.
[    1.803420] systemd[1]: Reached target slices.target - Slice Units.
[    1.803538] systemd[1]: Reached target veritysetup.target - Local Verity=
 Protected Volumes.
[    1.806744] systemd[1]: Listening on systemd-coredump.socket - Process C=
ore Dump Socket.
[    1.806996] systemd[1]: Listening on systemd-initctl.socket - initctl Co=
mpatibility Named Pipe.
[    1.807505] systemd[1]: Listening on systemd-journald-audit.socket - Jou=
rnal Audit Socket.
[    1.808159] systemd[1]: Listening on systemd-journald-dev-log.socket - J=
ournal Socket (/dev/log).
[    1.808722] systemd[1]: Listening on systemd-journald.socket - Journal S=
ocket.
[    1.809438] systemd[1]: Listening on systemd-oomd.socket - Userspace Out=
-Of-Memory (OOM) Killer Socket.
[    1.810802] systemd[1]: Listening on systemd-udevd-control.socket - udev=
 Control Socket.
[    1.811123] systemd[1]: Listening on systemd-udevd-kernel.socket - udev =
Kernel Socket.
[    1.811464] systemd[1]: Listening on systemd-userdbd.socket - User Datab=
ase Manager Socket.
[    1.849651] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File S=
ystem...
[    1.850451] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue =
File System...
[    1.851217] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug F=
ile System...
[    1.851966] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace=
 File System...
[    1.852744] systemd[1]: Starting dev-xvdc1-swap.service - Enable swap on=
 /dev/xvdc1 early...
[    1.854825] systemd[1]: Starting kmod-static-nodes.service - Create List=
 of Static Device Nodes...
[    1.855630] systemd[1]: Starting modprobe@configfs.service - Load Kernel=
 Module configfs...
[    1.856409] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel M=
odule dm_mod...
[    1.857186] systemd[1]: Starting modprobe@drm.service - Load Kernel Modu=
le drm...
[    1.857968] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mod=
ule fuse...
[    1.858758] systemd[1]: Starting modprobe@loop.service - Load Kernel Mod=
ule loop...
[    1.860236] systemd[1]: Starting systemd-modules-load.service - Load Ker=
nel Modules...
[    1.860598] Adding 1048572k swap on /dev/xvdc1.  Priority:-2 extents:1 a=
cross:1048572k SSFS
[    1.861141] systemd[1]: Starting systemd-network-generator.service - Gen=
erate network units from Kernel command line...
[    1.861981] systemd[1]: Starting systemd-udev-trigger.service - Coldplug=
 All udev Devices...
[    1.862820] systemd[1]: Condition check resulted in dev-xvdc1.swap - /de=
v/xvdc1 being skipped.
[    1.862857] systemd[1]: Unnecessary job was removed for dev-xvdc1.device=
 - /dev/xvdc1.
[    1.863125] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File Sy=
stem.
[    1.863320] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug Fi=
le System.
[    1.863644] systemd[1]: Finished kmod-static-nodes.service - Create List=
 of Static Device Nodes.
[    1.863771] systemd[1]: Reached target swap.target - Swaps.
[    1.865021] systemd[1]: Mounting tmp.mount - Temporary Directory /tmp...
[    1.866192] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue F=
ile System.
[    1.866450] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace =
File System.
[    1.868354] systemd[1]: Mounted tmp.mount - Temporary Directory /tmp.
[    1.869924] systemd[1]: Finished systemd-network-generator.service - Gen=
erate network units from Kernel command line.
[    1.874343] systemd[1]: dev-xvdc1-swap.service: Deactivated successfully.
[    1.874460] systemd[1]: Finished dev-xvdc1-swap.service - Enable swap on=
 /dev/xvdc1 early.
[    2.049357] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    2.049489] systemd[1]: Finished modprobe@configfs.service - Load Kernel=
 Module configfs.
[    2.049748] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    2.049840] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel M=
odule dm_mod.
[    2.050025] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    2.050112] systemd[1]: Finished modprobe@drm.service - Load Kernel Modu=
le drm.
[    2.052726] systemd[1]: Mounting sys-kernel-config.mount - Kernel Config=
uration File System...
[    2.052812] systemd[1]: systemd-fsck-root.service - File System Check on=
 Root Device was skipped because of a failed condition check (ConditionPath=
IsReadWrite=3D!/).
[    2.053631] systemd[1]: Starting systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems...
[    2.055367] systemd[1]: Mounted sys-kernel-config.mount - Kernel Configu=
ration File System.
[    2.063069] EXT4-fs (xvda3): re-mounted f76da228-62b7-4543-835d-9ab0d57b=
bc45. Quota mode: none.
[    2.080095] fuse: init (API version 7.38)
[    2.081139] systemd[1]: Finished systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems.
[    2.081310] systemd[1]: ostree-remount.service - OSTree Remount OS/ Bind=
 Mounts was skipped because of a failed condition check (ConditionKernelCom=
mandLine=3Dostree).
[    2.081378] systemd[1]: systemd-firstboot.service - First Boot Wizard wa=
s skipped because of a failed condition check (ConditionFirstBoot=3Dyes).
[    2.081954] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware D=
atabase was skipped because of a failed condition check (ConditionNeedsUpda=
te=3D/etc).
[    2.082010] systemd[1]: systemd-sysusers.service - Create System Users w=
as skipped because of a failed condition check (ConditionNeedsUpdate=3D/etc=
).
[    2.084015] xen:xen_evtchn: Event-channel device installed
[    2.084787] loop: module loaded
[    2.085654] systemd[1]: Starting systemd-tmpfiles-setup-dev.service - Cr=
eate Static Device Nodes in /dev...
[    2.086004] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    2.086126] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mod=
ule fuse.
[    2.086352] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    2.086450] systemd[1]: Finished modprobe@loop.service - Load Kernel Mod=
ule loop.
[    2.086682] systemd[1]: systemd-repart.service - Repartition Root Disk w=
as skipped because all trigger condition checks failed.
[    2.115478] systemd[1]: Finished systemd-udev-trigger.service - Coldplug=
 All udev Devices.
[    2.119529] systemd[1]: Finished systemd-tmpfiles-setup-dev.service - Cr=
eate Static Device Nodes in /dev.
[    2.248928] systemd[1]: Reached target local-fs-pre.target - Preparation=
 for Local File Systems.
[    2.252718] systemd[1]: Started haveged.service - Entropy Daemon based o=
n the HAVEGE algorithm.
[    2.254066] systemd[1]: Starting systemd-journald.service - Journal Serv=
ice...
[    2.254889] systemd[1]: Starting systemd-udevd.service - Rule-based Mana=
ger for Device Events and Files...
[    2.280631] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[    2.294713] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[    2.294764] db_root: cannot open: /etc/target
[    2.303696] audit: type=3D1130 audit(1685518487.143:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/system=
d" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.438891] audit: type=3D1130 audit(1685518487.301:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-udevd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.443290] systemd-journald[264]: Received client request to flush runt=
ime journal.
[    2.445625] audit: type=3D1130 audit(1685518487.308:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-modules-load comm=3D"systemd" exe=3D"/usr/lib/systemd/sy=
stemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.515666] audit: type=3D1130 audit(1685518487.378:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dmodprobe@fuse comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.515702] audit: type=3D1131 audit(1685518487.378:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dmodprobe@fuse comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.515932] audit: type=3D1130 audit(1685518487.378:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-sysctl comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.520762] memmap_init_zone_device initialised 32768 pages in 0ms
[    2.522921] audit: type=3D1130 audit(1685518487.385:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dqubes-db comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostn=
ame=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    2.557791] FDC 0 is a S82078B
[    2.563377] piix4_smbus 0000:00:01.3: SMBus Host Controller not enabled!
[    2.590058] input: PC Speaker as /devices/platform/pcspkr/input/input5
[    2.603567] ehci-pci 0000:00:05.0: EHCI Host Controller
[    2.603686] ehci-pci 0000:00:05.0: new USB bus registered, assigned bus =
number 1
[    2.605505] ehci-pci 0000:00:05.0: irq 39, io mem 0xf2017000
[    2.613259] ehci-pci 0000:00:05.0: USB 2.0 started, EHCI 1.00
[    2.613372] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.03
[    2.613386] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    2.613398] usb usb1: Product: EHCI Host Controller
[    2.613406] usb usb1: Manufacturer: Linux 6.3.2-1.qubes.fc37.x86_64 ehci=
_hcd
[    2.613418] usb usb1: SerialNumber: 0000:00:05.0
[    2.613514] hub 1-0:1.0: USB hub found
[    2.613525] hub 1-0:1.0: 6 ports detected
[    2.732879] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    2.733203] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.754151] EXT4-fs (xvdb): mounted filesystem 746fe74c-2e8d-4d06-9216-b=
4fd74ea9071 with ordered data mode. Quota mode: none.
[    2.853580] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    2.922926] Intel(R) Wireless WiFi driver for Linux
[    2.924098] xen: --> pirq=3D17 -> irq=3D40 (gsi=3D40)
[    2.974268] iwlwifi 0000:00:06.0: api flags index 2 larger than supporte=
d by driver
[    2.974299] iwlwifi 0000:00:06.0: TLV_FW_FSEQ_VERSION: FSEQ Version: 0.0=
=2E2.36
[    2.974976] iwlwifi 0000:00:06.0: loaded firmware version 74.fe17486e.0 =
ty-a0-gf-a0-74.ucode op_mode iwlmvm
[    2.989117] intel_rapl_msr: PL4 support detected.
[    3.012135] usb 1-1: New USB device found, idVendor=3D0627, idProduct=3D=
0001, bcdDevice=3D 0.00
[    3.012156] usb 1-1: New USB device strings: Mfr=3D1, Product=3D3, Seria=
lNumber=3D10
[    3.012170] usb 1-1: Product: QEMU USB Tablet
[    3.012178] usb 1-1: Manufacturer: QEMU
[    3.012210] usb 1-1: SerialNumber: 42
[    3.032337] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:0=
5.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input6
[    3.032466] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.0=
1 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:05.0-1/input0
[    3.073319] iwlwifi 0000:00:06.0: Detected Intel(R) Wi-Fi 6 AX210 160MHz=
, REV=3D0x420
[    3.073377] thermal thermal_zone0: failed to read out thermal zone (-61)
[    3.083582] iwlwifi 0000:00:06.0: WRT: Invalid buffer destination
[    3.246951] iwlwifi 0000:00:06.0: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    3.247176] iwlwifi 0000:00:06.0: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    3.247315] iwlwifi 0000:00:06.0: WFPM_AUTH_KEY_0: 0x80
[    3.247425] iwlwifi 0000:00:06.0: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    3.249710] iwlwifi 0000:00:06.0: loaded PNVM version e4a49534
[    3.264991] iwlwifi 0000:00:06.0: Detected RF GF, rfid=3D0x10d000
[    3.340162] iwlwifi 0000:00:06.0: base HW address: 00:93:37:95:ca:3b
[    3.545603] iwlwifi 0000:00:06.0: firmware didn't ACK the reset - contin=
ue anyway
[    3.546216] iwlwifi 0000:00:06.0: Start IWL Error Log Dump:
[    3.546227] iwlwifi 0000:00:06.0: Transport status: 0x0000004A, valid: 6
[    3.546238] iwlwifi 0000:00:06.0: Loaded firmware version: 74.fe17486e.0=
 ty-a0-gf-a0-74.ucode
[    3.546253] iwlwifi 0000:00:06.0: 0x00000084 | NMI_INTERRUPT_UNKNOWN    =
  =20
[    3.546264] iwlwifi 0000:00:06.0: 0x00A082F0 | trm_hw_status0
[    3.546275] iwlwifi 0000:00:06.0: 0x00000000 | trm_hw_status1
[    3.546285] iwlwifi 0000:00:06.0: 0x004DBE68 | branchlink2
[    3.546294] iwlwifi 0000:00:06.0: 0x004BFC9C | interruptlink1
[    3.546304] iwlwifi 0000:00:06.0: 0x004BFC9C | interruptlink2
[    3.546314] iwlwifi 0000:00:06.0: 0x00016F32 | data1
[    3.546322] iwlwifi 0000:00:06.0: 0x01000000 | data2
[    3.546331] iwlwifi 0000:00:06.0: 0x00000000 | data3
[    3.546339] iwlwifi 0000:00:06.0: 0x00000000 | beacon time
[    3.546350] iwlwifi 0000:00:06.0: 0x0002A565 | tsf low
[    3.546358] iwlwifi 0000:00:06.0: 0x00000000 | tsf hi
[    3.546366] iwlwifi 0000:00:06.0: 0x00000000 | time gp1
[    3.546375] iwlwifi 0000:00:06.0: 0x0003F04E | time gp2
[    3.546383] iwlwifi 0000:00:06.0: 0x00000001 | uCode revision type
[    3.546393] iwlwifi 0000:00:06.0: 0x0000004A | uCode version major
[    3.546404] iwlwifi 0000:00:06.0: 0xFE17486E | uCode version minor
[    3.546414] iwlwifi 0000:00:06.0: 0x00000420 | hw version
[    3.546422] iwlwifi 0000:00:06.0: 0x18C80002 | board version
[    3.546433] iwlwifi 0000:00:06.0: 0x8071FF00 | hcmd
[    3.546441] iwlwifi 0000:00:06.0: 0x20020000 | isr0
[    3.546449] iwlwifi 0000:00:06.0: 0x00000000 | isr1
[    3.546458] iwlwifi 0000:00:06.0: 0x48F00002 | isr2
[    3.546466] iwlwifi 0000:00:06.0: 0x00C0000C | isr3
[    3.546474] iwlwifi 0000:00:06.0: 0x00000000 | isr4
[    3.546483] iwlwifi 0000:00:06.0: 0x00000000 | last cmd Id
[    3.546491] iwlwifi 0000:00:06.0: 0x00016F32 | wait_event
[    3.546499] iwlwifi 0000:00:06.0: 0x00000000 | l2p_control
[    3.546508] iwlwifi 0000:00:06.0: 0x00000000 | l2p_duration
[    3.546516] iwlwifi 0000:00:06.0: 0x00000000 | l2p_mhvalid
[    3.546787] iwlwifi 0000:00:06.0: 0x00000000 | l2p_addr_match
[    3.546798] iwlwifi 0000:00:06.0: 0x00000009 | lmpm_pmg_sel
[    3.546806] iwlwifi 0000:00:06.0: 0x00000000 | timestamp
[    3.546815] iwlwifi 0000:00:06.0: 0x00000028 | flow_handler
[    3.547039] iwlwifi 0000:00:06.0: Start IWL Error Log Dump:
[    3.547049] iwlwifi 0000:00:06.0: Transport status: 0x0000004A, valid: 7
[    3.547059] iwlwifi 0000:00:06.0: 0x20000074 | ADVANCED_SYSASSERT
[    3.547070] iwlwifi 0000:00:06.0: 0x00000000 | umac branchlink1
[    3.547080] iwlwifi 0000:00:06.0: 0x8045F470 | umac branchlink2
[    3.547090] iwlwifi 0000:00:06.0: 0x8047EE8E | umac interruptlink1
[    3.547100] iwlwifi 0000:00:06.0: 0x8047EE8E | umac interruptlink2
[    3.547111] iwlwifi 0000:00:06.0: 0x01000000 | umac data1
[    3.547119] iwlwifi 0000:00:06.0: 0x8047EE8E | umac data2
[    3.547127] iwlwifi 0000:00:06.0: 0x00000000 | umac data3
[    3.547136] iwlwifi 0000:00:06.0: 0x0000004A | umac major
[    3.547144] iwlwifi 0000:00:06.0: 0xFE17486E | umac minor
[    3.547152] iwlwifi 0000:00:06.0: 0x0003F159 | frame pointer
[    3.547163] iwlwifi 0000:00:06.0: 0xC0886258 | stack pointer
[    3.547173] iwlwifi 0000:00:06.0: 0x00040F07 | last host cmd
[    3.547183] iwlwifi 0000:00:06.0: 0x00000404 | isr status reg
[    3.547824] iwlwifi 0000:00:06.0: IML/ROM dump:
[    3.547834] iwlwifi 0000:00:06.0: 0x00000B03 | IML/ROM error/state
[    3.548037] iwlwifi 0000:00:06.0: 0x00008572 | IML/ROM data1
[    3.548247] iwlwifi 0000:00:06.0: 0x00000080 | IML/ROM WFPM_AUTH_KEY_0
[    3.548521] iwlwifi 0000:00:06.0: Fseq Registers:
[    3.548679] iwlwifi 0000:00:06.0: 0x60000100 | FSEQ_ERROR_CODE
[    3.548828] iwlwifi 0000:00:06.0: 0x00440007 | FSEQ_TOP_INIT_VERSION
[    3.548978] iwlwifi 0000:00:06.0: 0x00080009 | FSEQ_CNVIO_INIT_VERSION
[    3.549128] iwlwifi 0000:00:06.0: 0x0000A652 | FSEQ_OTP_VERSION
[    3.549277] iwlwifi 0000:00:06.0: 0x00000002 | FSEQ_TOP_CONTENT_VERSION
[    3.549427] iwlwifi 0000:00:06.0: 0x4552414E | FSEQ_ALIVE_TOKEN
[    3.549582] iwlwifi 0000:00:06.0: 0x00400410 | FSEQ_CNVI_ID
[    3.549731] iwlwifi 0000:00:06.0: 0x00400410 | FSEQ_CNVR_ID
[    3.549878] iwlwifi 0000:00:06.0: 0x00400410 | CNVI_AUX_MISC_CHIP
[    3.550029] iwlwifi 0000:00:06.0: 0x00400410 | CNVR_AUX_MISC_CHIP
[    3.550181] iwlwifi 0000:00:06.0: 0x00009061 | CNVR_SCU_SD_REGS_SD_REG_D=
IG_DCDC_VTRIM
[    3.550334] iwlwifi 0000:00:06.0: 0x00000061 | CNVR_SCU_SD_REGS_SD_REG_A=
CTIVE_VDIG_MIRROR
[    3.550487] iwlwifi 0000:00:06.0: WRT: Collecting data: ini trigger 4 fi=
red (delay=3D0ms).
[    4.508930] iwlwifi 0000:00:06.0 wls6: renamed from wlan0
[    4.739155] NET: Registered PF_QIPCRTR protocol family
[    4.752757] iwlwifi 0000:00:06.0: WRT: Invalid buffer destination
[    4.916099] iwlwifi 0000:00:06.0: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    4.916143] iwlwifi 0000:00:06.0: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    4.916179] iwlwifi 0000:00:06.0: WFPM_AUTH_KEY_0: 0x80
[    4.916217] iwlwifi 0000:00:06.0: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    5.241640] iwlwifi 0000:00:06.0: firmware didn't ACK the reset - contin=
ue anyway
[    5.241977] iwlwifi 0000:00:06.0: Start IWL Error Log Dump:
[    5.241987] iwlwifi 0000:00:06.0: Transport status: 0x0000004A, valid: 6
[    5.241997] iwlwifi 0000:00:06.0: Loaded firmware version: 74.fe17486e.0=
 ty-a0-gf-a0-74.ucode
[    5.242012] iwlwifi 0000:00:06.0: 0x00000084 | NMI_INTERRUPT_UNKNOWN    =
  =20
[    5.242023] iwlwifi 0000:00:06.0: 0x000002F0 | trm_hw_status0
[    5.242033] iwlwifi 0000:00:06.0: 0x00000000 | trm_hw_status1
[    5.242043] iwlwifi 0000:00:06.0: 0x004DBE68 | branchlink2
[    5.242052] iwlwifi 0000:00:06.0: 0x004D1DEA | interruptlink1
[    5.242062] iwlwifi 0000:00:06.0: 0x004D1DEA | interruptlink2
[    5.242072] iwlwifi 0000:00:06.0: 0x00016F32 | data1
[    5.242081] iwlwifi 0000:00:06.0: 0x01000000 | data2
[    5.242089] iwlwifi 0000:00:06.0: 0x00000000 | data3
[    5.242098] iwlwifi 0000:00:06.0: 0x003D1E73 | beacon time
[    5.242106] iwlwifi 0000:00:06.0: 0x000318FA | tsf low
[    5.242114] iwlwifi 0000:00:06.0: 0x00000000 | tsf hi
[    5.242122] iwlwifi 0000:00:06.0: 0x00000000 | time gp1
[    5.242131] iwlwifi 0000:00:06.0: 0x0004637B | time gp2
[    5.242139] iwlwifi 0000:00:06.0: 0x00000001 | uCode revision type
[    5.242150] iwlwifi 0000:00:06.0: 0x0000004A | uCode version major
[    5.242160] iwlwifi 0000:00:06.0: 0xFE17486E | uCode version minor
[    5.242170] iwlwifi 0000:00:06.0: 0x00000420 | hw version
[    5.242179] iwlwifi 0000:00:06.0: 0x18C80002 | board version
[    5.242189] iwlwifi 0000:00:06.0: 0x80B3FF00 | hcmd
[    5.242197] iwlwifi 0000:00:06.0: 0x00020000 | isr0
[    5.242205] iwlwifi 0000:00:06.0: 0x00000000 | isr1
[    5.242214] iwlwifi 0000:00:06.0: 0x48F04802 | isr2
[    5.242222] iwlwifi 0000:00:06.0: 0x04C3000C | isr3
[    5.242230] iwlwifi 0000:00:06.0: 0x00000000 | isr4
[    5.242238] iwlwifi 0000:00:06.0: 0x001B0148 | last cmd Id
[    5.242247] iwlwifi 0000:00:06.0: 0x00016F32 | wait_event
[    5.242255] iwlwifi 0000:00:06.0: 0x00000000 | l2p_control
[    5.242263] iwlwifi 0000:00:06.0: 0x00000000 | l2p_duration
[    5.242271] iwlwifi 0000:00:06.0: 0x00000000 | l2p_mhvalid
[    5.242280] iwlwifi 0000:00:06.0: 0x00000000 | l2p_addr_match
[    5.242290] iwlwifi 0000:00:06.0: 0x00000018 | lmpm_pmg_sel
[    5.242298] iwlwifi 0000:00:06.0: 0x00000000 | timestamp
[    5.242306] iwlwifi 0000:00:06.0: 0x00001840 | flow_handler
[    5.242531] iwlwifi 0000:00:06.0: Start IWL Error Log Dump:
[    5.242540] iwlwifi 0000:00:06.0: Transport status: 0x0000004A, valid: 7
[    5.242563] iwlwifi 0000:00:06.0: 0x20000074 | ADVANCED_SYSASSERT
[    5.242574] iwlwifi 0000:00:06.0: 0x00000000 | umac branchlink1
[    5.242584] iwlwifi 0000:00:06.0: 0x8045F470 | umac branchlink2
[    5.242594] iwlwifi 0000:00:06.0: 0xC00818A8 | umac interruptlink1
[    5.242604] iwlwifi 0000:00:06.0: 0x8047EE8E | umac interruptlink2
[    5.242614] iwlwifi 0000:00:06.0: 0x01000000 | umac data1
[    5.242622] iwlwifi 0000:00:06.0: 0x8047EE8E | umac data2
[    5.242631] iwlwifi 0000:00:06.0: 0x00000000 | umac data3
[    5.242639] iwlwifi 0000:00:06.0: 0x0000004A | umac major
[    5.242647] iwlwifi 0000:00:06.0: 0xFE17486E | umac minor
[    5.242655] iwlwifi 0000:00:06.0: 0x00046486 | frame pointer
[    5.242666] iwlwifi 0000:00:06.0: 0xC0886258 | stack pointer
[    5.242676] iwlwifi 0000:00:06.0: 0x001C0F07 | last host cmd
[    5.242685] iwlwifi 0000:00:06.0: 0x00000409 | isr status reg
[    5.242887] iwlwifi 0000:00:06.0: IML/ROM dump:
[    5.242896] iwlwifi 0000:00:06.0: 0x00000B03 | IML/ROM error/state
[    5.243099] iwlwifi 0000:00:06.0: 0x0000853F | IML/ROM data1
[    5.243301] iwlwifi 0000:00:06.0: 0x00000080 | IML/ROM WFPM_AUTH_KEY_0
[    5.243500] iwlwifi 0000:00:06.0: Fseq Registers:
[    5.243656] iwlwifi 0000:00:06.0: 0x60000100 | FSEQ_ERROR_CODE
[    5.243806] iwlwifi 0000:00:06.0: 0x00440007 | FSEQ_TOP_INIT_VERSION
[    5.243956] iwlwifi 0000:00:06.0: 0x00080009 | FSEQ_CNVIO_INIT_VERSION
[    5.244106] iwlwifi 0000:00:06.0: 0x0000A652 | FSEQ_OTP_VERSION
[    5.244248] iwlwifi 0000:00:06.0: 0x00000002 | FSEQ_TOP_CONTENT_VERSION
[    5.244397] iwlwifi 0000:00:06.0: 0x4552414E | FSEQ_ALIVE_TOKEN
[    5.244552] iwlwifi 0000:00:06.0: 0x00400410 | FSEQ_CNVI_ID
[    5.244700] iwlwifi 0000:00:06.0: 0x00400410 | FSEQ_CNVR_ID
[    5.244848] iwlwifi 0000:00:06.0: 0x00400410 | CNVI_AUX_MISC_CHIP
[    5.245000] iwlwifi 0000:00:06.0: 0x00400410 | CNVR_AUX_MISC_CHIP
[    5.245151] iwlwifi 0000:00:06.0: 0x00009061 | CNVR_SCU_SD_REGS_SD_REG_D=
IG_DCDC_VTRIM
[    5.245304] iwlwifi 0000:00:06.0: 0x00000061 | CNVR_SCU_SD_REGS_SD_REG_A=
CTIVE_VDIG_MIRROR
[    5.245453] iwlwifi 0000:00:06.0: WRT: Collecting data: ini trigger 4 fi=
red (delay=3D0ms).
[    6.215274] kauditd_printk_skb: 97 callbacks suppressed
[    6.215276] audit: type=3D1130 audit(1685518491.077:77): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dqubes-network comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.226596] iwlwifi 0000:00:06.0: WRT: Invalid buffer destination
[    6.241701] audit: type=3D1130 audit(1685518491.104:78): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-user-sessions comm=3D"systemd" exe=3D"/usr/lib/systemd/s=
ystemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.245580] audit: type=3D1130 audit(1685518491.108:79): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dgetty@tty1 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hos=
tname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.249889] audit: type=3D1130 audit(1685518491.111:80): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dserial-getty@hvc0 comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.259120] audit: type=3D1130 audit(1685518491.122:81): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dqubes-qrexec-agent comm=3D"systemd" exe=3D"/usr/lib/systemd/syst=
emd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.270305] audit: type=3D1130 audit(1685518491.132:82): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dqubes-gui-agent comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.318867] audit: type=3D1325 audit(1685518491.181:83): table=3Dfilter:=
17 family=3D2 entries=3D1 op=3Dnft_register_rule pid=3D609 subj=3Dsystem_u:=
system_r:iptables_t:s0 comm=3D"iptables"
[    6.318896] audit: type=3D1300 audit(1685518491.181:83): arch=3Dc000003e=
 syscall=3D46 success=3Dyes exit=3D548 a0=3D3 a1=3D7ffd2a598be0 a2=3D0 a3=
=3D7ffd2a598bcc items=3D0 ppid=3D608 pid=3D609 auid=3D4294967295 uid=3D0 gi=
d=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) =
ses=3D4294967295 comm=3D"iptables" exe=3D"/usr/sbin/xtables-nft-multi" subj=
=3Dsystem_u:system_r:iptables_t:s0 key=3D(null)
[    6.318941] audit: type=3D1327 audit(1685518491.181:83): proctitle=3D697=
07461626C6573002D4900494E505554002D7000746370002D73003139322E33302E3235322E=
302F3232002D2D64706F7274003830002D6A00414343455054
[    6.320441] audit: type=3D1325 audit(1685518491.182:84): table=3Dfilter:=
18 family=3D2 entries=3D1 op=3Dnft_register_rule pid=3D610 subj=3Dsystem_u:=
system_r:iptables_t:s0 comm=3D"iptables"
[    6.389513] iwlwifi 0000:00:06.0: WFPM_UMAC_PD_NOTIFICATION: 0x1f
[    6.389571] iwlwifi 0000:00:06.0: WFPM_LMAC2_PD_NOTIFICATION: 0x1f
[    6.389611] iwlwifi 0000:00:06.0: WFPM_AUTH_KEY_0: 0x80
[    6.389666] iwlwifi 0000:00:06.0: CNVI_SCU_SEQ_DATA_DW9: 0x0
[    6.392923] systemd-gpt-auto-generator[627]: Failed to dissect: Permissi=
on denied
[    6.536558] vif vif-4-0 vif4.0: Guest Rx ready
[    6.550036] vif vif-52-0 vif52.0: Guest Rx ready
[    6.588456] vif vif-31-0 vif31.0: Guest Rx ready
[    7.249610] IPv6: ADDRCONF(NETDEV_CHANGE): vif4.0: link becomes ready
[    7.249673] IPv6: ADDRCONF(NETDEV_CHANGE): vif52.0: link becomes ready
[    7.249695] IPv6: ADDRCONF(NETDEV_CHANGE): vif31.0: link becomes ready
[    9.980278] wls6: authenticate with 0a:b0:4c:5d:7a:c2
[    9.980300] wls6: 80 MHz not supported, disabling VHT
[    9.993987] wls6: send auth to 0a:b0:4c:5d:7a:c2 (try 1/3)
[   10.108954] wls6: authenticated
[   10.109676] wls6: associate with 0a:b0:4c:5d:7a:c2 (try 1/3)
[   10.117897] wls6: RX AssocResp from 0a:b0:4c:5d:7a:c2 (capab=3D0x1431 st=
atus=3D0 aid=3D3)
[   10.141777] wls6: associated
[   10.208383] IPv6: ADDRCONF(NETDEV_CHANGE): wls6: link becomes ready
[   11.249613] kauditd_printk_skb: 112 callbacks suppressed
[   11.249617] audit: type=3D1334 audit(1685518496.111:148): prog-id=3D36 o=
p=3DUNLOAD
[   11.249680] audit: type=3D1334 audit(1685518496.111:149): prog-id=3D35 o=
p=3DUNLOAD
[   11.249715] audit: type=3D1334 audit(1685518496.111:150): prog-id=3D34 o=
p=3DUNLOAD
[   11.249748] audit: type=3D1334 audit(1685518496.111:151): prog-id=3D32 o=
p=3DUNLOAD
[   11.249781] audit: type=3D1334 audit(1685518496.111:152): prog-id=3D31 o=
p=3DUNLOAD
[   11.249814] audit: type=3D1334 audit(1685518496.111:153): prog-id=3D30 o=
p=3DUNLOAD
[   11.249849] audit: type=3D1334 audit(1685518496.111:154): prog-id=3D29 o=
p=3DUNLOAD
[   11.249883] audit: type=3D1334 audit(1685518496.111:155): prog-id=3D28 o=
p=3DUNLOAD
[   11.249916] audit: type=3D1334 audit(1685518496.111:156): prog-id=3D27 o=
p=3DUNLOAD
[   11.249949] audit: type=3D1334 audit(1685518496.111:157): prog-id=3D26 o=
p=3DUNLOAD
[   16.480856] kauditd_printk_skb: 26 callbacks suppressed
[   16.480859] audit: type=3D1101 audit(1685518501.343:180): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser =
acct=3D"user" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/p=
ts/0 res=3Dsuccess'
[   16.481321] audit: type=3D1123 audit(1685518501.343:181): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'cwd=3D"/home/user" cmd=3D646E66202D4320696E7374616C6C2=
02E2F5175626573496E636F6D696E672F68766D746573742F69706572662D322E312E392D31=
2E666333372E7838365F36342E72706D exe=3D"/usr/bin/sudo" terminal=3Dpts/0 res=
=3Dsuccess'
[   16.482265] audit: type=3D1110 audit(1685518501.344:182): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/0 res=3Dsuccess'
[   16.484389] audit: type=3D1105 audit(1685518501.346:183): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_open grantors=3Dpam_keyinit,pam_limit=
s,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bin=
/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuccess'
[   16.484897] audit: type=3D2300 audit(1685518501.347:184): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'newrole: old-context=3Dunconfined_u:unconfined_r:uncon=
fined_t:s0-s0:c0.c1023 new-context=3Dunconfined_u:unconfined_r:unconfined_t=
:s0-s0:c0.c1023 exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/0 res=3Dsuccess'
[   19.842504] audit: type=3D1130 audit(1685518504.704:185): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Drun-ra1e2a338fc754e09ae3cd0bb1cdf7ab6 comm=3D"systemd" exe=3D"/u=
sr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   20.225507] audit: type=3D1130 audit(1685518505.087:186): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dman-db-cache-update comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   20.225747] audit: type=3D1131 audit(1685518505.088:187): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dman-db-cache-update comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   20.242337] audit: type=3D1131 audit(1685518505.105:188): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Drun-ra1e2a338fc754e09ae3cd0bb1cdf7ab6 comm=3D"systemd" exe=3D"/u=
sr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.346783] audit: type=3D1130 audit(1685518507.209:189): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dunbound-anchor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.346821] audit: type=3D1131 audit(1685518507.209:190): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dunbound-anchor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.608401] audit: type=3D1131 audit(1685518507.470:191): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3DNetworkManager-dispatcher comm=3D"systemd" exe=3D"/usr/lib/syste=
md/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.686381] audit: type=3D1106 audit(1685518507.549:192): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_close grantors=3Dpam_keyinit,pam_limi=
ts,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bi=
n/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuccess'
[   22.687026] audit: type=3D1104 audit(1685518507.549:193): pid=3D1271 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/0 res=3Dsuccess'
[   40.386923] audit: type=3D1131 audit(1685518524.537:194): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-hostnamed comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   40.442095] audit: type=3D1334 audit(1685518524.593:195): prog-id=3D39 o=
p=3DUNLOAD
[   40.442113] audit: type=3D1334 audit(1685518524.593:196): prog-id=3D38 o=
p=3DUNLOAD
[   40.442126] audit: type=3D1334 audit(1685518524.593:197): prog-id=3D37 o=
p=3DUNLOAD
[   78.053908] audit: type=3D1101 audit(1685518562.201:198): pid=3D1383 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser =
acct=3D"user" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/p=
ts/0 res=3Dsuccess'
[   78.054205] audit: type=3D1123 audit(1685518562.201:199): pid=3D1383 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'cwd=3D"/home/user" cmd=3D"dmesg" exe=3D"/usr/bin/sudo"=
 terminal=3Dpts/0 res=3Dsuccess'
[   78.054722] audit: type=3D1110 audit(1685518562.201:200): pid=3D1383 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/0 res=3Dsuccess'
[   78.057405] audit: type=3D1105 audit(1685518562.205:201): pid=3D1383 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_open grantors=3Dpam_keyinit,pam_limit=
s,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bin=
/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuccess'
[   78.057701] audit: type=3D2300 audit(1685518562.205:202): pid=3D1383 uid=
=3D1000 auid=3D1000 ses=3D2 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'newrole: old-context=3Dunconfined_u:unconfined_r:uncon=
fined_t:s0-s0:c0.c1023 new-context=3Dunconfined_u:unconfined_r:unconfined_t=
:s0-s0:c0.c1023 exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/0 res=3Dsuccess'

--T1KEJXkE9CKFKvx+
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="hvm.log"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.3.2-1.qubes.fc37.x86_64 (mockbuild@0c424897d=
4764da983d21c08af6d60ea) (gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4), GNU=
 ld version 2.38-27.fc37) #1 SMP PREEMPT_DYNAMIC Thu May 11 22:08:07 GMT 20=
23
[    0.000000] Command line: root=3D/dev/mapper/dmroot ro nomodeset console=
=3Dhvc0 rd_NO_PLYMOUTH rd.plymouth.enable=3D0 plymouth.enable=3D0 clocksour=
ce=3Dtsc xen_scrub_pages=3D0  selinux=3D1 security=3Dselinux
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.000000] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.000000] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.000000] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.000000] x86/fpu: Enabled xstate features 0x2e7, context size is 2440=
 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 3632
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000efffefff] usable
[    0.000000] BIOS-e820: [mem 0x00000000effff000-0x00000000efffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fc000000-0x00000000fc00afff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000fc00b000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000108ffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Xen HVM domU, BIOS 4.17.0 04/25/2023
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.17.
[    0.000000] platform_pci_unplug: Netfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated NICs.
[    0.000000] platform_pci_unplug: Blkfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated disks.
               You might have to change the root device
               from /dev/hd[a-d] to /dev/xvd[a-d]
               in your root=3D kernel command line option
[    0.000024] HVMOP_pagetable_dying not supported
[    0.018276] tsc: Fast TSC calibration using PIT
[    0.018277] tsc: Detected 2803.524 MHz processor
[    0.018278] tsc: Detected 2803.186 MHz TSC
[    0.018688] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.018690] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.018693] last_pfn =3D 0x109000 max_arch_pfn =3D 0x400000000
[    0.018728] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.018774] last_pfn =3D 0xeffff max_arch_pfn =3D 0x400000000
[    0.025698] found SMP MP-table at [mem 0x000f5a80-0x000f5a8f]
[    0.025721] Using GB pages for direct mapping
[    0.025847] RAMDISK: [mem 0xef8d5000-0xeffeffff]
[    0.025851] ACPI: Early table checksum verification disabled
[    0.025859] ACPI: RSDP 0x00000000000F59D0 000024 (v02 Xen   )
[    0.025862] ACPI: XSDT 0x00000000FC00A650 000054 (v01 Xen    HVM      00=
000000 HVML 00000000)
[    0.025867] ACPI: FACP 0x00000000FC00A370 0000F4 (v04 Xen    HVM      00=
000000 HVML 00000000)
[    0.025871] ACPI: DSDT 0x00000000FC001040 0092A3 (v02 Xen    HVM      00=
000000 INTL 20220331)
[    0.025874] ACPI: FACS 0x00000000FC001000 000040
[    0.025876] ACPI: FACS 0x00000000FC001000 000040
[    0.025877] ACPI: APIC 0x00000000FC00A470 000070 (v02 Xen    HVM      00=
000000 HVML 00000000)
[    0.025880] ACPI: HPET 0x00000000FC00A560 000038 (v01 Xen    HVM      00=
000000 HVML 00000000)
[    0.025882] ACPI: WAET 0x00000000FC00A5A0 000028 (v01 Xen    HVM      00=
000000 HVML 00000000)
[    0.025884] ACPI: SSDT 0x00000000FC00A5D0 000031 (v02 Xen    HVM      00=
000000 INTL 20220331)
[    0.025886] ACPI: SSDT 0x00000000FC00A610 000031 (v02 Xen    HVM      00=
000000 INTL 20220331)
[    0.025888] ACPI: Reserving FACP table memory at [mem 0xfc00a370-0xfc00a=
463]
[    0.025889] ACPI: Reserving DSDT table memory at [mem 0xfc001040-0xfc00a=
2e2]
[    0.025889] ACPI: Reserving FACS table memory at [mem 0xfc001000-0xfc001=
03f]
[    0.025890] ACPI: Reserving FACS table memory at [mem 0xfc001000-0xfc001=
03f]
[    0.025890] ACPI: Reserving APIC table memory at [mem 0xfc00a470-0xfc00a=
4df]
[    0.025891] ACPI: Reserving HPET table memory at [mem 0xfc00a560-0xfc00a=
597]
[    0.025891] ACPI: Reserving WAET table memory at [mem 0xfc00a5a0-0xfc00a=
5c7]
[    0.025892] ACPI: Reserving SSDT table memory at [mem 0xfc00a5d0-0xfc00a=
600]
[    0.025892] ACPI: Reserving SSDT table memory at [mem 0xfc00a610-0xfc00a=
640]
[    0.027144] No NUMA configuration found
[    0.027147] Faking a node at [mem 0x0000000000000000-0x0000000108ffffff]
[    0.027155] NODE_DATA(0) allocated [mem 0x108fd5000-0x108ffffff]
[    0.032431] Zone ranges:
[    0.032466]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.032468]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.032469]   Normal   [mem 0x0000000100000000-0x0000000108ffffff]
[    0.032470]   Device   empty
[    0.032470] Movable zone start for each node
[    0.032473] Early memory node ranges
[    0.032473]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.032509]   node   0: [mem 0x0000000000100000-0x00000000efffefff]
[    0.032510]   node   0: [mem 0x0000000100000000-0x0000000108ffffff]
[    0.032546] Initmem setup node 0 [mem 0x0000000000001000-0x0000000108fff=
fff]
[    0.032650] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.032666] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.036704] On node 0, zone Normal: 1 pages in unavailable ranges
[    0.036896] On node 0, zone Normal: 28672 pages in unavailable ranges
[    0.038237] ACPI: PM-Timer IO Port: 0xb008
[    0.038317] IOAPIC[0]: apic_id 1, version 17, address 0xfec00000, GSI 0-=
47
[    0.038320] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.038322] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)
[    0.038322] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low level)
[    0.038323] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 low level)
[    0.038327] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.038327] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.038330] TSC deadline timer available
[    0.038365] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.038372] [mem 0xf0000000-0xfbffffff] available for PCI devices
[    0.038406] Booting paravirtualized kernel on Xen HVM
[    0.038442] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.043500] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr=
_node_ids:1
[    0.044401] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u1048576
[    0.044406] pcpu-alloc: s221184 r8192 d28672 u1048576 alloc=3D1*2097152
[    0.044408] pcpu-alloc: [0] 0 1=20
[    0.044427] xen: PV spinlocks enabled
[    0.044429] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, =
linear)
[    0.044439] Fallback order for Node 0: 0=20
[    0.044441] Built 1 zonelists, mobility grouping on.  Total pages: 10037=
11
[    0.044444] Policy zone: Normal
[    0.044445] Kernel command line: root=3D/dev/mapper/dmroot ro nomodeset =
console=3Dhvc0 rd_NO_PLYMOUTH rd.plymouth.enable=3D0 plymouth.enable=3D0 cl=
ocksource=3Dtsc xen_scrub_pages=3D0  selinux=3D1 security=3Dselinux
[    0.044469] Booted with the nomodeset parameter. Only the system framebu=
ffer will be available
[    0.044529] Unknown kernel command line parameters "rd_NO_PLYMOUTH", wil=
l be passed to user space.
[    0.044580] random: crng init done
[    0.044844] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes, linear)
[    0.044976] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes, linear)
[    0.045177] mem auto-init: stack:all(zero), heap alloc:on, heap free:on
[    0.045178] mem auto-init: clearing system memory may take some time...
[    0.045185] software IO TLB: area num 2.
[    0.814885] Memory: 3868756K/4079220K available (18432K kernel code, 320=
8K rwdata, 8692K rodata, 4992K init, 18632K bss, 210204K reserved, 0K cma-r=
eserved)
[    0.814975] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.814983] Kernel/User page tables isolation: enabled
[    0.815003] ftrace: allocating 54208 entries in 212 pages
[    0.821692] ftrace: allocated 212 pages with 4 groups
[    0.822378] Dynamic Preempt: voluntary
[    0.822399] rcu: Preemptible hierarchical RCU implementation.
[    0.822403] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D2.
[    0.822404] 	Trampoline variant of Tasks RCU enabled.
[    0.822404] 	Rude variant of Tasks RCU enabled.
[    0.822404] 	Tracing variant of Tasks RCU enabled.
[    0.822405] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.822405] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.824533] NR_IRQS: 524544, nr_irqs: 512, preallocated irqs: 16
[    0.824634] xen:events: Using FIFO-based ABI
[    0.824689] xen:events: Xen HVM callback vector for event delivery is en=
abled
[    0.824891] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.826068] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.889781] Console: colour VGA+ 80x25
[    0.889803] printk: console [hvc0] enabled
[    0.891060] ACPI: Core revision 20221020
[    0.891167] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 30580167144 ns
[    0.891251] APIC: Switch to symmetric I/O mode setup
[    0.891852] x2apic enabled
[    0.892365] Switched APIC routing to physical x2apic.
[    0.894103] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
[    0.898731] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2868027b22e, max_idle_ns: 440795325881 ns
[    0.898755] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5606.37 BogoMIPS (lpj=3D2803186)
[    0.898771] pid_max: default: 32768 minimum: 301
[    0.898815] LSM: initializing lsm=3Dlockdown,capability,yama,integrity,s=
elinux
[    0.898834] Yama: becoming mindful.
[    0.898847] SELinux:  Initializing.
[    0.898902] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes,=
 linear)
[    0.898915] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes, linear)
[    0.899255] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.899413] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.899421] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.899434] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.899449] Spectre V2 : Mitigation: Retpolines
[    0.899457] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.899469] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.899478] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.899489] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.899502] Spectre V2 : User space: Mitigation: STIBP via prctl
[    0.899512] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.899527] MDS: Mitigation: Clear CPU buffers
[    0.912328] Freeing SMP alternatives memory: 48K
[    0.912476] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd=
42e4dffb, max_idle_ns: 881590591483 ns
[    0.912589] Xen: using vcpuop timer interface
[    0.912595] installing Xen timer for CPU 0
[    0.912705] smpboot: CPU0: 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GH=
z (family: 0x6, model: 0x8c, stepping: 0x1)
[    0.912741] cpu 0 spinlock event irq 52
[    0.912751] cblist_init_generic: Setting adjustable number of callback q=
ueues.
[    0.912760] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.912832] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.912865] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.912897] Performance Events: unsupported p6 CPU model 140 no PMU driv=
er, software events only.
[    0.912961] rcu: Hierarchical SRCU implementation.
[    0.912970] rcu: 	Max phase no-delay instances is 400.
[    0.914253] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.914836] smp: Bringing up secondary CPUs ...
[    0.915089] installing Xen timer for CPU 1
[    0.915168] x86: Booting SMP configuration:
[    0.915174] .... node  #0, CPUs:      #1
[    0.066858] APIC: Stale IRR: 00080000,00000000,00000000,00000000,0000000=
0,00000000,00000000,00000000 ISR: 00000000,00000000,00000000,00000000,00000=
000,00000000,00000000,00000000
[    0.916819] cpu 1 spinlock event irq 57
[    0.916863] smp: Brought up 1 node, 2 CPUs
[    0.916872] smpboot: Max logical packages: 1
[    0.916881] smpboot: Total of 2 processors activated (11212.74 BogoMIPS)
[    0.917853] devtmpfs: initialized
[    0.917853] x86/mm: Memory block size: 128MB
[    0.919043] ACPI: PM: Registering ACPI NVS region [mem 0xfc000000-0xfc00=
afff] (45056 bytes)
[    0.919043] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.919043] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.919043] pinctrl core: initialized pinctrl subsystem
[    0.919812] PM: RTC time: 07:39:11, date: 2023-05-31
[    0.921973] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.922091] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocat=
ions
[    0.922108] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic=
 allocations
[    0.922122] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atom=
ic allocations
[    0.922156] audit: initializing netlink subsys (disabled)
[    0.922230] audit: type=3D2000 audit(1685518751.876:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.922230] thermal_sys: Registered thermal governor 'fair_share'
[    0.922230] thermal_sys: Registered thermal governor 'bang_bang'
[    0.922757] thermal_sys: Registered thermal governor 'step_wise'
[    0.922767] thermal_sys: Registered thermal governor 'user_space'
[    0.922784] cpuidle: using governor menu
[    0.924119] PCI: Using configuration type 1 for base access
[    0.924243] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.951785] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.951799] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.951809] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.951819] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.964866] cryptd: max_cpu_qlen set to 1000
[    0.965803] raid6: skipped pq benchmark and selected avx512x4
[    0.965869] raid6: using avx512x2 recovery algorithm
[    0.965914] ACPI: Added _OSI(Module Device)
[    0.965914] ACPI: Added _OSI(Processor Device)
[    0.965914] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.965914] ACPI: Added _OSI(Processor Aggregator Device)
[    0.972784] ACPI: 3 ACPI AML tables successfully acquired and loaded
[    0.973313] xen: --> pirq=3D16 -> irq=3D9 (gsi=3D9)
[    0.975965] ACPI: Interpreter enabled
[    0.975979] ACPI: PM: (supports S0 S3 S5)
[    0.975986] ACPI: Using IOAPIC for interrupt routing
[    0.976281] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.976295] PCI: Ignoring E820 reservations for host bridge windows
[    0.976980] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.985929] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.985945] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MS=
I EDR HPX-Type3]
[    0.985959] acpi PNP0A03:00: _OSC: not requesting OS control; OS require=
s [ExtendedConfig ASPM ClockPM MSI]
[    0.986790] acpi PNP0A03:00: fail to add MMCONFIG information, can't acc=
ess extended configuration space under this bridge
[    0.987113] PCI host bridge to bus 0000:00
[    0.987122] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.987149] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.987160] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.987174] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfbfffff=
f window]
[    0.987187] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.987807] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.991334] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.995845] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.998160] pci 0000:00:01.1: reg 0x20: [io  0xc300-0xc30f]
[    0.999153] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x=
01f7]
[    0.999167] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.999177] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x=
0177]
[    0.999189] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    1.000229] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    1.003823] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PIIX=
4 ACPI
[    1.003892] pci 0000:00:01.3: quirk: [io  0xb100-0xb10f] claimed by PIIX=
4 SMB
[    1.005755] pci 0000:00:02.0: [5853:0001] type 00 class 0xff8000
[    1.006944] pci 0000:00:02.0: reg 0x10: [io  0xc000-0xc0ff]
[    1.007754] pci 0000:00:02.0: reg 0x14: [mem 0xf0000000-0xf0ffffff pref]
[    1.014755] pci 0000:00:04.0: [1234:1111] type 00 class 0x030000
[    1.015955] pci 0000:00:04.0: reg 0x10: [mem 0xf1000000-0xf1ffffff pref]
[    1.017755] pci 0000:00:04.0: reg 0x18: [mem 0xf201a000-0xf201afff]
[    1.021107] pci 0000:00:04.0: reg 0x30: [mem 0xf2000000-0xf200ffff pref]
[    1.021337] pci 0000:00:04.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    1.022799] pci 0000:00:05.0: [8086:24cd] type 00 class 0x0c0320
[    1.023934] pci 0000:00:05.0: reg 0x10: [mem 0xf201b000-0xf201bfff]
[    1.030066] pci 0000:00:06.0: [8086:2668] type 00 class 0x040300
[    1.031333] pci 0000:00:06.0: reg 0x10: [mem 0xf2010000-0xf2013fff]
[    1.038755] pci 0000:00:08.0: [1033:0194] type 00 class 0x0c0330
[    1.040149] pci 0000:00:08.0: reg 0x10: [mem 0xf2014000-0xf2017fff 64bit]
[    1.047939] ACPI: PCI: Interrupt link LNKA configured for IRQ 5
[    1.048220] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    1.048859] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    1.049151] ACPI: PCI: Interrupt link LNKD configured for IRQ 5
[    1.052083] xen:balloon: Initialising balloon driver
[    1.052106] iommu: Default domain type: Translated=20
[    1.052106] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    1.052841] SCSI subsystem initialized
[    1.052895] libata version 3.00 loaded.
[    1.052895] ACPI: bus type USB registered
[    1.052895] usbcore: registered new interface driver usbfs
[    1.052895] usbcore: registered new interface driver hub
[    1.052895] usbcore: registered new device driver usb
[    1.052895] pps_core: LinuxPPS API ver. 1 registered
[    1.052895] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    1.052895] PTP clock support registered
[    1.052895] EDAC MC: Ver: 3.0.0
[    1.054991] NetLabel: Initializing
[    1.055056] NetLabel:  domain hash size =3D 128
[    1.055064] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    1.055089] NetLabel:  unlabeled traffic allowed by default
[    1.055101] mctp: management component transport protocol core
[    1.055111] NET: Registered PF_MCTP protocol family
[    1.055126] PCI: Using ACPI for IRQ routing
[    1.055133] PCI: pci_cache_line_size set to 64 bytes
[    1.057205] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    1.057206] e820: reserve RAM buffer [mem 0xeffff000-0xefffffff]
[    1.057207] e820: reserve RAM buffer [mem 0x109000000-0x10bffffff]
[    1.057220] pci 0000:00:04.0: vgaarb: setting as boot VGA device
[    1.057220] pci 0000:00:04.0: vgaarb: bridge control possible
[    1.057220] pci 0000:00:04.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    1.057755] vgaarb: loaded
[    1.057821] hpet: 3 channels of 0 reserved for per-cpu timers
[    1.057846] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    1.057857] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
[    1.060830] clocksource: Switched to clocksource xen
[    1.080067] VFS: Disk quotas dquot_6.6.0
[    1.080132] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.213195] pnp: PnP ACPI init
[    1.213312] system 00:00: [mem 0x00000000-0x0009ffff] could not be reser=
ved
[    1.213388] system 00:01: [io  0x08a0-0x08a3] has been reserved
[    1.213401] system 00:01: [io  0x0cc0-0x0ccf] has been reserved
[    1.213412] system 00:01: [io  0x04d0-0x04d1] has been reserved
[    1.213441] xen: --> pirq=3D17 -> irq=3D8 (gsi=3D8)
[    1.213461] xen: --> pirq=3D18 -> irq=3D12 (gsi=3D12)
[    1.213480] xen: --> pirq=3D19 -> irq=3D1 (gsi=3D1)
[    1.213498] xen: --> pirq=3D20 -> irq=3D6 (gsi=3D6)
[    1.213500] pnp 00:05: [dma 2]
[    1.213540] system 00:06: [io  0xae00-0xae0f] has been reserved
[    1.213552] system 00:06: [io  0xb044-0xb047] has been reserved
[    1.214591] pnp: PnP ACPI: found 7 devices
[    1.222007] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    1.222061] NET: Registered PF_INET protocol family
[    1.222090] IP idents hash table entries: 65536 (order: 7, 524288 bytes,=
 linear)
[    1.222799] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3,=
 32768 bytes, linear)
[    1.222819] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    1.222835] TCP established hash table entries: 32768 (order: 6, 262144 =
bytes, linear)
[    1.222873] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes,=
 linear)
[    1.223570] TCP: Hash tables configured (established 32768 bind 32768)
[    1.223642] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes,=
 linear)
[    1.224120] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    1.224247] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, li=
near)
[    1.224417] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.224498] NET: Registered PF_XDP protocol family
[    1.224514] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.224526] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.224537] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    1.224620] pci_bus 0000:00: resource 7 [mem 0xf0000000-0xfbffffff windo=
w]
[    1.224719] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    1.224779] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    1.225376] xen: --> pirq=3D21 -> irq=3D39 (gsi=3D39)
[    1.226379] xen: --> pirq=3D22 -> irq=3D17 (gsi=3D17)
[    1.226991] PCI: CLS 0 bytes, default 64
[    1.227004] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.227015] software IO TLB: mapped [mem 0x00000000eb8d5000-0x00000000ef=
8d5000] (64MB)
[    1.227077] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x286=
8027b22e, max_idle_ns: 440795325881 ns
[    1.227147] clocksource: Switched to clocksource tsc
[    1.227315] Trying to unpack rootfs image as initramfs...
[    1.310942] Freeing initrd memory: 7276K
[    1.311625] Initialise system trusted keyrings
[    1.311714] Key type blacklist registered
[    1.311791] workingset: timestamp_bits=3D36 max_order=3D20 bucket_order=
=3D0
[    1.311818] zbud: loaded
[    1.312205] integrity: Platform Keyring initialized
[    1.312283] integrity: Machine keyring initialized
[    1.319152] NET: Registered PF_ALG protocol family
[    1.319164] xor: automatically using best checksumming function   avx   =
   =20
[    1.319177] Key type asymmetric registered
[    1.319184] Asymmetric key parser 'x509' registered
[    1.322754] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    1.322971] io scheduler mq-deadline registered
[    1.322983] io scheduler kyber registered
[    1.322996] io scheduler bfq registered
[    1.325026] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    1.325502] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[    1.325612] ACPI: button: Power Button [PWRF]
[    1.325658] input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/inpu=
t/input1
[    1.325736] ACPI: button: Sleep Button [SLPF]
[    1.424702] xen: --> pirq=3D23 -> irq=3D24 (gsi=3D24)
[    1.424844] xen:grant_table: Grant tables using version 1 layout
[    1.424879] Grant table initialized
[    1.429485] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.430565] Non-volatile memory driver v1.3
[    1.430579] Linux agpgart interface v0.103
[    1.430764] ACPI: bus type drm_connector registered
[    1.438665] ata_piix 0000:00:01.1: version 2.13
[    1.438759] ata_piix 0000:00:01.1: enabling device (0000 -> 0001)
[    1.439967] scsi host0: ata_piix
[    1.440133] scsi host1: ata_piix
[    1.440157] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc300 irq 14
[    1.440171] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc308 irq 15
[    1.444472] usbcore: registered new interface driver usbserial_generic
[    1.444606] usbserial: USB Serial support registered for generic
[    1.444702] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[    1.447355] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.447379] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.447442] mousedev: PS/2 mouse device common for all mice
[    1.448594] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input2
[    1.456287] rtc_cmos 00:02: registered as rtc0
[    1.456326] rtc_cmos 00:02: setting system clock to 2023-05-31T07:39:12 =
UTC (1685518752)
[    1.456366] rtc_cmos 00:02: alarms up to one day, 114 bytes nvram
[    1.456389] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. =
Duplicate IMA measurements will not be recorded in the IMA log.
[    1.456411] device-mapper: uevent: version 1.0.3
[    1.456443] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised:=
 dm-devel@redhat.com
[    1.456498] intel_pstate: CPU model not supported
[    1.456559] hid: raw HID events driver (C) Jiri Kosina
[    1.456580] usbcore: registered new interface driver usbhid
[    1.456592] usbhid: USB HID core driver
[    1.456677] drop_monitor: Initializing network drop monitor service
[    1.456740] Initializing XFRM netlink socket
[    1.456760] NET: Registered PF_INET6 protocol family
[    1.467899] Segment Routing with IPv6
[    1.467979] RPL Segment Routing with IPv6
[    1.467999] In-situ OAM (IOAM) with IPv6
[    1.468053] mip6: Mobile IPv6
[    1.468104] NET: Registered PF_PACKET protocol family
[    1.542125] IPI shorthand broadcast: enabled
[    1.542238] AVX2 version of gcm_enc/dec engaged.
[    1.542401] AES CTR mode by8 optimization enabled
[    1.543831] sched_clock: Marking stable (1477485310, 65858244)->(1758243=
692, -214900138)
[    1.543987] registered taskstats version 1
[    1.685444] Loading compiled-in X.509 certificates
[    1.692037] Loaded X.509 cert 'Build time autogenerated kernel key: 71b1=
2e3caf24d55eb39a8d585ceb01a5ebb6ae3a'
[    1.692822] zswap: loaded using pool lzo/zbud
[    1.695143] page_owner is disabled
[    1.695380] Key type .fscrypt registered
[    1.695389] Key type fscrypt-provisioning registered
[    1.697151] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dyes, fsverity=
=3Dyes
[    1.697273] Key type big_key registered
[    1.699197] Key type encrypted registered
[    1.700129] ima: No TPM chip found, activating TPM-bypass!
[    1.700209] Loading compiled-in module X.509 certificates
[    1.700607] Loaded X.509 cert 'Build time autogenerated kernel key: 71b1=
2e3caf24d55eb39a8d585ceb01a5ebb6ae3a'
[    1.700782] ima: Allocated hash algorithm: sha256
[    1.700808] ima: No architecture policies found
[    1.700840] evm: Initialising EVM extended attributes:
[    1.700914] evm: security.selinux
[    1.700923] evm: security.SMACK64 (disabled)
[    1.700934] evm: security.SMACK64EXEC (disabled)
[    1.700944] evm: security.SMACK64TRANSMUTE (disabled)
[    1.700956] evm: security.SMACK64MMAP (disabled)
[    1.700966] evm: security.apparmor
[    1.700974] evm: security.ima
[    1.700982] evm: security.capability
[    1.700989] evm: HMAC attrs: 0x1
[    1.723581] alg: No test for 842 (842-scomp)
[    1.723617] alg: No test for 842 (842-generic)
[    1.805993] xenbus_probe_frontend: Device with no driver: device/vbd/517=
12
[    1.806009] xenbus_probe_frontend: Device with no driver: device/vbd/517=
28
[    1.806024] xenbus_probe_frontend: Device with no driver: device/vbd/517=
44
[    1.806067] xenbus_probe_frontend: Device with no driver: device/vbd/517=
60
[    1.806082] xenbus_probe_frontend: Device with no driver: device/vif/0
[    1.806110] PM:   Magic number: 7:198:674
[    1.806215] RAS: Correctable Errors collector initialized.
[    1.806240] xen:balloon: Waiting for initial ballooning down having fini=
shed.
[    2.323465] xen:balloon: Initial ballooning down finished.
[    2.332180] Freeing unused decrypted memory: 2036K
[    2.332959] Freeing unused kernel image (initmem) memory: 4992K
[    2.333038] Write protecting the kernel read-only data: 28672k
[    2.333308] Freeing unused kernel image (rodata/data gap) memory: 1548K
[    2.333371] rodata_test: all tests were successful
[    2.333386] Run /init as init process
[    2.333393]   with arguments:
[    2.333394]     /init
[    2.333394]     rd_NO_PLYMOUTH
[    2.333395]   with environment:
[    2.333395]     HOME=3D/
[    2.333396]     TERM=3Dlinux
[    2.340292] Invalid max_queues (4), will use default max: 2.
[    2.340675] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input4
[    2.349573] blkfront: xvda: flush diskcache: enabled; persistent grants:=
 enabled; indirect descriptors: enabled; bounce buffer: enabled
[    2.352338]  xvda: xvda1 xvda2 xvda3
[    2.354693] blkfront: xvdb: flush diskcache: enabled; persistent grants:=
 enabled; indirect descriptors: enabled; bounce buffer: enabled
[    2.356756] blkfront: xvdc: flush diskcache: enabled; persistent grants:=
 enabled; indirect descriptors: enabled; bounce buffer: enabled
[    2.358326] blkfront: xvdd: barrier or flush: disabled; persistent grant=
s: enabled; indirect descriptors: enabled; bounce buffer: enabled
[    2.739164]  xvdc: xvdc1 xvdc3
[    2.756099] EXT4-fs (xvda3): mounted filesystem f76da228-62b7-4543-835d-=
9ab0d57bbc45 with ordered data mode. Quota mode: none.
[    2.760621] /dev/xvdd: Can't open blockdev
[    2.761510] EXT4-fs (xvdd): mounting ext3 file system using the ext4 sub=
system
[    2.764870] EXT4-fs (xvdd): mounted filesystem 63438b4b-f5d8-462a-82fe-9=
d52951a6722 with ordered data mode. Quota mode: none.
[    2.867437] audit: type=3D1404 audit(1685518753.910:2): enforcing=3D1 ol=
d_enforcing=3D0 auid=3D4294967295 ses=3D4294967295 enabled=3D1 old-enabled=
=3D1 lsm=3Dselinux res=3D1
[    2.895748] SELinux:  Class user_namespace not defined in policy.
[    2.895766] SELinux: the above unknown classes and permissions will be a=
llowed
[    2.897736] SELinux:  policy capability network_peer_controls=3D1
[    2.897751] SELinux:  policy capability open_perms=3D1
[    2.897759] SELinux:  policy capability extended_socket_class=3D1
[    2.897769] SELinux:  policy capability always_check_network=3D0
[    2.897779] SELinux:  policy capability cgroup_seclabel=3D1
[    2.897788] SELinux:  policy capability nnp_nosuid_transition=3D1
[    2.897798] SELinux:  policy capability genfs_seclabel_symlinks=3D1
[    2.897808] SELinux:  policy capability ioctl_skip_cloexec=3D0
[    2.926873] audit: type=3D1403 audit(1685518753.970:3): auid=3D429496729=
5 ses=3D4294967295 lsm=3Dselinux res=3D1
[    2.928375] systemd[1]: Successfully loaded SELinux policy in 61.539ms.
[    2.941021] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 5.013ms.
[    2.946938] systemd[1]: systemd 251.14-2.fc37 running in system mode (+P=
AM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL =
+ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +L=
IBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZS=
TD +BPF_FRAMEWORK +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
[    2.946991] systemd[1]: Detected virtualization xen.
[    2.947003] systemd[1]: Detected architecture x86-64.
[    2.948412] systemd[1]: No hostname configured, using default hostname.
[    2.948466] systemd[1]: Hostname set to <fedora>.
[    3.008356] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the kernel,=
 BPF LSM not supported
[    3.008900] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D1=
 'systemd'
[    3.152910] block xvda: the capability attribute has been deprecated.
[    3.153079] systemd-gpt-auto-generator[226]: Failed to dissect: Permissi=
on denied
[    3.153403] (sd-execut[218]: /usr/lib/systemd/system-generators/systemd-=
gpt-auto-generator failed with exit status 1.
[    3.210596] systemd[1]: /usr/lib/systemd/system/qubes-u2fproxy@.service:=
8: Standard output type syslog is obsolete, automatically updating to journ=
al. Please update your unit file, and consider removing the setting altoget=
her.
[    3.216491] systemd[1]: /usr/lib/systemd/system/qubes-gui-agent.service:=
15: Standard output type syslog is obsolete, automatically updating to jour=
nal. Please update your unit file, and consider removing the setting altoge=
ther.
[    3.257751] systemd[1]: Queued start job for default target multi-user.t=
arget.
[    3.265441] systemd[1]: Created slice system-getty.slice - Slice /system=
/getty.
[    3.266226] systemd[1]: Created slice system-modprobe.slice - Slice /sys=
tem/modprobe.
[    3.266712] systemd[1]: Created slice system-qubes\x2du2fproxy.slice - S=
lice /system/qubes-u2fproxy.
[    3.267158] systemd[1]: Created slice system-serial\x2dgetty.slice - Sli=
ce /system/serial-getty.
[    3.267563] systemd[1]: Created slice user.slice - User and Session Slic=
e.
[    3.267770] systemd[1]: Started systemd-ask-password-console.path - Disp=
atch Password Requests to Console Directory Watch.
[    3.267951] systemd[1]: Started systemd-ask-password-wall.path - Forward=
 Password Requests to Wall Directory Watch.
[    3.268413] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automou=
nt - Arbitrary Executable File Formats File System Automount Point.
[    3.268543] systemd[1]: Reached target cryptsetup.target - Local Encrypt=
ed Volumes.
[    3.268619] systemd[1]: Reached target integritysetup.target - Local Int=
egrity Protected Volumes.
[    3.268709] systemd[1]: Reached target remote-fs.target - Remote File Sy=
stems.
[    3.268776] systemd[1]: Reached target slices.target - Slice Units.
[    3.268854] systemd[1]: Reached target veritysetup.target - Local Verity=
 Protected Volumes.
[    3.271426] systemd[1]: Listening on systemd-coredump.socket - Process C=
ore Dump Socket.
[    3.271662] systemd[1]: Listening on systemd-initctl.socket - initctl Co=
mpatibility Named Pipe.
[    3.272120] systemd[1]: Listening on systemd-journald-audit.socket - Jou=
rnal Audit Socket.
[    3.272695] systemd[1]: Listening on systemd-journald-dev-log.socket - J=
ournal Socket (/dev/log).
[    3.273188] systemd[1]: Listening on systemd-journald.socket - Journal S=
ocket.
[    3.354088] systemd[1]: Listening on systemd-oomd.socket - Userspace Out=
-Of-Memory (OOM) Killer Socket.
[    3.355404] systemd[1]: Listening on systemd-udevd-control.socket - udev=
 Control Socket.
[    3.355660] systemd[1]: Listening on systemd-udevd-kernel.socket - udev =
Kernel Socket.
[    3.355913] systemd[1]: Listening on systemd-userdbd.socket - User Datab=
ase Manager Socket.
[    3.356834] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File S=
ystem...
[    3.357725] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue =
File System...
[    3.358558] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug F=
ile System...
[    3.359475] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace=
 File System...
[    3.360335] systemd[1]: Starting dev-xvdc1-swap.service - Enable swap on=
 /dev/xvdc1 early...
[    3.363070] systemd[1]: Starting kmod-static-nodes.service - Create List=
 of Static Device Nodes...
[    3.364011] systemd[1]: Starting modprobe@configfs.service - Load Kernel=
 Module configfs...
[    3.364036] Adding 1048572k swap on /dev/xvdc1.  Priority:-2 extents:1 a=
cross:1048572k SSFS
[    3.364928] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel M=
odule dm_mod...
[    3.365713] systemd[1]: Starting modprobe@drm.service - Load Kernel Modu=
le drm...
[    3.366569] systemd[1]: Starting modprobe@fuse.service - Load Kernel Mod=
ule fuse...
[    3.367398] systemd[1]: Starting modprobe@loop.service - Load Kernel Mod=
ule loop...
[    3.368323] systemd[1]: Starting qubes-remount-lib-modules.service - Rem=
ount /lib/modules for SELinux...
[    3.369283] systemd[1]: Starting systemd-network-generator.service - Gen=
erate network units from Kernel command line...
[    3.370160] systemd[1]: Starting systemd-udev-trigger.service - Coldplug=
 All udev Devices...
[    3.371170] systemd[1]: Condition check resulted in dev-xvdc1.swap - /de=
v/xvdc1 being skipped.
[    3.371208] systemd[1]: Unnecessary job was removed for dev-xvdc1.device=
 - /dev/xvdc1.
[    3.371580] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File Sy=
stem.
[    3.371693] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue F=
ile System.
[    3.555164] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug Fi=
le System.
[    3.555273] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace =
File System.
[    3.555590] systemd[1]: Finished kmod-static-nodes.service - Create List=
 of Static Device Nodes.
[    3.556003] systemd[1]: dev-xvdc1-swap.service: Deactivated successfully.
[    3.556106] systemd[1]: Finished dev-xvdc1-swap.service - Enable swap on=
 /dev/xvdc1 early.
[    3.556256] systemd[1]: Reached target swap.target - Swaps.
[    3.564167] systemd[1]: Mounting tmp.mount - Temporary Directory /tmp...
[    3.564261] systemd[1]: systemd-fsck-root.service - File System Check on=
 Root Device was skipped because of a failed condition check (ConditionPath=
IsReadWrite=3D!/).
[    3.564988] systemd[1]: Starting systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems...
[    3.568660] systemd[1]: Finished systemd-network-generator.service - Gen=
erate network units from Kernel command line.
[    3.568812] systemd[1]: Mounted tmp.mount - Temporary Directory /tmp.
[    3.571804] systemd[1]: usr-lib-modules.mount: Deactivated successfully.
[    3.574969] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    3.575082] systemd[1]: Finished modprobe@configfs.service - Load Kernel=
 Module configfs.
[    3.575591] systemd[1]: modprobe@dm_mod.service: Deactivated successfull=
y.
[    3.575692] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel M=
odule dm_mod.
[    3.575886] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    3.575975] systemd[1]: Finished modprobe@drm.service - Load Kernel Modu=
le drm.
[    3.576151] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    3.576244] systemd[1]: Finished modprobe@fuse.service - Load Kernel Mod=
ule fuse.
[    3.576650] systemd[1]: sys-fs-fuse-connections.mount - FUSE Control Fil=
e System was skipped because of a failed condition check (ConditionPathExis=
ts=3D/sys/fs/fuse/connections).
[    3.614422] EXT4-fs (xvda3): re-mounted f76da228-62b7-4543-835d-9ab0d57b=
bc45. Quota mode: none.
[    3.626171] systemd[1]: Mounting sys-kernel-config.mount - Kernel Config=
uration File System...
[    3.626975] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    3.627088] systemd[1]: Finished modprobe@loop.service - Load Kernel Mod=
ule loop.
[    3.627558] systemd[1]: Finished systemd-udev-trigger.service - Coldplug=
 All udev Devices.
[    3.627768] systemd[1]: Finished systemd-remount-fs.service - Remount Ro=
ot and Kernel File Systems.
[    3.754198] systemd[1]: Mounted sys-kernel-config.mount - Kernel Configu=
ration File System.
[    3.754405] systemd[1]: ostree-remount.service - OSTree Remount OS/ Bind=
 Mounts was skipped because of a failed condition check (ConditionKernelCom=
mandLine=3Dostree).
[    3.754457] systemd[1]: systemd-firstboot.service - First Boot Wizard wa=
s skipped because of a failed condition check (ConditionFirstBoot=3Dyes).
[    3.756427] EXT4-fs (xvdd): unmounting filesystem 63438b4b-f5d8-462a-82f=
e-9d52951a6722.
[    3.765956] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware D=
atabase was skipped because of a failed condition check (ConditionNeedsUpda=
te=3D/etc).
[    3.766037] systemd[1]: systemd-repart.service - Repartition Root Disk w=
as skipped because all trigger condition checks failed.
[    3.766078] systemd[1]: systemd-sysusers.service - Create System Users w=
as skipped because of a failed condition check (ConditionNeedsUpdate=3D/etc=
).
[    3.769559] EXT4-fs (xvdd): mounting ext3 file system using the ext4 sub=
system
[    3.771401] EXT4-fs (xvdd): mounted filesystem 63438b4b-f5d8-462a-82fe-9=
d52951a6722 with ordered data mode. Quota mode: none.
[    3.771773] systemd[1]: Starting systemd-tmpfiles-setup-dev.service - Cr=
eate Static Device Nodes in /dev...
[    3.775186] systemd[1]: Finished qubes-remount-lib-modules.service - Rem=
ount /lib/modules for SELinux.
[    3.777475] systemd[1]: Starting systemd-modules-load.service - Load Ker=
nel Modules...
[    3.789728] audit: type=3D1400 audit(1685518754.833:4): avc:  denied  { =
module_request } for  pid=3D268 comm=3D"systemd-modules" kmod=3D"crypto-pkc=
s1pad(rsa,sha256)" scontext=3Dsystem_u:system_r:systemd_modules_load_t:s0 t=
context=3Dsystem_u:system_r:kernel_t:s0 tclass=3Dsystem permissive=3D0
[    3.789775] audit: type=3D1400 audit(1685518754.833:5): avc:  denied  { =
module_request } for  pid=3D268 comm=3D"systemd-modules" kmod=3D"crypto-pkc=
s1pad(rsa,sha256)-all" scontext=3Dsystem_u:system_r:systemd_modules_load_t:=
s0 tcontext=3Dsystem_u:system_r:kernel_t:s0 tclass=3Dsystem permissive=3D0
[    3.796562] systemd[1]: Finished systemd-tmpfiles-setup-dev.service - Cr=
eate Static Device Nodes in /dev.
[    3.796841] systemd[1]: Reached target local-fs-pre.target - Preparation=
 for Local File Systems.
[    3.798739] xen:xen_evtchn: Event-channel device installed
[    3.802563] systemd[1]: Started haveged.service - Entropy Daemon based o=
n the HAVEGE algorithm.
[    3.803851] systemd[1]: Starting systemd-journald.service - Journal Serv=
ice...
[    3.804839] systemd[1]: Starting systemd-udevd.service - Rule-based Mana=
ger for Device Events and Files...
[    3.856516] systemd[1]: Started systemd-journald.service - Journal Servi=
ce.
[    3.868507] systemd-journald[272]: Received client request to flush runt=
ime journal.
[    3.871492] audit: type=3D1130 audit(1685518754.900:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/system=
d" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    3.886355] audit: type=3D1130 audit(1685518754.929:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-udevd comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    3.975968] audit: type=3D1130 audit(1685518755.019:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journal-flush comm=3D"systemd" exe=3D"/usr/lib/systemd/s=
ystemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    4.000021] Rounding down aligned max_sectors from 4294967295 to 4294967=
288
[    4.000112] db_root: cannot open: /etc/target
[    4.027237] audit: type=3D1130 audit(1685518755.070:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-modules-load comm=3D"systemd" exe=3D"/usr/lib/systemd/sy=
stemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    4.043206] audit: type=3D1130 audit(1685518755.086:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-sysctl comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    4.044606] memmap_init_zone_device initialised 32768 pages in 0ms
[    4.058258] piix4_smbus 0000:00:01.3: SMBus Host Controller not enabled!
[    4.130834] FDC 0 is a S82078B
[    4.156363] input: PC Speaker as /devices/platform/pcspkr/input/input5
[    4.170433] ehci-pci 0000:00:05.0: EHCI Host Controller
[    4.170543] ehci-pci 0000:00:05.0: new USB bus registered, assigned bus =
number 1
[    4.171513] ehci-pci 0000:00:05.0: irq 39, io mem 0xf201b000
[    4.178752] EXT4-fs (xvdb): mounted filesystem 44c92d29-b8e7-4836-a951-f=
71caa9c065d with ordered data mode. Quota mode: none.
[    4.179586] ehci-pci 0000:00:05.0: USB 2.0 started, EHCI 1.00
[    4.179701] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.03
[    4.179716] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.179729] usb usb1: Product: EHCI Host Controller
[    4.179737] usb usb1: Manufacturer: Linux 6.3.2-1.qubes.fc37.x86_64 ehci=
_hcd
[    4.179750] usb usb1: SerialNumber: 0000:00:05.0
[    4.180934] hub 1-0:1.0: USB hub found
[    4.180948] hub 1-0:1.0: 6 ports detected
[    4.218910] xen_netfront: Initialising Xen virtual ethernet driver
[    4.221051] xen_netfront: backend supports XDP headroom
[    4.221067] vif vif-0: bouncing transmitted data to zeroed pages
[    4.234422] xhci_hcd 0000:00:08.0: xHCI Host Controller
[    4.237466] xhci_hcd 0000:00:08.0: new USB bus registered, assigned bus =
number 2
[    4.239507] xhci_hcd 0000:00:08.0: hcc params 0x00080001 hci version 0x1=
00 quirks 0x0000000000000014
[    4.243069] xhci_hcd 0000:00:08.0: xHCI Host Controller
[    4.243119] xhci_hcd 0000:00:08.0: new USB bus registered, assigned bus =
number 3
[    4.243133] xhci_hcd 0000:00:08.0: Host supports USB 3.0 SuperSpeed
[    4.243899] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.03
[    4.243915] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.243928] usb usb2: Product: xHCI Host Controller
[    4.243936] usb usb2: Manufacturer: Linux 6.3.2-1.qubes.fc37.x86_64 xhci=
-hcd
[    4.243948] usb usb2: SerialNumber: 0000:00:08.0
[    4.244029] hub 2-0:1.0: USB hub found
[    4.244870] hub 2-0:1.0: 4 ports detected
[    4.245594] usb usb3: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    4.245623] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.03
[    4.245636] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    4.245648] usb usb3: Product: xHCI Host Controller
[    4.245656] usb usb3: Manufacturer: Linux 6.3.2-1.qubes.fc37.x86_64 xhci=
-hcd
[    4.245668] usb usb3: SerialNumber: 0000:00:08.0
[    4.245816] hub 3-0:1.0: USB hub found
[    4.245946] hub 3-0:1.0: 4 ports detected
[    4.379401] xen: --> pirq=3D24 -> irq=3D40 (gsi=3D40)
[    4.397461] intel_rapl_msr: PL4 support detected.
[    4.400429] snd_hda_codec_generic hdaudioC0D0: autoconfig for Generic: l=
ine_outs=3D1 (0x3/0x0/0x0/0x0/0x0) type:line
[    4.400432] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    4.400433] snd_hda_codec_generic hdaudioC0D0:    hp_outs=3D0 (0x0/0x0/0=
x0/0x0/0x0)
[    4.400434] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=3D0x0
[    4.400435] snd_hda_codec_generic hdaudioC0D0:    inputs:
[    4.400435] snd_hda_codec_generic hdaudioC0D0:      Line=3D0x5
[    4.423367] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    4.571898] usb 1-1: New USB device found, idVendor=3D0627, idProduct=3D=
0001, bcdDevice=3D 0.00
[    4.571917] usb 1-1: New USB device strings: Mfr=3D1, Product=3D3, Seria=
lNumber=3D10
[    4.571930] usb 1-1: Product: QEMU USB Tablet
[    4.571939] usb 1-1: Manufacturer: QEMU
[    4.571946] usb 1-1: SerialNumber: 42
[    4.579643] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:0=
5.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input6
[    4.580049] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.0=
1 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:05.0-1/input0
[    4.589770] loop: module loaded
[    4.597653] fuse: init (API version 7.38)
[    6.737828] kauditd_printk_skb: 114 callbacks suppressed
[    6.737830] audit: type=3D1106 audit(1685518757.781:103): pid=3D617 uid=
=3D0 auid=3D1000 ses=3D2 subj=3Dsystem_u:system_r:local_login_t:s0-s0:c0.c1=
023 msg=3D'op=3DPAM:session_close grantors=3Dpam_selinux,pam_loginuid,pam_s=
elinux,pam_keyinit,pam_limits,pam_systemd,pam_unix,pam_umask,pam_lastlog ac=
ct=3D"user" exe=3D"/usr/lib/qubes/qrexec-agent" hostname=3D? addr=3D? termi=
nal=3D? res=3Dsuccess'
[    6.737890] audit: type=3D1104 audit(1685518757.781:104): pid=3D617 uid=
=3D0 auid=3D1000 ses=3D2 subj=3Dsystem_u:system_r:local_login_t:s0-s0:c0.c1=
023 msg=3D'op=3DPAM:setcred grantors=3Dpam_rootok acct=3D"user" exe=3D"/usr=
/lib/qubes/qrexec-agent" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.285478] audit: type=3D1106 audit(1685518758.328:105): pid=3D612 uid=
=3D0 auid=3D1000 ses=3D1 subj=3Dsystem_u:system_r:local_login_t:s0-s0:c0.c1=
023 msg=3D'op=3DPAM:session_close grantors=3Dpam_selinux,pam_loginuid,pam_s=
elinux,pam_keyinit,pam_limits,pam_systemd,pam_unix,pam_umask,pam_lastlog ac=
ct=3D"user" exe=3D"/usr/lib/qubes/qrexec-agent" hostname=3D? addr=3D? termi=
nal=3D? res=3Dsuccess'
[    7.285536] audit: type=3D1104 audit(1685518758.328:106): pid=3D612 uid=
=3D0 auid=3D1000 ses=3D1 subj=3Dsystem_u:system_r:local_login_t:s0-s0:c0.c1=
023 msg=3D'op=3DPAM:setcred grantors=3Dpam_rootok acct=3D"user" exe=3D"/usr=
/lib/qubes/qrexec-agent" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   10.588394] systemd-journald[272]: Time jumped backwards, rotating.
[   10.593625] audit: type=3D1130 audit(1685518760.006:107): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dqubes-sync-time comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   10.593664] audit: type=3D1131 audit(1685518760.006:108): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dqubes-sync-time comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   20.771405] audit: type=3D1101 audit(1685518770.184:109): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser =
acct=3D"user" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/p=
ts/0 res=3Dsuccess'
[   20.771533] audit: type=3D1123 audit(1685518770.184:110): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'cwd=3D"/home/user" cmd=3D646E6620696E7374616C6C202D432=
02E2F69706572662D322E312E392D312E666333372E7838365F36342E72706D exe=3D"/usr=
/bin/sudo" terminal=3Dpts/0 res=3Dsuccess'
[   20.772368] audit: type=3D1110 audit(1685518770.185:111): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/0 res=3Dsuccess'
[   20.774435] audit: type=3D1105 audit(1685518770.187:112): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_open grantors=3Dpam_keyinit,pam_limit=
s,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bin=
/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuccess'
[   20.774999] audit: type=3D2300 audit(1685518770.187:113): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'newrole: old-context=3Dunconfined_u:unconfined_r:uncon=
fined_t:s0-s0:c0.c1023 new-context=3Dunconfined_u:unconfined_r:unconfined_t=
:s0-s0:c0.c1023 exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/0 res=3Dsuccess'
[   22.548766] audit: type=3D1130 audit(1685518771.961:114): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dunbound-anchor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   22.548831] audit: type=3D1131 audit(1685518771.961:115): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dunbound-anchor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   23.992181] audit: type=3D1130 audit(1685518773.404:116): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Drun-r98added9c3b340adae9435487780b67a comm=3D"systemd" exe=3D"/u=
sr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   24.241420] audit: type=3D1130 audit(1685518773.653:117): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dman-db-cache-update comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   24.241459] audit: type=3D1131 audit(1685518773.653:118): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dman-db-cache-update comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   26.439229] kauditd_printk_skb: 1 callbacks suppressed
[   26.439232] audit: type=3D1106 audit(1685518775.851:120): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_close grantors=3Dpam_keyinit,pam_limi=
ts,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bi=
n/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuccess'
[   26.439292] audit: type=3D1104 audit(1685518775.851:121): pid=3D1028 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/0 res=3Dsuccess'
[   28.629938] audit: type=3D1101 audit(1685518778.042:122): pid=3D1139 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser =
acct=3D"user" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/p=
ts/0 res=3Dsuccess'
[   28.630129] audit: type=3D1123 audit(1685518778.042:123): pid=3D1139 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'cwd=3D"/home/user" cmd=3D6E6674206164642072756C6520717=
562657320637573746F6D2D696E70757420616363657074 exe=3D"/usr/bin/sudo" termi=
nal=3Dpts/0 res=3Dsuccess'
[   28.630624] audit: type=3D1110 audit(1685518778.043:124): pid=3D1139 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/0 res=3Dsuccess'
[   28.632479] audit: type=3D1105 audit(1685518778.045:125): pid=3D1139 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_open grantors=3Dpam_keyinit,pam_limit=
s,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bin=
/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/0 res=3Dsuccess'
[   28.632730] audit: type=3D2300 audit(1685518778.045:126): pid=3D1139 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'newrole: old-context=3Dunconfined_u:unconfined_r:uncon=
fined_t:s0-s0:c0.c1023 new-context=3Dunconfined_u:unconfined_r:unconfined_t=
:s0-s0:c0.c1023 exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/0 res=3Dsuccess'
[   28.660272] audit: type=3D1325 audit(1685518778.072:127): table=3Dqubes:=
8 family=3D2 entries=3D1 op=3Dnft_register_rule pid=3D1140 subj=3Dunconfine=
d_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 comm=3D"nft"
[   28.660644] audit: type=3D1300 audit(1685518778.072:127): arch=3Dc000003=
e syscall=3D46 success=3Dyes exit=3D144 a0=3D3 a1=3D7fff17f303a0 a2=3D0 a3=
=3D726ae8d67bc4 items=3D0 ppid=3D1139 pid=3D1140 auid=3D1000 uid=3D0 gid=3D=
0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D=
4 comm=3D"nft" exe=3D"/usr/sbin/nft" subj=3Dunconfined_u:unconfined_r:uncon=
fined_t:s0-s0:c0.c1023 key=3D(null)
[   28.661081] audit: type=3D1327 audit(1685518778.072:127): proctitle=3D2F=
7573722F7362696E2F6E6674006164640072756C6500717562657300637573746F6D2D696E7=
0757400616363657074
[   37.352843] kauditd_printk_skb: 2 callbacks suppressed
[   37.352847] audit: type=3D1131 audit(1685518786.765:130): pid=3D1 uid=3D=
0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-hostnamed comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   37.377516] audit: type=3D1334 audit(1685518786.790:131): prog-id=3D35 o=
p=3DUNLOAD
[   37.377562] audit: type=3D1334 audit(1685518786.790:132): prog-id=3D34 o=
p=3DUNLOAD
[   37.377599] audit: type=3D1334 audit(1685518786.790:133): prog-id=3D33 o=
p=3DUNLOAD
[   44.946770] audit: type=3D1325 audit(1685518794.359:134): table=3Dqubes-=
firewall:9 family=3D2 entries=3D4 op=3Dnft_register_chain pid=3D1181 subj=
=3Dsystem_u:system_r:unconfined_service_t:s0 comm=3D"nft"
[   44.946810] audit: type=3D1300 audit(1685518794.359:134): arch=3Dc000003=
e syscall=3D46 success=3Dyes exit=3D880 a0=3D3 a1=3D7ffed54d4080 a2=3D0 a3=
=3D7a6b97eecbc4 items=3D0 ppid=3D529 pid=3D1181 auid=3D4294967295 uid=3D0 g=
id=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none)=
 ses=3D4294967295 comm=3D"nft" exe=3D"/usr/sbin/nft" subj=3Dsystem_u:system=
_r:unconfined_service_t:s0 key=3D(null)
[   44.946860] audit: type=3D1327 audit(1685518794.359:134): proctitle=3D6E=
6674002D66002F6465762F737464696E
[   44.978424] audit: type=3D1325 audit(1685518794.391:135): table=3Dqubes-=
firewall:10 family=3D2 entries=3D3 op=3Dnft_register_chain pid=3D1185 subj=
=3Dsystem_u:system_r:unconfined_service_t:s0 comm=3D"nft"
[   44.978456] audit: type=3D1300 audit(1685518794.391:135): arch=3Dc000003=
e syscall=3D46 success=3Dyes exit=3D420 a0=3D3 a1=3D7ffc8c7388f0 a2=3D0 a3=
=3D794d3bbbdbc4 items=3D0 ppid=3D529 pid=3D1185 auid=3D4294967295 uid=3D0 g=
id=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none)=
 ses=3D4294967295 comm=3D"nft" exe=3D"/usr/sbin/nft" subj=3Dsystem_u:system=
_r:unconfined_service_t:s0 key=3D(null)
[   44.978501] audit: type=3D1327 audit(1685518794.391:135): proctitle=3D6E=
6674002D66002F6465762F737464696E
[   44.984834] audit: type=3D1325 audit(1685518794.396:136): table=3Dqubes-=
firewall:11 family=3D2 entries=3D3 op=3Dnft_register_chain pid=3D1186 subj=
=3Dsystem_u:system_r:unconfined_service_t:s0 comm=3D"nft"
[   44.984864] audit: type=3D1300 audit(1685518794.396:136): arch=3Dc000003=
e syscall=3D46 success=3Dyes exit=3D420 a0=3D3 a1=3D7ffc97f36780 a2=3D0 a3=
=3D7deb403c0bc4 items=3D0 ppid=3D529 pid=3D1186 auid=3D4294967295 uid=3D0 g=
id=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none)=
 ses=3D4294967295 comm=3D"nft" exe=3D"/usr/sbin/nft" subj=3Dsystem_u:system=
_r:unconfined_service_t:s0 key=3D(null)
[   44.984909] audit: type=3D1327 audit(1685518794.396:136): proctitle=3D6E=
6674002D66002F6465762F737464696E
[   45.004767] vif vif-4-0 vif4.0: Guest Rx ready
[   45.062429] audit: type=3D1325 audit(1685518794.440:137): table=3Dqubes-=
nat-accel:12 family=3D1 entries=3D8 op=3Dnft_register_chain pid=3D1223 subj=
=3Dsystem_u:system_r:iptables_t:s0-s0:c0.c1023 comm=3D"nft"
[  106.608006] kauditd_printk_skb: 22 callbacks suppressed
[  106.608009] audit: type=3D1101 audit(1685518856.020:143): pid=3D1273 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:accounting grantors=3Dpam_unix,pam_localuser =
acct=3D"user" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev/p=
ts/1 res=3Dsuccess'
[  106.608814] audit: type=3D1123 audit(1685518856.021:144): pid=3D1273 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'cwd=3D"/home/user" cmd=3D"dmesg" exe=3D"/usr/bin/sudo"=
 terminal=3Dpts/1 res=3Dsuccess'
[  106.609939] audit: type=3D1110 audit(1685518856.022:145): pid=3D1273 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:setcred grantors=3Dpam_env,pam_localuser,pam_=
unix acct=3D"root" exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/=
dev/pts/1 res=3Dsuccess'
[  106.614575] audit: type=3D1105 audit(1685518856.027:146): pid=3D1273 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'op=3DPAM:session_open grantors=3Dpam_keyinit,pam_limit=
s,pam_keyinit,pam_limits,pam_systemd,pam_unix acct=3D"root" exe=3D"/usr/bin=
/sudo" hostname=3D? addr=3D? terminal=3D/dev/pts/1 res=3Dsuccess'
[  106.615633] audit: type=3D2300 audit(1685518856.028:147): pid=3D1273 uid=
=3D1000 auid=3D1000 ses=3D4 subj=3Dunconfined_u:unconfined_r:unconfined_t:s=
0-s0:c0.c1023 msg=3D'newrole: old-context=3Dunconfined_u:unconfined_r:uncon=
fined_t:s0-s0:c0.c1023 new-context=3Dunconfined_u:unconfined_r:unconfined_t=
:s0-s0:c0.c1023 exe=3D"/usr/bin/sudo" hostname=3D? addr=3D? terminal=3D/dev=
/pts/1 res=3Dsuccess'

--T1KEJXkE9CKFKvx+--

--0/lXUo8O37WGBCUc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmR2/AwACgkQ24/THMrX
1yz2FAf/cB8UxOTbWkoiAYa/X68YlwfRJftdWs3szfpAjmQPu4KcXpqhUhQNOyCM
8cz5ktJyiMz0GPcD6qb0xcW2boTxoTVgymQWQ6ZlgerveJkqvR2RjzSnu2pMDMSY
+BFC1IzqDni3McTm1c1llAvDUyLuHVRpCDkWdQzXhabzmyv7jNfui7rlq5Ri7ZXM
8N9818eR3E610yACzULp/o9f3LmUqarim/uejRXdzne7MHapEwF0+kLMRLvKxZtO
KEHdVsZQ1VrYRS0j9rbyCT7WV/91o+TFew94CV7Z2mhwW6KstvpTMCP3bXbeTWKp
KzsyQmucfM5B2v/2zI3fPPZYc6Pv/A==
=kxs7
-----END PGP SIGNATURE-----

--0/lXUo8O37WGBCUc--


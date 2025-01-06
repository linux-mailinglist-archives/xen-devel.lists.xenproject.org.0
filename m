Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C919DA02EC8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 18:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865862.1277138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqlX-0006AO-9R; Mon, 06 Jan 2025 17:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865862.1277138; Mon, 06 Jan 2025 17:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqlX-00068p-6H; Mon, 06 Jan 2025 17:19:47 +0000
Received: by outflank-mailman (input) for mailman id 865862;
 Mon, 06 Jan 2025 17:19:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3utI=T6=casper.srs.infradead.org=BATV+fbe2d98d58a1bf71468b+7806+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tUqlU-00068j-OT
 for xen-devel@lists.xen.org; Mon, 06 Jan 2025 17:19:45 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f65af5-cc52-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 18:19:42 +0100 (CET)
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=u09cd745991455d.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tUqlP-0000000Gn1A-3r11; Mon, 06 Jan 2025 17:19:40 +0000
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
X-Inumbo-ID: 69f65af5-cc52-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FjviZlZXKT8dfKbK95GfyNs+ay4VMJjTPeM7gJNLVac=; b=U8MVOdoA+1dNeHMqrFYwjptwkw
	7SsSyWMC6TWQ/Ca6hOAnkj6sYGudtykzzSF9DS83q7u/zNDRdDj6QHBUWU5WpxOYcZViOEcdZAm14
	1fnEjVv6fhVzVjulYVZWMR3OomrYYhI+RDLM1KErKg6rgUE6m3wAnwv5P+QTdTZNim7j016pCBD4g
	z6gADLSzP8gedJslLBJefTsnfi3bfrD916dnMMjGqer+F9gdzM6LIfPMHo1UdUXIvYk4xQWxP3i8J
	ft5332iJqGhUBTjd3lOw3717hGibmQXLmc0dExjhTWeFzYj6qQypVKaihWBAQQTYBy1P7qJdJWx5g
	FzdSXylw==;
Message-ID: <ffea2b8edd4455b8d04a3c25afaaffc98ed40540.camel@infradead.org>
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, "Xen.org security
 team" <security@xen.org>, xen-devel@lists.xen.org
Date: Mon, 06 Jan 2025 17:19:39 +0000
In-Reply-To: <fc4170ed-d238-4e1c-817e-3695a7112d9d@suse.com>
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
	 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
	 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
	 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
	 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
	 <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
	 <40734e79-fb55-4712-aae1-3ef350af4f3c@suse.com>
	 <f9b4ae8af70b8b5136b59237c7925f57220b3d5b.camel@infradead.org>
	 <fc4170ed-d238-4e1c-817e-3695a7112d9d@suse.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-/WS719eLD5TDhjNdeM/Z"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-/WS719eLD5TDhjNdeM/Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-01-02 at 15:16 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 02.01.25 15:06, David Woodhouse wrote:
> > On Thu, 2025-01-02 at 15:02 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > > > Are you suggesting that you're able to enable the CPU-specific CFI
> > > > protections before you even know whether it's an Intel or AMD CPU?
> > >=20
> > > Not before that, but maybe rather soon afterwards. And the hypercall =
page
> > > needs to be decommissioned before the next hypercall is happening. Th=
e question
> > > is whether we have a hook in place to do that switch between cpu iden=
tification
> > > and CFI enabling.
> >=20
> > Not sure that's how I'd phrase it. Even if we have to add a hook at the
> > right time to switch from the Xen-populated hypercall page to the one
> > filled in by Linux, the question is whether adding that hook is simpler
> > than all this early static_call stuff that's been thrown together, and
> > the open questions about the 64-bit latching.
>=20
> This is a valid question, yes. My first version of these patches didn't
> work with static_call, but used the paravirt call patching mechanism
> replacing an indirect call with a direct one via ALTERNATIVEs. That
> version was disliked by some involved x86 maintainers, resulting in the
> addition of the early static_call update mechanism.
>=20
> One thing to mention regarding the 64-bit latching: what would you do
> with HVM domains? Those are setting up the hypercall page rather late.
> In case the kernel would use CFI, enabling would happen way before the
> guest would issue any hypercall, so I guess the latching needs to happen
> by other means anyway. Or would you want to register the hypercall page
> without ever intending to use it?

With xen_no_vector_callback on the command line, the hypervisor doesn't
realise that the guest is 64-bit until long after all the CPUs are
brought up.

It does boot (and hey, QEMU does get this right!) but I'm still
concerned that all those shared structures are 32-bit for that long. I
do think the guest kernel should either set the hypercall page, or
HVM_PARAM_CALLBACK_IRQ, as early as possible.

 $ ./qemu-system-x86_64 -display none -vga none  -serial mon:stdio   -accel=
 kvm,xen-version=3D0x4000a,kernel-irqchip=3Dsplit -smp 2 -kernel ~/git/linu=
x-2.6/arch/x86/boot/bzImage  -append 'root=3D/dev/xvda1 console=3DttyS0 xen=
_no_vector_callback earlyprintk=3Dserial' -drive file=3D/var/lib/libvirt/im=
ages/fedora28.qcow2,if=3Dxen  -trace kvm_xen\* -m 2g
kvm_xen_soft_reset=20
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 0 gpa 0xffffffffffffffff
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 1 gpa 0xffffffffffffffff
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 2 gpa 0xffffffffffffffff
kvm_xen_set_vcpu_callback callback vcpu 0 vector 0
kvm_xen_set_vcpu_attr vcpu attr cpu 1 type 0 gpa 0xffffffffffffffff
kvm_xen_set_vcpu_attr vcpu attr cpu 1 type 1 gpa 0xffffffffffffffff
kvm_xen_set_vcpu_attr vcpu attr cpu 1 type 2 gpa 0xffffffffffffffff
kvm_xen_set_vcpu_callback callback vcpu 1 vector 0
Probing EDD (edd=3Doff to disable)... ok
[    0.000000] Linux version 6.13.0-rc2+ (dwoodhou@i7.infradead.org) (gcc (=
GCC) 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.43.1-2.fc41) #221=
0 SMP PREEMPT_DYNAMIC Mon Jan  6 17:10:02 GMT 2025
[    0.000000] Command line: root=3D/dev/xvda1 console=3DttyS0 xen_no_vecto=
r_callback earlyprintk=3Dserial
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007ffdffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000007ffe0000-0x000000007fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feff8000-0x00000000feffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reser=
ved
[    0.000000] printk: legacy bootconsole [earlyser0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.3=
-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
[    0.000000] DMI: Memory slots populated: 1/1
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.10.
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 17 a0 0x6 a1 0xffffffff8=
a003e30 a2 0x0 ret 0x0
kvm_xen_set_shared_info shared info at gfn 0x10
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 12 a0 0x7 a1 0xffffffff8=
a003e30 a2 0x8000000000000163 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 0 gpa 0x10000
kvm_xen_set_vcpu_attr vcpu attr cpu 1 type 0 gpa 0x10040
[    0.000000] platform_pci_unplug: Netfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated NICs.
[    0.000000] platform_pci_unplug: Blkfront and the Xen platform PCI drive=
r have been compiled for this kernel: unplug emulated disks.
[    0.000000] You might have to change the root device
[    0.000000] from /dev/hd[a-d] to /dev/xvd[a-d]
[    0.000000] in your root=3D kernel command line option
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x9 a1 0xffffffff8=
a003e38 a2 0x0 ret 0xffffffffffffffda
[    0.000000] last_pfn =3D 0x7ffe0 max_arch_pfn =3D 0x400000000
[    0.000000] MTRR map: 4 entries (3 fixed + 1 variable; max 19), built fr=
om 8 variable MTRRs
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
Memory KASLR using RDTSC...
[    0.000000] found SMP MP-table at [mem 0x000f5480-0x000f548f]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F52A0 000014 (v00 BOCHS )
[    0.000000] ACPI: RSDT 0x000000007FFE2379 000034 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.000000] ACPI: FACP 0x000000007FFE2225 000074 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.000000] ACPI: DSDT 0x000000007FFE0040 0021E5 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.000000] ACPI: FACS 0x000000007FFE0000 000040
[    0.000000] ACPI: APIC 0x000000007FFE2299 000080 (v03 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.000000] ACPI: HPET 0x000000007FFE2319 000038 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.000000] ACPI: WAET 0x000000007FFE2351 000028 (v01 BOCHS  BXPC     00=
000001 BXPC 00000001)
[    0.000000] ACPI: Reserving FACP table memory at [mem 0x7ffe2225-0x7ffe2=
298]
[    0.000000] ACPI: Reserving DSDT table memory at [mem 0x7ffe0040-0x7ffe2=
224]
[    0.000000] ACPI: Reserving FACS table memory at [mem 0x7ffe0000-0x7ffe0=
03f]
[    0.000000] ACPI: Reserving APIC table memory at [mem 0x7ffe2299-0x7ffe2=
318]
[    0.000000] ACPI: Reserving HPET table memory at [mem 0x7ffe2319-0x7ffe2=
350]
[    0.000000] ACPI: Reserving WAET table memory at [mem 0x7ffe2351-0x7ffe2=
378]
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000007ffdffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x7ffb4c00-0x7ffdffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x000000007ffdffff]
[    0.000000]   Normal   empty
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000007ffdffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000007ffdf=
fff]
[    0.000000] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 32 pages in unavailable ranges
[    0.000000] ACPI: PM-Timer IO Port: 0x608
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-=
23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level=
)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level=
)
[    0.000000] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] CPU topo: Max. logical packages:   1
[    0.000000] CPU topo: Max. logical dies:       1
[    0.000000] CPU topo: Max. dies per package:   1
[    0.000000] CPU topo: Max. threads per core:   1
[    0.000000] CPU topo: Num. cores per package:     2
[    0.000000] CPU topo: Num. threads per package:   2
[    0.000000] CPU topo: Allowing 2 present CPUs plus 0 hotplug CPUs
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0=
x0009ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000effff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0=
x000fffff]
[    0.000000] [mem 0x80000000-0xfeff7fff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on Xen HVM
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr=
_node_ids:1
[    0.000000] percpu: Embedded 69 pages/cpu s245760 r8192 d28672 u1048576
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 24 a0 0xa a1 0x0 a2 0xff=
ffffff8a003e90 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 0 type 0 gpa 0x7dc37c40
[    0.000000] Kernel command line: root=3D/dev/xvda1 console=3DttyS0 xen_n=
o_vector_callback earlyprintk=3Dserial
[    0.000000] printk: log buffer data + meta data: 262144 + 917504 =3D 117=
9648 bytes
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    0.000000] Fallback order for Node 0: 0=20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 52415=
8
[    0.000000] Policy zone: DMA32
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    0.000000] Kernel/User page tables isolation: enabled
Poking KASLR using RDTSC...
[    0.000000] ftrace: allocating 57063 entries in 223 pages
[    0.000000] ftrace: allocated 223 pages with 7 groups
[    0.000000] Dynamic Preempt: voluntary
[    0.000000] Running RCU self tests
[    0.000000] Running RCU synchronous self tests
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU lockdep checking is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D2.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    0.000000] Running RCU synchronous self tests
[    0.000000] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_cb_adjus=
t=3D1 rcu_task_cpu_ids=3D2.
[    0.000000] RCU Tasks Rude: Setting shift to 1 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D2.
[    0.000000] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb=
_adjust=3D1 rcu_task_cpu_ids=3D2.
[    0.000000] NR_IRQS: 524544, nr_irqs: 440, preallocated irqs: 16
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 32 a0 0xb a1 0xffffffff8=
a003e10 a2 0x0 ret 0xffffffffffffffda
[    0.000000] xen:events: Using 2-level ABI
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000000] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.000000] Console: colour *CGA 80x25
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x1 a1 0xffffffff8=
a003e90 a2 0x7ff0 ret 0xffffffffffffffea
[    0.000000] Cannot get hvm parameter CONSOLE_EVTCHN (18): -22!
[    0.000000] printk: legacy console [ttyS0] enabled
[    0.000000] printk: legacy console [ttyS0] enabled
[    0.000000] printk: legacy bootconsole [earlyser0] disabled
[    0.000000] printk: legacy bootconsole [earlyser0] disabled
[    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,=
 Ingo Molnar
[    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.000000] ... MAX_LOCK_DEPTH:          48
[    0.000000] ... MAX_LOCKDEP_KEYS:        8192
[    0.000000] ... CLASSHASH_SIZE:          4096
[    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
[    0.000000] ... CHAINHASH_SIZE:          32768
[    0.000000]  memory used by lock dependency info: 6429 kB
[    0.000000]  memory used for stack traces: 4224 kB
[    0.000000]  per task-struct memory footprint: 1920 bytes
[    0.000000] ACPI: Core revision 20240827
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 19112604467 ns
[    0.001000] APIC: Switch to symmetric I/O mode setup
[    0.002000] x2apic enabled
[    0.004000] APIC: Switched APIC routing to: physical x2apic
[    0.004000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.012000] tsc: Unable to calibrate against PIT
[    0.013000] tsc: using HPET reference calibration
[    0.013000] tsc: Detected 2592.897 MHz processor
[    0.000012] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2560065444d, max_idle_ns: 440795301426 ns
[    0.001491] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 5185.79 BogoMIPS (lpj=3D2592897)
[    0.002655] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.003489] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.004222] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.004490] Spectre V2 : Mitigation: Retpolines
[    0.005070] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.005489] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.006489] Speculative Store Bypass: Vulnerable
[    0.007489] MDS: Vulnerable: Clear CPU buffers attempted, no microcode
[    0.008489] MMIO Stale Data: Unknown: No mitigations
[    0.009133] x86/fpu: x87 FPU will use FXSAVE
[    0.038149] Freeing SMP alternatives memory: 48K
[    0.038496] pid_max: default: 32768 minimum: 301
[    0.039991] LSM: initializing lsm=3Dlockdown,capability,yama,selinux,bpf=
,landlock,ima,evm
[    0.040774] Yama: becoming mindful.
[    0.041533] SELinux:  Initializing.
[    0.044715] LSM support for eBPF active
[    0.045317] landlock: Up and running.
[    0.045832] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes,=
 linear)
[    0.046494] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 b=
ytes, linear)
[    0.049687] Running RCU synchronous self tests
[    0.050288] Running RCU synchronous self tests
[    0.153191] smpboot: CPU0: Intel QEMU Virtual CPU version 2.5+ (family: =
0xf, model: 0x6b, stepping: 0x1)
[    0.154918] Running RCU Tasks wait API self tests
[    0.258712] Running RCU Tasks Rude wait API self tests
[    0.259499] Running RCU Tasks Trace wait API self tests
[    0.260607] Performance Events: unsupported Netburst CPU model 107 no PM=
U driver, software events only.
[    0.261553] signal: max sigframe size: 1440
[    0.262654] rcu: Hierarchical SRCU implementation.
[    0.263493] rcu: 	Max phase no-delay instances is 400.
[    0.264678] Timer migration: 1 hierarchy levels; 8 children per group; 1=
 crossnode level
[    0.266509] Callback from call_rcu_tasks_trace() invoked.
[    0.267676] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.268688] smp: Bringing up secondary CPUs ...
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 24 a0 0xa a1 0x1 a2 0xff=
ffa662c0013c90 ret 0x0
kvm_xen_set_vcpu_attr vcpu attr cpu 1 type 0 gpa 0x7dd37c40
[    0.270151] smpboot: x86: Booting SMP configuration:
[    0.270501] .... node  #0, CPUs:      #1
[    0.283862] smp: Brought up 1 node, 2 CPUs
[    0.285133] smpboot: Total of 2 processors activated (10371.58 BogoMIPS)
[    0.286883] Memory: 1985476K/2096632K available (22528K kernel code, 496=
7K rwdata, 10120K rodata, 5116K init, 16104K bss, 105184K reserved, 0K cma-=
reserved)
[    0.289089] devtmpfs: initialized
[    0.290565] x86/mm: Memory block size: 128MB
[    0.295795] Running RCU synchronous self tests
[    0.296526] Running RCU synchronous self tests
[    0.298579] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.300510] futex hash table entries: 512 (order: 4, 65536 bytes, linear=
)
[    0.303381] pinctrl core: initialized pinctrl subsystem
[    0.304923] PM: RTC time: 17:13:37, date: 2025-01-06
[    0.307951] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.310030] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocat=
ions
[    0.310667] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic=
 allocations
[    0.312515] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atom=
ic allocations
[    0.313836] audit: initializing netlink subsys (disabled)
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x1 a1 0xffffa662c=
0013d90 a2 0x0 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x1 a1 0xffffa662c=
0013d90 a2 0x0 ret 0x0
[    0.314652] audit: type=3D2000 audit(1736183617.328:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.315932] thermal_sys: Registered thermal governor 'fair_share'
[    0.316492] thermal_sys: Registered thermal governor 'bang_bang'
[    0.317508] thermal_sys: Registered thermal governor 'step_wise'
[    0.319506] thermal_sys: Registered thermal governor 'user_space'
[    0.321642] cpuidle: using governor menu
[    0.325622] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.329027] PCI: Using configuration type 1 for base access
[    0.330824] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.339561] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 page=
s
[    0.340495] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.363514] cryptd: max_cpu_qlen set to 1000
[    0.365598] raid6: skipped pq benchmark and selected sse2x4
[    0.366469] raid6: using intx1 recovery algorithm
[    0.368039] ACPI: Added _OSI(Module Device)
[    0.368493] ACPI: Added _OSI(Processor Device)
[    0.369190] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.369492] ACPI: Added _OSI(Processor Aggregator Device)
[    0.373105] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.376550] ACPI: Interpreter enabled
[    0.377182] ACPI: PM: (supports S0 S3 S4 S5)
[    0.377507] ACPI: Using IOAPIC for interrupt routing
[    0.378972] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.379491] PCI: Using E820 reservations for host bridge windows
[    0.381586] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.390118] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.390499] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MS=
I EDR HPX-Type3]
[    0.391493] acpi PNP0A03:00: _OSC: not requesting OS control; OS require=
s [ExtendedConfig ASPM ClockPM MSI]
[    0.393553] acpi PNP0A03:00: fail to add MMCONFIG information, can't acc=
ess extended configuration space under this bridge
[    0.397001] acpiphp: Slot [2] registered
[    0.397539] acpiphp: Slot [3] registered
[    0.398194] acpiphp: Slot [4] registered
[    0.398530] acpiphp: Slot [5] registered
[    0.399528] acpiphp: Slot [6] registered
[    0.400150] acpiphp: Slot [7] registered
[    0.400534] acpiphp: Slot [8] registered
[    0.401144] acpiphp: Slot [9] registered
[    0.401530] acpiphp: Slot [10] registered
[    0.402528] acpiphp: Slot [11] registered
[    0.403185] acpiphp: Slot [12] registered
[    0.403530] acpiphp: Slot [13] registered
[    0.404534] acpiphp: Slot [14] registered
[    0.405193] acpiphp: Slot [15] registered
[    0.405528] acpiphp: Slot [16] registered
[    0.406534] acpiphp: Slot [17] registered
[    0.407208] acpiphp: Slot [18] registered
[    0.407535] acpiphp: Slot [19] registered
[    0.408533] acpiphp: Slot [20] registered
[    0.409175] acpiphp: Slot [21] registered
[    0.409528] acpiphp: Slot [22] registered
[    0.410531] acpiphp: Slot [23] registered
[    0.411183] acpiphp: Slot [24] registered
[    0.411528] acpiphp: Slot [25] registered
[    0.412494] acpiphp: Slot [26] registered
[    0.413150] acpiphp: Slot [27] registered
[    0.413528] acpiphp: Slot [28] registered
[    0.414197] acpiphp: Slot [29] registered
[    0.414529] acpiphp: Slot [30] registered
[    0.415536] acpiphp: Slot [31] registered
[    0.416192] PCI host bridge to bus 0000:00
[    0.416499] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window=
]
[    0.417492] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window=
]
[    0.418491] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.419492] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfebffff=
f window]
[    0.420491] pci_bus 0000:00: root bus resource [mem 0x100000000-0x17ffff=
fff window]
[    0.422492] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.423427] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.425569] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.428423] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180 convent=
ional PCI endpoint
[    0.433418] pci 0000:00:01.1: BAR 4 [io  0xc100-0xc10f]
[    0.436000] pci 0000:00:01.1: BAR 0 [io  0x01f0-0x01f7]: legacy IDE quir=
k
[    0.436493] pci 0000:00:01.1: BAR 1 [io  0x03f6]: legacy IDE quirk
[    0.437492] pci 0000:00:01.1: BAR 2 [io  0x0170-0x0177]: legacy IDE quir=
k
[    0.438491] pci 0000:00:01.1: BAR 3 [io  0x0376]: legacy IDE quirk
[    0.440728] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000 convent=
ional PCI endpoint
[    0.442546] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX=
4 ACPI
[    0.443503] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX=
4 SMB
[    0.444900] pci 0000:00:02.0: [5853:0001] type 00 class 0xff8000 convent=
ional PCI endpoint
[    0.446744] pci 0000:00:02.0: BAR 0 [io  0xc000-0xc0ff]
[    0.447993] pci 0000:00:02.0: BAR 1 [mem 0xfd000000-0xfdffffff pref]
[    0.455675] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
[    0.456685] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    0.459712] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.460680] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    0.461576] ACPI: PCI: Interrupt link LNKS configured for IRQ 9
[    0.463986] xen:balloon: Initialising balloon driver
[    0.465678] iommu: Default domain type: Translated
[    0.466501] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.468566] Callback from call_rcu_tasks() invoked.
[    0.469004] SCSI subsystem initialized
[    0.470795] ACPI: bus type USB registered
[    0.472546] usbcore: registered new interface driver usbfs
[    0.473436] usbcore: registered new interface driver hub
[    0.473525] usbcore: registered new device driver usb
[    0.474597] pps_core: LinuxPPS API ver. 1 registered
[    0.475493] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.476501] PTP clock support registered
[    0.477636] EDAC MC: Ver: 3.0.0
[    0.481290] NetLabel: Initializing
[    0.481501] NetLabel:  domain hash size =3D 128
[    0.482500] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.483585] NetLabel:  unlabeled traffic allowed by default
[    0.484524] mctp: management component transport protocol core
[    0.485492] NET: Registered PF_MCTP protocol family
[    0.486540] PCI: Using ACPI for IRQ routing
[    0.487795] vgaarb: loaded
[    0.488698] hpet: 3 channels of 0 reserved for per-cpu timers
[    0.489549] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.490496] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    0.494755] clocksource: Switched to clocksource tsc-early
[    0.501201] VFS: Disk quotas dquot_6.6.0
[    0.501853] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.503199] pnp: PnP ACPI init
[    0.504524] pnp: PnP ACPI: found 6 devices
[    0.519976] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.521639] NET: Registered PF_INET protocol family
[    0.522542] IP idents hash table entries: 32768 (order: 6, 262144 bytes,=
 linear)
[    0.524887] tcp_listen_portaddr_hash hash table entries: 1024 (order: 4,=
 73728 bytes, linear)
[    0.526620] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.528105] TCP established hash table entries: 16384 (order: 5, 131072 =
bytes, linear)
[    0.532557] TCP bind hash table entries: 16384 (order: 9, 2359296 bytes,=
 linear)
[    0.536739] TCP: Hash tables configured (established 16384 bind 16384)
[    0.539128] MPTCP token hash table entries: 2048 (order: 5, 180224 bytes=
, linear)
[    0.540371] UDP hash table entries: 1024 (order: 6, 262144 bytes, linear=
)
[    0.541517] UDP-Lite hash table entries: 1024 (order: 6, 262144 bytes, l=
inear)
[    0.542936] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.543851] NET: Registered PF_XDP protocol family
[    0.544592] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.545510] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.546432] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.547435] pci_bus 0000:00: resource 7 [mem 0x80000000-0xfebfffff windo=
w]
[    0.548457] pci_bus 0000:00: resource 8 [mem 0x100000000-0x17fffffff win=
dow]
[    0.549597] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.550482] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.551425] PCI: CLS 0 bytes, default 64
[    0.554908] Initialise system trusted keyrings
[    0.556537] Key type blacklist registered
[    0.558226] workingset: timestamp_bits=3D36 max_order=3D19 bucket_order=
=3D0
[    0.560381] zbud: loaded
[    0.566463] integrity: Platform Keyring initialized
[    0.590614] NET: Registered PF_ALG protocol family
[    0.591432] xor: measuring software checksum speed
[    0.592372]    prefetch64-sse  : 22503 MB/sec
[    0.593475]    generic_sse     : 15243 MB/sec
[    0.594241] xor: using function: prefetch64-sse (22503 MB/sec)
[    0.595246] Key type asymmetric registered
[    0.595958] Asymmetric key parser 'x509' registered
[    0.599978] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.602692] io scheduler mq-deadline registered
[    0.603828] io scheduler kyber registered
[    0.604967] io scheduler bfq registered
[    0.610614] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    0.612803] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.614863] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[    0.617292] ACPI: button: Power Button [PWRF]
[    0.622286] ACPI: \_SB_.LNKB: Enabled at IRQ 10
Set long mode 1
kvm_xen_hypercall xen_hypercall: cpu 0 cpl 0 input 34 a0 0x0 a1 0xffffa662c=
0013c10 a2 0x0 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 20 a0 0x6 a1 0xffffa662c=
0013c18 a2 0x1 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 20 a0 0x6 a1 0xffffa662c=
0013c18 a2 0x1 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 20 a0 0x6 a1 0xffffa662c=
0013c00 a2 0x1 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 20 a0 0x8 a1 0xffffa662c=
0013ba8 a2 0x1 ret 0x0
[    0.628919] xen:grant_table: Grant tables using version 1 layout
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 20 a0 0x6 a1 0xffffa662c=
0013be0 a2 0x1 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 20 a0 0x6 a1 0xffffa662c=
0013bd8 a2 0x1 ret 0x0
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 12 a0 0x7 a1 0xffffa662c=
0013bc0 a2 0x7ff0 ret 0x0
[    0.631024] Grant table initialized
kvm_xen_hypercall xen_hypercall: cpu 1 cpl 0 input 34 a0 0x1 a1 0xffffa662c=
0013da0 a2 0x7ff0 ret 0xffffffffffffffea



--=-/WS719eLD5TDhjNdeM/Z
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEwNjE3MTkz
OVowLwYJKoZIhvcNAQkEMSIEIKXVfo3OPQw7JO9wvbRRUI5Lxm3+x8pq3q/nE/wre7xbMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAWloFitSkPdKM
gQe82h36CgQaPhUyS9rSOGuTO4Tjm0luT2sGXEj4jHPOTH5k4bKQmFoGqK7CNCbFJBcXFNTAbW4M
NMhRrxD43kAtrw8cJJajBSBbJFNiew6jKmANoZuCb6MI0zI8qa8Jvmb1FLVbgfaAJJqB7effPtP9
oGqvX4YNhMGvT87psWlXgXgbYX+Etj7PrbP71eHsOQ1BoCNAuHa/CpkfHBZKKf39rfJ/gSiLGN18
QIWfQnqe7omd692HZSfH/1y+u1rrtE+TGTsyrwzxm0nIzLX8pjIU/tkann/PVcq2UxSr0+rj0Mjc
OjliIKIM+DlxzgP2b4LTEhIfR2DweX+JV7BQItB7rcIRvzPCNGU68eqfg8d2WDPq7pGJJnf+ftwd
cLl6lMNXxsKa5Y7EhEKdu6m1qPcSB1PG6ZdQrz3+5JGYtQSGxTWG1a7EuWtcspivUtgF+lm+/vVZ
pZxEBvkpl6DOHO+j9VgxvoLM3iatBunrIb81GHOYUXr5ff7EKX5fE1reqmmdmL8GAaE3O1DotTlH
ddcPQrLAvxwWbD9Fhk12xuXRck9KSfntA3Wa/1jtwm1ItPqpN37uj9WtH8BFlbAYAwLikKsERRLY
NbfzJ78T0UD9Gjo82sKGarLTkTtD/gSmGFMXXfgnLmIpgZ/LmyBPTeTE/6RcF1cAAAAAAAA=


--=-/WS719eLD5TDhjNdeM/Z--


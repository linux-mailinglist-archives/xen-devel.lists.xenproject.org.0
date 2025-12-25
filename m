Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4487CDFD6F
	for <lists+xen-devel@lfdr.de>; Sat, 27 Dec 2025 15:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193399.1512289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVCG-0000uM-O3; Sat, 27 Dec 2025 14:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193399.1512289; Sat, 27 Dec 2025 14:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZVCG-0000sK-Ju; Sat, 27 Dec 2025 14:23:08 +0000
Received: by outflank-mailman (input) for mailman id 1193399;
 Thu, 25 Dec 2025 23:33:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6E+=67=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1vYupP-0001bd-BD
 for xen-devel@lists.xenproject.org; Thu, 25 Dec 2025 23:33:08 +0000
Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch
 [79.135.106.104]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ede55c1-e1ea-11f0-b15c-2bf370ae4941;
 Fri, 26 Dec 2025 00:33:03 +0100 (CET)
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
X-Inumbo-ID: 0ede55c1-e1ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=slzr66k5hffu7elgtpaepuwix4.protonmail; t=1766705581; x=1766964781;
	bh=7Tr239WhC1bzyzqRw3XyA3F9p1RiddyF6W1+H8Z5Fkk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QSN7NCk+nUwtlg6yd3lBANLLVMihIpBb1QFKmB2hMMqUlfjEQhYgQG8WO+zBgmesX
	 Sp4XZ+Nu3aq8EfFZORcWeckw9oBcyUQkqLWHSO/bfVfrgmc1UhnrEXn7/DHEpsgEQs
	 WP+31s0rG8moXzQZv2iuKHrDuaKwakzjojmDKgsFuZi9KPNtdTFai9T7pka/zbr/kZ
	 oamE0en/IbtXXyUoN8ISv+kom9848aCWl3/lFjrWNwDd7r8mJfR/PAjJuCuh90P9GJ
	 kOjBrIIkGdu0YmHec66mZATc/yyD5iTCckN+WKsQNUybgPS2uxvZyMo/AVHyoHtRqu
	 6+qwOCq8XT05w==
Date: Thu, 25 Dec 2025 23:32:58 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Milky <milky_way_303030@proton.me>
Subject: Cpufreq drivers not working on T480S
Message-ID: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: 16091d719555f62d4e5abfb781897edd66943b48
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

System is T480s with i5-8250U and Libreboot, booting Qubes R4.2 with Xen 4.=
17.5.

I=E2=80=99ve tested the following configurations:

1. `GRUB_CMDLINE_XEN_DEFAULT=3D"cpufreq=3Dxen:performance"` as per [the xen=
 docs](https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#cpu=
freq)
2. `GRUB_CMDLINE_XEN_DEFAULT=3D"cpufreq=3Ddom0-kernel dom0_vcpus_pin"` as p=
er [the xen wiki](http://wiki.xenproject.org/wiki/Xen_power_management#Doma=
in0_based_cpufreq); tho I suspect this option might be deprecated.
3. `GRUB_CMDLINE_XEN_DEFAULT=3D"cpufreq=3Dxen:hwp"`, which should have acti=
vated [this patch from the Qubes team](https://github.com/QubesOS/qubes-vmm=
-xen/pull/158).

In all cases, `cat /proc/cpuinfo` reports the fixed value `cpu Mhz: 1800`, =
confirmed also using `dmidecode`. `sysbench` in an AppVM with max vcpus con=
sistently reports about 1600 events per second, while the dom0 CPU stats in=
 the previous commands remain unchanged. `xenpm start 10 | grep 'Avg freq'`=
 reports bizarre values, like `609350368 KHz`.

The following commands were also checked:

```
$ xenpm get-cpufreq-para
[CPU0] failed to get cpufreq parameter
<...>

$ xenpm get-cpufreq-states
<no output>

$ lsmod | grep 'xen_acpi_processor'
<no output>

$ modprobe xen_acpi_processor
modprobe: ERROR: could not insert 'xen_acpi_processor': No such device
```

Based on (this Xen mailing list message)[https://old-list-archives.xen.org/=
archives/html/xen-devel/2020-01/msg02588.html], the `xen-acpi-processor` mo=
dule is what enables dom0 to pass critical information to Xen. Thus, it see=
ms a big part of the problem is that `xen-acpi-processor` is refusing to lo=
ad. =C2=A0

To rule out causes independent of Xen/Qubes, I booted using a Debian Live i=
mage. `sysbench` consistently reported 4000 events per second, while `/sys/=
cpuinfo` reliably showed a jump from 900Mhz to 3.4GHz.

In conclusion, only under Qubes/Xen, something seems to block the scaling d=
rivers from working on this system.

For each of the configurations above, I am pasting the complete output of `=
xl dmesg`. Let me know if there is anything else I should do.

```
########################################################################
# `cpufreq=3Dxen:performance`

(XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
=C2=A0Xen 4.17.5
(XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508 (=
Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025
(XEN) Latest ChangeSet:
(XEN) build-id: d2dd0684651dcc833d35869ad2259cb6f0ba1d19
(XEN) Bootloader: GRUB 2.13
(XEN) Command line: placeholder cpufreq=3Dxen:performance,verbose loglvl=3D=
all dom0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab=
_max_frames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
(XEN) Xen image load base address: 0x79200000
(XEN) Video information:
(XEN) =C2=A0VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN) =C2=A0Found 0 MBR signatures
(XEN) =C2=A0Found 0 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 142 (0x8e), Stepping 10 (raw=
 000806ea)
(XEN) Multiboot-e820 RAM map:
(XEN) =C2=A0[0000000000000000, 0000000000000fff] (reserved)
(XEN) =C2=A0[0000000000001000, 000000000009ffff] (usable)
(XEN) =C2=A0[00000000000a0000, 00000000000fffff] (reserved)
(XEN) =C2=A0[0000000000100000, 000000007aa06fff] (usable)
(XEN) =C2=A0[000000007aa07000, 000000007fffffff] (reserved)
(XEN) =C2=A0[00000000e0000000, 00000000efffffff] (reserved)
(XEN) =C2=A0[00000000fd000000, 00000000fe00ffff] (reserved)
(XEN) =C2=A0[00000000fed10000, 00000000fed19fff] (reserved)
(XEN) =C2=A0[00000000fed80000, 00000000fed84fff] (reserved)
(XEN) =C2=A0[00000000fed90000, 00000000fed91fff] (reserved)
(XEN) =C2=A0[0000000100000000, 0000000a7fffffff] (usable)
(XEN) ACPI: RSDP 000F6010, 0024 (r2 COREv4)
(XEN) ACPI: XSDT 7AA0F0E0, 0064 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: FACP 7AA13020, 0114 (r6 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: DSDT 7AA0F280, 3D98 (r2 COREv4 COREBOOT 20110725 INTL 20241212)
(XEN) ACPI: FACS 7AA0F240, 0040
(XEN) ACPI: SSDT 7AA13140, 08EA (r2 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: MCFG 7AA13A30, 003C (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: LPIT 7AA13A70, 0094 (r0 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: APIC 7AA13B10, 0072 (r3 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: SPCR 7AA13B90, 0058 (r4 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: DMAR 7AA13BF0, 0088 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: HPET 7AA13C80, 0038 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) System RAM: 40873MB (41854616kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000a80000000
(XEN) Domain heap initialised
(XEN) SMBIOS 3.0 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wakeup_vec[7aa0f24c],=
 vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 high edge)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 840 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_mixed
(XEN) BSP microcode revision: 0x000000f6
(XEN) FIRMWARE BUG: CPU 06-8e-0a, ucode 0x000000f6: RTM_ALWAYS_ABORT vs RTM=
 mismatch
(XEN) CPU0: TSC: ratio: 150 / 2
(XEN) CPU0: bus: 100 MHz base: 1800 MHz max: 3400 MHz
(XEN) CPU0: 400 ... 1800 MHz
(XEN) xstate: size: 0x440 and states: 0x1f
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN) =C2=A0 Hardware hints: RSBA RFDS_NO
(XEN) =C2=A0 Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR SRB=
DS_CTRL GDS_CTRL
(XEN) =C2=A0 Compiled-in support: INDIRECT_THUNK RETURN_THUNK HARDEN_ARRAY =
HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN) =C2=A0 Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, O=
ther: SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
(XEN) =C2=A0 L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe =
address 8000000000
(XEN) =C2=A0 Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB EAGE=
R_FPU
(XEN) =C2=A0 Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU VERW
(XEN) =C2=A0 XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN) =C2=A0 PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN) =C2=A0load_precision_shift: 18
(XEN) =C2=A0load_window_shift: 30
(XEN) =C2=A0underload_balance_tolerance: 0
(XEN) =C2=A0overload_balance_tolerance: -3
(XEN) =C2=A0runqueues arrangement: socket
(XEN) =C2=A0cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 1799.989 MHz processor.
(XEN) Freed 1024kB unused BSS memory
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) cpu0: spurious 8259A interrupt: IRQ7
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d Snoop Control not enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN) =C2=A0- Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode. =C2=A0Using 1 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN) =C2=A0-> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 32 KiB.
(XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
(XEN) HWP: HW_FEEDBACK not supported
(XEN) Using HWP for cpufreq
(XEN) mwait-idle: MWAIT substates: 0x11142120
(XEN) mwait-idle: v0.4.1 model 0x8e
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN) =C2=A0- APIC MMIO access virtualisation
(XEN) =C2=A0- APIC TPR shadow
(XEN) =C2=A0- Extended Page Tables (EPT)
(XEN) =C2=A0- Virtual-Processor Identifiers (VPID)
(XEN) =C2=A0- Virtual NMI
(XEN) =C2=A0- MSR direct-access bitmap
(XEN) =C2=A0- Unrestricted Guest
(XEN) =C2=A0- VM Functions
(XEN) =C2=A0- Virtualisation Exceptions
(XEN) =C2=A0- Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) Brought up 4 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN) =C2=A0load_precision_shift: 18
(XEN) =C2=A0load_window_shift: 30
(XEN) =C2=A0underload_balance_tolerance: 0
(XEN) =C2=A0overload_balance_tolerance: -3
(XEN) =C2=A0runqueues arrangement: socket
(XEN) =C2=A0cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN) =C2=A0First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 1
(XEN) =C2=A0First cpu on runqueue, activating
(XEN) Adding cpu 3 to runqueue 1
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 744 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN) =C2=A0Xen =C2=A0kernel: 64-bit, lsb
(XEN) =C2=A0Dom0 kernel: 64-bit, PAE, lsb, paddr 0x200000 -> 0x3c00000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN) =C2=A0Dom0 alloc.: =C2=A0 0000000a58000000->0000000a5c000000 (1022144=
 pages to be allocated)
(XEN) =C2=A0Init. ramdisk: 0000000a7d8c0000->0000000a7ffff5b7
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN) =C2=A0Loaded kernel: ffffffff80200000->ffffffff83c00000
(XEN) =C2=A0Phys-Mach map: 0000008000000000->0000008000800000
(XEN) =C2=A0Start info: =C2=A0 =C2=A0ffffffff83c00000->ffffffff83c004b8
(XEN) =C2=A0Page tables: =C2=A0 ffffffff83c01000->ffffffff83c24000
(XEN) =C2=A0Boot stack: =C2=A0 =C2=A0ffffffff83c24000->ffffffff83c25000
(XEN) =C2=A0TOTAL: =C2=A0 =C2=A0 =C2=A0 =C2=A0 ffffffff80000000->ffffffff84=
000000
(XEN) =C2=A0ENTRY ADDRESS: ffffffff82b0de00
(XEN) Dom0 has maximum 4 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 668kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.2
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.6
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
(XEN) PCI add device 0000:00:1f.6
(XEN) PCI add device 0000:02:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:00:1f.1
(XEN) PCI remove device 0000:00:1f.1

########################################################################
# `cpufreq=3Ddom0-kernel dom0_vcpus_pin`

(XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
=C2=A0Xen 4.17.5
(XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508 (=
Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025
(XEN) Latest ChangeSet:
(XEN) build-id: d2dd0684651dcc833d35869ad2259cb6f0ba1d19
(XEN) Bootloader: GRUB 2.13
(XEN) Command line: placeholder cpufreq=3Ddom0-kernel,verbose dom0_vcpus_pi=
n loglvl=3Dall dom0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=
=3Doff gnttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-m=
ode edd=3Doff
(XEN) Xen image load base address: 0x79200000
(XEN) Video information:
(XEN) =C2=A0VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN) =C2=A0Found 0 MBR signatures
(XEN) =C2=A0Found 0 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 142 (0x8e), Stepping 10 (raw=
 000806ea)
(XEN) Multiboot-e820 RAM map:
(XEN) =C2=A0[0000000000000000, 0000000000000fff] (reserved)
(XEN) =C2=A0[0000000000001000, 000000000009ffff] (usable)
(XEN) =C2=A0[00000000000a0000, 00000000000fffff] (reserved)
(XEN) =C2=A0[0000000000100000, 000000007aa06fff] (usable)
(XEN) =C2=A0[000000007aa07000, 000000007fffffff] (reserved)
(XEN) =C2=A0[00000000e0000000, 00000000efffffff] (reserved)
(XEN) =C2=A0[00000000fd000000, 00000000fe00ffff] (reserved)
(XEN) =C2=A0[00000000fed10000, 00000000fed19fff] (reserved)
(XEN) =C2=A0[00000000fed80000, 00000000fed84fff] (reserved)
(XEN) =C2=A0[00000000fed90000, 00000000fed91fff] (reserved)
(XEN) =C2=A0[0000000100000000, 0000000a7fffffff] (usable)
(XEN) ACPI: RSDP 000F6010, 0024 (r2 COREv4)
(XEN) ACPI: XSDT 7AA0F0E0, 0064 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: FACP 7AA13020, 0114 (r6 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: DSDT 7AA0F280, 3D98 (r2 COREv4 COREBOOT 20110725 INTL 20241212)
(XEN) ACPI: FACS 7AA0F240, 0040
(XEN) ACPI: SSDT 7AA13140, 08EA (r2 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: MCFG 7AA13A30, 003C (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: LPIT 7AA13A70, 0094 (r0 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: APIC 7AA13B10, 0072 (r3 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: SPCR 7AA13B90, 0058 (r4 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: DMAR 7AA13BF0, 0088 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: HPET 7AA13C80, 0038 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) System RAM: 40873MB (41854616kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000a80000000
(XEN) Domain heap initialised
(XEN) SMBIOS 3.0 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wakeup_vec[7aa0f24c],=
 vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 high edge)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 840 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_mixed
(XEN) BSP microcode revision: 0x000000f6
(XEN) FIRMWARE BUG: CPU 06-8e-0a, ucode 0x000000f6: RTM_ALWAYS_ABORT vs RTM=
 mismatch
(XEN) CPU0: TSC: ratio: 150 / 2
(XEN) CPU0: bus: 100 MHz base: 1800 MHz max: 3400 MHz
(XEN) CPU0: 400 ... 1800 MHz
(XEN) xstate: size: 0x440 and states: 0x1f
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN) =C2=A0 Hardware hints: RSBA RFDS_NO
(XEN) =C2=A0 Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR SRB=
DS_CTRL GDS_CTRL
(XEN) =C2=A0 Compiled-in support: INDIRECT_THUNK RETURN_THUNK HARDEN_ARRAY =
HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN) =C2=A0 Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, O=
ther: SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
(XEN) =C2=A0 L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe =
address 8000000000
(XEN) =C2=A0 Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB EAGE=
R_FPU
(XEN) =C2=A0 Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU VERW
(XEN) =C2=A0 XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN) =C2=A0 PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN) =C2=A0load_precision_shift: 18
(XEN) =C2=A0load_window_shift: 30
(XEN) =C2=A0underload_balance_tolerance: 0
(XEN) =C2=A0overload_balance_tolerance: -3
(XEN) =C2=A0runqueues arrangement: socket
(XEN) =C2=A0cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 1800.002 MHz processor.
(XEN) Freed 1024kB unused BSS memory
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) cpu0: spurious 8259A interrupt: IRQ7
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d Snoop Control not enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN) =C2=A0- Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode. =C2=A0Using 1 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN) =C2=A0-> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 32 KiB.
(XEN) mwait-idle: MWAIT substates: 0x11142120
(XEN) mwait-idle: v0.4.1 model 0x8e
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN) =C2=A0- APIC MMIO access virtualisation
(XEN) =C2=A0- APIC TPR shadow
(XEN) =C2=A0- Extended Page Tables (EPT)
(XEN) =C2=A0- Virtual-Processor Identifiers (VPID)
(XEN) =C2=A0- Virtual NMI
(XEN) =C2=A0- MSR direct-access bitmap
(XEN) =C2=A0- Unrestricted Guest
(XEN) =C2=A0- VM Functions
(XEN) =C2=A0- Virtualisation Exceptions
(XEN) =C2=A0- Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) Brought up 4 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN) =C2=A0load_precision_shift: 18
(XEN) =C2=A0load_window_shift: 30
(XEN) =C2=A0underload_balance_tolerance: 0
(XEN) =C2=A0overload_balance_tolerance: -3
(XEN) =C2=A0runqueues arrangement: socket
(XEN) =C2=A0cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN) =C2=A0First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 1
(XEN) =C2=A0First cpu on runqueue, activating
(XEN) Adding cpu 3 to runqueue 1
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 744 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN) =C2=A0Xen =C2=A0kernel: 64-bit, lsb
(XEN) =C2=A0Dom0 kernel: 64-bit, PAE, lsb, paddr 0x200000 -> 0x3c00000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN) =C2=A0Dom0 alloc.: =C2=A0 0000000a58000000->0000000a5c000000 (1022144=
 pages to be allocated)
(XEN) =C2=A0Init. ramdisk: 0000000a7d8c0000->0000000a7ffff5b7
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN) =C2=A0Loaded kernel: ffffffff80200000->ffffffff83c00000
(XEN) =C2=A0Phys-Mach map: 0000008000000000->0000008000800000
(XEN) =C2=A0Start info: =C2=A0 =C2=A0ffffffff83c00000->ffffffff83c004b8
(XEN) =C2=A0Page tables: =C2=A0 ffffffff83c01000->ffffffff83c24000
(XEN) =C2=A0Boot stack: =C2=A0 =C2=A0ffffffff83c24000->ffffffff83c25000
(XEN) =C2=A0TOTAL: =C2=A0 =C2=A0 =C2=A0 =C2=A0 ffffffff80000000->ffffffff84=
000000
(XEN) =C2=A0ENTRY ADDRESS: ffffffff82b0de00
(XEN) Dom0 has maximum 4 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 668kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.2
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.6
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
(XEN) PCI add device 0000:00:1f.6
(XEN) PCI add device 0000:02:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:00:1f.1
(XEN) PCI remove device 0000:00:1f.1

########################################################################
# `cpufreq=3Dxen:hwp`

(XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
=C2=A0Xen 4.17.5
(XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508 (=
Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025
(XEN) Latest ChangeSet:
(XEN) build-id: d2dd0684651dcc833d35869ad2259cb6f0ba1d19
(XEN) Bootloader: GRUB 2.13
(XEN) Command line: placeholder cpufreq=3Dxen:hwp,verbose loglvl=3Dall dom0=
_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_fra=
mes=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
(XEN) Xen image load base address: 0x79200000
(XEN) Video information:
(XEN) =C2=A0VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN) =C2=A0Found 0 MBR signatures
(XEN) =C2=A0Found 0 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 142 (0x8e), Stepping 10 (raw=
 000806ea)
(XEN) Multiboot-e820 RAM map:
(XEN) =C2=A0[0000000000000000, 0000000000000fff] (reserved)
(XEN) =C2=A0[0000000000001000, 000000000009ffff] (usable)
(XEN) =C2=A0[00000000000a0000, 00000000000fffff] (reserved)
(XEN) =C2=A0[0000000000100000, 000000007aa06fff] (usable)
(XEN) =C2=A0[000000007aa07000, 000000007fffffff] (reserved)
(XEN) =C2=A0[00000000e0000000, 00000000efffffff] (reserved)
(XEN) =C2=A0[00000000fd000000, 00000000fe00ffff] (reserved)
(XEN) =C2=A0[00000000fed10000, 00000000fed19fff] (reserved)
(XEN) =C2=A0[00000000fed80000, 00000000fed84fff] (reserved)
(XEN) =C2=A0[00000000fed90000, 00000000fed91fff] (reserved)
(XEN) =C2=A0[0000000100000000, 0000000a7fffffff] (usable)
(XEN) ACPI: RSDP 000F6010, 0024 (r2 COREv4)
(XEN) ACPI: XSDT 7AA0F0E0, 0064 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: FACP 7AA13020, 0114 (r6 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: DSDT 7AA0F280, 3D98 (r2 COREv4 COREBOOT 20110725 INTL 20241212)
(XEN) ACPI: FACS 7AA0F240, 0040
(XEN) ACPI: SSDT 7AA13140, 08EA (r2 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: MCFG 7AA13A30, 003C (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: LPIT 7AA13A70, 0094 (r0 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: APIC 7AA13B10, 0072 (r3 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: SPCR 7AA13B90, 0058 (r4 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: DMAR 7AA13BF0, 0088 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) ACPI: HPET 7AA13C80, 0038 (r1 COREv4 COREBOOT =C2=A0 =C2=A0 =C2=A0 =
=C2=A00 CORE 20241212)
(XEN) System RAM: 40873MB (41854616kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000a80000000
(XEN) Domain heap initialised
(XEN) SMBIOS 3.0 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wakeup_vec[7aa0f24c],=
 vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 high edge)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 4 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 120 GSI, 840 MSI/MSI-X
(XEN) Switched to APIC driver x2apic_mixed
(XEN) BSP microcode revision: 0x000000f6
(XEN) FIRMWARE BUG: CPU 06-8e-0a, ucode 0x000000f6: RTM_ALWAYS_ABORT vs RTM=
 mismatch
(XEN) CPU0: TSC: ratio: 150 / 2
(XEN) CPU0: bus: 100 MHz base: 1800 MHz max: 3400 MHz
(XEN) CPU0: 400 ... 1800 MHz
(XEN) xstate: size: 0x440 and states: 0x1f
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN) =C2=A0 Hardware hints: RSBA RFDS_NO
(XEN) =C2=A0 Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR SRB=
DS_CTRL GDS_CTRL
(XEN) =C2=A0 Compiled-in support: INDIRECT_THUNK RETURN_THUNK HARDEN_ARRAY =
HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN) =C2=A0 Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, O=
ther: SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
(XEN) =C2=A0 L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe =
address 8000000000
(XEN) =C2=A0 Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB EAGE=
R_FPU
(XEN) =C2=A0 Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU VERW
(XEN) =C2=A0 XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN) =C2=A0 PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN) =C2=A0load_precision_shift: 18
(XEN) =C2=A0load_window_shift: 30
(XEN) =C2=A0underload_balance_tolerance: 0
(XEN) =C2=A0overload_balance_tolerance: -3
(XEN) =C2=A0runqueues arrangement: socket
(XEN) =C2=A0cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 1799.993 MHz processor.
(XEN) Freed 1024kB unused BSS memory
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) cpu0: spurious 8259A interrupt: IRQ7
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d Snoop Control not enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN) =C2=A0- Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode. =C2=A0Using 1 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN) =C2=A0-> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 32 KiB.
(XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
(XEN) HWP: HW_FEEDBACK not supported
(XEN) Using HWP for cpufreq
(XEN) mwait-idle: MWAIT substates: 0x11142120
(XEN) mwait-idle: v0.4.1 model 0x8e
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN) =C2=A0- APIC MMIO access virtualisation
(XEN) =C2=A0- APIC TPR shadow
(XEN) =C2=A0- Extended Page Tables (EPT)
(XEN) =C2=A0- Virtual-Processor Identifiers (VPID)
(XEN) =C2=A0- Virtual NMI
(XEN) =C2=A0- MSR direct-access bitmap
(XEN) =C2=A0- Unrestricted Guest
(XEN) =C2=A0- VM Functions
(XEN) =C2=A0- Virtualisation Exceptions
(XEN) =C2=A0- Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) Brought up 4 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN) =C2=A0load_precision_shift: 18
(XEN) =C2=A0load_window_shift: 30
(XEN) =C2=A0underload_balance_tolerance: 0
(XEN) =C2=A0overload_balance_tolerance: -3
(XEN) =C2=A0runqueues arrangement: socket
(XEN) =C2=A0cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN) =C2=A0First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 1
(XEN) =C2=A0First cpu on runqueue, activating
(XEN) Adding cpu 3 to runqueue 1
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 744 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN) =C2=A0Xen =C2=A0kernel: 64-bit, lsb
(XEN) =C2=A0Dom0 kernel: 64-bit, PAE, lsb, paddr 0x200000 -> 0x3c00000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN) =C2=A0Dom0 alloc.: =C2=A0 0000000a58000000->0000000a5c000000 (1022144=
 pages to be allocated)
(XEN) =C2=A0Init. ramdisk: 0000000a7d8c0000->0000000a7ffff5b7
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN) =C2=A0Loaded kernel: ffffffff80200000->ffffffff83c00000
(XEN) =C2=A0Phys-Mach map: 0000008000000000->0000008000800000
(XEN) =C2=A0Start info: =C2=A0 =C2=A0ffffffff83c00000->ffffffff83c004b8
(XEN) =C2=A0Page tables: =C2=A0 ffffffff83c01000->ffffffff83c24000
(XEN) =C2=A0Boot stack: =C2=A0 =C2=A0ffffffff83c24000->ffffffff83c25000
(XEN) =C2=A0TOTAL: =C2=A0 =C2=A0 =C2=A0 =C2=A0 ffffffff80000000->ffffffff84=
000000
(XEN) =C2=A0ENTRY ADDRESS: ffffffff82b0de00
(XEN) Dom0 has maximum 4 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 668kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.2
(XEN) PCI add device 0000:00:1c.0
(XEN) PCI add device 0000:00:1c.6
(XEN) PCI add device 0000:00:1d.0
(XEN) PCI add device 0000:00:1f.0
(XEN) PCI add device 0000:00:1f.2
(XEN) PCI add device 0000:00:1f.3
(XEN) PCI add device 0000:00:1f.6
(XEN) PCI add device 0000:02:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:00:1f.1
(XEN) PCI remove device 0000:00:1f.1
```


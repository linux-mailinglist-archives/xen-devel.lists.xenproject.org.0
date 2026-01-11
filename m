Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA505D0E68A
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jan 2026 09:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199739.1515935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ver3p-0007Ck-5J; Sun, 11 Jan 2026 08:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199739.1515935; Sun, 11 Jan 2026 08:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ver3p-00079f-1b; Sun, 11 Jan 2026 08:44:33 +0000
Received: by outflank-mailman (input) for mailman id 1199739;
 Sun, 11 Jan 2026 08:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKt0=7Q=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1ver3m-00079X-AE
 for xen-devel@lists.xenproject.org; Sun, 11 Jan 2026 08:44:31 +0000
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch
 [109.224.244.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd28f24-eec9-11f0-b15e-2bf370ae4941;
 Sun, 11 Jan 2026 09:44:27 +0100 (CET)
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
X-Inumbo-ID: bcd28f24-eec9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1768121066; x=1768380266;
	bh=sevsMZJLYMUqtxnrgORxu7J5MIpUODntARyXXjPMWlw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VTBYt5Gh4H1qJVAU8V3AdsemGp3UCx71qthh+QaR8dJYUCcEmu37sucpe4A1fHsUf
	 abV+CKhnv7Mslzx+ox1ie+EohccuAg2qWzgQIsEyQt5uWkPB/t3oSGDpXj1XhxfnkW
	 HsCqtkJTFAmM8sYpUhqZKCyzjLZIT2D51kikeP+dNlTi1lnC5Zx1oHrHbR8u6npEHW
	 ZHaCjSPBbZNnhn308E9fg3fDZYu2HAmyeg6TJON5ml/EU6Lr3XLhOb/qaJ7b5g+MEL
	 xYjUNeoXNH2INmc3X+jvsgSqzEPHLXnPUejn/gefiPMm5Xk+1hJRSs7/jjQgnMrDWJ
	 wa62kLGRzuJ3g==
Date: Sun, 11 Jan 2026 08:44:22 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me>
In-Reply-To: <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com> <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me> <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com> <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me> <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com> <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me> <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: d1e2ba194983e9292fa5991c3edc236d5e3bcb41
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, January 8th, 2026 at 7:46 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

> > The same is also true under Debian Live; does it mean that frequency sc=
aling, since it seems to be working under Debian Live, doesn't always rely =
on this?
>=20
>=20
> Yes, that's possible afaik. Which driver is in use there?

`/sys/devices/system/cpu/cpu0/scaling_driver` shows `intel_pstate`; confirm=
ed also using `dmesg`, which shows Intel P-state initialisation and HWP bei=
ng enabled.

> > Maybe also with Xen's command line try cpufreq=3Dxen:no-hwp to disable
> > HWP and see if the regular ACPI cpufreq driver works better

Following from Marek's message elsewhwere in the thread, I now tried adding=
 in grub the correct Xen flag to disable HWP on Qubes: `cpufreq=3Dxen,no-hw=
p`. I am pasting below the output of `xl dmesg`. It seems it no longer repo=
rts HWP being enabled. However, `xenpm get-cpufreq-para` still says "failed=
 to get cpufreq parameter", `xenpm get-cpufreq-states` returns nothing.


```
(XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
 Xen 4.17.5
(XEN) Xen version 4.17.5 (mockbuild@[unknown]) (gcc (GCC) 12.3.1 20230508 (=
Red Hat 12.3.1-1)) debug=3Dn Fri Aug 22 16:12:56 CEST 2025
(XEN) Latest ChangeSet:=20
(XEN) build-id: d2dd0684651dcc833d35869ad2259cb6f0ba1d19
(XEN) Bootloader: GRUB 2.13
(XEN) Command line: placeholder cpufreq=3Dxen,no-hwp,verbose loglvl=3Dall d=
om0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_=
frames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
(XEN) Xen image load base address: 0x79200000
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 0 EDD information structures
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 142 (0x8e), Stepping 10 (raw=
 000806ea)
(XEN) Multiboot-e820 RAM map:
(XEN)  [0000000000000000, 0000000000000fff] (reserved)
(XEN)  [0000000000001000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 000000007aa06fff] (usable)
(XEN)  [000000007aa07000, 000000007fffffff] (reserved)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000fd000000, 00000000fe00ffff] (reserved)
(XEN)  [00000000fed10000, 00000000fed19fff] (reserved)
(XEN)  [00000000fed80000, 00000000fed84fff] (reserved)
(XEN)  [00000000fed90000, 00000000fed91fff] (reserved)
(XEN)  [0000000100000000, 0000000a7fffffff] (usable)
(XEN) ACPI: RSDP 000F6010, 0024 (r2 COREv4)
(XEN) ACPI: XSDT 7AA0F0E0, 0064 (r1 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: FACP 7AA13020, 0114 (r6 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: DSDT 7AA0F280, 3D98 (r2 COREv4 COREBOOT 20110725 INTL 20241212)
(XEN) ACPI: FACS 7AA0F240, 0040
(XEN) ACPI: SSDT 7AA13140, 08EA (r2 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: MCFG 7AA13A30, 003C (r1 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: LPIT 7AA13A70, 0094 (r0 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: APIC 7AA13B10, 0072 (r3 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: SPCR 7AA13B90, 0058 (r4 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: DMAR 7AA13BF0, 0088 (r1 COREv4 COREBOOT        0 CORE 20241212)
(XEN) ACPI: HPET 7AA13C80, 0038 (r1 COREv4 COREBOOT        0 CORE 20241212)
(XEN) System RAM: 40873MB (41854616kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000a80000000
(XEN) Domain heap initialised
(XEN) SMBIOS 3.0 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x1808 (24 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:1804,1:0], pm1x_evt[1:1800,1:0]
(XEN) ACPI:             wakeup_vec[7aa0f24c], vec_size[20]
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
(XEN)   Hardware hints: RSBA RFDS_NO
(XEN)   Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR SRBDS_CT=
RL GDS_CTRL
(XEN)   Compiled-in support: INDIRECT_THUNK RETURN_THUNK HARDEN_ARRAY HARDE=
N_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, Other:=
 SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe addre=
ss 8000000000
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB EAGER_FPU
(XEN)   Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU VERW
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Disabling HPET for being unreliable
(XEN) Platform timer is 3.580MHz ACPI PM Timer
(XEN) Detected 1799.991 MHz processor.
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
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode.  Using 1 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D0 pin2=3D0
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 32 KiB.
(XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
(XEN) HWP: HW_FEEDBACK not supported
(XEN) mwait-idle: MWAIT substates: 0x11142120
(XEN) mwait-idle: v0.4.1 model 0x8e
(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d04042bf70 -> ffff82d04043b3f2
(XEN) Brought up 4 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 1
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 3 to runqueue 1
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 744 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x200000 -> 0x3c00000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000a58000000->0000000a5c000000 (1022144 pages to =
be allocated)
(XEN)  Init. ramdisk: 0000000a7d8c0000->0000000a7ffff5b7
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff80200000->ffffffff83c00000
(XEN)  Phys-Mach map: 0000008000000000->0000008000800000
(XEN)  Start info:    ffffffff83c00000->ffffffff83c004b8
(XEN)  Page tables:   ffffffff83c01000->ffffffff83c24000
(XEN)  Boot stack:    ffffffff83c24000->ffffffff83c25000
(XEN)  TOTAL:         ffffffff80000000->ffffffff84000000
(XEN)  ENTRY ADDRESS: ffffffff82b0de00
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



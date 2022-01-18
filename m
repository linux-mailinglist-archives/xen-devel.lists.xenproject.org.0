Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE945492457
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 12:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258446.445095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mNU-0004lY-Jq; Tue, 18 Jan 2022 11:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258446.445095; Tue, 18 Jan 2022 11:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9mNU-0004iF-FS; Tue, 18 Jan 2022 11:10:16 +0000
Received: by outflank-mailman (input) for mailman id 258446;
 Tue, 18 Jan 2022 11:10:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNq4=SC=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1n9mNR-0004i1-Du
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 11:10:14 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32faa34a-784f-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 12:10:09 +0100 (CET)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:46966
 helo=[172.16.1.50])
 by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1n9m7x-0005gz-AN; Tue, 18 Jan 2022 11:54:13 +0100
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
X-Inumbo-ID: 32faa34a-784f-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fweT58g+nzRNYrbee5HhkkpgpSfuMakuvHFsyP2sN3o=; b=lcIKpN1PT4rkKIUhL6HOY91Q9z
	kkxzSICIEpfdJi8/abkot2dF0i4yscsWOoAZjshLiilgnc8V1oEGTRG5hyVfHd+iO3Sdw/O548VRN
	iHjosC+q4F4nggOh89mDVn1nZtQbXIvq2QfdgGZgCcVemFeXBD+Qs2p5HZIo6VrjmIo8=;
From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Regression booting Linux kernel 5.16.1 under Xen: Failed to update
 kernel mapping for mfn=6930582 pfn=524288
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <d3ba970c-3930-fb4e-4fd2-4246700fd11e@eikelenboom.it>
Date: Tue, 18 Jan 2022 11:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: nl-NL
Content-Transfer-Encoding: 7bit

L.S.,

Both Linux kernel 5.16.0 and 5.16.1 fail to boot as Dom0 under xen-unstable and crash early in boot on my hardware.
With Linux 5.15.13 it boots fine. Serial log is below.

--
Sander



  __  __            _  _    _ _____                  _        _     _
  \ \/ /___ _ __   | || |  / |___  | _   _ _ __  ___| |_ __ _| |__ | | ___
   \  // _ \ '_ \  | || |_ | |  / /_| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
   /  \  __/ | | | |__   _|| | / /__| |_| | | | \__ \ || (_| | |_) | |  __/
  /_/\_\___|_| |_|    |_|(_)_|/_/    \__,_|_| |_|___/\__\__,_|_.__/|_|\___|

(XEN) [0000001b0dcbb4f3] Xen version 4.17-unstable (root@dyndns.org) (gcc (Debian 8.3.0-6) 8.3.0) debug=y Mon Jan 10 12:12:50 CET 2022
(XEN) [0000001b148a4b40] Latest ChangeSet: Thu Jan 6 16:12:39 2022 +0100 git:ced5685208
(XEN) [0000001b18f43943] build-id: b35a2db45523c90536e3926c378d9e07cc54a5dd
(XEN) [0000001b1cc5ab10] Bootloader: GRUB 2.02+dfsg1-20+deb10u4
(XEN) [0000001b1ffedeb8] Command line: dom0_mem=2048M,max:2048M loglvl=all guest_loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64 reboot=a
(XEN) [0000001b2ef8ee5e] Xen image load base address: 0
(XEN) [0000001b31cc8d9a] Video information:
(XEN) [0000001b3407cb63]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [0000001b374dc4b3]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [0000001b3b2be9cd] Disc information:
(XEN) [0000001b3d5a8f53]  Found 4 MBR signatures
(XEN) [0000001b3fd55c5e]  Found 4 EDD information structures
(XEN) [0000001b42e8717e] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [0000001b48040516] Xen-e820 RAM map:
(XEN) [0000001b4a3297f3]  [0000000000000000, 00000000000963ff] (usable)
(XEN) [0000001b4dd165de]  [0000000000096400, 000000000009ffff] (reserved)
(XEN) [0000001b51899605]  [00000000000e4000, 00000000000fffff] (reserved)
(XEN) [0000001b5541b55a]  [0000000000100000, 00000000c7f8ffff] (usable)
(XEN) [0000001b58e06b73]  [00000000c7f90000, 00000000c7f9dfff] (ACPI data)
(XEN) [0000001b5ca54d9b]  [00000000c7f9e000, 00000000c7fdffff] (ACPI NVS)
(XEN) [0000001b605d8132]  [00000000c7fe0000, 00000000c7ffffff] (reserved)
(XEN) [0000001b641590e5]  [00000000ffe00000, 00000000ffffffff] (reserved)
(XEN) [0000001b67cdc533]  [0000000100000000, 00000006b7ffffff] (usable)
(XEN) [0000001b715ce9d2] New Xen image base address: 0xc7800000
(XEN) [0000001b7495f3bd] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [0000001b77c280ad] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001b7c853af0] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001b81480525] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [0000001b860aa800] ACPI: FACS C7F9E000, 0040
(XEN) [0000001b889ee203] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001b8d61a07a] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000001b9224616d] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001b96e720ad] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001b9ba9e2ed] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [0000001ba06ca34d] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000001ba52f67cd] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [0000001ba9f22920] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000001baeb4e776] System RAM: 26623MB (27262104kB)
(XEN) [0000001bbc9a237a] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000001bbf3aeee6] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000001bc2415b3a] SRAT: Node 0 PXM 0 100000000-6b8000000
(XEN) [0000001bc57a825a] NUMA: Allocated memnodemap from 6a4b2f000 - 6a4b36000
(XEN) [0000001bc97225cb] NUMA: Using 8 for the hash shift.
(XEN) [0000001c2f923edd] Domain heap initialised
(XEN) [0000001c320d106a] Allocated console ring of 128 KiB.
(XEN) [0000001c483551ed] vesafb: framebuffer at 0x00000000fb000000, mapped to 0xffff82c000201000, using 6144k, total 14336k
(XEN) [0000001c4e684dee] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [0000001c5285ece5] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
(XEN) [0000001c5a9b3d32] found SMP MP-table at 000ff780
(XEN) [0000001c5d6eabd5] DMI present.
(XEN) [0000001c5f5dd0ca] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [0000001c63c7bf86] AMD-Vi: Using IVHD type 0x10
(XEN) [0000001c6681efaa] AMD-Vi: EFRSup not set in ACPI table; will fall back to hardware
(XEN) [0000001c6b052ea5] AMD-Vi: Found MSI capability block at 0x54
(XEN) [0000001c6e713f6d] Using APIC driver default
(XEN) [0000001c71055a85] ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) [0000001c744b2ac6] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [0000001c788254c0] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [0000001c7c6d3df3] ACPI: Local APIC address 0xfee00000
(XEN) [0000001c7f806a52] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [0000001c83915965] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [0000001c87fb44ae] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [0000001c8c18f965] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000001c908f88b6] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000001c94ad3815] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [0000001c98e45f36] ACPI: IRQ0 used by override.
(XEN) [0000001c9b9eae76] ACPI: IRQ2 used by override.
(XEN) [0000001c9e58e016] ACPI: IRQ9 used by override.
(XEN) [0000001ca11315cd] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [0000001ca44c59e3] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [0000001ca8f5aa0d] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000001cac9468bd] Using ACPI (MADT) for SMP configuration information
(XEN) [0000001cb072a3bb] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [0000001cb39f1ba2] IRQ limits: 56 GSI, 1192 MSI/MSI-X
(XEN) [0000001cb6a593ca] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc, date = 2011-10-24
(XEN) [0000001cbbe749c3] No SSBD controls available
(XEN) [0000001cbe881d6a] CPU0: 3200 (800 ... 3600) MHz
(XEN) [0000001cc14f20bb] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [0000001cc5073336] Speculative mitigation facilities:
(XEN) [0000001cc80d975b]   Hardware hints:
(XEN) [0000001cca3c3272]   Hardware features:
(XEN) [0000001ccc90e37a]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [0000001cd06f22fe]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other: BRANCH_HARDEN
(XEN) [0000001cd531e0a2]   Support for HVM VMs: RSB
(XEN) [0000001cd7d2c6e2]   Support for PV VMs: RSB
(XEN) [0000001cda66e30a]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [0000001cdf1cee12]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [0000001ce2e1d868] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000001ce6ccc4b2] Initializing Credit2 scheduler
(XEN) [0000001ce9a05b18]  load_precision_shift: 18
(XEN) [0000001cec347966]  load_window_shift: 30
(XEN) [0000001ceea29722]  underload_balance_tolerance: 0
(XEN) [0000001cf182efd8]  overload_balance_tolerance: -3
(XEN) [0000001cf46347c2]  runqueues arrangement: socket
(XEN) [0000001cf736e2eb]  cap enforcement granularity: 10ms
(XEN) [0000001cfa3d5730] load tracking window length 1073741824 ns
(XEN) [0000001d07141acb] Platform timer is 14.318MHz HPET
(XEN) [    3.477854] Detected 3200.139 MHz processor.
(XEN) [    3.494274] Freed 1024kB unused BSS memory
(XEN) [    3.508052] alt table ffff82d040492650 -> ffff82d04049ffa4
(XEN) [    3.534558] AMD-Vi: ACPI Table:
(XEN) [    3.545478] AMD-Vi:  Signature IVRS
(XEN) [    3.557438] AMD-Vi:  Length 0x108
(XEN) [    3.568877] AMD-Vi:  Revision 0x1
(XEN) [    3.580318] AMD-Vi:  CheckSum 0x79
(XEN) [    3.592016] AMD-Vi:  OEM_Id AMD
(XEN) [    3.603457] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.616714] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.630494] AMD-Vi:  Creator_Id AMD
(XEN) [    3.642715] AMD-Vi:  Creator_Revision 0
(XEN) [    3.655714] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.676253] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.700015] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.719332] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.743850] AMD-Vi: IVHD Device Entry: type 0x2 id 0xe00 flags 0
(XEN) [    3.768626] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.793103] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.817828] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.842319] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.867110] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.891626] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.916351] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.940829] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.965581] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.990045] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    4.014719] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    4.035480] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    4.059839] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    4.084487] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    4.109095] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    4.133741] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    4.158439] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    4.183125] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    4.207553] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    4.232185] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    4.252934] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    4.277294] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.301668] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.321816] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.346128] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.366276] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.391391] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.415726] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.440086] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.464526] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.487613] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.512531] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.536127] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.560551] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.584938] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.609275] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.633895] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.658230] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.678431] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.701531] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.726205] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.751684] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.775628] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.801808] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.826078] AMD-Vi: using 256-entry cmd ring(s)
(XEN) [    4.846475] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.864089] I/O virtualisation enabled
(XEN) [    4.882067]  - Dom0 mode: Relaxed
(XEN) [    4.898706] Interrupt remapping enabled
(XEN) [    4.916931] nr_sockets: 1
(XEN) [    4.931504] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [    4.954773] ENABLING IO-APIC IRQs
(XEN) [    4.971491]  -> Using new ACK method
(XEN) [    4.989169] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2022-01-18 10:40:41.000] HVM: ASIDs enabled.
(XEN) [2022-01-18 10:40:41.006] SVM: Supported advanced features:
(XEN) [2022-01-18 10:40:41.012]  - Nested Page Tables (NPT)
(XEN) [2022-01-18 10:40:41.018]  - Last Branch Record (LBR) Virtualisation
(XEN) [2022-01-18 10:40:41.024]  - Next-RIP Saved on #VMEXIT
(XEN) [2022-01-18 10:40:41.030]  - Pause-Intercept Filter
(XEN) [2022-01-18 10:40:41.036] HVM: SVM enabled
(XEN) [2022-01-18 10:40:41.042] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2022-01-18 10:40:41.048] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2022-01-18 10:40:41.055] alt table ffff82d040492650 -> ffff82d04049ffa4
(XEN) [2022-01-18 10:40:35.778] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc, date = 2011-10-24
(XEN) [2022-01-18 10:40:35.778] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc, date = 2011-10-24
(XEN) [2022-01-18 10:40:35.778] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc, date = 2011-10-24
(XEN) [2022-01-18 10:40:35.778] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc, date = 2011-10-24
(XEN) [2022-01-18 10:40:35.778] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc, date = 2011-10-24
(XEN) [2022-01-18 10:40:41.145] Brought up 6 CPUs
(XEN) [2022-01-18 10:40:41.158] Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) [2022-01-18 10:40:41.164] Adding cpu 0 to runqueue 0
(XEN) [2022-01-18 10:40:41.170]  First cpu on runqueue, activating
(XEN) [2022-01-18 10:40:41.176] Adding cpu 1 to runqueue 0
(XEN) [2022-01-18 10:40:41.182] Adding cpu 2 to runqueue 0
(XEN) [2022-01-18 10:40:41.189] Adding cpu 3 to runqueue 0
(XEN) [2022-01-18 10:40:41.195] Adding cpu 4 to runqueue 0
(XEN) [2022-01-18 10:40:41.201] Adding cpu 5 to runqueue 0
(XEN) [2022-01-18 10:40:41.207] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2022-01-18 10:40:41.213] mcheck_poll: Machine check polling timer started.
(XEN) [2022-01-18 10:40:41.219] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2022-01-18 10:40:41.226] Running stub recovery selftests...
(XEN) [2022-01-18 10:40:41.232] Fixup #UD[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d040392839
(XEN) [2022-01-18 10:40:41.238] Fixup #GP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d040392839
(XEN) [2022-01-18 10:40:41.245] Fixup #SS[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d040392839
(XEN) [2022-01-18 10:40:41.251] Fixup #BP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d040392839
(XEN) [2022-01-18 10:40:41.278] NX (Execute Disable) protection active
(XEN) [2022-01-18 10:40:41.284] Multiple initrd candidates, picking module #1
(XEN) [2022-01-18 10:40:41.290] Dom0 has maximum 680 PIRQs
(XEN) [2022-01-18 10:40:41.297] *** Building a PV Dom0 ***
(XEN) [2022-01-18 10:40:41.522] ELF: phdr: paddr=0x1000000 memsz=0x1ca1a40
(XEN) [2022-01-18 10:40:41.528] ELF: phdr: paddr=0x2e00000 memsz=0xbed000
(XEN) [2022-01-18 10:40:41.534] ELF: phdr: paddr=0x39ed000 memsz=0x2c458
(XEN) [2022-01-18 10:40:41.541] ELF: phdr: paddr=0x3a1a000 memsz=0x40c000
(XEN) [2022-01-18 10:40:41.547] ELF: memory: 0x1000000 -> 0x3e26000
(XEN) [2022-01-18 10:40:41.554] ELF: note: GUEST_OS = "linux"
(XEN) [2022-01-18 10:40:41.560] ELF: note: GUEST_VERSION = "2.6"
(XEN) [2022-01-18 10:40:41.566] ELF: note: XEN_VERSION = "xen-3.0"
(XEN) [2022-01-18 10:40:41.573] ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) [2022-01-18 10:40:41.579] ELF: note: INIT_P2M = 0x8000000000
(XEN) [2022-01-18 10:40:41.586] ELF: note: ENTRY = 0xffffffff83a1a160
(XEN) [2022-01-18 10:40:41.592] ELF: note: HYPERCALL_PAGE = 0xffffffff821da000
(XEN) [2022-01-18 10:40:41.598] ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb"
(XEN) [2022-01-18 10:40:41.605] ELF: note: SUPPORTED_FEATURES = 0x8801
(XEN) [2022-01-18 10:40:41.611] ELF: note: PAE_MODE = "yes"
(XEN) [2022-01-18 10:40:41.618] ELF: note: LOADER = "generic"
(XEN) [2022-01-18 10:40:41.624] ELF: note: unknown (0xd)
(XEN) [2022-01-18 10:40:41.630] ELF: note: SUSPEND_CANCEL = 0x1
(XEN) [2022-01-18 10:40:41.637] ELF: note: MOD_START_PFN = 0x1
(XEN) [2022-01-18 10:40:41.643] ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) [2022-01-18 10:40:41.650] ELF: note: PADDR_OFFSET = 0
(XEN) [2022-01-18 10:40:41.656] ELF: note: PHYS32_ENTRY = 0x10004a0
(XEN) [2022-01-18 10:40:41.663] ELF: addresses:
(XEN) [2022-01-18 10:40:41.669]     virt_base        = 0xffffffff80000000
(XEN) [2022-01-18 10:40:41.676]     elf_paddr_offset = 0x0
(XEN) [2022-01-18 10:40:41.682]     virt_offset      = 0xffffffff80000000
(XEN) [2022-01-18 10:40:41.689]     virt_kstart      = 0xffffffff81000000
(XEN) [2022-01-18 10:40:41.695]     virt_kend        = 0xffffffff83e26000
(XEN) [2022-01-18 10:40:41.702]     virt_entry       = 0xffffffff83a1a160
(XEN) [2022-01-18 10:40:41.709]     p2m_base         = 0x8000000000
(XEN) [2022-01-18 10:40:41.715]  Xen  kernel: 64-bit, lsb
(XEN) [2022-01-18 10:40:41.722]  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x3e26000
(XEN) [2022-01-18 10:40:41.729] PHYSICAL MEMORY ARRANGEMENT:
(XEN) [2022-01-18 10:40:41.736]  Dom0 alloc.:   000000069c000000->00000006a0000000 (500421 pages to be allocated)
(XEN) [2022-01-18 10:40:41.743]  Init. ramdisk: 00000006b62c1000->00000006b7ffb1b8
(XEN) [2022-01-18 10:40:41.750] VIRTUAL MEMORY ARRANGEMENT:
(XEN) [2022-01-18 10:40:41.757]  Loaded kernel: ffffffff81000000->ffffffff83e26000
(XEN) [2022-01-18 10:40:41.763]  Phys-Mach map: 0000008000000000->0000008000400000
(XEN) [2022-01-18 10:40:41.770]  Start info:    ffffffff83e26000->ffffffff83e264b8
(XEN) [2022-01-18 10:40:41.777]  Page tables:   ffffffff83e27000->ffffffff83e4a000
(XEN) [2022-01-18 10:40:41.784]  Boot stack:    ffffffff83e4a000->ffffffff83e4b000
(XEN) [2022-01-18 10:40:41.790]  TOTAL:         ffffffff80000000->ffffffff84000000
(XEN) [2022-01-18 10:40:41.797]  ENTRY ADDRESS: ffffffff83a1a160
(XEN) [2022-01-18 10:40:41.804] Dom0 has maximum 6 VCPUs
(XEN) [2022-01-18 10:40:41.811] ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82ca1a40
(XEN) [2022-01-18 10:40:41.839] ELF: phdr 1 at 0xffffffff82e00000 -> 0xffffffff839ed000
(XEN) [2022-01-18 10:40:41.854] ELF: phdr 2 at 0xffffffff839ed000 -> 0xffffffff83a19458
(XEN) [2022-01-18 10:40:41.861] ELF: phdr 3 at 0xffffffff83a1a000 -> 0xffffffff83b79000
(XEN) [2022-01-18 10:40:43.557] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.564] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.571] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.579] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.586] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.593] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.601] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.608] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.616] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.624] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.631] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.639] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.647] AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.655] AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.663] AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.671] AMD-Vi: Setup I/O page table: device id = 0xa2, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.680] AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.688] AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.697] AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.705] AMD-Vi: Setup I/O page table: device id = 0xa8, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.714] AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.723] AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.732] AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) [2022-01-18 10:40:43.741] AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) [2022-01-18 10:40:43.750] AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) [2022-01-18 10:40:43.759] AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) [2022-01-18 10:40:43.768] AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) [2022-01-18 10:40:43.776] AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.786] AMD-Vi: Setup I/O page table: device id = 0x401, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.795] AMD-Vi: Setup I/O page table: device id = 0x402, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.804] AMD-Vi: Setup I/O page table: device id = 0x403, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.814] AMD-Vi: Setup I/O page table: device id = 0x404, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.823] AMD-Vi: Setup I/O page table: device id = 0x405, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.833] AMD-Vi: Setup I/O page table: device id = 0x406, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.843] AMD-Vi: Setup I/O page table: device id = 0x407, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.853] AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.863] AMD-Vi: Setup I/O page table: device id = 0x608, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.873] AMD-Vi: Setup I/O page table: device id = 0x610, type = 0x2, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.884] AMD-Vi: Setup I/O page table: device id = 0x700, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.894] AMD-Vi: Setup I/O page table: device id = 0x800, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.905] AMD-Vi: Setup I/O page table: device id = 0x900, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.915] AMD-Vi: Setup I/O page table: device id = 0x901, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.926] AMD-Vi: Setup I/O page table: device id = 0x902, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.937] AMD-Vi: Setup I/O page table: device id = 0x903, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.948] AMD-Vi: Setup I/O page table: device id = 0x904, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.959] AMD-Vi: Setup I/O page table: device id = 0x905, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.970] AMD-Vi: Setup I/O page table: device id = 0x906, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.982] AMD-Vi: Setup I/O page table: device id = 0x907, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:43.993] AMD-Vi: Setup I/O page table: device id = 0xa00, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:44.004] AMD-Vi: Setup I/O page table: device id = 0xb00, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:44.016] AMD-Vi: Setup I/O page table: device id = 0xc00, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:44.028] AMD-Vi: Setup I/O page table: device id = 0xd00, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:44.039] AMD-Vi: Setup I/O page table: device id = 0xe00, type = 0x1, root table = 0x6a137a000, domain = 0, paging mode = 3
(XEN) [2022-01-18 10:40:44.058] Initial low memory virq threshold set at 0x4000 pages.
(XEN) [2022-01-18 10:40:44.070] Scrubbing Free RAM in background
(XEN) [2022-01-18 10:40:44.081] Std. Loglevel: All
(XEN) [2022-01-18 10:40:44.093] Guest Loglevel: All
(XEN) [2022-01-18 10:40:44.105] Xen is relinquishing VGA console.
(XEN) [2022-01-18 10:40:44.200] *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) [2022-01-18 10:40:44.200] Freed 588kB init memory
mapping kernel into physical memory
about to get started...
[    0.000000] Linux version 5.16.1-20220118-doflr-mac80211debug+ (root@serveerstertje) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #1 SMP PREEMPT Tue Jan 18 10:49:09 CET 2022
[    0.000000] Command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] signal: max sigframe size: 1440
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x0000000000095fff] usable
[    0.000000] Xen: [mem 0x0000000000096400-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000080069fff] usable
[    0.000000] Xen: [mem 0x00000000c7f90000-0x00000000c7f9dfff] ACPI data
[    0.000000] Xen: [mem 0x00000000c7f9e000-0x00000000c7fdffff] ACPI NVS
[    0.000000] Xen: [mem 0x00000000c7fe0000-0x00000000c7ffffff] reserved
[    0.000000] Xen: [mem 0x00000000f6000000-0x00000000f6003fff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] Xen: [mem 0x00000000fec20000-0x00000000fec20fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] printk: bootconsole [xenboot0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x0000000000095fff] usable
[    0.000000] user: [mem 0x0000000000096400-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x000000007fffffff] usable
[    0.000000] user: [mem 0x00000000c7f90000-0x00000000c7f9dfff] ACPI data
[    0.000000] user: [mem 0x00000000c7f9e000-0x00000000c7fdffff] ACPI NVS
[    0.000000] user: [mem 0x00000000c7fe0000-0x00000000c7ffffff] reserved
[    0.000000] user: [mem 0x00000000f6000000-0x00000000f6003fff] reserved
[    0.000000] user: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] user: [mem 0x00000000fec20000-0x00000000fec20fff] reserved
[    0.000000] user: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] user: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] user: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] SMBIOS 2.5 present.
[    0.000000] DMI: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[    0.000000] Hypervisor detected: Xen PV
[    0.023838] tsc: Fast TSC calibration using PIT
[    0.023841] tsc: Detected 3200.101 MHz processor
[    0.023843] tsc: Detected 3200.138 MHz TSC
[    0.023951] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.023956] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.037056] AGP: No AGP bridge found
[    0.037178] last_pfn = 0x80000 max_arch_pfn = 0x400000000
[    0.037181] Disabled
[    0.037184] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.037189] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
[    0.108383] RAMDISK: [mem 0x04000000-0x05d3afff]
[    0.108408] ACPI: Early table checksum verification disabled
[    0.109270] ACPI: RSDP 0x00000000000FB100 000014 (v00 ACPIAM)
[    0.109280] ACPI: RSDT 0x00000000C7F90000 000048 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.109302] ACPI: FACP 0x00000000C7F90200 000084 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.109348] ACPI: DSDT 0x00000000C7F905E0 009427 (v01 A7640  A7640100 00000100 INTL 20051117)
[    0.109357] ACPI: FACS 0x00000000C7F9E000 000040
[    0.109366] ACPI: APIC 0x00000000C7F90390 000088 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.109375] ACPI: MCFG 0x00000000C7F90420 00003C (v01 7640MS OEMMCFG  20100913 MSFT 00000097)
[    0.109384] ACPI: SLIC 0x00000000C7F90460 000176 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.109392] ACPI: OEMB 0x00000000C7F9E040 000072 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.109402] ACPI: SRAT 0x00000000C7F9A5E0 000108 (v03 AMD    FAM_F_10 00000002 AMD  00000001)
[    0.109411] ACPI: HPET 0x00000000C7F9A6F0 000038 (v01 7640MS OEMHPET  20100913 MSFT 00000097)
[    0.109420] ACPI: IVRS 0x00000000C7F9A730 000108 (v01 AMD    RD890S   00202031 AMD  00000000)
[    0.109429] ACPI: SSDT 0x00000000C7F9A840 000DA4 (v01 A M I  POWERNOW 00000001 AMD  00000001)
[    0.109434] ACPI: Reserving FACP table memory at [mem 0xc7f90200-0xc7f90283]
[    0.109437] ACPI: Reserving DSDT table memory at [mem 0xc7f905e0-0xc7f99a06]
[    0.109440] ACPI: Reserving FACS table memory at [mem 0xc7f9e000-0xc7f9e03f]
[    0.109442] ACPI: Reserving APIC table memory at [mem 0xc7f90390-0xc7f90417]
[    0.109444] ACPI: Reserving MCFG table memory at [mem 0xc7f90420-0xc7f9045b]
[    0.109446] ACPI: Reserving SLIC table memory at [mem 0xc7f90460-0xc7f905d5]
[    0.109448] ACPI: Reserving OEMB table memory at [mem 0xc7f9e040-0xc7f9e0b1]
[    0.109451] ACPI: Reserving SRAT table memory at [mem 0xc7f9a5e0-0xc7f9a6e7]
[    0.109453] ACPI: Reserving HPET table memory at [mem 0xc7f9a6f0-0xc7f9a727]
[    0.109455] ACPI: Reserving IVRS table memory at [mem 0xc7f9a730-0xc7f9a837]
[    0.109457] ACPI: Reserving SSDT table memory at [mem 0xc7f9a840-0xc7f9b5e3]
[    0.109490] Setting APIC routing to Xen PV.
[    0.109543] NUMA turned off
[    0.109545] Faking a node at [mem 0x0000000000000000-0x000000007fffffff]
[    0.109553] NODE_DATA(0) allocated [mem 0x7fc1b000-0x7fc24fff]
[    0.114078] Zone ranges:
[    0.114085]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.114089]   DMA32    [mem 0x0000000001000000-0x000000007fffffff]
[    0.114091]   Normal   empty
[    0.114094] Movable zone start for each node
[    0.114096] Early memory node ranges
[    0.114098]   node   0: [mem 0x0000000000001000-0x0000000000095fff]
[    0.114100]   node   0: [mem 0x0000000000100000-0x000000007fffffff]
[    0.114104] Initmem setup node 0 [mem 0x0000000000001000-0x000000007fffffff]
[    0.114114] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.114203] On node 0, zone DMA: 106 pages in unavailable ranges
[    0.128587] p2m virtual area at (____ptrval____), size is 600000
[    0.135670] ------------[ cut here ]------------
[    0.135690] Failed to update kernel mapping for mfn=6930582 pfn=524288
[    0.135701] WARNING: CPU: 0 PID: 0 at arch/x86/xen/setup.c:312 xen_remap_memory+0x191/0x26c
[    0.135715] Modules linked in:
[    0.135721] CPU: 0 PID: 0 Comm: swapper Not tainted 5.16.1-20220118-doflr-mac80211debug+ #1
[    0.135726] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[    0.135729] RIP: e030:xen_remap_memory+0x191/0x26c
[    0.135734] Code: d2 48 c1 e7 0c 48 c1 e0 27 48 01 c7 e8 0d 6d 7b fe 48 ff c3 85 c0 74 16 4c 89 e2 48 89 ee 48 c7 c7 18 ae ab 82 e8 f3 01 72 fe <0f> 0b 0f 0b 49 ff c4 e9 15 ff ff ff 48 8b 6c 24 08 48 8b 05 24 9b
[    0.135740] RSP: e02b:ffffffff82e03d48 EFLAGS: 00010086 ORIG_RAX: 0000000000000000
[    0.135744] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000002
[    0.135746] RDX: 0000000000000002 RSI: ffffffff82e03bd0 RDI: 00000000ffffffff
[    0.135749] RBP: 000000000069c096 R08: 0000000000000000 R09: c0000000ffff7fff
[    0.135751] R10: 0000000000000001 R11: ffffffff82e03b70 R12: 0000000000080000
[    0.135753] R13: 0000000000000000 R14: ffffffffffffffff R15: 000000069c096000
[    0.135771] FS:  0000000000000000(0000) GS:ffffffff839ed000(0000) knlGS:0000000000000000
[    0.135774] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.135777] CR2: ffffc90000400000 CR3: 0000000002e24000 CR4: 0000000000000660
[    0.135782] Call Trace:
[    0.135785]  <TASK>
[    0.135790]  ? 0xffffffff81000000
[    0.135793]  ? xen_pagetable_init+0x3be/0x3d1
[    0.135797]  ? 0xffffffff81000000
[    0.135800]  ? setup_arch+0x735/0x816
[    0.135803]  ? default_get_nmi_reason+0x10/0x10
[    0.135809]  ? start_kernel+0x67/0x673
[    0.135814]  ? default_get_nmi_reason+0x10/0x10
[    0.135817]  ? xen_start_kernel+0x4d5/0x4df
[    0.135820]  ? startup_xen+0x3e/0x3e
[    0.135823]  </TASK>
[    0.135827] random: get_random_bytes called from print_oops_end_marker+0x21/0x40 with crng_init=0
[    0.135834] ---[ end trace 4dcf5c6dcd41cee3 ]---
[    0.135839] ------------[ cut here ]------------
[    0.135841] kernel BUG at arch/x86/xen/setup.c:313!
PANIC: early exception 0x06 IP 10000e030:ffffffff83a234ce error 0 cr2 0xffffc90000400000
[    0.135846] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.16.1-20220118-doflr-mac80211debug+ #1
[    0.135849] Hardware name: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[    0.135851] RIP: e030:xen_remap_memory+0x193/0x26c
[    0.135854] Code: c1 e7 0c 48 c1 e0 27 48 01 c7 e8 0d 6d 7b fe 48 ff c3 85 c0 74 16 4c 89 e2 48 89 ee 48 c7 c7 18 ae ab 82 e8 f3 01 72 fe 0f 0b <0f> 0b 49 ff c4 e9 15 ff ff ff 48 8b 6c 24 08 48 8b 05 24 9b 09 00
[    0.135858] RSP: e02b:ffffffff82e03d48 EFLAGS: 00010086 ORIG_RAX: 0000000000000000
[    0.135862] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000002
[    0.135864] RDX: 0000000000000002 RSI: ffffffff82e03bd0 RDI: 00000000ffffffff
[    0.135867] RBP: 000000000069c096 R08: 0000000000000000 R09: c0000000ffff7fff
[    0.135869] R10: 0000000000000001 R11: ffffffff82e03b70 R12: 0000000000080000
[    0.135871] R13: 0000000000000000 R14: ffffffffffffffff R15: 000000069c096000
[    0.135875] FS:  0000000000000000(0000) GS:ffffffff839ed000(0000) knlGS:0000000000000000
[    0.135878] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.135880] CR2: ffffc90000400000 CR3: 0000000002e24000 CR4: 0000000000000660
[    0.135883] Call Trace:
[    0.135884]  <TASK>
[    0.135886]  ? 0xffffffff81000000
[    0.135888]  ? xen_pagetable_init+0x3be/0x3d1
[    0.135891]  ? 0xffffffff81000000
[    0.135893]  ? setup_arch+0x735/0x816
[    0.135896]  ? default_get_nmi_reason+0x10/0x10
[    0.135898]  ? start_kernel+0x67/0x673
[    0.135901]  ? default_get_nmi_reason+0x10/0x10
[    0.135903]  ? xen_start_kernel+0x4d5/0x4df
[    0.135906]  ? startup_xen+0x3e/0x3e
[    0.135909]  </TASK>
(XEN) [2022-01-18 10:40:44.346] Hardware Dom0 halted: halting machine




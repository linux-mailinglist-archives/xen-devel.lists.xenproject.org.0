Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B67A37B9F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 07:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889638.1298758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjupx-0007Zu-RV; Mon, 17 Feb 2025 06:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889638.1298758; Mon, 17 Feb 2025 06:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjupx-0007YM-NN; Mon, 17 Feb 2025 06:42:37 +0000
Received: by outflank-mailman (input) for mailman id 889638;
 Sun, 16 Feb 2025 23:09:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNa7=VH=gmail.com=woods.greg.a@srs-se1.protection.inumbo.net>)
 id 1tjnlQ-0002jl-E5
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 23:09:28 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f54f006-ecbb-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 00:09:24 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-220bfdfb3f4so78609705ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 15:09:24 -0800 (PST)
Received: from smtpclient.apple ([2001:569:fd37:7700:507b:779a:938e:9dfb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242761c07sm6793552b3a.152.2025.02.16.15.09.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Feb 2025 15:09:20 -0800 (PST)
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
X-Inumbo-ID: 0f54f006-ecbb-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739747362; x=1740352162; darn=lists.xenproject.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4MKIyj/eqVLXScIn7f5TXJiiT0WXcAAHbq+ZOrR3wY=;
        b=LUov6YPJMD78WKCQ+vOj+A3u3wqMb9z4tPCob0+i/wWYOSzTds6rkbMo5XX9gudKHd
         DFQybNpO+FjLdW0c5W0Vytf3G0D8UZz8XByP6qcY05uplRyl7OlGppx4z8cA3a3baVg7
         RCzsvIMxcwKFf9ST3gY4HQiTqpSqe39QXIna8Hz1IX1olnr2TzHoLzCUE6DJ5evu4FFv
         kY9ML56lQEACrq377vH0RTnAuLseSWFru4mqsXGPOOKI1XbR/t6+xe0oHvs4OZjM2QmL
         s18C3tKsUVGELVngig/y+hZqvkaVVOBH1YRxE4uvD+sZltgyIXIw2UE3+TAruG+3RA6j
         OuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739747362; x=1740352162;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4MKIyj/eqVLXScIn7f5TXJiiT0WXcAAHbq+ZOrR3wY=;
        b=ZeEDf3xKwZL+LUV2eNATu4Q36/fg+jeLOYCUuTFkWM8+WtOnNmEwGhMIrWmJcYcY4b
         L6iDDAY1MAfGS4MddoGQKNhUg6RXc2H8e2DdUrvSsJCtWdD7EowlcCj9lZffMHVVwvs+
         Fw0isvTGKWlv0aHoL3OMqKNproXQtWeYSM+FB3OdmrZ/GL5nrdzuxSTotiK7dD78I0Y6
         e/OysPWx90esKK4RDRnesdyOY4DPUcrndJuHPFho71s1Dk4oYEYoBT0bvk0WnKJF3lmn
         KOhR6XXKVCAqtKLt4bEElngJsgalijBxzw+cYVynPe5TS9tVRIbTjTSdPgFEg94C3hU6
         9EBQ==
X-Gm-Message-State: AOJu0YxkzuX3Xv1SxV5SymNc81yf//IhIP/jVXmrOtbF7Wsc5gFfllud
	SUsNvsJpTVoEKb0FVGY4sR43o49jRWsOV1pUSxsRCQRFO48yNvtRnMC8RQ==
X-Gm-Gg: ASbGncsCuvWecuYKjuNTCTSPDdBUToLmXL/5hoftBjfyUpJ0IWHTVN29V5yOyjRNrNZ
	wJCgC7yoqUmZxfC8Tm1ryKiUrw4DYKIxo27LeiftsjrSbiQ8fWmaI/bf5r0MN/eUu4huyZt00tP
	Uag5ZJwiX4nXYRu+zY1GcBaZ6o18b4CAGyQkywfWKL+r/HRbsEofWCnGQIKVfkjL+VRIPy1MRfS
	muaUdpwmszZFnS2rD5SabBAIuGMDWlF0dSNiYhuJdCdkEGQkEVjZocwcSH/8Vw8co1Olv/OT7Aa
	RGdu8Lx3Q97hc70sj2N+pY/2dnafhsNmna0em9emKp+52Q==
X-Google-Smtp-Source: AGHT+IEAYl8QfeNrMX8SNeXJQu9KUcRT01oZjXyZBVPqmJb5TyD12sFBC3UUaqr4e5rB8Fyhr+ltgA==
X-Received: by 2002:a05:6a00:124b:b0:732:1bad:e245 with SMTP id d2e1a72fcca58-7326179e7d8mr10475575b3a.7.1739747361033;
        Sun, 16 Feb 2025 15:09:21 -0800 (PST)
From: "Greg A. Woods" <woods.greg.a@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: early crash while loading dom0 kernel between git:19730dbb3f and
 git:414dde38b0
Message-Id: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
Date: Sun, 16 Feb 2025 15:09:09 -0800
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3826.300.87.4.3)

I had been testing 4.20-rc (at git:19730dbb3f) relatively successfully
on a older Dell PE-2950 server.

Today I tried upgrading to git:414dde38b0 and I encountered the
following highly repeatable crash on first boot.  (note the git commit
shown in the log is from my(robohack) local NetBSD patches on GitHub,
none of which are in the Xen kernel itself -- just tools)

Note the dom0 kernel is NetBSD (-current as of about a year ago).

I'm not on the xen-devel list, so please email me directly (also see
alternate addresses in my signature below).  Note I can't even send
from my normal email because inumbo.net <http://inumbo.net/> don't =
understand the rules of
the DNS and have botched the MX records for xenproject.org =
<http://xenproject.org/>.


The offending address ([<ffff82d040201015>] R _stextentry+0x15/0x165)
seems to be found here (according to "objdump -S xen-syms"):

ffff82d040201000 <restore_all_guest>:

        .section .text.entry, "ax", @progbits

/* %rbx: struct vcpu, interrupts disabled */
FUNC_LOCAL(restore_all_guest)
        ASSERT_INTERRUPTS_DISABLED
ffff82d040201000:       9c                      pushfq
ffff82d040201001:       f6 44 24 01 02          testb  $0x2,0x1(%rsp)
ffff82d040201006:       74 02                   je     ffff82d04020100a =
<restore_all_guest+
0xa>
ffff82d040201008:       0f 0b                   ud2
ffff82d04020100a:       48 83 c4 08             add    $0x8,%rsp

        /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
        mov VCPU_arch_msrs(%rbx), %rdx
ffff82d04020100e:       48 8b 93 68 0d 00 00    mov    0xd68(%rbx),%rdx
        mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
ffff82d040201015:       44 8b 3a                mov    (%rdx),%r15d


If I'm not mistaken this is from xen/arch/x86/x86_64/entry.S.  I don't
see any recent changes there though, so I'm not sure where to go from
here.  Did something deeper in struct vcpu change?


Start @ 0x200000 [1=3D0x619000-0x6190ec]...
Xen 4.20-rc
(XEN) [000000341c1f78e9] Xen version 4.20-rc (woods@.local) (gcc (nb1 =
20200907) 9.3.0) debug=3Dy Sun Feb 16 13:33:02 PST 2025
(XEN) [000000341e299905] Latest ChangeSet: Wed Jan 29 13:29:16 2025 =
-0800 git:72eea1d3cb-dirty
(XEN) [000000341fba9b9d] build-id: =
0e6a2491c4ad94bdf27ff33fcefc31b5a8b61784
(XEN) [0000003420fc47e1] CPU Vendor: Intel, Family 6 (0x6), Model 23 =
(0x17), Stepping 6 (raw 00010676)
(XEN) [0000003422aea44d] BSP microcode revision: 0x0000060f
(XEN) [0000003423ad77fc] Bootloader: NetBSD/x86 BIOS Boot, Revision 5.11 =
(Sun Dec  8 23:54:34 UTC 2024) (from NetBSD 9.99.81)
(XEN) [0000003425c00815] Command line: loglvl=3Dall bootscrub=3Dfalse =
dom0=3Dpv,verbose=3D1 dom0_mem=3D20G console=3Dcom1,vga =
console_timestamps=3Ddatems dom0_max_vcpus=3D8 dom0_vcpus_pin=3Dtrue =
guest_loglvl=3Dall pv-l1tf=3Doff,domu=3Doff cpuid=3Drdrand vpmu=3Don,ipc =
spec-ctrl=3Dno
(XEN) [0000003429e4ffe7] Xen image load base address: 0
(XEN) [000000342ad31415] Video information:
(XEN) [000000342b8f1bb1]  VGA is text mode 80x25, font 8x16
(XEN) [000000342c8dd871]  VBE/DDC methods: none; EDID transfer time: 2 =
seconds
(XEN) [000000342ddc15c1]  EDID info not retrieved because no DDC =
retrieval method detected
(XEN) [000000342f5c6dd9] Disc information:
(XEN) [00000034301431d9]  Found 1 MBR signatures
(XEN) [0000003430e50f98]  Found 3 EDD information structures
(XEN) [0000003431f47909] Xen-e820 RAM map:
(XEN) [0000003432ac52a2]  [0000000000000000, 000000000009ffff] (usable)
(XEN) [0000003433dd3569]  [0000000000100000, 000000007fb4ffff] (usable)
(XEN) [00000034350e356d]  [000000007fb50000, 000000007fb65fff] =
(reserved)
(XEN) [0000003436476629]  [000000007fb66000, 000000007fb85bff] (ACPI =
data)
(XEN) [000000343784fb4f]  [000000007fb85c00, 000000007fffffff] =
(reserved)
(XEN) [0000003438be3695]  [00000000e0000000, 00000000efffffff] =
(reserved)
(XEN) [0000003439f77a81]  [00000000fe000000, 00000000ffffffff] =
(reserved)
(XEN) [000000343b30c913]  [0000000100000000, 000000087fffffff] (usable)
(XEN) [000000343ee6360c] New Xen image base address: 0x7f200000
(XEN) [0000003440694793] ACPI: RSDP 000F2160, 0024 (r2 DELL  )
(XEN) [0000003441749eb9] ACPI: XSDT 000F21FC, 0084 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344305a15b] ACPI: FACP 7FB83524, 00F4 (r3 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344496b150] ACPI: DSDT 7FB66000, 4996 (r1 DELL   PE_SC3     =
     1 INTL 20050624)
(XEN) [0000003446279abf] ACPI: FACS 7FB85C00, 0040
(XEN) [000000344700e18b] ACPI: APIC 7FB83078, 0092 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344891e95f] ACPI: SPCR 7FB83130, 0050 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344a22f6d7] ACPI: HPET 7FB83184, 0038 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344bb3e147] ACPI: MCFG 7FB831C0, 003C (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344d44f37f] ACPI: WDAT 7FB83200, 0134 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000344ed5e937] ACPI: SLIC 7FB83338, 0024 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [000000345066f44f] ACPI: ERST 7FB6AB18, 0210 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [0000003451f81397] ACPI: HEST 7FB6AD28, 027C (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [00000034538909c1] ACPI: BERT 7FB6A998, 0030 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [00000034551a0a03] ACPI: EINJ 7FB6A9C8, 0150 (r1 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [0000003456ab0053] ACPI: TCPA 7FB834BC, 0064 (r2 DELL   PE_SC3     =
     1 DELL        1)
(XEN) [00000034585d9e36] System RAM: 32762MB (33549248kB)
(XEN) [0000003469b14a80] No NUMA configuration found
(XEN) [000000346a92bbab] Faking a node at =
0000000000000000-0000000880000000
(XEN) [00000034829a0953] Domain heap initialised
(XEN) [00000034878cf4ff] found SMP MP-table at 000fe710
(XEN) [00000034887af092] DMI 2.5 present.
(XEN) [00000034892eaa5e] Using APIC driver default
(XEN) [000000348a07ce65] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [000000348b1b8cec] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], =
pm1x_evt[1:800,1:0]
(XEN) [000000348c7e99a8] ACPI:             wakeup_vec[7fb85c0c], =
vec_size[20]
(XEN) [000000348dc8aed2] ACPI: Local APIC address 0xfee00000
(XEN) [000000348ecb9cff] ACPI: IOAPIC (id[0x08] address[0xfec00000] =
gsi_base[0])
(XEN) [0000003490222426] IOAPIC[0]: apic_id 8, version 32, address =
0xfec00000, GSI 0-23
(XEN) [000000349195e58e] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 =
dfl dfl)
(XEN) [000000349324476e] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 =
high level)
(XEN) [00000034948b8d59] ACPI: IRQ0 used by override.
(XEN) [00000034957146cd] ACPI: IRQ2 used by override.
(XEN) [000000349657161c] ACPI: IRQ9 used by override.
(XEN) [00000034973cd10c] ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) [00000034985d0be2] PCI: MCFG configuration 0: base e0000000 =
segment 0000 buses 00 - ff
(XEN) [0000003499e5c558] PCI: MCFG area at e0000000 reserved in E820
(XEN) [000000349b0a1dad] PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) [000000349c2a5aec] Failed to get Error Log Address Range.
(XEN) [000000349d39ee85] HEST: Table parsing has been initialized
(XEN) [000000349e51c9fd] Using ACPI (MADT) for SMP configuration =
information
(XEN) [000000349f9792e6] SMP: Allowing 8 CPUs (0 hotplug CPUs)
(XEN) [00000034a0a2e4da] IRQ limits: 24 GSI, 1640 MSI/MSI-X
(XEN) [00000034a1de6b29] ../arch/x86/i8259.c:384: PIC aliasing mask: 1c
(XEN) [00000034a30f5b97] CPU0: 2333 ... 24333 MHz
(XEN) [00000034a3e4532a] ../arch/x86/cpu/mcheck/mce_intel.c:772: MCA =
Capability: firstbank 1, extended MCE MSR 0, BCAST
(XEN) [00000034a5ddc883] CPU0: Intel machine check reporting enabled
(XEN) [00000034a7024cc8] Unrecognised CPU model 0x17 - assuming =
vulnerable to MDS
(XEN) [00000034a85d02cc] Speculative mitigation facilities:
(XEN) [00000034a95bb8cb]   Hardware hints:
(XEN) [00000034aa139bdb]   Hardware features:
(XEN) [00000034aad7dde7]   Compiled-in support: INDIRECT_THUNK =
SHADOW_PAGING HARDEN_ARRAY HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN) [00000034ad142543]   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: No, =
Other:
(XEN) [00000034ae626523]   L1TF: believed vulnerable, maxphysaddr L1D =
38, CPUID 38, Safe address 3000000000
(XEN) [00000034b029b13b]   Support for HVM VMs: None
(XEN) [00000034b10b3aab]   Support for PV VMs: None
(XEN) [00000034b1e8b0e3]   XPTI (64-bit PV only): Dom0 disabled, DomU =
disabled (without PCID)
(XEN) [00000034b3758eef]   PV L1TF shadowing: Dom0 disabled, DomU =
disabled
(XEN) [00000034b4b301cb] Using scheduler: SMP Credit Scheduler rev2 =
(credit2)
(XEN) [00000034b5fcf1b3] Initializing Credit2 scheduler
(XEN) [00000034b6eb231e]  load_precision_shift: 18
(XEN) [00000034b7c44f4f]  load_window_shift: 30
(XEN) [00000034b891086f]  underload_balance_tolerance: 0
(XEN) [00000034b9833eef]  overload_balance_tolerance: -3
(XEN) [00000034ba7578b3]  runqueues arrangement: socket
(XEN) [00000034bb63a367]  cap enforcement granularity: 10ms
(XEN) [00000034bc62845f] load tracking window length 1073741824 ns
(XEN) [00000034bdf14d27] ../arch/x86/time.c:493: PIT aliasing mask: 10
(XEN) [00000034c8813b72] Platform timer is 14.318MHz HPET
(XEN) [    1.030966] Detected 3158.781 MHz processor.
(XEN) [    1.040748] Freed 1024kB unused BSS memory
(XEN) [    1.045341] alt table ffff82d0404bc3b8 -> ffff82d0404cf9be
(XEN) [    1.051374] altcall mc_memerr_dhandler+0x31/0x3b0 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_checkaddr has no endbr64
(XEN) [    1.062466] altcall do_machine_check+0x21/0x40 dest =
mcheck_cmn_handler has no endbr64
(XEN) [    1.070787] altcall mcheck_mca_logout+0x446/0x770 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_need_clearbank_scan has no endbr64
(XEN) [    1.082748] altcall mcheck_mca_logout+0x49c/0x770 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_recoverable_scan has no endbr64
(XEN) [    1.094447] altcall mcheck_mca_logout+0x56b/0x770 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_checkaddr has no endbr64
(XEN) [    1.105539] altcall =
arch/x86/cpu/microcode/core.c#parse_blob+0x9/0x20 dest =
arch/x86/cpu/microcode/intel.c#cpu_request_microcode has no endbr64
(XEN) [    1.118800] altcall =
arch/x86/cpu/microcode/core.c#primary_thread_work+0x3d/0x70 dest =
arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
(XEN) [    1.132407] altcall =
arch/x86/cpu/microcode/core.c#microcode_update_helper+0xad/0x370 dest =
arch/x86/cpu/microcode/intel.c#intel_compare has no endbr64
(XEN) [    1.146275] altcall =
arch/x86/cpu/microcode/core.c#microcode_update_helper+0x2db/0x370 dest =
arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
(XEN) [    1.160400] altcall =
arch/x86/cpu/microcode/core.c#microcode_update_helper+0x2ff/0x370 dest =
arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
(XEN) [    1.174526] altcall =
arch/x86/cpu/microcode/core.c#do_microcode_update+0x13e/0x330 dest =
arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
(XEN) [    1.188307] altcall microcode_update_one+0x11/0x70 dest =
arch/x86/cpu/microcode/intel.c#collect_cpu_info has no endbr64
(XEN) [    1.199486] altcall microcode_update_one+0x41/0x70 dest =
arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
(XEN) [    1.210581] altcall ctxt_switch_levelling+0x116/0x120 dest =
arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
(XEN) [    1.221934] altcall identify_cpu+0x17a/0x530 dest =
arch/x86/cpu/intel.c#early_init_intel has no endbr64
(XEN) [    1.231726] altcall identify_cpu+0x2ef/0x530 dest =
arch/x86/cpu/intel.c#init_intel has no endbr64
(XEN) [    1.241075] altcall setup_local_APIC+0x26/0x470 dest =
init_apic_ldr_flat has no endbr64
(XEN) [    1.249482] altcall setup_IO_APIC+0x7a9/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.258148] altcall setup_IO_APIC+0x82d/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.266816] altcall setup_IO_APIC+0x96f/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.275483] altcall setup_IO_APIC+0xa53/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.284149] altcall io_apic_set_pci_routing+0x110/0x380 dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.293683] altcall io_apic_set_pci_routing+0x18f/0x380 dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.303215] altcall ioapic_guest_write+0x521/0x5f0 dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.312314] altcall ioapic_guest_write+0x536/0x5f0 dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.321416] altcall msi_compose_msg+0x7d/0xf0 dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.330082] altcall =
arch/x86/irq.c#_assign_irq_vector+0x39c/0x730 dest =
vector_allocation_cpumask_phys has no endbr64
(XEN) [    1.341089] altcall set_desc_affinity+0xb8/0x140 dest =
cpu_mask_to_apicid_phys has no endbr64
(XEN) [    1.350015] altcall send_IPI_mask+0xe4/0x1f0 dest =
send_IPI_mask_flat has no endbr64
(XEN) [    1.358163] altcall send_IPI_mask+0xfb/0x1f0 dest =
send_IPI_mask_flat has no endbr64
(XEN) [    1.366308] altcall send_IPI_self+0x4/0x10 dest =
send_IPI_self_legacy has no endbr64
(XEN) [    1.374454] altcall arch/x86/time.c#read_counter+0x1a/0x30 dest =
arch/x86/time.c#read_hpet_count has no endbr64
(XEN) [    1.384941] altcall time_resume+0x2d/0x170 dest =
arch/x86/time.c#resume_hpet has no endbr64
(XEN) [    1.393695] I/O virtualisation disabled
(XEN) [    1.398028] nr_sockets: 2
(XEN) [    1.401149] Enabling APIC mode.  Using 1 I/O APICs
(XEN) [    1.406526] ENABLING IO-APIC IRQs
(XEN) [    1.410341]  -> Using new ACK method
(XEN) [    1.414414] ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 =
pin2=3D-1
(XEN) [    1.570745] Wallclock source: CMOS RTC
(XEN) [2025-02-16 21:56:40.181] Allocated console ring of 64 KiB.
(XEN) [2025-02-16 21:56:40.181] mwait-idle: does not run on family 6 =
model 23
(XEN) [2025-02-16 21:56:40.181] VPMU: version 0.1
(XEN) [2025-02-16 21:56:40.181] VMX: Supported advanced features:
(XEN) [2025-02-16 21:56:40.181]  - APIC MMIO access virtualisation
(XEN) [2025-02-16 21:56:40.181]  - APIC TPR shadow
(XEN) [2025-02-16 21:56:40.181]  - Virtual NMI
(XEN) [2025-02-16 21:56:40.181]  - MSR direct-access bitmap
(XEN) [2025-02-16 21:56:40.181] HVM: ASIDs disabled.
(XEN) [2025-02-16 21:56:40.181] HVM: VMX enabled
(XEN) [2025-02-16 21:56:40.181] HVM: Hardware Assisted Paging (HAP) not =
detected
(XEN) [2025-02-16 21:56:40.181] alt table ffff82d0404bc3b8 -> =
ffff82d0404cf9be
(XEN) [2025-02-16 21:56:40.181] altcall core_parking_helper+0x37/0x100 =
dest common/core_parking.c#core_parking_power has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall core_parking_helper+0xa4/0x100 =
dest common/core_parking.c#core_parking_power has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall cpufreq_add_cpu+0x180/0x510 dest =
arch/x86/acpi/cpufreq/acpi.c#acpi_cpufreq_cpu_init has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall cpufreq_add_cpu+0x2fa/0x510 dest =
arch/x86/acpi/cpufreq/acpi.c#acpi_cpufreq_cpu_exit has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall cpufreq_del_cpu+0xe0/0x250 dest =
arch/x86/acpi/cpufreq/acpi.c#acpi_cpufreq_cpu_exit has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
__cpufreq_driver_target+0x34/0xb0 dest =
arch/x86/acpi/cpufreq/acpi.c#acpi_cpufreq_target has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall __cpufreq_set_policy+0x37/0x180 =
dest arch/x86/acpi/cpufreq/acpi.c#acpi_cpufreq_verify has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall do_pm_op+0x542/0xa80 dest =
arch/x86/acpi/cpufreq/acpi.c#get_cur_freq_on_cpu has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/acpi/power.c#enter_state_helper+0x176/0x4b0 dest vmx_cpu_down =
has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/acpi/power.c#enter_state_helper+0x3fd/0x4b0 dest vmx_cpu_up has =
no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall update_idle_stats+0x1c/0x90 dest =
arch/x86/acpi/cpu_idle.c#acpi_pm_ticks_elapsed has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall update_idle_stats+0x42/0x90 dest =
acpi_pm_tick_to_ns has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x2ff/0x5e0 dest =
arch/x86/acpi/cpu_idle.c#get_acpi_pm_tick has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x33f/0x5e0 dest =
arch/x86/acpi/cpu_idle.c#get_acpi_pm_tick has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3cf/0x5e0 dest =
arch/x86/acpi/cpu_idle.c#get_acpi_pm_tick has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3f7/0x5e0 dest =
arch/x86/acpi/cpu_idle.c#get_acpi_pm_tick has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/cpu/mwait-idle.c#mwait_idle+0x2ca/0x440 dest =
arch/x86/acpi/cpu_idle.c#get_acpi_pm_tick has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/cpu/mwait-idle.c#mwait_idle+0x303/0x440 dest =
arch/x86/acpi/cpu_idle.c#get_acpi_pm_tick has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_save_force+0x20/0x60 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_save has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/cpu/vpmu.c#vpmu_arch_initialise+0x43/0xd0 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_initialise has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/cpu/vpmu.c#vpmu_cleanup+0xd4/0x180 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_destroy has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_do_msr+0x69/0xe0 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_do_wrmsr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_do_msr+0xa4/0xe0 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_save has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_do_msr+0xbb/0xe0 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_do_rdmsr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_do_interrupt+0xbb/0x3e0 =
dest arch/x86/cpu/vpmu_intel.c#core2_vpmu_save has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_do_interrupt+0x36f/0x3e0 =
dest arch/x86/cpu/vpmu_intel.c#core2_vpmu_do_interrupt has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_save+0x51/0xa0 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_save has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_load+0x4f/0xa0 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_load has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vpmu_dump+0xd/0x20 dest =
arch/x86/cpu/vpmu_intel.c#core2_vpmu_dump has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/svm/nestedsvm.c#nsvm_vmcb_guest_intercepts_exitcode+0xe1/0x2a=
0 dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nsvm_vcpu_vmrun+0x62c/0xce0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nsvm_vcpu_vmrun+0x635/0xce0 dest =
nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nsvm_vcpu_vmrun+0x7d1/0xce0 dest =
nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nsvm_hap_walk_L1_p2m+0x20/0xb0 =
dest nvmx_vcpu_eptp_base has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
nestedsvm_check_intercepts+0x82/0x110 dest nvmx_ept_enabled has no =
endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
nestedsvm_check_intercepts+0xb7/0x110 dest nvmx_ept_enabled has no =
endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nestedsvm_vmexit_n2n1+0xc8/0x740 =
dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
nestedsvm_vmexit_n2n1+0x42f/0x740 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
nestedsvm_vmexit_n2n1+0x438/0x740 dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nsvm_vcpu_switch+0x1d7/0x2d0 =
dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nsvm_vcpu_switch+0x28a/0x2d0 =
dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
nestedsvm_vcpu_interrupt+0x22/0xd0 dest nvmx_intr_blocked has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall svm_create_vmcb+0x2d1/0x520 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_efer has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall svm_create_vmcb+0x2e4/0x520 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall svm_create_vmcb+0x2f7/0x520 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vmx_create_vmcs+0x8e9/0xcb0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall vmx_create_vmcs+0x907/0xcb0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nvmx_switch_guest+0xa2/0x1820 =
dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nvmx_switch_guest+0x82e/0x1820 =
dest arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nvmx_switch_guest+0xff8/0x1820 =
dest arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall nvmx_switch_guest+0x11b0/0x1820 =
dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall viridian_hypercall+0x32/0x580 =
dest vmx_guest_x86_mode has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch_set_info_hvm_guest+0x5eb/0x8a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch_set_info_hvm_guest+0x5fe/0x8a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch_set_info_hvm_guest+0x611/0x8a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch_set_info_hvm_guest+0x61a/0x8a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_efer has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch_set_info_hvm_guest+0x6b6/0x8a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/emulate.c#hvmemul_vmfunc+0x18/0x60 dest =
arch/x86/hvm/vmx/vmx.c#vmx_vcpu_emulate_vmfunc has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/emulate.c#hvmemul_get_fpu+0x21/0x90 dest =
arch/x86/hvm/vmx/vmx.c#vmx_fpu_dirty_intercept has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/emulate.c#hvmemul_put_fpu+0x4a/0x1e0 dest =
vmx_guest_x86_mode has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/emulate.c#hvmemul_put_fpu+0x153/0x1e0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_fpu_leave has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/emulate.c#hvmemul_cache_op+0x4e/0x190 dest =
arch/x86/hvm/vmx/vmx.c#vmx_wbinvd_intercept has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall hvm_emulate_init_once+0x5d/0xc0 =
dest arch/x86/hvm/vmx/vmx.c#vmx_get_interrupt_shadow has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
hvm_dump_emulation_state+0x33/0xf0 dest vmx_guest_x86_mode has no =
endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/emulate.c#_hvm_emulate_one+0x1d8/0x280 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_interrupt_shadow has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/hvm.c#cpu_callback+0x21/0x80 dest vmx_cpu_dead has no =
endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/hvm.c#cpu_callback+0x48/0x80 dest vmx_cpu_up_prepare has no =
endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/hvm.c#cpu_callback+0x65/0x80 dest vmx_cpu_down has no =
endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/hvm.c#hvm_latch_shinfo_size+0x30/0x50 dest =
vmx_guest_x86_mode has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/hvm.c#hvm_update_cr+0x32/0x60 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall hvm_set_rdtsc_exiting+0x2a/0x50 =
dest arch/x86/hvm/vmx/vmx.c#vmx_set_rdtsc_exiting has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall hvm_get_guest_pat+0xd/0x30 dest =
arch/x86/hvm/vmx/vmx.c#vmx_get_guest_pat has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall hvm_set_guest_pat+0x35/0x60 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_guest_pat has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
arch/x86/hvm/hvm.c#hvm_set_guest_tsc_fixed+0x71/0x80 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall hvm_set_info_guest+0x14/0x30 =
dest arch/x86/hvm/vmx/vmx.c#vmx_set_info_guest has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
hvm_domain_relinquish_resources+0x14/0xe0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_domain_relinquish_resources has no endbr64
(XEN) [2025-02-16 21:56:40.181] altcall =
hvm_domain_relinquish_resources+0x29/0xe0 dest =
nvmx_domain_relinquish_resources has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_domain_initialise+0x37a/0x480 dest =
arch/x86/hvm/vmx/vmx.c#vmx_domain_initialise has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_initialise+0x76/0x1d0 =
dest arch/x86/hvm/vmx/vmx.c#vmx_vcpu_initialise has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_initialise+0x122/0x1d0 =
dest arch/x86/hvm/vmx/vmx.c#vmx_vcpu_destroy has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_destroy+0x41/0x70 dest =
arch/x86/hvm/vmx/vmx.c#vmx_vcpu_destroy has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_hlt+0x1d/0x94 dest =
arch/x86/hvm/vmx/vmx.c#vmx_event_pending has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_inject_event+0x75/0xf0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_inject_event has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_inject_event+0x9f/0xf0 dest =
nvmx_intercepts_exception has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_inject_event+0xaf/0xf0 dest =
arch/x86/hvm/vmx/vmx.c#nvmx_vmexit_event has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_do_resume+0x7a/0xf0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_event_pending has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_do_resume+0xb2/0xf0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_get_pending_event has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_hap_nested_page_fault+0x127/0x640 dest nvmx_ept_enabled has no =
endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_hap_nested_page_fault+0x434/0x640 dest =
arch/x86/hvm/vmx/vmx.c#vmx_vcpu_emulate_ve has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vmexit_cpuid+0x3c/0x100 dest =
arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_msr_read_intercept+0x91/0x340 dest =
arch/x86/hvm/vmx/vmx.c#vmx_msr_read_intercept has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_get_reg+0x13/0x40 dest =
arch/x86/hvm/vmx/vmx.c#vmx_get_reg has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_set_reg+0x13/0x40 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_reg has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_interrupt_blocked+0x46/0xc0 =
dest arch/x86/hvm/vmx/vmx.c#vmx_get_interrupt_shadow has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_interrupt_blocked+0x6a/0xc0 =
dest nvmx_intr_blocked has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_init_hypercall_page+0x10/0x20 dest =
arch/x86/hvm/vmx/vmx.c#vmx_init_hypercall_page has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_get_segment_register+0xc/0x170 dest =
arch/x86/hvm/vmx/vmx.c#vmx_get_segment_register has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/hvm/hvm.c#hvm_save_cpu_ctxt+0x209/0x480 dest =
arch/x86/hvm/vmx/vmx.c#vmx_save_vmcs_ctxt has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_set_cr0+0x102/0x5a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_efer has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_set_cr0+0x3e3/0x5a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_handle_cd has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_set_cr0+0x4e5/0x5a0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_efer has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_set_segment_register+0x2a/0x220 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_segment_register has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/hvm/hvm.c#hvm_load_cpu_ctxt+0x2c4/0x8f0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_load_vmcs_ctxt has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/hvm/hvm.c#hvm_load_cpu_ctxt+0x2ed/0x8f0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_set_efer+0xbc/0x170 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_efer has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_msr_write_intercept+0xaf/0x460 dest =
arch/x86/hvm/vmx/vmx.c#vmx_msr_write_intercept has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
hvm_msr_write_intercept+0x179/0x460 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_task_switch+0x527/0xa70 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_reset_state+0x8f/0x290 =
dest arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_reset_state+0xad/0x290 =
dest arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_reset_state+0xcb/0x290 =
dest arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_reset_state+0xe9/0x290 =
dest arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_reset_state+0xfd/0x290 =
dest arch/x86/hvm/vmx/vmx.c#vmx_update_guest_efer has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_vcpu_reset_state+0x218/0x290 =
dest arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_hypercall+0x2d/0xa70 dest =
vmx_guest_x86_mode has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_hypercall+0x6d/0xa70 dest =
arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_do_multicall_call+0x1f/0x5d0 =
dest vmx_guest_x86_mode has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_do_multicall_call+0x6b/0x5d0 =
dest arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/hvm/monitor.c#set_npt_base+0x35/0x50 dest nvmx_vcpu_eptp_base =
has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_monitor_debug+0xab/0x2b0 =
dest arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_monitor_debug+0x1a1/0x2b0 =
dest arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall hvm_monitor_debug+0x232/0x2b0 =
dest arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall nestedhvm_vcpu_reset+0x85/0xa0 =
dest nvmx_vcpu_reset has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
nestedhvm_vcpu_initialise+0x14/0x40 dest nvmx_vcpu_initialise has no =
endbr64
(XEN) [2025-02-16 21:56:40.182] altcall nestedhvm_vcpu_destroy+0x4/0x10 =
dest nvmx_vcpu_destroy has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/hvm/vlapic.c#lapic_load_hidden+0x77/0xa0 dest =
vmx_vlapic_msr_changed has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall guest_wrmsr_apic_base+0xe0/0x210 =
dest vmx_vlapic_msr_changed has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/common.c#sh_update_paging_modes+0x1c5/0x440 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_host_cr3 has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/common.c#sh_update_paging_modes+0x383/0x440 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_host_cr3 has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/hvm.c#sh_emulate_map_dest+0x2a/0x2b0 dest =
arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_2.c#sh_update_cr3__guest_2+0x46d/0x620 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x160/0x1c40 dest =
arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x18d4/0x1c40 dest =
arch/x86/hvm/vmx/vmx.c#vmx_event_pending has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_3.c#sh_update_cr3__guest_3+0x5b6/0x780 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_3.c#sh_page_fault__guest_3+0x154/0x1f70 dest =
arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_3.c#sh_page_fault__guest_3+0x1b0f/0x1f70 dest =
arch/x86/hvm/vmx/vmx.c#vmx_event_pending has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_4.c#sh_update_cr3__guest_4+0x2f7/0x580 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_4.c#sh_page_fault__guest_4+0x15b/0x1fd0 dest =
arch/x86/hvm/vmx/vmx.c#_vmx_get_cpl has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/shadow/guest_4.c#sh_page_fault__guest_4+0x1c9d/0x1fd0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_event_pending has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/hap/hap.c#hap_update_cr3+0x1b/0x30 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/mm/hap/hap.c#hap_update_paging_modes+0x23c/0x2f0 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_host_cr3 has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
nestedhvm_hap_nested_page_fault+0x42/0x390 dest nvmx_hap_walk_L1_p2m has =
no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall nept_translate_l2ga+0x4d/0x410 =
dest nvmx_vcpu_eptp_base has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall altp2m_vcpu_initialise+0x43/0x70 =
dest arch/x86/hvm/vmx/vmx.c#vmx_vcpu_update_eptp has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall altp2m_vcpu_enable_ve+0x86/0xc0 =
dest arch/x86/hvm/vmx/vmx.c#vmx_vcpu_update_vmfunc_ve has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall altp2m_vcpu_disable_ve+0x25/0x40 =
dest arch/x86/hvm/vmx/vmx.c#vmx_vcpu_update_vmfunc_ve has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall altp2m_vcpu_destroy+0x66/0x90 =
dest arch/x86/hvm/vmx/vmx.c#vmx_vcpu_update_eptp has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
p2m_switch_vcpu_altp2m_by_id+0x1b8/0x220 dest =
arch/x86/hvm/vmx/vmx.c#vmx_vcpu_update_eptp has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
p2m_switch_domain_altp2m_by_id+0x1ee/0x240 dest =
arch/x86/hvm/vmx/vmx.c#vmx_vcpu_update_eptp has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
p2m_get_nestedp2m_locked+0x18/0x780 dest nvmx_vcpu_eptp_base has no =
endbr64
(XEN) [2025-02-16 21:56:40.182] altcall p2m_get_p2m+0x2c/0x50 dest =
nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall np2m_schedule+0x4b/0x260 dest =
nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall np2m_schedule+0x99/0x260 dest =
nvmx_vcpu_eptp_base has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall paging_gva_to_gfn+0x67/0x130 =
dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall paging_gva_to_gfn+0xca/0x130 =
dest nvmx_hap_walk_L1_p2m has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall paging_get_mode+0x27/0x50 dest =
nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
paging_update_nestedmode+0x15/0x50 dest nvmx_ept_enabled has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch/x86/domain.c#cpu_policy_updated+0x14/0x20 dest =
arch/x86/hvm/vmx/vmx.c#vmx_cpuid_policy_changed has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
update_guest_memory_policy+0x2a/0x70 dest nvmx_ept_enabled has no =
endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch_domain_creation_finished+0x1c/0x40 dest =
arch/x86/hvm/vmx/vmx.c#domain_creation_finished has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall paging_invlpg+0x6d/0x80 dest =
arch/x86/hvm/vmx/vmx.c#vmx_invlpg has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch_monitor_domctl_event+0x11d/0x700 dest =
arch/x86/hvm/vmx/vmx.c#vmx_enable_msr_interception has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall =
arch_monitor_domctl_event+0x38c/0x700 dest =
arch/x86/hvm/vmx/vmx.c#vmx_update_guest_cr has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall __stop_this_cpu+0x1c/0x50 dest =
vmx_cpu_down has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall start_secondary+0x264/0x3e0 dest =
vmx_cpu_up has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall tsc_set_info+0x215/0x240 dest =
arch/x86/hvm/vmx/vmx.c#vmx_set_tsc_offset has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall vm_event_fill_regs+0x5c/0x280 =
dest arch/x86/hvm/vmx/vmx.c#vmx_save_vmcs_ctxt has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall vm_event_fill_regs+0x249/0x280 =
dest arch/x86/hvm/vmx/vmx.c#vmtrace_output_position has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall vm_event_reset_vmtrace+0x10/0x20 =
dest arch/x86/hvm/vmx/vmx.c#vmtrace_reset has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall arch_do_domctl+0x223c/0x2570 =
dest arch/x86/hvm/vmx/vmx.c#vmtrace_set_option has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall arch_do_domctl+0x2262/0x2570 =
dest arch/x86/hvm/vmx/vmx.c#vmtrace_control has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall arch_do_domctl+0x2280/0x2570 =
dest arch/x86/hvm/vmx/vmx.c#vmtrace_output_position has no endbr64
(XEN) [2025-02-16 21:56:40.182] altcall arch_do_domctl+0x22d1/0x2570 =
dest arch/x86/hvm/vmx/vmx.c#vmtrace_get_option has no endbr64
(XEN) [2025-02-16 21:56:40.326] Brought up 8 CPUs
(XEN) [2025-02-16 21:56:40.336] Scheduling granularity: cpu, 1 CPU per =
sched-resource
(XEN) [2025-02-16 21:56:40.336] Initializing Credit2 scheduler
(XEN) [2025-02-16 21:56:40.336]  load_precision_shift: 18
(XEN) [2025-02-16 21:56:40.336]  load_window_shift: 30
(XEN) [2025-02-16 21:56:40.336]  underload_balance_tolerance: 0
(XEN) [2025-02-16 21:56:40.336]  overload_balance_tolerance: -3
(XEN) [2025-02-16 21:56:40.336]  runqueues arrangement: socket
(XEN) [2025-02-16 21:56:40.336]  cap enforcement granularity: 10ms
(XEN) [2025-02-16 21:56:40.336] load tracking window length 1073741824 =
ns
(XEN) [2025-02-16 21:56:40.336] Adding cpu 0 to runqueue 0
(XEN) [2025-02-16 21:56:40.336]  First cpu on runqueue, activating
(XEN) [2025-02-16 21:56:40.336] Adding cpu 1 to runqueue 0
(XEN) [2025-02-16 21:56:40.336] Adding cpu 2 to runqueue 0
(XEN) [2025-02-16 21:56:40.336] Adding cpu 3 to runqueue 0
(XEN) [2025-02-16 21:56:40.336] Adding cpu 4 to runqueue 1
(XEN) [2025-02-16 21:56:40.336]  First cpu on runqueue, activating
(XEN) [2025-02-16 21:56:40.336] Adding cpu 5 to runqueue 1
(XEN) [2025-02-16 21:56:40.336] Adding cpu 6 to runqueue 1
(XEN) [2025-02-16 21:56:40.336] Adding cpu 7 to runqueue 1
(XEN) [2025-02-16 21:56:40.336] mcheck_poll: Machine check polling timer =
started.
(XEN) [2025-02-16 21:56:40.336] Running stub recovery selftests...
(XEN) [2025-02-16 21:56:40.336] Fixup #UD[0000]: ffff82d07fffe044 =
[ffff82d07fffe044] -> ffff82d0403a4be5
(XEN) [2025-02-16 21:56:40.336] Fixup #GP[0000]: ffff82d07fffe045 =
[ffff82d07fffe045] -> ffff82d0403a4be5
(XEN) [2025-02-16 21:56:40.336] Fixup #SS[0000]: ffff82d07fffe044 =
[ffff82d07fffe044] -> ffff82d0403a4be5
(XEN) [2025-02-16 21:56:40.336] Fixup #BP[0000]: ffff82d07fffe045 =
[ffff82d07fffe045] -> ffff82d0403a4be5
(XEN) [2025-02-16 21:56:40.336] HPET: 0 timers usable for broadcast (3 =
total)
(XEN) [2025-02-16 21:56:40.336] ../arch/x86/time.c:1391: CMOS aliased at =
74, index r/w
(XEN) [2025-02-16 21:56:40.336] NX (Execute Disable) protection active
(XEN) [2025-02-16 21:56:40.336] d0 has maximum 1664 PIRQs
(XEN) [2025-02-16 21:56:40.337] *** Building a PV Dom0 ***
(XEN) [2025-02-16 21:56:40.337] ELF: phdr: paddr=3D0xffffffff80200000 =
memsz=3D0xe68000
(XEN) [2025-02-16 21:56:40.337] ELF: memory: 0xffffffff80200000 -> =
0xffffffff81068000
(XEN) [2025-02-16 21:56:40.337] ELF: note: GUEST_OS =3D "NetBSD"
(XEN) [2025-02-16 21:56:40.337] ELF: note: GUEST_VERSION =3D "9.99"
(XEN) [2025-02-16 21:56:40.337] ELF: note: XEN_VERSION =3D "xen-3.0"
(XEN) [2025-02-16 21:56:40.337] ELF: note: VIRT_BASE =3D =
0xffffffff80000000
(XEN) [2025-02-16 21:56:40.337] ELF: note: PADDR_OFFSET =3D =
0xffffffff80000000
(XEN) [2025-02-16 21:56:40.337] ELF: note: ENTRY =3D 0xffffffff8023c000
(XEN) [2025-02-16 21:56:40.337] ELF: note: HYPERCALL_PAGE =3D =
0xffffffff8023d000
(XEN) [2025-02-16 21:56:40.337] ELF: note: HV_START_LOW =3D =
0xffff800000000000
(XEN) [2025-02-16 21:56:40.337] ELF: note: FEATURES =3D =
"writable_descriptor_tables|auto_translated_physmap|supervisor_mode_kernel=
|hvm_callback_vector"
(XEN) [2025-02-16 21:56:40.337] ELF: note: PAE_MODE =3D "yes"
(XEN) [2025-02-16 21:56:40.337] ELF: note: L1_MFN_VALID
(XEN) [2025-02-16 21:56:40.337] ELF: note: LOADER =3D "generic"
(XEN) [2025-02-16 21:56:40.337] ELF: note: SUSPEND_CANCEL =3D 0
(XEN) [2025-02-16 21:56:40.337] ELF: note: BSD_SYMTAB =3D "yes"
(XEN) [2025-02-16 21:56:40.337] ELF: using notes from SHT_NOTE section
(XEN) [2025-02-16 21:56:40.337] ELF: addresses:
(XEN) [2025-02-16 21:56:40.337]     virt_base        =3D =
0xffffffff80000000
(XEN) [2025-02-16 21:56:40.337]     elf_paddr_offset =3D =
0xffffffff80000000
(XEN) [2025-02-16 21:56:40.337]     virt_offset      =3D 0x0
(XEN) [2025-02-16 21:56:40.337]     virt_kstart      =3D =
0xffffffff80200000
(XEN) [2025-02-16 21:56:40.337]     virt_kend        =3D =
0xffffffff811b5bd8
(XEN) [2025-02-16 21:56:40.337]     virt_entry       =3D =
0xffffffff8023c000
(XEN) [2025-02-16 21:56:40.337]     p2m_base         =3D =
0xffffffffffffffff
(XEN) [2025-02-16 21:56:40.337]  Xen  kernel: 64-bit, lsb
(XEN) [2025-02-16 21:56:40.337]  Dom0 kernel: 64-bit, lsb, paddr =
0xffffffff80200000 -> 0xffffffff81068000
(XEN) [2025-02-16 21:56:40.337]  Dom0 symbol map 0xffffffff81068000 -> =
0xffffffff811b5bd8
(XEN) [2025-02-16 21:56:40.337] PHYSICAL MEMORY ARRANGEMENT:
(XEN) [2025-02-16 21:56:40.337]  Dom0 alloc.:   =
0000000864000000->0000000868000000 (5226496 pages to be allocated)
(XEN) [2025-02-16 21:56:40.337] VIRTUAL MEMORY ARRANGEMENT:
(XEN) [2025-02-16 21:56:40.337]  Loaded kernel: =
ffffffff80200000->ffffffff811b5bd8
(XEN) [2025-02-16 21:56:40.337]  Phys-Mach map: =
ffffffff811b6000->ffffffff839b6000
(XEN) [2025-02-16 21:56:40.337]  Start info:    =
ffffffff839b6000->ffffffff839b64b8
(XEN) [2025-02-16 21:56:40.337]  Page tables:   =
ffffffff839b7000->ffffffff839d8000
(XEN) [2025-02-16 21:56:40.337]  Boot stack:    =
ffffffff839d8000->ffffffff839d9000
(XEN) [2025-02-16 21:56:40.337]  TOTAL:         =
ffffffff80000000->ffffffff83c00000
(XEN) [2025-02-16 21:56:40.337]  ENTRY ADDRESS: ffffffff8023c000
(XEN) [2025-02-16 21:56:40.338] Dom0 has maximum 8 VCPUs
(XEN) [2025-02-16 21:56:40.338] ELF: phdr 0 at 0xffffffff80200000 -> =
0xffffffff80ef58f8
(XEN) [2025-02-16 21:56:40.551] Initial low memory virq threshold set at =
0x4000 pages.
(XEN) [2025-02-16 21:56:40.551] Std. Loglevel: All
(XEN) [2025-02-16 21:56:40.551] Guest Loglevel: All
(XEN) [2025-02-16 21:56:40.551] *** Serial input to DOM0 (type 'CTRL-a' =
three times to switch input)
(XEN) [2025-02-16 21:56:40.551] Freed 672kB init memory
(XEN) [2025-02-16 21:56:40.551] ----[ Xen-4.20-rc  x86_64  debug=3Dy  =
Not tainted ]----
(XEN) [2025-02-16 21:56:40.551] CPU:    0
(XEN) [2025-02-16 21:56:40.551] RIP:    e008:[<ffff82d040201015>] =
_stextentry+0x15/0x165
(XEN) [2025-02-16 21:56:40.551] RFLAGS: 0000000000010082   CONTEXT: =
hypervisor (d0v0)
(XEN) [2025-02-16 21:56:40.551] rax: 00000000000000ff   rbx: =
ffff83086add9000   rcx: ffff82d0405f6000
(XEN) [2025-02-16 21:56:40.551] rdx: 0000000000000000   rsi: =
fffffffffffffee1   rdi: 0000000000000000
(XEN) [2025-02-16 21:56:40.551] rbp: ffff83087ef07de8   rsp: =
ffff83087ef07ef8   r8:  0000000000000000
(XEN) [2025-02-16 21:56:40.551] r9:  ffff83087eef3b00   r10: =
0000000000000000   r11: 0000000000000001
(XEN) [2025-02-16 21:56:40.551] r12: ffff83087eef1000   r13: =
ffff83087ef07ef8   r14: ffff83086adf8000
(XEN) [2025-02-16 21:56:40.551] r15: 0000000000000000   cr0: =
000000008005003b   cr4: 00000000000026e0
(XEN) [2025-02-16 21:56:40.551] cr3: 00000008679b7000   cr2: =
0000000000000000
(XEN) [2025-02-16 21:56:40.551] fsb: 0000000000000000   gsb: =
0000000000000000   gss: 0000000000000000
(XEN) [2025-02-16 21:56:40.551] ds: 0000   es: 0000   fs: 0000   gs: =
0000   ss: 0000   cs: e008
(XEN) [2025-02-16 21:56:40.551] Xen code around <ffff82d040201015> =
(_stextentry+0x15/0x165):
(XEN) [2025-02-16 21:56:40.551]  08 48 8b 93 68 0d 00 00 <44> 8b 3a 4c =
8b 8b 28 0b 00 00 ba ff 7f 00 00 48
(XEN) [2025-02-16 21:56:40.551] Xen stack trace from =
rsp=3Dffff83087ef07ef8:
(XEN) [2025-02-16 21:56:40.551]    0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    0000000000000000 ffffffff839b6000 =
0000000000000000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    ffffffff8023c000 000000000000e033 =
0000000000000200 ffffffff839d9000
(XEN) [2025-02-16 21:56:40.551]    000000000000e02b 0000000000000000 =
0000000000000000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    0000000000000000 0000e01000000000 =
ffff83086add9000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    00000000000026e0 0000000000000000 =
0000000000000000 0000000000000000
(XEN) [2025-02-16 21:56:40.551]    0000000000000000
(XEN) [2025-02-16 21:56:40.551] Xen call trace:
(XEN) [2025-02-16 21:56:40.551]    [<ffff82d040201015>] R =
_stextentry+0x15/0x165
(XEN) [2025-02-16 21:56:40.551]
(XEN) [2025-02-16 21:56:40.551] Pagetable walk from 0000000000000000:
(XEN) [2025-02-16 21:56:40.551]  L4[0x000] =3D 0000000000000000 =
ffffffffffffffff
(XEN) [2025-02-16 21:56:42.981]
(XEN) [2025-02-16 21:56:42.984] ****************************************
(XEN) [2025-02-16 21:56:42.990] Panic on CPU 0:
(XEN) [2025-02-16 21:56:42.994] FATAL PAGE FAULT
(XEN) [2025-02-16 21:56:42.999] [error_code=3D0000]
(XEN) [2025-02-16 21:56:43.003] Faulting linear address: =
0000000000000000
(XEN) [2025-02-16 21:56:43.010] ****************************************
(XEN) [2025-02-16 21:56:43.016]
(XEN) [2025-02-16 21:56:43.019] Reboot in five seconds...


--
					Greg A. Woods <gwoods@acm.org>

Kelowna, BC     +1 250 762-7675           RoboHack <woods@robohack.ca>
Planix, Inc. <woods@planix.com>     Avoncote Farms <woods@avoncote.ca>



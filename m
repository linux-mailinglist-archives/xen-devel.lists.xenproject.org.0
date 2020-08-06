Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111EA23E4D5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:50:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3peA-00058Z-3R; Thu, 06 Aug 2020 23:50:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pe7-0004FE-NY
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:50:03 +0000
X-Inumbo-ID: acef60d6-8127-41b1-b47d-007f07aad2ee
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acef60d6-8127-41b1-b47d-007f07aad2ee;
 Thu, 06 Aug 2020 23:49:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABBB022D05;
 Thu,  6 Aug 2020 23:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757784;
 bh=yQnpCwRzQRezG1HLCjIgl3OYzzzq49k+wYugXLQJyAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GoPnk3i/qJwzSEur0lzoCIjYmaYRcSzecusHlF0ttuHjXBZJnobJ1Lhmn6/6i0HVq
 Eyab6U0bEr2uhbV4T9SRO/VG8iSBrmYslv5z6eDpPIM+LUgL4lrU+aSZVTUEZxlGNj
 //EDQoIqEU7Z6tAyZnWnM5/amKvNQBZ1lvNlQl7U=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 14/14] kernel-doc: public/hvm/params.h
Date: Thu,  6 Aug 2020 16:49:33 -0700
Message-Id: <20200806234933.16448-14-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/hvm/params.h | 158 +++++++++++++++++++++++++-------
 1 file changed, 124 insertions(+), 34 deletions(-)

diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 0a91bfa749..1f2a9fe4f9 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -40,13 +40,16 @@
 
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
 
-/*
+/**
+ * DOC: HVMOP_set_param and HVMOP_get_param
  * Parameter space for HVMOP_{set,get}_param.
  */
 
 #define HVM_PARAM_CALLBACK_IRQ 0
 #define HVM_PARAM_CALLBACK_IRQ_TYPE_MASK xen_mk_ullong(0xFF00000000000000)
-/*
+/**
+ * DOC: HVM_PARAM_CALLBACK_*
+ *
  * How should CPU0 event-channel notifications be delivered?
  *
  * If val == 0 then CPU0 event-channel notifications are not delivered.
@@ -54,26 +57,34 @@
  */
 
 #define HVM_PARAM_CALLBACK_TYPE_GSI      0
-/*
+/**
+ * DOC: HVM_PARAM_CALLBACK_TYPE_GSI
+ *
  * val[55:0] is a delivery GSI.  GSI 0 cannot be used, as it aliases val == 0,
  * and disables all notifications.
  */
 
 #define HVM_PARAM_CALLBACK_TYPE_PCI_INTX 1
-/*
+/**
+ * DOC: HVM_PARAM_CALLBACK_TYPE_PCI_INTX
+ *
  * val[55:0] is a delivery PCI INTx line:
  * Domain = val[47:32], Bus = val[31:16] DevFn = val[15:8], IntX = val[1:0]
  */
 
 #if defined(__i386__) || defined(__x86_64__)
 #define HVM_PARAM_CALLBACK_TYPE_VECTOR   2
-/*
+/**
+ * DOC: HVM_PARAM_CALLBACK_TYPE_VECTOR
+ *
  * val[7:0] is a vector number.  Check for XENFEAT_hvm_callback_vector to know
  * if this delivery method is available.
  */
 #elif defined(__arm__) || defined(__aarch64__)
 #define HVM_PARAM_CALLBACK_TYPE_PPI      2
-/*
+/**
+ * DOC: HVM_PARAM_CALLBACK_TYPE_PPI
+ *
  * val[55:16] needs to be zero.
  * val[15:8] is interrupt flag of the PPI used by event-channel:
  *  bit 8: the PPI is edge(1) or level(0) triggered
@@ -86,7 +97,9 @@
 #define HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_LOW_LEVEL 2
 #endif
 
-/*
+/**
+ * DOC: HVM_PARAM_STORE_*, HVM_PARAM_IOREQ_PFN, HVM_PARAM_BUFIOREQ_PFN
+ *
  * These are not used by Xen. They are here for convenience of HVM-guest
  * xenbus implementations.
  */
@@ -99,7 +112,9 @@
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
+/**
+ * DOC: HVM_PARAM_VIRIDIAN
+ *
  * Viridian enlightenments
  *
  * (See http://download.microsoft.com/download/A/B/4/AB43A34E-BDD0-4FA6-BDEF-79EEF16E880B/Hypervisor%20Top%20Level%20Functional%20Specification%20v4.0.docx)
@@ -110,7 +125,10 @@
  */
 #define HVM_PARAM_VIRIDIAN     9
 
-/* Base+Freq viridian feature sets:
+/**
+ * DOC: HVMPV_base_freq
+ *
+ * Base+Freq viridian feature sets:
  *
  * - Hypercall MSRs (HV_X64_MSR_GUEST_OS_ID and HV_X64_MSR_HYPERCALL)
  * - APIC access MSRs (HV_X64_MSR_EOI, HV_X64_MSR_ICR and HV_X64_MSR_TPR)
@@ -123,7 +141,10 @@
 
 /* Feature set modifications */
 
-/* Disable timer frequency MSRs (HV_X64_MSR_TSC_FREQUENCY and
+/**
+ * DOC: HVMPV_no_freq
+ *
+ * Disable timer frequency MSRs (HV_X64_MSR_TSC_FREQUENCY and
  * HV_X64_MSR_APIC_FREQUENCY).
  * This modification restores the viridian feature set to the
  * original 'base' set exposed in releases prior to Xen 4.4.
@@ -131,35 +152,59 @@
 #define _HVMPV_no_freq 1
 #define HVMPV_no_freq  (1 << _HVMPV_no_freq)
 
-/* Enable Partition Time Reference Counter (HV_X64_MSR_TIME_REF_COUNT) */
+/**
+ * DOC: HVMPV_time_ref_count
+ * Enable Partition Time Reference Counter (HV_X64_MSR_TIME_REF_COUNT)
+ */
 #define _HVMPV_time_ref_count 2
 #define HVMPV_time_ref_count  (1 << _HVMPV_time_ref_count)
 
-/* Enable Reference TSC Page (HV_X64_MSR_REFERENCE_TSC) */
+/**
+ * DOC: HVMPV_reference_tsc
+ * Enable Reference TSC Page (HV_X64_MSR_REFERENCE_TSC)
+ */
 #define _HVMPV_reference_tsc 3
 #define HVMPV_reference_tsc  (1 << _HVMPV_reference_tsc)
 
-/* Use Hypercall for remote TLB flush */
+/**
+ * DOC: HVMPV_hcall_remote_tlb_flush
+ * Use Hypercall for remote TLB flush
+ */
 #define _HVMPV_hcall_remote_tlb_flush 4
 #define HVMPV_hcall_remote_tlb_flush (1 << _HVMPV_hcall_remote_tlb_flush)
 
-/* Use APIC assist */
+/**
+ * DOC: HVMPV_apic_assist
+ * Use APIC assist
+ */
 #define _HVMPV_apic_assist 5
 #define HVMPV_apic_assist (1 << _HVMPV_apic_assist)
 
-/* Enable crash MSRs */
+/**
+ * DOC: HVMPV_crash_ctl
+ * Enable crash MSRs
+ */
 #define _HVMPV_crash_ctl 6
 #define HVMPV_crash_ctl (1 << _HVMPV_crash_ctl)
 
-/* Enable SYNIC MSRs */
+/**
+ * DOC: HVMPV_synic
+ * Enable SYNIC MSRs
+ */
 #define _HVMPV_synic 7
 #define HVMPV_synic (1 << _HVMPV_synic)
 
-/* Enable STIMER MSRs */
+/**
+ * DOC: HVMPV_stimer
+ * Enable STIMER MSRs
+ */
 #define _HVMPV_stimer 8
 #define HVMPV_stimer (1 << _HVMPV_stimer)
 
-/* Use Synthetic Cluster IPI Hypercall */
+/**
+ * DOC: HVMPV_hcall_ipi
+ * Use Synthetic Cluster IPI Hypercall
+ */
 #define _HVMPV_hcall_ipi 9
 #define HVMPV_hcall_ipi (1 << _HVMPV_hcall_ipi)
 
@@ -177,7 +222,9 @@
 
 #endif
 
-/*
+/**
+ * DOC: HVM_PARAM_TIMER_MODE
+ *
  * Set mode for virtual timers (currently x86 only):
  *  delay_for_missed_ticks (default):
  *   Do not advance a vcpu's time beyond the correct delivery time for
@@ -202,26 +249,47 @@
 #define HVMPTM_no_missed_ticks_pending   2
 #define HVMPTM_one_missed_tick_pending   3
 
-/* Boolean: Enable virtual HPET (high-precision event timer)? (x86-only) */
+/**
+ * DOC: HVM_PARAM_HPET_ENABLED
+ * Boolean: Enable virtual HPET (high-precision event timer)? (x86-only)
+ */
 #define HVM_PARAM_HPET_ENABLED 11
 
-/* Identity-map page directory used by Intel EPT when CR0.PG=0. */
+/**
+ * DOC: HVM_PARAM_IDENT_PT
+ * Identity-map page directory used by Intel EPT when CR0.PG=0.
+ */
 #define HVM_PARAM_IDENT_PT     12
 
-/* ACPI S state: currently support S0 and S3 on x86. */
+/**
+ * DOC: HVM_PARAM_ACPI_S_STATE
+ * ACPI S state: currently support S0 and S3 on x86.
+ */
 #define HVM_PARAM_ACPI_S_STATE 14
 
-/* TSS used on Intel when CR0.PE=0. */
+/**
+ * DOC: HVM_PARAM_VM86_TSS
+ * TSS used on Intel when CR0.PE=0.
+ */
 #define HVM_PARAM_VM86_TSS     15
 
-/* Boolean: Enable aligning all periodic vpts to reduce interrupts */
+/**
+ * DOC: HVM_PARAM_VPT_ALIGN
+ * Boolean: Enable aligning all periodic vpts to reduce interrupts
+ */
 #define HVM_PARAM_VPT_ALIGN    16
 
-/* Console debug shared memory ring and event channel */
+/**
+ * DOC: HVM_PARAM_CONSOLE_PFN and HVM_PARAM_CONSOLE_EVTCHN
+ *
+ * Console debug shared memory ring and event channel
+ */
 #define HVM_PARAM_CONSOLE_PFN    17
 #define HVM_PARAM_CONSOLE_EVTCHN 18
 
-/*
+/**
+ * DOC: HVM_PARAM_ACPI_IOPORTS_LOCATION
+ *
  * Select location of ACPI PM1a and TMR control blocks. Currently two locations
  * are supported, specified by version 0 or 1 in this parameter:
  *   - 0: default, use the old addresses
@@ -232,24 +300,39 @@
  */
 #define HVM_PARAM_ACPI_IOPORTS_LOCATION 19
 
-/* Boolean: Enable nestedhvm (hvm only) */
+/**
+ * DOC: HVM_PARAM_NESTEDHVM
+ * Boolean: Enable nestedhvm (hvm only)
+ */
 #define HVM_PARAM_NESTEDHVM    24
 
-/* Params for the mem event rings */
+/**
+ * DOC: HVM_PARAM_*_RING_PFN
+ *
+ * Params for the mem event rings
+ */
 #define HVM_PARAM_PAGING_RING_PFN   27
 #define HVM_PARAM_MONITOR_RING_PFN  28
 #define HVM_PARAM_SHARING_RING_PFN  29
 
-/* SHUTDOWN_* action in case of a triple fault */
+/**
+ * DOC: HVM_PARAM_TRIPLE_FAULT_REASON
+ * SHUTDOWN_* action in case of a triple fault
+ */
 #define HVM_PARAM_TRIPLE_FAULT_REASON 31
 
 #define HVM_PARAM_IOREQ_SERVER_PFN 32
 #define HVM_PARAM_NR_IOREQ_SERVER_PAGES 33
 
-/* Location of the VM Generation ID in guest physical address space. */
+/**
+ * DOC: HVM_PARAM_VM_GENERATION_ID_ADDR
+ * Location of the VM Generation ID in guest physical address space.
+ */
 #define HVM_PARAM_VM_GENERATION_ID_ADDR 34
 
-/*
+/**
+ * DOC: HVM_PARAM_ALTP2M
+ *
  * Set mode for altp2m:
  *  disabled: don't activate altp2m (default)
  *  mixed: allow access to all altp2m ops for both in-guest and external tools
@@ -267,7 +350,9 @@
 #define XEN_ALTP2M_external      2
 #define XEN_ALTP2M_limited       3
 
-/*
+/**
+ * DOC: HVM_PARAM_X87_FIP_WIDTH
+ *
  * Size of the x87 FPU FIP/FDP registers that the hypervisor needs to
  * save/restore.  This is a workaround for a hardware limitation that
  * does not allow the full FIP/FDP and FCS/FDS to be restored.
@@ -289,13 +374,18 @@
  */
 #define HVM_PARAM_X87_FIP_WIDTH 36
 
-/*
+/**
+ * DOC: HVM_PARAM_VM86_TSS_SIZED
+ *
  * TSS (and its size) used on Intel when CR0.PE=0. The address occupies
  * the low 32 bits, while the size is in the high 32 ones.
  */
 #define HVM_PARAM_VM86_TSS_SIZED 37
 
-/* Enable MCA capabilities. */
+/**
+ * DOC: HVM_PARAM_MCA_CAP
+ * Enable MCA capabilities.
+ */
 #define HVM_PARAM_MCA_CAP 38
 #define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
 #define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
-- 
2.17.1



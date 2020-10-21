Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01C2945BF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 02:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9806.25963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YX-0000Hc-MM; Wed, 21 Oct 2020 00:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9806.25963; Wed, 21 Oct 2020 00:00:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV1YX-0000G4-CX; Wed, 21 Oct 2020 00:00:41 +0000
Received: by outflank-mailman (input) for mailman id 9806;
 Wed, 21 Oct 2020 00:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kV1YW-0007xs-4R
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d28842fa-b5a9-461b-b7ea-4e791c964b6c;
 Wed, 21 Oct 2020 00:00:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45CEC22453;
 Wed, 21 Oct 2020 00:00:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kV1YW-0007xs-4R
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 00:00:40 +0000
X-Inumbo-ID: d28842fa-b5a9-461b-b7ea-4e791c964b6c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d28842fa-b5a9-461b-b7ea-4e791c964b6c;
	Wed, 21 Oct 2020 00:00:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 45CEC22453;
	Wed, 21 Oct 2020 00:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603238421;
	bh=BD/JHqXrWL/kgaMnyhDk7hBu4c8nq6XJ1V8apUZwUWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MCKJrJJScGS/tkXYj7J1Qc409NSdXcfFozQZ17mb3hvCxrS2HviZVBlqcjuwDgwRk
	 l9z6jY8/LyenYqjdWCZihmzadRFaGdejU9Rxr8ZX9/bU1IGCSf+zISrj/GDXm9eybQ
	 Jsoy94Us+CklVPd20RpdNDZQ0Vv2+ve9J1lWGRFQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	ian.jackson@eu.citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 14/14] kernel-doc: public/hvm/params.h
Date: Tue, 20 Oct 2020 17:00:11 -0700
Message-Id: <20201021000011.15351-14-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/hvm/params.h | 153 +++++++++++++++++++++++++-------
 1 file changed, 120 insertions(+), 33 deletions(-)

diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 0e3fdca096..2017e4334d 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -41,13 +41,16 @@
 
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
@@ -55,26 +58,34 @@
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
@@ -87,7 +98,9 @@
 #define HVM_PARAM_CALLBACK_TYPE_PPI_FLAG_LOW_LEVEL 2
 #endif
 
-/*
+/**
+ * DOC: HVM_PARAM_STORE_*, HVM_PARAM_IOREQ_PFN, HVM_PARAM_BUFIOREQ_PFN
+ *
  * These are not used by Xen. They are here for convenience of HVM-guest
  * xenbus implementations.
  */
@@ -100,7 +113,9 @@
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
+/**
+ * DOC: HVM_PARAM_VIRIDIAN
+ *
  * Viridian enlightenments
  *
  * (See http://download.microsoft.com/download/A/B/4/AB43A34E-BDD0-4FA6-BDEF-79EEF16E880B/Hypervisor%20Top%20Level%20Functional%20Specification%20v4.0.docx)
@@ -111,7 +126,10 @@
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
@@ -124,7 +142,10 @@
 
 /* Feature set modifications */
 
-/* Disable timer frequency MSRs (HV_X64_MSR_TSC_FREQUENCY and
+/**
+ * DOC: HVMPV_no_freq
+ *
+ * Disable timer frequency MSRs (HV_X64_MSR_TSC_FREQUENCY and
  * HV_X64_MSR_APIC_FREQUENCY).
  * This modification restores the viridian feature set to the
  * original 'base' set exposed in releases prior to Xen 4.4.
@@ -132,35 +153,59 @@
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
 
@@ -178,7 +223,9 @@
 
 #endif
 
-/*
+/**
+ * DOC: HVM_PARAM_TIMER_MODE
+ *
  * Set mode for virtual timers (currently x86 only):
  *  delay_for_missed_ticks (default):
  *   Do not advance a vcpu's time beyond the correct delivery time for
@@ -203,26 +250,47 @@
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
@@ -233,21 +301,33 @@
  */
 #define HVM_PARAM_ACPI_IOPORTS_LOCATION 19
 
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
@@ -265,7 +345,9 @@
 #define XEN_ALTP2M_external      2
 #define XEN_ALTP2M_limited       3
 
-/*
+/**
+ * DOC: HVM_PARAM_X87_FIP_WIDTH
+ *
  * Size of the x87 FPU FIP/FDP registers that the hypervisor needs to
  * save/restore.  This is a workaround for a hardware limitation that
  * does not allow the full FIP/FDP and FCS/FDS to be restored.
@@ -287,13 +369,18 @@
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



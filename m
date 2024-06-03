Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06BB8D8145
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 13:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734869.1140990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5tv-0000u1-SN; Mon, 03 Jun 2024 11:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734869.1140990; Mon, 03 Jun 2024 11:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE5tv-0000rW-PQ; Mon, 03 Jun 2024 11:30:55 +0000
Received: by outflank-mailman (input) for mailman id 734869;
 Mon, 03 Jun 2024 11:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0SM=NF=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sE5tu-0000qE-1E
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 11:30:54 +0000
Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bac16c16-219c-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 13:30:51 +0200 (CEST)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id BBBF3273FA;
 Mon,  3 Jun 2024 07:30:49 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp20.pobox.com (Postfix) with ESMTP id B3434273F9;
 Mon,  3 Jun 2024 07:30:49 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C8FBC273F8;
 Mon,  3 Jun 2024 07:30:46 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: bac16c16-219c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=tFMcVJrjymE8LFOeCd5ZgK9a6
	R2CYRHptQF3Am22SyM=; b=DVOuHKfuf0jbFTvrk+Z2anRLLaObxi+C5W7V+h8gv
	zNbmqz7gugEO8GIumxGLcfqVDrzkisKVsSppqm4R1EY7O3k8D0sA1jNXvvXbKyU+
	h2vNbKO7t+PyeEcOuldhUpDh/dr675JR9/E7Z6Z7lj7NC/SnsddtuOZmrfL/Keq8
	KA=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v3 12/16] x86/vmx: guard access to cpu_has_vmx_* in common code
Date: Mon,  3 Jun 2024 14:30:43 +0300
Message-Id: <1645c0d4a5aae7b53cfb166ac10235e12ae4dbb1.1717410850.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 B8A7CE9A-219C-11EF-A069-ACC938F0AE34-90055647!pb-smtp20.pobox.com
Content-Transfer-Encoding: quoted-printable

There're several places in common code, outside of arch/x86/hvm/vmx,
where cpu_has_vmx_* get accessed without checking whether VMX supported f=
irst.
These macros rely on global variables defined in vmx code, so when VMX su=
pport
gets disabled accesses to these variables turn into build failures.

To overcome these failures, build-time check is done before accessing glo=
bal
variables, so that DCE would remove these variables.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v3:
 - using_vmx instead of cpu_has_vmx
 - clarify description on why this change needed
changes in v2:
 - do not touch SVM code and macros
 - drop vmx_ctrl_has_feature()
 - guard cpu_has_vmx_* macros in common code instead
changes in v1:
 - introduced helper routine vmx_ctrl_has_feature() and used it for all
   cpu_has_vmx_* macros
---
 xen/arch/x86/hvm/hvm.c                  |  2 +-
 xen/arch/x86/hvm/viridian/viridian.c    |  4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 12 ++++++------
 xen/arch/x86/traps.c                    |  5 +++--
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 7b8679bcd8..af45c5ed8c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5197,7 +5197,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     {
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
-            if ( !cpu_has_monitor_trap_flag )
+            if ( !using_vmx || !cpu_has_monitor_trap_flag )
                 return -EOPNOTSUPP;
             break;
         default:
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viri=
dian/viridian.c
index 0496c52ed5..59e7e7955a 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint=
32_t leaf,
         res->a =3D CPUID4A_RELAX_TIMER_INT;
         if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
             res->a |=3D CPUID4A_HCALL_REMOTE_TLB_FLUSH;
-        if ( !cpu_has_vmx_apic_reg_virt )
+        if ( !using_vmx || !cpu_has_vmx_apic_reg_virt )
             res->a |=3D CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |=3D CPUID4A_SYNTHETIC_CLUSTER_IPI;
@@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint=
32_t leaf,
=20
     case 6:
         /* Detected and in use hardware features. */
-        if ( cpu_has_vmx_virtualize_apic_accesses )
+        if ( using_vmx && cpu_has_vmx_virtualize_apic_accesses )
             res->a |=3D CPUID6A_APIC_OVERLAY;
         if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
             res->a |=3D CPUID6A_MSR_BITMAPS;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
index 58140af691..713088b8d3 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -306,7 +306,7 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_vnmi \
     (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    (using_vmx && vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BI=
TMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_tertiary_exec_control \
@@ -316,7 +316,7 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_dt_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITIN=
G)
 #define cpu_has_vmx_rdtscp \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+    (using_vmx && vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDT=
SCP)
 #define cpu_has_vmx_vpid \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
@@ -333,7 +333,7 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_ple \
     (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
 #define cpu_has_vmx_invpcid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+    (using_vmx && vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INV=
PCID)
 #define cpu_has_vmx_apic_reg_virt \
     (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \
@@ -347,14 +347,14 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_vmfunc \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    (using_vmx && vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIR=
T_EXCEPTIONS)
 #define cpu_has_vmx_pml \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
-    ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
+    (using_vmx && (vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+    (using_vmx && vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a81f3cf57c..c2f29fc9a4 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1130,7 +1130,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, =
uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf !=3D 0 )
             break;
=20
-        if ( cpu_has_vmx_apic_reg_virt )
+        if ( using_vmx && cpu_has_vmx_apic_reg_virt )
             res->a |=3D XEN_HVM_CPUID_APIC_ACCESS_VIRT;
=20
         /*
@@ -1139,7 +1139,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, =
uint32_t leaf,
          * and wrmsr in the guest will run without VMEXITs (see
          * vmx_vlapic_msr_changed()).
          */
-        if ( cpu_has_vmx_virtualize_x2apic_mode &&
+        if ( using_vmx &&
+             cpu_has_vmx_virtualize_x2apic_mode &&
              cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |=3D XEN_HVM_CPUID_X2APIC_VIRT;
--=20
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8892AFB8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755790.1164271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3yU-0006SM-Ml; Tue, 09 Jul 2024 06:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755790.1164271; Tue, 09 Jul 2024 06:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3yU-0006QG-Jc; Tue, 09 Jul 2024 06:05:14 +0000
Received: by outflank-mailman (input) for mailman id 755790;
 Tue, 09 Jul 2024 06:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGp0=OJ=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sR3yT-0006QA-Dm
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:05:13 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3343987d-3db9-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 08:05:11 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 5709B30741;
 Tue,  9 Jul 2024 02:05:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 32CDC3073F;
 Tue,  9 Jul 2024 02:05:10 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id C77923073E;
 Tue,  9 Jul 2024 02:05:08 -0400 (EDT)
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
X-Inumbo-ID: 3343987d-3db9-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=12DIvQiBfqGFazgmM9pTjg4zu
	CqQ6Op0Vdv30NEs9yM=; b=AsYC1/OeblPfeB6upecBtN3IyBi2DMwkVMDZuT8wd
	s3EbSTSfgadk8uISrs6yhGK5OA2FOU6nOJv/toyg3eLI+Ce5RTZu/YwWM3BK82BX
	B/VIkQAXumVfdFLQkn6i02qhthgSnubgc4PHSlVucB7UWTMGEeOl07Rm4sGKJlfP
	KM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v4 10/14] x86/vmx: guard access to cpu_has_vmx_* in common code
Date: Tue,  9 Jul 2024 09:05:06 +0300
Message-Id: <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 31FD8298-3DB9-11EF-AE25-5B6DE52EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

There're several places in common code, outside of arch/x86/hvm/vmx,
where cpu_has_vmx_* get accessed without checking whether VMX supported f=
irst.
These macros rely on global variables defined in vmx code, so when VMX su=
pport
is disabled accesses to these variables turn into build failures.

To overcome these failures, build-time check is done before accessing glo=
bal
variables, so that DCE would remove these variables.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v4:
 - use IS_ENABLED(CONFIG_VMX) instead of using_vmx
changes in v3:
 - using_vmx instead of cpu_has_vmx
 - clarify description on why this change needed
changes in v2:
 - do not touch SVM code and macros
 - drop vmx_ctrl_has_feature()
 - guard cpu_has_vmx_* macros in common code instead
---
 xen/arch/x86/hvm/hvm.c                  |  2 +-
 xen/arch/x86/hvm/viridian/viridian.c    |  4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 17 +++++++++++------
 xen/arch/x86/traps.c                    |  5 +++--
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 057c61b4c3..be4d8ddfe7 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5197,7 +5197,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     {
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
-            if ( !cpu_has_monitor_trap_flag )
+            if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_monitor_trap_flag )
                 return -EOPNOTSUPP;
             break;
         default:
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viri=
dian/viridian.c
index 0496c52ed5..6f13ecf343 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint=
32_t leaf,
         res->a =3D CPUID4A_RELAX_TIMER_INT;
         if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
             res->a |=3D CPUID4A_HCALL_REMOTE_TLB_FLUSH;
-        if ( !cpu_has_vmx_apic_reg_virt )
+        if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_vmx_apic_reg_virt )
             res->a |=3D CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |=3D CPUID4A_SYNTHETIC_CLUSTER_IPI;
@@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint=
32_t leaf,
=20
     case 6:
         /* Detected and in use hardware features. */
-        if ( cpu_has_vmx_virtualize_apic_accesses )
+        if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx_virtualize_apic_acces=
ses )
             res->a |=3D CPUID6A_APIC_OVERLAY;
         if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
             res->a |=3D CPUID6A_MSR_BITMAPS;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
index 58140af691..7421453899 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -306,7 +306,8 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_vnmi \
     (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    (IS_ENABLED(CONFIG_VMX) && \
+     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_tertiary_exec_control \
@@ -316,7 +317,8 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_dt_exiting \
     (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITIN=
G)
 #define cpu_has_vmx_rdtscp \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+    (IS_ENABLED(CONFIG_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
 #define cpu_has_vmx_vpid \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
@@ -333,7 +335,8 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_ple \
     (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
 #define cpu_has_vmx_invpcid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+    (IS_ENABLED(CONFIG_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
 #define cpu_has_vmx_apic_reg_virt \
     (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \
@@ -347,14 +350,16 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_vmfunc \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    (IS_ENABLED(CONFIG_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
 #define cpu_has_vmx_pml \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
-    ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
+    (IS_ENABLED(CONFIG_VMX) && (vmx_vmexit_control & VM_EXIT_CLEAR_BNDCF=
GS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+    (IS_ENABLED(CONFIG_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d2af6d70d2..27115712a4 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1130,7 +1130,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, =
uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf !=3D 0 )
             break;
=20
-        if ( cpu_has_vmx_apic_reg_virt )
+        if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx_apic_reg_virt )
             res->a |=3D XEN_HVM_CPUID_APIC_ACCESS_VIRT;
=20
         /*
@@ -1139,7 +1139,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, =
uint32_t leaf,
          * and wrmsr in the guest will run without VMEXITs (see
          * vmx_vlapic_msr_changed()).
          */
-        if ( cpu_has_vmx_virtualize_x2apic_mode &&
+        if ( IS_ENABLED(CONFIG_VMX) &&
+             cpu_has_vmx_virtualize_x2apic_mode &&
              cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |=3D XEN_HVM_CPUID_X2APIC_VIRT;
--=20
2.25.1



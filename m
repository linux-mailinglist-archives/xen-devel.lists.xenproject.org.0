Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A68A643F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706656.1103947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcY7-0001ZK-F1; Tue, 16 Apr 2024 06:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706656.1103947; Tue, 16 Apr 2024 06:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwcY7-0001Xn-C8; Tue, 16 Apr 2024 06:44:11 +0000
Received: by outflank-mailman (input) for mailman id 706656;
 Tue, 16 Apr 2024 06:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwcY6-0001WR-0p
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:44:10 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8a60b5e-fbbc-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:44:07 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 50C931D0A19;
 Tue, 16 Apr 2024 02:44:06 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 47E661D0A18;
 Tue, 16 Apr 2024 02:44:06 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id AD61A1D0A16;
 Tue, 16 Apr 2024 02:44:04 -0400 (EDT)
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
X-Inumbo-ID: b8a60b5e-fbbc-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=/uREAnj7xyFJAn9t5tyenZ0Ga3osS5TtM/XEUFZgq9E=; b=FCff
	Z3V7kiluft6lCJ2isGbY/1lJ/h+y7judJJfBQqI5ZpipjRsLoTKmIyouhvAIBIqM
	Ztyb1g2nseUcOaSZ252VLb6PES0yr0pvrXBH1Q+3kcFtO+c4v4WUVXqKemGW7hES
	XP6E2U67qsh0xsPuPkTbwOaCvk9YADE3p9qVbJg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 12/15] x86/vmx: introduce helper function for vmcs macro
Date: Tue, 16 Apr 2024 09:44:02 +0300
Message-Id: <20240416064402.3469959-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 B791BC6A-FBBC-11EE-A9C4-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

Instead of directly accessing control variables from vmcs macros let
intermediate helper routine vmx_ctrl_has_feature() do it. This way
we can turn all the VMX-related macros off, if building for non VT-d plat=
form,
by tweaking only a single helper's function behaviour.

No functional change intended.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 89 ++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 28 +++++---
 2 files changed, 74 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
index a7dd2eeffc..fd197e2603 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -287,6 +287,11 @@ extern uint64_t vmx_tertiary_exec_control;
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000UL=
L
 extern u64 vmx_ept_vpid_cap;
=20
+static inline bool vmx_ctrl_has_feature(uint64_t control, unsigned long =
feature)
+{
+    return control & feature;
+}
+
 #define VMX_MISC_ACTIVITY_MASK                  0x000001c0
 #define VMX_MISC_PROC_TRACE                     0x00004000
 #define VMX_MISC_CR3_TARGET                     0x01ff0000
@@ -295,69 +300,89 @@ extern u64 vmx_ept_vpid_cap;
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
=20
 #define cpu_has_wbinvd_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSE=
S)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control,\
+                         SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)
 #define cpu_has_vmx_tpr_shadow \
-    (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
+    vmx_ctrl_has_feature(vmx_cpu_based_exec_control, CPU_BASED_TPR_SHADO=
W)
 #define cpu_has_vmx_vnmi \
-    (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
+    vmx_ctrl_has_feature(vmx_pin_based_exec_control, PIN_BASED_VIRTUAL_N=
MIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    vmx_ctrl_has_feature(vmx_cpu_based_exec_control, \
+                         CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+    vmx_ctrl_has_feature(vmx_cpu_based_exec_control, \
+                         CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_tertiary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
+    vmx_ctrl_has_feature(vmx_cpu_based_exec_control, \
+                         CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, SECONDARY_EXEC_ENAB=
LE_EPT)
 #define cpu_has_vmx_dt_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITIN=
G)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITING)
 #define cpu_has_vmx_rdtscp \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_ENABLE_RDTSCP)
 #define cpu_has_vmx_vpid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
-    (vmx_cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
+    vmx_ctrl_has_feature(vmx_cpu_based_exec_control, \
+                         CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
+    vmx_ctrl_has_feature(vmx_vmentry_control, VM_ENTRY_LOAD_GUEST_PAT)
 #define cpu_has_vmx_efer \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
+    vmx_ctrl_has_feature(vmx_vmentry_control, VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define vmx_unrestricted_guest(v)               \
     ((v)->arch.hvm.vmx.secondary_exec_control & \
      SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define cpu_has_vmx_ple \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_PAUSE_LOOP_EXITING)
 #define cpu_has_vmx_invpcid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_ENABLE_INVPCID)
 #define cpu_has_vmx_apic_reg_virt \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
 #define cpu_has_vmx_virtualize_x2apic_mode \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
-    (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
+    vmx_ctrl_has_feature(vmx_pin_based_exec_control, PIN_BASED_POSTED_IN=
TERRUPT)
 #define cpu_has_vmx_vmcs_shadowing \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
 #define cpu_has_vmx_vmfunc \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
 #define cpu_has_vmx_pml \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, SECONDARY_EXEC_ENAB=
LE_PML)
 #define cpu_has_vmx_mpx \
-    ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
-     (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
+    (vmx_ctrl_has_feature(vmx_vmexit_control, VM_EXIT_CLEAR_BNDCFGS) && =
\
+     vmx_ctrl_has_feature(vmx_vmentry_control, VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, SECONDARY_EXEC_XSAV=
ES)
 #define cpu_has_vmx_tsc_scaling \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, SECONDARY_EXEC_TSC_=
SCALING)
 #define cpu_has_vmx_bus_lock_detection \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+    vmx_ctrl_has_feature(vmx_secondary_exec_control, \
+                         SECONDARY_EXEC_NOTIFY_VM_EXITING)
=20
 #define VMCS_RID_TYPE_MASK              0x80000000U
=20
@@ -381,7 +406,7 @@ extern u64 vmx_ept_vpid_cap;
=20
 extern u64 vmx_basic_msr;
 #define cpu_has_vmx_ins_outs_instr_info \
-    (!!(vmx_basic_msr & VMX_BASIC_INS_OUT_INFO))
+    (!!vmx_ctrl_has_feature(vmx_basic_msr, VMX_BASIC_INS_OUT_INFO))
=20
 /* Guest interrupt status */
 #define VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK  0x0FF
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/includ=
e/asm/hvm/vmx/vmx.h
index 8ffab7d94c..587772dc51 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -279,17 +279,22 @@ typedef union cr_access_qual {
 extern uint8_t posted_intr_vector;
=20
 #define cpu_has_vmx_ept_exec_only_supported        \
-    (vmx_ept_vpid_cap & VMX_EPT_EXEC_ONLY_SUPPORTED)
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_EXEC_ONLY_SUPPORTED)
=20
 #define cpu_has_vmx_ept_wl4_supported           \
-    (vmx_ept_vpid_cap & VMX_EPT_WALK_LENGTH_4_SUPPORTED)
-#define cpu_has_vmx_ept_mt_uc (vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_UC=
)
-#define cpu_has_vmx_ept_mt_wb (vmx_ept_vpid_cap & VMX_EPT_MEMORY_TYPE_WB=
)
-#define cpu_has_vmx_ept_2mb   (vmx_ept_vpid_cap & VMX_EPT_SUPERPAGE_2MB)
-#define cpu_has_vmx_ept_1gb   (vmx_ept_vpid_cap & VMX_EPT_SUPERPAGE_1GB)
-#define cpu_has_vmx_ept_ad    (vmx_ept_vpid_cap & VMX_EPT_AD_BIT)
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_WALK_LENGTH_4_SUPPORT=
ED)
+#define cpu_has_vmx_ept_mt_uc \
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_MEMORY_TYPE_UC)
+#define cpu_has_vmx_ept_mt_wb \
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_MEMORY_TYPE_WB)
+#define cpu_has_vmx_ept_2mb \
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_SUPERPAGE_2MB)
+#define cpu_has_vmx_ept_1gb \
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_SUPERPAGE_1GB)
+#define cpu_has_vmx_ept_ad \
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_AD_BIT)
 #define cpu_has_vmx_ept_invept_single_context   \
-    (vmx_ept_vpid_cap & VMX_EPT_INVEPT_SINGLE_CONTEXT)
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_EPT_INVEPT_SINGLE_CONTEXT=
)
=20
 #define EPT_2MB_SHIFT     16
 #define EPT_1GB_SHIFT     17
@@ -300,11 +305,12 @@ extern uint8_t posted_intr_vector;
 #define INVEPT_ALL_CONTEXT      2
=20
 #define cpu_has_vmx_vpid_invvpid_individual_addr                    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_INDIVIDUAL_ADDR)
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_VPID_INVVPID_INDIVIDUAL_A=
DDR)
 #define cpu_has_vmx_vpid_invvpid_single_context                     \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT)
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, VMX_VPID_INVVPID_SINGLE_CONTE=
XT)
 #define cpu_has_vmx_vpid_invvpid_single_context_retaining_global    \
-    (vmx_ept_vpid_cap & VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL=
)
+    vmx_ctrl_has_feature(vmx_ept_vpid_cap, \
+                         VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBA=
L)
=20
 #define INVVPID_INDIVIDUAL_ADDR                 0
 #define INVVPID_SINGLE_CONTEXT                  1
--=20
2.25.1



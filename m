Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180F94BA85
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 12:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773850.1184286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc04q-000135-GF; Thu, 08 Aug 2024 10:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773850.1184286; Thu, 08 Aug 2024 10:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc04q-00010V-Cd; Thu, 08 Aug 2024 10:09:00 +0000
Received: by outflank-mailman (input) for mailman id 773850;
 Thu, 08 Aug 2024 10:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkzM=PH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1sc04o-00010O-VO
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 10:08:59 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e74763-556e-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 12:08:57 +0200 (CEST)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 2437531CAF;
 Thu,  8 Aug 2024 06:08:55 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 1C52931CAE;
 Thu,  8 Aug 2024 06:08:55 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 8FC1A31CAD;
 Thu,  8 Aug 2024 06:08:50 -0400 (EDT)
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
X-Inumbo-ID: 38e74763-556e-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=rLkBK7EmUw733LUBbAQ/wJYe5
	yKogIWbC4rHjZir5Ao=; b=bto60RDINWmeaM2SuyuKtMc1rGwz+0SGPAjVuNu3c
	9982G0z6rUQts0Sz5JvbxcuSlx9ANPGbTikadmo5nwrI9QwIgpIHKaWZJIJrkZJY
	3L6AyAO3v4K1Pf9TCFraZhh8wtD+4KD2hWwNMRvM5x+e3VQ1Vkltl/55KmZf9YLB
	vk=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v6 1/3] x86/vmx: guard access to cpu_has_vmx_* in common code
Date: Thu,  8 Aug 2024 13:08:46 +0300
Message-Id: <6486b627fd3bdcca3ad877ed6c97ca5cbc51d8e3.1723110344.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
References: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 359DBB58-556E-11EF-AD78-E92ED1CD468F-90055647!pb-smtp21.pobox.com
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
Acked-by: Paul Durrant <paul@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
changes in v6:
 - guard all of cpu_has_vmx_* macros
changes in v5:
 - change kconfig option name VMX -> INTEL_VMX
 - do not change .c files, only modify macros in vmcs.h
changes in v4:
 - use IS_ENABLED(CONFIG_VMX) instead of using_vmx
---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 90 ++++++++++++++++---------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
index 58140af691..939b87eb50 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -298,69 +298,99 @@ extern u64 vmx_ept_vpid_cap;
 #define VMX_TSC_MULTIPLIER_MAX                  0xffffffffffffffffULL
=20
 #define cpu_has_wbinvd_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_WBINVD_EXITING)
 #define cpu_has_vmx_virtualize_apic_accesses \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSE=
S)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSE=
S)
 #define cpu_has_vmx_tpr_shadow \
-    (vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_cpu_based_exec_control & CPU_BASED_TPR_SHADOW)
 #define cpu_has_vmx_vnmi \
-    (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_tertiary_exec_control \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_TERTIARY_CONTROLS)
 #define cpu_has_vmx_ept \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_EPT)
 #define cpu_has_vmx_dt_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITIN=
G)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_DESCRIPTOR_TABLE_EXITIN=
G)
 #define cpu_has_vmx_rdtscp \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_RDTSCP)
 #define cpu_has_vmx_vpid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VPID)
 #define cpu_has_monitor_trap_flag \
-    (vmx_cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_cpu_based_exec_control & CPU_BASED_MONITOR_TRAP_FLAG)
 #define cpu_has_vmx_pat \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_PAT)
 #define cpu_has_vmx_efer \
-    (vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_vmentry_control & VM_ENTRY_LOAD_GUEST_EFER)
 #define cpu_has_vmx_unrestricted_guest \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define vmx_unrestricted_guest(v)               \
     ((v)->arch.hvm.vmx.secondary_exec_control & \
      SECONDARY_EXEC_UNRESTRICTED_GUEST)
 #define cpu_has_vmx_ple \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_PAUSE_LOOP_EXITING)
 #define cpu_has_vmx_invpcid \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_INVPCID)
 #define cpu_has_vmx_apic_reg_virt \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_APIC_REGISTER_VIRT)
 #define cpu_has_vmx_virtual_intr_delivery \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY)
 #define cpu_has_vmx_virtualize_x2apic_mode \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE)
 #define cpu_has_vmx_posted_intr_processing \
-    (vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_pin_based_exec_control & PIN_BASED_POSTED_INTERRUPT)
 #define cpu_has_vmx_vmcs_shadowing \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VMCS_SHADOWING)
 #define cpu_has_vmx_vmfunc \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
 #define cpu_has_vmx_pml \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
-    ((vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     (vmx_vmexit_control & VM_EXIT_CLEAR_BNDCFGS) && \
      (vmx_vmentry_control & VM_ENTRY_LOAD_BNDCFGS))
 #define cpu_has_vmx_xsaves \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 #define cpu_has_vmx_notify_vm_exiting \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
+    (IS_ENABLED(CONFIG_INTEL_VMX) && \
+     vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
=20
 #define VMCS_RID_TYPE_MASK              0x80000000U
=20
--=20
2.25.1



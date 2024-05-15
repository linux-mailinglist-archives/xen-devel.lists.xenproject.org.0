Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAD8C6398
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722085.1125928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AqT-0001O1-HQ; Wed, 15 May 2024 09:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722085.1125928; Wed, 15 May 2024 09:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AqT-0001M5-Eq; Wed, 15 May 2024 09:22:45 +0000
Received: by outflank-mailman (input) for mailman id 722085;
 Wed, 15 May 2024 09:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJut=MS=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1s7AqR-0001Lx-VX
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:22:44 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae898d4c-129c-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 11:22:43 +0200 (CEST)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 065C2354C2;
 Wed, 15 May 2024 05:22:42 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id F17AB354C1;
 Wed, 15 May 2024 05:22:41 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 2DF7B354C0;
 Wed, 15 May 2024 05:22:40 -0400 (EDT)
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
X-Inumbo-ID: ae898d4c-129c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=tJNFbcXuEgYbrw2Axr3CVP5ay
	5NL+SPdbHdUF/h0LRg=; b=jt8Mq1AGP4+oII64Bn3PXSibqbibUvfLBESky3FfJ
	90oYUrtwv20hIhw8vR43aOW1L4UqhXCclV9lxCHV42YCcMjF+5CjyitlCTJeY6uL
	HlqUr/gcpf1zIFom2JkHfd5oHIqu2Q1UqRgPHBRVhE0ioCMD7UtF7sVHvxTOHgGd
	c8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2 12/15] x86/vmx: guard access to cpu_has_vmx_* in common code
Date: Wed, 15 May 2024 12:22:39 +0300
Message-Id: <c1f40e8e9a35f7e9ba55adc44a9fe93d48749c92.1715761386.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 ADD01248-129C-11EF-BAA2-25B3960A682E-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

There're several places in common code, outside of arch/x86/hvm/vmx,
where cpu_has_vmx_* get accessed without checking if VMX present first.
We may want to guard these macros, as they read global variables defined
inside vmx-specific files -- so VMX can be made optional later on.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
Here I've tried a different approach from prev.patches [1,2] -- instead o=
f
modifying whole set of cpu_has_{svm/vmx}_* macros, we can:
 1) do not touch SVM part at all, because just as Andrew pointed out they=
're
used inside arch/x86/hvm/svm only.
 2) track several places in common code where cpu_has_vmx_* features are
checked out and guard them using cpu_has_vmx condition
 3) two of cpu_has_vmx_* macros being used in common code are checked in =
a bit
more tricky way, so instead of making complex conditionals even more comp=
licated,
we can instead integrate cpu_has_vmx condition inside these two macros.

This patch aims to replace [1,2] from v1 series by doing steps above.

 1. https://lore.kernel.org/xen-devel/20240416064402.3469959-1-Sergiy_Kib=
rik@epam.com/
 2. https://lore.kernel.org/xen-devel/20240416064606.3470052-1-Sergiy_Kib=
rik@epam.com/
---
changes in v2:
 - do not touch SVM code and macros
 - drop vmx_ctrl_has_feature()
 - guard cpu_has_vmx_* macros in common code instead
changes in v1:
 - introduced helper routine vmx_ctrl_has_feature() and used it for all
   cpu_has_vmx_* macros
---
 xen/arch/x86/hvm/hvm.c                  | 2 +-
 xen/arch/x86/hvm/viridian/viridian.c    | 4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 4 ++--
 xen/arch/x86/traps.c                    | 5 +++--
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9594e0a5c5..ab75de9779 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5180,7 +5180,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
     {
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
         case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
-            if ( !cpu_has_monitor_trap_flag )
+            if ( !cpu_has_vmx || !cpu_has_monitor_trap_flag )
                 return -EOPNOTSUPP;
             break;
         default:
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viri=
dian/viridian.c
index 0496c52ed5..657c6a3ea7 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint=
32_t leaf,
         res->a =3D CPUID4A_RELAX_TIMER_INT;
         if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
             res->a |=3D CPUID4A_HCALL_REMOTE_TLB_FLUSH;
-        if ( !cpu_has_vmx_apic_reg_virt )
+        if ( !cpu_has_vmx || !cpu_has_vmx_apic_reg_virt )
             res->a |=3D CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |=3D CPUID4A_SYNTHETIC_CLUSTER_IPI;
@@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint=
32_t leaf,
=20
     case 6:
         /* Detected and in use hardware features. */
-        if ( cpu_has_vmx_virtualize_apic_accesses )
+        if ( cpu_has_vmx && cpu_has_vmx_virtualize_apic_accesses )
             res->a |=3D CPUID6A_APIC_OVERLAY;
         if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
             res->a |=3D CPUID6A_MSR_BITMAPS;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
index 58140af691..aa05f9cf6e 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -306,7 +306,7 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_vnmi \
     (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
 #define cpu_has_vmx_msr_bitmap \
-    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
+    (cpu_has_vmx && vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_=
BITMAP)
 #define cpu_has_vmx_secondary_exec_control \
     (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
 #define cpu_has_vmx_tertiary_exec_control \
@@ -347,7 +347,7 @@ extern u64 vmx_ept_vpid_cap;
 #define cpu_has_vmx_vmfunc \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
 #define cpu_has_vmx_virt_exceptions \
-    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
+    (cpu_has_vmx && vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_V=
IRT_EXCEPTIONS)
 #define cpu_has_vmx_pml \
     (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
 #define cpu_has_vmx_mpx \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7b8ee45edf..3595bb379a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1130,7 +1130,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, =
uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf !=3D 0 )
             break;
=20
-        if ( cpu_has_vmx_apic_reg_virt )
+        if ( cpu_has_vmx && cpu_has_vmx_apic_reg_virt )
             res->a |=3D XEN_HVM_CPUID_APIC_ACCESS_VIRT;
=20
         /*
@@ -1139,7 +1139,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, =
uint32_t leaf,
          * and wrmsr in the guest will run without VMEXITs (see
          * vmx_vlapic_msr_changed()).
          */
-        if ( cpu_has_vmx_virtualize_x2apic_mode &&
+        if ( cpu_has_vmx &&
+             cpu_has_vmx_virtualize_x2apic_mode &&
              cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |=3D XEN_HVM_CPUID_X2APIC_VIRT;
--=20
2.25.1



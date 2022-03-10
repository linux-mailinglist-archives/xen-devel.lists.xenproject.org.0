Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D34D5153
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 19:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288598.489448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSNmd-0004m1-Cn; Thu, 10 Mar 2022 18:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288598.489448; Thu, 10 Mar 2022 18:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSNmd-0004iV-8z; Thu, 10 Mar 2022 18:45:07 +0000
Received: by outflank-mailman (input) for mailman id 288598;
 Thu, 10 Mar 2022 18:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkI=TV=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nSNmb-0004iN-Cy
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 18:45:05 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3078c41a-a0a2-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 19:45:02 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 10:44:59 -0800
Received: from tlengyel-mobl3.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.69.49])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 10:44:58 -0800
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
X-Inumbo-ID: 3078c41a-a0a2-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646937902; x=1678473902;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2FqLq9eNolAav03XkdCJx45m7RWw2RGi/b+c0qm0okI=;
  b=OBMxT/Kqqg+vvTOU6igokX4fouW0AKvB/Nt6VX/5qJQJFDqIYpItxJbA
   JO8wLOVeTBqnlbsD8skKOF3o4+HKpeKZR8OJB5qc6L//kKpgRBf38syW8
   T80TzjdwUlRiILWjdD3M2TaNJN33Gx6djPg+zLqZ2mdoeivEUmUQwxmdH
   jbDzpiTzBNZfHQuo0VlcZBu6ktwW80BTFP1EJqeCx8zGAu9/HXyIsa6Nw
   ZnwDYv2vvLshNlpouKuBEQYBOQ9i+kPEbuKQAqAmMMpeRoK7loV1v+DrB
   YU0sDpt7eQlklmBsEOjMHIl7pg4nKgEV82QD26+scLgjD7mRURSl5Dxu4
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="252904358"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="252904358"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="642672181"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
Date: Thu, 10 Mar 2022 13:44:46 -0500
Message-Id: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During VM fork resetting a failed vmentry has been observed when the reset
is performed immediately after a STI instruction executed. This is due to
the guest interruptibility state in the VMCS being modified by STI but the
subsequent reset removes the IF bit from FLAGS, causing the failed vmentry.

Include the interruptibility state information in the public hvm_hw_cpu struct
so that the CPU can be safely saved/restored.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/hvm/hvm.c                 |  9 +++++----
 xen/arch/x86/hvm/vmx/vmx.c             |  4 ++++
 xen/arch/x86/include/asm/hvm/hvm.h     | 26 ++++++++++++++++++++++++++
 xen/include/public/arch-x86/hvm/save.h |  3 ++-
 4 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 709a4191ef..b239c72215 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -897,6 +897,8 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
         ctxt.flags = XEN_X86_FPU_INITIALISED;
     }
 
+    ctxt.interruptibility_info = hvm_get_interrupt_shadow(v);
+
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
 }
 
@@ -990,9 +992,6 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     if ( hvm_load_entry_zeroextend(CPU, h, &ctxt) != 0 )
         return -EINVAL;
 
-    if ( ctxt.pad0 != 0 )
-        return -EINVAL;
-
     /* Sanity check some control registers. */
     if ( (ctxt.cr0 & HVM_CR0_GUEST_RESERVED_BITS) ||
          !(ctxt.cr0 & X86_CR0_ET) ||
@@ -1155,6 +1154,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     v->arch.dr6   = ctxt.dr6;
     v->arch.dr7   = ctxt.dr7;
 
+    hvm_set_interrupt_shadow(v, ctxt.interruptibility_info);
+
     hvmemul_cancel(v);
 
     /* Auxiliary processors should be woken immediately. */
@@ -3888,7 +3889,7 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
          !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
         return hvm_intblk_rflags_ie;
 
-    intr_shadow = alternative_call(hvm_funcs.get_interrupt_shadow, v);
+    intr_shadow = hvm_get_interrupt_shadow(v);
 
     if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
         return hvm_intblk_shadow;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c075370f64..e13817431a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1323,7 +1323,9 @@ static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
 {
     unsigned long intr_shadow;
 
+    vmx_vmcs_enter(v);
     __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
+    vmx_vmcs_exit(v);
 
     return intr_shadow;
 }
@@ -1331,7 +1333,9 @@ static unsigned int cf_check vmx_get_interrupt_shadow(struct vcpu *v)
 static void cf_check vmx_set_interrupt_shadow(
     struct vcpu *v, unsigned int intr_shadow)
 {
+    vmx_vmcs_enter(v);
     __vmwrite(GUEST_INTERRUPTIBILITY_INFO, intr_shadow);
+    vmx_vmcs_exit(v);
 }
 
 static void vmx_load_pdptrs(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 5b7ec0cf69..2fb7865a05 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -720,6 +720,22 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
     return -EOPNOTSUPP;
 }
 
+static inline unsigned long hvm_get_interrupt_shadow(struct vcpu *v)
+{
+    if ( hvm_funcs.get_interrupt_shadow )
+        return alternative_call(hvm_funcs.get_interrupt_shadow, v);
+
+    return -EOPNOTSUPP;
+}
+
+static inline void
+hvm_set_interrupt_shadow(struct vcpu *v, unsigned long val)
+{
+    if ( hvm_funcs.set_interrupt_shadow )
+        alternative_vcall(hvm_funcs.set_interrupt_shadow, v, val);
+}
+
+
 /*
  * Accessors for registers which have per-guest-type or per-vendor locations
  * (e.g. VMCS, msr load/save lists, VMCB, VMLOAD lazy, etc).
@@ -863,6 +879,16 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     ASSERT_UNREACHABLE();
 }
 
+static inline unsigned long hvm_get_interrupt_shadow(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline void hvm_set_interrupt_shadow(struct vcpu *v, unsigned long val)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..e944b1756a 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -165,7 +165,8 @@ struct hvm_hw_cpu {
 #define _XEN_X86_FPU_INITIALISED        0
 #define XEN_X86_FPU_INITIALISED         (1U<<_XEN_X86_FPU_INITIALISED)
     uint32_t flags;
-    uint32_t pad0;
+
+    uint32_t interruptibility_info;
 };
 
 struct hvm_hw_cpu_compat {
-- 
2.25.1



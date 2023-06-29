Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D849742A0A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556958.869914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzs-0001mI-J4; Thu, 29 Jun 2023 15:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556958.869914; Thu, 29 Jun 2023 15:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzs-0001kQ-Fa; Thu, 29 Jun 2023 15:55:52 +0000
Received: by outflank-mailman (input) for mailman id 556958;
 Thu, 29 Jun 2023 15:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6tI=CR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qEtzr-0000zX-3f
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:55:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad48bcf-1695-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:55:49 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.192.186])
 by support.bugseng.com (Postfix) with ESMTPSA id 26C8A4EE073D;
 Thu, 29 Jun 2023 17:55:48 +0200 (CEST)
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
X-Inumbo-ID: 6ad48bcf-1695-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 3/5] x86/vlapic: change parameter names in function definitions
Date: Thu, 29 Jun 2023 17:55:31 +0200
Message-Id: <ef87958a9296abbee362f81bd8dcd4de3c286a45.1688049495.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688049494.git.federico.serafini@bugseng.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter names in guest_wrmsr_x2apic() and
guest_wrmsr_apic_base() definitions in order to:
1) keep consistency with parameter names used in guest_* function
   declarations;
2) fix violations of MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/vlapic.c | 56 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 785d5d88d9..5e0e12a1d7 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -959,7 +959,7 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int offset)
     return X86EMUL_OKAY;
 }
 
-int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t msr_content)
+int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
 {
     struct vlapic *vlapic = vcpu_vlapic(v);
     uint32_t offset = (msr - MSR_X2APIC_FIRST) << 4;
@@ -973,38 +973,38 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t msr_content)
     switch ( offset )
     {
     case APIC_TASKPRI:
-        if ( msr_content & ~APIC_TPRI_MASK )
+        if ( val & ~APIC_TPRI_MASK )
             return X86EMUL_EXCEPTION;
         break;
 
     case APIC_SPIV:
-        if ( msr_content & ~(APIC_VECTOR_MASK | APIC_SPIV_APIC_ENABLED |
-                             APIC_SPIV_FOCUS_DISABLED |
-                             (VLAPIC_VERSION & APIC_LVR_DIRECTED_EOI
-                              ? APIC_SPIV_DIRECTED_EOI : 0)) )
+        if ( val & ~(APIC_VECTOR_MASK | APIC_SPIV_APIC_ENABLED |
+                     APIC_SPIV_FOCUS_DISABLED |
+                     (VLAPIC_VERSION & APIC_LVR_DIRECTED_EOI
+                      ? APIC_SPIV_DIRECTED_EOI : 0)) )
             return X86EMUL_EXCEPTION;
         break;
 
     case APIC_LVTT:
-        if ( msr_content & ~(LVT_MASK | APIC_TIMER_MODE_MASK) )
+        if ( val & ~(LVT_MASK | APIC_TIMER_MODE_MASK) )
             return X86EMUL_EXCEPTION;
         break;
 
     case APIC_LVTTHMR:
     case APIC_LVTPC:
     case APIC_CMCI:
-        if ( msr_content & ~(LVT_MASK | APIC_MODE_MASK) )
+        if ( val & ~(LVT_MASK | APIC_MODE_MASK) )
             return X86EMUL_EXCEPTION;
         break;
 
     case APIC_LVT0:
     case APIC_LVT1:
-        if ( msr_content & ~LINT_MASK )
+        if ( val & ~LINT_MASK )
             return X86EMUL_EXCEPTION;
         break;
 
     case APIC_LVTERR:
-        if ( msr_content & ~LVT_MASK )
+        if ( val & ~LVT_MASK )
             return X86EMUL_EXCEPTION;
         break;
 
@@ -1012,35 +1012,35 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t msr_content)
         break;
 
     case APIC_TDCR:
-        if ( msr_content & ~APIC_TDR_DIV_MASK )
+        if ( val & ~APIC_TDR_DIV_MASK )
             return X86EMUL_EXCEPTION;
         break;
 
     case APIC_ICR:
-        if ( (uint32_t)msr_content & ~(APIC_VECTOR_MASK | APIC_MODE_MASK |
+        if ( (uint32_t)val & ~(APIC_VECTOR_MASK | APIC_MODE_MASK |
                                        APIC_DEST_MASK | APIC_INT_ASSERT |
                                        APIC_INT_LEVELTRIG | APIC_SHORT_MASK) )
             return X86EMUL_EXCEPTION;
-        vlapic_set_reg(vlapic, APIC_ICR2, msr_content >> 32);
+        vlapic_set_reg(vlapic, APIC_ICR2, val >> 32);
         break;
 
     case APIC_SELF_IPI:
-        if ( msr_content & ~APIC_VECTOR_MASK )
+        if ( val & ~APIC_VECTOR_MASK )
             return X86EMUL_EXCEPTION;
         offset = APIC_ICR;
-        msr_content = APIC_DEST_SELF | (msr_content & APIC_VECTOR_MASK);
+        val = APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
         break;
 
     case APIC_EOI:
     case APIC_ESR:
-        if ( msr_content )
+        if ( val )
         {
     default:
             return X86EMUL_EXCEPTION;
         }
     }
 
-    vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), msr_content);
+    vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), val);
 
     return X86EMUL_OKAY;
 }
@@ -1070,7 +1070,7 @@ static void set_x2apic_id(struct vlapic *vlapic)
     vlapic_set_reg(vlapic, APIC_LDR, ldr);
 }
 
-int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
+int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
 {
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     struct vlapic *vlapic = vcpu_vlapic(v);
@@ -1079,8 +1079,8 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
         return X86EMUL_EXCEPTION;
 
     /* Attempting to set reserved bits? */
-    if ( value & ~(APIC_BASE_ADDR_MASK | APIC_BASE_ENABLE | APIC_BASE_BSP |
-                   (cp->basic.x2apic ? APIC_BASE_EXTD : 0)) )
+    if ( val & ~(APIC_BASE_ADDR_MASK | APIC_BASE_ENABLE | APIC_BASE_BSP |
+                 (cp->basic.x2apic ? APIC_BASE_EXTD : 0)) )
         return X86EMUL_EXCEPTION;
 
     /*
@@ -1118,21 +1118,21 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
      * fault will be far more obvious to debug than a malfunctioning MMIO
      * window.
      */
-    if ( ((value & (APIC_BASE_EXTD | APIC_BASE_ENABLE)) == APIC_BASE_ENABLE) &&
-         ((value & APIC_BASE_ADDR_MASK) != APIC_DEFAULT_PHYS_BASE) )
+    if ( ((val & (APIC_BASE_EXTD | APIC_BASE_ENABLE)) == APIC_BASE_ENABLE) &&
+         ((val & APIC_BASE_ADDR_MASK) != APIC_DEFAULT_PHYS_BASE) )
     {
         printk(XENLOG_G_INFO
                "%pv tried to move the APIC MMIO window: val 0x%08"PRIx64"\n",
-               v, value);
+               v, val);
         return X86EMUL_EXCEPTION;
     }
 
-    if ( (vlapic->hw.apic_base_msr ^ value) & APIC_BASE_ENABLE )
+    if ( (vlapic->hw.apic_base_msr ^ val) & APIC_BASE_ENABLE )
     {
-        if ( unlikely(value & APIC_BASE_EXTD) )
+        if ( unlikely(val & APIC_BASE_EXTD) )
             return X86EMUL_EXCEPTION;
 
-        if ( value & APIC_BASE_ENABLE )
+        if ( val & APIC_BASE_ENABLE )
         {
             vlapic_reset(vlapic);
             vlapic->hw.disabled &= ~VLAPIC_HW_DISABLED;
@@ -1144,11 +1144,11 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
             pt_may_unmask_irq(vlapic_domain(vlapic), NULL);
         }
     }
-    else if ( ((vlapic->hw.apic_base_msr ^ value) & APIC_BASE_EXTD) &&
+    else if ( ((vlapic->hw.apic_base_msr ^ val) & APIC_BASE_EXTD) &&
               unlikely(!vlapic_xapic_mode(vlapic)) )
         return X86EMUL_EXCEPTION;
 
-    vlapic->hw.apic_base_msr = value;
+    vlapic->hw.apic_base_msr = val;
     memset(&vlapic->loaded, 0, sizeof(vlapic->loaded));
 
     if ( vlapic_x2apic_mode(vlapic) )
-- 
2.34.1



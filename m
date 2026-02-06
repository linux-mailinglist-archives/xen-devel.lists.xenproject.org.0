Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C6TGE0Phmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:57:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB1FFF1D
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223381.1530933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOC7-0000wb-Fs; Fri, 06 Feb 2026 15:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223381.1530933; Fri, 06 Feb 2026 15:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOC7-0000tD-AJ; Fri, 06 Feb 2026 15:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1223381;
 Fri, 06 Feb 2026 15:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1voOC6-0000M4-5g
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:56:30 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6582475d-0374-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 16:56:28 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id A444942B940E;
 Fri,  6 Feb 2026 10:56:16 -0500 (EST)
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
X-Inumbo-ID: 6582475d-0374-11f1-9ccf-f158ae23cfc8
From: Abdelkareem@tibco.com, Abdelsaamad@tibco.com,
	abdelkareem.abdelsaamad@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 3/3] svm/vnmi: Add support for the SVM Virtual NMI
Date: Fri,  6 Feb 2026 15:53:17 +0000
Message-ID: <51fb085801706c082de4061181381d6cb9449d77.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.70 / 15.00];
	MULTIPLE_FROM(8.00)[Abdelkareem@tibco.com,Abdelsaamad@tibco.com,abdelkareem.abdelsaamad@citrix.com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_MISSING_CHARSET(0.18)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Abdelkareem@tibco.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[Duplicate From header];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[Abdelkareem@tibco.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: 08AB1FFF1D
X-Rspamd-Action: add header
X-Spam: Yes

From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>

With vNMI, the pending NMI is simply stuffed into the VMCB and handed off
to the hardware. This means that Xen needs to be able to set a vNMI pending
on-demand, and also query if a vNMI is pending, e.g. to honor the "at most
one NMI pending" rule and to preserve all NMIs across save and restore.

Introduce two new hvm_function_table callbacks to support the SVM's vNMI to
allow the Xen hypervisor to query if a vNMI is pending and to set VMCB's
_vintr pending flag so the NMIs are serviced by hardware if/when the virtual
NMIs become unblocked.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/hvm.c             | 29 +++++++++++++++++++++--------
 xen/arch/x86/hvm/svm/intr.c        | 16 ++++++++++++++--
 xen/arch/x86/hvm/svm/svm.c         | 23 ++++++++++++++++++++++-
 xen/arch/x86/hvm/svm/vmcb.c        |  3 +++
 xen/arch/x86/include/asm/hvm/hvm.h |  8 ++++++++
 5 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..3117ef8f2f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3904,10 +3904,29 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
     }
 }
 
-enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
+static enum hvm_intblk hvm_nmi_blocked(struct vcpu *v)
 {
     unsigned long intr_shadow;
 
+    if (hvm_funcs.caps.vNMI)
+    {
+        if (!hvm_funcs.is_vnmi_pending(v))
+            return hvm_intblk_none;
+
+        return hvm_intblk_vnmi;
+    }
+
+    intr_shadow = alternative_call(hvm_funcs.get_interrupt_shadow, v);
+
+    if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
+        return hvm_intblk_shadow;
+
+    return ((intr_shadow & HVM_INTR_SHADOW_NMI) ?
+            hvm_intblk_nmi_iret : hvm_intblk_none);
+}
+
+enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
+{
     ASSERT(v == current);
 
     if ( nestedhvm_enabled(v->domain) ) {
@@ -3922,14 +3941,8 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
          !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
         return hvm_intblk_rflags_ie;
 
-    intr_shadow = alternative_call(hvm_funcs.get_interrupt_shadow, v);
-
-    if ( intr_shadow & (HVM_INTR_SHADOW_STI|HVM_INTR_SHADOW_MOV_SS) )
-        return hvm_intblk_shadow;
-
     if ( intack.source == hvm_intsrc_nmi )
-        return ((intr_shadow & HVM_INTR_SHADOW_NMI) ?
-                hvm_intblk_nmi_iret : hvm_intblk_none);
+        return hvm_nmi_blocked(v);
 
     if ( intack.source == hvm_intsrc_lapic )
     {
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b85..c54298c402 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -29,10 +29,19 @@
 
 static void svm_inject_nmi(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
+    struct vmcb_struct *vmcb;
+    u32 general1_intercepts;
     intinfo_t event;
 
+    if (hvm_funcs.caps.vNMI)
+    {
+        hvm_funcs.set_vnmi_pending(v);
+        return;
+    }
+
+    vmcb = v->arch.hvm.svm.vmcb;
+    general1_intercepts = vmcb_get_general1_intercepts(vmcb);
+
     event.raw = 0;
     event.v = true;
     event.type = X86_ET_NMI;
@@ -176,6 +185,9 @@ void asmlinkage svm_intr_assist(void)
             }
         }
 
+        // vNMI is currently serviced in progress.
+        if (unlikely(intblk == hvm_intblk_vnmi)) return;
+
         /*
          * Pending IRQs must be delayed if:
          * 1. An event is already pending. This is despite the fact that SVM
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e451937b04..f67869353b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -297,6 +297,26 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
+static bool cf_check svm_is_vnmi_pending(struct vcpu *vcpu)
+{
+    if (!hvm_funcs.caps.vNMI)
+        return false;
+
+    return (vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_blocking);
+}
+
+static bool cf_check svm_set_vnmi_pending(struct vcpu *vcpu)
+{
+    if (!hvm_funcs.caps.vNMI)
+        return false;
+
+    if (vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_pending)
+        return false;
+
+    vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_pending = 1;
+    return true;
+}
+
 #ifdef CONFIG_VM_EVENT
 static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
@@ -2464,7 +2484,8 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
 #endif
     .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
-
+    .is_vnmi_pending = svm_is_vnmi_pending,
+    .set_vnmi_pending = svm_set_vnmi_pending,
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
     .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
     .nhvm_vcpu_reset = nsvm_vcpu_reset,
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548..5069789f6c 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -184,6 +184,9 @@ static int construct_vmcb(struct vcpu *v)
     if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
         v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
 
+    if (hvm_funcs.caps.vNMI)
+        vmcb->_vintr.fields.vnmi_enable = 1;
+
     return 0;
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index ad17ea73e9..d7f439d41b 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -67,6 +67,7 @@ enum hvm_intblk {
     hvm_intblk_rflags_ie, /* RFLAGS.IE == 0 */
     hvm_intblk_tpr,       /* LAPIC TPR too high */
     hvm_intblk_nmi_iret,  /* NMI blocked until IRET */
+    hvm_intblk_vnmi,      /* vNMI is currently blocked*/
     hvm_intblk_arch,      /* SVM/VMX specific reason */
 };
 
@@ -224,6 +225,13 @@ struct hvm_function_table {
     int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
                           uint8_t gvec);
     void (*update_vlapic_mode)(struct vcpu *v);
+    /* Whether or not a virtual NMI is pending in hardware. */
+    bool (*is_vnmi_pending)(struct vcpu *vcpu);
+    /*
+     * Attempt to pend a virtual NMI in harware.
+     * Returns %true on success
+     */
+    bool (*set_vnmi_pending)(struct vcpu *vcpu);
 
     /*Walk nested p2m  */
     int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
-- 
2.52.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QcpbG2Cqj2m1SQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:49:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E7139D9C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231983.1536911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1xn-0007cc-RH; Fri, 13 Feb 2026 22:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231983.1536911; Fri, 13 Feb 2026 22:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1xn-0007au-MD; Fri, 13 Feb 2026 22:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1231983;
 Fri, 13 Feb 2026 22:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHiT=AR=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vr1xm-00075I-7A
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:48:38 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2225b83e-092e-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 23:48:37 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id B70E04280D5B;
 Fri, 13 Feb 2026 17:48:22 -0500 (EST)
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
X-Inumbo-ID: 2225b83e-092e-11f1-b163-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v2 2/2] x86/svm: Use the virtual NMI when available
Date: Fri, 13 Feb 2026 22:44:46 +0000
Message-ID: <54110a1c3800557d1fe611e4f8008b702df5ee84.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US]
X-Rspamd-Queue-Id: 0A7E7139D9C
X-Rspamd-Action: no action

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
 xen/arch/x86/hvm/svm/intr.c        | 13 ++++++++++--
 xen/arch/x86/hvm/svm/svm.c         | 33 ++++++++++++++++++++++++++++--
 xen/arch/x86/hvm/svm/vmcb.c        |  2 ++
 xen/arch/x86/include/asm/hvm/hvm.h |  9 ++++++++
 4 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b85..bc52f8e189 100644
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
 
+    if ( hvm_funcs.is_vnmi_enabled(v) )
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
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 6e380890bd..00e5630025 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -297,6 +297,32 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
+static bool cf_check svm_is_vnmi_enabled(struct vcpu *vcpu)
+{
+    return ( hvm_funcs.caps.vNMI &&
+             vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_enable );
+}
+
+static bool cf_check svm_is_vnmi_masked(struct vcpu *vcpu)
+{
+    if ( !svm_is_vnmi_enabled(vcpu) )
+        return false;
+
+    return ( vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_blocking );
+}
+
+static bool cf_check svm_set_vnmi_pending(struct vcpu *vcpu)
+{
+    if ( !svm_is_vnmi_enabled(vcpu) )
+        return false;
+
+    if ( vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_pending )
+        return false;
+
+    vcpu->arch.hvm.svm.vmcb->_vintr.fields.vnmi_pending = 1;
+    return true;
+}
+
 #ifdef CONFIG_VM_EVENT
 static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 {
@@ -545,7 +571,7 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int intr_shadow = 0;
 
-    if ( vmcb->int_stat.intr_shadow )
+    if ( vmcb->int_stat.intr_shadow || svm_is_vnmi_masked(v) )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
     if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
@@ -2464,7 +2490,9 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
 #endif
     .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
-
+    .is_vnmi_enabled      = svm_is_vnmi_enabled,
+    .is_vnmi_masked       = svm_is_vnmi_masked,
+    .set_vnmi_pending     = svm_set_vnmi_pending,
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
     .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
     .nhvm_vcpu_reset = nsvm_vcpu_reset,
@@ -2524,6 +2552,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+    P(cpu_has_svm_vnmi, "Virtual NMI");
     P(cpu_has_svm_bus_lock, "Bus Lock Filter");
 #undef P
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548..e90bbac332 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -184,6 +184,8 @@ static int construct_vmcb(struct vcpu *v)
     if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
         v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
 
+    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
+
     return 0;
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index ad17ea73e9..9dc8b35f91 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -224,6 +224,15 @@ struct hvm_function_table {
     int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
                           uint8_t gvec);
     void (*update_vlapic_mode)(struct vcpu *v);
+    /* Whether or not virtual NMI is enabled. */
+    bool (*is_vnmi_enabled)(struct vcpu *vcpu);
+    /* Whether or not a virtual NMI is masked in hardware. */
+    bool (*is_vnmi_masked)(struct vcpu *vcpu);
+    /*
+     * Attempt to pend a virtual NMI in harware.
+     * Returns %true on success
+     */
+    bool (*set_vnmi_pending)(struct vcpu *vcpu);
 
     /*Walk nested p2m  */
     int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
-- 
2.52.0



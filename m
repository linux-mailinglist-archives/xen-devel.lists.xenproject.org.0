Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AlKFXUOkmlJqAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 15 Feb 2026 19:20:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DFB13F59F
	for <lists+xen-devel@lfdr.de>; Sun, 15 Feb 2026 19:20:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233478.1537065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrgik-0000wX-C9; Sun, 15 Feb 2026 18:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233478.1537065; Sun, 15 Feb 2026 18:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrgik-0000v1-9I; Sun, 15 Feb 2026 18:19:50 +0000
Received: by outflank-mailman (input) for mailman id 1233478;
 Sun, 15 Feb 2026 18:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+38R=AT=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vrgij-0000h9-1T
 for xen-devel@lists.xenproject.org; Sun, 15 Feb 2026 18:19:49 +0000
Received: from na1pdmzitismtp02.tibco.com (na1pdmzitismtp02.tibco.com
 [160.101.131.9]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7499ad3-0a9a-11f1-9ccf-f158ae23cfc8;
 Sun, 15 Feb 2026 19:19:45 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id BCBCF810BDF8;
 Sun, 15 Feb 2026 13:19:18 -0500 (EST)
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
X-Inumbo-ID: e7499ad3-0a9a-11f1-9ccf-f158ae23cfc8
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
Date: Sun, 15 Feb 2026 18:16:02 +0000
Message-ID: <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US]
X-Rspamd-Queue-Id: D5DFB13F59F
X-Rspamd-Action: no action

With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
and handed off to the hardware. There is no need for the artificial tracking
of the NMI handling completion with the IRET instruction interception.

Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
accelerated feature when the AMD platform support the vNMI.

Adjust the svm_get_interrupt_shadow to check if the vNMI is currently blocked
by servicing another in-progress NMI.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c | 9 +++++++++
 xen/arch/x86/hvm/svm/svm.c  | 5 ++++-
 xen/arch/x86/hvm/svm/vmcb.c | 2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b85..3e8959f155 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     intinfo_t event;
 
+    if ( vmcb->_vintr.fields.vnmi_enable )
+    {
+       if ( !vmcb->_vintr.fields.vnmi_pending &&
+            !vmcb->_vintr.fields.vnmi_blocking )
+           vmcb->_vintr.fields.vnmi_pending = 1;
+
+        return;
+    }
+
     event.raw = 0;
     event.v = true;
     event.type = X86_ET_NMI;
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..3dfdc18133 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -548,7 +548,9 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
-    if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
+    if ( vmcb->_vintr.fields.vnmi_enable
+         ? vmcb->_vintr.fields.vnmi_blocking
+         : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
     return intr_shadow;
@@ -2524,6 +2526,7 @@ const struct hvm_function_table * __init start_svm(void)
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
 
-- 
2.52.0



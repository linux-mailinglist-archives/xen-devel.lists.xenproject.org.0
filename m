Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEB7NunRw2lLuQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:15:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B886324A80
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 13:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262169.1554802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5N8q-0003z1-Gt; Wed, 25 Mar 2026 12:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262169.1554802; Wed, 25 Mar 2026 12:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5N8q-0003vy-E0; Wed, 25 Mar 2026 12:15:20 +0000
Received: by outflank-mailman (input) for mailman id 1262169;
 Wed, 25 Mar 2026 12:15:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1w5N8o-0003vs-Kv
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 12:15:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5N8n-00G0I0-Vl
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:15:18 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 69c3d1d5-2eae-0a2a0a5409dd-0a2a4501e840-2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:15:17 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 69c3d1d4-6400-0a2a45010019-a0658309c58a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 13:15:17 +0100
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 175FE81836F4;
 Wed, 25 Mar 2026 08:14:33 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	jason.andryuk@amd.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH] x86/svm: Fix the IRET instruction completion tracking
Date: Wed, 25 Mar 2026 12:13:42 +0000
Message-ID: <20260325121342.1216471-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774440917-21EFADF3-0B6022DB/0/0
X-purgate-type: clean
X-purgate-size: 5072
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:abdelkareem.abdelsaamad@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 6B886324A80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the AMD platform without the vNMI support, the current implementation of the
NMI completion tracking, via the IRET instruction interception, entails
functional correctness corner cases. The IRET interception causes VMExit as the
first step before its execution. A corner case can happen where the IRET
instruction faults during its execution and before it retires. In such
a scenario, if a VMExit occurs in between, due to NPF exit, for example, the
Xen hypervisor will incorrectly inject a pending NMI. Additionally, the single
stepping implementation with the explicit setting of the interrupt shadow bit
and intercepting an injected virtual interrupt could entail unnecessary delays
until the RFLAGS.IF is set to 1. Ensure the IRET instruction is retired by
verifying the forward progress of the IRET's instruction pointer (RIP) before
injecting a pending NMI. Rather implement the single stepping with a debug trap.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2407770975
---
 xen/arch/x86/hvm/svm/intr.c              | 17 +++++++++++++++++
 xen/arch/x86/hvm/svm/svm.c               | 17 +++++++++--------
 xen/arch/x86/include/asm/hvm/svm-types.h |  3 +++
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b85..c36d89e08b 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -112,6 +112,17 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
          (general1_intercepts & GENERAL1_INTERCEPT_IRET) )
         return;
 
+    /*
+     * If there is a pending NMI but NMIs are blocked due to either the currently
+     * executing IRET is not yet retired or there is an interrupt shadow. Single
+     * step over the possible blocker.
+     */
+    if ( intack.source == hvm_intsrc_nmi )
+    {
+        vmcb->rflags |= (X86_EFLAGS_TF | X86_EFLAGS_RF);
+        return;
+    }
+
     intr = vmcb_get_vintr(vmcb);
     intr.fields.irq     = 1;
     intr.fields.vector  = 0;
@@ -136,6 +147,12 @@ void asmlinkage svm_intr_assist(void)
     /* Crank the handle on interrupt state. */
     pt_update_irq(v);
 
+    /*
+     * If there is an IRET instruction in-flight, ensure it is retired and
+     * it is accordingly safe to inject a pending NMI.
+     */
+    v->arch.hvm.svm.iret_mask &= ( guest_cpu_user_regs()->rip == v->arch.hvm.svm.nmi_iret_rip );
+
     do {
         intack = hvm_vcpu_has_pending_irq(v);
         if ( likely(intack.source == hvm_intsrc_none) )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 243c41fb13..65da9ab777 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -548,7 +548,8 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
-    if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
+    if ( (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) ||
+         v->arch.hvm.svm.iret_mask )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
     return intr_shadow;
@@ -3063,15 +3064,15 @@ void asmlinkage svm_vmexit_handler(void)
         u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
 
         /*
-         * IRET clears the NMI mask. However because we clear the mask
-         * /before/ executing IRET, we set the interrupt shadow to prevent
-         * a pending NMI from being injected immediately. This will work
-         * perfectly unless the IRET instruction faults: in that case we
-         * may inject an NMI before the NMI handler's IRET instruction is
-         * retired.
+         * IRET clears the NMI mask. However, The IRET instruction in the
+         * guest is not retired yet. We should ensure the IRET instruction
+         * retired / completed  before injecting another pending NMI, if
+         * there is a pending NMI. Store the current IP, so we can later
+         * verify, if we had any progress.
          */
         general1_intercepts &= ~GENERAL1_INTERCEPT_IRET;
-        vmcb->int_stat.intr_shadow = 1;
+        v->arch.hvm.svm.iret_mask = true;
+        v->arch.hvm.svm.nmi_iret_rip = guest_cpu_user_regs()->rip;
 
         vmcb_set_general1_intercepts(vmcb, general1_intercepts);
         break;
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 051b235d8f..d2fbab6940 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -23,6 +23,9 @@ struct svm_vcpu {
     uint64_t vmcb_pa;
     int     launch_core;
 
+    bool iret_mask;
+    unsigned long nmi_iret_rip;
+
     uint8_t vmcb_sync_state; /* enum vmcb_sync_state */
 
     /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
-- 
2.53.0



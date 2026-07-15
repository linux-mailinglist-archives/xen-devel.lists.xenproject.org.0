Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 22FvKzWNV2oVWwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:37:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728B75EC1D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 15:37:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1363090.1614919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzo5-0005hL-6H; Wed, 15 Jul 2026 13:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363090.1614919; Wed, 15 Jul 2026 13:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzo5-0005ew-2j; Wed, 15 Jul 2026 13:37:49 +0000
Received: by outflank-mailman (input) for mailman id 1363090;
 Wed, 15 Jul 2026 13:37:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wjzo3-0005ea-L1
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:37:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjzo2-004YDq-Qr
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:37:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a578d16-bab6-0a2a0a5309dd-0a2a450b8150-36
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:37:46 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a578d29-b7e8-0a2a450b0019-a0658309e43a-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:37:46 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 6A1F682CD4A3;
 Wed, 15 Jul 2026 09:36:07 -0400 (EDT)
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
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v1] nSVM: Check injected event consistency
Date: Wed, 15 Jul 2026 14:35:36 +0100
Message-ID: <d01b3d5327ace27ca9d81244a168ba2ab6ed094d.1784121738.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784122666-18AC89EA-374C2853/0/0
X-purgate-type: clean
X-purgate-size: 4965
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:abdelkareem.abdelsaamad@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[abdelkareem.abdelsaamad@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,amd.com:url,lists.xenproject.org:helo,lists.xenproject.org:from_smtp,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3728B75EC1D
X-Rspamd-Action: no action

On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
debugging complications, security and performance implications. The APM volume
2 15.20 [1] states two possibilities that result in a VMRUN exit with
VMEXIT_INVALID due to injected events. These are either
• Reserved values of TYPE have been specified.
• TYPE = 3 (exception) has been specified with a vector that does not
  correspond to an exception (this includes vector 2, which is an NMI, not
  an exception).
Extend the VMCB checks to check for such inconsistency.

The collection of the invalid exception vectors are picked from the upstream KVM
commit ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ).

[1] https://docs.amd.com/v/u/en-US/24593_3.44_APM_Vol2

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Testing:
 - Using a locally developed XTF nested virt setup, I manually tested VMRUN
   instruction handling with a malformed VMCB:
   1) Inject event with the type (7). 
      The hypervisor logs show the message
      (XEN) [  645.155609] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid Injected
            Event Type: (0x7)
   2) Inject event with the exception value (3) and the vector value (2) for NMI.
      The hypervisor logs show the message
      (XEN) [  645.157277] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid Injected Event.
             Exception type: (0x3), with a vector: (0x2) does not belong to an exception

 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2678629270
---
 xen/arch/x86/hvm/svm/vmcb.c | 36 ++++++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/svm/vmcb.h |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef8..1ca8474958 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -320,6 +320,31 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     svm_dump_sel("  TR", &vmcb->tr);
 }
 
+static bool is_valid_svm_vmcb_injected_exception_vector(
+    const struct vmcb_struct *vmcb, uint8_t vmcb_injected_vector)
+{
+    return ( (vmcb_injected_vector == X86_EXC_DE) ||
+             (vmcb_injected_vector == X86_EXC_DB) ||
+             (vmcb_injected_vector == X86_EXC_BP) ||
+             (vmcb_injected_vector == X86_EXC_OF) ||
+             (vmcb_injected_vector == X86_EXC_BR) ||
+             (vmcb_injected_vector == X86_EXC_UD) ||
+             (vmcb_injected_vector == X86_EXC_NM) ||
+             (vmcb_injected_vector == X86_EXC_DF) ||
+             (vmcb_injected_vector == X86_EXC_TS) ||
+             (vmcb_injected_vector == X86_EXC_NP) ||
+             (vmcb_injected_vector == X86_EXC_SS) ||
+             (vmcb_injected_vector == X86_EXC_GP) ||
+             (vmcb_injected_vector == X86_EXC_PF) ||
+             (vmcb_injected_vector == X86_EXC_MF) ||
+             (vmcb_injected_vector == X86_EXC_AC) ||
+             (vmcb_injected_vector == X86_EXC_MC) ||
+             (vmcb_injected_vector == X86_EXC_XM) ||
+             (vmcb_injected_vector == X86_EXC_HV) ||
+             (vmcb_injected_vector == X86_EXC_SX) ||
+             (vmcb_get_sev_es(vmcb) && vmcb_injected_vector == X86_EXC_VC) );
+}
+
 bool svm_vmcb_isvalid(
     const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
     bool verbose)
@@ -330,6 +355,8 @@ bool svm_vmcb_isvalid(
     unsigned long cr4 = vmcb_get_cr4(vmcb);
     unsigned long valid;
     uint64_t efer = vmcb_get_efer(vmcb);
+    uint8_t vmcb_injected_type = vmcb->event_inj.type & SVM_EVENT_INJ_TYPE_MASK;
+    uint8_t vmcb_injected_vector = vmcb->event_inj.vector & SVM_EVENT_INJ_VEC_MASK;
 
 #define PRINTF(fmt, args...) do { \
     if ( !verbose ) return true; \
@@ -392,6 +419,15 @@ bool svm_vmcb_isvalid(
         PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
                vmcb->event_inj.raw);
 
+    if ( vmcb_injected_type > X86_ET_SW_INT )
+        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
+               vmcb_injected_type);
+
+    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
+         !is_valid_svm_vmcb_injected_exception_vector(vmcb, vmcb_injected_vector) )
+        PRINTF("eventinj: Invalid Injected Event. Exception type: (%#"PRIx8"),"
+               " with a vector: (%#"PRIx8") does not belong to an exception\n",
+               vmcb_injected_type, vmcb_injected_vector);
 #undef PRINTF
     return ret;
 }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 13ccfd3ff9..3c22095db1 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -306,6 +306,9 @@ enum
     TLB_CTRL_FLUSH_ASID_NONGLOBAL = 7,
 };
 
+#define SVM_EVENT_INJ_VEC_MASK     0xff
+#define SVM_EVENT_INJ_TYPE_MASK    0x7
+
 typedef union
 {
     struct
-- 
2.53.0



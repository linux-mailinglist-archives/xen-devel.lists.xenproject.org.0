Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIisIGCqj2m1SQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:49:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E051139D9E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231980.1536900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1xk-0007Mg-JQ; Fri, 13 Feb 2026 22:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231980.1536900; Fri, 13 Feb 2026 22:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1xk-0007L4-FU; Fri, 13 Feb 2026 22:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1231980;
 Fri, 13 Feb 2026 22:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHiT=AR=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vr1xj-00075I-G2
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:48:35 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 208bc295-092e-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 23:48:35 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 054BA4280D5B;
 Fri, 13 Feb 2026 17:48:19 -0500 (EST)
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
X-Inumbo-ID: 208bc295-092e-11f1-b163-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v2 1/2] x86/svm: Add Enumerations for the SVM virtual NMI
Date: Fri, 13 Feb 2026 22:44:45 +0000
Message-ID: <01a922d2018cf657f842dbd325d0fdf819078aa7.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
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
X-Rspamd-Queue-Id: 6E051139D9E
X-Rspamd-Action: no action

Introduce the cpuid bit for the SVM vNMI feature support for the x86\AMD
platforms. The feature support is indicated by the CPUID
Fn8000_000A_EDX[25] = 1.

Add defines for the three SVM's Virtual NMI (vNMI) managements bits in the
VMCB structure's vintr_t:

vintr_t(11) - Virtual NMI is pending.
vintr_t(12) - Virtual NMI is masked.
vintr_t(26) - Enable NMI virtualization.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c         | 1 +
 xen/arch/x86/hvm/svm/vmcb.h        | 8 ++++++--
 xen/arch/x86/include/asm/hvm/hvm.h | 4 +++-
 xen/arch/x86/include/asm/hvm/svm.h | 2 ++
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..6e380890bd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2533,6 +2533,7 @@ const struct hvm_function_table * __init start_svm(void)
     svm_function_table.caps.hap = cpu_has_svm_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
+    svm_function_table.caps.vNMI = cpu_has_svm_vnmi;
 
     return &svm_function_table;
 }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 69f6047394..047483db9a 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -336,13 +336,17 @@ typedef union
         u64 tpr:          8;
         u64 irq:          1;
         u64 vgif:         1;
-        u64 rsvd0:        6;
+        u64 rsvd0:        1;
+        u64 vnmi_pending: 1;
+        u64 vnmi_blocking:1;
+        u64:              3;
         u64 prio:         4;
         u64 ign_tpr:      1;
         u64 rsvd1:        3;
         u64 intr_masking: 1;
         u64 vgif_enable:  1;
-        u64 rsvd2:        6;
+        u64 vnmi_enable:  1;
+        u64 rsvd2:        5;
         u64 vector:       8;
         u64 rsvd3:       24;
     } fields;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..ad17ea73e9 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -115,7 +115,9 @@ struct hvm_function_table {
              virtual_intr_delivery:1,
 
              /* Nested virt capabilities */
-             nested_virt:1;
+             nested_virt:1,
+             /* virtual NMI support */
+             vNMI:1;
     } caps;
 
     /*
diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
index 15f0268be7..a35a61273b 100644
--- a/xen/arch/x86/include/asm/hvm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm.h
@@ -37,6 +37,7 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
+#define SVM_FEATURE_VNMI          25 /* Virtual NMI */
 #define SVM_FEATURE_BUS_LOCK      29 /* Bus Lock Threshold */
 
 static inline bool cpu_has_svm_feature(unsigned int feat)
@@ -57,6 +58,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_svm_vloadsave cpu_has_svm_feature(SVM_FEATURE_VLOADSAVE)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
+#define cpu_has_svm_vnmi      cpu_has_svm_feature(SVM_FEATURE_VNMI)
 #define cpu_has_svm_bus_lock  cpu_has_svm_feature(SVM_FEATURE_BUS_LOCK)
 
 #define MSR_INTERCEPT_NONE    0
-- 
2.52.0



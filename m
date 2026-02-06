Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AkJFE0Phmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:57:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2100FFF1C
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223379.1530927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOC7-0000tK-6n; Fri, 06 Feb 2026 15:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223379.1530927; Fri, 06 Feb 2026 15:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOC7-0000qS-2F; Fri, 06 Feb 2026 15:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1223379;
 Fri, 06 Feb 2026 15:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1voOC4-0000ag-Sy
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:56:28 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6502e08c-0374-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 16:56:27 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id DA80842B9403;
 Fri,  6 Feb 2026 10:56:15 -0500 (EST)
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
X-Inumbo-ID: 6502e08c-0374-11f1-b161-2bf370ae4941
From: Abdelkareem@tibco.com, Abdelsaamad@tibco.com,
	abdelkareem.abdelsaamad@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 2/3] svm/vnmi: add the definitions for the svm vnmi management bits in the VMCB
Date: Fri,  6 Feb 2026 15:53:16 +0000
Message-ID: <7ab87d357ef98a9e195294367b991790376cabd3.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
References: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.70 / 15.00];
	MULTIPLE_FROM(8.00)[Abdelkareem@tibco.com,Abdelsaamad@tibco.com,abdelkareem.abdelsaamad@citrix.com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_MISSING_CHARSET(0.18)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:abdelkareem.abdelsaamad@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DMARC_NA(0.00)[Duplicate From header];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[Abdelkareem@tibco.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	RCVD_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[Abdelkareem@tibco.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: E2100FFF1C
X-Rspamd-Action: add header
X-Spam: Yes

From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>

Add defines for the three SVM's Virtual NMI (vNMI) managements bits in the
VMCB structure's vintr_t:

vintr_t(11) - Virtual NMI is pending.
vintr_t(12) - Virtual NMI is masked.
vintr_t(26) - Enable NMI virtualization.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
 xen/arch/x86/hvm/svm/vmcb.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 69f6047394..0ffb2fb8e1 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -336,15 +336,19 @@ typedef union
         u64 tpr:          8;
         u64 irq:          1;
         u64 vgif:         1;
-        u64 rsvd0:        6;
+        u64 rsvd0:        1;
+        u64 vnmi_pending: 1;
+        u64 vnmi_blocking:1;
+        u64 rsvd1:        3;
         u64 prio:         4;
         u64 ign_tpr:      1;
-        u64 rsvd1:        3;
+        u64 rsvd2:        3;
         u64 intr_masking: 1;
         u64 vgif_enable:  1;
-        u64 rsvd2:        6;
+        u64 vnmi_enable:  1;
+        u64 rsvd3:        5;
         u64 vector:       8;
-        u64 rsvd3:       24;
+        u64 rsvd4:       24;
     } fields;
 } vintr_t;
 
-- 
2.52.0



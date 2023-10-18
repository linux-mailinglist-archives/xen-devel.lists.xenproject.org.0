Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B127CDFA1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618618.962489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7V9-0001eZ-52; Wed, 18 Oct 2023 14:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618618.962489; Wed, 18 Oct 2023 14:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7V9-0001ax-18; Wed, 18 Oct 2023 14:26:23 +0000
Received: by outflank-mailman (input) for mailman id 618618;
 Wed, 18 Oct 2023 14:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7V7-0001YJ-EN
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e887e8c-6dc2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:26:20 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 309214EE0740;
 Wed, 18 Oct 2023 16:26:19 +0200 (CEST)
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
X-Inumbo-ID: 4e887e8c-6dc2-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/7] x86/mctelem: address violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:54 +0200
Message-Id: <3e811e830f6f49af6cc5abf4fec3c8c74b72256c.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mctelem.c |  2 +-
 xen/arch/x86/cpu/mcheck/mctelem.h | 25 +++++++++++++------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mctelem.c b/xen/arch/x86/cpu/mcheck/mctelem.c
index 77a4d1d5ff..b8d0368a7d 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -208,7 +208,7 @@ void mctelem_defer(mctelem_cookie_t cookie, bool lmce)
  *  @lmce: indicate which pending list on @cpu is handled
  */
 void mctelem_process_deferred(unsigned int cpu,
-			      int (*fn)(mctelem_cookie_t),
+			      int (*fn)(mctelem_cookie_t mctc),
 			      bool lmce)
 {
 	struct mctelem_ent *tep;
diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
index 21b251847b..f4c5ff848d 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.h
+++ b/xen/arch/x86/cpu/mcheck/mctelem.h
@@ -60,18 +60,19 @@ typedef enum mctelem_class {
     MC_NCLASSES
 } mctelem_class_t;
 
-extern void mctelem_init(unsigned int);
-extern mctelem_cookie_t mctelem_reserve(mctelem_class_t);
-extern void *mctelem_dataptr(mctelem_cookie_t);
-extern void mctelem_commit(mctelem_cookie_t);
-extern void mctelem_dismiss(mctelem_cookie_t);
-extern mctelem_cookie_t mctelem_consume_oldest_begin(mctelem_class_t);
-extern void mctelem_consume_oldest_end(mctelem_cookie_t);
-extern void mctelem_ack(mctelem_class_t, mctelem_cookie_t);
-extern void mctelem_defer(mctelem_cookie_t, bool lmce);
-extern void mctelem_process_deferred(unsigned int,
-                                     int (*)(mctelem_cookie_t), bool lmce);
-bool mctelem_has_deferred(unsigned int);
+extern void mctelem_init(unsigned int datasz);
+extern mctelem_cookie_t mctelem_reserve(mctelem_class_t which);
+extern void *mctelem_dataptr(mctelem_cookie_t cookie);
+extern void mctelem_commit(mctelem_cookie_t cookie);
+extern void mctelem_dismiss(mctelem_cookie_t cookie);
+extern mctelem_cookie_t mctelem_consume_oldest_begin(mctelem_class_t which);
+extern void mctelem_consume_oldest_end(mctelem_cookie_t cookie);
+extern void mctelem_ack(mctelem_class_t which, mctelem_cookie_t cookie);
+extern void mctelem_defer(mctelem_cookie_t cookie, bool lmce);
+extern void mctelem_process_deferred(unsigned int cpu,
+                                     int (*fn)(mctelem_cookie_t mctc),
+                                     bool lmce);
+bool mctelem_has_deferred(unsigned int cpu);
 bool mctelem_has_deferred_lmce(unsigned int cpu);
 
 #endif
-- 
2.34.1



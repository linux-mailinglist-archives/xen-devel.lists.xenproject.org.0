Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677876716A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571499.895500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPPvg-0001Eu-L6; Fri, 28 Jul 2023 16:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571499.895500; Fri, 28 Jul 2023 16:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPPvg-0001DD-IQ; Fri, 28 Jul 2023 16:03:00 +0000
Received: by outflank-mailman (input) for mailman id 571499;
 Fri, 28 Jul 2023 16:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8l51=DO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qPPvf-0001D7-93
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:02:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35b81657-2d60-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 18:02:53 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.17.225])
 by support.bugseng.com (Postfix) with ESMTPSA id 3FF574EE073F;
 Fri, 28 Jul 2023 18:02:52 +0200 (CEST)
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
X-Inumbo-ID: 35b81657-2d60-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/keyhandler: address violations of MISRA C:2012 Rule 8.3 and drop bool_t
Date: Fri, 28 Jul 2023 18:02:44 +0200
Message-Id: <7cb2183e6e387c04547b57b6f9f95c08bb613019.1690560051.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change types in function declarations to be consistent with the
corresponding definitions.
This addresses violations of MISRA C:2012 Rule 8.3: "All declarations
of an object or function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/keyhandler.c      | 8 ++++----
 xen/include/xen/keyhandler.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0a551033c4..68d8166968 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -101,8 +101,8 @@ void handle_keypress(unsigned char key, struct cpu_user_regs *regs)
     }
 }
 
-void register_keyhandler(unsigned char key, keyhandler_fn_t fn,
-                         const char *desc, bool_t diagnostic)
+void register_keyhandler(unsigned char key, keyhandler_fn_t *fn,
+                         const char *desc, bool diagnostic)
 {
     BUG_ON(key >= ARRAY_SIZE(key_table)); /* Key in range? */
     ASSERT(!key_table[key].fn);           /* Clobbering something else? */
@@ -113,8 +113,8 @@ void register_keyhandler(unsigned char key, keyhandler_fn_t fn,
     key_table[key].diagnostic = diagnostic;
 }
 
-void register_irq_keyhandler(unsigned char key, irq_keyhandler_fn_t fn,
-                             const char *desc, bool_t diagnostic)
+void register_irq_keyhandler(unsigned char key, irq_keyhandler_fn_t *fn,
+                             const char *desc, bool diagnostic)
 {
     BUG_ON(key >= ARRAY_SIZE(key_table)); /* Key in range? */
     ASSERT(!key_table[key].irq_fn);       /* Clobbering something else? */
diff --git a/xen/include/xen/keyhandler.h b/xen/include/xen/keyhandler.h
index 9c5830a037..5c6598af98 100644
--- a/xen/include/xen/keyhandler.h
+++ b/xen/include/xen/keyhandler.h
@@ -39,11 +39,11 @@ void initialize_keytable(void);
 void register_keyhandler(unsigned char key,
                          keyhandler_fn_t *fn,
                          const char *desc,
-                         bool_t diagnostic);
+                         bool diagnostic);
 void register_irq_keyhandler(unsigned char key,
                              irq_keyhandler_fn_t *fn,
                              const char *desc,
-                             bool_t diagnostic);
+                             bool diagnostic);
 
 /* Inject a keypress into the key-handling subsystem. */
 extern void handle_keypress(unsigned char key, struct cpu_user_regs *regs);
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D3E887038
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696958.1088259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLT-0002LI-LC; Fri, 22 Mar 2024 16:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696958.1088259; Fri, 22 Mar 2024 16:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLT-0002Fd-Dr; Fri, 22 Mar 2024 16:02:15 +0000
Received: by outflank-mailman (input) for mailman id 696958;
 Fri, 22 Mar 2024 16:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLS-0000W5-0a
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b547583-e865-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 17:02:12 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 961B34EE0C94;
 Fri, 22 Mar 2024 17:02:11 +0100 (CET)
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
X-Inumbo-ID: 8b547583-e865-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org
Subject: [XEN PATCH 08/11] x86/altcall: address violations of MISRA C Rule 20.7
Date: Fri, 22 Mar 2024 17:01:57 +0100
Message-Id: <653ead65966226f50b0e4ae0268912c9710f9dba.1711118582.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/alternative.h | 76 +++++++++++++-------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 0d3697f1de49..a3b7cbab8740 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -243,28 +243,28 @@ extern void alternative_branches(void);
 
 #define alternative_vcall0(func) ({             \
     ALT_CALL_NO_ARG1;                           \
-    (void)sizeof(func());                       \
+    (void)sizeof((func)());                     \
     (void)alternative_callN(0, int, func);      \
 })
 
-#define alternative_call0(func) ({              \
-    ALT_CALL_NO_ARG1;                           \
-    alternative_callN(0, typeof(func()), func); \
+#define alternative_call0(func) ({                \
+    ALT_CALL_NO_ARG1;                             \
+    alternative_callN(0, typeof((func)()), func); \
 })
 
 #define alternative_vcall1(func, arg) ({           \
     typeof(arg) v1_ = (arg);                       \
     ALT_CALL_ARG(v1_, 1);                          \
     ALT_CALL_NO_ARG2;                              \
-    (void)sizeof(func(arg));                       \
+    (void)sizeof((func)(arg));                     \
     (void)alternative_callN(1, int, func);         \
 })
 
-#define alternative_call1(func, arg) ({            \
-    typeof(arg) v1_ = (arg);                       \
-    ALT_CALL_ARG(v1_, 1);                          \
-    ALT_CALL_NO_ARG2;                              \
-    alternative_callN(1, typeof(func(arg)), func); \
+#define alternative_call1(func, arg) ({              \
+    typeof(arg) v1_ = (arg);                         \
+    ALT_CALL_ARG(v1_, 1);                            \
+    ALT_CALL_NO_ARG2;                                \
+    alternative_callN(1, typeof((func)(arg)), func); \
 })
 
 #define alternative_vcall2(func, arg1, arg2) ({           \
@@ -273,17 +273,17 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v1_, 1);                                 \
     ALT_CALL_ARG(v2_, 2);                                 \
     ALT_CALL_NO_ARG3;                                     \
-    (void)sizeof(func(arg1, arg2));                       \
+    (void)sizeof((func)(arg1, arg2));                     \
     (void)alternative_callN(2, int, func);                \
 })
 
-#define alternative_call2(func, arg1, arg2) ({            \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                            \
-    ALT_CALL_ARG(v1_, 1);                                 \
-    ALT_CALL_ARG(v2_, 2);                                 \
-    ALT_CALL_NO_ARG3;                                     \
-    alternative_callN(2, typeof(func(arg1, arg2)), func); \
+#define alternative_call2(func, arg1, arg2) ({              \
+    typeof(arg1) v1_ = (arg1);                              \
+    typeof(arg2) v2_ = (arg2);                              \
+    ALT_CALL_ARG(v1_, 1);                                   \
+    ALT_CALL_ARG(v2_, 2);                                   \
+    ALT_CALL_NO_ARG3;                                       \
+    alternative_callN(2, typeof((func)(arg1, arg2)), func); \
 })
 
 #define alternative_vcall3(func, arg1, arg2, arg3) ({    \
@@ -294,20 +294,20 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v2_, 2);                                \
     ALT_CALL_ARG(v3_, 3);                                \
     ALT_CALL_NO_ARG4;                                    \
-    (void)sizeof(func(arg1, arg2, arg3));                \
+    (void)sizeof((func)(arg1, arg2, arg3));              \
     (void)alternative_callN(3, int, func);               \
 })
 
-#define alternative_call3(func, arg1, arg2, arg3) ({     \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                           \
-    typeof(arg3) v3_ = (arg3);                           \
-    ALT_CALL_ARG(v1_, 1);                                \
-    ALT_CALL_ARG(v2_, 2);                                \
-    ALT_CALL_ARG(v3_, 3);                                \
-    ALT_CALL_NO_ARG4;                                    \
-    alternative_callN(3, typeof(func(arg1, arg2, arg3)), \
-                      func);                             \
+#define alternative_call3(func, arg1, arg2, arg3) ({       \
+    typeof(arg1) v1_ = (arg1);                             \
+    typeof(arg2) v2_ = (arg2);                             \
+    typeof(arg3) v3_ = (arg3);                             \
+    ALT_CALL_ARG(v1_, 1);                                  \
+    ALT_CALL_ARG(v2_, 2);                                  \
+    ALT_CALL_ARG(v3_, 3);                                  \
+    ALT_CALL_NO_ARG4;                                      \
+    alternative_callN(3, typeof((func)(arg1, arg2, arg3)), \
+                      func);                               \
 })
 
 #define alternative_vcall4(func, arg1, arg2, arg3, arg4) ({ \
@@ -320,7 +320,7 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v3_, 3);                                   \
     ALT_CALL_ARG(v4_, 4);                                   \
     ALT_CALL_NO_ARG5;                                       \
-    (void)sizeof(func(arg1, arg2, arg3, arg4));             \
+    (void)sizeof((func)(arg1, arg2, arg3, arg4));           \
     (void)alternative_callN(4, int, func);                  \
 })
 
@@ -334,8 +334,8 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v3_, 3);                                   \
     ALT_CALL_ARG(v4_, 4);                                   \
     ALT_CALL_NO_ARG5;                                       \
-    alternative_callN(4, typeof(func(arg1, arg2,            \
-                                     arg3, arg4)),          \
+    alternative_callN(4, typeof((func)(arg1, arg2,          \
+                                       arg3, arg4)),        \
                       func);                                \
 })
 
@@ -351,7 +351,7 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v4_, 4);                                         \
     ALT_CALL_ARG(v5_, 5);                                         \
     ALT_CALL_NO_ARG6;                                             \
-    (void)sizeof(func(arg1, arg2, arg3, arg4, arg5));             \
+    (void)sizeof((func)(arg1, arg2, arg3, arg4, arg5));           \
     (void)alternative_callN(5, int, func);                        \
 })
 
@@ -367,8 +367,8 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v4_, 4);                                         \
     ALT_CALL_ARG(v5_, 5);                                         \
     ALT_CALL_NO_ARG6;                                             \
-    alternative_callN(5, typeof(func(arg1, arg2, arg3,            \
-                                     arg4, arg5)),                \
+    alternative_callN(5, typeof((func)(arg1, arg2, arg3,          \
+                                       arg4, arg5)),              \
                       func);                                      \
 })
 
@@ -385,7 +385,7 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v4_, 4);                                               \
     ALT_CALL_ARG(v5_, 5);                                               \
     ALT_CALL_ARG(v6_, 6);                                               \
-    (void)sizeof(func(arg1, arg2, arg3, arg4, arg5, arg6));             \
+    (void)sizeof((func)(arg1, arg2, arg3, arg4, arg5, arg6));           \
     (void)alternative_callN(6, int, func);                              \
 })
 
@@ -402,8 +402,8 @@ extern void alternative_branches(void);
     ALT_CALL_ARG(v4_, 4);                                               \
     ALT_CALL_ARG(v5_, 5);                                               \
     ALT_CALL_ARG(v6_, 6);                                               \
-    alternative_callN(6, typeof(func(arg1, arg2, arg3,                  \
-                                     arg4, arg5, arg6)),                \
+    alternative_callN(6, typeof((func)(arg1, arg2, arg3,                \
+                                       arg4, arg5, arg6)),              \
                       func);                                            \
 })
 
-- 
2.34.1



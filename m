Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A807F918263
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748856.1156799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShv-0003NQ-F4; Wed, 26 Jun 2024 13:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748856.1156799; Wed, 26 Jun 2024 13:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShv-0003Ia-98; Wed, 26 Jun 2024 13:29:07 +0000
Received: by outflank-mailman (input) for mailman id 748856;
 Wed, 26 Jun 2024 13:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMSht-00030Q-L4
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:29:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e40c803-33c0-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:29:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 33B2B4EE0755;
 Wed, 26 Jun 2024 15:29:03 +0200 (CEST)
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
X-Inumbo-ID: 0e40c803-33c0-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 for-4.20 2/7] xen/self-tests: address violations of MISRA rule 20.7
Date: Wed, 26 Jun 2024 15:28:48 +0200
Message-Id: <42d5c74777622407682ad80db0e31d3bd09005c7.1719407840.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719407840.git.nicola.vetrini@bugseng.com>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
In this case the use of parentheses can detect misuses of the COMPILE_CHECK
macro for the fn argument that happen to pass the compile-time check
(see e.g. https://godbolt.org/z/n4zTdz595).

An alternative would be to deviate these macros, but since they are used
to check the correctness of other code it seemed the better alternative
to futher ensure that all usages of the macros are safe.
---
 xen/include/xen/self-tests.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index 42a4cc4d17fe..58484fe5a8ae 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -19,11 +19,11 @@
 #if !defined(CONFIG_CC_IS_CLANG) || CONFIG_CLANG_VERSION >= 80000
 #define COMPILE_CHECK(fn, val, res)                                     \
     do {                                                                \
-        typeof(fn(val)) real = fn(val);                                 \
+        typeof((fn)(val)) real = (fn)(val);                             \
                                                                         \
         if ( !__builtin_constant_p(real) )                              \
             asm ( ".error \"'" STR(fn(val)) "' not compile-time constant\"" ); \
-        else if ( real != res )                                         \
+        else if ( real != (res) )                                       \
             asm ( ".error \"Compile time check '" STR(fn(val) == res) "' failed\"" ); \
     } while ( 0 )
 #else
@@ -37,9 +37,9 @@
  */
 #define RUNTIME_CHECK(fn, val, res)                     \
     do {                                                \
-        typeof(fn(val)) real = fn(HIDE(val));           \
+        typeof((fn)(val)) real = (fn)(HIDE(val));       \
                                                         \
-        if ( real != res )                              \
+        if ( real != (res) )                            \
             panic("%s: %s(%s) expected %u, got %u\n",   \
                   __func__, #fn, #val, real, res);      \
     } while ( 0 )
-- 
2.34.1


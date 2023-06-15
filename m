Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AB731560
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 12:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549524.858105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kFI-0001tr-Rh; Thu, 15 Jun 2023 10:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549524.858105; Thu, 15 Jun 2023 10:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9kFI-0001ro-Nn; Thu, 15 Jun 2023 10:30:28 +0000
Received: by outflank-mailman (input) for mailman id 549524;
 Thu, 15 Jun 2023 10:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJjk=CD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1q9kFH-0001ri-K1
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 10:30:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3c5a7bf-0b67-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 12:30:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.57.87.217])
 by support.bugseng.com (Postfix) with ESMTPSA id 32E2B4EE0738;
 Thu, 15 Jun 2023 12:30:23 +0200 (CEST)
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
X-Inumbo-ID: a3c5a7bf-0b67-11ee-b232-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/include/xen/lib.h: avoid undefined behavior.
Date: Thu, 15 Jun 2023 12:30:15 +0200
Message-Id: <e8e56dc4e45ec79f3e5380544b56c3e0b3b2bcb9.1686824437.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redefine BUILD_BUG_ON_ZERO to fully comply with C99 avoiding
undefined behavior 58 ("A structure or union is defined as
containing no named members (6.7.2.1)."
This also avoids a dependency on the compiler and its version.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/lib.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 67fc7c1d7e..a266159b9f 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -40,22 +40,8 @@
     unlikely(ret_warn_on_);             \
 })
 
-/* All clang versions supported by Xen have _Static_assert. */
-#if defined(__clang__) || \
-    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
-/* Force a compilation error if condition is true */
-#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
-
-/* Force a compilation error if condition is true, but also produce a
-   result (of value 0 and type size_t), so the expression can be used
-   e.g. in a structure initializer (or where-ever else comma expressions
-   aren't permitted). */
-#define BUILD_BUG_ON_ZERO(cond) \
-    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
-#else
-#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
+#define BUILD_BUG_ON_ZERO(cond) (sizeof(char[(cond)? -1 : 1]) - 1U)
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
-#endif
 
 #ifndef NDEBUG
 #define ASSERT(p) \
-- 
2.34.1



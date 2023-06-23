Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219C73B321
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 11:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554340.865479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCcdx-0004pM-IM; Fri, 23 Jun 2023 08:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554340.865479; Fri, 23 Jun 2023 08:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCcdx-0004nX-F6; Fri, 23 Jun 2023 08:59:49 +0000
Received: by outflank-mailman (input) for mailman id 554340;
 Fri, 23 Jun 2023 08:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5XO=CL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qCcdw-0004nR-Gn
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 08:59:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dc29e65-11a4-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 10:59:47 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.37.21.21])
 by support.bugseng.com (Postfix) with ESMTPSA id 0F57E4EE0737;
 Fri, 23 Jun 2023 10:59:44 +0200 (CEST)
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
X-Inumbo-ID: 4dc29e65-11a4-11ee-b237-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4] xen/include: avoid using a compiler extension for BUILD_BUG_ON_ZERO.
Date: Fri, 23 Jun 2023 10:59:27 +0200
Message-Id: <4ab190bd0d80898311aa9f1e912f18e7cdef2762.1687510380.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
that gives an acceptable semantics to C99 undefined behavior 58
("A structure or union is defined as containing no named members
(6.7.2.1)").

The chosen ill-formed construct is a negative bitwidth in a
bitfield within a struct containing at least one named member,
which prevents the UB while keeping the semantics of the construct.

The choice of the bitwise AND operation to bring the result to 0
when cond is false boils down to possibly better portability,
and the 'U' suffix to make it obvious that this operation results
in an unsigned value.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in V2:
- Avoid using a VLA as the compile-time assertion
- Do not drop _Static_assert
Changes in V3:
- Changed the operation to bring the result to 0 when the
construct does not lead to a compilation error
Changes in V4:
- Switched to a shorter construct for the second definition.
---
 xen/include/xen/lib.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 67fc7c1d7e..460cab6734 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -51,9 +51,10 @@
    e.g. in a structure initializer (or where-ever else comma expressions
    aren't permitted). */
 #define BUILD_BUG_ON_ZERO(cond) \
-    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
+    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0U)
 #else
-#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
+#define BUILD_BUG_ON_ZERO(cond) \
+    (sizeof(struct { unsigned u : !(cond); }) & 0U)
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
 #endif
 
-- 
2.34.1



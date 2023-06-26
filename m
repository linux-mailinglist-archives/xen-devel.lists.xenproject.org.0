Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756573E33C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 17:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555578.867463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDo5p-0002iG-MR; Mon, 26 Jun 2023 15:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555578.867463; Mon, 26 Jun 2023 15:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDo5p-0002fW-Jh; Mon, 26 Jun 2023 15:25:29 +0000
Received: by outflank-mailman (input) for mailman id 555578;
 Mon, 26 Jun 2023 15:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpUb=CO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qDo5n-0002fM-KH
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 15:25:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab4645b6-1435-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 17:25:23 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.35.129.1])
 by support.bugseng.com (Postfix) with ESMTPSA id 3C40E4EE0738;
 Mon, 26 Jun 2023 17:25:20 +0200 (CEST)
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
X-Inumbo-ID: ab4645b6-1435-11ee-8611-37d641c3527e
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
Subject: [XEN PATCH v5] xen/include: avoid using a compiler extension for BUILD_BUG_ON_ZERO
Date: Mon, 26 Jun 2023 17:24:35 +0200
Message-Id: <10f8685626fa4a9d131186a23b293479cb92da38.1687791626.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redefine BUILD_BUG_ON_ZERO to avoid using a compiler extension
that gives an acceptable semantics to C99 undefined behavior 58
("A structure or union is defined as containing no named members
(6.7.2.1)").

The first definition includes an additional named field of type
char.

The chosen ill-formed construct for the second definition is a struct
with a named bitfield of width 0 when the condition is true,
which prevents the UB without using the compiler extension while keeping
the semantics of the construct.

The choice of the bitwise AND operation to bring the result to 0
when cond is false boils down to possibly better portability.

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
Changes in V5:
- Dropped 'U's from the macro definitions
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



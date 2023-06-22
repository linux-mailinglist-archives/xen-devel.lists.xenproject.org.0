Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61C73996C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553366.863873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFd0-0006ro-Iu; Thu, 22 Jun 2023 08:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553366.863873; Thu, 22 Jun 2023 08:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFd0-0006pN-Fb; Thu, 22 Jun 2023 08:25:18 +0000
Received: by outflank-mailman (input) for mailman id 553366;
 Thu, 22 Jun 2023 08:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J06O=CK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qCFcy-0006pE-Nh
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:25:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f69edcb-10d6-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:25:13 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.37.206.199])
 by support.bugseng.com (Postfix) with ESMTPSA id 5AB224EE0737;
 Thu, 22 Jun 2023 10:25:11 +0200 (CEST)
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
X-Inumbo-ID: 4f69edcb-10d6-11ee-8611-37d641c3527e
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
Subject: [XEN PATCH v3] xen/include: avoid using a compiler extension for BUILD_BUG_ON_ZERO.
Date: Thu, 22 Jun 2023 10:24:50 +0200
Message-Id: <db883456d7d210e2ea9ac4a7b402dda73c3ea8cd.1687421893.git.nicola.vetrini@bugseng.com>
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

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in V2:
- Avoid using a VLA as the compile-time assertion
- Do not drop _Static_assert
Changes in V3:
- Changed the operation to bring the result to 0 when the
construct does not lead to a compilation error
---
 xen/include/xen/lib.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 67fc7c1d7e..d5f9c4a18a 100644
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
+    (sizeof(struct { unsigned u : (cond) ? -1 : 1; }) & 0U)
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
 #endif
 
-- 
2.34.1



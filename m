Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDBF737C98
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 10:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552515.862639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBslU-0004xM-Ps; Wed, 21 Jun 2023 08:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552515.862639; Wed, 21 Jun 2023 08:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBslU-0004vZ-Mu; Wed, 21 Jun 2023 08:00:32 +0000
Received: by outflank-mailman (input) for mailman id 552515;
 Wed, 21 Jun 2023 08:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HE3C=CJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBslT-0004vT-Rq
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 08:00:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b046c6fb-1009-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 10:00:30 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.47.226.168])
 by support.bugseng.com (Postfix) with ESMTPSA id 549BD4EE0737;
 Wed, 21 Jun 2023 10:00:16 +0200 (CEST)
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
X-Inumbo-ID: b046c6fb-1009-11ee-b236-6b7b168915f2
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
Subject: [XEN PATCH v2] xen/include: avoid undefined behavior.
Date: Wed, 21 Jun 2023 09:58:15 +0200
Message-Id: <9d222cc83013aaa67b45638b27f5975b60aecb37.1687332385.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redefine BUILD_BUG_ON_ZERO to fully comply with C99 avoiding
undefined behavior 58 ("A structure or union is defined as
containing no named members (6.7.2.1)."

The chosen ill-formed construct is a negative bitwidth in a
bitfield within a struct containing at least one named member,
which prevents the UB while keeping the semantics of the construct
for any memory layout of the struct (this motivates the
"sizeof(unsigned) * 8" in the definition of the macro).

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in V2:
- Avoid using a VLA as the compile-time assertion
- Do not drop _Static_assert
---
 xen/include/xen/lib.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 67fc7c1d7e..e57d272772 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -51,9 +51,10 @@
    e.g. in a structure initializer (or where-ever else comma expressions
    aren't permitted). */
 #define BUILD_BUG_ON_ZERO(cond) \
-    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
+    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) - 1U)
 #else
-#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
+#define BUILD_BUG_ON_ZERO(cond) \
+    (sizeof(struct { unsigned u : (cond) ? -1 : sizeof(unsigned) * 8; }) - sizeof(unsigned))
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
 #endif
 
-- 
2.34.1



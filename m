Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D07D99FE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624388.972978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyr-00025t-3h; Fri, 27 Oct 2023 13:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624388.972978; Fri, 27 Oct 2023 13:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyq-0001wb-Li; Fri, 27 Oct 2023 13:34:28 +0000
Received: by outflank-mailman (input) for mailman id 624388;
 Fri, 27 Oct 2023 13:34:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwMyo-0000bB-JI
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:34:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b68a9e1-74cd-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 15:34:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 638DB4EE0C8D;
 Fri, 27 Oct 2023 15:34:24 +0200 (CEST)
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
X-Inumbo-ID: 8b68a9e1-74cd-11ee-98d6-6d05b1d4d9a1
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v4 8/8] xen/compat: use BUILD_BUG_ON in CHECK_SIZE macros
Date: Fri, 27 Oct 2023 15:34:15 +0200
Message-Id: <16877f531dd79442a7fad6e8bacd17f445a0ad66.1698410970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698410970.git.nicola.vetrini@bugseng.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BUILD_BUG_ON is the preferred way to induce a build error
upon statically determined incorrect conditions.

This also fixes a MISRA C:2012 Rule 10.1 violation in the
previous formulation.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- replace the construct with a BUILD_BUG_ON.
Changes in v3:
- drop unused typedef.
---
 xen/include/xen/compat.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
index f2ce5bb3580a..41a5d61eef98 100644
--- a/xen/include/xen/compat.h
+++ b/xen/include/xen/compat.h
@@ -151,12 +151,18 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
     return x == c; \
 }
 
-#define CHECK_SIZE(name) \
-    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) != \
-                                         sizeof(compat_ ## name ## _t)) * 2]
+#define CHECK_SIZE(name)                                  \
+static inline void __maybe_unused CHECK_SIZE_##name(void) \
+{                                                         \
+    BUILD_BUG_ON(sizeof(xen_ ## name ## _t) !=            \
+                 sizeof(compat_ ## name ## _t));          \
+}
 #define CHECK_SIZE_(k, n) \
-    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
-                                          sizeof(k compat_ ## n)) * 2]
+static inline void __maybe_unused CHECK_SIZE_##k_##n(void) \
+{                                                          \
+    BUILD_BUG_ON(sizeof(k xen_ ## n) !=                    \
+                 sizeof(k compat_ ## n));                  \
+}
 
 #define CHECK_FIELD_COMMON(name, t, f) \
 static inline int __maybe_unused name(xen_ ## t ## _t *x, compat_ ## t ## _t *c) \
-- 
2.34.1



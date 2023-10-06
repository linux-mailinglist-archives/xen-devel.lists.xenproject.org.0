Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3D7BB321
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613310.953836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogAF-0008Tz-NE; Fri, 06 Oct 2023 08:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613310.953836; Fri, 06 Oct 2023 08:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogAF-0008QV-Hc; Fri, 06 Oct 2023 08:26:27 +0000
Received: by outflank-mailman (input) for mailman id 613310;
 Fri, 06 Oct 2023 08:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qogAD-0006Fk-LQ
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:26:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08da8f32-6422-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 10:26:23 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id BEC954EE0C89;
 Fri,  6 Oct 2023 10:26:22 +0200 (CEST)
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
X-Inumbo-ID: 08da8f32-6422-11ee-98d3-6d05b1d4d9a1
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
Subject: [XEN PATCH 9/9] xen/compat: address Rule 10.1 for macros CHECK_SIZE
Date: Fri,  6 Oct 2023 10:26:12 +0200
Message-Id: <7edf60c0e7bd0680d8b8f8d3aec1264ee5a43878.1696514677.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696514677.git.nicola.vetrini@bugseng.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The essential type of the result of an inequality operator is
essentially boolean, therefore it shouldn't be used as an argument of
the multiplication operator, which expects an integer.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/compat.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
index f2ce5bb3580a..5ffee6a9fed1 100644
--- a/xen/include/xen/compat.h
+++ b/xen/include/xen/compat.h
@@ -151,12 +151,14 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
     return x == c; \
 }
 
+#define SIZE_NEQUAL(a, b) \
+    (sizeof(a) != sizeof(b) ? 1 : 0)
 #define CHECK_SIZE(name) \
-    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) != \
-                                         sizeof(compat_ ## name ## _t)) * 2]
+    typedef int CHECK_NAME(name, S)[1 - (SIZE_NEQUAL(xen_ ## name ## _t, \
+                                                     compat_ ## name ## _t)) * 2]
 #define CHECK_SIZE_(k, n) \
-    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
-                                          sizeof(k compat_ ## n)) * 2]
+    typedef int CHECK_NAME_(k, n, S)[1 - (SIZE_NEQUAL(k xen_ ## n, \
+                                                      k compat_ ## n)) * 2]
 
 #define CHECK_FIELD_COMMON(name, t, f) \
 static inline int __maybe_unused name(xen_ ## t ## _t *x, compat_ ## t ## _t *c) \
-- 
2.34.1



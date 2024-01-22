Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C165D8364B0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669905.1042421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuf2-0007fs-85; Mon, 22 Jan 2024 13:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669905.1042421; Mon, 22 Jan 2024 13:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuf2-0007dm-2R; Mon, 22 Jan 2024 13:48:24 +0000
Received: by outflank-mailman (input) for mailman id 669905;
 Mon, 22 Jan 2024 13:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9EV=JA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rRuf0-0007Ly-VY
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:48:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7c82d78-b92c-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:48:21 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-16-84-78.retail.telecomitalia.it [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id DE0684EE073C;
 Mon, 22 Jan 2024 14:48:20 +0100 (CET)
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
X-Inumbo-ID: e7c82d78-b92c-11ee-98f2-6d05b1d4d9a1
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
Subject: [XEN PATCH 1/3] xen: introduce static_assert_unreachable()
Date: Mon, 22 Jan 2024 14:48:06 +0100
Message-Id: <01c57c7e5131d699cf622be96fea7cd8e03c23f9.1705930767.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705930767.git.federico.serafini@bugseng.com>
References: <cover.1705930767.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce macro static_asser_unreachable() to check that a program
point is considered unreachable by the static analysis performed by the
compiler, even at optimization level -O0.

The use of such macro will lead to one of the following outcomes:
- the program point identified by the macro is considered unreachable,
  then the compiler removes the macro;
- the program point identified by the macro is not considered
  unreachable, then the compiler does not remove the macro, which will
  lead to a failure in the build process caused by an assembler error.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/compiler.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 16d554f2a5..ad0520f5d4 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -64,6 +64,14 @@
 # define fallthrough        do {} while (0)  /* fallthrough */
 #endif
 
+/*
+ * Add the following macro to check that a program point is considered
+ * unreachable by the static analysis performed by the compiler,
+ * even at optimization level -O0.
+ */
+#define static_assert_unreachable() \
+    asm(".error \"unreachable program point reached\"");
+
 #ifdef __clang__
 /* Clang can replace some vars with new automatic ones that go in .data;
  * mark all explicit-segment vars 'used' to prevent that. */
-- 
2.34.1



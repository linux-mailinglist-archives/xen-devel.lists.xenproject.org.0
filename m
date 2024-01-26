Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5883D769
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 11:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671913.1045456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTJ8i-00088f-6e; Fri, 26 Jan 2024 10:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671913.1045456; Fri, 26 Jan 2024 10:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTJ8h-00086L-WC; Fri, 26 Jan 2024 10:08:48 +0000
Received: by outflank-mailman (input) for mailman id 671913;
 Fri, 26 Jan 2024 10:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rljN=JE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rTJ8g-0007rs-Ah
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 10:08:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e32ebed6-bc32-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 11:08:44 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-16-84-78.retail.telecomitalia.it [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id 888294EE0749;
 Fri, 26 Jan 2024 11:08:43 +0100 (CET)
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
X-Inumbo-ID: e32ebed6-bc32-11ee-98f5-efadbce2ee36
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
Subject: [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE()
Date: Fri, 26 Jan 2024 11:05:41 +0100
Message-Id: <42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706259490.git.federico.serafini@bugseng.com>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce macro STATIC_ASSERT_UNREACHABLE() to check that a program
point is considered unreachable by the static analysis performed by the
compiler.

The use of such macro will lead to one of the following outcomes:
- the program point identified by the macro is considered unreachable,
  then the compiler removes the macro;
- the program point identified by the macro is not considered
  unreachable, then the compiler does not remove the macro, which will
  lead to a failure in the build process caused by an assembler error.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- removed constraint about optimization level -O0;
- use capital letters for macro name;
- add missing blanks;
- remove stray semicolon;
- cite the assertion failure in the error message.
---
 xen/include/xen/compiler.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 16d554f2a5..062f54449c 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -64,6 +64,13 @@
 # define fallthrough        do {} while (0)  /* fallthrough */
 #endif
 
+/*
+ * Add the following macro to check that a program point is considered
+ * unreachable by the static analysis performed by the compiler.
+ */
+#define STATIC_ASSERT_UNREACHABLE() \
+    asm ( ".error \"static assertion failed: unreachable\"" )
+
 #ifdef __clang__
 /* Clang can replace some vars with new automatic ones that go in .data;
  * mark all explicit-segment vars 'used' to prevent that. */
-- 
2.34.1



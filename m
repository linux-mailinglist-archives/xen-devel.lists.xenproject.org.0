Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A715C7DEFC5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626822.977429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUpU-0006Gk-4I; Thu, 02 Nov 2023 10:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626822.977429; Thu, 02 Nov 2023 10:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUpU-0006Eu-0u; Thu, 02 Nov 2023 10:21:36 +0000
Received: by outflank-mailman (input) for mailman id 626822;
 Thu, 02 Nov 2023 10:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOkq=GP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qyUpT-0006Em-0g
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:21:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98106682-7969-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 11:21:32 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-7-132-154.retail.telecomitalia.it [87.7.132.154])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A26D4EE0737;
 Thu,  2 Nov 2023 11:21:32 +0100 (CET)
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
X-Inumbo-ID: 98106682-7969-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH] xen/lib: remove the overwrtitten string functions from x86 build
Date: Thu,  2 Nov 2023 11:21:01 +0100
Message-Id: <c313895654437fe154e989a7d633cca2ccc710d8.1698914967.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the generic implementation of memcpy(), memmove() and
memset() from the x86 build since a version written in asm is present.
This addesses violations of MISRA C:2012 Rule 8.6 ("An identifier with
external linkage shall have exactly one external definition").

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/lib/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 2d9ebb945f..ac0edd4745 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,5 +1,9 @@
 obj-$(CONFIG_X86) += x86/
 
+ifneq ($(CONFIG_X86),y)
+    NO_ARCH_STRING_C=y
+endif
+
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
@@ -7,9 +11,9 @@ lib-y += list-sort.o
 lib-y += memchr.o
 lib-y += memchr_inv.o
 lib-y += memcmp.o
-lib-y += memcpy.o
-lib-y += memmove.o
-lib-y += memset.o
+lib-$(NO_ARCH_STRING_C) += memcpy.o
+lib-$(NO_ARCH_STRING_C) += memmove.o
+lib-$(NO_ARCH_STRING_C) += memset.o
 lib-y += muldiv64.o
 lib-y += parse-size.o
 lib-y += rbtree.o
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B247F5F25
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639707.997352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68zn-0003zh-3t; Thu, 23 Nov 2023 12:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639707.997352; Thu, 23 Nov 2023 12:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68zn-0003x1-12; Thu, 23 Nov 2023 12:39:51 +0000
Received: by outflank-mailman (input) for mailman id 639707;
 Thu, 23 Nov 2023 12:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aajm=HE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r68zl-0003vq-59
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:39:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b6b9db-89fd-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 13:39:45 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.50.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 5B5954EE073C;
 Thu, 23 Nov 2023 13:39:44 +0100 (CET)
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
X-Inumbo-ID: 61b6b9db-89fd-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH v2] xen/sort: address violations of MISRA C:2012 Rule 8.2
Date: Thu, 23 Nov 2023 13:39:37 +0100
Message-Id: <8b84bea9a52d9ae60fc355855bcb046ac5f24686.1700740128.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - used "a" and "b" for cmp.
---
 xen/include/xen/sort.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
index 2f52ff85b9..b953286284 100644
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -23,8 +23,8 @@
 extern gnu_inline
 #endif
 void sort(void *base, size_t num, size_t size,
-          int (*cmp)(const void *, const void *),
-          void (*swap)(void *, void *, size_t))
+          int (*cmp)(const void *a, const void *b),
+          void (*swap)(void *a, void *b, size_t size))
 {
     /* pre-scale counters for performance */
     size_t i = (num / 2) * size, n = num * size, c, r;
-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD737EEDA6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634879.990466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uPA-0005PK-TZ; Fri, 17 Nov 2023 08:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634879.990466; Fri, 17 Nov 2023 08:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uPA-0005Ms-Pf; Fri, 17 Nov 2023 08:40:48 +0000
Received: by outflank-mailman (input) for mailman id 634879;
 Fri, 17 Nov 2023 08:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uP9-0004ds-DW
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:40:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c2cc26-8525-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 09:40:47 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id B632A4EE0C88;
 Fri, 17 Nov 2023 09:40:45 +0100 (CET)
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
X-Inumbo-ID: 00c2cc26-8525-11ee-98dc-6d05b1d4d9a1
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
Subject: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 17 Nov 2023 09:40:07 +0100
Message-Id: <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700209834.git.federico.serafini@bugseng.com>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/sort.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
index 2f52ff85b9..1d5e3c5849 100644
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -23,8 +23,8 @@
 extern gnu_inline
 #endif
 void sort(void *base, size_t num, size_t size,
-          int (*cmp)(const void *, const void *),
-          void (*swap)(void *, void *, size_t))
+          int (*cmp)(const void *key, const void *elem),
+          void (*swap)(void *a, void *b, size_t size))
 {
     /* pre-scale counters for performance */
     size_t i = (num / 2) * size, n = num * size, c, r;
-- 
2.34.1



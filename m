Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC07EEDA8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 09:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634880.990475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uPD-0005iU-6l; Fri, 17 Nov 2023 08:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634880.990475; Fri, 17 Nov 2023 08:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3uPD-0005f0-3T; Fri, 17 Nov 2023 08:40:51 +0000
Received: by outflank-mailman (input) for mailman id 634880;
 Fri, 17 Nov 2023 08:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3uPB-0004ds-5X
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 08:40:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01ce1612-8525-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 09:40:48 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id 286F14EE0C89;
 Fri, 17 Nov 2023 09:40:46 +0100 (CET)
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
X-Inumbo-ID: 01ce1612-8525-11ee-98dc-6d05b1d4d9a1
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
Subject: [XEN PATCH 4/5] xen/vmap: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 17 Nov 2023 09:40:08 +0100
Message-Id: <d4d67e48298f4b51836c3c5b0a982775f469d74b.1700209834.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700209834.git.federico.serafini@bugseng.com>
References: <cover.1700209834.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/vmap.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index b0f7632e89..2b7369e062 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -13,9 +13,9 @@ enum vmap_region {
 void vm_init_type(enum vmap_region type, void *start, void *end);
 
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
-             unsigned int align, unsigned int flags, enum vmap_region);
+             unsigned int align, unsigned int flags, enum vmap_region type);
 void *vmap(const mfn_t *mfn, unsigned int nr);
-void vunmap(const void *);
+void vunmap(const void *va);
 
 void *vmalloc(size_t size);
 void *vmalloc_xen(size_t size);
@@ -23,7 +23,7 @@ void *vmalloc_xen(size_t size);
 void *vzalloc(size_t size);
 void vfree(void *va);
 
-void __iomem *ioremap(paddr_t, size_t);
+void __iomem *ioremap(paddr_t pa, size_t len);
 
 static inline void iounmap(void __iomem *va)
 {
-- 
2.34.1



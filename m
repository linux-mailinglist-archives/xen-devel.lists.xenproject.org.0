Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D2520B2A
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 04:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325092.547540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFbW-0003Us-GO; Tue, 10 May 2022 02:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325092.547540; Tue, 10 May 2022 02:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFbW-0003SH-Bx; Tue, 10 May 2022 02:28:02 +0000
Received: by outflank-mailman (input) for mailman id 325092;
 Tue, 10 May 2022 02:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0KWj=VS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1noFbU-0003Ap-8b
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 02:28:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cee46989-d008-11ec-a406-831a346695d4;
 Tue, 10 May 2022 04:27:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CB9F12FC;
 Mon,  9 May 2022 19:27:58 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 424D13F66F;
 Mon,  9 May 2022 19:27:54 -0700 (PDT)
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
X-Inumbo-ID: cee46989-d008-11ec-a406-831a346695d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v4 1/6] xen: do not free reserved memory into heap
Date: Tue, 10 May 2022 10:27:28 +0800
Message-Id: <20220510022733.2422581-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510022733.2422581-1-Penny.Zheng@arm.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pages used as guest RAM for static domain, shall be reserved to this
domain only.
So in case reserved pages being used for other purpose, users
shall not free them back to heap, even when last ref gets dropped.

free_staticmem_pages will be called by free_heap_pages in runtime
for static domain freeing memory resource, so let's drop the __init
flag.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v4 changes:
- no changes
---
v3 changes:
- fix possible racy issue in free_staticmem_pages()
- introduce a stub free_staticmem_pages() for the !CONFIG_STATIC_MEMORY case
- move the change to free_heap_pages() to cover other potential call sites
- fix the indentation
---
v2 changes:
- new commit
---
 xen/common/page_alloc.c | 17 ++++++++++++++---
 xen/include/xen/mm.h    |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 319029140f..5e569a48a2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1443,6 +1443,10 @@ static void free_heap_pages(
 
     ASSERT(order <= MAX_ORDER);
 
+    if ( pg->count_info & PGC_reserved )
+        /* Reserved page shall not go back to the heap. */
+        return free_staticmem_pages(pg, 1UL << order, need_scrub);
+
     spin_lock(&heap_lock);
 
     for ( i = 0; i < (1 << order); i++ )
@@ -2636,8 +2640,8 @@ struct domain *get_pg_owner(domid_t domid)
 
 #ifdef CONFIG_STATIC_MEMORY
 /* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
-void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
-                                 bool need_scrub)
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub)
 {
     mfn_t mfn = page_to_mfn(pg);
     unsigned long i;
@@ -2653,7 +2657,8 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
         }
 
         /* In case initializing page of static memory, mark it PGC_reserved. */
-        pg[i].count_info |= PGC_reserved;
+        if ( !(pg[i].count_info & PGC_reserved) )
+            pg[i].count_info |= PGC_reserved;
     }
 }
 
@@ -2762,6 +2767,12 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 
     return 0;
 }
+#else
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3be754da92..9fd95deaec 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,10 +85,10 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
-#ifdef CONFIG_STATIC_MEMORY
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
+#ifdef CONFIG_STATIC_MEMORY
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
 #endif
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEAE550EA4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 04:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352185.578937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37PF-0005EF-Dx; Mon, 20 Jun 2022 02:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352185.578937; Mon, 20 Jun 2022 02:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37PF-0005C6-9b; Mon, 20 Jun 2022 02:44:49 +0000
Received: by outflank-mailman (input) for mailman id 352185;
 Mon, 20 Jun 2022 02:44:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o37PE-0005AM-9J
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 02:44:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f10185ef-f042-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 04:44:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15A7B1042;
 Sun, 19 Jun 2022 19:44:44 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BC8F3F7D7;
 Sun, 19 Jun 2022 19:44:40 -0700 (PDT)
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
X-Inumbo-ID: f10185ef-f042-11ec-b725-ed86ccbb4733
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v7 2/9] xen: do not free reserved memory into heap
Date: Mon, 20 Jun 2022 10:44:01 +0800
Message-Id: <20220620024408.203797-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620024408.203797-1-Penny.Zheng@arm.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v7 changes:
- protect free_staticmem_pages with heap_lock to match its reverse function
acquire_staticmem_pages
---
v6 changes:
- adapt to PGC_static
- remove #ifdef aroud function declaration
---
v5 changes:
- In order to avoid stub functions, we #define PGC_staticmem to non-zero only
when CONFIG_STATIC_MEMORY
- use "unlikely()" around pg->count_info & PGC_staticmem
- remove pointless "if", since mark_page_free() is going to set count_info
to PGC_state_free and by consequence clear PGC_staticmem
- move #define PGC_staticmem 0 to mm.h
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
 xen/arch/arm/include/asm/mm.h |  4 +++-
 xen/common/page_alloc.c       | 16 +++++++++++++---
 xen/include/xen/mm.h          |  2 --
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index daef12e740..066a869783 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -108,9 +108,11 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
-  /* Page is static memory */
+#ifdef CONFIG_STATIC_MEMORY
+/* Page is static memory */
 #define _PGC_static    PG_shift(3)
 #define PGC_static     PG_mask(1, 3)
+#endif
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 743e3543fd..f27fa90ec4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1443,6 +1443,13 @@ static void free_heap_pages(
 
     ASSERT(order <= MAX_ORDER);
 
+    if ( unlikely(pg->count_info & PGC_static) )
+    {
+        /* Pages of static memory shall not go back to the heap. */
+        free_staticmem_pages(pg, 1UL << order, need_scrub);
+        return;
+    }
+
     spin_lock(&heap_lock);
 
     for ( i = 0; i < (1 << order); i++ )
@@ -2636,12 +2643,14 @@ struct domain *get_pg_owner(domid_t domid)
 
 #ifdef CONFIG_STATIC_MEMORY
 /* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
-void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
-                                 bool need_scrub)
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub)
 {
     mfn_t mfn = page_to_mfn(pg);
     unsigned long i;
 
+    spin_lock(&heap_lock);
+
     for ( i = 0; i < nr_mfns; i++ )
     {
         mark_page_free(&pg[i], mfn_add(mfn, i));
@@ -2652,9 +2661,10 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             scrub_one_page(pg);
         }
 
-        /* In case initializing page of static memory, mark it PGC_static. */
         pg[i].count_info |= PGC_static;
     }
+
+    spin_unlock(&heap_lock);
 }
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3be754da92..1c4ddb336b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,13 +85,11 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
-#ifdef CONFIG_STATIC_MEMORY
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
-#endif
 
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
-- 
2.25.1



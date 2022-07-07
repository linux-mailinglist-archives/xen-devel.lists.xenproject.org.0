Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A4569E85
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 11:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362801.593039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Nj7-0003Np-NU; Thu, 07 Jul 2022 09:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362801.593039; Thu, 07 Jul 2022 09:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Nj7-0003Lf-K1; Thu, 07 Jul 2022 09:23:13 +0000
Received: by outflank-mailman (input) for mailman id 362801;
 Thu, 07 Jul 2022 09:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTeC=XM=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o9Nj5-00032J-GI
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 09:23:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6abb262f-fdd6-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 11:23:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A1881063;
 Thu,  7 Jul 2022 02:23:10 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E85133F792;
 Thu,  7 Jul 2022 02:23:05 -0700 (PDT)
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
X-Inumbo-ID: 6abb262f-fdd6-11ec-924f-1f966e50362f
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
Subject: [PATCH v8 2/9] xen: do not free reserved memory into heap
Date: Thu,  7 Jul 2022 17:22:37 +0800
Message-Id: <20220707092244.485936-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707092244.485936-1-Penny.Zheng@arm.com>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pages used as guest RAM for static domain, shall be reserved to this
domain only.
So in case reserved pages being used for other purpose, users
shall not free them back to heap, even when last ref gets dropped.

This commit introduces a new helper free_domstatic_page to free
static page in runtime, and free_staticmem_pages will be called by it
in runtime, so let's drop the __init flag.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v8 changes:
- introduce new helper free_domstatic_page
- let put_page call free_domstatic_page for static page, when last ref
drops
- #define PGC_static zero when !CONFIG_STATIC_MEMORY in xen/mm.h, as it
is used outside page_alloc.c
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
---
 xen/arch/arm/include/asm/mm.h |  4 ++-
 xen/arch/arm/mm.c             |  2 ++
 xen/common/page_alloc.c       | 51 ++++++++++++++++++++++++++++++-----
 xen/include/xen/mm.h          |  7 +++--
 4 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 8b2481c1f3..f1640bbda4 100644
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
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 009b8cd9ef..a3bc6d7a24 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1622,6 +1622,8 @@ void put_page(struct page_info *page)
 
     if ( unlikely((nx & PGC_count_mask) == 0) )
     {
+        if ( unlikely(nx & PGC_static) )
+            free_domstatic_page(page);
         free_domheap_page(page);
     }
 }
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ed56379b96..9a80ca10fa 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -151,10 +151,6 @@
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
 
-#ifndef PGC_static
-#define PGC_static 0
-#endif
-
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
@@ -2636,12 +2632,14 @@ struct domain *get_pg_owner(domid_t domid)
 
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
@@ -2652,9 +2650,48 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             scrub_one_page(pg);
         }
 
-        /* In case initializing page of static memory, mark it PGC_static. */
         pg[i].count_info |= PGC_static;
     }
+
+    spin_unlock(&heap_lock);
+}
+
+void free_domstatic_page(struct page_info *page)
+{
+    struct domain *d = page_get_owner(page);
+    bool drop_dom_ref, need_scrub;
+
+    ASSERT_ALLOC_CONTEXT();
+
+    if ( likely(d) )
+    {
+        /* NB. May recursively lock from relinquish_memory(). */
+        spin_lock_recursive(&d->page_alloc_lock);
+
+        arch_free_heap_page(d, page);
+
+        /*
+         * Normally we expect a domain to clear pages before freeing them,
+         * if it cares about the secrecy of their contents. However, after
+         * a domain has died we assume responsibility for erasure. We do
+         * scrub regardless if option scrub_domheap is set.
+         */
+        need_scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
+
+        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+
+        spin_unlock_recursive(&d->page_alloc_lock);
+    }
+    else
+    {
+        drop_dom_ref = false;
+        need_scrub = true;
+    }
+
+    free_staticmem_pages(page, 1, need_scrub);
+
+    if ( drop_dom_ref )
+        put_domain(d);
 }
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3be754da92..f1a7d5c991 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,13 +85,12 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
-#ifdef CONFIG_STATIC_MEMORY
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
+void free_domstatic_page(struct page_info *page);
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
-#endif
 
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
@@ -212,6 +211,10 @@ extern struct domain *dom_cow;
 
 #include <asm/mm.h>
 
+#ifndef PGC_static
+#define PGC_static 0
+#endif
+
 static inline bool is_special_page(const struct page_info *page)
 {
     return is_xen_heap_page(page) || (page->count_info & PGC_extra);
-- 
2.25.1



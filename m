Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8557B087
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 07:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371333.603203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE2Xg-00077m-MQ; Wed, 20 Jul 2022 05:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371333.603203; Wed, 20 Jul 2022 05:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE2Xg-00074o-It; Wed, 20 Jul 2022 05:46:40 +0000
Received: by outflank-mailman (input) for mailman id 371333;
 Wed, 20 Jul 2022 05:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n6ZH=XZ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oE2Xe-0006VQ-Pv
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 05:46:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5215e53d-07ef-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 07:46:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80F401042;
 Tue, 19 Jul 2022 22:46:37 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6268A3F70D;
 Tue, 19 Jul 2022 22:46:33 -0700 (PDT)
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
X-Inumbo-ID: 5215e53d-07ef-11ed-924f-1f966e50362f
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
Subject: [PATCH v9 2/8] xen: do not free reserved memory into heap
Date: Wed, 20 Jul 2022 13:46:05 +0800
Message-Id: <20220720054611.2695787-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720054611.2695787-1-Penny.Zheng@arm.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
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
v9 changes:
- move free_domheap_page into else-condition
- considering scrubbing static pages, domain dying case and opt_scrub_domheap
both donot apply to static pages.
- as unowned static pages don't make themselves to free_domstatic_page
at the moment, remove else-condition and add ASSERT(d) at the top of the
function
---
v8 changes:
- introduce new helper free_domstatic_page
- let put_page call free_domstatic_page for static page, when last ref
drops
- #define PGC_static zero when !CONFIG_STATIC_MEMORY, as it is used
outside page_alloc.c
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
 xen/arch/arm/include/asm/mm.h |  4 +++-
 xen/arch/arm/mm.c             |  5 ++++-
 xen/common/page_alloc.c       | 37 ++++++++++++++++++++++++++++-------
 xen/include/xen/mm.h          |  7 +++++--
 4 files changed, 42 insertions(+), 11 deletions(-)

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
index 009b8cd9ef..9132fb9472 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1622,7 +1622,10 @@ void put_page(struct page_info *page)
 
     if ( unlikely((nx & PGC_count_mask) == 0) )
     {
-        free_domheap_page(page);
+        if ( unlikely(nx & PGC_static) )
+            free_domstatic_page(page);
+        else
+            free_domheap_page(page);
     }
 }
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ed56379b96..a12622e921 100644
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
@@ -2652,9 +2650,34 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
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
+    bool drop_dom_ref;
+
+    ASSERT(d);
+
+    ASSERT_ALLOC_CONTEXT();
+
+    /* NB. May recursively lock from relinquish_memory(). */
+    spin_lock_recursive(&d->page_alloc_lock);
+
+    arch_free_heap_page(d, page);
+
+    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+
+    spin_unlock_recursive(&d->page_alloc_lock);
+
+    free_staticmem_pages(page, 1, scrub_debug);
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



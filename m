Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462655AE146
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399535.640746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTBN-0007Zz-Dw; Tue, 06 Sep 2022 07:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399535.640746; Tue, 06 Sep 2022 07:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTBN-0007XO-B2; Tue, 06 Sep 2022 07:39:41 +0000
Received: by outflank-mailman (input) for mailman id 399535;
 Tue, 06 Sep 2022 07:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVTBM-0007HG-1k
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:39:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0fdbd0cc-2db7-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 09:39:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A66D176A;
 Tue,  6 Sep 2022 00:39:44 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDA833F73D;
 Tue,  6 Sep 2022 00:40:02 -0700 (PDT)
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
X-Inumbo-ID: 0fdbd0cc-2db7-11ed-a016-b9edf5238543
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
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 1/6] xen: do not free reserved memory into heap
Date: Tue,  6 Sep 2022 15:39:14 +0800
Message-Id: <20220906073919.941934-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906073919.941934-1-Penny.Zheng@arm.com>
References: <20220906073919.941934-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pages used as guest RAM for static domain, shall be reserved to this
domain only.
So in case reserved pages being used for other purpose, users
shall not free them back to heap, even when last ref gets dropped.

This commit introduces a new helper free_domstatic_page to free
static page in runtime, and free_staticmem_pages will be called by it
in runtime, so let's drop the __init flag.

Wrapper #ifdef CONFIG_STATIC_MEMORY around function declaration(
free_staticmem_pages, free_domstatic_page, etc) is kinds of redundant,
so we decide to remove it here.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v12 changes:
- no change
---
v11 changes:
- printing message ahead of the assertion, which should also be
XENLOG_G_* kind of log level
---
v10 changes:
- let Arm keep #define PGC_static 0 private, with the generic fallback
remaining in page_alloc.c
- change ASSERT(d) to ASSERT_UNREACHABLE() to be more robust looking
forward, and also add a printk() to log the problem
- mention the the removal of #ifdef CONFIG_STATIC_MEMORY in commit
message
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
 xen/arch/arm/include/asm/mm.h |  6 +++++-
 xen/arch/arm/mm.c             |  5 ++++-
 xen/common/page_alloc.c       | 40 ++++++++++++++++++++++++++++++++---
 xen/include/xen/mm.h          |  3 +--
 4 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index da25251cda..749fbefa0c 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -121,9 +121,13 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
-  /* Page is static memory */
+#ifdef CONFIG_STATIC_MEMORY
+/* Page is static memory */
 #define _PGC_static    PG_shift(3)
 #define PGC_static     PG_mask(1, 3)
+#else
+#define PGC_static     0
+#endif
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c81c706c8b..7f5b317d3e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1496,7 +1496,10 @@ void put_page(struct page_info *page)
 
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
index bfd4150be7..0c50dee4c5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2694,12 +2694,14 @@ struct domain *get_pg_owner(domid_t domid)
 
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
@@ -2710,9 +2712,41 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
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
+    if ( unlikely(!d) )
+    {
+        printk(XENLOG_G_ERR
+               "The about-to-free static page %"PRI_mfn" must be owned by a domain\n",
+               mfn_x(page_to_mfn(page)));
+        ASSERT_UNREACHABLE();
+        return;
+    }
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
index 35b065146f..deadf4b2a1 100644
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
-- 
2.25.1



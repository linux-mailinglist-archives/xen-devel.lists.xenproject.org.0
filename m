Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF90594EC7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 04:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387881.624378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmUN-0003nb-MM; Tue, 16 Aug 2022 02:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387881.624378; Tue, 16 Aug 2022 02:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmUN-0003ks-J3; Tue, 16 Aug 2022 02:39:31 +0000
Received: by outflank-mailman (input) for mailman id 387881;
 Tue, 16 Aug 2022 02:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdlV=YU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oNmSi-0007FY-9L
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 02:37:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 69bc66e1-1d0c-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 04:37:47 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767A0106F;
 Mon, 15 Aug 2022 19:37:47 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A7B33F70D;
 Mon, 15 Aug 2022 19:37:43 -0700 (PDT)
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
X-Inumbo-ID: 69bc66e1-1d0c-11ed-924f-1f966e50362f
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
Subject: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Date: Tue, 16 Aug 2022 10:36:57 +0800
Message-Id: <20220816023658.3551936-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816023658.3551936-1-Penny.Zheng@arm.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a static domain populates memory through populate_physmap at runtime,
it shall retrieve reserved pages from resv_page_list to make sure that
guest RAM is still restricted in statically configured memory regions.
This commit also introduces a new helper acquire_reserved_page to make it work.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v10 changes:
- add lock on the fail path
---
v9 changes:
- Use ASSERT_ALLOC_CONTEXT() in acquire_reserved_page
- Add free_staticmem_pages to undo prepare_staticmem_pages when
assign_domstatic_pages
- Remove redundant static in error message
---
v8 changes:
- As concurrent free/allocate could modify the resv_page_list, we still
need the lock
---
v7 changes:
- remove the lock, since we add the page to rsv_page_list after it has
been totally freed.
---
v6 changes:
- drop the lock before returning
---
v5 changes:
- extract common codes for assigning pages into a helper assign_domstatic_pages
- refine commit message
- remove stub function acquire_reserved_page
- Alloc/free of memory can happen concurrently. So access to rsv_page_list
needs to be protected with a spinlock
---
v4 changes：
- miss dropping __init in acquire_domstatic_pages
- add the page back to the reserved list in case of error
- remove redundant printk
- refine log message and make it warn level
---
v3 changes:
- move is_domain_using_staticmem to the common header file
- remove #ifdef CONFIG_STATIC_MEMORY-ary
- remove meaningless page_to_mfn(page) in error log
---
v2 changes:
- introduce acquire_reserved_page to retrieve reserved pages from
resv_page_list
- forbid non-zero-order requests in populate_physmap
- let is_domain_static return ((void)(d), false) on x86
---
 xen/common/memory.c     | 23 +++++++++++++
 xen/common/page_alloc.c | 76 ++++++++++++++++++++++++++++++++---------
 xen/include/xen/mm.h    |  1 +
 3 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index bc89442ba5..ae8163a738 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
 
                 mfn = _mfn(gpfn);
             }
+            else if ( is_domain_using_staticmem(d) )
+            {
+                /*
+                 * No easy way to guarantee the retrieved pages are contiguous,
+                 * so forbid non-zero-order requests here.
+                 */
+                if ( a->extent_order != 0 )
+                {
+                    gdprintk(XENLOG_WARNING,
+                             "Cannot allocate static order-%u pages for %pd\n",
+                             a->extent_order, d);
+                    goto out;
+                }
+
+                mfn = acquire_reserved_page(d, a->memflags);
+                if ( mfn_eq(mfn, INVALID_MFN) )
+                {
+                    gdprintk(XENLOG_WARNING,
+                             "%pd: failed to retrieve a reserved page\n",
+                             d);
+                    goto out;
+                }
+            }
             else
             {
                 page = alloc_domheap_pages(d, a->extent_order, a->memflags);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 0ee697705c..9c6d369d10 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2751,9 +2751,8 @@ void free_domstatic_page(struct page_info *page)
         put_domain(d);
 }
 
-static bool __init prepare_staticmem_pages(struct page_info *pg,
-                                           unsigned long nr_mfns,
-                                           unsigned int memflags)
+static bool prepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                                    unsigned int memflags)
 {
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
@@ -2834,21 +2833,9 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
     return pg;
 }
 
-/*
- * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
- * then assign them to one specific domain #d.
- */
-int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
-                                   unsigned int nr_mfns, unsigned int memflags)
+static int assign_domstatic_pages(struct domain *d, struct page_info *pg,
+                                  unsigned int nr_mfns, unsigned int memflags)
 {
-    struct page_info *pg;
-
-    ASSERT_ALLOC_CONTEXT();
-
-    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
-    if ( !pg )
-        return -ENOENT;
-
     if ( !d || (memflags & (MEMF_no_owner | MEMF_no_refcount)) )
     {
         /*
@@ -2867,6 +2854,61 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 
     return 0;
 }
+
+/*
+ * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
+ * then assign them to one specific domain #d.
+ */
+int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
+                                   unsigned int nr_mfns, unsigned int memflags)
+{
+    struct page_info *pg;
+
+    ASSERT_ALLOC_CONTEXT();
+
+    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
+    if ( !pg )
+        return -ENOENT;
+
+    if ( assign_domstatic_pages(d, pg, nr_mfns, memflags) )
+        return -EINVAL;
+
+    return 0;
+}
+
+/*
+ * Acquire a page from reserved page list(resv_page_list), when populating
+ * memory for static domain on runtime.
+ */
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
+{
+    struct page_info *page;
+
+    ASSERT_ALLOC_CONTEXT();
+
+    /* Acquire a page from reserved page list(resv_page_list). */
+    spin_lock(&d->page_alloc_lock);
+    page = page_list_remove_head(&d->resv_page_list);
+    spin_unlock(&d->page_alloc_lock);
+    if ( unlikely(!page) )
+        return INVALID_MFN;
+
+    if ( !prepare_staticmem_pages(page, 1, memflags) )
+        goto fail;
+
+    if ( assign_domstatic_pages(d, page, 1, memflags) )
+        goto fail_assign;
+
+    return page_to_mfn(page);
+
+ fail_assign:
+    free_staticmem_pages(page, 1, memflags & MEMF_no_scrub);
+ fail:
+    spin_lock(&d->page_alloc_lock);
+    page_list_add_tail(page, &d->resv_page_list);
+    spin_unlock(&d->page_alloc_lock);
+    return INVALID_MFN;
+}
 #endif
 
 /*
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index deadf4b2a1..5d29aea7ad 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -198,6 +198,7 @@ struct npfec {
 #else
 #define MAX_ORDER 20 /* 2^20 contiguous pages */
 #endif
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Private domain structs for DOMID_XEN, DOMID_IO, etc. */
 extern struct domain *dom_xen, *dom_io;
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8B520B4B
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 04:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325121.547596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFfN-0007du-Ae; Tue, 10 May 2022 02:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325121.547596; Tue, 10 May 2022 02:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFfN-0007bI-59; Tue, 10 May 2022 02:32:01 +0000
Received: by outflank-mailman (input) for mailman id 325121;
 Tue, 10 May 2022 02:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0KWj=VS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1noFbq-0003Ap-Kt
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 02:28:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id dba07557-d008-11ec-a406-831a346695d4;
 Tue, 10 May 2022 04:28:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2738012FC;
 Mon,  9 May 2022 19:28:20 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2C0E3F66F;
 Mon,  9 May 2022 19:28:16 -0700 (PDT)
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
X-Inumbo-ID: dba07557-d008-11ec-a406-831a346695d4
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
Subject: [PATCH v4 6/6] xen: retrieve reserved pages on populate_physmap
Date: Tue, 10 May 2022 10:27:33 +0800
Message-Id: <20220510022733.2422581-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510022733.2422581-1-Penny.Zheng@arm.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When static domain populates memory through populate_physmap on runtime,
other than allocating from heap, it shall retrieve reserved pages from
resv_page_list to make sure that guest RAM is still restricted in statically
configured memory regions. And this commit introduces a new helper
acquire_reserved_page to make it work.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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
 xen/common/memory.c      | 23 +++++++++++++++++++++++
 xen/common/page_alloc.c  | 35 +++++++++++++++++++++++++++++++++--
 xen/include/xen/domain.h |  4 ++++
 xen/include/xen/mm.h     |  1 +
 4 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index f2d009843a..cb330ce877 100644
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
+                             "Cannot allocate static order-%u pages for static %pd\n",
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
index 290526adaf..06e7037a28 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2740,8 +2740,8 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
  * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
  * then assign them to one specific domain #d.
  */
-int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
-                                   unsigned int nr_mfns, unsigned int memflags)
+int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
+                            unsigned int memflags)
 {
     struct page_info *pg;
 
@@ -2769,12 +2769,43 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
 
     return 0;
 }
+
+/*
+ * Acquire a page from reserved page list(resv_page_list), when populating
+ * memory for static domain on runtime.
+ */
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
+{
+    struct page_info *page;
+    mfn_t smfn;
+
+    /* Acquire a page from reserved page list(resv_page_list). */
+    page = page_list_remove_head(&d->resv_page_list);
+    if ( unlikely(!page) )
+        return INVALID_MFN;
+
+    smfn = page_to_mfn(page);
+
+    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )
+    {
+        page_list_add_tail(page, &d->resv_page_list);
+        return INVALID_MFN;
+    }
+
+    return smfn;
+}
 #else
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub)
 {
     ASSERT_UNREACHABLE();
 }
+
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
+{
+    ASSERT_UNREACHABLE();
+    return INVALID_MFN;
+}
 #endif
 
 /*
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 35dc7143a4..c613afa57e 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -38,6 +38,10 @@ void arch_get_domain_info(const struct domain *d,
 #define CDF_staticmem            (1U << 2)
 #endif
 
+#ifndef is_domain_using_staticmem
+#define is_domain_using_staticmem(d) ((void)(d), false)
+#endif
+
 /*
  * Arch-specifics.
  */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 9fd95deaec..74810e1f54 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -92,6 +92,7 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
 #endif
+mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
-- 
2.25.1



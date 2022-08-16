Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A1594EBE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 04:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387861.624356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmSo-0002Bc-4g; Tue, 16 Aug 2022 02:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387861.624356; Tue, 16 Aug 2022 02:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmSo-00028U-1u; Tue, 16 Aug 2022 02:37:54 +0000
Received: by outflank-mailman (input) for mailman id 387861;
 Tue, 16 Aug 2022 02:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdlV=YU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oNmSm-0008P8-Ej
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 02:37:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6c45e917-1d0c-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 04:37:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9630C106F;
 Mon, 15 Aug 2022 19:37:51 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CE423F70D;
 Mon, 15 Aug 2022 19:37:46 -0700 (PDT)
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
X-Inumbo-ID: 6c45e917-1d0c-11ed-bd2e-47488cf2e6aa
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
Subject: [PATCH v10 9/9] xen: rename free_staticmem_pages to unprepare_staticmem_pages
Date: Tue, 16 Aug 2022 10:36:58 +0800
Message-Id: <20220816023658.3551936-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816023658.3551936-1-Penny.Zheng@arm.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name of free_staticmem_pages is inappropriate, considering it is
the opposite of function prepare_staticmem_pages.

Rename free_staticmem_pages to unprepare_staticmem_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v10 changes:
- new commit
---
 xen/arch/arm/setup.c    |  3 ++-
 xen/common/page_alloc.c | 15 +++++++++------
 xen/include/xen/mm.h    |  4 ++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 500307edc0..4662997c7e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -639,7 +639,8 @@ static void __init init_staticmem_pages(void)
             if ( mfn_x(bank_end) <= mfn_x(bank_start) )
                 return;
 
-            free_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
+            unprepare_staticmem_pages(mfn_to_page(bank_start),
+                                      bank_pages, false);
         }
     }
 #endif
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 9c6d369d10..7306d69129 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2693,9 +2693,12 @@ struct domain *get_pg_owner(domid_t domid)
 }
 
 #ifdef CONFIG_STATIC_MEMORY
-/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
-void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
-                          bool need_scrub)
+/*
+ * It is the opposite of prepare_staticmem_pages, and it aims to unprepare
+ * nr_mfns pages of static memory.
+ */
+void unprepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                               bool need_scrub)
 {
     mfn_t mfn = page_to_mfn(pg);
     unsigned long i;
@@ -2740,7 +2743,7 @@ void free_domstatic_page(struct page_info *page)
 
     drop_dom_ref = !domain_adjust_tot_pages(d, -1);
 
-    free_staticmem_pages(page, 1, scrub_debug);
+    unprepare_staticmem_pages(page, 1, scrub_debug);
 
     /* Add page on the resv_page_list *after* it has been freed. */
     page_list_add_tail(page, &d->resv_page_list);
@@ -2848,7 +2851,7 @@ static int assign_domstatic_pages(struct domain *d, struct page_info *pg,
 
     if ( assign_pages(pg, nr_mfns, d, memflags) )
     {
-        free_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
+        unprepare_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
         return -EINVAL;
     }
 
@@ -2902,7 +2905,7 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
     return page_to_mfn(page);
 
  fail_assign:
-    free_staticmem_pages(page, 1, memflags & MEMF_no_scrub);
+    unprepare_staticmem_pages(page, 1, memflags & MEMF_no_scrub);
  fail:
     spin_lock(&d->page_alloc_lock);
     page_list_add_tail(page, &d->resv_page_list);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5d29aea7ad..a925028ab3 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -86,8 +86,8 @@ bool scrub_free_pages(void);
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
 /* These functions are for static memory */
-void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
-                          bool need_scrub);
+void unprepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                               bool need_scrub);
 void free_domstatic_page(struct page_info *page);
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
-- 
2.25.1



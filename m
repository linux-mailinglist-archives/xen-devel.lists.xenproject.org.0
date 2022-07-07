Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29189569E87
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 11:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362816.593096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NjS-0005iV-H9; Thu, 07 Jul 2022 09:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362816.593096; Thu, 07 Jul 2022 09:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9NjS-0005bq-Br; Thu, 07 Jul 2022 09:23:34 +0000
Received: by outflank-mailman (input) for mailman id 362816;
 Thu, 07 Jul 2022 09:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTeC=XM=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o9NjQ-0002ms-Jv
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 09:23:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7799a294-fdd6-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 11:23:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515631063;
 Thu,  7 Jul 2022 02:23:31 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9AD033F792;
 Thu,  7 Jul 2022 02:23:27 -0700 (PDT)
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
X-Inumbo-ID: 7799a294-fdd6-11ec-bd2d-47488cf2e6aa
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
Subject: [PATCH v8 7/9] xen/arm: unpopulate memory when domain is static
Date: Thu,  7 Jul 2022 17:22:42 +0800
Message-Id: <20220707092244.485936-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707092244.485936-1-Penny.Zheng@arm.com>
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today when a domain unpopulates the memory on runtime, they will always
hand the memory back to the heap allocator. And it will be a problem if domain
is static.

Pages as guest RAM for static domain shall be reserved to only this domain
and not be used for any other purposes, so they shall never go back to heap
allocator.

This commit puts reserved pages on the new list resv_page_list only after
having taken them off the "normal" list, when the last ref dropped.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v8 changes:
- adapt this patch for newly introduced free_domstatic_page
- order as a parameter is not needed here, as all staticmem operations are
limited to order-0 regions
- move d->page_alloc_lock after operation on d->resv_page_list
---
v7 changes:
- Add page on the rsv_page_list *after* it has been freed
---
v6 changes:
- refine in-code comment
- move PGC_static !CONFIG_STATIC_MEMORY definition to common header
---
v5 changes:
- adapt this patch for PGC_staticmem
---
v4 changes:
- no changes
---
v3 changes:
- have page_list_del() just once out of the if()
- remove resv_pages counter
- make arch_free_heap_page be an expression, not a compound statement.
---
v2 changes:
- put reserved pages on resv_page_list after having taken them off
the "normal" list
---
 xen/common/domain.c     |  4 ++++
 xen/common/page_alloc.c | 10 ++++++++--
 xen/include/xen/mm.h    |  6 ++++++
 xen/include/xen/sched.h |  3 +++
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 875730df50..4043498ffa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -604,6 +604,10 @@ struct domain *domain_create(domid_t domid,
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
     INIT_PAGE_LIST_HEAD(&d->xenpage_list);
+#ifdef CONFIG_STATIC_MEMORY
+    INIT_PAGE_LIST_HEAD(&d->resv_page_list);
+#endif
+
 
     spin_lock_init(&d->node_affinity_lock);
     d->node_affinity = NODE_MASK_ALL;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3260490688..b01272a59a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2681,8 +2681,6 @@ void free_domstatic_page(struct page_info *page)
         need_scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
 
         drop_dom_ref = !domain_adjust_tot_pages(d, -1);
-
-        spin_unlock_recursive(&d->page_alloc_lock);
     }
     else
     {
@@ -2692,6 +2690,14 @@ void free_domstatic_page(struct page_info *page)
 
     free_staticmem_pages(page, 1, need_scrub);
 
+    if ( likely(d) )
+    {
+        /* Add page on the resv_page_list *after* it has been freed. */
+        if ( !drop_dom_ref )
+            put_static_page(d, page);
+        spin_unlock_recursive(&d->page_alloc_lock);
+    }
+
     if ( drop_dom_ref )
         put_domain(d);
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index f1a7d5c991..07b8a45f1a 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -91,6 +91,12 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
 void free_domstatic_page(struct page_info *page);
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
+#ifdef CONFIG_STATIC_MEMORY
+#define put_static_page(d, page) \
+    page_list_add_tail((page), &(d)->resv_page_list)
+#else
+#define put_static_page(d, page) ((void)(d), (void)(page))
+#endif
 
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 98e8001c89..d4fbd3dea7 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -381,6 +381,9 @@ struct domain
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
+#ifdef CONFIG_STATIC_MEMORY
+    struct page_list_head resv_page_list; /* linked list */
+#endif
 
     /*
      * This field should only be directly accessed by domain_adjust_tot_pages()
-- 
2.25.1



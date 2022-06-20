Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877F550EA6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 04:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352203.578981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37PX-000712-TU; Mon, 20 Jun 2022 02:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352203.578981; Mon, 20 Jun 2022 02:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37PX-0006x6-N4; Mon, 20 Jun 2022 02:45:07 +0000
Received: by outflank-mailman (input) for mailman id 352203;
 Mon, 20 Jun 2022 02:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o37PV-0005AM-Hb
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 02:45:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fcc3436e-f042-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 04:45:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D260E1042;
 Sun, 19 Jun 2022 19:45:03 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C4F13F7D7;
 Sun, 19 Jun 2022 19:45:00 -0700 (PDT)
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
X-Inumbo-ID: fcc3436e-f042-11ec-b725-ed86ccbb4733
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
Subject: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Date: Mon, 20 Jun 2022 10:44:06 +0800
Message-Id: <20220620024408.203797-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620024408.203797-1-Penny.Zheng@arm.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
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
 xen/common/domain.c     | 4 ++++
 xen/common/page_alloc.c | 4 ++++
 xen/include/xen/mm.h    | 9 +++++++++
 xen/include/xen/sched.h | 3 +++
 4 files changed, 20 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index a3ef991bd1..a49574fa24 100644
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
index d9253df270..7d223087c0 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2498,6 +2498,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
         }
 
         free_heap_pages(pg, order, scrub);
+
+        /* Add page on the resv_page_list *after* it has been freed. */
+        if ( unlikely(pg->count_info & PGC_static) )
+            put_static_pages(d, pg, order);
     }
 
     if ( drop_dom_ref )
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 1c4ddb336b..68a647ceae 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -90,6 +90,15 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
 int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
                             unsigned int memflags);
+#ifdef CONFIG_STATIC_MEMORY
+#define put_static_pages(d, page, order) ({                 \
+    unsigned int i;                                         \
+    for ( i = 0; i < (1 << (order)); i++ )                  \
+        page_list_add_tail((pg) + i, &(d)->resv_page_list); \
+})
+#else
+#define put_static_pages(d, page, order) ((void)(d), (void)(page), (void)(order))
+#endif
 
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5191853c18..bd2782b3c5 100644
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



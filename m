Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94272594EBA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 04:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387845.624345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmSc-00019p-Tb; Tue, 16 Aug 2022 02:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387845.624345; Tue, 16 Aug 2022 02:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNmSc-00014Z-Ox; Tue, 16 Aug 2022 02:37:42 +0000
Received: by outflank-mailman (input) for mailman id 387845;
 Tue, 16 Aug 2022 02:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdlV=YU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oNmSa-0007FY-R0
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 02:37:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6555659d-1d0c-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 04:37:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01C66113E;
 Mon, 15 Aug 2022 19:37:40 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 140743F70D;
 Mon, 15 Aug 2022 19:37:35 -0700 (PDT)
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
X-Inumbo-ID: 6555659d-1d0c-11ed-924f-1f966e50362f
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
Subject: [PATCH v10 6/9] xen: unpopulate memory when domain is static
Date: Tue, 16 Aug 2022 10:36:55 +0800
Message-Id: <20220816023658.3551936-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816023658.3551936-1-Penny.Zheng@arm.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
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
v10 change:
- Do not skip the list addition in that one special case
---
v9 change:
- remove macro helper put_static_page, and just expand its code inside
free_domstatic_page
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
 xen/common/domain.c     | 4 ++++
 xen/common/page_alloc.c | 7 +++++--
 xen/include/xen/sched.h | 3 +++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7062393e37..c23f449451 100644
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
index 1be7f671dc..25521af600 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2740,10 +2740,13 @@ void free_domstatic_page(struct page_info *page)
 
     drop_dom_ref = !domain_adjust_tot_pages(d, -1);
 
-    spin_unlock_recursive(&d->page_alloc_lock);
-
     free_staticmem_pages(page, 1, scrub_debug);
 
+    /* Add page on the resv_page_list *after* it has been freed. */
+    page_list_add_tail(page, &d->resv_page_list);
+
+    spin_unlock_recursive(&d->page_alloc_lock);
+
     if ( drop_dom_ref )
         put_domain(d);
 }
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1cf629e7ec..956e0f9dca 100644
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



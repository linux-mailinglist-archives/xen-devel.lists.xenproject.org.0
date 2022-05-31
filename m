Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148EA538A23
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 05:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339012.563873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvsL1-0007WH-64; Tue, 31 May 2022 03:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339012.563873; Tue, 31 May 2022 03:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvsL1-0007Ty-2X; Tue, 31 May 2022 03:14:31 +0000
Received: by outflank-mailman (input) for mailman id 339012;
 Tue, 31 May 2022 03:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Brif=WH=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nvsKz-0007C8-P3
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 03:14:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id aef75da2-e08f-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 05:13:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D017923A;
 Mon, 30 May 2022 20:13:45 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C2063F66F;
 Mon, 30 May 2022 20:13:41 -0700 (PDT)
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
X-Inumbo-ID: aef75da2-e08f-11ec-bd2c-47488cf2e6aa
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
Subject: [PATCH v5 7/9] xen/arm: unpopulate memory when domain is static
Date: Tue, 31 May 2022 11:12:39 +0800
Message-Id: <20220531031241.90374-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531031241.90374-1-Penny.Zheng@arm.com>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
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
 xen/arch/arm/include/asm/mm.h | 12 ++++++++++++
 xen/common/domain.c           |  4 ++++
 xen/include/xen/sched.h       |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 56d0939318..ca384a3939 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -360,6 +360,18 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+/*
+ * Put free pages on the resv page list after having taken them
+ * off the "normal" page list, when pages from static memory
+ */
+#ifdef CONFIG_STATIC_MEMORY
+#define arch_free_heap_page(d, pg) ({                   \
+    page_list_del(pg, page_to_list(d, pg));             \
+    if ( (pg)->count_info & PGC_staticmem )              \
+        page_list_add_tail(pg, &(d)->resv_page_list);   \
+})
+#endif
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
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
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5191853c18..3e22c77333 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -381,6 +381,9 @@ struct domain
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
+#ifdef CONFIG_STATIC_MEMORY
+    struct page_list_head resv_page_list; /* linked list (size resv_pages) */
+#endif
 
     /*
      * This field should only be directly accessed by domain_adjust_tot_pages()
-- 
2.25.1



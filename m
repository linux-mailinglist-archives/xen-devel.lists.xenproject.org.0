Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB66804C0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 05:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486500.753860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLRB-000668-4U; Mon, 30 Jan 2023 04:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486500.753860; Mon, 30 Jan 2023 04:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMLRB-00062W-0n; Mon, 30 Jan 2023 04:06:33 +0000
Received: by outflank-mailman (input) for mailman id 486500;
 Mon, 30 Jan 2023 04:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JFid=53=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pMLR9-0003sz-GQ
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 04:06:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 79a542c7-a053-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 05:06:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEE611FB;
 Sun, 29 Jan 2023 20:07:11 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6C793F64C;
 Sun, 29 Jan 2023 20:06:26 -0800 (PST)
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
X-Inumbo-ID: 79a542c7-a053-11ed-9ec0-891035b88211
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 1/4] xen/arm: Reduce redundant clear root pages when teardown p2m
Date: Mon, 30 Jan 2023 12:06:11 +0800
Message-Id: <20230130040614.188296-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130040614.188296-1-Henry.Wang@arm.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, p2m for a domain will be teardown from two paths:
(1) The normal path when a domain is destroyed.
(2) The arch_domain_destroy() in the failure path of domain creation.

When tearing down p2m from (1), the part to clear and clean the root
is only needed to do once rather than for every call of p2m_teardown().
If the p2m teardown is from (2), the clear and clean of the root
is unnecessary because the domain is not scheduled.

Therefore, this patch introduces a helper `p2m_clear_root_pages()` to
do the clear and clean of the root, and move this logic outside of
p2m_teardown(). With this movement, the `page_list_empty(&p2m->pages)`
check can be dropped.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v1 -> v2:
1. Move in-code comment for p2m_force_tlb_flush_sync() on top of
   p2m_clear_root_pages().
2. Add Reviewed-by tag from Michal and Acked-by tag from Julien.
---
 xen/arch/arm/domain.c          |  8 +++++++
 xen/arch/arm/include/asm/p2m.h |  1 +
 xen/arch/arm/p2m.c             | 40 +++++++++++++++++-----------------
 3 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 99577adb6c..b8a4a60570 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -959,6 +959,7 @@ enum {
     PROG_xen,
     PROG_page,
     PROG_mapping,
+    PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
     PROG_done,
@@ -1021,6 +1022,13 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
 
+    PROGRESS(p2m_root):
+        /*
+         * We are about to free the intermediate page-tables, so clear the
+         * root to prevent any walk to use them.
+         */
+        p2m_clear_root_pages(&d->arch.p2m);
+
     PROGRESS(p2m):
         ret = p2m_teardown(d, true);
         if ( ret )
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 91df922e1c..bf5183e53a 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -281,6 +281,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
 
 bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn);
 
+void p2m_clear_root_pages(struct p2m_domain *p2m);
 void p2m_invalidate_root(struct p2m_domain *p2m);
 
 /*
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..f1ccd7efbd 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1314,6 +1314,26 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
     p2m->need_flush = true;
 }
 
+/*
+ * The domain will not be scheduled anymore, so in theory we should
+ * not need to flush the TLBs. Do it for safety purpose.
+ * Note that all the devices have already been de-assigned. So we don't
+ * need to flush the IOMMU TLB here.
+ */
+void p2m_clear_root_pages(struct p2m_domain *p2m)
+{
+    unsigned int i;
+
+    p2m_write_lock(p2m);
+
+    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
+        clear_and_clean_page(p2m->root + i);
+
+    p2m_force_tlb_flush_sync(p2m);
+
+    p2m_write_unlock(p2m);
+}
+
 /*
  * Invalidate all entries in the root page-tables. This is
  * useful to get fault on entry and do an action.
@@ -1698,30 +1718,10 @@ int p2m_teardown(struct domain *d, bool allow_preemption)
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     unsigned long count = 0;
     struct page_info *pg;
-    unsigned int i;
     int rc = 0;
 
-    if ( page_list_empty(&p2m->pages) )
-        return 0;
-
     p2m_write_lock(p2m);
 
-    /*
-     * We are about to free the intermediate page-tables, so clear the
-     * root to prevent any walk to use them.
-     */
-    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
-        clear_and_clean_page(p2m->root + i);
-
-    /*
-     * The domain will not be scheduled anymore, so in theory we should
-     * not need to flush the TLBs. Do it for safety purpose.
-     *
-     * Note that all the devices have already been de-assigned. So we don't
-     * need to flush the IOMMU TLB here.
-     */
-    p2m_force_tlb_flush_sync(p2m);
-
     while ( (pg = page_list_remove_head(&p2m->pages)) )
     {
         p2m_free_page(p2m->domain, pg);
-- 
2.25.1



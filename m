Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B428339C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2950.8476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7a-0000sZ-84; Mon, 05 Oct 2020 09:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2950.8476; Mon, 05 Oct 2020 09:49:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7a-0000rh-3C; Mon, 05 Oct 2020 09:49:30 +0000
Received: by outflank-mailman (input) for mailman id 2950;
 Mon, 05 Oct 2020 09:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPN7Y-0000a7-9c
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccbdfe1a-3095-42d9-b8c2-8552cdbb2387;
 Mon, 05 Oct 2020 09:49:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7K-00018v-Ha; Mon, 05 Oct 2020 09:49:14 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7K-0007gW-92; Mon, 05 Oct 2020 09:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPN7Y-0000a7-9c
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:28 +0000
X-Inumbo-ID: ccbdfe1a-3095-42d9-b8c2-8552cdbb2387
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ccbdfe1a-3095-42d9-b8c2-8552cdbb2387;
	Mon, 05 Oct 2020 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=786CYGhqhj0G7twgI0F8WxticlI/nilf3doZC+/fM1I=; b=zeEgrm+xJUjmFaVxTi0jW2I0O7
	rxetauyJtbYfDQWFYKaA+/TGZmY4aSvvCVKV91LiD42COv9zL3Ithov3ykjT/LZitIF8OSPYbAgt0
	RvkupNDYE7bYXUT34TPwrxMf2Xooec3tcP+wqS0cALKda2CDCeDOX3H6aYIAUV4ieMSE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7K-00018v-Ha; Mon, 05 Oct 2020 09:49:14 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7K-0007gW-92; Mon, 05 Oct 2020 09:49:14 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86 / iommu: create a dedicated pool of page-table pages
Date: Mon,  5 Oct 2020 10:49:05 +0100
Message-Id: <20201005094905.2929-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005094905.2929-1-paul@xen.org>
References: <20201005094905.2929-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch, in a way analogous to HAP page allocation, creates a pool of
pages for use as IOMMU page-tables when the size of that pool is configured
by a call to iommu_set_allocation(). That call occurs when the tool-stack
has calculates the size of the pool and issues the
XEN_DOMCTL_IOMMU_SET_ALLOCATION sub-operation of the XEN_DOMCTL_iommu_ctl
domctl. However, some IOMMU mappings must be set up during domain_create(),
before the tool-stack has had a chance to make its calculation and issue the
domctl. Hence an initial hard-coded pool size of 256 is set for domains
not sharing EPT during the call to arch_iommu_domain_init().

NOTE: No pool is configured for the hardware or quarantine domains. They
      continue to allocate page-table pages on demand.
      The prototype of iommu_free_pgtables() is change to void return as
      it no longer needs to be re-startable.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domain.c               |   4 +-
 xen/drivers/passthrough/x86/iommu.c | 129 ++++++++++++++++++++++++----
 xen/include/asm-x86/iommu.h         |   5 +-
 3 files changed, 116 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7e16d49bfd..101ef4aba5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2304,7 +2304,9 @@ int domain_relinquish_resources(struct domain *d)
 
     PROGRESS(iommu_pagetables):
 
-        ret = iommu_free_pgtables(d);
+        iommu_free_pgtables(d);
+
+        ret = iommu_set_allocation(d, 0);
         if ( ret )
             return ret;
 
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index b168073f10..de0cc52489 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -134,21 +134,106 @@ void __hwdom_init arch_iommu_check_autotranslated_hwdom(struct domain *d)
         panic("PVH hardware domain iommu must be set in 'strict' mode\n");
 }
 
-int iommu_set_allocation(struct domain *d, unsigned nr_pages)
+static int destroy_pgtable(struct domain *d)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+    struct page_info *pg;
+
+    if ( !hd->arch.pgtables.nr )
+    {
+        ASSERT_UNREACHABLE();
+        return -ENOENT;
+    }
+
+    pg = page_list_remove_head(&hd->arch.pgtables.free_list);
+    if ( !pg )
+        return -EBUSY;
+
+    hd->arch.pgtables.nr--;
+    free_domheap_page(pg);
+
     return 0;
 }
 
+static int create_pgtable(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int memflags = 0;
+    struct page_info *pg;
+
+#ifdef CONFIG_NUMA
+    if ( hd->node != NUMA_NO_NODE )
+        memflags = MEMF_node(hd->node);
+#endif
+
+    pg = alloc_domheap_page(NULL, memflags);
+    if ( !pg )
+        return -ENOMEM;
+
+    page_list_add(pg, &hd->arch.pgtables.free_list);
+    hd->arch.pgtables.nr++;
+
+    return 0;
+}
+
+static int set_allocation(struct domain *d, unsigned int nr_pages,
+                          bool allow_preempt)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int done = 0;
+    int rc = 0;
+
+    spin_lock(&hd->arch.pgtables.lock);
+
+    while ( !rc )
+    {
+        if ( hd->arch.pgtables.nr < nr_pages )
+            rc = create_pgtable(d);
+        else if ( hd->arch.pgtables.nr > nr_pages )
+            rc = destroy_pgtable(d);
+        else
+            break;
+
+        if ( allow_preempt && !rc && !(++done & 0xff) &&
+             general_preempt_check() )
+            rc = -ERESTART;
+    }
+
+    spin_unlock(&hd->arch.pgtables.lock);
+
+    return rc;
+}
+
+int iommu_set_allocation(struct domain *d, unsigned int nr_pages)
+{
+    return set_allocation(d, nr_pages, true);
+}
+
+/*
+ * Some IOMMU mappings are set up during domain_create() before the tool-
+ * stack has a chance to calculate and set the appropriate page-table
+ * allocation. A hard-coded initial allocation covers this gap.
+ */
+#define INITIAL_ALLOCATION 256
+
 int arch_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
     spin_lock_init(&hd->arch.mapping_lock);
 
+    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.free_list);
     INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
     spin_lock_init(&hd->arch.pgtables.lock);
 
-    return 0;
+    /*
+     * The hardware and quarantine domains are not subject to a quota
+     * and domains sharing EPT do not require any allocation.
+     */
+    if ( is_hardware_domain(d) || d == dom_io || iommu_use_hap_pt(d) )
+        return 0;
+
+    return set_allocation(d, INITIAL_ALLOCATION, false);
 }
 
 void arch_iommu_domain_destroy(struct domain *d)
@@ -265,38 +350,45 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         return;
 }
 
-int iommu_free_pgtables(struct domain *d)
+void iommu_free_pgtables(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct page_info *pg;
-    unsigned int done = 0;
 
-    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
-    {
-        free_domheap_page(pg);
+    spin_lock(&hd->arch.pgtables.lock);
 
-        if ( !(++done & 0xff) && general_preempt_check() )
-            return -ERESTART;
-    }
+    page_list_splice(&hd->arch.pgtables.list, &hd->arch.pgtables.free_list);
+    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
 
-    return 0;
+    spin_unlock(&hd->arch.pgtables.lock);
 }
 
 struct page_info *iommu_alloc_pgtable(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    unsigned int memflags = 0;
     struct page_info *pg;
     void *p;
 
-#ifdef CONFIG_NUMA
-    if ( hd->node != NUMA_NO_NODE )
-        memflags = MEMF_node(hd->node);
-#endif
+    spin_lock(&hd->arch.pgtables.lock);
 
-    pg = alloc_domheap_page(NULL, memflags);
+ again:
+    pg = page_list_remove_head(&hd->arch.pgtables.free_list);
     if ( !pg )
+    {
+        /*
+         * The hardware and quarantine domains are not subject to a quota
+         * so create page-table pages on demand.
+         */
+        if ( is_hardware_domain(d) || d == dom_io )
+        {
+            int rc = create_pgtable(d);
+
+            if ( !rc )
+                goto again;
+        }
+
+        spin_unlock(&hd->arch.pgtables.lock);
         return NULL;
+    }
 
     p = __map_domain_page(pg);
     clear_page(p);
@@ -306,7 +398,6 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
 
     unmap_domain_page(p);
 
-    spin_lock(&hd->arch.pgtables.lock);
     page_list_add(pg, &hd->arch.pgtables.list);
     spin_unlock(&hd->arch.pgtables.lock);
 
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
index d086f564af..3991b5601b 100644
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -47,7 +47,8 @@ struct arch_iommu
 {
     spinlock_t mapping_lock; /* io page table lock */
     struct {
-        struct page_list_head list;
+        struct page_list_head list, free_list;
+        unsigned int nr;
         spinlock_t lock;
     } pgtables;
 
@@ -135,7 +136,7 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
         iommu_vcall(ops, sync_cache, addr, size);       \
 })
 
-int __must_check iommu_free_pgtables(struct domain *d);
+void iommu_free_pgtables(struct domain *d);
 struct page_info *__must_check iommu_alloc_pgtable(struct domain *d);
 
 int __must_check iommu_set_allocation(struct domain *d, unsigned int nr_pages);
-- 
2.20.1



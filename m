Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C6233469
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 16:29:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k19Yu-0005Q9-As; Thu, 30 Jul 2020 14:29:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k19Ys-0005Pz-C8
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 14:29:34 +0000
X-Inumbo-ID: 16262758-d271-11ea-8d70-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16262758-d271-11ea-8d70-bc764e2007e4;
 Thu, 30 Jul 2020 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FMdbCGgYRHvs+c9rdNXmWW9PuSsgA3ySLWLmONq97uE=; b=YXgHjsRgjIcGDBnMAiGfS30OzY
 8f5bWnb6eFqRjEwfpyjGWcM0SodXLJSVbIetVDv3wy7TZ6o0I0pcRm176ldi1bcytDTH2b9V6x1KL
 1OpNy8YdXK/tdfm1BU8UUJZESH63zU4Soz72xcqawRNi8twhfUxVvaN5s5qU/rMJA0OQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yq-0002O7-Qe; Thu, 30 Jul 2020 14:29:32 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yq-0005aN-Ia; Thu, 30 Jul 2020 14:29:32 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 02/10] x86/iommu: add common page-table allocator
Date: Thu, 30 Jul 2020 15:29:18 +0100
Message-Id: <20200730142926.6051-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730142926.6051-1-paul@xen.org>
References: <20200730142926.6051-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Instead of having separate page table allocation functions in VT-d and AMD
IOMMU code, we could use a common allocation function in the general x86 code.

This patch adds a new allocation function, iommu_alloc_pgtable(), for this
purpose. The function adds the page table pages to a list. The pages in this
list are then freed by iommu_free_pgtables(), which is called by
domain_relinquish_resources() after PCI devices have been de-assigned.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - This is split out from a larger patch of the same name in v1
---
 xen/arch/x86/domain.c               |  9 +++++-
 xen/drivers/passthrough/x86/iommu.c | 50 +++++++++++++++++++++++++++++
 xen/include/asm-x86/iommu.h         |  7 ++++
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index fee6c3931a..2bc49b1db4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2156,7 +2156,8 @@ int domain_relinquish_resources(struct domain *d)
         d->arch.rel_priv = PROG_ ## x; /* Fallthrough */ case PROG_ ## x
 
         enum {
-            PROG_paging = 1,
+            PROG_iommu_pagetables = 1,
+            PROG_paging,
             PROG_vcpu_pagetables,
             PROG_shared,
             PROG_xen,
@@ -2171,6 +2172,12 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
 
+    PROGRESS(iommu_pagetables):
+
+        ret = iommu_free_pgtables(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(paging):
 
         /* Tear down paging-assistance stuff. */
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index a12109a1de..c0d4865dd7 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -140,6 +140,9 @@ int arch_iommu_domain_init(struct domain *d)
 
     spin_lock_init(&hd->arch.mapping_lock);
 
+    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
+    spin_lock_init(&hd->arch.pgtables.lock);
+
     return 0;
 }
 
@@ -257,6 +260,53 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         return;
 }
 
+int iommu_free_pgtables(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    struct page_info *pg;
+
+    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
+    {
+        free_domheap_page(pg);
+
+        if ( general_preempt_check() )
+            return -ERESTART;
+    }
+
+    return 0;
+}
+
+struct page_info *iommu_alloc_pgtable(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    unsigned int memflags = 0;
+    struct page_info *pg;
+    void *p;
+
+#ifdef CONFIG_NUMA
+    if (hd->node != NUMA_NO_NODE)
+        memflags = MEMF_node(hd->node);
+#endif
+
+    pg = alloc_domheap_page(NULL, memflags);
+    if ( !pg )
+        return NULL;
+
+    p = __map_domain_page(pg);
+    clear_page(p);
+
+    if ( hd->platform_ops->sync_cache )
+        iommu_vcall(hd->platform_ops, sync_cache, p, PAGE_SIZE);
+
+    unmap_domain_page(p);
+
+    spin_lock(&hd->arch.pgtables.lock);
+    page_list_add(pg, &hd->arch.pgtables.list);
+    spin_unlock(&hd->arch.pgtables.lock);
+
+    return pg;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
index 8ce97c981f..31f6d4a8d8 100644
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -46,6 +46,10 @@ typedef uint64_t daddr_t;
 struct arch_iommu
 {
     spinlock_t mapping_lock; /* io page table lock */
+    struct {
+        struct page_list_head list;
+        spinlock_t lock;
+    } pgtables;
 
     union {
         /* Intel VT-d */
@@ -131,6 +135,9 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
         iommu_vcall(ops, sync_cache, addr, size);       \
 })
 
+int __must_check iommu_free_pgtables(struct domain *d);
+struct page_info * __must_check iommu_alloc_pgtable(struct domain *d);
+
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
  * Local variables:
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFC923346C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 16:30:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k19ZD-0005aI-Ku; Thu, 30 Jul 2020 14:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k19ZC-0005Pz-6t
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 14:29:54 +0000
X-Inumbo-ID: 196e48b4-d271-11ea-8d70-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 196e48b4-d271-11ea-8d70-bc764e2007e4;
 Thu, 30 Jul 2020 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fFPZHQeR1imbV8GidBB6NY5g3/DPW1fb7q91uXermqU=; b=KXvwuhP3/bfaynsJkuo4yMD9aT
 0Yy9zwoPrxwclZFVd8fC4yP0R3iYoNvbxr8x5vfa/LYirm+CBwOweZMgtjcX+wkHRnCvekBKCr+Nr
 6hVrPxmEU1vDhWc+Pn22AxX0BQM6qq2/xl2Ax24H4yePFqvTVTRI+MNH/AwHmk6dNTEg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yv-0002On-3M; Thu, 30 Jul 2020 14:29:37 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yu-0005aN-SL; Thu, 30 Jul 2020 14:29:37 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 07/10] iommu: make map,
 unmap and flush all take both an order and a count
Date: Thu, 30 Jul 2020 15:29:23 +0100
Message-Id: <20200730142926.6051-8-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

At the moment iommu_map() and iommu_unmap() take a page order but not a
count, whereas iommu_iotlb_flush() takes a count but not a page order.
This patch simply makes them consistent with each other.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

v2:
 - New in v2
---
 xen/arch/arm/p2m.c                       |  2 +-
 xen/arch/x86/mm/p2m-ept.c                |  2 +-
 xen/common/memory.c                      |  4 +--
 xen/drivers/passthrough/amd/iommu.h      |  2 +-
 xen/drivers/passthrough/amd/iommu_map.c  |  4 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 xen/drivers/passthrough/iommu.c          | 31 ++++++++++++------------
 xen/drivers/passthrough/vtd/iommu.c      |  4 +--
 xen/drivers/passthrough/x86/iommu.c      |  2 +-
 xen/include/xen/iommu.h                  |  9 ++++---
 11 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ce59f2b503..71f4a78425 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1061,7 +1061,7 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
             flush_flags |= IOMMU_FLUSHF_added;
 
         rc = iommu_iotlb_flush(p2m->domain, _dfn(gfn_x(sgfn)),
-                               1UL << page_order, flush_flags);
+                               page_order, 1, flush_flags);
     }
     else
         rc = 0;
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b8154a7ecc..b2ac912cde 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -843,7 +843,7 @@ out:
          need_modify_vtd_table )
     {
         if ( iommu_use_hap_pt(d) )
-            rc = iommu_iotlb_flush(d, _dfn(gfn), (1u << order),
+            rc = iommu_iotlb_flush(d, _dfn(gfn), (1u << order), 1,
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
                                                     : 0));
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 714077c1e5..8de334ff10 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -851,12 +851,12 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
 
         this_cpu(iommu_dont_flush_iotlb) = 0;
 
-        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
+        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), 0, done,
                                 IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
 
-        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), done,
+        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), 0, done,
                                 IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index e2d174f3b4..f1f0415469 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -231,7 +231,7 @@ int amd_iommu_reserve_domain_unity_map(struct domain *domain,
                                        paddr_t phys_addr, unsigned long size,
                                        int iw, int ir);
 int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
-                                             unsigned int page_count,
+                                             unsigned long page_count,
                                              unsigned int flush_flags);
 int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
 
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 54b991294a..0cb948d114 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -351,7 +351,7 @@ int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
     return 0;
 }
 
-static unsigned long flush_count(unsigned long dfn, unsigned int page_count,
+static unsigned long flush_count(unsigned long dfn, unsigned long page_count,
                                  unsigned int order)
 {
     unsigned long start = dfn >> order;
@@ -362,7 +362,7 @@ static unsigned long flush_count(unsigned long dfn, unsigned int page_count,
 }
 
 int amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
-                                unsigned int page_count,
+                                unsigned long page_count,
                                 unsigned int flush_flags)
 {
     unsigned long dfn_l = dfn_x(dfn);
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index b2a65dfaaf..346165c3fa 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -945,7 +945,7 @@ static int __must_check ipmmu_iotlb_flush_all(struct domain *d)
 }
 
 static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
-                                          unsigned int page_count,
+                                          unsigned long page_count,
                                           unsigned int flush_flags)
 {
     ASSERT(flush_flags);
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 94662a8501..06f9bda47d 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2534,7 +2534,7 @@ static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
 }
 
 static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
-					     unsigned int page_count,
+					     unsigned long page_count,
 					     unsigned int flush_flags)
 {
 	ASSERT(flush_flags);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index e2c0193a09..568a4a5661 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -235,8 +235,8 @@ void iommu_domain_destroy(struct domain *d)
 }
 
 int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-              unsigned int page_order, unsigned int flags,
-              unsigned int *flush_flags)
+              unsigned int page_order, unsigned int page_count,
+              unsigned int flags, unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
@@ -248,7 +248,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
     ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
     ASSERT(IS_ALIGNED(mfn_x(mfn), (1ul << page_order)));
 
-    for ( i = 0; i < (1ul << page_order); i++ )
+    for ( i = 0; i < ((unsigned long)page_count << page_order); i++ )
     {
         rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
                         mfn_add(mfn, i), flags, flush_flags);
@@ -285,16 +285,16 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
                      unsigned int page_order, unsigned int flags)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_map(d, dfn, mfn, page_order, flags, &flush_flags);
+    int rc = iommu_map(d, dfn, mfn, page_order, 1, flags, &flush_flags);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
+        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), 1, flush_flags);
 
     return rc;
 }
 
 int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
-                unsigned int *flush_flags)
+                unsigned int page_count, unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     unsigned long i;
@@ -305,7 +305,7 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
 
     ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
 
-    for ( i = 0; i < (1ul << page_order); i++ )
+    for ( i = 0; i < ((unsigned long)page_count << page_order); i++ )
     {
         int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
                              flush_flags);
@@ -338,10 +338,10 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
 int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_order, &flush_flags);
+    int rc = iommu_unmap(d, dfn, page_order, 1, &flush_flags);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && ! rc )
-        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
+        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), 1, flush_flags);
 
     return rc;
 }
@@ -357,8 +357,8 @@ int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
     return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
 }
 
-int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
-                      unsigned int flush_flags)
+int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_order,
+                      unsigned int page_count, unsigned int flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     int rc;
@@ -370,14 +370,15 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
     if ( dfn_eq(dfn, INVALID_DFN) )
         return -EINVAL;
 
-    rc = iommu_call(hd->platform_ops, iotlb_flush, d, dfn, page_count,
-                    flush_flags);
+    rc = iommu_call(hd->platform_ops, iotlb_flush, d, dfn,
+                    (unsigned long)page_count << page_order, flush_flags);
     if ( unlikely(rc) )
     {
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
-                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %u flags %x\n",
-                   d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
+                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page order %u, page count %u flags %x\n",
+                   d->domain_id, rc, dfn_x(dfn), page_order, page_count,
+                   flush_flags);
 
         if ( !is_hardware_domain(d) )
             domain_crash(d);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 607e8b5e65..68cf0e535a 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -584,7 +584,7 @@ static int __must_check iommu_flush_all(void)
 
 static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
                                           bool_t dma_old_pte_present,
-                                          unsigned int page_count)
+                                          unsigned long page_count)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct acpi_drhd_unit *drhd;
@@ -632,7 +632,7 @@ static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
 
 static int __must_check iommu_flush_iotlb_pages(struct domain *d,
                                                 dfn_t dfn,
-                                                unsigned int page_count,
+                                                unsigned long page_count,
                                                 unsigned int flush_flags)
 {
     ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index c0d4865dd7..5d1a7cb296 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -244,7 +244,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         else if ( paging_mode_translate(d) )
             rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), PAGE_ORDER_4K,
+            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), PAGE_ORDER_4K, 1,
                            IOMMUF_readable | IOMMUF_writable, &flush_flags);
 
         if ( rc )
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 1831dc66b0..d9c2e764aa 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -146,10 +146,10 @@ enum
 #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
 
 int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                           unsigned int page_order, unsigned int flags,
-                           unsigned int *flush_flags);
+                           unsigned int page_order, unsigned int page_count,
+                           unsigned int flags, unsigned int *flush_flags);
 int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
-                             unsigned int page_order,
+                             unsigned int page_order, unsigned int page_count,
                              unsigned int *flush_flags);
 
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
@@ -162,6 +162,7 @@ int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                    unsigned int *flags);
 
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
+                                   unsigned int page_order,
                                    unsigned int page_count,
                                    unsigned int flush_flags);
 int __must_check iommu_iotlb_flush_all(struct domain *d,
@@ -281,7 +282,7 @@ struct iommu_ops {
     void (*share_p2m)(struct domain *d);
     void (*crash_shutdown)(void);
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
-                                    unsigned int page_count,
+                                    unsigned long page_count,
                                     unsigned int flush_flags);
     int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
-- 
2.20.1



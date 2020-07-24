Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D322CB61
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:46:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0qF-00019Q-AQ; Fri, 24 Jul 2020 16:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yL+a=BD=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jz0qD-00015d-E1
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:46:37 +0000
X-Inumbo-ID: 39ae33b2-cdcd-11ea-a42a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39ae33b2-cdcd-11ea-a42a-12813bfff9fa;
 Fri, 24 Jul 2020 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZN6jmbYm9lCxNLsfkXuY/1LcmLkMfluVmH0qNDCEu0=; b=I/cHUa/pd6pC9G6tExT7F95xXC
 VMncjymlOmzZTFVStzMGzHXDL4camoe6ZhB+cRBPNxkP4BftickwLm9xxELciMdqnPvqm0nm5obvX
 s2eB21PKzYpi6rdWnjji8PmV9JArdSa/xnpFTgtfVooiQoM6bKXS+0djifcfoMpW0bio=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q5-00054Q-D0; Fri, 24 Jul 2020 16:46:29 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q5-0006WL-4k; Fri, 24 Jul 2020 16:46:29 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/6] iommu: remove iommu_lookup_page() and the lookup_page()
 method...
Date: Fri, 24 Jul 2020 17:46:16 +0100
Message-Id: <20200724164619.1245-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724164619.1245-1-paul@xen.org>
References: <20200724164619.1245-1-paul@xen.org>
MIME-Version: 1.0
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
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... from iommu_ops.

This patch is essentially a reversion of dd93d54f "vtd: add lookup_page method
to iommu_ops". The code was intended to be used by a patch that has long-
since been abandoned. Therefore it is dead code and can be removed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>
---
 xen/drivers/passthrough/iommu.c     | 11 --------
 xen/drivers/passthrough/vtd/iommu.c | 41 -----------------------------
 xen/include/xen/iommu.h             |  5 ----
 3 files changed, 57 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index dad4088531..327df17c5d 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -350,17 +350,6 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
     return rc;
 }
 
-int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                      unsigned int *flags)
-{
-    const struct domain_iommu *hd = dom_iommu(d);
-
-    if ( !is_iommu_enabled(d) || !hd->platform_ops->lookup_page )
-        return -EOPNOTSUPP;
-
-    return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
-}
-
 int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
                       unsigned int flush_flags)
 {
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 40834e2e7a..149d7122c3 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1808,46 +1808,6 @@ static int __must_check intel_iommu_unmap_page(struct domain *d, dfn_t dfn,
     return 0;
 }
 
-static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                   unsigned int *flags)
-{
-    struct domain_iommu *hd = dom_iommu(d);
-    struct dma_pte *page, val;
-    u64 pg_maddr;
-
-    /*
-     * If VT-d shares EPT page table or if the domain is the hardware
-     * domain and iommu_passthrough is set then pass back the dfn.
-     */
-    if ( iommu_use_hap_pt(d) ||
-         (iommu_hwdom_passthrough && is_hardware_domain(d)) )
-        return -EOPNOTSUPP;
-
-    spin_lock(&hd->arch.mapping_lock);
-
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0);
-    if ( !pg_maddr )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        return -ENOENT;
-    }
-
-    page = map_vtd_domain_page(pg_maddr);
-    val = page[dfn_x(dfn) & LEVEL_MASK];
-
-    unmap_vtd_domain_page(page);
-    spin_unlock(&hd->arch.mapping_lock);
-
-    if ( !dma_pte_present(val) )
-        return -ENOENT;
-
-    *mfn = maddr_to_mfn(dma_pte_addr(val));
-    *flags = dma_pte_read(val) ? IOMMUF_readable : 0;
-    *flags |= dma_pte_write(val) ? IOMMUF_writable : 0;
-
-    return 0;
-}
-
 static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
 {
     u64 ept_cap, vtd_cap = iommu->cap;
@@ -2710,7 +2670,6 @@ static struct iommu_ops __initdata vtd_ops = {
     .teardown = iommu_domain_teardown,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
-    .lookup_page = intel_iommu_lookup_page,
     .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
     .enable_x2apic = intel_iommu_enable_eim,
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 51c29180a4..271bd8e546 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -158,9 +158,6 @@ int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
 int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
                                     unsigned int page_order);
 
-int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                   unsigned int *flags);
-
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
                                    unsigned int page_count,
                                    unsigned int flush_flags);
@@ -260,8 +257,6 @@ struct iommu_ops {
                                  unsigned int *flush_flags);
     int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
                                    unsigned int *flush_flags);
-    int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                    unsigned int *flags);
 
 #ifdef CONFIG_X86
     int (*enable_x2apic)(void);
-- 
2.20.1



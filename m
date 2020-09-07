Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A61025F42A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:40:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBlO-0003Ap-Ix; Mon, 07 Sep 2020 07:40:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LpL=CQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kFBlN-0003Af-Hx
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:40:29 +0000
X-Inumbo-ID: e2de1ef7-b7db-4971-a2c7-8a6aeda0530b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2de1ef7-b7db-4971-a2c7-8a6aeda0530b;
 Mon, 07 Sep 2020 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=4AoX2QcMIWlbm0K+83CDzVNO/lJ0Ivxf4f14fPbq6/4=; b=anoRvg7fRe6V+9Qghe1U4RqO0D
 mRPbpQIybneeojAuA81o91m2doP9gA0/wjcpoBOSVD1YLgpvGKqs1EeOIFJOzvihpGwzXnwLsKonB
 OSPEkaFH76c1UdcxTteEh0Do/wKZDe2zl8gh93lrNBqMEeJAsVpemsB+qjJcLurCXorI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kFBlM-0000rt-AL; Mon, 07 Sep 2020 07:40:28 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kFBlM-0008Cf-1x; Mon, 07 Sep 2020 07:40:28 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 2/8] iommu: remove unused iommu_ops method and tasklet
Date: Mon,  7 Sep 2020 08:40:17 +0100
Message-Id: <20200907074023.1392-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200907074023.1392-1-paul@xen.org>
References: <20200907074023.1392-1-paul@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The VT-d and AMD IOMMU implementations both use the general x86 IOMMU page
table allocator and ARM always shares page tables with CPU. Hence there is no
need to retain the free_page_table() method or the tasklet which invokes it.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

v2:
  - New in v2 (split from "add common page-table allocator")
---
 xen/drivers/passthrough/iommu.c | 25 -------------------------
 xen/include/xen/iommu.h         |  2 --
 2 files changed, 27 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 2b1db8022c..660dc5deb2 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -49,10 +49,6 @@ bool_t __read_mostly amd_iommu_perdev_intremap = 1;
 
 DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
-DEFINE_SPINLOCK(iommu_pt_cleanup_lock);
-PAGE_LIST_HEAD(iommu_pt_cleanup_list);
-static struct tasklet iommu_pt_cleanup_tasklet;
-
 static int __init parse_iommu_param(const char *s)
 {
     const char *ss;
@@ -226,9 +222,6 @@ static void iommu_teardown(struct domain *d)
     struct domain_iommu *hd = dom_iommu(d);
 
     iommu_vcall(hd->platform_ops, teardown, d);
-
-    if ( hd->platform_ops->free_page_table )
-        tasklet_schedule(&iommu_pt_cleanup_tasklet);
 }
 
 void iommu_domain_destroy(struct domain *d)
@@ -368,23 +361,6 @@ int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
     return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
 }
 
-static void iommu_free_pagetables(void *unused)
-{
-    do {
-        struct page_info *pg;
-
-        spin_lock(&iommu_pt_cleanup_lock);
-        pg = page_list_remove_head(&iommu_pt_cleanup_list);
-        spin_unlock(&iommu_pt_cleanup_lock);
-        if ( !pg )
-            return;
-        iommu_vcall(iommu_get_ops(), free_page_table, pg);
-    } while ( !softirq_pending(smp_processor_id()) );
-
-    tasklet_schedule_on_cpu(&iommu_pt_cleanup_tasklet,
-                            cpumask_cycle(smp_processor_id(), &cpu_online_map));
-}
-
 int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
                       unsigned int flush_flags)
 {
@@ -508,7 +484,6 @@ int __init iommu_setup(void)
 #ifndef iommu_intremap
         printk("Interrupt remapping %sabled\n", iommu_intremap ? "en" : "dis");
 #endif
-        tasklet_init(&iommu_pt_cleanup_tasklet, iommu_free_pagetables, NULL);
     }
 
     return rc;
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3272874958..1831dc66b0 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -263,8 +263,6 @@ struct iommu_ops {
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                     unsigned int *flags);
 
-    void (*free_page_table)(struct page_info *);
-
 #ifdef CONFIG_X86
     int (*enable_x2apic)(void);
     void (*disable_x2apic)(void);
-- 
2.20.1



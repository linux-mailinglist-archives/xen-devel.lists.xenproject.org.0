Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83673D68B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555084.866836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5i-0002M0-39; Mon, 26 Jun 2023 03:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555084.866836; Mon, 26 Jun 2023 03:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5g-0001mQ-I5; Mon, 26 Jun 2023 03:40:36 +0000
Received: by outflank-mailman (input) for mailman id 555084;
 Mon, 26 Jun 2023 03:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2h-0000HH-Kl
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c6b0abc6-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 034751FB;
 Sun, 25 Jun 2023 20:38:13 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B0603F64C;
 Sun, 25 Jun 2023 20:37:26 -0700 (PDT)
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
X-Inumbo-ID: c6b0abc6-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 45/52] xen/mpu: insert an new entry into guest physmap in MPU system
Date: Mon, 26 Jun 2023 11:34:36 +0800
Message-Id: <20230626033443.2943270-46-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function p2m_set_entry/__p2m_set_entry is responsible for inserting an entry
in the p2m. In MPU system, it includes the following steps:
- checking whether mapping already exists(sgfn -> mfn)
- constituting a new P2M MPU memory region structure(pr_t) through
standard entry region_to_p2m_entry()
- insert the new entry into domain P2M table(p2m->root)

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/arm64/mpu.h |   3 +-
 xen/arch/arm/include/asm/mpu/mm.h    |   6 +
 xen/arch/arm/include/asm/p2m.h       |   3 +
 xen/arch/arm/mpu/mm.c                |   4 +-
 xen/arch/arm/mpu/p2m.c               | 172 +++++++++++++++++++++++++++
 5 files changed, 185 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index c5e69f239a..444ca716b8 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -61,7 +61,8 @@ typedef union {
         unsigned long ap:2;       /* Acess Permission */
         unsigned long sh:2;       /* Sharebility */
         unsigned long base:42;    /* Base Address */
-        unsigned long pad:16;
+        unsigned long pad:12;
+        unsigned long p2m_type:4; /* Ignore by hardware. Used to store p2m types.*/
     } reg;
     uint64_t bits;
 } prbar_t;
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 4df69245c6..0abb0a6c92 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -14,6 +14,12 @@ extern void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes);
 extern void unmap_mm_range(paddr_t pa);
 extern bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len);
 extern pr_t *alloc_mpumap(void);
+#define MPUMAP_REGION_FAILED    0
+#define MPUMAP_REGION_FOUND     1
+#define MPUMAP_REGION_INCLUSIVE 2
+#define MPUMAP_REGION_OVERLAP   3
+extern int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
+                                 paddr_t base, paddr_t limit, uint8_t *index);
 
 #endif /* __ARCH_ARM_MM_MPU__ */
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index c3598d514e..68837b6df7 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -67,6 +67,9 @@ struct p2m_domain {
 #else
     /* Current Virtualization System Control Register for the p2m */
     uint64_t vsctlr;
+
+    /* Number of MPU memory regions in P2M MPU memory mapping table. */
+    uint8_t nr_regions;
 #endif
 
     /* Highest guest frame that's ever been mapped in the p2m */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index de5da96b80..8cdb7d7219 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -378,8 +378,8 @@ out:
  *  MPUMAP_REGION_INCLUSIVE: find an inclusive match in #table
  *  MPUMAP_REGION_OVERLAP: overlap with the existing mapping
  */
-static int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
-                                 paddr_t base, paddr_t limit, uint8_t *index)
+int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
+                          paddr_t base, paddr_t limit, uint8_t *index)
 {
     uint8_t i = 0, _index = INVALID_REGION_IDX;
 
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 8f728f8957..4838d5b625 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -166,6 +166,178 @@ int p2m_init(struct domain *d)
     return rc;
 }
 
+static void p2m_set_permission(pr_t *region, p2m_type_t t)
+{
+    switch ( t )
+    {
+    case p2m_ram_rw:
+        region->prbar.reg.xn = XN_DISABLED;
+        region->prbar.reg.ap = AP_RW_ALL;
+        break;
+
+    case p2m_ram_ro:
+        region->prbar.reg.xn = XN_DISABLED;
+        region->prbar.reg.ap = AP_RO_ALL;
+        break;
+
+    case p2m_invalid:
+        region->prbar.reg.xn = XN_P2M_ENABLED;
+        region->prbar.reg.ap = AP_RO_ALL;
+        break;
+
+    case p2m_max_real_type:
+        BUG();
+        break;
+
+    case p2m_mmio_direct_dev:
+    case p2m_mmio_direct_nc:
+    case p2m_mmio_direct_c:
+    case p2m_iommu_map_ro:
+    case p2m_iommu_map_rw:
+    case p2m_map_foreign_ro:
+    case p2m_map_foreign_rw:
+    case p2m_grant_map_ro:
+    case p2m_grant_map_rw:
+        panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m permission in MPU system\n");
+        break;
+    }
+}
+
+static inline pr_t region_to_p2m_entry(mfn_t smfn, unsigned long nr_mfn,
+                                       p2m_type_t t)
+{
+    prbar_t prbar;
+    prlar_t prlar;
+    pr_t region;
+
+    prbar = (prbar_t) {
+        .reg = {
+            .p2m_type = t,  /* P2M Type */
+        }};
+
+    prlar = (prlar_t) {
+        .reg = {
+            .ns = 0,        /* Hyp mode is in secure world */
+            .en = 1,        /* Region enabled */
+        }};
+
+    BUILD_BUG_ON(p2m_max_real_type > (1 << 4));
+
+    switch ( t )
+    {
+    case p2m_invalid:
+    case p2m_ram_rw:
+    case p2m_ram_ro:
+    case p2m_max_real_type:
+        prbar.reg.sh = LPAE_SH_INNER;
+        prlar.reg.ai = MT_NORMAL;
+        break;
+
+    default:
+        panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m type in MPU system\n");
+        break;
+    }
+
+    region = (pr_t) {
+        .prbar = prbar,
+        .prlar = prlar,
+    };
+
+    /*
+     * xn and ap bit will be defined in the p2m_set_permission
+     * based on t.
+     */
+    p2m_set_permission(&region, t);
+
+    /* Set base address and limit address */
+    pr_set_base(&region, mfn_to_maddr(smfn));
+    pr_set_limit(&region, (mfn_to_maddr(mfn_add(smfn, nr_mfn)) - 1));
+
+    return region;
+}
+
+/*
+ * Check whether guest memory [sgfn, sgfn + nr_gfns) is mapped.
+ *
+ * If it is mapped, the index of associated MPU memory region will be filled
+ * up, and 0 is returned.
+ * If it is not mapped, -ENOENT errno will be returned.
+ */
+static int is_gfns_mapped(struct p2m_domain *p2m, gfn_t sgfn,
+                          unsigned long nr_gfns, uint8_t *idx)
+{
+    paddr_t gbase = gfn_to_gaddr(sgfn),
+            glimit = gfn_to_gaddr(gfn_add(sgfn, nr_gfns)) - 1;
+    int rc;
+    pr_t *table;
+
+    table = (pr_t *)page_to_virt(p2m->root);
+    if ( !table )
+        return -EEXIST;
+
+    rc = mpumap_contain_region(table, p2m->nr_regions, gbase, glimit, idx);
+    if ( (rc == MPUMAP_REGION_FOUND) || (rc == MPUMAP_REGION_INCLUSIVE) )
+        return 0;
+    else if ( rc == MPUMAP_REGION_FAILED )
+        return -ENOENT;
+
+    /* Partially mapped */
+    return -EINVAL;
+}
+
+int __p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned int nr,
+                    mfn_t smfn, p2m_type_t t, p2m_access_t a)
+{
+    pr_t *table;
+    mfn_t emfn = mfn_add(smfn, nr);
+    uint8_t idx = INVALID_REGION_IDX;
+
+    /*
+     * Other than removing mapping (i.e MFN_INVALID),
+     * gfn == mfn in MPU system.
+     */
+    if ( !mfn_eq(smfn, INVALID_MFN) )
+        if ( gfn_x(sgfn) != mfn_x(smfn) )
+        {
+            printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" at %#"PRI_mfn"\n",
+                   mfn_x(smfn), gfn_x(sgfn));
+            return -EINVAL;
+        }
+
+    if ( is_gfns_mapped(p2m, sgfn, nr, &idx) != -ENOENT )
+    {
+        printk(XENLOG_G_ERR "p2m: unable to insert P2M MPU memory region 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+               gfn_to_gaddr(sgfn), gfn_to_gaddr(gfn_add(sgfn, nr)));
+        return -EINVAL;
+    }
+
+    table = (pr_t *)page_to_virt(p2m->root);
+    if ( !table )
+        return -EEXIST;
+    table[p2m->nr_regions] = region_to_p2m_entry(smfn, nr, t);
+    p2m->nr_regions++;
+
+    p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn, _gfn(mfn_x(emfn)));
+    p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, _gfn(mfn_x(smfn)));
+
+    return 0;
+}
+
+int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
+                  mfn_t smfn, p2m_type_t t, p2m_access_t a)
+{
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m->domain->is_dying) )
+        return -ENOMEM;
+
+    return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1



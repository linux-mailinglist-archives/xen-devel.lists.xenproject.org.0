Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81F73D66A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555003.866558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4p-0005kC-TH; Mon, 26 Jun 2023 03:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555003.866558; Mon, 26 Jun 2023 03:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4p-0005h8-LN; Mon, 26 Jun 2023 03:39:43 +0000
Received: by outflank-mailman (input) for mailman id 555003;
 Mon, 26 Jun 2023 03:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2E-0007ej-DN
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b5ea710d-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEFBB1FB;
 Sun, 25 Jun 2023 20:37:44 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 439C73F64C;
 Sun, 25 Jun 2023 20:36:58 -0700 (PDT)
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
X-Inumbo-ID: b5ea710d-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 36/52] xen/mpu: implememt ioremap_xxx in MPU
Date: Mon, 26 Jun 2023 11:34:27 +0800
Message-Id: <20230626033443.2943270-37-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A set of function ioremap_xxx are designed to map deivce memory or
remap part of memory temporarily for short-time special purpose, like
using ioremap_wc to temporarily remap guest kernel non-cacheable, for
copying it to guest memory.

As virtual translation is not supported in MPU, and we always follow the
rule of "map in demand" in MPU, we implement MPU version of ioremap_xxx,
through mapping the memory with a transient MPU memory region.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- adapt to the new rule of "map in demand"
---
 xen/arch/arm/include/asm/arm64/mpu.h |   4 +
 xen/arch/arm/include/asm/mm.h        |   6 +
 xen/arch/arm/mpu/mm.c                | 185 +++++++++++++++++++++++++++
 3 files changed, 195 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index aee7947223..c5e69f239a 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -121,6 +121,10 @@ static inline bool region_is_valid(pr_t *pr)
     return pr->prlar.reg.en;
 }
 
+static inline bool region_is_transient(pr_t *pr)
+{
+    return pr->prlar.reg.tran;
+}
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM64_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index cffbf8a595..0352182d99 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -227,6 +227,7 @@ void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
 extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
 extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
 
+#ifndef CONFIG_HAS_MPU
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
     return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
@@ -241,6 +242,11 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 {
     return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
 }
+#else
+extern void __iomem *ioremap_nocache(paddr_t start, size_t len);
+extern void __iomem *ioremap_cache(paddr_t start, size_t len);
+extern void __iomem *ioremap_wc(paddr_t start, size_t len);
+#endif
 
 /* XXX -- account for base */
 #define mfn_valid(mfn)        ({                                              \
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 9d5c1da39c..3bb1a5c7c4 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -624,6 +624,191 @@ int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
     return xen_mpumap_update(start, end, 0);
 }
 
+/*
+ * Check whether memory range [pa, pa + len) is mapped in Xen MPU
+ * memory mapping table xen_mpumap.
+ *
+ * If it is mapped, the associated index will be returned.
+ * If it is not mapped, INVALID_REGION_IDX will be returned.
+ */
+static uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len)
+{
+    int rc;
+    uint8_t idx;
+
+    rc = mpumap_contain_region(xen_mpumap, max_xen_mpumap, pa, pa + len - 1,
+                               &idx);
+    if ( (rc == MPUMAP_REGION_FOUND) || (rc == MPUMAP_REGION_INCLUSIVE) )
+        return idx;
+
+    if ( rc == MPUMAP_REGION_OVERLAP )
+         panic("mpu: can not deal with overlapped MPU memory region\n");
+    /* Not mapped */
+    return INVALID_REGION_IDX;
+}
+
+static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
+{
+    if ( region->prbar.reg.ap != PAGE_AP_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING "region permission is not matched (0x%x -> 0x%x)\n",
+               region->prbar.reg.ap, PAGE_AP_MASK(attributes));
+        return false;
+    }
+
+    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING "region execution permission is not matched (0x%x -> 0x%x)\n",
+               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
+        return false;
+    }
+
+    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING "region memory attributes is not matched (0x%x -> 0x%x)\n",
+               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
+        return false;
+    }
+
+    return true;
+}
+
+/*
+ * Check whether memory range [pa, pa + len) is mapped with memory
+ * attributes #attr in Xen MPU memory mapping table xen_mpumap.
+ *
+ * If it is mapped but with different memory attributes, Errno -EINVAL
+ * will be returned.
+ * If it is not mapped at all, Errno -ENOENT will be returned.
+ */
+static int is_mm_range_mapped_with_attr(paddr_t pa, paddr_t len,
+                                        unsigned int attr)
+{
+    uint8_t idx;
+
+    idx = is_mm_range_mapped(pa, len);
+    if ( idx != INVALID_REGION_IDX )
+    {
+        pr_t *region;
+
+        region = &xen_mpumap[idx];
+        if ( !is_mm_attr_match(region, attr) )
+            return -EINVAL;
+
+        return 0;
+    }
+
+    return -ENOENT;
+}
+
+/*
+ * map_mm_range shall work with unmap_mm_range to map a chunk
+ * of memory with a transient MPU memory region for a period of short time.
+ */
+static void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes)
+{
+    if ( xen_mpumap_update(pa, pa + len, attributes | _PAGE_TRANSIENT) )
+        printk(XENLOG_ERR "Failed to map_mm_range 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+               pa, pa + len);
+
+    return maddr_to_virt(pa);
+}
+
+static void unmap_mm_range(paddr_t pa)
+{
+    uint8_t idx;
+
+    /*
+     * The mapping size in map_mm_range is at least PAGE_SIZE.
+     * Find the MPU memory region mapped through map_mm_range, and associated
+     * idx will be returned.
+     */
+    idx = is_mm_range_mapped(pa, PAGE_SIZE);
+    if ( idx == INVALID_REGION_IDX )
+    {
+        printk(XENLOG_ERR "Failed to unmap_mm_range MPU memory region at 0x%"PRIpaddr"\n",
+               pa);
+        return;
+    }
+
+    if ( !region_is_transient(&xen_mpumap[idx]) )
+    {
+        printk(XENLOG_WARNING "Failed to unmap MPU memory region at 0x%"PRIpaddr"\n, as it is not transient\n",
+               pa);
+        return;
+    }
+
+    /* Disable MPU memory region and clear the according entry in xen_mpumap */
+    control_mpu_region_from_index(idx, false);
+}
+
+/*
+ * It works with "iounmap" as a pair to temporarily map a chunk of memory
+ * with a transient MPU memory region, for short-time special accessing.
+ */
+void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
+{
+    return map_mm_range(round_pgdown(pa), round_pgup(len), attributes);
+}
+
+/* ioremap_nocache is normally used to map device memory */
+void __iomem *ioremap_nocache(paddr_t start, size_t len)
+{
+    int rc;
+
+    /* Check whether it is already mapped as device memory */
+    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
+    if ( rc == -ENOENT )
+        return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
+    else if ( rc != 0 )
+        return NULL;
+
+    /* Already mapped */
+    return maddr_to_virt(start);
+}
+
+/*
+ * ioremap_cache which is working with iounmap as a pair, is normally used to
+ * map a chunck of cacheable memory temporarily for short-time special purpose.
+ */
+void __iomem *ioremap_cache(paddr_t start, size_t len)
+{
+    int rc;
+
+    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR);
+    if ( rc == -ENOENT )
+        return ioremap_attr(start, len, PAGE_HYPERVISOR);
+    else if ( rc != 0 )
+        return NULL;
+
+    /* Already mapped */
+    return maddr_to_virt(start);
+}
+
+/*
+ * ioremap_wc which is working with iounmap as a pair, is normally used to
+ * map a chunck of non-cacheable memory temporarily for short-time special
+ * purpose.
+ */
+void __iomem *ioremap_wc(paddr_t start, size_t len)
+{
+    int rc;
+
+    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR_WC);
+    if ( rc == -ENOENT )
+        ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
+    else if ( rc != 0 )
+        return NULL;
+
+    /* Already mapped */
+    return maddr_to_virt(start);
+}
+
+void iounmap(void __iomem *va)
+{
+    unmap_mm_range(virt_to_maddr(va));
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB078668B7A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476579.738916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjF-0000M3-8V; Fri, 13 Jan 2023 05:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476579.738916; Fri, 13 Jan 2023 05:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjF-0000GW-5U; Fri, 13 Jan 2023 05:35:49 +0000
Received: by outflank-mailman (input) for mailman id 476579;
 Fri, 13 Jan 2023 05:35:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCev-0005sJ-GW
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8277fd1c-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:31:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D92BBFEC;
 Thu, 12 Jan 2023 21:32:01 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F50D3F587;
 Thu, 12 Jan 2023 21:31:15 -0800 (PST)
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
X-Inumbo-ID: 8277fd1c-9303-11ed-91b6-6bf2151ebd3b
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
Subject: [PATCH v2 32/40] xen/mpu: implement MPU version of ioremap_xxx
Date: Fri, 13 Jan 2023 13:29:05 +0800
Message-Id: <20230113052914.3845596-33-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ioremap_xxx is normally being used to remap device address ranges
in MMU system during device driver initialization.

However, in MPU system, virtual translation is not supported and
device memory layout is statically configured in Device Tree, and being mapped
at very early stage.
So here we only add a check to verify this assumption.

But for tolerating a few cases where the function is called to map for
temporary copy and paste, like ioremap_wc in kernel image loading, the
region attribute mismatch will be treated as warning than error.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h |  1 +
 xen/arch/arm/include/asm/mm.h        | 16 ++++-
 xen/arch/arm/include/asm/mm_mpu.h    |  2 +
 xen/arch/arm/mm_mpu.c                | 88 ++++++++++++++++++++++++----
 xen/include/xen/vmap.h               | 12 ++++
 5 files changed, 106 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 8e8679bc82..b4e50a9a0e 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -82,6 +82,7 @@
 #define REGION_HYPERVISOR_BOOT    (REGION_HYPERVISOR_RW|_REGION_BOOTONLY)
 #define REGION_HYPERVISOR_SWITCH  (REGION_HYPERVISOR_RW|_REGION_SWITCH)
 #define REGION_HYPERVISOR_NOCACHE (_REGION_DEVICE|MT_DEVICE_nGnRE|_REGION_SWITCH)
+#define REGION_HYPERVISOR_WC      (_REGION_DEVICE|MT_NORMAL_NC)
 
 #define INVALID_REGION            (~0UL)
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 7969ec9f98..fa44cfc50d 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -14,6 +14,10 @@
 # error "unknown ARM variant"
 #endif
 
+#if defined(CONFIG_HAS_MPU)
+# include <asm/arm64/mpu.h>
+#endif
+
 /* Align Xen to a 2 MiB boundary. */
 #define XEN_PADDR_ALIGN (1 << 21)
 
@@ -198,19 +202,25 @@ extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
 
+#ifndef CONFIG_HAS_MPU
+#define DEFINE_ATTRIBUTE(var)   (PAGE_##var)
+#else
+#define DEFINE_ATTRIBUTE(var)   (REGION_##var)
+#endif
+
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
-    return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
+    return ioremap_attr(start, len, DEFINE_ATTRIBUTE(HYPERVISOR_NOCACHE));
 }
 
 static inline void __iomem *ioremap_cache(paddr_t start, size_t len)
 {
-    return ioremap_attr(start, len, PAGE_HYPERVISOR);
+    return ioremap_attr(start, len, DEFINE_ATTRIBUTE(HYPERVISOR));
 }
 
 static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 {
-    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
+    return ioremap_attr(start, len, DEFINE_ATTRIBUTE(HYPERVISOR_WC));
 }
 
 /* XXX -- account for base */
diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
index eebd5b5d35..5aa61c43b6 100644
--- a/xen/arch/arm/include/asm/mm_mpu.h
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -2,6 +2,8 @@
 #ifndef __ARCH_ARM_MM_MPU__
 #define __ARCH_ARM_MM_MPU__
 
+#include <asm/arm64/mpu.h>
+
 #define setup_mm_mappings(boot_phys_offset) ((void)(boot_phys_offset))
 /*
  * Function setup_static_mappings() sets up MPU memory region mapping
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index ea64aa38e4..7b54c87acf 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -712,32 +712,100 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
            frametable_size - (nr_pdxs * sizeof(struct page_info)));
 }
 
-/* TODO: Implementation on the first usage */
-void dump_hyp_walk(vaddr_t addr)
+static bool region_attribute_match(pr_t *region, unsigned int attributes)
 {
+    if ( region->prbar.reg.ap != REGION_AP_MASK(attributes) )
+    {
+        printk(XENLOG_ERR "region permission is not matched (0x%x -> 0x%x)\n",
+               region->prbar.reg.ap, REGION_AP_MASK(attributes));
+        return false;
+    }
+
+    if ( region->prbar.reg.xn != REGION_XN_MASK(attributes) )
+    {
+        printk(XENLOG_ERR "region execution permission is not matched (0x%x -> 0x%x)\n",
+               region->prbar.reg.xn, REGION_XN_MASK(attributes));
+        return false;
+    }
+
+    if ( region->prlar.reg.ai != REGION_AI_MASK(attributes) )
+    {
+        printk(XENLOG_ERR "region memory attributes is not matched (0x%x -> 0x%x)\n",
+               region->prlar.reg.ai, REGION_AI_MASK(attributes));
+        return false;
+    }
+
+    return true;
 }
 
-void __init remove_early_mappings(void)
+static bool check_region_and_attributes(paddr_t pa, size_t len,
+                                        unsigned int attributes,
+                                        const char *prefix)
+{
+    pr_t *region;
+    int rc;
+    uint64_t idx;
+
+    rc = mpumap_contain_region(xen_mpumap, max_xen_mpumap, pa, pa + len - 1,
+                               &idx);
+    if ( rc != MPUMAP_REGION_FOUND && rc != MPUMAP_REGION_INCLUSIVE )
+    {
+        region_printk("%s: range 0x%"PRIpaddr" - 0x%"PRIpaddr" has not been properly mapped\n",
+                      prefix, pa, pa + len - 1);
+        return false;
+    }
+
+    region = &xen_mpumap[idx];
+    /*
+     * For tolerating a few cases where the function is called to remap for
+     * temporary copy and paste, like ioremap_wc in kernel image loading, the
+     * permission mismatch will be treated as warning than error.
+     */
+    if ( !region_attribute_match(region, attributes) )
+        printk(XENLOG_WARNING
+               "mpu: %s: range 0x%"PRIpaddr" - 0x%"PRIpaddr" attributes mismatched\n",
+               prefix, pa, pa + len - 1);
+
+    return true;
+}
+
+/*
+ * This function is normally being used to remap device address ranges
+ * in MMU system.
+ * However, in MPU system, virtual translation is not supported and
+ * device memory is statically configured in FDT, while being mapped at very
+ * early stage.
+ * So here we only add a check to verify this assumption.
+ */
+void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
 {
+    if ( !check_region_and_attributes(pa, len, attributes, "ioremap") )
+        return NULL;
+
+    return maddr_to_virt(pa);
 }
 
-int init_secondary_pagetables(int cpu)
+void *ioremap(paddr_t pa, size_t len)
 {
-    return -ENOSYS;
+    return ioremap_attr(pa, len, REGION_HYPERVISOR_NOCACHE);
 }
 
-void mmu_init_secondary_cpu(void)
+/* TODO: Implementation on the first usage */
+void dump_hyp_walk(vaddr_t addr)
 {
 }
 
-void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
+void __init remove_early_mappings(void)
 {
-    return NULL;
 }
 
-void *ioremap(paddr_t pa, size_t len)
+int init_secondary_pagetables(int cpu)
+{
+    return -ENOSYS;
+}
+
+void mmu_init_secondary_cpu(void)
 {
-    return NULL;
 }
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 2e3ae0ca6a..fc56d02fc8 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -89,15 +89,27 @@ static inline void vfree(void *va)
     ASSERT_UNREACHABLE();
 }
 
+#ifdef CONFIG_HAS_MPU
+void __iomem *ioremap(paddr_t, size_t);
+#else
 void __iomem *ioremap(paddr_t, size_t)
 {
     ASSERT_UNREACHABLE();
     return NULL;
 }
+#endif
 
 static inline void iounmap(void __iomem *va)
 {
+#ifdef CONFIG_HAS_MPU
+    /*
+     * iounmap and ioremap are a couple, and as ioremap is only doing
+     * checking in MPU system, we do nothing and just return in iounmap
+     */
+    return;
+#else
     ASSERT_UNREACHABLE();
+#endif
 }
 
 static inline void *arch_vmap_virt_end(void)
-- 
2.25.1



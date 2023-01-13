Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17850668B8D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476650.739135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCk2-0001hA-Kc; Fri, 13 Jan 2023 05:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476650.739135; Fri, 13 Jan 2023 05:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCk2-0001YR-BW; Fri, 13 Jan 2023 05:36:38 +0000
Received: by outflank-mailman (input) for mailman id 476650;
 Fri, 13 Jan 2023 05:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeT-0005sJ-63
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 71a1f7f5-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A77B5FEC;
 Thu, 12 Jan 2023 21:31:33 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E97423F587;
 Thu, 12 Jan 2023 21:30:48 -0800 (PST)
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
X-Inumbo-ID: 71a1f7f5-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 24/40] xen/mpu: introduce "mpu,xxx-memory-section"
Date: Fri, 13 Jan 2023 13:28:57 +0800
Message-Id: <20230113052914.3845596-25-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MPU system, all kinds of resources, including system resource and
domain resource must be statically configured in Device Tree, i.e,
guest RAM must be statically allocated through "xen,static-mem" property
under domain node.

However, due to limited MPU protection regions and a wide variety of resource,
we could easily exhaust all MPU protection regions very quickly.
So we want to introduce a set of new property, "#mpu,xxx-memory-section"
to mitigate the impact.
Each property limits the available host address range of one kind of
system/domain resource.

This commit also introduces "#mpu,guest-memory-section" as an example, for
limiting the scattering of static memory as guest RAM.
Guest RAM shall be not only statically configured through "xen,static-mem"
property in MPU system, but also shall be defined inside
outside "mpu,guest-memory-section".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/bootfdt.c           | 13 ++++---
 xen/arch/arm/include/asm/setup.h | 24 +++++++++++++
 xen/arch/arm/setup_mpu.c         | 58 ++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 0085c28d74..d7a5dd0ede 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -59,10 +59,10 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
     *size = dt_next_cell(size_cells, cell);
 }
 
-static int __init device_tree_get_meminfo(const void *fdt, int node,
-                                          const char *prop_name,
-                                          u32 address_cells, u32 size_cells,
-                                          void *data, enum membank_type type)
+int __init device_tree_get_meminfo(const void *fdt, int node,
+                                   const char *prop_name,
+                                   u32 address_cells, u32 size_cells,
+                                   void *data, enum membank_type type)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
@@ -315,6 +315,11 @@ static int __init process_chosen_node(const void *fdt, int node,
         bootinfo.static_heap = true;
     }
 
+#ifdef CONFIG_HAS_MPU
+    if ( process_mpuinfo(fdt, node, address_cells, size_cells) )
+        return -EINVAL;
+#endif
+
     printk("Checking for initrd in /chosen\n");
 
     prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 8f353b67f8..3581f8f990 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -172,6 +172,11 @@ void device_tree_get_reg(const __be32 **cell, u32 address_cells,
 u32 device_tree_get_u32(const void *fdt, int node,
                         const char *prop_name, u32 dflt);
 
+int device_tree_get_meminfo(const void *fdt, int node,
+                            const char *prop_name,
+                            u32 address_cells, u32 size_cells,
+                            void *data, enum membank_type type);
+
 int map_range_to_domain(const struct dt_device_node *dev,
                         u64 addr, u64 len, void *data);
 
@@ -185,6 +190,25 @@ struct init_info
     unsigned int cpuid;
 };
 
+#ifdef CONFIG_HAS_MPU
+/* Index of MPU memory section */
+enum mpu_section_info {
+    MSINFO_GUEST,
+    MSINFO_MAX
+};
+
+extern const char *mpu_section_info_str[MSINFO_MAX];
+
+struct mpuinfo {
+    struct meminfo sections[MSINFO_MAX];
+};
+
+extern struct mpuinfo mpuinfo;
+
+extern int process_mpuinfo(const void *fdt, int node, uint32_t address_cells,
+                           uint32_t size_cells);
+#endif /* CONFIG_HAS_MPU */
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
index ca0d8237d5..09a38a34a4 100644
--- a/xen/arch/arm/setup_mpu.c
+++ b/xen/arch/arm/setup_mpu.c
@@ -20,12 +20,70 @@
  */
 
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
 #include <asm/mm_mpu.h>
 #include <asm/page.h>
 #include <asm/setup.h>
 
+const char *mpu_section_info_str[MSINFO_MAX] = {
+    "mpu,guest-memory-section",
+};
+
+/*
+ * mpuinfo stores mpu memory section info, which is configured under
+ * "mpu,xxx-memory-section" in Device Tree.
+ */
+struct mpuinfo __initdata mpuinfo;
+
+/*
+ * Due to limited MPU protection regions and a wide variety of resource,
+ * "#mpu,xxx-memory-section" is introduced to mitigate the impact.
+ * Each property limits the available host address range of one kind of
+ * system/domain resource.
+ *
+ * "mpu,guest-memory-section": guest RAM must be statically allocated
+ * through "xen,static-mem" property in MPU system. "mpu,guest-memory-section"
+ * limits the scattering of "xen,static-mem", as users could not define
+ * a "xen,static-mem" outside "mpu,guest-memory-section".
+ */
+static int __init process_mpu_memory_section(const void *fdt, int node,
+                                             const char *name, void *data,
+                                             uint32_t address_cells,
+                                             uint32_t size_cells)
+{
+    if ( !fdt_get_property(fdt, node, name, NULL) )
+        return -EINVAL;
+
+    return device_tree_get_meminfo(fdt, node, name, address_cells, size_cells,
+                                   data, MEMBANK_DEFAULT);
+}
+
+int __init process_mpuinfo(const void *fdt, int node,
+                           uint32_t address_cells, uint32_t size_cells)
+{
+    uint8_t idx = 0;
+    const char *prop_name;
+
+    for ( ; idx < MSINFO_MAX; idx++ )
+    {
+        prop_name = mpu_section_info_str[idx];
+
+        printk("Checking for %s in /chosen\n", prop_name);
+
+        if ( process_mpu_memory_section(fdt, node, prop_name,
+                                        &mpuinfo.sections[idx],
+                                        address_cells, size_cells) )
+        {
+            printk(XENLOG_ERR "fdt: failed to process %s\n", prop_name);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
 void __init setup_mm(void)
 {
     paddr_t ram_start = ~0, ram_end = 0, ram_size = 0;
-- 
2.25.1



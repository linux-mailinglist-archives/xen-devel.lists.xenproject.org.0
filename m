Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08975248D2
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 11:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327564.550393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np51Y-0005hT-Aq; Thu, 12 May 2022 09:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327564.550393; Thu, 12 May 2022 09:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np51Y-0005f3-7J; Thu, 12 May 2022 09:22:20 +0000
Received: by outflank-mailman (input) for mailman id 327564;
 Thu, 12 May 2022 09:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsCQ=VU=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1np4s6-0000K4-MR
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 09:12:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a7bdae07-d1d3-11ec-a406-831a346695d4;
 Thu, 12 May 2022 11:12:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F19BA106F;
 Thu, 12 May 2022 02:12:31 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D5653F73D;
 Thu, 12 May 2022 02:12:29 -0700 (PDT)
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
X-Inumbo-ID: a7bdae07-d1d3-11ec-a406-831a346695d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 7/8] xen/arm: create shared memory nodes in guest device tree
Date: Thu, 12 May 2022 17:11:28 +0800
Message-Id: <20220512091129.2802997-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512091129.2802997-1-Penny.Zheng@arm.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We expose the shared memory to the domU using the "xen,shared-memory-v1"
reserved-memory binding. See
Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
in Linux for the corresponding device tree binding.

To save the cost of re-parsing shared memory device tree configuration when
creating shared memory nodes in guest device tree, this commit adds new field
"shm_mem" to store shm-info per domain.

For each shared memory region, a range is exposed under
the /reserved-memory node as a child node. Each range sub-node is
named xen-shmem@<address> and has the following properties:
- compatible:
        compatible = "xen,shared-memory-v1"
- reg:
        the base guest physical address and size of the shared memory region
- xen,id:
        a string that identifies the shared memory region.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- move field "shm_mem" to kernel_info
---
v2 change:
- using xzalloc
- shm_id should be uint8_t
- make reg a local variable
- add #address-cells and #size-cells properties
- fix alignment
---
 xen/arch/arm/domain_build.c       | 143 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/kernel.h |   1 +
 xen/arch/arm/include/asm/setup.h  |   1 +
 3 files changed, 143 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index aa7c264e23..fb9146b6e0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -892,7 +892,22 @@ static int __init allocate_shared_memory(struct domain *d,
     return ret;
 }
 
-static int __init process_shm(struct domain *d,
+static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
+                                            paddr_t start, paddr_t size,
+                                            u32 shm_id)
+{
+    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
+        return -ENOMEM;
+
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id = shm_id;
+    kinfo->shm_mem.nr_banks++;
+
+    return 0;
+}
+
+static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                               const struct dt_device_node *node)
 {
     struct dt_device_node *shm_node;
@@ -963,6 +978,14 @@ static int __init process_shm(struct domain *d,
             if ( ret )
                 return ret;
         }
+
+        /*
+         * Record static shared memory region info for later setting
+         * up shm-node in guest device tree.
+         */
+        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
+        if ( ret )
+            return ret;
     }
 
     return 0;
@@ -1293,6 +1316,117 @@ static int __init make_memory_node(const struct domain *d,
     return res;
 }
 
+#ifdef CONFIG_STATIC_SHM
+static int __init make_shm_memory_node(const struct domain *d,
+                                       void *fdt,
+                                       int addrcells, int sizecells,
+                                       struct meminfo *mem)
+{
+    unsigned long i = 0;
+    int res = 0;
+
+    if ( mem->nr_banks == 0 )
+        return -ENOENT;
+
+    /*
+     * For each shared memory region, a range is exposed under
+     * the /reserved-memory node as a child node. Each range sub-node is
+     * named xen-shmem@<address>.
+     */
+    dt_dprintk("Create xen-shmem node\n");
+
+    for ( ; i < mem->nr_banks; i++ )
+    {
+        uint64_t start = mem->bank[i].start;
+        uint64_t size = mem->bank[i].size;
+        uint8_t shm_id = mem->bank[i].shm_id;
+        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
+        char buf[27];
+        const char compat[] = "xen,shared-memory-v1";
+        __be32 reg[4];
+        __be32 *cells;
+        unsigned int len = (addrcells + sizecells) * sizeof(__be32);
+
+        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
+        res = fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
+        if ( res )
+            return res;
+
+        cells = reg;
+        dt_child_set_range(&cells, addrcells, sizecells, start, size);
+
+        res = fdt_property(fdt, "reg", reg, len);
+        if ( res )
+            return res;
+
+        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n",
+                   i, start, start + size);
+
+        res = fdt_property_cell(fdt, "xen,id", shm_id);
+        if ( res )
+            return res;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+    }
+
+    return res;
+}
+#else
+static int __init make_shm_memory_node(const struct domain *d,
+                                       void *fdt,
+                                       int addrcells, int sizecells,
+                                       struct meminfo *mem)
+{
+    ASSERT_UNREACHABLE();
+}
+#endif
+
+static int __init make_resv_memory_node(const struct domain *d,
+                                        void *fdt,
+                                        int addrcells, int sizecells,
+                                        struct meminfo *mem)
+{
+    int res = 0;
+    /* Placeholder for reserved-memory\0 */
+    char resvbuf[16] = "reserved-memory";
+
+    if ( mem->nr_banks == 0 )
+        /* No shared memory provided. */
+        return 0;
+
+    dt_dprintk("Create reserved-memory node\n");
+
+    res = fdt_begin_node(fdt, resvbuf);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "ranges", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", addrcells);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", sizecells);
+    if ( res )
+        return res;
+
+    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
 {
     struct meminfo *ext_regions = data;
@@ -3029,6 +3163,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                                &kinfo->shm_mem);
+    if ( ret )
+        goto err;
+
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
@@ -3367,7 +3506,7 @@ static int __init construct_domU(struct domain *d,
         assign_static_memory_11(d, &kinfo, node);
 
 #ifdef CONFIG_STATIC_SHM
-    rc = process_shm(d, node);
+    rc = process_shm(d, &kinfo, node);
     if ( rc < 0 )
         return rc;
 #endif
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 874aa108a7..e089980b87 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -19,6 +19,7 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
+    struct meminfo shm_mem;
 
     /* kernel entry point */
     paddr_t entry;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 35449bd7d8..6cd45b6212 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -29,6 +29,7 @@ struct membank {
     bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
 #ifdef CONFIG_STATIC_SHM
     unsigned int nr_shm_domain;
+    uint8_t shm_id ; /* ID identifier of a static shared memory bank. */
 #endif
 };
 
-- 
2.25.1



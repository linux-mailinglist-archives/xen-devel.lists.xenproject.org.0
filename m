Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4CC51D23D
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 09:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322694.544140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsN9-0003rT-1D; Fri, 06 May 2022 07:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322694.544140; Fri, 06 May 2022 07:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsN8-0003oC-TK; Fri, 06 May 2022 07:27:30 +0000
Received: by outflank-mailman (input) for mailman id 322694;
 Fri, 06 May 2022 07:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5MfP=VO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmsLy-0007P7-JD
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 07:26:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d157c0c9-cd0d-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 09:26:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0FB61063;
 Fri,  6 May 2022 00:26:16 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 298193FA27;
 Fri,  6 May 2022 00:26:13 -0700 (PDT)
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
X-Inumbo-ID: d157c0c9-cd0d-11ec-8fc4-03012f2f19d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 8/9] xen/arm: create shared memory nodes in guest device tree
Date: Fri,  6 May 2022 15:25:01 +0800
Message-Id: <20220506072502.2177828-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506072502.2177828-1-Penny.Zheng@arm.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
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
v2 change:
- using xzalloc
- shm_id should be uint8_t
- make reg a local variable
- add #address-cells and #size-cells properties
- fix alignment
---
 xen/arch/arm/domain_build.c       | 144 ++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h |   1 +
 xen/arch/arm/include/asm/setup.h  |   1 +
 3 files changed, 146 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8d299a3616..f08606d2c0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -894,6 +894,26 @@ static int __init allocate_shared_memory(struct domain *d,
     return ret;
 }
 
+static int __init append_shm_bank_to_domain(struct domain *d,
+                                            paddr_t start, paddr_t size,
+                                            u32 shm_id)
+{
+    /* Allocate memory at first insertion. */
+    if ( d->arch.shm_mem == NULL )
+    {
+        d->arch.shm_mem = xzalloc(struct meminfo);
+        if ( d->arch.shm_mem == NULL )
+            return -ENOMEM;
+    }
+
+    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].start = start;
+    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].size = size;
+    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].shm_id = shm_id;
+    d->arch.shm_mem->nr_banks++;
+
+    return 0;
+}
+
 static int __init process_shm(struct domain *d,
                               const struct dt_device_node *node)
 {
@@ -975,6 +995,14 @@ static int __init process_shm(struct domain *d,
             if ( ret )
                 return ret;
         }
+
+        /*
+         * Record static shared memory region info for later setting
+         * up shm-node in guest device tree.
+         */
+        ret = append_shm_bank_to_domain(d, gbase, psize, shm_id);
+        if ( ret )
+            return ret;
     }
 
     return 0;
@@ -1305,6 +1333,117 @@ static int __init make_memory_node(const struct domain *d,
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
+    if ( mem == NULL )
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
@@ -3041,6 +3180,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                                d->arch.shm_mem);
+    if ( ret )
+        goto err;
+
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..d0d1e12cfe 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -104,6 +104,7 @@ struct arch_domain
 #endif
 
     bool directmap;
+    struct meminfo *shm_mem;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 38e02ced36..b5909acf68 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -29,6 +29,7 @@ struct membank {
     bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
 #ifdef CONFIG_STATIC_SHM
     unsigned long nr_shm_domain;
+    uint8_t shm_id ; /* ID identifier of a static shared memory bank. */
 #endif
 };
 
-- 
2.25.1



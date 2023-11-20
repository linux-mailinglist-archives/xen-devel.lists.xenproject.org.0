Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5D7F0AB5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636365.991818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRV-00026O-4m; Mon, 20 Nov 2023 02:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636365.991818; Mon, 20 Nov 2023 02:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRU-00023Y-W0; Mon, 20 Nov 2023 02:55:20 +0000
Received: by outflank-mailman (input) for mailman id 636365;
 Mon, 20 Nov 2023 02:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRT-00081B-Fv
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3ceb8858-8750-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 03:55:18 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12C541042;
 Sun, 19 Nov 2023 18:56:04 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E0F83F6C4;
 Sun, 19 Nov 2023 18:55:15 -0800 (PST)
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
X-Inumbo-ID: 3ceb8858-8750-11ee-98df-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 08/17] xen/arm: introduce a helper to parse device tree memory node
Date: Mon, 20 Nov 2023 10:54:22 +0800
Message-Id: <20231120025431.14845-9-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Memory blocks' NUMA ID information is stored in device tree's
memory nodes as "numa-node-id". We need a new helper to parse
and verify this ID from memory nodes.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5 -> v6:
- Rebase on top of staging without code changes.
v1 -> v5:
- Fix coding style: printk variable type and label indented.
- Move numa_disabled check to fdt_parse_numa_memory_node.
- Use numa_bad to replace bad_srat.
- Replace tabs by spaces.
- Align parameters.
- return ENODATA for a normal dtb without numa info.
- Use node id as dummy PXM for numa_update_node_memblks.
---
 xen/arch/arm/numa-dt.c | 89 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/xen/arch/arm/numa-dt.c b/xen/arch/arm/numa-dt.c
index 83601c83e7..cebc7e4300 100644
--- a/xen/arch/arm/numa-dt.c
+++ b/xen/arch/arm/numa-dt.c
@@ -34,6 +34,26 @@ static int __init fdt_numa_processor_affinity_init(nodeid_t node)
     return 0;
 }
 
+/* Callback for parsing of the memory regions affinity */
+static int __init fdt_numa_memory_affinity_init(nodeid_t node,
+                                                paddr_t start, paddr_t size)
+{
+    if ( !numa_memblks_available() )
+    {
+        dprintk(XENLOG_WARNING,
+                "Too many NUMA entries, try bigger NR_NODE_MEMBLKS\n");
+        return -EINVAL;
+    }
+
+    numa_fw_nid_name = "numa-node-id";
+    if ( !numa_update_node_memblks(node, node, start, size, false) )
+        return -EINVAL;
+
+    device_tree_numa = DT_NUMA_ON;
+
+    return 0;
+}
+
 /* Parse CPU NUMA node info */
 static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
 {
@@ -62,3 +82,72 @@ static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
 
     return fdt_numa_processor_affinity_init(nid);
 }
+
+/* Parse memory node NUMA info */
+static int __init fdt_parse_numa_memory_node(const void *fdt, int node,
+                                             const char *name,
+                                             unsigned int addr_cells,
+                                             unsigned int size_cells)
+{
+    unsigned int nid;
+    int ret = 0, len;
+    paddr_t addr, size;
+    const struct fdt_property *prop;
+    unsigned int idx, ranges;
+    const __be32 *addresses;
+
+    if ( numa_disabled() )
+        return -EINVAL;
+
+    /*
+     * device_tree_get_u32 will return NUMA_NO_NODE when this memory
+     * DT node doesn't have numa-node-id. This can help us to
+     * distinguish a bad DTB and a normal DTB without NUMA info.
+     */
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", NUMA_NO_NODE);
+    if ( node == NUMA_NO_NODE )
+    {
+        numa_fw_bad();
+        return -ENODATA;
+    }
+    else if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
+        goto invalid_data;
+    }
+
+    prop = fdt_get_property(fdt, node, "reg", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "fdt: node `%s': missing `reg' property\n", name);
+        goto invalid_data;
+    }
+
+    addresses = (const __be32 *)prop->data;
+    ranges = len / (sizeof(__be32)* (addr_cells + size_cells));
+    for ( idx = 0; idx < ranges; idx++ )
+    {
+        device_tree_get_reg(&addresses, addr_cells, size_cells, &addr, &size);
+        /* Skip zero size ranges */
+        if ( !size )
+            continue;
+
+        ret = fdt_numa_memory_affinity_init(nid, addr, size);
+        if ( ret )
+            goto invalid_data;
+    }
+
+    if ( idx == 0 )
+    {
+        printk(XENLOG_ERR
+               "bad property in memory node, idx=%u ret=%d\n", idx, ret);
+        goto invalid_data;
+    }
+
+    return 0;
+
+ invalid_data:
+    numa_fw_bad();
+    return -EINVAL;
+}
-- 
2.25.1



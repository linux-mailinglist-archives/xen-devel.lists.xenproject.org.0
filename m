Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7297F0AB6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636371.991827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRc-0002t1-Cw; Mon, 20 Nov 2023 02:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636371.991827; Mon, 20 Nov 2023 02:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRc-0002pk-9Y; Mon, 20 Nov 2023 02:55:28 +0000
Received: by outflank-mailman (input) for mailman id 636371;
 Mon, 20 Nov 2023 02:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRb-0007WE-NI
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4150dff3-8750-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 03:55:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77CE51042;
 Sun, 19 Nov 2023 18:56:11 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3AA53F6C4;
 Sun, 19 Nov 2023 18:55:22 -0800 (PST)
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
X-Inumbo-ID: 4150dff3-8750-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 10/17] xen/arm: unified entry to parse all NUMA data from device tree
Date: Mon, 20 Nov 2023 10:54:24 +0800
Message-Id: <20231120025431.14845-11-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

In this function, we scan the whole device tree to parse CPU node id,
memory node id and distance-map. Though early_scan_node will invoke
a handler to process memory nodes. If we want to parse memory node id
in that handler, we have to embed NUMA parse code in that handler.
But we still need to scan whole device tree to find CPU NUMA id and
distance-map. In this case, we include memory NUMA id parse in this
function too. Another benefit is that we have a unique entry for device
tree NUMA data parse.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5 -> v6:
- Rebase on top of staging without code changes.
v1 -> v5:
- Fix typos in commit message.
- Fix code style and align parameters.
- Use strncmp to replace memcmp.
---
 xen/arch/arm/include/asm/numa.h |  1 +
 xen/arch/arm/numa-dt.c          | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 2987158d16..15308f5a36 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -44,6 +44,7 @@ extern bool numa_disabled(void);
 extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
 extern void numa_detect_cpu_node(unsigned int cpu);
+extern int numa_device_tree_init(const void *fdt);
 
 #else
 
diff --git a/xen/arch/arm/numa-dt.c b/xen/arch/arm/numa-dt.c
index 2fb6663e08..8198a0da2e 100644
--- a/xen/arch/arm/numa-dt.c
+++ b/xen/arch/arm/numa-dt.c
@@ -267,3 +267,33 @@ static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
     numa_fw_bad();
     return -EINVAL;
 }
+
+static int __init fdt_scan_numa_nodes(const void *fdt, int node,
+                                      const char *uname, int depth,
+                                      unsigned int address_cells,
+                                      unsigned int size_cells, void *data)
+{
+    int len, ret = 0;
+    const void *prop;
+
+    prop = fdt_getprop(fdt, node, "device_type", &len);
+    if ( prop )
+    {
+        if ( strncmp(prop, "cpu", len) == 0 )
+            ret = fdt_parse_numa_cpu_node(fdt, node);
+        else if ( strncmp(prop, "memory", len) == 0 )
+            ret = fdt_parse_numa_memory_node(fdt, node, uname,
+                                address_cells, size_cells);
+    }
+    else if ( fdt_node_check_compatible(fdt, node,
+                                        "numa-distance-map-v1") == 0 )
+        ret = fdt_parse_numa_distance_map_v1(fdt, node);
+
+    return ret;
+}
+
+/* Initialize NUMA from device tree */
+int __init numa_device_tree_init(const void *fdt)
+{
+    return device_tree_for_each_node(fdt, 0, fdt_scan_numa_nodes, NULL);
+}
-- 
2.25.1



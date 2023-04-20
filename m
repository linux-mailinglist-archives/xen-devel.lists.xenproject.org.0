Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62016E9272
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524057.814662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSQc-0001ln-QS; Thu, 20 Apr 2023 11:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524057.814662; Thu, 20 Apr 2023 11:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSQc-0001cU-Ls; Thu, 20 Apr 2023 11:26:18 +0000
Received: by outflank-mailman (input) for mailman id 524057;
 Thu, 20 Apr 2023 11:26:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE5v=AL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppSQb-0006GU-9N
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:26:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 295bbe74-df6e-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:26:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92C8D1480;
 Thu, 20 Apr 2023 04:26:58 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 589843F587;
 Thu, 20 Apr 2023 04:26:12 -0700 (PDT)
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
X-Inumbo-ID: 295bbe74-df6e-11ed-8611-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 10/17] xen/arm: unified entry to parse all NUMA data from device tree
Date: Thu, 20 Apr 2023 19:25:14 +0800
Message-Id: <20230420112521.3272732-11-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420112521.3272732-1-Henry.Wang@arm.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
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
v2 -> v3:
1. No change.
v1 -> v2:
1. Fix typos in commit message.
2. Fix code style and align parameters.
3. Use strncmp to replace memcmp.
---
 xen/arch/arm/include/asm/numa.h |  1 +
 xen/arch/arm/numa_device_tree.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index fe1bf4251f..a2b4f6cc10 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -45,6 +45,7 @@ extern bool numa_disabled(void);
 extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
 extern void numa_detect_cpu_node(unsigned int cpu);
+extern int numa_device_tree_init(const void *fdt);
 
 #else
 
diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 718afca826..a7dc58188e 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -258,3 +258,33 @@ invalid_data:
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



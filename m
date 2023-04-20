Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5F6E9269
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524034.814600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSQC-0007Dr-MR; Thu, 20 Apr 2023 11:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524034.814600; Thu, 20 Apr 2023 11:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSQC-0007AV-Ir; Thu, 20 Apr 2023 11:25:52 +0000
Received: by outflank-mailman (input) for mailman id 524034;
 Thu, 20 Apr 2023 11:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE5v=AL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppSQB-0006Vv-20
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:25:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1a488df7-df6e-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:25:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F8CE1516;
 Thu, 20 Apr 2023 04:26:33 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A49843F587;
 Thu, 20 Apr 2023 04:25:45 -0700 (PDT)
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
X-Inumbo-ID: 1a488df7-df6e-11ed-b21f-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Date: Thu, 20 Apr 2023 19:25:07 +0800
Message-Id: <20230420112521.3272732-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420112521.3272732-1-Henry.Wang@arm.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

We will parse NUMA nodes distances from device tree. So we need
a matrix to record the distances between any two nodes we parsed.
Accordingly, we provide this node_set_distance API for device tree
NUMA to set the distance for any two nodes in this patch. When
NUMA initialization failed, __node_distance will return
NUMA_REMOTE_DISTANCE, this will help us avoid doing rollback
for distance maxtrix when NUMA initialization failed.

As both x86 and Arm have implemented __node_distance, so we move
its definition from asm/numa.h to xen/numa.h. At same time, the
outdated u8 return value of x86 has been changed to unsigned char.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v3:
1. Use __ro_after_init for node_distance_map.
2. Correct format of if condition identation in numa_set_distance().
3. Drop the unnecessary change to the year of copyright.
4. Use ARRAY_SIZE() to determine node_distance_map's row, column size.
v1 -> v2:
1. Use unsigned int/char instead of uint32_t/u8.
2. Re-org the commit message.
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h | 13 +++++++++
 xen/arch/arm/numa.c             | 52 +++++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/numa.h |  1 -
 xen/arch/x86/srat.c             |  2 +-
 xen/include/xen/numa.h          |  1 +
 6 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4d076b278b..9073398d6e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 83f60ad05b..123a1a8dd0 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -22,7 +22,20 @@ typedef u8 nodeid_t;
  */
 #define NR_NODE_MEMBLKS NR_MEM_BANKS
 
+/*
+ * In ACPI spec, 0-9 are the reserved values for node distance,
+ * 10 indicates local node distance, 20 indicates remote node
+ * distance. Set node distance map in device tree will follow
+ * the ACPI's definition.
+ */
+#define NUMA_DISTANCE_UDF_MIN   0
+#define NUMA_DISTANCE_UDF_MAX   9
+#define NUMA_LOCAL_DISTANCE     10
+#define NUMA_REMOTE_DISTANCE    20
+
 extern bool numa_disabled(void);
+extern void numa_set_distance(nodeid_t from, nodeid_t to,
+                              unsigned int distance);
 
 #else
 
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index eb5d0632cb..c5ef81aad3 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -28,6 +28,11 @@ enum dt_numa_status {
 
 static enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
 
+static unsigned char __ro_after_init
+node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
+    { 0 }
+};
+
 void __init numa_fw_bad(void)
 {
     printk(KERN_ERR "NUMA: device tree numa info table not used.\n");
@@ -48,3 +53,50 @@ int __init arch_numa_setup(const char *opt)
 {
     return -EINVAL;
 }
+
+void __init numa_set_distance(nodeid_t from, nodeid_t to,
+                              unsigned int distance)
+{
+    if ( from >= ARRAY_SIZE(node_distance_map) ||
+         to >= ARRAY_SIZE(node_distance_map[0]) )
+    {
+        printk(KERN_WARNING
+               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8" MAX=%"PRIu8"\n",
+               from, to, MAX_NUMNODES);
+        return;
+    }
+
+    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
+    if ( distance >= NUMA_NO_DISTANCE ||
+         (distance >= NUMA_DISTANCE_UDF_MIN &&
+          distance <= NUMA_DISTANCE_UDF_MAX) ||
+         (from == to && distance != NUMA_LOCAL_DISTANCE) )
+    {
+        printk(KERN_WARNING
+               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8" distance=%"PRIu32"\n",
+               from, to, distance);
+        return;
+    }
+
+    node_distance_map[from][to] = distance;
+}
+
+unsigned char __node_distance(nodeid_t from, nodeid_t to)
+{
+    /* When NUMA is off, any distance will be treated as remote. */
+    if ( numa_disabled() )
+        return NUMA_REMOTE_DISTANCE;
+
+    /*
+     * Check whether the nodes are in the matrix range.
+     * When any node is out of range, except from and to nodes are the
+     * same, we treat them as unreachable (return 0xFF)
+     */
+    if ( from >= ARRAY_SIZE(node_distance_map) ||
+         to >= ARRAY_SIZE(node_distance_map[0]) )
+        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
+
+    return node_distance_map[from][to];
+}
+
+EXPORT_SYMBOL(__node_distance);
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 7866afa408..45456ac441 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -22,7 +22,6 @@ extern void init_cpu_to_node(void);
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 void srat_parse_regions(paddr_t addr);
-extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
 #endif
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 56749ddca5..50faf5d352 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -328,7 +328,7 @@ unsigned int numa_node_to_arch_nid(nodeid_t n)
 	return 0;
 }
 
-u8 __node_distance(nodeid_t a, nodeid_t b)
+unsigned char __node_distance(nodeid_t a, nodeid_t b)
 {
 	unsigned index;
 	u8 slit_val;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index b86d0851fc..8356e47b61 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -114,6 +114,7 @@ extern bool numa_memblks_available(void);
 extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
                                      paddr_t start, paddr_t size, bool hotplug);
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
+extern unsigned char __node_distance(nodeid_t a, nodeid_t b);
 
 #else
 
-- 
2.25.1



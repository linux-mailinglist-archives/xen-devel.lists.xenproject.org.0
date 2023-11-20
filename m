Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F77F0AB4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636364.991807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRS-0001iN-QY; Mon, 20 Nov 2023 02:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636364.991807; Mon, 20 Nov 2023 02:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRS-0001ge-Lw; Mon, 20 Nov 2023 02:55:18 +0000
Received: by outflank-mailman (input) for mailman id 636364;
 Mon, 20 Nov 2023 02:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRQ-0007WE-T3
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3aba77dd-8750-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 03:55:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AF451042;
 Sun, 19 Nov 2023 18:56:00 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D65DF3F6C4;
 Sun, 19 Nov 2023 18:55:11 -0800 (PST)
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
X-Inumbo-ID: 3aba77dd-8750-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 07/17] xen/arm: introduce a helper to parse device tree processor node
Date: Mon, 20 Nov 2023 10:54:21 +0800
Message-Id: <20231120025431.14845-8-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Processor NUMA ID information is stored in device tree's processor
node as "numa-node-id". We need a new helper to parse this ID from
processor node. If we get this ID from processor node, this ID's
validity still need to be checked. Once we got a invalid NUMA ID
from any processor node, the device tree will be marked as NUMA
information invalid.

Since new helpers need to know the NUMA status, move the
enum dt_numa_status to the Arm NUMA header.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5 -> v6:
- Rebase on top of staging without code changes.
v3 -> v5:
- Rename "numa_device_tree.c" to "numa-dt.c".
v2 -> v3:
- Move the enum dt_numa_status to the Arm NUMA header.
- Update the year in copyright to 2023.
v1 -> v2:
- Move numa_disabled from fdt_numa_processor_affinity_init
  to fdt_parse_numa_cpu_node.
- Move invalid NUMA id check to fdt_parse_numa_cpu_node.
- Return ENODATA for normal dtb without NUMA info.
- Use NUMA status helpers instead of SRAT functions.
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h |  8 +++++
 xen/arch/arm/numa-dt.c          | 64 +++++++++++++++++++++++++++++++++
 xen/arch/arm/numa.c             |  8 +----
 4 files changed, 74 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/arm/numa-dt.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 86e0e47e22..6a4e7814b8 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -39,6 +39,7 @@ obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa-dt.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index b04ace26db..2987158d16 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -22,6 +22,14 @@ typedef u8 nodeid_t;
  */
 #define NR_NODE_MEMBLKS NR_MEM_BANKS
 
+enum dt_numa_status {
+    DT_NUMA_DEFAULT,
+    DT_NUMA_ON,
+    DT_NUMA_OFF,
+};
+
+extern enum dt_numa_status device_tree_numa;
+
 /*
  * In ACPI spec, 0-9 are the reserved values for node distance,
  * 10 indicates local node distance, 20 indicates remote node
diff --git a/xen/arch/arm/numa-dt.c b/xen/arch/arm/numa-dt.c
new file mode 100644
index 0000000000..83601c83e7
--- /dev/null
+++ b/xen/arch/arm/numa-dt.c
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Arm Architecture support layer for device tree NUMA.
+ *
+ * Copyright (C) 2023 Arm Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/device_tree.h>
+
+/* Callback for device tree processor affinity */
+static int __init fdt_numa_processor_affinity_init(nodeid_t node)
+{
+    numa_set_processor_nodes_parsed(node);
+    device_tree_numa = DT_NUMA_ON;
+
+    printk(KERN_INFO "DT: NUMA node %"PRIu8" processor parsed\n", node);
+
+    return 0;
+}
+
+/* Parse CPU NUMA node info */
+static int __init fdt_parse_numa_cpu_node(const void *fdt, int node)
+{
+    unsigned int nid;
+
+    if ( numa_disabled() )
+        return -EINVAL;
+
+    /*
+     * device_tree_get_u32 will return NUMA_NO_NODE when this CPU
+     * DT node doesn't have numa-node-id. This can help us to
+     * distinguish a bad DTB and a normal DTB without NUMA info.
+     */
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", NUMA_NO_NODE);
+    if ( nid == NUMA_NO_NODE )
+    {
+        numa_fw_bad();
+        return -ENODATA;
+    }
+    else if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_ERR "DT: CPU NUMA node id %u is invalid\n", nid);
+        numa_fw_bad();
+        return -EINVAL;
+    }
+
+    return fdt_numa_processor_affinity_init(nid);
+}
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index b5a87531f7..08e15ebbb0 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -20,13 +20,7 @@
 #include <xen/init.h>
 #include <xen/numa.h>
 
-enum dt_numa_status {
-    DT_NUMA_DEFAULT,
-    DT_NUMA_ON,
-    DT_NUMA_OFF,
-};
-
-static enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
+enum dt_numa_status __ro_after_init device_tree_numa = DT_NUMA_DEFAULT;
 
 static unsigned char __ro_after_init
 node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
-- 
2.25.1



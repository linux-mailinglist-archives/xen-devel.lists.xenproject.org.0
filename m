Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB44D21E4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287474.487576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoG-0008CX-JS; Tue, 08 Mar 2022 19:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287474.487576; Tue, 08 Mar 2022 19:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoG-00086L-3c; Tue, 08 Mar 2022 19:47:52 +0000
Received: by outflank-mailman (input) for mailman id 287474;
 Tue, 08 Mar 2022 19:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfoD-0004Df-Ui
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2d93f8-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:47 +0100 (CET)
Received: from DS7PR06CA0035.namprd06.prod.outlook.com (2603:10b6:8:54::9) by
 DM6PR02MB6122.namprd02.prod.outlook.com (2603:10b6:5:1f9::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Tue, 8 Mar 2022 19:47:41 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::4) by DS7PR06CA0035.outlook.office365.com
 (2603:10b6:8:54::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:41 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:23 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:23 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnn-000Cws-QH; Tue, 08 Mar 2022 11:47:23 -0800
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
X-Inumbo-ID: 9f2d93f8-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5TNxbQUIim6w3W4ZjYPL66AY59IwxnlczCY/GUo+Bn/xpow9ncfSFFq61lCNJD/G2wKiWVXw2JuJgNkGx46cajke2+ataR8Ahf6x3DiHhL7f6b94w837KfvyI6FPYCcQopv3+29g0JHwKfUb3s4jIaOfCFKjv1I1R6NkvfzOu7rnfO8fax+vdvfUFWGriCUD4yRyKlMyzFoI5RCFHNRx5rEQhGG7Oy8BDDnPO6LPEQx/o5xQTbBsmM2HJd9Ceopa3f6R/lV7t6cX1Ycub2MSHieISpjAJ6aDgTqsJ2qnmkjAbFb7gdjhu4UlvQaMK/bXmn2CwS02njAFYQTSdX1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bEthf9q3/3acjkmaRhHs4J03T9SMN4B3DkYAhksGq4=;
 b=cvfeK9x+rJ79ff/TRqqyZw4ILx4dg9xZjJqjidL8yigiEVHOiRuJoICD1NrYYsF+1tTSCWofQnaq3TkiTdyZbBhfsaA3Hz+g6t4bTUHlOUlwCOjSuKKbDGEeHMMgGpAnF+iCD91nKhawJNj/risV46FmSgfhJn4iVK30rs4z8gvLBx8we0iQl8DTDgguGRPLo65LK5XLJF9r1OaU3ZjTOg8Dpbk+LOhTlRFggtZmqt3mqDoOW/OVACGtnLNAKMI70OHY8TKfeyvfuL0Ube1FPKmUb0S3+VX73aZRcCQAqvT8Abgmk5P+hkY4wO3xP3w6a0qZKXBU2MZ+6MhadB/B1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bEthf9q3/3acjkmaRhHs4J03T9SMN4B3DkYAhksGq4=;
 b=tFDJlqmoHgmPswEjQ8goO1uuTd73Wn2he5+v+ZDN2y0hYG3Afeoyz2eKOMBTcUWyXcjI60nJjPL+w9FfvUd4XJBA3ZzyLYr/Mn9ygMDjAwzKbPwl2QIxhIrya/gySLtxZoYSjWp/A7m6Wj7zYHlzPL6vxx+LDS195kZOr2dnpkQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node removal functionalities
Date: Tue, 8 Mar 2022 11:47:00 -0800
Message-ID: <20220308194704.14061-11-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fa4e145-f812-4fbd-b479-08da013c81ae
X-MS-TrafficTypeDiagnostic: DM6PR02MB6122:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB612216B5AA44F177C95108D9BC099@DM6PR02MB6122.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mf5LzJTTJZ2O8XSrWgeyASXIF+JIcFSiy7sVHtrQs0qrEC6ymbhLD1OqdZb3ka342fe/SriSvvy+tUpl8JmAA1VVGUOIznuau3HnEJ+8P4CIPFR+/2UsHfZCuz+Z/HLG1+L/Ug1afLU7qXXkH9DPjzqKBR8LzPJ+ylxw/x9Cnk9zLgi5bT+SS4p/ORgMbDPsY6OAgS8xmFR+8ZEKu6Qwc7hohB9rFkhjDrdUZ1wC8s07gbp2+CBKcr4JGL387l6SbiNonte/aDvsCZHjw4DAwpe8j7+HGzMYrsrHE9ud0qxhxPrkucmSADsMTjBQ+3e5FH6UActMe4k3i+BGvxvuOXZeqhunsnbuw/peUNgLa64o+clTqw+dW9jDsDHmkj6WmQyvA6H93SOLeRmrVn8TdXob6glBtczSnNIy8eMN8/oKFdvb4naRIl1AtGNNP5bSE/7vlCJZ7BNe9fZNJszswksWki5qn8yy1dluMVVHzglUcqtutvANI9L4arQiDHlmyMVOiGONOtqJNRxkN6wHeV5ESdRmKVZPHwyeC4DZC95MuQIq2s20PaZn2Oyao0fyi8000BLmMRhzWnGz72ZEYD5M1c0dd3gLQjsXkMfz71MvhyLzQu/n1Z2vVi4hYtNgTBHyQ6U7qKoP9QATQkNOulNRIKUCT748DMRwLasDkydhr/UbMkaeodSu9YVrkPgS81XI4K6bhaTjC9ppl946HCWmtlBfwG47RqJeB/uhBxu7CpCzHAV09oS+lmBD5ni3
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(8676002)(336012)(426003)(26005)(30864003)(47076005)(316002)(7636003)(186003)(6916009)(82310400004)(5660300002)(54906003)(8936002)(70206006)(70586007)(1076003)(7696005)(36756003)(2616005)(356005)(36860700001)(508600001)(40460700003)(83380400001)(2906002)(6666004)(9786002)(102446001)(403724002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:41.0784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa4e145-f812-4fbd-b479-08da013c81ae
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6122

Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
device tree overlay.

xl overlay remove file.dtbo:
    Removes all the nodes in a given dtbo.
    First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
    in dt_host and delete the device node entries from dt_host.

    The nodes get removed only if it is not used by any of dom0 or domio.

Also, added overlay_track struct to keep the track of added node through device
tree overlay. overlay_track has dt_host_new which is unflattened form of updated
fdt and name of overlay nodes. When a node is removed, we also free the memory
used by overlay_track for the particular overlay node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/Makefile          |   1 +
 xen/common/dt_overlay.c      | 447 +++++++++++++++++++++++++++++++++++
 xen/common/sysctl.c          |  10 +
 xen/include/public/sysctl.h  |  18 ++
 xen/include/xen/dt_overlay.h |  47 ++++
 5 files changed, 523 insertions(+)
 create mode 100644 xen/common/dt_overlay.c
 create mode 100644 xen/include/xen/dt_overlay.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index dc8d3a13f5..2eb5734f8e 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -54,6 +54,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-$(CONFIG_XENOPROF) += xenoprof.o
 obj-y += xmalloc_tlsf.o
+obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
 
 obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
 
diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
new file mode 100644
index 0000000000..fcb31de495
--- /dev/null
+++ b/xen/common/dt_overlay.c
@@ -0,0 +1,447 @@
+/*
+ * xen/common/dt_overlay.c
+ *
+ * Device tree overlay support in Xen.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * Written by Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <xen/iocap.h>
+#include <xen/xmalloc.h>
+#include <asm/domain_build.h>
+#include <xen/dt_overlay.h>
+#include <xen/guest_access.h>
+
+static LIST_HEAD(overlay_tracker);
+static DEFINE_SPINLOCK(overlay_lock);
+
+static int dt_overlay_remove_node(struct dt_device_node *device_node)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *parent_node;
+    struct dt_device_node *current_node;
+
+    parent_node = device_node->parent;
+
+    current_node = parent_node;
+
+    if ( parent_node == NULL )
+    {
+        dt_dprintk("%s's parent node not found\n", device_node->name);
+        return -EFAULT;
+    }
+
+    np = parent_node->child;
+
+    if ( np == NULL )
+    {
+        dt_dprintk("parent node %s's not found\n", parent_node->name);
+        return -EFAULT;
+    }
+
+    /* If node to be removed is only child node or first child. */
+    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
+    {
+        current_node->allnext = np->allnext;
+
+        /* If node is first child but not the only child. */
+        if ( np->sibling != NULL )
+            current_node->child = np->sibling;
+        else
+            /* If node is only child. */
+            current_node->child = NULL;
+        return 0;
+    }
+
+    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+    {
+        current_node = np;
+        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
+        {
+            /* Found the node. Now we remove it. */
+            current_node->allnext = np->allnext->allnext;
+
+            if ( np->sibling->sibling )
+                current_node->sibling = np->sibling->sibling;
+            else
+                current_node->sibling = NULL;
+
+            break;
+        }
+    }
+
+    return 0;
+}
+
+/* Basic sanity check for the dtbo tool stack provided to Xen. */
+static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
+{
+    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
+          fdt_check_header(overlay_fdt) )
+    {
+        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device Tree\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static unsigned int overlay_node_count(void *fdto)
+{
+    unsigned int num_overlay_nodes = 0;
+    int fragment;
+
+    fdt_for_each_subnode(fragment, fdto, 0)
+    {
+
+        int subnode;
+        int overlay;
+
+        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+
+        /*
+         * Overlay value can be < 0. But fdt_for_each_subnode() loop checks for
+         * overlay >= 0. So, no need for a overlay>=0 check here.
+         */
+
+        fdt_for_each_subnode(subnode, fdto, overlay)
+        {
+            num_overlay_nodes++;
+        }
+    }
+
+    return num_overlay_nodes;
+}
+
+/*
+ * overlay_get_nodes_info will get the all node's full name with path. This is
+ * useful when checking node for duplication i.e. dtbo tries to add nodes which
+ * already exists in device tree.
+ */
+static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_path,
+                                  unsigned int num_overlay_nodes)
+{
+    int fragment;
+    unsigned int node_num = 0;
+
+    *nodes_full_path = xmalloc_bytes(num_overlay_nodes * sizeof(char *));
+
+    if ( *nodes_full_path == NULL )
+        return -ENOMEM;
+    memset(*nodes_full_path, 0x0, num_overlay_nodes * sizeof(char *));
+
+    fdt_for_each_subnode(fragment, fdto, 0)
+    {
+        int target;
+        int overlay;
+        int subnode;
+        const char *target_path;
+
+        target = fdt_overlay_target_offset(device_tree_flattened, fdto,
+                                           fragment, &target_path);
+        if ( target < 0 )
+            return target;
+
+        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+
+        /*
+         * Overlay value can be < 0. But fdt_for_each_subnode() loop checks for
+         * overlay >= 0. So, no need for a overlay>=0 check here.
+         */
+        fdt_for_each_subnode(subnode, fdto, overlay)
+        {
+            const char *node_name = NULL;
+            unsigned int node_name_len = 0;
+            unsigned int target_path_len = strlen(target_path);
+            unsigned int node_full_name_len = 0;
+
+            node_name = fdt_get_name(fdto, subnode, &node_name_len);
+
+            if ( node_name == NULL )
+                return -EINVAL;
+
+            /*
+             * Magic number 2 is for adding '/'. This is done to keep the
+             * node_full_name in the correct full node name format.
+             */
+            node_full_name_len = target_path_len + node_name_len + 2;
+
+            (*nodes_full_path)[node_num] = xmalloc_bytes(node_full_name_len);
+
+            if ( (*nodes_full_path)[node_num] == NULL )
+                return -ENOMEM;
+
+            memcpy((*nodes_full_path)[node_num], target_path, target_path_len);
+
+            (*nodes_full_path)[node_num][target_path_len] = '/';
+
+            memcpy((*nodes_full_path)[node_num] + target_path_len + 1, node_name,
+                   node_name_len);
+
+            (*nodes_full_path)[node_num][node_full_name_len - 1] = '\0';
+
+            node_num++;
+        }
+    }
+
+    return 0;
+}
+
+/* Remove nodes from dt_host. */
+static int remove_nodes(char **full_dt_node_path, int **nodes_irq,
+                        int *node_num_irq, unsigned int num_nodes)
+{
+    struct domain *d = hardware_domain;
+    int rc = 0;
+    struct dt_device_node *overlay_node;
+    unsigned int naddr;
+    unsigned int i, j, nirq;
+    u64 addr, size;
+    domid_t domid = 0;
+
+    for ( j = 0; j < num_nodes; j++ )
+    {
+        dt_dprintk("Finding node %s in the dt_host\n", full_dt_node_path[j]);
+
+        overlay_node = dt_find_node_by_path(full_dt_node_path[j]);
+
+        if ( overlay_node == NULL )
+        {
+            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
+                   full_dt_node_path[j]);
+            return -EINVAL;
+        }
+
+        domid = dt_device_used_by(overlay_node);
+
+        dt_dprintk("Checking if node %s is used by any domain\n",
+                   full_dt_node_path[j]);
+
+        /* Remove the node iff it's assigned to domain 0 or domain io. */
+        if ( domid != 0 && domid != DOMID_IO )
+        {
+            printk(XENLOG_ERR "Device %s as it is being used by domain %d. Removing nodes failed\n",
+                   full_dt_node_path[j], domid);
+            return -EINVAL;
+        }
+
+        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
+
+        nirq = node_num_irq[j];
+
+        /* Remove IRQ permission */
+        for ( i = 0; i < nirq; i++ )
+        {
+            rc = nodes_irq[j][i];
+            /*
+             * TODO: We don't handle shared IRQs for now. So, it is assumed that
+             * the IRQs was not shared with another domain.
+             */
+            rc = irq_deny_access(d, rc);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
+                       i, dt_node_full_name(overlay_node));
+                return rc;
+            }
+        }
+
+        rc = iommu_remove_dt_device(overlay_node);
+        if ( rc != 0 && rc != -ENXIO )
+            return rc;
+
+        naddr = dt_number_of_address(overlay_node);
+
+        /* Remove mmio access. */
+        for ( i = 0; i < naddr; i++ )
+        {
+            rc = dt_device_get_address(overlay_node, i, &addr, &size);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                       i, dt_node_full_name(overlay_node));
+                return rc;
+            }
+
+            rc = iomem_deny_access(d, paddr_to_pfn(addr),
+                                   paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
+            if ( rc )
+            {
+                printk(XENLOG_ERR "Unable to remove dom%d access to"
+                        " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                        d->domain_id,
+                        addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
+                return rc;
+            }
+        }
+
+        rc = dt_overlay_remove_node(overlay_node);
+        if ( rc )
+            return rc;
+    }
+
+    return rc;
+}
+
+/*
+ * First finds the device node to remove. Check if the device is being used by
+ * any dom and finally remove it from dt_host. IOMMU is already being taken care
+ * while destroying the domain.
+ */
+static long handle_remove_overlay_nodes(char **full_dt_nodes_path,
+                                        unsigned int num_nodes)
+{
+    int rc = 0;
+    struct overlay_track *entry, *temp, *track;
+    bool found_entry = false;
+    unsigned int i;
+
+    spin_lock(&overlay_lock);
+
+    /*
+     * First check if dtbo is correct i.e. it should one of the dtbo which was
+     * used when dynamically adding the node.
+     * Limitation: Cases with same node names but different property are not
+     * supported currently. We are relying on user to provide the same dtbo
+     * as it was used when adding the nodes.
+     */
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        /* Checking the num of nodes first. If not same skip to next entry. */
+        if ( num_nodes == entry->num_nodes )
+        {
+            for ( i = 0; i < num_nodes; i++ )
+            {
+                if ( strcmp(full_dt_nodes_path[i], entry->nodes_fullname[i]) )
+                {
+                    /* Node name didn't match. Skip to next entry. */
+                    break;
+                }
+            }
+
+            /* Found one tracker with all node name matching. */
+            track = entry;
+            found_entry = true;
+            break;
+        }
+    }
+
+    if ( found_entry == false )
+    {
+        rc = -EINVAL;
+
+        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
+               " Removing nodes is supported for only prior added dtbo. Please"
+               " provide a valid dtbo which was used to add the nodes.\n");
+        goto out;
+
+    }
+
+    rc = remove_nodes(full_dt_nodes_path, entry->nodes_irq, entry->node_num_irq,
+                      num_nodes);
+
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Removing node failed\n");
+        goto out;
+    }
+
+    list_del(&entry->entry);
+
+    for ( i = 0; i < entry->num_nodes && entry->nodes_fullname[i] != NULL; i++ )
+    {
+        xfree(entry->nodes_fullname[i]);
+    }
+    xfree(entry->nodes_fullname);
+    for ( i = 0; i < entry->num_nodes && entry->nodes_irq[i] != NULL; i++ )
+    {
+        xfree(entry->nodes_irq[i]);
+    }
+    xfree(entry->nodes_irq);
+    xfree(entry->node_num_irq);
+    xfree(entry->dt_host_new);
+    xfree(entry->fdt);
+    xfree(entry);
+
+out:
+    spin_unlock(&overlay_lock);
+    return rc;
+}
+
+long dt_sysctl(struct xen_sysctl *op)
+{
+    long ret = 0;
+    void *overlay_fdt;
+    char **nodes_full_path = NULL;
+    unsigned int num_overlay_nodes = 0;
+
+    if ( op->u.dt_overlay.overlay_fdt_size <= 0 )
+        return -EINVAL;
+
+    overlay_fdt = xmalloc_bytes(op->u.dt_overlay.overlay_fdt_size);
+
+    if ( overlay_fdt == NULL )
+        return -ENOMEM;
+
+    ret = copy_from_guest(overlay_fdt, op->u.dt_overlay.overlay_fdt,
+                         op->u.dt_overlay.overlay_fdt_size);
+    if ( ret )
+    {
+        gprintk(XENLOG_ERR, "copy from guest failed\n");
+        xfree(overlay_fdt);
+
+        return -EFAULT;
+    }
+
+    switch ( op->u.dt_overlay.overlay_op )
+    {
+    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
+        ret = check_overlay_fdt(overlay_fdt,
+                                op->u.dt_overlay.overlay_fdt_size);
+        if ( ret )
+        {
+            ret = -EFAULT;
+            break;
+        }
+
+        num_overlay_nodes = overlay_node_count(overlay_fdt);
+        if ( num_overlay_nodes == 0 )
+        {
+            ret = -ENOMEM;
+            break;
+        }
+
+        ret = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
+                                     num_overlay_nodes);
+        if ( ret )
+             break;
+
+        ret = handle_remove_overlay_nodes(nodes_full_path,
+                                          num_overlay_nodes);
+        break;
+
+    default:
+        break;
+    }
+
+    if ( nodes_full_path != NULL )
+    {
+        int i;
+        for ( i = 0; i < num_overlay_nodes && nodes_full_path[i] != NULL; i++ )
+        {
+            xfree(nodes_full_path[i]);
+        }
+        xfree(nodes_full_path);
+    }
+
+    return ret;
+}
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index fc4a0b31d6..d685c07159 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -29,6 +29,10 @@
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
 
+#ifdef CONFIG_OVERLAY_DTB
+#include <xen/dt_overlay.h>
+#endif
+
 long cf_check do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
     long ret = 0;
@@ -482,6 +486,12 @@ long cf_check do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             copyback = 1;
         break;
 
+#ifdef CONFIG_OVERLAY_DTB
+    case XEN_SYSCTL_overlay:
+        ret = dt_sysctl(op);
+        break;
+#endif
+
     default:
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 55252e97f2..e256aeb7c6 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1069,6 +1069,22 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
+#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
+
+/*
+ * XEN_SYSCTL_dt_overlay
+ * Performs addition/removal of device tree nodes under parent node using dtbo.
+ * This does in three steps:
+ *  - Adds/Removes the nodes from dt_host.
+ *  - Adds/Removes IRQ permission for the nodes.
+ *  - Adds/Removes MMIO accesses.
+ */
+struct xen_sysctl_dt_overlay {
+    XEN_GUEST_HANDLE_64(void) overlay_fdt;
+    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
+    uint8_t overlay_op; /* Add or remove. */
+};
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1099,6 +1115,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_dt_overlay                    30
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1129,6 +1146,7 @@ struct xen_sysctl {
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
+        struct xen_sysctl_dt_overlay        dt_overlay;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/dt_overlay.h b/xen/include/xen/dt_overlay.h
new file mode 100644
index 0000000000..525818b77c
--- /dev/null
+++ b/xen/include/xen/dt_overlay.h
@@ -0,0 +1,47 @@
+/*
+ * xen/common/dt_overlay.c
+ *
+ * Device tree overlay suppoert in Xen.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * Written by Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef __XEN_DT_SYSCTL_H__
+#define __XEN_DT_SYSCTL_H__
+
+#include <xen/list.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/device_tree.h>
+#include <public/sysctl.h>
+
+/*
+ * overlay_node_track describes information about added nodes through dtbo.
+ * @entry: List pointer.
+ * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
+ * @fdt: Stores the fdt.
+ * @nodes_fullname: Stores the full name of nodes.
+ * @nodes_irq: Stores the IRQ added from overlay dtb.
+ * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
+ * @num_nodes: Stores total number of nodes in overlay dtb.
+ */
+struct overlay_track {
+    struct list_head entry;
+    struct dt_device_node *dt_host_new;
+    void *fdt;
+    char **nodes_fullname;
+    int **nodes_irq;
+    int *node_num_irq;
+    unsigned int num_nodes;
+};
+
+long dt_sysctl(struct xen_sysctl *op);
+#endif
-- 
2.17.1



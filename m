Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790D44A751
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223706.386605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA1-0002xP-MJ; Tue, 09 Nov 2021 07:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223706.386605; Tue, 09 Nov 2021 07:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA1-0002iU-2U; Tue, 09 Nov 2021 07:03:13 +0000
Received: by outflank-mailman (input) for mailman id 223706;
 Tue, 09 Nov 2021 07:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9y-0008WR-9o
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e89::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e6771a-412b-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 08:03:08 +0100 (CET)
Received: from SN7PR04CA0027.namprd04.prod.outlook.com (2603:10b6:806:f2::32)
 by CH0PR02MB8044.namprd02.prod.outlook.com (2603:10b6:610:109::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 9 Nov
 2021 07:03:04 +0000
Received: from SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::d4) by SN7PR04CA0027.outlook.office365.com
 (2603:10b6:806:f2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:04 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0031.mail.protection.outlook.com (10.97.4.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:49 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:49 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9d-000Ga6-3A; Mon, 08 Nov 2021 23:02:49 -0800
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
X-Inumbo-ID: 16e6771a-412b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLKTknKUGdV3u1bhtKqciqvKEMP7s69m4HNBPHGQIROUB89SHBEshxFBqTKLTA2HP+nZicVrArr/XSDaRuZCurC5/SDd/W+iTwwala50FPMI9imZ0dnAIweVCoZDeq1emrWYup3BTczFX+oZKVtKKthsx/wzXC+sVojOQOcYMZf+R09spsAfA5bIWn5PwVZZq15Bc8SW3XzRO93Tc6D756oN0qvHzswe/7kAy/MJUPylit2eIBk6ZSaO69TBlSYyz4rexx9y8aAxhHY9zwDA6OTv8IN8HnsiZ+QXQZFxYyECLTC3S/kwjH0EQRkQd3nmTgjcfIRnU5jFeRnuIR4QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hD5keOeFhUtsoqEKF+D/RnMWmS5ZQuiG1eIV46VPO5I=;
 b=S28iiMACvtbTsTKg84ZaiXVgLuBW0b/jQIoiqt9EASW0pdTKcbhnFnmh43VnJzl2wEZILRVZbtT7OcADKtvFzTg3xlfRQxVSp9/yFTKdAi8P++d1a7f0KSYHpoC3G0413NVy1RsXdpWML37SfyWCk3KKDw0L0toLnzE9io89itJ7eg2OBo4xGBTH3/YBsaTcEOgTq5pNUqekyo8bciwcW+xN4QtZE1ClNVf4JNVPAoncHG/Y0Z4oPVr7aVZKkur1dubR5mC+krEXEcisblhxqzeAy3n84KB/DgFsu1MgHSOM90kP5ZVVYoxQPn9VOOJdyT0T/GAOifyAnWZKaFOfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD5keOeFhUtsoqEKF+D/RnMWmS5ZQuiG1eIV46VPO5I=;
 b=rjOr//JTwrR/ccLrVM4ixIUPr5qT0KkkgfLiHCt3pjLi5iTmSrmfHCgapV50I747Z4U9WZsL1453ELki3pBjSiL1Xg92iUylHc6uATkA7O4xwaYPfYv3UivjAG2GTJkET9fG1OmdaNUy6HYUfdgJ+W84EeUe5aVrmfvJWDtF0HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN][RFC PATCH v2 08/12] xen/arm: Implement device tree node removal functionalities
Date: Mon, 8 Nov 2021 23:02:23 -0800
Message-ID: <1636441347-133850-9-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd9ba6e1-7297-4d8f-c5b9-08d9a34ef9fe
X-MS-TrafficTypeDiagnostic: CH0PR02MB8044:
X-Microsoft-Antispam-PRVS:
	<CH0PR02MB80447BFB1BB370B490FDDECFBC929@CH0PR02MB8044.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SFYEBkJYZozvnwaXiSQsFzc4T+7fchNCtRzwKidmRDLXLBby8EuklegjHhsj9wNLTzdVqnY7rcoF85whMoUAQST8F9wp89yjBKKaCz46F8Zze3QGROux4XddC3z+NGAfuQJB6bWrGipCrYgGZ4r59CuTI8tnBiKkzK3dwk9GSKglX0wafWwLLVmFirli46/8vK2o8527qslovEoSNkN7qRM7J6hA+5q6NK3lCkBrFY5iizh4PSVHJwlQNxIcXE5+955LSOTVttUBiBBGZUq65VDVMJixnJwMkkNtJn91BR8GKxUvkFYRRq7FshfnlCuJJL2B+9DXYcYTXyGs23Yi3yz11KIGzL8KZ2gF0biPNf6hWQ+EY3qBCFOFuljDLxs1onzlu7B9yEqAo5Ec9YMs8hUVl3qbhjvqSfpcWe5Fij4rI81XZdncgj5t4ggk4QeXgmeWAfwiCwmhSy5E7mRGYfl0T9mWFXQcL3Th+rihpJkPfbkD3lZ1zr6M3MRTJyyOzKfTKgWz2jtXVg+GnYnPXmtj7TxR9XiB2fu2fyeo0LlVSbfIJcGZ0xnFsUm9p3ZM0Jb5F3qSyw1VbJL5q2OiLy1oVR3F3uYGmCRMxizYcql+o2wWEiPuvx25uJmq2Q0yVj2pWviiLh7Stn5fyfoZvQHwp75DgQeLiB1NQXUZfF1TNp9uGV1wuEGzYsDnC4J/kKgQmktRJgU59z12DqWJKk6qOdrsHVQhBCyUbkdiFcoS29QvbX9Prgtb+b9Ls/Tx
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(36906005)(36860700001)(82310400003)(5660300002)(54906003)(356005)(316002)(30864003)(186003)(26005)(8676002)(47076005)(6916009)(83380400001)(70206006)(70586007)(7416002)(7696005)(8936002)(336012)(6666004)(4326008)(2616005)(508600001)(426003)(36756003)(2906002)(7636003)(9786002)(102446001)(403724002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:04.5806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9ba6e1-7297-4d8f-c5b9-08d9a34ef9fe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8044

Introduce sysctl XEN_SYSCTL_overlay to remove device-tree nodes added using
device tree overlay.

xl overlay remove file.dtbo:
    Removes all the nodes in a given dtbo.
    First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
    in dt_host and delete the device node entries from dt_host.

    The nodes get removed only if it is not used by any of dom0 or domus. If
    even one of the node in dtbo is not available for removal i.e. either not
    there in dt_host or currently used by any domain, in that case we don't
    remove any node in the given dtbo.

Also, added overlay_track struct to keep the track of added node through device
tree overlay. overlay_track has dt_host_new which is unflattened form of updated
fdt and name of overlay node. When a node is removed, we also free the memory
used by overlay_track for the particular overlay node.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/device_tree.c      |  53 ++++++
 xen/common/sysctl.c           | 372 ++++++++++++++++++++++++++++++++++++++++++
 xen/include/public/sysctl.h   |  23 +++
 xen/include/xen/device_tree.h |   4 +
 4 files changed, 452 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 26d2e28..19320e1 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -385,6 +385,59 @@ void dt_print_node_names(struct dt_device_node *dt)
     return;
 }
 
+#if defined (CONFIG_OVERLAY_DTB)
+int overlay_remove_node(struct dt_device_node *device_node)
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
+    if ( np->name == device_node->name )
+    {
+        current_node->allnext = np->next;
+        return 0;
+    }
+
+    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+    {
+        current_node = np;
+        if ( np->sibling->name == device_node->name )
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
+#endif
+
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node)
 {
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index f2dab72..fca47f5 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,311 @@
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
 
+#if defined (CONFIG_OVERLAY_DTB)
+#include <xen/list.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/xmalloc.h>
+#include <xen/device_tree.h>
+#include <asm/domain_build.h>
+#endif
+
+#if defined (CONFIG_OVERLAY_DTB)
+static LIST_HEAD(overlay_tracker);
+static DEFINE_SPINLOCK(overlay_lock);
+
+/*
+ * overlay_node_track describes information about added nodes through dtbo.
+ * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
+ * @node_fullname: Store the name of nodes.
+ * @entry: List pointer.
+ */
+struct overlay_track {
+    struct list_head entry;
+    struct dt_device_node *dt_host_new;
+    char **node_fullname;
+    uint8_t num_nodes;
+};
+
+/* Basic sanity check for the dtbo tool stack provided to Xen. */
+static int check_overlay_fdt(void *overlay_fdt, uint32_t overlay_fdt_size)
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
+static int overlay_node_count(void *fdto)
+{
+    int num_overlay_nodes = 0;
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
+ * overlay_get_node_info will get the all node's full name with path. This is
+ * useful when checking node for duplication i.e. dtbo tries to add nodes which
+ * already exists in device tree.
+ */
+static void overlay_get_node_info(void *fdto, char ***node_full_path,
+                                  int num_overlay_nodes)
+{
+    int fragment;
+    int node_num = 0;
+
+    *node_full_path = xmalloc_bytes(num_overlay_nodes * sizeof(char *));
+
+    fdt_for_each_subnode(fragment, fdto, 0)
+    {
+        int target;
+        int overlay;
+        int subnode;
+        const char *target_path;
+
+        target = fdt_overlay_get_target(device_tree_flattened, fdto, fragment,
+                                    &target_path);
+        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+
+        fdt_for_each_subnode(subnode, fdto, overlay)
+        {
+            const char *node_name = fdt_get_name(fdto, subnode, NULL);
+            int node_name_len = strlen(node_name);
+            int target_path_len = strlen(target_path);
+            int node_full_name_len = target_path_len + node_name_len + 2;
+
+            (*node_full_path)[node_num] = xmalloc_bytes(node_full_name_len);
+
+            memcpy((*node_full_path)[node_num], target_path, target_path_len);
+
+            (*node_full_path)[node_num][target_path_len] = '/';
+
+            memcpy((*node_full_path)[node_num] + target_path_len + 1, node_name,
+                   node_name_len);
+
+            (*node_full_path)[node_num][node_full_name_len - 1] = '\0';
+
+            node_num++;
+        }
+    }
+}
+
+/*
+ * Checks if all the devices node listed are present in dt_host and used by any
+ * domain.
+ */
+static int check_nodes(char **full_dt_node_path, uint32_t num_nodes)
+{
+    int rc = 0;
+    unsigned int i;
+    struct dt_device_node *overlay_node;
+    uint32_t ret = 0;
+
+    for ( i = 0; i < num_nodes; i++ ) {
+        dt_dprintk("Finding node %s in the dt_host\n", full_dt_node_path[i]);
+
+        overlay_node = dt_find_node_by_path(full_dt_node_path[i]);
+
+        if ( overlay_node == NULL )
+        {
+            rc = -EINVAL;
+
+            printk(XENLOG_G_ERR "Device %s is not present in the tree."
+                   " Removing nodes failed\n", full_dt_node_path[i]);
+            return rc;
+        }
+
+        ret = dt_device_used_by(overlay_node);
+
+        dt_dprintk("Checking if node %s is used by any domain\n",
+                   full_dt_node_path[i]);
+
+        if ( ret != 0 && ret != DOMID_IO )
+        {
+            rc = -EINVAL;
+
+            printk(XENLOG_G_ERR "Device %s as it is being used by domain %d."
+                   " Removing nodes failed\n", full_dt_node_path[i], ret);
+            return rc;
+        }
+    }
+
+    return rc;
+}
+
+/* Remove nodes from dt_host. */
+static int remove_nodes(char **full_dt_node_path, uint32_t num_nodes)
+{
+    struct domain *d = hardware_domain;
+    int rc = 0;
+    struct dt_device_node *overlay_node;
+    unsigned int naddr;
+    unsigned int i, j, nirq;
+    struct dt_raw_irq rirq;
+    u64 addr, size;
+
+    for ( j = 0; j < num_nodes; j++ ) {
+        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
+
+        overlay_node = dt_find_node_by_path(full_dt_node_path[j]);
+
+        nirq = dt_number_of_irq(overlay_node);
+
+        /* Remove IRQ permission */
+        for ( i = 0; i < nirq; i++ )
+        {
+            rc = dt_device_get_raw_irq(overlay_node, i, &rirq);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                       i, dt_node_full_name(overlay_node));
+                return rc;
+            }
+
+            rc = platform_get_irq(overlay_node, i);
+            if ( rc < 0 )
+            {
+                printk(XENLOG_ERR "Unable to get irq %u for %s\n",
+                       i, dt_node_full_name(overlay_node));
+                return rc;
+            }
+
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
+        rc = overlay_remove_node(overlay_node);
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
+static long handle_remove_overlay_nodes(char **full_dt_node_path,
+                                        uint32_t num_nodes)
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
+     */
+    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
+    {
+        /* Checking the num of nodes first. If not same skip to next entry. */
+        if ( num_nodes == entry->num_nodes )
+        {
+            for( i = 0; i < num_nodes; i++ ) {
+                if( strcmp(full_dt_node_path[i], entry->node_fullname[i]) )
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
+    if ( found_entry == false ) {
+        rc = -EINVAL;
+
+        printk(XENLOG_G_ERR "Cannot find any matching tracker with input dtbo."
+               " Removing nodes is supported for only prior added dtbo. Please"
+               " provide a valid dtbo which was used to add the nodes.\n");
+        goto out;
+
+    }
+
+    rc = check_nodes(full_dt_node_path, num_nodes);
+
+    if ( rc )
+        goto out;
+
+    rc = remove_nodes(full_dt_node_path, num_nodes);
+
+    if ( rc ) {
+        printk(XENLOG_G_ERR "Removing node failed\n");
+        goto out;
+    }
+
+    list_del(&entry->entry);
+    xfree(entry->node_fullname);
+    xfree(entry->dt_host_new);
+    xfree(entry);
+
+out:
+    spin_unlock(&overlay_lock);
+    return rc;
+}
+#endif
+
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
     long ret = 0;
@@ -476,6 +781,73 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             copyback = 1;
         break;
 
+#if defined (CONFIG_OVERLAY_DTB)
+    case XEN_SYSCTL_overlay:
+    {
+        void *overlay_fdt;
+        char **node_full_path = NULL;
+        int num_overlay_nodes;
+
+        if ( op->u.overlay_dt.overlay_fdt_size > 0 )
+            overlay_fdt = xmalloc_bytes(op->u.overlay_dt.overlay_fdt_size);
+        else
+        {
+            ret = -EINVAL;
+            break;
+        }
+
+        if ( overlay_fdt == NULL )
+        {
+            ret = -ENOMEM;
+            break;
+        }
+
+        ret = copy_from_guest(overlay_fdt, op->u.overlay_dt.overlay_fdt,
+                             op->u.overlay_dt.overlay_fdt_size);
+        if ( ret )
+        {
+            gprintk(XENLOG_ERR, "copy from guest failed\n");
+            xfree(overlay_fdt);
+
+            ret = -EFAULT;
+            break;
+        }
+
+        if ( op->u.overlay_dt.overlay_op == XEN_SYSCTL_DT_OVERLAY_ADD )
+        {
+            ret = handle_add_overlay_nodes(overlay_fdt,
+                                           op->u.overlay_dt.overlay_fdt_size);
+        } else if ( op->u.overlay_dt.overlay_op ==
+                                        XEN_SYSCTL_DT_OVERLAY_REMOVE )
+        {
+            ret = check_overlay_fdt(overlay_fdt,
+                                    op->u.overlay_dt.overlay_fdt_size);
+            if ( ret )
+            {
+                ret = -EFAULT;
+                break;
+            }
+
+            num_overlay_nodes = overlay_node_count(overlay_fdt);
+            if ( num_overlay_nodes == 0 )
+            {
+                ret = -ENOMEM;
+                break;
+            }
+
+            overlay_get_node_info(overlay_fdt, &node_full_path,
+                                  num_overlay_nodes);
+
+            ret = handle_remove_overlay_nodes(node_full_path,
+                                              num_overlay_nodes);
+        }
+
+        xfree(node_full_path);
+
+        break;
+    }
+#endif
+
     default:
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3e53681..6624724 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1065,6 +1065,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
+#if defined (CONFIG_OVERLAY_DTB)
+#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
+#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
+
+/*
+ * XEN_SYSCTL_overlay
+ * Performs addition/removal of device tree nodes under parent node using dtbo.
+ * This does in three steps:
+ *  - Adds/Removes the nodes from dt_host.
+ *  - Adds/Removes IRQ permission for the nodes.
+ *  - Adds/Removes MMIO accesses.
+ */
+struct xen_sysctl_overlay_dt {
+    XEN_GUEST_HANDLE_64(void) overlay_fdt;
+    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
+    uint8_t overlay_op; /* Add or remove. */
+};
+#endif
+
 struct xen_sysctl {
     uint32_t cmd;
 #define XEN_SYSCTL_readconsole                    1
@@ -1095,6 +1114,7 @@ struct xen_sysctl {
 #define XEN_SYSCTL_livepatch_op                  27
 /* #define XEN_SYSCTL_set_parameter              28 */
 #define XEN_SYSCTL_get_cpu_policy                29
+#define XEN_SYSCTL_overlay                       30
     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
     union {
         struct xen_sysctl_readconsole       readconsole;
@@ -1125,6 +1145,9 @@ struct xen_sysctl {
 #if defined(__i386__) || defined(__x86_64__)
         struct xen_sysctl_cpu_policy        cpu_policy;
 #endif
+#if defined (CONFIG_OVERLAY_DTB)
+        struct xen_sysctl_overlay_dt       overlay_dt;
+#endif
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5ba26a0..cf29cf5 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -553,6 +553,10 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
  */
 void dt_print_node_names(struct dt_device_node *dt);
 
+#if defined (CONFIG_OVERLAY_DTB)
+int overlay_remove_node(struct dt_device_node *device_node);
+#endif
+
 /**
  * dt_get_parent - Get a node's parent if any
  * @node: Node to get parent
-- 
2.7.4



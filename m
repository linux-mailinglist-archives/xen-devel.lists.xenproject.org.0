Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0CB3FE97E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176930.322154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYw-0006TV-Dw; Thu, 02 Sep 2021 06:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176930.322154; Thu, 02 Sep 2021 06:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYv-000669-LX; Thu, 02 Sep 2021 06:51:01 +0000
Received: by outflank-mailman (input) for mailman id 176930;
 Thu, 02 Sep 2021 06:07:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLft4-0004hL-EK
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.93.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1425e966-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:07:40 +0000 (UTC)
Received: from SN4PR0501CA0073.namprd05.prod.outlook.com
 (2603:10b6:803:22::11) by BL0PR02MB4721.namprd02.prod.outlook.com
 (2603:10b6:208:59::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 06:07:38 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::e9) by SN4PR0501CA0073.outlook.office365.com
 (2603:10b6:803:22::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.11 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:17 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsb-000F6q-4A; Wed, 01 Sep 2021 23:07:17 -0700
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
X-Inumbo-ID: 1425e966-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Te3CLIQwSSYtGGBlbzgNjB+UBGrhjIq38k9KB7AOSVEw/gPnlTGnHTH852/N/X7gaX5SG46VL9qkBWskLRdlMgk22CMaN3nSRlw7vY7agl7h69FaIdZx0l3BNIy6IDFC7AycymdJKo/B9SA8AS2xj45WLx7C4bCRQdXWGvwPezaeHxgIzQDBA7cz+YOENgQTuF4ywnBRySDg5jdP3feB4i44GkxbpiJAsJEQ8tYdLNorCfzutV6G9Lxp4GsdMimRQu41Bvj2iaIwRmmiY08u1OYaY1puN/yBaQzUrSbHA0hRtvja/Pp7xR0LPKiUWlm/FKB+OZAhGqP6bxsEPmIR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuN2b2H12aJwTeXjwq0M4sE74WKCTLZyi/JgSK4cHCM=;
 b=EaqN0tOBrpnsA6ddF4D8tgIRkFZgE0U6CGwWzSSAdleOzxyTKEsVTzNTcDIhC+k/atll/tzLaeAOEkZErvNO1kfaT70ONMdPGCCTzAeyZuHl7+z8RLUDZaC8MWURa7hMdelENdcF1cC7RxJukQUDIsBW8xJNWD41ERi7i2KNgeOTGOeeIaBpoeD4W+/wD941V2PVoWwRgIK/sBqxnUOOjAz0DPmGEL+cqnnaDAAzYbO8hJw2g7A8NMdio8Ud/Xmq2VmlgR72RvAgg9DMNxmaofCvLrJBU71ZYARIAffj+ngE5VQ3bGZuKz6dmYj8DMb+mDHbHEO2KsK2HxSigj26UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuN2b2H12aJwTeXjwq0M4sE74WKCTLZyi/JgSK4cHCM=;
 b=hkwddA76I8tqtEvqpBsYNlYYwVHbCraLiYVXg6Z7D79GDPw64Q1cKYMKkaN+vov4YExUUlIsMTb3JA9kZuSJ6Soz3OaM1TN+M8NpV6ns5XBLEsYtJe02khQd+bV4ywA8luHBgFVNInkX8sLDh6Xpv5pFTFer8bnXSA07NolVq3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN][RFC PATCH 10/13] xen/arm: Implement device tree node addition functionalities
Date: Wed, 1 Sep 2021 23:06:00 -0700
Message-ID: <1630562763-390068-11-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 291affca-15c1-4473-a81f-08d96dd7f72b
X-MS-TrafficTypeDiagnostic: BL0PR02MB4721:
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB47217FD248B5BDB39FB95FF7BCCE9@BL0PR02MB4721.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0h6eZwWpeRoOmH8M/+P3RMble3LIBuH/jz0oYTE0UXq7ZqgCDd2SyiFG/EBxNy4duillUNfdkMFi4VLSZFB8BjkRTMvfQFkHifKB0UnEqgLnlFOwz7x5FFSzIyyL5kBxDIcAeQ8Efx8bfzJa9FqTQO1b3tFqyP0JCk0OJjzFnAJzqYI0CIHVxmnIcfyRhqisSunIOo1BFSc6Ys3A9Fo/XgL6cf1LvpGjCsDHiGxp8QKwIPCdIbrjinno3sxVvrDFjoEOhDV62ng9IZffiZib1QnUICSNoLB+mMSpBxY/pGyxKs0OLxc8oD6kEoybh8z4QED8bo8jXJ+SGQ8pFPCV/M1DsHAcdltf7qAMxL5tBfZYFnHG+o+LgVsn+PDhHYjD/GcfExjDka/u3wq7TQIUQPvZ2u0C9bgMYfyInrJKTk7ng4G0/BcG5Qj1yYNILcV/z33/AdwNowahz2Zd0rsPw+kwAAFhT+Y87j9pqr+EU8bfSFCGiuBtfCVe2Cpdy4GP43vN2AoArGDhIiA+JzcuCOmRYH3loNGHXK8bm50xae7BqOb2/2pNpyacj7tjPbFQxvemvT2ebzM1x0aGmqip0PqDHGHwSVsEfwpd5htY/yTm9w9ka66IEvVxgVVv17mLUKMfmUGKoPQ//JtWUIZFVwDa0XL0WCkrGdE7TBrHp9lK8zJC+sVYCtJhY6ZXfLaQFmyoUG8qyQExTC1VjK5M/WCeGCH9qzdW1/nu621QgmM89h19U6ug4UQruy5SeKSieeBOITb5Iu3VJgHh3WcI3w==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(4326008)(7696005)(2616005)(186003)(478600001)(36860700001)(356005)(83380400001)(7636003)(47076005)(30864003)(5660300002)(6666004)(36906005)(6916009)(54906003)(8676002)(2906002)(36756003)(8936002)(426003)(70586007)(82740400003)(70206006)(9786002)(316002)(336012)(82310400003)(26005)(102446001)(403724002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:38.1075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291affca-15c1-4473-a81f-08d96dd7f72b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4721

Introduce domctl XEN_DOMCTL_addfpga to add a device-tree node through device
tree overlay. This works with a device tree overlay(.dtbo) as input.

Add check_pfdt() to do sanity check on the dtbo.

Also, added overlay_get_node_info() to get the node's full name with path. This
comes handy when checking node for duplication.

Each time a overlay node is added, a new fdt(memcpy of device_tree_flattened) is
created and updated with overlay node. This updated fdt is further unflattened
to a dt_host_new. Next, it checks if overlay node already exists in the dt_host.
If overlay node doesn't exist then find the overlay node in dt_host_new, find
the overlay node's parent in dt_host and add the node as child under parent in
the dt_host. The node is attached as the last node under target parent.

Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
overlay node.

When a node is added using overlay, a new entry is allocated in the
overlay_track to keep the track of memory allocation due to addition of overlay
node. This is helpful for freeing the memory allocated when a device tree node
is removed with domctl XEN_DOMCTL_delfpga domctl.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/domctl.c         | 262 ++++++++++++++++++++++++++++++++++++++++++
 xen/common/device_tree.c      |  54 +++++++++
 xen/include/public/domctl.h   |   7 ++
 xen/include/xen/device_tree.h |   1 +
 4 files changed, 324 insertions(+)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 5986934..0ac635f 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -15,6 +15,8 @@
 #include <xen/types.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
+/* Included for FPGA dt add. */
+#include <xen/libfdt/libfdt.h>
 #include <xen/xmalloc.h>
 #include <xen/device_tree.h>
 #include <asm/domain_build.h>
@@ -68,6 +70,61 @@ static int handle_vuart_init(struct domain *d,
     return rc;
 }
 
+static int check_pfdt(void *pfdt, uint32_t pfdt_size)
+{
+    if ( fdt_totalsize(pfdt) != pfdt_size )
+    {
+        printk(XENLOG_ERR "Partial FDT is not a valid Flat Device Tree\n");
+        return -EFAULT;
+    }
+
+    if ( fdt_check_header(pfdt) )
+    {
+        printk(XENLOG_ERR "Partial FDT is not a valid Flat Device Tree\n");
+        return -EFAULT;
+    }
+
+    return 0;
+}
+
+static void overlay_get_node_info(void *fdto, char *node_full_path)
+{
+    int fragment;
+
+    /*
+     * Handle overlay nodes. But for now we are just handling one node.
+     */
+    fdt_for_each_subnode(fragment, fdto, 0)
+    {
+        int target;
+        int overlay;
+        int subnode;
+        const char *target_path;
+
+        target = overlay_get_target(device_tree_flattened, fdto, fragment,
+                                    &target_path);
+        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+
+        fdt_for_each_subnode(subnode, fdto, overlay)
+        {
+            const char *node_name = fdt_get_name(fdto, subnode, NULL);
+            int node_name_len = strlen(node_name);
+            int target_path_len = strlen(target_path);
+
+            memcpy(node_full_path, target_path, target_path_len);
+
+            node_full_path[target_path_len] = '/';
+
+            memcpy(node_full_path + target_path_len + 1, node_name,
+                   node_name_len);
+
+            node_full_path[target_path_len + 1 + node_name_len] = '\0';
+
+            return;
+        }
+    }
+}
+
 /*
  * First finds the device node to remove. Check if the device is being used by
  * any dom and finally remove it from dt_host. IOMMU is already being taken care
@@ -194,6 +251,181 @@ out:
     return rc;
 }
 
+/*
+ * Adds only one device node at a time under target node.
+ * We use dt_host_new to unflatten the updated device_tree_flattened. This is
+ * done to avoid the removal of device_tree generation, iomem regions mapping to
+ * DOM0 done by handle_node().
+ */
+static long handle_add_fpga_overlay(void *pfdt, uint32_t pfdt_size)
+{
+    int rc = 0;
+    struct dt_device_node *fpga_node;
+    char node_full_path[128];
+    void *fdt = xmalloc_bytes(fdt_totalsize(device_tree_flattened));
+    struct dt_device_node *dt_host_new;
+    struct domain *d = hardware_domain;
+    struct overlay_track *tr = NULL;
+    int node_full_path_namelen;
+    unsigned int naddr;
+    unsigned int i;
+    u64 addr, size;
+
+    if ( fdt == NULL )
+        return ENOMEM;
+
+    spin_lock(&overlay_lock);
+
+    memcpy(fdt, device_tree_flattened, fdt_totalsize(device_tree_flattened));
+
+    rc = check_pfdt(pfdt, pfdt_size);
+
+    if ( rc )
+        goto err;
+
+    overlay_get_node_info(pfdt, node_full_path);
+
+    rc = fdt_overlay_apply(fdt, pfdt);
+
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Adding overlay node %s failed with error %d\n",
+               node_full_path, rc);
+        goto err;
+    }
+
+    /* Check if node already exists in dt_host. */
+    fpga_node = dt_find_node_by_path(node_full_path);
+
+    if ( fpga_node != NULL )
+    {
+        printk(XENLOG_ERR "node %s exists in device tree\n", node_full_path);
+        rc = -EINVAL;
+        goto err;
+    }
+
+    /* Unflatten the fdt into a new dt_host. */
+    unflatten_device_tree(fdt, &dt_host_new);
+
+    /* Find the newly added node in dt_host_new by it's full path. */
+    fpga_node = _dt_find_node_by_path(dt_host_new, node_full_path);
+
+    if ( fpga_node == NULL )
+    {
+        dt_dprintk("%s node not found\n", node_full_path);
+        rc = -EFAULT;
+        xfree(dt_host_new);
+        goto err;
+    }
+
+    /* Just keep the node we intend to add. Remove every other node in list. */
+    fpga_node->allnext = NULL;
+    fpga_node->sibling = NULL;
+
+    /* Add the node to dt_host. */
+    rc = fpga_add_node(fpga_node, fpga_node->parent->full_name);
+
+    if ( rc )
+    {
+        /* Node not added in dt_host. Safe to free dt_host_new. */
+        xfree(dt_host_new);
+        goto err;
+    }
+
+    /* Get the node from dt_host and add interrupt and IOMMUs. */
+    fpga_node = dt_find_node_by_path(fpga_node->full_name);
+
+    if ( fpga_node == NULL )
+    {
+        /* Sanity check. But code will never come in this loop. */
+        printk(XENLOG_ERR "Cannot find %s node under updated dt_host\n",
+               fpga_node->name);
+        goto remove_node;
+    }
+
+    /* First let's handle the interrupts. */
+    rc = handle_device_interrupts(d, fpga_node, false);
+
+    if ( rc )
+    {
+        printk(XENLOG_G_ERR "Interrupt failed\n");
+        goto remove_node;
+    }
+
+    /* Add device to IOMMUs */
+    rc = iommu_add_dt_device(fpga_node);
+
+    if ( rc < 0 )
+    {
+        printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
+               dt_node_full_name(fpga_node));
+        goto remove_node;
+    }
+
+    /* Set permissions. */
+    naddr = dt_number_of_address(fpga_node);
+
+    dt_dprintk("%s passthrough = %d naddr = %u\n",
+               dt_node_full_name(fpga_node), false, naddr);
+
+    /* Give permission and map MMIOs */
+    for ( i = 0; i < naddr; i++ )
+    {
+        struct map_range_data mr_data = { .d = d, .p2mt = p2m_mmio_direct_c };
+        rc = dt_device_get_address(fpga_node, i, &addr, &size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                   i, dt_node_full_name(fpga_node));
+            goto remove_node;
+        }
+
+        rc = map_range_to_domain(fpga_node, addr, size, &mr_data);
+        if ( rc )
+            goto remove_node;
+    }
+
+    /* This will happen if everything above goes right. */
+    tr = xzalloc(struct overlay_track);
+    tr->dt_host_new = dt_host_new;
+    node_full_path_namelen = strlen(node_full_path);
+    tr->node_fullname = xmalloc_bytes(node_full_path_namelen + 1);
+
+    if ( tr->node_fullname == NULL )
+    {
+        rc = -ENOMEM;
+        goto remove_node;
+    }
+
+    memcpy(tr->node_fullname, node_full_path, node_full_path_namelen);
+    tr->node_fullname[node_full_path_namelen] = '\0';
+
+    INIT_LIST_HEAD(&tr->entry);
+    list_add_tail(&tr->entry, &overlay_tracker);
+
+err:
+    spin_unlock(&overlay_lock);
+    xfree(fdt);
+    return rc;
+
+/*
+ * Failure case. We need to remove the node, free tracker(if tr exists) and
+ * dt_host_new. As the tracker is not in list yet so it doesn't get freed in
+ * handle_del_fpga_nodes() and due to that dt_host_new will not get freed so we
+ * we free tracker and dt_host_new here.
+ */
+remove_node:
+    spin_unlock(&overlay_lock);
+    handle_del_fpga_nodes(node_full_path);
+    xfree(dt_host_new);
+
+    if ( tr )
+        xfree(tr);
+
+    xfree(fdt);
+    return rc;
+}
+
 long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
@@ -323,6 +555,36 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         return rc;
     }
 
+    case XEN_DOMCTL_addfpga:
+    {
+        void *pfdt;
+        int rc;
+
+        if ( domctl->u.fpga_add_dt.pfdt_size > 0 )
+            pfdt = xmalloc_bytes(domctl->u.fpga_add_dt.pfdt_size);
+        else
+            return -EINVAL;
+
+        if ( pfdt == NULL )
+            return -ENOMEM;
+
+        rc = copy_from_guest(pfdt, domctl->u.fpga_add_dt.pfdt,
+                             domctl->u.fpga_add_dt.pfdt_size);
+        if ( rc )
+        {
+            gprintk(XENLOG_ERR, "copy from guest failed\n");
+            xfree(pfdt);
+
+            return -EFAULT;
+        }
+
+        rc = handle_add_fpga_overlay(pfdt, domctl->u.fpga_add_dt.pfdt_size);
+
+        xfree(pfdt);
+
+        return rc;
+    }
+
     case XEN_DOMCTL_delfpga:
     {
         char *full_dt_node_path;
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 04f2578..d062c17 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -324,6 +324,60 @@ void dt_print_node_names(struct dt_device_node *dt)
     return;
 }
 
+int fpga_add_node(struct dt_device_node *fpga_node,
+                  const char *parent_node_path)
+{
+    struct dt_device_node *parent_node;
+    struct dt_device_node *np;
+    struct dt_device_node *next_node;
+    struct dt_device_node *new_node;
+
+    parent_node = dt_find_node_by_path(parent_node_path);
+
+    new_node = fpga_node;
+
+    if ( new_node == NULL )
+        return -EINVAL;
+
+    if ( parent_node == NULL )
+    {
+        dt_dprintk("Node not found. Partial dtb will not be added");
+        return -EINVAL;
+    }
+
+    /*
+     * If node is found. We can attach the fpga_node as a child of the
+     * parent node.
+     */
+
+    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+    {
+    }
+
+    /*
+     * Before attaching also check if the parent node of fpga_node is also
+     * same named as parent.
+     */
+    next_node = np->allnext;
+
+    new_node->parent = parent_node;
+    np->sibling = new_node;
+    np->allnext = new_node;
+
+    /*
+     * Reach at the end of fpga_node.
+     * TODO: Remove this loop as we are just adding one node for now.
+     */
+    for ( np = new_node; np->allnext != NULL; np = np->allnext )
+    {
+    }
+
+    /* Now plug next_node at the end of fpga_node. */
+    np->allnext = next_node;
+
+    return 0;
+}
+
 int fpga_del_node(struct dt_device_node *device_node)
 {
     struct dt_device_node *np;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b1b8efd..ce4667e 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1175,6 +1175,11 @@ struct xen_domctl_fpga_del_dt {
     uint32_t size;
 };
 
+/* XEN_DOMCTL_fpga_add. */
+struct xen_domctl_fpga_add_dt {
+    XEN_GUEST_HANDLE_64(void) pfdt;
+    uint32_t pfdt_size;  /* Partial dtb size. */
+};
 
 struct xen_domctl {
     uint32_t cmd;
@@ -1261,6 +1266,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
 #define XEN_DOMCTL_vmtrace_op                    84
+#define XEN_DOMCTL_addfpga                      85
 #define XEN_DOMCTL_delfpga                      86
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
@@ -1323,6 +1329,7 @@ struct xen_domctl {
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
+        struct xen_domctl_fpga_add_dt       fpga_add_dt;
         struct xen_domctl_fpga_del_dt       fpga_del_dt;
         uint8_t                             pad[128];
     } u;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index eb7f645..4c8dec6 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -496,6 +496,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
  * Prints all node names.
  */
 void dt_print_node_names(struct dt_device_node *dt);
+int fpga_add_node(struct dt_device_node *fpga_node, const char *parent_node);
 int fpga_del_node(struct dt_device_node *device_node);
 
 /**
-- 
2.7.4



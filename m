Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E14A44A74F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223701.386548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9o-0000vj-5h; Tue, 09 Nov 2021 07:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223701.386548; Tue, 09 Nov 2021 07:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9n-0000o8-PW; Tue, 09 Nov 2021 07:02:59 +0000
Received: by outflank-mailman (input) for mailman id 223701;
 Tue, 09 Nov 2021 07:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9m-0008WR-9s
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:02:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e88::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 106aea44-412b-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 08:02:55 +0100 (CET)
Received: from DS7PR03CA0322.namprd03.prod.outlook.com (2603:10b6:8:2b::29) by
 CH2PR02MB7096.namprd02.prod.outlook.com (2603:10b6:610:8c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Tue, 9 Nov 2021 07:02:52 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::e0) by DS7PR03CA0322.outlook.office365.com
 (2603:10b6:8:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 07:02:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:02:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:49 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:49 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9d-000Ga6-Hm; Mon, 08 Nov 2021 23:02:49 -0800
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
X-Inumbo-ID: 106aea44-412b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQ/HRZVZRKHbJJj6B8yux5m0AaGx7aRxB7EwDCXGMprYHw6gZ8Gto5T1L9oH4hMw1SrihvlmBDCw3Rn6H3txqj+9JSMA+mrCgmgFg6Y44lHfqaVNsTtmAFMRyI5USGAEIeX8aHiaK/Kk/Yf5Sf+FwbZM6HxFz1o+q1rXzWsMHTPDymgORzgWg0pXfriOIbZFeW/K3uraZDYvLXwr32Dge0gjjImb1ycMeMzaxCCsqqKtsLDZtFq7iSoTjFRRwxtlWrxQz/NEK2BE8AXKK94Si3VZH4Myw+yDW7lEMpyOJLtSsLFU50GuzEXJ2IJMdnNEwJZEVFfCjyzKFpzjLt4WJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyrbSWuVg8mh72pt0EIeRsiFgh0ZFhFqclg9XrgPE/4=;
 b=g7FPXH2jJqWpJ4IuzNVeiwZqrGTUKKhm+6QCsJcMz4CQ9ItAuInxDStA/8jQfNDpfVd6LB7+1/cOQhoK33YlfDCAHwkWZfvL69DgpnKKRufxIgKW5WIhSxeM672Ni+g6yAg2AtQ9XGg+8kYmzcIYknyOuGZMrnagP0QvZvu5iXldPZl7Rj9xw6YT09wAKT84bQ6vnJbb3KreQT/Ou0lhvOKRE7B6k9fFCE2U+h4oQXr5vrLSX9eDFw6gObciJXDDwlgOcI3sOEa7kxN3egXykCfHmpUMP7yr3HRzkllCdkcTmIKgO6SRpFAqGMEeSAMijxVVpMLyPrQpieJItcDIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyrbSWuVg8mh72pt0EIeRsiFgh0ZFhFqclg9XrgPE/4=;
 b=Sk/OyTFjBzZsK/KhA9UqQFg5EB1xkdSXExumgM3a1lNRg+P2hLjEJrS5eNy1bG2wAeuNZuHAwEjL1Fjx2liPuVbgjFrDLwld1JSPN3ElY+IONXlWXX6UnPHXvJSJDIxlh9JY6GygAlxV97w1zcNG+DGYR0W3VQTB+CQvUXNZ7BE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN][RFC PATCH v2 09/12] xen/arm: Implement device tree node addition functionalities
Date: Mon, 8 Nov 2021 23:02:24 -0800
Message-ID: <1636441347-133850-10-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53fc7495-d8b0-423b-8eec-08d9a34ef2af
X-MS-TrafficTypeDiagnostic: CH2PR02MB7096:
X-Microsoft-Antispam-PRVS:
	<CH2PR02MB709615A21C78C07DC56BFD24BC929@CH2PR02MB7096.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:287;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D9sM5O9mquk0D9fEps5z/Mk8ZS3cinM6zl00gYYL53VuyB4YUnD/EUDwHs1mWUpRcRiIo4Rets5kdfrOJ+ZUPQZNbe+PBE/pGSfKd2W8TWM+HzJ/I01VxQeDwBTyhUcm1Wmq59jxpKjQVK1ggY6BWmAA7JpCunFn006fEvIWaM3Hw4s5o5KEV1CN+f1VbbOV58pEtxfWCIENijGUBtNCWT25Oy4P2OZrqlGJqU8s7Sr+ZTHYXGmRHWyburxglH/IBfp0CoFFlfoGbjS0VwE0GgqqzooULEV/UdS4Z2vrW+pj0grSy/FJ7wlkI5MJt0a61VjXYgBxHwsegedVk5tyfDh3J74qz0zTYrWTcxkyf4T9Bx8bk6hysFKl5XwSlAMH4nroEQLiFTNZzuEiWCFkpic8T9sIPAddAShPT6PluUWNZCdJhn3jYD0miA5L6Na5NX2SJYRhdYNvxlYv4o+I4sCRvg6k/HNYxwHubOCeWKF/1FkcjnSBvIQY4xtsiGJnBkUGFxfN0YTMP//jh3uj3Rugadkxy0IvmnQ5AonJJKHCTSf9uhRCcNKLpACLEawBZk25WDg0v/SOuB0HIoDcLw6eR4m75mTI4xb8Ny3r4C1h2lpTKPLpVXAxBmwRcnwpZvUF+BsjM5HTAQ58Z0jDxAddbyc5FmsJkmntQuL8623QZa3X14dGvrHaqiGr/Q0sT+nfPWj93HUVa5Ucv5FJfst2rsPjUN9DwnhEnMBdfvXEPsHhcCnQP+5qFxLmXqLowAMtpYaXvGTqo3MrhUUBOw==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(7416002)(82310400003)(9786002)(4326008)(36860700001)(186003)(2616005)(356005)(7636003)(2906002)(426003)(336012)(83380400001)(36906005)(316002)(70586007)(70206006)(6916009)(26005)(54906003)(508600001)(8936002)(8676002)(47076005)(6666004)(5660300002)(7696005)(36756003)(102446001)(403724002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:02:52.3044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fc7495-d8b0-423b-8eec-08d9a34ef2af
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7096

Update sysctl XEN_SYSCTL_overlay to enable support for dtbo nodes addition using
device tree overlay.

xl overlay add file.dtbo:
    Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
    device_tree_flattened) is created and updated with overlay nodes. This
    updated fdt is further unflattened to a dt_host_new. Next, it checks if any
    of the overlay nodes already exists in the dt_host. If overlay nodes doesn't
    exist then find the overlay nodes in dt_host_new, find the overlay node's
    parent in dt_host and add the nodes as child under their parent in the
    dt_host. The node is attached as the last node under target parent.

    Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
    overlay node.

When a node is added using overlay, a new entry is allocated in the
overlay_track to keep the track of memory allocation due to addition of overlay
node. This is helpful for freeing the memory allocated when a device tree node
is removed.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/device_tree.c      |  41 +++++++++
 xen/common/sysctl.c           | 199 ++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/device_tree.h |   2 +
 3 files changed, 242 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 19320e1..5dff64c 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -386,6 +386,47 @@ void dt_print_node_names(struct dt_device_node *dt)
 }
 
 #if defined (CONFIG_OVERLAY_DTB)
+int overlay_add_node(struct dt_device_node *device_node,
+                  const char *parent_node_path)
+{
+    struct dt_device_node *parent_node;
+    struct dt_device_node *np;
+    struct dt_device_node *next_node;
+    struct dt_device_node *new_node;
+
+    parent_node = dt_find_node_by_path(parent_node_path);
+
+    new_node = device_node;
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
+     * If node is found. We can attach the device_node as a child of the
+     * parent node. Iterate to the last child node of parent.
+     */
+
+    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+    {
+    }
+
+    next_node = np->allnext;
+    new_node->parent = parent_node;
+    np->sibling = new_node;
+    np->allnext = new_node;
+    /* Now plug next_node at the end of device_node. */
+    new_node->sibling = next_node;
+    new_node->allnext = next_node;
+    np->sibling->sibling = NULL;
+    return 0;
+}
+
 int overlay_remove_node(struct dt_device_node *device_node)
 {
     struct dt_device_node *np;
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index fca47f5..38824b2 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -331,6 +331,205 @@ out:
     spin_unlock(&overlay_lock);
     return rc;
 }
+
+/*
+ * Adds device tree nodes under target node.
+ * We use dt_host_new to unflatten the updated device_tree_flattened. This is
+ * done to avoid the removal of device_tree generation, iomem regions mapping to
+ * hardware domain done by handle_node().
+ */
+static long handle_add_overlay_nodes(void *overlay_fdt,
+                                     uint32_t overlay_fdt_size)
+{
+    int rc = 0;
+    struct dt_device_node *overlay_node;
+    char **node_full_path = NULL;
+    void *fdt = NULL;
+    struct dt_device_node *dt_host_new;
+    struct domain *d = hardware_domain;
+    struct overlay_track *tr = NULL;
+    unsigned int naddr;
+    unsigned int i, j;
+    int num_overlay_nodes;
+    u64 addr, size;
+
+    fdt = xmalloc_bytes(fdt_totalsize(device_tree_flattened));
+    if ( fdt == NULL )
+        return -ENOMEM;
+
+    num_overlay_nodes = overlay_node_count(overlay_fdt);
+    if ( num_overlay_nodes == 0 )
+        return -ENOMEM;
+
+    spin_lock(&overlay_lock);
+
+    memcpy(fdt, device_tree_flattened, fdt_totalsize(device_tree_flattened));
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+        goto err;
+
+    /*
+     * overlay_get_node_info is called to get the node information from dtbo.
+     * This is done before fdt_overlay_apply() because the overlay apply will
+     * erase the magic of overlay_fdt.
+     */
+    overlay_get_node_info(overlay_fdt, &node_full_path, num_overlay_nodes);
+
+    rc = fdt_overlay_apply(fdt, overlay_fdt);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Adding overlay node failed with error %d\n", rc);
+        goto err;
+    }
+
+    for ( j = 0; j < num_overlay_nodes; j++ ) {
+        /* Check if any of the node already exists in dt_host. */
+        overlay_node = dt_find_node_by_path(node_full_path[j]);
+        if ( overlay_node != NULL )
+        {
+            printk(XENLOG_ERR "node %s exists in device tree\n",
+                   node_full_path[j]);
+            rc = -EINVAL;
+            xfree(node_full_path);
+            goto err;
+        }
+    }
+
+    /* Unflatten the fdt into a new dt_host. */
+    unflatten_device_tree(fdt, &dt_host_new);
+
+    for ( j = 0; j < num_overlay_nodes; j++ ) {
+        dt_dprintk("Adding node: %s\n", node_full_path[j]);
+
+        /* Find the newly added node in dt_host_new by it's full path. */
+        overlay_node = _dt_find_node_by_path(dt_host_new, node_full_path[j]);
+        if ( overlay_node == NULL )
+        {
+            dt_dprintk("%s node not found\n", node_full_path[j]);
+            rc = -EFAULT;
+            goto remove_node;
+        }
+
+        /* Add the node to dt_host. */
+        rc = overlay_add_node(overlay_node, overlay_node->parent->full_name);
+        if ( rc )
+        {
+            /* Node not added in dt_host. */
+            goto remove_node;
+        }
+
+        /* Get the node from dt_host and add interrupt and IOMMUs. */
+        overlay_node = dt_find_node_by_path(overlay_node->full_name);
+        if ( overlay_node == NULL )
+        {
+            /* Sanity check. But code will never come here. */
+            printk(XENLOG_ERR "Cannot find %s node under updated dt_host\n",
+                   overlay_node->name);
+            goto remove_node;
+        }
+
+        /* First let's handle the interrupts. */
+        rc = handle_device_interrupts(d, overlay_node, false);
+        if ( rc )
+        {
+            printk(XENLOG_G_ERR "Interrupt failed\n");
+            goto remove_node;
+        }
+
+        /* Add device to IOMMUs */
+        rc = iommu_add_dt_device(overlay_node);
+        if ( rc < 0 )
+        {
+            printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
+                   dt_node_full_name(overlay_node));
+            goto remove_node;
+        }
+
+        /* Set permissions. */
+        naddr = dt_number_of_address(overlay_node);
+
+        dt_dprintk("%s passthrough = %d naddr = %u\n",
+                   dt_node_full_name(overlay_node), false, naddr);
+
+        /* Give permission and map MMIOs */
+        for ( i = 0; i < naddr; i++ )
+        {
+            struct map_range_data mr_data = { .d = d,
+                                              .p2mt = p2m_mmio_direct_c };
+            rc = dt_device_get_address(overlay_node, i, &addr, &size);
+            if ( rc )
+            {
+                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                       i, dt_node_full_name(overlay_node));
+                goto remove_node;
+            }
+
+            rc = map_range_to_domain(overlay_node, addr, size, &mr_data);
+            if ( rc )
+                goto remove_node;
+        }
+    }
+
+    /* This will happen if everything above goes right. */
+    tr = xzalloc(struct overlay_track);
+    if ( tr == NULL )
+    {
+        rc = -ENOMEM;
+        goto remove_node;
+    }
+
+    tr->dt_host_new = dt_host_new;
+    tr->node_fullname = node_full_path;
+    tr->num_nodes = num_overlay_nodes;
+
+    if ( tr->node_fullname == NULL )
+    {
+        rc = -ENOMEM;
+        goto remove_node;
+    }
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
+ * Failure case. We need to remove the nodes, free tracker(if tr exists) and
+ * dt_host_new.
+ */
+remove_node:
+    xfree(fdt);
+    rc = check_nodes(node_full_path, j);
+
+    if ( rc ) {
+        spin_unlock(&overlay_lock);
+        return rc;
+    }
+
+    rc = remove_nodes(node_full_path, j);
+
+    if ( rc ) {
+        printk(XENLOG_G_ERR "Removing node failed\n");
+        spin_unlock(&overlay_lock);
+        return rc;
+    }
+
+    spin_unlock(&overlay_lock);
+
+    xfree(dt_host_new);
+
+    if ( tr )
+        xfree(tr);
+
+    if ( node_full_path )
+        xfree(node_full_path);
+
+    return rc;
+}
 #endif
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index cf29cf5..eafb269 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -554,6 +554,8 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
 void dt_print_node_names(struct dt_device_node *dt);
 
 #if defined (CONFIG_OVERLAY_DTB)
+int overlay_add_node(struct dt_device_node *device_node,
+                  const char *parent_node_path);
 int overlay_remove_node(struct dt_device_node *device_node);
 #endif
 
-- 
2.7.4



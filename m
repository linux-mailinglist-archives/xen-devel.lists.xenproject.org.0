Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298694D21E6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287473.487571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoF-00086C-Np; Tue, 08 Mar 2022 19:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287473.487571; Tue, 08 Mar 2022 19:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoF-00081d-H3; Tue, 08 Mar 2022 19:47:51 +0000
Received: by outflank-mailman (input) for mailman id 287473;
 Tue, 08 Mar 2022 19:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfoD-0004Om-P4
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a13ebabf-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:48 +0100 (CET)
Received: from DS7PR06CA0033.namprd06.prod.outlook.com (2603:10b6:8:54::15) by
 BY5PR02MB6452.namprd02.prod.outlook.com (2603:10b6:a03:1b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 19:47:42 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::ff) by DS7PR06CA0033.outlook.office365.com
 (2603:10b6:8:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:24 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:24 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfno-000Cws-CG; Tue, 08 Mar 2022 11:47:24 -0800
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
X-Inumbo-ID: a13ebabf-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csH/2uVh0owjvzpQq0bEkynkriDNS5ewgniFxH+RClBE5IkVDZ0EXNM3QWQoL6LRBJqiCU5usL+qj4vAHwvPkOJez6zyHXT78N2Dp3G0QbDZOCvtWI1fZHm/SZHkvkMBV7nBC7qqN6nZQcf7ErZHlecAVefahez8vQo7p83l0N82oaUL6zZSamYRiTDtrAC1wqDF34ayXPahd0dX6h/4tRrStWgJ8DveBKEZ/AgLklx8eBN7AWjpdcrQcOSfUEo+BO+gfd188H6SyAmmKDFaPvdp6fh4xQnSwd8sNRflTLdBOtaFaaVdGKREIVZiHpnIBkCO+JXAZKW+W9yqWVRplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1gi60PB1fCf6Gz/jhEFM/GsLELukVETFiTkGYpX/Lk=;
 b=YdhItRRo6THX2lyxNo1/1rac3NsU2bYJ5OxcUX9opjXHsFiKFL1CKieYhBn4KA1ViKG19+P+r2n4MQgbWRdXwrpKFtgQZfIOHq2EHE5hmHAhKJTX3PfeSO73MeseoPeBTjjxs06Y34GR3+qRMjG62lgtjV2K/zWZmBxMpGYafMJWD7HBRS/t/hxb9x8/baIVvchN75c93EsSuaVWW9Dy/fmcoIKTRFy8VlvOQnEv4DlcbKXtfF+HtBz3cx1bx4Z7sDejrA+b6UvOGlSk27fIcr7JpqO2OAtCDmxuNdcO/KgDIOe50HMxy2J1cjCbG1BsFkHp9b01rjLq+OnQuzrcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1gi60PB1fCf6Gz/jhEFM/GsLELukVETFiTkGYpX/Lk=;
 b=iYtVWejklPcrJTweZwKJjMK6fxo0i4pX5Ci0NQxZREIkTdnaqQkuAcUuROtm72cewmI3k7/f6mK1XnUCS5aNQfJnIMgw8TwZDAHUGHMedNss40BHw+Z1Z40U8OUck09BqX/o+rs0HIMMJY91Kg0rHVZN5SuLzhWM+gjPvvDUvfY=
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
Subject: [XEN][RFC PATCH v3 11/14] xen/arm: Implement device tree node addition functionalities
Date: Tue, 8 Mar 2022 11:47:01 -0800
Message-ID: <20220308194704.14061-12-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6628726e-b0a2-4795-1fa2-08da013c825f
X-MS-TrafficTypeDiagnostic: BY5PR02MB6452:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR02MB64529BEF24DAE2BF6F3F358CBC099@BY5PR02MB6452.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SMwBTaiIIrBoiF72brPAdLFYZ8Evs5O4rFRiQ1Lo5XLz5zWG7LsRQqLNt8NJkTft00S/ZzaJ+HbrKD9VoFsJeULo8nImY8XRSXA7+IkTcQ32Cjh0dZnIAjWavEfBvOU/2hai6y7gHlf7zR9LIHHtsC73yB7x12coys7AyUdMYGLi6iFU4Hznj6LNtNXgebsy896EC6S8D6uWaa/uyrRtW/QQYqf5bfyLa6/Rghl4XArRNFWquYrPj1O9n8hqk9SfyAn7g8rIP/RtxJJv7dOEwFFZKvKUgV7XvUVR6YzTX9lIU49VIFnqhWG+d0hAXPEjW54EikhwPoHLys2b8PuiZ1c4BRRa1mhWPqtxsyTR3LU/TMP6CLwYTI3NbV9dYFlW1q2SV0HhZ47xTyltKtlmrDnys89785CoEOo3cgaj1jXJsbWK6sYUqSjakO2b3rCc5nyTAjaQKRrx9d3Q+EjsK2E0jO3DxZWqy2k5wB/jcY49bE7cXJgvMfAJKL1WvXwCs1d6gWLLwzt0jnB2bpTn9tQczTT+Z5jAsGiTSQg8N6b9bABN5lymFl6+SrDD4ihFKTNzOid38kWUZKcKG9bmMgx/PJbCqxcUrSS5fm1Ki/cwqPJWpvjhVgb3E7VMYCW7SoigfANjledj1jMYV70MvyqSGbv3CFb9Qw0VldkzKjBrvH9KAuXbfMUySzDvxU89GypSqrI1mA2I8O+axI9TRg==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(336012)(6666004)(356005)(7636003)(26005)(8676002)(2616005)(1076003)(7696005)(5660300002)(508600001)(2906002)(426003)(36860700001)(8936002)(9786002)(70586007)(70206006)(82310400004)(186003)(316002)(47076005)(54906003)(36756003)(4326008)(6916009)(83380400001)(102446001)(403724002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:42.2346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6628726e-b0a2-4795-1fa2-08da013c825f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6452

Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
using device tree overlay.

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
 xen/common/dt_overlay.c     | 324 ++++++++++++++++++++++++++++++++++++
 xen/include/public/sysctl.h |   1 +
 2 files changed, 325 insertions(+)

diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
index fcb31de495..01aed62d74 100644
--- a/xen/common/dt_overlay.c
+++ b/xen/common/dt_overlay.c
@@ -82,6 +82,64 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
     return 0;
 }
 
+static int dt_overlay_add_node(struct dt_device_node *device_node,
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
+     * parent node.
+     */
+
+    /* If parent has no child. */
+    if ( parent_node->child == NULL )
+    {
+        next_node = parent_node->allnext;
+        new_node->parent = parent_node;
+        parent_node->allnext = new_node;
+        parent_node->child = new_node;
+        /* Now plug next_node at the end of device_node. */
+        new_node->allnext = next_node;
+    } else {
+        /* If parent has at least one child node. */
+
+        /*
+         *  Iterate to the last child node of parent.
+         */
+        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+        {
+        }
+
+        next_node = np->allnext;
+        new_node->parent = parent_node;
+        np->sibling = new_node;
+        np->allnext = new_node;
+        /* Now plug next_node at the end of device_node. */
+        new_node->sibling = next_node;
+        new_node->allnext = next_node;
+        np->sibling->sibling = NULL;
+    }
+
+    return 0;
+}
+
 /* Basic sanity check for the dtbo tool stack provided to Xen. */
 static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
 {
@@ -377,6 +435,267 @@ out:
     return rc;
 }
 
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
+    char **nodes_full_path = NULL;
+    int **nodes_irq = NULL;
+    int *node_num_irq = NULL;
+    void *fdt = NULL;
+    struct dt_device_node *dt_host_new = NULL;
+    struct domain *d = hardware_domain;
+    struct overlay_track *tr = NULL;
+    unsigned int naddr;
+    unsigned int num_irq;
+    unsigned int i, j, k;
+    unsigned int num_overlay_nodes;
+    u64 addr, size;
+
+    fdt = xmalloc_bytes(fdt_totalsize(device_tree_flattened));
+    if ( fdt == NULL )
+        return -ENOMEM;
+
+    num_overlay_nodes = overlay_node_count(overlay_fdt);
+    if ( num_overlay_nodes == 0 )
+    {
+        xfree(fdt);
+        return -ENOMEM;
+    }
+
+    spin_lock(&overlay_lock);
+
+    memcpy(fdt, device_tree_flattened, fdt_totalsize(device_tree_flattened));
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+    {
+        xfree(fdt);
+        return rc;
+    }
+
+    /*
+     * overlay_get_nodes_info is called to get the node information from dtbo.
+     * This is done before fdt_overlay_apply() because the overlay apply will
+     * erase the magic of overlay_fdt.
+     */
+    rc = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
+                                num_overlay_nodes);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Getting nodes information failed with error %d\n",
+               rc);
+        goto err;
+    }
+
+    nodes_irq = xmalloc_bytes(num_overlay_nodes * sizeof(int *));
+
+    if ( nodes_irq == NULL )
+    {
+        rc = -ENOMEM;
+        goto err;
+    }
+    memset(nodes_irq, 0x0, num_overlay_nodes * sizeof(int *));
+
+    node_num_irq = xmalloc_bytes(num_overlay_nodes * sizeof(int));
+    if ( node_num_irq == NULL )
+    {
+        rc = -ENOMEM;
+        goto err;
+    }
+    memset(node_num_irq, 0x0, num_overlay_nodes * sizeof(int));
+
+    rc = fdt_overlay_apply(fdt, overlay_fdt);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Adding overlay node failed with error %d\n", rc);
+        goto err;
+    }
+
+    for ( j = 0; j < num_overlay_nodes; j++ )
+    {
+        /* Check if any of the node already exists in dt_host. */
+        overlay_node = dt_find_node_by_path(nodes_full_path[j]);
+        if ( overlay_node != NULL )
+        {
+            printk(XENLOG_ERR "node %s exists in device tree\n",
+                   nodes_full_path[j]);
+            rc = -EINVAL;
+            goto err;
+        }
+    }
+
+    /* Unflatten the fdt into a new dt_host. */
+    unflatten_device_tree(fdt, &dt_host_new);
+
+    for ( j = 0; j < num_overlay_nodes; j++ )
+    {
+        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
+
+        /* Find the newly added node in dt_host_new by it's full path. */
+        overlay_node = _dt_find_node_by_path(dt_host_new, nodes_full_path[j]);
+        if ( overlay_node == NULL )
+        {
+            dt_dprintk("%s node not found\n", nodes_full_path[j]);
+            rc = -EFAULT;
+            goto remove_node;
+        }
+
+        /* Add the node to dt_host. */
+        rc = dt_overlay_add_node(overlay_node, overlay_node->parent->full_name);
+        if ( rc )
+        {
+            /* Node not added in dt_host. */
+            goto remove_node;
+        }
+
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
+            printk(XENLOG_ERR "Interrupt failed\n");
+            goto remove_node;
+        }
+
+        /* Store IRQs for each node. */
+        num_irq = dt_number_of_irq(overlay_node);
+        node_num_irq[j] = num_irq;
+        nodes_irq[j] = xmalloc_bytes(num_irq * sizeof(int));
+        if ( nodes_irq[j] == NULL )
+        {
+            rc = -ENOMEM;
+            goto remove_node;
+        }
+
+        for ( k = 0; k < num_irq; k++ )
+        {
+             nodes_irq[j][k] = platform_get_irq(overlay_node, k);
+        }
+
+        /* Add device to IOMMUs */
+        rc = iommu_add_dt_device(overlay_node);
+        if ( rc < 0 )
+        {
+            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
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
+        /* Give permission for map MMIOs */
+        for ( i = 0; i < naddr; i++ )
+        {
+            struct map_range_data mr_data = { .d = d,
+                                              .p2mt = p2m_mmio_direct_c,
+                                              .skip_mapping = true };
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
+    tr->fdt = fdt;
+    tr->nodes_fullname = nodes_full_path;
+    tr->num_nodes = num_overlay_nodes;
+    tr->nodes_irq = nodes_irq;
+    tr->node_num_irq = node_num_irq;
+
+    if ( tr->nodes_fullname == NULL )
+    {
+        rc = -ENOMEM;
+        goto remove_node;
+    }
+
+    INIT_LIST_HEAD(&tr->entry);
+    list_add_tail(&tr->entry, &overlay_tracker);
+
+    spin_unlock(&overlay_lock);
+    return rc;
+
+/*
+ * Failure case. We need to remove the nodes, free tracker(if tr exists) and
+ * dt_host_new.
+ */
+remove_node:
+    rc = remove_nodes(nodes_full_path, nodes_irq, node_num_irq, j);
+
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Removing node failed\n");
+        spin_unlock(&overlay_lock);
+        return rc;
+    }
+
+err:
+    spin_unlock(&overlay_lock);
+
+    xfree(dt_host_new);
+    xfree(fdt);
+
+    if ( nodes_full_path != NULL )
+    {
+        for ( i = 0; i < num_overlay_nodes && nodes_full_path[i] != NULL; i++ )
+        {
+            xfree(nodes_full_path[i]);
+        }
+        xfree(nodes_full_path);
+    }
+
+    if ( nodes_irq != NULL )
+    {
+        for ( i = 0; i < num_overlay_nodes && nodes_irq[i] != NULL; i++ )
+        {
+            xfree(nodes_irq[i]);
+        }
+        xfree(nodes_irq);
+    }
+
+    if ( node_num_irq )
+        xfree(node_num_irq);
+
+    xfree(tr);
+
+    return rc;
+}
+
 long dt_sysctl(struct xen_sysctl *op)
 {
     long ret = 0;
@@ -404,6 +723,11 @@ long dt_sysctl(struct xen_sysctl *op)
 
     switch ( op->u.dt_overlay.overlay_op )
     {
+    case XEN_SYSCTL_DT_OVERLAY_ADD:
+        ret = handle_add_overlay_nodes(overlay_fdt,
+                                       op->u.dt_overlay.overlay_fdt_size);
+        break;
+
     case XEN_SYSCTL_DT_OVERLAY_REMOVE:
         ret = check_overlay_fdt(overlay_fdt,
                                 op->u.dt_overlay.overlay_fdt_size);
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index e256aeb7c6..bb3ef44989 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1069,6 +1069,7 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
 DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
 #endif
 
+#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
 #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
 
 /*
-- 
2.17.1



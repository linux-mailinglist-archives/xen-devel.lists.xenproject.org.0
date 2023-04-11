Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18436DE4A0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519780.806837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUT-0007XG-TZ; Tue, 11 Apr 2023 19:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519780.806837; Tue, 11 Apr 2023 19:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUT-0007Lm-BE; Tue, 11 Apr 2023 19:17:17 +0000
Received: by outflank-mailman (input) for mailman id 519780;
 Tue, 11 Apr 2023 19:17:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUP-0004Ta-VN
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e89::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75148f5c-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:12 +0200 (CEST)
Received: from MW4PR04CA0047.namprd04.prod.outlook.com (2603:10b6:303:6a::22)
 by MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:07 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::73) by MW4PR04CA0047.outlook.office365.com
 (2603:10b6:303:6a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 19:17:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:05 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:05 -0500
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
X-Inumbo-ID: 75148f5c-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZdxqLJLgKXDWMojKmWYYz9UnYELtxncFWW4wx0bV5HcVbaJrpZBh04U5pSoVFPsQkFcKZDIq1Cg8njnRsZo6At6d4z/W7Zb556MDP3/UZ4X1Wb5wU8M5Er5sE3aE8e8e1aOyEtOXb76xht+yVKRN7MYBlIlizy+KTpDxKe4zd1CmkCF4sn+uCQ0yjObeHk7/SE6yLnGUgnlu68frNEVqHXGYkKu5drI0ZpXtqvO3qVhNk/rpBs+02yeuqTefgfStDVLs8Nuc0LaUnIWCzCro0vRIkBdCAavv7c2RUSxDWRs+0RhhYHkJuRPKWQPVvsr5gpIkF3+fZ5oLOfEcn4RWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+cCBf3g6fBI4ES7DG61XJTRWpPAgPp5V0YvFzOd6Q8=;
 b=KJK2ygR2wbBhuVxFyoZFLe+hjdtRm5koMDZd9Oeof9o6Aryt6qAPXH4LSXA53BlJtoWTl7/QMpPB3rE1/jgDjcVx6BzJS2qm1j1Nzza7P1YhA10GSS0bJNqHNjNK7+g9BV0KMtvFYvDXV4I+yVf5/9R1o0iETEgk5CSteU9Iuq8c1w26r9xNQoxbwSH7Xf31WwyiYOFDY1Z8BWsfLWkNm4M35eIeZSkN2Px0Y9WJI6r1y6CaciDRh+ALhIi+01A2xtV+iMUUCCug8h1kLS0BerTPjTmiuO8KQzFu4jVy1oFWzmC8mSZ7Prz+LFeloL+VwtbV04/T7J/jbrAjQpbNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+cCBf3g6fBI4ES7DG61XJTRWpPAgPp5V0YvFzOd6Q8=;
 b=brYbKaGU8Q72lJSgTQfQSW8LmLDO7PvXt2hCa4KPGUB8MerKituz4Z9o0vpiMd3zauNzeTF9tRf/OkKJfza8PRinChP0AN4UqPhRxE7AF4B7Ohpaal8qYF6xk+4HuIFn2jQ6lgAMkQS8ir7ykY4Ws1ZcEeHGCpeoyIoCKF37Z+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v5 14/17] xen/arm: Implement device tree node addition functionalities
Date: Tue, 11 Apr 2023 12:16:15 -0700
Message-ID: <20230411191636.26926-15-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|MN2PR12MB4502:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a6d862-d820-4db3-7343-08db3ac15750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MmAyEa5oVIVl3CtWWYgdlvLVK6ewQoub2983E5bimxekYFO5Peb8HJsCasTmDKy/FzyLzXzOVomWOv2EFfH7ERRVTuHUGIYfKq54yrOp0jb8L+OG6ab/c/7eSpMtPAQeyXF1dyw7OlLUZV7gMQCeGsE2wKS6BmaFmzlBR80+wO7Z/IMmuca/CSfj4rCyJBtwSBtlAjnDlaJ6+5ulPhbbNEeddu0NNyXLzXtnhQgQo/sPjTEdQIlHQVC5wrJt+Q2dHRPbcLz90zCboCsQl5U+OcqJlPg6sZ0RLrXEdmqnEN7Ox3+7UupKtwwqmjgb34j4AyBqYsr1ZO7FWUP84f44ybjswyvoIlbJkiYcx5pyYDjerN7W4GaXoctw5xFMzz7eNNlzlGuTtURm1KSrhOEqnnnm1s9NU6n53DJuPYQL3njtUgGoQhYtMqFiXhYMXTKWLyBiaV8k5ew7WeCfLAFAR6y+YAc0EwCQYAcCemvz7YJKA1XGh7ygvZ6b+qrUXSH3W1iyKgQLTBD3h5gd+NdUHWzsVWQR9HfOajVGzAivWRoRRYkj2GMll49MUooNSHSWL5C5TAi7sj6hYuXl324GMIYIdayWJn4emzVeGGRfVyRYQZsXtk4BhqaF9SselyMrRpSuMC62XFvr1Q6AcaoQc5IZhXJXLs3UU5cTaVUeSB/uJgnQHukVeTC9TL4ycINQumm2Kk0n0lrIEEZJb8+WMESo8HpBytE9R4oFUgdIvk8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(316002)(82310400005)(54906003)(82740400003)(36860700001)(356005)(81166007)(70586007)(8676002)(70206006)(4326008)(86362001)(6916009)(478600001)(426003)(336012)(47076005)(186003)(2616005)(26005)(41300700001)(36756003)(1076003)(2906002)(83380400001)(30864003)(40460700003)(44832011)(40480700001)(8936002)(6666004)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:06.9640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a6d862-d820-4db3-7343-08db3ac15750
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4502

Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
using device tree overlay.

xl dt-overlay add file.dtbo:
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

The main purpose of this to address first part of dynamic programming i.e.
making xen aware of new device tree node which means updating the dt_host with
overlay node information. Here we are adding/removing node from dt_host, and
checking/setting IOMMU and IRQ permission but never mapping them to any domain.
Right now, mapping/Un-mapping will happen only when a new domU is
created/destroyed using "xl create".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/dt_overlay.c | 482 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 482 insertions(+)

diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
index 516e8010c5..3344bad313 100644
--- a/xen/common/dt_overlay.c
+++ b/xen/common/dt_overlay.c
@@ -36,6 +36,25 @@ static struct dt_device_node *find_last_descendants_node(
     return child_node;
 }
 
+/*
+ * Returns next node to the input node. If node has children then return
+ * last descendant's next node.
+*/
+static struct dt_device_node *dt_find_next_node(struct dt_device_node *dt,
+                                            const struct dt_device_node *node)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_device_node(dt, np)
+        if ( np == node )
+            break;
+
+    if ( np->child )
+        np = find_last_descendants_node(np);
+
+    return np->allnext;
+}
+
 static int dt_overlay_remove_node(struct dt_device_node *device_node)
 {
     struct dt_device_node *np;
@@ -109,6 +128,72 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
     return 0;
 }
 
+static int dt_overlay_add_node(struct dt_device_node *device_node,
+                               const char *parent_node_path)
+{
+    struct dt_device_node *parent_node;
+    struct dt_device_node *np, *np_last_descendant;
+    struct dt_device_node *next_node;
+    struct dt_device_node *device_node_last_descendant;
+
+    parent_node = dt_find_node_by_path(parent_node_path);
+
+    if ( parent_node == NULL )
+    {
+        dt_dprintk("Node not found. Overlay node will not be added\n");
+        return -EINVAL;
+    }
+
+    /* If parent has no child. */
+    if ( parent_node->child == NULL )
+    {
+        next_node = parent_node->allnext;
+        device_node->parent = parent_node;
+        parent_node->allnext = device_node;
+        parent_node->child = device_node;
+    }
+    else
+    {
+        /* If parent has at least one child node.
+         * Iterate to the last child node of parent.
+         */
+        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling );
+
+        /* Iterate over all child nodes of np node. */
+        if ( np->child )
+        {
+            np_last_descendant = find_last_descendants_node(np);
+
+            next_node = np_last_descendant->allnext;
+            np_last_descendant->allnext = device_node;
+        }
+        else
+        {
+            next_node = np->allnext;
+            np->allnext = device_node;
+        }
+
+        device_node->parent = parent_node;
+        np->sibling = device_node;
+        np->sibling->sibling = NULL;
+    }
+
+    /* Iterate over all child nodes of device_node to add children too. */
+    if ( device_node->child )
+    {
+        device_node_last_descendant = find_last_descendants_node(device_node);
+        /* Plug next_node at the end of last children of device_node. */
+        device_node_last_descendant->allnext = next_node;
+    }
+    else
+    {
+        /* Now plug next_node at the end of device_node. */
+        device_node->allnext = next_node;
+    }
+
+    return 0;
+}
+
 /* Basic sanity check for the dtbo tool stack provided to Xen. */
 static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
 {
@@ -148,6 +233,79 @@ static unsigned int overlay_node_count(void *fdto)
     return num_overlay_nodes;
 }
 
+/*
+ * overlay_get_nodes_info will get full name with path for all the nodes which
+ * are in one level of __overlay__ tag. This is useful when checking node for
+ * duplication i.e. dtbo tries to add nodes which already exists in device tree.
+ */
+static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_path,
+                                  unsigned int num_overlay_nodes)
+{
+    int fragment;
+
+    *nodes_full_path = xzalloc_bytes(num_overlay_nodes * sizeof(char *));
+
+    if ( *nodes_full_path == NULL )
+        return -ENOMEM;
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
+         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
+         * overlay >= 0. So, no need for a overlay>=0 check here.
+         */
+        fdt_for_each_subnode(subnode, fdto, overlay)
+        {
+            const char *node_name = NULL;
+            int node_name_len;
+            unsigned int target_path_len = strlen(target_path);
+            unsigned int node_full_name_len;
+            unsigned int node_num = 0;
+
+            node_name = fdt_get_name(fdto, subnode, &node_name_len);
+
+            if ( node_name == NULL )
+                return node_name_len;
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
+            memcpy((*nodes_full_path)[node_num] + target_path_len + 1,
+                    node_name, node_name_len);
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
 static int handle_remove_irq_iommu(struct dt_device_node *device_node)
 {
     int rc = 0;
@@ -367,6 +525,322 @@ out:
     return rc;
 }
 
+/*
+ * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
+ * overlay_nodes.
+ */
+static int handle_add_irq_iommu(struct domain *d,
+                                struct dt_device_node *overlay_node)
+{
+    int rc;
+    unsigned int naddr, i, len;
+    uint64_t addr, size;
+    struct dt_device_node *np;
+
+    /* First let's handle the interrupts. */
+    rc = handle_device_interrupts(d, overlay_node, false);
+    if ( rc < 0 )
+    {
+        printk(XENLOG_ERR "Interrupt failed\n");
+        return rc;
+    }
+
+    /* Check if iommu property exists. */
+    if ( dt_get_property(overlay_node, "iommus", &len) )
+    {
+
+        /* Add device to IOMMUs. */
+        rc = iommu_add_dt_device(overlay_node);
+        if ( rc < 0 )
+        {
+            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
+                   dt_node_full_name(overlay_node));
+            return rc;
+        }
+    }
+
+    /* Set permissions. */
+    naddr = dt_number_of_address(overlay_node);
+
+    dt_dprintk("%s passthrough = %d naddr = %u\n",
+               dt_node_full_name(overlay_node), false, naddr);
+
+    /* Give permission for map MMIOs */
+    for ( i = 0; i < naddr; i++ )
+    {
+        /*
+         * For now, we skip_mapping which means it will only permit iomem access
+         * to hardware_domain using iomem_permit_access() but will never map as
+         * map_range_p2mt() will not be called.
+         */
+        struct map_range_data mr_data = { .d = d,
+                                          .p2mt = p2m_mmio_direct_c,
+                                          .skip_mapping = true };
+
+        rc = dt_device_get_address(overlay_node, i, &addr, &size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                   i, dt_node_full_name(overlay_node));
+            return rc;
+        }
+
+        rc = map_range_to_domain(overlay_node, addr, size, &mr_data);
+        if ( rc )
+            return rc;
+    }
+
+    /* Map IRQ and IOMMU for overlay_node's children. */
+    for ( np = overlay_node->child; np != NULL; np = np->sibling)
+    {
+        rc = handle_add_irq_iommu(d, np);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
+            return rc;
+        }
+    }
+
+    return rc;
+}
+
+/*
+ * Adds device tree nodes under target node.
+ * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
+ * is done to avoid the removal of device_tree generation, iomem regions mapping
+ * to hardware domain done by handle_node().
+ */
+static long handle_add_overlay_nodes(void *overlay_fdt,
+                                     uint32_t overlay_fdt_size)
+{
+    int rc, j, i;
+    struct dt_device_node *overlay_node, *prev_node, *next_node;
+    struct domain *d = hardware_domain;
+    struct overlay_track *tr = NULL;
+    char **nodes_full_path = NULL;
+    unsigned int new_fdt_size;
+
+    tr = xzalloc(struct overlay_track);
+    if ( tr == NULL )
+        return -ENOMEM;
+
+    new_fdt_size = fdt_totalsize(device_tree_flattened) +
+                                 fdt_totalsize(overlay_fdt);
+
+    tr->fdt = xzalloc_bytes(new_fdt_size);
+    if ( tr->fdt == NULL )
+    {
+        xfree(tr);
+        return -ENOMEM;
+    }
+
+    tr->num_nodes = overlay_node_count(overlay_fdt);
+    if ( tr->num_nodes == 0 )
+    {
+        xfree(tr->fdt);
+        xfree(tr);
+        return -ENOMEM;
+    }
+
+    tr->nodes_address = xzalloc_bytes(tr->num_nodes * sizeof(unsigned long));
+    if ( tr->nodes_address == NULL )
+    {
+        xfree(tr->fdt);
+        xfree(tr);
+        return -ENOMEM;
+    }
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+    {
+        xfree(tr->nodes_address);
+        xfree(tr->fdt);
+        xfree(tr);
+        return rc;
+    }
+
+    /*
+     * Keep a copy of overlay_fdt as fdt_overlay_apply will change the input
+     * overlay's content(magic) when applying overlay.
+     */
+    tr->overlay_fdt = xzalloc_bytes(overlay_fdt_size);
+    if ( tr->overlay_fdt == NULL )
+    {
+        xfree(tr->nodes_address);
+        xfree(tr->fdt);
+        xfree(tr);
+        return -ENOMEM;
+    }
+
+    memcpy(tr->overlay_fdt, overlay_fdt, overlay_fdt_size);
+
+    spin_lock(&overlay_lock);
+
+    memcpy(tr->fdt, device_tree_flattened,
+           fdt_totalsize(device_tree_flattened));
+
+    /* Open tr->fdt with more space to accommodate the overlay_fdt. */
+    fdt_open_into(tr->fdt, tr->fdt, new_fdt_size);
+
+    /*
+     * overlay_get_nodes_info is called to get the node information from dtbo.
+     * This is done before fdt_overlay_apply() because the overlay apply will
+     * erase the magic of overlay_fdt.
+     */
+    rc = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
+                                tr->num_nodes);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Getting nodes information failed with error %d\n",
+               rc);
+        goto err;
+    }
+
+    rc = fdt_overlay_apply(tr->fdt, overlay_fdt);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Adding overlay node failed with error %d\n", rc);
+        goto err;
+    }
+
+    /*
+     * Check if any of the node already exists in dt_host. If node already exits
+     * we can return here as this overlay_fdt is not suitable for overlay ops.
+     */
+    for ( j = 0; j < tr->num_nodes; j++ )
+    {
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
+    /* Unflatten the tr->fdt into a new dt_host. */
+    unflatten_device_tree(tr->fdt, &tr->dt_host_new);
+
+    for ( j = 0; j < tr->num_nodes; j++ )
+    {
+        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
+
+        /* Find the newly added node in tr->dt_host_new by it's full path. */
+        overlay_node = device_tree_find_node_by_path(tr->dt_host_new,
+                                                     nodes_full_path[j]);
+        if ( overlay_node == NULL )
+        {
+            dt_dprintk("%s node not found\n", nodes_full_path[j]);
+            rc = -EFAULT;
+            goto remove_node;
+        }
+
+        /*
+         * Find previous and next node to overlay_node in dt_host_new. We will
+         * need these nodes to fix the dt_host_new mapping. When overlay_node is
+         * take out of dt_host_new tree and added to dt_host, link between
+         * previous node and next_node is broken. We will need to refresh
+         * dt_host_new with correct linking for any other overlay nodes
+         * extraction in future.
+         */
+        dt_for_each_device_node(tr->dt_host_new, prev_node)
+            if ( prev_node->allnext == overlay_node )
+                break;
+
+        next_node = dt_find_next_node(tr->dt_host_new, overlay_node);
+
+        read_lock(&dt_host->lock);
+
+        /* Add the node to dt_host. */
+        rc = dt_overlay_add_node(overlay_node, overlay_node->parent->full_name);
+        if ( rc )
+        {
+            read_unlock(&dt_host->lock);
+
+            /* Node not added in dt_host. */
+            goto remove_node;
+        }
+
+        read_unlock(&dt_host->lock);
+
+        prev_node->allnext = next_node;
+
+        overlay_node = dt_find_node_by_path(overlay_node->full_name);
+        if ( overlay_node == NULL )
+        {
+            /* Sanity check. But code will never come here. */
+            ASSERT_UNREACHABLE();
+            goto remove_node;
+        }
+
+        rc = handle_add_irq_iommu(d, overlay_node);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
+            return rc;
+        }
+
+        /* Keep overlay_node address in tracker. */
+        tr->nodes_address[j] = (unsigned long)overlay_node;
+    }
+
+    INIT_LIST_HEAD(&tr->entry);
+    list_add_tail(&tr->entry, &overlay_tracker);
+
+    spin_unlock(&overlay_lock);
+
+    if ( nodes_full_path != NULL )
+    {
+        for ( i = 0; i < tr->num_nodes && nodes_full_path[i] != NULL;
+              i++ )
+        {
+            xfree(nodes_full_path[i]);
+        }
+        xfree(nodes_full_path);
+    }
+
+    return rc;
+
+/*
+ * Failure case. We need to remove the nodes, free tracker(if tr exists) and
+ * tr->dt_host_new.
+ */
+remove_node:
+    tr->num_nodes = j;
+    rc = remove_nodes(tr);
+
+    if ( rc )
+    {
+        /* If removing node fails, this may cause memory leaks. */
+        printk(XENLOG_ERR "Removing node failed.\n");
+        spin_unlock(&overlay_lock);
+        return rc;
+    }
+
+err:
+    spin_unlock(&overlay_lock);
+
+    xfree(tr->dt_host_new);
+    xfree(tr->fdt);
+    xfree(tr->overlay_fdt);
+    xfree(tr->nodes_address);
+
+    if ( nodes_full_path != NULL )
+    {
+        for ( i = 0; i < tr->num_nodes && nodes_full_path[i] != NULL;
+              i++ )
+        {
+            xfree(nodes_full_path[i]);
+        }
+        xfree(nodes_full_path);
+    }
+
+    xfree(tr);
+
+    return rc;
+}
+
 long dt_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -391,6 +865,14 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
 
     switch ( op->overlay_op )
     {
+    case XEN_SYSCTL_DT_OVERLAY_ADD:
+        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+
+        if ( ret )
+            xfree(overlay_fdt);
+
+        break;
+
     case XEN_SYSCTL_DT_OVERLAY_REMOVE:
         ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
         xfree(overlay_fdt);
-- 
2.17.1



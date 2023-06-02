Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A071F754
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542802.847199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syg-0004u5-Lc; Fri, 02 Jun 2023 00:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542802.847199; Fri, 02 Jun 2023 00:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4sye-0004Q4-Tx; Fri, 02 Jun 2023 00:49:12 +0000
Received: by outflank-mailman (input) for mailman id 542802;
 Fri, 02 Jun 2023 00:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syX-0000if-KF
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b714f6-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:49:03 +0200 (CEST)
Received: from DM6PR06CA0076.namprd06.prod.outlook.com (2603:10b6:5:336::9) by
 DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Fri, 2 Jun 2023 00:49:00 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::c9) by DM6PR06CA0076.outlook.office365.com
 (2603:10b6:5:336::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 00:49:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:49:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:59 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:58 -0500
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
X-Inumbo-ID: 44b714f6-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBt9/TAmfGby1GHLGSdfMnmlFxbUXILygyrDIj0wSdeTaVLu9jLRp+G3aC8vqq5TOE8Cmtc8e1kyS6nUpygVUbtQs8bDMaTR9ifH1VMZwuDBxihlKrPZtjmauAMohmCILPhin5IFAuUqmyy8J57tkmMyr/7imirS1FEBYvW7EMipERkIFblmKfb7zpRVeWM+VHSAFYTUy6tvnv/zFCCgIF2NuUatjwrTM63YOVPyeSlafzhbtSUQNmQ9Mdzm36pdQ8qS2BghnmcptOGVoCDmeuUAN+yPCPws77apGLzhKRSw3aztRsHtPcYAYJWgnsJsF0P6GWO0Tu7rUo5IbCCL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1CA76xInbIr4hE8UWeQAMGW5FdBn6s0KkNux42XsEg=;
 b=UMIKE3Xr1I8kljc6mwrFLKsZJ+yE77EPkRIyCAv/SshEmzIlXR/J7NcKCgNTIs0IefJRc2J820G3kvDwqSPECSUZh2NgqWBT92bCaXrvfMT5WFFQT4GhjBx01+lEYWyTIy8J47OD4p0Hl6oqYmFT2d/a2+G4atdevHmY8KiS6BKg+RKv/noE+MsUhCGc7ZsS5FWZG88j5uA0e0ys7gmkuDtOek/m5rwvo0DAK6hvwd0zc0RkqqD6SM7iVlf266hztWYvZgwBbCKMkXkdYA3F0Dc/au0zEPZ24lnka2wMfNocZFQieEuisOD7NDjH65HSU4U5tjTY/hjP/UIvaVSFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1CA76xInbIr4hE8UWeQAMGW5FdBn6s0KkNux42XsEg=;
 b=5YZCiXEcIcc/skE2I50ZcFa3pZBPn7CnrdRetwiyhQSK4SK5yrMBVqwAjMwA0IuoCwbyR3AIETWfD5psAGS5BKX6+MggWSGyf8hWKTi2gZBmdfxq5cm/+AJxSE9l349ualBqe4fxSijbAjL9cfSxXZYlihGmEDCuSVMF4fVAsdY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v7 16/19] xen/arm: Implement device tree node addition functionalities
Date: Thu, 1 Jun 2023 17:48:21 -0700
Message-ID: <20230602004824.20731-17-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ed6f1f-2a60-4eda-f4e0-08db63032788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IAI3SYTR8xwIBtHmoRBc97aECGtJ0Fo+9VBEvDeJGf8O309xMa34AIKIyY7PS+X5yOvizcsSRZ6i/8E6Ap8EuFq7jG62k4duADsHRckJOItCQ6kMRt0agBOuDLcMTTVCuQ4jfkCQqT9E/G/BFyT7UvBH9IaI9EdRTPfDTx4myvtmbgsOy0LF/aw72RIrL3Lu6rYYk4R06wdgDqfKG2sB9U2DbHizwDfgsyknXPw8Ml+g9/5j6sIcgMv0NXSpkwkuAorvrsH5POnYn96IvdsRfcUa11uQTeymgE3YWqfxNUSG5CpjsYE5w1/HG7oweiH29vVcpDrsd9MfCOc04/k2HzZJQZQXhhKTuQ5HqGZqn619echqiz+6+7vlcIKGiBgxPCMGucoXb5HqPmKwkvfyW/Ecp176zjELQiwVqNcqbUtBLqKWeNaKpkSTcV5/8tBIL0yrvOpDzk3O+awwdVeeLi7HDO27abI/BkBkgO314w6u/PzMpO7/XI3KseB6QlftuUQb2gEFrdxKM9WnyN2zSUGETWuvK+TsjG/naZ843YpaFtTebxCNrIXK0FGiWAqlkDWWFgJAkMIW3pz40DssGxHHG/IwAYmV8DoNCnGw/ODXN9s2vwtxQLlQe9+dtBVMR/d7TNgMIWH6GmqQU0Zmfc/dVUZWtucgooxhhL8EiEF37Oik99qoylIIqF7YEKArCjvVb10TgsK6RxDJPTyAVXhdCzozsYmyjoYIwArsjxnbc1CV7dOi2syWCIH6gRCckOpsuAaA+PBp24maZ9MrNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(186003)(426003)(336012)(44832011)(2616005)(1076003)(5660300002)(83380400001)(26005)(8676002)(30864003)(47076005)(8936002)(2906002)(66899021)(36860700001)(40460700003)(4326008)(54906003)(40480700001)(6916009)(41300700001)(6666004)(356005)(36756003)(82310400005)(82740400003)(81166007)(316002)(478600001)(70586007)(86362001)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:49:00.1614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ed6f1f-2a60-4eda-f4e0-08db63032788
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815

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
Changes from v6:
    Fix comment style and add comment regarding false flag in irq mapping.
    Move malloc for nodes_full_path to handle_add_overlay_nodes.
    Move node_num define to start of overlay_get_nodes_info().
    Remove "domain *d" from handle_add_irq_iommu().
    Fix error handling for handle_add_irq_iommu().
    Split handle_add_overlay_nodes to two functions.
    Create a separate function for freeing nodes_full_path.
    Fix xfree for dt_sysctl.
---
 xen/common/dt-overlay.c | 533 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 533 insertions(+)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index b2a7e441df..12b6b010ef 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -33,6 +33,25 @@ static struct dt_device_node *
     return child_node;
 }
 
+/*
+ * Returns next node to the input node. If node has children then return
+ * last descendant's next node.
+*/
+static struct dt_device_node *
+dt_find_next_node(struct dt_device_node *dt, const struct dt_device_node *node)
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
@@ -106,6 +125,78 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
     return 0;
 }
 
+static int dt_overlay_add_node(struct dt_device_node *device_node,
+                               const char *parent_node_path)
+{
+    struct dt_device_node *parent_node;
+    struct dt_device_node *next_node;
+
+    parent_node = dt_find_node_by_path(parent_node_path);
+
+    if ( parent_node == NULL )
+    {
+        dt_dprintk("Parent node %s not found. Overlay node will not be added\n",
+                   parent_node_path);
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
+        struct dt_device_node *np;
+        /*
+         * If parent has at least one child node.
+         * Iterate to the last child node of parent.
+         */
+        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling );
+
+        /* Iterate over all child nodes of np node. */
+        if ( np->child )
+        {
+            struct dt_device_node *np_last_descendant;
+
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
+        struct dt_device_node *device_node_last_descendant;
+
+        device_node_last_descendant = find_last_descendants_node(device_node);
+
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
@@ -145,6 +236,76 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
     return num_overlay_nodes;
 }
 
+/*
+ * overlay_get_nodes_info gets full name with path for all the nodes which
+ * are in one level of __overlay__ tag. This is useful when checking node for
+ * duplication i.e. dtbo tries to add nodes which already exists in device tree.
+ */
+static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
+{
+    int fragment;
+    unsigned int node_num = 0;
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
+        if ( target_path == NULL )
+            return -EINVAL;
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
+
+            node_name = fdt_get_name(fdto, subnode, &node_name_len);
+
+            if ( node_name == NULL )
+                return node_name_len;
+
+            /*
+             * Magic number 2 is for adding '/' and '\0'. This is done to keep
+             * the node_full_path in the correct full node name format.
+             */
+            node_full_name_len = target_path_len + node_name_len + 2;
+
+            nodes_full_path[node_num] = xmalloc_bytes(node_full_name_len);
+
+            if ( nodes_full_path[node_num] == NULL )
+                return -ENOMEM;
+
+            memcpy(nodes_full_path[node_num], target_path, target_path_len);
+
+            nodes_full_path[node_num][target_path_len] = '/';
+
+            memcpy(nodes_full_path[node_num] + target_path_len + 1,
+                    node_name, node_name_len);
+
+            nodes_full_path[node_num][node_full_name_len - 1] = '\0';
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
@@ -369,6 +530,373 @@ out:
     return rc;
 }
 
+/*
+ * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
+ * overlay_node.
+ */
+static int handle_add_irq_iommu(struct dt_device_node *overlay_node)
+{
+    int rc;
+    unsigned int naddr, i, len;
+    struct dt_device_node *np;
+
+    /*
+     * First let's handle the interrupts.
+     * For now, need_mapping is set to false which means it will only permit IRQ
+     * access to hardware_domain using irq_permit_access() but will never route
+     * as route_irq_to_guest() will not be called with false flag.
+     */
+    rc = handle_device_interrupts(hardware_domain, overlay_node, false);
+    if ( rc < 0 )
+    {
+        printk(XENLOG_ERR "Failed to retrieve interrupts configuration\n");
+        return rc;
+    }
+
+    /* Check if iommu property exists. */
+    if ( dt_get_property(overlay_node, "iommus", &len) )
+    {
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
+    dt_dprintk("%s naddr = %u\n", dt_node_full_name(overlay_node), naddr);
+
+    /* Give permission to map MMIOs */
+    for ( i = 0; i < naddr; i++ )
+    {
+        uint64_t addr, size;
+
+        /*
+         * For now, we skip_mapping which means it will only permit iomem access
+         * to hardware_domain using iomem_permit_access() but will never map as
+         * map_range_p2mt() will not be called.
+         */
+        struct map_range_data mr_data = { .d = hardware_domain,
+                                          .p2mt = p2m_mmio_direct_c,
+                                          .skip_mapping = true
+                                        };
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
+    for ( np = overlay_node->child; np != NULL; np = np->sibling )
+    {
+        rc = handle_add_irq_iommu(np);
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
+static void free_nodes_full_path(int num_nodes, char **nodes_full_path)
+{
+    int i;
+
+    if ( nodes_full_path != NULL )
+    {
+        for ( i = 0; i < num_nodes && nodes_full_path[i] != NULL;
+              i++ )
+        {
+            xfree(nodes_full_path[i]);
+        }
+        xfree(nodes_full_path);
+    }
+
+    return;
+}
+
+static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
+
+{
+    int j, rc;
+    struct dt_device_node *overlay_node;
+
+    for ( j = 0; j < tr->num_nodes; j++ )
+    {
+        struct dt_device_node *prev_node, *next_node;
+
+        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
+
+        /* Find the newly added node in tr->dt_host_new by it's full path. */
+        overlay_node = device_tree_find_node_by_path(tr->dt_host_new,
+                                                     nodes_full_path[j]);
+        if ( overlay_node == NULL )
+        {
+            /* Sanity check. But code will never come here. */
+            ASSERT_UNREACHABLE();
+            return -EFAULT;
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
+            return rc;
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
+            return -EFAULT;
+        }
+
+        rc = handle_add_irq_iommu(overlay_node);
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
+    return 0;
+}
+/*
+ * Adds device tree nodes under target node.
+ * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
+ * is done to avoid the removal of device_tree generation, iomem regions mapping
+ * to hardware domain done by handle_node().
+ */
+static long handle_add_overlay_nodes(void *overlay_fdt,
+                                     uint32_t overlay_fdt_size)
+{
+    int rc, j;
+    struct dt_device_node *overlay_node;
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
+    rc = fdt_open_into(tr->fdt, tr->fdt, new_fdt_size);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Increasing fdt size to accommodate overlay_fdt failed with error %d\n",
+               rc);
+        goto err;
+    }
+
+    nodes_full_path = xzalloc_bytes(tr->num_nodes * sizeof(char *));
+    if ( nodes_full_path == NULL )
+    {
+        rc = -ENOMEM;
+        goto err;
+    }
+
+    /*
+     * overlay_get_nodes_info is called to get the node information from dtbo.
+     * This is done before fdt_overlay_apply() because the overlay apply will
+     * erase the magic of overlay_fdt.
+     */
+    rc = overlay_get_nodes_info(overlay_fdt, nodes_full_path);
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
+    rc = unflatten_device_tree(tr->fdt, &tr->dt_host_new);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "unflatten_device_tree failed with error %d\n", rc);
+        goto err;
+    }
+
+    rc = add_nodes(tr, nodes_full_path);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "Adding nodes failed. Removing the partially added nodes.\n");
+        goto remove_node;
+    }
+
+    INIT_LIST_HEAD(&tr->entry);
+    list_add_tail(&tr->entry, &overlay_tracker);
+
+    spin_unlock(&overlay_lock);
+
+    free_nodes_full_path(tr->num_nodes, nodes_full_path);
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
+        /*
+         * User needs to provide right overlay. Incorrect node information
+         * example parent node doesn't exist in dt_host etc can cause memory
+         * leaks as removing_nodes() will fail and this means nodes memory is
+         * not freed from tracker. Which may cause memory leaks. Ideally, these
+         * device tree related mistakes will be caught by fdt_overlay_apply()
+         * but given that we don't manage that code keeping this warning message
+         * is better here.
+         */
+        printk(XENLOG_ERR "Removing node failed.\n");
+        spin_unlock(&overlay_lock);
+
+        free_nodes_full_path(tr->num_nodes, nodes_full_path);
+
+        return rc;
+    }
+
+err:
+    spin_unlock(&overlay_lock);
+
+    if ( tr->dt_host_new )
+        xfree(tr->dt_host_new);
+
+    xfree(tr->overlay_fdt);
+    xfree(tr->nodes_address);
+    xfree(tr->fdt);
+
+    free_nodes_full_path(tr->num_nodes, nodes_full_path);
+
+    xfree(tr);
+
+    return rc;
+}
+
 long dt_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -396,6 +924,11 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
 
     switch ( op->overlay_op )
     {
+    case XEN_SYSCTL_DT_OVERLAY_ADD:
+        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+
+        break;
+
     case XEN_SYSCTL_DT_OVERLAY_REMOVE:
         ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
 
-- 
2.17.1



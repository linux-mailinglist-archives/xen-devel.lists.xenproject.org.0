Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BB793342
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596003.929842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhAD-0002mp-9w; Wed, 06 Sep 2023 01:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596003.929842; Wed, 06 Sep 2023 01:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhAC-0002hx-P3; Wed, 06 Sep 2023 01:17:00 +0000
Received: by outflank-mailman (input) for mailman id 596003;
 Wed, 06 Sep 2023 01:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhAB-00079K-C3
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:59 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11d49cb7-4c53-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:16:56 +0200 (CEST)
Received: from CY5PR19CA0013.namprd19.prod.outlook.com (2603:10b6:930:15::32)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:52 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::4) by CY5PR19CA0013.outlook.office365.com
 (2603:10b6:930:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 18:16:48 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:47 -0500
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
X-Inumbo-ID: 11d49cb7-4c53-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5kaXHWALsQ+FoipwxpxVEaWAc0LrtWdM8OpJvFud7JciadjvFPr5XkMikEf1up7/0EcZNsIaXR3ncPkBTRTs9h2ZrN/beiMyngosYONXgehzo1krkzhFBaEUxy4QdyWE33cTzNSwtutI2vlDrCDTaCOwWWNrCIzp+UyhKySn2ReHEZVBoNwKxlij5Qvsi4Lwz9qRs/knCsnKiDAYQF7wMjVo2T2f3LiqLp6JLCYMK3apKaSGyArVQx/V7OhuC6LfmC1lVVMtQ7HPEHAIKPqBJQmQO5M9fC9mTV54iy/s6HUlS1fqH84lLMBOI+3FtqDAB1V0LgAm604qTatpRwrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7T2p5a2Ff/HAq+v2RKRNl+IMs8XMzp5B2xd5/wlRh0=;
 b=eShWP/nIm9Ak9vNzON7i8BqDlG3yYBo+Y8x45h0QSU2Vx8K02NOAnYewjNV0kAOLhmMzIbmOkfmjIyfPtAQOadOskzaNS5ewyhUHcvEKuYHKGi7vv0avDnkLo70M00hfuLYUjsjKlFSd2zhsCmNXDhFyZO5Ox6DdB9Bd0Q3dCYUHKLEao3n9975drf7pol4CWnQqIsnx96DgUQy5Kj1jbKUUkh94kFu0wugqJYC0ADOPxwEgtZB50fMvL24YF90XUAzJr2eTwQ353dz+PjsP3jXViidb2DMO4sIYHsppTlSC87rDCqLHYguzqte+n16VHuQ4KFfuGajZ6OHY9yjrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7T2p5a2Ff/HAq+v2RKRNl+IMs8XMzp5B2xd5/wlRh0=;
 b=ZJnznf+V/xy/1gnhDPQe+xBo4ALdLAWPxyO0CCAkjATHyQOw9nQYOzExi42s8SWFn5Kp3txS/yytbl1JEJ3aEi+x44ioLmb1GX2mlNmRU8DrhIf6QwLKsZIq2U3ooJgWRwBNCDl9btNVhY1bFFFWpxCeeBE82m6Kf2JhjAxu9vY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 17/20] xen/arm: Implement device tree node addition functionalities
Date: Tue, 5 Sep 2023 18:16:27 -0700
Message-ID: <20230906011631.30310-18-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dcb88c-7b9c-4350-10d3-08dbae76f375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Ivz7wLxg7ke7jdxoL46u5PsuwSP/CCwfREfS/etRgoGSqCsmDPz+rqg5ITmk1XZMAo3h5v6ImUrcSzuliiNO6R1ug1FUi0V8a8i5SRmN/03mX3Y4SeFFgs5xQpGaJ++GqlvqN7t4D9xNwvt20u42HlCpv2cf1iae5e6UIE/EKf29VWgBw30FXkeD4w9JhU7PxZL1pr+4de54Qkx8xTiDaIvobpULA/7zEl2LrkxtK1Sp5U/EF1SbBzPvio2qwsqf6fgWFFIHhhyMyS1DmWgvlup9+fudGbjll+Zpbue8Gnm3YGxuL0SnAhEV59++XliPzfKWlYOf06nbiNoENXWERu9CiEDCxOSzggdqvjXPEmXsByV6kfyfHk+H2vCAK6AZKJDqst3Ei+rUnfzclBcmvGd/zvo+mi216CEMFJnx8ItJHgb03yiv2cGqYh6Kg9aYXGcBIAB74QdWlm2w1PX6Ag5RVaeyg1P8uj/rZhAuw5fZVtbvuo4YcoFVv09MV/1ONBUJptE0UGR5kN9CO/rTnRy2TvHhupelnvlfUqnXox2yFica374jnJbLCmMc0u+LdCt6eVuzsIq9A3iky12sQcTmqbwAzmik3rSlUfs4rsmRqGyCy7db7NgTlmT3aZAVGuAWcekQzCdWwU+LUI58pXUR4r/GOn7wu7w/TI2DXNH4mJJv3owsohOFzVqHwlt/XaBq7Gmu+OubV0C4Edj8ZJCLET0kTQkAq0Ri9qK6Us0q2G7XfzVvbaKgcZvy6gXYUVl8tROtoh7m8RTgQBJpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(26005)(5660300002)(44832011)(54906003)(70586007)(316002)(6916009)(70206006)(41300700001)(40480700001)(82740400003)(81166007)(356005)(1076003)(6666004)(4326008)(8936002)(8676002)(2616005)(426003)(478600001)(83380400001)(336012)(2906002)(47076005)(40460700003)(36860700001)(30864003)(66899024)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:51.5717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dcb88c-7b9c-4350-10d3-08dbae76f375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496

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
Changes from v10:
    Change int to unsigned int for accessing node_nums.
    Re-organize free_nodes_full_path().
    Change order of calling xfree for err cases.
Changes from v9:
    Remove add_resources() and use handle_device().
Changes from v8:
    Add rangeset to keep IRQs and IOMEM information.
Changes from v7:
    Move overlay_node_count() in this patch.
    Fix indent with goto statements.
    Rename handle_add_irq_iommu() to add_resources().
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
---
 xen/common/dt-overlay.c | 495 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 495 insertions(+)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 7b7224c29a..b07a6128dc 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -34,6 +34,25 @@ find_last_descendants_node(const struct dt_device_node *device_node)
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
@@ -111,6 +130,78 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
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
@@ -171,6 +262,102 @@ static int iomem_remove_cb(unsigned long s, unsigned long e, void *dom,
     return rc;
 }
 
+/* Count number of nodes till one level of __overlay__ tag. */
+static unsigned int overlay_node_count(const void *overlay_fdt)
+{
+    unsigned int num_overlay_nodes = 0;
+    int fragment;
+
+    fdt_for_each_subnode(fragment, overlay_fdt, 0)
+    {
+        int subnode;
+        int overlay;
+
+        overlay = fdt_subnode_offset(overlay_fdt, fragment, "__overlay__");
+
+        /*
+         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
+         * overlay >= 0. So, no need for a overlay>=0 check here.
+         */
+        fdt_for_each_subnode(subnode, overlay_fdt, overlay)
+        {
+            num_overlay_nodes++;
+        }
+    }
+
+    return num_overlay_nodes;
+}
+
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
 /* Check if node itself can be removed and remove node from IOMMU. */
 static int remove_node_resources(struct dt_device_node *device_node)
 {
@@ -359,6 +546,312 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
     return rc;
 }
 
+static void free_nodes_full_path(unsigned int num_nodes, char **nodes_full_path)
+{
+    unsigned int i;
+
+    if ( nodes_full_path == NULL )
+        return;
+
+    for ( i = 0; i < num_nodes && nodes_full_path[i] != NULL; i++ )
+    {
+        xfree(nodes_full_path[i]);
+    }
+
+    xfree(nodes_full_path);
+}
+
+static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
+
+{
+    int rc;
+    unsigned int j;
+    struct dt_device_node *overlay_node;
+
+    for ( j = 0; j < tr->num_nodes; j++ )
+    {
+        struct dt_device_node *prev_node, *next_node;
+
+        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
+
+        /* Find the newly added node in tr->dt_host_new by it's full path. */
+        overlay_node = dt_find_node_by_path_from(tr->dt_host_new,
+                                                 nodes_full_path[j]);
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
+        write_lock(&dt_host_lock);
+
+        /* Add the node to dt_host. */
+        rc = dt_overlay_add_node(overlay_node, overlay_node->parent->full_name);
+        if ( rc )
+        {
+            write_unlock(&dt_host_lock);
+
+            /* Node not added in dt_host. */
+            return rc;
+        }
+
+        write_unlock(&dt_host_lock);
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
+        rc = handle_device(hardware_domain, overlay_node, p2m_mmio_direct_c,
+                           tr->iomem_ranges,
+                           tr->irq_ranges);
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
+    int rc;
+    unsigned int j;
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
+    /*
+     * Unflatten the tr->fdt into a new dt_host.
+     * TODO: Check and add alias_scan() if it's needed for overlay in future.
+     */
+    rc = unflatten_device_tree(tr->fdt, &tr->dt_host_new);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "unflatten_device_tree failed with error %d\n", rc);
+        goto err;
+    }
+
+    tr->irq_ranges = rangeset_new(hardware_domain, "Overlays: Interrupts", 0);
+    if (tr->irq_ranges == NULL)
+    {
+        printk(XENLOG_ERR "Creating IRQ rangeset failed");
+        goto err;
+    }
+
+    tr->iomem_ranges = rangeset_new(hardware_domain, "Overlay: I/O Memory", 0);
+    if (tr->iomem_ranges == NULL)
+    {
+        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
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
+ remove_node:
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
+ err:
+    spin_unlock(&overlay_lock);
+
+    if ( tr->dt_host_new )
+        xfree(tr->dt_host_new);
+
+    free_nodes_full_path(tr->num_nodes, nodes_full_path);
+
+    xfree(tr->overlay_fdt);
+    xfree(tr->nodes_address);
+    xfree(tr->fdt);
+
+    rangeset_destroy(tr->irq_ranges);
+    rangeset_destroy(tr->iomem_ranges);
+
+    xfree(tr);
+
+    return rc;
+}
+
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -390,6 +883,8 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 
     if ( op->overlay_op == XEN_SYSCTL_DT_OVERLAY_REMOVE )
         ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+    else
+        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
 
     xfree(overlay_fdt);
 
-- 
2.17.1



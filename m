Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF6377EE75
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585028.916027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDJ-0001K3-Uv; Thu, 17 Aug 2023 00:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585028.916027; Thu, 17 Aug 2023 00:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDJ-0001HQ-SJ; Thu, 17 Aug 2023 00:50:13 +0000
Received: by outflank-mailman (input) for mailman id 585028;
 Thu, 17 Aug 2023 00:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4J-0002YP-Ot
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:55 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b86a9530-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:54 +0200 (CEST)
Received: from CY5PR22CA0102.namprd22.prod.outlook.com (2603:10b6:930:65::29)
 by DS7PR12MB8419.namprd12.prod.outlook.com (2603:10b6:8:e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 00:40:48 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:65:cafe::56) by CY5PR22CA0102.outlook.office365.com
 (2603:10b6:930:65::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.17 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:47 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:47 -0500
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
X-Inumbo-ID: b86a9530-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuAfk2uwb1/J5a9cEN4i4gaa/wDjzr1vql7fuP/3L2K6waJU6N7DMNGSiwIYwDfVgVRBOoVjg1K8FqKweCKE+qUJyPMpwyHCM8hc3q88sHgirFVgQM9orSSTlXQ8c3Rm8dnzbIFRlgxEJhcwWT7JTybM+wAqZxmj2K5KXB2Mxowp44WGx/Nw5FhEQjbIb9R8EF+efjE5KQ0qr4SV26fn/LEAd9Q3Ip+OP32B+lyHmN/Cal8IvgFctA0fCo0N9kNXE/WTtZdjnRp7SeS/qBcuXN0jDPCWSS60m0R5JlFJifbZctkrc07Z0p1Sw6sEbqjQq8gc8N3ca6tL4t+IQ0Bruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPpQyIsbQQm551WyZIbVYkVkl2lQHIpUSyitSnytScg=;
 b=XOUc7/3tTnAHG/2abXyVmO+3ml9eEf0eT7nkextsL4WU6L5YcWYRX+5m9AFJsgvoWCgowmxIsFPtpO4Av4B10ih7tydi2S4Xoq72coAYA4auU6bdYomnum0v/vgdiPG0D/L7umgk3+e8vUT6Xsbxwz3mXVUjbHWpd6S/XZJEfyQFiLEXTzR7fW6fEqaViUz9B0DXisi9xNJtXjL+7KzMZvEx8UlPtFQlyaaL2A/0OQMIilmuPvWNn750RX2+skTPArzn9ZYKzg+QeWVt2LR03rpojhBxynCs6mTgBaYiXFjGohhRAvmreUIFfvtSKjEkKtG6EDPtKbkE9Mg3D/Ak6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPpQyIsbQQm551WyZIbVYkVkl2lQHIpUSyitSnytScg=;
 b=a0i42WX65OflptOfbYBNZq4Qk5iztZBDZbFQii/jEpCE5F4V16L/s7pIG95p896Tq1MgajWYUyozLMKQyGN77KxtdXSA7De/6/FJbn2Letsl5cBYUJNBj7UAHTLhY/p0L6xk8f2AkRNO7Dse+3okCfEI212XVFNdbtRgSKrx31Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 16/19] xen/arm: Implement device tree node addition functionalities
Date: Wed, 16 Aug 2023 17:39:44 -0700
Message-ID: <20230817003947.3849-17-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS7PR12MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 76faa5e1-0f98-46c6-37e9-08db9eba99de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0lYaIoGNK/ZaS6QQ83mMWBv6UpXeo7uEnIgik6P119UyHUjM0HWJqIg0tmGow70H5tnFZJvHPwunnO6OYxT+aZZE/q4m8Erqp0xedwWPTndAl3asO5zjlFFwlKXKPHZNfJdlQMXcl1snsdF7SRyb4JCa2YB6AYOaP7ThlFtJO+dbPFxW+6+SvmlRsKvCqoKwmbHagKojgGNjaIthiidyfI4D0ma+y+V7fITAHzH8cdIRh29JLzroiWTPhkrk2cNgOjp4vaSvJDQhnHc9/8r90s9k4pQ/VNgFtEorw837VoV2frEHulYmDsLx0gy+jmpa4U52IQbWDVfQwA+nI7rmj04mM0YPKB0flpzroUjcB79XLgqi/IaSCgfRCyif4oV7kzjiMnki6ryz28/kcQ3OMKo9WYzV4I1hlJFFr31/oAf4nsLLwS3DweF5qtJApxCIC706s7YId1R086/GN4lB63dkXYTPBe/PQYiWRnWzYc6gwn8js3vv+uwbKvMT1BnKUR6dOkzhUHWh34VBq67+fYB8rUy30PGd5NTA4c33GHRQ/0ax9riHviwPsWKBWRGj3QoWJ8EET+9ec5wILxmg1PdZCpPySE7Quj6IK56SHNNZD6NIMQUH8Itw+qUavl0qYpxVUnor4gDupVjnEF71uvQTWix2/fig1Cr6o+NCWPWKUcwUqOciS/aBFLQ0AMof6grJcdUR4QqKGClFoXyKjOS+ARCwwVxQkiSHNy5WIhK0K82mx/lnJ9rn7Ds2469my5NR/7sgFb0YuXvknKG22Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(66899024)(26005)(30864003)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:48.4233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76faa5e1-0f98-46c6-37e9-08db9eba99de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8419

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
 xen/common/dt-overlay.c | 559 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 559 insertions(+)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index ac104964b1..480ccd5a23 100644
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
@@ -124,6 +215,102 @@ static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
     return 0;
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
 static int remove_resources(struct dt_device_node *device_node)
 {
     int rc = 0;
@@ -348,6 +535,376 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
     return rc;
 }
 
+/*
+ * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
+ * overlay_node.
+ */
+static int add_resources(struct dt_device_node *overlay_node)
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
+        rc = add_resources(np);
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
+        rc = add_resources(overlay_node);
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
+    /*
+    * Unflatten the tr->fdt into a new dt_host.
+    * TODO: Check and add alias_scan() if it's needed for overlay in future.
+    */
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
 long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 {
     long ret;
@@ -379,6 +936,8 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
 
     if ( op->overlay_op == XEN_SYSCTL_DT_OVERLAY_REMOVE )
         ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
+    else
+        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
 
     xfree(overlay_fdt);
 
-- 
2.17.1



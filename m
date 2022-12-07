Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C8F6453EA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455864.713553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nle-0004KK-MB; Wed, 07 Dec 2022 06:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455864.713553; Wed, 07 Dec 2022 06:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nle-0004G2-Em; Wed, 07 Dec 2022 06:18:54 +0000
Received: by outflank-mailman (input) for mailman id 455864;
 Wed, 07 Dec 2022 06:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nld-0001e0-13
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02ab86e9-75f7-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:18:49 +0100 (CET)
Received: from MW4PR03CA0177.namprd03.prod.outlook.com (2603:10b6:303:8d::32)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:42 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::cd) by MW4PR03CA0177.outlook.office365.com
 (2603:10b6:303:8d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 06:18:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:41 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:40 -0600
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
X-Inumbo-ID: 02ab86e9-75f7-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu9sv2pmwQtVrKGOBIJrtcGkKZSoRjsJUKo0P7TUNLyiksoRIDXbzxMlTPKUTkmrNs6b/sdjBEjGpZKXy2TDeWtl2iY+qOb9qgO1kZTGyQS8RBjjRpALlbyeovW2/rNZok6897MZHy5GsS0NkNBWvU5ra1LIJSrmHvP43VUIJnbg8YD8sFTN3p8K/hmpo1+v8HngaDzaIoG0UhtKtqLH9R3xyk0Yo/ugtDrNup3XMffKMdUryi4jnCxsKvI4v2n5NxaAx8i2kSVp4X0W934hjsKAf8tiYEdRqqbRVjh7i3jd3MPJR+HSzbCCGm/jtNZfhk67LvCCpJE4+ESdLRp/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K37W2xBZWHNKyU8WFAoV3vosjD3ABc6TdacNZiA/BmU=;
 b=AdWMclY4MWLB7f658pF5WT79TPBJA0VUUekFzr36z4igIKWkFrtrmWkhRjgzAnw4RROD7oMZF17QqBlnFGkrXVrZQ59tb/GWcOXkH458n02K6RBvMEXo45jAT5ScJ8XypEoExFPAz4RCgd1wdGHescx/dpj2ViZlAHmBwGNfiCpmBwFvTAyDq+3svMrlPMCpYI8YEda2kN0r0qJ70i0koYDoDZj3/oHbCUEZaZnYsqbgVPw2OU58vKZk7+5Kwc+21ayN43TC/lHIJvtSGhPhF9sd8riqApd3eMD1tPoxwlwI7zEFBHwFzOneBHnWwKEavEHLwCv6zEQaRs4MEUPj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K37W2xBZWHNKyU8WFAoV3vosjD3ABc6TdacNZiA/BmU=;
 b=c93feq9udmz5nVUDcb5N3+KMtmkcq+XABN5YcOiojzQgVOar90TelQY2av6FP7UZM1U4ykADqmj2vdpKIAT0GKkYVrFBmjzXv5v6Bqj03trrksV52jzc3C/56qamag7qAAi3vpL8bYyde0TXnX9Io3zTC4VxL6r4Pv6hl3ogNSU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN][RFC PATCH v4 13/16] xen/arm: Implement device tree node addition functionalities
Date: Tue, 6 Dec 2022 22:18:12 -0800
Message-ID: <20221207061815.7404-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT022:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: 921af667-2afa-4fda-e9a9-08dad81ae375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nv50eSh/1et9UdT522j+pt8atIpKrwmbKjPYr2Bymg9CvBY5HceUdeuloI9oq5qcOFNZ1bQngo1nT9Agt4Z6dB2pj2O21SE0WJ7Zq9Jw3edLy+Z35pcqcb5uSZN01QfBRucJb8CjoHlZeEMmlCsA0nFtxPBPr/2RFUEwDAXdaJ+yteCG1rAwscyTuNcfJIhFY5ufoczkZi+XvPbEfF5gb0F3LYQCIb+FRz8OxcSHt0ghMVxsv5RFnMX/oiGBbTcLdcpxJxfoMoGICy8q9SxLDoKafQU+/CxQClg/GNKPf9lpQB3sO8By6pkmiWa+hSKFkQ5FHyn27DUA2BQXy/05yQykDm2gy2y70V5ehJ9EbJ1YTQENIWtgHJmIie+hjwD3wNr9zwBNutw5SxKwD05eFmCLBDBOZnIkia9To21pzrYs8u9NiP5BZT/It92l/pS4NZMpS6cMXbKp5xTRX6TTvntG24x9d2WzI5fAki0Yy3cuEY8YhCrapKJN9qvJWi+/ZeoDmgkQJK2dru259F2QkD4G5/2zay8b1Ugj9PasNs8+mTDNpBImXz8bEa0PUtT4HSMAqOkXiE9PLC8YcgT1CTIoJPpMMpZsM2J6dOJZ0bem9i6A6Mo6A/2FrKuxGyQuQNVP8A1c/QzvP8hx30ZHftlNn+BpE7rrNhNK/kELq8oRcIQjT2rRXdyP2ZkjOPssniBLOrKxqGxKh4F8orM8dlkkjZM2M+VySOJDA2Jc8EM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(426003)(47076005)(83380400001)(186003)(41300700001)(336012)(82310400005)(26005)(36860700001)(1076003)(8936002)(2616005)(5660300002)(82740400003)(30864003)(2906002)(8676002)(44832011)(81166007)(4326008)(6666004)(40460700003)(478600001)(70206006)(70586007)(356005)(86362001)(54906003)(36756003)(6916009)(316002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:42.1532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921af667-2afa-4fda-e9a9-08dad81ae375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457

Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
using device tree overlay.

xl dt_overlay add file.dtbo:
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

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/dt_overlay.c | 465 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 465 insertions(+)

diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
index 477341f0aa..f5426b9dab 100644
--- a/xen/common/dt_overlay.c
+++ b/xen/common/dt_overlay.c
@@ -38,9 +38,29 @@ static struct dt_device_node *find_last_descendants_node(
     /* If last child_node also have children. */
     if ( child_node->child )
         child_node = find_last_descendants_node(child_node);
+
     return child_node;
 }
 
+/*
+ * Returns next node to the input node. If node has children then return
+ * last descendant's next node.
+*/
+static struct dt_device_node *dt_find_next_node(struct dt_device_node *dt,
+                                                struct dt_device_node *node)
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
@@ -114,6 +134,74 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
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
+        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
+        {
+        }
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
@@ -153,6 +241,79 @@ static unsigned int overlay_node_count(void *fdto)
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
+    unsigned int node_num = 0;
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
+            int node_name_len = 0;
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
@@ -373,6 +534,302 @@ out:
     return rc;
 }
 
+/*
+ * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
+ * overlay_nodes.
+ */
+static int handle_add_irq_iommu(struct domain *d,
+                                struct dt_device_node *overlay_node)
+{
+    int rc = 0;
+    unsigned int naddr, i, len;
+    u64 addr, size;
+    struct dt_device_node *np;
+
+    /* First let's handle the interrupts. */
+    rc = handle_device_interrupts(d, overlay_node, false);
+    if ( rc )
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
+    int rc = 0, j = 0, i;
+    struct dt_device_node *overlay_node, *prev_node, *next_node;
+    struct domain *d = hardware_domain;
+    struct overlay_track *tr = NULL;
+    char **nodes_full_path = NULL;
+    unsigned int new_fdt_size;
+
+    tr = xzalloc(struct overlay_track);
+    if ( tr == NULL )
+    {
+        return -ENOMEM;
+    }
+
+    new_fdt_size = fdt_totalsize(device_tree_flattened) +
+                                 fdt_totalsize(overlay_fdt);
+
+    tr->fdt = xzalloc_bytes(new_fdt_size);
+    if ( tr->fdt == NULL )
+        return -ENOMEM;
+
+    tr->num_nodes = overlay_node_count(overlay_fdt);
+    if ( tr->num_nodes == 0 )
+    {
+        xfree(tr->fdt);
+        return -ENOMEM;
+    }
+
+    tr->nodes_address = xzalloc_bytes(tr->num_nodes * sizeof(unsigned long));
+    if ( tr->nodes_address == NULL )
+    {
+        xfree(tr->fdt);
+        return -ENOMEM;
+    }
+
+    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
+    if ( rc )
+    {
+        xfree(tr->fdt);
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
+        xfree(tr->fdt);
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
+    rc = unflatten_device_tree(tr->fdt, &tr->dt_host_new);
+    if ( rc < 0 )
+        goto err;
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
     long ret = 0;
@@ -397,6 +854,14 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
 
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



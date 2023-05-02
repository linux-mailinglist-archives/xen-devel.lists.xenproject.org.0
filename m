Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3C6F4DAB
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528873.822653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZA-0001Fh-HZ; Tue, 02 May 2023 23:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528873.822653; Tue, 02 May 2023 23:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ9-000150-I9; Tue, 02 May 2023 23:37:51 +0000
Received: by outflank-mailman (input) for mailman id 528873;
 Tue, 02 May 2023 23:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ6-0005Si-Om
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56cde790-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:46 +0200 (CEST)
Received: from BN9PR03CA0251.namprd03.prod.outlook.com (2603:10b6:408:ff::16)
 by DM4PR12MB7647.namprd12.prod.outlook.com (2603:10b6:8:105::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 23:37:43 +0000
Received: from BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::8) by BN9PR03CA0251.outlook.office365.com
 (2603:10b6:408:ff::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT101.mail.protection.outlook.com (10.13.177.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:40 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:40 -0500
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
X-Inumbo-ID: 56cde790-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+CBlD4/N0WIl6ao3jV5P6Wv5qMbul26Yjh9mI5DwgaymAwiNKw/amRYWmNZGTfp3fzAjzcZxOOTBagXx6zCsqBe2j09bhcCT8qUR9nFYsCw5ayia2K3EzKm9z+c2ipeXZBpcSDGZaAk+Q7d9Htoh0EUxOhPCn8WiKJZle0AQSWfs/zNpnGwjlDif25uhC7XNH/at8OQUtnFaueowFB01OA7/aNKJT3WwUm/LLJNB18XuvNJgtbpVR7w1jn9XY9Cwy5KLHLV0H1Zqu+GVQWthMcMLEouOl0u5z814f1JTb7GIbDRj221ltOVe/YZ5k9dcHhKJhQckzZrLSZSTsW+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAz4bXIcLBaNxB7D8chHRJkgDHozUzgRvSx6fTSNQTA=;
 b=F7HyEkG+GLwlElxdZczQOhg9mmuvbLSMRxkaOk6v9qgRuZIvRupd+6El8aa1WkB+eDy78qsDEP3ZWq3PeeHMJQLJipyRtbzeZquFPSrFFX6Sluu8MlD9M0qmYs+DnAvyxS+VsAQOdmD16YNNTobdS6+ts1/DKfElwkd3xjShBt1g/NeA6g/MBd32CvU+IGqF3AIAJimRN1w43GtiBNTx6+wW6GEkS2K4fZvMZ0iogVma8zhuXpje8DyuaG8Rz0XJidZ2t+WVefKlayhCJGOoc+KOcKJsIFuZrfnrHjYUb889soCDbOY1adXtiyNZMmjnaEQxCN9d3Goa8keIakrX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAz4bXIcLBaNxB7D8chHRJkgDHozUzgRvSx6fTSNQTA=;
 b=tvwnbBv0YwQoW7fIrtmBRyeA/qbvHPPniXYcQF5dZLJDTAj1ggmq3qLLyoBs75aSCqiDKKkW+9E50/THsMvuilQAJP+PSMeUzZ3ge5W9CnBLylvVHGemuCzZceD23O46wQuhIcXpfHg+Lamascd6G4qNHHk0eKi7qeUBaVSKsw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: [XEN][PATCH v6 16/19] xen/arm: Implement device tree node addition functionalities
Date: Tue, 2 May 2023 16:36:47 -0700
Message-ID: <20230502233650.20121-17-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT101:EE_|DM4PR12MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cb53a0-6b2e-4327-0398-08db4b6639b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1hPgD0kpSyOEMfq6/nPxjohfDV4v+5ckgSAvz0uL7Xh2ayAcX333ubGPBXhgr9M4Y8QQuaaD/t26ORibFv3saFNqXXJzWpW27YcQJdXklOyVITQyWTcWkKhkR3LpE0mhAatM2zqzScbsjodCUYigyhO9VYuT3qwbExXOuaLpzLJ7CNFkh/luYDSEqrI7kRig/0gNyKL1EORQcPgfNJ2iVBwGGv7wgoocxgoPLLAH6bhef78rD8caJ98SrFy6ipMK8A8VlCZS/1U4RFbfK+G8zYajluUuBnUHkzIiW6qInYciCaDLQ+lcNuNVhOIJRfstvPRyK265gKVcC/ikmgy2aDGdcHeJ6m2Epq4dW7LTia2pFWwFvLEK3OmZysf8kSMJOqZzE90ajzTSe7mDtva1cjQVKjHDTr72NjqJe9rTfIlj+nkwEuR1mdKe4VOS19YogYQIbEgLtqkvmE1hr1fD+SL6ZqDYAGRxqqvvumQWHkHgf4K8/9+0ujSnQGPZ874SMrUq51dMbv8nfHUUD6uov6aofwBfRMTr5ka2ndauqP6IOFjD9SAazAW2nZrKpzN88d5AkmQwHxFc9kT3XUtfZZZ1n4n+VpoH1gQ5gZsT4K+68kDYlt02Ye4+ocVAQPQdwPzuTQG45f1j81QG/hn8YbhDGyZ5Iodrqxh5Kx++bDNwVaoU9qNmlkLKj/BEPfq/4ztuuMhYPtl6VtGYLrzh9AAy6L/2XEfjheeDrOXE//Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(30864003)(66899021)(426003)(44832011)(4326008)(82310400005)(36860700001)(336012)(83380400001)(47076005)(2906002)(5660300002)(8936002)(8676002)(41300700001)(36756003)(316002)(186003)(26005)(70586007)(70206006)(6916009)(1076003)(356005)(81166007)(40460700003)(82740400003)(54906003)(86362001)(2616005)(40480700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:42.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cb53a0-6b2e-4327-0398-08db4b6639b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7647

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
 xen/common/dt-overlay.c | 510 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 510 insertions(+)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index b89cceab84..09ea46111b 100644
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
@@ -106,6 +125,76 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
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
+        /* If parent has at least one child node.
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
@@ -145,6 +234,82 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
     return num_overlay_nodes;
 }
 
+/*
+ * overlay_get_nodes_info gets full name with path for all the nodes which
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
+            unsigned int node_num = 0;
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
@@ -371,6 +536,344 @@ out:
     return rc;
 }
 
+/*
+ * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
+ * overlay_node.
+ */
+static int handle_add_irq_iommu(struct domain *d,
+                                struct dt_device_node *overlay_node)
+{
+    int rc;
+    unsigned int naddr, i, len;
+    struct dt_device_node *np;
+
+    /* First let's handle the interrupts. */
+    rc = handle_device_interrupts(d, overlay_node, false);
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
+        struct map_range_data mr_data = { .d = d,
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
+        printk(XENLOG_ERR "Increasing tr->fdt size failed with error %d\n",
+               rc);
+        goto err;
+    }
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
+    if ( rc )
+    {
+        printk(XENLOG_ERR "unflatten_device_tree failed with error %d\n", rc);
+        goto err;
+    }
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
+        rc = handle_add_irq_iommu(hardware_domain, overlay_node);
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
@@ -395,6 +898,13 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
 
     switch ( op->overlay_op )
     {
+    case XEN_SYSCTL_DT_OVERLAY_ADD:
+        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
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



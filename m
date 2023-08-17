Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121277EE6B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585003.915978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4D-0005Cp-FB; Thu, 17 Aug 2023 00:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585003.915978; Thu, 17 Aug 2023 00:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4D-0005A1-A3; Thu, 17 Aug 2023 00:40:49 +0000
Received: by outflank-mailman (input) for mailman id 585003;
 Thu, 17 Aug 2023 00:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4B-0002YP-Jl
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:47 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3fa0aa7-3c96-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 02:40:46 +0200 (CEST)
Received: from SN4PR0501CA0047.namprd05.prod.outlook.com
 (2603:10b6:803:41::24) by SJ0PR12MB5486.namprd12.prod.outlook.com
 (2603:10b6:a03:3bb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:43 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::91) by SN4PR0501CA0047.outlook.office365.com
 (2603:10b6:803:41::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:43 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:34 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:33 -0500
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
X-Inumbo-ID: b3fa0aa7-3c96-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMOMkF3u8iNMs/AxnqzdM0ki90BrG7yvrFn3FZrl3kRfvYZUBb7rXu7LnuVxUO/sBD9N44CJfKk6MB9WVEeWASw1wdFJi7c6EnzQKyKlhMtTqnre7F6/nTYYjLJaVKJsxN3YxI7P9d3dXjDyEOwH3LNQqGZRd8delLJq9RAOPZDwzzbD6P9nAce2O9TCyCpW+YNSeqGT3u61XPl3TQJgikiKbp6CmS6nJLye1/rncGFFWwi9Z0I05IBXgEZWW02OxDxz/ZiT1zN3R5IRrPyJdx2LMZYVdDUM2Rh6uHzLA0MLUFAA/W89HxEwAUJIoNqNar2d1nSmkW/L3wqnXJQdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xHkFrH8SopbUhm47gT/XcnanhxswGsDSx0kdqePZ4A=;
 b=RUpp9T/tjRar/MHOyjlLEpa2eB4WG+2Y0ezJDr5jSm5C3XyOUAJzASbNIU7ZpdT3M9Iwj+Iz2AutWyduGs6sAow+1IFN4eeFsX3FU/tYJeHosUA2BfLa+7uoTbNBJk6EW5lzAUbzmuizWmpuHFvpDukBht2bzz9J9IgNvmciGO1Md1x4HPQyN0cLJbRHt1M2IEOMAuzRKms4wqim9eR/AMAm9DM2rkm6ct5OP0rNvaaJF45cJpRVSqXSKsup+PaTuW0eY62vfSbFEqlPp0Wdkzxi/OPu4l1LHmMqA1WKs2QnlCxLeBtuiA0hIFmkIvA/dOgSqXLnM3AGIHROc0djAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xHkFrH8SopbUhm47gT/XcnanhxswGsDSx0kdqePZ4A=;
 b=xtLsPwRJJvcU+9egjU6pb6yq4KzOUCq89OdZZ6uBPCzEysGk60w7nnURf4lTQagejFtlvidt5c4MyMBITBu/Pn+wnCAkYh7xzV063aXTigVDVCpltzX+GW93sA0yjL1BJDhFSQxOr2c6O2HBhNxYbsq+N+evPK49GbSCSvdtnQo=
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
Subject: [XEN][PATCH v8 08/19] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Wed, 16 Aug 2023 17:39:36 -0700
Message-ID: <20230817003947.3849-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SJ0PR12MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ffabb1-e155-4aa2-b24e-08db9eba96d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhZKrBkO7vSxbYiiS4hI1UbXGhVakjLNyykXah3E5PI7tZTNMf67/0kDom8+lXBAA+6plm1P8aRFwz4wPfTpicbTeIq4FEeB4oqiR9ief55sEbpyZbp5SAhY+0BHG2PrX6Fj6QTDUpLu4dQQbHnYnDWK0Jy81X2olBGfP6s7AfEdHfXYtN19vdhVnq5rqxFf/JKP023lcCwzKkTXvMIh9wVKuDNvULPxVO3X2K0DhFMEsLIr8DtSCyXjDLCiuKTHcgElZQ52Cx9Xzpq+/jTxiE9QGo2cP4WjUxFVD7B72cbKycjLlr2BqI9+/BVTj50NGxGueQbH7PVqWBkgvLpXEc8TTV8dks8trHaKBwfB9BLhHJADSdeFR5/g3yx/Shq1wNDYVFO6b3Be2rigG+miV/nwGfeVsgAWudYFjSC2Gr68Axy9yKKY4d43hMHyFxZSdhYXYOWrGswr67q9EmKfJP6SKSsElAi7Z95hBhEw05wnz2Lo5IJZORZN/dRTsqZM7cnk04sdVk15z6QrsRl9dYSAh5V8wTPE0FL0HNm+0GFUdTHYah0I1cHu4olYvTjiWMt5U9I/bhdI5x88tA6EK6ol/TUT/0s5KoF9thyhI3it6kFRid4s2Oi/plnezyFNGxfNov1fQREOI1SVWpJCSRMNoAf5bmWNp6aZ6qR+1cpc9hUqH2tYfR14FmHSkJQfK0irpyGH5P1uDZcp1+h50I68L48shoymR0dwRNxJ/q3tD0TPXw6baht8ub/jAlMn4gh1ajJgJTOGV/4lSN6EVZ2a1JHWpIbQjnNPIBl2yA4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(1076003)(2616005)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:43.4256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ffabb1-e155-4aa2-b24e-08db9eba96d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5486

Add device_tree_find_node_by_path() to find a matching node with path for a
dt_device_node.

Reason behind this function:
    Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
    device_tree_flattened) is created and updated with overlay nodes. This
    updated fdt is further unflattened to a dt_host_new. Next, we need to find
    the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
    and add the nodes as child under their parent in the dt_host. Thus we need
    this function to search for node in different unflattened device trees.

Also, make dt_find_node_by_path() static inline.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Rename device_tree_find_node_by_path() to dt_find_node_by_path_from().
    Fix indentation.
---
---
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 67e9b6de3e..0f10037745 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
+                                                 const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(from, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 5941599eff..e507658b23 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -568,13 +568,27 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * dt_find_node_by_path_from - Generic function to find a node matching the
+ * full DT path for any given unflatten device tree
+ * @from: The device tree node to start searching from
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *
+                    dt_find_node_by_path_from(struct dt_device_node *from,
+                                                  const char *path);
 
+/**
+ * dt_find_node_by_path - Find a node matching a full DT path in dt_host
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+static inline struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return dt_find_node_by_path_from(dt_host, path);
+}
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4196F4DA2
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528863.822587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ1-0007V9-4D; Tue, 02 May 2023 23:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528863.822587; Tue, 02 May 2023 23:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ0-0007Rn-U7; Tue, 02 May 2023 23:37:42 +0000
Received: by outflank-mailman (input) for mailman id 528863;
 Tue, 02 May 2023 23:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYz-0005Si-Hf
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53775b0b-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:39 +0200 (CEST)
Received: from BN9PR03CA0343.namprd03.prod.outlook.com (2603:10b6:408:f6::18)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:36 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::43) by BN9PR03CA0343.outlook.office365.com
 (2603:10b6:408:f6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.32 via Frontend
 Transport; Tue, 2 May 2023 23:37:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:33 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:33 -0500
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
X-Inumbo-ID: 53775b0b-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcuBEpgBv91+CABaEHG+sQ13V2oVko2y7E2qN/5olSnow6SkQ+e+yyDAb836RN70VOUGaV90hYDVSa27niA4ayCVwQoOt02mfu+k4kEobVnj9G2oyeYg/7SpbE/FJ5nqCgNCrElGFrFGstapy/Hv1E2S3FS0PpfNaoX20JkYDudfKiuAQbmrDTeCQ0GFXgD3MVLrFnve3e30AYtjM6fvwTLUqjUjJGgPmLSnke0u+Xl5tJpKoaVfxSNHu2oNXvU6cptQAwbf/bwzAqKNYs9bSCJVF7u3gUVCJWXl4W7SU+Hb8I1YQH0S/+347z2LPlTVkeTIee4hqjLCxgr4JjxWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LptqMUkxHVxrSuaM+i6CgX8fqOqrHiX3/jew+F/gQRs=;
 b=P5m/nNPtt7VhJ+pgTHeLyfND9vt7eBABWqquZOefh7SK/CVMMtlusCr/PoLJj58WB0KuvT8srAFToGBx7q0WdFPWDilN/rM1EU/BDpEWNF4aYEmXWWXV0ISbMXVTdFoR4kyK7F2U9MPSL1EaFDrQevS9emZT2ed3u1HNE5adJvI6Eg1p6elajde6wJTDH2V0wFBDfACLY70kdeUAxDjss0ykfQKxB7b6PkAhzifjgpq8uPz2DxLOBszkPLL9tnf5I7vzkkC0YmxWvTxbm3T5wirzdnq2VzXslrAXuKKVC0G1jmgLrCrLPdtHXcxefFjeph5C13/vY7UNiVhFcRCyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LptqMUkxHVxrSuaM+i6CgX8fqOqrHiX3/jew+F/gQRs=;
 b=w2IDg1FiVeNBJgY/xOdKhF9kBqNjIivZ1AzFnDhj95o/f++ewR0Mga7GrIvkOIlNU+lo2HVVGRrgAHMnMu5MATjB5JpJl0r9kgOSoB2NsdNcz4S5AKOKazjoFCaOsPgssVMlkhvz1LmlCf47gfcJvXLyWfV94QjW9+lVL0yfoLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v6 08/19] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Tue, 2 May 2023 16:36:39 -0700
Message-ID: <20230502233650.20121-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7d9bfb-95f8-4823-ffc0-08db4b6635c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnVNrl+EWQRdKhMY7bSFdykTa7BAPjsgesGWpRYzgt3des1TrY6lbV8bTx/RSGE/6bFXXXz3mzRE6kQf+3X2bk5oJnkQRcc7WBBEsrjJxBzR8GUwoN6pgR+S77tDxhBkhbg1Y9pIQEA7Olycq75K+X8MIBVhghJCbdsgsEUulzmI0RhNPr2ZPy18El+vNcYMg9//H7gOWxsFdVlI8ykTjbT/GZNhcEwiNYkE/3ctwXj9LpYUeC50SmZtMayqvbRQz+0iLywP6Gpc3tYTWEQXR4DebiSh0iOMxDPfgSGy3/kmLCLkSiFnQHCSeVlBniI853HZ+/GcIceOU9rXq0EFvYO8nRf2rjlgmZ+TX48Eo9VjFMfihoiPKrtk4Jw/FVX3lUCVMWWwxlHqncYWfA3IBFGOp+LmQMZVJaDXpHQG48p3YPuNZByepSTyp7oFTeEfPlyVPpoyE2Htxd9K8PGPqNNfDqcOm3ulPFH8sFGR73SX+gSS6c0kcd46rvWcncxcVxh174TD2RaGzLpSZ5GJsTsFNrgU7FE2geHXrxs6z5p1S65mYDBasXV2UaoAdWMQ8eLxcu3rVmTD+MEGTYkmg7kaAsVd5RvPXNKvek4fGhqx8uvUc7q8WzX6A0tzAinnYwPNsjvR740o9gjRGJkRT7bZ1xcqEOVx6hciulPNN1kEwjCTJGltj12IrExAQWTy9Q2ZPobgGPsnspKEyjCRqfDLlEc8jrLDm1rqOUwOIy6pZav127Epdm4y4Yvw3p701bFIJu94gKtPWtmgoVcFlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(36840700001)(40470700004)(46966006)(81166007)(41300700001)(356005)(5660300002)(8936002)(8676002)(70206006)(70586007)(316002)(82740400003)(2906002)(86362001)(40480700001)(40460700003)(44832011)(6916009)(1076003)(26005)(186003)(4326008)(336012)(83380400001)(36860700001)(426003)(47076005)(36756003)(82310400005)(2616005)(54906003)(478600001)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:36.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7d9bfb-95f8-4823-ffc0-08db4b6635c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103

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
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 47ab2f7940..426a809f42 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(dt, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index eef0335b79..d6366d3dac 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -534,13 +534,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * device_tree_find_node_by_path - Generic function to find a node matching the
+ * full DT path for any given unflatten device tree
+ * @dt_node: The device tree to search
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path);
 
+/**
+ * dt_find_node_by_path - Find a node matching a full DT path in dt_host
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+static inline struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return device_tree_find_node_by_path(dt_host, path);
+}
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.17.1



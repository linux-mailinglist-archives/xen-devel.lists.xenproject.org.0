Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594303FE982
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176918.322108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYs-0005JF-Fa; Thu, 02 Sep 2021 06:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176918.322108; Thu, 02 Sep 2021 06:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYr-00058P-UQ; Thu, 02 Sep 2021 06:50:57 +0000
Received: by outflank-mailman (input) for mailman id 176918;
 Thu, 02 Sep 2021 06:07:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsU-0004ds-5y
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:10 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.100.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01ae88ce-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:07:09 +0000 (UTC)
Received: from DM3PR12CA0074.namprd12.prod.outlook.com (2603:10b6:0:57::18) by
 PH0PR02MB8501.namprd02.prod.outlook.com (2603:10b6:510:100::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 06:07:08 +0000
Received: from DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::8) by DM3PR12CA0074.outlook.office365.com
 (2603:10b6:0:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:08 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT042.mail.protection.outlook.com (10.13.4.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:07 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:05 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:04 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsO-000F6q-Ug; Wed, 01 Sep 2021 23:07:04 -0700
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
X-Inumbo-ID: 01ae88ce-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQLsUwitGlfNT7El7H4B/XS7vcpOlCuP/nodYDXRqQkXDeLL04P0W7cYSfDMKGPtH0AbUkmZFOX5nWIdLeZy6vWnUNESCqlg6nQzfS4ht43yxzw2uTaYy9KN1e88ohU+8r0KfXBxfqfxo97N1fcCiJAsl1nvZOzEiFxz1nZyzg6WLGQPOZrg35nUqc84G3fsTGCMoagz1SDvySFGmu875Brmw6ZgRgooquKEXkZUdDUaW737wPQjEzy5QO5Jpluxd6IPhCoJAeIhUVn5nQH81XdrXf3T5jtxMe0WszjetHKnjU+cuqGb5d5rJPNN1y6gaDkZeCNIewxuaMq3I346kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQqiWML3nRBgAmoYFeaXNgx+nXTK27DqgxYrbIIxS+4=;
 b=Fw8d6SeJXhmuguBjdLmY99Wwotpio0YOuUCFzzVbWSn+WsIQaw4+4/CeKH2+ruwASa4t4P2CBfm1eWis+A9Uy1jITMljZaBBxM0on3nZYre/UuU2+fHY/s3FJouDH7ZhcAfVxHURiBjTSmwlqfJsEzuuCSrEwe5Sb8RwckxRINNhzAo217+b8dQrxL8N4chvAg7CYjGXuJT97QB8GHRd3D9mAudWhgDyeJuEMfHAqcwkFiH2TTGsIicLmuKHlHKZqoBa/YP2b3l54n27o6ORY8ZHItHEsS/LB0NAxaMsXrldiyT0spy8UxYr0LrxHGt81H3kEHWLZtul+7voG8uHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQqiWML3nRBgAmoYFeaXNgx+nXTK27DqgxYrbIIxS+4=;
 b=bYD62rRraU3PKWxLybe0b2QGpjErYChmHJwCmVGwIkmBM1E5XlYWcgzaj4e6pWT0oyrKQvWRm5ulz7DQcSUDue0+HedEjxHDd2px7TTkm05+bMLBB/Gg/DRY5pc/2PvDEAHU4ILDqEEqgV8WBUOV9ljDcTwJMYLi3ESjdZxo5T8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH 06/13] device tree: Add dt_print_node_names()
Date: Wed, 1 Sep 2021 23:05:56 -0700
Message-ID: <1630562763-390068-7-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3613ec78-5dcd-4519-f133-08d96dd7e514
X-MS-TrafficTypeDiagnostic: PH0PR02MB8501:
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB8501F13CF415DE8BBD61E09CBCCE9@PH0PR02MB8501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zthyOMV3KedVnyLP35/3+eY38V0CwfqIzFmRHxK9tLY7wM6M9jxmRgrxqR8NzYhhIMkWg//XpjuzbLt1AepqGZi73OonoWXkDmTiXW27iFtgSZJVIeukVxIZlqHA/uynne6XkDwNOgniVQwpicQmOJDJwF3UjPsihvA3wXR+bZpR3cyoOgX5HKMkC14zVquC8H+xLO1OTJlBEuGZHBrtTMaH/+kzXLJYVXfCwIyf/LZswVXemlEA+zcCboGZKoFm54BAGYXe7APBk0K1L6nokdbBjNXfaE2VRYgt9fD0ddcpNqEOLvAejQdjP11hjPgdPR2LB6Z2IpjSQ1SqmryNOv4xvmvuxCWwjFzvupbrTwNJGXOyVG2J5mWeVaz3vKTOOFUnb6wGtfe4SRNC+9eHM36uUamS/k6KP+VJtbbKdixrW2ZZ0BLU72nvNINHeiFmYY7kspSOjwKPmmdqq3saD1jPQC2V67BPzILD+Lzqt1AtOlwJOax1nPF6eNFAq99Kk5wocNO2CImmhvhxuAshcJYeWTj1zhpYjL3uQa4wxlGOoCBT+mnaWE1xFsVtMlZVbbHzFbqmHiwc2iTXXugYkH9ZJm2l1R9cZNdm6eG493rQzXm5r0Y6KQRLzTJff9wknn8ON58geKCJSTQJAJ0Faf9AfLrc8/cA1BTAmqa6rR15lHk85dQdlE2P7WEHcHMY1Sah9XkS5lFRCm9E3fBBuvbMLeGfHwPMwwYd5KgErs0=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(426003)(186003)(2616005)(6666004)(8676002)(107886003)(36756003)(7636003)(2906002)(26005)(6916009)(82310400003)(70206006)(70586007)(336012)(47076005)(316002)(36906005)(36860700001)(508600001)(7696005)(5660300002)(9786002)(4326008)(8936002)(356005)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:07.7477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3613ec78-5dcd-4519-f133-08d96dd7e514
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8501

Add dt_print_node_names() to print all nodes under a dt_device_node.
dt_print_node_names() takes a dt_device_node type input and prints the node name
of all the subsequent nodes. This is added for debugging purpose for device tree
overlays.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/device_tree.c      | 10 ++++++++++
 xen/include/xen/device_tree.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index cda21be..bfe3191 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -308,6 +308,16 @@ struct dt_device_node *dt_find_node_by_path(const char *path)
     return np;
 }
 
+void dt_print_node_names(struct dt_device_node *dt)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_device_node(dt, np)
+        dt_dprintk("Node name: %s Full name %s\n", np->name, np->full_name);
+
+    return;
+}
+
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node)
 {
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index a4e98a7..dcd96b4 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -483,6 +483,11 @@ struct dt_device_node *dt_find_node_by_path(const char *path);
 int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
                           struct dt_device_node **node);
 
+/*
+ * Prints all node names.
+ */
+void dt_print_node_names(struct dt_device_node *dt);
+
 /**
  * dt_get_parent - Get a node's parent if any
  * @node: Node to get parent
-- 
2.7.4



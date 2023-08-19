Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D01781615
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586694.917967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q8-0002Tt-MQ; Sat, 19 Aug 2023 00:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586694.917967; Sat, 19 Aug 2023 00:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q8-0002NA-E8; Sat, 19 Aug 2023 00:29:16 +0000
Received: by outflank-mailman (input) for mailman id 586694;
 Sat, 19 Aug 2023 00:29:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q6-0001hl-4H
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ab3fcb3-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:12 +0200 (CEST)
Received: from DS7PR03CA0208.namprd03.prod.outlook.com (2603:10b6:5:3b6::33)
 by MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:07 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::c3) by DS7PR03CA0208.outlook.office365.com
 (2603:10b6:5:3b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:06 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:05 -0500
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
X-Inumbo-ID: 6ab3fcb3-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMjrYQfksDu95ajSOCgQ8ruu7xNKTuFMxgpgb3UDXjRpqU2oPglAS1DJJj58xKU5fXUl8NVBjfD4WNbI+o+8A2mNaYC2c6MBXp+X/lMvczwIuRQTGVt7nN2VEEZMXckyXhi6VeZqJyCJEY5517IJ5EPcFbka/COm6CPb//JQPm7PtURp0ek0vI02JpqVSGh/12LDiDFMOqoEFdQPjDGyjPe/6o2gH7lziKS952NpYQOvRjp7QG0iGvrLcPMnGz4JyguKxrCZ17FSO5l3VYXNU1uB4b5WS3SYCLNikLBxHS3qW53pZExedb21RCJXlxPrnYc+1WgSL/+Z6203mTx3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07WMr1ZLM39ba2ZtlvUhJ2PaUuqZrZEmQIHsuGgAwEE=;
 b=Nkx5FVO9axXc9AUmG+M0To6M/ZVewRahzgzgrZc6THEnhVrGQFQzBnDUnSe508b7SZf1VmuCf9t3+/i3Wj/vk0o86XkKnXBZLAIcbYVX/iVcxHuZiNm5AoDsB/K46WBUHmoM8wG2znt1fWhrgFWmC9Fi5XqIIKE37UDBpbKJ81aZizFXeY677GjkCtLVQszjxh+lVuGaz0PKl9zBzuwg++e2rPdf67yUAKYXtrn/IKRAD1qAsXtwrUPuVdUXYIIABdZ7ycO8E0PJjnk7Q9KSng/l+D/IkhkRzsUHUAxrwviB4WbHW4yeuIr9RgykdJ/rPSsq/HlL4yckhe66rWXJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07WMr1ZLM39ba2ZtlvUhJ2PaUuqZrZEmQIHsuGgAwEE=;
 b=artidS65jGcm72cSkKjLzmf0x4hPPv9fXWobCtaH7syj9wNF8SizVFHC5c/smmms6Ppmm5p8+RKb1MmlpfBz3x4US3AXpN4+AuT2JKNNxFgj5NeOr3fZWySSTYhx5acKblENGwlg/3cEeoudehit4LPF+WJfG8loJ6Z7JTdUxiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v9 04/19] common/device_tree: Export __unflatten_device_tree()
Date: Fri, 18 Aug 2023 17:28:35 -0700
Message-ID: <20230819002850.32349-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 9171c701-fa13-424e-42f9-08dba04b4c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRcvJgbEQoe5rE21Lz0VIWN1QcKF3WtU+5HJTKuyB5mQTwVcL1+Q1T50OhJNtMaS+aI4xUEhJDkLNaXSRLdhwagny/v8V4UPKM+qu2aek58ZvWta0eLOpZQiZMd6Fisk9EiiFdmlPosoSO5ksUJrRu58h32+ZmKnrtpqeqkP1ionFDZZisIWtb9M2ZH1sQmYhQE9I0i1UdM5NBfg+4gGZjwpdWSHVVu6/xixLzPUmLncMvXaXvknVotogwaa4X8ppJZKc6C4H6NdestlHgh8Jl+u5esScGDUpTQRalw9uWaA9qGESohdqW37qcjKMij+vmhFlP7uodML7YtLPdxZvFy16tprEUxK6WhlT7R7YisGA2zErOeEVgRdPqWP0m630R2LbTEz2ZzsJb7b0716wcVQB1i1M6WjnEg07aVQ2hpVLryGgGq3tc75TGjyXVVYwu212TrtUieoOan9T+KhtMl4acs3T3qxY2yacW4+rwiGEuItDyo9ddKrLpBAIq7gD6iC3RSB6JxC5sYFsnmxkjGQjN01xqdkPPSCcetQnvgbZrJolapgJTJrZOvZ2dwIZQbD0IhStdTCAy4f2s2RWmsb1U9Xod3vr3ukVaRTiDQdMF/pruarzd9M6mDm5Zx6WnPi2YYUnbakkcoq/18vr9zBnBI8DYDDWK8DXizWDR5mpHyMx+TfCIXt6GmkAzSz6S3ugyNA917cjEJTqEgtsCtLGm7MuHxhGWqqwKHnK5aRGurDwtjW+sZsIva9/uMDuOKNDyTazqpy2o7VgTiOXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(2906002)(6916009)(54906003)(70206006)(4326008)(5660300002)(44832011)(8676002)(8936002)(316002)(41300700001)(70586007)(478600001)(6666004)(2616005)(1076003)(26005)(336012)(426003)(40460700003)(83380400001)(47076005)(36860700001)(82740400003)(86362001)(81166007)(356005)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:06.5389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9171c701-fa13-424e-42f9-08dba04b4c54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove __init and static function type.

The changes are done to make this function useable for dynamic node programming
where new device tree overlay nodes are added to fdt and further unflattend to
update xen device tree during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v7:
    Update the commit with why unflatten_device_tree() is changed.
    Move function documentation to device_tree.h
---
---
 xen/common/device_tree.c      | 17 +++--------------
 xen/include/xen/device_tree.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index d70b6a7ac9..67e9b6de3e 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2082,18 +2082,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
     return mem;
 }
 
-/**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
- *
- * unflattens a device-tree, creating the
- * tree of struct device_node. It also fills the "name" and "type"
- * pointers of the nodes so the normal device-tree walking functions
- * can be used.
- * @fdt: The fdt to expand
- * @mynodes: The device_node tree created by the call
- */
-static int __init __unflatten_device_tree(const void *fdt,
-                                          struct dt_device_node **mynodes)
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2232,10 +2221,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
 
     if ( error )
-        panic("__unflatten_device_tree failed with error %d\n", error);
+        panic("unflatten_device_tree failed with error %d\n", error);
 
     dt_alias_scan();
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 1d79e23b28..5941599eff 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -178,6 +178,18 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/**
+ * unflatten_device_tree - create tree of device_nodes from flat blob
+ *
+ * unflattens a device-tree, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.
+ * @fdt: The fdt to expand
+ * @mynodes: The device_node tree created by the call
+ */
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.17.1



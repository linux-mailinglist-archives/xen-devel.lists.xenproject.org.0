Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512392D0B0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756902.1165634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVWU-0006tL-U1; Wed, 10 Jul 2024 11:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756902.1165634; Wed, 10 Jul 2024 11:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVWU-0006qx-RJ; Wed, 10 Jul 2024 11:30:10 +0000
Received: by outflank-mailman (input) for mailman id 756902;
 Wed, 10 Jul 2024 11:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drOD=OK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sRVOt-00011k-Ob
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:22:19 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20620.outbound.protection.outlook.com
 [2a01:111:f403:240a::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9c43a52-3eae-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 13:22:18 +0200 (CEST)
Received: from BN9P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::22)
 by CH3PR12MB7692.namprd12.prod.outlook.com (2603:10b6:610:145::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 11:22:10 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::6) by BN9P222CA0017.outlook.office365.com
 (2603:10b6:408:10c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Wed, 10 Jul 2024 11:22:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Wed, 10 Jul 2024 11:22:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 06:22:09 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 10 Jul 2024 06:22:07 -0500
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
X-Inumbo-ID: a9c43a52-3eae-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKRHZ5jb8SOGZUdDfViQy4fLM6wNiNmPHJhgd4uVxcml81aocyQxgdqmomfJIrlBRx78xlA4As99t9jdEJhnijJuyogXm770Y8DU2qBoO3ic5mwF2n30pUeYOH6BIVCATeElIHon//e+z114e/rkONpon5aTcg9RY1NcT6yEcz1EyQAchYRccX5GsWeRR7Yz04WKqEfmgTjNpO9Ffaaq5kiUZxwXaajDob01Ic6kBWB9yzNjir5rJ6W/mPLvp0auWDrM2lZYSmHZdYEngQ2TA0iv5ZIrnnQCJev1haOnXTYbYEvWcE+vX5vAfcYjceC5Bo99FHKiuNyPWOK/QbH1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z43cZeKSdhq3v6JXln/ykC0j1uv41JjKp5FJGFs3XtE=;
 b=YjExbOcqpfmGB9XyFMkJWCdgXzPQe70kK+g3/AleptwziRDrzvFbhYsDnar9VK9d1Ppz2yck3fEa3WcRdzicJCpYlZAXVyzNe1ttv81qOS5vSxcohnLNepxz3ncR3/scmcavYg9Oj4/4/4+pRXNgh8Lkc9fTrb01FiLhBUIQk/vnS1MpdsbPDZNRpbqPmnv4l2I5OpWdvLyK1JsSMXBEWIcjOlNjOj7oGuyHRUGkZCMnzEBniYn/N8XL805fEIWqoqy4YdySOD0H5niPG1CY0o3QX1rim62SNQ6LiLyTYvW7c7HuGECOTb0Ioy7TnXUJYZazC33syW9hwRSDuppT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z43cZeKSdhq3v6JXln/ykC0j1uv41JjKp5FJGFs3XtE=;
 b=5eigp3WEKqXsLgiw61C9MlZs66CGYjU0COs9Prsbt4bc+Qnc6X5SqldBZdXlvesuh738QvXWk6CpwydctSwr4epWUQvU5+IzLqVurq47JUCjK8vCRORo8JecN++waolmDsPCh6YY7a2dIVEnHdJNJdgHNe/Y1Usu4l8rWAKX0UA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH for-4.20 v2] xen/arm: bootfdt: Fix device tree memory node probing
Date: Wed, 10 Jul 2024 13:22:04 +0200
Message-ID: <20240710112204.33542-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CH3PR12MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: a546f256-c261-4f3a-7b5f-08dca0d28a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dl6RomFeiMtPoQIZk/bH4uFZs0BsziWXv0mRqACO9XTIR3XpKpHx/1JNXlft?=
 =?us-ascii?Q?KQBfdL7ldJ7WWYGnYiMngkyBCCyaUjT0+pjQZ9onLpIiKUTLmsuSXlzhAvx3?=
 =?us-ascii?Q?WN9JOYRwyKdkMOcC4LfKWNxI6hwagGztCEtfKWnLBEyChcibp/Ca210fVoH+?=
 =?us-ascii?Q?7R4v2ujD1/8wGbJe4fuJXY6gZ3E7KygcMotz5XgX9cWj66ncJKDYJ2M8NHWl?=
 =?us-ascii?Q?axmnOfucPiPT1yaB1+Tyy/uH6JD5I8DsbqjsZHx97ttQGXclAZLTT9btjAmU?=
 =?us-ascii?Q?LlQwgg0seNNnlM7WUYoygxqjsS3n8h4xBPK/BJEK+31BF484aL9/qe6qN2DQ?=
 =?us-ascii?Q?kVwdWAyfXmcKe4M1UipM2Eqhf7KR4K8mQWzgKCTg1Fl9KYM3yBGrGFNAl6HT?=
 =?us-ascii?Q?LrLgjkpoJQ+eLoN1atSoBC7VyO7GM4W95APJ3rnin4pC68ELnil5FGsDubhb?=
 =?us-ascii?Q?G206R4/nvQmdvboA5+3f+ozsobaW75nB8OPtrSdUIAX34CtfhbLSBEDJrjZf?=
 =?us-ascii?Q?Mg5lUf8BeOeGIgry+R7DSUjAondGr8KAiDVUCsvn3f7hQSxjKueEXv87Mco6?=
 =?us-ascii?Q?evhOvmUUkVD+P1jubjkrtx/s3qdp0EHiez5A8xXiPhQeiyJMDaRqMluIhyT1?=
 =?us-ascii?Q?9AkH81WwvGvCBYHxbvZhEOPn6/5Akw1ROcDHtp0U1+phOarllrTqn33wCfC4?=
 =?us-ascii?Q?WC0nNPum4h5NAG1Lo3hb/tSE5uAV2GBboyTNrggNQ8U78z96fCxu7ldNGkgK?=
 =?us-ascii?Q?esDjhOSV6Q9zR/OcGoMAWh3yzHVPSc2qbrzBFGMYd4LS7LE4R9z92hCWcVAT?=
 =?us-ascii?Q?a76FvQ51dTS3gFJyNBf1XtlWOVU5X6B3cCDL7ls0dKwtb6C66HCpTali2FD2?=
 =?us-ascii?Q?FQT5swBDjXtHZ4EhTUXibHTISWAXPpTq9+jkwcxDMg17D41yYoQpaLcM1ZLr?=
 =?us-ascii?Q?hft5QVYrWIAn/u+7tvbVgvY5BYFAZO/YWjNeToHcTwdui5fNWA6IWjHZou5z?=
 =?us-ascii?Q?giZnVyIJra34geI2Iat4wS/Qgqu+Y9x5JmBcSDGnswDeicSLWKxFPhSYI3Ii?=
 =?us-ascii?Q?wJu3NaM5hgshV6Z50NycgI4uHvLtIBsHnJtVmP0h8lxB0eanacvfxMKWYMa1?=
 =?us-ascii?Q?T4B5JQSPnNCJ1VdPTmgBnUf5nYwEaZ+yYsV4CWvnvz++sj9eivmaVLhK9FDj?=
 =?us-ascii?Q?rVpGE/JVAWv8+JmPoFv4fgLyU6OFOO0NE5QGVMHnDImm+PntQ/IMzTQBK6+x?=
 =?us-ascii?Q?h7wd466Ht1ntgUu3KMC+QzkE9sFY4g5rNYFY+3qVsHAIFVQsGoOSYrA15kxf?=
 =?us-ascii?Q?O4oal1GnLFd2kVZ0kVl2ZAiLjT/0R4dFamn+o2cI72qsl4LYFf0uSq+Dw4fW?=
 =?us-ascii?Q?5hLOtPVnqy69P7GGjmraR6R+tFXmzwUn2sEFwXgq0A0LSL1LiHblC6ZyH64S?=
 =?us-ascii?Q?ysUpThHrv7d/ikHlvEKwlnxJTPQ8GdIr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 11:22:09.7442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a546f256-c261-4f3a-7b5f-08dca0d28a14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7692

Memory node probing is done as part of early_scan_node() that is called
for each node with depth >= 1 (root node is at depth 0). According to
Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
as a top level node. However, Xen incorrectly considers all the nodes with
unit node name "memory" as RAM. This buggy behavior can result in a
failure if there are other nodes in the device tree (at depth >= 2) with
"memory" as unit node name. An example can be a "memory@xxx" node under
/reserved-memory. Fix it by introducing device_tree_is_memory_node() to
perform all the required checks to assess if a node is a proper /memory
node.

Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and size")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
 - improve the length check
---
 xen/arch/arm/bootfdt.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 6e060111d95b..f2892fce0a9c 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -83,6 +83,32 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
     return false;
 }
 
+/*
+ * Check if a node is a proper /memory node according to Devicetree
+ * Specification v0.4, chapter 3.4.
+ */
+static bool __init device_tree_is_memory_node(const void *fdt, int node,
+                                              int depth)
+{
+    const char *type;
+    int len;
+
+    if ( depth != 1 )
+        return false;
+
+    if ( !device_tree_node_matches(fdt, node, "memory") )
+        return false;
+
+    type = fdt_getprop(fdt, node, "device_type", &len);
+    if ( !type )
+        return false;
+
+    if ( (len <= strlen("memory")) || strcmp(type, "memory") )
+        return false;
+
+    return true;
+}
+
 void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
                                 uint32_t size_cells, paddr_t *start,
                                 paddr_t *size)
@@ -448,7 +474,7 @@ static int __init early_scan_node(const void *fdt,
      * populated. So we should skip the parsing.
      */
     if ( !efi_enabled(EFI_BOOT) &&
-         device_tree_node_matches(fdt, node, "memory") )
+         device_tree_is_memory_node(fdt, node, depth) )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, bootinfo_get_mem());
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
-- 
2.25.1



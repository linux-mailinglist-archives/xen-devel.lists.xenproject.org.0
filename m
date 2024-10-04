Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423D89902DC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810345.1223079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKa-0007T2-Dv; Fri, 04 Oct 2024 12:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810345.1223079; Fri, 04 Oct 2024 12:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKa-0007R5-AX; Fri, 04 Oct 2024 12:22:48 +0000
Received: by outflank-mailman (input) for mailman id 810345;
 Fri, 04 Oct 2024 12:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKX-0005ue-Va
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6f64b9-824b-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 14:22:45 +0200 (CEST)
Received: from BY5PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:180::17)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:22:38 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::e5) by BY5PR13CA0004.outlook.office365.com
 (2603:10b6:a03:180::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.10 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 12:22:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:36 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:35 -0500
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
X-Inumbo-ID: 5b6f64b9-824b-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLEncfoH8xaSWzO7h/E+0tPRLcqlcBRxUIXkZZgUF2RgePyqZVvBPBbT4UfS221bZAT6IjiQTMIqaN9sEZiGp+f+SL8zv+8jA2zddWTNomBQcpzI3+EgUsoyvOWJqtM/8k592zy4qwRwdB7FfHDjtVjp2Qy3ENyn2gkivPHHZVeQogs0z2vc25sMG13GGXKOjzmlpfzNrdUgMOetzkeJ7n2ehZpjY1SqGEeSC/PVMA+wm7UZTjrj0KI65W4MMorEgNRqnJzoxJqm7vfYQaCgyyC2/E6U9DUlS18LT1DT4c309xtMm0ChSlmq9OReQWx25mUCSCQSzzHXDD4KDZ2jxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3coa7/Q00XcmaWZs7n/oiZYQzKwgScWsvnM72TeQSnY=;
 b=PgABqA59YjClm1v6vFW9bg/zDJd8e+htlibpbR3WLNq24vnC5ok5wOPuUU7crQ/Zx1ZP6Fk6SRHQ/CIGFI687giyfIcD2lJBIFlHo0CuQ8dNHTtrMKsZ1Eo9AGH0GtmtjIQyAnqELMGbaCFk2e2kclip0mans65qrXQQI7I+rYGMQwP8NuUttK1YNZNcUGn4dVUPudCnpT5brM2ywV2ZbkC3TOoxMxisv8gdefVEuWNFDvGheGQdP1hJGXzIU/6f40U9LPnQF8j8dTF/Y0W8VBz9k4BGgGdJx39KPESByrqrLZMZOLkxI1oKk2STT2lHbI46krZ+DjofOXugjAKHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3coa7/Q00XcmaWZs7n/oiZYQzKwgScWsvnM72TeQSnY=;
 b=SNdYynGWb6wXIFzz+CRjLqTjrLUJKbBUyRJqyv0LHsCc6wS4Zt9DZpCWQgZPbJyoEMrvisaXzt1JdV3mIYR6p//2CbC+BS1M0jUb41iLbGApV8b9I4VktGKWP8XfJTEx/4gA2oNZU9qCjv4YWgbUoRLSDxmpqHhvO/4qkpqFOxg=
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
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 5/6] dt-overlay: Ignore nodes that do not have __overlay__ as their subnode
Date: Fri, 4 Oct 2024 14:22:19 +0200
Message-ID: <20241004122220.234817-6-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: d50d2992-d97a-4037-6573-08dce46f3ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RqcX9FUAhYGsmfVzXBm8fKtaPZngTcBEO3PnXqHwebzbC8TLC99FH1l4Eja3?=
 =?us-ascii?Q?xuMBdgHL2/mAW/aaL6xY50WAuwaFJ8dU7fcBWC5mIeMIuRUWVAzL/PSB2/iT?=
 =?us-ascii?Q?9FAxuM3quRXTpplL3XsP92SpaykZWaedo42o/Ris0cBoHlVSRzqlK4/zKwfV?=
 =?us-ascii?Q?8i7ZaR3J7ZwvCRkFEzU5gwbeOp0dg7mHV86qVEiYF+A4xuMHBsx0iYhKd6Lf?=
 =?us-ascii?Q?tA2NwkY0kNVRMkuqtLNV/KURKMbudxi9TXOCpv1G92uhYKQ6yPQLZqVF5g8o?=
 =?us-ascii?Q?D9qAS6bzakJ3rRcb4Rwj51+wxd+V4T8Zt0aKzBqoxAF4iY2Djj7qj6KLQnQg?=
 =?us-ascii?Q?f1yO1b/lDdu3PVeT0QVopxfSHclo4fPUPy15bcQTogLHjxIkKCIczZshWxOG?=
 =?us-ascii?Q?y5RQatGQUJQJTC6bwJH+MaabAkpKZZ5alxHFU4+OvbrXHQD8mnC4w4H/+Hgo?=
 =?us-ascii?Q?9JcmdGmw5V+kU013lE/y5g9QjN3wI4a5MJfQv7WvNpnLHPbo07JyRcUl9vsA?=
 =?us-ascii?Q?CE8/INo3VNIO3qNF8OakySEiZOcFMn/fVULQEqzh5fDRAjzi19BZ3GbsYwxr?=
 =?us-ascii?Q?xjeYzex6h88j6cDQT3++ChGj2UPqqEvAlzeQWCSP6ytwfHE4NPVlwPN3vIg9?=
 =?us-ascii?Q?7aacCQH6E5AMNPEwIO/YzPFPKWQTcVbFmH6716iWaP2jVQO3Bz5hNQJmrvju?=
 =?us-ascii?Q?7ut4c+HigLk2u6V06xvdmNR91mJ2HPb9rYm8s6gu5mnRECC9oNmZQ2ptF0zA?=
 =?us-ascii?Q?yvbCSV3pk79kdNYxsaWBPr/9X7iU3iFTn22NhoZBydFZJ2a0lU7iXxdrjz5Z?=
 =?us-ascii?Q?l8ir8ax5dte0bG+9DCiXYsAcGY4MwnB5e9v6Pj/bxKd25NAVXPHuiXRs+q27?=
 =?us-ascii?Q?cUILLb+DmlI4mx9WEFdXyNxkXo+Nvr6YrWTdRVt81NXV4CvqGu5yyyuEp0TW?=
 =?us-ascii?Q?DNpWxoZfLsseyqusWmkouwKgorQUuft5WA2Tbm65UbZxwBYI833cNbCDOdLG?=
 =?us-ascii?Q?lrAH30q1Nk1vrki1ieqUckfVup4mnwYtL9frKRVtQD2tNiaH0JTI+hN/dBi+?=
 =?us-ascii?Q?5ZG/4JD5wb1iiSs9LTEfCUNGhtSF8j2KuHcbqd8ilG6MAYW17+MKfJKy2nBk?=
 =?us-ascii?Q?Jm4QCaWkifzLovMQBHpGPtKC1x43qjiiBnO+TPX9OhnbkxNJLM/stSALTZ55?=
 =?us-ascii?Q?2Xv4BiSYC9i2ROV3ws6a1TApNjEn+nNsEbs90oGoNSU9wEiRqEyscK95pHm5?=
 =?us-ascii?Q?d1KmGRUZ5fi5LkH8OJ4V8pEGRnGxYulHAxICsVbCmmrSIFq4VAeUonPGW4Vr?=
 =?us-ascii?Q?Moihe/pZCgg4bYuRV/1tqzjf6SPbe74lu4ytBHPj1GaLiqLX5sjy0vQfBX1p?=
 =?us-ascii?Q?bXCanP41xoRXo1KcopSbK9unu+Q2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:37.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d50d2992-d97a-4037-6573-08dce46f3ba9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713

Assumption stated in the comments as if fdt_for_each_subnode() checks
for parent < 0 is utterly wrong. If parent is < 0, node offset is set to
0 (i.e. the very first node in the tree) and the loop's body is executed.
This incorrect assumption causes overlay_node_count() to also count nodes
that do not have __overlay__ as their subnode. The same story goes for
overlay_get_nodes_info(), where we end up requiring each node directly
under root node to have "target-path" set. DTBOs can specify other nodes
including special ones like __symbols__, __fixups__ that can be left to
reduce the number of steps a user needs to do to when it comes to invalid
phandles.

Fix it by adding checks if overlay < 0 after respective calls to
fdt_subnode_offset().

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - New patch
---
 xen/common/dt-overlay.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index bfa153250922..4d75b5b36a99 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -274,11 +274,9 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
         int overlay;
 
         overlay = fdt_subnode_offset(overlay_fdt, fragment, "__overlay__");
+        if ( overlay < 0 )
+            continue;
 
-        /*
-         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
-         * overlay >= 0. So, no need for a overlay>=0 check here.
-         */
         fdt_for_each_subnode(subnode, overlay_fdt, overlay)
         {
             num_overlay_nodes++;
@@ -305,6 +303,10 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
         int subnode;
         const char *target_path;
 
+        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+        if ( overlay < 0 )
+            continue;
+
         target = fdt_overlay_target_offset(device_tree_flattened, fdto,
                                            fragment, &target_path);
         if ( target < 0 )
@@ -313,12 +315,6 @@ static int overlay_get_nodes_info(const void *fdto, char **nodes_full_path)
         if ( target_path == NULL )
             return -EINVAL;
 
-        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
-
-        /*
-         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
-         * overlay >= 0. So, no need for a overlay>=0 check here.
-         */
         fdt_for_each_subnode(subnode, fdto, overlay)
         {
             const char *node_name = NULL;
-- 
2.25.1



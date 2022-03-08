Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F038E4D21DB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287459.487490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnv-0004zH-8V; Tue, 08 Mar 2022 19:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287459.487490; Tue, 08 Mar 2022 19:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnv-0004sK-34; Tue, 08 Mar 2022 19:47:31 +0000
Received: by outflank-mailman (input) for mailman id 287459;
 Tue, 08 Mar 2022 19:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfnt-0004Df-7o
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94df3c0a-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:28 +0100 (CET)
Received: from SN1PR12CA0050.namprd12.prod.outlook.com (2603:10b6:802:20::21)
 by PH0PR02MB7448.namprd02.prod.outlook.com (2603:10b6:510:15::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 19:47:24 +0000
Received: from SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20::4) by SN1PR12CA0050.outlook.office365.com
 (2603:10b6:802:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:23 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0043.mail.protection.outlook.com (10.97.5.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:19 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:19 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnj-000Cws-Hh; Tue, 08 Mar 2022 11:47:19 -0800
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
X-Inumbo-ID: 94df3c0a-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmJL+E1gcn2t7gqHBgKEsXEd+xRdLjuu2iyEPkCjBTexdygU6p3IwPIZbfmT0Knj4m3CZQ1C3Gbf7W8XGrP+axY+ZOLtRXtgT9QKwr9FXILfUuEeBcC1WzHLjtwt+i1u2SQJsLwJVtvcCTnHXOxRps6NkHRLdLWwumQrM/ud5RuYnpcLLFZYHCOUa6YAoiiCF8pec28urwf4+o3myXSifjD2p6+IawnTHguQPXHl33Eb2PK0Yyt+p8xstodZqkiOZDYEukUhchzJqHF+qLWIqF4kWdpBseHozCaGhzbuAXBz5KRo0kCX7Hh0ZZnprS0ySB/dq3OpwHettrcnPjRwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/DNwe4q4N3MUz/sgnELcNL1mBi4irU86Q0dfHBdLwk=;
 b=ZVbbf34t5wxWGEw/F/zaamR/1GKx/goeRZJO2NS/2RFHRDmHrROyGGNqSnAEtAeSuCHN4Gqpcw+GMvsTzY0YTwtOy2exdpq1cJNz+8ySo8KJMva0wYkXicYuS9j+njrmtmOvj7eJuYrHsrDWtj1ut7/muIOLkkn1VOeb0wcMz4QpYaItvwJU9dzugKGnu+tsWK7VJqhFilDE/RHwjeTrISoHeKF3U7vXQanMyNEssyOQnuxYqKSxXGQ9UpWAZqnCX2kE/Ows/T8CHNTD8nGQA3BbahWG4Oz+QfOe0MNpl5kn9KrmeUxSZPW8KQivaK62aDZJm0yRIm7839DVokj7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/DNwe4q4N3MUz/sgnELcNL1mBi4irU86Q0dfHBdLwk=;
 b=HKmHXv2R0Qk6O9/TmJBT0VcglglOphz6s9SmiW8XlzDpFafRKhpi8quqEaJYI6fE7TslYnSkOvKeVm2gf8Gkhi8vQzYvH2X/3FpE6lHKZibc7yO6ITmHYfaJmRwXysvJI/0DdGQ37mOgHXeM/iNBR9XI7JS7R4FUxwOtEkjwO8M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v3 04/14] libfdt: overlay: change overlay_get_target()
Date: Tue, 8 Mar 2022 11:46:54 -0800
Message-ID: <20220308194704.14061-5-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ca5c7b-9d87-4eb1-c3a2-08da013c7761
X-MS-TrafficTypeDiagnostic: PH0PR02MB7448:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR02MB7448EAF94576D02B18AA94ABBC099@PH0PR02MB7448.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X+CwbwEBtlcuIZN9EWkBgOV0ov4fijA+LfNP9jWrek5fa7vYoH+XjTnpz5BoUxe1N8+t4kkpWKX+44eThCicXSB4YkFRb5CSVIqZec64Z0E2ZvmuKQDxvZsKrYhHwSemb/uvr8kgyDu6OBGITGxgItw9xYCBSTcx9SiLjA17khVrC7YjMgbsLXb5OuutphsSXUUgNidKRblpgQNtZ4ywW6mSlzxq8K9w3UAYz8o2nWVNu9D3dVYmmKRWSXLSRlY8BpTtlBzC5GwYqEZa/oRHENneIFiVvSH5emM/aElwAzS7BRA0wX+EFiohfFRhyT1tBKBLIL3xF665o5Pu6wXnjir/RwKnjxfnqm35r9di3Whe6pjiQOQseuWgug+a9F608ozRO7tQXdn9xC53na3pOi/lpbV88/TGj023xT/WH9MqU0u1BxR/bSk00d7BlGdH7sQVNmPWdDOxseUkjOx/+D5KwXmzsI6HSCHj7MeX4/GR+fPD8yKTmloLr0XCmyC+jAQ68U1B7Jv2D1dL9iYgoElIk5uD17cbOkLfE5kDKTqg5AQ2anm+4Cwq8v66WwyeHYKF8GEB7kBN+LZhZNJhlRHk6DCWVt4lusucK1CQ0qXAQ0VYLBDrB9YxxLqFRuRA+VtvlV3b52KTR2FfvLmb08H6BcsXUesSHsgWzejz/04ogqKCuzFqqD4G9FTpiwcBQaWpcboRJ4t06Ne1lqJgmw==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(8676002)(4326008)(316002)(54906003)(6916009)(107886003)(70206006)(70586007)(508600001)(40460700003)(47076005)(9786002)(5660300002)(8936002)(356005)(36756003)(26005)(2616005)(1076003)(426003)(336012)(186003)(7636003)(2906002)(83380400001)(6666004)(7696005)(82310400004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:23.7970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ca5c7b-9d87-4eb1-c3a2-08da013c7761
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7448

Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
function type.

This is done to get the target path for the overlay nodes which is very useful
in many cases. For example, Xen hypervisor needs it when applying overlays
because Xen needs to do further processing of the overlay nodes, e.g. mapping of
resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.

This commit is also applied to git://github.com/dgibson/dtc:
    commit: ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/fdt_overlay.c | 29 +++++++----------------------
 xen/common/libfdt/version.lds   |  1 +
 xen/include/xen/libfdt/libfdt.h | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
index 7b95e2b639..acf0c4c2a6 100644
--- a/xen/common/libfdt/fdt_overlay.c
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -41,37 +41,22 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
 	return fdt32_to_cpu(*val);
 }
 
-/**
- * overlay_get_target - retrieves the offset of a fragment's target
- * @fdt: Base device tree blob
- * @fdto: Device tree overlay blob
- * @fragment: node offset of the fragment in the overlay
- * @pathp: pointer which receives the path of the target (or NULL)
- *
- * overlay_get_target() retrieves the target offset in the base
- * device tree of a fragment, no matter how the actual targeting is
- * done (through a phandle or a path)
- *
- * returns:
- *      the targeted node offset in the base device tree
- *      Negative error code on error
- */
-static int overlay_get_target(const void *fdt, const void *fdto,
-			      int fragment, char const **pathp)
+int fdt_overlay_target_offset(const void *fdt, const void *fdto,
+			      int fragment_offset, char const **pathp)
 {
 	uint32_t phandle;
 	const char *path = NULL;
 	int path_len = 0, ret;
 
 	/* Try first to do a phandle based lookup */
-	phandle = overlay_get_target_phandle(fdto, fragment);
+	phandle = overlay_get_target_phandle(fdto, fragment_offset);
 	if (phandle == (uint32_t)-1)
 		return -FDT_ERR_BADPHANDLE;
 
 	/* no phandle, try path */
 	if (!phandle) {
 		/* And then a path based lookup */
-		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
+		path = fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
 		if (path)
 			ret = fdt_path_offset(fdt, path);
 		else
@@ -638,7 +623,7 @@ static int overlay_merge(void *fdt, void *fdto)
 		if (overlay < 0)
 			return overlay;
 
-		target = overlay_get_target(fdt, fdto, fragment, NULL);
+		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
 		if (target < 0)
 			return target;
 
@@ -781,7 +766,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 			return -FDT_ERR_BADOVERLAY;
 
 		/* get the target of the fragment */
-		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
 		if (ret < 0)
 			return ret;
 		target = ret;
@@ -803,7 +788,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 
 		if (!target_path) {
 			/* again in case setprop_placeholder changed it */
-			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+			ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
 			if (ret < 0)
 				return ret;
 			target = ret;
diff --git a/xen/common/libfdt/version.lds b/xen/common/libfdt/version.lds
index 7ab85f1d9d..cbce5d4a8b 100644
--- a/xen/common/libfdt/version.lds
+++ b/xen/common/libfdt/version.lds
@@ -77,6 +77,7 @@ LIBFDT_1.2 {
 		fdt_appendprop_addrrange;
 		fdt_setprop_inplace_namelen_partial;
 		fdt_create_with_flags;
+		fdt_overlay_target_offset;
 	local:
 		*;
 };
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index c71689e2be..fabddbee8c 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -2109,6 +2109,24 @@ int fdt_del_node(void *fdt, int nodeoffset);
  */
 int fdt_overlay_apply(void *fdt, void *fdto);
 
+/**
+ * fdt_overlay_target_offset - retrieves the offset of a fragment's target
+ * @fdt: Base device tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment_offset: node offset of the fragment in the overlay
+ * @pathp: pointer which receives the path of the target (or NULL)
+ *
+ * fdt_overlay_target_offset() retrieves the target offset in the base
+ * device tree of a fragment, no matter how the actual targeting is
+ * done (through a phandle or a path)
+ *
+ * returns:
+ *      the targeted node offset in the base device tree
+ *      Negative error code on error
+ */
+int fdt_overlay_target_offset(const void *fdt, const void *fdto,
+			      int fragment_offset, char const **pathp);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
-- 
2.17.1



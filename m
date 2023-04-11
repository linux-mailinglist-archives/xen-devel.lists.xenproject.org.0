Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859136DE49B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519769.806743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUI-000526-Gz; Tue, 11 Apr 2023 19:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519769.806743; Tue, 11 Apr 2023 19:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUI-0004zo-CW; Tue, 11 Apr 2023 19:17:06 +0000
Received: by outflank-mailman (input) for mailman id 519769;
 Tue, 11 Apr 2023 19:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUG-0004Ta-DQ
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f9ec66c-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:02 +0200 (CEST)
Received: from BN9PR03CA0074.namprd03.prod.outlook.com (2603:10b6:408:fc::19)
 by DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Tue, 11 Apr
 2023 19:16:59 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::4b) by BN9PR03CA0074.outlook.office365.com
 (2603:10b6:408:fc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:16:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:16:59 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:57 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:57 -0500
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
X-Inumbo-ID: 6f9ec66c-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsnvahqefEJcrGbq8TaKoxKIRcJ8k6g3h4CnC8ViW6gsJNOkIj7iYXQL9Ii413JsBQybdidGJ6LrYp4fbkQfkCB+uk9G8JtQNGWQEg7I2zZVvPT0EekScDapJsrHJ2zroYwVXqobef3b6SibjN1W95m4XVNV8awgAgRxS+ctdQe76N96+hxiTZeE6koUtR3VImFtKbEN7dLGN9hrSzfE8pxKNgYKtUkx5df4BxHctIT+EYRqjZiKki1Ixz3dScKqCfPRWYYBMY/C9zXeYJx1kov8c46c5urOiOJlWKEhQzyGMoDaeydbYpyedbXcu8qGhtYFZ2jrveqP13TX74XUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXlXQRcv7U/T/rRXFeXTNVQL0ZVDEHTt5u8gFMIkdTA=;
 b=L19PP9YIoz2ENayQ10udRQtImwhc0jGVL9fhd/yJy3oG4NYnKeU5Uo7S9PfQ9S8C1q+F4AwS7Y77NS815xEiRFBaNIOjsCyiACllRlkf8xpQYjufEogNI1/VWI9eg7Am75r3yQL14wxPA0vDfIwf8/6m9kPfVD1Vqw1QEzg7RC+e1UwfTZBxCjLz0wKU3mIcfVUrw0bJmuGMsNCCKlVGcwz2mvlqPpWHMLSxVYXyT6DuugcjRPXS2YanxJLXxvxMB+b8bGYlUNFrk6RRU3hRJjZHjJkQnbf1S2sz5s3uYyet8zguNevVPntPXjgvfXEy9umt/iGpNr6PZusNGspcJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXlXQRcv7U/T/rRXFeXTNVQL0ZVDEHTt5u8gFMIkdTA=;
 b=WEz5Ij5Kp8boEyjMUb91XSI7OHDNJpWmshSsP8z3y16orb5bMbZYN4Ifo6hwDNVLqS9pcLJn7M7tz6Hpl6WM6nVl3T2uL2+3WmAzWkPtgLlRVYNE7KBVjbwOq/kRR34spEH0g+H7ltXDphzhcRAXoKFJL30lTxKV8Cm8wEzuk5w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Vikram Garhwal <fnu.vikram@xilinx.com>, David Gibson
	<david@gibson.dropbear.id.au>
Subject: [XEN][PATCH v5 05/17] libfdt: overlay: change overlay_get_target()
Date: Tue, 11 Apr 2023 12:16:06 -0700
Message-ID: <20230411191636.26926-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|DS0PR12MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f074106-fed4-47f9-7c35-08db3ac1529c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oC7YWE9imiHPDPvyBdq1PTLkB0ISDaGkF+VlhetZPVZnrzr6qM7i8dNDmV+QzgsOCOuzwqrGgKNhT6Gc22W0h6Jl/VO52RYpH5NKqj6nuXeOvhDgl5n1sZfailtvZQ88ra2YqPqoWwMRZ/ranbQZks7SlxvR9ZlSLAbrSFWtdAI34AOBnT71936i+XeHyBYcVEF/jOWTxjkh/+G45mkAZLAGk32lNWO7+a0YoA55yRJDH5xXnogPn3Oqx1XIFtciV347wsEzKAHR/q5xdxufvwgEuBDl0xOC5mxRQ+FOxXjsenAxKvYFPe5qgzV08T1nisxhvhRijfLnun7V25nvhtfCXFCf+A2UTc1DtYM6oe2k0vbMOqhnAYKnwVMNkHszSH897j6urVNiCCXBv+SeywRIahq1UOkE9rHubtMSbGU7Bgh3uczPNvtnDxuc9yjluZZ/3UFlw9ymuEWobZgLUULm812dpGF2tKKTCu7rUz6qRg0clEn/C4NfeKoeGw2eQnPQRcGNOBdoc38sFsycpXmByMev6cjJxEVKXcaLXzH48i3nRDdI57qPVYuvkt3zWy/ri3F6DbdkhSXIIX6EWE+EbF4BziXbNg/ovhq0lb891h54Gpe7MePtoE+87lj72BOYskDuhcpNVoO/NCN7u9vRlpXEi/C5sECMSM31b4uyhfDxhXHIaU8+69B/HAcsq73Pb+ALVezM4Jeq7j1OBL8v9Evy9xODkhsWbiLMfmw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(82740400003)(36860700001)(40480700001)(2616005)(426003)(316002)(966005)(26005)(478600001)(6666004)(186003)(1076003)(54906003)(83380400001)(2906002)(336012)(81166007)(8676002)(5660300002)(4326008)(36756003)(356005)(40460700003)(44832011)(6916009)(41300700001)(70586007)(8936002)(82310400005)(70206006)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:16:59.1674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f074106-fed4-47f9-7c35-08db3ac1529c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927

Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
function type.

This is done to get the target path for the overlay nodes which is very useful
in many cases. For example, Xen hypervisor needs it when applying overlays
because Xen needs to do further processing of the overlay nodes, e.g. mapping of
resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Origin: https://github.com/dgibson/dtc 45f3d1a095dd

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
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



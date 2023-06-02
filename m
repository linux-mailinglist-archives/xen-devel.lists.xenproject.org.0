Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B171F747
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542794.847133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syU-0002Rk-EM; Fri, 02 Jun 2023 00:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542794.847133; Fri, 02 Jun 2023 00:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syT-0002J8-Sn; Fri, 02 Jun 2023 00:49:01 +0000
Received: by outflank-mailman (input) for mailman id 542794;
 Fri, 02 Jun 2023 00:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syR-00018B-9d
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40de3d1e-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:56 +0200 (CEST)
Received: from MW4PR04CA0046.namprd04.prod.outlook.com (2603:10b6:303:6a::21)
 by BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 00:48:52 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::7) by MW4PR04CA0046.outlook.office365.com
 (2603:10b6:303:6a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:50 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:50 -0500
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
X-Inumbo-ID: 40de3d1e-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRK7g040+o5EeNmwfU8zGctYOKf+0NpEsP704MJtF8O7rYZbyehfnsuWNlM8F7M3IrrnJytSHhw4qtP5Eorqjk+kALUXZbLItt3JgKWE3gpo/+70hrPeJdwFfFbbs24/TLaZ/B7izUsbSz/y0yczxzTuSwVzX+RhBbMxTNkNO3S0t5TCQshp/h23WLWem+vzf0O2r9bjE/HGNJ9aC/PypYNBj3FrKveUNyjArA1RlUWgQvL/DKyLqcWWYzz4/K3GoyDpPxKpvEno4qnKiz6IRb4ySAWc5IpO29cR8dMDcPXo/fzjCDILeKDWoItBg4EBzvVB0N0IipUOfTQ1u6p6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx/xCOBK4s/DsWiUaFjcYyQMa2MfFrJ7M3OaqU88+qU=;
 b=DeuCeUfRocQ18g3TwpqBvo118j/teYKqroeuy4P9x+s56cpRQAbdRr8c99OGgTeBOiHyGRjh/K/2cNqKIQrHeXGfbKjy9YXh08LbJ0C44GWQWh5uAu9+prpMVF9B6NPmIcouL+rQy5mKMVERz8fdEgDxU6SUgQGkRsZ4T7+INNfOUSy5e7wAGwmoAX6w/bCgQB56b80USk9/jYEYFGTqlZw/dJRWjcKM9d4OSZipyPFKI9/UeyAQaseX3Goh94dMVa9utFGXVjRCe+N9iuNcWWUtnQq+b3+GuvW/Vg25vTQ02BsnmPe9W0+p723Bwra9tJn/jQJyx8voj+aQSb1gLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx/xCOBK4s/DsWiUaFjcYyQMa2MfFrJ7M3OaqU88+qU=;
 b=jhL0v8sRcRT300kpM1qA+B7d2QwiITmtWT1eSUdVqtNe7ojBkPHplQrqyTApRvAUrEhputZKrWw6Z/69Q7yAjlx3zpK2CkFAH8I1+aPLAsB3WXUHHWMio0yx+BcfkLiVIL/PaGcJ/Uy4O60vkeah0ZUJJcbhuwG82en/7h+RMGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Vikram Garhwal <fnu.vikram@xilinx.com>, David Gibson
	<david@gibson.dropbear.id.au>
Subject: [XEN][PATCH v7 07/19] libfdt: overlay: change overlay_get_target()
Date: Thu, 1 Jun 2023 17:48:12 -0700
Message-ID: <20230602004824.20731-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|BL1PR12MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e45d44-01cc-41c5-81d0-08db63032270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XLhfVHHsk1dZomPCzVBzcsOlnXv47QzSsnZVfCnXKuJYktuIz4oOBmkd5LlApvxCcQCZZpiC0NKza/vbcZtPLRB9o/W8PnYT6D8NmIAUV2Ht6QRnvLeFZJFJ1h2C/La2IMSYONlvHA/Itub2LG5g6EGMcPF+izOA6c8OhgZecQGG2c309OhKdZcLB95WCSRPVbCIPtQQXJaEflbMmlqrF7WjYV7Bk2eD9v6VwEhzOlUx/ji/+kPiJavmmaZHl4+4W4EwxdJpw10dw9Ae45/9+dzPWeboipBjkvegxgzc2I2Jl9eteb+hzmsx70utAinCXbtLeflQbVfT/gfjzjp6Z3AzlAVelik56fwX4zAP1QRGAYRyUZPUiYjyjzRWQ1R6CUH50uQ2ucMA0fD/ylQzw5XnU4xAVgyJEunCRjYUPpoSgyhyHVle2rrK6t04NW2NRc3CruD2tluiX4lmQQJSxu2U3xV+nhzZ3R42GrRKlkXZowPfzlDl2g2jlAFqbuy0R5vp2/Cu7SRquPfPbm1mgCqpRcP2BAqh78HcMUNblBcON8DD+YV3kViVHyaM/2K82OKAlqngg4sk4fHYCiVnYms0n8OS98H2yf6/0l5ApPOJGJ5se2D1TnDrSAhTGzxpQBd0nsWO3tyExkE6VoeXhtEDsXglxl9xFR4a3V6ZVuq1Kih6p2GYinoWmiUiKRwKRXkz8vz4U9ePTCTUAVVrU66+AFJB3dclS/YkVw7UVdm4J5Hi/xG5X35H5FPd/stKku32C64cnmcTsfSXmjv6xQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(356005)(82310400005)(81166007)(40460700003)(86362001)(54906003)(478600001)(70586007)(70206006)(6916009)(36756003)(40480700001)(4326008)(6666004)(186003)(26005)(1076003)(8676002)(8936002)(5660300002)(44832011)(36860700001)(47076005)(316002)(2616005)(426003)(336012)(41300700001)(83380400001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:51.5345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e45d44-01cc-41c5-81d0-08db63032270
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5048

Rename overlay_get_target() to fdt_overlay_target_offset() and remove static
function type.

This is done to get the target path for the overlay nodes which is very useful
in many cases. For example, Xen hypervisor needs it when applying overlays
because Xen needs to do further processing of the overlay nodes, e.g. mapping of
resources(IRQs and IOMMUs) to other VMs, creation of SMMU pagetables, etc.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Message-Id: <1637204036-382159-2-git-send-email-fnu.vikram@xilinx.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git 45f3d1a095dd

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
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



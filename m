Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6877EE6D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585005.915983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4D-0005Fg-Pe; Thu, 17 Aug 2023 00:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585005.915983; Thu, 17 Aug 2023 00:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR4D-0005Bq-I3; Thu, 17 Aug 2023 00:40:49 +0000
Received: by outflank-mailman (input) for mailman id 585005;
 Thu, 17 Aug 2023 00:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4C-000280-VC
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4347f6a-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:46 +0200 (CEST)
Received: from SN4PR0501CA0067.namprd05.prod.outlook.com
 (2603:10b6:803:41::44) by IA1PR12MB6163.namprd12.prod.outlook.com
 (2603:10b6:208:3e9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 00:40:42 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::26) by SN4PR0501CA0067.outlook.office365.com
 (2603:10b6:803:41::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:42 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:32 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:31 -0500
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
X-Inumbo-ID: b4347f6a-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1DNHNjKschm42ddVL0ZVGTYb5/bl0VT8SdAxJTm58gK0+6mDzLTL1Bse00XHKHvBtkOrboDOjPr+EiIl/+K7JnF4eHYp2OFZEPMx3C1zKsq4LbadMK5QV5xnRfIdKsjdBHHWy/gCNhwJq0z4+5B2c7BphNXkN4II2/ouUp3M/zRLPduQZ320Q/ovP1VsVcseKCcak/qLpXc/Wvy+YwDBkeLTlq//GictCPa92bwmFuxtssa1srLUHG+quYtKfjc6aVVFlvZXrRKlMYteDAJQIRqCdMH8VDIpO56ub+ll32TycrYOHy5T0kNoXxGSxrpWIfgB0JW29pfdOgtuV+Jxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=653u6xWPNriUED+G4weH7ZKsZbL2O1CzT4XNOpC6uN4=;
 b=airvZLNpv/LTKJWyHNH6o5bdGfyrOB1lT1ReA9XDQ/Ma7OG/DveWL71HSwKwzxcFufTljNel5YZzFiKYirU5y74nBOiEnmUdlny6CXQYZk3KTutmidO2r1qd0Qq0hXgEbdgduQnltxf9gCt8AMUQYGPm0T2oAFoe0wOfXLGMeqGly/0xJHszBG55pgePnhD9rEITv4ES1yQNOe0OqPzZQha0DWs7i8pMF5vLTK9N+3QAATN9Y6kLAehP7GrzPoFLG5c05i4M/JdB9hduTeAVvvNfpADbzjdDdHDk+hZIe0JWeT+cnF72mcnWVopvEOjGM9j6c0XuE7JgEKzRhU5AVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=653u6xWPNriUED+G4weH7ZKsZbL2O1CzT4XNOpC6uN4=;
 b=25GgB+Fu9H4FBgJq9ryhEPZoUtfukulkqFvz9I7tms4qiZ6ftP2bLSyQX3Dj5bG0MiLs4F0a6cGjkRGoDfZX9WdAAQsI6eqjDG7QwHxJKRMPNae7xgt9tXm/w32X2390aeTY5/4VXvDnjx3UJMgi+iDH/gIjP4XEhezeGi1aILg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: [XEN][PATCH v8 07/19] libfdt: overlay: change overlay_get_target()
Date: Wed, 16 Aug 2023 17:39:35 -0700
Message-ID: <20230817003947.3849-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b46e1f3-184e-4099-ba9d-08db9eba961d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ggw+gDu86BHVrakbD4OWK7iPMXKN6nHKRcjEQahuZXumIsZwSw5VGQQcD9ldlrsQZveOtV1WwXx8LA3wVeDh9nBebYcjn4kpkf4n/5ZRkCX1CPpcSb4VJJN0XjONeYUgVqQLshOqanJBJH1Jsa44ZrtM6r5zcXSUsf/xlbE+VjoUyDDmFCPhtB5HImyEQepl4rOlOklSfR5/VkUegBBSbqJe/LQWsPFXhXoWdVvfFqvj/yr7krcozndy7WqWppI50Wc6masycFRBv9zADS8PdrRSJzMiO1xvTJ2uyVCRO74ThxCG3+ICCl3ZrZZNwj/sq/w6kIkYM+/yZo9FolyBkCI8GHZIziA7/StPvn5hFf5Jbl/Ym3+OzYAT9DkSkiyViRNRWCq3e5jA2P/ryLru25hLH+Ky8QfoSAu1pcH7Z2ToN43ppCzHASuEmS0W6baHwzBOqiz1yqD2dr2RAoWDz9srHac+cvUcyH3rGoiHlXl4mPX1CzNVWsN2egBlRESjmTmZeK3PdMtteqvJOv4xX88xbWhT95mvOQbCjq5lhYCPW8Tu9X7VRB8jYRbBghpcGiI1oU8j/AJn56L20VGLSaDNx7M5J62G7RPIVnWqorqzsAFuiJlwSkaRUOSltxUT2gcR60A6kmPbi2Dc+jGMF03/BXvjtHA9tuFjrlF57p1pWnV969rieir6o9V7dK1hWaAHrMZnOPlRt053hgl2QAaVfGA96UKANGllWloHJ2DF4lFDHCbBYjDuEEiBfwEpXQ7TyMLsaAHCWTFhGYjFCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:42.2068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b46e1f3-184e-4099-ba9d-08db9eba961d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163

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
Acked-by: Juline Grall <jgrall@amazon.com>
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



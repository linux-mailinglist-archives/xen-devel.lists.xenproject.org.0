Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0866DE4A9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519844.806953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWy-0008Pb-3Y; Tue, 11 Apr 2023 19:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519844.806953; Tue, 11 Apr 2023 19:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWx-0008Mn-VR; Tue, 11 Apr 2023 19:19:51 +0000
Received: by outflank-mailman (input) for mailman id 519844;
 Tue, 11 Apr 2023 19:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUV-0004DR-JA
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 796fc584-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:17 +0200 (CEST)
Received: from BN9PR03CA0130.namprd03.prod.outlook.com (2603:10b6:408:fe::15)
 by BL1PR12MB5873.namprd12.prod.outlook.com (2603:10b6:208:395::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:14 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::74) by BN9PR03CA0130.outlook.office365.com
 (2603:10b6:408:fe::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.22 via Frontend Transport; Tue, 11 Apr 2023 19:17:14 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:14 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:13 -0500
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
X-Inumbo-ID: 796fc584-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bs1J3pf2zY4xwRkL2xusjQN+dy/Hb3CaMEHIoZ23NB46HoFsLYKnIIwlW0XBpwPCN7sBqHrLf1rhal5UYE17cMnksix5aN6nMbrkNv+6GmJ5qE6Uj2V6c4owe1QhxzF+plzdo56ixceaOUEADAn48uVrOvUxGe/8gwQd7g34rc6cYj7wio0UF4K0lnKZR06l9DojTR1D15uuLKKtytOGPEUeIXqhf8Sx8C1aqbmRLYFtBZYzmFR5F48AkQdQrv/laftAZcrj63fbiKIrPrOrv6s05wQbb/pqCWRTMoqCUYYgrPu9iN2oZ4GLTNTH+nujRbHFxLhI6ij6sTF2rC+xPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXlXQRcv7U/T/rRXFeXTNVQL0ZVDEHTt5u8gFMIkdTA=;
 b=dyMSY9mhc6T6gLBQ322vHVv2gtQ+FagNKnGJbC0oXLxhAW+OqmqmgtM1hUq9FTG6PNVRkzoe58KwtA/vmxD/ESwZ1JTgEYunaBP5t59JxcdCmdKOcVYrQnu3oB/KlXeX0FYiBgTTs35uN8/3UKbNZRs6FX1NUtZnv0go3t6Qw27Che+yW3qKUKNdY6YpdfzcNyhQ9jzRnERJjNe1k99DL1RmlD0P6RQmz5/u6BJADWhJ3glO2TBhAWUJkO4Oz1NwEk653E1Tau5l+VFx7AklCyjcwbn/SovfgCL4uQvoHODEgI/o5xqWQiCFFmSdagI+9yw3yz5w3W4UqLG4k+K6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXlXQRcv7U/T/rRXFeXTNVQL0ZVDEHTt5u8gFMIkdTA=;
 b=AWISUh6SBvJgSoIVRMU5xu4akTc/rzbLimZg/dOzu2AZQmrJyx/aPaQNUFlWQRm3lFXICp+ky2stwepnVeprzphrV52xhw71Tna0Mff4itrrZStzZyt4faOE08CRCKzPkYH6mOB3Fs3jzGw3qpm3+6CdtL4IZFKtCm8NVjQDxDs=
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
Date: Tue, 11 Apr 2023 12:16:24 -0700
Message-ID: <20230411191636.26926-24-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|BL1PR12MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf27a4a-d6d4-4ebc-9f12-08db3ac15bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UCHVU1GAWIXT5Vr+KAVVr/ta9BYbkCgoPqfm4WTdrU3RoPTLQlW5CXh242muGzIhtQJsutSR/AdTUTv3GXr9K6JpMHuCZpPgs666nQKZ+jyc2N657XVz/DG1JfeYyH+UcWG/zsLLdQIkR9TPf5QQxXO3KzR1KWAR9inkhIW9JVJhUmK7g+JsBobErTBk/ouoY2iADGrjzKIa89n5JoSdMp8yv7NSFZySqlc/CSKXAOrE1VgmQMTmNJqaeIhmt+UUnmPo7zeZweX7qfx977UfWyIXZUsLLcEPhXrEt9k8lE7sZFtW2nB8HFv6uqvC+9BvwEIHAHe7Z7xGvhZ6+ELaVxfIQuSP3JK0gHSS3V8Y59Yspvf3wWUjb/Y0B56ZRzLpTVXmfhlXFMa2BkSMfuxN2NV2Ro+nTR9LbuaBpgAamSXCmQcHDuUpz7CP4fK0zOvvqp/FHDM7cRViQi3HUNhjIssB/bUmhGW1BRrjzUDc/dUaTPibCgktd9ZIvqNZK6JWRogn5f1gE+KAf+2ZyFfozJ00rZ+4W7YBkJ7BUi4uzIl2qwfss4/iIU/tT2OunavEHSE4KsJW/6LdesyEcjRU03lv41GqBpdvagpa2C5kqBZQ5Qt7PGsPbiqQizXbrXcQPL0tIZkgJG/MxC4yoPPQxOGqcOQ9atH73lJKOpkeLX7PxcBtbNYX14FLELAG1txN4zzogOP1tuMTvoTYSpBCFl7eMflZIfm2eZXnK/bk8jk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(41300700001)(316002)(54906003)(8676002)(4326008)(966005)(70206006)(478600001)(6916009)(70586007)(82310400005)(5660300002)(40480700001)(36860700001)(2906002)(8936002)(44832011)(356005)(186003)(81166007)(82740400003)(6666004)(26005)(1076003)(336012)(2616005)(83380400001)(426003)(47076005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:14.8314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf27a4a-d6d4-4ebc-9f12-08db3ac15bf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5873

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



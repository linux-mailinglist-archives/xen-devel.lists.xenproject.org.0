Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F86B781611
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586695.917986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qA-00032L-9B; Sat, 19 Aug 2023 00:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586695.917986; Sat, 19 Aug 2023 00:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qA-0002ur-3G; Sat, 19 Aug 2023 00:29:18 +0000
Received: by outflank-mailman (input) for mailman id 586695;
 Sat, 19 Aug 2023 00:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q7-0001Sg-Pz
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:15 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c54bd66-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:29:15 +0200 (CEST)
Received: from MW4PR02CA0014.namprd02.prod.outlook.com (2603:10b6:303:16d::29)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 00:29:11 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::2) by MW4PR02CA0014.outlook.office365.com
 (2603:10b6:303:16d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:09 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:08 -0500
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
X-Inumbo-ID: 6c54bd66-3e27-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5auFkWwJTP8cTAKU9HtmgRhFl5w5DtAQZVoxft6gyqDAD7lhOSfV/yMuJjluCbTN3qNf7fkhGbCcEQFBktNU5f2czuu27cO9Fw475unl4lhOzvxuTi0yNE1mRpZ1H2ZA9ixVyoJtejFd90nXSeINLdCQ5R5uSdoxyeFNB7ytAnvU/mtcsvABi2/WAy+8+uaFAPSyvYC1/2PBoTQPDDz6WCErLq5h8NVtbcnaFmaGZ0pExMF0AGwOGUiPly+BmGmTFuGFq3IrPz+hAH20WLog//75r5XiZGXY35Bi0IF/a6YUd//BAXsuxxejGhOFtKqUCMpB91H2kjGVSyT6ix7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=653u6xWPNriUED+G4weH7ZKsZbL2O1CzT4XNOpC6uN4=;
 b=Z+r0909SufHVyCsdRPb+sZ3BTfrjBVRerFdMNSphs1XbCuRBpTFEN7BVvZxBmkwyh2ZyCNL0zO9quAc9bQZDiWiR2ezRcuZBjMWY92zU1WDIOHCV8KtskHd/LRMeJfsKqC1f1IZD6v9GUphmkQcAfgHoo9SEnpc9TVQWHGNZvEqOhKVypCot/5XsIUoKplB7oJeFm4wRKlHJbubHo24lA84vhEq5TBEwlVUE51XbKXpof6oNnbmy71ZTX3fJX29OW0ns7/gviCf8b9NIgs8l1tfAOL2NFrH0+falMnvOvpZkylcgXAJQX6R1e9xoEXvXKQEC2CZJhiEF3ib1wve44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=653u6xWPNriUED+G4weH7ZKsZbL2O1CzT4XNOpC6uN4=;
 b=mVUISxIeU/J4VQyiZH+Nxo0LTQ7dY3of4ohjID4n6Pcyn8TfPITPDfSulIMcyITkVLE9+Q/OG5knlnqn1ZhpucH5XruNyekWScC6SYLQLNw96mi8Yr0MGx+Zut9HXDNybn+rwhCBDKy1Pe57uuq+oNjNvFBgBdwGsC9OvZ0zZUM=
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
Subject: [XEN][PATCH v9 07/19] libfdt: overlay: change overlay_get_target()
Date: Fri, 18 Aug 2023 17:28:38 -0700
Message-ID: <20230819002850.32349-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: f2bda32c-6ac5-4022-f03f-08dba04b4ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6AGks3/9MJRUIwfmK5TGRNQkYk9QvaY8XpYs9wu0OaTfbBbspEV5fkssHGAAGj6yxtLbZideshLYUG5OYtwh1qmuji7rU+Zvuq3bFePTxayZhVUDAbvgMoKJwse3i96YJGlpx94p4rozDBWMCj0M9ynk+kI642l+mZI+DsJAccwo41Ov/+dxFgMqR4S/NLR7pfG2ltQ73zQiIr77H9yOe7YVmkli8xvjAsRd5f6ggcBllPdIynV+0Z6A5hgT1H/bnOZwq8p+uVbwG/k9kL7kHEvFrumiiWWx+0i7ThBbaWNbtLxi0+0KSCRNeFmRSS1WgBOctn/yl7XKOAPx45kmPSeiSy0fuogE8wDLDlcJqliiD/JKhZEGiI//zFzzrWKX7EMYfLXXw6W/Jl5NZeSLL0P7RXumc6sxpfDAJ1Jb1r+yIpxCPyfcZla3HkX3NrBXKIpNUZN7hrsyr1GiDIiWD7f2Dr8gVfHzapR3UWHlTTyLkwT06dfoL63WO7euUUUsKtM6oNVuywkZQT/5jOHXbB6kxIGmfrVGaXqjUMKKLI5piGv/JCuzvUj1NVaHFDymjOxs5TVHjHTHrR5iaFiIbdluW0nxf3U1sZnHfMUG8Mpm81ylmb0DhAR99ThqyiBJDIHjy1BbIqAa0JxvVLU/fRiFoku9uLzsGdmD1xzRAbTbDn439v/mUt5Jocj3+W3GdUZHCHRHgpk4PieqyxCZ8DC1s2Q/TH7wgjdB7Rhrw++YwySpqpBtHgdr9eMfPoWvH18/NQViEEMRRia+1b4f5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(40460700003)(36860700001)(426003)(336012)(40480700001)(1076003)(83380400001)(36756003)(47076005)(81166007)(356005)(82740400003)(26005)(2616005)(316002)(2906002)(6916009)(54906003)(41300700001)(70206006)(70586007)(86362001)(5660300002)(44832011)(8676002)(8936002)(4326008)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:10.8072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2bda32c-6ac5-4022-f03f-08dba04b4ee1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327

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



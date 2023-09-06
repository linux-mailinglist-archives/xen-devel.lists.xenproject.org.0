Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E3793337
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596001.929815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA7-0001Y7-JC; Wed, 06 Sep 2023 01:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596001.929815; Wed, 06 Sep 2023 01:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA7-0001MT-1T; Wed, 06 Sep 2023 01:16:55 +0000
Received: by outflank-mailman (input) for mailman id 596001;
 Wed, 06 Sep 2023 01:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA3-00079K-TF
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0da21748-4c53-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 03:16:49 +0200 (CEST)
Received: from DM6PR02CA0046.namprd02.prod.outlook.com (2603:10b6:5:177::23)
 by CH0PR12MB8580.namprd12.prod.outlook.com (2603:10b6:610:192::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 01:16:41 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::fc) by DM6PR02CA0046.outlook.office365.com
 (2603:10b6:5:177::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 18:16:39 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:39 -0500
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
X-Inumbo-ID: 0da21748-4c53-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1eCggap940r3PjRkSvnfz0QJhFg8LUifFyWCbFNN1gV1nL8CbUq8ihRAJjoWGZyU5nHYurQbavX/MEC+YY+CbtVn3qNMuaKUwJKQNiGw8ADsIYhfVqxMrTN3g22TmsNI3ffiGaIjjyUkPvlCHc+8zvdR2sEpaySOJS0dK3ClCP7A62TdAYJ/1NlhS/iPy9DI6RQI40WnU11qbepxj5Tr/HJYMWkv6rp6Pp7hXEqIYxjdP01jZand/K120tPQwlUWQ3ZPh0e0SW3H0U1OPVew2RccF6QcBdw+hk6JDJOrLXDpIj+8tLylswimqUwfSLG7u/sGMtWZYp8Dm9aPhTHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=653u6xWPNriUED+G4weH7ZKsZbL2O1CzT4XNOpC6uN4=;
 b=hIdkQwz/vWZLb8REj8ZgK31pJlOCQXNBIIO0mzDnm/ywrt7NhZsmqZmPEDQQhvVex67Rlk8cXsPpvKTdg+78Ku7uXvUTcqJBh16IMPtvFWLZnRUPknZm+gq4ItZiUgCMazmH2miyYYY30NNjWcM3voVlBsXvuZXopTZXtN9FPSQdPzEGnJw1jDs4gipmYb3vViTSwEUhExM6VxDKmOzgs00bsxQM3MY5iRWYBOoWQjehIJHFi/9cPJ1dttKgf+ttfnQfftxIuvLRxzZaglatrJU1yzbs6lxg6eilWMSLt33oQtLlOiMeXdq03TmvASakAnZt1bQMV6P+DebBWqaeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=653u6xWPNriUED+G4weH7ZKsZbL2O1CzT4XNOpC6uN4=;
 b=C7zsaAVDELHUanqZlKqck1kQYvI8frMhnSouQ808KExjIUqFWf3JHqrsy22fZssAExYmagSL3VJ/dlNDTw00zumeEV2PvHvtq4EZ6T53MosGfGUNAEM/QttazpvYcER5OwhV9jpBn6/Q8ya/8LBPf7xBaBPx2o62sIX7jOmRvOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Vikram Garhwal <fnu.vikram@xilinx.com>, "David
 Gibson" <david@gibson.dropbear.id.au>
Subject: [XEN][PATCH v12 07/20] libfdt: overlay: change overlay_get_target()
Date: Tue, 5 Sep 2023 18:16:17 -0700
Message-ID: <20230906011631.30310-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH0PR12MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8bc73d-abf6-4521-0439-08dbae76ed13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ddskFYipucxe6RKqCM9alvr+E1ETLk0WMdE9yPF2xaa1u/Os4oSV22P8PACsIrpi84WNdE71HBT4pzXJg0y9HJsaAZHEtCRd+jkBljUC+IgWxyoXW1u3xT2qL3XTrycs+cGAJPzh1f2+rirnO/AJPjJncVqnBlas6FredmrGfKycpoUlZqrQ0HTwxcA6F0zUd9ud2TKCP9huvz10Dc63+vSI6kNB2XlY5u4duyzDZ0JH4wHIQbIYcCuxMTXx2lY4D5Mms13mbPb9zojSf/dt7jGYvFLrLV1jdEWLcFqVXplQZ3n6WAFOnNy+zAgIEZAo3wrQiVmleasAcOqOpRzIAjFyTrMA4cPBpwMryj/P06G4An04C+vhOe5u+hXbGRGQbTo30PyUsSeRM6ULEsP56KBu6n2dOjSkTuShHAKks+xYciwSeqT4H6RqTsNKod+vWLFvJkt8DPOlTn0nxLoRCI3vkfzP27lBXW9JCdtMBOKlIOIOOGpxFmWDoKgmvB1+WmmaMdAY5xoZshbl9FDDf1dDSjbcdeowSBAxK/b2SyQECZ8/D/rmB29AbWRnUqYCM+fpER0etcuAL3vKa15+jiGNlqrHm1TBIp+sBTaNZsTPTyxSAwQnYkBpX+uJwKRbCIhssh2GpTI2FcI/BzawDRRVZN2fuRqpUCC/azPdnMvq4SOhPMn8D/GJG5NravcMNL8RBT1Su1unWAoicMMrq4w6dRhEuyA4Dsiqos72V+TbducK4JEZyloh8Qj2ZJijWBtBt+yUP7brmcwSE0ikAw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199024)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(81166007)(356005)(82740400003)(6666004)(40460700003)(36860700001)(86362001)(40480700001)(36756003)(47076005)(1076003)(2616005)(2906002)(426003)(336012)(26005)(83380400001)(478600001)(70206006)(316002)(70586007)(8936002)(8676002)(5660300002)(4326008)(6916009)(44832011)(41300700001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:40.8783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8bc73d-abf6-4521-0439-08dbae76ed13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8580

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



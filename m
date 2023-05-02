Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE86F4DA3
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528865.822601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ2-0007qt-GU; Tue, 02 May 2023 23:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528865.822601; Tue, 02 May 2023 23:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzZ2-0007h6-7N; Tue, 02 May 2023 23:37:44 +0000
Received: by outflank-mailman (input) for mailman id 528865;
 Tue, 02 May 2023 23:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ0-0004sC-C1
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 547f4a68-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:41 +0200 (CEST)
Received: from DS7PR03CA0208.namprd03.prod.outlook.com (2603:10b6:5:3b6::33)
 by DM4PR12MB5071.namprd12.prod.outlook.com (2603:10b6:5:38a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:36 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::99) by DS7PR03CA0208.outlook.office365.com
 (2603:10b6:5:3b6::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.32 via Frontend
 Transport; Tue, 2 May 2023 23:37:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:36 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 16:37:32 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:32 -0500
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
X-Inumbo-ID: 547f4a68-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrS7MKU7griNkYaA1QkcHvAz1NT8Pcu0D5BbYbnr/ayE3Ag2TZjEAUJeykBeDaXsA5VusHzafAfq9VJXw3ttMv2CFBiLSJ0z5I7f0vh1BFv9GDdfZpWFzPGSek133i900JsoaYci0E48xxOkP1vEnh4P2N2QEPWI/SFxduijnXRENOkau8cBF9ZrbApazqiLabACxtapl0C+j5BfSa67NWNL3LN84UAQ48hNyQbfigittrGm++/NF3A4fSh5sEQ+UolZsEPgxCkZTwtpDnnCgPWkuAffKFSCQhmPtjtCZztWuem8sZTmwvJvEYaL4Eyb66/3gcL2XV1GjUdCUzQhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Izi8iFk0zRF4BRyNOjdDxCvThsPDcczKcmdhMhR/3Sk=;
 b=KwdI1Z2YIxKavOXDxN7d/J7eEfXh5WYQDKccFRFeEFXolQusimheCwFSdn/y7h3MTVrREeYn2U3ccn+o4HiGQGONPtDZI6ZmYrBYkS7i2z9EuhY32wnsQ+G+QvsEVfvdNKRZx9D3ZHx7c1FgN4Q+9EQieG2qGsQh6FDuUDTBHOlTplJBB7qE8QZ4khYu9Hj1yRAKSj+sf5WFHUitLLhsn7sWoaOWlLahHCnTiDj03VcwJxJ0WA0RJpstYXxRSTwvmM7TaqhTB3C2oh29RKc1dspvpZxorovjxYTwUGWOkIFs8a1SaeZcpwCNdZnbigNbsHvaX7jxLv70qGCwGoqb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Izi8iFk0zRF4BRyNOjdDxCvThsPDcczKcmdhMhR/3Sk=;
 b=VuNvzciNWJ4Lx0/rMEBLsVGEvfM3eIhHYxvb38q6fUaQhmahn2jrDfK13eOT4zO6kuHGYo2lPTbE7BXQUoePeXmsaxTwV8kiZL/Z/DO0z0UHp++qYoBWDSmBDt5+3mUR876gzcBMLQaWKvZ6KAQLrZ8tKHedZ0VE5wcw/d43Z0Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: [XEN][PATCH v6 07/19] libfdt: overlay: change overlay_get_target()
Date: Tue, 2 May 2023 16:36:38 -0700
Message-ID: <20230502233650.20121-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT068:EE_|DM4PR12MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d2c9fa-7007-410d-69ba-08db4b6635a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eVMJI7TaxrFA/V7rVr0NqyN0WoPsJmJvpK7gnokNKWc6GU6g0vqSn53EQn8c3sZR+4IlT+SZXnzwOdMGL8hBC27wg9fxzUer8ui8dimykTIZ39M61mFWDrIOkU3MaSYs08NbJBF78SvnQ3Rl/04M5ZQbnm50kYVM+xuuysOjHSwg7ADDjZAFOKudF2RLo345dH7lylPcFnBHCKhj8areY+Awtd+W04IxWTRr5VWlON1qYjC+IwzZbe96lxO/By9yFLCrFaOBIr5a28yf+R8w2Wa9BxsO/v9QrzTRYmuDORLX0yFSPNCG6rnLRUHdJTO2S7cN6vobJXqW7qHGuEAgOo6vVEIQV2Za+BzFLAGFEjWOGfJTiGTf8pVefihRFj7KWqxpVtycFmywKfjkJDdePu2d/vCZ0nuqC0/ogh6BxUZ2YXenwusJuHyul7Mb/PUMGFgOvz1kjU90KxxHT3NPC/l4kpEmmcO/nDaZ8HevIC071FtUTX8DvlZp7LOOLSFhIiSAcXWJWHBsmw3inYsPkoA7DPVySm699o/TNOrps57+iASgLNDV6HnGxdCodGHRL6gtJP8wJRzVbK1k2YNYhvzhlKlO4AXbfPmzYTVUstKBm+eXr9sF5kCCF+0cLWKtJd8dFYTvmWS8R0LCEUzYbHfeL8a8/2xO+eoJGsghtKUwk849j0WhKaQxucynE+dIkj3Z8JtIlmgoMFzrw/rp2rTWFGUIwdP+W+4XR+Qkzqg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(26005)(1076003)(40460700003)(316002)(2906002)(70586007)(8936002)(70206006)(6916009)(5660300002)(86362001)(4326008)(8676002)(44832011)(356005)(81166007)(82740400003)(41300700001)(82310400005)(40480700001)(186003)(478600001)(47076005)(36860700001)(2616005)(336012)(426003)(54906003)(36756003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:36.0859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d2c9fa-7007-410d-69ba-08db4b6635a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5071

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



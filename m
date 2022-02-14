Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1D4B4033
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271073.465452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvZ-0000Lk-AM; Mon, 14 Feb 2022 03:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271073.465452; Mon, 14 Feb 2022 03:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvZ-0000Hs-6D; Mon, 14 Feb 2022 03:21:25 +0000
Received: by outflank-mailman (input) for mailman id 271073;
 Mon, 14 Feb 2022 03:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvY-0007B5-0S
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:24 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe05::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f003a5b-8d45-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 04:21:22 +0100 (CET)
Received: from AM7PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:110::11)
 by AM6PR08MB2966.eurprd08.prod.outlook.com (2603:10a6:209:4e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 03:21:20 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::e7) by AM7PR04CA0001.outlook.office365.com
 (2603:10a6:20b:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:20 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 14 Feb 2022 03:21:20 +0000
Received: from 8473bcff6336.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59C6AD33-613C-4FFC-A6BC-0D6A6DC6FF14.1; 
 Mon, 14 Feb 2022 03:21:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8473bcff6336.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:14 +0000
Received: from AM6PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:20b:b2::13)
 by DBAPR08MB5701.eurprd08.prod.outlook.com (2603:10a6:10:1a6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:04 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::8b) by AM6PR08CA0001.outlook.office365.com
 (2603:10a6:20b:b2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:04 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:03 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:08 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:06 +0000
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
X-Inumbo-ID: 2f003a5b-8d45-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwq3BQ8hJu/bwkftJjd/wj3OUNX0PEAg7LDBt9R1U8E=;
 b=kl7UJ7H+T+M9GPV1l7QEe5Dpu0FdyVhw3aiV3/ype7jy7ncBY/1IAJ+RXEq0L5JiQusHDWJih819LwONK1H2r19JJKwdhooM24GTQzk90lStmMHb0h5Vk06WWLgvy4zokQhU88RJjAWklaAEb6ndHtxGE+LHvO10c5t3N9Nr6N8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09d991b60ae58833
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsZWMXJxXJcKwcsEWKa6DckZwJLt0SrYSoQQeop5T3yGUTQEV0SLlJwouYjEBhfW0/coU1V3IzVeGM9m13OAHIQmVI0bxOajPEEYGnEjhwvmg/NLgi5UZEUD8djZLQFyzFTgeZqBgrvQcUcWZdOgofMcYLc/Y9xTjtLu/4CITlpabtQ4KzAG1+ZTiz6UzVCeqxSwiNBo1mHN4RyfaCz9/Viniz4IKYnKA/adVc8jFu5JTklxez9Ki9WxD9i/kBZIIjauxS6VLpGFXXozul0w62uqit/hFiCDEwByY68/Feb0bkabGHBc5TDZkqDKOzuISnIoIWXBSp1gbCaieBTFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwq3BQ8hJu/bwkftJjd/wj3OUNX0PEAg7LDBt9R1U8E=;
 b=Viulyf05yy/wQGOAB4Vds5igfWUDMetwg8+X0cFADAZmI0rOwcFxy3d682TFTIrvB3oHJDkBZdnAmZ480Tw/1ZWkjiPiueNrE5gbdCoFF62uFlpxvgQ2PyIa1YqmngZ7xHc+xjBsu6zPxqdul0+IgBb5Yogultq0TcU1vL2CyWKsf4BhYul3vPjLBKMGPb4ikQQ5K4p5j6dV3QsMYQRp255ER0Zn+L1OuCAEMGFk1EHap6vjQmJmQOmjALSIj7mw/cJV1J4HNY0YntSkoXpZWlGDtwpIozjivav7edyjYI+i1b2khPBJZgR7A+tQDiPJS5vwLC2h2m4iAG20t0609Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwq3BQ8hJu/bwkftJjd/wj3OUNX0PEAg7LDBt9R1U8E=;
 b=kl7UJ7H+T+M9GPV1l7QEe5Dpu0FdyVhw3aiV3/ype7jy7ncBY/1IAJ+RXEq0L5JiQusHDWJih819LwONK1H2r19JJKwdhooM24GTQzk90lStmMHb0h5Vk06WWLgvy4zokQhU88RJjAWklaAEb6ndHtxGE+LHvO10c5t3N9Nr6N8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 05/11] xen/arm: introduce direct-map for domUs
Date: Mon, 14 Feb 2022 03:19:50 +0000
Message-ID: <20220214031956.3726764-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 0deb74f3-4d3c-4512-e5a7-08d9ef691246
X-MS-TrafficTypeDiagnostic:
	DBAPR08MB5701:EE_|AM5EUR03FT016:EE_|AM6PR08MB2966:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB2966AEDBFCAE15D3C07C734FF7339@AM6PR08MB2966.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xxI8AOTSggpt3uZwj46T7btNz1EuphtQhrT2uKwQ9q2bWNrB4q437Y871rcPFgEx+v4HIEV9S3gYpJwUFjHVtBuQqdiqrJOyFx2f9031gcmNBc+59x4iBoTay+vMkSnCORkEBxdbtWWIhCJPnZmH5pW9O8ER4DCE/pWb15HRWOU0RNc3G7Fx6MOyBCgXqBjs/hyh3umM899NzJLVCjVqcROG3JLcK6YSw9VjTUZfmItzyE/qoPRZ2nelv17Gj0Uk4qDbfurPRi9lcCIVovaJOgoZmLPfRbLQTlvc1BD76gJCGmliyS2Gq4G3Bef3OfTeFgmdAs1n6N5jBLsGhTOe81oD8PGbNU1WcnkTZaCxWSI/1Sf2O7rihGcl475wYn2iV9134XQSAapdiCO1BgHrftEdyGGUcLY3qLP9ftiJsWwHI4510dm7lkCKfxToyMlcjw34/PYZl8KB959VSX8l71oEPrdIJLfpOu5LyMCTN0sdz9NgklC+LU/njRvHEBf3onPQs2Db0o4uLUb/UhrKke2U34VC9lO40WjDLeqr7MdQY/T4/tP2m5zbOjSLcY+vdxR3VpoGkgyZw6iBUDkhZl1sKxEAyGF9xfFwH+rePlOlNEw0yBMlj6SASrE3owa41qorH6gp98x7uIa7jmUnTMXLX3tCnoSpNYHnCFKnV7O6lBf6hF8yCMVUAtXXwaM44I/D7GKB8FHWA6hCfEdczQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8676002)(508600001)(2906002)(7696005)(47076005)(6666004)(5660300002)(8936002)(44832011)(4326008)(70206006)(70586007)(81166007)(36860700001)(82310400004)(316002)(86362001)(1076003)(83380400001)(426003)(186003)(26005)(336012)(36756003)(110136005)(2616005)(54906003)(356005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5701
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	07d3af5b-3362-4988-75fd-08d9ef690852
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gf42OWAQ4ClTJIYQGOmav9/7/wEBIF5Qy2LWNIec9ZjcXZjiNZYHrN47YMyF2PCQQBjsinicF2W95VKYpo6ZX16Nhb9RR7tiUBMcSzXwGTvwI6wRCVb/lGxn83Nlxy3IP7fIf+3PzmD61xEk7p+MsHcM4YZjtYpKJzvTnlOCkASx0LrRilvT/8OPImSnOQmH61o3QVrk47sPXmuLfLvcge7cQrTVMVTcW+RSHOYzb2gg15FH+I2RCxoqO5Ab2++dr4NSO7MZTGv82f44k1AGu2dnRg1/XJ0dO+w06Dn+VTzQ1NLWpVAwDJSP6Gv1VYzvib1YCSjnl1ErAKvwBe8e6xUDBCDIC09M1ev1cZFFtcd8/QW1v7p7u7eawvlkpoZWQ7PZ9UqSK4Ih9kBJjZ1TUcDDscBOMoBZ7H1G9N1yU7FPH/7/0QSSwwURpHW1G7//eS9DbjVH+QQ5nCLR3JBXFBz4GssYfrgg5gA0k/D5giPE/PXel4imaTDcIlAE2nNe2ysvm0UoiqgBXmjOqoRKPTuUpww8Y9OhEoPEPPyBVEnkvmEW5MVZkSVZM2G7ZtHMiy5s2QHOwPcPdq9ZayUt5yyIE2LI7itzren5FnOxXJJ2kLuKm/QUr2G3KQrNaCI5wZjVMUya8CjHjDhjjyBl6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(70586007)(70206006)(2906002)(86362001)(8676002)(4326008)(8936002)(82310400004)(44832011)(5660300002)(81166007)(186003)(26005)(426003)(336012)(2616005)(1076003)(83380400001)(6666004)(7696005)(36756003)(508600001)(36860700001)(47076005)(316002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:20.6347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0deb74f3-4d3c-4512-e5a7-08d9ef691246
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2966

Cases where domU needs direct-map memory map:
  * IOMMU not present in the system.
  * IOMMU disabled if it doesn't cover a specific device and all the guests
are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
a few without, then guest DMA security still could not be totally guaranteed.
So users may want to disable the IOMMU, to at least gain some performance
improvement from IOMMU disabled.
  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
To be specific, in a few extreme situation, when multiple devices do DMA
concurrently, these requests may exceed IOMMU's transmission capacity.
  * IOMMU disabled when it adds too much latency on DMA. For example,
TLB may be missing in some IOMMU hardware, which may bring latency in DMA
progress, so users may want to disable it in some realtime scenario.
  * Guest OS relies on the host memory layout

This commit introduces a new helper assign_static_memory_11 to allocate
static memory as guest RAM for direct-map domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- split the common codes into two helpers: parse_static_mem_prop and
acquire_static_memory_bank to deduce complexity.
- introduce a new helper allocate_static_memory_11 for allocating static
memory for direct-map guests
- remove redundant use "bool direct_map", to be replaced by
d_cfg.flags & XEN_DOMCTL_CDF_directmap
- remove panic action since it is fine to assign a non-DMA capable device when
IOMMU and direct-map both off
---
v3 changes:
- doc refinement
- drop the pointless gbank
- add check of the size of nr_banks shall not exceed NR_MEM_BANKS
- add ASSERT_UNREACHABLE to catch any misuse
- add another check of validating flag XEN_DOMCTL_CDF_INTERNAL_directmap only
when CONFIG_STATIC_MEMORY is set.
---
v4 changes:
- comment refinement
- rename function allocate_static_memory_11() to assign_static_memory_11()
to make clear there is actually no allocation done. Instead we are only
mapping pre-defined host regions to pre-defined guest regions.
- remove tot_size to directly substract psize from kinfo->unassigned_mem
- check kinfo->unassigned_mem doesn't underflow or overflow
- remove nested if/else
- refine "panic" info
---
v5 changes:
- fix coding style
---
v6 changes:
- no changes
---
 xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e61d2d53ba..ec29bd302c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -494,8 +494,17 @@ static bool __init append_static_memory_to_bank(struct domain *d,
 {
     int res;
     unsigned int nr_pages = PFN_DOWN(size);
-    /* Infer next GFN. */
-    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
+    gfn_t sgfn;
+
+    /*
+     * For direct-mapped domain, the GFN match the MFN.
+     * Otherwise, this is inferred on what has already been allocated
+     * in the bank.
+     */
+    if ( !is_domain_direct_mapped(d) )
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
 
     res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
     if ( res )
@@ -668,12 +677,92 @@ static void __init allocate_static_memory(struct domain *d,
  fail:
     panic("Failed to allocate requested static memory for domain %pd.", d);
 }
+
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be directly mapped in the guest(Guest Physical
+ * Address == Physical Address).
+ */
+static void __init assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, bank = 0;
+    const __be32 *cell;
+    paddr_t pbase, psize;
+    mfn_t smfn;
+    int length;
+
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+    nr_banks = length / (reg_cells * sizeof(u32));
+
+    if ( nr_banks > NR_MEM_BANKS )
+    {
+        printk(XENLOG_ERR
+               "%pd: exceed max number of supported guest memory banks.\n", d);
+        goto fail;
+    }
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( mfn_eq(smfn, INVALID_MFN) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /* One guest memory bank is matched with one physical memory bank. */
+        kinfo->mem.bank[bank].start = pbase;
+        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
+                                           smfn, psize) )
+            goto fail;
+
+        kinfo->unassigned_mem -= psize;
+    }
+
+    kinfo->mem.nr_banks = nr_banks;
+
+    /*
+     * The property 'memory' should match the amount of memory given to
+     * the guest.
+     * Currently, it is only possible to either acquire static memory or
+     * let Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem != 0 )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to assign requested static memory for direct-map domain %pd.",
+          d);
+}
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
 }
+
+static void __init assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
 #endif
 
 /*
@@ -3023,8 +3112,10 @@ static int __init construct_domU(struct domain *d,
 #endif
     if ( !dt_find_property(node, "xen,static-mem", NULL) )
         allocate_memory(d, &kinfo);
-    else
+    else if ( !is_domain_direct_mapped(d) )
         allocate_static_memory(d, &kinfo, node);
+    else
+        assign_static_memory_11(d, &kinfo, node);
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1



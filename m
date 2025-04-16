Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE11A90DD3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956560.1349958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK2-0002UR-SC; Wed, 16 Apr 2025 21:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956560.1349958; Wed, 16 Apr 2025 21:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK2-0002Q3-Nt; Wed, 16 Apr 2025 21:29:30 +0000
Received: by outflank-mailman (input) for mailman id 956560;
 Wed, 16 Apr 2025 21:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AK0-00024x-Lv
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df8c79c6-1b09-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 23:29:27 +0200 (CEST)
Received: from DM6PR02CA0123.namprd02.prod.outlook.com (2603:10b6:5:1b4::25)
 by DS5PPF7856D51FE.namprd12.prod.outlook.com (2603:10b6:f:fc00::654) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 21:29:23 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::d5) by DM6PR02CA0123.outlook.office365.com
 (2603:10b6:5:1b4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 21:29:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 21:29:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:21 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:21 -0500
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
X-Inumbo-ID: df8c79c6-1b09-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F91MAoPq6kxDQ3wwQaROs0pZgIKsYVFLAwoy8iKciY4epILCzHaU+1b50d0EXYkje9ttT1kL60ZeQuEcgIhyf9lMWsGMmBOMaYs8od3h86yfBqCSn8lTTsBxBjCbgll0Fhk4DWI4k1JIBDQ5e2twhxGBn91A8dZ0y7jUaoXc6vzHvIqfTgeL1pVIvUCUSv39oCO/6x9AzCCNmK07MiK0pQzLBLl+EX7vTF56v5c4lymh2Lgg6vadkdtHUbcq7sDqfU7/tSea08268APwvRVqMGfNS3btNFo4LnFVTXhFrZaxy18LFR8Gf0S/hEpmlAe0ym+INkb/x2iHGx6tQXFDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEhCn/D2ABiwChVcgLzJo/1vunmuVBcfpq/kh2xui/g=;
 b=sIEBC0olEYqOWabKmUJCkr2WSaVOCjsmdZ4VMJOHQ0SbNqug1Sh6umDtqBHg92o20Ebuo407zXUfyXm570DJW38YHRAOrlidWurfk2KEMrfdKqEgZ0qHdXqTuH6P0IHqVWTLKnHuEC0PNvI0HRHCcFqsywq1yA85JHkdTsVUPQS2WZ67E+o5q/xKGRKCyHjqR9G05HQnlNAVVGK9WrG8EFI5vTTH2NUBcyO24zdbNqKEkQmvTPpUH3LlOO+Yaa60c2fkawtoGthkyZTaGA+KgxRDEc4dX7L1L44dcHnT6v6i9laHwiu+khThB9Ao/+p0q4n58zXAEva2Bf+Dyy74dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEhCn/D2ABiwChVcgLzJo/1vunmuVBcfpq/kh2xui/g=;
 b=ftt9z2GmUcLAbuWV3D9pCj6kFeskMPfDOY3saj0tMC8/yfFj9kitXJuo+FDnOMaYm4zhaQNgXAXso1R7h543CJbNO3j+VsMN2Wat7whtVFpUDxaCRjgoRbBEF1crfdPh4/syKxegJg5J8bm7SNX0hqrQI5LvFNP/7RMPFzvWlAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 6/7] xen/arm: dom0less use has_dtb local variable
Date: Wed, 16 Apr 2025 17:29:10 -0400
Message-ID: <20250416212911.410946-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416212911.410946-1-jason.andryuk@amd.com>
References: <20250416212911.410946-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS5PPF7856D51FE:EE_
X-MS-Office365-Filtering-Correlation-Id: d970b719-5f44-4dc6-20ac-08dd7d2dc196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HXUj9RsYmwtV2kjb5DJgi6Cand10cd7Kz526g83bUae7qqN8vavGXVU5t6fo?=
 =?us-ascii?Q?71FanJrGi6O00sGXt/rEGkARBii4gJ71dIj7VjddBnQ3W+0GPm470n1G1Pmd?=
 =?us-ascii?Q?JJYeG0Bk5f4xohlySL70qUrvpe+rvhvrXm9uM/Wackn/uu+iTQusCLzfzoRf?=
 =?us-ascii?Q?ujn94etP+UGjztj7p0UPcPhqTlvAQ/KcvZh6INoRoasGK7Es6HlkOHKgyftA?=
 =?us-ascii?Q?cJ6LcOVRyfJ4MFPJqfQ4RUT3GL/TzrvYA54Ioh/sJmDUR7ENf1SijePxb5ky?=
 =?us-ascii?Q?C+P6hmGObKZyCJ4kS0NDsHde8CuimQ8smAuSPlvzQa2c160Z9A5rRmeO998k?=
 =?us-ascii?Q?OD7NKeo4g2gWQ7169zq+5P32gyvMKT6OxO49zNZ0++XiMDNTq3/5ZbvKQ7SW?=
 =?us-ascii?Q?OSaY11VXIN2SKjERq8dyfy/wXdDz+5YA1v1eCcuX+6ZXJG7BH8VFJT7YrBDM?=
 =?us-ascii?Q?2gjbUHbPnmJbGtEA1bMNcWtooNFO+zofgxH3yYjtyeEJ0JO06RY4D3f0wXDI?=
 =?us-ascii?Q?vHvS/xGCuWsjHZQNN8/kxzNNALxv44zynRskwYi0CeNvK/zEA48roKZXMgb2?=
 =?us-ascii?Q?JV5UHTnJ5mDUCrsaiaoRTS2SlUlwADyzEiJRQFNz12ZxCi5gtlPU/hsJtk5U?=
 =?us-ascii?Q?V1vk6x2fBjmXO0341aZZ8bm3qNQsWVj3k31+IinXfDgGBEBTvgSak3+osZ19?=
 =?us-ascii?Q?OjlurUFTVej1o/20f6sIBYsNvbgVTTB81/EPm13j3WylZMXhgjgYorLlQ4Hr?=
 =?us-ascii?Q?yEm6TNeqbJ9DOFK9R/KEhTUmz77lOq71NepfSdsNia1KrXFGhhcVFfKGeU2k?=
 =?us-ascii?Q?5MQ3M1LOv7h4yLW8j416XB7+o8KxqIhzLQZnaOjnJaArbK4Nr7Bc/DBOY0ss?=
 =?us-ascii?Q?2nqvceO6UdX0jeavQ0hVH8p8WpoUybAEucXi0zwR4fWP66yFWHqtAv2hri1d?=
 =?us-ascii?Q?rxXIPEbeJ3mbLi6zzrBpM6+RJ1SsB9wWMiXvYmdQiJgyQa0hlsC63dCQoqlh?=
 =?us-ascii?Q?z9DMJnD0Z8UJp6SBV6E3usm6wGe9tIEUJfalkiHVrKsv60H4SOYY+jG1DbT4?=
 =?us-ascii?Q?brLiwR90DgMXUnCOh6jVzvLtXjIcToLK+OPiNBQq/3UEBT+D1ZfF3pY+NHVf?=
 =?us-ascii?Q?LydRpzd0akD2d7hq9db1VHfLeBaZaYOGYvbhBnP63E3gRxm16ziIEIhYbcAH?=
 =?us-ascii?Q?Jowu0sZNWG2drrsHltvfBtDz7ZeyTu8Gmev9GZiDj6qZXDBn472xOjS6I3wl?=
 =?us-ascii?Q?IzxSdE8zLyi/qpe+0mUQC/5fbjz7jfinVdO0k5hQcEq01GHWKRkA6n+VbrGt?=
 =?us-ascii?Q?F15p3yw9jceYSYCaCOzB/dn+MsQTJP7Wn4MtTWWae6qhcrjXTYF8rMVSEaJ8?=
 =?us-ascii?Q?tlXlQALegq0TOf1OWffkB8+dskF2cRE3iWJUA2xcAME0Ems5NQzLfwxLRjLL?=
 =?us-ascii?Q?Y2C9AUx/bwuXmq7C45mxk53NenbRSb7MB5Hn8ykTT3y48q7ng6qojmm9eLlU?=
 =?us-ascii?Q?WNf06VNEJHXCVMBjRRMIuYLFTdNnbi/m19Gu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:23.0382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d970b719-5f44-4dc6-20ac-08dd7d2dc196
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7856D51FE

Store the result of finding a "multiboot,device-tree" node.  This will
simplity adding hardware domain checks.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5:
No change

v4:
Add Stefano R-b

v3:
New

Could be squashed into the next patch, but this helps make the next one
cleaner.
---
 xen/arch/arm/dom0less-build.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 188ef40b52..50d2d3e4e4 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1033,6 +1033,7 @@ void __init create_domUs(void)
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
         unsigned int flags = 0U;
+        bool has_dtb = false;
         uint32_t val;
         int rc;
 
@@ -1067,9 +1068,10 @@ void __init create_domUs(void)
              !strcmp(dom0less_iommu, "enabled") )
             iommu = true;
 
-        if ( iommu_enabled &&
-             (iommu || dt_find_compatible_node(node, NULL,
-                                               "multiboot,device-tree")) )
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+            has_dtb = true;
+
+        if ( iommu_enabled && (iommu || has_dtb) )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.49.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A1969D65
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 14:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789089.1198606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSXx-0004BC-3O; Tue, 03 Sep 2024 12:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789089.1198606; Tue, 03 Sep 2024 12:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSXx-00048c-0I; Tue, 03 Sep 2024 12:22:09 +0000
Received: by outflank-mailman (input) for mailman id 789089;
 Tue, 03 Sep 2024 12:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slSXw-00048W-DK
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 12:22:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20226eb1-69ef-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 14:22:05 +0200 (CEST)
Received: from CH2PR03CA0025.namprd03.prod.outlook.com (2603:10b6:610:59::35)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 12:21:57 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::ea) by CH2PR03CA0025.outlook.office365.com
 (2603:10b6:610:59::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:21:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:21:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:21:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:21:53 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Sep 2024 07:21:52 -0500
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
X-Inumbo-ID: 20226eb1-69ef-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xv9OPOGXfKxeL7IrGbdz/btbkQIbdCLhtKQV67tKanUF2qyxmAxT2qBNUJODPszcZGq0/Npos4UzAwk9isSLjnhgEK4hC8BIB3gqAGsg3k75CJ5qkB5sQ3nHyf8Md81JlOFDzmx+uU/NVKLWH+Bj3d331+Xt+KfvMFf+y8K6FqUgfClmk7jgVGY7nGn+bI8h9SQOaGT3UKiE3YKvtcimD3zJMGsdjtNXexNEiXU3i0lCcI3JGdlhj0ZkOvblkt8c8ayf0M2h5tZiz/z1rPj1axxDcOYUE1MDbsvIROK7ftKT0nx9Jb3JtBsDjj2GIDmZfSXSuBJYz2ad1Ku36ja0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSk0fsVcl6ocAsoynP5Vvt3SXW0D/gtDvLdpwDdVEqU=;
 b=Wgtaq0Ty1NzRTCnZfJWwusFlDo25xYS2t6PZtOu6jcgfbkyfNIU2Lr7SCYc7dBh73hBFV8a9h9bBavKRDcLAW8VztyXQTJn6FywjZitVoVRK0iraT52dMBZxhAfp+AYaGQ7SvCb112+YvKQi6xrn/gXdsyJMzZ8/u9PaIllqFpoB7ggKzqvArT4Xwvp+77WzKfuq8pPa7z+QD+lux6zJ8P2dwa6sh4b56WoPndU7j7LV69A3hx3vVc7cIAB9a2CflMglREkxFfNkXNpDxPalNQO9gcCW86meRisce/B6ftab6NoYcilgZE4J6coSzkFPSdj5ab0hVyjqm8vMb7a0CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSk0fsVcl6ocAsoynP5Vvt3SXW0D/gtDvLdpwDdVEqU=;
 b=lZuDwgwsOwR6cQ5BfxFB+YWEWnpOFyREuqKFw2C7+eUJJ+MdT/Di4c+R5BI+GPGnsID4+y/Q7ZF08JLNg+IPjz2hx6gsQgbegRMGgy/En0n4op9rHo+cHaQeXeF0iLv1hZoJ9eRlSj08pYNKnBar73nJEx1AcAWBPYcysbru+x4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/gicv3: Fix ICH_VTR_EL2.ListRegs mask
Date: Tue, 3 Sep 2024 14:21:47 +0200
Message-ID: <20240903122147.2226623-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a733f3-2add-4fcb-1b6c-08dccc12ff35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hDur8LZK7Yn0GDcolCfd6RxPWMZcvNWQ8UBi9UxqwazeYGalXzg7llu17IY4?=
 =?us-ascii?Q?zuE7tqD89ON14RNQoezENqhtuCHNP9uTTeIelwPCxICso0CU0OpQ+8Gi3Fjd?=
 =?us-ascii?Q?M0ZExgeUp3qjhxEp2OqVJpBg/bAMbhEnXF8vU8oj5+Sqd6u+uc4CEF6c85B9?=
 =?us-ascii?Q?c9UMmA6zBD9xwkRh7z5Hhn1Vd3/Ijl+oU5ITAhfYxaH+Sd2rBlsdwdJhrmse?=
 =?us-ascii?Q?YDxDuukxx5SQaXvRpsiwMPvZ/wycNvPFyA6ImkETfgziXttB7slMKfOwP3BF?=
 =?us-ascii?Q?jwou8zxGw4t8jlq766v7TnxRfqygEHWbAgrbnQ9tl41BCC2qQV01mJaKtNT+?=
 =?us-ascii?Q?DZ2SAh/MQFTjs+DSflYlCfJK7FyFVN5i/8Kfg0U4WgcCZYGPwgwciskF27w+?=
 =?us-ascii?Q?ArHeJ5XIsgmrJSXbLc3I6Zyem0eKk/g5RVR7THCPD2qF2xNzqeYfWIZ0yJfe?=
 =?us-ascii?Q?VXaT/1AmCI7IsKVUQErX6k35vF/i9ipTtB3fF5lozRgW7oMwxEsJO719joSH?=
 =?us-ascii?Q?levbwfpOF3Ou1QrdaVOsXOchlRA7e5lDxnbxQKznoq5Etk+NUkBv9kje0YGW?=
 =?us-ascii?Q?zwcWgWPCoIPW7FiaYp8JKSL4fAbOe+G/6UbzMEaUobmftGSPEuKCRGUVgGqY?=
 =?us-ascii?Q?zkjUoWQ1B1uEVdeKn63cJ/LUMbyOqX3eXx7lMSZ2cttoFxuAbZA0A4kHhKGQ?=
 =?us-ascii?Q?kWD1soG1Q1KhdNQhi71A1jBn85ej1iIOK45uvs3zeblLNJTHJwaaQTPcmDnV?=
 =?us-ascii?Q?MlP5zWarESwr5Bj/VI/+Is4nYOfXiUMHvrQ7OhtU3khjCNEEbaLVQPvXsTGq?=
 =?us-ascii?Q?V4rimq8HXaTBhexu9zyX7NwVomRKJLL3payPnDvM1Ed1l2zR0uQl8NlaqPrs?=
 =?us-ascii?Q?b/nTpQypNwx12MzZlIjpgOS8ofBrdec7rDIvktOQwCUHZCKwPdsJexRhR5Mw?=
 =?us-ascii?Q?2hqvrAhfa8EnF69CxP4cxPihnXU99lKB+6k6Wg/jJg0oc7p1L34ReLsXayi3?=
 =?us-ascii?Q?oGkR6la3JX///TK+uoAt45fTeC2ZlarqN0p0rkRKJvtjNSM0Dx2XBppnujSB?=
 =?us-ascii?Q?KdC5KNmoE0KBMfRqlNsSwvpIc7V/1/9ZpeiT36cxJvD0lzbZrqLH5WFIb+JG?=
 =?us-ascii?Q?EW67NiZZSiCPoBH3sfdzq9oQL/t+lHpjzGNMc+JULLBVrmXuUP5AlErb/KEg?=
 =?us-ascii?Q?1EQ91M6Bsw/uglsrvN0ug2Oo0ZKCj8bD3xhyUU71/ITbnhds+oL9Cb37W5vC?=
 =?us-ascii?Q?YjTWsz82OoCUiSvsB+Ter9KryONb5w6YHj0TmdUM3Gn+xVfnG61f7rgAFvTb?=
 =?us-ascii?Q?okiITad6fBNnHh4R9Agjpok1xMBvPouQXgHTyJh6XX5p/vlaCw6iB5pqgn9b?=
 =?us-ascii?Q?/0v5DbUjABcuuOutbYxsUdYBIW2V6KamQH8It2tWQJ4JyUwXllFC+JfIfs2D?=
 =?us-ascii?Q?eTWTvlja3ATBtcV3rYDzSypo7KHGEXo5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:21:54.1978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a733f3-2add-4fcb-1b6c-08dccc12ff35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657

According to GIC spec IHI 0069H.b (12.4.9), the ListRegs field of
ICH_VTR_EL2 can have value between 0b00000..0b01111, as there can
be maximum 16 LRs (field value + 1). Fix the mask used to extract this
value which wrongly assumes there can be 64 (case for GICv2).

Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 227533868f8d..2af093e774e5 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -189,7 +189,7 @@
 #define ICH_LR_GRP1                  (1ULL << 60)
 #define ICH_LR_HW                    (1ULL << 61)
 
-#define ICH_VTR_NRLRGS               0x3f
+#define ICH_VTR_NRLRGS               0xf
 #define ICH_VTR_PRIBITS_MASK         0x7
 #define ICH_VTR_PRIBITS_SHIFT        29
 
-- 
2.25.1



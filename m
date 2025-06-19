Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2160AE0396
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019938.1396376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDVU-0000Tk-Ra; Thu, 19 Jun 2025 11:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019938.1396376; Thu, 19 Jun 2025 11:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDVU-0000Qg-Nw; Thu, 19 Jun 2025 11:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1019938;
 Thu, 19 Jun 2025 11:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SlwS=ZC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uSDVT-0008L0-Er
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:32:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2412::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e9a66b-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:32:33 +0200 (CEST)
Received: from SJ0PR05CA0092.namprd05.prod.outlook.com (2603:10b6:a03:334::7)
 by LV2PR12MB5774.namprd12.prod.outlook.com (2603:10b6:408:17a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 19 Jun
 2025 11:32:24 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::cc) by SJ0PR05CA0092.outlook.office365.com
 (2603:10b6:a03:334::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.12 via Frontend Transport; Thu,
 19 Jun 2025 11:32:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 11:32:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 06:32:22 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 19 Jun 2025 06:32:21 -0500
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
X-Inumbo-ID: 16e9a66b-4d01-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHElf0clA2NTnbFKlbZPrXoh949TSIzFTVKk6Lh2teFotA4oIpweyJDbSfQeXh5n+A+IIcDjdYBH9X/fRh9Hu45c8qkBp4RV8R8n2E2lrrIzlsmycAfQ4fsnpHEGl5F99AzJV9d9xBUaOZ+qjdQy2plXkavIfY6EI0Sps//fJa9LRo17+RfXC5wHJM9Bb7dDhcJLX+Xhx1utoaN5NlTqEPAzaGfPz+dJEy2kKGawsplCcwUW7+ElQ0DxQDU6Bn3SFdLD9gVYSn8sFBzPshZHHLm/ckGWCyway0dl7JzDles3bk5IuU/9gjGOEuAJiQrwgSKGalDodz9HqVER1yNoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9GnvlPa7/ykuvq75UkRq8ccJA05rYoUW1y1TKX2t0s=;
 b=NxWsFz0OVCr5DLG+t70RVR2jQrWnz/MrV2Z24B3VgvMx8hqoCQ09DbD1njs3ognDCpgglmLWK7gRws2MjVWx9Ci4KrDrQ8WNYXb9df0Lc4y/GoavjglSBewXf+MoFuPWy2pr9znQhoHrIvtwITZNNOrFH/qqOgo3SVj9c0TJo0aPhLUAImRnmNlNuRzRWYTSvuvccmNRYU+DoXsL4nRQcdiZG2hkiRFu5FP6A33e2ehrBpI5k9Q2YG6OrAW8CAlwIVg0noZ/MEZGR+023IRRprzGjvLtsG3lnzpNZL5EIsOG0RYCgg/ZifCfxvYba+n88nTBu5Ef7qRkZXxG0egSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9GnvlPa7/ykuvq75UkRq8ccJA05rYoUW1y1TKX2t0s=;
 b=Bh+fQWaSyNLZu8kjGuwc9wLucH7oOF5XgdKVJDbmiZ7vWhU6KXEogeHoycdceYnBLxUTUlPsHsLj+ydmnIIPStWAgyIvte7TfqB4egWdld53/x6e19aGr4stbM7lc+aPDK+Jp4PsDmOUMUlUs+UMEpgwlc3ohBbAKVRSY1PHoPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH v5 2/3] arm/mpu: Define arm32 system registers
Date: Thu, 19 Jun 2025 12:31:51 +0100
Message-ID: <20250619113152.2723066-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
References: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|LV2PR12MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a9b498-acf0-499d-9b47-08ddaf24f608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/qjRLZ8hzn1xHYeJlydLiPQYhbymBOFU1HqIu+ae950g8VUKpHHhS40PvCHr?=
 =?us-ascii?Q?jGHJeIn3F3+mOnczA/Ddp7zCc4H09C1UfUpunPTNq9N66lsNpuks6fFBAl22?=
 =?us-ascii?Q?AHH82q2vomlxjLg1V4kPAdpScm0/Fiq9kH4tXkw3cBRzfoMelgpG4NcDDEvV?=
 =?us-ascii?Q?7tSwHqrla7KkvxCt7wUyG2CtEDL76sQQ+PWgYnhtX5RnIo02u7lC16J41SfZ?=
 =?us-ascii?Q?uckMh/F608p1tNKktyvTCTBhItPXlPlwwR5xHuZr+dirXslONmbHfGE2hJ4F?=
 =?us-ascii?Q?YsfNJfGDZ8ifcyEm/sq2sWiOFh0x6UXtlzplHhfBU8R5XrS+dk2xu6yWBVNt?=
 =?us-ascii?Q?aeddksd7/q37pjSEvh6Q2pBy49dfgleHf8lF8xhUz9ul8DCfKL7ptphTmyTy?=
 =?us-ascii?Q?IrhUcRPSzFUxIircCkXDO1Jr+5YLE6bcEMjOKelLXgQ8XdWhlmTgWHfreAtB?=
 =?us-ascii?Q?8999F9f01hSdgvJlDpGLcSrFish9S7mNGYrSTR7GxsrTkj5Rw1oUxd77zZhP?=
 =?us-ascii?Q?DV//GldpuARzvzZiOOSRL/QjhNpJDFqwsfi7tmj99qj/LDMiYN+zU5VfE+k+?=
 =?us-ascii?Q?3e9HEh6EB7lzP+3gE33gwQ/6i6WbPrN9b7EV8WEhawiJZCE1zUdN8ZagLfox?=
 =?us-ascii?Q?Yur7r9U73qWtEqoouoZDRS4snPZl5G/aaIefK7/gpGCH06dtS02Vawkh3M3K?=
 =?us-ascii?Q?us1U24cLNLJncMCbwq6zCKsI4UW/h8Es1uSCuGq6OFwAOKL4lDeiXtnw1rr7?=
 =?us-ascii?Q?Ni7jl/J0wJ61hTqKq3yRGI/yaVNhMVHG07Jp+lEWfEXW5J1pg7jPK2IN2gmQ?=
 =?us-ascii?Q?oFCRtHbJuEwALvRNdslfusGpqeoXzLweSf7MraWNZlMHeZ9bFaiEKDoY4p1j?=
 =?us-ascii?Q?j0prQxMqRaPGV3Iobq6zCj87hY5yvotMkxeAjdDzwMM081AUtXFo58hdoG2b?=
 =?us-ascii?Q?IxSWJrRa8KsbbkycNBzOlQYFrQu1evuFACDG55/MzjsNO3DKFs+dbZSTSsB0?=
 =?us-ascii?Q?ddfKoH/uYXl21QnqKiA0ifdh7VROrSh826djGu3ZgjCZJmdJmBq792o32+rz?=
 =?us-ascii?Q?QRGRUrKvqr4hyz/ht1WJOhqENX94vxhu56HThKkZfMjutgC2cvtW54L+aqny?=
 =?us-ascii?Q?dxcsgBZxiNmXehFoI5B1yWG4nVKaAMP+mz8F3QfonYQ0xf7AVbPAepSLJ9FB?=
 =?us-ascii?Q?aEArMrjX15Eot8nxmN8z0oTEVI1IHjzOhScsrGtF7MTWTvXrC6puXGYib+78?=
 =?us-ascii?Q?L6IVf+8dRXhzhw35JcuEAM/91J1AVw7CQ8XxgZEe1bnVBJN+UNFNTwu6Y+Me?=
 =?us-ascii?Q?ARatk0CSfrZMfKsrpPw0VHkxCx50wl5g3Bn81HIhZeU/wTz98eYHFqTXO/vR?=
 =?us-ascii?Q?6i+ledz2DW/ZVLAGj32mgSv5Ki59hK7KWRzgf5DmhWdTuOjikp4j8myfRrBK?=
 =?us-ascii?Q?qwdvSjpA9RR2SubteqJXA72S+6YDZDxjBAJL3fG2XNF9AHspglqO2hkYfl8B?=
 =?us-ascii?Q?gy1dEtkl/sHgOLHj6gIYLgKC+I+gsJMQm7na?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:32:23.6569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a9b498-acf0-499d-9b47-08ddaf24f608
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5774

Fix the definition for HPRLAR.
Define the base/limit address registers to access the first 32 protection
regions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from :-

v2 - New patch introduced in v3 (Extracted from 
"arm/mpu: Provide access to the MPU region from the C code").

v3 - Add Hari's R-b.

v4 - Add Michal's A-b.

 xen/arch/arm/include/asm/mpu/cpregs.h | 68 ++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index d5cd0e04d5..bb15e02df6 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -9,7 +9,73 @@
 /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
 #define HPRSELR         p15,4,c6,c2,1
 #define HPRBAR          p15,4,c6,c3,0
-#define HPRLAR          p15,4,c6,c8,1
+#define HPRLAR          p15,4,c6,c3,1
+
+/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
+#define HPRBAR0         p15,4,c6,c8,0
+#define HPRLAR0         p15,4,c6,c8,1
+#define HPRBAR1         p15,4,c6,c8,4
+#define HPRLAR1         p15,4,c6,c8,5
+#define HPRBAR2         p15,4,c6,c9,0
+#define HPRLAR2         p15,4,c6,c9,1
+#define HPRBAR3         p15,4,c6,c9,4
+#define HPRLAR3         p15,4,c6,c9,5
+#define HPRBAR4         p15,4,c6,c10,0
+#define HPRLAR4         p15,4,c6,c10,1
+#define HPRBAR5         p15,4,c6,c10,4
+#define HPRLAR5         p15,4,c6,c10,5
+#define HPRBAR6         p15,4,c6,c11,0
+#define HPRLAR6         p15,4,c6,c11,1
+#define HPRBAR7         p15,4,c6,c11,4
+#define HPRLAR7         p15,4,c6,c11,5
+#define HPRBAR8         p15,4,c6,c12,0
+#define HPRLAR8         p15,4,c6,c12,1
+#define HPRBAR9         p15,4,c6,c12,4
+#define HPRLAR9         p15,4,c6,c12,5
+#define HPRBAR10        p15,4,c6,c13,0
+#define HPRLAR10        p15,4,c6,c13,1
+#define HPRBAR11        p15,4,c6,c13,4
+#define HPRLAR11        p15,4,c6,c13,5
+#define HPRBAR12        p15,4,c6,c14,0
+#define HPRLAR12        p15,4,c6,c14,1
+#define HPRBAR13        p15,4,c6,c14,4
+#define HPRLAR13        p15,4,c6,c14,5
+#define HPRBAR14        p15,4,c6,c15,0
+#define HPRLAR14        p15,4,c6,c15,1
+#define HPRBAR15        p15,4,c6,c15,4
+#define HPRLAR15        p15,4,c6,c15,5
+#define HPRBAR16        p15,5,c6,c8,0
+#define HPRLAR16        p15,5,c6,c8,1
+#define HPRBAR17        p15,5,c6,c8,4
+#define HPRLAR17        p15,5,c6,c8,5
+#define HPRBAR18        p15,5,c6,c9,0
+#define HPRLAR18        p15,5,c6,c9,1
+#define HPRBAR19        p15,5,c6,c9,4
+#define HPRLAR19        p15,5,c6,c9,5
+#define HPRBAR20        p15,5,c6,c10,0
+#define HPRLAR20        p15,5,c6,c10,1
+#define HPRBAR21        p15,5,c6,c10,4
+#define HPRLAR21        p15,5,c6,c10,5
+#define HPRBAR22        p15,5,c6,c11,0
+#define HPRLAR22        p15,5,c6,c11,1
+#define HPRBAR23        p15,5,c6,c11,4
+#define HPRLAR23        p15,5,c6,c11,5
+#define HPRBAR24        p15,5,c6,c12,0
+#define HPRLAR24        p15,5,c6,c12,1
+#define HPRBAR25        p15,5,c6,c12,4
+#define HPRLAR25        p15,5,c6,c12,5
+#define HPRBAR26        p15,5,c6,c13,0
+#define HPRLAR26        p15,5,c6,c13,1
+#define HPRBAR27        p15,5,c6,c13,4
+#define HPRLAR27        p15,5,c6,c13,5
+#define HPRBAR28        p15,5,c6,c14,0
+#define HPRLAR28        p15,5,c6,c14,1
+#define HPRBAR29        p15,5,c6,c14,4
+#define HPRLAR29        p15,5,c6,c14,5
+#define HPRBAR30        p15,5,c6,c15,0
+#define HPRLAR30        p15,5,c6,c15,1
+#define HPRBAR31        p15,5,c6,c15,4
+#define HPRLAR31        p15,5,c6,c15,5
 
 /* Aliases of AArch64 names for use in common code */
 #ifdef CONFIG_ARM_32
-- 
2.25.1



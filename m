Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E06DA4EA2C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 18:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901397.1309352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWWD-0002Al-67; Tue, 04 Mar 2025 17:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901397.1309352; Tue, 04 Mar 2025 17:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWWD-00028W-2n; Tue, 04 Mar 2025 17:57:25 +0000
Received: by outflank-mailman (input) for mailman id 901397;
 Tue, 04 Mar 2025 17:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpWWB-00028H-Tu
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 17:57:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ddd67da-f922-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 18:57:21 +0100 (CET)
Received: from BN9PR03CA0243.namprd03.prod.outlook.com (2603:10b6:408:ff::8)
 by IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 17:57:16 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::79) by BN9PR03CA0243.outlook.office365.com
 (2603:10b6:408:ff::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Tue,
 4 Mar 2025 17:57:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Tue, 4 Mar 2025 17:57:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 11:57:15 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Mar 2025 11:57:14 -0600
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
X-Inumbo-ID: 1ddd67da-f922-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkH8BwUeLcXo0o0zDoJW7gE/ozHjdm9XeeVF8tpDcQUbIrO7PxjE9d26GGmnX0oE3PP9CSzimMFhX2GOZJQlIV5BLIuduBbqZM7OEr8uVsuSYHVE8Rg641+ahwJBY1WvAjp5ecXbvYzdOwLNqQuUCvd/C3GpUNcAeyb+8wzjwFkW3WQq6o7YwhR/XUFsVUP9/Sdj9GDkc4lhEgBJONBtSNUd5buV/SPNimP4TNI7Fwx5XtQ0UsBNQWl2wU/UIVCzzYXsWPC3fl12a/LFUb1x9wLlVNOxjlXDCdnVEh/Q9EONyRtAGEh+Nl8DIel51q5rshPOjABbpI03iaGoULVcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKTVadEnV2XlS26fisnGV/12/rYhJQtYA0RCgoYLxCI=;
 b=jawy5uO8kfmDdbdrV+TWTvEsoWjYnCpIS8vugJ9/ZpPajLDnInnGv4Wxqle+BtUwvS0Sk+oyDa67xoAuPRC36RPsNAfsKQ/oZzuiEeo5tZs5Kvj1CRCgINtNPrgskKQswTe1Z12Q2y8Mujm99hxzhGqbx0jvKzIJllEiG7Qnpn9x/4uiM8rS3d/9l5taYGJdhcqMrtqGkkddRJBvaeNSaEUYZKJnkS+yQBdpwAaExO5jrM7jzoD036t4NDPv1VQl9vmt+4R5jm6jf7+cNDNZEO3ERJpt5Edg+PpePalwcYUqkmo86uemigEvtMAi7VD4xByy6eJYehMr3cixNTmSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKTVadEnV2XlS26fisnGV/12/rYhJQtYA0RCgoYLxCI=;
 b=Prvnr1UfgCKU6oCwJV59IZ0iCr/8sO6tjEgoRtVQgTy97vkzRYmuEb3DGf2byeWJpkITD4JOi0/OMYdEDkzZW1/N32AEF8cimK3eYxTqSnOOjc6cUkaovMX2R5YBX8vyC6FxqVGpXo+rF+rrQTNM9k/OaYtYw8vcCTLoGQVJEoE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2 1/2] xen/arm: mpu: Move some of the definitions to common file
Date: Tue, 4 Mar 2025 17:57:07 +0000
Message-ID: <20250304175708.2434519-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|IA1PR12MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 83628057-b510-468e-65ae-08dd5b460005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pKRj53YUYcml1bhsZeQkBvOqZQMLPrALYNATyLJUgzhCmamaeG5fWOg2hni6?=
 =?us-ascii?Q?V5aiq3sG+z2Ib5s7UyGw9S2ydM67C7xprIdCkKneC2prGCBlOBIiMdd9/wps?=
 =?us-ascii?Q?wVYzU1dkbwZwGxMNAy2ant1pGN2gYV0QKz2ppZh5qiXnLtZAIrDxQ/WMdfPu?=
 =?us-ascii?Q?v6ZGzTNw5ioJkT9bnw96mI0qkc6Io7ga9d7jnOpGGcUUd0zKJYy+nKzHrwvp?=
 =?us-ascii?Q?dsg6Q/l8RU/HFC4CwBlWth057xBPKsnKvQw8IbAerhs4NrUz6AXoSC2oklpI?=
 =?us-ascii?Q?CX6OuCG1TMTp/wBnQF1tjZ62DJh8GN4LuUM/GCiCcG8owkL2fAEFPN6pxxKQ?=
 =?us-ascii?Q?+v03crNOW9lOf5Kyp1i/yDoO8RxtYTdts/wjSawT90B/SFbKdwLyY2uTIFg0?=
 =?us-ascii?Q?E458K8q6ssziR0PIHfKHT+KUcUXkK9Fe01f+BOnMVKHpdjcc1CTNlUyNg03b?=
 =?us-ascii?Q?LSctuQ4zr27hmaXG6MGsg4QYRNggTuVh0p9O56M1lknn0EWD5waLDXBRQh/+?=
 =?us-ascii?Q?gm39kK6PxJzuu3l3cMFe39N6Q5fzXdUFeynXcMLjJBqRPI7b9GiGV4K7S/SC?=
 =?us-ascii?Q?eXYfO+7j+hgPgCCml/EJWiBBoZOTkwyF5je2vmEmmEynWa7aRFHUUG7hXhnN?=
 =?us-ascii?Q?e1ylgsKilAYU8+bX1kX7SWdkJ1Bk6UBFNrWxeylfuNTILl9m7j5k4gASzlay?=
 =?us-ascii?Q?CXjSApuh3WWI7drhcTUoLAcmPYVl+I2PQfp2Zn+v+O+NkljeAlkFTZ/0tGps?=
 =?us-ascii?Q?b/9TLecUbphBEjqVf2f6tvgo8ntJlGdELMLlviJnfRrY6apToEWBG4+S7ehV?=
 =?us-ascii?Q?FURkwn5vA2+Dj4uVWMxJqdZrnVWdJFMOswQpV8tP+MDLtqpYAO6Vx5VS+l+Q?=
 =?us-ascii?Q?kfm8SFwgGY7GlxHSM3jyXVs4V2+jJtt51hKz/8azcoRbff1TGr6lgUUpx1n2?=
 =?us-ascii?Q?G6rYQyHmRwkOEJMEbMWCrdGJX1ENdke7lSD5MvQA1PBvMlXDqqu+OyBgDlJd?=
 =?us-ascii?Q?7fUVBCL4u/Ylneo5Pxr3INzWDAXwzPumCv9wDrvyMPMzcAd1AvZkEJ6Ih9/S?=
 =?us-ascii?Q?yRRT4jogshAuII4EYxSTrsRYM3/EcQunCrhwuusAQwN453J8W9zo2fdK6k6s?=
 =?us-ascii?Q?2gC8ZYcI8GtNXwxDHxS+2AqtAV9PhIyrZllM/QkWDmCmsXM6QoJcP2oKgXqq?=
 =?us-ascii?Q?qqkLLUD53g/fSJvlyQDjl78kNbmXSj2+xGX7V0KAGfOlc2O1NZwDJ5lBI3pX?=
 =?us-ascii?Q?WITwhmr4d9QgEK0eZTNnu9xUKzz2oVsvGZXZjpXBrXP6Vx7HvhV0aPyoXmda?=
 =?us-ascii?Q?1b7WAIHlZSISzq3wm/jtDKBy4P+ibK7OeQk/BcGrUybABcQWfyNWSk0O1gtt?=
 =?us-ascii?Q?uSGUz4NIrzOZlyu+cGvLTw+gxUkxGazWQ5DrJl6AObOmjRvOkiQ6LPwGTWQi?=
 =?us-ascii?Q?QLnbPGnUAwdn3bzsroVRh9EyfSBh4VP9Ne9pLRKsqoBERlgN7ETlDvsvNKgf?=
 =?us-ascii?Q?Rs33IFDEq3G7wYs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 17:57:16.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83628057-b510-468e-65ae-08dd5b460005
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6434

For AArch32, refer to ARM DDI 0568A.c ID110520.
MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
(HMPUIR).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from 

v1 - 1. Add the R-b.

 xen/arch/arm/arm64/mpu/head.S              | 2 +-
 xen/arch/arm/include/asm/early_printk.h    | 2 +-
 xen/arch/arm/include/asm/{arm64 => }/mpu.h | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index e4f2021f45..7b659aa42b 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -3,7 +3,7 @@
  * Start-of-day code for an Armv8-R MPU system.
  */
 
-#include <asm/arm64/mpu.h>
+#include <asm/mpu.h>
 #include <asm/early_printk.h>
 
 /* Backgroud region enable/disable */
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index 219705a8b6..644fd0fcfb 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -11,7 +11,7 @@
 #define __ARM_EARLY_PRINTK_H__
 
 #include <xen/page-size.h>
-#include <asm/arm64/mpu.h>
+#include <asm/mpu.h>
 #include <asm/fixmap.h>
 
 #ifdef CONFIG_EARLY_PRINTK
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/mpu.h
similarity index 87%
rename from xen/arch/arm/include/asm/arm64/mpu.h
rename to xen/arch/arm/include/asm/mpu.h
index f8a029f1a1..40fa6eaaca 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -3,8 +3,8 @@
  * mpu.h: Arm Memory Protection Unit definitions.
  */
 
-#ifndef __ARM64_MPU_H__
-#define __ARM64_MPU_H__
+#ifndef __ARM_MPU_H__
+#define __ARM_MPU_H__
 
 #define MPU_REGION_SHIFT  6
 #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
@@ -13,7 +13,7 @@
 #define NUM_MPU_REGIONS_SHIFT   8
 #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
-#endif /* __ARM64_MPU_H__ */
+#endif /* __ARM_MPU_H__ */
 
 /*
  * Local variables:
-- 
2.25.1



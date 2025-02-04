Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21EEA27B1B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881798.1291992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOX4-0005cm-UV; Tue, 04 Feb 2025 19:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881798.1291992; Tue, 04 Feb 2025 19:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOX4-0005aa-Qj; Tue, 04 Feb 2025 19:24:26 +0000
Received: by outflank-mailman (input) for mailman id 881798;
 Tue, 04 Feb 2025 19:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZU+7=U3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tfOX3-0004nP-CK
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:24:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3162a05-e32d-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 20:24:23 +0100 (CET)
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 19:24:19 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::77) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Tue,
 4 Feb 2025 19:24:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 19:24:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:17 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Feb 2025 13:24:16 -0600
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
X-Inumbo-ID: a3162a05-e32d-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBfyd9AX+zwIHzNBkiycoNwjsZulRplPXn7Nw0WdQmBkDrTHSMQ3g0CYsCqDbXGioH9YmdWl5KUvntJ/GIJ62temNERq2PDkOWoZU86fkGiWpI0E3uCEbvYEz0zvts2aT1ljY7psRG8v9/1z5cC+iJ2X26QpwXIGSWeGltbsRw3kqHokPzjJ9CXzwJQ9eudYNXt7Y2vvpS3LUMZ5Deya0Wsqf3C60wd6CshesPamyK1upbYzDFcg9fBlzsU46/Vgaj2SJanity9ncDtrZGLtjPVDqnDn0UmUvnfRA1z7cPMAzcNDSKzFVrZ4USQIFvej3MibRARppAkjIkonRIxRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5IgUIdldYNT/Kf679Yr7TCLDE1Py9MfCUBypmTOTtk=;
 b=oMgvVvDsgS9h7ACHC8wnTXihbskWiLUJGAvPDcuPGDls3bwfDiqUzzl6bg86wfOtEr5ZnvEZmx/xy1hW9ioBNSX9rWTBoz/bufHoJjcjvWjo5A0Zfh6wB4tKQDQUJ4bjMnfzihZJkVnmHk56cX7Boa5W5u7UUGV/Dt4JgyDXH9B2lY6FPrJOF+kExwIcgngduZiOix4HwsloXY7Cq4jh0YezLkkZqtRjzCMIAZebd+Cxcz2E4IBR3EXreFA7LPN7qp6ij1lgCCqwhafjGZds+n6w5EP7gcV5b0Rik8RL295mWxXR20CXJ4KPZrusr1GsFnOoqnHhAFS0uF+PMYCX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5IgUIdldYNT/Kf679Yr7TCLDE1Py9MfCUBypmTOTtk=;
 b=P5pgvC4+ElcySVqZyw7wnhgF86OrNGxOU9lXycv06r6ErORJE+QBjcyJylL/th5ZUFgH8bQ08SPx9T2a7cRtjFNxuWkoi1HaUCUzMRJmUkTyZgVSYoQOfehiR3ZDFPJiTwpAXxLV4vxBDE5N+yAYwen+fuLzWh+pNJ2ejvWvnMU=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common file
Date: Tue, 4 Feb 2025 19:23:55 +0000
Message-ID: <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: bf66eb87-42fe-4c62-7869-08dd45518526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KMgALWBWMNukE23o+ds5ssFLWCJPV1IwraLFbG8ya/5/Ay79cXXn7ZAU21ak?=
 =?us-ascii?Q?UDjK/E208TqUIw5m15K03BA1+9TVIDDQfX/rXMJIiyV1jPa1D607CIK9eqjW?=
 =?us-ascii?Q?Hqzlm4KGwoAPhSFgYqnAB3+mQbEH251A7MhhMvcu1Mm/n/DHr0KB48xUEROY?=
 =?us-ascii?Q?0XUUm5Kv/tUQqzuaJVC1nLGnR3oIoZA61uGH8s1vPCWr8rkks4zhwAecy+yD?=
 =?us-ascii?Q?vrqoXwtH4aOnswrbvtKaNxbFaugJbLy+04qufnEJls52W2EBMpO+xA+osVtI?=
 =?us-ascii?Q?OcymPnr4ADlT4K6cJsedlXRdOsJar0M8a2GsTsprUkB4hbAtwk1uSPpa6PxY?=
 =?us-ascii?Q?VaQw1UZVd5Q8sfX+Z5iTHGEPiyY4JBaMszNSwLgYA6kfJm+xEwSxO7OCFW4r?=
 =?us-ascii?Q?N+PBac2Zbg+zO3uRLKWHc+4cI386wX3EbcyMyu4dWoo2+l1np2OyU/eY9D3o?=
 =?us-ascii?Q?EcLOVZtIFMWkP02G3t/cYNGre/xPp4YPKkLRwMYalLNqGLHB02y8DlWviJ/U?=
 =?us-ascii?Q?NiHy35D5HPSJGcH6oTpe85GDumsZYamHAB8Il7sW63GkJoyNauwjn6IVF02Z?=
 =?us-ascii?Q?ERDW6ScM/EaDwYcpWSSbG16eo/2KTPD5341FdKOSy/Rzy7NwOp4qJqZxYsgP?=
 =?us-ascii?Q?mNLCtEFQ1L0FdKYslrIvS6FoT/ET2GSoC2pOBksFkproHb6gWu6jdBCc0L0h?=
 =?us-ascii?Q?3Aar9sKArIuSISxXUzbIcJNeIf1CoZ55yx3pYzV4c6L2m/1a8ZRzG/HZan+6?=
 =?us-ascii?Q?f52jUdgJ661IG8HnplaqKkVsjZRv9Tp5ymqCvnSndXPQwJJHXFlk0xMCUeFJ?=
 =?us-ascii?Q?ySvB0398U9e1ak1VOk7gz41jZyVFf0MBatE+A2H+DwIw1XFpp121jROCeZQD?=
 =?us-ascii?Q?GMbbfPYrTlRjIJnytGu5Y84iyXfg5qfiE1nbMqvkEPm5eCiAXGrnhHtEU4pe?=
 =?us-ascii?Q?SBGnBgnG6qjvCu5GTnN5Sj2tQ6OHQMpq+fX1HxtM9zBQcazzv3VGq+w8okRR?=
 =?us-ascii?Q?TU/ifkP6Y6/nb92j5ScWvDVr/kzG4NEc0do56k47zVcAghxJRLi8tVAqoTh0?=
 =?us-ascii?Q?oxNLQCF4ZWLLxoMvWWhm+dmLCm2lz4/2x7ZFYQ0iXU28HQW8WkXVrGHyEa9u?=
 =?us-ascii?Q?NB9BkjacgmgfVnur+tFDa7k4VLhJUyLeUetDaW/OJnga63KWGeUvZP1ogmrK?=
 =?us-ascii?Q?eMAud8+vZH8VvNJSz2h7hFcAuoMQz86yqZUmZZDhB7XYZiUyzyCVdigqkXrd?=
 =?us-ascii?Q?S0a+Uh9BGn2S+TkICTGZPo7PEh8mD7tP/CHF9Gc99RsRjyjb5Xi/BlVOdxqY?=
 =?us-ascii?Q?oLbc2WdhghqkRFGSmmXo+urgSOdO4zLCM//dWo9MpzQHKzenP+WFjv6JiC6+?=
 =?us-ascii?Q?DKVcpzI/pm/dVxp/X/MtX+xvTCwfG0Nzx7vWkjN2alnX6+0PBObUtgjZlBSI?=
 =?us-ascii?Q?99vOyDedQlhvTOnGJ57nQHTC2FtO3KQawtPiS7eLheDUt61tdlJWdYX+VWGz?=
 =?us-ascii?Q?tXeZZPFcjG7ktzg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:24:18.3474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf66eb87-42fe-4c62-7869-08dd45518526
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547

For AArch32, refer to ARM DDI 0568A.c ID110520.
MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
(HMPUIR).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
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



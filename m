Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1297BFE2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 19:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800384.1210311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyqp-0000Ob-4q; Wed, 18 Sep 2024 17:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800384.1210311; Wed, 18 Sep 2024 17:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyqp-0000Mw-1g; Wed, 18 Sep 2024 17:52:27 +0000
Received: by outflank-mailman (input) for mailman id 800384;
 Wed, 18 Sep 2024 17:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3Wy=QQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqyqn-0008Ab-NF
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 17:52:25 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2416::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2795932-75e6-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 19:52:25 +0200 (CEST)
Received: from CH0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:b0::13)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 17:52:20 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::cc) by CH0PR03CA0008.outlook.office365.com
 (2603:10b6:610:b0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 17:52:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 17:52:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:52:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:52:18 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 18 Sep 2024 12:52:17 -0500
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
X-Inumbo-ID: c2795932-75e6-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVhhYlamgv0qETA7Y3oUBVKynMArtexxrDfcBazhcD1QMM9AdiWh3mjtklE6Ry9LGCiyILpwKqyzZsLfzZDzdXezzbsEAIyL3+pwDhcycF57sbZhiuh9YmVbVovZNW7k0lWOOvSHtPLU8J6lFSkj3Tl7n75ViZKKEfqwYLaNoXNKODLn1M168Hq/l2cNTgp6QyS6Gwte9czM2i6tUfJk+nM1+RTZUoc3JetnVCvDudulmbr3xYtiBoGmtEYxld3qUgrYRnPu7QOVMlB3OBODr8DkOf3R2XlR+udH/d4fbk1OfJEfmDZQsqpkWbvsLrci42quc5Jo7v5xSpmlWp5s0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7jesCVWTowdWJmKWelF+BiqkcVbdQs3eyU2eIe6EMM=;
 b=FUDhBL5m55eWeATYH7ix9RaSeyWrkoJ6AEnyIly9nc9balB4W5lJx1ezneEbyejD3mgsiMvK+O9B8PFGzuiObIOI0AlI2Ki0CurgjtQ+K1/xnSIkZNsN5ir04/gc5vzUv/iHm4EyF1q0HGGvTgXCJTYymdExwOBTlwYfohXp3Xh7cBcCR8P3hmWfNLLLgwtZeEQYH+T4YKDhB+USI0Xhoj2SLh4tZENpP09noJO2jinKOJhsu41JI1CLJZ0PtnIBw0xc6+gSvKima/6L6Jvh5xiMZ+GsY79pvS2vHp2Fj197EiLihBZE7pJSuaoGNsslVxN47+VVElxH25GOV4Av2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7jesCVWTowdWJmKWelF+BiqkcVbdQs3eyU2eIe6EMM=;
 b=xd+IJgAzlKYuOJnWYonSewC5139cDWcJ0SuREhXG7ZzHVnjNakoKK1e+6ZeyhHRNGrosLlNlZb1c8ZxScMsMP88/PSV71s1kBTUNS+LXpJdMlyov5F44JCDKbzWT5heOSjGPQMtKBm1XzztoBaPUlaQnTXTAFTulCrnFTnxCpT0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Jiamei . Xie" <jiamei.xie@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [PATCH v2 2/4] xen/arm: mpu: Define Xen start address for MPU systems
Date: Wed, 18 Sep 2024 18:51:00 +0100
Message-ID: <20240918175102.223076-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: dd77f411-24f5-4ea4-b93d-08dcd80aa454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2h8Iij0Vvn9rT+dFVuVHmWrfQZe3NulGnBSfHHfbgBBr8mHrZzFg5ps67tBx?=
 =?us-ascii?Q?TTnhCMQnDhiH0ApsFmHXyXw9htJ/zhs9aXLqFTKoW4g1av18s/jL/biB0K39?=
 =?us-ascii?Q?CIyGRj2PWUj2/Xdfo639JtCM1uzVQLEQWOjJRfdoaTGsZnPm0KBUOhGHVySX?=
 =?us-ascii?Q?oIHvV3fIRitTDcpURsEusEcQYSZon2jPm8/lgYzG2Dgug0C0u2HzW1pYXVlM?=
 =?us-ascii?Q?E5WR9iDNWFSbFli+1aWQW1k9334kt12a3g/kSSxQOQwLBPajfzoqYgaKFCAN?=
 =?us-ascii?Q?GhfxiqvI90b7WOGbXwSS6dzxvDXgmrtRVz3g6zrLqfYtXhhSGAcbQuZXqR5Q?=
 =?us-ascii?Q?gPFWa2Mkeq5kfrTA8TugVRujfKX6nKnLE9LuDCXjk8/mpWoA6QMKVfVVSsTC?=
 =?us-ascii?Q?Y0NHYqGkgZkswZc1n/88mTA2Xv4wfjoMBUNWVzXCRCXhEmIytSIP028l7IlI?=
 =?us-ascii?Q?/9DuKdS6qcP9PCl5YWhpiqIYToxPFFRNGiEwf8m5jguUn8yzYZ63fUCswjGS?=
 =?us-ascii?Q?I9Ud9vtxZGLHfiQMcFIKBfiDS9emitQ2MDW+JwGx0d3PUQlkyVdavFgV2mj3?=
 =?us-ascii?Q?g8cyCh1ot6xy59kDg85IxnJ8r68wqBf6j847hEE8H2x9QiwF1MQpdARYB4jH?=
 =?us-ascii?Q?+1Fbv4d5wtNhtDbqPgOhkGsyf4ZeFwH4TjrzP5ZgRhbcXyODgatlOJWHctnj?=
 =?us-ascii?Q?p0vZb3w7CiKELHkO8aCTIqNOJDxQ/zlotcINBIFAl65DkdN9eDzRJjOwzyqp?=
 =?us-ascii?Q?YIdEjgl9/U0PH9odsoLjAIGHOk3f0MRjmxPsT+qKYU9l6rVV9n7tbyEgu5uB?=
 =?us-ascii?Q?ebrgCJoCeDW6EdD4obXUKn1o/HQtVvUJIQkRmA0liDcOHx7fLgVAg9Yc1es0?=
 =?us-ascii?Q?J54IQTha5sjLdNoX//9olGr9TdftGyoRrV2h0z9ydli/vy/1SkxHt/HV6vR5?=
 =?us-ascii?Q?IKbG6T4BIDFRsoZPtNnJkSyHTVz96wN0RXbw0+QX5HLVoeqaqwEsXDo/Z7sm?=
 =?us-ascii?Q?YkNQ9QiXjF7XwOBWPXg70vHxSBb2E1K0sgGWYvqsXsQ+xCM95zw7kP/0Koew?=
 =?us-ascii?Q?nv+rodn85AJxV+dW2lv39rVHywI7xlIpgFWYmYdPL0m4AzYXcJOlCL1dDek4?=
 =?us-ascii?Q?PhH3vLOQk3gd+wLvyYleUPcKEoAuo49yWTbGd/9MS2D1z+DcEVLj5dQtT2bR?=
 =?us-ascii?Q?CVHaexay/OQfzhEhimT8nXY1fzpW18pIqZ21xYQlfRX4i5MZ05NrLEyIgjRO?=
 =?us-ascii?Q?yuLhEgRLj3tAHnZP9AnjnCdPTnOH6VPwGfXjBAMElrANvZYKTfSPR1jQpt9W?=
 =?us-ascii?Q?GCQ1jMmJ/lhbMcgjJA/guYuoE5rkghrA7treefr/jST1QUt/CuJt2U25S84M?=
 =?us-ascii?Q?hU+DJ+2UGnwUr7EKANXc+17qAQWxQBKacjxCXFjVdo75iMuVaXbVM6mtggxS?=
 =?us-ascii?Q?u4kixr+ZoxDFp3wZXF9RDYInxs90dcWm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:52:19.7274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd77f411-24f5-4ea4-b93d-08dcd80aa454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127

From: Wei Chen <wei.chen@arm.com>

On Armv8-A, Xen has a fixed virtual start address (link address too) for all
Armv8-A platforms. In an MMU based system, Xen can map its loaded address to
this virtual start address. So, on Armv8-A platforms, the Xen start address does
not need to be configurable. But on Armv8-R platforms, there is no MMU to map
loaded address to a fixed virtual address and different platforms will have very
different address space layout. So Xen cannot use a fixed physical address on
MPU based system and need to have it configurable.

So, we introduce a Kconfig option for users to set the start address. The start
address needs to be aligned to 4KB. We have a check for this alignment.

In case if the user forgets to set the start address, then 0xffffffff is used
as default. This is to trigger the error (on alignment check) and thereby prompt
user to set the start address.

Also updated config.h so that it includes mpu/layout.h when CONFIG_MPU is
defined.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Fixed some of the coding style issues.
2. Reworded the help message.
3. Updated the commit message.

 xen/arch/arm/Kconfig                  | 10 ++++++++++
 xen/arch/arm/include/asm/config.h     |  4 +++-
 xen/arch/arm/include/asm/mpu/layout.h | 27 +++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index e881f5ba57..ab3ef005a6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -23,6 +23,16 @@ config ARCH_DEFCONFIG
 	default "arch/arm/configs/arm32_defconfig" if ARM_32
 	default "arch/arm/configs/arm64_defconfig" if ARM_64
 
+config XEN_START_ADDRESS
+	hex "Xen start address: keep default to use platform defined address"
+	default 0xFFFFFFFF
+	depends on MPU
+	help
+	  Used to set customized address at which which Xen will be linked on MPU
+	  systems. Must be aligned to 4KB.
+	  0xFFFFFFFF is used as default value to indicate that user has not
+	  customized this address.
+
 menu "Architecture Features"
 
 choice
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index a2e22b659d..0a51142efd 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -69,8 +69,10 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU)
 #include <asm/mmu/layout.h>
+#elif defined(CONFIG_MPU)
+#include <asm/mpu/layout.h>
 #else
 # error "Unknown memory management layout"
 #endif
diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
new file mode 100644
index 0000000000..f9a5be2d6b
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_LAYOUT_H__
+#define __ARM_MPU_LAYOUT_H__
+
+#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
+
+/*
+ * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
+ * address indicates where Xen image will be loaded and run from. This
+ * address must be aligned to a PAGE_SIZE.
+ */
+#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
+#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
+#endif
+
+#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
+
+#endif /* __ARM_MPU_LAYOUT_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BBC737027
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 17:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551931.861710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBd7F-0005mf-G1; Tue, 20 Jun 2023 15:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551931.861710; Tue, 20 Jun 2023 15:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBd7F-0005kz-Ce; Tue, 20 Jun 2023 15:17:57 +0000
Received: by outflank-mailman (input) for mailman id 551931;
 Tue, 20 Jun 2023 15:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DaFZ=CI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qBd7E-0005kr-AY
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 15:17:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a06d05d6-0f7d-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 17:17:54 +0200 (CEST)
Received: from SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::17)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 15:17:50 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:35e:cafe::cd) by SA1P222CA0080.outlook.office365.com
 (2603:10b6:806:35e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Tue, 20 Jun 2023 15:17:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Tue, 20 Jun 2023 15:17:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 10:17:49 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 10:17:48 -0500
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
X-Inumbo-ID: a06d05d6-0f7d-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU1q72wmyEOjz0m5lfk8wkJO0EtyiDzvWXkQqQGPHjnuiXf46996+Lgti7cLhFPqnqLYrCunXfopUq9XlljTMc0Mg+mz9PySKT/FOW6bCeQKgrfjXfR3FGfWQDeJAIbRTqkVYpOi4/l6XS3sIJym5pC2tLlue+OYZgUKyfUe9JmU/bmD7QwP5ctD7FXxMHbIIRZEM5DnfD1+WaoOD8Gk22yDdeFX6Rn2xNkOcr2+TWKHm+GlIrlWZL/ZVjw9r/u9mY0UkyMjjtvtCFrakRtr9WxGXvomc5TeLZXrqBU/JG+XH9IGE5Bce2aXBoIy7FYahxqO7cax+BFFUeTn9uxxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo2uUjOS32YTL54q1Rj6J7cbgK8GERafP9GY+0vZaNw=;
 b=EoLMhNdZOU2X18xiESYuvSVm6aW/0w7mJe3uPNB4VB18O1V8GWDRqli5a/PGFlkR8yBUqMgfHI1ZxEqMQRzbR778YSRvegXusOcAEmMX7K8viZMs/IKuhYTQJYhn0o5vEGiHigV+9q6qutCT+xp0q0kNIkIT/XCBjuFTgxGtuDcx+7gK56q1y+534DvXG2Y/pp+1NbfGpTAHRgyR2KkBUfMO+4oolhvyPUpje7sXE/CpaaQiRvctImm21/PX9sSWwsOI/LcKO3rAtYucTwL05uHAgN3Sh96VB9LUbRhBd5xwst4+vEFZUs1SNCQShZK21BwWq9QyaJ59JwqA3rYqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo2uUjOS32YTL54q1Rj6J7cbgK8GERafP9GY+0vZaNw=;
 b=c94ECAX+A5faWQ0yNup8BgN0zKw/Wp8cLfTagtb1D44e4lSlW6gluCwi3yAW4QGIB/pf/i87qUiavMcPhe+3SL3V9teXXccB7R/psXpx/FHsiJudnoDout7HapjAAQ1q7R1teg5psFgvkIlaajxpC2FBfQIkzff/WKhJz8nQtP0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [PATCH v1] xen/arm: arm32: Add support to identify the Cortex-R52 processor
Date: Tue, 20 Jun 2023 16:17:36 +0100
Message-ID: <20230620151736.3720850-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b298864-e065-4a50-2218-08db71a182c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zMlt3Sfva4MlT8IB4LFZJnhHdANjbEqcsSIPELX8CvZfdhJYBexN9/kvFW6ksBOKxFq2xHGoLonji5fxq4xhoe7h+SOxHMCm4OQN1z/t0fBst0QaCrxxdB4KG6W/NSlXa8tOjC1QQM0lWUzsqHNb3OIy5CVcmKdOdUoZQT4ItgJdwb6rqcl7uWhdvVlr+/s/KrxDFyQZofRe7XYNKTCC1DTCPL+pTkjqIooKekh7gAGJSR51roliWuQXWPacZjj/79a4uTGEWPjMuxAxnVVAZ5G8J6jbc77fqHd/SrlRkcj0aUF9hrCDqaGnlxvKQRxJnWYpzOFETO3QBmPO2VHRL/lu8V/AgVBvMnwCm3c7bUCLMkSqp+NvIp5yLEhg4TdElzsvI+WNplMxNhu6ckW9cMc6/wl1PoqYY77P4MXR1q/NPj0UXaKC707NhMXm71f71AyB03Bhgy74uFNyXbsL1aEnjeqn9XWt4P5caHMWhzOgMNAzTwCzxGxX2bRewusRKhNrQCUP4Kx5mGh0pOZ7Sf3IH8rc8g7z3JYPhcSzs6xCkETnpUliAQZ0j0YQLYzJylL9e4iGWKNotQ+KVyqBNmKs6ne4JTsFu+8v3YZQlWv529kAxc6vz86Z0GeF3tfBVOCRH9M7vXUwbNQ0KrucnoVDCqrsWfI6JteD0ag0RR1nBi9sfqgKIWdnfAl6OC6BV4T0XKHPN+3vcSwhRG3F1sWS+B8zC9MFULC2m3uMokw1i3OQ1axad5Ajd+cWUSF19TS3cI4+SHnlj66Mr+3OMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(1076003)(478600001)(5660300002)(6916009)(70586007)(70206006)(4326008)(2906002)(54906003)(41300700001)(316002)(6666004)(8676002)(8936002)(186003)(26005)(426003)(2616005)(336012)(36860700001)(47076005)(82740400003)(81166007)(356005)(82310400005)(36756003)(103116003)(40460700003)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 15:17:50.0062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b298864-e065-4a50-2218-08db71a182c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412

Add a special configuration (CONFIG_AARCH32_V8R) to setup the Cortex-R52
specifics.

Cortex-R52 is an Arm-V8R AArch32 processor.

Refer ARM DDI 0487I.a ID081822, G8-9647, G8.2.112 MIDR,
bits[31:24] = 0x41 , Arm Ltd
bits[23:20] = Implementation defined
bits[19:16] = 0xf , Arch features are individually identified
bits[15:4] = Implementation defined
bits[3:0] = Implementation defined

Thus, the processor id is 0x410f0000 and the processor id mask is
0xff0f0000

Also, there is no special initialization required for R52.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig         |  7 +++++++
 xen/arch/arm/arm32/Makefile  |  1 +
 xen/arch/arm/arm32/proc-v8.S | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 xen/arch/arm/arm32/proc-v8.S

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 61e581b8c2..c45753a2dd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -3,6 +3,13 @@ config ARM_32
 	depends on "$(ARCH)" = "arm32"
 	select ARCH_MAP_DOMAIN_PAGE
 
+config AARCH32_V8R
+	bool "AArch32 Arm V8R Support (UNSUPPORTED)" if UNSUPPORTED
+	def_bool n
+	depends on ARM_32
+	help
+	  This option enables Armv8-R profile for AArch32.
+
 config ARM_64
 	def_bool y
 	depends on !ARM_32
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 520fb42054..2ab808a7a8 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -8,6 +8,7 @@ obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += proc-v7.o proc-caxx.o
+obj-$(CONFIG_AARCH32_V8R) += proc-v8.o
 obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
diff --git a/xen/arch/arm/arm32/proc-v8.S b/xen/arch/arm/arm32/proc-v8.S
new file mode 100644
index 0000000000..c5a566b165
--- /dev/null
+++ b/xen/arch/arm/arm32/proc-v8.S
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/arm32/proc-v8.S
+ *
+ * AArch32 V8R specific initialization
+ *
+ * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
+ */
+
+#include <asm/arm32/processor.h>
+#include <asm/sysregs.h>
+
+cr52_init:
+        mov pc, lr
+
+        .section ".proc.info", #alloc
+        .type __v8_cr52_proc_info, #object
+__v8_cr52_proc_info:
+        .long 0x410F0000             /* Cortex-R52 */
+        .long 0xFF0F0000             /* Mask */
+        .long cr52_init
+        .size __v8_cr52_proc_info, . - __v8_cr52_proc_info
+
+        .section ".proc.info", #alloc
+        .type __v8_cr52_proc_info, #object
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B967ADC91F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018121.1395047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFW-0006Lw-44; Tue, 17 Jun 2025 11:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018121.1395047; Tue, 17 Jun 2025 11:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFW-0006K7-0E; Tue, 17 Jun 2025 11:13:06 +0000
Received: by outflank-mailman (input) for mailman id 1018121;
 Tue, 17 Jun 2025 11:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcaV=ZA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRUFU-0006Jw-AF
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:13:04 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2408::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 086b85ec-4b6c-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 13:13:02 +0200 (CEST)
Received: from PH1PEPF000132F9.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2a)
 by SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 11:12:59 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH1PEPF000132F9.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 11:12:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 11:12:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:12:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:12:57 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 17 Jun 2025 06:12:56 -0500
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
X-Inumbo-ID: 086b85ec-4b6c-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yO3GCub3QsUMhc+mPJqheCpPm6lgf9zbIXsoSxTJKZSrz8lOTz4ws5btZkugKNw0j4VQQLt5Q8q08i7if5kR3zibyiYgOCBR6wnnmtKom2G03qObanivN7mrXmUAJ6Bv128jnCfqaNy80ylV6qZfhhPfXNhfTziHBOawNoPiiHzXar7tFvryZir91jTU8gz2qjLpzFnxFr/qf4aF/8OL7tz5KIUal/qO4vE+O4yF3/bypeGWVu+27NfT5HTLnydGDxoEYQueAUjXLKZp+7wsZZh3RyVDTnovuzgQvt/33Xwrx2ZgBf2ZlxaFgeqQscCfO3ZX5utgHFWlTvdKwmPc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTsKhPMFekwFkA5dxGfoQy5FLg3/1ViS8KSn6edb4tE=;
 b=nthiiLGNV0QXydZD2b6tzh6EU27+IFTdDhRtz+G2cDDW86OtblcliTPp2HpfCER7FpFM7pBjgdhSYmNPD5bgsSA+G1gGcck8pg/sxOMUpnec6B7VaQHyLjSD6Wdc++7+HRHbQ9LtdpdDHpb3XFTXC18RSDmlaIYnCuAdnDs/EYQcRoDcd9LvQf6HCoSa0ArdYhl5pg9rda1OEs48YhXlaSgZpRticMNyZu8oRCXZ/sWjy1Y4eQmov2DRWCftmvD2Dylps2l6jbNmG/Js4BuGIYymHmL+RDNboUTDjdh2tOFQx2QhTQHGholVy1Rwz7KSoHDjBRTaItK9rmAZxfzLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTsKhPMFekwFkA5dxGfoQy5FLg3/1ViS8KSn6edb4tE=;
 b=l6Y3oNg3Vz+GbHLRdGphAoaIRcJJEph25O8uqqaFfLPrX9fwCxcfqPHwGO389twi33uOTamHeHhyocv7dXP0xXtR1WIbMjh6CQXhcHoBoPda2YgwDZB9jNbhlJUhku/Wuj1jXEobBeakq9cpS6FQKod6o8PG3Bpc+U4XiRXi98w=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH v4 1/3] arm/mpu: Move the functions to arm64 specific files
Date: Tue, 17 Jun 2025 12:12:49 +0100
Message-ID: <20250617111251.1711553-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa5714d-c6fa-46c9-53d3-08ddad8fead1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xyHy4SWlKlLRLzrVEh5h/oyfiHtveONkE7kE3+/509tE9kXQfwITbIl5ytaZ?=
 =?us-ascii?Q?pFFhSr8tVxUp9lGZn36NJlW46+QwW5O7yQeBfjBGAKR+FXIEwFj/xomPi/gu?=
 =?us-ascii?Q?1hReoC00oUFJMNTJHzlUIcw+yxW4ogzC8z9C0UQ/7PpVQ080AbyW0mDUH0sO?=
 =?us-ascii?Q?IFGfe0SjGwCXGO54pD6EeAThn3ngp2XBhHhgcClRWSXdeXXE7tED9JzFxAeS?=
 =?us-ascii?Q?GzERUOgbNAueFnbwOpssBZ3wgScaDAtxN/F1Vqa2NIxIjZ6s+h4BtChxSN0s?=
 =?us-ascii?Q?xnlIE7xLDohSkpe8tIdpfLdt0b4akJUyRHhz5QAe2ivGR9cwHAFukB6UmKev?=
 =?us-ascii?Q?u/4wFOTU+NGhbKIJpkKUeUMVEGjQt4eRden2LKpLdz2CfPlRNAwOgGuF4mOA?=
 =?us-ascii?Q?c33r63RJk1XDrAsRH/76Tr5SmBEUS3qHgW5XErb+OL4u3jC1PDSOCliXGSYN?=
 =?us-ascii?Q?xWf1KojbDsmWdfak4ohNZeVRsZvfdhWZM9id7Afjqf0nrMuWbDuvP2RFPl0A?=
 =?us-ascii?Q?rPvzvkCCv24Qf8zAIIQjsJC6McVMkGAZ8VM8ZdY6s0vaPzM2titMkxnyqu4b?=
 =?us-ascii?Q?+Vh654oCczQ8+fW1umDPrSP8TMs56CV0stIY9bzIkzO1rnxVl8cz1+RiouUM?=
 =?us-ascii?Q?mMyxTkINo3uoIw5DPdlVwE5Nn4jyAQfqCVqM7KeHrUy4DTAFmpisYgohv+97?=
 =?us-ascii?Q?ufIms9ZmvwWVLH8BbExZrjZIjBWa+4dpGF+XSU526B0L4ea3FIcdDFEu1LIS?=
 =?us-ascii?Q?/Yy71fFqNvKVRhQx/jrM3rjlY86k6qDIVeK+NkczoSA4AyX8+BLgZyly6rMv?=
 =?us-ascii?Q?lRNgwFHJ2nXMIaJY8DcQTzR6/tCvcSIeDeWdQKzb1miZWMeyfqdJAEhs5HeJ?=
 =?us-ascii?Q?YxauCvWhGEDUP6JVDkvBuwQezhyzzi2qIyHaWYbnouwQZNCPFED5iwZ4uV/Y?=
 =?us-ascii?Q?7dFx5cPfPII00LvB6eWbYl6h3n9lI0NmsJJ7xcFYB2bsgXr5ema9R1KEaMX6?=
 =?us-ascii?Q?fnsbaGyZec57RpDXMBRb89uYtElxWWq6664WZli6+MdxnNPxnAxFZxf9CqsN?=
 =?us-ascii?Q?h3csx3bYdT//O9hWNJnxV2TuezfrxYebz6lK+nJhDy/PLVnH56Zxl7ypYGhH?=
 =?us-ascii?Q?HNNKqWW1xzl5HIhZlINaolksn/F7nxcEWsbYJ8xU+BG/xjhPyZW9Ck7cNBLj?=
 =?us-ascii?Q?23vS+3nENIM4gGfvLxBUGyzihF0WPm1xXQgM4loaGxo/wYaSy1DEbhmM8YDp?=
 =?us-ascii?Q?uieGGH0/W7BkpP1eLpNev0d1aeBsNlpBvMwiPRjDSXrJzE/hKIvg5KUOC0D7?=
 =?us-ascii?Q?/T2ayl7He6rnTfkxS3n/eYRmZ8H+DHD/wsVirVHIeKZtj1gpl9x7I4Ip4r65?=
 =?us-ascii?Q?0J+riIAGME8n9gKDWMxxCuSVduvZ90jr+ejNZep7cIJExsODuTZsecw5hirq?=
 =?us-ascii?Q?mUhoSrUBf1Bwo0aiQUlCkds+J8wBGYV1J1B6Q4bADSF3M18XxNAO7KMFuCx6?=
 =?us-ascii?Q?LEQqA1rQVnddUX7XTIC09qdCYj25dn+8DTsr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:12:58.6657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa5714d-c6fa-46c9-53d3-08ddad8fead1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173

prepare_selector(), read_protection_region() and write_protection_region()
differ significantly between arm32 and arm64. Thus, move these functions
to their sub-arch specific folder.

Also the macro GENERATE_{WRITE/READ}_PR_REG_CASE are moved, in order to
keep them in the same file of their usage and improve readability.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from -

v2 - New patch introduced in v3.

v3 - 1. Add Luca's R-b.

 xen/arch/arm/mpu/Makefile       |   1 +
 xen/arch/arm/mpu/arm64/Makefile |   1 +
 xen/arch/arm/mpu/arm64/mm.c     | 130 ++++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c           | 117 ----------------------------
 4 files changed, 132 insertions(+), 117 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm64/Makefile
 create mode 100644 xen/arch/arm/mpu/arm64/mm.c

diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 808e3e2cb3..5ad15e93be 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_ARM_32) += domain-page.o
+obj-$(CONFIG_ARM_64) += arm64/
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/arm64/Makefile b/xen/arch/arm/mpu/arm64/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/mpu/arm64/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
new file mode 100644
index 0000000000..ed643cad40
--- /dev/null
+++ b/xen/arch/arm/mpu/arm64/mm.c
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/types.h>
+#include <asm/mpu.h>
+#include <asm/sysregs.h>
+#include <asm/system.h>
+
+/*
+ * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
+ * and GENERATE_READ_PR_REG_CASE with num==0
+ */
+#define PRBAR0_EL2 PRBAR_EL2
+#define PRLAR0_EL2 PRLAR_EL2
+
+#define PRBAR_EL2_(n)   PRBAR##n##_EL2
+#define PRLAR_EL2_(n)   PRLAR##n##_EL2
+
+#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
+        break;                                                              \
+    }
+
+#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
+    case num:                                                   \
+    {                                                           \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
+        break;                                                  \
+    }
+
+/*
+ * Armv8-R supports direct access and indirect access to the MPU regions through
+ * registers:
+ *  - indirect access involves changing the MPU region selector, issuing an isb
+ *    barrier and accessing the selected region through specific registers
+ *  - direct access involves accessing specific registers that point to
+ *    specific MPU regions, without changing the selector, avoiding the use of
+ *    a barrier.
+ * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
+ * used for the direct access to the regions selected by
+ * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
+ * selector is a multiple of 16, giving access to all the supported memory
+ * regions.
+ */
+static void prepare_selector(uint8_t *sel)
+{
+    uint8_t cur_sel = *sel;
+
+    /*
+     * {read,write}_protection_region works using the direct access to the 0..15
+     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
+     * only when needed, so when the upper 4 bits of the selector will change.
+     */
+    cur_sel &= 0xF0U;
+    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
+    {
+        WRITE_SYSREG(cur_sel, PRSELR_EL2);
+        isb();
+    }
+    *sel &= 0xFU;
+}
+
+void read_protection_region(pr_t *pr_read, uint8_t sel)
+{
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_READ_PR_REG_CASE(0, pr_read);
+        GENERATE_READ_PR_REG_CASE(1, pr_read);
+        GENERATE_READ_PR_REG_CASE(2, pr_read);
+        GENERATE_READ_PR_REG_CASE(3, pr_read);
+        GENERATE_READ_PR_REG_CASE(4, pr_read);
+        GENERATE_READ_PR_REG_CASE(5, pr_read);
+        GENERATE_READ_PR_REG_CASE(6, pr_read);
+        GENERATE_READ_PR_REG_CASE(7, pr_read);
+        GENERATE_READ_PR_REG_CASE(8, pr_read);
+        GENERATE_READ_PR_REG_CASE(9, pr_read);
+        GENERATE_READ_PR_REG_CASE(10, pr_read);
+        GENERATE_READ_PR_REG_CASE(11, pr_read);
+        GENERATE_READ_PR_REG_CASE(12, pr_read);
+        GENERATE_READ_PR_REG_CASE(13, pr_read);
+        GENERATE_READ_PR_REG_CASE(14, pr_read);
+        GENERATE_READ_PR_REG_CASE(15, pr_read);
+    default:
+        BUG(); /* Can't happen */
+        break;
+    }
+}
+
+void write_protection_region(const pr_t *pr_write, uint8_t sel)
+{
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
+    default:
+        BUG(); /* Can't happen */
+        break;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 3d37beab57..7ab68fc8c7 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -29,35 +29,6 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
 /* EL2 Xen MPU memory region mapping table. */
 pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 
-#ifdef CONFIG_ARM_64
-/*
- * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
- * and GENERATE_READ_PR_REG_CASE with num==0
- */
-#define PRBAR0_EL2 PRBAR_EL2
-#define PRLAR0_EL2 PRLAR_EL2
-
-#define PRBAR_EL2_(n)   PRBAR##n##_EL2
-#define PRLAR_EL2_(n)   PRLAR##n##_EL2
-
-#endif /* CONFIG_ARM_64 */
-
-#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
-    case num:                                                               \
-    {                                                                       \
-        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
-        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
-        break;                                                              \
-    }
-
-#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
-    case num:                                                   \
-    {                                                           \
-        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
-        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
-        break;                                                  \
-    }
-
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -69,94 +40,6 @@ static void __init __maybe_unused build_assertions(void)
 }
 
 #ifdef CONFIG_ARM_64
-/*
- * Armv8-R supports direct access and indirect access to the MPU regions through
- * registers:
- *  - indirect access involves changing the MPU region selector, issuing an isb
- *    barrier and accessing the selected region through specific registers
- *  - direct access involves accessing specific registers that point to
- *    specific MPU regions, without changing the selector, avoiding the use of
- *    a barrier.
- * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
- * used for the direct access to the regions selected by
- * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
- * selector is a multiple of 16, giving access to all the supported memory
- * regions.
- */
-static void prepare_selector(uint8_t *sel)
-{
-    uint8_t cur_sel = *sel;
-
-    /*
-     * {read,write}_protection_region works using the direct access to the 0..15
-     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
-     * only when needed, so when the upper 4 bits of the selector will change.
-     */
-    cur_sel &= 0xF0U;
-    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
-    {
-        WRITE_SYSREG(cur_sel, PRSELR_EL2);
-        isb();
-    }
-    *sel &= 0xFU;
-}
-
-void read_protection_region(pr_t *pr_read, uint8_t sel)
-{
-    prepare_selector(&sel);
-
-    switch ( sel )
-    {
-        GENERATE_READ_PR_REG_CASE(0, pr_read);
-        GENERATE_READ_PR_REG_CASE(1, pr_read);
-        GENERATE_READ_PR_REG_CASE(2, pr_read);
-        GENERATE_READ_PR_REG_CASE(3, pr_read);
-        GENERATE_READ_PR_REG_CASE(4, pr_read);
-        GENERATE_READ_PR_REG_CASE(5, pr_read);
-        GENERATE_READ_PR_REG_CASE(6, pr_read);
-        GENERATE_READ_PR_REG_CASE(7, pr_read);
-        GENERATE_READ_PR_REG_CASE(8, pr_read);
-        GENERATE_READ_PR_REG_CASE(9, pr_read);
-        GENERATE_READ_PR_REG_CASE(10, pr_read);
-        GENERATE_READ_PR_REG_CASE(11, pr_read);
-        GENERATE_READ_PR_REG_CASE(12, pr_read);
-        GENERATE_READ_PR_REG_CASE(13, pr_read);
-        GENERATE_READ_PR_REG_CASE(14, pr_read);
-        GENERATE_READ_PR_REG_CASE(15, pr_read);
-    default:
-        BUG(); /* Can't happen */
-        break;
-    }
-}
-
-void write_protection_region(const pr_t *pr_write, uint8_t sel)
-{
-    prepare_selector(&sel);
-
-    switch ( sel )
-    {
-        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
-    default:
-        BUG(); /* Can't happen */
-        break;
-    }
-}
-
 pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 {
     unsigned int attr_idx = PAGE_AI_MASK(flags);
-- 
2.25.1



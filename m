Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FAAD58E5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011840.1390370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMZy-0000yC-8W; Wed, 11 Jun 2025 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011840.1390370; Wed, 11 Jun 2025 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMZy-0000uz-5Q; Wed, 11 Jun 2025 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1011840;
 Wed, 11 Jun 2025 14:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMZx-0007IS-6H
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:37:25 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061a.outbound.protection.outlook.com
 [2a01:111:f403:240a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c9c05b-46d1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 16:37:24 +0200 (CEST)
Received: from BN9PR03CA0480.namprd03.prod.outlook.com (2603:10b6:408:139::35)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Wed, 11 Jun
 2025 14:37:20 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::8c) by BN9PR03CA0480.outlook.office365.com
 (2603:10b6:408:139::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 14:37:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:37:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:37:19 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:37:18 -0500
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
X-Inumbo-ID: 95c9c05b-46d1-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMIkrm1mSHr/YHxUNveekXTHzCsECPXjR7lnYKwf+Qu664/j+TFFj/821Qttk4dIbB7x+YwGAfsdcbkeaM9NkcASP43bPdwgo9uH6qO/Tq6pHEiJbQZIvRW3syCiek4kv7h3p9DYYXh0ZR0FXjwRjMVGz5r5ifb9Fd577UwvE4l+BFvkGirhivphgxoZtCRzJQVYM0r7iJU492oaG6xzZTQF6Ng9mmZ0oBS6loTfpXevXjSinzMtoBrDlJ/SLckht+i9WTJGM0mneBpgBFgYFW8PB5W8W+cv2Ax9kJS9r8sGMSXjl2rVg+W6tYFQlUMhutgYhwekJY0MudDGOzHvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDvGQBOm5SJaxPp+iQKpPd7Mnxt0kUlWkXnfTAWHga4=;
 b=w4AM9evQOjCt9VjujaegSOsla0hRWkuaS3Vz/IcUabR5dJNDzC6MlTQOW3iWlDI+VdO5w5Y/ZTkSiyOu38vS5e5TdayhiQivtvtk+Rj907Ekh8HqYYFOor6isDKUpMGcaYXvIf4y142tX2kwUyXC1lF25XeDyVgj6LYok1kYuTCbsbgxb7Gl2SEgylTT+75B7/6eCDIXplCkq3Xdh4EYQYsSLUh4RAqDzuID70Uxy4nTEHHIzqKFwSnL+iq0WmhIRxzYFm8Zorpc6N9niieOSfELKSZ78hlzqx6T6yjnMJNWrg/UBKwVEb6kpsPrKIYs+fTrIvD+c0q1aGdmpqdGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDvGQBOm5SJaxPp+iQKpPd7Mnxt0kUlWkXnfTAWHga4=;
 b=04OZJ15+j8/VEqE6+LHSHDWEUl2cg+AfIggsDUqROZmIxl2aq+AnsP2qEPyh51BfhYdgjq7WxZ3ICONnAk7v0Z3FxpksaS56M7+ujUVDg4NDcliPMxjFKsRf4B9bnyYPxxZqxmOmoz1sfI2Vby5Nq/jPWC+r1FyrCL6N1fOF3vg=
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
Subject: [PATCH v3 4/6] arm/mpu: Move the functions to arm64 specific files
Date: Wed, 11 Jun 2025 15:35:42 +0100
Message-ID: <20250611143544.3453532-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7900458d-8c6f-499b-477b-08dda8f5787c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ekB2zLJjQ6KFl7MY7dFzTrtv71x+QRvKCXpjWCrVFQ2VZrscRhPLGc9fbUBl?=
 =?us-ascii?Q?HbWG2bBQS8U1/ZousyNe3Jduo4wHoACpvn/uFbcJY4lOltoWTIkqVoI754Se?=
 =?us-ascii?Q?iHzjnIDFSpO1crqN9C6ajfRRB/MxW/wgB8qGghR6t3RpnBL2GVT4XOim+Wx/?=
 =?us-ascii?Q?NH3FiTjra/DgbrQgtsKA+AcxLJswP0ER2A5wNWniB4NhYCmvLZIvN38C8JJV?=
 =?us-ascii?Q?8VQx4F+goj71EW0/sxB6Im5Cc4lkZbe+2g7cx8aCNPWAFCqpkDff3loTLZ86?=
 =?us-ascii?Q?oy4LwOPEKZXgM4sOutCsC2pjMg/d9kkgrLHn8uzLj25ky/8efFclJcL4RziU?=
 =?us-ascii?Q?Hk8kLo/FgxS6Nw6FyIX2G5SLqLLsYtZRr0+h0gDWVSxud0zeVWwy/JhvbAYJ?=
 =?us-ascii?Q?5ttWFc/fZUOuxE28aYcdd/G1qN0JX4+qycw+qIexV++v9qH9TMtWy9Qn8KoL?=
 =?us-ascii?Q?YdMFyJN+EI2P7uZzpUy7KIfFDLB7shHLkssXG/R1whSsOWZloGuhO3fg9Xeo?=
 =?us-ascii?Q?z9pUExUhu+6iSk6tjq91BJPybWl/oAznYcQuOlNbgoC3ll68FdFG1Ecl6RH2?=
 =?us-ascii?Q?LCJVZirJePzxb89ltBqjtlSkAURvjdetE98mkGg9+e29iWKUFrQvii9TuI8k?=
 =?us-ascii?Q?PP2hLxgaTSYpNr6Nad5r200LfVjmAHmOiAcop4YK/8MDEsoqMpqmk5041soF?=
 =?us-ascii?Q?ykyudzT8vUg4jaonnaTdyNZUhoOIZn5hdHNtmOvoFe5X3uyFcfavrKe3bkU6?=
 =?us-ascii?Q?sGDjUM3otB7wCtfyoMwwMfYj4wageraRfvPXFCh77CQhAXIc7+/WtaOKq6Y4?=
 =?us-ascii?Q?QI+4QBpUOwvFLRHS5Zcio+lhgWYS3Qv8qWojiCldMfRCvyzGPAthTpwGxgwF?=
 =?us-ascii?Q?mepVg7+XO4qC1cC3I/epFUQNo6vw4Py/0ea1yiS3lTvJ1kJU3eAIV+LLqg2X?=
 =?us-ascii?Q?xgM5/SCK5Q9pwT3lj99dcRWxTji4jrvQos6fdECY8UNvi/Aiqf0hL3ZrnQ81?=
 =?us-ascii?Q?JRJxjPvqWZmVr+BduNg69JIYRnKAMZ/Bsx1bYWu+d6wCFdvSRjmQw4SFm39H?=
 =?us-ascii?Q?rmXDr4eyL2+ttevjdWhK2RX9+Orv6E99x+SdRoVxnqGqDjBvFsc/e1uPODea?=
 =?us-ascii?Q?W8QIJ4FaeVQva56dr43nFEyYY0LkwyTFgQt2hkdkmJfZVGUIcJafefALxyXa?=
 =?us-ascii?Q?7YpLsVLmyGb+qvNz5Q94aW3KxoI9wMKEN44JPtLmLVCpJvWqCXQUFEwYFxB+?=
 =?us-ascii?Q?gN74Y2VizJ5Gs+QAOtBBC8T0SL9G+bCJIYieoIO9TrhZGPPamJ6brt2s+gbq?=
 =?us-ascii?Q?qRdFVlNtAyO2npXNWsesgiABsVzJ5cLv1q+Bm3A5SnkMVKuqBBUZvf+NUpcV?=
 =?us-ascii?Q?0TYhjV59KYcaMhq2/zZ5TVWlDCbN1x6iNsj9KiWAa2e4UPkHARUDw1eQDo1v?=
 =?us-ascii?Q?iHycJw0OyH1UKDYB4IBlnPfE78sXCnsfc2YtWmDJu4RJIhOiSVvUVJJ5avD/?=
 =?us-ascii?Q?S+04tcP6SOluXYdQebmq3PK5YmW18kz/vom6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:37:19.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7900458d-8c6f-499b-477b-08dda8f5787c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993

prepare_selector(), read_protection_region() and write_protection_region()
differ significantly between arm32 and arm64. Thus, move these functions
to their specific folders.

GENERATE_{WRITE/READ}_PR_REG_CASE are duplicated for arm32 and arm64 so
as to improve the code readability.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1..v2 - New patch introduced in v3.

 xen/arch/arm/mpu/Makefile       |   1 +
 xen/arch/arm/mpu/arm64/Makefile |   1 +
 xen/arch/arm/mpu/arm64/mm.c     | 130 ++++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c           | 117 ----------------------------
 4 files changed, 132 insertions(+), 117 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm64/Makefile
 create mode 100644 xen/arch/arm/mpu/arm64/mm.c

diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 9359d79332..4963c8b550 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
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
index 0000000000..a978c1fc6e
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
+    *sel = *sel & 0xFU;
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



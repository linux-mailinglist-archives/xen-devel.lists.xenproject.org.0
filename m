Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE195D38A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782451.1191958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCh-0004IQ-53; Fri, 23 Aug 2024 16:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782451.1191958; Fri, 23 Aug 2024 16:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCh-0004G0-0h; Fri, 23 Aug 2024 16:31:59 +0000
Received: by outflank-mailman (input) for mailman id 782451;
 Fri, 23 Aug 2024 16:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lC7=PW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1shXCf-0003gP-DM
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 16:31:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2414::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36157c30-616d-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 18:31:56 +0200 (CEST)
Received: from CH0PR08CA0001.namprd08.prod.outlook.com (2603:10b6:610:33::6)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 16:31:53 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::f8) by CH0PR08CA0001.outlook.office365.com
 (2603:10b6:610:33::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 16:31:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 16:31:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:51 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 23 Aug 2024 11:31:50 -0500
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
X-Inumbo-ID: 36157c30-616d-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4+HfeVHXna29Bt1oGg4sA5thuBZqa7ZEsRCrBqjhLvf2iWnS2awtK4LNJXpcUsgtUb95IQzrCUbyDYg8IgLSTZVV0yNCJJwMFcqNi/zPqNN+3jRzsB9pH7nnDvQ5+XjKD4U8L0rmA7TsjGr/NW84Mjx8r7rjVUWqWy8XpLLcwBVPatnHierVc67141Faa5pw+0wV6hburHYKgnpwMv1BfBGeTUpTTo4UaNrJ+Hc+qgdnl5GvntIaLs7pV5glCS6wCONhH9JZGTfdTl98imH2qFqFWjqCpgZ8Xvw1HKnFY8oUFP7ldWbumPzII1GvqHBtCcPvgkdLnKYjf9UdR0+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VX6RV1GAbIb7gcCEfNz4iYXOrRrxcVBayyRtnGLtkc=;
 b=mARlzjV1Wm7aNdI5H8DzZ9rEYC1RdQvrqBI4MrrlXStkCkn+YEHl0uvqQWFFfsyI7T0ukCKsG2GtjKrTgAIEn+Q3OgEEKh2F2XZPbViblkg/qdCaOKHoiac16FCj3mG5ql5S54oXVmhOG0VaBM0tcelZ0VhnQsK6PsOFxSW6qbHiG1dDpixQ3cF/Al68LyVy63zOLzYh78fUjH3/jwt4e7ueKEv///n3ao9r7GJ5JxxiwNGIeGV+bA80JUJuaFopaU630KtV5Pn/CWnU7fmxUZZyGRpMiTELwLfz3/rjaB26Li9mj+bamRtCWDa4ZQTRo8tp1c38v7hZzBcws1meuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VX6RV1GAbIb7gcCEfNz4iYXOrRrxcVBayyRtnGLtkc=;
 b=d9iDxmaJNkHxVXgBeR1j1H0lnCLudFfiee3SyUale4LVCiD9lA3gthJOR/adQW6iiGIE9H/zPIvb4mDTsq33/bMDGrPxqP0o437o3g49maMrbXoESy4Nkk2FWjHb99a42MIknqE87SLwLtNn1LQ3w2l0AE/ocwKFPPL/uCLYzOk=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/4] xen/arm: mpu: Create boot-time MPU protection regions
Date: Fri, 23 Aug 2024 17:31:26 +0100
Message-ID: <20240823163127.3443404-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 706a318d-5ef2-49a3-932d-08dcc391185e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Aq4WSqIn+vHBBrofc+8j9mYjH6bfw95pAshSbAaWpwHd3zO/DI8Ae+fXrA1y?=
 =?us-ascii?Q?48v1jIzK2Tn5XwYoVTXu9OiME/+YMIjQLDTPagWh3CkIX08MJmO3kQrES3Zk?=
 =?us-ascii?Q?4p6i0jD8ekfkKsauREz5uYrLs8fNkoYVdJqnRwamhm/xjiyQJRQzaZehDwQ7?=
 =?us-ascii?Q?1ht/izG3oGzE6c/+YwoYommm7V4xgSsEC8vfe310Xe5gCu5HyXPIco0uBU4h?=
 =?us-ascii?Q?abWM+flc79qXmNq+3c7CBj0+DTh69Aui9beQTpO4bHYamQNx4LU2FELolK0R?=
 =?us-ascii?Q?SX5x0/tZFY0AaOV3HN6ifiBS84Hx3d247ohrXxgNLK66bBgDqPQCFg19O9IZ?=
 =?us-ascii?Q?HnVmtZ+TTwkgc3XmxDFDc0exYJ/NOoDvvFk/sCRmkJ8HCJ8urGlxuIYim9rt?=
 =?us-ascii?Q?fD2w43WCzDZBliRLyerBtgevWcafVsO6bPAHlZQrh/YyLyN6qbHyOG0hc7mz?=
 =?us-ascii?Q?l4YXz4UCX1DGIf3HwkXrKjUAt1jiybkHXo53wVIYHK0S3Jpu2lp2vdWBvVQI?=
 =?us-ascii?Q?tgUa0p/JG4qIWIOG2lZTdUsz1MLUxKSvWjDI70BazWTJzI6Oh76y+hrZtEhF?=
 =?us-ascii?Q?1mdmkOUHWT8E9DuNKTR4oolaxPV4n4QNR3b+06jBLXWIY9UileUx+SXGHSrl?=
 =?us-ascii?Q?BwIyDANNwpRxqDBi/eClxc4Sq8ag2lJjTOQ6qG8I+izlEh+3FyS8pvq97KtF?=
 =?us-ascii?Q?msKmmilb8HIxHo8zMAn6W4iWT3TFr985GambaNk/8Ai3ChMjXqoTKpdHU2Ez?=
 =?us-ascii?Q?5Rm4DX2egAkE2hfI2JHBIdG9MGQjI1+y5KepEgc0/WBScuvr1pVWZ6o0hL5N?=
 =?us-ascii?Q?rVY/34fLBbetl28H7F0vBNerCeXuDIW4Jc3HlFK2hbFivuc6NtreS7/WGxez?=
 =?us-ascii?Q?7tIzHoycLbLa4bJPw/EJJpQn4WRge1ouMTpdWZ1+2FXyMDr4FRM8COLnCNcH?=
 =?us-ascii?Q?DiD51Ibpd8kalJcyOWccwtbgciMK06ojfyHTsiAZkga1QmC7pHKMUVuRQn1h?=
 =?us-ascii?Q?Y8PAXi3D4+SeCliV6A3NmGsHpLil5l1Yf49WtuwYd4W9NsGi2vYfJ5DuVF+u?=
 =?us-ascii?Q?6Uqiq7rVv+2sGDmbsfziYFdM9CgbR89GIHTxCWioy0vItzjYJhACZV7FkYrK?=
 =?us-ascii?Q?p55qNofewAC50nzaWFaNt3kSGdhTaxriAHeXMK2Z2E0wAbEYnIp2GusB5cuA?=
 =?us-ascii?Q?yszTklOiiOG6Si8+0k76+qslG/5imIKJs4VQM+nhS9q8Q/HQLWABo6RKNi3W?=
 =?us-ascii?Q?S44f2wAe55aMOFMTf1mEutjAvmsBQORcWAw17V0VKvuYuAc+nqM0fpzVITkh?=
 =?us-ascii?Q?wgmXyzIaaouWYelGWmfu4Q5BjKji2GuqcGPbDIW0X/1Ut12S1RehP02/3BYh?=
 =?us-ascii?Q?x5fmpi1yUy9s+tKBbJapE/9jVSpQCiF1FfrTq8Sh3HtFUubarKRuDiXZvgJT?=
 =?us-ascii?Q?brpAASvG4SeHM51tc7PqL83MFUTmbfkZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:52.5668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706a318d-5ef2-49a3-932d-08dcc391185e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740

Define enable_boot_cpu_mm() for the AArch64-V8R system.

Like boot-time page table in MMU system, we need a boot-time MPU
protection region configuration in MPU system so Xen can fetch code and
data from normal memory.

START_ADDRESS + 2MB memory is mapped to contain the text and data
required for early boot of Xen.

One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
registers", the following

```
The MPU provides two register interfaces to program the MPU regions:
 - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
PRLAR<n>_ELx.
```
We use the above mechanism to configure the MPU memory regions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Makefile                    |  1 +
 xen/arch/arm/arm64/mpu/Makefile          |  1 +
 xen/arch/arm/arm64/mpu/head.S            | 70 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 50 +++++++++++++++++
 xen/arch/arm/include/asm/mpu/arm64/mm.h  | 13 +++++
 xen/arch/arm/include/asm/mpu/mm.h        | 18 ++++++
 6 files changed, 153 insertions(+)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7792bff597..aebccec63a 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
new file mode 100644
index 0000000000..3340058c08
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
new file mode 100644
index 0000000000..2b023c346a
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/mm.h>
+#include <asm/page.h>
+#include <asm/early_printk.h>
+
+/*
+ * From the requirements of head.S we know that Xen image should
+ * be linked at XEN_START_ADDRESS, and all of text + data + bss
+ * must fit in 2MB. On MPU systems, XEN_START_ADDRESS is also the
+ * address that Xen image should be loaded at. So for initial MPU
+ * regions setup, we use 2MB for Xen data memory to setup boot
+ * region, or the create boot regions code below will need adjustment.
+ */
+#define XEN_START_MEM_SIZE      0x200000
+
+/*
+ * In boot stage, we will use 1 MPU region:
+ * Region#0: Normal memory for Xen text + data + bss (2MB)
+ */
+#define BOOT_NORMAL_REGION_IDX  0x0
+
+/* MPU normal memory attributes. */
+#define PRBAR_NORMAL_MEM        0x30    /* SH=11 AP=00 XN=00 */
+#define PRLAR_NORMAL_MEM        0x0f    /* NS=0 ATTR=111 EN=1 */
+
+.macro write_pr, sel, prbar, prlar
+    msr   PRSELR_EL2, \sel
+    dsb   sy
+    msr   PRBAR_EL2, \prbar
+    msr   PRLAR_EL2, \prlar
+    dsb   sy
+    isb
+.endm
+
+.section .text.header, "ax", %progbits
+
+/*
+ * Static start-of-day EL2 MPU memory layout.
+ *
+ * It has a very simple structure, including:
+ *  - 2MB normal memory mappings of xen at XEN_START_ADDRESS, which
+ * is the address where Xen was loaded by the bootloader.
+ */
+ENTRY(enable_boot_cpu_mm)
+    /* Map Xen start memory to a normal memory region. */
+    mov x0, #BOOT_NORMAL_REGION_IDX
+    ldr x1, =XEN_START_ADDRESS
+    and x1, x1, #MPU_REGION_MASK
+    mov x3, #PRBAR_NORMAL_MEM
+    orr x1, x1, x3
+
+    ldr x2, =XEN_START_ADDRESS
+    mov x3, #(XEN_START_MEM_SIZE - 1)
+    add x2, x2, x3
+    and x2, x2, #MPU_REGION_MASK
+    mov x3, #PRLAR_NORMAL_MEM
+    orr x2, x2, x3
+
+    /*
+     * Write to MPU protection region:
+     * x0 for pr_sel, x1 for prbar x2 for prlar
+     */
+    write_pr x0, x1, x2
+
+    ret
+ENDPROC(enable_boot_cpu_mm)
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index b593e4028b..0d122e1fa6 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,56 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+/* System registers for AArch64 with PMSA */
+#ifdef CONFIG_MPU
+
+/* EL2 MPU Protection Region Base Address Register encode */
+#define PRBAR_EL2   S3_4_C6_C8_0
+#define PRBAR1_EL2  S3_4_C6_C8_4
+#define PRBAR2_EL2  S3_4_C6_C9_0
+#define PRBAR3_EL2  S3_4_C6_C9_4
+#define PRBAR4_EL2  S3_4_C6_C10_0
+#define PRBAR5_EL2  S3_4_C6_C10_4
+#define PRBAR6_EL2  S3_4_C6_C11_0
+#define PRBAR7_EL2  S3_4_C6_C11_4
+#define PRBAR8_EL2  S3_4_C6_C12_0
+#define PRBAR9_EL2  S3_4_C6_C12_4
+#define PRBAR10_EL2 S3_4_C6_C13_0
+#define PRBAR11_EL2 S3_4_C6_C13_4
+#define PRBAR12_EL2 S3_4_C6_C14_0
+#define PRBAR13_EL2 S3_4_C6_C14_4
+#define PRBAR14_EL2 S3_4_C6_C15_0
+#define PRBAR15_EL2 S3_4_C6_C15_4
+
+/* EL2 MPU Protection Region Limit Address Register encode */
+#define PRLAR_EL2   S3_4_C6_C8_1
+#define PRLAR1_EL2  S3_4_C6_C8_5
+#define PRLAR2_EL2  S3_4_C6_C9_1
+#define PRLAR3_EL2  S3_4_C6_C9_5
+#define PRLAR4_EL2  S3_4_C6_C10_1
+#define PRLAR5_EL2  S3_4_C6_C10_5
+#define PRLAR6_EL2  S3_4_C6_C11_1
+#define PRLAR7_EL2  S3_4_C6_C11_5
+#define PRLAR8_EL2  S3_4_C6_C12_1
+#define PRLAR9_EL2  S3_4_C6_C12_5
+#define PRLAR10_EL2 S3_4_C6_C13_1
+#define PRLAR11_EL2 S3_4_C6_C13_5
+#define PRLAR12_EL2 S3_4_C6_C14_1
+#define PRLAR13_EL2 S3_4_C6_C14_5
+#define PRLAR14_EL2 S3_4_C6_C15_1
+#define PRLAR15_EL2 S3_4_C6_C15_5
+
+/* MPU Protection Region Enable Register encode */
+#define PRENR_EL2 S3_4_C6_C1_1
+
+/* MPU Protection Region Selection Register encode */
+#define PRSELR_EL2 S3_4_C6_C2_1
+
+/* MPU Type registers encode */
+#define MPUIR_EL2 S3_4_C0_C0_4
+
+#endif
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
diff --git a/xen/arch/arm/include/asm/mpu/arm64/mm.h b/xen/arch/arm/include/asm/mpu/arm64/mm.h
new file mode 100644
index 0000000000..d209eef6db
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/arm64/mm.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mpu.h: Arm Memory Protection Unit definitions.
+ */
+
+#ifndef __ARM64_MPU_H__
+#define __ARM64_MPU_H__
+
+#define MPU_REGION_SHIFT  6
+#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
+#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
+
+#endif /* __ARM64_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
new file mode 100644
index 0000000000..f5ebca8261
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -0,0 +1,18 @@
+#ifndef __ARCH_ARM_MPU__
+#define __ARCH_ARM_MPU__
+
+#if defined(CONFIG_ARM_64)
+# include <asm/mpu/arm64/mm.h>
+#else
+# error "unknown ARM variant"
+#endif
+
+#endif /*  __ARCH_ARM_MPU__ */
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D39988BF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816168.1230387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytn9-0006uK-4d; Thu, 10 Oct 2024 14:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816168.1230387; Thu, 10 Oct 2024 14:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytn9-0006sH-10; Thu, 10 Oct 2024 14:05:23 +0000
Received: by outflank-mailman (input) for mailman id 816168;
 Thu, 10 Oct 2024 14:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytn7-0006aO-QN
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:05:21 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2409::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af1ec6f8-8710-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:05:21 +0200 (CEST)
Received: from DM5PR07CA0069.namprd07.prod.outlook.com (2603:10b6:4:ad::34) by
 CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.18; Thu, 10 Oct 2024 14:05:14 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::b8) by DM5PR07CA0069.outlook.office365.com
 (2603:10b6:4:ad::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 14:05:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:05:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:11 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:05:10 -0500
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
X-Inumbo-ID: af1ec6f8-8710-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1gOpdPggCnAhQ7kGYUJWyQwkfDUzR/XGiAyVL9Hbmb96ZV9UepTcLxSqRxqzG9sxk4RXq9NGwHyLFtyX5IfFjwZzR1RG2STNPPa6FT2S0QONsmo6WPyqw/O7kD6TZApIP0qpIoGhP7fS1oA6QbBgXhSI0Iw9VPx/tf1bqhqlXuf3MnVzfqL2QjoOcW4wrUrGTjqupaF6Q0R4tklDymXE09xlfT7/BmUZwQXUrcQMyBBLXuEwjteuIsEdJSHBv1V6JqPC9yqZmADoYddGECc1D2vvdX4Qflk2ED/NAGcd+IydPf24a/OYQlxx4Nx1z+ylImBvjlVuZRitNCS2amtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aruzkSKUsNciUbMXagWPYMmiCZ+8Cmt3DkB4+KAZeS0=;
 b=u25b9o92xXFEkyyytAsdUg5FEtCEo5lMwkleoiVxhVkrePSH2BKI11TbVq6wGU7WoERhzVI90mWIv1z21Kdy9UXw/KsRHx9agfmXIdK/CwWzuNyfmzQccmPNhmGGO4461iCyynlxnHkMcg32nJmnqe/5OmmUSxLwgpT5ARR3IWS3H3jsDlrvw7UKTUz4E54d+r7vmF+olcR6vAUn/etWIRixRY6ZjcOEB+21T2eM1Ftb/3gti1fnorq7nm1s6LfiQniLg/gM4s8seNheI6g+b+O6Z2zVIXXMzykfRs6YgSkBV8JKQjrZAyd19FxhGbvlALqA9IF/X0YUXsKLJ3udyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aruzkSKUsNciUbMXagWPYMmiCZ+8Cmt3DkB4+KAZeS0=;
 b=Lj+zfCrOfO3XwnzPhkeRMu51o5DE6ioYw9t2Y1fdlLifheUHxC1L2rKXtHWLqa8JxrFPaGhKtzn4kX5nmjuwDf7Vv2CCRy9H+UxY0wPZqbmsb/SF6R3cmcu365XY6ZvJUfkmw4W39zCYuwAks+ZI810ERa/5sq8UqoeubepJGko=
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
Subject: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection regions
Date: Thu, 10 Oct 2024 15:03:49 +0100
Message-ID: <20241010140351.309922-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4871be-9274-48ad-2b47-08dce9348f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Rffq8JctN6kev/ygMamkIvFks+eb7wZsO9yqaafKFdYwpHvi8y6KidVXU0S?=
 =?us-ascii?Q?XMTbRNjeA2zS9a/VhaFe3nQinZEzq4XfciWH2wGt42qHROgh8iYqUJ4wEoYD?=
 =?us-ascii?Q?t+qMFqj49KeXIu/zzzQ2D0wOtcNbbbsKetzCNsr8RgvbQjfTz0n1Td+RMq/+?=
 =?us-ascii?Q?Y4x2X1iADdRrGw/Qe+/n5JguS14y2cica4ApbZeCAf8Tx5HF8bNya+EbnOWN?=
 =?us-ascii?Q?j+MJwvAtV3Ib4l0WdAD+poCu6ffONU/NKKZXDAgg0YDAAPpxdYhRsp/faV7q?=
 =?us-ascii?Q?tZZKYmvKOKPkAyXG8fI9Q4TmzhHQGIktRuWWvrwJj9zxNEiSXuahbVc6PBBw?=
 =?us-ascii?Q?UWAHIGaZqVGYBTHu4aXEPSudetGmu2ZS2jSPHmqRgEBHB1DRD7wXu9tA8tpx?=
 =?us-ascii?Q?6vRPePEfGOsbKDJf09XlmhsawQtFqKIe+IovHNtJY/BNkp4tpKspanhQqI6i?=
 =?us-ascii?Q?VsDkbfmYh3qoTNFbKNpNjhwwm2cFXaMH2zAb8kzXABrb/zOdxvjFjs86so09?=
 =?us-ascii?Q?kd+6klhShkKYfVH7P2zJiFDuzyxB3HSLXetSghsuz2vMyOcFqs1Q1GcvPBp1?=
 =?us-ascii?Q?3/ZpGIDVz9389Po60wdQ3g3+NwOZNa/s7i2MtAwVm1Yxq2GGNyVO3JWEVN1A?=
 =?us-ascii?Q?cmpTbRGO7TZw40xmmHa+kzEzmGJa5qucH8SRj3Y7dAplqcHOwmQNUyCWJVlp?=
 =?us-ascii?Q?K57wyrmMIc2Jfz8oL8tsSXMh6gP5Mww9hHn5WLChSyjbwKEpN1u1NjpZ5lK/?=
 =?us-ascii?Q?pjJtE+FIuXovvODhCLGJ8fS54IczMnU13XFeJPMh6c5B/a41OR4Xm+i2kGLM?=
 =?us-ascii?Q?9eFHSgiK0oKpswBsWOMHA3ZiG+QLH20djbnRtaPAxIXFYMxqsCzaBX+5/jx2?=
 =?us-ascii?Q?hEcFqy8PbwbA8Mb+OGoDxivmtFeWZTTKyV5Whmpg5pifSqVK6mwSLA6Pgohu?=
 =?us-ascii?Q?vxmc2zU8qLI642Qh03Cj2i51Mwj+cPoz3H1dAPX2LBldFIS0O9lDGV2Qy1+F?=
 =?us-ascii?Q?83ndFkVIY5tfwbxj0enXxK3EmxXZC2pnZJq/6KKBvrMD609eP04a6FCQJ07S?=
 =?us-ascii?Q?OBXKY5S8RSk5f5atyMiKS0rIM9zxn8Pq4vJEdw7Xlt90u+Tt7V7PFAWStKaG?=
 =?us-ascii?Q?E5Pbv1ZhyjztBCh0kPxzyeszMARgsuOMQc7uscDtlJspeCfGyd83rS9Z5al0?=
 =?us-ascii?Q?ulj3np6cr4xHP9NAg+zORcvpTWBqxm5Oh2a/qvPEtgTDO8jxxwEGsI415G3f?=
 =?us-ascii?Q?oDVOuHKrkACgzdCXniX+brgSsnTvJ0uKfq2DXBc3n5kABzgbrOs4hfyoXTDf?=
 =?us-ascii?Q?cUsSLcJJkDlcNUKIX/zR9YzrzYNCji5lfRSNDzhQpknP9OCGGn9koZ0El9lj?=
 =?us-ascii?Q?wwcYbtZZXcH6kKG4AmdO1k87Ap1n?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:05:13.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4871be-9274-48ad-2b47-08dce9348f93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

Define enable_boot_cpu_mm() for the AArch64-V8R system.

Like boot-time page table in MMU system, we need a boot-time MPU protection
region configuration in MPU system so Xen can fetch code and data from normal
memory.

To do this, Xen maps the following sections of the binary as separate regions
(with permissions) :-
1. Text (Read only at EL2, execution is permitted)
2. RO data (Read only at EL2)
3. RO after init data and RW data (Read/Write at EL2)
4. Init Text (Read only at EL2, execution is permitted)
5. Init data and BSS (Read/Write at EL2)

Before creating a region, we check if the count exceeds the number defined in
MPUIR_EL2. If so, then the boot fails.

Also we check if the region is empty or not. IOW, if the start and end address
of a section is the same, we skip mapping the region.

To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 registers.
One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
Registers", to get the definitions of these registers. Also, refer to G1.2
"Accessing MPU memory region registers", the following

```
The MPU provides two register interfaces to program the MPU regions:
- Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
PRLAR<n>_ELx.
```

We use the above mechanism for mapping sections to MPU memory regions.

MPU specific registers are defined in
xen/arch/arm/include/asm/arm64/mpu/sysregs.h.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single MPU region,
we have separate MPU regions for different parts of the Xen binary. The reason
being different regions will nned different permissions (as mentioned in the
linker script).

2. Introduced a label (__init_data_begin) to mark the beginning of the init data
section.

3. Moved MPU specific register definitions to mpu/sysregs.h.

4. Fixed coding style issues.

5. Included page.h in mpu/head.S as page.h includes sysregs.h.
I haven't seen sysregs.h included directly from head.S or mmu/head.S.
(Outstanding comment not addressed).

v2 - 1. Extracted "enable_mpu()" in a separate patch.

2. Removed alignment for limit address.

3. Merged some of the sections for preparing the early boot regions.

4. Checked for the max limit of MPU regions before creating a new region.

5. Checked for empty regions.

 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/arm64/mpu/Makefile              |   1 +
 xen/arch/arm/arm64/mpu/head.S                | 130 +++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 ++++
 xen/arch/arm/include/asm/mm.h                |   2 +
 xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 ++++
 xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
 xen/arch/arm/xen.lds.S                       |   1 +
 8 files changed, 204 insertions(+)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
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
index 0000000000..4a21bc815c
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/mm.h>
+#include <asm/arm64/mpu/sysregs.h>
+
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+
+/*
+ * Macro to prepare and set a EL2 MPU memory region.
+ * We will also create an according MPU memory region entry, which
+ * is a structure of pr_t,  in table \prmap.
+ *
+ * Inputs:
+ * sel:         region selector
+ * base:        reg storing base address (should be page-aligned)
+ * limit:       reg storing limit address
+ * prbar:       store computed PRBAR_EL2 value
+ * prlar:       store computed PRLAR_EL2 value
+ * maxcount:    maximum number of EL2 regions supported
+ * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_DATA_PRBAR
+ * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_NORMAL_PRLAR
+ */
+.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
+
+    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
+    add   \sel, \sel, #1
+    cmp   \sel, \maxcount
+    bgt   fail
+
+    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
+    and   \base, \base, #MPU_REGION_MASK
+    mov   \prbar, #\attr_prbar
+    orr   \prbar, \prbar, \base
+
+    /* Limit address should be inclusive */
+    sub   \limit, \limit, #1
+    and   \limit, \limit, #MPU_REGION_MASK
+    mov   \prlar, #\attr_prlar
+    orr   \prlar, \prlar, \limit
+
+    msr   PRSELR_EL2, \sel
+    isb
+    msr   PRBAR_EL2, \prbar
+    msr   PRLAR_EL2, \prlar
+    dsb   sy
+    isb
+.endm
+
+/* Load the physical address of a symbol into xb */
+.macro load_paddr xb, sym
+    ldr \xb, =\sym
+    add \xb, \xb, x20       /* x20 - Phys offset */
+.endm
+
+/*
+ * Maps the various sections of Xen (described in xen.lds.S) as different MPU
+ * regions.
+ *
+ * Inputs:
+ *   lr : Address to return to.
+ *
+ * Clobbers x0 - x5
+ *
+ */
+FUNC(enable_boot_cpu_mm)
+
+    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
+    mrs   x5, MPUIR_EL2
+
+    /* x0: region sel */
+    mov   x0, xzr
+    /* Xen text section. */
+    load_paddr x1, _stext
+    load_paddr x2, _etext
+    cmp x1, x2
+    beq 1f
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
+
+1:  /* Xen read-only data section. */
+    load_paddr x1, _srodata
+    load_paddr x2, _erodata
+    cmp x1, x2
+    beq 2f
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
+
+2:  /* Xen read-only after init and data section. (RW data) */
+    load_paddr x1, __ro_after_init_start
+    load_paddr x2, __init_begin
+    cmp x1, x2
+    beq 3f
+    prepare_xen_region x0, x1, x2, x3, x4, x5
+
+3:  /* Xen code section. */
+    load_paddr x1, __init_begin
+    load_paddr x2, __init_data_begin
+    cmp x1, x2
+    beq 4f
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
+
+4:  /* Xen data and BSS section. */
+    load_paddr x1, __init_data_begin
+    load_paddr x2, __bss_end
+    cmp x1, x2
+    beq 5f
+    prepare_xen_region x0, x1, x2, x3, x4, x5
+
+5:
+    ret
+
+fail:
+    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
+    wfe
+    b   1b
+END(enable_boot_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/mpu/sysregs.h b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
new file mode 100644
index 0000000000..b0c31a58ec
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm64/mpu/sysregs.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_ARM64_MPU_SYSREGS_H
+#define __ASM_ARM_ARM64_MPU_SYSREGS_H
+
+/* Number of EL2 MPU regions */
+#define MPUIR_EL2   S3_4_C0_C0_4
+
+/* EL2 MPU Protection Region Base Address Register encode */
+#define PRBAR_EL2   S3_4_C6_C8_0
+
+/* EL2 MPU Protection Region Limit Address Register encode */
+#define PRLAR_EL2   S3_4_C6_C8_1
+
+/* MPU Protection Region Selection Register encode */
+#define PRSELR_EL2  S3_4_C6_C2_1
+
+#endif /* __ASM_ARM_ARM64_MPU_SYSREGS_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 5abd4b0d1c..7e61f37612 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -16,6 +16,8 @@
 
 #if defined(CONFIG_MMU)
 # include <asm/mmu/mm.h>
+#elif defined(CONFIG_MPU)
+# include <asm/mpu/mm.h>
 #else
 # error "Unknown memory management layout"
 #endif
diff --git a/xen/arch/arm/include/asm/mpu/arm64/mm.h b/xen/arch/arm/include/asm/mpu/arm64/mm.h
new file mode 100644
index 0000000000..c2640b50df
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/arm64/mm.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mm.h: Arm Memory Protection Unit definitions.
+ */
+
+#ifndef __ARM64_MPU_MM_H__
+#define __ARM64_MPU_MM_H__
+
+#define MPU_REGION_SHIFT  6
+#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
+#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
+
+#endif /* __ARM64_MPU_MM_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
new file mode 100644
index 0000000000..92599a1d75
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_MM__
+#define __ARM_MPU_MM__
+
+#if defined(CONFIG_ARM_64)
+# include <asm/mpu/arm64/mm.h>
+#else
+# error "unknown ARM variant"
+#endif
+
+#endif /* __ARM_MPU_MM__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index fe4b468cca..2c9b5ee238 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -157,6 +157,7 @@ SECTIONS
        *(.altinstr_replacement)
   } :text
   . = ALIGN(PAGE_SIZE);
+  __init_data_begin = .;
   .init.data : {
        *(.init.rodata)
        *(.init.rodata.*)
-- 
2.25.1



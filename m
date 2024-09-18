Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934A97BFE4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 19:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800388.1210321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyrQ-00012r-IJ; Wed, 18 Sep 2024 17:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800388.1210321; Wed, 18 Sep 2024 17:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyrQ-0000zg-FN; Wed, 18 Sep 2024 17:53:04 +0000
Received: by outflank-mailman (input) for mailman id 800388;
 Wed, 18 Sep 2024 17:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3Wy=QQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqyrO-0008Ab-NJ
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 17:53:02 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d875f11a-75e6-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 19:53:01 +0200 (CEST)
Received: from BYAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:c0::16)
 by DM4PR12MB7525.namprd12.prod.outlook.com (2603:10b6:8:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 17:52:57 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::46) by BYAPR05CA0003.outlook.office365.com
 (2603:10b6:a03:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 18 Sep 2024 17:52:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 17:52:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:52:55 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 18 Sep 2024 12:52:54 -0500
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
X-Inumbo-ID: d875f11a-75e6-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgWg2K3p16pqOGrMF1bat//HoMwc+hJMZv4U/RP58l8D6CmRXWQnHwhJJqxDH1tpb6zrbRudbicIJQrMUn4dExN7A2Fq/gcEv0usGPD/JKrFjgd6Yn9dPsDUbcPPTa6g0YYjC6NgXSwToJU+GhynhQgxEAAtFfcdRUNh0YaLF6yNpJdvzaWDeE1fqBllouJH5ZAD4Yk9okQXHJoBXr2GOv2d68s5y5V1Sh1IX1etdJ+4MzPC8wLPWK/zji9cfWN68qWc3k87qAi7I3G+D1gYDsofyhJ7whb0WZ0vtOo//qJNjKTpBHvFA1/ODryma7iPhddq3Sa7Gv7EWtejLdY1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGlSUut+8b8HYfT7WSP+2zMonq+fCHlEZhyibomd6s8=;
 b=nSKa0f0L9ZF1HLdYw9v+7s0YMBdusVybt6sZ/IWOfFfrq4FxNauXynGfUdIdeo9W79B35bOZ/Dtt7GmzDaP6uzwZH34BLij4qucMzaJVVlnlPBsU4f9XufZxWnNuqGOodLrYG3fsDcftFJUT1nPQdftedNuk50PF9QvXx6UR00htBybiqIvDVNX/2Jk5vvm32Iz4E+C0QozGBjva5nOzhjRbdRa8L3rbjG4cX3Rl23l4+87p3XcilozbRzGLVWGEHH2TPVi89Vkq70onpsAe1GLhB1oONlXYGd+pbArKW+v5mNekpN22z4zvVo3QOyfyWu03eKaSf/PFP7LZr7ldkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGlSUut+8b8HYfT7WSP+2zMonq+fCHlEZhyibomd6s8=;
 b=JEQBnRYmziaxYax/poPNBuV0GZpJ7kusvA4V8TcjpotCs1Ab7SbvtZk5h4fLhTKIYhIzsfNCi5FcqyflxXTrkeeoGCUe1mAA7SWFQyVCvZ0M0SIfumCvDLs5y3GoTWXpJMFcqffmpRy1RZMBehaMfsegGoeZB/qfYuLueAR0ino=
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
Subject: [PATCH v2 3/4] xen/arm: mpu: Create boot-time MPU protection regions
Date: Wed, 18 Sep 2024 18:51:01 +0100
Message-ID: <20240918175102.223076-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|DM4PR12MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 6687e436-7708-4dc7-4175-08dcd80aba69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AE35HxI9/DgZbUmaegepvJV9tYrrQ/dZGf0hCs2PGRWsulA6T52inNpWIbMs?=
 =?us-ascii?Q?GggEmSlxI90Ca69l1zlQyJWBV5E0ohcxyzTey8Hdcdr2gwjF7Zg8HdI+k5or?=
 =?us-ascii?Q?oDEIWoq1CzVPjCmP6vV0BBxT9viwT5AhqQR3gxe9G2L1/yZR++tcBcRaTNxx?=
 =?us-ascii?Q?3YeuwdYgIImAGEVRDTDfDmvWfiuNm+Tmt4e4bEKhx5HBH1LcjxIAS6K4cQzO?=
 =?us-ascii?Q?puSuhgFJ/SXzea4/7hcb9+2FquZH3l1nn3TPb0lCW4PvEfu4UfWHVNnU8R07?=
 =?us-ascii?Q?bSbnegcKaNyYAveSeZwDo84HLRSFho7M1Fc/ngi+5erbDZrG2U4qeVhfpZIb?=
 =?us-ascii?Q?Mzj7nt06Pny3rlGwy/j6kc17F2TpjlpnX9mXtlMAmbj4Oyp0QYdph5gLOqC6?=
 =?us-ascii?Q?i2Tr541wqHMUdUB5aALix6bmnRGd+Gz1c2BRzWgIsoOieXD8V3+6BXYDQw0N?=
 =?us-ascii?Q?fYK/GELlIe4SkTlIR0munMgMFZ9Si5YZdCa6wDNl8f26s06HgjEMKo8XLF7y?=
 =?us-ascii?Q?9iilidPcYJG3izyDSzLmm+hSK3DH/Q+JQf6wEtYPbpAPv9ZcytaPJ4mOalPr?=
 =?us-ascii?Q?LXNHDipSBKQ1mrkcSIKbFV4i2iAEk4LbJbfGuqMLNEAUnK5mywmUWlxYGQ3I?=
 =?us-ascii?Q?XYOcCo/LXo60q+ZkkF5+y98DA1TDmIG2EK7d6dMJpJheB+nHn5OGIGaxBJMC?=
 =?us-ascii?Q?QBtrg9FpigcW+FOO7pB06V/7uYDQtOna4vG28cYgXWbo/jevcsz8m8VMG+3r?=
 =?us-ascii?Q?SR4gXO+UaY9avIwIFxXYFuxS7tA60Vaz8raeSZgwV/6XhrvzkGyWKxISZj/n?=
 =?us-ascii?Q?gDeiJXn/h5xJOlFeLJCjRduQGXSKAOgF5VCZukrcJoboHQs86FAbej90NIxb?=
 =?us-ascii?Q?IElbm+nUgN47Qtcu8U9XvgejpI1+P1ZSkiAnUGH/mArtXYBvNtT+cBsHkwf8?=
 =?us-ascii?Q?w6eWZA5hG4SgqSnW+YTj9Tfbg/kRJPQ4vJI0HwAV9f93/LGrGM9AsGYWKMeo?=
 =?us-ascii?Q?TOJL6Lll9wLfLd4SzbUjBMOE74Qv34xRKPw5nsg5G1iWkZzm/KWE4tJpYVuR?=
 =?us-ascii?Q?EEvuSpB/6xCzrZj5T2W8/O1kuLeelYe90mgVD75jSCCVtqlhYc6H4df9vooL?=
 =?us-ascii?Q?fFDujBcrAOj1Ag+ETu4tXJ/Ihgc9uhvqgl2Q2kbb2dIFBGr0lddQnCoLhXNo?=
 =?us-ascii?Q?eb1PFK1JkzjnelCvwPacxqdu1DTUS9MH6nmpE/Ap4jtyVHiYI9HUYK9Vr6pO?=
 =?us-ascii?Q?/NuY9qB5fxSaunoJBiTzpSUBuxZoKbjvFc6A94PkwjgaRj5Ye25a6CGoYYrP?=
 =?us-ascii?Q?MX6cOA4j3sYSL6xYAae2yrz6Kw/NiatFN0nLDa0TA4tzbGc/sHCmf/XpefiX?=
 =?us-ascii?Q?Tq1vIwaSwxPzej26T7k5x8IWEMQvs1MVdYLRx6K0BZqJOqBvhcn1JvVV4b1n?=
 =?us-ascii?Q?8p6iMLHKjG9zuqlLPKWSqn32OruC16CB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:52:56.7094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6687e436-7708-4dc7-4175-08dcd80aba69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7525

Define enable_boot_cpu_mm() for the AArch64-V8R system.

Like boot-time page table in MMU system, we need a boot-time MPU
protection region configuration in MPU system so Xen can fetch code and
data from normal memory.

To do this, Xen maps the following sections of the binary as separate
regions (with permissions) :-
1. Text (Read only at EL2, execution is permitted)
2. RO data (Read only at EL2)
3. RO after init data (Read/Write at EL2 as the data is RW during init)
4. RW data (Read/Write at EL2)
5. BSS (Read/Write at EL2)
6. Init Text (Read only at EL2, execution is permitted)
7. Init data (Read/Write at EL2)

If the number of MPU regions created is greater than the count defined
in  MPUIR_EL2, then the boot fails.

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

 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/arm64/mpu/Makefile              |   1 +
 xen/arch/arm/arm64/mpu/head.S                | 176 +++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
 xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
 xen/arch/arm/include/asm/mm.h                |   2 +
 xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
 xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
 xen/arch/arm/xen.lds.S                       |   1 +
 9 files changed, 253 insertions(+)
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
index 0000000000..ef55c8765c
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/mm.h>
+#include <asm/page.h>
+
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+
+/*
+ * Macro to round up the section address to be PAGE_SIZE aligned
+ * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
+ * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
+ * or in the end
+ */
+.macro roundup_section, xb
+        add   \xb, \xb, #(PAGE_SIZE-1)
+        and   \xb, \xb, #PAGE_MASK
+.endm
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
+ * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_DATA_PRBAR
+ * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_NORMAL_PRLAR
+ *
+ * Clobber \tmp1, \tmp2
+ *
+ */
+.macro prepare_xen_region, sel, base, limit, prbar, prlar, tmp1, tmp2, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
+    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
+    and   \base, \base, #MPU_REGION_MASK
+    mov   \prbar, #\attr_prbar
+    orr   \prbar, \prbar, \base
+
+    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
+    /* Round up limit address to be PAGE_SIZE aligned */
+    roundup_section \limit
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
+    dsb
+    isb
+.endm
+
+/* Load the physical address of a symbol into xb */
+.macro load_paddr xb, sym
+    ldr \xb, =\sym
+    add \xb, \xb, x20       /* x20 - Phys offset */
+.endm
+
+.section .text.header, "ax", %progbits
+
+/*
+ * Enable EL2 MPU and data cache
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch64 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers x0
+ *
+ */
+FUNC_LOCAL(enable_mpu)
+    mrs   x0, SCTLR_EL2
+    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
+    dsb   sy
+    msr   SCTLR_EL2, x0
+    isb
+
+    ret
+END(enable_mpu)
+
+/*
+ * Maps the various sections of Xen (described in xen.lds.S) as different MPU
+ * regions. Some of these regions will be marked read only while the others will
+ * be read write or execute.
+ *
+ * Inputs:
+ *   lr : Address to return to.
+ *
+ * Clobbers x0 - x7
+ *
+ */
+FUNC(enable_boot_cpu_mm)
+    mov   x7, lr
+
+    /* x0: region sel */
+    mov   x0, xzr
+    /* Xen text section. */
+    load_paddr x1, _stext
+    load_paddr x2, _etext
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
+
+    add   x0, x0, #1
+    /* Xen read-only data section. */
+    load_paddr x1, _srodata
+    load_paddr x2, _erodata
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_RO_PRBAR
+
+    add   x0, x0, #1
+    /* Xen read-only after init data section. */
+    load_paddr x1, __ro_after_init_start
+    load_paddr x2, __ro_after_init_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    add   x0, x0, #1
+    /* Xen read-write data section. */
+    load_paddr x1, __ro_after_init_end
+    load_paddr x2, __init_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    add   x0, x0, #1
+    /* Xen BSS section. */
+    load_paddr x1, __bss_start
+    load_paddr x2, __bss_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    add   x0, x0, #1
+    /* Xen init text section. */
+    load_paddr x1, __init_begin
+    load_paddr x2, __init_data_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
+
+    add   x0, x0, #1
+    /* Xen init data section. */
+    load_paddr x1, __init_data_begin
+    load_paddr x2, __init_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
+
+    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
+    mrs   x1, MPUIR_EL2
+    cmp   x0, x1
+    bgt   1f
+    bl    enable_mpu
+
+    mov   lr, x7
+    ret
+
+1:
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
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index b593e4028b..8b6b373ce9 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -2,6 +2,9 @@
 #define __ASM_ARM_ARM64_SYSREGS_H
 
 #include <xen/stringify.h>
+#if defined(CONFIG_MPU)
+#include <asm/arm64/mpu/sysregs.h>
+#endif
 
 /*
  * GIC System register assembly aliases picked from kernel
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
index bd884664ad..0b8956ac3c 100644
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



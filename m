Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A2A5FF3B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913316.1319405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnJA-0001Fq-6O; Thu, 13 Mar 2025 18:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913316.1319405; Thu, 13 Mar 2025 18:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnJA-0001DU-3D; Thu, 13 Mar 2025 18:29:28 +0000
Received: by outflank-mailman (input) for mailman id 913316;
 Thu, 13 Mar 2025 18:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDg6=WA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tsnJ8-0000C7-JN
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:29:26 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2413::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16859ee6-0039-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 19:29:25 +0100 (CET)
Received: from SJ0PR03CA0371.namprd03.prod.outlook.com (2603:10b6:a03:3a1::16)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 18:29:19 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::29) by SJ0PR03CA0371.outlook.office365.com
 (2603:10b6:a03:3a1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 18:29:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:29:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:17 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 13 Mar 2025 13:29:16 -0500
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
X-Inumbo-ID: 16859ee6-0039-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhPoZ1LfXgaPFWQ1YHi8w7EwonEsfufueRgBDw8SlAdUPQpK6wXc8dSTOE4wt+vk0PKABQ2M8iGJ4PPHvr7/GEOAhkMVC7gzPJi12zyG7TjlbCIr+iqcJh0K8W6gQEMNhgPHJ/nQFFxx+j0XGBqgBAJx1N13vgaYxsQKlIAXvQ2zk1Y1z/L2jI1aXPgMObNuokagRGL2BWAM+spEX1XEuYH8fZ+gfpgT7rPmJQ/s48xlYIyAlnouwOUOv3duewYK2hSnuvm75dn9eypd4U8TEVtjLQOCSgiflm4hejyA6MZ75LpDz9hHoGWF1mkUuC5ZVltgp7nMO8943YXyhvRlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT0zQIQfczAnNHAJQjNV4E1F5eVICWQuwL4lXJiKe2I=;
 b=ZMseXnKS67Bn+kw00GBp1Mmv3y1RXkbun7j5vs8eyP646z3ycMLE+cLzoG7tmkBS2Xwz7dzSpcfOmZAn+G+q4rPrMr6+xIjLca3wr4lCVmQ+IxRf/Nqityrex7qeVQzp5kbgo9jrxp4hFhPqW40dt1Oacya3K9CALXm3io8cpnHo9tP3HeJWReU9cwInPEHHPX2fncwe/deG5xtR19JOiAFHRoj+u/gMlOD2V37FfHlawGQ8m8cHnOOf4/FT7px52RGW+pU9Yq4truQVErgrbc8z8iVfhQ4DHCePsZ9ipCy6hYoD6p2RH5XJhewaHGDPhxTpvvYnZO92lmJjzUP90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lT0zQIQfczAnNHAJQjNV4E1F5eVICWQuwL4lXJiKe2I=;
 b=EMmXPsRNIiEAh9e21kJ76y3SvtPtD81zrGM2zBp9cqWLQuWdzk6vHLesf8+TYyDaWr10Jqzy8FZwLRs2omhB3xXz+MPTiyF0l6TLmOlYVxf4I3aVAsJxk/sVop9az0kGJphalCbrAYdT6O/NPZ0OldR0min5xYGe6f/dGt57pEY=
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
Subject: [PATCH v2 2/4] xen/arm32: mpu: Create boot-time MPU protection regions
Date: Thu, 13 Mar 2025 18:28:48 +0000
Message-ID: <20250313182850.1527052-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c82c922-23ca-4a85-c943-08dd625cf7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9OzXtZ8yXP8uabH/weyYxeeRRy00s1l4u6pfj38FapK+QhVsO88DPwEAtLE8?=
 =?us-ascii?Q?6t73iA2TcA4jX31HB5HZJacimYGDTGi2mkj0/vuh9QbBWos4JjasR02CxLw9?=
 =?us-ascii?Q?suj6/ViYeHPogVb0okc/vyKEXl6dtA/WEfwI/drSnF08Ai0BevhVTEykY0SD?=
 =?us-ascii?Q?sxve80zUF2r6q9rEhN3+OdZWVcSOB5sYDg7e1F2dv+yz3YTEibzW1He6J7x9?=
 =?us-ascii?Q?Qf4UpEvODKfZY52+w9JnOhK6LSb9wtos/2CF2jVO1h6W9QTiaP5rJuHz/6XM?=
 =?us-ascii?Q?Hd8W2S2AGywvjPvYOQyNF8IrYEnNkOwhU4I2bfrhR6H+1zN+JllnoE+SxWd1?=
 =?us-ascii?Q?RWOsfU6hdvhXojo7khiCj434+PoeXjeAGfTITvdFFeZozk1fhDRl9E/gps8r?=
 =?us-ascii?Q?qAtoUtoSdWeFlWWhXZV/VRr4aTro2m62jRSUO/Ll8UJgPGVaMIy5G1en7xtb?=
 =?us-ascii?Q?sklLfW/cBFN5y2t6Ta9txPZ5cozGwRn7RUEDJTXUVgiKCBYW/mypNVIuSgdT?=
 =?us-ascii?Q?f1YvgbCFsN0wyi37xkV4fmoWSDNji56skhEojlArUO0qjc+fa6sEpoa5G+34?=
 =?us-ascii?Q?YojAnp0GFqX3IkeJBiq+974vRh2p2MsVPiLBDDpKc6cXmrGovDWKUEgdB0TT?=
 =?us-ascii?Q?qhinqNNC18pG+EbNVo7eWi3JEI+3HJUTuEXCYlziO/A2/NY1iTAAmkZs/wou?=
 =?us-ascii?Q?QVk43E2QpB8nM49Xu412dXHLNtockh4YfOOhrR7FKopVbHSp/W6moiMnW/di?=
 =?us-ascii?Q?j4HLRVQoH2XqIxS0mq4G9u5mNx//opYfbQ1S5VYnRIaS1GygnztN6I4iELiK?=
 =?us-ascii?Q?bkWgAtEZmsooAR0ba2+yAmOI1XLWzdjJLHvd6z+KjnwUNOV/hk91NZtnGjqZ?=
 =?us-ascii?Q?eHEuUSCUrsMchX3BGQbYj3QM63ycQt8/S4edFZukuVQH5v4xn3rd4lFFf/fK?=
 =?us-ascii?Q?hr05RVtKZxtbliGg7yiFRO3rd2ATjGVKs+7iTic4TS1lYlrcXSuXSG/UF4c0?=
 =?us-ascii?Q?cSumbdVPb/PCiMNKICr9P4XswE1hfV8qa0oSxYQdCExsUyhDVgVQY8J9BJDv?=
 =?us-ascii?Q?QqTDoG4e3Tee1ugp+d/IW5sxmQBNcdRgznQTBIELun6fb8TLpktrHFfub1Ng?=
 =?us-ascii?Q?A4jnymXPE+oA3YmoXujDvyg0annIswR0/zAWNYbWxoK5Zs2IuzLeYlYQBw5h?=
 =?us-ascii?Q?5x/m3RquSvfMTP93u2K/sjrQMc3dYusovFivXqyU0F1UX5nAQPs2IHEXKJke?=
 =?us-ascii?Q?t04LxVCt617eZCoAE/ONVBs11jD2Jkk32z0vXb6RXwV0fXKJYWdYkpeUGF6U?=
 =?us-ascii?Q?zFShFmpi6BlyRiF0TbY6AxBhHV+sUepV+k51OpWXTuZ1+kB+SJj+IA8kqNJs?=
 =?us-ascii?Q?CqlP51fDMkB2/rW4EstEAl5nGzBdqmVKDoM3ItPheyaCVa4QcfGFSGNf4WF4?=
 =?us-ascii?Q?TQXDfRSP3i8y8QCKCSowNdAc24BXno2rUGbTWo5EPsJzn++GbxES0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:29:18.8429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c82c922-23ca-4a85-c943-08dd625cf7c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567

Define enable_boot_cpu_mm() for the Armv8-R AArch32.

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
are same, we skip mapping the region.

One needs to set up HMAIR0 and HMAIR1 registers in enable_mpu(). The register
configurations are the same as in enable_mmu().

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from

v1 -

1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
being done in enable_mmu(). All the mm related configurations happen in this
function.

2. Fixed some typos.

 xen/arch/arm/arm32/Makefile           |   1 +
 xen/arch/arm/arm32/mpu/Makefile       |   1 +
 xen/arch/arm/arm32/mpu/head.S         | 170 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h     |   4 +
 xen/arch/arm/include/asm/mpu/cpregs.h |  21 ++++
 5 files changed, 197 insertions(+)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 40a2b4803f..537969d753 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,5 +1,6 @@
 obj-y += lib/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
new file mode 100644
index 0000000000..3340058c08
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
new file mode 100644
index 0000000000..40648ce1a8
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/arm32/sysregs.h>
+#include <asm/early_printk.h>
+#include <asm/page.h>
+
+/* Backgroud region enable/disable */
+#define SCTLR_ELx_BR    BIT(17, UL)
+
+#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
+#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
+#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
+#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
+
+/*
+ * Macro to prepare and set a EL2 MPU memory region.
+ * We will also create an according MPU memory region entry, which
+ * is a structure of pr_t,  in table \prmap.
+ *
+ * sel:         region selector
+ * base:        reg storing base address
+ * limit:       reg storing limit address
+ * prbar:       store computed PRBAR_EL2 value
+ * prlar:       store computed PRLAR_EL2 value
+ * maxcount:    maximum number of EL2 regions supported
+ * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_DATA_PRBAR
+ * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
+ *              REGION_NORMAL_PRLAR
+ *
+ * Preserves \maxcount
+ * Output:
+ *  \sel: Next available region selector index.
+ * Clobbers \base, \limit, \prbar, \prlar
+ *
+ * Note that all parameters using registers should be distinct.
+ */
+.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
+    /* Check if the region is empty */
+    cmp   \base, \limit
+    beq   1f
+
+    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
+    cmp   \sel, \maxcount
+    bge   fail_insufficient_regions
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
+    mcr   CP32(\sel, PRSELR_EL2)
+    isb
+    mcr   CP32(\prbar, PRBAR_EL2)
+    mcr   CP32(\prlar,  PRLAR_EL2)
+    dsb   sy
+    isb
+
+    add   \sel, \sel, #1
+
+1:
+.endm
+
+/*
+ * Failure caused due to insufficient MPU regions.
+ */
+FUNC_LOCAL(fail_insufficient_regions)
+    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
+1:  wfe
+    b   1b
+END(fail_insufficient_regions)
+
+/*
+ * Enable EL2 MPU and data cache
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch32 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers x0
+ *
+ */
+FUNC_LOCAL(enable_mpu)
+    /* Set up memory attribute type tables */
+    mov_w r0, MAIR0VAL
+    mov_w r1, MAIR1VAL
+    mcr   CP32(r0, HMAIR0)
+    mcr   CP32(r1, HMAIR1)
+
+    mrc   CP32(r0, HSCTLR)
+    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
+    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    mcr   CP32(r0, HSCTLR)
+    isb
+
+    ret
+END(enable_mpu)
+
+/*
+ * Maps the various sections of Xen (decsribed in xen.lds.S) as different MPU
+ * regions.
+ *
+ * Clobbers r0
+ *
+ */
+
+FUNC(enable_boot_cpu_mm)
+    /* Get the number of regions specified in MPUIR_EL2 */
+    mrc   CP32(r5, MPUIR_EL2)
+    and   r5, r5, #NUM_MPU_REGIONS_MASK
+
+    /* x0: region sel */
+    mov   r0, #0
+
+    /* Xen text section. */
+    ldr   r1, =_stext
+    ldr   r2, =_etext
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen read-only data section. */
+    ldr   r1, =_srodata
+    ldr   r2, =_erodata
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
+
+    /* Xen read-only after init and data section. (RW data) */
+    ldr   r1, =__ro_after_init_start
+    ldr   r2, =__init_begin
+    prepare_xen_region r0, r1, r2, r3, r4, r5
+
+    /* Xen code section. */
+    ldr   r1, =__init_begin
+    ldr   r2, =__init_data_begin
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen data and BSS section. */
+    ldr   r1, =__init_data_begin
+    ldr   r2, =__bss_end
+    prepare_xen_region r0, r1, r2, r3, r4, r5
+
+#ifdef CONFIG_EARLY_PRINTK
+    /* Xen early UART section. */
+    ldr   r1, =CONFIG_EARLY_UART_BASE_ADDRESS
+    ldr   r2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+#endif
+
+    b    enable_mpu
+    ret
+END(enable_boot_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index aec9e8f329..6019a2cbdd 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -1,6 +1,10 @@
 #ifndef __ASM_ARM_CPREGS_H
 #define __ASM_ARM_CPREGS_H
 
+#ifdef CONFIG_MPU
+#include <asm/mpu/cpregs.h>
+#endif
+
 /*
  * AArch32 Co-processor registers.
  *
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
new file mode 100644
index 0000000000..bd17a8c75a
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -0,0 +1,21 @@
+#ifndef __ASM_ARM_MPU_CPREGS_H
+#define __ASM_ARM_MPU_CPREGS_H
+
+#define HMPUIR          p15,4,c0,c0,4
+
+/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
+#define HPRSELR         p15,4,c6,c2,1
+#define PRBAR_EL2       p15,4,c6,c3,0
+#define PRLAR_EL2       p15,4,c6,c8,1
+
+#define MPUIR_EL2               HMPUIR
+#define PRSELR_EL2              HPRSELR
+
+#endif
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



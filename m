Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF0A27B1D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881800.1292002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOX9-00060K-6z; Tue, 04 Feb 2025 19:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881800.1292002; Tue, 04 Feb 2025 19:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOX9-0005x0-2s; Tue, 04 Feb 2025 19:24:31 +0000
Received: by outflank-mailman (input) for mailman id 881800;
 Tue, 04 Feb 2025 19:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZU+7=U3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tfOX6-00051v-Ne
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:24:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2415::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5dfc168-e32d-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 20:24:28 +0100 (CET)
Received: from MN0P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::19)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 19:24:23 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::48) by MN0P222CA0018.outlook.office365.com
 (2603:10b6:208:531::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Tue,
 4 Feb 2025 19:24:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 19:24:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:20 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:19 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Feb 2025 13:24:18 -0600
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
X-Inumbo-ID: a5dfc168-e32d-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1dWQ55yGyhX2IPksxhxz0rmE1dd55gBmAigL1wrDuBpOtqkxAHSbe9llkqiQOIFgmGASV+WTYjQKZWR6O0Yfaswo3JOeMr8KmgjfljakNh2nIzfzDJPaklVUd7ZZxhNSQbIMyQ3ZRfSRExCGDREKqgv+13ZV97G99xj0Gj3wc8wceK3JIgitHIkxV809ggfRoipxGvwDobZzLUDPEPZBPB5klb0smNEewbkMvM9LYgnK/bLys2zA2OanEkMyITywFv7oNwW0ZTRZE38XOG+T9nod+44kb4+86sgtZev4NQk+jtli+OnvIuXq4A2fA1EEU0t/6+MNLnZkCAcUYn8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Oxhmweg7AP+SCtQxJNnmxEnRyK7YMVCMD8+Qy0wThY=;
 b=yKAleUFjl09MFnzIsTYJxw4u0q78xlnE5shubhBuV4QwUhEeexPr75evH6Cy1OTZlGh8G0rCbGLt5iqBHxHeVqIFxZtsaRiSgU8IcUWptHFb5vD316NHGHeK4Oan0PVbSOjpOGZ04myyQfxGq2SYwXG6sRqFbl6WHldNumVRcnlAkh6O2IeXWgzLMrpMpI5BVbxFURMVOphJdfoh+WE70c2elBThh/ZT5BYIcgz+U7j275zFvVVySkTlC0WqYkNtkbjwhCIhWyvx4nVU8CWiaN4a5vstxSPwopEFMBYyzijzPTUbO1dlAlo5NuhdhVtLa78xoRceAC+zDYxRuP7uWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oxhmweg7AP+SCtQxJNnmxEnRyK7YMVCMD8+Qy0wThY=;
 b=cN7/TmNzA2lX2zsaFYFeiVJ8gH/hX7HgSfV8K90BgO870WlkVwcVWLxDZdviAz/Sj+FmyISobELxRd3trStaUPis3kmxQLBMLl6UuZ+XHD7b7hReCn+SbpdjqgQzEmgmzi2YVanHwut472CeGC3RtK/1o9Tneu2i53ca9+rcbAU=
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
Subject: [PATCH 4/5] xen/arm: mpu: Create boot-time MPU protection regions (arm32)
Date: Tue, 4 Feb 2025 19:23:56 +0000
Message-ID: <20250204192357.1862264-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3b26c7-7231-433b-5bba-08dd45518660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5yTtmbCTl7KsuaC5DDZdL877eIR238W3TEgeNZpWo2lscfZkZlxbIo54KH3L?=
 =?us-ascii?Q?aIaYPydC3M9oG3oAEj7Iyx0JJpyhDwBeoT2LNLpsBcT77xl7S+lfFkyqkHs5?=
 =?us-ascii?Q?E2MeawkPrdE/HzEB6EhFr5DgUD5hGmElCgaDw5PZP8x3F+QEVdn9MKxrFlRF?=
 =?us-ascii?Q?LSfgSDlcOF29FskwWfWc7dNn/SxQbXacxIUTeHBoHLp0cjqx8TrtQsRf2rkv?=
 =?us-ascii?Q?vVCGxoSIM/Y30PaOugqEjEzOdELIeAa9uF1Wx+2bwMkRCifD20iZgSvN9E3q?=
 =?us-ascii?Q?OBpIH3MoOH/X6Ex05Sx3r6+6ugXpToulM1+SNjk566oU+zo6pT7hghEq600j?=
 =?us-ascii?Q?PhTXbCoPQp4V7iKEMH3hjoeysEPubqMTyqvHzd+XWk8f5rFVjDckx3iSBfAK?=
 =?us-ascii?Q?IHC1dXO+aonY7R+WVPSH0w4+aGETv/XbKaEGv11yBVMgJpVdLlOch/aWZpT3?=
 =?us-ascii?Q?Fh76S5/4ROvp/XuQzAjBolbDu+RLkOEmLkMp4Xk6BnaTGwLuagqNc8LwfNLI?=
 =?us-ascii?Q?0u39pFJN4ObivSM2YwFkFr/d7S5pCRLNTXFXKGwuO1YqreqXr0yHDFbJednK?=
 =?us-ascii?Q?uq+lmDSXBjtyAWfJxQnNjgfEndxXnoJAe6v3QiOpB7NMf76gaj87WDHEuYd0?=
 =?us-ascii?Q?teeVWhFz9+QAmWH992WHaopCSh1zCMwqasiPSeshISwTK0olWHwEv28dYSr9?=
 =?us-ascii?Q?ePe6xJmFm/uh3TWDZ7EvZh1QiAUvqD4G8Ck5buopbH0WSvIEE0JQWU2J2Inq?=
 =?us-ascii?Q?L13s593GzkIRXEqw4HlYDwfxNA+MqmE3MajZ77EJXsX1cbrxOm8HItupeugS?=
 =?us-ascii?Q?rxNYDsnL7aujadW0idpTLU4m0frDYZhX5+/Hv7ozgprynjE5TdgdmXsb2BHE?=
 =?us-ascii?Q?wwt8fZWNNdpan+lhnJfAfqov7ZnL/XxX2XPuqoOPRI/YPyAOVYit+9CheCEk?=
 =?us-ascii?Q?lJV0XkfiW2MnVn5Cdglv4CYisiC7j5t2zbWw1fZeT7E5UrBe8c/po0Ocd9rz?=
 =?us-ascii?Q?YKkKl/JeUOchrZom0QV3DXyPZOieqJFS6kMjAHuLPWmQSBfFij1EbJ6e7+Xy?=
 =?us-ascii?Q?6YfgfY41ca4MkHqAMVstlq95J1vXUoKhqTvoYTI6hZINwLlm7/91fr3bifm0?=
 =?us-ascii?Q?fBtuwAxPYQEWzzynXrkI0X0Q4CN741Mh+TMMc45QvWlFqyl4Q0PGnrMa/fnl?=
 =?us-ascii?Q?EIt0ihYDRUJICqRL4/EGoJTF1PMi+Pdk12XWV6WZmY8jPxQUV+nCrULmlgtc?=
 =?us-ascii?Q?sEzWIVjbkjap6nWP3ulmwHiKvu/+EywotmwnG4q48j2QgBirmsOx/STAZblr?=
 =?us-ascii?Q?hphTZA7W7pHNGTLjYq5jINp/aedWgc50DH5C7B+26H2Hs6Gk5ucfqM3KoQZz?=
 =?us-ascii?Q?BCeoam36VmZXGievuxWCUowEqWvyJ+YuRmdr/IdzNiv2Mcb4RqG2YJGxqiGM?=
 =?us-ascii?Q?U5a/IS8zqSVL/dkW/+sJtqT+/f3luzD/G8498UhhwljVMUywSztYltAwA8wh?=
 =?us-ascii?Q?jMm3JKA+E/cIGig=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:24:20.4982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3b26c7-7231-433b-5bba-08dd45518660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

Define enable_boot_cpu_mm() for the Armv8-R AArch64.

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

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm32/mpu/head.S         | 164 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h     |   4 +
 xen/arch/arm/include/asm/mpu/cpregs.h |  21 ++++
 3 files changed, 189 insertions(+)
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h

diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
new file mode 100644
index 0000000000..4aad3c6b5d
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/early_printk.h>
+#include <asm/arm32/sysregs.h>
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
+ * Since the default memory map of the Armv8-R AArch64 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers x0
+ *
+ */
+FUNC_LOCAL(enable_mpu)
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
+#define NORMAL_MEM_SIZE         0x001fffff    /* 2MB - 1 */
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



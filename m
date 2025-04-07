Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62309A7EB08
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940881.1340506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSw-00029D-GX; Mon, 07 Apr 2025 18:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940881.1340506; Mon, 07 Apr 2025 18:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSw-00027C-DY; Mon, 07 Apr 2025 18:45:02 +0000
Received: by outflank-mailman (input) for mailman id 940881;
 Mon, 07 Apr 2025 18:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1rSv-00026s-HX
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:45:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:200a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67accbaa-13e0-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 20:45:00 +0200 (CEST)
Received: from MN2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:208:23c::6)
 by CY8PR12MB7315.namprd12.prod.outlook.com (2603:10b6:930:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 18:44:53 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::46) by MN2PR18CA0001.outlook.office365.com
 (2603:10b6:208:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 18:44:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 18:44:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:44:51 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 7 Apr 2025 13:44:51 -0500
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
X-Inumbo-ID: 67accbaa-13e0-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxiZWvyc/+mbKSjL2NkA8tfFNRVe2gNwvgeyCFIfxHX58kIQtGi96C/BZ3l88isvUPbVqVF7fwhXnOtbnw4S3XDT5mZCQkevNB1vhDExbjha/Z+0QYgL4oC3+AG2jjU5BFqbE0wl+xBP1kON2aDqJL1r+VBqkl1j9vZ+7FaY56Ch3HdX25ovTKxQcnn2BZLtarRHoQB+TPKuN3i7XA+xWs65Y9rXesS5sPvazgZ7b4zCna7CYQlRJ3OCw1Vs/Cq7mx2rHAEM/IHKUw5ASKPjWA9k43Sz2iR/830GeZdWTrmLkTW2bkMuZ3wDrdqTzNDTpdbfu5Hs+KG+B1nbTMIE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIKmsZbFhOImZaTMUt4D4KmTXjxM7kmTBV9rxoW2Dnk=;
 b=ngCgqafZ68vzw5QUiHCYCi+QLAOqz+p0r4T09gMxRokL7Kiaxv4cSuiY67GeAtjL4jB/hA1npxDyFPv2mJjp54OmbkEqdUl54X2Rsd5ix8QwFZlhJQSLc/3PorLeK/3izgm4lOP2i+25g7jXObUEBv7c7buXFLGWS9CFL23LH+jSpkOyy7zpiOJ2R6LOWJLTGbw2YqUtLI8aH+CREykYoQLEaPftz8ap1Uq20CxUblm2AjadQ/189llc9g5HRrDwOnMsxfm6Am4lgCReAgaUnx3YGNPxGlqYCWOg8ZXbZWQfKpFk1F0uoXAIIuEcczWhS6BvcnFhB5FZgjB5NlEH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIKmsZbFhOImZaTMUt4D4KmTXjxM7kmTBV9rxoW2Dnk=;
 b=TI14bYVVDKhaUGOzUA4USjlBdVqQb+VehopcN4/Kcpmt1aKQ5sSIFjCrKEDCHeGo5XuGZhAWYtlhMwWd5/8o3pJEZcxl6EgzWO50ULXoOnek6WZfmMucO+VoQfE0Ea3jxVOnJdbpiAhXLcA9d2nnnE5eS0Lb8qy+2zFYilStHnw=
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
Subject: [PATCH v5 2/3] xen/arm32: Create the same boot-time MPU regions as arm64
Date: Mon, 7 Apr 2025 19:44:42 +0100
Message-ID: <20250407184443.1790995-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY8PR12MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: ce74ec89-9b62-48eb-658d-08dd76044868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wr64JjUUN4jmxqpVvLq6G8R0p+cFgyVn9ppz7HyR/lZcGv6lmG7CUQaZ3Eyt?=
 =?us-ascii?Q?ESnvhq9FlnBVaxQgMvaEFe/iN3N0AO68juJuAGB5O2So6b/7b0Vt4oJrsO22?=
 =?us-ascii?Q?z6IopH879MwxmMvBs0h5h+KNC42hPaG9E15opPaS6S5o359CNkkPY/5YHBpj?=
 =?us-ascii?Q?GS2oR3X8/fhGd441NSECU7LbOTeu+H0cfsdIpbwuhmoPvg2rcsHmXrfX5ZaJ?=
 =?us-ascii?Q?005/ZTyjFII9YJPCSCAOOnRUw7FBVphAhBLdd5A6D0STbscmtg/1jBsfTSEI?=
 =?us-ascii?Q?J9/GnX3RKWM0jAf19OLDkqpguwzLtujH3J1a+dVAiDnH0ZUAD9FHTJSzXQ56?=
 =?us-ascii?Q?CKiF2a3sIaof1Fg3S/o1OYvMVHQjgtPBVu+YGEADNX3oROjW+/F0MTMfzTXe?=
 =?us-ascii?Q?gep3JBJyxsm6zXGpLet2gG4ELb+YTCDr+YThBZHBF2H00yyVLKNXRR3/ecfU?=
 =?us-ascii?Q?KIsB51yxbnJuF4/lMA+Q+UTi3baC0swTh/2o8DWpfAh4LsbMB6KPdmhq+0W/?=
 =?us-ascii?Q?A1Y0ntjm4AWDb+alv0WcCuGLr/bPGVg8jEiemu2g3aMCrI3bAMU/V4sE898s?=
 =?us-ascii?Q?pi+Xoe32rbXWc3o6XPO+BT+1ThI2jeW+i2N3or0JtgEHoL64gNjY3NtDP2pn?=
 =?us-ascii?Q?C869C4GUOo2F159NNfeO5By0uRQ9axe6Et9U/ejBHbZL0z3T8T4Q73mYiPZt?=
 =?us-ascii?Q?RtreAN4nMkCjTOKE/K5l9vLabzBIZ0QGRxpsjAyAT5xl5A3EQGozPHBXgDBG?=
 =?us-ascii?Q?VRzJ7X/j8sagf3dTGe7p2ScQlp8ngq5bShKf4gQxlUk6z403jhaUgKeiijCv?=
 =?us-ascii?Q?DlMMlhlLMnh9rfwfn5DHx/fReLJtqJfY1VIarxqoTRfBaRTJzHjyRtA9LO4w?=
 =?us-ascii?Q?zcaDcAIrg5mrbll15BRxuxrjCoIoHqgszOvMug3Gr6nvC2QTQO2VkhZ78KTg?=
 =?us-ascii?Q?VrdvyyTCzbAUtwNEjWPJoq6c5PCTcrvJff3gF4om0hAbyFQAEdL3P1Hkep3e?=
 =?us-ascii?Q?r8hTmV6S+oFchNm7VS1iACjKetHLHhteq6WLDv71YRuFs79FmmQd/Rbc0q8K?=
 =?us-ascii?Q?1r33bPXpvUDqvmrrumU/TGsQaK3vsYoB+hQoqaOiFpnMWShh5BMOHA/dbvD7?=
 =?us-ascii?Q?oxxDPToz4sBjPTybRuUx5MOtVhcnvSUIr0Ppp1WnwBZUquwHD1blCicsupSH?=
 =?us-ascii?Q?6MOa/zr0AWrSbN7it5LO+5YMBI6gjpE7AKWM931VjK/bcYEo511zs0SiJtyA?=
 =?us-ascii?Q?pX1YSFZqvfVR9OmDeRFYmyrercUO0wFw+1lQTtj5ZBHjqYZvzuNdSWxCIW5l?=
 =?us-ascii?Q?HJIz/HVTB9qg7z/GiAlaJVTo9/tg6rDFKUC4vnUCVZ0L7eXOfmLX0oNQajJB?=
 =?us-ascii?Q?1Xc0sBCnPLbTr5xWegoFK2nvzyoElSK/XnVXq9xtIVtF+wUwJ5CQgpDOamcC?=
 =?us-ascii?Q?ri80KniA4dwPTbh+DMoHz3xK31ozXALLqUP9fsRJWTjpIjLcC8zuqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:44:52.2757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce74ec89-9b62-48eb-658d-08dd76044868
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7315

We have created the same boot-time MPU protection regions as Armv8-R AArch64.
Also, we have defined *_PRBAR macros for arm32. The only difference from
arm64 is that XN is 1-bit for arm32.
The macros have been defined in mpu/cpregs.h.

Also defined WRITE_SYSREG_ASM() to write to system registers in assembly.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from

v1 -

1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
being done in enable_mmu(). All the mm related configurations happen in this
function.

2. Fixed some typos. 

v2 -
1. Include the common prepare_xen_region.inc in head.S.

2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.

v3 -
1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()

2. enable_boot_cpu_mm() is defined in head.S

v4 -
1. *_PRBAR is moved to arm32/sysregs.h.

2. MPU specific CP15 system registers are defined in mpu/cpregs.h. 

 xen/arch/arm/arm32/Makefile              |   1 +
 xen/arch/arm/arm32/mpu/Makefile          |   1 +
 xen/arch/arm/arm32/mpu/head.S            | 101 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/sysregs.h |   7 ++
 xen/arch/arm/include/asm/cpregs.h        |   4 +
 xen/arch/arm/include/asm/mpu/cpregs.h    |  24 ++++++
 6 files changed, 138 insertions(+)
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
index 0000000000..84e9f1f8ec
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/arm32/macros.h>
+#include <asm/mpu/common.inc>
+#include <asm/page.h>
+
+/*
+ * Set up the memory attribute type tables and enable EL2 MPU and data cache.
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch32 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers r0 - r1
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
+ * Maps the various sections of Xen (described in xen.lds.S) as different MPU
+ * regions.
+ *
+ * Clobbers r0 - r5
+ *
+ */
+FUNC(enable_boot_cpu_mm)
+    /* Get the number of regions specified in MPUIR_EL2 */
+    mrc   CP32(r5, MPUIR_EL2)
+    and   r5, r5, #NUM_MPU_REGIONS_MASK
+
+    /* x0: region sel */
+    mov   r0, #0
+    /* Xen text section. */
+    mov_w   r1, _stext
+    mov_w   r2, _etext
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen read-only data section. */
+    mov_w   r1, _srodata
+    mov_w   r2, _erodata
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
+
+    /* Xen read-only after init and data section. (RW data) */
+    mov_w   r1, __ro_after_init_start
+    mov_w   r2, __init_begin
+    prepare_xen_region r0, r1, r2, r3, r4, r5
+
+    /* Xen code section. */
+    mov_w   r1, __init_begin
+    mov_w   r2, __init_data_begin
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen data and BSS section. */
+    mov_w   r1, __init_data_begin
+    mov_w   r2, __bss_end
+    prepare_xen_region r0, r1, r2, r3, r4, r5
+
+#ifdef CONFIG_EARLY_PRINTK
+    /* Xen early UART section. */
+    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
+    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+#endif
+
+    b    enable_mpu
+END(enable_boot_cpu_mm)
+
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+FUNC(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+END(enable_secondary_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 22871999af..a90d1610a1 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -20,6 +20,13 @@
  * uses r0 as a placeholder register. */
 #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
 
+#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
+#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
+#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
+#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
+
+#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
+
 #ifndef __ASSEMBLY__
 
 /* C wrappers */
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
index 0000000000..6b20c7ceae
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_MPU_CPREGS_H
+#define __ASM_ARM_MPU_CPREGS_H
+
+/* CP15 CR0: MPU Type Register */
+#define HMPUIR          p15,4,c0,c0,4
+
+/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
+#define HPRSELR         p15,4,c6,c2,1
+#define PRBAR_EL2       p15,4,c6,c3,0
+#define PRLAR_EL2       p15,4,c6,c8,1
+
+#define MPUIR_EL2       HMPUIR
+#define PRSELR_EL2      HPRSELR
+
+#endif /* __ASM_ARM_MPU_CPREGS_H */
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C82AD0700
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 18:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008673.1387915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFx-0005av-W4; Fri, 06 Jun 2025 16:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008673.1387915; Fri, 06 Jun 2025 16:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFx-0005YH-S3; Fri, 06 Jun 2025 16:49:25 +0000
Received: by outflank-mailman (input) for mailman id 1008673;
 Fri, 06 Jun 2025 16:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNaFw-00050H-3A
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 16:49:24 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2407::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3274324c-42f6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 18:49:23 +0200 (CEST)
Received: from CH2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:610:4f::40)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 6 Jun
 2025 16:49:18 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::c9) by CH2PR18CA0030.outlook.office365.com
 (2603:10b6:610:4f::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Fri,
 6 Jun 2025 16:49:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 16:49:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 11:49:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 11:49:15 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 6 Jun 2025 11:49:14 -0500
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
X-Inumbo-ID: 3274324c-42f6-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+CcROi8Wd/y7RvPAvwS127I/MWFJli9hlWeLUWJPfksc3EtvZqDGe/cOESGdY0wTMFbaQ1cPpyNhHUsQC0GbDouv4CyOLS12MGPRm4Qmod/gc+jcZ/7gWUm5cH16l2gt7sKvh8zexR2NxwZs1cH30M4M4KO3x18VSLppVm1sWxIx2NOyHzWEG75n8zF6RqSlYKLlpGRszuEgj3nTySdeR2NkTkDYiAE7LHIfJdWG+X9XDNFnHCbpBnnANdNrlTiJKyukG6Y6sJux0p4cF/1hyUdamtY8ftSWp64tYE6EBB+eGdQhsr4H/xWm6VLwRP2BB0LUPLh0SjEp3UhYsCCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z65srZ6IJX0cHUKpTkJ8aRG8R6BLyaHE4ywRt3gjSM=;
 b=t6QHmxa+5npaVHyBJKUiG5H2PveqZghxTMv/AMtz1S6McgHZg7DAeQAzNhSDYXEOf7ZPg/r01he/2XI0Jbac4bqAaaLsWTP5VOYD5mj4nHLgZI6E4wfSGBthzQTgJwzOXFUHOMZYPddkbEXbd+3E5S3DSZOZzcMpGiVuN0Ky0LIuiZDjnYNSasXhR/MM1XF+bfqq9aklsJ5NCv3Qjc+ZPwCwEdogRtgOo5ls8Hb9OdbcXGKdTSNOV/mMbeB71VUHr/i6DzemJebyoRNd6dp5A3SzW0wyyZUo3/QIPQs/NimKaZmgh2x8xoDpcQSM9SmxnQPeyvpWSDwx4FVbFwOvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z65srZ6IJX0cHUKpTkJ8aRG8R6BLyaHE4ywRt3gjSM=;
 b=0KLphs4pOgZkkikhJPwi9se2mvg/i4KzQKay8QbO4CVzFtwzY7bi4dbcb1iBbB0d9kmkE3j5jtMfBgYds2Lgnn3XXYUAYsXpcuUwkmg8/G9D4leXg9EUUdB7Ps3uavWdhlWd27Bd3zJVs1w8lRRGT0chKPS8QrfvxiQhrOCLTFM=
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
Subject: [PATCH v2 2/3] arm/mpu: Provide and populate MPU C data structures
Date: Fri, 6 Jun 2025 17:48:53 +0100
Message-ID: <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 9315d8c5-3ea9-4d47-fc84-08dda51a1326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JP44zMI/Z5A5U58h4pXO0a5iyojJzkhf65PWHbJ0I7EXCvgJAkOq09QXaF5p?=
 =?us-ascii?Q?tCf7f8JBGQclY9mKV/T7x2KEARToyo/FIoFa+N8XNbKQU/mwGOXofJI+KGLF?=
 =?us-ascii?Q?DNFD4uhSBt1hc/uc3GEyX1OuJkyTfvB4AiCyR33yTg0rezUmp7qtnl+JRHvl?=
 =?us-ascii?Q?aKV1E0MNO56y7+mON1mxPHw/51QQuXpq0+TFe3H19xlfWAJmJ/njjLV8bfh/?=
 =?us-ascii?Q?PKzWkEJ32HiZhUAOgnlHYtRGyMPpUboxra3CfLDKmsebmxL/zAdug6YSdhQm?=
 =?us-ascii?Q?PCPjuXHzZ3geN5SysBdjDWlYKIxRHd3S8qiuGUwI59c0c4e84RjS1+tyc2V7?=
 =?us-ascii?Q?/slvlggTkzAR/xXrnkHrfu+HfhE3FSjhcoz8MG1BpwZH7mmvwfAGC7CxLB7O?=
 =?us-ascii?Q?ND43jAPDJkk6YASGxk2v+4tX2BybibM5oRHMeAKo3QPspAQDgBNctDIaHs3E?=
 =?us-ascii?Q?Y6ibAiDcbDYL/unuft/E6CYi21oGhfVRHJvpyOp1x6PXN29yCOeXA9lQoAfo?=
 =?us-ascii?Q?EIkevbEBi896OJC7woaHm1i/tmRAcYaVdEItKbVXMt3BQG20PGrtUjFUTJc/?=
 =?us-ascii?Q?nmvFDYUtmoRsuL+/68E5Uus7xMdcpH50JqMe870BCzXE9rfk59K0IoY0udxO?=
 =?us-ascii?Q?Ddu8phO0DRruo9j0ygFnWYRFPYkSBRoA58EvVhQDLmuztiYkTvARFfAyKFuw?=
 =?us-ascii?Q?ozKQQmTM8S/OfatHWlPQ74GOfe2Lr1HFCACxr6pYZKgay9USXqOopCb3cCz3?=
 =?us-ascii?Q?WBVp3NyNpMbRpKQETNTAVtrhE9QrXJfQr3Fz7/1rqlGYSYgCPYf4uQlfFz85?=
 =?us-ascii?Q?f5h0W82JNFoaUFS7+HxcbAoRcLd/KEM7D//4eltVQv53hsJ3guIrOZrmpy3V?=
 =?us-ascii?Q?2RVuifrAgn4KONxmBdME45/HVGR6SEY3ze3FJ05VuyIzudMA08FsL4k76jrG?=
 =?us-ascii?Q?YKxcI7oV+4Ci3SYmd2UiEFMtgcNa4Qbx+okGZFhCrukyW2q4295HZroTjX5y?=
 =?us-ascii?Q?c7KzeD1gSpq9KOHFyuWfvyTlH1YxaQcdTeUewuqHHu0PjHehQR0g7Oys7vPo?=
 =?us-ascii?Q?m3K9+7GhjoLkFBm9v136HnzZzdHCAG4688QMfCttB09T4z70nlwOjUqwHG9a?=
 =?us-ascii?Q?7D5zGwzMWdINl6ewlhag7myKCFmD5SlvGQevn6svNOnyZupmzqCHmqPwlKgj?=
 =?us-ascii?Q?FBy/clcUfR9LrC/JCVyqYCmNso0ccX2Rwv8RQvavEcsL8bZao1hahtAP9+qi?=
 =?us-ascii?Q?ttzMAM1Bwq/0R/HZhVvg8q4veAHY0aRY9glXzE+YyrSXjJYjmfHYSPvobqjX?=
 =?us-ascii?Q?omcxBWQqtTg3Qht6vbBVeD8kyxNWV0WxkBriIaW6E7pCJGTbuM9rEdoN+Leo?=
 =?us-ascii?Q?3AQhbdZIn2OTcBlRFTldLzgJOiJN+O7WZ2RO9C/EWOUcFL73WGToDLQAjljv?=
 =?us-ascii?Q?bd2zpY7r2cuOBYmhARfSHEy2hzQx7PLRf0tWDFiv+pkhSCe9CQjUXD6+NQpF?=
 =?us-ascii?Q?zYTOQF9npdNSkAbYt+kllKUCJt8r2Ee15gUv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:49:16.4996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9315d8c5-3ea9-4d47-fc84-08dda51a1326
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960

Modify Arm32 assembly boot code to reset any unused MPU region, initialise
'max_mpu_regions' with the number of supported MPU regions and set/clear the
bitmap 'xen_mpumap_mask' used to track the enabled regions.

Use the macro definition for "dcache_line_size" from linux.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-

1. Introduce cache.S to hold arm32 cache initialization instructions.

2. Use dcache_line_size macro definition from linux.

3. Use mov_w instead of ldr.

4. Use a single stm instruction for 'store_pair' macro definition.

 xen/arch/arm/arm32/Makefile              |  1 +
 xen/arch/arm/arm32/asm-offsets.c         |  6 ++++
 xen/arch/arm/arm32/cache.S               | 41 ++++++++++++++++++++++++
 xen/arch/arm/arm32/mpu/head.S            | 25 +++++++++++++++
 xen/arch/arm/include/asm/mpu/regions.inc |  2 +-
 5 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm32/cache.S

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 537969d753..531168f58a 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -2,6 +2,7 @@ obj-y += lib/
 obj-$(CONFIG_MMU) += mmu/
 obj-$(CONFIG_MPU) += mpu/
 
+obj-y += cache.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
index 8bbb0f938e..c203ce269d 100644
--- a/xen/arch/arm/arm32/asm-offsets.c
+++ b/xen/arch/arm/arm32/asm-offsets.c
@@ -75,6 +75,12 @@ void __dummy__(void)
 
    OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
+
+#ifdef CONFIG_MPU
+   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
+   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
+   BLANK();
+#endif
 }
 
 /*
diff --git a/xen/arch/arm/arm32/cache.S b/xen/arch/arm/arm32/cache.S
new file mode 100644
index 0000000000..00ea390ce4
--- /dev/null
+++ b/xen/arch/arm/arm32/cache.S
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Cache maintenance */
+
+#include <asm/arm32/sysregs.h>
+
+/* dcache_line_size - get the minimum D-cache line size from the CTR register */
+    .macro  dcache_line_size, reg, tmp
+    mrc p15, 0, \tmp, c0, c0, 1     /* read ctr */
+    lsr \tmp, \tmp, #16
+    and \tmp, \tmp, #0xf            /* cache line size encoding */
+    mov \reg, #4                    /* bytes per word */
+    mov \reg, \reg, lsl \tmp        /* actual cache line size */
+    .endm
+
+/*
+ * __invalidate_dcache_area(addr, size)
+ *
+ * Ensure that the data held in the cache for the buffer is invalidated.
+ *
+ * - addr - start address of the buffer
+ * - size - size of the buffer
+ */
+FUNC(__invalidate_dcache_area)
+    dcache_line_size r2, r3
+    add   r1, r0, r1
+    sub   r3, r2, #1
+    bic   r0, r0, r3
+1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
+    add   r0, r0, r2
+    cmp   r0, r1
+    blo   1b
+    dsb   sy
+    ret
+END(__invalidate_dcache_area)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
index b2c5245e51..435b140d09 100644
--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -49,6 +49,10 @@ FUNC(enable_boot_cpu_mm)
     mrc   CP32(r5, MPUIR_EL2)
     and   r5, r5, #NUM_MPU_REGIONS_MASK
 
+    mov_w   r0, max_mpu_regions
+    str   r5, [r0]
+    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
+
     /* x0: region sel */
     mov   r0, #0
     /* Xen text section. */
@@ -83,6 +87,27 @@ FUNC(enable_boot_cpu_mm)
     prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
 #endif
 
+zero_mpu:
+    /* Reset remaining MPU regions */
+    cmp   r0, r5
+    beq   out_zero_mpu
+    mov   r1, #0
+    mov   r2, #1
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
+    b     zero_mpu
+
+out_zero_mpu:
+    /* Invalidate data cache for MPU data structures */
+    mov r4, lr
+    mov_w r0, xen_mpumap_mask
+    mov r1, #XEN_MPUMAP_MASK_sizeof
+    bl __invalidate_dcache_area
+
+    ldr r0, =xen_mpumap
+    mov r1, #XEN_MPUMAP_sizeof
+    bl __invalidate_dcache_area
+    mov lr, r4
+
     b    enable_mpu
 END(enable_boot_cpu_mm)
 
diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
index 6b8c233e6c..631b0b2b86 100644
--- a/xen/arch/arm/include/asm/mpu/regions.inc
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
@@ -24,7 +24,7 @@
 #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
 
 .macro store_pair reg1, reg2, dst
-    .word 0xe7f000f0                    /* unimplemented */
+    stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register than reg1 */
 .endm
 
 #endif
-- 
2.25.1



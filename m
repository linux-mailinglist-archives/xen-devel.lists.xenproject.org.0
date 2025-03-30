Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A431FA75BAB
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 20:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931676.1333878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0k-0004zL-2X; Sun, 30 Mar 2025 18:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931676.1333878; Sun, 30 Mar 2025 18:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0j-0004xX-Uw; Sun, 30 Mar 2025 18:03:53 +0000
Received: by outflank-mailman (input) for mailman id 931676;
 Sun, 30 Mar 2025 18:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bHYC=WR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tyx0i-0004t7-Jy
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 18:03:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 557b33c5-0d91-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 20:03:51 +0200 (CEST)
Received: from CH0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:610:b3::28)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 18:03:44 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::6a) by CH0PR03CA0053.outlook.office365.com
 (2603:10b6:610:b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Sun,
 30 Mar 2025 18:03:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sun, 30 Mar 2025 18:03:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:42 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Sun, 30 Mar 2025 13:03:41 -0500
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
X-Inumbo-ID: 557b33c5-0d91-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgsREP5Fu27Cd0GHc0Lyyembb9PcZbwcOsBV1IDjbsLdBti1s8JGr3B7N3Gamj4kX/j1c+aLRHvTyMGyqpIKK4Yvg2x81eAiCEdiASzwRhcktyIdc3IIUj6grf4tZimoEdce+YRh9WBtYkQS1f5kb4Ei8d0mijS20jK3v5pFSIv9qWHmIbv+kFceipnRaO9cP8fL4nQwpbumTUpKg/aG73auYUcJQ/aQkXYN56VCoi6Nv+jr60YKudDekB/fVaEMJeGdB80MFOYKrDJ0e97FKCVHAkZCwOMrVIMO0auJwPLqonKQysQAUy1YK48ZzKH1qad8OnlPoV9WGc5FYVEX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJelalunfFfLEoum9ocPu/SbN7Cw9ZtOsqRzevgCCAc=;
 b=CduZXm5vRdl6YdxOMXrMR7I5tihkLGMzYTykl1G/SmQqwTrNOH8XHOpReNmMLFQR4NTt4Lfns2G8m4iilvWXcSzSqvy4gnfJ0rtfRfExCJjAgoMJYuGCp5LnLgDDrP8TGNZzALCyVt2xfkXcmvCDtnlcxINWADtfz9B7jviwbsPGDHzB2/K1LKzyC40Q+5leJoBnflBB5PUzeiy0dFx4nFXiGrL/WP3sxwy7mbSWWM/vzRzJPz+k3Cp9wGSEuDqe8d8qvI4aPTnjGMR6mTvIClVxrzTY34wFguRFFk+peIyscW7i1+GnY6bUKVsCXNmrO/J1rce06LeJ8sRouCzOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJelalunfFfLEoum9ocPu/SbN7Cw9ZtOsqRzevgCCAc=;
 b=pRRtgnUuSWk/KfUfCSdCWfeIwKR33p4FP6EYvkkGTtLCaKhgyOjnYUf1f8IFz+d1ioh+Fp14B0tzile8ANPoMrX9eG2HvWh4DUQ0xQwpqY2fuEajkZU9CBvhNeu9+RSH66aQx9kVsrjEyOLK7NdARP2IlhN91Vdrkk0fJ/Kvqx8=
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
Subject: [PATCH v3 2/5] xen/arm: Move some of the functions to common file
Date: Sun, 30 Mar 2025 19:03:05 +0100
Message-ID: <20250330180308.2551195-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: dff695b6-cadb-4940-3dc3-08dd6fb5358d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zcS8sBshQJXqsHS33c0n7lSFsKrzOJWQqneMvAEaQkq/J7zUWb8G0hDT/gqp?=
 =?us-ascii?Q?/rY1eLZo/TlT/jLYATHHtGjHcUgFTEgrC84vMdu25TEfa3fDlgQyOr77FLD3?=
 =?us-ascii?Q?tseQoFGtUQIOvYCO7UxPYNsdHgvLp/FkbRMqgHJmbB+bDcO765r9QjmFxOeZ?=
 =?us-ascii?Q?OuiMFKkd1+IPza+QmErSU1yKPOPpwOSXg5PYsrytjFIsKVRH71UMZZdenCgG?=
 =?us-ascii?Q?6XTw5dncExu8K8dJ8UdZ0eXB57SgGM7C4Hc3bzu7Pl6gJQJSlVLv5kLUkjMZ?=
 =?us-ascii?Q?uEPGwBoPyaXNRBqd2RZoztaHA74uXMWu1AZW7KWo+ucWBza7Lqp9BXV51+8b?=
 =?us-ascii?Q?5rMUx5p4vp/YheqU2B1vyQ8RsIWQh/+wIGw3lDQWOqmGaenvTe+pjQUYYjFF?=
 =?us-ascii?Q?cjvSPJ8Bmf6EJXqWXpe4BeQ2uVtN3+O4jINJhU4L1lNRFznU/HMS4qE+6IBG?=
 =?us-ascii?Q?1Qc9bLogyxKXHbqGPjxOnr6IleYuPR3gIv1MJ7qzY5CxwxelYs8gddWHPmVw?=
 =?us-ascii?Q?C9mN6ErxCtcb6tZa4n/s2s9rx7imamSbxhNQqQ7wHNu3cjtFFzKXdfvhXAI2?=
 =?us-ascii?Q?zBZLzAHPT5fAS/TJ8lWYOBLN2eHpI9hv6x9Ib6d4jDCsNvpqtEVKy80rA7VB?=
 =?us-ascii?Q?E0FjpUOJOArnYBZP9oz6u2M3Jbh3eR2RrRlli15/f0NNk8CKg3KmWnOGZ+V6?=
 =?us-ascii?Q?LaqGyIsm2LJtSMf98q++cSdNIlhw3RzeT1qMp4K55nTL5FHA1z1CjdIKpeTx?=
 =?us-ascii?Q?dDldbSv9v8mW5j36gdiIoqpO1ekYAMb5ZG6bMC+xpe28UC+znldq9wtrW9BV?=
 =?us-ascii?Q?Bk2i3URK82wY8xlpJjgh9iaIgMbti3j60h2pfeaGf7rx4h27otAUbsl5LQ0F?=
 =?us-ascii?Q?wZaeTZfuQ3pMZofSKhff9tiID2kNKx3AVCYg5U8ZXXwON6t3tWJ0p9Gu8V1M?=
 =?us-ascii?Q?zT9ju864G2FstZOKeaJsDPOzEt+RQ62xep5HYU63B8cBRZvzfBo/nl/MvZxz?=
 =?us-ascii?Q?J2VbOYJw9EdoQFs5/FZpygaZ0sqDJ0OEjaPleSBBEQ39mw75d+yQvY7ntLyA?=
 =?us-ascii?Q?IYWw4A7EaCieHTcyHW0bHc1EtEHtcUciYlypGEDj0aGG5sCqd5lFJoUiOGYb?=
 =?us-ascii?Q?5QV9obHEsd7ssZWiTadnSRwI6ZH+AK8tfHcAa1QP39d/aaiae6hv7lb7c+gm?=
 =?us-ascii?Q?GXz29SgB1QG65x4f9KswBYTW4G8FqLcTtG5j5Km7emZJOoxTt67uLqQJ4sZH?=
 =?us-ascii?Q?7idAo1Pn50oCR20rNVJZj1W8iXBGPXZ6Xdj/eIRBFMLEe5ww9rlJM1QxFHNO?=
 =?us-ascii?Q?fH1kszHLdPc2c9KxcAVn4L2gfBA1Uz/MryxWkcJChi/k84ES525f+27MWma1?=
 =?us-ascii?Q?4F6XHEx3d1AP9fswZS+A8sVY9jMb4uR2iTDRr+WmR//u+8LBlZx2jj+AryMe?=
 =?us-ascii?Q?wxynklhtLkCdGSp+O2IaJqkeEkVWmobjmH7/jdCgMKx6hrf59Xme3O7XXSHK?=
 =?us-ascii?Q?Q0ZnxyEJopCibU1TA+sWZJZN2u+m6WkStatT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 18:03:43.3909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff695b6-cadb-4940-3dc3-08dd6fb5358d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914

Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
configurations across arm64 and arm32.

prepare_xen_region, enable_boot_cpu, fail_insufficient_regions() will be used by
both arm32 and arm64. Thus, they have been moved to prepare_xen_region.inc.

REGION_* are moved to arm64/sysregs.h. Introduced LOAD_SYSREG and STORE_SYSREG
to read/write to the system registers from the common asm file. One could not
reuse READ_SYSREG and WRITE_SYSREG as they have been defined to be invoked from
C files.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from

v1 -

1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
being done in enable_mmu(). All the mm related configurations happen in this
function.

2. Fixed some typos.

v2 -
1. Extracted the arm64 head.S functions/macros in a common file.

 xen/arch/arm/arm64/mpu/head.S                 | 132 +-----------------
 xen/arch/arm/include/asm/arm64/sysregs.h      |  15 ++
 .../include/asm/mpu/prepare_xen_region.inc    | 128 +++++++++++++++++
 3 files changed, 148 insertions(+), 127 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index 4d00de4869..90b4c8c18f 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -3,83 +3,7 @@
  * Start-of-day code for an Armv8-R MPU system.
  */
 
-#include <asm/early_printk.h>
-#include <asm/mpu.h>
-
-/* Backgroud region enable/disable */
-#define SCTLR_ELx_BR    BIT(17, UL)
-
-#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
-#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
-#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
-#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
-
-#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
-#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
-
-/*
- * Macro to prepare and set a EL2 MPU memory region.
- * We will also create an according MPU memory region entry, which
- * is a structure of pr_t,  in table \prmap.
- *
- * sel:         region selector
- * base:        reg storing base address
- * limit:       reg storing limit address
- * prbar:       store computed PRBAR_EL2 value
- * prlar:       store computed PRLAR_EL2 value
- * maxcount:    maximum number of EL2 regions supported
- * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
- *              REGION_DATA_PRBAR
- * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
- *              REGION_NORMAL_PRLAR
- *
- * Preserves \maxcount
- * Output:
- *  \sel: Next available region selector index.
- * Clobbers \base, \limit, \prbar, \prlar
- *
- * Note that all parameters using registers should be distinct.
- */
-.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
-    /* Check if the region is empty */
-    cmp   \base, \limit
-    beq   1f
-
-    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
-    cmp   \sel, \maxcount
-    bge   fail_insufficient_regions
-
-    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
-    and   \base, \base, #MPU_REGION_MASK
-    mov   \prbar, #\attr_prbar
-    orr   \prbar, \prbar, \base
-
-    /* Limit address should be inclusive */
-    sub   \limit, \limit, #1
-    and   \limit, \limit, #MPU_REGION_MASK
-    mov   \prlar, #\attr_prlar
-    orr   \prlar, \prlar, \limit
-
-    msr   PRSELR_EL2, \sel
-    isb
-    msr   PRBAR_EL2, \prbar
-    msr   PRLAR_EL2, \prlar
-    dsb   sy
-    isb
-
-    add   \sel, \sel, #1
-
-1:
-.endm
-
-/*
- * Failure caused due to insufficient MPU regions.
- */
-FUNC_LOCAL(fail_insufficient_regions)
-    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
-1:  wfe
-    b   1b
-END(fail_insufficient_regions)
+#include <asm/mpu/prepare_xen_region.inc>
 
 /*
  * Enable EL2 MPU and data cache
@@ -108,62 +32,16 @@ END(enable_mpu)
  * Maps the various sections of Xen (described in xen.lds.S) as different MPU
  * regions.
  *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
  *
  */
 FUNC(enable_boot_cpu_mm)
-    /* Get the number of regions specified in MPUIR_EL2 */
-    mrs   x5, MPUIR_EL2
-    and   x5, x5, #NUM_MPU_REGIONS_MASK
-
-    /* x0: region sel */
-    mov   x0, xzr
-    /* Xen text section. */
-    ldr   x1, =_stext
-    ldr   x2, =_etext
-    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
-
-    /* Xen read-only data section. */
-    ldr   x1, =_srodata
-    ldr   x2, =_erodata
-    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
-
-    /* Xen read-only after init and data section. (RW data) */
-    ldr   x1, =__ro_after_init_start
-    ldr   x2, =__init_begin
-    prepare_xen_region x0, x1, x2, x3, x4, x5
-
-    /* Xen code section. */
-    ldr   x1, =__init_begin
-    ldr   x2, =__init_data_begin
-    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
-
-    /* Xen data and BSS section. */
-    ldr   x1, =__init_data_begin
-    ldr   x2, =__bss_end
-    prepare_xen_region x0, x1, x2, x3, x4, x5
-
-#ifdef CONFIG_EARLY_PRINTK
-    /* Xen early UART section. */
-    ldr   x1, =CONFIG_EARLY_UART_BASE_ADDRESS
-    ldr   x2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
-    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
-#endif
-
-    b    enable_mpu
+    mov   x6, lr
+    enable_boot_cpu x0, x1, x2, x3, x4, x5
+    mov   lr, x6
     ret
 END(enable_boot_cpu_mm)
 
-/*
- * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
- * please the common code.
- */
-ENTRY(enable_secondary_cpu_mm)
-    PRINT("- SMP not enabled yet -\r\n")
-1:  wfe
-    b 1b
-ENDPROC(enable_secondary_cpu_mm)
-
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index b593e4028b..9b833fe73b 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,19 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
+
+#define STORE_SYSREG(v, name) "msr " __stringify(name,) #v;
+#define LOAD_SYSREG(v, name) "mrs " #v __stringify(,) #name;
+
+#ifndef __ASSEMBLY__
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
@@ -481,6 +494,8 @@
 #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
 #define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
 
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
new file mode 100644
index 0000000000..3402ed23da
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/sysregs.h>
+#include <asm/mpu.h>
+
+/* Backgroud region enable/disable */
+#define SCTLR_ELx_BR    BIT(17, UL)
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
+ * Preserves maxcount
+ * Output:
+ *  sel: Next available region selector index.
+ * Clobbers base, limit, prbar, prlar
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
+    STORE_SYSREG(\sel, PRSELR_EL2)
+    isb
+    STORE_SYSREG(\prbar, PRBAR_EL2)
+    STORE_SYSREG(\prlar, PRLAR_EL2)
+    dsb   sy
+    isb
+
+    add   \sel, \sel, #1
+
+1:
+.endm
+
+.macro enable_boot_cpu, reg0, reg1, reg2, reg3, reg4, reg5
+    /* Get the number of regions specified in MPUIR_EL2 */
+    LOAD_SYSREG(\reg5, MPUIR_EL2)
+    and   \reg5, \reg5, #NUM_MPU_REGIONS_MASK
+
+    /* reg0: region sel */
+    mov   \reg0, #0
+    /* Xen text section. */
+    ldr   \reg1, =_stext
+    ldr   \reg2, =_etext
+    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen read-only data section. */
+    ldr   \reg1, =_srodata
+    ldr   \reg2, =_erodata
+    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_RO_PRBAR
+
+    /* Xen read-only after init and data section. (RW data) */
+    ldr   \reg1, =__ro_after_init_start
+    ldr   \reg2, =__init_begin
+    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
+
+    /* Xen code section. */
+    ldr   \reg1, =__init_begin
+    ldr   \reg2, =__init_data_begin
+    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen data and BSS section. */
+    ldr   \reg1, =__init_data_begin
+    ldr   \reg2, =__bss_end
+    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5
+
+#ifdef CONFIG_EARLY_PRINTK
+    /* Xen early UART section. */
+    ldr   \reg1, =CONFIG_EARLY_UART_BASE_ADDRESS
+    ldr   \reg2, =(CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
+    prepare_xen_region \reg0, \reg1, \reg2, \reg3, \reg4, \reg5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+#endif
+
+    bl    enable_mpu
+.endm
+
+/* Failure caused due to insufficient MPU regions. */
+FUNC_LOCAL(fail_insufficient_regions)
+    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
+1:  wfe
+    b   1b
+END(fail_insufficient_regions)
+
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+ENTRY(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0C9B30C8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826451.1240728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8k-0005pa-Ib; Mon, 28 Oct 2024 12:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826451.1240728; Mon, 28 Oct 2024 12:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8k-0005nJ-Dg; Mon, 28 Oct 2024 12:46:34 +0000
Received: by outflank-mailman (input) for mailman id 826451;
 Mon, 28 Oct 2024 12:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8j-00050g-8W
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:200a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ba37e3-952a-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:46:32 +0100 (CET)
Received: from PH8PR05CA0010.namprd05.prod.outlook.com (2603:10b6:510:2cc::15)
 by SN7PR12MB7106.namprd12.prod.outlook.com (2603:10b6:806:2a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 12:46:26 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::a) by PH8PR05CA0010.outlook.office365.com
 (2603:10b6:510:2cc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:25 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:46:24 -0500
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
X-Inumbo-ID: a8ba37e3-952a-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoaicQE6Fedcmbg1DuPONq+10a9dRi+H9JTZp6HtNcVMy7ofXlUGxPAfq70neDO8HnR8dUQCsMsph+LoOpxKiCRN6gjX/zJMDBLEDDsRcyhWNKItmVz5CVQ0dsj7lAM8sBMPwDyCL+pmUirhvJYeaDA6ESnxuUp4sUhHKI8C8dnOGI6BFkNgi4LM6U2Kpfi4aAV+FgyPZIbJxP2yHdseNoM87uKrxIU8/7USDwLlPi7OfcApRtXIeOla05emX20JYeifGIE4/dNDBBomaliOmFbJGRGwzSn8gkBrK+aecklfCT0roMnaWza5u1nVhNoTEbZF6gIVkA3NaMeVa7P+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyhtbxHUC08uI+MsIp0gmuNpSuHqjK/LKiAaR17085A=;
 b=O6fObCsquHVYm79KrwZI1NPP6xO28bCj8jMiyzx2y4/phCHsMI30hAkWlMUZIF2fF4qraBdpdUqUIttM0tvns8HfOl7bbjOv0/VyvzKmkrQGeUzRQgkrgwH5PP9aHdjQnU5hKdhhE9Rlz2KCgeJYz5eM3JCcx1M9BzVkDQ+vxiANWUL4+bZHnn5TuFwEvICP6CvuczvASGhddfzY5vrUfVjqlHEwGlbNHe6bOP9VHAjFkuJWcFVgZF85XnBNyFpFwdFrp5iPu8sNc5rNp3gXyaCtC6os9atkEhn6JXLnPpqu0sUC7KSZHAZHQq18WwBzxahLvnIatlFJFeSUqfr6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyhtbxHUC08uI+MsIp0gmuNpSuHqjK/LKiAaR17085A=;
 b=D/N6ep35AFfc7bIvPL878/o8Kr230b6j/8r3KfHeZoTgz+TPD/fiYmI/bYmzI48bwYEpTJcPE73hHFDdj24sQRu58E4JM4ylrGyQvgerH2YjQFMP7se2HjZ0r0/MuaqBf+Xn7Qkr2DnvKpCozr/wBlGqrLyz4LyEWe8OW8FuPYQ=
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
Subject: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection regions
Date: Mon, 28 Oct 2024 12:45:45 +0000
Message-ID: <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SN7PR12MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 732400f7-d55e-4caa-dcf7-08dcf74e892e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qBz9smjOOSPXPosvmlDg75QR6cFMmr8R7NZ14Msm9zRQ5rtnmXn5QnZSkAMW?=
 =?us-ascii?Q?hxqgkatoCNStluGLz/qUHcNAGO1I/7kjhVjeCx3mdbR2bPvSeawfRFFtzA2p?=
 =?us-ascii?Q?kHMrxcQW1Dsu9yHKFtAyCCGFE0lF0dCDYzjGF06vlFRneTpy2hoQB+f8WS2Y?=
 =?us-ascii?Q?vIWTq5OYtopEiYplV4VGFoPrgU44YkcO45Qpa1Aqb+B0qoJpYMVgE9YHaQlJ?=
 =?us-ascii?Q?qBFRIdr1Ti4pIjNzq20JGHxnaktcYTFBs5QwgEw555XYsxnJSfYUodd6sN6P?=
 =?us-ascii?Q?XkyyTHNOgarIRBFYI7VaW3Ier1d/TDE71b2BrCsAEyZj5IHQEudnIN+fVQLV?=
 =?us-ascii?Q?G+w8QktmWhf+AYP4XvPEkwOJnpHYle7Y3Y3WK9Bq06jG/2DZgQgEsAmeJSxG?=
 =?us-ascii?Q?eIpbe0f87BelsB7678X7RTl6cIv31dQNOI9/sokOSTvn+EShFqgz7Ntu8t+k?=
 =?us-ascii?Q?vi0Kb1HZnQL7qMnu6cAmZ21GOKQUJKmZwLZrmr5Rm/hQrBXZDHck8I28ZvJJ?=
 =?us-ascii?Q?twEZAZ2PYBzgGqbcYkcqm5q8H11SlGSC9AXN3r7YXyb+9s5IsUN58Itx7Bic?=
 =?us-ascii?Q?kAHCdV9myyEuEeaCi9qFkLyJruj/N+CaO+PG8HHmmimZhjIbtMlpy66mqBfo?=
 =?us-ascii?Q?gW0dbx7eCArUR8pWAdirDtiX3y40BVfrh9OmlBVKF1rjgoO5RU8eh8RQ2I/D?=
 =?us-ascii?Q?m/sPlr7cjO23ISgaHfdQvoYZhWtqa9qZud7gkpL1JVSsiz4oIAURPrl+63e9?=
 =?us-ascii?Q?UoWmhaAScJq9VXU/1yDaulQS8/vBweenaoQpeSP1swquEO/sD2xD5KIYH6TR?=
 =?us-ascii?Q?PO7ybsVUPvqNeH9/vFBM8VOF+Gr6vD1IZ2JyFzE+kIvQDl2/JgYznImgjnmd?=
 =?us-ascii?Q?uvjPJQIYjmJT3NrfXUvzhxnMZsO+AKwbXLgqq3AiYOZdMYioNa4veZV4AyCK?=
 =?us-ascii?Q?qwcN8gp2Gg1JjB/unKQKpku0D4ZM1gIwIjIX38kZNt3GmmIMbeAdNTcUWS6Z?=
 =?us-ascii?Q?VNlX/awMFDxNG5LwLBKu0WeprqXeCX4OD+sY38MfBGzPGk9vcGhxg2oFB4oj?=
 =?us-ascii?Q?IkeOBUv22W4yYLnwO1Yuw2roDmdfr4oOZo4pN8K21iYbrHJ+/XScs3Cm+ZGp?=
 =?us-ascii?Q?ymPdXkoliHb6K2K2IpSsdpf2CBw3do5FYAu2vtnlZm6O18ToF3/ltAx5hhOM?=
 =?us-ascii?Q?GNk/eIAQ+DSRr/7a4jo0oh0u5zzfYHRPHF9e7kS1ip8ZI3Q/YoXSgzqJBmoT?=
 =?us-ascii?Q?UgRQoNEDzPLQRkqHMAHUXZL3fodkjwQB2yTzgbJTh3yx74rPcvTCTm6x4xC+?=
 =?us-ascii?Q?dpCENDYtlS0OYSg/jsy2uJfFGt1SdrjNc04s+1Bdk8/buihA3nAkJC7r8dHN?=
 =?us-ascii?Q?s++Z2P7FCFCcSKY0I6oZ1+P/UBbH0BSTouWknibNqRIBJZSoxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:25.9421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 732400f7-d55e-4caa-dcf7-08dcf74e892e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7106

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
are same, we skip mapping the region.

To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 registers.
One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
Registers", to get the definitions of these registers. Also, refer to G1.2
"Accessing MPU memory region registers", the following

```
The MPU provides two register interfaces to program the MPU regions:
- Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
PRLAR<n>_ELx.
```

We use the above mechanism to create the MPU memory regions.

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

v3 :- 1. Modified prepare_xen_region() so that we check for empty region within
this. Also, index of regions (to be programmed in PRSELR_EL2) should start from
0.

2. Removed load_paddr() as the offset is 0.

3. Introduced fail_insufficient_regions() to handle failure caused when the
number of regions to be allocated is not sufficient.

 xen/arch/arm/arm64/mpu/Makefile              |   1 +
 xen/arch/arm/arm64/mpu/head.S                | 122 +++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 ++++
 xen/arch/arm/include/asm/mm.h                |   2 +
 xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 ++++
 xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
 xen/arch/arm/xen.lds.S                       |   1 +
 7 files changed, 195 insertions(+)
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
index b18cec4836..a8a750a3d0 100644
--- a/xen/arch/arm/arm64/mpu/Makefile
+++ b/xen/arch/arm/arm64/mpu/Makefile
@@ -1 +1,2 @@
+obj-y += head.o
 obj-y += mm.o
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
new file mode 100644
index 0000000000..9377ae778c
--- /dev/null
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -0,0 +1,122 @@
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
+    msr   PRSELR_EL2, \sel
+    isb
+    msr   PRBAR_EL2, \prbar
+    msr   PRLAR_EL2, \prlar
+    dsb   sy
+    isb
+
+1:
+.endm
+
+/*
+ * Failure caused due to insufficient MPU regions.
+ */
+FUNC_LOCAL(fail_insufficient_regions)
+    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
+1:  wfe
+    b   1b
+END(fail_insufficient_regions)
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
+    /* Get the number of regions specified in MPUIR_EL2 */
+    mrs   x5, MPUIR_EL2
+
+    /* x0: region sel */
+    mov   x0, xzr
+    /* Xen text section. */
+    ldr   x1, =_stext
+    ldr   x2, =_etext
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen read-only data section. */
+    ldr   x1, =_srodata
+    ldr   x2, =_erodata
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
+
+    /* Xen read-only after init and data section. (RW data) */
+    ldr   x1, =__ro_after_init_start
+    ldr   x2, =__init_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5
+
+    /* Xen code section. */
+    ldr   x1, =__init_begin
+    ldr   x2, =__init_data_begin
+    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
+
+    /* Xen data and BSS section. */
+    ldr   x1, =__init_data_begin
+    ldr   x2, =__bss_end
+    prepare_xen_region x0, x1, x2, x3, x4, x5
+
+    ret
+
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
index d1e579e8a8..bbccff1a03 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -147,6 +147,7 @@ SECTIONS
        *(.altinstr_replacement)
   } :text
   . = ALIGN(PAGE_SIZE);
+  __init_data_begin = .;
   .init.data : {
        *(.init.rodata)
        *(.init.rodata.*)
-- 
2.25.1



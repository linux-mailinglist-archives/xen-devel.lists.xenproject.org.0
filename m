Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2E2A7EB07
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940882.1340517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSx-0002Ny-QK; Mon, 07 Apr 2025 18:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940882.1340517; Mon, 07 Apr 2025 18:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSx-0002M4-Ld; Mon, 07 Apr 2025 18:45:03 +0000
Received: by outflank-mailman (input) for mailman id 940882;
 Mon, 07 Apr 2025 18:45:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1rSw-00026s-LT
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:45:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2413::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69195c55-13e0-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 20:45:02 +0200 (CEST)
Received: from BN9PR03CA0456.namprd03.prod.outlook.com (2603:10b6:408:139::11)
 by CH2PR12MB9517.namprd12.prod.outlook.com (2603:10b6:610:27f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 18:44:54 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::d6) by BN9PR03CA0456.outlook.office365.com
 (2603:10b6:408:139::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.27 via Frontend Transport; Mon,
 7 Apr 2025 18:44:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Mon, 7 Apr 2025 18:44:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:44:50 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 7 Apr 2025 13:44:49 -0500
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
X-Inumbo-ID: 69195c55-13e0-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbLLmhMBNUzrW9/bceC1JlM2c3PP0iJzv52g3jR+FGp26gpPxsKleUneK8zalGBCuOXN+UBs3sr2axFNTojAN+5vTFnw3YLX0MLpcsF/s1exDv97Od9YOzxVrDMGlZoBSnZXwSScWIlYr2wBFkWJXcJcN2ByAD5Lej9l4iNf0hl94MHI7oS982657DqKH3G7l3wp7nS/F0Ont8LPBot+C5xsW6MjyxM5UvjH7+DKdKVCSJ1FigTCwa/nwKxjWWn4lSYk6waXNVvU0TXWobCxUQ8wKOTq5SquBtKPjve2UXzKm6DN9VI7/Jfo0PnKs9Pkrowy4vI03+eutkRnDm96xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BriW+JjBN77ChrCJa3L/4qjyHLVhb+tCnpsqG9iiQR8=;
 b=L0RBFSuvIw+VhPBm0Ybffu/fcOjhm3gJa3c38vYo1c/gAV7Cq2zEmoocG8YsyMoRw/8t1jSDlKruHx7hjf7WvRJYIfXfuut7lJbJJ5cU7QLqUPN7Qj/euKJktb5osM3NEbUrMXNrf8Px5+qtjQapbm1QagqyvOXnwNne4Xh3WPeKdCyHt5Vk8wfmmZQkSrS9ihUCwXnEomQR4zlvslIlFq8xfmq+r3LG/BDb1IjcKlAZ4aCmPxVOZ7nn8T0FvJP7HepziFa5/5jKpJvU70GQN8f1aH0+htsDc0L2qlIwNlgydTpIwIXs/795NrJW+iTz/KwBvw+ARgnKnNdVoXG3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BriW+JjBN77ChrCJa3L/4qjyHLVhb+tCnpsqG9iiQR8=;
 b=R+QqXXV3B6YECKsJ6mAPfIHu0S7JR2y5hIqtfR+QMQMek9he7ew+LwhTIvowqU/mE4GnDRc92kIwG/kzbuLNyBApu1lmJf858oQif1C0B6U9cstfS3ZJZs3+n2KlBLSh3PBD9Q3EoQ+iWQFAOYSit4IX/uEbel7ZnExL8SChD/8=
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
Subject: [PATCH v5 1/3] xen/arm: Move some of the functions to common file
Date: Mon, 7 Apr 2025 19:44:41 +0100
Message-ID: <20250407184443.1790995-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CH2PR12MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae83a01-6e8d-4689-554e-08dd760448af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YIupwtHFGsMiZTJEqUMc3STQd2TqKQPbs9zjQ9lfzai4NTW962yB3hnDcti0?=
 =?us-ascii?Q?GMPA9pgVjOarbY4ubZh+9veqDRm4u+A/6mKWkl482taWHhnxc3IOYr/9Ug3o?=
 =?us-ascii?Q?EZZWW99woCKDW50ceB2qdu/vOvKcmi5PAUXEYhx41uaPnX6Fpo0GXbjZymJf?=
 =?us-ascii?Q?l/brnQTSJccNfyXFTd/gF3EV0g7Z1OnheJQ1O1qtVmhPThs21Ff45OFDZV+M?=
 =?us-ascii?Q?0SfwTsxedt68mpcDUJSvTqpgcRxRR9qHEZpfjRCbgog7pk6sNba6U5RAasgl?=
 =?us-ascii?Q?zs985Qwfqrwx9m+j0ohkKrFkDx0ekYPtFzyeePJbQQYENK9dX/aUWFQ5X3Fu?=
 =?us-ascii?Q?5x/SVJtLNkPJB2+JQru4FbFcHR8mUUqE90TNwbMPpZwwizLbL67MBtMNBj+7?=
 =?us-ascii?Q?cGzIMo+SF7ovN6MJO2Cf/WQO3HPGO5S/IMh76GDuZHjiav/w+OC64t9s3DsV?=
 =?us-ascii?Q?9X7apE/4+WnqZlnvLWy6UVhXqfURBZ5nH79E/2tTb6ZHCDA67cLUVdrPiYre?=
 =?us-ascii?Q?DURRaidRn5TRPjf4INm1rkOlpbUO+glDOypV6iYuif+sAyw+NX9qve6hrb+u?=
 =?us-ascii?Q?WfkKALeiz3lyDeFasrZfi4W5TtG+HVHhdlzJG9nvZpnBz9BpQ020f8cSontn?=
 =?us-ascii?Q?1IZaGpWBNjiU0pyMvxAmOS84pePBEjp9oRLEYGY0i8dk3Cn1LbZilPRIO1kq?=
 =?us-ascii?Q?x0FHNhjjk/s6bFGN7KBRtaVQf8eQ01cr8LbHt3fmpB+9zXuJg2SrujDFP8LV?=
 =?us-ascii?Q?Q3oXbqGh8WjrEeGPEX/FrMDtcBzq3tPVuA0y7MhlwO9V60suGJot1Sh5tBgA?=
 =?us-ascii?Q?Sjvtmewo4IBPG2b0iq+26bVDgooPXXVFAYphLefs1Hv3Y6rmZo9mkFdMCL0Q?=
 =?us-ascii?Q?LVqQHp9xrtdQBy792Aw5LZBXg5SeimhbU1BVJac7pM9HvOSEH41N6GeSXXGF?=
 =?us-ascii?Q?xoADUh7sqRTQKYR/Na1QWIoTlcbyL/f55etS6+f0Ul2Uz6ePSFw7ibPOpfSN?=
 =?us-ascii?Q?pyfm7lRF6GB9VmdOts7ieZHLutnnbND3rFG4RCBAPBhREs88MTRiO6vBDljw?=
 =?us-ascii?Q?1TckLk5t9A3z8GBy/u29f0zQlQBCds1KJjIhlnCWrHMN11fzj2lO2OOzNc8r?=
 =?us-ascii?Q?eINMcVPPjJZ+qAGh1TNYYZHMeluAFu9lfSSNUXIFGoaYIKv9VyJZKe8sJLN9?=
 =?us-ascii?Q?tm3cW9okWXmgAsIoTQ2Zqo23VfPz+jqD8mQfiBPnMTvKIdU4ZVaPJAUCMcql?=
 =?us-ascii?Q?UtQSjg3xqqUYmZOEsti7oxL9RBFGXdWG8mE1lIL3UEQfrMYrgmU/RQ++1CXP?=
 =?us-ascii?Q?SpKoE8wAOqNluHzEbj9gjgIGtHDlkiYOa8g5ICRiYIcwHlRF4j5kQSevavt7?=
 =?us-ascii?Q?I2Ti02TcL/iNbi8BLL6PwC5gkfPU6x3a/VzdfjXB7pf5KJxMH+xOE3erQRQj?=
 =?us-ascii?Q?23v55FKLpGVLcVCE/7gpeEiJPZEC5m0HpA2PstjHV5iNb4xOIsrM1zPydeGQ?=
 =?us-ascii?Q?U+DXlhUuzPQk1Gw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:44:52.7446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae83a01-6e8d-4689-554e-08dd760448af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9517

Added a new file common.inc to hold the common earlyboot MPU regions
configurations across arm64 and arm32.

prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
arm64. Thus, they have been moved to common.inc.

*_PRBAR are moved to arm64/sysregs.h.
*_PRLAR are moved to common.inc as they are common between arm32 and arm64.

Introduce WRITE_SYSREG_ASM to write to the system registers from the common asm
file.

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

v3 -
1. Moved *_PRLAR are moved to prepare_xen_region.inc

2. enable_boot_cpu_mm() is preserved in mpu/head.S.

3. STORE_SYSREG is renamed as WRITE_SYSREG_ASM()

4. LOAD_SYSREG is removed.

5. No need to save/restore lr in enable_boot_cpu_mm(). IOW, keep it as it was
in the original code.

v4 - 
1. Rename prepare_xen_region.inc to common.inc

2. enable_secondary_cpu_mm() is moved back to mpu/head.S. 

 xen/arch/arm/arm64/mpu/head.S            | 78 +----------------------
 xen/arch/arm/include/asm/arm64/sysregs.h | 11 ++++
 xen/arch/arm/include/asm/mpu/common.inc  | 79 ++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 77 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/common.inc

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index ed01993d85..4d76a3166e 100644
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
+#include <asm/mpu/common.inc>
 
 /*
  * Enable EL2 MPU and data cache
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index b593e4028b..3ee3715430 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,15 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
+
+#define WRITE_SYSREG_ASM(v, name) "msr " __stringify(name,) #v;
+
+#ifndef __ASSEMBLY__
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
@@ -481,6 +490,8 @@
 #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
 #define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
 
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/common.inc b/xen/arch/arm/include/asm/mpu/common.inc
new file mode 100644
index 0000000000..47868a1526
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/common.inc
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/mpu.h>
+#include <asm/sysregs.h>
+
+/* Backgroud region enable/disable */
+#define SCTLR_ELx_BR    BIT(17, UL)
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
+    WRITE_SYSREG_ASM(\sel, PRSELR_EL2)
+    isb
+    WRITE_SYSREG_ASM(\prbar, PRBAR_EL2)
+    WRITE_SYSREG_ASM(\prlar, PRLAR_EL2)
+    dsb   sy
+    isb
+
+    add   \sel, \sel, #1
+
+1:
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
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



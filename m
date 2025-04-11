Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4BA85AF4
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947118.1344832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CCF-0007NP-HY; Fri, 11 Apr 2025 11:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947118.1344832; Fri, 11 Apr 2025 11:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CCF-0007Kf-EG; Fri, 11 Apr 2025 11:05:19 +0000
Received: by outflank-mailman (input) for mailman id 947118;
 Fri, 11 Apr 2025 11:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klsp=W5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u3CCE-0007Jn-9A
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:05:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d771d06f-16c4-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 13:05:14 +0200 (CEST)
Received: from MN0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:52c::20)
 by PH7PR12MB5709.namprd12.prod.outlook.com (2603:10b6:510:1e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 11:05:11 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::38) by MN0PR05CA0005.outlook.office365.com
 (2603:10b6:208:52c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Fri,
 11 Apr 2025 11:05:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 11:05:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:05:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:05:09 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 11 Apr 2025 06:05:08 -0500
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
X-Inumbo-ID: d771d06f-16c4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQCz+8qz8u75wFNZJhAzPWVwVECLjXX19iQMklyaWf+jc9TA06wkiV4Ks4BWII49CmpCtUf5CWb9Yxfd3WSJwDCRvbXJPYG5KRAxBJ9cCTipyimUx3rFv2h8ZqGrebb8OvUYCU53RbrJxnLnMh6PhNuaJ9LBLrr/1RoioYQzPFa+oqNfF8Z40xlwXUYjHz576T/hbvixE0oX99AeSx7yaH8b+qAOuAXwYQ5ZuEofBCZV1+T3cj5XWthZKkCfLygwb26lZmNWbJ10mejI0HMfrrjCN4wtmiBkRCrpcKenpt1DmxRIb8r7mZ4yMBdZgW1IISmIxbRey+AV3M9D3XdqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHo78ctMrPYj6u7pKMIrovxoW18cccH7A1TLEOoYSSA=;
 b=zVx1lzb1Mp4iPwqVrYH2q+0Qdng38hiJZPK5BPA7Z7kKVoVjKdybehNn2C5fyQuSRvvcZNpiHZ/LB0F5xZEJgNc9m8LP1L4s4ISYWSs2mwDZZVwSe1j0ywQWdEjXmfxI5l42raNE+ZCYxeRsr2fVu2k1k/EAhpDwU7cVqWFUZa8imRkUJ8bd1KTJCC5509goTLXNkQJTwLjrzxKSKcr4YacOGRQAHRzbDQmMBnkV/wY7Hw+drpXisMxri3lA5dgErQNrUwCT1LgYAL/dJO53kuDkgOG0sHC920yR0I5pMZQPgPvow24XRNc9cSwMRLIcl4lqCAKMwUiBP+On0FUa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHo78ctMrPYj6u7pKMIrovxoW18cccH7A1TLEOoYSSA=;
 b=iVW2xOQN8q/1ErY3b2znrS4LhSoOuelqxqUAAa5glLayE0phi5UMtZDxgQaJ1yL/wL/ZeFZ3kt6zPAHqSPE3xOZiDWyEvNwwmz6hQAm0ufjvk0vd4ZQ75ahYsUZ8YfR7rAovVMpcp07NEqgw5golcFqoBDc00sZDKxa39qel9Cg=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v6 1/3] xen/arm: Move some of the functions to common file
Date: Fri, 11 Apr 2025 12:04:50 +0100
Message-ID: <20250411110452.3748186-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|PH7PR12MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4c5849-c797-46f6-505d-08dd78e8ba4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E4O9vruj622ROWz7fEwgkgTrRvvuq+aNad6fhVxYs9k11Sn88/hgkXfjBUQu?=
 =?us-ascii?Q?hTYlam4F7uqvZun8QfRGpQUmwyzv8YHAGRwd4HmTOIFC5Wm5QSUGyaBTEsZX?=
 =?us-ascii?Q?v4x/zMRp/uUJBUpBD5OfLv3rCqx1TRVJD/K+9hy34YZy1q01a369vEmIDuTv?=
 =?us-ascii?Q?3pVqnM8iKx14HAK63Bs6X1ExuagBLTtIBsCYd2jfM3VPfdS9+2AJmGsrhmZl?=
 =?us-ascii?Q?r06DOxBisNjcXJp9p7KA+n81qhXIGLaGSaD2jl5yusJUYFOHCxVZ0kdchBMp?=
 =?us-ascii?Q?Ma/f7Uw86mzSaxizSeXMXIv94xTjrViDWoMh5fM5QCeaqvZ+tFzked11R9+D?=
 =?us-ascii?Q?ThjJmxXBQdKHO2VCyl8OiUjVEaZw9wrj8LUEn5jdliqmmVaaB/nxULXo2foF?=
 =?us-ascii?Q?AIhLeHl8mCUTfRn2+n2CTioRcFFJEknQ02DyYMNDWHbrGhJGx3df/auONfGO?=
 =?us-ascii?Q?SRc2OKF8yEvDZ9UVoSxAdvgpmYrU7CcwGDEYibd9A7vPsF/BwDiDEx+HcYCP?=
 =?us-ascii?Q?GAJ9TuphJvDL1AAN9XaqhLzt1oYRfutgav8hzOsJ16kx1+OG/lQ940c77pm9?=
 =?us-ascii?Q?tT8WEUGKy02DvBe8ffi/VxKBXQP1Sn3fFbLMsCVyHzw8T3K1HZ1lLVFmrbsN?=
 =?us-ascii?Q?05jv9Wu/56NVWR40aGU4AiMVIgTaw9e5rPZjXVl5K57Tzj05x9i6gYh0BnfL?=
 =?us-ascii?Q?HaepuwV+/XnIr6xuciW9brlQvVeh+hjT/ICoTg3foPU+JW56dmHrJm3eGUgn?=
 =?us-ascii?Q?wntdaJIVV67nPCZiIW/LVk4M3mrJJVChF+UpDHhXplSC0qKXgvksjyn22jKh?=
 =?us-ascii?Q?hTfN57P7BKQP30uiDz8Mcn42YZoCQlTHvKTxnnLD/FCuwoNLNmRcCQiGrvHJ?=
 =?us-ascii?Q?K00bv70feRm7TOChqfQX8qYti9zm5JHn5okiIlbxc70RWQfoKGFsHFg3JJaY?=
 =?us-ascii?Q?gSA1DPCd+T/2hFNzDZYQKV2WF7zvHdk5e1OtEgh5OOIHLgnhusRiyqGBbOjp?=
 =?us-ascii?Q?rln6d2+Wepy/INs9QvrRK/kAa/2domacnrtQBP6JBir4mRX0eyrniVfn0iA3?=
 =?us-ascii?Q?yM/mcj7SANRRkvQWALC5qJ8jOmemlINWou1TKfDwO6jOZz15V1Ntl9SwkAxp?=
 =?us-ascii?Q?h70pod+nB/xBIgndeqbtR7s55VuPUJFAZ6FdHX5QLut6EN4XIvAcpJQhKCFW?=
 =?us-ascii?Q?4k4BDGSziIA9q+HV7nfVub9X/9uzwH6XQyruAfxijo1TWwMQYSkbso27iBmi?=
 =?us-ascii?Q?yQZRTzm3yUdhGFd9lYWvK6R24sH6Z1PjkBfAQNnVcV/jqZ5rdR+/gIbaXxDo?=
 =?us-ascii?Q?rwrt28muxkCoCtG1UYazwzAsEid09mCnLeKzhr/nVeB0x3XjwuUOv8A9C5Ks?=
 =?us-ascii?Q?l+leRdv6d8atHZD6Nc821t0xcDPONdxbfFAk9mzLknCdbpOwtGiRp2qeK1dB?=
 =?us-ascii?Q?JOVDCfGNs4LHUyxXHNmHHmDQ4qdijZna6sF/cIhKQSeNNEad98igGcWn/VJh?=
 =?us-ascii?Q?l3hh6gHiYFdKdMNudjALhspQ5x/XKxYzcZ+R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:05:10.9671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4c5849-c797-46f6-505d-08dd78e8ba4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5709

regions.inc is added to hold the common earlyboot MPU regions configuration
between arm64 and arm32.

prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
arm64. Thus, they have been moved to regions.inc.

*_PRBAR are moved to arm64/sysregs.h.
*_PRLAR are moved to regions.inc as they are common between arm32 and arm64.

Introduce WRITE_SYSREG_ASM to write to the system registers from regions.inc.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
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

v5 -
1. Rename common.inc to regions.inc.

2. WRITE_SYSREG_ASM() in enclosed within #ifdef __ASSEMBLY__.

 xen/arch/arm/arm64/mpu/head.S            | 78 +----------------------
 xen/arch/arm/include/asm/arm64/sysregs.h | 13 ++++
 xen/arch/arm/include/asm/mpu/regions.inc | 79 ++++++++++++++++++++++++
 3 files changed, 93 insertions(+), 77 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/regions.inc

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index ed01993d85..6d336cafbb 100644
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
+#include <asm/mpu/regions.inc>
 
 /*
  * Enable EL2 MPU and data cache
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index b593e4028b..dba0248c88 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,17 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
+#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
+#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
+#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
+
+#ifdef __ASSEMBLY__
+
+#define WRITE_SYSREG_ASM(v, name) "msr " __stringify(name,) #v
+
+#else /* !__ASSEMBLY__ */
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
@@ -481,6 +492,8 @@
 #define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
 #define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
 
+#endif /* !__ASSEMBLY__ */
+
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
new file mode 100644
index 0000000000..47868a1526
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
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



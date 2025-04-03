Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E078BA7A871
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 19:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936976.1338089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7p-0006OT-8C; Thu, 03 Apr 2025 17:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936976.1338089; Thu, 03 Apr 2025 17:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7p-0006NQ-31; Thu, 03 Apr 2025 17:13:09 +0000
Received: by outflank-mailman (input) for mailman id 936976;
 Thu, 03 Apr 2025 17:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+EW4=WV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u0O7n-0005tR-BF
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 17:13:07 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2409::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7cd9c2d-10ae-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 19:13:06 +0200 (CEST)
Received: from DM6PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:333::24)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 17:13:00 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::20) by DM6PR03CA0091.outlook.office365.com
 (2603:10b6:5:333::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Thu,
 3 Apr 2025 17:12:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 17:12:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 12:12:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 12:12:55 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 3 Apr 2025 12:12:54 -0500
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
X-Inumbo-ID: e7cd9c2d-10ae-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yrjiz/8iMdpbmkbpEcfb1N25WLppPJuEgnUq5eg5fyAk6AWXgngdSeDRYWb/NAEc7fal6ThE+xD3eXKH+gSETWDH/q6z6hTM6PA8yeSlHXPL5p3YDvH/GX5GDPCcKLeHNwyTflB16VD5qOtEJzRK2bjb3/TFBe78CWIqBmt8cZNkLDMdyLSsHiTZulkx6FtQu75GHTiu55YUrv4BS1n3CdMo/7QE3vGxFI2KIddzwxoWMGd1fcvz2VidyVSZ/Y0j/TFhTvSl97a3cVR55fTQhx2x/Hy837s4j3cU/b0qhu0wayBEoAHI2y2q7iD42TDmE/1YIQLhkCM+jUoRAV33CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQlVndv6IFyQsh/aclgDelcrFq42ln2cN7OA9k6EGpQ=;
 b=TtgDXNCJ9wK5MUzKHbauMG2A3yY9zTzu+FFrE9PNr3lEkxpc+yA44m2+sUv4PMW1NeyiM3aO/ZB990mzhKEPBfv9fOu2ETsgvPVwrE5gP93sb2FEz9tAMQVPiFGUCeIlbeqfkmorPpGDuuC8Oeux1WmsPC9R6oJtdNcAFBrXn/7s/5uefYIMozmVYfcpSemTcoc0cU1Gbty3x5NSZgTkmOx9/eiagacsfzVYV73lHwWMMwNO6i4/hq7J7bDmvpVc7HMZOtvfN5/VkN7zo9BM3dLjRW5eBtEgewVLI8mCuDXGsK4x7DN5guwkqamI10LAdCt2RePpXha6EVLvM+w4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQlVndv6IFyQsh/aclgDelcrFq42ln2cN7OA9k6EGpQ=;
 b=Vry9FLJDemX7W1a0n1yZ+5kb4Q0QlSBdJz+d+kkvzHeIxth3UGJLHAOGmF+1A9f+0FX9+2+s1xtDMjt+dMWIXsXnZenRXTc3sJJrhGFxtoigw9qAo9mbT/njnejkPFmBCXzY8s5UTocyHLQ2yXGdR509d2IxkkKO4FTrPY+lkUQ=
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
Subject: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Date: Thu, 3 Apr 2025 18:12:39 +0100
Message-ID: <20250403171241.975377-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|IA1PR12MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc10902-0735-4d6b-f89f-08dd72d2c811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MzbSPx4qmyJBklvTR8GMBHK+kCEYa7SHo1gQKBogzY9wMZbbIdJH8gnhdM6t?=
 =?us-ascii?Q?tZYRj0SdP0qwt1u0gTf0rpgVcsKspF56/8XwSNbRwJPoMBp+5eOqMZrtTxgy?=
 =?us-ascii?Q?BIGQQMJXTnErM+WMdtOrqWnbd7JP5knp123Gk1/ISRqJBhrmlAMqcI/hJnhF?=
 =?us-ascii?Q?1f+i6wmYBBM94MzjBnlJUVJRPKA++q/4ATKqS8woU0d0/ecgjKV/iFKZmPkN?=
 =?us-ascii?Q?q8+sW/8P5ywi+HLqHVowvNOHUdmZcZ9dIWms70VigqiDxfCaadD+QS5aEw3s?=
 =?us-ascii?Q?2JFBqCo0exjWrWnPHc91J8AaG6G3GjK+AM4aMeJGJuauKESlMkXCzkYq+kF5?=
 =?us-ascii?Q?iHpfMK+3TT0hD63QyBUcnwfxx6ycBKdQZjNvqHdTOiNgjXEWwLF2TVYJMqcd?=
 =?us-ascii?Q?yUt52ZovD0wr7cSThH1kijEbkYX0LC5CcC7ADxPeAtO/MLWbrWTWwDM8n8rB?=
 =?us-ascii?Q?URPhtxq2BTUR72vuFdQEGlkpKmRfBymrMC0Kc5nLaC2ZbowPojWxhIOiEszR?=
 =?us-ascii?Q?74JCjsp+qGZDUFNXol6PefcyAr1C94DfsDM0tRmgSJklos5xGKheUqyWrF2J?=
 =?us-ascii?Q?cTHeCHA7TQusHJJ9kNlcKnsMyygCmUVBFeDmbzDjd5hzGIPAW6gKsYGzkGkd?=
 =?us-ascii?Q?TnPqnlSu+nhwyx8cKNMNM3P397tyIDBSM9LJy9wmPsbZFa0BdxwY+MWhNTMS?=
 =?us-ascii?Q?Xa7AdPD48/DGIaqbI0zwQ9doNA+mh56jLcOjO3ndzzYYCTfEiwRVT2t/LbqA?=
 =?us-ascii?Q?eVujlTzNIzTA6y7wnO2D0L0c1SNznzYtoorV8A8WUYlRaY88XpPgdg4dvQw8?=
 =?us-ascii?Q?iSgs3fhagNtU/N0vHRBMlJj8nBsO7/8DgA92nU3J4YEj9o4lsdaqrHGOIBWp?=
 =?us-ascii?Q?+BXUN6pVpGFEfcXyl0I0mwFucWwu8GWQY7wXXa6Ue8fvQW/8pS2MgI6B7ctn?=
 =?us-ascii?Q?UxGSQpyjy1YpXQ88KtVbCKgeQgrHM2F2U/9kgQky/5c2+UDqIN/M3Ggwciuw?=
 =?us-ascii?Q?iT2NgwFqHnx/dGYpeCm7FlVzp2dSg0+oAwTkZ64nW4ByhoyTfF+5glm9kUW9?=
 =?us-ascii?Q?hDVCSutlz1RuLwaSxUFJV3Nd6Qh05YEhsoiy8/3tQhVguR+rQaEh2p+f8NGd?=
 =?us-ascii?Q?FeaCHyGe2ea3OQmoCWS/CuuUD3fn5bFDa5XmusSMamA8Ol3Tksh9uNwNEfKz?=
 =?us-ascii?Q?k8/bfilBlC57T9sO9hqmxM+4t2mofxFTAbWG6V3mzii+7OEddToOopkHaLZA?=
 =?us-ascii?Q?BDH2zCPd4mAWOCkp/qGMMCpz3O+c8tx5i9DQsx+E9XOcFzjCVWccPg4xm9ih?=
 =?us-ascii?Q?zCY8alAQPDLfJ9n+Oh9U1XOmCKwOAnq5bcLTcy6DrqzXmHH04LdBsdeJcqEd?=
 =?us-ascii?Q?qnJATAn846f4XEXsnlRWNLjmB75hazoM5xw2QT2VcswTahdlnrRj40SM1/rh?=
 =?us-ascii?Q?2AWnrY2VVKDbsNHiMc1FMjMW34BlS62oN8hqd0M0DAQGm5thPpD2Qln2fx5o?=
 =?us-ascii?Q?/Fut2ax0fY43sog=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:12:58.0235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc10902-0735-4d6b-f89f-08dd72d2c811
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356

Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
configurations across arm64 and arm32.

prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
arm64. Thus, they have been moved to prepare_xen_region.inc.

enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
SMP is currently not supported for MPU.

*_PRBAR are moved to arm64/sysregs.h.
*_PRLAR are moved to prepare_xen_region.inc as they are common between arm32
and arm64.

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

 xen/arch/arm/arm64/mpu/head.S                 | 88 +-----------------
 xen/arch/arm/include/asm/arm64/sysregs.h      | 11 +++
 .../include/asm/mpu/prepare_xen_region.inc    | 89 +++++++++++++++++++
 3 files changed, 101 insertions(+), 87 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc

diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index ed01993d85..8cd8107a13 100644
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
@@ -154,16 +78,6 @@ FUNC(enable_boot_cpu_mm)
     ret
 END(enable_boot_cpu_mm)
 
-/*
- * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
- * please the common code.
- */
-FUNC(enable_secondary_cpu_mm)
-    PRINT("- SMP not enabled yet -\r\n")
-1:  wfe
-    b 1b
-END(enable_secondary_cpu_mm)
-
 /*
  * Local variables:
  * mode: ASM
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
diff --git a/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
new file mode 100644
index 0000000000..8af44d5669
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
@@ -0,0 +1,89 @@
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
-- 
2.25.1



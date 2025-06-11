Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C635BAD58E2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011824.1390348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMZI-0008KO-GL; Wed, 11 Jun 2025 14:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011824.1390348; Wed, 11 Jun 2025 14:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMZI-0008Ie-DU; Wed, 11 Jun 2025 14:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1011824;
 Wed, 11 Jun 2025 14:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMZG-0007cf-Kb
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:36:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:240a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c0e25cb-46d1-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 16:36:40 +0200 (CEST)
Received: from BLAPR03CA0079.namprd03.prod.outlook.com (2603:10b6:208:329::24)
 by IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 14:36:36 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::f0) by BLAPR03CA0079.outlook.office365.com
 (2603:10b6:208:329::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 11 Jun 2025 14:36:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:36:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:36:35 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:36:34 -0500
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
X-Inumbo-ID: 7c0e25cb-46d1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ddg+geFncAx4VkotUy2WS/xAC1G6LGTFn44j9FxXVOvCONgPd8i3hDsxzgUQ72fr+lPUQ8yaaK24JrJP8jkxzJDlwetPFAGPuvMEpqPvDEtQMNpEP/aVfKWxwe1+vXolG220Q3KaunJk4uVB6cVToe7rNj88lURuYPFF3gD7B+sTR+9uV/n/glhGJcghyNeudqXpuDazpCSNfOYul6MNlcIGDESD1X9C5W07Qd8F6Bi40tSRUMeggJxBODdkXrr6gKPaUwlqvYsvhz4S9DFDWl+uN/ye12rjRIe55SVmmxmAN+FT2mUndNB7JH61PiXceY8obWqRw2h6CTqOaYCYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1+LaD2YpdlFLBfipmeizz0Lx6eHS1RvF/RK7uBnEU4=;
 b=JnYGQINnOO3wtUqP7PDbZVtmTKfJMeEGfNzxhOx4VoUKeY2b4KduZj2QV6abd+uzvVSF4SGWWF5sID+relzju08grVZn+kJTDkCElnAOoHSY/sI32ATg13zjQ8WtGZ/8p/x0bRGJmr6wqJm92FqBCs37jQp752kqLgv+LWmCslhQrZWVGwbbv3LLk70Jm/aUTni3kJRyqabo+MIjhZVMX3yo7ZOLXuYbstA6lH/I2l7U/slO6KDZi8vwYyWKDv/Nvg2w0sbkuNiKOej1+Xj0CAgPPtt+ykGyaYnzldV7u6scpuu5/K9A71/skqQUlUyxh0SLis/z7ZI0jeSgREoX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1+LaD2YpdlFLBfipmeizz0Lx6eHS1RvF/RK7uBnEU4=;
 b=MLCgDQH86qoJG3aM+YYBerZ2HHXZ2PbUDEsOQf8lIy5vOzhfmT72jUn9PWbHquuqm1P89nz3yTDJ4Dk/PQMvaCVpdCcpY/YH2n5EhAH911MgDJirR2d0VpLRIlq22QxDuOqujUIho9uoParXsaoedakoz4kNs+maMIf4ANSWsn8=
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
Subject: [PATCH v3 2/6] arm/mpu: Provide and populate MPU C data structures
Date: Wed, 11 Jun 2025 15:35:40 +0100
Message-ID: <20250611143544.3453532-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: ecab66e2-4e85-4a51-1311-08dda8f55e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o9ssgmLi7j0xCwC5MQFgHkcTU4wft/BgJ7rC3rI8HhtJKsiARgv90RSqUeKr?=
 =?us-ascii?Q?7au/J65g1LkVOtn25tsjTzkmUktwYlHxFZ1NDypxnZK7atfAE2Upb+gck/hI?=
 =?us-ascii?Q?USCXYlz1svswv457+tRI5gvygYEqBQahklapVzdVgUQ6huGclOqt+WPia0e9?=
 =?us-ascii?Q?TWT7McmGxDam/U46YkvOEojM5q8FfW4T0/RPqfnCX0HzqqBQpYk1y8EY0Yvm?=
 =?us-ascii?Q?CLUkjmQdDdXwMEuSJKUMEddABha3cFLm95LVJJsnH27CCvut98fsRCBVP75M?=
 =?us-ascii?Q?hT5Lfp4fSqZeoX9mOia+Q612PH3KLUiyH/aU23ci8IiY0i96w60phVyUCG0j?=
 =?us-ascii?Q?0496d1+nQ3DDBnZmiiU9invGhF34MMuzM+Cyr4lY0fpDWh0cGw4p89NSTg7f?=
 =?us-ascii?Q?BNnKfzWSLgfgK0Ny02anVt9hTo6aPkkApkrxnQDeZ0ESGHJfpFZmYmTu7RLi?=
 =?us-ascii?Q?5WT1lhU3f0bY7FFjK369tblPNdf/X15ZdqJafhyBUfLF6nyAetkiquGtjpuG?=
 =?us-ascii?Q?2zyFqq/M4wEXbf6LqIyMWZUJhcfSVc2XAiXhewK/3ubyhqwZE48/vu6p/Nl3?=
 =?us-ascii?Q?9iMRrd1Qn40B3eq4/Rxl/A4yXQpnSa/Xt4hAFKK9gic4CW2x5CT12q0X6T8j?=
 =?us-ascii?Q?gCk9Z9I1VIr9l7+u4rdsZiMOBtls4P4eQ4V2ohFCDrwiJWZ5wD+BFNVMCvxh?=
 =?us-ascii?Q?Rmh9hh9fXbuXiUBrqRQkVham2WBS3IPs9YtcQrm8bAUolHFQC6ZogWGoWBvd?=
 =?us-ascii?Q?frb7stE9QYjhJq8Cw7i4Ae0VcBeAiOzgMvGmPEb8IuZ1gTak0mYB4q0TOAtk?=
 =?us-ascii?Q?LCupIjAWnrGK+T3KtpemPnK3I3/E41MBEhVXyHhfSTaHyDKPDYzjmG5ejj9B?=
 =?us-ascii?Q?yYs7WT0rZKRmWsBgVzcKBuKQk6eNGrAvHhvzJp4rQ7vxDY4IOdSmb26TZ/fg?=
 =?us-ascii?Q?ngboIt4wpElGCGuclwA9Vt45n2okozTK49o99xVkj+bAtyjuF04in3SkOC7X?=
 =?us-ascii?Q?8EC0u3zHmu+Hpn9ic5KqKR/VkZ/ZEcPNB8hb1t/WZQ4vcq2iOAMmM9i1wdXT?=
 =?us-ascii?Q?AeNJJV8T7kffTUY/EoNmNuoBt7+SfXAUWZNRSz3ZtZceFpUJtBKPSCXenwA/?=
 =?us-ascii?Q?FCOyBGnaqxHAprK7EcSkk+bmGW5K62d0ArYfIg6ZyGlxXbPhZXZLfGDovURh?=
 =?us-ascii?Q?CWZ603oKysGozf4eDudMTVb0sNpVfsv3BmZhGyTS1MzK2CYOv09R1cikZSqA?=
 =?us-ascii?Q?dxdXzuD+rKnv87f9FN5bCjIrBW1MNpPaguVhfyGFa+b4wiFW1UXe3rJ7toHy?=
 =?us-ascii?Q?e9hYnN8bGmt/sL1YS7pcn8c6sug31JFwPrJ4JKrCUhZgSqHHDA7qabNBR/Sr?=
 =?us-ascii?Q?lex27fLGfS1JWEBlcuLA6fS1BMPnQ+iy7UJEe487c9MyN9c5eU3uWRQKzTQn?=
 =?us-ascii?Q?UCmj+lFyLmCD0kBYAiAYtWIv1kXL+9D7bYdWKJJ/cg8ntuqMXp7xP/tywU6H?=
 =?us-ascii?Q?RQJkoQ4ULnHTd/uA1p3dmCAjLJ2M4jV+qmG+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:36:36.0839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecab66e2-4e85-4a51-1311-08dda8f55e6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908

Modify Arm32 assembly boot code to reset any unused MPU region, initialise
'max_mpu_regions' with the number of supported MPU regions and set/clear the
bitmap 'xen_mpumap_mask' used to track the enabled regions.

Introduce cache.S to hold arm32 cache related functions.

Use the macro definition for "dcache_line_size" from linux.

Change the order of registers in prepare_xen_region() as 'strd' instruction
is used to store {prbar, prlar} in arm32. Thus, 'prbar' has to be a even
numbered register and 'prlar' is the consecutively ordered register.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-

1. Introduce cache.S to hold arm32 cache initialization instructions.

2. Use dcache_line_size macro definition from linux.

3. Use mov_w instead of ldr.

4. Use a single stm instruction for 'store_pair' macro definition.

v2 :-

1. Use strd instead of stm.

2. Fix some coding style issues.

 xen/arch/arm/arm32/Makefile              |  1 +
 xen/arch/arm/arm32/asm-offsets.c         |  6 ++++
 xen/arch/arm/arm32/cache.S               | 43 ++++++++++++++++++++++++
 xen/arch/arm/arm32/mpu/head.S            | 41 +++++++++++++++++-----
 xen/arch/arm/include/asm/mpu/regions.inc |  2 +-
 5 files changed, 84 insertions(+), 9 deletions(-)
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
index 0000000000..b21bc66793
--- /dev/null
+++ b/xen/arch/arm/arm32/cache.S
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Cache maintenance */
+
+#include <asm/arm32/sysregs.h>
+
+/* dcache_line_size - get the minimum D-cache line size from the CTR register */
+    .macro  dcache_line_size, reg, tmp
+    mrc CP32(\tmp, CTR)             /* read ctr */
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
+ *
+ * Clobbers r0 - r3
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
index b2c5245e51..6a631626a7 100644
--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -46,43 +46,68 @@ END(enable_mpu)
  */
 FUNC(enable_boot_cpu_mm)
     /* Get the number of regions specified in MPUIR_EL2 */
-    mrc   CP32(r5, MPUIR_EL2)
-    and   r5, r5, #NUM_MPU_REGIONS_MASK
+    mrc   CP32(r3, MPUIR_EL2)
+    and   r3, r3, #NUM_MPU_REGIONS_MASK
+
+    mov_w   r0, max_mpu_regions
+    str   r3, [r0]
+    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
 
     /* x0: region sel */
     mov   r0, #0
     /* Xen text section. */
     mov_w   r1, _stext
     mov_w   r2, _etext
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+    prepare_xen_region r0, r1, r2, r4, r5, r3, attr_prbar=REGION_TEXT_PRBAR
 
     /* Xen read-only data section. */
     mov_w   r1, _srodata
     mov_w   r2, _erodata
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
+    prepare_xen_region r0, r1, r2, r4, r5, r3, attr_prbar=REGION_RO_PRBAR
 
     /* Xen read-only after init and data section. (RW data) */
     mov_w   r1, __ro_after_init_start
     mov_w   r2, __init_begin
-    prepare_xen_region r0, r1, r2, r3, r4, r5
+    prepare_xen_region r0, r1, r2, r4, r5, r3
 
     /* Xen code section. */
     mov_w   r1, __init_begin
     mov_w   r2, __init_data_begin
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
+    prepare_xen_region r0, r1, r2, r4, r5, r3, attr_prbar=REGION_TEXT_PRBAR
 
     /* Xen data and BSS section. */
     mov_w   r1, __init_data_begin
     mov_w   r2, __bss_end
-    prepare_xen_region r0, r1, r2, r3, r4, r5
+    prepare_xen_region r0, r1, r2, r4, r5, r3
 
 #ifdef CONFIG_EARLY_PRINTK
     /* Xen early UART section. */
     mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
     mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
-    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
+    prepare_xen_region r0, r1, r2, r4, r5, r3, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
 #endif
 
+zero_mpu:
+    /* Reset remaining MPU regions */
+    cmp   r0, r3
+    beq   out_zero_mpu
+    mov   r1, #0
+    mov   r2, #1
+    prepare_xen_region r0, r1, r2, r4, r5, r3, attr_prlar=REGION_DISABLED_PRLAR
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
index 6b8c233e6c..23fead3b21 100644
--- a/xen/arch/arm/include/asm/mpu/regions.inc
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
@@ -24,7 +24,7 @@
 #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
 
 .macro store_pair reg1, reg2, dst
-    .word 0xe7f000f0                    /* unimplemented */
+    strd  \reg1, \reg2, [\dst]
 .endm
 
 #endif
-- 
2.25.1



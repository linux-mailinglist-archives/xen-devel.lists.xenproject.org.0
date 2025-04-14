Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE4A888DF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 18:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950877.1347070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MwJ-00042g-V0; Mon, 14 Apr 2025 16:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950877.1347070; Mon, 14 Apr 2025 16:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MwJ-000415-SB; Mon, 14 Apr 2025 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 950877;
 Mon, 14 Apr 2025 16:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4MwI-0003ls-9p
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 16:45:42 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2406::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5771f0f-194f-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 18:45:40 +0200 (CEST)
Received: from SJ0PR13CA0072.namprd13.prod.outlook.com (2603:10b6:a03:2c4::17)
 by SA1PR12MB9492.namprd12.prod.outlook.com (2603:10b6:806:459::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Mon, 14 Apr
 2025 16:45:36 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::a5) by SJ0PR13CA0072.outlook.office365.com
 (2603:10b6:a03:2c4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.8 via Frontend Transport; Mon,
 14 Apr 2025 16:45:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 16:45:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:45:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:45:34 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 14 Apr 2025 11:45:33 -0500
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
X-Inumbo-ID: e5771f0f-194f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkLGeK8NvI9E04+WsEcBjcNKijn9i3zcwOwyfxkmlGg4PW5Ii3+SOVr4TJFkro+657El1mGG2YyEpy/hn9fYZw+GpxMg3kP+uyxBSx6o01gGEABq5HZPwqafH2lcA3fKIWZD9xKjXI3u6YxbFHCHH7bQw3iq9f8bror6pGTDnXBvrPkMALdxr7ongtMvrdEJvBcklZt04EPXbD3St14Beq91Y8s2sYWrvSbxu+YM0qcQPYR3dbOcWaGrXG7IZ7R1FvcKl+ac/EQ79rcJBUqvbykZ70c1XdbEd0InFzduFDqTc2UaFdUSqKTEBi36cdXgEoZAyRtnWsbrw4PZmPCN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuwCRj4OOUZ4a9010l9+6ShDpNXekNIhaBCOz4phGPQ=;
 b=yA5TjKbhe1ki5VlJhTlQU9E2cB0LV0mMM2dBvpOq+QsT9K7Eo95sI1YaXfmMbrC+I4x8I+TZ/jWdRMiF7wuCcY19OGUwKTV9xtP8CgEwH+fxxQSBZSzWl48FU2jAeNtcTcj8uXGjKzPUgjhcCIZi5168Y2H5FgTthMSPp9FEZD6mLOhEPe8bAg4e8WWzJbe/b7uT7iLOEwzB03i4sq2i6TP8LNLLBE+gLNkIuGd8DCHVUBkmZrSvM7k2RkvXS7s6q0UMZjXvkNfHutRG2f7BO0TwrNQL0EYgoglBwN3/tdFPvzlaiTrxoSr7vyv4kHjmQUeXBHBtaVowrUd8xMqdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuwCRj4OOUZ4a9010l9+6ShDpNXekNIhaBCOz4phGPQ=;
 b=lzVdwo0q/sHo4VQe0Pvja4vI8PJ3re6zOa9WFlZiFIpGsnKnX4DHUkk5yCYFD1y0f1mIaUUMenI+7iUT3Kys/5fShvnBkkCLDYA1rZ/PX8u5/ZLOFGub+Uk/aFRLsh6xp3LE7lS36Bx0W3sMBbeiHegbAg/3/fPmHyt7rfqbcYo=
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
Subject: [PATCH v7 1/3] xen/arm: Move some of the functions to common file
Date: Mon, 14 Apr 2025 17:45:12 +0100
Message-ID: <20250414164514.588373-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA1PR12MB9492:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d68a0e-0f7c-4593-952b-08dd7b73c771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uf8G5axzb8Wg51YjAODCrwi2/Aw3FNdB95akj5W+qqRVFaMSUvz+F2wo/SFk?=
 =?us-ascii?Q?E1uqcduvJeQD6YNhKpq4H3IIhGlw6GmgdQg1lohjNxQk+IyBiM/9XnUdJNQi?=
 =?us-ascii?Q?2rt5eZtWn3hGD4wOP4yUS8uPo2kR1aUnDdKVeobYxOGkh4Fallr/Xg3YSnbR?=
 =?us-ascii?Q?23YmYhGmWnK/TjZT83v2yfShX8hXWGPrkMo8pN3ccMY+3oFAI6IG7NePIAKr?=
 =?us-ascii?Q?EwaH2X/VfPlFY2PcVShLbXmbAqtNNRA9KPORJXhZVCVOvbOsGOBh3ejbLmyi?=
 =?us-ascii?Q?p3PL9kYo8j4H5Yf4MXyOs2nC85Vh0VmU+U/OL+ioCgugs/McTXxYgTdxHkd2?=
 =?us-ascii?Q?w5WtlGFRMRuGDKB/rfLhV99WWTZK6aXw4D50DI5auW1IVJzim/5pxHc2vvEI?=
 =?us-ascii?Q?FpWufJFA7Tirgkrj9Op2/eHfzRUwCwG4ZiGHpjg4QeBcSIYK3sFsokNRUvix?=
 =?us-ascii?Q?9cjs2C1M/Jm3Ak39m4LIQTX9jD7K3IgS6pOdi4cQmzgR8PCvD3I2OQ5YEbwg?=
 =?us-ascii?Q?xqxVj/qDQCGwxsXE2VZ9he9kEjgLNeuc1BJQhcnJP+aB1eyvhoKhgyXaiCcc?=
 =?us-ascii?Q?FoyDtvc9D4F3u2JUoSfhBmwAHFu8sHzbUJ/3AGcJB51dUqQW1g4Zsn63Vosm?=
 =?us-ascii?Q?lIc7dXQVRCNcxnSfVW88KRNZtPg+nMRxtMpnP3jtFTV+DveNjIgn31nz2WB7?=
 =?us-ascii?Q?Iahpp8IFUpoiRLGPy+8Jk6bLbVDcTY/34bWDdv+up6VhbEFRdHi9O6lWpXLV?=
 =?us-ascii?Q?9SBuGQ6hF8M76pSs3/W0XA6/0iVQ3AdON28xdy67uOO0QsBYCOtmYBD0tLdf?=
 =?us-ascii?Q?+FCEBXJtZP2zOcXSM5BIWppp8DnxbNeamqLktLteubllflUxDWCLQ1R0w+cw?=
 =?us-ascii?Q?yZ07TyUq9X0mvwfXrtIXAMYLq3zTmPcchaQoMdyLeVS8UlrJUhiLCEiEvo2/?=
 =?us-ascii?Q?4A9hIKRPOkDTFUkxQH2z7ug62yPmBRTXMLepeotu6y1O67+bSFilR76YCrxs?=
 =?us-ascii?Q?Khek4hPdFHDYbSLnkG+Bynf90ScIKom/pWmf/ai5XYctoLrawtetYQYrTr+E?=
 =?us-ascii?Q?enAKKE963Qs+JwgxMLuv2vyB63zQvamxgKx/KDK5t01pxMGs0wZYlhmFoiLf?=
 =?us-ascii?Q?jYNDLpmIj9FMh+4+QmMasuQo/gmHO1DI81xh2qVpEScgMOXfh0L6r8U0xp2v?=
 =?us-ascii?Q?HshhwByFyFcwm/folBatgQF3Ygb40ywib5jwRHpS0D8QtmvCcXZEh7/qwksQ?=
 =?us-ascii?Q?MLZSywtml+A+GGnpKuGcXBT5j1LVsLh8Gu/wHmb+nU3UHtUA2L4zPrYvNS6A?=
 =?us-ascii?Q?E8tWMm/0Hfk74odulF5Ksy+sbos+4kN9f1sfPGQMnFpRVclpJ4alM5tsqwb3?=
 =?us-ascii?Q?jO4WwTf7NzUuEN8c1K7iOR5B9cMh1Dsu6os0Ca7SRjRng9PTaRavD9vlcyqw?=
 =?us-ascii?Q?Frnx+Hnp89U7AklrFSjvKPPHSJqrS2SsglK2F4SUMMfMSsDtgnrNsl8ZtzZO?=
 =?us-ascii?Q?0Ov25zUYSXbCZ977WfFLAgjosjpvnCc7Qz0k?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:45:35.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d68a0e-0f7c-4593-952b-08dd7b73c771
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9492

regions.inc is added to hold the common earlyboot MPU regions configurations
between arm64 and arm32.

prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
arm64. Thus, they have been moved to regions.inc.

*_PRBAR are moved to arm64/sysregs.h.
*_PRLAR are moved to regions.inc as they are common between arm32 and arm64.

Introduce WRITE_SYSREG_ASM to write to the system registers from regions.inc.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
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

v6 -
1. Add Michal's R-b and Luca's T-b.

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
index b593e4028b..7440d495e4 100644
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
+#else /* __ASSEMBLY__ */
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



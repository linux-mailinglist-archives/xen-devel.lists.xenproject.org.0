Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27579ADC921
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018125.1395079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFh-0007DH-3I; Tue, 17 Jun 2025 11:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018125.1395079; Tue, 17 Jun 2025 11:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFg-00079f-VF; Tue, 17 Jun 2025 11:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1018125;
 Tue, 17 Jun 2025 11:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcaV=ZA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRUFf-0006Jw-RJ
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:13:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2414::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fbe5737-4b6c-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 13:13:15 +0200 (CEST)
Received: from PH1PEPF000132F3.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::38)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 11:13:09 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH1PEPF000132F3.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 11:13:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 11:13:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:13:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:13:03 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 17 Jun 2025 06:13:02 -0500
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
X-Inumbo-ID: 0fbe5737-4b6c-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVtVNRdztqsJds18rXzw5E5aui2VtgG2g6n14OC5ETuvFn2lwGoygWBhaGDK5ohBqFSoOXhkTCqweQPwNZNdIerBRImInJ6+7NlPUWsEfTp/wsP0NmSdiGUipKmlRk1YugFbthOIcMHtmBx/Cpa8ZQhpMjqsSbvY2oUhXChktkYgfFLclvLt5lZrWQDHIWI0OCvpLX9GNHA/C+nXa9Wld35FcmJY17eFay2Xq2uvwE8nSjhymXatKTNOLqTTwclSuOnZoapQkYj9wA8+KHn1x7UcPjfvAJORUn10hLgBRpG6o8987aO9cVO853z0BxAWbQhqK/hiikno8D1piF5IPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AN9WdqwVCm1lPI+a3SLeICCSGdyyYOJ1GEWKR/CXCuc=;
 b=I8vpUWJGxODmWnieDLhYYHGw+N+CqBEjKR2C+qHzNXlg5Ld+r/OfGxIjCtAxkhPB0EfRUhmGF+eaESI9N/tHKlMwBsiKhyyZagI/BbkKE41GsuJ7QoBk4tcolKJ2gASoJx90YeAzByDdL/Db3Nh3B6Q5otn+D1d9MwgduzCn252TDbetrnTwNKO0CihxhLtuLVLkilmN1BFJup6zekkK4yxxXxnaWE9WybzXwh/MDQtjSD7gSykb24otDjJ6RxU1DyNktsQzCrDQrEyt84inMO0Yy2MZg1i1v5QR7OFSEr3iG4lDQfle6nAY9B54IFFGlNhqWGToAx076G/cG3FR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AN9WdqwVCm1lPI+a3SLeICCSGdyyYOJ1GEWKR/CXCuc=;
 b=gljnQI6dSZMtMUmGjRVWT1zHq9PXyyBhuBEiqtqygkcGRGfsAecYTh7H42Ow6wi4gGI7tDLvaA6F69ADW2RzDFfu8SpxNNiBj6artzEKbdjdb6hdnpWCl7SqT86t6QmeqOsBXlUspzrJIQE4hrJwueEH7RVJy27Cy+tEeilAArc=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH v4 3/3] arm/mpu: Enable read/write to protection regions for arm32
Date: Tue, 17 Jun 2025 12:12:51 +0100
Message-ID: <20250617111251.1711553-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bead7af-c7ff-4fe5-6c17-08ddad8ff104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NJ7UEkvaXSYmv6bp5kQW6gOtxSmqS8OGh1K3m3QtI8CK5FXECgewI33RqKoS?=
 =?us-ascii?Q?mRMS2bjXhSHjbQk94QePSmW9LgVmufdatOttQ6mmvfC9Y3qBVAfboTgVrDZu?=
 =?us-ascii?Q?RvHwREedlmmqfUcTJ6AIBM0eMNBVbGzIcH/ceX92ZihY+Wrx4IRXBFmbpxVk?=
 =?us-ascii?Q?X/CHsj4HVu2QUiR4XbZ2Be80N0QA0hoHu0BU3yCGugQP3h5llRp7TvQUBGoW?=
 =?us-ascii?Q?RgHWc6+/5KowYoTH8mL+1NokQ0Sjgszoq366IsSTT+AESxujCvqU1hi3bnat?=
 =?us-ascii?Q?/75lnCKQf47KDnFWW5Bq5q5B4JO8Y5pVe4pgUCv6BBwQpY6GT9IZc9w8Ne9H?=
 =?us-ascii?Q?SKlJjRE2gF8fZCg11B40Ai2b8s300uB+sbUZ/CKBjz7C0bZhs2ZfdkqJOjjW?=
 =?us-ascii?Q?QSyL3ZFYex5JGXxV4VWtaqFODQxk51fort+EgXT2nGe2ZfFqq8cA3hGCvMQ6?=
 =?us-ascii?Q?S9279hZEhP+SG78h+jYtkcrHr+MgsxCUPSfZc7phUE3VwOQbEpjE++tlm+sj?=
 =?us-ascii?Q?xpVuCJKIg1kl6fJr9oBNLJk51Eeaqk5rd9SsD8l67UTwx2O2MSp/KnuP/y3F?=
 =?us-ascii?Q?kE7Yg3ITUnuS00Y18hJQYvA0kL3wnihhBbKZWzzi3FOYSXTbOlqHL2I7EW3h?=
 =?us-ascii?Q?0OLdNj40d9r7bmlFJ6s1uWq6KtTTut3rSESXbyupvQ8o7oms77ruGgTKGWL2?=
 =?us-ascii?Q?l4VQhOJL8Til/aXMIJuov9ogdSwrjKKjR2bmAy0V5q02wxyNbTnU8ZCvOIM2?=
 =?us-ascii?Q?K6yma7TMpmDxYJDPBDjQZaBuxaG3EPhWo7clf69IoHmuMbmmta+1y0zvln3b?=
 =?us-ascii?Q?eIHm8AFMg0PDp+Y7TZuGtB05cYQ0fITn23mfCbaENhK/1QYI7cHCeMcKyXda?=
 =?us-ascii?Q?q94CryW9LESErnVGKFIn62IIzFlyAyehwryfzLuXdoL/dprMsIdPUBN1qa8P?=
 =?us-ascii?Q?VtYsYTAa0ymetsVMhSNOByeg/TY3CzrYRz1uIvZW0R1Hw861oYJqZjZ7Aeze?=
 =?us-ascii?Q?Gw8ITHblR7ISioTsc2+HpXLb63btEVgt78L132H3HAp3oICkFN7ZCrYcIivk?=
 =?us-ascii?Q?uM7ycgh9eOLu3bmNH0y1AnsqAeVUl8QlTAYPYZr1u7fg2INAtd1ug3JefZ31?=
 =?us-ascii?Q?xkIxzSAkBAWNh+aYR9cB9JdUvSDuNHeLWOoNmJcsRwlwQTnqkF0sHbNNmIx6?=
 =?us-ascii?Q?dX+AVf4pljsDR5s4SKv6psrrzs7OO110KAK5Gj9HKFqLFxJ3xoSQjwKNo4TY?=
 =?us-ascii?Q?WgzPunrbTDeOtbLqSoRyLacIC8OogU/RRZUdzEGr7tZLHKYKrOSBm8Iqi1CW?=
 =?us-ascii?Q?CT42VPEpocFxqwT4LYchpUWxtdVo3gKEcrhN2ho6HGysnV4nPi/nbe7uITy0?=
 =?us-ascii?Q?CkbrAJoiCnFEwq0nNFj9x51mS/0o+IZdAeDc6OLNkupIpcl9aKOhaDRW0dBt?=
 =?us-ascii?Q?7u9EhcajiUnCUJkb6bBRo0Dj1zpXclKlhC6BcPLEZUek4roOEDAbMqtZj+xs?=
 =?us-ascii?Q?xylbnH4cDO06LDVqPQJb96F6jfJVK1U6fXsK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:13:09.0679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bead7af-c7ff-4fe5-6c17-08ddad8ff104
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121

Define prepare_selector(), read_protection_region() and
write_protection_region() for arm32. Also, define
GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 254.

Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
Enable pr_of_addr() for arm32.

The maximum number of regions supported is 255 (which corresponds to the
maximum value in HMPUIR).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Enable write_protection_region() for aarch32.

v2 - 1. Enable access to protection regions from 0 - 255.

v3 - 1. The maximum number of regions is 255. Thus, regions numbered 0 - 254
are supported.

2. prepare_selector() is modified to ensure HPRSELR is written when accessing
any region beyond 31 and the current value differs from the region number to
be accessed.

 xen/arch/arm/include/asm/mpu.h  |   2 -
 xen/arch/arm/mpu/Makefile       |   1 +
 xen/arch/arm/mpu/arm32/Makefile |   1 +
 xen/arch/arm/mpu/arm32/mm.c     | 164 ++++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c           |   2 -
 5 files changed, 166 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm32/Makefile
 create mode 100644 xen/arch/arm/mpu/arm32/mm.c

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 8f06ddac0f..63560c613b 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -25,7 +25,6 @@
 
 #ifndef __ASSEMBLY__
 
-#ifdef CONFIG_ARM_64
 /*
  * Set base address of MPU protection region.
  *
@@ -85,7 +84,6 @@ static inline bool region_is_valid(const pr_t *pr)
 {
     return pr->prlar.reg.en;
 }
-#endif /* CONFIG_ARM_64 */
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 5ad15e93be..58c9b5b4e8 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_ARM_32) += domain-page.o
+obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
 obj-y += mm.o
 obj-y += p2m.o
diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/mpu/arm32/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
new file mode 100644
index 0000000000..c0317a4ada
--- /dev/null
+++ b/xen/arch/arm/mpu/arm32/mm.c
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/types.h>
+#include <asm/mpu.h>
+#include <asm/sysregs.h>
+#include <asm/system.h>
+
+#define GENERATE_WRITE_PR_REG_CASE(num, pr)               \
+    case num:                                             \
+    {                                                     \
+        WRITE_SYSREG(pr->prbar.bits, HPRBAR##num);        \
+        WRITE_SYSREG(pr->prlar.bits, HPRLAR##num);        \
+        break;                                            \
+    }
+
+#define GENERATE_WRITE_PR_REG_OTHERS(num, pr)             \
+    case num:                                             \
+    {                                                     \
+        WRITE_SYSREG(pr->prbar.bits, HPRBAR);             \
+        WRITE_SYSREG(pr->prlar.bits, HPRLAR);             \
+        break;                                            \
+    }
+
+#define GENERATE_READ_PR_REG_CASE(num, pr)                \
+    case num:                                             \
+    {                                                     \
+        pr->prbar.bits = READ_SYSREG(HPRBAR##num);        \
+        pr->prlar.bits = READ_SYSREG(HPRLAR##num);        \
+        break;                                            \
+    }
+
+#define GENERATE_READ_PR_REG_OTHERS(num, pr)              \
+    case num:                                             \
+    {                                                     \
+        pr->prbar.bits = READ_SYSREG(HPRBAR);             \
+        pr->prlar.bits = READ_SYSREG(HPRLAR);             \
+        break;                                            \
+    }
+
+/*
+ * Armv8-R supports direct access and indirect access to the MPU regions through
+ * registers:
+ *  - indirect access involves changing the MPU region selector, issuing an isb
+ *    barrier and accessing the selected region through specific registers
+ *  - direct access involves accessing specific registers that point to
+ *    specific MPU regions, without changing the selector, avoiding the use of
+ *    a barrier.
+ * For Arm32 the HPR{B,L}AR<n> (for n=0..31) are used for direct access to the
+ * first 32 MPU regions.
+ * For MPU region numbered 32..254, one need to set the region number in HPRSELR,
+ * followed by configuring HPR{B,L}AR.
+ */
+static void prepare_selector(uint8_t *sel)
+{
+    uint8_t cur_sel = *sel;
+    /* The top 24 bits of HPRSELR are RES0. */
+    uint8_t val = READ_SYSREG(HPRSELR) & 0xff;
+
+    if ( (cur_sel > 31) && (cur_sel != val) )
+    {
+        WRITE_SYSREG(cur_sel, HPRSELR);
+        isb();
+    }
+}
+
+void read_protection_region(pr_t *pr_read, uint8_t sel)
+{
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_READ_PR_REG_CASE(0, pr_read);
+        GENERATE_READ_PR_REG_CASE(1, pr_read);
+        GENERATE_READ_PR_REG_CASE(2, pr_read);
+        GENERATE_READ_PR_REG_CASE(3, pr_read);
+        GENERATE_READ_PR_REG_CASE(4, pr_read);
+        GENERATE_READ_PR_REG_CASE(5, pr_read);
+        GENERATE_READ_PR_REG_CASE(6, pr_read);
+        GENERATE_READ_PR_REG_CASE(7, pr_read);
+        GENERATE_READ_PR_REG_CASE(8, pr_read);
+        GENERATE_READ_PR_REG_CASE(9, pr_read);
+        GENERATE_READ_PR_REG_CASE(10, pr_read);
+        GENERATE_READ_PR_REG_CASE(11, pr_read);
+        GENERATE_READ_PR_REG_CASE(12, pr_read);
+        GENERATE_READ_PR_REG_CASE(13, pr_read);
+        GENERATE_READ_PR_REG_CASE(14, pr_read);
+        GENERATE_READ_PR_REG_CASE(15, pr_read);
+        GENERATE_READ_PR_REG_CASE(16, pr_read);
+        GENERATE_READ_PR_REG_CASE(17, pr_read);
+        GENERATE_READ_PR_REG_CASE(18, pr_read);
+        GENERATE_READ_PR_REG_CASE(19, pr_read);
+        GENERATE_READ_PR_REG_CASE(20, pr_read);
+        GENERATE_READ_PR_REG_CASE(21, pr_read);
+        GENERATE_READ_PR_REG_CASE(22, pr_read);
+        GENERATE_READ_PR_REG_CASE(23, pr_read);
+        GENERATE_READ_PR_REG_CASE(24, pr_read);
+        GENERATE_READ_PR_REG_CASE(25, pr_read);
+        GENERATE_READ_PR_REG_CASE(26, pr_read);
+        GENERATE_READ_PR_REG_CASE(27, pr_read);
+        GENERATE_READ_PR_REG_CASE(28, pr_read);
+        GENERATE_READ_PR_REG_CASE(29, pr_read);
+        GENERATE_READ_PR_REG_CASE(30, pr_read);
+        GENERATE_READ_PR_REG_CASE(31, pr_read);
+        GENERATE_READ_PR_REG_OTHERS(32 ... 254, pr_read);
+    default:
+        BUG(); /* Can't happen */
+        break;
+    }
+}
+
+void write_protection_region(const pr_t *pr_write, uint8_t sel)
+{
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(16, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(17, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(18, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(19, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(20, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(21, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(22, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(23, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(24, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(25, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(26, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(27, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(28, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(29, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(30, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(31, pr_write);
+        GENERATE_WRITE_PR_REG_OTHERS(32 ... 254, pr_write);
+    default:
+        BUG(); /* Can't happen */
+        break;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 7ab68fc8c7..ccfb37a67b 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -39,7 +39,6 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
-#ifdef CONFIG_ARM_64
 pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 {
     unsigned int attr_idx = PAGE_AI_MASK(flags);
@@ -110,7 +109,6 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 
     return region;
 }
-#endif /* CONFIG_ARM_64 */
 
 void __init setup_mm(void)
 {
-- 
2.25.1



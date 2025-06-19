Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F616AE0397
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019941.1396386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDVY-0000mF-6d; Thu, 19 Jun 2025 11:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019941.1396386; Thu, 19 Jun 2025 11:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDVY-0000jn-2m; Thu, 19 Jun 2025 11:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1019941;
 Thu, 19 Jun 2025 11:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SlwS=ZC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uSDVV-0008L0-ST
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:32:37 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2414::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1881a05d-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:32:36 +0200 (CEST)
Received: from BY3PR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:217::21)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 11:32:32 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::7f) by BY3PR04CA0016.outlook.office365.com
 (2603:10b6:a03:217::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Thu,
 19 Jun 2025 11:32:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 11:32:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 06:32:31 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 19 Jun 2025 06:32:30 -0500
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
X-Inumbo-ID: 1881a05d-4d01-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdiuAyRW8siHbS28wu2yX4ZceP5Z/L4EMBbPC9WRe5J3dIGr9p57NfZ3bR8sutwJgbAQpd99+wOp5im3d4KnXsNg1xONohmR3zTBwGPDbHdRBlfxnA4gFdgzI1QO6z1+3cCBs9fFhV0Ib/cyu2GbNH0Wgyt2asGANcZ4zJfzqFmTtiaDmbhhemxagyO9chg7TSyTSBKzgmegDLWsMiXF2ltQnzi8Gv4TO7AyElNg2ldGYq+kMjuGbPAXkY3sIp1ns3Ti2vmSDJ0wSSXL5VYeWTpp4THjcbtTnYYFkOWBkw7iYfknOElWsmJ+UT2WeNaCM5GvCD1OlXo0234i9CoHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN6M6a/5MsbA0wVu/9z6XdbvAHDkqorSxg5xNPa8Obs=;
 b=RwTINB3n5IEdXCwQNVp19tg335HY6gNHusgP+9a/z5t931d2YiavPNhkVwUP6NI63MaPssSTOUz3o3drpCFvJ86tBrd7ar8RPJoRK7rLHDKKvCQOt5MQpo/czjVpQrakc+7618ea8/ZfLu/2hSYPvFCGR9Y+JLjVKeoahULfny10CI6dh8Ma4dZ5+1u4cWqBuNmbqfTZDC/0QucwwvGANkvyQ++9e9SD5kqJVD/JqqgqwHaT383PrbWs/DyMRfVRrM/LSApZsvdqcOIysQnyG3Uafi6+KrBqA1mbAaP/jGj1KngB+fI2443pSzpy4yGVLtBVnfFV5uCQP06oOqNI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN6M6a/5MsbA0wVu/9z6XdbvAHDkqorSxg5xNPa8Obs=;
 b=mwAiaABK7DtUGfoLJclHmezQfBsbVLeKx8+RS6zuw4O2yLdomY7zPNekYWKk7+8yP7yWBWOMtlbfwh2CpDXVru6j6sTvZOCWjZySE/DE343RTlLwAXqoMrDYF9Xom2z1AEIj5ye7G9wt5SCPZ3SSepXwA1k7DbYo1x+S6GPjnJI=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 3/3] arm/mpu: Enable read/write to protection regions for arm32
Date: Thu, 19 Jun 2025 12:31:52 +0100
Message-ID: <20250619113152.2723066-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
References: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f2614b-c1a3-435c-cd2c-08ddaf24fb21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YM9Ns7sRCPFogJ11wQ/GFOKVX4iwR4PJ/RISuQaQulKSl3dFpQ0Rpnq4EVH5?=
 =?us-ascii?Q?7vWCFDk7cNpY2rpjFNceBKV1Q6oX0qXTEKgaZPnuEitXDmN8iTx5FzKcIirl?=
 =?us-ascii?Q?P9MbH4p0ob+HF2IozDPL7PdBZvBm+BiXPnBcx9blLJEEflQvpsFi1/c38GWc?=
 =?us-ascii?Q?+s/ynMc+HEs2xdPpedwPxe9EcmxQaPjzjvilewGZguyOvakUaNdsCtiz06IR?=
 =?us-ascii?Q?4qs5xJO33UVN24iIHvul3qQtSlxmMx/p5mgmv1Fpz56CPgW+3Orn2CiKAlDY?=
 =?us-ascii?Q?fWhb9uPzFrzSowQQWYDlWKnpEobOlDFtEYWbtjlZf1u+3/cWPl/Ha3k5U+6f?=
 =?us-ascii?Q?+FeivTREOllvycqRjGcrWC+V8fkuEoEKmJQPX5WFpYZTrG4Gzlukx/MGm3+8?=
 =?us-ascii?Q?MWvHN4Os3OJojeOpf1g1B2iebPEHmqMDBenmOgkElPfj4cWyF5hSE1Ygt9X7?=
 =?us-ascii?Q?F8ZmDTwyuyufT9XGr0CB/qgTm4Z61PO0PVgVsCsBceBHCn7iZ//HUe/4AFlJ?=
 =?us-ascii?Q?Aa3yVxdXrwvqfGz/7cv1k9fk0UhJ9XkY6p6dAUvulW7g5pJPXORkrl9rWP4s?=
 =?us-ascii?Q?wOabUlAW8IjvppsQi+gwkZM462LGig6mY7xAkBFmfLMUEp6XZfrvgMHlmymb?=
 =?us-ascii?Q?53d6oycDT2neRAiN5KifRODFjnMmDoJxjOOCzmA/VHwo8KjtGyBdTFIsBf0N?=
 =?us-ascii?Q?qPcTCvkJXD30SWTUUs3C4E7yHB2BP6DurBT8nafKX/HKfDT+Llz09L+4Povb?=
 =?us-ascii?Q?aivaCIXuu4VOOpIk4YgsKjqN3sHboM2rJjJU4ZVVUOTAYvi9ltBq33/YX5E0?=
 =?us-ascii?Q?082CGbpKhdAapPR1Cbiz4aViLCP+w8og7aEtWCHw9j7qHTzlKQl2YBXD2KuU?=
 =?us-ascii?Q?AV2ZwOFKajtcJT0G+6BgcONIWFcwqOHFZ8bK5OfFmWNsnBJEE1+9+AZG/+z8?=
 =?us-ascii?Q?dJwNnyorNFQwOqkqOqBHHoqi4vLx+yZQDnzEqMiOWJj7BL/V2FpvFje178pj?=
 =?us-ascii?Q?J0IEQ5pP63XH8xfdN6XNdXpcM5Lb7tqx8BRJmRtmyc/8t9UIbR0tRPV1AD68?=
 =?us-ascii?Q?yqz+ezRVJ2Xo6twDjqmZIAYQsYV2kDNmTl/23dGz2jCZW10lMBKlIw4LA4yv?=
 =?us-ascii?Q?gRkm82OLVZFQ8lJaZ73XtV/kFYdsOTmyixtJ1u3Gu3nKv13pz8tk89Sb/eYS?=
 =?us-ascii?Q?PdW4V9hm8CoVNqU/yx6J0un0u0mxqr6kA0HZUOYCr0n6ztG5k3uIHm6S06b6?=
 =?us-ascii?Q?0SBih2fDU1Te7CbS2QjeXdU0VPAJQbX4swBHJ1mVMyB7Lmh0ue++Wm+FsUEo?=
 =?us-ascii?Q?ggYMxcdxlEcjujMe0FOy5snzD2fPruW4PGCamztD6zd02UHtJJpKA2VkrZMD?=
 =?us-ascii?Q?II+CtIyQqqiA0mFFOjpesPZnwynFZhTsgqLk9VgrjZiWwXcRFweIZ7fMdWLG?=
 =?us-ascii?Q?24CNOciA+JQ/unB+NAEMxuBvc69sgb5CbTFFuR1zAjapu4Wyk/wQazEeoXo4?=
 =?us-ascii?Q?l8JrmvRqiC4iTLv8l466Ptm0/Be5qaF6WN6N?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:32:32.2103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f2614b-c1a3-435c-cd2c-08ddaf24fb21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Define prepare_selector(), read_protection_region() and
write_protection_region() for arm32. Also, define
GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 254.

Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
Enable pr_of_addr() for arm32.

The maximum number of regions supported is 255 (which corresponds to the
maximum value in HMPUIR).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from :-

v1 - 1. Enable write_protection_region() for aarch32.

v2 - 1. Enable access to protection regions from 0 - 255.

v3 - 1. The maximum number of regions is 255. Thus, regions numbered 0 - 254
are supported.

2. prepare_selector() is modified to ensure HPRSELR is written when accessing
any region beyond 31 and the current value differs from the region number to
be accessed.

v4 - 1. Add R-b, A-b and T-b.

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
index 09326a5248..50f8fe4326 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
 obj-$(CONFIG_ARM_32) += domain-page.o
 obj-y += mm.o
diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/mpu/arm32/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
new file mode 100644
index 0000000000..a4673c3511
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
+ * For MPU regions numbered 32..254, one needs to set the region number in
+ * HPRSELR, followed by configuring HPR{B,L}AR.
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



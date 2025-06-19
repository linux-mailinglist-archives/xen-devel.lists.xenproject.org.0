Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5EAE0391
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019931.1396366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDVE-0008PC-JJ; Thu, 19 Jun 2025 11:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019931.1396366; Thu, 19 Jun 2025 11:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDVE-0008Mr-GB; Thu, 19 Jun 2025 11:32:20 +0000
Received: by outflank-mailman (input) for mailman id 1019931;
 Thu, 19 Jun 2025 11:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SlwS=ZC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uSDVC-0008L0-R1
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:32:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c988dd9-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:32:16 +0200 (CEST)
Received: from SJ0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:a03:39c::18)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 11:32:10 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::66) by SJ0PR03CA0343.outlook.office365.com
 (2603:10b6:a03:39c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 19 Jun 2025 11:32:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 11:32:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 06:32:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 06:32:08 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 19 Jun 2025 06:32:07 -0500
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
X-Inumbo-ID: 0c988dd9-4d01-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVpejLTpk9Pk3OI7SKChB54XbXn5saqZfe72wsdJG1hVxGb2iME6gfI9VEG1fPslqvI23a317DdmVH3pOCaJzPawnA9IS9WiTuYbeZBtQ3nOil9BHKZyjzWObpmPP0okwh27YcxTUN7inih33x50zvDp7b/YJsvcd3EfThHnBd7ELSz6Apjb3OfHTDvmUPxObOkx/GmgCsBZg+8zAwMhkzXvwBt2NxMZ1D8TfwLithByQDcsJjDVIzigYpOU3uu038oRSjg2SUKG4scWSZBOtT5tIhEDIVWwniwgDgrLCV4EmzTqsPE714NCrbq0jjTbac84Jq+FKUgU9mVlXPPssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s4GGT52wwqQbVT7LJgFLwX9PKdeY1TSAVFmN+Or72k=;
 b=ZqRR5Iu4VLAJw8lKzioD98GKYZzHbn4imzkVRlWV9L0wAXw3MsI6lyB6V1GwhHRwasvDL6w1YCbFQ/95QxLfsxs4m0baphQjMxRVYwoSmvaDXxwC9qCQ/egV/NWpawNHH5DRYzqIRZgj10Jb7ieTLGLPElQc9JQDYAXvS9uQtbjgv6p6W0MJgP7qEWqitihHDS5138CIOxv9kbE/BskmkvUC98o8XOGsA8S9ULwo+pdTqzaCIfl3/5tLp7TTklG/+0AZBXEJndJ9SAQIt1ds4YSaCGqAT73GJRlWMF4nV7t2c1sHq6w3PocroVCI1tJjsLm3yo3KC0vT3tjV/CwFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s4GGT52wwqQbVT7LJgFLwX9PKdeY1TSAVFmN+Or72k=;
 b=LPdSqxLxrmXSAt2bQzJUqFuTApXMfan1jDOgwMfzI5k31bnFmO+5E5NKlsMW012AAi2yKDdoSUjNgKEB9om08W28e1yTPp614t5hbOmgX03CeIlEmisjjpu99EOaC6GmK9djzzL1JHQDttl2khEBTgo3d1fDA056pG5eByJcHHA=
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
Subject: [PATCH v5 1/3] arm/mpu: Move the functions to arm64 specific files
Date: Thu, 19 Jun 2025 12:31:50 +0100
Message-ID: <20250619113152.2723066-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
References: <20250619113152.2723066-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: f23a6ed7-7bb7-4356-b3ef-08ddaf24ed9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5+IcqpWyURX2Tcye4Nos3A0IIQthw4saCVoPGQhJLYZHDixabITIGisE+nUD?=
 =?us-ascii?Q?JudPtK9kCn27LWhf5qd6UrA4WYmvhqFxDaxzKQQ4TPRX6kNlxMVaTuP9od/P?=
 =?us-ascii?Q?uOUUONHxXbJP4Ux+CiqAiibvoFlm4tXxbLKGo40mZD/tuZcvXf5F9F29RQsA?=
 =?us-ascii?Q?UHavO4gRBdSwjRIw/Ca5kt5Ax9b+ShmLMxMi252LYsmqXQuBEuHE7ycWklUP?=
 =?us-ascii?Q?oSMG1zU63y+xWgO/8vdESz9rPqHVg3Qb2PIkAiZz5oID05P2H1puDOrSaLud?=
 =?us-ascii?Q?YljPkKyGL/L3bZAgLzmxJJsvHm13SYrQY87NxQwo1vGuA+3W2xvcW46EFcXD?=
 =?us-ascii?Q?vUIl3wkVqNCBudnOv4TnzJaRxev161SEE03F1QjT9U764jk9HsqrvtJElNAM?=
 =?us-ascii?Q?SqfmFvzGAiGH3VxVz0uOuJ+EMCUsAykRMPAUE4bdZ1cQQ2X3f4ZYdAVv5eaX?=
 =?us-ascii?Q?O5Ys7DFz+kIbUXQ/KzW6vRrKi6ouWD9JD2infO/s9ZvJKpnKtV3YvIbyO7/W?=
 =?us-ascii?Q?B0jmcxFnhRKPyvfE0Qi/fAcZk+G0PLk3LkAnO8HBpYNeng6TqRox7SlHLVcW?=
 =?us-ascii?Q?fG8fYlwLlN9NkoHqta+MG7l+2+W77nizwQRNH/WATivgdyJhEpHrOxuHVrsj?=
 =?us-ascii?Q?9dDFHn9JEeVmsAq1coGwB8mubhmSgo2j3BYKYrQtAvefbGwxg3MM8G6Vq8PI?=
 =?us-ascii?Q?BK1k1OPLEq7rkK5LZ94gsWHo69AYLRwrD+0442NQ3vIP4AV3uxtDZsvIWJxO?=
 =?us-ascii?Q?ZwtWU1G7zzZ7Fl+V2MHUWMTJb86cYWWmptrQrfmjSMLUF172aS35qjMjKHqT?=
 =?us-ascii?Q?MCZK/Exa7ldbXoxOamzATdxKQqldvUdsTR/i62qHVt7UF+p2D7A0dd4/RXEf?=
 =?us-ascii?Q?yw2+Wsgm2cj7x/9ULegaUuReQb9WAcCsRXRwBNEENRGoGVROek7Mxjf1ePwM?=
 =?us-ascii?Q?MyGUMOoksO1+2MuE869vED2Ial1sB568jPNOPFY6+OOUBtVZgix7luTIPoJE?=
 =?us-ascii?Q?9R8RHg7aJu41m5RfeI+aHWyMmqte2fduo18gRK/eOos/+6hyLYHhJQ31+l2k?=
 =?us-ascii?Q?IDFYb2kHwDDKE9t9RDNzwtO4S/BYm3UDTj/v36bna8r40Z5bCeYadcfRpI9Y?=
 =?us-ascii?Q?fogPssCX5BwT3mEyPI4HwcfEQFCJmo+C0qAahchio3NPFzGzGhJuBPDQk4JO?=
 =?us-ascii?Q?WoF/LFuM1ORLcvdc/zS8Qvr0TPEsyI/p3OBdm888OHImuc8/PvYCDn1jt3rC?=
 =?us-ascii?Q?6IgMRF5xCuTJaOG8i0J8ytnlhWXfEoNxMFHwPFPAfqDfx/tabCJP+7PQ4Osm?=
 =?us-ascii?Q?c0r/lW4U0EUYx3FTkts/tbC8Ma/NoymlqHeWzTf4F5mv+N3Fal3MFXpedrqX?=
 =?us-ascii?Q?O4EwBFvXjj70fhF+jXHygQds1q+0PU7+4bkbkcQvLwTrRf0Q5zMgykdLT/Xs?=
 =?us-ascii?Q?j1llGywOzKWTZVpwtN9rGrOpDVNBLarCCNRPfWGt1mjeEw1c4MOY5TZpGFqA?=
 =?us-ascii?Q?APF47JyBIBofwoaMN0kKXXdi+gtSzxxu3glQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:32:09.5475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f23a6ed7-7bb7-4356-b3ef-08ddaf24ed9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260

prepare_selector(), read_protection_region() and write_protection_region()
differ significantly between arm32 and arm64. Thus, move these functions
to their sub-arch specific folder.

Also the macro GENERATE_{WRITE/READ}_PR_REG_CASE are moved, in order to
keep them in the same file of their usage and improve readability.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from -

v2 - New patch introduced in v3.

v3 - 1. Add Luca's R-b.

v4 - 1. Reorder entries in mpu/Makefile alphabetically.
2. Add Michal's A-b.

 xen/arch/arm/mpu/Makefile       |   1 +
 xen/arch/arm/mpu/arm64/Makefile |   1 +
 xen/arch/arm/mpu/arm64/mm.c     | 130 ++++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c           | 117 ----------------------------
 4 files changed, 132 insertions(+), 117 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm64/Makefile
 create mode 100644 xen/arch/arm/mpu/arm64/mm.c

diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 808e3e2cb3..09326a5248 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ARM_64) += arm64/
 obj-$(CONFIG_ARM_32) += domain-page.o
 obj-y += mm.o
 obj-y += p2m.o
diff --git a/xen/arch/arm/mpu/arm64/Makefile b/xen/arch/arm/mpu/arm64/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/mpu/arm64/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
new file mode 100644
index 0000000000..ed643cad40
--- /dev/null
+++ b/xen/arch/arm/mpu/arm64/mm.c
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/types.h>
+#include <asm/mpu.h>
+#include <asm/sysregs.h>
+#include <asm/system.h>
+
+/*
+ * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
+ * and GENERATE_READ_PR_REG_CASE with num==0
+ */
+#define PRBAR0_EL2 PRBAR_EL2
+#define PRLAR0_EL2 PRLAR_EL2
+
+#define PRBAR_EL2_(n)   PRBAR##n##_EL2
+#define PRLAR_EL2_(n)   PRLAR##n##_EL2
+
+#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
+        break;                                                              \
+    }
+
+#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
+    case num:                                                   \
+    {                                                           \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
+        break;                                                  \
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
+ * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
+ * used for the direct access to the regions selected by
+ * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
+ * selector is a multiple of 16, giving access to all the supported memory
+ * regions.
+ */
+static void prepare_selector(uint8_t *sel)
+{
+    uint8_t cur_sel = *sel;
+
+    /*
+     * {read,write}_protection_region works using the direct access to the 0..15
+     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
+     * only when needed, so when the upper 4 bits of the selector will change.
+     */
+    cur_sel &= 0xF0U;
+    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
+    {
+        WRITE_SYSREG(cur_sel, PRSELR_EL2);
+        isb();
+    }
+    *sel &= 0xFU;
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
index 3d37beab57..7ab68fc8c7 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -29,35 +29,6 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
 /* EL2 Xen MPU memory region mapping table. */
 pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 
-#ifdef CONFIG_ARM_64
-/*
- * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
- * and GENERATE_READ_PR_REG_CASE with num==0
- */
-#define PRBAR0_EL2 PRBAR_EL2
-#define PRLAR0_EL2 PRLAR_EL2
-
-#define PRBAR_EL2_(n)   PRBAR##n##_EL2
-#define PRLAR_EL2_(n)   PRLAR##n##_EL2
-
-#endif /* CONFIG_ARM_64 */
-
-#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
-    case num:                                                               \
-    {                                                                       \
-        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
-        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
-        break;                                                              \
-    }
-
-#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
-    case num:                                                   \
-    {                                                           \
-        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
-        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
-        break;                                                  \
-    }
-
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -69,94 +40,6 @@ static void __init __maybe_unused build_assertions(void)
 }
 
 #ifdef CONFIG_ARM_64
-/*
- * Armv8-R supports direct access and indirect access to the MPU regions through
- * registers:
- *  - indirect access involves changing the MPU region selector, issuing an isb
- *    barrier and accessing the selected region through specific registers
- *  - direct access involves accessing specific registers that point to
- *    specific MPU regions, without changing the selector, avoiding the use of
- *    a barrier.
- * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx (for n=1..15) are
- * used for the direct access to the regions selected by
- * PRSELR_EL2.REGION<7:4>:n, so 16 regions can be directly accessed when the
- * selector is a multiple of 16, giving access to all the supported memory
- * regions.
- */
-static void prepare_selector(uint8_t *sel)
-{
-    uint8_t cur_sel = *sel;
-
-    /*
-     * {read,write}_protection_region works using the direct access to the 0..15
-     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
-     * only when needed, so when the upper 4 bits of the selector will change.
-     */
-    cur_sel &= 0xF0U;
-    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
-    {
-        WRITE_SYSREG(cur_sel, PRSELR_EL2);
-        isb();
-    }
-    *sel &= 0xFU;
-}
-
-void read_protection_region(pr_t *pr_read, uint8_t sel)
-{
-    prepare_selector(&sel);
-
-    switch ( sel )
-    {
-        GENERATE_READ_PR_REG_CASE(0, pr_read);
-        GENERATE_READ_PR_REG_CASE(1, pr_read);
-        GENERATE_READ_PR_REG_CASE(2, pr_read);
-        GENERATE_READ_PR_REG_CASE(3, pr_read);
-        GENERATE_READ_PR_REG_CASE(4, pr_read);
-        GENERATE_READ_PR_REG_CASE(5, pr_read);
-        GENERATE_READ_PR_REG_CASE(6, pr_read);
-        GENERATE_READ_PR_REG_CASE(7, pr_read);
-        GENERATE_READ_PR_REG_CASE(8, pr_read);
-        GENERATE_READ_PR_REG_CASE(9, pr_read);
-        GENERATE_READ_PR_REG_CASE(10, pr_read);
-        GENERATE_READ_PR_REG_CASE(11, pr_read);
-        GENERATE_READ_PR_REG_CASE(12, pr_read);
-        GENERATE_READ_PR_REG_CASE(13, pr_read);
-        GENERATE_READ_PR_REG_CASE(14, pr_read);
-        GENERATE_READ_PR_REG_CASE(15, pr_read);
-    default:
-        BUG(); /* Can't happen */
-        break;
-    }
-}
-
-void write_protection_region(const pr_t *pr_write, uint8_t sel)
-{
-    prepare_selector(&sel);
-
-    switch ( sel )
-    {
-        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
-        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
-    default:
-        BUG(); /* Can't happen */
-        break;
-    }
-}
-
 pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 {
     unsigned int attr_idx = PAGE_AI_MASK(flags);
-- 
2.25.1



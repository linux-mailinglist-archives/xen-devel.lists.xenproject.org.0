Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A9A75BA6
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 20:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931678.1333898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0m-0005TX-MJ; Sun, 30 Mar 2025 18:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931678.1333898; Sun, 30 Mar 2025 18:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0m-0005RL-Hw; Sun, 30 Mar 2025 18:03:56 +0000
Received: by outflank-mailman (input) for mailman id 931678;
 Sun, 30 Mar 2025 18:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bHYC=WR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tyx0k-0004t7-KP
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 18:03:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2417::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56154497-0d91-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 20:03:52 +0200 (CEST)
Received: from DS7PR03CA0241.namprd03.prod.outlook.com (2603:10b6:5:3b3::6) by
 PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 18:03:46 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::a6) by DS7PR03CA0241.outlook.office365.com
 (2603:10b6:5:3b3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Sun,
 30 Mar 2025 18:03:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sun, 30 Mar 2025 18:03:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:44 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Sun, 30 Mar 2025 13:03:43 -0500
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
X-Inumbo-ID: 56154497-0d91-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8QYrggIAwgdM5V/79FmPE7iEpHnU5Isvem+Rs7ANs+pY2G3T58o9h78tsG2AtCxYFLnXz4PxMUfb7TVSIHgueuSUcGvSpjv9BDWYRytkkinJzTqj+QXpxnvZd5hWM9ycxNFJe/uGzZuumn9RO7b+VWRMbpexCGlu2qwuTOsRhc0pr8t656TnVnfUZnWTmsXMhzln3H2sbnEu1W3YZ7yegwKJMmSHGxOTC5LPRUvKVkErvDJiPY8rukG+sMV55OCAVjkj4kRhIKdr6LLI2JUi7ZEuay9cdiw+BqqhIaSr8x1VbbQMP1SYqiWe7QDoJs4b5RRMHbvlLbFmIun+GXFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf/GhEcDiHJ+LollPuEQtuZXtUaNyWDODoHuvcqw7ng=;
 b=GNPRe+EGwJ0MdQTQCyD33nRZYaNJKgchIMvpOnqPkfSH+t0DYebOYKKXXbLB5ebXJ9zbWhMUpoEzOzB0nTYYHmwN7tOIb2ZwIuw+Ke/Axqy3c/cCectZiDFPWQO8iZWRnhgU5XNBcTXxV4qdw2Zi9cp9O/byp/4yQOgJ9MLmnO3eFBgUUTegxn1Bahzt+gPkzcw9TZqczHslVLu5VU3ItlGjwHp6E/vWpQ/7F4VmLKYWqZ0kVtSpiL8enYgTLSC+O54D9pcYYBBvFAbPZ6A9od7bXrZus2kOS5CN6JzojSnHYwIzrHEtWSi0rHAdTYgFgQFfO/ula6Rd9UgzaFKNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf/GhEcDiHJ+LollPuEQtuZXtUaNyWDODoHuvcqw7ng=;
 b=i4qpbmodabbNRO9atrVzEqBAa24NId4eNfJIQfWsyggraodBAbXpoM8FSW/BnJYRQJR4kI6C5H2Sv1SdAyK8ikYvu90q4A4iXxRiOc5DMtNtviQGQtk+0kiqr9QuUCQrQgrUThOVVN67UvXPCTFGgycuy1JTQj0qMUATTVyzK9Y=
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
Subject: [PATCH v3 3/5] xen/arm32: Create the same boot-time MPU regions as arm64
Date: Sun, 30 Mar 2025 19:03:06 +0100
Message-ID: <20250330180308.2551195-4-ayan.kumar.halder@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: d1873e49-90e6-44ee-9735-08dd6fb536c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|34020700016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qzgPoDHK6pUfDpN0FFh/WrOaih807MqfdcAlqgzQJyIO9pT41Qn0U3FHd7Eo?=
 =?us-ascii?Q?i3G4FPe4KIm189tNYn8OP/944b2VsRhBVmbc+EgOQ8yp24TizbOzZKl/YLIY?=
 =?us-ascii?Q?UsvWaAPHCLjpcxzGToYwchfKnuWoRFletC+gJQoM45WHWHSgmiwWIkuIx8t+?=
 =?us-ascii?Q?Wp5Q7WNdS2myXrK+0PrrglRUQV3Zj2WVGVeNAjSneMraGkJWx/3j7xArJopN?=
 =?us-ascii?Q?t4+8YdV1ufAkHVOvmnVWNOr6c73iHfimXG8fkhvsA+VPCTqHOK5JarsAMQQu?=
 =?us-ascii?Q?31ggmcEn3btgBhaexZT+T5F22xOEQmEVRJKFNHLDmpXjjdNXnIbH2BgeFo6m?=
 =?us-ascii?Q?sW4AgseH2rRFVIsHwUnI24O/DcajNeomqgQhmYkESES8m6MWwxf3Zyp12mHN?=
 =?us-ascii?Q?YMwxnW8Oz3v2bBvnR++KuCrDUoUcpRlHHUAuXqkochpPrrlc5DnRiib9ZgQ/?=
 =?us-ascii?Q?LYSnzVFMQiXJTV7saxQ0jXL7CZFea/cW/025xTCtEqPTyXtyOMWisjgcdyRf?=
 =?us-ascii?Q?9T6han/fwZaqhhEFZmw7p44vRamieairn+/1s8RLYHz2B1b4OqKfaYuvo3y9?=
 =?us-ascii?Q?nggDGZhxfpHXdisd+w1Qed9ZhZ2x5ohep9q8JIKCfN+UTOt8dzUbSBjtIehR?=
 =?us-ascii?Q?M37MsTWKdOKJ1/5qpfmaaR5GEPY0LOKqWEhcKxYK6O1/3eKdbMAMw8SFIyYm?=
 =?us-ascii?Q?acpE5SSCdX0gu+FFhWqNAzZEEc1G8g33vh4pqb18GG2ax+/9WjGy9Jm/dxol?=
 =?us-ascii?Q?e01uYnVHP1OzuOlr0gnsOGpbJowIHxh+JuQ5OwCBy2mrXaKjwY9ffk0TxpRH?=
 =?us-ascii?Q?+3YopS2ZaUcQxIHsD7fqFjHKQKbwcTjRB0VrCT/oVNBPaf3JnnCdgc58bwYr?=
 =?us-ascii?Q?rxxXmWYQ2AwnwOSaixvNDFP/jIwh/+K/Ao36wEzHVGwl2DU/sS7AjjPwh8mV?=
 =?us-ascii?Q?YDbP7ZOWMZJhu/tY9WApssIVsJhVbXtdr2TesUDdnsdi5OTYk+fw2f70H3PX?=
 =?us-ascii?Q?2zDRIotB+ikG38Oh7oFZNnJdKZOC0Vx+ywIrRvYv+O0yuzGnBkgu+ibmSmTy?=
 =?us-ascii?Q?GRA88G4imyXe+U9goZBze3kqx6pc1k36KxXkG/nvp5fmSliSjSxToFemLVLO?=
 =?us-ascii?Q?5tFlnQOOOeji1dxKmlWvJPvoqTuk+k3A2O9Iar9n48Z/TOHxtOfP1gc/CgL6?=
 =?us-ascii?Q?4SWONcrQ0nH/d0XR6kSCqmliWgVDh5SAwCe/QEIKaMleJ8QomeJBDtTUv2j0?=
 =?us-ascii?Q?luJ3onLK/AdNoauD+q857eUEY1inX7hUJjlcCVcrxP5/ygENUzWJaDykX+Qi?=
 =?us-ascii?Q?ajC/GoUDf+vsm93IUfYaARzRiGp3miqXBtLjHCT0ppKclBuwBFQ/gYqwJE+0?=
 =?us-ascii?Q?PsfHtz3qdP+jWSRCVqfU/dTdmw4U6BiSu7h/BV1F25soE2ATYz6qcAcSqV2R?=
 =?us-ascii?Q?v/uvzpfAenwM0/bEb+sbG5cjIYQmdBBHoCF020F6h9SWa3Ij34eRcWTiWgVz?=
 =?us-ascii?Q?SvrGA3urQBuwVHHwG/PAD88WDFbMok27inkQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 18:03:45.4117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1873e49-90e6-44ee-9735-08dd6fb536c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885

We have created the same boot-time MPU protection regions as Armv8-R AArch64.
Also, we have defined REGION_* macros for arm32. The only difference from
arm64 is that XN is 1-bit for arm32.
The macros have been defined in arm32/sysregs.h. Though REGION_NORMAL_PRLAR
and REGION_DEVICE_PRLAR are same between arm32 and arm64, we have duplicated
them to keep the definitions at the same place as the other REGION_* macros.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from

v1 -

1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
being done in enable_mmu(). All the mm related configurations happen in this
function.

2. Fixed some typos. 

v2 -
1. Include the common prepare_xen_region.inc in head.S.

2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.

 xen/arch/arm/arm32/Makefile              |  1 +
 xen/arch/arm/arm32/mpu/Makefile          |  1 +
 xen/arch/arm/arm32/mpu/head.S            | 52 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/sysregs.h | 11 +++++
 xen/arch/arm/include/asm/cpregs.h        |  4 ++
 xen/arch/arm/include/asm/mpu/cpregs.h    | 23 +++++++++++
 6 files changed, 92 insertions(+)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 40a2b4803f..537969d753 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,5 +1,6 @@
 obj-y += lib/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
new file mode 100644
index 0000000000..3340058c08
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
new file mode 100644
index 0000000000..30c901525a
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Start-of-day code for an Armv8-R MPU system.
+ */
+
+#include <asm/page.h>
+#include <asm/mpu/prepare_xen_region.inc>
+
+/*
+ * Set up the memory attribute type tables and enable EL2 MPU and data cache.
+ * If the Background region is enabled, then the MPU uses the default memory
+ * map as the Background region for generating the memory
+ * attributes when MPU is disabled.
+ * Since the default memory map of the Armv8-R AArch32 architecture is
+ * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
+ *
+ * Clobbers r0 - r1
+ */
+FUNC_LOCAL(enable_mpu)
+    /* Set up memory attribute type tables */
+    mov_w r0, MAIR0VAL
+    mov_w r1, MAIR1VAL
+    mcr   CP32(r0, HMAIR0)
+    mcr   CP32(r1, HMAIR1)
+
+    mrc   CP32(r0, HSCTLR)
+    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
+    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
+    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
+    mcr   CP32(r0, HSCTLR)
+    isb
+    mov   pc, lr
+END(enable_mpu)
+
+/*
+ * Maps the various sections of Xen (decsribed in xen.lds.S) as different MPU
+ * regions.
+ *
+ * Clobbers r0 - r6
+ */
+FUNC(enable_boot_cpu_mm)
+    mov   r6, lr
+    enable_boot_cpu r0, r1, r2, r3, r4, r5
+    mov   pc, r6
+END(enable_boot_cpu_mm)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 22871999af..e02c0932e6 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -4,6 +4,14 @@
 #include <xen/stringify.h>
 #include <asm/cpregs.h>
 
+#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
+#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
+#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
+#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
+
+#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
+#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
+
 /* Layout as used in assembly, with src/dest registers mixed in */
 #define __CP32(r, coproc, opc1, crn, crm, opc2) coproc, opc1, r, crn, crm, opc2
 #define __CP64(r1, r2, coproc, opc, crm) coproc, opc, r1, r2, crm
@@ -16,6 +24,9 @@
 #define LOAD_CP64(r, name...)  "mrrc " __stringify(CP64(%r, %H##r, name)) ";"
 #define STORE_CP64(r, name...) "mcrr " __stringify(CP64(%r, %H##r, name)) ";"
 
+#define LOAD_SYSREG(v, name) mrc CP32(v, name)
+#define STORE_SYSREG(v, name) mcr CP32(v, name)
+
 /* Issue a CP operation which takes no argument,
  * uses r0 as a placeholder register. */
 #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index aec9e8f329..6019a2cbdd 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -1,6 +1,10 @@
 #ifndef __ASM_ARM_CPREGS_H
 #define __ASM_ARM_CPREGS_H
 
+#ifdef CONFIG_MPU
+#include <asm/mpu/cpregs.h>
+#endif
+
 /*
  * AArch32 Co-processor registers.
  *
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
new file mode 100644
index 0000000000..cf63730233
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_MPU_CPREGS_H
+#define __ASM_ARM_MPU_CPREGS_H
+
+#define HMPUIR          p15,4,c0,c0,4
+
+/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
+#define HPRSELR         p15,4,c6,c2,1
+#define PRBAR_EL2       p15,4,c6,c3,0
+#define PRLAR_EL2       p15,4,c6,c8,1
+
+#define MPUIR_EL2       HMPUIR
+#define PRSELR_EL2      HPRSELR
+
+#endif /* __ASM_ARM_MPU_CPREGS_H */
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1



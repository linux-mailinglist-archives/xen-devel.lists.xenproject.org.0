Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDE965C5A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786278.1195845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxck-0005cz-Kh; Fri, 30 Aug 2024 09:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786278.1195845; Fri, 30 Aug 2024 09:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxck-0005aS-HB; Fri, 30 Aug 2024 09:08:54 +0000
Received: by outflank-mailman (input) for mailman id 786278;
 Fri, 30 Aug 2024 09:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0tE=P5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sjxcj-0005aM-03
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:08:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2414::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 790e1387-66af-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 11:08:51 +0200 (CEST)
Received: from DM6PR02CA0119.namprd02.prod.outlook.com (2603:10b6:5:1b4::21)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Fri, 30 Aug
 2024 09:08:45 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:5:1b4:cafe::33) by DM6PR02CA0119.outlook.office365.com
 (2603:10b6:5:1b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Fri, 30 Aug 2024 09:08:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 30 Aug 2024 09:08:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Aug
 2024 04:08:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Aug
 2024 04:08:43 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 30 Aug 2024 04:08:41 -0500
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
X-Inumbo-ID: 790e1387-66af-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjTfB40WqiPNzcQfil4ynmTId0bUPvXnA6dn2roRSyZzqLAe/NM8ZCoEmonSQolbjwhZiNUIM/S0tGFvt+NNL0LqsaTP1iycTwOUhqbRU0Xx0/h1wQq9zWzKcqsw30QY00h6uL12XHlNX5X7xrSqHcuiTGAu78p/hXURyAGd7z+4CCVjxx0If2wHSJlIBooewWmFhnXp+e51i7OMlsLXWXEdh0Ldy6ewgGDwjSwIBBMkFBe05JDK8i9/9SNrM8efqCkzL3NOXsYW9rm1N56HCjp+To4Y5KBdXc8x5jxrOjevyHieLSsESGB/GKFFeIT41uWO82h4/OAd9qwHGE/HMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=702JNP648h5o3yeR3PwqBQVSDHl6mLWjy/wWCPQQlwI=;
 b=XbMUqM4wdy7XN6hXswR9H+clxyrd8PvMz/1kwRdh/DLIAdmjjBW15RpgvECtecft5Am5D0JNB2pNJYWwob8VsrvbQbnunZn+tIgTJWB4I6SNMY6UOe0Ky8RCItRKjZsJa6v4YGB3cC3BsG+F7MXk3pjKAPBQYmumMWfEwg5/2JwhWOIoRRlWOSM9fvcJWNIuvw6NsXFTdPvyL9JSucqJE3MO66zV6nMJUhh09nzPAhCxuMz1P3I8nPwGJtKNwvLJECtbDSC+cxB0m7R5S7giGEZY4mT/rqiOySQXCyLTco9Oxf5tvCRoV0Fw3ZBD23rC7By9+4j2sQoJad7KG5mfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=702JNP648h5o3yeR3PwqBQVSDHl6mLWjy/wWCPQQlwI=;
 b=3/6zyJsIfGRRIJSCuAUADZ6dOqrQJrafOtP4vCE+RfFLtTtBAhvSzZ9e+1q0TLy2TDzJWYWjllp+Ur7seBDLM0hHD28Z67xMm1MuI5yrZZCd6IHCGZiYPDaHLi6AZ8E9aIRlE4lT8K5UtlXFUzYgfksLdxNfk6D204/+QB+mvIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5] xen: make VMAP support in MMU system only
Date: Fri, 30 Aug 2024 10:08:21 +0100
Message-ID: <20240830090821.23105-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 6462e23b-05ea-41a2-200a-08dcc8d359e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R/qmzWMs9ZoFZx1J7/8TLBdCqU6EiJuqfQBWcxVvGFNuwtPGTvYc4sKE1F5W?=
 =?us-ascii?Q?l5nxBJcPA2X8lEbrKedu2gqcgfDSieGNUjJJYsEPNnKx2rzuYlziuBJs7kk8?=
 =?us-ascii?Q?3cPrsUVbLz0E3+4hE+KqDXCZwhM8NZcJye+B4ve2w9cG6fxLwUxw4V2yTfYV?=
 =?us-ascii?Q?B0N1tjkBdwk8blV8LnTKA35ndkuy9DIjtPpvfOWT3ew/Ej3R6YCG2kNues1R?=
 =?us-ascii?Q?xPTnJXOepqgbWdHrGp1jc4Ku5ggNAfiz4j0eU8mqNM8ViOP1j2afL8AH1/nQ?=
 =?us-ascii?Q?nsTKUrBexKyKkQ4H6B0pQzK0lDqP269KIwKSjVqfmZCF+jD1z1gCOguPrDPn?=
 =?us-ascii?Q?2qiSmGhd8DfC4nyD2GX7bv//Ym8zkvFloRU867hsGoVyFtvmqHLe4/A+/0qZ?=
 =?us-ascii?Q?qWpkyF+DR3AtKf16hFkDMh3fOazUZCMt+Tdb8QrjmNMFpWGwChTeb75o/Uwt?=
 =?us-ascii?Q?vf6i8uPeU3PuYJXTuAWDde+VYsZSPzE0aFVTEp+UtarIg9w6Js3oFKqPGDbJ?=
 =?us-ascii?Q?bSnYbIXVYySG5NHGuyIHViBqnbZB5q0Hvf6csKbNoPK/kKElJrAonGEFSE6r?=
 =?us-ascii?Q?ovnw7ccEPBzR+smksm7ZzbrY5NImWlsEre66ifBSFB/NFD2DraBFp9DegER3?=
 =?us-ascii?Q?/RjnrQQIwc46CypEeOFJPQnMLraWlo6NnI9zRRPQ2LNCEcIB3mEIJmg4jyTd?=
 =?us-ascii?Q?VVNlJfXKXa1diyD/4WXFC5h+5+kWfCLAcvQh8b6QSj7SbXU13rEvUEGv0vxy?=
 =?us-ascii?Q?k2MKmnb90TCQLnCqjm13zhkyK7SZKuzDfPZzsrw9vZzHX46Y1Pin45FeVwAP?=
 =?us-ascii?Q?bPTazLvHLN4BK20yN9uinDbPnvKbE49O9GmfhR4dX9ASu9LZcBws0MIBJH2C?=
 =?us-ascii?Q?tDf+InPwhbmIK3BVXOfYPTRh0u7ypTQfcITbOsmqDkh8rsTdEL+z7ohVrh63?=
 =?us-ascii?Q?/N/lZXk9HsCvusr2PKF1VgXjPWhQNINrDpHOYEwoc9Hd7p/0GiF7wFEoF2gu?=
 =?us-ascii?Q?NGno86gUN+zF2g3FO5FvYNVqZ8nWBVNcC8um8SPyXOHXygM5a78CX/Q/dERQ?=
 =?us-ascii?Q?e3+512NUJLwOSc+5GSXMJDJPoUscsuXMJTBMghp0HhEIqg3h3fZkBOg5CFQo?=
 =?us-ascii?Q?2WZJXVuLoMaELVTetf6DQMJARsONYPJXNhuE1LoPnLmofO5qY2XecmwDQ/ln?=
 =?us-ascii?Q?6mM6hKqOXUEH3Xiphv/rXsHfPXAM9nyqJA2tHNZ1yGXp69zzxmQ+03/3LBt4?=
 =?us-ascii?Q?iR4Ry6yXpVey/Tw5GIQwFu7efdJP44P99fDUCGL1ON7H9yPDcYnPFMHuZ3tk?=
 =?us-ascii?Q?iGJtR+FkuF93nY0K4JXlms7EZ0NCxDMfdh+TMyKqnUfUJtrb4Jc6TuzjYl5B?=
 =?us-ascii?Q?Xa48PI8SvWXzSFl7usjSRCkLtxTQggytg1z5dR8S79D9bUVnaStqHyW3HRMz?=
 =?us-ascii?Q?fEnRvh/U92oElkPB17DPq8CA/ueSu7vW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 09:08:44.9201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6462e23b-05ea-41a2-200a-08dcc8d359e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147

From: Penny Zheng <penny.zheng@arm.com>

Introduce CONFIG_HAS_VMAP which is selected by the architectures that
use MMU. vm_init() does not do anything if CONFIG_HAS_VMAP is not
enabled.

HAS_VMAP is widely used in ALTERNATIVE feature to remap a range of
memory with new memory attributes. Since this is highly dependent on
virtual address translation, we choose to make HAS_VMAP selected by
MMU. And ALTERNATIVE depends on HAS_VMAP.

At the moment, the users of HARDEN_BRANCH_PREDICTOR requires to use the
vmap() to update the exceptions vectors. While it might be possible to
rework the code, it is believed that speculative attackes would be
difficult to exploit on non-MMU because the software is tightly
controlled. So for now make HARDEN_BRANCH_PREDICTOR to depend on the
MMU.

Also took the opportunity to remove "#ifdef VMAP_VIRT_START .. endif"
from vmap.c. Instead vmap.c is compiled when HAS_VMAP is enabled. Thus,
HAS_VMAP is now enabled from x86, ppc and riscv architectures as all of
them use MMU and has VMAP_VIRT_START defined.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from :-

v1 - 1. HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP.
2. cpuerrata.c is not gated on HAS_VMAP.

v2 - 1. Introduced CONFIG_VMAP in common/Kconfig.
2. Architectures using MMU select this config.
3. vm_init() now uses CONFIG_VMAP.

v3 - 1. HARDEN_BRANCH_PREDICTOR is now gated on MMU.
2. vmap.c is compiled when CONFIG_HAS_VMAP is enabled.
3. HAS_VMAP is enabled from x86, ppc and riscv architectures.

v4 - 1. Fixed the commit message.
2. Added Julien's Ack.

 xen/arch/arm/Kconfig   | 4 +++-
 xen/arch/arm/setup.c   | 2 ++
 xen/arch/ppc/Kconfig   | 1 +
 xen/arch/riscv/Kconfig | 1 +
 xen/arch/x86/Kconfig   | 1 +
 xen/common/Kconfig     | 3 +++
 xen/common/Makefile    | 2 +-
 xen/common/vmap.c      | 2 --
 xen/include/xen/vmap.h | 2 ++
 9 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 21d03d9f44..323c967361 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,7 +12,7 @@ config ARM_64
 config ARM
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
-	select HAS_ALTERNATIVE
+	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
@@ -61,6 +61,7 @@ config PADDR_BITS
 config MMU
 	def_bool y
 	select HAS_PMAP
+	select HAS_VMAP
 
 source "arch/Kconfig"
 
@@ -171,6 +172,7 @@ config ARM_SSBD
 
 config HARDEN_BRANCH_PREDICTOR
 	bool "Harden the branch predictor against aliasing attacks" if EXPERT
+	depends on MMU
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 961d3ea670..71ebaa77ca 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -446,7 +446,9 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
      * It needs to be called after do_initcalls to be able to use
      * stop_machine (tasklets initialized via an initcall).
      */
+#ifdef CONFIG_HAS_ALTERNATIVE
     apply_alternatives_all();
+#endif
     enable_errata_workarounds();
     enable_cpu_features();
 
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index f6a77a8200..6db575a48d 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -2,6 +2,7 @@ config PPC
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
 	select HAS_DEVICE_TREE
+	select HAS_VMAP
 
 config PPC64
 	def_bool y
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 259eea8d3b..7a113c7774 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -3,6 +3,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
+	select HAS_VMAP
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index d0aaf359eb..dee8db45e8 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
+	select HAS_VMAP
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 565ceda741..90268d9249 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -83,6 +83,9 @@ config HAS_SCHED_GRANULARITY
 config HAS_UBSAN
 	bool
 
+config HAS_VMAP
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 7e66802a9e..fc52e0857d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -52,7 +52,7 @@ obj-$(CONFIG_TRACEBUFFER) += trace.o
 obj-y += version.o
 obj-y += virtual_region.o
 obj-y += vm_event.o
-obj-y += vmap.o
+obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
 obj-y += wait.o
 obj-bin-y += warning.init.o
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index ced9cbf26f..47225fecc0 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -1,4 +1,3 @@
-#ifdef VMAP_VIRT_START
 #include <xen/bitmap.h>
 #include <xen/sections.h>
 #include <xen/init.h>
@@ -427,4 +426,3 @@ void *_xvrealloc(void *va, size_t size, unsigned int align)
 
     return ptr;
 }
-#endif
diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index fdae37e950..c1dd7ac22f 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
 /* Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
+#ifdef CONFIG_HAS_VMAP
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
+#endif
 }
 
 #endif /* __XEN_VMAP_H__ */
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F030ACC3E7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004152.1383837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUt-0003Rl-FE; Tue, 03 Jun 2025 10:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004152.1383837; Tue, 03 Jun 2025 10:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUt-0003P1-BT; Tue, 03 Jun 2025 10:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1004152;
 Tue, 03 Jun 2025 10:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMOUr-00037b-Vm
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:03:53 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:200a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2ed149-4062-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 12:03:48 +0200 (CEST)
Received: from DM6PR11CA0044.namprd11.prod.outlook.com (2603:10b6:5:14c::21)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 10:03:44 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:5:14c:cafe::cc) by DM6PR11CA0044.outlook.office365.com
 (2603:10b6:5:14c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 3 Jun 2025 10:03:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Tue, 3 Jun 2025 10:03:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:43 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Jun 2025 05:03:41 -0500
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
X-Inumbo-ID: 0a2ed149-4062-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1B6PPTuxZx6h1pqtMImihxFsGAAos8WkJX1PXw8rND5XkQTKFsT3VL16kQXBf8Io5uQ3atnztoyk2o51PpXjzWRevirbqUTourMeeY4bkwzQq6ECXbxTWFv5PVjwoivwV0e8A+PQBFIBjhLyaIEtmh3TOvPhDZJ7SqVzpqpoF8JFVwB310S7SA1PNEe2xH7i0w/LITy45UOe824LftQqqtwSuW/YGD/ZvjUaTB3ETplek2rl9kdzgsnWrrUeFxF8RiuP2XvbNANzVNM7in8ROyx3tWwryZhnG2phrrYmNyIsX6qL8smNP/eSFtp3QzwxEAB7Ve1z44oT+MXZnGRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr9xf2waTk4UgPXWOt3Ocr7pR0T3lTFOlQg+2lK/858=;
 b=LF34vAqrpTyC7UcbamVAVk+S7dM1KazfnNYjpbotztqsTbBTP2195fmP/mSljCcTAk8bqwmdqgZ99SJdPhGPmnKXQmXM0LJ6F/Gu7Ee5gdgAXzQsIktfWYj66iT380E4LU61zZegijonXZ4eR/cvCLac/WEufj224uJq/LfI+FZ6p18LVGtjnpgmxnDNYcDmOX8f3bIyoXeba6OrVtcU9BL1QcQtGWddvtXvl0ZrGU6NsGnSu26G62Uyc5a5Vjy9f7NEdfanY2tV1ZrwKbZohicHtYCyf7vkOX1VYVsZQ2+k3HFndZyAzCiHcomCCpLlwKV41uQEWP6EQPYWz+JvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr9xf2waTk4UgPXWOt3Ocr7pR0T3lTFOlQg+2lK/858=;
 b=APm4K0G/JabpAbtn9nWLSIbddAcPWnFGi+uCi0sW62eTZDwYzPl0DojJAAFo+0k2/uK09JxDwRaYQByckOKDjEy6btjvylN0PPPWzj46B0Et8goEnCBOJgYnHOdla5YSkEXVtR6OI8MynEMrlqpLy2cc12TkeNijkp4MbCv6HmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] device-tree: Move Arm's static-memory feature to common
Date: Tue, 3 Jun 2025 12:03:28 +0200
Message-ID: <20250603100329.149851-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603100329.149851-1-michal.orzel@amd.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f549d9-e491-4339-647a-08dda285ec9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WnL9fqsvmOUmEJc6smW8JvEYGkmu+qOzO8F3pDzxyZYN1j1FywuuKz9HEXG9?=
 =?us-ascii?Q?/nDk7XP//Aof8W85jwKEdUfOe+MEVXN2+mdVUD1yBq1IZgL9Yo9WZscp/cy5?=
 =?us-ascii?Q?Q8moduzL46DOGWf0G2u7luAI9c9DpXW0VKqWi096yJsXvExwEGjfYzBe9/BA?=
 =?us-ascii?Q?y3H1NxetFXc40FjaJWbyR/hTM3layw8JvGIuvvQ67KevnVvpJXkylwhYk+cV?=
 =?us-ascii?Q?EzOIeMVUI58oojV+38en1u05O+HujCBssKxqZUwQx8V3vJHfzDszPPhIe0nN?=
 =?us-ascii?Q?TkzCSBYXHaGmmfol991ihcBz9WyncwWGOvvLibL2i2U31AqQlukK9NZg8if7?=
 =?us-ascii?Q?ByuNjKv2moU6okMvvqYFsOH+WScRwlgfDxvAwD9y+2urkP3rThnnF52Q4Dm2?=
 =?us-ascii?Q?Qx70RxUFm+26M65AfnlWTEUwthBPcRhjQp0tbHLPfJS4PwKuG4WmL+euWTiz?=
 =?us-ascii?Q?/PI1tijH+FqXI1ul6QzIy9dnigwsQDesGAO+MJqmBS1Nj7AOux+5n4SKT3LK?=
 =?us-ascii?Q?LCni2p4tQRm2GzPfS2+2/8W0kwzs6uEfiom7EssfS7C2OWSvHrKKd6Cf4Xpc?=
 =?us-ascii?Q?e+QC3PFoz0X7djt9V7K9f1bXDQq4hww6AcL11LFs6HC/PV0kRwZqfROv1gci?=
 =?us-ascii?Q?HmRRzKO6wFG+lUkmiy1nF9Fv//mb57guXhL9qMPZll5SEHBbtveRiJilVjby?=
 =?us-ascii?Q?HPEsWhGZAp+xkd9nG1XjM5RCgGNxUb5fxNPxWMVT6LGcvP3jhRHbzmK4MHHJ?=
 =?us-ascii?Q?2WvtDRQdWA1xMadI8/N7n0vx82+6bgR2AOznI2WjqaK59EIKX5TxVxTiozKc?=
 =?us-ascii?Q?DkIW+nypnxxgZlX7NaVve4Myr6DcvhX1dfNu6iyjt+65dOPtEm5BpPd8dj8B?=
 =?us-ascii?Q?dNDEuU3RLgI30LUQ1u/PA5PTLqkT8nf4Fl+smmojlgSokKuf4rYYmbnD+BDK?=
 =?us-ascii?Q?0Iz/EAffxwE4e1/tRbgT6kDcEUNOnkBhTA48PSt6KqsUQGBZjyx0OGM/Uylb?=
 =?us-ascii?Q?rRRcM5u4AxU8HaUylCwqGJ28CRD1ypUk1fdSZVZkChW7WjorBLCf9zjE4np9?=
 =?us-ascii?Q?ymCC2SVKS/wGPe8KcJQ/+2TaQ/G7hqkpTHSUAxGosnp5KJDwAaD4u/whCSRA?=
 =?us-ascii?Q?9dl3V5R6WftMhSyMtIhhmeGeBoPAks9NV6Y1+dD69QbJAe9+HFsZOYC5kgtm?=
 =?us-ascii?Q?AhxhwVaTm2KGuZNAXr47zZpY8g912FKgCzDQ91faHe0Xhne5rL66J0SGqQhR?=
 =?us-ascii?Q?vnoJnw0FtTW+ZObmB+bedVWFpfsBS75HYedd4QE1CbGChmkOza7xczLCAMuH?=
 =?us-ascii?Q?7Er3CuBuDGbFhYIgwJ2KvgZIDu6flV7M4yZK3iXtNAjTz0aYJMMahqoE7LT6?=
 =?us-ascii?Q?UQ9DHKq6Sy2dD+faLdheIoD15gfL2XpSIBpraG6HRdExOZxTunsDcXMHlF82?=
 =?us-ascii?Q?V6V3TejFyLz3h6pRqemJ18TUI8/BuocmZYdJPCC/zjfvMwLJdo2PIpLNsD/Z?=
 =?us-ascii?Q?85txE83EicVZ3fUhFKhe3Kpcx+hLbgoX0l5c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:03:44.0149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f549d9-e491-4339-647a-08dda285ec9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

This feature is arch agnostic, thus move it to common.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Makefile                                    | 1 -
 xen/arch/arm/arm32/mmu/mm.c                              | 2 +-
 xen/arch/arm/arm64/mmu/mm.c                              | 2 +-
 xen/arch/arm/dom0less-build.c                            | 2 +-
 xen/arch/arm/static-shmem.c                              | 2 +-
 xen/common/device-tree/Makefile                          | 1 +
 xen/common/device-tree/dom0less-build.c                  | 6 +-----
 xen/{arch/arm => common/device-tree}/static-memory.c     | 2 +-
 .../arm/include/asm => include/xen}/static-memory.h      | 9 +++++----
 9 files changed, 12 insertions(+), 15 deletions(-)
 rename xen/{arch/arm => common/device-tree}/static-memory.c (99%)
 rename xen/{arch/arm/include/asm => include/xen}/static-memory.h (93%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index eeeac4e653ec..4f080145478d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,7 +51,6 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
 obj-y += sysctl.o
 obj-y += time.o
diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 956693232a1b..f3305e28e9df 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -6,9 +6,9 @@
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/pfn.h>
+#include <xen/static-memory.h>
 #include <asm/fixmap.h>
 #include <asm/setup.h>
-#include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
 static unsigned long opt_xenheap_megabytes __initdata;
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index c1efa1348aee..cded8f2787f9 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -4,9 +4,9 @@
 #include <xen/llc-coloring.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
+#include <xen/static-memory.h>
 
 #include <asm/setup.h>
-#include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a49764f0add9..bcfd686a8b7f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -12,6 +12,7 @@
 #include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/sizes.h>
+#include <xen/static-memory.h>
 #include <xen/vmap.h>
 
 #include <public/bootfdt.h>
@@ -22,7 +23,6 @@
 #include <asm/domain_build.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
-#include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
 #ifdef CONFIG_VGICV2
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 21fd2c3cd4fd..2055b7be0f3f 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -5,9 +5,9 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/rangeset.h>
 #include <xen/sched.h>
+#include <xen/static-memory.h>
 
 #include <asm/setup.h>
-#include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
 typedef struct {
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 57b9e6ca008f..ed11f2c3b42c 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
+obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 39cb2cd5c70e..c8c5a04f24cb 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -28,9 +28,7 @@
 #include <asm/dom0less-build.h>
 #include <asm/setup.h>
 
-#if __has_include(<asm/static-memory.h>)
-#   include <asm/static-memory.h>
-#endif
+#include <xen/static-memory.h>
 
 #if __has_include(<asm/static-shmem.h>)
 #   include <asm/static-shmem.h>
@@ -799,12 +797,10 @@ static int __init construct_domU(struct domain *d,
     {
         if ( !dt_find_property(node, "xen,static-mem", NULL) )
             allocate_memory(d, &kinfo);
-#ifdef CONFIG_STATIC_MEMORY
         else if ( !is_domain_direct_mapped(d) )
             allocate_static_memory(d, &kinfo, node);
         else
             assign_static_memory_11(d, &kinfo, node);
-#endif
 
 #ifdef CONFIG_STATIC_SHM
         rc = process_shm(d, &kinfo, node);
diff --git a/xen/arch/arm/static-memory.c b/xen/common/device-tree/static-memory.c
similarity index 99%
rename from xen/arch/arm/static-memory.c
rename to xen/common/device-tree/static-memory.c
index e0f76afcd8eb..0774d0680604 100644
--- a/xen/arch/arm/static-memory.c
+++ b/xen/common/device-tree/static-memory.c
@@ -1,9 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/sched.h>
+#include <xen/static-memory.h>
 
 #include <asm/setup.h>
-#include <asm/static-memory.h>
 
 static bool __init append_static_memory_to_bank(struct domain *d,
                                                 struct membank *bank,
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/include/xen/static-memory.h
similarity index 93%
rename from xen/arch/arm/include/asm/static-memory.h
rename to xen/include/xen/static-memory.h
index a32a3c6553bc..e445aa80578c 100644
--- a/xen/arch/arm/include/asm/static-memory.h
+++ b/xen/include/xen/static-memory.h
@@ -1,13 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_STATIC_MEMORY_H_
-#define __ASM_STATIC_MEMORY_H_
+#ifndef XEN_STATIC_MEMORY_H
+#define XEN_STATIC_MEMORY_H
 
 #include <xen/fdt-kernel.h>
-#include <xen/pfn.h>
 
 #ifdef CONFIG_STATIC_MEMORY
 
+#include <xen/pfn.h>
+
 static inline void init_staticmem_bank(const struct membank *bank)
 {
     mfn_t bank_start = _mfn(PFN_UP(bank->start));
@@ -46,7 +47,7 @@ static inline void init_staticmem_pages(void) {};
 
 #endif /* CONFIG_STATIC_MEMORY */
 
-#endif /* __ASM_STATIC_MEMORY_H_ */
+#endif /* XEN_STATIC_MEMORY_H */
 
 /*
  * Local variables:
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DEACC3E4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004151.1383827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUs-0003BU-7c; Tue, 03 Jun 2025 10:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004151.1383827; Tue, 03 Jun 2025 10:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUs-00039V-3Q; Tue, 03 Jun 2025 10:03:54 +0000
Received: by outflank-mailman (input) for mailman id 1004151;
 Tue, 03 Jun 2025 10:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMOUq-0002Ov-Qq
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:03:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2009::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb1a64b-4062-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:03:52 +0200 (CEST)
Received: from DS7PR03CA0360.namprd03.prod.outlook.com (2603:10b6:8:55::33) by
 DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.30; Tue, 3 Jun 2025 10:03:47 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:55:cafe::cf) by DS7PR03CA0360.outlook.office365.com
 (2603:10b6:8:55::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 3 Jun 2025 10:03:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Tue, 3 Jun 2025 10:03:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:46 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Jun 2025 05:03:43 -0500
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
X-Inumbo-ID: 0cb1a64b-4062-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYrr3kgPW7dprhxVGTqfpblP9UV2h2bYFipCFJyrR006MoccKaFjd85zO+5TAf3qMiVaAulUhDVXHanC4HKZC84Bf0HDXCwHwZjThGArXIMDiyfVFXSP0WprtkThdiLeNMulsb8/eXl+Wjm7yihmAhDz7qPJ3jmw4CF9XxnOGgFynvslwFQ4ogHhX3DUHnCkxstJHIPdniCxQpgAjBEBth7ja8noT6d4hj9y0YWd8SNbPIMJ0I12bfioXjUq1VbFkgGBzOFWOeimEh3qIL5WvRZg4qpB/bXKIWRaahD0EC+X4GnKTVjPVQSVK7GKeLDjhfkUJLMc5faoJchqzaCjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnHGABcGglclp7hMY6MIJY9pwxZ/mgS16QSPWnOTu6U=;
 b=gVzn31GhpImft3ESWQPJXJ2ONYBzmrRAwMHxPHC+2gxH2aornsx/O5B9LrLkI8G2ngtdyxNodXLQ6Lclf5eS4mowyqV6HoaVGlojpsnMn5qYp2v3+J3wIISegoquQbnitVVn34Bw5g2y90FsFhdqS4sKXZHxmUV+uMYA6JhIux0yzUk88BR0qDWonSjTtaekhaYNUflpQUYSc1kyr3+ZN+JezJddH26ffBG6WTvzd2WQROvgTcGq7xnBywkDvoomusGlpCLbm2FPTIjXPH5Wytlz7RFLEE0hiJQmDrlyopkApZXpSIx2wCcGMwLwVW0K5RKjxivxmotjzQioSnQEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnHGABcGglclp7hMY6MIJY9pwxZ/mgS16QSPWnOTu6U=;
 b=alGj6dlO8jWGv7BUMZ7ql6lTmDPPS4SpTLS30ImzdUqnxtA6hVk5PNlORdk6YnNx4iJze6Sb73hmLWVzk8z6f4X9x1iKGCDlMeGkd11Q9DOMoJc4/21DlL2PqMItf90G9QrTdosJoIt0HRP8ayks9ExitQbpG0T9O39ZhuBZIMo=
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
Subject: [PATCH 4/4] device-tree: Move Arm's static-shmem feature to common
Date: Tue, 3 Jun 2025 12:03:29 +0200
Message-ID: <20250603100329.149851-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250603100329.149851-1-michal.orzel@amd.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0565fbb1-c3b4-4913-2335-08dda285ee4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tKS1xyMj8sY//SiJbeo5HHbpYz4pjtDAu5owu5SG+TQLHPFpNVJ5RlcIWs/v?=
 =?us-ascii?Q?JxuAMi8M5wIBMNYV/RcjsgKHg4xI6M10kWlLnPXq6LXj0d06KVatTNkw8QhP?=
 =?us-ascii?Q?qxrWEtetxI8yaeaVJJeoMCxiz7yT5dX6o7ROPPOxjBOD5ThLNHig2CH5+8wj?=
 =?us-ascii?Q?Bx8kYRgFERuUiQfcBslR4cNWVHvoqeFzhnmf4dOLzv/oeh7h2HownneJS9QA?=
 =?us-ascii?Q?fzxV7j1N0ewWPWdkQo9Zzj3AHeH26yi42uNyGqh4uxwt+Gn1d80kv6YA9qjL?=
 =?us-ascii?Q?m87CnhY9sukqb+T0tqMtUtczeyp/+z/DOU0u7ztEplw6rJlGdgGTGn7ZpGVA?=
 =?us-ascii?Q?D96UsGgnG8sEE+F4BDL6BgYcaOsBvXNX26uIdn4XZNZJiF4wpitNFe5GFeMz?=
 =?us-ascii?Q?GEOpanOX1L7/v/0Fmg9c2FwZulxVsPuU2ah0B4vCzyzezs+LzU5hMayPL9Ge?=
 =?us-ascii?Q?aNWIYxoU2BDLPKZwVD3rqIZzjUYIHW1F019pgfMQFwC1HHvLLpNuqCSCV/Dr?=
 =?us-ascii?Q?aCTYGIbbw4OeQluFpH1VQPF6ry13xu3cfPTxppfuiPuxXvpWEXzE7Rexwbro?=
 =?us-ascii?Q?Ca3wB8Bx3Hj/EjXTYkzGstY52dg/Xx2ESzw6t4JPi5jW/T1xuI1kevLISe+A?=
 =?us-ascii?Q?Ih9jE/n5i8Jj7ZlHtngHQ/OUi+E4q+GhqbPmXzb/EzpiAfnZ/Cz7weM9tWB6?=
 =?us-ascii?Q?IphBNnvQ7HVE8TtbVMjp7I/jfb21ynemPn9jyo32Lvnpe23K0KiRzqRqj0CW?=
 =?us-ascii?Q?AF2tNiGrxz3QdlF8tgLOm/wYjDwNSRExky4EAf1JKXPjdNwHIiz3BeN0M62z?=
 =?us-ascii?Q?SGNzekbQ2Sxwi6NuCJ5Q+DbVwSEdyebtZbSu3rYzmj3GNgF/tFtUOJosXswg?=
 =?us-ascii?Q?XEs7w7oBcpTai8z+fC1x5J9W0GTuTQvceQnB+uL1FTZy7NjZutT9u3+j68mZ?=
 =?us-ascii?Q?z4zmU8T41boMlZPJoT3G8n7Orb4I/wHkuWqDEvvPDXg0voIkUcnOb2XpeyoT?=
 =?us-ascii?Q?pcqEscLDtLjJp+6M365u3usu0w/nYJzyr07iWAgPgLb+SrTUHcXzJerOo++t?=
 =?us-ascii?Q?4LqJl/4xZOl/RqULLofoa3hAfLZ+MwTGiAu8c/gEo1zqZab49MumOggvEJXw?=
 =?us-ascii?Q?TRzR97uOxkxi9x5Wc4ec/zO8V60e9klGo74YX8NGIgNF191pmhKod/G4cjG+?=
 =?us-ascii?Q?CPZsmOcY7bS8/eu+pYg4VrlAtCH67E7KapfGuT6ZVraaT7Xd8J31C5Nq7knG?=
 =?us-ascii?Q?2I48jfrowll7KTfdkLqIv2xDL2G9IeIrkWLNzzP4kz6Y6l2WNK1OOqM6+u9y?=
 =?us-ascii?Q?WXtaD/tfhnbQoy74vh72biACyEkVVA76jJufIBvh0G0DA7Cl2vM9AF+7vd/B?=
 =?us-ascii?Q?EFLceDO+S3TKrk752brKNd0U8OQpZeaxLxm5GlkT1h7NuvDz1HbbxQBn/4Qn?=
 =?us-ascii?Q?IoCRa1xEwsVNxs7VXpRDPv60wcpyQJEIh7T1v6y7DfQf0rGLUBX1zfZOqQ+3?=
 =?us-ascii?Q?/gHtYKjvo/UkceKjoo4IYSn96ubI7scHtw7Y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:03:46.8311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0565fbb1-c3b4-4913-2335-08dda285ee4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139

This feature is arch agnostic, thus move it to common.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Kconfig                                     | 6 ------
 xen/arch/arm/Makefile                                    | 1 -
 xen/arch/arm/arm32/mmu/mm.c                              | 2 +-
 xen/arch/arm/arm64/mmu/mm.c                              | 2 +-
 xen/arch/arm/dom0less-build.c                            | 2 +-
 xen/arch/arm/domain_build.c                              | 2 +-
 xen/common/Kconfig                                       | 6 ++++++
 xen/common/device-tree/Makefile                          | 1 +
 xen/common/device-tree/bootfdt.c                         | 4 +---
 xen/common/device-tree/dom0less-build.c                  | 9 +--------
 xen/{arch/arm => common/device-tree}/static-shmem.c      | 2 +-
 xen/{arch/arm/include/asm => include/xen}/static-shmem.h | 6 +++---
 12 files changed, 17 insertions(+), 26 deletions(-)
 rename xen/{arch/arm => common/device-tree}/static-shmem.c (99%)
 rename xen/{arch/arm/include/asm => include/xen}/static-shmem.h (96%)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 57919d8b3ac8..3f25da3ca5fd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -247,12 +247,6 @@ config ARM64_BTI
 
 source "arch/arm/tee/Kconfig"
 
-config STATIC_SHM
-	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
-	depends on STATIC_MEMORY
-	help
-	  This option enables statically shared memory on a dom0less system.
-
 config PARTIAL_EMULATION
 	bool "Enable partial emulation of system/coprocessor registers"
 	default y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4f080145478d..ab0a0c2be6d8 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,7 +51,6 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
 obj-y += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index f3305e28e9df..4d22f35618aa 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -7,9 +7,9 @@
 #include <xen/param.h>
 #include <xen/pfn.h>
 #include <xen/static-memory.h>
+#include <xen/static-shmem.h>
 #include <asm/fixmap.h>
 #include <asm/setup.h>
-#include <asm/static-shmem.h>
 
 static unsigned long opt_xenheap_megabytes __initdata;
 integer_param("xenheap_megabytes", opt_xenheap_megabytes);
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index cded8f2787f9..a0a2dd8cc762 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -5,9 +5,9 @@
 #include <xen/mm.h>
 #include <xen/pfn.h>
 #include <xen/static-memory.h>
+#include <xen/static-shmem.h>
 
 #include <asm/setup.h>
-#include <asm/static-shmem.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bcfd686a8b7f..20aabf6be5c7 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -13,6 +13,7 @@
 #include <xen/serial.h>
 #include <xen/sizes.h>
 #include <xen/static-memory.h>
+#include <xen/static-shmem.h>
 #include <xen/vmap.h>
 
 #include <public/bootfdt.h>
@@ -23,7 +24,6 @@
 #include <asm/domain_build.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
-#include <asm/static-shmem.h>
 
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 068af31a62db..590f38e52053 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -21,6 +21,7 @@
 #include <xen/acpi.h>
 #include <xen/vmap.h>
 #include <xen/warning.h>
+#include <xen/static-shmem.h>
 #include <asm/device.h>
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
@@ -32,7 +33,6 @@
 #include <asm/cpufeature.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
-#include <asm/static-shmem.h>
 #include <xen/event.h>
 
 #include <xen/irq.h>
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 7ecf5a80315d..eece1370a3cc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -162,6 +162,12 @@ config STATIC_MEMORY
 
 	  If unsure, say N.
 
+config STATIC_SHM
+	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
+	depends on STATIC_MEMORY
+	help
+	  This option enables statically shared memory on a dom0less system.
+
 config STATIC_EVTCHN
 	bool "Static event channel support on a dom0less system"
 	depends on DOM0LESS_BOOT
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index ed11f2c3b42c..13127296cb50 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -8,3 +8,4 @@ obj-y += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
+obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index aa44f5a67c34..9df80291b159 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -13,11 +13,9 @@
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/sort.h>
+#include <xen/static-shmem.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
-#ifdef CONFIG_STATIC_SHM
-#include <asm/static-shmem.h>
-#endif
 
 static void __init __maybe_unused build_assertions(void)
 {
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index c8c5a04f24cb..3d503c697337 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -29,10 +29,7 @@
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
-
-#if __has_include(<asm/static-shmem.h>)
-#   include <asm/static-shmem.h>
-#endif
+#include <xen/static-shmem.h>
 
 #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
 
@@ -505,11 +502,9 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-#ifdef CONFIG_STATIC_SHM
     ret = make_resv_memory_node(kinfo, addrcells, sizecells);
     if ( ret )
         goto err;
-#endif
 
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
@@ -802,11 +797,9 @@ static int __init construct_domU(struct domain *d,
         else
             assign_static_memory_11(d, &kinfo, node);
 
-#ifdef CONFIG_STATIC_SHM
         rc = process_shm(d, &kinfo, node);
         if ( rc < 0 )
             return rc;
-#endif
 
         rc = init_vuart(d, &kinfo, node);
         if ( rc < 0 )
diff --git a/xen/arch/arm/static-shmem.c b/xen/common/device-tree/static-shmem.c
similarity index 99%
rename from xen/arch/arm/static-shmem.c
rename to xen/common/device-tree/static-shmem.c
index 2055b7be0f3f..8023c0a484c1 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -6,9 +6,9 @@
 #include <xen/rangeset.h>
 #include <xen/sched.h>
 #include <xen/static-memory.h>
+#include <xen/static-shmem.h>
 
 #include <asm/setup.h>
-#include <asm/static-shmem.h>
 
 typedef struct {
     struct domain *d;
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/include/xen/static-shmem.h
similarity index 96%
rename from xen/arch/arm/include/asm/static-shmem.h
rename to xen/include/xen/static-shmem.h
index 6a4c33cca8c2..76a49869126c 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/include/xen/static-shmem.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_STATIC_SHMEM_H_
-#define __ASM_STATIC_SHMEM_H_
+#ifndef XEN_STATIC_SHMEM_H
+#define XEN_STATIC_SHMEM_H
 
 #include <xen/fdt-kernel.h>
 #include <xen/types.h>
@@ -82,7 +82,7 @@ static inline void shm_mem_node_fill_reg_range(const struct kernel_info *kinfo,
 
 #endif /* CONFIG_STATIC_SHM */
 
-#endif /* __ASM_STATIC_SHMEM_H_ */
+#endif /* XEN_STATIC_SHMEM_H */
 
 /*
  * Local variables:
-- 
2.25.1



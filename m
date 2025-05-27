Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45129AC4A0E
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997932.1378718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpZB-0008LK-AG; Tue, 27 May 2025 08:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997932.1378718; Tue, 27 May 2025 08:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpZB-0008IO-6v; Tue, 27 May 2025 08:21:45 +0000
Received: by outflank-mailman (input) for mailman id 997932;
 Tue, 27 May 2025 08:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hp9=YL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uJpZA-0008II-61
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:21:44 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dc925d0-3ad3-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:21:42 +0200 (CEST)
Received: from DS7PR05CA0103.namprd05.prod.outlook.com (2603:10b6:8:56::18) by
 IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 08:21:36 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::4f) by DS7PR05CA0103.outlook.office365.com
 (2603:10b6:8:56::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 27 May 2025 08:21:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:21:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 03:21:35 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 27 May 2025 03:21:33 -0500
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
X-Inumbo-ID: 9dc925d0-3ad3-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPfW6FHIi0EOMa1iJwafhJivyP2sCXK7bYjaqWBerQ3Ege+2upNOSG9dGG4n4Hn9tOu17A2bdOHPRwlNi+KfNB+DlE1uZXKsrH1rM6kdMuwrGGuigGQMaVtcd/xQ/eq4mOhDXmURM5vbXk0VIJWawkZM3nbCMWtvHDqe6BkhmMzzYeX72iO22Rb9s2y8fQnIK7DyxI75Scj5XJt5hAfI8YAczhBJkVhG7EMVmvUr2d6DDUpyYO3lecuCF4sieZsp7gkpqZ7ctj3tElPssGY+KKJKunCj1l9umlMgCNf0oegiLBSJ4DkzPP4wJLXHbW428Tw/cflrPYhAATICgvo67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0Z01jTySH/EuzySEtYep7TaxXxwh8oPDWV487W9Gjo=;
 b=XcupaXMNCZ1Jsf3KKG+bmyuWvwzfe4dbhpV17E7KvmXDqnzS/SP552RvBZj90u01MNvKNcwa9N54uIgCKtlc1062C9e7AQNJG0dx2551SxJAeDZenBPHeX+zaWODYbV7zunTqDorgMZ/TYkx4l5EmeWPwEqynmwlfx6h1ax1/Hrpp5DLUwo3X/9H7AdiJ7es6UYENPgB531Xpj3tWprI/jglIQrZi9yMCj/zOeqMCDdcw0zPYb20BiDT2ULKwE6U7AJBRwzVFne7ENiZ+o0Jlxso23LGw2rlYXVZF476b7r3KMh2Id8pSpyr9WPkAYABr9qbQu6+obDOebGSXzhkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0Z01jTySH/EuzySEtYep7TaxXxwh8oPDWV487W9Gjo=;
 b=Fsz3QgLCY18Gq8bxoAUFj5U3vNuVpFjOFEcVT6/QEUGQRZlIA3LzQ5PD0dOXRN0TVoffrxBpOc4mhr+F8jgxWPYT4R0O9CrebnahFCxsOuE8tEffHHE7uYy1gLMVNCugu1EgPoSG/xuel3pWWcOpXjXldYPprUKXrvGufXKr640=
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
Subject: [PATCH] device-tree: Move Arm's static-evtchn feature to common
Date: Tue, 27 May 2025 10:21:17 +0200
Message-ID: <20250527082117.120214-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|IA1PR12MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: db11e12c-15a8-4251-c6e7-08dd9cf77f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M4kGJMApsy61b9c72cHEK7Kfi67wI/0Mh2YdfDwTikTQUFIyYSY2kZca/2uo?=
 =?us-ascii?Q?iEwuaV5rvn5JH/0VCGNSeZii9ifWJrPTTw9ltVA1yD1YO8nWm2EyAS5srtiT?=
 =?us-ascii?Q?8wB5zI1kqNODMM7CZZ7ODFP70G5zdQpkCByofOrKvLVNoEzZ0VIYggYeuVl4?=
 =?us-ascii?Q?fzwMrF35dR3tzUMZYLfzA+hGg07ZGNhQmeYoAXrt8dFBp3fMg6SU5UtOImZH?=
 =?us-ascii?Q?EHnwBksHh9IxeyUhLN6UVlACaDkNmUTtML3jC85mB35AC9JN3ltofOk8kfT6?=
 =?us-ascii?Q?ne9vIdezgBn8XR9PDzxGVrMZcoT9xkIFmENWljOwsWzyAlIxubncfRAOJZbr?=
 =?us-ascii?Q?vC5zlqWlO5vkVIYptxeb3Poa/KxQhllhFp+GhvodRS9NkwsyshP2h91sVfsO?=
 =?us-ascii?Q?p8crPUjx7x5hIZNMER+6pLfgZdUPNuRi74jsA3qqz8XT307qld0KCP3xZaXy?=
 =?us-ascii?Q?xxb1wll8IF9BYx+fc5f1Zz1bd5pnUnO0Cg60/OnNgAalYSnEZqNj8BJnaO3g?=
 =?us-ascii?Q?U8t15G1mO/KxlWCg7+ydwXJTNJqvA1BA6945ErpEzXk26Ena3D/k6XM3/TFi?=
 =?us-ascii?Q?3Ger748O7HUCSgNVy7LzXLdO99YJ1Vw8ZuMTa1ZrT3lHlQWYCqpw+lofnL+8?=
 =?us-ascii?Q?iMduHPDmU5rph2wsFdhUFKMSX7mWb6EhWvOEmFucREFCNujUhOnxuRpxLW/+?=
 =?us-ascii?Q?AfebuaAr8ehb1mmhOsS3pbiSugSUh5w5ymOsuvIqGpDtsF61dk8Ri14WGFP2?=
 =?us-ascii?Q?u0LUFgjuZrFP7P10GN9BGtqC1zOcpRodC+Q5sNvgt8Mf2CRTmJTN2Lfkwsfk?=
 =?us-ascii?Q?wvyrolrxcI6oZLG86RD0Fb5v5Df52pK4cgNqOWgJfBMKxFO9pI//3L7mbBeI?=
 =?us-ascii?Q?YZ/VwilNlJyuJdzuDggDaYeL7p/IKM9t3INggEh8duEjWHDFDr9TxcNT4RQT?=
 =?us-ascii?Q?txEOmOZeXJ395czcg2Rnn0qf9+0xhv4LiMlayoekSGg6+rh3qlyMbBnqoTVp?=
 =?us-ascii?Q?YZZb0LzMt6exViEVIiBvJBBPYlXbpShZsqdHPHEcH5A1vIyoyHIwYavgl89v?=
 =?us-ascii?Q?vdM9ZtSYsQdVYkYnjsDqJPSuYhREbJzZg2a1VL7CanNY+0r6D81iST04m8xw?=
 =?us-ascii?Q?WNp3LQmDljEcaRNS3zC3sH2tnA0kUrFv/cZRb2wFsE1vv0micePKXiBYB4JH?=
 =?us-ascii?Q?aNLWRTSmcwW2+FuBuokdaPn+1AiU88LjUNymDtOfw8QyFOkVFql1EPnQhCdp?=
 =?us-ascii?Q?+eRgwtqFtwKHclydTeLFqOkWPEB8lghRpFwqXDtEPSrqIc4tXTHSwQsPpDor?=
 =?us-ascii?Q?xAFtfDW8toLsXuZ3Yba/NyJxmChdN6nQLtrGWbbj0+5pXsnJhWW/xXk/KuQN?=
 =?us-ascii?Q?CUXOO+lBmg9KrIhHXk7o/ut4jqAz1IijWV1s8vAcx/D3+XYvmwpdh0++Wv+G?=
 =?us-ascii?Q?ARhUw03G3A0jRuRLR2ptlO6wBpSYeDjIVC+iILkFieVYIPTNEZ9k4B9/yz1O?=
 =?us-ascii?Q?LBnZPZxPjF7biUkmP2CAKhbrBRzUH4+/jNY7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:21:35.8604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db11e12c-15a8-4251-c6e7-08dd9cf77f14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7709

There's nothing Arm specific about this feature. Move it to common as
part of a larger activity to commonalize device tree related features.
For now, select it only for ARM until others (e.g. RISC-V) verify it
works for them too.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Other candidates: static memory, shared memory
---
 xen/arch/arm/Kconfig                                      | 8 --------
 xen/arch/arm/Makefile                                     | 1 -
 xen/arch/arm/setup.c                                      | 2 +-
 xen/common/Kconfig                                        | 8 ++++++++
 xen/common/device-tree/Makefile                           | 1 +
 xen/{arch/arm => common/device-tree}/static-evtchn.c      | 3 +--
 xen/{arch/arm/include/asm => include/xen}/static-evtchn.h | 6 +++---
 7 files changed, 14 insertions(+), 15 deletions(-)
 rename xen/{arch/arm => common/device-tree}/static-evtchn.c (99%)
 rename xen/{arch/arm/include/asm => include/xen}/static-evtchn.h (77%)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a5aad97a688e..57919d8b3ac8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -253,14 +253,6 @@ config STATIC_SHM
 	help
 	  This option enables statically shared memory on a dom0less system.
 
-config STATIC_EVTCHN
-	bool "Static event channel support on a dom0less system"
-	depends on DOM0LESS_BOOT
-	default y
-	help
-	  This option enables establishing static event channel communication
-	  between domains on a dom0less system (domU-domU as well as domU-dom0).
-
 config PARTIAL_EMULATION
 	bool "Enable partial emulation of system/coprocessor registers"
 	default y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 129a109d6ec5..eeeac4e653ec 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,7 +51,6 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
 obj-y += sysctl.o
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 10b46d068405..734e23da4408 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -31,6 +31,7 @@
 #include <xen/version.h>
 #include <xen/vmap.h>
 #include <xen/stack-protector.h>
+#include <xen/static-evtchn.h>
 #include <xen/trace.h>
 #include <xen/libfdt/libfdt-xen.h>
 #include <xen/acpi.h>
@@ -39,7 +40,6 @@
 #include <asm/alternative.h>
 #include <asm/dom0less-build.h>
 #include <asm/page.h>
-#include <asm/static-evtchn.h>
 #include <asm/current.h>
 #include <asm/setup.h>
 #include <asm/gic.h>
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3d66d0939738..0951d4c2f286 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -162,6 +162,14 @@ config STATIC_MEMORY
 
 	  If unsure, say N.
 
+config STATIC_EVTCHN
+	bool "Static event channel support on a dom0less system"
+	depends on DOM0LESS_BOOT && ARM
+	default y
+	help
+	  This option enables establishing static event channel communication
+	  between domains on a dom0less system (domU-domU as well as domU-dom0).
+
 menu "Speculative hardening"
 
 config INDIRECT_THUNK
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 831b91399b74..2df7eb27222e 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
+obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
diff --git a/xen/arch/arm/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
similarity index 99%
rename from xen/arch/arm/static-evtchn.c
rename to xen/common/device-tree/static-evtchn.c
index 49db08d5c6fc..8b82e6b3d8a6 100644
--- a/xen/arch/arm/static-evtchn.c
+++ b/xen/common/device-tree/static-evtchn.c
@@ -1,8 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/event.h>
-
-#include <asm/static-evtchn.h>
+#include <xen/static-evtchn.h>
 
 #define STATIC_EVTCHN_NODE_SIZE_CELLS 2
 
diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/include/xen/static-evtchn.h
similarity index 77%
rename from xen/arch/arm/include/asm/static-evtchn.h
rename to xen/include/xen/static-evtchn.h
index f964522f6a62..31ae92741aad 100644
--- a/xen/arch/arm/include/asm/static-evtchn.h
+++ b/xen/include/xen/static-evtchn.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#ifndef __ASM_STATIC_EVTCHN_H_
-#define __ASM_STATIC_EVTCHN_H_
+#ifndef XEN_STATIC_EVTCHN_H
+#define XEN_STATIC_EVTCHN_H
 
 #ifdef CONFIG_STATIC_EVTCHN
 
@@ -13,7 +13,7 @@ static inline void alloc_static_evtchn(void) {};
 
 #endif /* CONFIG_STATIC_EVTCHN */
 
-#endif /* __ASM_STATIC_EVTCHN_H_ */
+#endif /* XEN_STATIC_EVTCHN_H */
 
 /*
  * Local variables:
-- 
2.25.1



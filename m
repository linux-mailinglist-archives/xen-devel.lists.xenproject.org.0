Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C40843F34
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673990.1048630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Qz-0006sA-Uv; Wed, 31 Jan 2024 12:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673990.1048630; Wed, 31 Jan 2024 12:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9Qz-0006qJ-RV; Wed, 31 Jan 2024 12:11:17 +0000
Received: by outflank-mailman (input) for mailman id 673990;
 Wed, 31 Jan 2024 12:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwTD=JJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rV9Qy-0006Ur-PA
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:11:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f7b16e-c031-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 13:11:15 +0100 (CET)
Received: from PA7P264CA0289.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:370::6)
 by PH7PR12MB7793.namprd12.prod.outlook.com (2603:10b6:510:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 12:11:10 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10a6:102:370:cafe::54) by PA7P264CA0289.outlook.office365.com
 (2603:10a6:102:370::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Wed, 31 Jan 2024 12:11:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 12:11:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:11:04 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Wed, 31 Jan 2024 06:11:03 -0600
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
X-Inumbo-ID: d3f7b16e-c031-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIF5jzEZSC9rqRYnowSpYkC33zrExhFS7J6fJxQ0hPz3goYkjZpllFcMVGJro2Sr/yWIiksURzmJvXQCarUG0qwuWQ/seIz3v7rKw+V7nfVeJ2owygfbqIvtlVW2E4PnjYs0m8HAVnuq62Wnny6httsGWy5SbppgGRix0OEl4wRDxWXRFF7DJ4dj1kzXnyAQSWB0BVNnhl4I2f4eDDZv0lqq/f5dvWlZlSIeHt6IVLNPcKwTBb6R2qrnOd/TEFem3cmK/gPU4SLFqm9IOxv+u19ZfLEmVGep0DrsLIsh5BDTpa9zEpR07yOauY15T8HUoTAHs7bnhG+6Oz4Q/PPQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVnAE3Sk2Vh8GnJN0eIurwnYEGeWl1AfkF0U3da74B4=;
 b=BgWB6w8CVhsH+zNVZG+ht64a6M5i17Qn9AXqnAr9agSZW4KQVS86I8lZnO9NlGn6BLF9K8axBWJygIdJbIcjn8Rs0wf0Ez+uVlUrvIJ5HKOHQru+nDX1ymQXO+4NTJIvY2Cp202mtpWA4dqsxM1wt4vAoIaYC00OX0JO1oMGl+No5YRTOhHwyGGEMumBRHounplGsfytO5kzIfKwbL6ks5EhOeXLYfWw442kXvZOQA8TwujrK1xPZKftKh7AHXRPdlogU4wFSh55HOKuteXU3QJUnogu4G64c5KkkzWBnFGeuFyd4y6FHnCN4TtiYqzRanl1a3y99TN8O5mt6PcLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVnAE3Sk2Vh8GnJN0eIurwnYEGeWl1AfkF0U3da74B4=;
 b=Gvc/bx5L2mj3tmhhh8sKBJF/IiSTzDcFcsqvUT10lZuYqrRlYtOx9nq6j/pGfDWfuOhFJ06C5afS+GKXnX8UojdMGZizzs98tx2Pax4VhsmXiXv1h9cIhPK+kdjGfWhVs8Ab+ptz7iuYc7rQKgtwKOxiajGO+PSKTIx0wr4JHaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <luca.fancellu@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation" cmd option
Date: Wed, 31 Jan 2024 12:10:47 +0000
Message-ID: <20240131121049.225044-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|PH7PR12MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fe2a37-613e-424b-7572-08dc2255b541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HwoELydrYRFq+x9h7FaTjtBWWIUO4eRUuR4fOvupvxVVh4HjZR+xcWCLnIUomiVf22cXxNSTm9MUYuUmfnHucTrzL3ZMwHyKs0gqDXJRgKSO2bf7qYp/TTyhOYp5dGOYxbXgEof4VvSSm0RyXzPYrxs4iB/Jt2Fs05mjI6s4GukR4TZlMHIN9vo0wmPp2gKapFHt+/m3NKOTaorG1bY6bKIKdIKyR0HHjUvMv/ee2gjnqgqAJ7TZ7DmDPyo0DMku8stv7ZAxu145uNZSMNd59J3r0SrQ3gbkXcBLPc3PbFsdy4bV3JZiFihIdJgC+srGC3L8m0by1W3JBzXk7fs0k2AYI9zosyo7gEBYK738uNKodwKIgmNP9e7atNVqOsRpqckrU0DiHO3EBfr2dYT0NcYNUrV2+j/Z8WTTDtJeYW/CyXODkf98yFNN6sPiLLsZ4iEKLnYDN56rS9Vm43qJdEtlzWUwcL1X+lKtavZXuNczqGiz0WVuiTk/Ci6Dw8k07Zmq4oFzWmnA00TYw3bregodg4RPeqXYiv+p4ZEly1kbsSwmlH1Q8SJgV1/C6cHxfZeGI+F3ElYtzZOeN58YP0QExbbNYi2jgugOKLWWFLyeqTCLrNRZAwOMV553ZcCDMU37gaOUWsWekvWrZZQlAYEGNNKPYs7pP75ovE/ttAdrDO0RRPX36X1fkypICj9YDweZ3gR5ATY1JQyq+2fUz2mRYWnDpXd1SCBIFQZezL1118gtV/RLclcpkAFmSFw6mJOWlYiouBj1Hd6xQNe1YyJhNiejd78s8XB1Ve7ia6tYFkNeOKD15WruTFsTSG9J
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(316002)(6916009)(356005)(2906002)(40460700003)(40480700001)(54906003)(36860700001)(8936002)(36756003)(8676002)(4326008)(47076005)(86362001)(5660300002)(70206006)(81166007)(103116003)(70586007)(82740400003)(83380400001)(26005)(426003)(336012)(1076003)(2616005)(6666004)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 12:11:08.7829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe2a37-613e-424b-7572-08dc2255b541
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7793

There can be situations when the registers cannot be emulated to their full
functionality. This can be due to the complexity involved. In such cases, one
can emulate those registers as RAZ/WI for example. We call them as partial
emulation.

Some registers are non-optional and as such there is nothing preventing an OS
from accessing them.
Instead of injecting undefined exception (thus crashing a guest), one may want
to prefer a partial emulation to let the guest running (in some cases accepting
the fact that it might result in unwanted behavior).

A suitable example of this (as seen in subsequent patches) is emulation of
DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
registers can be emulated as RAZ/WI and they can be enclosed within
CONFIG_PARTIAL_EMULATION.

Further, "partial-emulation" command line option allows us to
enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
enables support for partial emulation at compile time (i.e. adds code for
partial emulation), this option may be enabled or disabled by Yocto or other
build systems. However if the build system turns this option on, users
can use scripts like Imagebuilder to generate uboot-script which will append
"partial-emulation=false" to xen command line to turn off the partial
emulation. Thus, it helps to avoid rebuilding xen.

By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
This is done so that Xen supports partial emulation. However, customers are
fully aware when they enable partial emulation. It's important to note that
enabling such support might result in unwanted/non-spec compliant behavior.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-
1. New patch introduced in v2.

v2 :-
1. Reordered the patches so that the config and command line option is
introduced in the first patch.

v3 :-
1. Defined a macro 'partial_emulation' to reduce if-defs.
2. Fixed style issues.

 docs/misc/xen-command-line.pandoc | 11 +++++++++++
 xen/arch/arm/Kconfig              |  9 +++++++++
 xen/arch/arm/include/asm/traps.h  |  6 ++++++
 xen/arch/arm/traps.c              |  9 +++++++++
 4 files changed, 35 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18..22c0d7c9f6 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1949,6 +1949,17 @@ This option is ignored in **pv-shim** mode.
 
 > Default: `on`
 
+### partial-emulation (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable partial emulation of system/coprocessor registers.
+Only effective if CONFIG_PARTIAL_EMULATION is enabled.
+
+**WARNING: Enabling this option might result in unwanted/non-spec compliant
+behavior.**
+
 ### pci
     = List of [ serr=<bool>, perr=<bool> ]
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1a..8d8f668e7f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -225,6 +225,15 @@ config STATIC_EVTCHN
 	  This option enables establishing static event channel communication
 	  between domains on a dom0less system (domU-domU as well as domU-dom0).
 
+config PARTIAL_EMULATION
+	bool "Enable partial emulation of system/coprocessor registers"
+	default y
+	help
+	  This option enables partial emulation of registers to prevent guests
+	  crashing when accessing registers which are not optional but have not been
+	  emulated to its complete functionality. Enabling this might result in
+	  unwanted/non-spec compliant behavior.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 883dae368e..9a60dbf70e 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -10,6 +10,12 @@
 # include <asm/arm64/traps.h>
 #endif
 
+#ifdef CONFIG_PARTIAL_EMULATION
+extern bool partial_emulation;
+#else
+#define partial_emulation false
+#endif
+
 /*
  * GUEST_BUG_ON is intended for checking that the guest state has not been
  * corrupted in hardware and/or that the hardware behaves as we
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9c10e8f78c..d1c7a6c516 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -42,6 +42,15 @@
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
 
+/*
+ * partial_emulation: If true, partial emulation for system/coprocessor
+ * registers will be enabled.
+ */
+#ifdef CONFIG_PARTIAL_EMULATION
+bool __ro_after_init partial_emulation = false;
+boolean_param("partial-emulation", partial_emulation);
+#endif
+
 /* The base of the stack must always be double-word aligned, which means
  * that both the kernel half of struct cpu_user_regs (which is pushed in
  * entry.S) and struct cpu_info (which lives at the bottom of a Xen
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F1874F49
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689875.1075286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD35-0006H7-OT; Thu, 07 Mar 2024 12:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689875.1075286; Thu, 07 Mar 2024 12:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD35-0006Eo-Kx; Thu, 07 Mar 2024 12:40:35 +0000
Received: by outflank-mailman (input) for mailman id 689875;
 Thu, 07 Mar 2024 12:40:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3qa=KN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1riD34-0004ja-GF
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:40:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37bdc99-dc7f-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 13:40:33 +0100 (CET)
Received: from SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21)
 by CH3PR12MB8971.namprd12.prod.outlook.com (2603:10b6:610:177::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 12:40:31 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::82) by SJ0PR05CA0106.outlook.office365.com
 (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6 via Frontend
 Transport; Thu, 7 Mar 2024 12:40:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:40:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:40:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 04:40:28 -0800
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 7 Mar 2024 06:40:27 -0600
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
X-Inumbo-ID: e37bdc99-dc7f-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLdhMBlV9KCAe5MtTnpRljroS+gFNScAwnuuIijc2rQuS1Tq/wB8ikNVkfTBVV+OOmJVOHBH8NpzLd+U+8VGWlnJOoRmYNTOF5yFZm+80nNXDtWxWdY7fqrx/utuNH0bKxpaFIzH0F/j7gBl2N8hZIkAEnMaITgzHHTV8bsWOTqykPcG137WrNWXS8GM6DcRqF6jlD8Ppv/DpLSCkyGR8QOCQ1Odx2hz8FTDcEYplXqkYS9MctzSjVlha87LqRQM3sNwl+xr1DaAPNrwShaoI8T7ONFFOXX2k4zblhGEnDXE2Lmnjg+hseMyPaPKmaMJ6w8nw1sajP/fgjbCdyuA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMIOVJVSy6u/LzekxPUJWc7zfls/wR2k+xzI6m7KP7g=;
 b=MYK7FyQSwFSS0MHIBiekvZBs7MiTLmk8EPZ4L14Be2Zy4DIVYa4y/ntQFEaPCreN122Et8XQJi5nqOyBsQv3dBXYU9hg0M1RsIpLLjP5wuOeJGs+MYUFaxsdQTCYmnIfixJdzxbMv1kcYCkG+HQN8uV7EWQh38QZ1H5Si/68fVvmnsqrGbksiDOFKyEgxfuU3wDd8xQR7CmYThU78GNSl3NqwPstUZOd9bm+nNFeRlaX+B9xUov7SsLrcPGlxkO2Q8q+31oC3NnT33clul5znU6lAUijBi05hCQB503y6XX9HxWtTQ1KoUJB5wkKeLG125+2AI+tCCQ5rY5yEcXxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMIOVJVSy6u/LzekxPUJWc7zfls/wR2k+xzI6m7KP7g=;
 b=0vNuLyR4D/PTyHe09kSmUxygCkxesztwC5HVozByBY6AKtnhX/myL7160vB3u7o1wsx987HuZLIACOVHpfqEp8++F0xNpekTXoOETbDttgVNatxNU4pnnfI+fgJysoG0KCgAbanLJEd7TNLPDkkBA8iUIH7fqdCIqkBRPPvkfKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation" cmd option
Date: Thu, 7 Mar 2024 12:39:41 +0000
Message-ID: <20240307123943.1991755-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
References: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|CH3PR12MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8503de-184a-4303-da77-08dc3ea3c5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	59WKqOGY8lE0yAdkhnk9z7uaufBuS7swX3HL6qbM0elxFO2PGyZf7kpiol6jFjTBHEelD3DbDgUESODrSOQXJiOaKGOmpS+JhbCcT6XlnnpOCBC1yJs+w/zlr1/ZhtNVXCOGKzOR9eFP0dMDSnS5F0f+hS91kjTehHKrgOoB8OYnRa6YhlvaI1B2/aEzCKS/iOc8vQbU0598Th9nuWSlnt+ZmVanjc73feoHp+L5v60FKgkuLfFn06F5aj5/+G5tBI0nX63z3Yl4sS8q0F6nd9reqrnMxpj3G0732viOTm0PrB7M5SSapI79lY7dzl5ycmcWK5Cd3KKK5BNH7MPcRN5nmFyB9f1wSTGyFYJV/X62bQhd61f06GhOmYwVGDMhZoSvZbULBMZFysT8g/+nJRPZdr24KHPN6LwR0Z5WC5kXUBrDxGB8cjRM1iv50P/n/a/Zptt9ejlFzTs7sCQia5geo45pfWNSXv07oX9XboPGT5sAJrL2821mfySZ5KVW53Winq0PSpUB+9ZmYo86GkXSJyrsXKO4ThLTdR+yGomOh2KazJi4heWOeInmx8/3iyeMKYRz7Nmx/quBst7/Rixx/2A+76cdhktHG5viQ4Uvyraqvmho14X2u2+7PP5lWbOai+BNlvkB2cNfogrhLpUk2b2shPYH0dVdb7hLZ4K2hEosM2yAk/oiJtPL/64TUEfo1w9JO/QbqPTMO2AnK/cwaqXw9/ayQ65POJlgBHNOhWGAfoR0y6tYjo6dQjBu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:40:29.8407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8503de-184a-4303-da77-08dc3ea3c5da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8971

There can be situations when the registers cannot be emulated to their full
functionality. This can be due to the complexity involved. In such cases, one
can emulate those registers as RAZ/WI for example. We call them as partial
emulation.

Some registers are non-optional and as such there is nothing preventing an OS
from accessing them.
Instead of injecting undefined exception (which might result in crashing a
guest), one may want to prefer a partial emulation to let the guest running
(in some cases accepting the fact that it might result in unwanted behavior).

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
"partial-emulation=true" to xen command line to turn on the partial emulation.
Thus, it helps to avoid rebuilding xen.

By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
This is done so that Xen supports partial emulation. However, customers are
fully aware when they enable partial emulation. It's important to note that
enabling such support might result in unwanted/non-spec compliant behavior.

Added a note in SUPPORT.md to clarify the security support for partial
emulation.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---

Changes from v1 :-
1. New patch introduced in v2.

v2 :-
1. Reordered the patches so that the config and command line option is
introduced in the first patch.

v3 :-
1. Defined a macro 'partial_emulation' to reduce if-defs.
2. Fixed style issues.

v4 :-
1. Added a note in SUPPORT.md.

v5 :-
1. Dropped R-b
2. Update the commit message and Kconfig message.
3. Update 'SUPPORT.md' message.

 SUPPORT.md                        |  9 +++++++++
 docs/misc/xen-command-line.pandoc | 11 +++++++++++
 xen/arch/arm/Kconfig              |  9 +++++++++
 xen/arch/arm/include/asm/traps.h  |  6 ++++++
 xen/arch/arm/traps.c              |  9 +++++++++
 5 files changed, 44 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 7eb6875cfa..b49da114ab 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -102,6 +102,15 @@ Extension to the GICv3 interrupt controller to support MSI.
 
     Status: Experimental
 
+### ARM/Partial Emulation
+
+Enable partial emulation of registers, otherwise considered unimplemented,
+that would normally trigger a fault injection.
+
+    Status: Supported, with caveats
+
+Only the following system registers are security supported:
+
 ### ARM Scalable Vector Extension (SVE/SVE2)
 
 Arm64 domains can use Scalable Vector Extension (SVE/SVE2).
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 02896598df..023c5e7225 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1942,6 +1942,17 @@ This option is ignored in **pv-shim** mode.
 
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
index 40f834bb71..f8139a773a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -234,6 +234,15 @@ config STATIC_EVTCHN
 	  This option enables establishing static event channel communication
 	  between domains on a dom0less system (domU-domU as well as domU-dom0).
 
+config PARTIAL_EMULATION
+	bool "Enable partial emulation of system/coprocessor registers"
+	default y
+	help
+	  This option enables partial emulation of registers to prevent possible
+	  guests crashing when accessing registers which are not optional but have
+	  not been emulated to their complete functionality. Enabling this might
+	  result in unwanted/non-spec compliant behavior.
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



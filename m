Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CFE85BBBA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683467.1063011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP4a-0000xh-SW; Tue, 20 Feb 2024 12:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683467.1063011; Tue, 20 Feb 2024 12:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP4a-0000vL-P5; Tue, 20 Feb 2024 12:18:08 +0000
Received: by outflank-mailman (input) for mailman id 683467;
 Tue, 20 Feb 2024 12:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7zC=J5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rcP4Z-0000eL-6q
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:18:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19998b1e-cfea-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:18:06 +0100 (CET)
Received: from DS7PR05CA0018.namprd05.prod.outlook.com (2603:10b6:5:3b9::23)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 12:18:03 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::65) by DS7PR05CA0018.outlook.office365.com
 (2603:10b6:5:3b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32 via Frontend
 Transport; Tue, 20 Feb 2024 12:18:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:18:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 06:18:01 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 20 Feb 2024 06:18:00 -0600
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
X-Inumbo-ID: 19998b1e-cfea-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dT6qtKa1jn2HtlsPJY3QrZixOO6HpPIQOk9L/HFzls2TfJaMb2DZfs161H6Wgy5j3zlGG1SprKm7mdGOknqmEqj06bulb3PrGP88FLLBspvT55UKRZzFz/zyX+IAYJ+nJBsD103qlx9V7thUPl4YwhkVS0QZW/ewXVtjc2BP24OuX6xSi3Mm/aNdqdzhSrbNjcKhEl3OeT4NDunJWSYygh3ZVPjtMCx8XbZ/MDpRJEMfKipLjpOCXM2WK84jAREvJN0AVoEu3WFpIzke2Jaedl4DXphlJT8MGRk/xigDUmQLGKmvVY7nH35q1PKCmi/k9gHVDGTiiWe/Fmjfa9pCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EETal9k4inYY30L6I7esCkTiZAi5uczUE8BepjuzslE=;
 b=HlzR6PCqALmq8oAtDX1J8PnEaKCMTMm5P8nZzioJnTtvzd0N9yqEUVwcWQhINxhaphs9Fv96MCfF3frwCcyQ57mkPJ1FgCJ4nW7kWDxued/e5rOPD8up/NuVk5iSUboCLB8W7Xdea+L+/wiBXX0AKDyHoXGDv1uDJd812/nVehYq4xT/YSu1vVEioVmE/mbZkAANxibpv1X8DbClv3QYerspBjyrRBD4X0EC5d370Tgd5nCLHWVzDgmwuDuzGfb1jmGUNsECaopaMGhUNk04ogUhRxI78R2a/pkeqyKRhjI10zjumohPLOgI2Pqjw/snKRSH4IKsbu0aFq8Q+bn7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EETal9k4inYY30L6I7esCkTiZAi5uczUE8BepjuzslE=;
 b=HDAL8Gh49RH+c1UjsiJT07FgZYCz32mIHvGEEIn0Z0SSt+bZcLQOTf+b78kG4gS6R3aeoKvEJQUwhW/yqDI1G2DcevHQde+1c+DpoLBUI/hBQDG+CklbKBSNON2WhYUSbvr+FUs9fmN12GpPwfJgG+G16gmJeycUt6AVpkJitH4=
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
Subject: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation" cmd option
Date: Tue, 20 Feb 2024 12:17:41 +0000
Message-ID: <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: c1916796-d8fe-4ce8-20a5-08dc320dfc6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	we1UyW+4gi0X5d2+VXFcmabEEwPPHq/c+XQR4xwMzGsQjS4YrTIX7x+AjlHo2KmlwtstXGhgi7hONjEr63kyFoaHiGt2eA9ornWm0dGVCVOP3XdZtpd/IL3Bt9toTx8j9cUaHuXu4f1rtCVnEMJQ9tLoKWfzYq8avZR4uPdVzOZnAIhQgtftrNnRF+euIf3WshI3b9OCKhGAtg10sBZdCGQeh91B0pSw7z9hD2x0fJXEEBmU3qt7ja/4WAqn0LBMSniXXyhmN9AKFuR84dl0iXZy0OYIdu9DVLs2sdbBGZiy1+KOC8MCkwMECAxzvGoHMCzzgYgqfF2kB+xL6tBKqj4iUYVJySa58ncZdkryVO/WLes21BnBn1CipsW9bPMy4O/9purFbzqlo4cCe4owhC9GRPsrEhZQ9Bb8XMYmvIxAwAogbbowFZeguSqtwYk3NUxX/sALvXlyesYrlNULaabaMz1CyFXAfNv4+hkM47c1M+Cjps1F2bRINcJ8dGME78z/Ug6b4EMUhiK019OU1jSLpek5NdXNXHley9nQma5d8C5jc3ciI3i5eHZE6gqwqJVLGn74dL4ha+komapbFIaPLfbP2retrQBwCTnTmSRzRZHj2Ikq+O6Hg2BMSLojKEjOmeas6pY6EJhCaxNn/iCsQXuaYQDoGMFfF+Yxo7k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(230273577357003)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:18:02.9673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1916796-d8fe-4ce8-20a5-08dc320dfc6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
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

 SUPPORT.md                        | 12 ++++++++++++
 docs/misc/xen-command-line.pandoc | 11 +++++++++++
 xen/arch/arm/Kconfig              |  9 +++++++++
 xen/arch/arm/include/asm/traps.h  |  6 ++++++
 xen/arch/arm/traps.c              |  9 +++++++++
 5 files changed, 47 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index a90d1108c9..037578b10c 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to support MSI.
 
     Status: Experimental
 
+### ARM/Partial Emulation
+
+Enable partial emulation of registers, otherwise considered unimplemented,
+that would normally trigger a fault injection.
+
+    Status: Supported, with caveats
+
+Bugs allowing the userspace to attack the guest OS will not be considered
+security vulnerabilities.
+
+Bugs that could compromise Xen will be considered security vulnerabilities.
+
 ### ARM Scalable Vector Extension (SVE/SVE2)
 
 Arm64 domains can use Scalable Vector Extension (SVE/SVE2).
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index be76be8d53..0cac601066 100644
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
index 50e9bfae1a..dc243f4124 100644
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
+	  emulated to their complete functionality. Enabling this might result in
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FF8252B4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662143.1032077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiHb-000324-MA; Fri, 05 Jan 2024 11:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662143.1032077; Fri, 05 Jan 2024 11:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiHb-00030L-I9; Fri, 05 Jan 2024 11:22:35 +0000
Received: by outflank-mailman (input) for mailman id 662143;
 Fri, 05 Jan 2024 11:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BO+=IP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rLiHZ-0002gg-HS
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 11:22:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a01b58-abbc-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 12:22:32 +0100 (CET)
Received: from BL1PR13CA0257.namprd13.prod.outlook.com (2603:10b6:208:2ba::22)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Fri, 5 Jan
 2024 11:22:29 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2ba:cafe::25) by BL1PR13CA0257.outlook.office365.com
 (2603:10b6:208:2ba::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.10 via Frontend
 Transport; Fri, 5 Jan 2024 11:22:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 11:22:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 05:22:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 05:22:28 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 5 Jan 2024 05:22:27 -0600
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
X-Inumbo-ID: b7a01b58-abbc-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMVBRpn8645p/6azceEfdPkUaEUUuvqtckF86NsCni8cavGjmhXrdvLyMpm3Y8Bwk3Uhd46JteV9yPyjbt3Yzro4WSCSV33JvjXXnzrJyGgRvA1wqVbHev7FaAC5yeNllvVq2BghWYq4QTDJwkM0Oj5Ur3yyKo/CEy12dFMMKLD0if5zRAVimw5PyeI/Pr5qigX0SAIFp3KBzVkKVmHO98Gj6zG53CKnuCRWapCSA0Beu/KHF22Ifj2z6JGj5VPvp/goL7Vmp3Nc+qLpRy7o8q3NxyXJ2Oe2Cx0DUsWkw95kuJTmjkErH5lCi1oA+9QanT3YXYQ6FpudFMHmcMKt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIDvVmOkKFngVRiJ+yzMlRj3x/lbGAVWUO/0Wysz9hM=;
 b=jlMmg3PHSkRtoeQeprCYj9tU0az1avOJfjfiEoHDjpBwNnzf6O9xcY0Ki4Yx0FHJPBey7uoAo76Eti9UeugzeHeSPpx43bsg8JxYo1CUqYrCCk0B1yCxmoUhIZcUfZnvHhgLXOIx43pgWDUWcIrKM+O8uFI+th5px99ZRRrYr99V7hAA2+PcJL6hftV6Wqh9aohNOcaWYdxMwGxfHeMAzGHO4zRXVZTsJLsL7q+23hmPWB4peFMXL1hTWZZ71EPypbxPQcdDyjvNEVBbMmMRKGAe6xuVCMKiOBmrkm5SBUKJat3L8Uzd0U8irI2JumUrZwVr+974NS3IAKOBn3ZcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIDvVmOkKFngVRiJ+yzMlRj3x/lbGAVWUO/0Wysz9hM=;
 b=AB2rsWYTrAGZsxnuJyzufHWLhhrmHh6+PgaWbSZVJDIOnnr+tKDCg3A01pNDoueGOQo7IIQDofTy8WWRuoKLXmBXdwrRYLF4LAdujFQtxJvWlfqfeOli3v2TKNoTz5dC5YCQ7OnDq8zxxZlhLwjlMPKxna18z/tiBinhtd3mELs=
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
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v3 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation" cmd option
Date: Fri, 5 Jan 2024 11:21:54 +0000
Message-ID: <20240105112156.154807-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
References: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ef1c4d-3c84-4804-0729-08dc0de09a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/cHKAoeBxEBXOczf5GlfLHWLxqr5FPMelFMl0hxq/v6NlsfJm0ntBbrU+j4n5ChrhGT/cQKs0svZGCw5LnDOIHidJaMFuzXeFqHx9PBE65BRJzekdIuAI1ttQ5V57yhP1yMutigS3UXGS22TRYu3HJ9BlrTDKZgnkA+lPnumu7XiI9jXlNn90Rb8d0zSYrX6bXlF0P3LCgojrS8fQLEh2oQi8Gzrzdt/eSpV9aqjQwdnUFv9AslErZC+CrQYz4MWUECE5RGcI8EvImtxxA4he++JZl5426yTQVbOh2mPMPwkDvsYyVcazA7YzIgJ7x2aAn0A/J/a5SwmSROa1LeE03X5/9S4ZnAmf3Z6dMXhLOTM4lRlA9Bp7ZpG0nFVo6aG5Sv0cqRBo6EC1KpsAD5RIYcy89Bd+RFRLES7pGw9CVe8a1lVevksMU1rmlQ6/tPYJLp1NmfW/DVvQTFba5wjWJ7JlmAwTMC8bZFJrOC2fozwwgdX6ctbuNLVpYUjmxbVSEAASxrpY6U45mKdnqkITxfE+6tHf4Wn6GbwPWo+lVDMb+1QUhHPh0nDSh+LoJnzIJ6s4MPrPARt+fh/tW3g2Njk+ZPbvPBcnzDjP9fpVwtRe4MO+cdxfMcYRqFWICBn4sg1TVlAxqB5wYUc9yR5Jog+LoBNGuVsUvfNtK7sx4j3cMI7/NveYGeWY+2SVen/6hhO25cqzfZ4pHPjPXkprV18x4h4TRumyVROBS5W6Z+8uERatDVGIeA8pSvRgK3q7weWQWL1WkQuXcAsWc8qEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(40470700004)(36840700001)(46966006)(41300700001)(36860700001)(83380400001)(47076005)(82740400003)(103116003)(86362001)(356005)(70586007)(4326008)(54906003)(70206006)(81166007)(8676002)(5660300002)(316002)(2906002)(26005)(426003)(1076003)(336012)(8936002)(6666004)(2616005)(6916009)(36756003)(478600001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 11:22:28.9907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ef1c4d-3c84-4804-0729-08dc0de09a2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226

There can be situations when the registers cannot be emulated to their full
functionality. This can be due to the complexity involved. In such cases, one
can emulate those registers as RAZ/WI. We call them as partial emulation.

A suitable example of this (as seen in subsequent patches) is emulation of
DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
registers can be partially emulated as RAZ/WI and they can be enclosed
within CONFIG_PARTIAL_EMULATION.

Further, "partial-emulation" command line option enables us to
enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
enables support for partial emulation at compile time (ie adds code for
partial emulation), this option may be enabled or disabled by Yocto or other
build systems. However if the build system turns this option on, customers
can use cripts like Imagebuilder to generate uboot-script which will append
"partial-emulation=false" to xen command line to turn off the partial
emulation. Thus, it helps to avoid rebuilding xen.

By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
This is done so that Xen supports partial emulation. However, customers are
fully aware when they enable partial emulation.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-
1. New patch introduced in v2.

v2 :-
1. Reordered the patches so that the config and command line option is
introduced in the first patch.

 docs/misc/xen-command-line.pandoc | 7 +++++++
 xen/arch/arm/Kconfig              | 8 ++++++++
 xen/arch/arm/include/asm/regs.h   | 6 ++++++
 xen/arch/arm/traps.c              | 3 +++
 4 files changed, 24 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18..dd2a76fb19 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1949,6 +1949,13 @@ This option is ignored in **pv-shim** mode.
 
 > Default: `on`
 
+### partial-emulation (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable partial emulation of registers
+
 ### pci
     = List of [ serr=<bool>, perr=<bool> ]
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1a..8f25d9cba0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -225,6 +225,14 @@ config STATIC_EVTCHN
 	  This option enables establishing static event channel communication
 	  between domains on a dom0less system (domU-domU as well as domU-dom0).
 
+config PARTIAL_EMULATION
+    bool "Enable partial emulation for registers"
+    default y
+    help
+      This option enabled partial emulation for registers to avoid guests
+      crashing when accessing registers which are not optional but has not been
+      emulated to its complete functionality.
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index f998aedff5..b71fa20f91 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -13,6 +13,12 @@
 
 #define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == (m))
 
+/*
+ * opt_partial_emulation: If true, partial emulation for registers will be
+ * enabled.
+ */
+extern bool opt_partial_emulation;
+
 static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_ARM_32
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9c10e8f78c..d5fb9c1035 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -42,6 +42,9 @@
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
 
+bool opt_partial_emulation = false;
+boolean_param("partial-emulation", opt_partial_emulation);
+
 /* The base of the stack must always be double-word aligned, which means
  * that both the kernel half of struct cpu_user_regs (which is pushed in
  * entry.S) and struct cpu_info (which lives at the bottom of a Xen
-- 
2.25.1



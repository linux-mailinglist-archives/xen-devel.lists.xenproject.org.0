Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4ED136A2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200489.1516396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJS0-00022g-Sr; Mon, 12 Jan 2026 15:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200489.1516396; Mon, 12 Jan 2026 15:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJS0-000200-P5; Mon, 12 Jan 2026 15:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1200489;
 Mon, 12 Jan 2026 15:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1UP=7R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfJRz-0001lb-32
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:03:23 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4d9e88a-efc7-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 16:03:20 +0100 (CET)
Received: from BL1PR13CA0341.namprd13.prod.outlook.com (2603:10b6:208:2c6::16)
 by BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:03:16 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::c5) by BL1PR13CA0341.outlook.office365.com
 (2603:10b6:208:2c6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 12 Jan 2026 15:02:58 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 15:03:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 09:03:16 -0600
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 07:03:14 -0800
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
X-Inumbo-ID: d4d9e88a-efc7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIOWvf9llHrf7CgvOdcvbewC39l5qyE+5XP3vn/8qku5mGjLxXrSxkOpwtJ7siop2of9eWACBoecvuUhU18rPLPZnkvwaKLn3mjyxPAGDStaTVG0uOVihkEKS4se6a0Bh76WtO/JWCWS4bwCLiNrV9Ygy9vCzcmv/bniObvKRsgdr7WdtnzVaB31paa5LK20kBKBGYKN9zfNi88Sr2oBZLh+HFvX30R+FWcaLhnqohNlotOEjE7iJy/yVaxglC1fdYLBnvtiS31/gK/avNSu7+iqW4kQYAdFSoHXair3EvDTCGG5jOzsx5rBGCoZ6ErjAq3+Z+1EXqgOnClv0yQyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybbTcCzVlltRMz1WEtFiCbnEPeRN28eyOOsctOIRu60=;
 b=c7Y8IaeQ79cABvJpdyycDKPxNk3r4WlJChd6YfWdaHiRZy2FT9Q/AQveRbhWvqGaOXDhv3ribkvtuQThVuF7Pti7YSeG78+9Dpp+vT42BZoiFCNtfXmGOgP1JjyhrPSHqY47O+QX5lv6CAEKFEZwSgxlSF+wwxsXmNXcptTq9Jl9RRNW6RrTW4ocKcN8FypVnS3a9d10Yppf4FLFYRLYZQH1GZBhVsQ39xDN3FGolX3b/md7n5yhJ4VOFStz1cbd+Au2yFPruupC28u6h/7ppTqQ/nykaMfC5LVJo66yCQrE5O34/cQjw7qta5whSBQ1axFL5Kwva/cO9K1b0NENoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybbTcCzVlltRMz1WEtFiCbnEPeRN28eyOOsctOIRu60=;
 b=HGz4s91IENQWxhiKD4G6grahQzeFvaDo28X5/pvkqVKIPuxUP9dh5R/e0ovQkUihSUwRzBYOhyRq30AM837enIVEG8j4iqRYQUc8L3IJfD63EsDErKJyqxGQICpy1rkcocGdRDqD72AZSgy4nVHxIpn1Du6mMjPNkwdCdD0W7hI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove microcode loading
Date: Mon, 12 Jan 2026 16:02:56 +0100
Message-ID: <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|BL1PR12MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: c843b0ac-36d2-4fa6-eee0-08de51ebb71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lqEZFPsI9oVRxXBZfIaTS2B/OhXC/POf1rpauSXktFwHPOJRqweYOaFV09D5?=
 =?us-ascii?Q?iq+MkEgEoSq3I6P/1fezj0Y+o3rCHn22HMZxzWFkLQR2gdYayl3OnXeW3b8s?=
 =?us-ascii?Q?MZwYTNopKWo04UyAgN6rzsUnO001x1Zgawl5cbKR6kic2HuTgvUrQK69Ma+o?=
 =?us-ascii?Q?QB5gIu6c3/F3NLvKJ6P425AxTG3MGY4x3Ji6V6SiR0mmHGJe0RX3tPfClvCc?=
 =?us-ascii?Q?mp7Z8oa8ki5FLXWBnIKpty2XNQxL9rAM/lEUsDJDw9QdA1d8rX0jhWcqaAfc?=
 =?us-ascii?Q?kuN/9rk+VIt4KdD5FM8ni+eX3/dLxKG/9kOSiXQzBwbKocipeH7bqA9V+aqX?=
 =?us-ascii?Q?0RcxeOPCrH2uSUpvkIjt4d2nSt7qRoLmypUVElg570SXhWf2onJ0Exwfc/4o?=
 =?us-ascii?Q?naUO4Dz8c0ROZvTf6dqR5Uo7uFgqSOzA4JcSzt9h8qKEUZ3o++EaB5VAr2pP?=
 =?us-ascii?Q?tN1vl+tJzfmPPL8bW1YdP2BzxgNSzTB9dR7u0LgxQ88xxrGFSGvmqvFK9pNg?=
 =?us-ascii?Q?H7VwIwGcuBzdGZI+Kxup/TIxPyL3p+kHJ0rrz6izh0UitsHvcKTt76y+l31I?=
 =?us-ascii?Q?D9tw14HhYLu4Gm1vuOY1pmI0G2G5Lylj3mpUabrAQ6SWqg6kYeRihXaEaoe7?=
 =?us-ascii?Q?z65TcP6KCluWqnhVefgMKlN3W79S4R0qGg/8IyO1K37FyiaGw9N/Wm99mvHY?=
 =?us-ascii?Q?SqNcZGJlzeP4HAI18c3GVI6g7G6rpjUAt69Xv91VLCn8W4eTe69dthP6TtGZ?=
 =?us-ascii?Q?Ugdj+Kx4xKC4WqHE53hn1u5L3yI58HmGwrFssyEiPgLhQvI9srxcVUgUm0bs?=
 =?us-ascii?Q?VxHqYELqzvSBpofxcU9Rvr8e1b0YOnw/BwvzXxhu/rivlGuxi70ldakTYM9t?=
 =?us-ascii?Q?P24OXpYM9EEpwHyW/gBOp1TeGW920Fhu8ndxgEa6u1X00CJvLcL4U3ID1oyy?=
 =?us-ascii?Q?2nEVZD2sO6YyuecddqOaMDnxabXaa3NT6MJZc6g2QUk5MKhEONSnS958SD7N?=
 =?us-ascii?Q?PC2IUoCZhCOAnyv0v8Vvy35EeY8Gmjlf1GPZnLFioQZzlR5GITEChfhCP/xx?=
 =?us-ascii?Q?qnZGEr0mCCapy0R410hoALA1zQT6AHzS6GphWtLmIlpE5exCEnqjnEb/0T2b?=
 =?us-ascii?Q?2qD4APAPpnWYkfayGncRCRvxSy2FNpf9sitIIvcs004r9M+iOM+rFCKUuKUo?=
 =?us-ascii?Q?OHkLqK9U6p/0NELyl6RzrjYmhzTRmxgIV+YBE1JvpDhgrQD6SGhBOHtKLj8W?=
 =?us-ascii?Q?3DBLvVY//MDaUgvnlIUzVB83OfZ6DqFRK5611WwAIXgtCVc2Ic3uJN+SXecN?=
 =?us-ascii?Q?G9XA/bAl+wZl/CzcQmyIDgn2w48uRkNhK5g+TcsN6RSW3LZrDnIYmaJKxgX/?=
 =?us-ascii?Q?Dtf0ypnfRHu8TNYlccmAWx8OA+hDOaLWGf+1A6DgWSvszoDtYqIlDT3AwcSQ?=
 =?us-ascii?Q?DB01wE8l/25axpPvE9i5Kz5ZdBtB4tEFeFoKOGh+8dlgsd/n21B9NSPvG/DQ?=
 =?us-ascii?Q?uVt/1fhPC/HB5M5LAUvfUJyU32UaRC9hOLfHToX61uZqy+BUI4T0DA8MqhxT?=
 =?us-ascii?Q?DMVNvYTNZAYKWhyt2yE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:03:16.4164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c843b0ac-36d2-4fa6-eee0-08de51ebb71e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922

Amend docs to reflect ucode= commands depend on MICROCODE_LOADING
being set.

While at it, rename UCODE_SCAN_DEFAULT to MICROCODE_SCAN_DEFAULT for
consistency.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v2:
  * Rely aggressively on DCE and ifdef/IS_ENABLED rather than file
    refactoring
  * Add a note about CONFIG_MICROCODE_LOADING to xen-command-line.pandoc
  * Rename UCODE to MICROCODE_LOADING
  * Rename UCODE_SCAN_DEFAULT to MICROCODE_SCAN_DEFAULT in order to avoid
    having some options with UCODE and some with MICROCODE.
  * Remove earlycpio.init.o from the build when !CONFIG_MICROCODE_LOADING
---
 automation/gitlab-ci/build.yaml    |  2 +-
 docs/misc/efi.pandoc               |  2 ++
 docs/misc/xen-command-line.pandoc  |  4 ++--
 xen/arch/x86/Kconfig               | 14 +++++++++++++-
 xen/arch/x86/cpu/microcode/amd.c   | 22 +++++++++++++---------
 xen/arch/x86/cpu/microcode/core.c  | 25 ++++++++++++++++++-------
 xen/arch/x86/cpu/microcode/intel.c | 16 +++++++++-------
 xen/arch/x86/efi/efi-boot.h        |  3 ++-
 xen/arch/x86/platform_hypercall.c  |  2 ++
 xen/common/Makefile                |  3 ++-
 10 files changed, 64 insertions(+), 29 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a6fc55c2d5..b69bad9202 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -310,7 +310,7 @@ alpine-3.18-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
-      CONFIG_UCODE_SCAN_DEFAULT=y
+      CONFIG_MICROCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
 debian-13-x86_64-gcc-debug:
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 11c1ac3346..c3fb1f3a30 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -104,6 +104,8 @@ Specifies an XSM module to load.
 
 Specifies a CPU microcode blob to load. (x86 only)
 
+Only available when Xen is compiled with CONFIG_MICROCODE_LOADING.
+
 ###`dtb=<filename>`
 
 Specifies a device tree file to load.  The platform firmware may provide a
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 50d7edb248..866fa2f951 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2748,7 +2748,7 @@ performance.
 ### ucode
 > `= List of [ <integer> | scan=<bool>, nmi=<bool>, digest-check=<bool> ]`
 
-    Applicability: x86
+    Applicability: x86 with CONFIG_MICROCODE_LOADING active
     Default: `scan` is selectable via Kconfig, `nmi,digest-check`
 
 Controls for CPU microcode loading. For early loading, this parameter can
@@ -2773,7 +2773,7 @@ microcode in the cpio name space must be:
   - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
 When using xen.efi, the `ucode=<filename>` config file setting takes
 precedence over `scan`. The default value for `scan` is set with
-`CONFIG_UCODE_SCAN_DEFAULT`.
+`CONFIG_MICROCODE_SCAN_DEFAULT`.
 
 'nmi' determines late loading is performed in NMI handler or just in
 stop_machine context. In NMI handler, even NMIs are blocked, which is
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index c808c989fc..1353ec9a3f 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -331,8 +331,20 @@ config REQUIRE_NX
 	  was unavailable. However, if enabled, Xen will no longer boot on
 	  any CPU which is lacking NX support.
 
-config UCODE_SCAN_DEFAULT
+config MICROCODE_LOADING
+	bool "Microcode loading"
+	default y
+	help
+	  Support updating the microcode revision of available CPUs with a newer
+	  vendor-provided microcode blob. Microcode updates address some classes of
+	  silicon defects. It's a very common delivery mechanism for fixes or
+	  workarounds for speculative execution vulnerabilities.
+
+	  If unsure, say Y.
+
+config MICROCODE_SCAN_DEFAULT
 	bool "Scan for microcode by default"
+	depends on MICROCODE_LOADING
 	help
 	  During boot, Xen can scan the multiboot images for a CPIO archive
 	  containing CPU microcode to be loaded, which is Linux's mechanism for
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 71b041c84b..6abdc7813b 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -264,7 +264,7 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
     return equiv.id == patch->processor_rev_id;
 }
 
-static int cf_check amd_compare(
+static int cf_check __maybe_unused amd_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
@@ -310,8 +310,8 @@ static bool check_min_rev(const struct microcode_patch *patch)
     return this_cpu(cpu_sig).rev >= patch->min_rev;
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch,
-                                    unsigned int flags)
+static int cf_check __maybe_unused apply_microcode(
+    const struct microcode_patch *patch, unsigned int flags)
 {
     int hw_err, result;
     unsigned int cpu = smp_processor_id();
@@ -422,7 +422,7 @@ static int scan_equiv_cpu_table(const struct container_equiv_table *et)
     return -ESRCH;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
+static __maybe_unused struct microcode_patch *cf_check cpu_request_microcode(
     const void *buf, size_t size, bool make_copy)
 {
     const struct microcode_patch *saved = NULL;
@@ -557,15 +557,17 @@ static struct microcode_patch *cf_check cpu_request_microcode(
     return patch;
 }
 
-static const char __initconst amd_cpio_path[] =
+static const char __initconst __maybe_unused amd_cpio_path[] =
     "kernel/x86/microcode/AuthenticAMD.bin";
 
 static const struct microcode_ops __initconst_cf_clobber amd_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
+#ifdef CONFIG_MICROCODE_LOADING
+    .cpu_request_microcode            = cpu_request_microcode,
     .apply_microcode                  = apply_microcode,
     .compare                          = amd_compare,
     .cpio_path                        = amd_cpio_path,
+#endif /* CONFIG_MICROCODE_LOADING */
 };
 
 void __init ucode_probe_amd(struct microcode_ops *ops)
@@ -574,7 +576,8 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
      * The Entrysign vulnerability (SB-7033, CVE-2024-36347) affects Zen1-5
      * CPUs.  Taint Xen if digest checking is turned off.
      */
-    if ( boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
+    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) &&
+         boot_cpu_data.family >= 0x17 && boot_cpu_data.family <= 0x1a &&
          !opt_digest_check )
     {
         printk(XENLOG_WARNING
@@ -614,8 +617,9 @@ void __init amd_check_entrysign(void)
     unsigned int curr_rev;
     uint8_t fixed_rev;
 
-    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
-         boot_cpu_data.family < 0x17 ||
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING)  ||
+         boot_cpu_data.vendor != X86_VENDOR_AMD ||
+         boot_cpu_data.family < 0x17            ||
          boot_cpu_data.family > 0x1a )
         return;
 
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index fe47c3a6c1..aec99834fd 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -44,6 +44,9 @@
 
 #include "private.h"
 
+#define can_apply_microcode(ops) (IS_ENABLED(CONFIG_MICROCODE_LOADING) && \
+                                  (ops).apply_microcode)
+
 /*
  * Before performing a late microcode update on any thread, we
  * rendezvous all cpus in stop_machine context. The timeout for
@@ -58,7 +61,7 @@
  */
 #define MICROCODE_UPDATE_TIMEOUT_US 1000000
 
-static bool __initdata ucode_mod_forced;
+static bool __initdata __maybe_unused ucode_mod_forced;
 static unsigned int nr_cores;
 
 /*
@@ -101,9 +104,10 @@ static struct microcode_patch *microcode_cache;
  * location we require that they are not both active together.
  */
 static int __initdata opt_mod_idx;
-static bool __initdata opt_scan = IS_ENABLED(CONFIG_UCODE_SCAN_DEFAULT);
+static bool __initdata opt_scan = IS_ENABLED(CONFIG_MICROCODE_SCAN_DEFAULT);
 bool __ro_after_init opt_digest_check = true;
 
+#ifdef CONFIG_MICROCODE_LOADING
 /*
  * Used by the EFI path only, when xen.cfg identifies an explicit microcode
  * file.  Overrides ucode=<int>|scan on the regular command line.
@@ -162,6 +166,7 @@ static int __init cf_check parse_ucode(const char *s)
     return rc;
 }
 custom_param("ucode", parse_ucode);
+#endif /* CONFIG_MICROCODE_LOADING */
 
 static struct microcode_ops __ro_after_init ucode_ops;
 
@@ -469,7 +474,7 @@ struct ucode_buf {
     char buffer[];
 };
 
-static long cf_check ucode_update_hcall_cont(void *data)
+static long cf_check __maybe_unused ucode_update_hcall_cont(void *data)
 {
     struct microcode_patch *patch = NULL;
     int ret, result;
@@ -613,6 +618,7 @@ static long cf_check ucode_update_hcall_cont(void *data)
     return ret;
 }
 
+#ifdef CONFIG_MICROCODE_LOADING
 int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
                        unsigned long len, unsigned int flags)
 {
@@ -622,7 +628,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
     if ( flags & ~XENPF_UCODE_FORCE )
         return -EINVAL;
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !can_apply_microcode(ucode_ops) )
         return -EINVAL;
 
     buffer = xmalloc_flex_struct(struct ucode_buf, buffer, len);
@@ -645,6 +651,7 @@ int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
      */
     return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer);
 }
+#endif /* CONFIG_MICROCODE_LOADING */
 
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
@@ -658,7 +665,7 @@ int microcode_update_one(void)
     if ( ucode_ops.collect_cpu_info )
         alternative_vcall(ucode_ops.collect_cpu_info);
 
-    if ( !ucode_ops.apply_microcode )
+    if ( !can_apply_microcode(ucode_ops) )
         return -EOPNOTSUPP;
 
     spin_lock(&microcode_mutex);
@@ -678,6 +685,7 @@ int microcode_update_one(void)
  */
 static int __initdata early_mod_idx = -1;
 
+#ifdef CONFIG_MICROCODE_LOADING
 static int __init cf_check microcode_init_cache(void)
 {
     struct boot_info *bi = &xen_boot_info;
@@ -734,6 +742,7 @@ static int __init cf_check microcode_init_cache(void)
     return rc;
 }
 presmp_initcall(microcode_init_cache);
+#endif /* CONFIG_MICROCODE_LOADING */
 
 /*
  * There are several tasks:
@@ -907,10 +916,12 @@ int __init early_microcode_init(struct boot_info *bi)
      *
      * Take the hint in either case and ignore the microcode interface.
      */
-    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )
+    if ( !can_apply_microcode(ucode_ops) || this_cpu(cpu_sig).rev == ~0 )
     {
         printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
-               ucode_ops.apply_microcode ? "rev = ~0" : "HW toggle");
+               !IS_ENABLED(CONFIG_MICROCODE_LOADING) ? "not compiled in" :
+               ucode_ops.apply_microcode             ? "rev = ~0"        :
+                                                       "HW toggle");
         ucode_ops.apply_microcode = NULL;
         return -ENODEV;
     }
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 281993e725..d9895018b4 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -273,7 +273,7 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
     return false;
 }
 
-static int cf_check intel_compare(
+static int __maybe_unused cf_check intel_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
     /*
@@ -286,8 +286,8 @@ static int cf_check intel_compare(
     return compare_revisions(old->rev, new->rev);
 }
 
-static int cf_check apply_microcode(const struct microcode_patch *patch,
-                                    unsigned int flags)
+static int cf_check __maybe_unused apply_microcode(
+    const struct microcode_patch *patch, unsigned int flags)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -333,7 +333,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     return 0;
 }
 
-static struct microcode_patch *cf_check cpu_request_microcode(
+static __maybe_unused struct microcode_patch *cf_check cpu_request_microcode(
     const void *buf, size_t size, bool make_copy)
 {
     int error = 0;
@@ -404,21 +404,23 @@ static bool __init can_load_microcode(void)
     return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
 }
 
-static const char __initconst intel_cpio_path[] =
+static const char __initconst __maybe_unused intel_cpio_path[] =
     "kernel/x86/microcode/GenuineIntel.bin";
 
 static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
-    .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
+#ifdef CONFIG_MICROCODE_LOADING
+    .cpu_request_microcode            = cpu_request_microcode,
     .apply_microcode                  = apply_microcode,
     .compare                          = intel_compare,
     .cpio_path                        = intel_cpio_path,
+#endif /* CONFIG_MICROCODE_LOADING */
 };
 
 void __init ucode_probe_intel(struct microcode_ops *ops)
 {
     *ops = intel_ucode_ops;
 
-    if ( !can_load_microcode() )
+    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) && !can_load_microcode() )
         ops->apply_microcode = NULL;
 }
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0194720003..42a2c46b5e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -295,7 +295,8 @@ static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
 {
     union string name;
 
-    if ( read_section(image, L"ucode", &ucode, NULL) )
+    if ( !IS_ENABLED(CONFIG_MICROCODE_LOADING) ||
+         read_section(image, L"ucode", &ucode, NULL) )
         return;
 
     name.s = get_value(&cfg, section, "ucode");
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 79bb99e0b6..5e83965d21 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -307,6 +307,7 @@ ret_t do_platform_op(
         break;
     }
 
+#ifdef CONFIG_MICROCODE_LOADING
     case XENPF_microcode_update:
     {
         XEN_GUEST_HANDLE(const_void) data;
@@ -327,6 +328,7 @@ ret_t do_platform_op(
                                  op->u.microcode2.flags);
         break;
     }
+#endif /* CONFIG_MICROCODE_LOADING */
 
     case XENPF_platform_quirk:
     {
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 92c97d641e..1e6c92e554 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -65,7 +65,8 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-y += xmalloc_tlsf.o
 
-obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
+obj-bin-$(CONFIG_MICROCODE_LOADING) += earlycpio.init.o
+obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-- 
2.43.0



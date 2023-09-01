Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50678F7C7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594219.927498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGV-0003nd-V6; Fri, 01 Sep 2023 05:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594219.927498; Fri, 01 Sep 2023 05:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGV-0003fK-OF; Fri, 01 Sep 2023 05:00:15 +0000
Received: by outflank-mailman (input) for mailman id 594219;
 Fri, 01 Sep 2023 05:00:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGT-0000Nr-S6
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:13 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee03a18-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:13 +0200 (CEST)
Received: from CY8PR10CA0035.namprd10.prod.outlook.com (2603:10b6:930:4b::20)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 05:00:08 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::f8) by CY8PR10CA0035.outlook.office365.com
 (2603:10b6:930:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:07 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:06 -0500
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
X-Inumbo-ID: 6ee03a18-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fer7V9bgsZezmk7sLvUNhLb2F5rHjZWEIodmeTyFRqLQFsa0Xgnub3lKFNS1p0Cr+qBmkDPXKi9I72vzwcOJXsG/6dgNQIsWq15mlbjQcseTwBim11Pmi0cqpAm8ZSsuUFfO1nN/HsW3kTPq94E/6GrPytMM8ZhNmXZEjWp+PQQv0rMydsEuptI9Kt7LxracVohpECy+5BkyrPEpCd/SVcSQERLYgPiEVWxoWdtUXOJx3xCA/I/KvWJVLxcQlhrl7y/jVcrsoN7qS8YiIbIAS+2RxVcJVJ//9QZYC2w0OZ/dF2W1czc8LGaRRs4K8T4wY3mQLIfh64GQ9yyYiMa7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEDXsWkF8KTl41RuBhMPUNVpLR2NQqTU90/MTcE+TTg=;
 b=R/4Z7WAaxAOtorxN0qm9Aj1EdheOveY8ml1avt+hPhWkYSete4xqQZWieozQ8l8m+E6yQKyZfDJXjIstpoZyp2ZgrVbcQJBmWWotBdQEYA4XOTvwlVyHFiF1l4fZ6N+6cYW9ORFo3dfe1h4AYoTkl/bs+bM3Pg4gHRkBRRW2CW83uysEt9zh2VZ+51Glk49o8G9lFy4NpOnQ1cVr27W4mklYXmHTppnKy2YRiAtoQ2fHxuSjY6LnzY4hrJ797Z5s/bgIcbdH7Gz99mDXLKyc2c4z6Y+CpOlhh3E8nTmXooBhT42g3ynkQJiUWZEAMzghBFtNiIOJcPbYZ4W6cDjW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEDXsWkF8KTl41RuBhMPUNVpLR2NQqTU90/MTcE+TTg=;
 b=rD+TE4z2LQoLK2QcgfhUy68fXEYEfptN48CcIUoAuzxOa3YV+SO52NVonEWxkKxoAtAIszgjfuEXUWpyFcHB7+NjcbpoEi8KCtpYrwqlMHE8VUIeCw/JSj6dkMnS10oD10HFQ0vW9AezzyEMmVCKdvebRMoI976/tbR77NE3QM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v11 05/20] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Thu, 31 Aug 2023 21:59:32 -0700
Message-ID: <20230901045947.32351-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7d6b30-57f5-4933-74e3-08dbaaa85094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fjvd3bTZ0iBsyKsEHnsSmd0ddGLKFm4IbbHonWpt8EYuyQUgSuJSBOiiYqLWwbJB0Njhw5tK08f+a4TRM6FfTtPAbIe7iQD+1MUpueojxo5Wwgbp3oOxFRKf/yoz6IzWZbfu5uNtZk0kKAj9sEu3n2+vd+KYPuDBhyzc1yW3vf9tSPlrEjh9vMAMmsOvuUzX88qzeeL8h+Hp5C+tlrIYAJv6gm3UP25bStSr3dcCRCQvkxcVDBLapsSSVQ2A92aOIWwK/nBivOw7g+QxpisbolvNoQRDYGCKXU1LgBK0mzPI4Im5AtlJK/PUCi6ocOLBMY7VvEyUGV7sw37m9cIgm82QXRCKizeSOHcbmhOf1dJ6gY5T+1GvMf6LPcSGrQEFpXdMjwf3P1bqqP7rOkYEJ36xprwE/M73j6JRb75tgn8De6ffbFl0zDD4d/xDOnN6Xs35lT+TIb2+h++CiUnMxX+ZY/z6DT+xUgRvmDsksLMkgnGq2sccLQbYGC7+YcUFOHsF48ZG4T0wibGWVdSHy9mE40yWD5ZeS5gmMnkhy5XFb2nAUih+QaNNGWKzGQWebTjbTlm+aShYWRXE1Mvt8aBUdNR3TqFdMDq8p+BQ+HruqnNpjszp9MDWpnhFPYqASfBsW9ryiZG6c6n9dXy+gHhJWnXAgRSV+fDizuYaYpcOFzK8PjkdDDNYO0traVYuRbZaf732SxuZv2jZ0kks8azBC48gWgoOzDYvCbNNnmyL/yOq67SD3bH/iqIQ7HtBmVRwZf496t0REJMEJ7FZ/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(46966006)(40470700004)(81166007)(478600001)(6666004)(2616005)(1076003)(82740400003)(356005)(36860700001)(54906003)(47076005)(336012)(426003)(83380400001)(26005)(70586007)(70206006)(6916009)(2906002)(44832011)(5660300002)(8676002)(40460700003)(41300700001)(316002)(7416002)(40480700001)(8936002)(36756003)(86362001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:08.5097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7d6b30-57f5-4933-74e3-08dbaaa85094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
Arm.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
Changes from v9:
    Fix style.
Changes from v7:
    Add this feature as "experimental support" in CHANGELOG.md
---
---
 CHANGELOG.md         | 2 ++
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 2516526589..24636b8eaf 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -27,6 +27,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On Arm, add suport for Firmware Framework for Arm A-profile (FF-A) Mediator
    (Tech Preview)
  - Add Intel Hardware P-States (HWP) cpufreq driver.
+ - On Arm, experimental support for dynamic addition/removal of Xen device tree
+   nodes using a device tree overlay binary (.dtbo).
 
 ### Removed
  - On x86, the "pku" command line option has been removed.  It has never
diff --git a/SUPPORT.md b/SUPPORT.md
index 6ce0ec29b0..3461f5cf2f 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -855,6 +855,12 @@ xen/arch/arm/tee/ffa.c for limitations.
 
     Status: Supported
 
+### Device Tree Overlays
+
+Add/Remove device tree nodes using a device tree overlay binary (.dtbo).
+
+    Status, ARM: Experimental
+
 ### ARM: Guest ACPI support
 
     Status: Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 57bd1d01d7..650aca99ac 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -92,6 +92,11 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
 
+config OVERLAY_DTB
+	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	help
+	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
+
 config HVM
         def_bool y
 
-- 
2.17.1



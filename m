Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440B793335
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595993.929737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9y-0007iE-OU; Wed, 06 Sep 2023 01:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595993.929737; Wed, 06 Sep 2023 01:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9y-0007c1-Ie; Wed, 06 Sep 2023 01:16:46 +0000
Received: by outflank-mailman (input) for mailman id 595993;
 Wed, 06 Sep 2023 01:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9w-0006tr-U3
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e88::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a09f55d-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:43 +0200 (CEST)
Received: from DM6PR05CA0058.namprd05.prod.outlook.com (2603:10b6:5:335::27)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:39 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:335:cafe::ed) by DM6PR05CA0058.outlook.office365.com
 (2603:10b6:5:335::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.25 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:38 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:37 -0500
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
X-Inumbo-ID: 0a09f55d-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISgq3ucjE6nwy4Na3bB2U3gRvs9AUlL5cRXBO8XDuy3fovcT+xoAv7ootYyAZ60D5OxYRrIK4XhAwRmSqkgyJfxz9w+eEoXaYuKRC1bkNZFS+yPO/L7bh2xiPq9bEpvvt7kBmjCYL7rqgzyXkX2VAayJctjcCYK8eoNH+2t0eIKBiCyBeqGn8hyD8FKHpg65oWe3BCbSV4GiamdjkN+54ETNBaFmZlNz+OnUb4hHQrge9NiBrNSOiclh72ts0QXAyS8wtoc/5sgGWL/F6jAHWyKLJ6DULhitqHcPG8Ee+yAulnGQMIsPEUj56fT0GyHE8ZDJLx3Gora191aWxrMgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEyT6DqrQYXvE2hVcLijFdcrNkFKPw4yo+BSRds+BLE=;
 b=dsUfaodB6bQBNBKhzKeDF3bPKyZlAtYQAlOi4TOfkGmgV28E7ZhcGaiwGHSv2sbEp6+YNL43Zly9HlaMBhr37ItLx/wV+zL1DoBI8RsWOcXrr1940dPLO8u/zeXxLNGwTF97Zpy+I1FmnoGVPIyUO786FRk9rm4H5lVm2C8hGRi9dkAB2ZMcqNnNF+AMVE3ISE4uhRDjfod/TawquemCljIhUVgBbzpCVcNGoL3kh4gcGrY9XdwMsOLDb8/LcxSJjTPHbFPq7KXMVNr09yYM1LFjkK+xXzVkFFvzZEmk42D8vxeJoYO7oLAm/ls0tHS64JKYwkNe30FFZzSVzuroRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEyT6DqrQYXvE2hVcLijFdcrNkFKPw4yo+BSRds+BLE=;
 b=b434QoaA5AZdoaMJckTk8xzwcuSLsVklwCYNUB+SA3ZP1Ah2jDShQdv2Y2z1b42Jb3lVYirttPXo9x85x2Ir4lgLtfd97nE5cuOo2/4YgNNjk1Wyq0HVNUa7iTy4zNT0sHdz8ZxNBmXNJdhLgWx/MW1TTkoP0NcM/VbK+L1fWi8=
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
Subject: [XEN][PATCH v12 05/20] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Tue, 5 Sep 2023 18:16:15 -0700
Message-ID: <20230906011631.30310-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 55283776-035f-4223-5323-08dbae76ec16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pfYRW0zossqfKJDCwYxz+uejvsObbvsQWOHhBzDiC4e62KolhKaDFolxEjiDaUBnO6uz3NR1x/tP7Zqvaw3jk0qYwjonyP4FB7d8gu/7mZQFBUNLno6CpUCAMnXAqXApG5oZu8MGWPDYgnjagDRy9qRV5DIKPnyBr622B1m6Gh+r9lD6WZ186jo6h1hQiG1jtzE1TJCMhoyHl6kOUHg3Mrtbm/o457QBroSPiluMXtO5wfUNMCNzU+QzgmhjbUHInFurzz6OiJiYKKWIt0UGG5y28EoDVUo1Bk1e5FzoFdnCU9/4Q98s/wls3WiOwxcx9lub/0Np4OkUvWgnKwTpUpGx47bg1hVdAp/uLuh3ckRlWrUB+64pOm3+kHLLhnsmT+bcjBgC/AW6KaRNOhSAyg4dY2VaMQZh9dHREEXCtUbT83aez0Euu7Y/uJNdtk4WCdDwhcx70h+9XF5vwG7gY0XrfdhlAXZ262mUkfo1FulBE2rqiVDUsGBVVlt8RwuLWLlWA6J2KknH2x8gkJjvDjpwQp2goi4+477CXYVu9a1VQWbDftqlZO5WEOfxouw1vMfdBOST/0FZZNGT6a3e9RjOOt3yWlN31Ze6z6WHmSPU+rOGgSWuW5U+Ybm6ifv0IwNeam8acebSwJZRHB6dfcm8Pt/o9XJ5OjtsmKoJ/WpcYD6TEwlbiQnilvyONh+GzQOjfS3HzeUb7/v1slhv3patVv0+fOHTIzQf4C6lVMLgttjl46ZzSdfgIc9ip6kta8lrxEAgS3H5Z086MzVk3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(26005)(5660300002)(44832011)(54906003)(70586007)(316002)(6916009)(70206006)(41300700001)(40480700001)(82740400003)(81166007)(356005)(1076003)(6666004)(4326008)(8936002)(8676002)(2616005)(426003)(478600001)(83380400001)(7416002)(336012)(2906002)(47076005)(40460700003)(36860700001)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:39.2223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55283776-035f-4223-5323-08dbae76ec16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
Arm.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>

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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59471F74E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542793.847113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syS-0001wf-Jp; Fri, 02 Jun 2023 00:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542793.847113; Fri, 02 Jun 2023 00:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syS-0001ik-9f; Fri, 02 Jun 2023 00:49:00 +0000
Received: by outflank-mailman (input) for mailman id 542793;
 Fri, 02 Jun 2023 00:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syQ-00018B-9Y
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e89::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fd8da53-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:48:55 +0200 (CEST)
Received: from MW4PR04CA0042.namprd04.prod.outlook.com (2603:10b6:303:6a::17)
 by SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Fri, 2 Jun
 2023 00:48:51 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::25) by MW4PR04CA0042.outlook.office365.com
 (2603:10b6:303:6a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:50 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:49 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:48 -0500
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
X-Inumbo-ID: 3fd8da53-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6M1iwZcMfs60vHw8iRltTEBq2AlhOPemegq9OS4h/++GVDODLGB4zwPPxR43uKFG+5oMZfW1nXYWKtm37L/FPVGkzl+Bn6UrrBTyWm02K9og7omzsl5Nmlg9qxXkKnRIewa2U4Rydu7cXPqPlgvJS6e9tce8biSdsKYa8SFimT/mLPU3bwliYfVa2GmdL8jFljQX46R9tUbt15NIgfJMqG28wdRoUSHrRhcH4aiXrwx1kdU+TLZJUinrPhRjqF5V0q6vh/foG2ugGxmsNd8Oe4rnrVv+hq7rVjStCQ5wOSUdzOS94zjZtwpw5Y79y+eBm+Hq1Nc/TcsqjLbftnMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCSUaAfJqaOws8smne3UwBpw/ZTPHQ6ZelbN3iVgJI8=;
 b=SJbpg/wD3mlB3YSPIOzHR3Uq+Y57pWyOqpfoMLsITk15DwEkhrMyQBYitt7HCiCPmtQBsGAp9K13xPTN1lE2P2TP5Fmg6JMmtdUxxER72iydmzkxf6dkOXNEp1+F4dPwb63bvbzg7LVFgEmQZA+zB+g8bv838lNZGAmfnOUbrSXU3BdQhcNvvmcnKbEgQeokc8ZcErhQJaAEVtz1f5wR2KtVVyCZ0UmiOWTgB/wdgRS+31A1d2enMoKGyuH24xJSbgzJZfWMpGTRjhpJ0CEGmegA5uZm0sqddkVHFwmZxXK55AgiRU9Zjl80i8rE5/xZ3Ea1B40OITEmAFI6ebWEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCSUaAfJqaOws8smne3UwBpw/ZTPHQ6ZelbN3iVgJI8=;
 b=T/ua7MgIubMBmjH1nls8jPH1KTSqI1O+AwYe6PMuyuky8X2uiDfS/tW24Mm6CHDR2DFojq4n2DWUZEVSAzfnYgrzH0HtPQy8+gjByKamY2k6pUUIU3V7nkxCKyQwY1XNsg4z0DS5NVILESvKnu+FIHlurrWWysW97/caqJCK2E8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Thu, 1 Jun 2023 17:48:10 -0700
Message-ID: <20230602004824.20731-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c66782-6ae8-47bb-41d7-08db63032189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Ox87FTOGBLOjSDuH+KjMkkBMIG0cPwYI8KDCQTcP1eS4wWzQAs5sVEGz66QPwA9erkUwv+VwlVRVRhtSGHP+HSRMPUSme77gGIBxjDAnRqHLuqDALD7tfTHoOlhIddPjBp1pqDrPpNXWemO3zO9+Vcr6fn2DjbH9dxmMjgSQ5OBH/IYpqM27tXOr3zmZtcFVKJ683skTtYpsEjJCs1zJN21VuqndLTLv+Ys7C4d8BoPeH1p9p35fvk1hkFD37MD7uOT+5d7BkW9xK4b4mhmhryuaCFn8UwtohRO6b4OvCVIVXTuLvBE6+y7jD//wxBahStPOMicTrzdIJVYhpk3aUy4dOwN6aDwr3Gg2L8PmE/39bZqRcrD7d++1lHh3v3UBAeGaOJ5kFzeEMewMBbOkOybkM0vkIPLuC1a8K/PYaJeVUxEQ0ERmiQvA1gG5tCTVnl6DThKmUBDMmo3q448TPD+RiHHLvY7JbZLNhohREAytIA9JCEl2XV15nwbrhCE4BriJBLbxpDM+hepxYtmW3uMj2UNVpP1wurydEjhFQYadJYG+wFLh3zxCaqSaLlxO7NEBhj3ZQ4OMQiCcGs6W33QkYJKRHZuV/IslNLOUHzCZ1K3dw2qnGQOqhen1kJz+z+2LBVnojqWPzW70E0SckRX74YoZlTGjgJQCGXE5zAS06w4UCeHmUqaFPHB1JapABpSm+9Fk04yiQs+fXt58t2URGL2pp96OeJZ4/aYj01Ds+pdS3Ok/xQCtUo8nJzZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(356005)(81166007)(36756003)(82310400005)(86362001)(40480700001)(40460700003)(41300700001)(7416002)(8936002)(44832011)(26005)(1076003)(5660300002)(4001150100001)(186003)(426003)(2616005)(6666004)(336012)(47076005)(8676002)(83380400001)(54906003)(70206006)(316002)(478600001)(36860700001)(4326008)(6916009)(2906002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:50.0346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c66782-6ae8-47bb-41d7-08db63032189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
Arm.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v6:
    Add CHANGELOG and SUPPORT.md entries.
---
 CHANGELOG.md         | 2 ++
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 3 files changed, 13 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5bfd3aa5c0..a137fce576 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
      wide impact of a guest misusing atomic instructions.
  - xl/libxl can customize SMBIOS strings for HVM guests.
+ - On Arm, support for dynamic addition/removal of Xen device tree nodes using
+   a device tree overlay binary(.dtbo).
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 6dbed9d5d0..6b27d43cc6 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -832,6 +832,12 @@ No support for QEMU backends in a 16K or 64K domain.
 
     Status: Supported
 
+### Device Tree Overlays
+
+Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
+
+    Status, ARM: Experimental
+
 ### ARM: Guest ACPI support
 
     Status: Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..1fe3d698a5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -53,6 +53,11 @@ config HAS_ITS
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



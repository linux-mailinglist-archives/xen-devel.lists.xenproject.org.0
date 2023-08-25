Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5B788178
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590552.922917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmi-0000G1-Fo; Fri, 25 Aug 2023 08:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590552.922917; Fri, 25 Aug 2023 08:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmi-00008K-2S; Fri, 25 Aug 2023 08:03:12 +0000
Received: by outflank-mailman (input) for mailman id 590552;
 Fri, 25 Aug 2023 08:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmg-0007GZ-F8
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:10 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4a91944-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:09 +0200 (CEST)
Received: from MW4PR03CA0264.namprd03.prod.outlook.com (2603:10b6:303:b4::29)
 by SJ2PR12MB7918.namprd12.prod.outlook.com (2603:10b6:a03:4cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:03 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::f9) by MW4PR03CA0264.outlook.office365.com
 (2603:10b6:303:b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:03:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:02:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:02:59 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:02:58 -0500
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
X-Inumbo-ID: d4a91944-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n67aMB/jNGb4O2l3h0DzFCtBu4gaimzVYooU90TY2wRtXYDx/Nu6OFwxwOqFFU4t7QLtr9yiLiTnrQEk6yNYd5qC6ccJTyT6HTmJ9wCnUg69EcS8a1Fn499Erjn7fB/qMbmuo9aSuEZ5XNrUB6jUBTew1vVrVGWVSmBOiq/rV1t34tjsu0kLujgBcKuyATK6MeXiTnsnQG9xp0O8jgmju24upDwQgi9POBF7HRJEJbF7fLZQxO6ePeVsXOwvMaF6gqvuJ8odB19deWMAUFNT1pqwNLzgUTpSu8e53QFg9uFiBiqZpcNEAD7vVxG8chSEQJjGtoHNU7QWgBpAyw34Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKGY0SzVAnGU2fYrb6mmbdoZbAtWP+ycGZ0v+ZHO7vU=;
 b=iQAoSBrG+qYyXn1vK/AO2zbtU199auRrroGKyi4Wfc9BGn6qt9lV2XBnBd/1uo8UbmOe+k9SyDg/Fr0vfEuBZSIzxqV9gklTMpxpCgBGW3nxUCPAHoeeF8Mp5FijiFkr7nJlIZF5X3oQpO7uMFXp02Dtlzy0MI/wXwXYlzZMZifKdu+h1/R9cKIKDnt3eERTB+CCBui2tAHD7cidncvp4Q8vv3v9VPF8pODc6ZEbVUBaVZeJtcnvnyrwwykOehgNVSl7lhDkTbYCCc9pGIf7INJ9+WFQK66EvSySrPfFYBwbBFACNGY9Oxcurz+FzVeGsFdwUVPnmKUivTTMtLdInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKGY0SzVAnGU2fYrb6mmbdoZbAtWP+ycGZ0v+ZHO7vU=;
 b=Bp6Sk4PPdkFV1WQA5qAi896aPv2DqeM/+9VFr91IOM4TdpqBJolzelos4R3ZH7f+IRCZ28WdbUsGitThHVYwhf4eGO+gh4vmPIDDOrDwBJoC0zA/HF1Mqjs4nH2b/ylq8BUqgfX1SFvo/bzltdBgh5fBHfqEqIdLqxWTUSRXK84=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v10 05/20] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Fri, 25 Aug 2023 01:02:07 -0700
Message-ID: <20230825080222.14247-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dae1290-8fb8-4e49-b57b-08dba541b549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MSoVzKIgJKPR6vfmmJjgA2L07q+ktwg5RO7INS3bLDm11IYK3ji8+jrE5ii/V5bd8XNGkISBDqJExPXC76tQMBxUOBMnUwnAyckUD/6Y6EkwYt//CWP2z40l3Nv8mg5no3uofUAjWmb9X6iQ7g8RFrzfZjBAtRkkCOK5yvBrux53I/bB4YNOj3gTkLOq2eRicvMevrWq1GWymxu3PfdWL/cd0+m7jpNkixkFb2dJEnFoH3Jnvp1RhFIKuVg+m5bJKWQgFQ/FIqvFOPUKwWrz1InVps+NpbOeAXCulbFP2tITxz69LFg1lz6+g+4yChrrdKfS++RJU5rWKfkcHb95BzXSS7Y5cFhS1F2hstuduybOwJ3fQ53Nt5MWD+XTdQTJrek4CAQrHyUM5JUd+wDnQWRdckAvidllsDO837YyHDcTloeQ3rTnEj48QE9hKhtpT/W0YGtMpFO1sJofx/Q1FAss4ixwOm3v0CXcDM29nN5/2B2ste4k1X2mwx6OA5+ruw3/+alnIxPotmR2CpGPi56aWGDlxXjzNRHHE8NfpmA2guw4McYLF0yJR+z16ijxjSkjDw84tTSJG/SnEKmzIYZ524Y6ojl2zAQOn1WsUwWCfEKZRkv/MWEuyfU2InKxvJK5/chsZt0q9niPuAjpqLOFe+cdMRM7HWCTj81FdfqjPmE7ZPcb65/RMMWV89EZgCUJU3WrG6fHTPWMZvIdQQmqk6y61NMegri0vrWB17i9dP2+Xi1Te6tgxXRpv72dhqV1EqFM1MViJQ1nFpQjWkyVECgWgBYOiO0X6E4kUm4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(356005)(82740400003)(86362001)(81166007)(36756003)(40460700003)(478600001)(4001150100001)(5660300002)(70206006)(316002)(6916009)(2906002)(54906003)(4326008)(8676002)(44832011)(6666004)(8936002)(70586007)(40480700001)(426003)(336012)(83380400001)(26005)(36860700001)(47076005)(7416002)(41300700001)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:03.4458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dae1290-8fb8-4e49-b57b-08dba541b549
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918

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
 CHANGELOG.md         | 3 ++-
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..f6f4c351c9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - On Arm, experimental support for dynamic addition/removal of Xen device tree
+   nodes using a device tree overlay binary (.dtbo).
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 35a6249e03..8ec272eabd 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -844,6 +844,12 @@ No support for QEMU backends in a 16K or 64K domain.
 
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
index fd57a82dd2..02c4796438 100644
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



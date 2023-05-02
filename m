Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99AD6F4D9F
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528858.822558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYt-0006Nt-3B; Tue, 02 May 2023 23:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528858.822558; Tue, 02 May 2023 23:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYs-0006Ky-T2; Tue, 02 May 2023 23:37:34 +0000
Received: by outflank-mailman (input) for mailman id 528858;
 Tue, 02 May 2023 23:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYr-0004sC-JC
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e88::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f841d83-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:33 +0200 (CEST)
Received: from BN1PR13CA0006.namprd13.prod.outlook.com (2603:10b6:408:e2::11)
 by CH3PR12MB8912.namprd12.prod.outlook.com (2603:10b6:610:169::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:30 +0000
Received: from BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::88) by BN1PR13CA0006.outlook.office365.com
 (2603:10b6:408:e2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21 via Frontend
 Transport; Tue, 2 May 2023 23:37:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT082.mail.protection.outlook.com (10.13.176.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:29 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:28 -0500
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
X-Inumbo-ID: 4f841d83-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQNz5wxnSNHnhF3KsOCS17kfx8SR59b60S+M5rwJS51BB1LlF0e/zbfWbGKAvYUcj3Z6z71tfqp5eKHSE2Q0GuIagR0mTV0KKC9kZXojsXWBZmrKHYjAF5T7YxFddVDBHAPJLNWzJwQz/dL4PsEsLmMBojxcWIwJ5o14t1u8A8X6hNV4Jpy12FrCvfuenKv+BhuCwcVSbnVIQczWNeToQGmsH8VE1N00pU20sz3UIsAe95jOk+MAbaThqojZpzkds5FYpdVm0mhKNmP+2tJbacWdQf7Zxd2O4LKFW8bHU359DPkmwdq8zZR8ua3y1I3daiV+2mu1ydlVQBFlFqtiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0j3i9rO3ndTIMxTYPP/EpeTJUoU0W3bKZrIDhMYirk=;
 b=LCeMEu8LY7CJcnfW8lVkHrH/Ly9iygD+qYDlGweTDAA7kM4ySyjwLH+W9aLoQ+oysRBimROfg6KAkuTQ6RvetUthIweLOoudGaEnWDlrJ4bb5RFx4R6fOqMVuED4bAGXqN43a0rw9M43c+7bZwCEXTrTM3dx/bF3EiXSBkvcmz/iS2+b6tpr92NaxdcsmZOonL+MGoyXM0tRp76bXvrl3XLyV8IpUzUM5nf24B3uj306m6D78+CkXngZXr8sCUlsNn+Vm10+dQcgO4VxLcHyAvuMqZESXsfdMBWY7wxPI4SCO54UkfyP4ujPMV+tZLXlxAh5ng5/x50ID1wez7LuLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0j3i9rO3ndTIMxTYPP/EpeTJUoU0W3bKZrIDhMYirk=;
 b=wZTm6IKZpqV9BPjt1HFwSMztoYc3VJ1K4NeX2B44LSc0Pqg2I4PClc2ux4dc8Pj+qw/Z7mh3paiX1io9MRxHhFBAoDe5EsIIKPJbT/ZsqQIm2J1yvNKb3kFBCFJduuqlbhQi8s/icZ4jUGexyCSh1RxGGTiWlWx6cF6FvywDrsY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v6 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Tue, 2 May 2023 16:36:36 -0700
Message-ID: <20230502233650.20121-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT082:EE_|CH3PR12MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: eb644b4e-1f72-4a36-9496-08db4b6631d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q7+45602Cr5J7QTaF4ra4FlnfGcVG8zk1+745qMSwgbfzEVWLF1xQNil9Tqpm3jwx99qVNPL71p0iQbUa5/q/alOz9PcI4EzygwQfSRiu2GJk30LShG5kwd0iYvPhPyhutNObrLdQGlSOsnbMEtJZz6FR8X2MWovIPJAZdqUKR+9zYLFyFG4mqGdX5xno1z8yuuaY03D6fQTV7/vszAjI3gyB7ZmJCbW/wYBwbdo+QqSZQneNk5z19FF76HMQzgGG3Jd6JIdtDQhhAcrGw79CgH1gYLkEGHZQRwDJWCjGRateAjHJA0CGVCuNnqNCbsEucFAMf5wZgpspGzpJpsZE6YT4mTBWHj7Eemw8XMYy1ABP5yhlThIUiZd2RCbSwuo9hU4k1dOyEn6y3yx8oAtx4DnRpIrBm5D7x52FoSkihBdDcjZT0q94j2aGtZzaKQGNLZnuU0dM3/Ex2vT7kk7CS2ynsl7t32LBWZ750KFipGUQjGvGpB3WN81oSQxkD5hM501ZVOOmQd2v8A7zg42kjaVq2YXT4P3sBffjYviceUPmU+Ubx4XoY2THoHy7x7/zSQOpdp8Stt4M546mdAQ2hl71xipILnm4h+MYwzkP5H8JHOLwpTgYYXUC4xYY9Sp/XPq5VIDco8dTfq0qBHd2QZ8PzrsL262ARghEZC+b2tqkUK23W2O76fl3JpfJ78OYRT90l+d3gTIZVOu9QZEO1jfAbB1JMAseLJlusMpTu8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(81166007)(8676002)(8936002)(40480700001)(86362001)(4326008)(82310400005)(478600001)(6916009)(6666004)(316002)(36756003)(41300700001)(70586007)(70206006)(356005)(82740400003)(40460700003)(5660300002)(426003)(336012)(2616005)(54906003)(26005)(186003)(47076005)(1076003)(2906002)(44832011)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:29.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb644b4e-1f72-4a36-9496-08db4b6631d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8912

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f..e40ec4fba2 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -822,6 +822,12 @@ No support for QEMU backends in a 16K or 64K domain.
 
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F36453DD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455827.713439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2njF-0007h4-Oe; Wed, 07 Dec 2022 06:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455827.713439; Wed, 07 Dec 2022 06:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2njF-0007dA-KE; Wed, 07 Dec 2022 06:16:25 +0000
Received: by outflank-mailman (input) for mailman id 455827;
 Wed, 07 Dec 2022 06:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2njD-0007Hl-Qi
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:16:23 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaa68031-75f6-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 07:16:21 +0100 (CET)
Received: from BN9PR03CA0760.namprd03.prod.outlook.com (2603:10b6:408:13a::15)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:16:16 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::a6) by BN9PR03CA0760.outlook.office365.com
 (2603:10b6:408:13a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:16:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 06:16:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:16:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 22:16:00 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:15:59 -0600
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
X-Inumbo-ID: aaa68031-75f6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnTKUcW6EFX7valtywuUlqVjDGeonhx8XKMlsQvckoFrIOac3qVva9f2xA75yGqvekDLeMB+UP5lwaLIzDbgwXkLOguwuSBDDDQ+3ok3oMyX4xSv45ReaqEtMn/Op8Fhw4DYnrKfdqM8dJ/7J+KE3aS5QAmuxlajaU9gzslo95Ry8/iJnn+JBqX9VomHjhJDs9rQ5xqNZf1xyQBmMX5XCHOGuKDT7hvwkbASISjsqDySpILKwqT2wB5J4k0cer4eI37x3JRuX6ClvM6QO+ANW5jLr039vmdpl4zvPD9LfEKrl41v36LEXjX09DVZVupqr57V1JUqU0+djbWyMPySzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfET4ZlUmPQkBgdnYzJx7GKoPrXNKYIDQQVVWcgL9M0=;
 b=G/O8GechKu+S3MYny45KGB1nddhopjUpD0gyMoP1HfCpzAKR+/atVbwELb3gTGvRIZdGep5nQOIJh1KJAZUWehG/YmQebo7TdIa6v6TotaRcXHAbf4/i2W9/XXDH1mTilhSwOSXUCCvhj7HIoDXBrMxbSnBWvE7dkJV3SsVkT5FG0+zpCAzzCErm1EA2c+ImkSlYu8B6ndVDWAdUksS0RrHlO6U5/HBFBOyOenuKDiK/jum2aS9LWIDmjTfblxiqQqYUqtBmNAmIl5Zc5hU5oPaOoH2v19saek8ERu5Es1yUtIrZf4fbP0eU7aLHHQQvts9HDF5mBuv/sW2fttKUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfET4ZlUmPQkBgdnYzJx7GKoPrXNKYIDQQVVWcgL9M0=;
 b=xyVu2ZM2/IeTdwnWMcjUWDwoBpv9RHRN6ZPVnYWJ3/Bz9N7frmFcx/M3M8VOVes0KOwmE8nyuz1Oolv0f3hiLDcgA7zjpjesSVRJg4YKUJArsZj/kIJzvFxre8sg5M/zs9CDusUf1MuaaDsz8qidwD0LDuseAIFj1GOwzJG92is=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v4 02/16] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Tue, 6 Dec 2022 22:15:23 -0800
Message-ID: <20221207061537.7266-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061537.7266-1-vikram.garhwal@amd.com>
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT050:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b09ed3-9a35-4e97-1382-08dad81a8c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HHwkqMXL9Bat02fhRoEPr/Lp1aFUIFU2okWjUFTuiQJjqrxH5vNhOrJx4m8298uLdYlEV4ZPUo0hpWon3igkc9AzMAJAI3enwq/P3LvFB4arTgtrAiFdUgxVmfCbTpGcjpJqoqXQJk7dowX1g97zPuBfZMCPmieioaUOtOVwsmtEowcCfSS2O8OH0fosIgn7kM5se5Fhs9yPXgkT5+d9TnLDhS2AC9zjv380IFViuG04iochp84sp7X6ZCcnO06/m3RBZ8D2nOQsDeoaN+NP3LLDAhnwrHkP2KRrMlz3XPXNzPGE56sihcUFy1KmRSijFjbzsUkVSAmKzXGnvMh3ArIOo9QhJOePvHS5sYVRRU3UKoZWCRosATcKmWezUpKxfnWJLs3lB91hYlLydzIV242jWLKE1iVL9h7+teB7UWoQkZBjPqXlhs18YXKIgrDs6uuFPtYvK9tiOPOC+AAV6tIzLlS4oCATZ2IjwFIX+SLr/Sqjqo7FI7v7xWFuoB731ckVs7X4NCQI5kdSOeptu1VgnQKNbPsSai9tUAoRLVhMfbgygJfW1l98gAro1krSDDvD2uLI4cUpeZS0uiuOmAwTJW1AP7EUiw1BYKYYE6GVu3Fr4f8BQMLP0Rb/ZHVy55OL0gCSypqHG26u4WnG20H8pP7wkfysTxNSuqrKFMpWXbtNyHjST5SBZlzzashyLPrI68yISerj3tadSchm4CMufmXRLlt3lQ6KYtpuEco=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(86362001)(36756003)(40480700001)(4326008)(40460700003)(478600001)(26005)(8676002)(5660300002)(6666004)(4744005)(41300700001)(8936002)(316002)(70586007)(6916009)(44832011)(70206006)(54906003)(2906002)(36860700001)(426003)(356005)(186003)(47076005)(2616005)(82740400003)(336012)(1076003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:16:16.2454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b09ed3-9a35-4e97-1382-08dad81a8c6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/arch/arm/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847..ae2ebf1697 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -52,6 +52,11 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC
 
+config OVERLAY_DTB
+    bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+    help
+    Dynamic addition/removal of Xen device tree nodes using a dtbo.
+
 config HVM
         def_bool y
 
-- 
2.17.1



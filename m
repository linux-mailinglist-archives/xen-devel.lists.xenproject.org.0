Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C95E63E3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410159.653238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSG-0006P2-QC; Thu, 22 Sep 2022 13:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410159.653238; Thu, 22 Sep 2022 13:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSG-0006KD-L8; Thu, 22 Sep 2022 13:41:28 +0000
Received: by outflank-mailman (input) for mailman id 410159;
 Thu, 22 Sep 2022 13:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMSE-00041N-6V
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dfca9ae-3a7c-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 15:41:22 +0200 (CEST)
Received: from BN9PR03CA0522.namprd03.prod.outlook.com (2603:10b6:408:131::17)
 by MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 13:41:21 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::c3) by BN9PR03CA0522.outlook.office365.com
 (2603:10b6:408:131::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:21 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 06:41:20 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:19 -0500
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
X-Inumbo-ID: 3dfca9ae-3a7c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bimp4zBtzmivG4cQ/xKrNV99iVEuasxhu2Tul4Ew56tnzVUMC20l6uQ+gS9ukmV8RE3F77DsBDS87f+H433CYZk5eVxcHJiQVr8DhG3A9mgHeX4WIX0EduQAQD+WNIiEl3NSFj0mnElrg/twy65jvmJ+Sm4uKZUQ8FK4grUehA6G6zloYa2SH1Zyl+HR5bgknnzvOpVYKTipsGNfBPp11RHbnMu3SZIeAOhNyl+T3dchlAIvpTUfED0dG49mjfGfmbm5TabPzqjDc6xN/uoAfbiz64XzO/TQdiGgFVTxfGZLm4vB0V9CyBJ34YXFv2/It1qZXFORxGEtQqK5xVXiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USlAysPSixVlzaMaeXTCZzefvXfPQQ4YYGx5V3R9wz0=;
 b=WXk9j6JlW5SNaBWzno4z4pBhcMsL3aKe626TsX3pEzimA6a/e/NNYGxpp0JcqqZjBf8VtSOlZUKLlf2uiDhpr5kqrvmN11L9MXZp52tAXTVUFwtWKt+jrxXe8V18q+mQ6y73PnMOmCiVpnyn+cGGbk9PjJY1+UubVVfyCAWHPCAWQegmHFr7pLcKqPmCtNcypy7SzIiovM8WpzJOGI+PTknZvNiepJjvlf/RIzd3pUI5wdLGaeMPZ3XgPHDDB2yga4pOO0CXjVqZcOd2up12xNUnV+YZwgFB+npubQUUDKB7wCSOHL2tkNaWGWF3297S+g9Kbaj+pwqnECMq/ZGhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USlAysPSixVlzaMaeXTCZzefvXfPQQ4YYGx5V3R9wz0=;
 b=D9nu4h+isNkPLIARpdOarmCgtKiQ1i3XWf/C5spPSkMgTWaSCJF7T0VQ50iGA/a5Iv1LGUVwXBCwcJmT6GgxVctcFGdQRDKWQT5j3AjNab9qAQ8DoKt+RgdPQrwlscnPIc+fDSNtW4J4icr+PVYS+kGszU8I9vkWz/JJ0dxkIHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 9/9] automation: Rename qemu-smoke-arm32.sh to qemu-smoke-dom0-arm32.sh
Date: Thu, 22 Sep 2022 15:40:58 +0200
Message-ID: <20220922134058.1410-10-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|MN0PR12MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: c627175e-5963-4af9-9651-08da9ca0228d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	57pzt8Z+e/2EYa1nBLAs4PFNNx1i1yszAzDHKgR6XPAhRZZSje1q3x3laF7eEvvEPuNg1q+3t2DJ9VSPxn+3/q5fn6R+uqaViJwsB0440kfMeeMMAZAPSKel0UTUNSOcEI9wutxP+xo1kmI9VURsp8tWJPQpMrtihwzoImaloIejACyXoVemJsiQY9H+i1D3F82cYLipE3oqHjVK4S/yMnt4Jrb8663HsR68Vsjt/8lOX3aIdifa/tG4hGLyY6t2x7T8e8L3gj7vuvqfRns50R+GgVemWstDdWARpycGgOjmnbOVSQJ0weVRWHF3mC6K910Sdya/buHL+YKuqZbNx00/MpIyJDQ7A6lBXdSRgvvUMkBp5DYOdQvNe+mg7fumw9cC2+taP7htsK42augG7cF8s/QzSnV3Dlv5jDWxt2qtQUY/eruTXLJhqM16TvNm9TgWrN+JZlyNkRqcg//oVDJ1HlYyB9EJkAgmHYPYvNwC/bfe7p816fYD2pJ7SD96RHz+twTQSCG0ev3pOSAp+4dyk9rruIoasNO+sQkLLOYIF4leCRRAuWOf0V70u42hD2NCgR93BtMPVhe3Hd253cnfoSOHx4YtHSZy7AMZn11P8fMjxCh6FXX/gWqdSvYMbWZJZaf8L1dLBwac4nMKLsGVDhydEPVUgxCHQjxF02XI1ijWelIUz3Hdt8iiLTTmXVamTmjBj1Hrl6Lwtiaa0zeLtjZfVYF4A4OeHCkXntYTa7QLkJRXCVZHgZha91FByQyrISEQxQT8BM1zZ1xbF2b/bBW8awS5iTI3Ob/21ENpj0B9VOAaWXCYEHkAJbWp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(41300700001)(316002)(82310400005)(47076005)(426003)(83380400001)(44832011)(40460700003)(8676002)(36756003)(70206006)(70586007)(86362001)(2906002)(4326008)(356005)(82740400003)(81166007)(478600001)(26005)(40480700001)(54906003)(6916009)(336012)(186003)(2616005)(1076003)(5660300002)(8936002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:21.4126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c627175e-5963-4af9-9651-08da9ca0228d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5953

After qemu arm64 test scripts had been renamed to reflect their
usage, do the same for the qemu arm32 test script. Currently it only
boots dom0, so we can assume that this script will be used to perform
dom0 based testing. In the future we will be able to create corresponding
script qemu-smoke-dom0less-arm32.sh to perform dom0less based testing.
This is the last step to get rid of ambiguity with regards to naming
of Arm test scripts.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/test.yaml                            | 8 ++++----
 .../{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh}     | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename automation/scripts/{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh} (100%)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 3b147c88ab08..92e0a1f7c510 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -195,12 +195,12 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   tags:
     - arm64
 
-qemu-smoke-arm32-gcc:
+qemu-smoke-dom0-arm32-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
   needs:
     - debian-unstable-gcc-arm32
     - qemu-system-aarch64-6.0.0-arm32-export
@@ -212,12 +212,12 @@ qemu-smoke-arm32-gcc:
   tags:
     - arm64
 
-qemu-smoke-arm32-gcc-debug:
+qemu-smoke-dom0-arm32-gcc-debug:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
   needs:
     - debian-unstable-gcc-arm32-debug
     - qemu-system-aarch64-6.0.0-arm32-export
diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
similarity index 100%
rename from automation/scripts/qemu-smoke-arm32.sh
rename to automation/scripts/qemu-smoke-dom0-arm32.sh
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50C5EA257
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411644.654669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclwA-0004pq-SU; Mon, 26 Sep 2022 11:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411644.654669; Mon, 26 Sep 2022 11:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclwA-0004nT-Mj; Mon, 26 Sep 2022 11:06:10 +0000
Received: by outflank-mailman (input) for mailman id 411644;
 Mon, 26 Sep 2022 11:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclw9-0004X6-BG
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:06:09 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 359ceca6-3d8b-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 13:06:03 +0200 (CEST)
Received: from BN9PR03CA0578.namprd03.prod.outlook.com (2603:10b6:408:10d::13)
 by MW5PR12MB5651.namprd12.prod.outlook.com (2603:10b6:303:19f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 11:06:01 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::7e) by BN9PR03CA0578.outlook.office365.com
 (2603:10b6:408:10d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 26 Sep 2022 11:06:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:06:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:05:27 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:05:26 -0500
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
X-Inumbo-ID: 359ceca6-3d8b-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL19f6g1ObKP2PJF/gYVT4PmeZZliqsCrX1AxwSVvpPK1Ufy2I89J73OiYDoJhIhcylM0oLvdSILeOk0WL9TNUqoJSa8rEjmjQZRXTZDEPAg5B8mfYau5S87mN+397DA/k+/+uLgSKnqxnSgXocC1g1qDxS+XAFZHI1lbzr9amJRGFLQoSgrG0JYkQ8x9YT/pznYeGbbRFa63nkxkmA3S2RZuK9s8uxq5z3mOACuW/3F1nwevUMjg/K3AQGY8WU8E5bQtlrmbQFez9CxDdufWXeO/H8chRTGpG0NmydDfxkemXNj7JNo9u0iabKK91CdWsS9GwGCoRn6QLnq/bvmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mXPXve5ULvv7mPC7ImSugKKpHJU0dvJobrOhPi4FXU=;
 b=UTDZEWrYEvGoEuAVsvPSYsjNCQEUvhG/ttQm76SX9nWX33HKOolnvm1O6jnIbcQ+2Goorc8hcKUg0ZpxfIWjIOl7Mhmk+H5oT3W9U5T9bwuYP+RHIlaD13ydOMoO6GtszEd+Xnpj2l5VQl7ltv4+aHG4svLkif4br1Tis24dMezBxvkzGQH//yvSrfmT5e0SwY02969HkmGKBF2oZZuiv1xRoXQcdS9XxDaSnh7Zv3M3Wo4JF5sLh3uO2KCruHdcdmtwsTN0agY/2+OiW0KRlGE/5nNQ/iiSn+ixTSb3HxSrBt0pcZGALD8hBsN5bPXxqpU02LMylOdeqpg7xrrwbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mXPXve5ULvv7mPC7ImSugKKpHJU0dvJobrOhPi4FXU=;
 b=V0M8QaGOSR9lYedRKL+Ng4W4dbId5IoN2gG/z1avHY//Uu3hZOLBWVjFjsGVVdPD0XItUJ2HV6Z/Hs2FZKw82QmKnO45BjuEg3VbsAuVya/CcC7MG+7k7d5fp6ZiHogZ/MjAaGW0RXens77xT0hFVfEqgzAfpf8oc9yNP4ZQnk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 09/10] automation: Rename qemu-alpine-arm64.sh to qemu-smoke-dom0-arm64.sh
Date: Mon, 26 Sep 2022 13:04:22 +0200
Message-ID: <20220926110423.26030-10-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|MW5PR12MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6724f4-2097-4dfe-38fa-08da9faf1857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wPd3NaXl5bQuc/jp1HxDmV07XxrqCPFP73NqN09t4XN7wtVHpMpnW4Pb2ySp+yYbDT6HGjRWvDEiteEPKuNNxL6DnW2gVVehwPETJhuz+w909vF/Jx9kJGoUNmC8zMZUCF4p473hMM1AmvXoOiH5fRhKji92rL7TTgdrrN3N/xWi9NxXaKaAEcFAXvZP3EcEnz+g9PYMpxVMcT3bWiebUFKDbJci+xxHjFC/HNLELs21QgLINrMg8Nk7ECVhvCZeIQF8t9eAniUgpMhnbDXkXQsda319FTNkIs9ocDpdcmDgnvHMkimMB/BHiiihH3chhbcjR8fdC3AFGgbEBWA7ByyD2oLisH+gz0vuGjdOdfnYdTPK3dYcfRtq5pJtCrwo1Mdtu0+vzWQX9qESbwG/U9YU45ToZkzuFbILjb/lUI/HPe/Y+s3TNFfrQD5pbGfI2L643wzWNq0n69v0Lzjb7S/4AfhvOG1iH3NlGhQxOugLjwbItrcFW8Sr/u8O3tMTI54p/u/iZ3+zffsm3zCWurq24Hpup1a/2Gjqt2eU6h2MavuHZZ9XwsR+hqQGGABg5Fq4Ud3J5j8XTWEUU1U7Z6b+FyE1azF2Rj1GLVmPN5zcC+w7x67qdZk1J/8PCzYr5oSO2KAa7C0/Fpoz1TRyS3hI0lPX8IubJ4g9WYrAHeERDMn52r1P2KpxyrLneuO5S5KdpmutM6li09wD1LQW/8TPyV5uZsR8E5sBqGhvPOAPx3kkOg0OTYRUMiTFnPtwsCNMKWDVc3nHMhQR8ppvmw3GIRbTrdvV9gXCt87qkDQrb3ZTAKlG2xegycAwaWM/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(186003)(2906002)(2616005)(336012)(47076005)(1076003)(83380400001)(426003)(26005)(40480700001)(36860700001)(70586007)(4326008)(8676002)(70206006)(36756003)(8936002)(6666004)(81166007)(86362001)(356005)(44832011)(41300700001)(82740400003)(54906003)(6916009)(82310400005)(316002)(478600001)(5660300002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:06:00.2027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6724f4-2097-4dfe-38fa-08da9faf1857
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5651

qemu-alpine-arm64.sh script is used to perform dom0 based testing.
Rename this script to qemu-smoke-dom0-arm64.sh to reflect its usage.
Also rename the corresponding test jobs.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- none
---
 automation/gitlab-ci/test.yaml                            | 8 ++++----
 .../{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh}    | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename automation/scripts/{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh} (100%)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index f620622671f8..3b147c88ab08 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -25,12 +25,12 @@ build-each-commit-gcc:
   tags:
     - x86_64
 
-qemu-alpine-arm64-gcc:
+qemu-smoke-dom0-arm64-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
@@ -44,12 +44,12 @@ qemu-alpine-arm64-gcc:
   tags:
     - arm64
 
-qemu-alpine-arm64-gcc-debug:
+qemu-smoke-dom0-arm64-gcc-debug:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
   script:
-    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
   needs:
     - alpine-3.12-gcc-debug-arm64
     - alpine-3.12-arm64-rootfs-export
diff --git a/automation/scripts/qemu-alpine-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
similarity index 100%
rename from automation/scripts/qemu-alpine-arm64.sh
rename to automation/scripts/qemu-smoke-dom0-arm64.sh
-- 
2.25.1



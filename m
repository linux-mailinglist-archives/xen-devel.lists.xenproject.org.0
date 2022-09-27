Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B35EBEF2
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412375.655751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7C3-0000mp-8Z; Tue, 27 Sep 2022 09:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412375.655751; Tue, 27 Sep 2022 09:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7C2-0000g0-Vo; Tue, 27 Sep 2022 09:47:58 +0000
Received: by outflank-mailman (input) for mailman id 412375;
 Tue, 27 Sep 2022 09:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7C0-00061O-CQ
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75560815-3e49-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:47:55 +0200 (CEST)
Received: from BN8PR12CA0034.namprd12.prod.outlook.com (2603:10b6:408:60::47)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Tue, 27 Sep
 2022 09:47:51 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::b3) by BN8PR12CA0034.outlook.office365.com
 (2603:10b6:408:60::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:49 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:48 -0500
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
X-Inumbo-ID: 75560815-3e49-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1Z5liq/7VWbBcW2hNjwfk3+3lfk4W4x6KQIJGSkX+/OqJO4yklNwrqQ5pLS4/yASjF6y4iHlsZ8OkgP4OWfVYkGVsHwOSarv3JQzt6FVChbG8w+Gi/ZCpNLt2oDzvr9KdC8RK61zWmXGcdK6gIqyIt7BO9/Fr8YJPYWesKPMtm6GgEh7ehnrc6cxYzxsPXl9g5z5F7EhjPjBhNPLx5jeLeBeHnoofrGy6IZheIyidgchtqGTBZbnMSBMiIbQdSkI3f/7QlAmFnReXRKXgQCD7A97+WAa85rXVbcpRBQGqsfEadLxeLjt5dS6RBDDYx8VGH8EE2Qwvg62eNBvOyh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiwOv4leuSuV4GNiEJBaf6zeLa68ftsFudM5NmbMmNo=;
 b=dyaA4wMIZF4VxG8gT1v9pyQsb8pranRNPcBpxqYw8mibMWOIrMq3cPaOJ/odPc13nl6msoLFFfahfcPT4aVWyH8LURScpvHOzTuPyyHLOdWwV2ySWc/Q97gfA+V2m4TOAATyUPI5dvrqQYPgQSH4Bx+0MBJN4tmwisXHUGTMcNf8HPC3NBodzKdcbJnMo7f6vyAl/D0iWbi7fiOjWy0gRmAgWZmMBhZa4fmvT630sy7z8/A0Zu46p7exu0pKAgoHYuAPHQJA3FxcAtgdOSdzqnT/QIzUrwcFcGjGKvoe93ywK7nQNQpcriB80caItjeem3MNfsqYG+it/hpcsUQVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiwOv4leuSuV4GNiEJBaf6zeLa68ftsFudM5NmbMmNo=;
 b=a7vZUUFJ9ystvw+IZzVZsvMPGVvuCswrsoHsjZg2xpfadwg2OZt7r7qXYUrXSomJStesnLFX29DQ/hWXjefCGrFR+zCajNt2HWmkD0Dqv/Q+Bw8nJgQx8w/BdFHItOuGFN7KSmf9lRKywNUHYYee0ktGIAAPqdr7op7hWsE3uoE=
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
Subject: [PATCH v3 10/10] automation: Rename qemu-smoke-arm32.sh to qemu-smoke-dom0-arm32.sh
Date: Tue, 27 Sep 2022 11:47:27 +0200
Message-ID: <20220927094727.12762-11-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT003:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4017af-bdb1-44a6-d046-08daa06d572c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPk47i0YlYi2b5MGdhFjwpU30pyRRn6E/4pfn0ufXjcaOROkOvVyyjrfDDf2sQdfv07NKG1f4OZSEnoaebYZ3fYfNzsoi+9paize0ycCqdPxiHbKvHoViL4GlV0ajPnGhOjfILh3sBzmbgemcyDDfWk8gVtz15iKK5F2QB1HvPn2g5XwKV1cwS/vYFr+GZYHkY1JX5rpZ7jhAbdExeuAJ1nTOhLbKcW+8uGZi3A4r3U4WCZTDbrpQt3cghbiYggqpxF+3LGz17dH7ZV3WKNkSP8cbo6wcnFcj+LbjuZ+eGV1dt4UblNGXVhFscEXXeexkc7ti0BOJsHBRaSKahP3DN9E8Tz5bmJ7tmlT0LJfzE7XA+MPPgUlyS8pgkSZg6BMKXqVGFhA+3Y8vJ/bCSnG3+nptfopEaiTfo8MOluFOdh1UxN+JOuiYFBqoKPz/4xvOmQifaHWGNORfoq8VRHKhManD7MM8KZr6oK3l7dyb2Or6dIVxxNFDZust8rsyj5t3xh4m3rDJtMJhSY6l8o4u2tjlSETGa7x3sYYlLOFDFi1Doz7O1uyMxdFFCi4VKAjzqxDAS+4NQiOVf4peULP9ph/2tYhbZSPUT39UOZLgEcbympxO8CAn09IdxHyh29JOaN1VNiro/FihWeJFlV0mmsS3pmK1TOuqDOrhOZhm2G+ZoepmInkVLwQFG7KfkBXwCPvmboSB7eDRfR6Pih9Bhdy9UCqsgrz9OsbrEmjLJTXL+qczp1McLqub8lUeBYS7WTv0v5quuFsxMEfPOTEWTI/Sg+PywIvKMiEonkrOyCfAZcuFPYaUkSjNKPsxAB+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(316002)(36860700001)(8936002)(44832011)(41300700001)(4326008)(5660300002)(86362001)(70206006)(478600001)(54906003)(6666004)(26005)(1076003)(426003)(83380400001)(70586007)(336012)(186003)(8676002)(6916009)(40460700003)(2616005)(47076005)(356005)(82310400005)(82740400003)(36756003)(40480700001)(81166007)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:49.9999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4017af-bdb1-44a6-d046-08daa06d572c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320

After qemu arm64 test scripts had been renamed to reflect their
usage, do the same for the qemu arm32 test script. Currently it only
boots dom0, so we can assume that this script will be used to perform
dom0 based testing. In the future we will be able to create corresponding
script qemu-smoke-dom0less-arm32.sh to perform dom0less based testing.
This is the last step to get rid of ambiguity with regards to naming
of Arm test scripts.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- none
Changes in v2:
- none
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3AF5E63DC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410153.653172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMS8-0004aK-Pn; Thu, 22 Sep 2022 13:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410153.653172; Thu, 22 Sep 2022 13:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMS8-0004Y2-Lx; Thu, 22 Sep 2022 13:41:20 +0000
Received: by outflank-mailman (input) for mailman id 410153;
 Thu, 22 Sep 2022 13:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS6-0004DO-VC
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a9c37be-3a7c-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 15:41:16 +0200 (CEST)
Received: from BN0PR04CA0208.namprd04.prod.outlook.com (2603:10b6:408:e9::33)
 by SA1PR12MB7320.namprd12.prod.outlook.com (2603:10b6:806:2b7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 22 Sep
 2022 13:41:13 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::39) by BN0PR04CA0208.outlook.office365.com
 (2603:10b6:408:e9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:11 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:10 -0500
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
X-Inumbo-ID: 3a9c37be-3a7c-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d92zhKA5ig8lgUzp0ymzxSwK//oBrB5dQv603cJk8hDRLUyTDJPNc9yAobOTsqZ+EwilmWpCoF+8827jJiujDLxJk/lHEuto3YyLRVVeYCVW2XP8OJJIad8deYKV802CZvd1SXB5kiD2JVSUor0MkWsOHcXflAi1fEVrPltlYUtumvh0qHRTr6GWYPw6pAfcO7ZUY7rofqYJLdk2XzUaC9zTWpaEKAiLTJboZ4ymWUqYTdrsDtZ01nbi+JL/rWjUcOvW70b3C7/2Ri9V4D4cQeks+UFppHVjnjbewF+9tkvAzGH1VQEWeWNjTyGRYW49lygveJ9AUT07sdhSG2eznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTulcGwMKiw1fmEMFmWPsSd4FimqEq/BzeQ6wBAjlF8=;
 b=cInYbZnxRm8OELQadNrZdV6H6wPwPPlKublQG7nY0/R2LzpJaeG43vnSXXFMGc8Z6m3NpTVBoFMIldL+zbkmjgtTr3WEZ5HhdYzck+4Z5uykc5deHfXkUO0fi9c2/YtBcjzsS3hC5fJhq/JthWtdij3weO0YMRKZv2mNzCeQVRNkGGnmcnOVOvk4CCcSAbGpoX2ruZsOLeanywcKOtIWyI4O6KP2aSj41xA/vc6SXMSS+XOf2hpNg8JVGtU7YcFt53bj6fNfl0ipvfQesqn5z1nspULFBRJ4Lc0T3YctxLdnE30wq/nKaLRehV1Vy4lT8tzwyP8u8YA9q6F2n8p6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTulcGwMKiw1fmEMFmWPsSd4FimqEq/BzeQ6wBAjlF8=;
 b=D+wUJwnhVNxu4U/+cNFQ+i71LwlbdY+RyNAb9V5iSfYeG3HOuxgtmTDF4rswzHLPOLT22MXiKadrqUP2lnlzH3IPJHGxhDVCHJS0zw5Aj3UUgsyBTXdsCagX2RjoUT+JACR/17g4s16yq+XraV3tB0JsiVfAbw4+p3btqCN081s=
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
Subject: [PATCH 2/9] automation: Add randconfig build jobs for arm64 alpine container
Date: Thu, 22 Sep 2022 15:40:51 +0200
Message-ID: <20220922134058.1410-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|SA1PR12MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5a9331-dcc2-4914-d30b-08da9ca01d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+7ExJfXVLT92z+hYukkpkbiC0FDyowAWmcWgewpFga7kvN9hcUBL9Jbpr/+8xKSFx/3fMivNwQN7PGAa7EaWS4gRzzgUV9JG23Un+si0hfcY4NDT/PVPLPHya91zG6t/eGdRklKB+SNmA/BEtBcSkdC/Ge8rHfyrF5QFAjn0Bdgq8eLOQIKw1kMk8Bxd0FiemsAGL487aqljCXKIGcO42JIDYx/NPv2m4x86cgbc3o1eq3tsnfytK0EZ7ypaWgoMQGeyJW+zXW86x/CY3KnjaGW730EEdICArrgqjm/myp9pcEce0SEnLEt1RsRUImEFKUnyNOmACIHGvMZmkaAK5aXWfBICVuBXElgCrSZ6ByiuiApOTva54/Tcrz4zVio+s+OILIGK33vjPMAYy3fnxZbafoA9X6M8jVUcgym0TOnkrx51BURHfcJLYjv1TuziZvCMESU7w1vQPpn4xO9qbj5AVLOaxmpuqf5gsKiWPURCX18kI0r1eh2kFxqyqgW66zg383iDDWdoTsIzaApmK1aeqiEUg8wMh+piV9sJxPyF16tbZLysU1+Cp3ETG7htzzZ7SXzBE2P0wKLnnVfYsiO5KRMcrpBwlEHtGMBAjF3/gekDomwq181x2gGmxSsBTGGGp8TPPEa1AT3XvnB62KmT8shgo4LbQDK90ukSB39m7WuWpy5CIWkdNuwIkhR2uwjC01gsRd2/bveoSnhuGd1mcP1QsoKhSeN4ifwM+pvFipcqRwIl/6WYoqNVJcyjlpIEzbEjqcjGXO5RmNQOsuYosFzDISiyPacboBTumVzWTIY9L62d8QBfutfS+BsM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(8936002)(82740400003)(356005)(81166007)(36860700001)(336012)(2616005)(6666004)(2906002)(426003)(47076005)(1076003)(26005)(5660300002)(186003)(478600001)(54906003)(316002)(86362001)(70586007)(44832011)(70206006)(41300700001)(4326008)(8676002)(6916009)(40460700003)(82310400005)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:12.5723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5a9331-dcc2-4914-d30b-08da9ca01d4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7320

For arm64 we perform builds using debian and alpine containers.
We are missing the randconfig build jobs for the latter, so add them.
This way for each container we have 4 fundamental build jobs:
- defconfig non-debug/debug
- randconfig non-debug/debug

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a39ed72aac6d..d931441b910a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -566,6 +566,18 @@ alpine-3.12-gcc-debug-arm64:
   variables:
     CONTAINER: alpine:3.12-arm64v8
 
+alpine-3.12-gcc-arm64-randconfig:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    RANDCONFIG: y
+
+alpine-3.12-gcc-debug-arm64-randconfig:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    RANDCONFIG: y
+
 alpine-3.12-gcc-arm64-staticmem:
   extends: .gcc-arm64-build
   variables:
-- 
2.25.1



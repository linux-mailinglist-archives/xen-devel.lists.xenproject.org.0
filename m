Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3884B939
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 16:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676985.1053372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNFR-00057O-82; Tue, 06 Feb 2024 15:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676985.1053372; Tue, 06 Feb 2024 15:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNFR-00054g-5J; Tue, 06 Feb 2024 15:20:33 +0000
Received: by outflank-mailman (input) for mailman id 676985;
 Tue, 06 Feb 2024 15:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Zit=JP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rXNFQ-00054V-DR
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 15:20:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4276dcba-c503-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 16:20:29 +0100 (CET)
Received: from SA9PR13CA0106.namprd13.prod.outlook.com (2603:10b6:806:24::21)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Tue, 6 Feb
 2024 15:20:23 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::c8) by SA9PR13CA0106.outlook.office365.com
 (2603:10b6:806:24::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17 via Frontend
 Transport; Tue, 6 Feb 2024 15:20:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 6 Feb 2024 15:20:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 6 Feb
 2024 09:20:21 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Tue, 6 Feb 2024 09:20:20 -0600
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
X-Inumbo-ID: 4276dcba-c503-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1qFRwkpm9JeAQMbJNmbPmx3lfTcrsDBWJYFQ1Yde+BXp0Ji5PD0FJzqS1GK/R5SZj1GA02jcqCzRfFjhX5i97Xunf/6oI8lQpzOvMNlynta8P0e4bAnkmUUG8yH4jJW2ZmXJFNyVIRjfh/M+nG53lOU3fpQKbhHFnKh1Rmm+j/Kx4qFmaoVxCwK+IvQUhCwZNTFdVAqPrTbDcPZeAK69xK4/XnNuvVErUJIl172JxVJR0SenxSg1rTVJuguQmhbcLNDx0dfIIdtfOPJ6Yl/yPSx7seG5s0qsvxt5+X046nyPXLEcgh2EywvaRzo5P1u4vfjthL8uzLYCtz2S92JFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObWFSn0auNly0ZikMZjFpNo0QtEDh16Yhyn3UiPb+uY=;
 b=DZpj3i9e4tVZtnLZRQDYhKlIh2XEbD30wdF5bxHqVqPvfd+S+8KpcJZ/yvGMhLmvOpNIMxQWkADP2dSqMKP3cVZ3I4IgN3oNdK9VqbIHCX+QCNHzwlD96LCMVr9M156kbm+w+OiBJAm/8qV+wEs7wOlh1df4XAJeVHV1hNjlbyJwKjveOE1nGU7Kag3wq9JpD6SX+K1m/W7uGu7lyTHI21I4x3iWnfktuxkM0WW7zdRR478G9yYyFt75xtt9r79zYv/DEoWzWp0I+CQF88OkNpiNx7hFAEdQZfPw0+LO//iTXo5aAQchj35VTFloS5QgGlFo4G8U+8s8z4uFjTIq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObWFSn0auNly0ZikMZjFpNo0QtEDh16Yhyn3UiPb+uY=;
 b=BdHE+XenGgVGgNlxUoUl/UjMmgJInwj1jP+FI1J+DAijO9w8UzPRmGXCcVw4EO6HyScIHLqz2xL0F25AEKpwr2vUKkQ8kDBm72fe0x80r8uKfuu6zylaUV/RAUlSBVsFkOkLBvORkWff+NiWMBciH3Yg1xlrM9m79Ne6kApC6Bc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>
Subject: [PATCH] automation: Switch yocto-qemux86-64 job to run on x86
Date: Tue, 6 Feb 2024 16:20:12 +0100
Message-ID: <20240206152012.51107-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcdc488-6195-4e2d-1b5b-08dc272722b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mO4qtd2SVCLa5146Cb2XDLL0IlyVaFqZcVZVhIWdDn7+NA1aWoRb6CJ2Y1p7GmrB74MwTvQFmClz5y5A30mJF6fwz78Q+fh8sO1m2mPD5IjjCXUhHdZdCiXCQj+Pgy03pYg4RHkmsmzQ+6gWnDNPdO44OQEDkjmQ7e9lKP+Ah7SaD9g5qrJ3vIWVkBQPtMMakNv5+RE5U4ZnP2W38VYEhkPWhWtmxkmJmmHyk/J8BhThb0oVP9GDO3/T+S6Zp4XnNNO5mbanbDYNcATVZdq9PJDebPK6pALr4LXy3k0AnIBYcagD/fA6Fdeu5nys5Je1RWfQ8BPgwr3OyLb5hWRrUesOCo2a4pROuL6oKrg74EPeeGQvoilBAEBPHo6gVmFYi2MK6au3Pg6xYPsNDCE4Py9v8+GPKUcocpilEbxxjygNoQA4XgBfVFW8ybQu1a65EmK4BoQPnjWhjtR3tPHeN6Oym3uJTdEKDeTuHgt8eaEQk5e7SaOYpVOctQFFXpXul+6ItRd7fUKC/I8aCpsGugxCkRHuEVqYJqI1Fd7tsHiuHUCuZpZtaO15gS59maWnTGLalHZx+j7H+G4IhMhizXJ6ZuxhKBYonN/0XyQR/ah8oFgjWQg9OBZo+PDf1YYYDaA3wAHV7wbG12LbTUBnln/QyH44r0gH9rdO6pMoxuXj+kl/Dnvr7nhQXUEEaTX5tolf7z+xucQXmW3LvTNf7aJcfXUltBIy0tNDwGKenpI/t/eeXrRZdhO/PPPx2S3+qP/v9UhzEBPGv7Cq5O9/3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(46966006)(36840700001)(40470700004)(36756003)(44832011)(8676002)(4326008)(8936002)(5660300002)(41300700001)(2906002)(966005)(36860700001)(86362001)(1076003)(2616005)(26005)(40480700001)(40460700003)(6666004)(81166007)(478600001)(83380400001)(47076005)(356005)(70586007)(316002)(6916009)(82740400003)(70206006)(426003)(336012)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 15:20:21.8513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcdc488-6195-4e2d-1b5b-08dc272722b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066

At the moment, all Yocto jobs run on Arm64 runners. To address CI
capacity issues, move yocto-qemux86-64 job to x86. Reflect the change in
the makefile generating Yocto docker files and fix CONTAINER name
definition that incorrectly expects YOCTO_HOST variable to be set for x86
container as well, which does not have a platform name appended.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I built and pushed a new container to registry.
Pipeline:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/1166227598
---
 automation/build/yocto/yocto.inc |  6 ++++--
 automation/gitlab-ci/build.yaml  | 10 +++-------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/automation/build/yocto/yocto.inc b/automation/build/yocto/yocto.inc
index e4328ec7f378..2f3b1a5b2a34 100644
--- a/automation/build/yocto/yocto.inc
+++ b/automation/build/yocto/yocto.inc
@@ -18,11 +18,13 @@ YOCTO_TARGETS = qemuarm64 qemuarm qemux86-64
 YOCTO_ARCHS = amd64 arm64v8
 
 # Architecture we want to use in gitlab CI (depends on runners arch).
-CI_ARCH = arm64v8
+CI_ARCH-qemuarm64 = arm64v8
+CI_ARCH-qemuarm = arm64v8
+CI_ARCH-qemux86-64 = amd64
 
 define GEN_DOCKER
 # Make all is generating architecture we use in the CI.
-ifeq ($(CI_ARCH),$(3))
+ifeq ($(CI_ARCH-$(2)),$(3))
 CONTAINERS += yocto/$(1)-$(2)$(4)
 else
 CONTAINERS_EXTRA += yocto/$(1)-$(2)$(4)
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30ccedc9..6d2cb18b8883 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -213,7 +213,7 @@
     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
     YOCTO_VERSION: kirkstone
-    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
+    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}${YOCTO_HOST}
   artifacts:
     paths:
       - 'logs/*'
@@ -224,16 +224,12 @@
 .yocto-test-arm64:
   extends: .yocto-test
   variables:
-    YOCTO_HOST: arm64v8
+    YOCTO_HOST: -arm64v8
   tags:
     - arm64
 
-# This is not used by any test job as we only run Yocto on arm based machines.
-# Keep it here so that someone having x86 hardware can easily add jobs.
 .yocto-test-x86-64:
   extends: .yocto-test
-  variables:
-    YOCTO_HOST: amd64
   tags:
     - x86_64
 
@@ -576,7 +572,7 @@ yocto-qemuarm:
     YOCTO_OUTPUT: --copy-output
 
 yocto-qemux86-64:
-  extends: .yocto-test-arm64
+  extends: .yocto-test-x86-64
   variables:
     YOCTO_BOARD: qemux86-64
 
-- 
2.25.1



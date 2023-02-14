Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA7696844
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495214.765503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOU-0001hh-3W; Tue, 14 Feb 2023 15:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495214.765503; Tue, 14 Feb 2023 15:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOU-0001af-0A; Tue, 14 Feb 2023 15:38:58 +0000
Received: by outflank-mailman (input) for mailman id 495214;
 Tue, 14 Feb 2023 15:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxOR-0001Wo-Va
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:38:55 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad369242-ac7d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 16:38:51 +0100 (CET)
Received: from BN7PR02CA0033.namprd02.prod.outlook.com (2603:10b6:408:20::46)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 15:38:47 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::ef) by BN7PR02CA0033.outlook.office365.com
 (2603:10b6:408:20::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 15:38:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.26 via Frontend Transport; Tue, 14 Feb 2023 15:38:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:38:47 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:38:46 -0600
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
X-Inumbo-ID: ad369242-ac7d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta12bThNphkHAZydVdUXkmkG+JwwTOkoadommGHiD09IgXjBBW1by0fzbhKxRCeNEDtkCe/f7JNLvSFvGLDfH7T2oKFPtvuUNWeJkvxVZ2MFPwMBdb5hqHXvaLGl2gAfE3AAQIDNbwqzqjGAqfEKJvsuJ3H82rJc7rWW6YoT6LbxBItvXAvxU0piVqIUDF42q6EIywqDUP3R46zBF5RsW6XNd/4D+UzJ2Av9OfvHsYPYhmxlVV82x5leqaV9pnd9CpLFubFHUwxUGUyR6t4RL6uqTYCPkLJ8m6nAi8xRrKQ5Dlr9PEJ1Ey18klw4/yG/vY+Y0iS3HJwhkRMkO6Myjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBMwFXs2iyyGl7+YYdai6PnoFQtpNzal7lo6WSR2gU0=;
 b=C0i1AqZgTIYFelYLmlb0yG/1xCQZiMtvuZilf4g8Zd0zSILEPRdhYXsF0ONkQr1vjUVi0KiewihkjGosS0ZvVLJfBiV3YSlsXbRFEpoJ+sY2FTioV0KoXund+QhKpWZUIcjKDJntQu6KaM6sm3jYv5UaotpVVE5df004+RmieZtZaBOlkWylnbZ08WbSA98V/tuCoTEDwe8m6NKcNr3z7/APqYsi9hpriWvGRPOT8TTe1HBM+s0iBgzTclyQODaKGGTjmawRYRwf6umjHhBtisDGtm6htN3BrWnm4KhopNIE37rSL+HAf9XGWcvATkrzPK9UvAHoxRQQI+p2HW5xJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBMwFXs2iyyGl7+YYdai6PnoFQtpNzal7lo6WSR2gU0=;
 b=vUMomFGwdZLrE0Y/RmFqvyrnm72ATArsasPi4an4hZDN6K9KzgciqVF4T6Up9Tsl7LtRpdy63ycgLMn4OniIB3RaXPmqYAlGontOi2iye7FNsxqdjjmxDqc6UHPVCPrvHwPdD1q2XMtMsk/BHJZJ7Ll6tpBn9OdOBhZ2crbtf7A=
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
Subject: [PATCH v2 1/5] automation: Switch arm32 cross builds to run on arm64
Date: Tue, 14 Feb 2023 16:38:38 +0100
Message-ID: <20230214153842.15637-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214153842.15637-1-michal.orzel@amd.com>
References: <20230214153842.15637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a065924-8f57-4207-fa46-08db0ea19043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sYuq54mPUTnDagYjCATStV04epwf+GdG6DSKT3nWOfLnaIFhsVK+Hn++JIVwUyzU8Y4I1c/S4xGH4NHcPNO+7x5OsqPwWN6hH5l9G+mwBBXlRdiv3k9q/1VcR6/jwwUs/TuqpL706cobJILoDmL5FRTieacXzSMZEOVF00cYx+p7t7QSRV1qJqkmJ3TNbUjZ48DyE8FKwhy3v3UEokdSxjVnE0SX7ocehtCZWb91nQ91uQltJnlCzXuOcbtgB+YxW6dIaldVpbNvz/GqSL4mQaZ8jmYJi9gSCbHTgsHwJJWK8DSaBlpwJxCAYj4Pr2lPwW2l/JE6Zk71ncbXi9QHwnBCWCX0dSLufFw3e9LImuMhztff2FCAljvhZgSC8DdRHRQc/Tmr97l3nCglM+UKn7RVN/eW/JMpnjOWqu5v2PgU85OTp8LSP4zjHKPmVWQS/QFAAoqNAsH4Jo2GOl4GuTQNbG6hG9v+ItFPiz2vEV9vKCwD5S94Fkn3wXgjqDLcJ+eydkbxnY20v7Dn2f17Gkm11+94ymT/MGOt7XG8DhZANmmxy+AUAriSbF9WfalgtQ7FoC/GDcHn3Qxb7yPi2dKwoOknjA7E296EV3RTGkrU+tw7M8EH7U0fofBdFScgeA4eAPg2OGAT8iMqFHplLdtUx2glMf/UlQ0bHGhYcG9EjPOQiF09+c5N2e9P4b/8JZm4WikEL5gFo8wbdUWk7cF/ZuqPIfRQWg1/d7veuio=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199018)(46966006)(36840700001)(40470700004)(336012)(26005)(186003)(36756003)(82310400005)(2616005)(478600001)(86362001)(426003)(83380400001)(47076005)(1076003)(6666004)(54906003)(316002)(40480700001)(4326008)(41300700001)(36860700001)(8676002)(6916009)(8936002)(70586007)(5660300002)(70206006)(44832011)(2906002)(356005)(81166007)(40460700003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:38:47.5486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a065924-8f57-4207-fa46-08db0ea19043
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717

Due to the limited x86 CI resources slowing down the whole pipeline,
switch the arm32 cross builds to be executed on arm64 which is much more
capable. For that, rename the existing debian container dockerfile
from unstable-arm32-gcc to unstable-arm64v8-arm32-gcc and use
arm64v8/debian:unstable as an image. Note, that we cannot use the same
container name as we have to keep the backwards compatibility.
Take the opportunity to remove extra empty line at the end of a file.

Modify the tag of .arm32-cross-build-tmpl to arm64 and update the build
jobs accordingly.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - new patch

For convenience and own testing, I built and pushed the new container
to registry.
---
 ...ockerfile => unstable-arm64v8-arm32-gcc.dockerfile} |  3 +--
 automation/gitlab-ci/build.yaml                        | 10 +++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename automation/build/debian/{unstable-arm32-gcc.dockerfile => unstable-arm64v8-arm32-gcc.dockerfile} (94%)

diff --git a/automation/build/debian/unstable-arm32-gcc.dockerfile b/automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
similarity index 94%
rename from automation/build/debian/unstable-arm32-gcc.dockerfile
rename to automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
index b41a57f19729..11860425a6a2 100644
--- a/automation/build/debian/unstable-arm32-gcc.dockerfile
+++ b/automation/build/debian/unstable-arm64v8-arm32-gcc.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:unstable
+FROM arm64v8/debian:unstable
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -21,4 +21,3 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a053c5c7325d..f8e156e0a994 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -123,7 +123,7 @@
   variables:
     XEN_TARGET_ARCH: arm32
   tags:
-    - x86_64
+    - arm64
 
 .arm32-cross-build:
   extends: .arm32-cross-build-tmpl
@@ -542,26 +542,26 @@ alpine-3.12-clang-debug:
 debian-unstable-gcc-arm32:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-arm32-gcc
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
 debian-unstable-gcc-arm32-debug:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable-arm32-gcc
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
 debian-unstable-gcc-arm32-randconfig:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:unstable-arm32-gcc
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
 debian-unstable-gcc-arm32-debug-randconfig:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:unstable-arm32-gcc
+    CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-- 
2.25.1



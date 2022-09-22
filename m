Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57D5E63DE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410152.653161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMS7-0004KZ-Hr; Thu, 22 Sep 2022 13:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410152.653161; Thu, 22 Sep 2022 13:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMS7-0004HH-Eb; Thu, 22 Sep 2022 13:41:19 +0000
Received: by outflank-mailman (input) for mailman id 410152;
 Thu, 22 Sep 2022 13:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS6-0004DO-5f
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39d70b37-3a7c-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 15:41:15 +0200 (CEST)
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by BL1PR12MB5064.namprd12.prod.outlook.com (2603:10b6:208:30a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 13:41:11 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::44) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:10 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:09 -0500
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
X-Inumbo-ID: 39d70b37-3a7c-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwa1zCoCSHOwTVbXHPxXFwsVXM8OKiLWulRTxQ7FdZc4r0HSvKOZZmygmOT1KtoeX27Tnpujj8nuEXU/25WhUqu88HU5KgfYMs6Vi9JQtSdO8JbjackV8ve5RvUd51lrDbs3Kq+3K0tWguHUhIgS/jTqRb+OrBsuHSrKdY3ZRjj+/SHXLQR+hJzkD5Pl0KKz7nhRljO6yIL3qh3ygWJItSmBy6Bs8QbnPbzuTBDIm1y2e3VD8a+KN4VP+TKk35LfcsG8BFpxU28ZgkT0SB9BrGYv+1T7ftPBOc8jDxOo1zYBZYoyyZQaZ62200deq/0Ltrxc3r9hV436D3cv+BRbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9TCf2AxGrtdVWLFPiW0EV7Q/lCaLP6Fex+1tR1yXPw=;
 b=TqzCMkrHSeRYrz/EWeUxX3EgTjumKbtXpmQ9pLLE6BG4A25MyDN6Ihmx0771OSP41dpBe0XX2DRFDQUXWXXtwmIpk+g1OAGgHQtWMGbsdu4Oabe3lNxZjz54XDXobBWx0Uq3u7J2Hr2DXZjlbN3CHsRPLTXC5i947YiCp8tcLvlWpUe1P5sRWnGWppTMhR9U5ZUu+eZypRFK3Sf/d0QfyM1wJzL3M+KQlhSt3elS6ENspirx+wEZTWUp5spMN4dpmusHiTnppPDPFFSPQsGrDicJWP28BGfMBLHdXutjlTbakb//gLNWh+JchYFV/yISiSpGrWi/KODyDIwY86bTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9TCf2AxGrtdVWLFPiW0EV7Q/lCaLP6Fex+1tR1yXPw=;
 b=2tQmDPr1T9DMDBuL1Vk27CTB9hjkI6DLBOgy5eFwk1n2223WnUTPhr7ov8IZSpeirukjLNdmufYRq1qKD3niUen0nYgfQwDM9vrrk9Tpm4TgFDzzc17Kneebv6bbBSk8HXvwExSR96Ew/XykCkN/nV5Y2FQijRbGPBtTLdOifDc=
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
Subject: [PATCH 1/9] automation: Use custom build jobs when extra config options are needed
Date: Thu, 22 Sep 2022 15:40:50 +0200
Message-ID: <20220922134058.1410-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|BL1PR12MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cbeff9-316a-4c6b-84b8-08da9ca01c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7nePnWmnlLlFLfKH3MlRMEAaPogyHi16cv+SDVYHkCO7YDJ1qxt3rHVPezAMVFG1cMzEWj82ZSZiYGDms7vJBn1Btydtl9xYpOf513K16M+8aFpWsxxyXLHkh05ORx2uEpntWG+asHxmpD9DRlMHRobTdCnsYZb3/7jhmkr9d46NaacTql+lOpXGkJpkO6yOZ3CcOgDwnBavGqLPldpSxdnAb+vYIX/sT12Uq+5qGvA/1ZL4SGeaKB43YnMqwgfdscVYLq2PGnVbXqZukDg81Z+7/DvwrdlTXLcNcWpKET+eOWwbii6oFg1BqmAQ+Si85BpezW1vAg/EL89DDVslZbhdPGgFYIhWROy6kbKSlmvxGwK1qEGSO6hEA2DocpQzBozI4MoJCWI9gG8iA0kMIwhIIdbso9VmG6lTHJRUgx7TVfw7H7Gyg8G/9c4DqGw1srrwx50BDK1Cw8ENw0pXKp43/TJZvgoYBOyLepCqDqEMZLNxZrhuT4xd/IURzgMQFd7R1W8Y8IRbcYWJpqQ44Qwk+qVp8aLsmpKUHO4W1x0gFAvzpLMxDTOVjY5yl49TuZO4aKRoEgrSjuPbruPiMKbkDHG3EpHehEOclRYm7NBEX2AX39v62LXxjguGXBVd8ETCYDygDbywcHRfENZT7VfjF9xUEA4kvuh96jlmRuWUKmOlJQ/bOP5J+fssgzpDXEV+tbKHgnYGm3XgA7hqaB7vlq/R56kwW7dovVLVgU67ojlVcprZW2RKHNhlFUB+B7N9B77wEiejZB8+aB6am0O9QClNHOhvxeJHAiChaKS+3RlmeNyhhxo4EfDZ1IGy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(40470700004)(46966006)(36840700001)(356005)(82310400005)(2906002)(81166007)(86362001)(40460700003)(82740400003)(36860700001)(6666004)(41300700001)(26005)(6916009)(4326008)(54906003)(2616005)(478600001)(426003)(5660300002)(316002)(44832011)(8936002)(47076005)(186003)(8676002)(1076003)(40480700001)(336012)(83380400001)(70206006)(70586007)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:11.2359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cbeff9-316a-4c6b-84b8-08da9ca01c81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5064

Currently, all the arm64 defconfig build jobs, regardless of the
container used, end up building Xen with the extra config options
specified in the main build script (e.g. CONFIG_EXPERT,
CONFIG_STATIC_MEMORY). Because these options are only needed for
specific test jobs, the current behavior of the CI is incorrect
as we add the extra options to all the defconfig builds. This means
that on arm64 there is not a single job performing proper defconfig build.

To fix this issue, add custom build jobs each time there is a need for
building Xen with additional config options. Introduce EXTRA_XEN_CONFIG
variable to be used by these jobs to store the required options. This
variable will be then read by the main build script to modify the .config
file. This will also help users to understand what is needed to run specific
test.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This patch could actually be consider to be taken for 4.17 release.
The reason why is because currently our CI for arm64 does not even
peform clean defconfig build which is quite crucial target to be tested.
Performing builds always with EXPERT and UNSUPPORTED is not something so
beneficial for release tests. This is up to the release manager.
---
 automation/gitlab-ci/build.yaml | 15 +++++++++++++++
 automation/gitlab-ci/test.yaml  |  4 ++--
 automation/scripts/build        |  8 ++------
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 720ce6e07ba0..a39ed72aac6d 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -566,6 +566,21 @@ alpine-3.12-gcc-debug-arm64:
   variables:
     CONTAINER: alpine:3.12-arm64v8
 
+alpine-3.12-gcc-arm64-staticmem:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+
+alpine-3.12-gcc-arm64-boot-cpupools:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_BOOT_TIME_CPUPOOLS=y
 
 ## Test artifacts common
 
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d899b3bdbf7a..4f96e6e322de 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -88,7 +88,7 @@ qemu-smoke-arm64-gcc-staticmem:
   script:
     - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
   needs:
-    - alpine-3.12-gcc-arm64
+    - alpine-3.12-gcc-arm64-staticmem
     - alpine-3.12-arm64-rootfs-export
     - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
@@ -107,7 +107,7 @@ qemu-smoke-arm64-gcc-boot-cpupools:
   script:
     - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
   needs:
-    - alpine-3.12-gcc-arm64
+    - alpine-3.12-gcc-arm64-boot-cpupools
     - alpine-3.12-arm64-rootfs-export
     - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
diff --git a/automation/scripts/build b/automation/scripts/build
index 2f15ab3198e6..7d441cedb4ae 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -15,12 +15,8 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
     hypervisor_only="y"
 else
-    if [[ "${XEN_TARGET_ARCH}" = "arm64" ]]; then
-        echo "
-CONFIG_EXPERT=y
-CONFIG_UNSUPPORTED=y
-CONFIG_STATIC_MEMORY=y
-CONFIG_BOOT_TIME_CPUPOOLS=y" > xen/.config
+    if [ -n "${EXTRA_XEN_CONFIG}" ]; then
+        echo "${EXTRA_XEN_CONFIG}" > xen/.config
         make -j$(nproc) -C xen olddefconfig
     else
         make -j$(nproc) -C xen defconfig
-- 
2.25.1



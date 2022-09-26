Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579955EA248
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411619.654620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclui-0001lI-Cx; Mon, 26 Sep 2022 11:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411619.654620; Mon, 26 Sep 2022 11:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclui-0001hX-85; Mon, 26 Sep 2022 11:04:40 +0000
Received: by outflank-mailman (input) for mailman id 411619;
 Mon, 26 Sep 2022 11:04:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclug-00019b-Nm
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:04:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01fcdded-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:04:37 +0200 (CEST)
Received: from BN9PR03CA0044.namprd03.prod.outlook.com (2603:10b6:408:fb::19)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 11:04:32 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::3a) by BN9PR03CA0044.outlook.office365.com
 (2603:10b6:408:fb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 26 Sep 2022 11:04:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:04:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:27 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:26 -0500
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
X-Inumbo-ID: 01fcdded-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huYSwbO/Up1yeGBU6QHEigeA9Om0mjWp+mwZvSX5pkcxlcokyN92sJ9ZzABztkifxcznDRkhxMTumbMpctFiba06n2NXBHQgyqPfPrbYm6LdezJBNw2B00NpYFud+gP2ZJoEtTo3qimb8vwvuu3FBAw8iZ16a4MgZ4ECRuWF4cHakRBiTgFHv9kzEIyrZPWLn+HfNoyetr/6co9+DH05Q/Itqd4553QejJzUeB4vcANZQaylgAazsYXAjA0y4wTcp5sYxjLlou4PkD3TsdLrJc035pUUK5O1ToNp8itLW4JYPuQ97GW6AWCUi7wn/7I57D2s4XzVW2gMx6jvh1WSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at1Tt/XQ9b3STVOqJM76Aoj7GeN5AMiBivYZKaCUdFE=;
 b=Nuq4hGM7lZb9mbis1g9RPCpV4vv2jO0Df7v/2gEh0I9XgwFvD8yrP2/tlaUUZuHx5DYm2aBWlu5Rg6CqR5lcQtFHnJ1x0kRkAbC0fuxi6VEODV8N8NsA9j93flVPY/iINZBv5tMU2Fixm2t/xk9erhvKY+NVqqpRNrFJpSi74rRVdTt/Tu0hTsM97bcQ/hpSe148bqAy/6hWRUK7UiMt9Ym0gh3/ccZnGFz5O26gCATrN9lPAjVMzAPvlM9u7xTVelhmRRioE2sDayEvOl6tYW3/vM0BzQr/O8bo2SOB6LlFTknnnghiHbHZROTP90ccoZwuPAeXqucHLFZj/dlPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=at1Tt/XQ9b3STVOqJM76Aoj7GeN5AMiBivYZKaCUdFE=;
 b=joOm6EHaCDXxbxneow8Tc7PMOB47ol3gwMnXPuCc9vYskSNtEncGkcJk9dEXQkSHpo6I4r/JKCS65UmNTBY+S6qHts/sAina5muuZP37XCt8PoFjhupgZXMOQYpQPClyxvElGcPR754x42vkP/1JMDJVev+o034A8yIoOYlijtY=
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
Subject: [PATCH v2 01/10] automation: Use custom build jobs when extra config options are needed
Date: Mon, 26 Sep 2022 13:04:14 +0200
Message-ID: <20220926110423.26030-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6ef89e-0ade-4e1c-6892-08da9faee3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NztyCu+/48sBFXREylwTXH5yXcxLzujaqasCUWOGPFGG2zgY+v05KlKrbTTP+Lc9XZ3zoif52ptDXye3DbVoRs/p1N8aICHKpMSEWoTEuR8CD+TWJw9HH76EFvGp+MfLaZj+Kw01vWIQW4x3Wk1oFqP2+lOOjUPUPZLZu4VF9z57EJsirpIrMSk+IBu+I03DKcey2poOIwCTEFMhQwDQlvn51l7GhzUFmYCjkxfTPKDPAzqSjbR88ie//0TqjpaSRAzPscp2YqLvP8Gxvj52uOe9tUVlFqgwy5Q3fvx8oJe9a3X+s5F2yTDDcro4E6VvFrNY1xhECxU2kxjTMvQhzVDgEjD/uDUfbBtdF4BZEvrS6HiNdb+JP51+tLqWuILn7cbdiXbL59pxebyXW7AkrXrf569vMgeJgDuDFSm9CMCQCAtwDbd6up88zYPK3i6AbYPLG62m3vfXhwZ9MkjnumLh74ksaF61yX+iStxVgXsqusDPSFXblegvwMixda1zQYoNk4/5RogbL7fsgVnU7ZWyw1pX3cVbithH+ZBS3HruoChjtrlj5iJr29f0CcHRIVGzjGbFzMOxsF9VExohvqkZx+P3FMXpB9H9qXBwrp0q6MJXF8lhrSrV2ER2tgULjL+5gmyX1qN86rH6HCuc2o1d9OJZfvZBy0DUQuYbx16zcW7o3JbYIRZSqQCyPbpFnVbqkowbkiT21Lc5bAoBiyV75zoVyIj+l9dkkS3d8g/JPdmIhv17oTlPetRNR+9sQRsTDMS3l8AzlBirIqrc9VC0IXzHTisiY4PA0itaZDZe2LYaC+EJFAIc4k1K4tlg
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(8936002)(5660300002)(2616005)(1076003)(336012)(186003)(426003)(36756003)(44832011)(316002)(6916009)(54906003)(86362001)(2906002)(82310400005)(478600001)(26005)(6666004)(40480700001)(83380400001)(47076005)(82740400003)(356005)(81166007)(70206006)(70586007)(8676002)(4326008)(36860700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:04:31.9033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6ef89e-0ade-4e1c-6892-08da9faee3b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044

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
This patch is supposed to be merged for 4.17. The release manager agreed
on that.

Changes in v2:
- replace [ with [[ to be consistent with other ifs in build script
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
index 2f15ab3198e6..bcfa6838f0bb 100755
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
+    if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
+        echo "${EXTRA_XEN_CONFIG}" > xen/.config
         make -j$(nproc) -C xen olddefconfig
     else
         make -j$(nproc) -C xen defconfig
-- 
2.25.1



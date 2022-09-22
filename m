Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C103B5E63E2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410154.653183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSA-0004sV-8y; Thu, 22 Sep 2022 13:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410154.653183; Thu, 22 Sep 2022 13:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSA-0004pR-4P; Thu, 22 Sep 2022 13:41:22 +0000
Received: by outflank-mailman (input) for mailman id 410154;
 Thu, 22 Sep 2022 13:41:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS7-0004DO-VU
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3af48310-3a7c-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 15:41:16 +0200 (CEST)
Received: from DS7PR03CA0217.namprd03.prod.outlook.com (2603:10b6:5:3ba::12)
 by DM4PR12MB5231.namprd12.prod.outlook.com (2603:10b6:5:39b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 13:41:14 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::d5) by DS7PR03CA0217.outlook.office365.com
 (2603:10b6:5:3ba::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:12 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:11 -0500
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
X-Inumbo-ID: 3af48310-3a7c-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxxq3/G/+eaGEXQKi9kXlOn3HbCnDIzgD1ijoOkFXm2WOc1+FercXLkpPt4zDYuZvKr0/GJwKTgcDfpiy4y2bjudr2zuLYhLbjAlLigBWIS0jcX2b1QTOVKSIUgLcHbhvDQmyYzs5zcliyU4ZHHj7x/pN3+Z9LhuFy4M9MEZ4Ntm1Avoiw5iZ7WfQZVq505PMXiKzug/z1CXqIoz1a1rXujpLHO1TfjhqjrHyocMmP0enomp4wDQIUPypC4K5IOfj9/SbFJ1oJMs/h2n94oIdHpuLFk/QV99YHh9DIFcxpn/8SB0Il36r1GewRiJ3on2aUr2DKrHhAkN/79pTF9rBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CObcfLEMvCRWZoj8ShK1q6RkPuWESR5Ohvzwl8WyaUc=;
 b=n6dj76W3fv3w1jqBb1AWxE2SlCuLylLyv0LhaXnT3O3O0aR6aUy5nIiZ+EmtRKgWtvDivfiwCqU8WI7pKCgKf7oBp3mGwAP85hWdu0q0YU3K/xQPov1xqTi6YEu4lC5rQyTla67Ufls6t++Bqd4pems9zJizgFA/ar2rP8wZWIdzVuHhESybKXLHSHQGfekqL5m73G91S1dHboeY/iARGXH5FWSI5CoXjHYFRLveu6mxG9gylB7Y9BGcrYENm6GKmIcKJZ+KcI2mvcAWlBwJESl1xY+fmHQvw8gQqHSGWW2dnxoWNNiS6gUQYSCDoWxITkTrJ7Bmrpj4gzpYOXdu6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CObcfLEMvCRWZoj8ShK1q6RkPuWESR5Ohvzwl8WyaUc=;
 b=ox4zR/eZbvjmkLTnts0aJz3/u4t74WmgbcO+1/TixkbSqZZer1w1waBuOSFdZgM2K+mTgGJkv4BXLUgjVZtzF8ksNngyaJmjAc6i+AvDBZfS6Qau0sdGTqTwYNXKsGfWZCnQ/T/KWwX554LxyP18W1aYGlBf+IfU6BPYdgByL+Y=
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
Subject: [PATCH 3/9] automation: Add debug versions of Arm tests
Date: Thu, 22 Sep 2022 15:40:52 +0200
Message-ID: <20220922134058.1410-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT045:EE_|DM4PR12MB5231:EE_
X-MS-Office365-Filtering-Correlation-Id: 099d2bec-58b5-4b46-2865-08da9ca01dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y9OC22kHakLaZMKKbDA/9QVEz3m8Ah2W5VQH42GO05iX9rMn2Z8FnHbHdfXbBYd2D7eih/dl7FMg4qcPOsKq0DMnGppn+CjrTUqP49jriBBNE1oSvkhqK+xEa9QG+1uCJRKOzmCbX55QAI1kHptoFwAqngxAlN2lX8l97lZeGdq/eytXeEctuHOWszuZLUa8Zcm6fMl6S9jeuRy1HlPCCUR+VW+4suODj3rRTb6HgNIQMsRieGhXp3MxnwLukAlH0tAFotWHM0E6UDAK54LYbflQ/zgq+M/Ys0dc0/6s4KJHv7SulTLGrolQoXbOFIwzbNFxMCdfmCcb+TVcHXZV0El669mJL8YmXtpwSvXIdwlBFmYSPjbK0zoJSNgqGDu8hu5x1uIYmAwLaH3l5y7pe4bdsqtJ9xcrA6n01DP9vi+TtT/qv/L6tup5XLsyAKoMmP0A0/vV5VvrZOf09AbYTZIOs0z59DqEUuc1AbNqsd4WH/pT3saCaQFAHlLwM279h2ju/tko1AzLs6YNxPyEu+HS8cprfjIpMfC+D1/9raZVXso/yZMYshcO+tzU376VI9sE2V+gE154VfVGZlbVHR7SM2wEm/Hj3M0LdvGU8p60f6A6LyCcG5GYOpK2ll70z2hQLzI8V5QsNulDiDI37K0O1LMJZg1Xj4vpr03uFkOtdVVIilYB/6KDxAd8s/P32zDUePXjAMIhGPWKoiq7EKhiuSYVcaxussHkvy9qVwnICSjqJnzgPuipf/DWZ/jV6NmN7YOOEOCZSBIDOh1+FVNRcFB0/DakNMzSy9i5dW6OhiPj/zxJpYSr1MIP81mE8cD5VttjAQyXZuWLxrULkTZ7bZ9k/eUbx95y0VXP7Oo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(478600001)(316002)(54906003)(8676002)(6916009)(44832011)(40460700003)(966005)(5660300002)(26005)(36756003)(336012)(2906002)(426003)(70586007)(70206006)(2616005)(4326008)(1076003)(6666004)(41300700001)(8936002)(186003)(47076005)(36860700001)(83380400001)(86362001)(82740400003)(40480700001)(356005)(81166007)(82310400005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:13.7370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 099d2bec-58b5-4b46-2865-08da9ca01dff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231

At the moment, all the tests are executed on non-debug Xen builds.
To improve the coverage (e.g. we might catch some asserts), add new
test jobs using debug Xen builds.

Take the opportunity to increase RAM size for QEMU from 1GB to 2GB
in qemu-smoke-arm64.sh as the debug builds take more space and we might
end up in a situation when there is not enough free space (especially
during a static memory test that reserves some region in the middle).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/gitlab-ci/build.yaml        | 16 +++++
 automation/gitlab-ci/test.yaml         | 93 ++++++++++++++++++++++++++
 automation/scripts/qemu-smoke-arm64.sh |  6 +-
 3 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d931441b910a..6ce92531f61f 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -587,6 +587,15 @@ alpine-3.12-gcc-arm64-staticmem:
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
+alpine-3.12-gcc-debug-arm64-staticmem:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_EXPERT=y
+      CONFIG_UNSUPPORTED=y
+      CONFIG_STATIC_MEMORY=y
+
 alpine-3.12-gcc-arm64-boot-cpupools:
   extends: .gcc-arm64-build
   variables:
@@ -594,6 +603,13 @@ alpine-3.12-gcc-arm64-boot-cpupools:
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
+alpine-3.12-gcc-debug-arm64-boot-cpupools:
+  extends: .gcc-arm64-build-debug
+  variables:
+    CONTAINER: alpine:3.12-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_BOOT_TIME_CPUPOOLS=y
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 4f96e6e322de..1b51030c6175 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -44,6 +44,25 @@ qemu-alpine-arm64-gcc:
   tags:
     - arm64
 
+qemu-alpine-arm64-gcc-debug:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+  needs:
+    - alpine-3.12-gcc-debug-arm64
+    - alpine-3.12-arm64-rootfs-export
+    - kernel-5.19-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-alpine-x86_64-gcc:
   extends: .test-jobs-common
   variables:
@@ -81,6 +100,25 @@ qemu-smoke-arm64-gcc:
   tags:
     - arm64
 
+qemu-smoke-arm64-gcc-debug:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+  needs:
+    - alpine-3.12-gcc-debug-arm64
+    - alpine-3.12-arm64-rootfs-export
+    - kernel-5.19-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-smoke-arm64-gcc-staticmem:
   extends: .test-jobs-common
   variables:
@@ -100,6 +138,25 @@ qemu-smoke-arm64-gcc-staticmem:
   tags:
     - arm64
 
+qemu-smoke-arm64-gcc-debug-staticmem:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
+  needs:
+    - alpine-3.12-gcc-debug-arm64-staticmem
+    - alpine-3.12-arm64-rootfs-export
+    - kernel-5.19-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-smoke-arm64-gcc-boot-cpupools:
   extends: .test-jobs-common
   variables:
@@ -119,6 +176,25 @@ qemu-smoke-arm64-gcc-boot-cpupools:
   tags:
     - arm64
 
+qemu-smoke-arm64-gcc-debug-boot-cpupools:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
+  needs:
+    - alpine-3.12-gcc-debug-arm64-boot-cpupools
+    - alpine-3.12-arm64-rootfs-export
+    - kernel-5.19-arm64-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-smoke-arm32-gcc:
   extends: .test-jobs-common
   variables:
@@ -136,6 +212,23 @@ qemu-smoke-arm32-gcc:
   tags:
     - arm64
 
+qemu-smoke-arm32-gcc-debug:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+  needs:
+    - debian-unstable-gcc-arm32-debug
+    - qemu-system-aarch64-6.0.0-arm32-export
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 qemu-smoke-x86-64-gcc:
   extends: .test-jobs-common
   variables:
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index f803835779f4..dea26c6c0a8f 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -52,7 +52,7 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./binaries/qemu-system-aarch64 \
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
-   -m 1024 -smp 2 -display none \
+   -m 2048 -smp 2 -display none \
    -machine dumpdtb=binaries/virt-gicv2.dtb
 
 # XXX disable pl061 to avoid Linux crash
@@ -117,7 +117,7 @@ cd ..
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-MEMORY_END="0x80000000"
+MEMORY_END="0xC0000000"
 
 DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
@@ -158,7 +158,7 @@ timeout -k 1 240 \
 ./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
-    -m 1024 -monitor none -serial stdio \
+    -m 2048 -monitor none -serial stdio \
     -smp 2 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
-- 
2.25.1



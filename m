Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3645EBEEE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412369.655685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bt-00078O-RH; Tue, 27 Sep 2022 09:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412369.655685; Tue, 27 Sep 2022 09:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bt-000759-Jo; Tue, 27 Sep 2022 09:47:49 +0000
Received: by outflank-mailman (input) for mailman id 412369;
 Tue, 27 Sep 2022 09:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Br-00061O-5x
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 700e7a1c-3e49-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:47:46 +0200 (CEST)
Received: from DS7PR03CA0280.namprd03.prod.outlook.com (2603:10b6:5:3ad::15)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:47:43 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::2b) by DS7PR03CA0280.outlook.office365.com
 (2603:10b6:5:3ad::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:42 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 02:47:41 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:40 -0500
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
X-Inumbo-ID: 700e7a1c-3e49-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCesbBtIKwbUfv3yM9BXTbMfvhL5GZO5HGbjeoe9NtqJfT+96Te9GwCnzXOhEMFlpfU5SlCV5Ooq7j7CeLzHTahswCA4EQIZY98EgG9B0uYG+U0qidiiY9DRz/53+MwuRXlp6ptd5BOhz2K+p9Zmy3jlaNg29FfOqyF+oFXwzPf7p6VyHegzWmOdqUhhXz/KjSQgeYVkg2fbIQd4cvAZUUUtlgiBT3Tb0f86LqRVkSvMM5kmkDg9jhbOvIXIra5H0MlMLRJaUrniJWWM/bO1JUNQ1D5M7rIcleTC2Q0ruCfiBMlj2bTi3jBNHnyUonRJIy/O29eEEgN5aDoO/XwMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuKLKY8idf1qklY9xgs/6+QEWyLsQvNEVKQ/F/9igT0=;
 b=Ngv5ChdfLulrUaxr28yThzZsEvZPYIpxYEzXo/xf3UDeQormrUg/BxRjUfa0rEeg/MtJWk5MpkhzqsLT0K5mk7QRkN7YxrdyB/gSKF0a/cspQ+UosnLpX+z8uQKU0R6+/9c8rMU9B5S3jF/yfgA2ioSHWj8STurXn930EjmGIFJ763ED0e/ojjhUac/4GKE28HxFXYaCi2x4CdBSJff1OjAb5ppgnugPC3gp/6Xu5IJkwnRtxmfbtd+45nZ6cWnJG8zNqgHjbvQ9hhZGrX0WQsVrqSSe6UUBTfX7NoQ5oR+71+l0hd88fOEjMqEVmf3A2KkoX993Ii3fvdXSm17uoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuKLKY8idf1qklY9xgs/6+QEWyLsQvNEVKQ/F/9igT0=;
 b=alSlFh8jOr9+8/y587Me2q5p+HQLjmNhu807tkYogCtO4oQb/gw/Xm5eC6KZLBquhOnXMQUaSbsMfTc3dEfw9qpXeNBdKfCQD4AzsYTElgCYOF7QdVlGX3YTfDSLCP8aQcZ4XLUBrbA5XDDjYHsK5ES97mAjH5Jzqo+bfo8SxzE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v3 04/10] automation: Add debug versions of Arm tests
Date: Tue, 27 Sep 2022 11:47:21 +0200
Message-ID: <20220927094727.12762-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT022:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b1cf62-caa6-4e3b-a27e-08daa06d52b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zDp5ldLUMi+Uw9GNAcSObcIc0cr//D/4vDMsJ276PN+TtINyMVGRRHzbLmipdSXgygwQXNoInU0qnoAXYdvmHf4tDF9LQE//xE7IE1LGMFh4EUNjcqAp277G0zxFdhaSwqjhG7cOmWimIThQXf/rB4DngColACvlUOnPmpfl16qHnl7McQ2djib4mpNPuZ3gi1xOzKsIDopAHciEtYSEs+2Q2SXbVnklqjVXJwK/bpXLiT23v4d07yCIOKboTwc4dTf1EBCeNklZpQEup4/K01T2bWHaSMdYMAFHFjSAcB96dVMJwMsnHkmPKM9BMeakwrFhlf6TSfHIeEJDoZlVHKQ+RrcAIRI3QeDfngyMRZ0dWzi2SxwWlt7KNAnsRSTX2QTsGj5YAWaV22WeZUWSCGfFExXuELfo3gWhnHCG4LwcboASX+SIgpnYTEicy/5V6Aj0+IOdWvZVEkLR0eEVX0wUX2sbXR90xihj5rMr/+HIIf647cQunb+7QYbPHZ1QDysHXIXn0varFPArlyAyQ1Vy9W8wGpuBgaTh0+SVSxrhRmiVMgIR+AycoRVWRCJiCwZHbGMBz4ERJE922VgR0Ovlvezqpetktf2fPeNhgbSghquzeWm5QU2wzR2fPQ7R52I18J6FZl1x8neoTh5L4fSG70ca4fa8p7NrKYepCbwnRx+Ch7/gD0q9EGngP27rzwZLC0MBfLpR1tgagGXcGUjbahoAokOPsOndK/n6uCCrDJv2KHsl+CcRxJt/DandXFIHhwoa2ZTQZQ0/LiTg/hbF8PtezYxLvlS26CH5m+Pm8EYu5tO+nQmdlqkS/uea
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(316002)(6666004)(70206006)(426003)(54906003)(86362001)(336012)(6916009)(2616005)(186003)(1076003)(36756003)(47076005)(40480700001)(70586007)(4326008)(8676002)(41300700001)(478600001)(40460700003)(2906002)(356005)(8936002)(82310400005)(82740400003)(81166007)(26005)(44832011)(36860700001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:42.4964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b1cf62-caa6-4e3b-a27e-08daa06d52b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604

At the moment, all the tests are executed on non-debug Xen builds.
To improve the coverage (e.g. we might catch some asserts), add new
test jobs using debug Xen builds.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v3:
- none
Changes in v2:
- carve out the RAM size change to a separate patch [v2 03/10]
---
 automation/gitlab-ci/build.yaml | 16 ++++++
 automation/gitlab-ci/test.yaml  | 93 +++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

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
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E175EA24B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411621.654643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocluk-0002P0-9g; Mon, 26 Sep 2022 11:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411621.654643; Mon, 26 Sep 2022 11:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocluk-0002Ff-3d; Mon, 26 Sep 2022 11:04:42 +0000
Received: by outflank-mailman (input) for mailman id 411621;
 Mon, 26 Sep 2022 11:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclui-00019b-Ja
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:04:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0217ed46-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:04:37 +0200 (CEST)
Received: from MW4PR03CA0189.namprd03.prod.outlook.com (2603:10b6:303:b8::14)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 11:04:32 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::93) by MW4PR03CA0189.outlook.office365.com
 (2603:10b6:303:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 26 Sep 2022 11:04:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:04:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:31 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:30 -0500
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
X-Inumbo-ID: 0217ed46-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhvdR0h/R41oByteBayC1Rh/YEvrlugnHVoUFNvIJUQd05EL4m/m8Xba8TsmG6kdUwjbJNxedfpRDEbYlYu/8pVM6WBaMNRfAL3KiQ7EJV+2g6VTRUBsvUasA5OvV9TegZjmxoO8+OFBNYA07oa4+eaWV6kdaP1UUjx/rAwnNsQTJBRL2HS38HTcwh8HS35Hk6bkuRPUjd39ZL4ITrPkuQglmhwFjCJVfG+G567wCtkUF5lnUXUFMcSL7wRwC0r7WXHuOPV530KgQLfs0IofjjeEW0663zknKe6b+paJtS6QzUpUvoyyEF5NCu1YKzYNOC/r+25BPvzfS8gpvJ5+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWCaDZXLfwxQLLRp12PA1vsdtwQFknk6o5olLX6kvjc=;
 b=UvxZ6m5Qgs9X8l9rwbYW1mSYoz228O1KiRSp4PeHSPyzXsR2RvfziGKaS1rmknGApt/Sqmj8JexkJvhC9SMIhHiGH6RLFxDZ6K93gImri/VWRUYY3ZLpAp4Cbw1W3nqoYy2YDYb4MqgDOGzlfDS36pX1nQi65zVVYgoBlBR7dbcHU+npXJj94s6u9X3Lgxsc8btUTiU4umpFHV3UHfUvFy9ujMnGNKMT9toLs6ndz1nM/7X0yXydyhsLDOQ7K1RnbhzSS5Q/sT7b6qhwQAVJo0hR4wKEfoI8XeentMM/KY6wB2Acw3wweUHara9O9VJi0JjESFanVCKkuxe6b4C/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWCaDZXLfwxQLLRp12PA1vsdtwQFknk6o5olLX6kvjc=;
 b=xrAZ8hnm6iSqxiEzyG+izFOYLn33rfPfOYP+qjLitHPOVsvN3iScIYMU0D55INRgNXLTfKmv9CLQsy7Miy/ipI09OKNHjHM+LCHXXNBvQvJNzFkwNM8vNAKg0gGKfS+COU7mhHCnK7RA0ZZBCG6lTHvZaFBxQm5Hklerqjno7no=
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
Subject: [PATCH v2 04/10] automation: Add debug versions of Arm tests
Date: Mon, 26 Sep 2022 13:04:17 +0200
Message-ID: <20220926110423.26030-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: b4dac79b-8a6f-4ce9-8f2b-08da9faee427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LJoWH/bAv7Rx6+bXdaj94CerovCt36CTED1bhWO8GZWrrlSzsdhdgOXbypMsaWb3dxBVpM1WvGU6nI2iviKLm4MsUHaHMrHk3d0+ttqlHL7n9NLvijWdKP9caE82Osy1ThkFvsyt+stBuMsaMES3+l5Yxu6KVCs+3FdrdVMCQz9Chzw9qxYz/dHOAYgeQM7urC2cDtGs9X1yIqWqXeJs9GBuM3LtUv0fx6jf8GmyLEkhHBzR3mF+ARmG4N15eDzQ6IufP8+GugknMNODA/ZTw0IEadjwlooEK9vQUy1vpz37h8W9X4Bi+H4a3EfNYjd2xk4lUC/HboRHOXuxOozgRg+C1/retMz8Hi39iZl/acnZlCBSchuzF3+nLqNy1TYVKcAnD1tm1qIMrz2bbxqY/LqZWt45oB/d3e5vSPRRsJcXoE5I70XARKUx3FGlsCybHSrq6EWInz6M3lotHw41NyYtPjUSyVV862pyOpgjDW8gg2OoUsxJuTeZzSKk9yVDHgLWjXN++6RKNg6ukp6vNVyv3M58rN0lzQaZGb9dFH1T/bWhFRG+cy44vIpxHGydB/ncWrPSm/dlqSpBTk35Fti6I/ucWYU0rqrT5MFwPvsnzJ2lAJKT0JGUJhhsdKIcMDmUqsQcHq+QFHCvQ6FMeGRqep22aiOpQylICdaaQYRKPNSZ63FHcXDSGN27vo15WOy0d01pyf58cYx9NrsMp06+hicWOKqsAJh/sZxCv0C4kDB/sohjXC4w0QkWp5iYudr+kPrkmvbK+h2HKhSakSNtL/OebBSXUDqDicv6T578hgBuu2G+LdGWg8SUac7f
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(36756003)(40480700001)(86362001)(186003)(336012)(1076003)(40460700003)(426003)(36860700001)(82740400003)(2616005)(82310400005)(356005)(81166007)(8676002)(4326008)(70586007)(70206006)(54906003)(478600001)(6916009)(316002)(26005)(5660300002)(2906002)(44832011)(41300700001)(8936002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:04:32.5395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dac79b-8a6f-4ce9-8f2b-08da9faee427
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005

At the moment, all the tests are executed on non-debug Xen builds.
To improve the coverage (e.g. we might catch some asserts), add new
test jobs using debug Xen builds.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
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



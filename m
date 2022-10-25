Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE7060C934
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:00:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429722.680899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGj9-0003ug-1B; Tue, 25 Oct 2022 10:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429722.680899; Tue, 25 Oct 2022 10:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGj8-0003r4-Ss; Tue, 25 Oct 2022 10:00:06 +0000
Received: by outflank-mailman (input) for mailman id 429722;
 Tue, 25 Oct 2022 10:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5aB=22=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1onGj7-0003eE-LM
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:00:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c81e9e06-544b-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 11:59:58 +0200 (CEST)
Received: from BN8PR15CA0057.namprd15.prod.outlook.com (2603:10b6:408:80::34)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 10:00:00 +0000
Received: from BN8NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::5b) by BN8PR15CA0057.outlook.office365.com
 (2603:10b6:408:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Tue, 25 Oct 2022 10:00:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT098.mail.protection.outlook.com (10.13.177.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 09:59:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 04:59:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 25 Oct
 2022 02:59:58 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Tue, 25 Oct 2022 04:59:57 -0500
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
X-Inumbo-ID: c81e9e06-544b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd3k7n1FG6lszYIVMdf3unRBusHRz47ypM7T46rBlsG+a+oxVeh4PZJZ4nMcmdMcl1OXEp0jGah8HxAuEaOjOogow26RMqfdoS1jPTxGfPaV0tlnYQPGORsrwXIxZLJKNtKAtjJoiiLB73yUvbhNvDZczyiCSj8wpOJF09yw4y4n3DtwTA7uVjBpkRfa9NSQU1/07KwQhBQS0Kxxc/JjsSmBaljHDH/137iFcbp81yxnbQ57eDhUv1N15jwwfoH6rrq3iDKNzDqxNmlTWzPvDUfxtcf7Aj1XaPnJ5O7vnNeAnqH/TjOTQqDmmLajt/ZOOqu3wtihlwO7ROeujNnooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2muQrqKMBKKVld3vXW0A8SjsFRSw+bg3agKx9wtIvw=;
 b=ZApBayFSqmZ1oexMBzMZmI7YjmYQ7NewUzu78AsCmZlx6/LMGEyZhqYFw74QyFLG3En1vhmhPFlGLcJzOB7pMtk0t7lhs33Ik7RnBY0tFljb13dcmNvg0UUsD85tQCuDrXqDT6SWykB2C20b03MdxWp/bsAMjQDPfnWIHMaTLrP9gStIFXL0Y9T5WTslIKwPuXN1NmW7fbz73kJu6MUai5/3imlS1pqhcZPxY5KVz7El7tr31BOkc+vGTxE6xkQSyPmbM0Vu92ZrrJJJwDXcWeg7TIb+JJuW1mca5V7IHcttnWUSde350oeq7o0EXZeY1DoSfpf43DPsMXx2cOwUqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2muQrqKMBKKVld3vXW0A8SjsFRSw+bg3agKx9wtIvw=;
 b=FUUTnfHZLSjKEpsGJ0xFmpPUDcN0zPNpGvGGE4cWA0GwY/hevMSP8nWTp2kY/vWvsQgzRu3v3GT0c5P8tYkZQ1VLNMS482AGKRMKglG4XnW2aE1boFTpDGLHpGT6FUb6mpK1ddumSrBjMFEj5tV6bZ0lh1QqwCVh1M7YkZyxZwg=
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
Subject: [PATCH v2] automation: test.yaml: Introduce templates to reduce the overhead
Date: Tue, 25 Oct 2022 11:59:52 +0200
Message-ID: <20221025095952.21980-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT098:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f598011-5d3c-4f57-2fc2-08dab66fadc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3a8xe18kN4CGYJUi7s9eE34OzgGbjEMhCRU+9ZuVaaPU68ryYBOf66d6gTAd8RVjHmX01wGW7OfwstwxCRn1TB4nwnnkHrSgdlgCzysbk0WDDekyG5YNVqyglNrlJ9yYfepeEb8tzHxVGEw249FC0mySeyCJERM+Pg45EEG/pzdBC1DYvmtlXnqB+YgEWDPmFUQse618R/oLO2hMoGqfdhslRyGJpmPVb9BZouHSrQ9c8c7kBUer0g0mJAZg3C0uRvfqYweXUrLRFAqQ1INN/jecBaJWOMkYpm/thJYOJamR1VLbIfo33WfmrmjzNBndMAyxPyzh96JgUkjQdmboayeRdsXo4kEOsaCCZ31XAWbhiEoSe2DyuhKPyXCmtYRhtQqXOh7R3lc4g476Q3OXC8eB6crmw1tl3jeqaLvhN07gz+tzv5ytZ0Cs3I+YaR4zozBXH9rZ5qGmEYteCmc9kASlvfnU4HBzRJr/BcnTrYBAAK/AYolbPRnyabR/sLue6JjSoEmY9/Qq7sk4PSiTIKhfRpqvcaOr5HiSC96VFUwcuSSZyALZ+FjKaNa3X5loeTvEIo5BvseSSDrUiU7+IfGguO0/gBc/oivrqVv7dmSwSn0RuISx44WmqGMTnBlwRCu3zRMv+FwC1+x0V+6ksiWEoQZiuQRVPrio/8fOBNUHHKD/Uoo0DbnS71CbhKbhtAN8rbwomPzvwOgaZH0416Wz66RVU1tQp/0pNk5r87pU1KHfHLwW44YkAqqTGkTcS/u0AQkvRVN/q7nlqZghyo8x/dsEH/zwByWiesnwn8KQRBZS5/rSPBZPH4l5PYsdBClSqkImUFl6Vhmw3Pp/vA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(40480700001)(82740400003)(426003)(36860700001)(6916009)(2906002)(54906003)(81166007)(356005)(8936002)(40460700003)(36756003)(41300700001)(70206006)(8676002)(30864003)(44832011)(4326008)(316002)(83380400001)(5660300002)(86362001)(26005)(6666004)(70586007)(1076003)(186003)(82310400005)(336012)(2616005)(478600001)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 09:59:59.8818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f598011-5d3c-4f57-2fc2-08dab66fadc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778

At the moment, we define lots of test jobs in test.yaml, that make use
of the same configuration sections like variables, tags, artifacts.
Introduce templates (hidden jobs whose names start with a dot) to
reduce the overhead and simplify the file (more than 100 lines saved).
This way, the actual jobs can only specify sections that are unique
to them.

Most of the test jobs specify the same set of prerequisite jobs under
needs property with just one additional being unique to the job itself.
Introduce YAML anchors for that purpose, because when using extends, the
needs property is not being merged (the parent property overwrites the
child one).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - carve out anchors from extend jobs and use better naming

This patch is based on the CI next branch where we already have several
patches (already acked) to be merged into staging after the release:
https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/next
---
 automation/gitlab-ci/test.yaml | 270 ++++++++++-----------------------
 1 file changed, 83 insertions(+), 187 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 92e0a1f7c510..c7e0078e04f1 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -7,35 +7,32 @@
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
-# Test jobs
-build-each-commit-gcc:
+.arm64-test-needs: &arm64-test-needs
+  - alpine-3.12-arm64-rootfs-export
+  - kernel-5.19-arm64-export
+  - qemu-system-aarch64-6.0.0-arm64-export
+
+.arm32-test-needs: &arm32-test-needs
+  - qemu-system-aarch64-6.0.0-arm32-export
+
+.qemu-arm64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:stretch
-    XEN_TARGET_ARCH: x86_64
-    CC: gcc
-  script:
-    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
-    - mv ../build-each-commit-gcc.log .
+    CONTAINER: debian:unstable-arm64v8
+    LOGFILE: qemu-smoke-arm64.log
   artifacts:
     paths:
+      - smoke.serial
       - '*.log'
     when: always
-  needs: []
   tags:
-    - x86_64
+    - arm64
 
-qemu-smoke-dom0-arm64-gcc:
+.qemu-arm32:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  needs:
-    - alpine-3.12-gcc-arm64
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
+    LOGFILE: qemu-smoke-arm32.log
   artifacts:
     paths:
       - smoke.serial
@@ -44,251 +41,150 @@ qemu-smoke-dom0-arm64-gcc:
   tags:
     - arm64
 
-qemu-smoke-dom0-arm64-gcc-debug:
+.qemu-x86-64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:unstable-arm64v8
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  needs:
-    - alpine-3.12-gcc-debug-arm64
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
+    CONTAINER: debian:stretch
+    LOGFILE: qemu-smoke-x86-64.log
   artifacts:
     paths:
       - smoke.serial
       - '*.log'
     when: always
   tags:
-    - arm64
+    - x86_64
 
-qemu-alpine-x86_64-gcc:
+# Test jobs
+build-each-commit-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
+    XEN_TARGET_ARCH: x86_64
+    CC: gcc
   script:
-    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-x86_64.log
-  needs:
-    - alpine-3.12-gcc
-    - alpine-3.12-rootfs-export
-    - kernel-5.10.74-export
+    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
+    - mv ../build-each-commit-gcc.log .
   artifacts:
     paths:
-      - smoke.serial
       - '*.log'
     when: always
+  needs: []
   tags:
     - x86_64
 
+qemu-smoke-dom0-arm64-gcc:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-arm64
+
+qemu-smoke-dom0-arm64-gcc-debug:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-debug-arm64
+
 qemu-smoke-dom0less-arm64-gcc:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.12-gcc-arm64
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.12-gcc-debug-arm64
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0less-arm64-gcc-staticmem:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.12-gcc-arm64-staticmem
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.12-gcc-debug-arm64-staticmem
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.12-gcc-arm64-boot-cpupools
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm64-test-needs
     - alpine-3.12-gcc-debug-arm64-boot-cpupools
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0-arm32-gcc:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm32
   script:
-    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm32-test-needs
     - debian-unstable-gcc-arm32
-    - qemu-system-aarch64-6.0.0-arm32-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
 
 qemu-smoke-dom0-arm32-gcc-debug:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm32
   script:
-    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
+    - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
-    - qemu-system-aarch64-6.0.0-arm32-export
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - arm64
+
+qemu-alpine-x86_64-gcc:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.12-gcc
+    - alpine-3.12-rootfs-export
+    - kernel-5.10.74-export
 
 qemu-smoke-x86-64-gcc:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:stretch
+  extends: .qemu-x86-64
   script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee qemu-smoke-x86-64.log
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
+    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
     - debian-stretch-gcc-debug
-  tags:
-    - x86_64
 
 qemu-smoke-x86-64-clang:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:stretch
+  extends: .qemu-x86-64
   script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee qemu-smoke-x86-64.log
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
+    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
     - debian-unstable-clang-debug
-  tags:
-    - x86_64
 
 qemu-smoke-x86-64-gcc-pvh:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:stretch
+  extends: .qemu-x86-64
   script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee qemu-smoke-x86-64.log
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
+    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-stretch-gcc-debug
-  tags:
-    - x86_64
 
 qemu-smoke-x86-64-clang-pvh:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:stretch
+  extends: .qemu-x86-64
   script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee qemu-smoke-x86-64.log
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
+    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-unstable-clang-debug
-  tags:
-    - x86_64
-- 
2.25.1



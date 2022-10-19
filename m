Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EFC604DA7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 18:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425945.674090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olC9r-00032E-Al; Wed, 19 Oct 2022 16:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425945.674090; Wed, 19 Oct 2022 16:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olC9r-0002zV-7g; Wed, 19 Oct 2022 16:43:07 +0000
Received: by outflank-mailman (input) for mailman id 425945;
 Wed, 19 Oct 2022 16:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFyQ=2U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olC9p-0002zM-9w
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 16:43:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1879540e-4fcd-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 18:43:03 +0200 (CEST)
Received: from DM6PR06CA0041.namprd06.prod.outlook.com (2603:10b6:5:54::18) by
 DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.34; Wed, 19 Oct 2022 16:42:59 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::4b) by DM6PR06CA0041.outlook.office365.com
 (2603:10b6:5:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 16:42:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 16:42:58 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 11:42:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 09:42:57 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Wed, 19 Oct 2022 11:42:56 -0500
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
X-Inumbo-ID: 1879540e-4fcd-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQgePsNUWrxyqL7R+agbjnWgiu129YCEeYoBmAwplOcCABTzNjie3FdQKHIV5Io5ynd2c2kXMCdh4SRcXiXGMZIWLG25NZ3mHsnh8ubpkeC26hCXA8PhdvfBj2vWJBLfJ6a4iv7k7dn/gmS1Q8yMPee2xqzCS0U0uU4HGFnzi8CQn0UQlig28XuB/XZt13jq2oR/mb/CTU8gjYbc7jNjiUdFU2++FqKDnjwFkH0aI3QKkOE0YZByllTYfEpMlG/ubueySZmMItQUmFDWNlJr5IUfk9ygDQTeDpIKozz88+MSAYHa2CUcb9sz5/3mW7+gYhTLqtXt3NQydH2pPWZrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMd2aBnsUoAVumnQYJYbP57oXs20Y21qvcFrIMFAu3E=;
 b=dtYJjlEqI53JgbJkfzn2McuK871c+cmWjuQC50/R1nP+ceBNVngnkSuoPkO92CVsBXJ7+9UpXIUEzZ0BrKl+5yI2IFaLlWX2GHRLmjQh8WGkDho/7GLmv5FtcU/wom/euBzKkw93N2DfU+jIFfqZKw/BTFD/6iaSydYq+qqaQeXkCv+5pgeT0DTPKpSei4D7AfHPA9WwfJJWKOcrnjOyOt43RPrrJ8VtML3VEuG3FMw2ElWF7+MGerBUmiFdiOJvqR1JhMGD6ateooqXaxKtXVGwXmO8U2UCnMenj4JuiscvwWEhZIbMW6SzLthepBSDMZtlOYnFRqMkVGNgCr4X5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMd2aBnsUoAVumnQYJYbP57oXs20Y21qvcFrIMFAu3E=;
 b=0DJaICuJA8IpYqvkRpkklJ5cUDMRhJsJ9XrXL+w7eJwKBwNW6JxMNgoYWklFiz30RePAhTbbwhKNM4266/put10R6j1lP37hGWtnxFtI5CJutBGN6ZzH+HI1McaOq2DwrUUN9xHfkrrO6zbkF0Kl/BGAQqtFFoBARb6gM2m3aqI=
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
Subject: [PATCH] automation: test.yaml: Introduce templates to reduce the overhead
Date: Wed, 19 Oct 2022 18:42:46 +0200
Message-ID: <20221019164246.5487-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d21537-2d65-4d5d-49da-08dab1f0fad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q/ysvF6BwO1AX211XpKgRmfPnTQnwvT7QoqqSdXTLypFhwNE6AEnquZn5Cf/xb/zhLwIezZ5BjJseQZ80Q59IypOSuQ0sbloXDP+RKojvtTCAl23RdSlkCg8oQqB8hQRTaSYjngDxCEWN1SkJcZ8uo92MlrBYZtp84VUNO2h3VOPRlfnGeWMWXcfRWozrmcHst/PMww28nKIEW0GWX8xSGlPps/zs/LMneDp4tLy7RpfLWPx0J3k08zF0zTlWy1l4K1zJktIRzG21oQwdVjERhji6gnL5JWkYXmzM/EO4EKAMsDlsObjx0XWC5HuuFaQi1dNIagqNmzcxYPk+FF/W0+FS+94z/QKBDBD+fZ9Xnj/3uOp8c7SQhHVHLXQYliFqjwhtjZ4oePXVzEKsfNdxqXqjrDyahp+V8gTEFdtZ6SPbOoQjqppi0WRbhS0XB4VUD4nB+v0Z3Fz0lVKq+IHY+9GMOXoSkdh67sOsiB77Z7BSsF4PCDs4AaheXiRTE3f1trff6OXSIAAZVSoLf2fljPGD938Ix4fqwiRCrG7LiChMwjkuqVCpddX7zs5k3/tzBCcphxLJu/bUwuELx6cfQAKslx9JRUir56O3WToGXoOByYWYein6R1hMPWWEWm+PyfHoD+ufth7ujujuQYAGXfV+5vnFnHUzoWOxGdJRsX2SNghZZXMmVQwgT94mL0deTzxlAfjeysrOXMiORPLmSykwUjjVMuit5yBoXhP+kTxngP1hBfZUhJcvrpQB2EpnUm0z2tCKQAT6r5B1GlI1CbxCgYNjzuEZRL1mBGgk0TP6/3FuxKNesDL696Qcnf1pb0YV9XvTXmA2K3x4j5zCVj3aom1Su00k4F76VhKctWhl4pW13jRkjjw+6Z0xm47
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(86362001)(36756003)(81166007)(82740400003)(356005)(2906002)(83380400001)(40460700003)(30864003)(5660300002)(40480700001)(44832011)(26005)(6666004)(2616005)(186003)(1076003)(336012)(47076005)(426003)(36860700001)(966005)(316002)(478600001)(82310400005)(54906003)(6916009)(70586007)(70206006)(8676002)(4326008)(41300700001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 16:42:58.4155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d21537-2d65-4d5d-49da-08dab1f0fad8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

At the moment, we define lots of test jobs in test.yaml, that make use
of the same configuration sections like variables, tags, artifacts.
Introduce templates (hidden jobs whose names start with a dot) to
reduce the overhead and simplify the file (more than 100 lines saved).
This way, the actual jobs can only specify sections that are unique
to them.

Most of the test jobs specify the same set of prerequisite jobs under needs
property with just one additional being unique to the job itself. Introduce
YAML anchors for that purpose, because when using extends, the needs property
is not being merged (the parent property overwrites the child one).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This patch is based on the CI next branch where we already have several
patches (already acked) to be merged into staging after the release:
https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/next

Tested pipeline:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/671114820
---
 automation/gitlab-ci/test.yaml | 266 ++++++++++-----------------------
 1 file changed, 80 insertions(+), 186 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 92e0a1f7c510..fc0884b12082 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -7,32 +7,12 @@
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
-# Test jobs
-build-each-commit-gcc:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:stretch
-    XEN_TARGET_ARCH: x86_64
-    CC: gcc
-  script:
-    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
-    - mv ../build-each-commit-gcc.log .
-  artifacts:
-    paths:
-      - '*.log'
-    when: always
-  needs: []
-  tags:
-    - x86_64
-
-qemu-smoke-dom0-arm64-gcc:
+.qemu-arm64:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  needs:
-    - alpine-3.12-gcc-arm64
+    LOGFILE: qemu-smoke-arm64.log
+  needs: &qemu-arm64-needs
     - alpine-3.12-arm64-rootfs-export
     - kernel-5.19-arm64-export
     - qemu-system-aarch64-6.0.0-arm64-export
@@ -44,17 +24,13 @@ qemu-smoke-dom0-arm64-gcc:
   tags:
     - arm64
 
-qemu-smoke-dom0-arm64-gcc-debug:
+.qemu-arm32:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:unstable-arm64v8
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  needs:
-    - alpine-3.12-gcc-debug-arm64
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
+    LOGFILE: qemu-smoke-arm32.log
+  needs: &qemu-arm32-needs
+    - qemu-system-aarch64-6.0.0-arm32-export
   artifacts:
     paths:
       - smoke.serial
@@ -63,16 +39,11 @@ qemu-smoke-dom0-arm64-gcc-debug:
   tags:
     - arm64
 
-qemu-alpine-x86_64-gcc:
+.qemu-x86-64:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
-  script:
-    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-x86_64.log
-  needs:
-    - alpine-3.12-gcc
-    - alpine-3.12-rootfs-export
-    - kernel-5.10.74-export
+    LOGFILE: qemu-smoke-x86-64.log
   artifacts:
     paths:
       - smoke.serial
@@ -81,214 +52,137 @@ qemu-alpine-x86_64-gcc:
   tags:
     - x86_64
 
-qemu-smoke-dom0less-arm64-gcc:
+# Test jobs
+build-each-commit-gcc:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:unstable-arm64v8
+    CONTAINER: debian:stretch
+    XEN_TARGET_ARCH: x86_64
+    CC: gcc
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  needs:
-    - alpine-3.12-gcc-arm64
-    - alpine-3.12-arm64-rootfs-export
-    - kernel-5.19-arm64-export
-    - qemu-system-aarch64-6.0.0-arm64-export
+    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
+    - mv ../build-each-commit-gcc.log .
   artifacts:
     paths:
-      - smoke.serial
       - '*.log'
     when: always
+  needs: []
   tags:
-    - arm64
+    - x86_64
+
+qemu-smoke-dom0-arm64-gcc:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *qemu-arm64-needs
+    - alpine-3.12-gcc-arm64
+
+qemu-smoke-dom0-arm64-gcc-debug:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *qemu-arm64-needs
+    - alpine-3.12-gcc-debug-arm64
+
+qemu-smoke-dom0less-arm64-gcc:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *qemu-arm64-needs
+    - alpine-3.12-gcc-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:unstable-arm64v8
+  extends: .qemu-arm64
   script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
+    - *qemu-arm64-needs
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
+    - *qemu-arm64-needs
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
+    - *qemu-arm64-needs
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
+    - *qemu-arm64-needs
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
+    - *qemu-arm64-needs
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
+    - *qemu-arm32-needs
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
+    - *qemu-arm32-needs
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



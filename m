Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61846947E8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494575.764700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZjs-0004RY-4V; Mon, 13 Feb 2023 14:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494575.764700; Mon, 13 Feb 2023 14:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZjs-0004O7-0p; Mon, 13 Feb 2023 14:23:28 +0000
Received: by outflank-mailman (input) for mailman id 494575;
 Mon, 13 Feb 2023 14:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfrU=6J=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRZjq-0001qA-9o
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:23:26 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9481789-aba9-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:23:25 +0100 (CET)
Received: from DM6PR17CA0020.namprd17.prod.outlook.com (2603:10b6:5:1b3::33)
 by MW3PR12MB4570.namprd12.prod.outlook.com (2603:10b6:303:5f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:23:21 +0000
Received: from DS1PEPF0000B073.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::f7) by DM6PR17CA0020.outlook.office365.com
 (2603:10b6:5:1b3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 14:23:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B073.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Mon, 13 Feb 2023 14:23:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:23:20 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 08:23:20 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 08:23:19 -0600
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
X-Inumbo-ID: f9481789-aba9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZCuMvUI0XSa8xJ0j673rW7KwYuLlbs8Fffs3gDgliW8Qy0tUF/YwD3M/9GI6ws/oTTKI+YrmwOH5KwZLkF+S/+QYl3kqCeyYePvXbvgcobLVVafxtEppwy1nzyIOlEKHpkfz0LCj5S4rdZds+RORqACulphIJiydVNrn+VBK2a2Do5jJ7VvvLLc2PNM0AmGvimNJrgtcFa2UjT4CTfh2aqVzKI98ZDphPIbo+75j4f5jTxMB9xYXq7PjzvOqSwwwcF1kZmK/mx6yiYArnDHcM9omu5ZOM3zPsm1Rc54OUjICZ7ocNvdz7O6f0nkygagiF1nAd+vpBF2TN+9P+6iAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3LAAQJ+In6ShGDftioJeaSS5XhI1kLDe3N52dbgbNc=;
 b=OBoE0upmKS5nPpARERd30ZXQaqlfI8n10DkdEpTKZaKjvp9x6RcobvThAI+4G4Q+UuGbl4/CSZeCU1rEqrCL1JojZ1G1H1KsXRRWIIz7BwiwitNbArputdy+X54sDy6jc/jhaEyY15pDzmnIqqzQnPzXzeDwwQyDWy+PhxXi4qk8CoUWf9DK26DaWqh4qLsmKeIeZAKuO8hqaPAJ9B+fAMANKyuxaYFUprDD5F/TtoMBArUQaKu1anMYe6/KnJ/Xw2duEnKVd39FJ+TLOQNzMBr6w/4UrGTsembtCbDYmzHT8Im7SJ7a2OvHEUg3XMl6+sfb+kwh604lDYqZ2MA/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3LAAQJ+In6ShGDftioJeaSS5XhI1kLDe3N52dbgbNc=;
 b=0Ud+Ibjetac8KJJHmSURTvXzgFV8Rbc/SHTJq0Id2cx053aCNTkX980ZKvDivsOj5LccH6UYRZcjFavEDmtpBQwpNq7TnVY9iyjUFzf39o5dm6ImqBGsDUZTG9rCEaLpyVVPAYGZBr2fun8sHLJAq4tm7FJbmkzmrHFSK9hFwEQ=
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
Subject: [PATCH] automation: Add container and build jobs to run cppcheck analysis
Date: Mon, 13 Feb 2023 15:23:12 +0100
Message-ID: <20230213142312.11806-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B073:EE_|MW3PR12MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: bf397c41-a80b-47b2-6c1f-08db0dcddbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ni0vVi62h9mP5TDki2SiPZgk/4Qt8PWN2ZZmjKHEQlh7W8QhCHmV0nwBmixQbxw2teEF/DhDVXO/LkbqjlCH0ZhmF1KcaJgApF5wf5J8PsjRUUTvjezoIjVPhx1I5YFztjAEJ6ELfEazB0xnXr2P0ka9i77xsvo9DY/fHI7IgclVCfiSY00bkCQFPfGoMQsQzqYyCmGmW1a6apRidp+4jWlMiW2AqTtveentPhSQ3upCcOq6EtZ5YnxHUeOtE8+y3HuQ24ZfcEyajUW3DvdsT+yV6r2Gl/0gAuQQSmm+T6U+SSINKLn0WBpvm7YkPP/ejZrbKf2yms9S4PmGE8x5vxPqOF8B8uZGUOYXCcqNSAJzGZXN7h93fAjRiofPEoeXdLzn3Ajr3bFc75y3T0mr4e2kwFaWVA7L0xNmW/cPsE5Pqtzzj/8O2vIBNoxZ1zdm+VhHNXBVK7xe9fbNcjpPvD0+hN20c0Y/UOFx/BiFEyzefXchP2st2+9At3AfesUyRAvTjoiNdYz4NsYnuAUp5W5sso9tvhiQgX482yK63dd6a3yNqBwkS+Ff93DsngS9kJaKWqCd9dQCK6QNH0NEd2p++ioPGOe7fdOR1h86+Z17pWZRFJmQyQ2KwgGVf0EMcsIt5z+TgYs9PM1BcfWVA8LwiOz1aaVsNu5jqDxcDED2VgpxqYTV0Tg7dJGGnFPylK7LHQCzfpEfh8eLOFhHtDuwD/Q2YgRhlbi07Z1PSYA079O6eonoDejP3tKDAY2DrMPcmZ5gyG3UxO55kVZNhQn/V/C2c7TRUKdMDuRf6cPkuzfjHXLJJ91cnqeUpNUw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(44832011)(2906002)(5660300002)(83380400001)(426003)(47076005)(26005)(186003)(356005)(336012)(40480700001)(2616005)(36860700001)(82740400003)(81166007)(54906003)(70586007)(8676002)(4326008)(70206006)(6916009)(316002)(8936002)(41300700001)(478600001)(6666004)(1076003)(86362001)(40460700003)(82310400005)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:23:21.0650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf397c41-a80b-47b2-6c1f-08db0dcddbe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B073.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570

Add a debian container with cppcheck installation routine inside,
capable of performing cppcheck analysis on Xen-only build including
cross-builds for arm32 and arm64.

Populate build jobs making use of that container to run cppcheck
analysis to produce a text report (xen-cppcheck.txt) containing the list
of all the findings.

This patch does not aim at performing any sort of bisection. Cppcheck is
imperfect and for now, our goal is to at least be aware of its reports,
so that we can compare them with the ones produced by better tools and
to be able to see how these reports change as a result of further
infrastructure improvements (e.g. exception list, rules exclusion).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
For those interested in, here is a sample pipeline:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/775769167
---
 .../build/debian/unstable-cppcheck.dockerfile | 37 +++++++++++++++++
 automation/gitlab-ci/build.yaml               | 40 +++++++++++++++++++
 automation/scripts/build                      | 11 ++++-
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile

diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
new file mode 100644
index 000000000000..39bcc50673c8
--- /dev/null
+++ b/automation/build/debian/unstable-cppcheck.dockerfile
@@ -0,0 +1,37 @@
+FROM debian:unstable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CPPCHECK_VERSION=2.7
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# dependencies for cppcheck and Xen-only build/cross-build
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        curl \
+        python-is-python3 \
+        libpcre3-dev \
+        flex \
+        bison \
+        gcc-arm-linux-gnueabihf \
+        gcc-aarch64-linux-gnu
+
+# cppcheck release build (see cppcheck readme.md)
+RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
+    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
+    cd cppcheck-"$CPPCHECK_VERSION" && \
+    make install -j$(nproc) \
+        MATCHCOMPILER=yes \
+        FILESDIR=/usr/share/cppcheck \
+        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
+
+# clean
+RUN apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* && \
+    rm -rf cppcheck-"$CPPCHECK_VERSION"* "$CPPCHECK_VERSION".tar.gz
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index a053c5c7325d..c8831ccbec7a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -7,6 +7,7 @@
     paths:
       - binaries/
       - xen-config
+      - xen-cppcheck.txt
       - '*.log'
       - '*/*.log'
     when: always
@@ -145,6 +146,23 @@
   variables:
     <<: *gcc
 
+.arm64-cross-build-tmpl:
+  <<: *build
+  variables:
+    XEN_TARGET_ARCH: arm64
+  tags:
+    - x86_64
+
+.arm64-cross-build:
+  extends: .arm64-cross-build-tmpl
+  variables:
+    debug: n
+
+.gcc-arm64-cross-build:
+  extends: .arm64-cross-build
+  variables:
+    <<: *gcc
+
 .arm64-build-tmpl:
   <<: *build
   variables:
@@ -679,6 +697,28 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
 
+# Cppcheck analysis jobs
+
+debian-unstable-gcc-cppcheck:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:unstable-cppcheck
+    CPPCHECK: y
+
+debian-unstable-gcc-arm32-cppcheck:
+  extends: .gcc-arm32-cross-build
+  variables:
+    CONTAINER: debian:unstable-cppcheck
+    CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
+    CPPCHECK: y
+
+debian-unstable-gcc-arm64-cppcheck:
+  extends: .gcc-arm64-cross-build
+  variables:
+    CONTAINER: debian:unstable-cppcheck
+    CROSS_COMPILE: /usr/bin/aarch64-linux-gnu-
+    CPPCHECK: y
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
diff --git a/automation/scripts/build b/automation/scripts/build
index f2f5e55bc04f..c219752d553e 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -38,7 +38,16 @@ cp xen/.config xen-config
 # Directory for the artefacts to be dumped into
 mkdir binaries
 
-if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
+if [[ "${CPPCHECK}" == "y" ]]; then
+    # Cppcheck analysis invokes Xen-only build.
+    # Known limitation: cppcheck generates inconsistent reports when running
+    # in parallel mode, therefore do not specify -j<n>.
+    xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
+
+    # Preserve artefacts
+    cp xen/xen binaries/xen
+    cp xen/cppcheck-report/xen-cppcheck.txt xen-cppcheck.txt
+elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
     make -j$(nproc) xen
 
-- 
2.25.1



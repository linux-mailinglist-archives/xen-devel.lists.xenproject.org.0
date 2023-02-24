Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE56A19CA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 11:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500889.772432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVV8c-0000Fm-HE; Fri, 24 Feb 2023 10:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500889.772432; Fri, 24 Feb 2023 10:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVV8c-0000CL-Cm; Fri, 24 Feb 2023 10:17:14 +0000
Received: by outflank-mailman (input) for mailman id 500889;
 Fri, 24 Feb 2023 10:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2v=6U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pVV8a-0000CF-VG
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 10:17:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66780a8e-b42c-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 11:17:11 +0100 (CET)
Received: from DS7PR07CA0022.namprd07.prod.outlook.com (2603:10b6:5:3af::24)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 10:17:08 +0000
Received: from DS1PEPF0000E64C.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::3c) by DS7PR07CA0022.outlook.office365.com
 (2603:10b6:5:3af::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24 via Frontend
 Transport; Fri, 24 Feb 2023 10:17:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64C.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.14 via Frontend Transport; Fri, 24 Feb 2023 10:17:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Feb
 2023 04:17:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 24 Feb 2023 04:17:06 -0600
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
X-Inumbo-ID: 66780a8e-b42c-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z84RwlrJ0WOBT5d1YVs2hvziXEybR1R9IKXExzdDSpHJ2iMaq64FNTDi+ctFx/2so9B7DCGncgMkqJ4iC5KjzaikuU9Viaqz3z9re6xemPeD9F5W5+nDTtrjasDl95m8TqBamX3nnkWW1VnA5dOetw+liXYMPKWE1WbpkKr+fIpnSG67pznvas9XdcMXTL03+vtrVivpw0x3jUUgyRUDY1MI6+VoINh/houjlwDqwdpH4U/Z1g87t6Y4AhbELAfmdJlg4GUj2sJz/jsJqik7KcT+HzrUZuGu0PIDFMyY6QmGpzwY7D0BvHByiMm+HD4l432pV+6FLkb/l7T4Tw/zGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61a/TSaClznaggO4+EgAcPq0tYybJpY9KuOG/x+Er5A=;
 b=hPX3pcuz8AIy6C9f75IXnBsZv3z/09Tdl3AJ5aR9cCjlhN7c4zp79Rif5VYQuUlIeyr2QOrhjBYE6DWDMbvBmt6cRg1EQkDsHAyWhZp7kITNN6FIGdyyug7/WTlUkySpGXzrMvp7k6EBY8PHRXPH77psvTuHMgenOgh14xMRkL3mTT6GYr7B+/7emlSa+KTJLP/zHdTycaURKLD4JRFFzUl1yCTEJa+VuNNZkWpF8euauQhWOa/6YGsnj7UEb1R5Tkviwg0kx3dGddFPZ+s7I/GzjzXeEl1ewXZBPcFepSBhS87jqASCM6dGbdDuOKIMyElmxCNbcX6e4h6oqd7IUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61a/TSaClznaggO4+EgAcPq0tYybJpY9KuOG/x+Er5A=;
 b=OSRf5AovdiZzyvy6srHfb315hRpAxkTe1ireguFNHs50kJA0tpWKHzk67Bvk2xFgZSSUuotXc6WWJL96weAV9WKX0ctY7k3um/8ogvlV2sn5DK3GbaGZ5yGgSQVhlBL9arHdzLBVdJ4c6RQMPYvZfDeUGGleWkvRcSjCfy+VRPw=
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
Subject: [PATCH v3] automation: Add container and build jobs to run cppcheck analysis
Date: Fri, 24 Feb 2023 11:17:00 +0100
Message-ID: <20230224101700.9032-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64C:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: af9b912b-9350-4ab7-b754-08db165048ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u18iw8vpK2WuaMo85JJUQivg0CVyfUHov5b9IA+eYMeu1D4gtkPHFeD0fLnJPtZRdwL2Lk6SbDaAghVdfz5uolD3Jbud+wSeYhMXZKHe0bamLL41J+oDzBJB0rmVEPP9mm/6ElU0EvA8bWWh++RKN+h5eCv/uqYNKlRYB0qB2zIIUDN3hWsDdzwx/6EqFrvVoA8lCGmHG+dO+SuWuX9mg8+Jlfv5xj/bz5ayDxh43g1CsqWswxzABh0MWCfbJqg3q14OrT5vRa4/uEAEyX135W4BON1O7pVXcMv61p10mnDwUZdStrV7V8jGC4cGF6D2RGRTy3p4RHwsCzFqacHW8oMFAFhFGCrBog5Wi3CJkulexR94PFCYTerAFfKPNGPmSgTkEBquXs26ghP+pBnPu2HwOf5nkOa6qt9IQfb1AJHnUyUdLUN5m4NQuE+P/bbezJRacidOhT7sNfE0f4rQv3/PUhpmQ44yHl+pe3OCcA1uevmO8+xhNuhuXnGMZYVdDtk+9dnSwXKb/b1Ls+QG+q8AlPwjoOaAFbJMjlRgzQFdslhOOSgke1WUG8Qaf6F/NjAawsLK3wWu6of+qVYrnWd56hQSV35Pw3n9ECZxDkPpzE/OgpK+IE10qd8EUjeje2dOm5hUSWr0GYXbWWjzTVAPidVIWaQSFk8ZCIbF9ihCnwHj43+lP96U31JDaxMgLjjHOQ9C7uBbuu0kU//qXD0NoSBUOMwuJd2ATJqlqZE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36840700001)(40470700004)(46966006)(36756003)(82310400005)(426003)(47076005)(316002)(83380400001)(54906003)(6666004)(81166007)(966005)(478600001)(70206006)(40460700003)(4326008)(2616005)(186003)(41300700001)(26005)(1076003)(40480700001)(356005)(2906002)(86362001)(8936002)(5660300002)(44832011)(82740400003)(336012)(6916009)(36860700001)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 10:17:08.0345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af9b912b-9350-4ab7-b754-08db165048ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524

Add a debian container with cppcheck installation routine inside,
capable of performing cppcheck analysis on Xen-only build including
cross-builds for arm32 and x86_64.

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
Changes in v3:
 - use multi-stage build to reduce the size of container
 - drop Stefano Rb as a result of dockefile changes

Changes in v2:
 - use arm64 container instead of x86 to make pipeline faster
 - explicitly set HYPERVISOR_ONLY=y for cppcheck jobs
---
 .../build/debian/unstable-cppcheck.dockerfile | 53 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 43 +++++++++++++++
 automation/scripts/build                      | 11 +++-
 3 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile

diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
new file mode 100644
index 000000000000..adc192cea645
--- /dev/null
+++ b/automation/build/debian/unstable-cppcheck.dockerfile
@@ -0,0 +1,53 @@
+FROM arm64v8/debian:unstable AS builder
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CPPCHECK_VERSION=2.7
+ENV USER root
+
+# dependencies for cppcheck build
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        curl \
+        build-essential \
+        python-is-python3 \
+        libpcre3-dev
+
+RUN mkdir /build
+WORKDIR /build
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
+FROM arm64v8/debian:unstable
+COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
+COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
+
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# dependencies for cppcheck analysis including Xen-only build/cross-build
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        python-is-python3 \
+        libpcre3-dev \
+        flex \
+        bison \
+        gcc-arm-linux-gnueabihf \
+        gcc-x86-64-linux-gnu \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 22ce1c45e7cd..0835b7a65190 100644
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
@@ -199,6 +200,23 @@
   variables:
     <<: *gcc
 
+.x86-64-cross-build-tmpl:
+  <<: *build
+  variables:
+    XEN_TARGET_ARCH: x86_64
+  tags:
+    - arm64
+
+.x86-64-cross-build:
+  extends: .x86-64-cross-build-tmpl
+  variables:
+    debug: n
+
+.gcc-x86-64-cross-build:
+  extends: .x86-64-cross-build
+  variables:
+    <<: *gcc
+
 # Jobs below this line
 
 archlinux-gcc:
@@ -679,6 +697,31 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
 
+# Cppcheck analysis jobs
+
+debian-unstable-gcc-cppcheck:
+  extends: .gcc-x86-64-cross-build
+  variables:
+    CONTAINER: debian:unstable-cppcheck
+    CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
+    CPPCHECK: y
+    HYPERVISOR_ONLY: y
+
+debian-unstable-gcc-arm32-cppcheck:
+  extends: .gcc-arm32-cross-build
+  variables:
+    CONTAINER: debian:unstable-cppcheck
+    CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
+    CPPCHECK: y
+    HYPERVISOR_ONLY: y
+
+debian-unstable-gcc-arm64-cppcheck:
+  extends: .gcc-arm64-build
+  variables:
+    CONTAINER: debian:unstable-cppcheck
+    CPPCHECK: y
+    HYPERVISOR_ONLY: y
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
diff --git a/automation/scripts/build b/automation/scripts/build
index f2f5e55bc04f..7d1b19c4250d 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -38,7 +38,16 @@ cp xen/.config xen-config
 # Directory for the artefacts to be dumped into
 mkdir binaries
 
-if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
+if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
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



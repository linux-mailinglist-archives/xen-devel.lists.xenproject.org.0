Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FF696880
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495253.765562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxZY-00078k-VE; Tue, 14 Feb 2023 15:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495253.765562; Tue, 14 Feb 2023 15:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxZY-00076Z-Ro; Tue, 14 Feb 2023 15:50:24 +0000
Received: by outflank-mailman (input) for mailman id 495253;
 Tue, 14 Feb 2023 15:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxPO-0001Wn-MX
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:39:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d28a18a6-ac7d-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 16:39:53 +0100 (CET)
Received: from MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::15)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 15:39:50 +0000
Received: from CO1NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::ba) by MW4P223CA0010.outlook.office365.com
 (2603:10b6:303:80::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Tue, 14 Feb 2023 15:39:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT113.mail.protection.outlook.com (10.13.174.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.26 via Frontend Transport; Tue, 14 Feb 2023 15:39:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:39:48 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:39:48 -0600
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
X-Inumbo-ID: d28a18a6-ac7d-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ4ITEASRc/8Sb5R+HVd89wxpTlQRlZPDGASieTg4pAvNLMj/IflPLGdVXMYS/2W9Cj8LqUSk8OMeI7JhlWuLAk/VqMuPwGqkY4EwWKVPRH6F9nGGoIVVh2R5cG5h46frHEbJwcZ3kGI4cxBakBJ534vRvpCoP7hTsHM1+O1drEEd+ir6PxOayEu5f+BfeAVpCbfYyKMk8iOjxOsL3JvjdMqRPuvl202fS5/yZIJPVnJ8HfsMJUKr3MQoASVfGSXTyQ7NPoAmESwNIckdjb9XbILr1EBcPu9EkkKQ0DQ/2f5v93LfoYdOX1+XbV1EvIpOWn+K+cGOsRq7VsROQMASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idbIK0WFX/oj0rIMVRUxvERZADW8zVY79vH5sqj84xw=;
 b=BX+jdvDKpMNHg8B+rhZm/Xnd/qfeBkE0X0WN5NEUew5X16dd0t5PtgcG5fO0uxcWE5SK9cMPFVUNuOvuPPBtO+FExvbDb09CGFCWAOrcBdhQdRGHgCyGDEG6C0PJSH1woO9Vl3snDn1n9mmHQ/XHrla9X5ixywZSWovefKkxCagHV/iuC7kgHtJ6ZVvnWRhtuX4skBHzYco+6lPf0nJ7COsLay9H0VuIbj3XAPAMl623DMCG/bKYh1Mvpa4o2lrYWrAvdkKDnNAef2+B1mcLtfqPlCx9j6iKRH7ZaKZaaUT1vQhEeJwXW+TD6CxyVNtMHYlML5C8OxDH4B5c8azGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idbIK0WFX/oj0rIMVRUxvERZADW8zVY79vH5sqj84xw=;
 b=JbVpWfvkGSCi6vRea/zKRZJrUzlMt3pBNhySJNeEfl7JuJEj/LI7cixC+IigXK8AH64V+bQtSFmezkb2GcFJrOSXoYGW5+BcUvXUN+ylwBQe300UIovyrVbGdU4XgDef22DzvQwxrWq+Ih8z+RUWoC16Nrvbw8cODmCHf7hs52A=
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
Subject: [PATCH v2] automation: Add container and build jobs to run cppcheck analysis
Date: Tue, 14 Feb 2023 16:39:45 +0100
Message-ID: <20230214153945.15719-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT113:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 45139c04-b8b1-4825-b126-08db0ea1b582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rlfI0F9CPqhka3XvK5wD17sVvsCwJP3/Vg24N3QBquwWLXhEdY83FCnqQu5RSZrIBNS7txoZ07Rz2P9ItNkIL29BvGom1lKIb8iyY19e3Q6MgHFhod7Lj36YaEXfAbzVGtz+BXUK/8usTfw26r/KTDLmDbrQ8Q0FWZuTzxbMT23D5z5Z5p/5s5yktC4ziDlhxg9OKId11Ks1V+Pig4ECKwRQq9XCSk0Kf8b0yqAltAX3UyEUkSGpirP25Kqd8/AwQ5pGDrzGpfpXZexNDnlHodjMt3mw372qFCIlFJn1oO+KsxFJbnidUWTVHN74FH2sGhtTWKHmeSJ+bj2187K19WxVFmZZkofeUh/3D3ohcvmEsXqgegJ+WGAY7hR/z2kn9/jFHk8S8/hjMJvnvwIP4fLImGQbLidGLdybhjNW3/Wnc/AphDKm+1p293fNlxXoGwahWmftOKRJNXkMOoVmZlnuzrRfs8svYd5dA49g5RVpWX48ghByCiLPu5zmppEEydGlqmAvwri3iSUqHSTYlowyMsF7Srw8C01K39oFXaG1Ys5m6zCd14dBAdHitFxLqqUP4AjtFViQtLxttr/U8o511w8eF29HSoM4KGc+E7YjrLat8e8XyGgcIxLnV8mtNgsf9a3MLP9UJDInRwguWEqy9RKbhNyd/Jl3DOOPH82I1Z4/rHuJXCSO4HDP4+oAAE0wb+WX7fU8T/D+EK4mKoqM/IM0a2hkZH2FAUlgDYhcu/W8QQybhswrCFIy/qB9NwpNvlNPlLoAFeRhXwaWRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(8936002)(5660300002)(82310400005)(86362001)(41300700001)(356005)(40480700001)(36860700001)(36756003)(82740400003)(44832011)(81166007)(40460700003)(2906002)(1076003)(336012)(426003)(47076005)(6666004)(2616005)(478600001)(966005)(83380400001)(4326008)(54906003)(8676002)(6916009)(70206006)(70586007)(26005)(186003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:39:49.9259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45139c04-b8b1-4825-b126-08db0ea1b582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648

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
Changes in v2:
 - use arm64 container instead of x86 to make pipeline faster
 - explicitly set HYPERVISOR_ONLY=y for cppcheck jobs

For convenience and own testing, I built and pushed the new container
to registry. CI pipeline including dom0less series:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/777181033
---
 .../build/debian/unstable-cppcheck.dockerfile | 37 ++++++++++++++++
 automation/gitlab-ci/build.yaml               | 43 +++++++++++++++++++
 automation/scripts/build                      | 11 ++++-
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 automation/build/debian/unstable-cppcheck.dockerfile

diff --git a/automation/build/debian/unstable-cppcheck.dockerfile b/automation/build/debian/unstable-cppcheck.dockerfile
new file mode 100644
index 000000000000..54b99f87dfec
--- /dev/null
+++ b/automation/build/debian/unstable-cppcheck.dockerfile
@@ -0,0 +1,37 @@
+FROM arm64v8/debian:unstable
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
+        gcc-x86-64-linux-gnu
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
index 079e9b73f659..1441b7dbb6fa 100644
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
@@ -699,6 +717,31 @@ archlinux-current-gcc-riscv64-debug-randconfig:
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



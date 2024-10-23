Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895529ABBE8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 04:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824390.1238523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3RVi-0004jD-U0; Wed, 23 Oct 2024 02:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824390.1238523; Wed, 23 Oct 2024 02:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3RVi-0004gZ-Qw; Wed, 23 Oct 2024 02:54:10 +0000
Received: by outflank-mailman (input) for mailman id 824390;
 Wed, 23 Oct 2024 02:54:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6MJf=RT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t3RVh-0004gR-1s
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 02:54:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2405::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113cc05f-90ea-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 04:54:06 +0200 (CEST)
Received: from BN0PR02CA0038.namprd02.prod.outlook.com (2603:10b6:408:e5::13)
 by SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 02:54:01 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::bf) by BN0PR02CA0038.outlook.office365.com
 (2603:10b6:408:e5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Wed, 23 Oct 2024 02:54:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 02:54:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Oct
 2024 21:54:00 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Oct 2024 21:53:59 -0500
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
X-Inumbo-ID: 113cc05f-90ea-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmn6vsprNPQx8qmC/pIFoK4N7j5tbO8CYLCdOzXPCtVOkULdb6xJEDIfC14jw9OKX14BlcPB7FK0iMB6UiEBA9zVilqHpe0bF7kI9ERfAGwLwfDdPhapYTTKoIlUUjk9OZkN31GPjxTAHfKpQYi65NZiLIT47R1wFfDaKuOckNcIFJgZrFPUSWA8R4LU2yIwB1FTazk4n4j9r+5LYB/Op3mAQKYrzF3wOIMha9SGIgWbzm8AIp1I3MCWWcQMQcno3xID6BD41v3SenLnIKhUFGu7bb93Usok4V9KpaYNteaeR2Ul7Gll5WqRHfmffyqgFou/J4myWvQzCn74+klk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sGK78ck5V/PWYqHizZQ0QQoDxKmDUIh5FH+r9yUkao=;
 b=LT4D1blYMGEzRkzAOdn4ktUueoOywaZzfslqZodEMVK+i42v0p6A68vzxVJxQtBqZ3XZGztTtY0IyNsShJ4hSvio3o7oXKKTBSnNuVdTB2rpE88RQbDXmLjRdtygnnbMtRcEDO5GhkbP5J1qDWIYX0ibuD2w5HI4iV+agyGRfuIGss5FBEk3lu+MI+efKuR+KQCs9ztwxYynQBmiUgFOFOFgnIOa/srJN5cMh9ch0b7Na+Oq9SIpbA7rJJ1oPnFTO0TwQ4aL/UoOns96R/aDR0vLjWqBNk3uAiVoRMxBqz0q2LdQYKzGsUHYHVNMk1ZQBjlkxjaf67MXXK+OtItf8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sGK78ck5V/PWYqHizZQ0QQoDxKmDUIh5FH+r9yUkao=;
 b=p0Dfjl4Vc0/JbgsD0cWc5olu2bbQ8keyRfidRa82m1esyymF14TRVSWyOSF74VZLT+AMsAKZ5Pos7RA7lrPc3eiCpADR3fjoHzWknrEJuJM6AtrmIUA2GL27XMPkqQ3mTTLzB9s2qSpcvoVST8ACd7SKAs1VixfHthl8cGLn67c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Victor Lira <victorm.lira@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [RFC TEST_ARTIFACTS PATCH 1/2] artifacts: Initial commit
Date: Tue, 22 Oct 2024 19:53:33 -0700
Message-ID: <21a6030f352282d822c30de4a1e7ecab9a8c0a99.1729649255.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1729649255.git.victorm.lira@amd.com>
References: <cover.1729649255.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SA1PR12MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4f408c-6c20-411b-4fb0-08dcf30df298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEk4a1pkMjFOL05wL3NaclhyS1dVeEU2ZUNkUmRkNTduZHI3aCsvM2hYTjBE?=
 =?utf-8?B?dFFUbUtoTFN2K3FEUGl0aFo3T0YvYTVEcHRjSUZhT3phRmtIaGpCRUc4TWx2?=
 =?utf-8?B?Z0FuaE9OL0hJYm1GMG0zTGVtTnNrUFNJbU5zQmI0aWdvd0Y4QlZ6TDFLRzk5?=
 =?utf-8?B?cG4yN0pwcE9udnNyV3pBeEZ1NFY3YU1ESnV5ejg1L1JPUFZUeGJOSlk0QjF5?=
 =?utf-8?B?dkhRMnFEZUwrZjJ6bzVNWjR5RzV2ZzJzY2czOThpaUlXRjBld2Nka3FZNEsy?=
 =?utf-8?B?VVJkRXhrWmlKb0g3ZlMvdk9uQVpJZVpHS0hhQTZnQkUvenBrVHZUWEZwMXdj?=
 =?utf-8?B?Z1h3RWU0TFErc2IxZ0haaTNsUmV5QmhOdlJJUHJEd1YxeDE0Z3VRdWxHbHpI?=
 =?utf-8?B?NE9iSXRkRXVHY1BxWGM2U1VlNnNwQWN6clc3TnJHU2o1T3JobnJvMTA5VGdC?=
 =?utf-8?B?RFpUSEZXMXF4bUpLa1VrQVJJcHBWaHgvSmRaelNCZkY0eVdPUlJ4NjVZVlJS?=
 =?utf-8?B?WVFwczRHaGdXQlhqbUZWVmx5N0VxTnhLQVhyU05NNzk0YTBqcGl4S1g4YXkr?=
 =?utf-8?B?Q3hBT2QxMTRsUm9ERm8wSmxyUlRkamVHejEzV2lNcjZGODRXK3JXSzR6MFdj?=
 =?utf-8?B?aFVBbklXSVdTa09KUUxKMXpXYy83K0dmR0tqR3AzRm9JSHk4MWJPc2tIOEt4?=
 =?utf-8?B?bzlSczVJc3NMN2ZIdDg3VmFNaEZ2ZjNzUy9DQU1kenNZTHdvYjN0R1Q1ZVdH?=
 =?utf-8?B?a0J2b1c5Y2ZwTzJqTVVEWUJkcEtDb2cxZ2tvY3VCUy9lR2oxMEN1QXU1bFlk?=
 =?utf-8?B?NlZGV2xNNXUyTXl4dk02allxN2xnUUtpN3JrVi9IQTJSRUkxazc5U0lGZ2NJ?=
 =?utf-8?B?c3pTbDZVSFlzbGtIOVZVRUlJUGxiNDRqb2d1bUNKNmtMd09YUzJ6TGlVQzhB?=
 =?utf-8?B?dTFhZkRxVjRQVkNvYzNiZ090dHVkTnBUbjNvSUZyN1d3anlpckZteGJnT1pn?=
 =?utf-8?B?WDFoMXdDYU5XSlBNRWIxVDFpVldzVldVM0RjRUJWQnQyd3lzcUNPbHo5VldC?=
 =?utf-8?B?dmdYT3FzRnlLclhjTHBrTFdjNEVydEtaRVUzT3FScTN0RlR1Yit5aStmVUhz?=
 =?utf-8?B?YzRlMC9zaXBRaUxKa3Z4YXZpMy9uVzdSVHhIV0ZLMlFYV0JLTU1UNHZXNjVW?=
 =?utf-8?B?VWlpTE5EWU43WVdic2xjMVYrS3J2WldLQ081MzE0UExkNzlrYlFCSHBDTHBV?=
 =?utf-8?B?RXFSQ0VyNnZjZHF1SXRvNzJlWWpYZUI4NXVOaTdIWHR2Ym14bFh5azBGc1JH?=
 =?utf-8?B?N3dqQml2SUowR0c3ZW1RRDVBQ2wrRTRpSUdCQUc2ZkRNMHBUUzlDNjdWelpp?=
 =?utf-8?B?RVpWUFQ0aUM5eHNaWkdTMlRoZW1waS9xQ2F3alh5S2ZNd3hBOHhEeHNkSlZW?=
 =?utf-8?B?YjQ5K2p0M0ZRTHVmSmJrMG1jcnU3WHZZanRCNjNzVytFdzBHWUtnMXpWR2Jq?=
 =?utf-8?B?SVdiU0NxWVZMelZVM0tJblF1NThCWW5nWlZtUnV1VUdDUHEzazg5R2ZaT0NV?=
 =?utf-8?B?U3VOR0VYUjh4VDhNaEN2VEZ0SDJVZUZNaXBCejZodm5HVXlWUTVFeFQvTERl?=
 =?utf-8?B?ZlZvajczSnJDU3I0K3dwR1FYSEZvb1FBK2IvN2VIWTRFd2JmN21IWkVxSVZq?=
 =?utf-8?B?UG1FZmhDeEhwb2dEeGVkKzJWQkZqbkt1Qk42N2g2TjROL2ZSODlGQ2ZDVUtp?=
 =?utf-8?B?czFDTXZ4cnF4ZHE4Slg3UXlMZE1KVnF1aGlTU2FzT2x3YWszQjRteENudkF2?=
 =?utf-8?Q?IK9QyY69q55mRxr9jZkt1yVoBhf6lXOhbGymo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 02:54:00.9335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4f408c-6c20-411b-4fb0-08dcf30df298
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317

From: Stefano Stabellini <sstabellini@kernel.org>

Create new repository to produce common artifacts for Xen tests

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 .gitlab-ci.yml                         | 48 ++++++++++++++++++++
 README.md                              | 10 ++++
 binaries/.gitignore                    |  3 ++
 images/Makefile                        | 20 ++++++++
 images/alpine/x86_64-build.dockerfile  | 25 ++++++++++
 images/alpine/x86_64-rootfs.dockerfile |  4 ++
 scripts/x86_64-argo-linux.sh           | 63 ++++++++++++++++++++++++++
 scripts/x86_64-kernel-linux.sh         | 31 +++++++++++++
 scripts/x86_64-rootfs-alpine.sh        | 58 ++++++++++++++++++++++++
 9 files changed, 262 insertions(+)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 README.md
 create mode 100644 binaries/.gitignore
 create mode 100644 images/Makefile
 create mode 100644 images/alpine/x86_64-build.dockerfile
 create mode 100644 images/alpine/x86_64-rootfs.dockerfile
 create mode 100755 scripts/x86_64-argo-linux.sh
 create mode 100755 scripts/x86_64-kernel-linux.sh
 create mode 100755 scripts/x86_64-rootfs-alpine.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 0000000..f2f7738
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,48 @@
+workflow:
+  name: "xen test artifacts"
+
+.artifacts:
+  stage: build
+  image:
+    name: registry.gitlab.com/xen-project/people/victormlira/test-artifacts/${CONTAINER}
+  artifacts:
+    name: "${CI_JOB_NAME_SLUG}"
+    paths:
+      - binaries/
+
+.x86_64-artifacts:
+  extends: .artifacts
+  image:
+    docker:
+      platform: linux/amd64
+      user: xenproject
+  variables:
+    CONTAINER: alpine:x86_64-build
+  tags:
+    - x86_64
+
+x86_64-kernel-linux-6.6.56:
+  extends: .x86_64-artifacts
+  script:
+    - . scripts/x86_64-kernel-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.56
+
+x86_64-rootfs-alpine-3.18:
+  extends: .x86_64-artifacts
+  variables:
+    CONTAINER: alpine:x86_64-rootfs
+  image:
+    docker:
+      user: root
+  script:
+    - . scripts/x86_64-rootfs-alpine.sh
+
+x86_64-argo-linux-6.6.56:
+  extends: .x86_64-artifacts
+  script:
+    - . scripts/x86_64-argo-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.56
+    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
+    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
diff --git a/README.md b/README.md
new file mode 100644
index 0000000..0d72519
--- /dev/null
+++ b/README.md
@@ -0,0 +1,10 @@
+# Xen Project Test Artifacts
+
+## Overview
+
+This repository is used to produce common artifacts for Xen tests.
+
+##
+
+
+##
diff --git a/binaries/.gitignore b/binaries/.gitignore
new file mode 100644
index 0000000..95e2a2e
--- /dev/null
+++ b/binaries/.gitignore
@@ -0,0 +1,3 @@
+# Keep this directory around to be available in CI/CD jobs.
+*
+!.gitignore
diff --git a/images/Makefile b/images/Makefile
new file mode 100644
index 0000000..41638d7
--- /dev/null
+++ b/images/Makefile
@@ -0,0 +1,20 @@
+
+# The base of where these containers will appear
+REGISTRY := registry.gitlab.com/xen-project/people/victormlira/test-artifacts
+CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
+
+help:
+	@echo "Containers to build test artifacts."
+	@echo "To build one run 'make DISTRO/TAG'."
+	@echo "Available containers:"
+	@$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
+	@echo "To push container builds, set the environment variable PUSH"
+
+%: %.dockerfile ## Builds containers
+	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	@if [ ! -z $${PUSH+x} ]; then \
+		docker push $(REGISTRY)/$(@D):$(@F); \
+	fi
+
+.PHONY: all
+all: $(CONTAINERS)
diff --git a/images/alpine/x86_64-build.dockerfile b/images/alpine/x86_64-build.dockerfile
new file mode 100644
index 0000000..374952f
--- /dev/null
+++ b/images/alpine/x86_64-build.dockerfile
@@ -0,0 +1,25 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.18
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+WORKDIR /build/
+
+RUN <<EOF
+adduser -D xenproject
+apk --no-cache add \
+      musl-dev  \
+      build-base \
+      libc6-compat \
+      linux-headers \
+      bash \
+      git \
+      curl \
+      flex \
+      bison \
+      elfutils-dev \
+      autoconf \
+      automake \
+      libtool \
+      openssl-dev
+EOF
diff --git a/images/alpine/x86_64-rootfs.dockerfile b/images/alpine/x86_64-rootfs.dockerfile
new file mode 100644
index 0000000..b912e9c
--- /dev/null
+++ b/images/alpine/x86_64-rootfs.dockerfile
@@ -0,0 +1,4 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.18
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/scripts/x86_64-argo-linux.sh b/scripts/x86_64-argo-linux.sh
new file mode 100755
index 0000000..a110a33
--- /dev/null
+++ b/scripts/x86_64-argo-linux.sh
@@ -0,0 +1,63 @@
+#!/usr/bin/env bash
+
+if test -z "${LINUX_VERSION}"
+then
+    >&2 echo "LINUX_VERSION must be set"; exit 1
+fi
+
+set -ex -o pipefail
+
+BUILDDIR="${PWD}"
+COPYDIR="${BUILDDIR}/binaries/"
+
+# Prepare Linux sources
+curl -fsSLO \
+    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
+tar xJf linux-"${LINUX_VERSION}".tar.xz
+cd linux-"${LINUX_VERSION}"
+make ARCH=x86 defconfig
+make ARCH=x86 xen.config
+./scripts/config --enable BRIDGE
+./scripts/config --enable IGC
+./scripts/config --enable TUN
+cp .config .config.orig
+cat .config.orig \
+    | grep 'XEN' \
+    | grep '=m' \
+    | sed 's/=m/=y/g' \
+    >> .config
+make ARCH=x86 olddefconfig
+make ARCH=x86 modules_prepare
+
+# Build Linux kernel module for Xen Argo
+cd "${BUILDDIR}"
+git clone \
+    --depth=1 --branch=master \
+    https://github.com/OpenXT/linux-xen-argo.git
+git -C "${BUILDDIR}/linux-xen-argo" switch --detach "${ARGO_SHA}"
+make -C "linux-${LINUX_VERSION}" M="${BUILDDIR}/linux-xen-argo/argo-linux" \
+    CFLAGS_MODULE="-Wno-error" KBUILD_MODPOST_WARN=1
+cp "linux-xen-argo/argo-linux/xen-argo.ko" "${COPYDIR}/xen-argo.ko"
+
+# Build Linux libargo shared library, applying fixes to build in Alpine Linux
+cd "${BUILDDIR}/linux-xen-argo/libargo"
+sed -i "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" configure.ac
+sed -i "s/__SOCKADDR_COMMON (sxenargo_)/sa_family_t sxenargo_family/" src/libargo.h
+sed -i "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" src/libargo.h
+autoreconf --install
+./configure --prefix="${COPYDIR}" CPPFLAGS="-I${PWD}/../argo-linux/include"
+make
+make install
+
+# Build Linux user program, modifying for xilinx argo test
+cd "${BUILDDIR}"
+wget "https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/\
+recipes-openxt/argo-exec/argo-exec/argo-exec.c"
+sed -i "s|#include <xen/xen.h>||" argo-exec.c
+sed -i "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" \
+    argo-exec.c
+gcc -I"${BUILDDIR}/linux-xen-argo/libargo/src" \
+    -I"${BUILDDIR}/linux-xen-argo/argo-linux/include" \
+    -L"${COPYDIR}/lib/" \
+    -o argo-exec argo-exec.c -largo
+cp argo-exec "${COPYDIR}"
diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux.sh
new file mode 100755
index 0000000..17be36b
--- /dev/null
+++ b/scripts/x86_64-kernel-linux.sh
@@ -0,0 +1,31 @@
+#!/usr/bin/env bash
+
+if test -z "${LINUX_VERSION}"
+then
+    >&2 echo "LINUX_VERSION must be set"; exit 1
+fi
+
+set -ex -o pipefail
+
+WORKDIR="${PWD}"
+COPYDIR="${WORKDIR}/binaries/"
+
+# Build Linux
+curl -fsSLO \
+    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
+tar xJf linux-"${LINUX_VERSION}".tar.xz
+cd linux-"${LINUX_VERSION}"
+make ARCH=x86 defconfig
+make ARCH=x86 xen.config
+./scripts/config --enable BRIDGE
+./scripts/config --enable IGC
+./scripts/config --enable TUN
+cp .config .config.orig
+cat .config.orig \
+    | grep 'XEN' \
+    | grep '=m' \
+    | sed 's/=m/=y/g' \
+    >> .config
+make ARCH=x86 olddefconfig
+make ARCH=x86 "-j$(nproc)" --quiet
+cp arch/x86/boot/bzImage "${COPYDIR}"
diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
new file mode 100755
index 0000000..28d8e30
--- /dev/null
+++ b/scripts/x86_64-rootfs-alpine.sh
@@ -0,0 +1,58 @@
+WORKDIR="${PWD}"
+
+apk update
+
+# xen runtime deps
+apk add musl
+apk add libgcc
+apk add openrc
+apk add busybox
+apk add sudo
+apk add dbus
+apk add bash
+apk add python3
+apk add zlib
+apk add ncurses
+apk add yajl
+apk add libaio
+apk add xz
+apk add util-linux
+apk add argp-standalone
+apk add libfdt
+apk add glib
+apk add pixman
+apk add curl
+apk add udev
+apk add pciutils
+apk add libelf
+
+# Xen
+cd /
+# Minimal ramdisk environment in case of cpio output
+rc-update add udev
+rc-update add udev-trigger
+rc-update add udev-settle
+rc-update add loopback sysinit
+rc-update add bootmisc boot
+rc-update add devfs sysinit
+rc-update add dmesg sysinit
+rc-update add hostname boot
+rc-update add hwclock boot
+rc-update add hwdrivers sysinit
+rc-update add modules boot
+rc-update add killprocs shutdown
+rc-update add mount-ro shutdown
+rc-update add savecache shutdown
+rc-update add local default
+cp -a /sbin/init /init
+echo "ttyS0" >> /etc/securetty
+echo "hvc0" >> /etc/securetty
+echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
+echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
+echo > /etc/modules
+passwd -d "root" root
+
+# Create rootfs
+cd /
+tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
+    bin dev etc home init lib mnt opt root sbin usr var
--
2.25.1



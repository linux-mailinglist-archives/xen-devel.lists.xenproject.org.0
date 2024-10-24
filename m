Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0709AF5D1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 01:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825584.1239863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t47Ed-0008Sx-Em; Thu, 24 Oct 2024 23:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825584.1239863; Thu, 24 Oct 2024 23:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t47Ed-0008R1-Bg; Thu, 24 Oct 2024 23:27:19 +0000
Received: by outflank-mailman (input) for mailman id 825584;
 Thu, 24 Oct 2024 23:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKxT=RU=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t47Eb-0008CW-UF
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 23:27:18 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20623.outbound.protection.outlook.com
 [2a01:111:f403:2409::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80f8d9dc-925f-11ef-a0bf-8be0dac302b0;
 Fri, 25 Oct 2024 01:27:16 +0200 (CEST)
Received: from CH5PR02CA0007.namprd02.prod.outlook.com (2603:10b6:610:1ed::29)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 23:27:11 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::87) by CH5PR02CA0007.outlook.office365.com
 (2603:10b6:610:1ed::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 23:27:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 23:27:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 18:27:09 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Oct 2024 18:27:09 -0500
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
X-Inumbo-ID: 80f8d9dc-925f-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQeZtL3r9EWdz9KiUOXlB9VZ5O7a9YFC44zMiL8Ks0DFQPoNKQ61kSejsQhmYbDb1c9lO3j4IGYnwtPQf+4Vhpg2BA04CwCh9QTPg9WC4+Zdb5YQyoB1vDaAHYLnQuw+VWp9coRz19kRarbWmDZA5fth2P6RDfqjRzGRhnhqvgTKB/k9VyfKsMOA1MpIqAXjDPRt8LvMmICUO1NIN/bO2k8DHX9SwDldo9+Ytgd7o9DQ6EXU1p95wzUri3xxYbodp9zZtBrEi7Ri6oiBPjCoBjJrjrxoSCiktUyFw0Z6BNownByql5HYY7tOeHzVPYVkw0lKa1oErosGDoU7xns8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0LUaJFjT8XwdIp5i3PMV+jsR+6lpYkPiBuKahmzJMs=;
 b=p6bXEjCvSMdF642puMkQMWi9x0ZplPsMcFYrt8jH6SPwPjJtq89nceucljEFzk9xN1VvF7iVPHis5aoKlVdmesqqQ3QX/QLWrut39ZOnEeHc0Yc9zvlqh11wRMpyIG7RNCpp/RofYYhLxaw66Vn1WvphxbtPcyKA7LAyBLo/PdXdCGUJKIVM6fPxbuZaoIxU8xuLsf3fSFdnSlkj44KhazNC01/6QyjDu7/jDV/SBX1I9GWJUr+OqsOJu655R9cK8U7/pqM30pzBSBjahjPQ8FKQX7/Tic7Af4yKkebiJZ8W6ZaR1h0Z0J4omKpiTxKnldCwtcNjBjWkXiMmm/nBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0LUaJFjT8XwdIp5i3PMV+jsR+6lpYkPiBuKahmzJMs=;
 b=MpdiylOvuwAzQLonqq+UCOehqMcQ1rxLlSdQnrZvJ2YCp1B2Y0zMtuon+f6u0ecGKtcet+XDSsH7bKOpuS0wJkE72BOCsXvq1z9NnHAZ8o99TKtUimydNN13ZLRCazlidGg1IDTQ49t4PnhlIJVuf1ImuiEUExlUdDhgJyqrAYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [TEST_ARTIFACTS PATCH v1 1/1] build: add x86_64 xen artifacts (argo)
Date: Thu, 24 Oct 2024 16:26:49 -0700
Message-ID: <3161fa3f955cda2d3c968d18c8afcc38316323bf.1729809799.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1729809799.git.victorm.lira@amd.com>
References: <cover.1729809799.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 20744b89-a4aa-4fc0-6366-08dcf4836254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXoyZlNkMEE0eXZETnJsbTl4aHVlNjQvYTB2bWdsNlM2SlJ2N2JSTnUxWWh3?=
 =?utf-8?B?NHAwVmpUcjNhVzMzVXVGdk13dmQwNVU0Q3BJVy9tVFB1cFNjc3AxaGIvbDla?=
 =?utf-8?B?V2ZOOVgxSE12L3VsU3NWQTE0VnVkMGI1RXRjWm1saXZ5ZmJEbmlpUXp6QXNR?=
 =?utf-8?B?RTBvOGUwVm9wcDN6RUJHamcrdVorQUdzdmFXOWxsbVhYOWZxenIvaDZNZCtG?=
 =?utf-8?B?Q0MweUNCUENDUmwzbFZNQWZ6UzZoS1UzOW41Q3M4WUdKMkltYk41OFlxN1Bq?=
 =?utf-8?B?YzBmeTRxamYyRllpdWhRSnRFbFd5QWxReU5jckRobjBXV2pvaUVQVnM0Yzd1?=
 =?utf-8?B?ZFIrSjJjcVdHMTd1ZUY1dGpJclk4MEIxZ0EycU1wQ0JkN1A1Q1IvY1BBcjg4?=
 =?utf-8?B?Z3dxeU5BaUZSUzlXeFdCWGhMRTU5YVhqejUzWHdRR1ZTSE03YlVLcHNmRnhu?=
 =?utf-8?B?L3NHL0xFYlE4NUg4RmRRNXVWd2NiL2hlc3ZPWDdhNGV4UVRQYnlnWWlLS1lj?=
 =?utf-8?B?WGxiR05LbittOXk0M2pGWENkY0x3SlhJWFhUNUdBOG16TlMxMFBDK2JjbmZp?=
 =?utf-8?B?ejNycjc1THJxeGl1d0ZFT2laM0RDRmZ0d3JDRUJYeElOL04yOGJLMit0RHFu?=
 =?utf-8?B?NDcvL2hEZllZa0ZqMlVKKzc3UUZnMjY2ZVNScjB2TEM0Wjg5Rnl0ZFFjTTBN?=
 =?utf-8?B?bDZNeFcxcFlweUVEUnVEKzhNYmoxR3hQcm02eXpKYUJRcG02K3FKcFRNUkU4?=
 =?utf-8?B?WFRaakF6cUpsU1ZIVWRqK3VqdHp5QUFOOTVXRS9CWWxlaDFHcWVZTEhVaTFI?=
 =?utf-8?B?dFhnSXZFSkxJR0RkZU1iV1hFVElyVWpPNHBkenNKcGFlampqVytwNTFKWkEz?=
 =?utf-8?B?RFprb2t6NE9BTW9vdWFvMFI5RTVFMzFNTVlPaGxQT0hNTWNjYWJvckc0bDVu?=
 =?utf-8?B?VnN1eXFudzVSVzRINzg3UWlQQ1hFdVpHNC9PUi96cW1zS1Q3RVVjb2pVQVpE?=
 =?utf-8?B?VHZXYXNiTTVkaVY1SDdlcGRGeXpxZlBUbi9UcW5iMGI4WkVPckpkQ3FiSUlp?=
 =?utf-8?B?ZmFGbmJNc2h6WUdnOVR3N2cyeDZ1N2JRdHZuRGI2TE5ncTV2MjYxbjRXTUJ0?=
 =?utf-8?B?TGM0M3JONlhLb0Q0WmYxdzUwVlQxZURNTis4cmxib0NwOFpaeTQxemJhdmkx?=
 =?utf-8?B?Q1NRZys3eVdwYmpERnJWUnFpU3l2NFJxR3k1dllURm1rTUlmWnZ1bW9na3d6?=
 =?utf-8?B?ZUtzRXB4NnROZS83VW5tTHV2ZS9YZ2NXS1VKdmlMbUFDRFhlYVhCWTh3OFhP?=
 =?utf-8?B?bVNBUUhuUy93NS9sd3hxeTByTEtRVE40QzVxbTI2TGt5bVJnV0lKSDAxK2Rh?=
 =?utf-8?B?ekdnTDFkUVRYNW8yT0tWQ3pldUgyZ2pLZGY4MjIrMzJaWUNmYitHaENQY25N?=
 =?utf-8?B?ZkNJU3BlRDJua1NNU2RqcjE3cHozNkhOOTdRWVRQd1RUbHFtOCtOaEM2M1pB?=
 =?utf-8?B?ZmpxK1dqM0NTRlg4eDhadWFGMlloQXFzSkVVb1BKQmptemFObE42SHExV0Vv?=
 =?utf-8?B?T0hxTmRUeU9DYnI4NHpoVmhDL3J6MlV1Y0Nma3BJU0IvbFZ5cXBUdUVrWWxw?=
 =?utf-8?B?QjhpNHdkVlhJaDNBWmdpVVBUcmp4bGhWSUl1bldlM2dhZ1BoejBnL2tVKzc5?=
 =?utf-8?B?aHF3QUlJdmEySjdQaHNnK2dmc3J5cFpZdlNkenRBbFVkZWZaR21meTlyaDNR?=
 =?utf-8?B?QlZWTkZBN0xkbS9vckwrMUpzZU8vYkxZem96a21Kd3FqbmxYNWtXQkZOV0Zo?=
 =?utf-8?Q?py9NseH7ei2/wdxg8M34r8KZMLVmXt6rhyceo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:27:10.6421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20744b89-a4aa-4fc0-6366-08dcf4836254
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054

From: Victor Lira <victorm.lira@amd.com>

Add container image build files:
- alpine/x86_64-build
- alpine/x86_64-rootfs
- Makefile

Add CI configuration and jobs to produce binaries for xen tests:
- xen-argo          Linux Xen Argo kernel module
- bzImage           Linux kernel
- libargo           Linux Argo shared library
- argo-exec         Linux Argo test program
- initrd.tar.gz     Alpine Linux rootfs

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes v1:
- Update dockerfile format to group dependencies
- add user to build container
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 .gitlab-ci.yml                         | 50 ++++++++++++++++++++
 binaries/.gitignore                    |  3 ++
 images/Makefile                        | 20 ++++++++
 images/alpine/x86_64-build.dockerfile  | 31 +++++++++++++
 images/alpine/x86_64-rootfs.dockerfile |  4 ++
 scripts/x86_64-argo-linux.sh           | 63 ++++++++++++++++++++++++++
 scripts/x86_64-kernel-linux.sh         | 31 +++++++++++++
 scripts/x86_64-rootfs-alpine.sh        | 58 ++++++++++++++++++++++++
 8 files changed, 260 insertions(+)
 create mode 100644 .gitlab-ci.yml
 create mode 100644 binaries/.gitignore
 create mode 100644 images/Makefile
 create mode 100644 images/alpine/x86_64-build.dockerfile
 create mode 100644 images/alpine/x86_64-rootfs.dockerfile
 create mode 100755 scripts/x86_64-argo-linux.sh
 create mode 100755 scripts/x86_64-kernel-linux.sh
 create mode 100755 scripts/x86_64-rootfs-alpine.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 0000000..7e18a87
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,50 @@
+workflow:
+  name: "xen test artifacts"
+
+.artifacts:
+  stage: build
+  image:
+    name: registry.gitlab.com/xen-project/hardware/test-artifacts/${CONTAINER}
+  artifacts:
+    name: "${CI_JOB_NAME_SLUG}"
+    paths:
+      - binaries/
+    exclude:
+      - binaries/.gitignore
+
+.x86_64-artifacts:
+  extends: .artifacts
+  image:
+    docker:
+      platform: linux/amd64
+      user: xenproject
+  tags:
+    - x86_64
+  variables:
+    CONTAINER: alpine:x86_64-build
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
+  image:
+    docker:
+      user: root
+  script:
+    - . scripts/x86_64-rootfs-alpine.sh
+  variables:
+    CONTAINER: alpine:x86_64-rootfs
+
+x86_64-argo-linux-6.6.56:
+  extends: .x86_64-artifacts
+  script:
+    - . scripts/x86_64-argo-linux.sh
+  variables:
+    LINUX_VERSION: 6.6.56
+    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
+    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
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
index 0000000..42f231b
--- /dev/null
+++ b/images/Makefile
@@ -0,0 +1,20 @@
+
+# The base of where these containers will appear
+REGISTRY := registry.gitlab.com/xen-project/hardware/test-artifacts
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
index 0000000..3bfd172
--- /dev/null
+++ b/images/alpine/x86_64-build.dockerfile
@@ -0,0 +1,31 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.18
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+WORKDIR /build/
+
+RUN apk --no-cache add bash
+
+RUN bash -ex <<EOF
+      adduser -D xenproject --shell bash
+
+      DEPS=(
+            musl-dev
+            build-base
+            libc6-compat
+            linux-headers
+            bash
+            git
+            curl
+            flex
+            bison
+            elfutils-dev
+            autoconf
+            automake
+            libtool
+            openssl-dev
+      )
+
+      apk add --no-cache "\${DEPS[@]}"
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
index 0000000..2a816f0
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
+make -s -j "$(nproc)" ARCH=x86
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



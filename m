Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9A965302
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 00:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786137.1195690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnjM-0003Mp-M5; Thu, 29 Aug 2024 22:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786137.1195690; Thu, 29 Aug 2024 22:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjnjM-0003L8-J0; Thu, 29 Aug 2024 22:35:04 +0000
Received: by outflank-mailman (input) for mailman id 786137;
 Thu, 29 Aug 2024 22:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjnjK-000330-Pl
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 22:35:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec89af0e-6656-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 00:35:00 +0200 (CEST)
Received: from CH2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:59::22)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 22:34:54 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::4c) by CH2PR03CA0012.outlook.office365.com
 (2603:10b6:610:59::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 22:34:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 22:34:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 17:34:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 17:34:52 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 29 Aug 2024 17:34:52 -0500
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
X-Inumbo-ID: ec89af0e-6656-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCIclsFLjbTirbjJWJ5DddrjPvcqAim+fjSUpHWaIEph1aBvTwz9Lk0SeijnaDpRTQZ0ZHqZ0o2Vcnc2P9D2d2fPHWCi0sco7dB/HLj8UxwTxy9NsLAfHZZtg5YP7hgDI3txqVl73wW0BjG+EYXpzyyB/6NMNZhNUx7ixPoXdqGuKsXUr5WnhFw+dN0YHIGook70QD00FGMVbSoWWO3x5iNybKWO/4f0IP+eueVaAIdC9WIiioB0LBxmDXil49x4vOuKi3yHhQqNUO3d1kty2xZJ2NvfP6XrV8lk3twIcH8GEEvxJ86bcSHIrHCWxigOmJDhqGPStyTWc4P5z+fU+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDjxXa+T088VquLWdlKJWLM1PWaU1rdeMmmnf3wCXPE=;
 b=D5b/UW8TX50rgXG4ZbjUQYD2fWb3E/Vm/9R9LRnGprbTT6GgJoXlYOuu2WbtONvS5GiiP9xXB4Wi8X/vm9RI9EWvivtR89T8Cg+4XWQEkDYifC8UY++HMkb4zn9qwj2ZJblg4UqzflF0j7vqpqtxHHJB4OP8Iflal8P2Kv4/0TPgRdLByhPhp4ccYqoebcZnMXB5cYrlFs9g0ZLrLr21glYJbFsIn6w/pQewgf0qBFFu4Ay9oDQgCjX1t7PNApgEYQiQ0KSHj0vYwRIyoCIAwXvuZCGbKdjcI8srtmM+qMQPAUw/uL9I0xmp2SABpso3QNlZSl6yE4+uxQshx1R/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDjxXa+T088VquLWdlKJWLM1PWaU1rdeMmmnf3wCXPE=;
 b=wwKbc2GP0FYCbZch/IIGkzuoMDDDDGLG/rOPfGbauIUsp8iC9LIgTIq8hJqQ5OMEeLId9dyODog76GJAdaDpM44y68AYDdQKc8vC6oC3i0MX7vbBxPyijkcn1+Go1bQhiNxKFJnUoboqAZ26tNU7su8Oe5tkcHaKkXR5qt8QTHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH v2 2/2] automation: use expect utility in xilinx tests
Date: Thu, 29 Aug 2024 15:34:23 -0700
Message-ID: <5bbea0bbf22b409dd047b93e2e8cebcab61d14d5.1724967614.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1724967614.git.victorm.lira@amd.com>
References: <cover.1724967614.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: d31913c4-1328-4e11-e12b-08dcc87acdc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6gpoesJPAOSU2TdUqG7pTCKAfqwmZL5MMGb2JvNPtqGkxfVXhGhfyhKNHmWS?=
 =?us-ascii?Q?1QPMIgS36ACGuMIM4LDu38TDxF3EXQiuq3RwBVw1GNkxafJwFM/XXqNRULIs?=
 =?us-ascii?Q?VziFpfffQBZn5+8Cx5brgqA1jeCgPQJDIYrwzw5/CEACRBhEFHJ2r93QD9Cj?=
 =?us-ascii?Q?0eT2N5IsmAgAuZaQRU4lRvwDyw21GYCMcDHtDtcpiKKHOmsbuHf6YAVmq3/R?=
 =?us-ascii?Q?LvQ2HqDdPB3j9PSS3YphSvJ7DhvsiurM8qjJvsaybsjMJm2EObS7cjIsoIu8?=
 =?us-ascii?Q?ljB3mhPVMitTxu89SBWgpH775dsNCqzgaEPkYGeoKKnzT044DKMUWXMgyL2j?=
 =?us-ascii?Q?BLYqh8PfqZXetPriQ8LYZR/sO6YmzX1RNu/hosDuKJqRGIL6NsoiLIQMKU6H?=
 =?us-ascii?Q?Tfvt3RUT2hAmbP5oT+L/zv8zq8aWNZSvfUdqbjVzm+slkEj0DkPwVhp4XXAx?=
 =?us-ascii?Q?x0LLDLmioE5g3Hh3ecXBrgAb6m0vAAQkP2LgpGhg4LE2fgGFGXKCQ/TaR47c?=
 =?us-ascii?Q?9wlGN/g11MPfHuPNHkiiJnF+8s9RepIrCQlB+2FOlU7Yl3Re2VsZa5iGJLoe?=
 =?us-ascii?Q?JUrsONaZT+JMRviuSZuu7jmYCaorTT8o6rX8gYRhzAlrdyECtlUR5516+bNY?=
 =?us-ascii?Q?thfBJR717UQqM6jBbNYaQJ9s2Lqs/6pE/83aLp40wnYWuZg12gtYoN/MA1Ur?=
 =?us-ascii?Q?zF44gLsc2O9gKajsM8dSrtmlOPOp0/xyLySMCiVFMs7/pIwRhQ7/e6Xk7Cex?=
 =?us-ascii?Q?vI8R5fYCm31IJqma7E7PGepOsBjX3l/bS1+PPYv78kJKpUV8pZihe5b4rp2A?=
 =?us-ascii?Q?UQHeVQh0tqu29aAmsjD26SUtQPCgvm+dZl818tFWoqaAjhBTOyfvPMkxk4ue?=
 =?us-ascii?Q?b3eWQMpYkXg5RQoAGlNvRSCqATNbS254K7jNJAINmIdi+rvkJGexS/2KeXMB?=
 =?us-ascii?Q?fQX899aeclkY3oetD9RomORcfI2Km72LDk0bOZeE5P5qzx+KKUoGRcCU/DGp?=
 =?us-ascii?Q?IlupV8yxqxHYWDrDpSdZLebxHxcbl0yYNKHTon51JBLQrE8wxVPp2IH0ZGRM?=
 =?us-ascii?Q?BUJkVUfRPaRaqKXf4DID8QC8dwDV0d14H6EpkicGRGgXUgIQxSNssTQRXX5N?=
 =?us-ascii?Q?6ghMpCRRHRuVXvLc2ICgPmxQRiBL5Sj6ci5Sbj6Oh32jiPzRzE0hThtsaUuW?=
 =?us-ascii?Q?uLPrx6Ajuc0tNe2aICzax5UAsxOF3R+VLDPRzaJbtB4q47zTOA4XB6JLOoz/?=
 =?us-ascii?Q?tjqC6G7XkPV81nGFdTm4bOE4oZdW3fjPdhSX65YM5DQzuHHKNY9XsQEexbro?=
 =?us-ascii?Q?CWKriEy3BvasgICWyT8OirENA9Czu9EEDxosXtSNLL3oQPaG+8fCKvlUs+bT?=
 =?us-ascii?Q?uqcWGHPFIt2I5pjGgNiJUFeZ4K0+8PIL3G5p4Mr7VtAFh2Jtmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:34:54.0465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31913c4-1328-4e11-e12b-08dcc87acdc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585

From: Victor Lira <victorm.lira@amd.com>

Fixes: 95764a0817a5 (automation: update xilinx test scripts (tty))
This patch introduced a CI failure due to a timeout in xilinx-x86_64 test.

Change xilinx-x86_64 and xilinx-arm64 scripts to use "expect" utility
to determine test result and allow early exit from tests.
Add "expect" to xilinx container environment (dockerfile).
Rename references to "QEMU" in "qemu-key.exp" expect script to "TEST" to be
used by both QEMU and hardware tests.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org
---
 .../build/ubuntu/xenial-xilinx.dockerfile     |  1 +
 automation/gitlab-ci/test.yaml                |  2 ++
 .../scripts/{qemu-key.exp => console.exp}     |  8 +++----
 automation/scripts/qemu-alpine-x86_64.sh      |  6 ++---
 automation/scripts/qemu-smoke-dom0-arm32.sh   |  6 ++---
 automation/scripts/qemu-smoke-dom0-arm64.sh   |  6 ++---
 .../scripts/qemu-smoke-dom0less-arm32.sh      |  6 ++---
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  6 ++---
 automation/scripts/qemu-smoke-ppc64le.sh      |  6 ++---
 automation/scripts/qemu-smoke-riscv64.sh      |  6 ++---
 automation/scripts/qemu-smoke-x86-64.sh       |  6 ++---
 automation/scripts/qemu-xtf-dom0less-arm64.sh |  6 ++---
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 22 +++++++++----------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 19 ++++++++--------
 14 files changed, 54 insertions(+), 52 deletions(-)
 rename automation/scripts/{qemu-key.exp => console.exp} (83%)

diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
index f03d62e8bd3f..6107d8b7711f 100644
--- a/automation/build/ubuntu/xenial-xilinx.dockerfile
+++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
@@ -20,6 +20,7 @@ RUN apt-get update && \
         git \
         gzip \
         file \
+        expect \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 3b339f387fbe..e3ebe3745994 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -84,6 +84,7 @@
   variables:
     CONTAINER: ubuntu:xenial-xilinx
     LOGFILE: qemu-smoke-xilinx.log
+    TEST_TIMEOUT: 120
   artifacts:
     paths:
       - smoke.serial
@@ -103,6 +104,7 @@
     LOGFILE: xilinx-smoke-x86_64.log
     XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
     TEST_BOARD: "crater"
+    TEST_TIMEOUT: 500
   artifacts:
     paths:
       - smoke.serial
diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/console.exp
similarity index 83%
rename from automation/scripts/qemu-key.exp
rename to automation/scripts/console.exp
index 66c416483146..f538aa6bd06c 100755
--- a/automation/scripts/qemu-key.exp
+++ b/automation/scripts/console.exp
@@ -1,16 +1,16 @@
 #!/usr/bin/expect -f

-if {[info exists env(QEMU_TIMEOUT)]} {
-    set timeout $env(QEMU_TIMEOUT)
+if {[info exists env(TEST_TIMEOUT)]} {
+    set timeout $env(TEST_TIMEOUT)
 } else {
     set timeout 1500
 }

-log_file -a $env(QEMU_LOG)
+log_file -a $env(TEST_LOG)

 match_max 10000

-eval spawn $env(QEMU_CMD)
+eval spawn $env(TEST_CMD)

 expect_after {
     -re "(.*)\r" {
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 93914c41bc24..1ff689b577e3 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -76,7 +76,7 @@ EOF

 # Run the test
 rm -f smoke.serial
-export QEMU_CMD="qemu-system-x86_64 \
+export TEST_CMD="qemu-system-x86_64 \
     -cpu qemu64,+svm \
     -m 2G -smp 2 \
     -monitor none -serial stdio \
@@ -84,8 +84,8 @@ export QEMU_CMD="qemu-system-x86_64 \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"

-export QEMU_LOG="smoke.serial"
+export TEST_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 7c282eff3a58..e1cd83880928 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -77,7 +77,7 @@ git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config

 rm -f ${serial_log}
-export QEMU_CMD="./qemu-system-arm \
+export TEST_CMD="./qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
@@ -91,8 +91,8 @@ export QEMU_CMD="./qemu-system-arm \
    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="${serial_log}"
+export TEST_LOG="${serial_log}"
 export LOG_MSG="Domain-0"
 export PASSED="/ #"

-../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+../automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 81f210f7f50e..4d22a124df11 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -93,7 +93,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf

 # Run the test
 rm -f smoke.serial
-export QEMU_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
@@ -104,8 +104,8 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 38e8a0b0bd7d..41f6e5d8e615 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -130,7 +130,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config

 # Run the test
 rm -f ${serial_log}
-export QEMU_CMD="./qemu-system-arm \
+export TEST_CMD="./qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
@@ -144,8 +144,8 @@ export QEMU_CMD="./qemu-system-arm \
     -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="${serial_log}"
+export TEST_LOG="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
 export PASSED="${passed}"

-../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+../automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index ea67650e17da..83e1866ca6c5 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -204,7 +204,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf

 # Run the test
 rm -f smoke.serial
-export QEMU_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
     -m 2048 -monitor none -serial stdio \
@@ -215,8 +215,8 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOG="smoke.serial"
 export LOG_MSG="Welcome to Alpine Linux"
 export PASSED="${passed}"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 49e189c37058..617096ad1fa8 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -10,7 +10,7 @@ machine=$1
 # Run the test
 rm -f ${serial_log}

-export QEMU_CMD="qemu-system-ppc64 \
+export TEST_CMD="qemu-system-ppc64 \
     -bios skiboot.lid \
     -M $machine \
     -m 2g \
@@ -21,7 +21,7 @@ export QEMU_CMD="qemu-system-ppc64 \
     -serial stdio \
     -kernel binaries/xen"

-export QEMU_LOG="${serial_log}"
+export TEST_LOG="${serial_log}"
 export PASSED="Hello, ppc64le!"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 422ee03e0d26..8f755d0a6a99 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -5,14 +5,14 @@ set -ex -o pipefail
 # Run the test
 rm -f smoke.serial

-export QEMU_CMD="qemu-system-riscv64 \
+export TEST_CMD="qemu-system-riscv64 \
     -M virt \
     -smp 1 \
     -nographic \
     -m 2g \
     -kernel binaries/xen"

-export QEMU_LOG="smoke.serial"
+export TEST_LOG="smoke.serial"
 export PASSED="All set up"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 7495185d9fc6..da0c26cc2f82 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -15,12 +15,12 @@ case $variant in
 esac

 rm -f smoke.serial
-export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
+export TEST_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
         -initrd xtf/tests/example/$k \
         -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
         -m 512 -monitor none -serial stdio"

-export QEMU_LOG="smoke.serial"
+export TEST_LOG="smoke.serial"
 export PASSED="Test result: SUCCESS"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index acef1637e25b..9608de6ec033 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -50,7 +50,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf

 # Run the test
 rm -f smoke.serial
-export QEMU_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
@@ -61,7 +61,7 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOG="smoke.serial"
 export PASSED="${passed}"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 4559e2b9ee1f..ef6e1361a95c 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -1,8 +1,8 @@
-#!/bin/sh
+#!/usr/bin/env bash

 # Run x86_64 dom0 tests on hardware.

-set -ex
+set -ex -o pipefail

 fatal() {
     echo "$(basename "$0") $*" >&2
@@ -27,7 +27,6 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-TIMEOUT_SECONDS=200

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -125,20 +124,19 @@ boot

 # Power cycle board and collect serial port output.
 SERIAL_DEV="/dev/serial/${TEST_BOARD}"
-SERIAL_CMD="cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
 sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
 sleep 5
 sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
 sleep 5
 set +e
 stty -F ${SERIAL_DEV} 115200
-timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
-sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
-
-set -e

-if grep -q "${PASS_MSG}" smoke.serial; then
-    exit 0
-fi
+# Capture test result and power off board before exiting.
+export PASSED="${PASS_MSG}"
+export TEST_CMD="cat ${SERIAL_DEV}"
+export TEST_LOG="smoke.serial"

-fatal "Test failed"
+./automation/scripts/console.exp | sed 's/\r\+$//'
+TEST_RESULT=$?
+sh "/scratch/gitlab-runner/${TEST_BOARD}.sh" 2
+exit ${TEST_RESULT}
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 18aa07f0a273..b24ad11b8cac 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -1,6 +1,6 @@
 #!/bin/bash

-set -ex
+set -ex -o pipefail

 test_variant=$1

@@ -137,13 +137,14 @@ cd $START
 SERIAL_DEV="/dev/serial/zynq"
 set +e
 stty -F ${SERIAL_DEV} 115200
-timeout -k 1 120 nohup sh -c "cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"

-# stop the board
-cd /scratch/gitlab-runner
-bash zcu102.sh 2
-cd $START
+# Capture test result and power off board before exiting.
+export PASSED="${passed}"
+export LOG_MSG="Welcome to Alpine Linux"
+export TEST_CMD="cat ${SERIAL_DEV}"
+export TEST_LOG="smoke.serial"

-set -e
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
-exit 0
+./automation/scripts/console.exp | sed 's/\r\+$//'
+TEST_RESULT=$?
+sh "/scratch/gitlab-runner/zcu102.sh" 2
+exit ${TEST_RESULT}
--
2.25.1



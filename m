Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9EB963942
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 06:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785401.1194841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWY1-0000VM-Q7; Thu, 29 Aug 2024 04:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785401.1194841; Thu, 29 Aug 2024 04:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjWY1-0000Sy-Md; Thu, 29 Aug 2024 04:14:13 +0000
Received: by outflank-mailman (input) for mailman id 785401;
 Thu, 29 Aug 2024 04:14:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjWY0-0000SB-EZ
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 04:14:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2415::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 236fd54b-65bd-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 06:14:10 +0200 (CEST)
Received: from BYAPR11CA0089.namprd11.prod.outlook.com (2603:10b6:a03:f4::30)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 04:14:04 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::f1) by BYAPR11CA0089.outlook.office365.com
 (2603:10b6:a03:f4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 04:14:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 04:14:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 23:13:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 23:13:26 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 28 Aug 2024 23:13:25 -0500
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
X-Inumbo-ID: 236fd54b-65bd-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z37Za/hRhn/OhK8mFRWlE3da3+uSevcl2wVNMacwg2dyrUtjOPwLPAx1p85FodKHH0xkAyPuEoL1TLlwCupztGCojBY410ORRWyUZhAnAxJqzs0KaiCUxLcZYd+aMFjvralXX7jMtFQq1Raa1XPKrM8gRQj1xqN/uJW4SZgS+2mdGrIgoUNDiAdbLAW8PhfaCkfG+qX+BI/x92pVP6uK4l3r95FJ/8Y1Qdh0Kyj6ge/Xq/ZF7Zbui+qsc7V+5GU/dzJqAzTOmd05Z9GkI1nZK19KGox9+sfFc9mx5yDNYOnPZ83bTFO4VL8XxMDhi/ifSQ1grfTeXSGvXla+v2gBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ROK+JzG6w0la5ILJ3khYDvH0QlaEN7IBcIWNfYChCs=;
 b=XjrU/K8mhIF5nwn9a093gKcgAQ7DkuIew3VlvjiTs2acfKPAXgCAu++lGAp+/ZAQJM9AKW72MUxlfOts1tlRHSb5mw7S1BHLK9twF4QXEa5l6TrulHBe+iVGhELaiV8xtlD1dyiA9l+7c9PBnnytSdEQjjwiu7QGYuzNyGKwvw+XHJJDb3h3jPwyGnKIE77ufHEi++eqWY9yYWVXQosPfuxYmIv6fL40HkxNbIZ5ysOAauELi6PMvmgj6B9gTnDLwWECG/l/UFywwNtk6JmDgHraXBQGrhkqrOJSe6zPJyok4iwAT1c5aj36Bk5iiPeTPVdSNYRazwmtMu2ARxU2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ROK+JzG6w0la5ILJ3khYDvH0QlaEN7IBcIWNfYChCs=;
 b=H2FJTh6b3l3aMQYCS0EBx89ItSwSvSzpTRvbCtjaA4KnWQFdbAoxnNg16QSy8Rdl2QUow3JBcwKb7Laz5vRqCCREOx8jpE81IoNfmesFl1vUxeuSP4FEDKDKDvjjUjIb9iIDREdZej0WQEhchLN/a0nd+Cm9/Xhlzhcc06S19E4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] automation: fix false success in qemu tests
Date: Wed, 28 Aug 2024 21:09:14 -0700
Message-ID: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|PH7PR12MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d1585d-cd37-4246-2899-08dcc7e1046a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U4cctDlujQrTipXbeoMokPNTmxk0JJRktgc2Jd5rKDVZ+AHWp/Zws7yqfz9s?=
 =?us-ascii?Q?TqQszxvk0LzRhVRRYqqGFy7zKoe0eadb2eZKYJWtrEu5nnyLRUdaATyvshvC?=
 =?us-ascii?Q?KOQxWVcG0oHHJqcs/9L6SGG6SCZLtD622Hx2dVoQACZg3EqyLN/drtf8OWMX?=
 =?us-ascii?Q?MQi9mSgthwqcSYKpmmnYZ5RYJtXH/rSMzYe6KhxgKNVb6wEmBVzuh/u0ric2?=
 =?us-ascii?Q?jsjmnapV3XVcH5oAQtxErIGRaLkfiJd7vU/ehRP9essVDEEUJF5eaw9RJTgZ?=
 =?us-ascii?Q?Sv40PqlxSFcT8euIjB18A0/Bg1AMhd0yHrYFPvtYhZYCDQlVHNUSJ0LsfbP7?=
 =?us-ascii?Q?HPImX5Hf4suSQ6AuDuv/fk6CXxH79+zQmC3FVRIVaCpQ9p5N/1CKrLrXIXkq?=
 =?us-ascii?Q?pVCVW//vT9ZaKp/pJglAwO37HOFoWKNQMCc6tbLLVuQcXmQO7+vWIVC2VXvJ?=
 =?us-ascii?Q?A94QEeNxv1aJTzIkMVV2Lo+DNY7zOi9PKCsOBCxqbFg4Jg1CNIbykcJ9VToj?=
 =?us-ascii?Q?AIp3Qd2CNJ+TXyb4W8U6eI+NoF5i5LXO4ky7A6t9jBYnDnjJUb+jeJbCxTWQ?=
 =?us-ascii?Q?dWtoyOx3pweIBG7u9M0cagumqT2RxxKPfiAeLi1giTJUrxQJnokHaU3CgHog?=
 =?us-ascii?Q?drHiyD03Htb85cCXFMruObXKMRk0qcHeRY6fMc2IMqyVfC730qDpbH2G9Bb/?=
 =?us-ascii?Q?cceVldG2KjpqrsYvOwgp0WxJbi/pRbGZTLc7UAuAzPhRHAZe+XWN4XsVoMyn?=
 =?us-ascii?Q?yzVw22kCQ1ZZp0LIAOlyc51GPJopFyuvoLY8Yjr4ZeBPNDUNYa0sYbSAk+I8?=
 =?us-ascii?Q?FYGmz4XTrSWJVeAsuwS1iABUDPhJSeYjyyAEnDQNHl6y/meNslyfVsQfr0HC?=
 =?us-ascii?Q?QDsiKKOn99YK3Dr6dh1MlHuXjCitti95XFSmZpJknWnzOfFhuUOBOqQB0/SO?=
 =?us-ascii?Q?h0exZBx8XLdeeAaD3kQbb+Va2kWy3Ou8UlRTnwbP8l7V51I3JFi9B6fPQkvM?=
 =?us-ascii?Q?7nX5wY4GZl1NNj1Qe8dNP5cUJ/wqCPOXI0q1QwmZonwAEC7lGe7uuLdfwlfa?=
 =?us-ascii?Q?jdnN3LF2/YGHn/DCHSoLxfG8+8CT1AjCCH2xF/WiIZECnOI+6LF0dkNsfHI9?=
 =?us-ascii?Q?KUhlTDAHFkSmtC521G5RwdNi2O6WyTAx8Y8V9pNJf7pMIvYVcljVzeWB65nM?=
 =?us-ascii?Q?a+Wcqf0Kd0hRaflhBvSjttNQWgD0qUODTnvzu0upz6O3z1ZvyExlwa2vOEpG?=
 =?us-ascii?Q?K9s9fzdzMaS2NNROGyaLcNPSzAU1JkhnuQvtwF1baxJ+qwyFrvmwNMtrmhlO?=
 =?us-ascii?Q?fQofHeWtSeoe/sb8w/ySjmDE8Rou/fCTUwWrpjr0tnvNuLIaYexXnLjofQdj?=
 =?us-ascii?Q?JBbapGRKaetoIF55AK7Jdc7EpktQ4FC5N5M19bpQD5M0dMPc6jLRbep2h9VK?=
 =?us-ascii?Q?McgfhUuEqu970wbb1LkI0oxEFDQa+E4S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 04:14:03.2277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d1585d-cd37-4246-2899-08dcc7e1046a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685

From: Victor Lira <victorm.lira@amd.com>

Fix flaw in qemu-*.sh tests that producess a false success. The following
lines produces success despite the "expect" script producing nonzero exit
status.

    set +e
...
    ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
    (end of file)

The "set +e" is sometimes needed for cleanup such as powering off hardware
after running a test.

Fixes the CI failure introduced by 95764a0817.

Update xilinx-smoke tests to use the "expect" utility for early exit from
tests. Generalize the variable names in the script "qemu-key.exp" to be
used by both QEMU and hardware tests. Add a missing "-continue_timer" flag
for the expect script to properly time out. Add "expect" to xilinx
dockerfile.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 .../build/ubuntu/xenial-xilinx.dockerfile     |  1 +
 automation/gitlab-ci/test.yaml                |  2 ++
 .../scripts/{qemu-key.exp => console.exp}     | 27 +++++++++++--------
 automation/scripts/qemu-alpine-x86_64.sh      | 13 ++++++---
 automation/scripts/qemu-smoke-dom0-arm32.sh   | 15 +++++++----
 automation/scripts/qemu-smoke-dom0-arm64.sh   | 15 +++++++----
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 15 +++++++----
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 15 +++++++----
 automation/scripts/qemu-smoke-ppc64le.sh      | 13 ++++++---
 automation/scripts/qemu-smoke-riscv64.sh      | 13 ++++++---
 automation/scripts/qemu-smoke-x86-64.sh       | 13 ++++++---
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 13 ++++++---
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 22 +++++++--------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 21 ++++++++-------
 14 files changed, 127 insertions(+), 71 deletions(-)
 rename automation/scripts/{qemu-key.exp => console.exp} (50%)

diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
index f03d62e8bd..6107d8b771 100644
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
index 3b339f387f..e3ebe37459 100644
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
similarity index 50%
rename from automation/scripts/qemu-key.exp
rename to automation/scripts/console.exp
index 787f1f08cb..2cf31e7ac0 100755
--- a/automation/scripts/qemu-key.exp
+++ b/automation/scripts/console.exp
@@ -1,23 +1,29 @@
 #!/usr/bin/expect -f

-if {[info exists env(QEMU_TIMEOUT)]} {
-    set timeout $env(QEMU_TIMEOUT)
+if {[info exists env(TEST_TIMEOUT)]} {
+    set timeout $env(TEST_TIMEOUT)
 } else {
     set timeout 1500
 }

-log_file -a $env(QEMU_LOG)
+log_file -a $env(TEST_LOGFILE)

 match_max 10000

-eval spawn $env(QEMU_CMD)
+eval spawn $env(TEST_CMD_START)

 expect_after {
     -re "(.*)\r" {
-        exp_continue
+        exp_continue -continue_timer
+    }
+    timeout {
+        send_error "ERROR-Timeout!\n"
+        exit 1
+    }
+    eof {
+        send_error "ERROR-EOF!\n"
+        exit 1
     }
-    timeout {send_error "ERROR-Timeout!\n"; exit 1}
-    eof {send_error "ERROR-EOF!\n"; exit 1}
 }

 if {[info exists env(UBOOT_CMD)]} {
@@ -28,22 +34,21 @@ if {[info exists env(UBOOT_CMD)]} {

 if {[info exists env(LOG_MSG)]} {
     expect {
-        "$env(PASSED)" {
+        "$env(TEST_PASS_MSG)" {
             expect "$env(LOG_MSG)"
             exit 0
         }
         "$env(LOG_MSG)" {
-            expect "$env(PASSED)"
+            expect "$env(TEST_PASS_MSG)"
             exit 0
         }
     }
 }

 expect {
-    "$env(PASSED)" {
+    "$env(TEST_PASS_MSG)" {
         exit 0
     }
 }

 expect eof
-
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 42a89e86b0..e9a1577af7 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -77,7 +77,7 @@ EOF
 # Run the test
 rm -f smoke.serial
 set +e
-export QEMU_CMD="qemu-system-x86_64 \
+export TEST_CMD_START="qemu-system-x86_64 \
     -cpu qemu64,+svm \
     -m 2G -smp 2 \
     -monitor none -serial stdio \
@@ -85,8 +85,13 @@ export QEMU_CMD="qemu-system-x86_64 \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"

-export QEMU_LOG="smoke.serial"
+export TEST_LOGFILE="smoke.serial"
 export LOG_MSG="Domain-0"
-export PASSED="BusyBox"
+export TEST_PASS_MSG="BusyBox"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index fd64b19358..dc2ed1f968 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -78,7 +78,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config

 rm -f ${serial_log}
 set +e
-export QEMU_CMD="./qemu-system-arm \
+export TEST_CMD_START="./qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
@@ -92,8 +92,13 @@ export QEMU_CMD="./qemu-system-arm \
    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="${serial_log}"
+export TEST_LOGFILE="${serial_log}"
 export LOG_MSG="Domain-0"
-export PASSED="/ #"
-
-../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+export TEST_PASS_MSG="/ #"
+
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+../automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e0cea742b0..8ecddae555 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -94,7 +94,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-export QEMU_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD_START="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
@@ -105,8 +105,13 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOGFILE="smoke.serial"
 export LOG_MSG="Domain-0"
-export PASSED="BusyBox"
-
-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+export TEST_PASS_MSG="BusyBox"
+
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index e824cb7c2a..2625efc163 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -131,7 +131,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 # Run the test
 rm -f ${serial_log}
 set +e
-export QEMU_CMD="./qemu-system-arm \
+export TEST_CMD_START="./qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
@@ -145,8 +145,13 @@ export QEMU_CMD="./qemu-system-arm \
     -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="${serial_log}"
+export TEST_LOGFILE="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
-export PASSED="${passed}"
-
-../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+export TEST_PASS_MSG="${passed}"
+
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+../automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f42ba5d196..a9ab92d8bf 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -205,7 +205,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-export QEMU_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD_START="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
     -m 2048 -monitor none -serial stdio \
@@ -216,8 +216,13 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOGFILE="smoke.serial"
 export LOG_MSG="Welcome to Alpine Linux"
-export PASSED="${passed}"
-
-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+export TEST_PASS_MSG="${passed}"
+
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 594f92c19c..74ffca00c6 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -11,7 +11,7 @@ machine=$1
 rm -f ${serial_log}
 set +e

-export QEMU_CMD="qemu-system-ppc64 \
+export TEST_CMD_START="qemu-system-ppc64 \
     -bios skiboot.lid \
     -M $machine \
     -m 2g \
@@ -22,7 +22,12 @@ export QEMU_CMD="qemu-system-ppc64 \
     -serial stdio \
     -kernel binaries/xen"

-export QEMU_LOG="${serial_log}"
-export PASSED="Hello, ppc64le!"
+export TEST_LOGFILE="${serial_log}"
+export TEST_PASS_MSG="Hello, ppc64le!"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index c2595f657f..d1631b9633 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,14 +6,19 @@ set -ex
 rm -f smoke.serial
 set +e

-export QEMU_CMD="qemu-system-riscv64 \
+export TEST_CMD_START="qemu-system-riscv64 \
     -M virt \
     -smp 1 \
     -nographic \
     -m 2g \
     -kernel binaries/xen"

-export QEMU_LOG="smoke.serial"
-export PASSED="All set up"
+export TEST_LOGFILE="smoke.serial"
+export TEST_PASS_MSG="All set up"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 3440b1761d..1703b96e9e 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -16,12 +16,17 @@ esac

 rm -f smoke.serial
 set +e
-export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
+export TEST_CMD_START="qemu-system-x86_64 -nographic -kernel binaries/xen \
         -initrd xtf/tests/example/$k \
         -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
         -m 512 -monitor none -serial stdio"

-export QEMU_LOG="smoke.serial"
-export PASSED="Test result: SUCCESS"
+export TEST_LOGFILE="smoke.serial"
+export TEST_PASS_MSG="Test result: SUCCESS"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 4042fe5060..77a46e3e79 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -51,7 +51,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-export QEMU_CMD="./binaries/qemu-system-aarch64 \
+export TEST_CMD_START="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
@@ -62,7 +62,12 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
-export PASSED="${passed}"
+export TEST_LOGFILE="smoke.serial"
+export TEST_PASS_MSG="${passed}"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+# Capture test result using expect utility.
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+exit $?
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 4559e2b9ee..14999956a8 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -27,7 +27,6 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-TIMEOUT_SECONDS=200

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -125,20 +124,21 @@ boot

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
-
-if grep -q "${PASS_MSG}" smoke.serial; then
-    exit 0
-fi

-fatal "Test failed"
+# Capture the test result and power off board before exiting.
+export TEST_PASS_MSG="${PASS_MSG}"
+export TEST_CMD_START="cat ${SERIAL_DEV}"
+export TEST_LOGFILE="smoke.serial"
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+TEST_RESULT=$?
+sh "/scratch/gitlab-runner/${TEST_BOARD}.sh" 2
+exit ${TEST_RESULT}
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 18aa07f0a2..a6ad37a887 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -137,13 +137,16 @@ cd $START
 SERIAL_DEV="/dev/serial/zynq"
 set +e
 stty -F ${SERIAL_DEV} 115200
-timeout -k 1 120 nohup sh -c "cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"

-# stop the board
-cd /scratch/gitlab-runner
-bash zcu102.sh 2
-cd $START
-
-set -e
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
-exit 0
+# Capture the test result and power off board before exiting.
+export TEST_PASS_MSG="${passed}"
+export LOG_MSG="Welcome to Alpine Linux"
+export TEST_CMD_START="cat ${SERIAL_DEV}"
+export TEST_LOGFILE="smoke.serial"
+rm -f console
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+TEST_RESULT=$?
+sh /scratch/gitlab-runner/zcu102.sh 2
+exit ${TEST_RESULT}
--
2.25.1



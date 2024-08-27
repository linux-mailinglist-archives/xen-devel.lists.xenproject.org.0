Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919095FE1A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 02:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783612.1192899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sikVH-0008IP-33; Tue, 27 Aug 2024 00:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783612.1192899; Tue, 27 Aug 2024 00:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sikVG-0008Fp-VQ; Tue, 27 Aug 2024 00:56:10 +0000
Received: by outflank-mailman (input) for mailman id 783612;
 Tue, 27 Aug 2024 00:56:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nig9=P2=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sikVG-0008Fj-2k
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 00:56:10 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2418::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22e2d8c7-640f-11ef-a50b-bb4a2ccca743;
 Tue, 27 Aug 2024 02:56:06 +0200 (CEST)
Received: from MW2PR16CA0056.namprd16.prod.outlook.com (2603:10b6:907:1::33)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 00:55:55 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:907:1:cafe::34) by MW2PR16CA0056.outlook.office365.com
 (2603:10b6:907:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Tue, 27 Aug 2024 00:55:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7939.2 via Frontend Transport; Tue, 27 Aug 2024 00:55:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 19:54:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 19:54:36 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 26 Aug 2024 19:54:36 -0500
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
X-Inumbo-ID: 22e2d8c7-640f-11ef-a50b-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtauIq1b76YQwB7xKaXX7FOsyxHED7tUe8uIpeLXhwXI4gk8YazgoMwoXA5QZ42/XqExkKrSinKJHguu0lFwElZLG/7CgR64V2nVAYxzhQiYlNSIFOkM8qOIKtJqEXdhJcmmAsl+VghMguoKVj06+Tx/alhW84YuoDXLW6whNd5C4OORh1EGy8s9MZvV+KFZTZ4GnSsadSPJXJwOT9dPHhB63le8ufZa+Q+KpoJ3M+wOe4vFUbkOXX8ktb4Cpv4w+ISl6YOy5J5K0UM/qpbLYu8TWEyXD3drIMvVBxKYCfuEin7FVLpo6822FEFZYStLgepQwX4yHvGMUgLVxuBWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcTkl6xrk4aiZLn8LE+k6PzG3MTPmlQPQmIf1caufRE=;
 b=T5TBG0dIgCdkkOE9ZFj/Svl7U+IToxjxbH6IiYhFP1CvnaItrYXX+E1bxxJ4Ocwpt7gwwJMckdtkVECNKOdJ3zjVTAX3tQwqLJuipZ6+j9iQ+kK40hSGaWzqGEMVLCTtRcFC8+pWTT6sCr9MfRM8R/RHZ6hMrDwzO8OTCaM5Mwe7YOjah61GU3DIxVYb25RNRjAYYu8/+7VGpTRIoDkd6l9fDXIHPOUlLYESo96vTMHlkjopTTRRtB/Q6FvHCnflJLazQPzA/ttN37G5/LVf+B2hXITlf32uyAIhesJQ5DC13zRQ0cTtZSG97AyokC6+tBi5cd2nYB+gOOnpIzlFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcTkl6xrk4aiZLn8LE+k6PzG3MTPmlQPQmIf1caufRE=;
 b=kBAa9JFJIi5gYtQu+s5ieg8OHWP/dZniWlX6+cscJg8YOD0AzJ3PPtPVBS5O68j7HS3Ip3oKlmKNcL8T3RVvOqrPWn35fAZPhR+IqQ+1F80heMZF86NVL0Vq3jC2koKfuxvxZKZ1idujdr+zEUj7s4+F7JlHj5BG68Wp635DdK8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v1] automation: update xilinx tests to use expect
Date: Mon, 26 Aug 2024 17:54:24 -0700
Message-ID: <fbda01cf915786ac7d51f9dc98489eed088a0433.1724719426.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 42be6d08-ea52-4f07-9cf8-08dcc6330153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HmdH0yuGcCPXsJK8hnQNa0H/+iMH/9xdk6U9NKS28YP3/jUOVTI3oGustiin?=
 =?us-ascii?Q?22okexQrYhv57jMQI4GzahdF/0zNgucPVlO5B6EH5SdYaZoXgeCFI47E1GEP?=
 =?us-ascii?Q?bxJGY1pnmLaYB+x3fJacv24bNtJkopfh9qYbuwnBrRc3Ld3ey9eAvEK1oUb/?=
 =?us-ascii?Q?9ahNUblDuCTfAriaTsShCtClW5oa1bKQTWwjNMoiqzfU/z0b6pcutkRLa8zw?=
 =?us-ascii?Q?cD0dmIZ3bi7uVnMIyAez543Rt44yJpe7xbxko6CUYITPrK5NLLKa8nXjUCPM?=
 =?us-ascii?Q?ePJxWNposlM0SaOX2JYJoHitpj9JC91ojn5C9437pDU2at8gTfWzaSB+zUy9?=
 =?us-ascii?Q?ELUp1s1BxbFvXrqHSBWsYqCP1gtHTXtvBWqt5LFqkKQC55TEIUVOOtaViA33?=
 =?us-ascii?Q?0QDuFDCIJxbrfjHBHrTpDU4X9PoR2ud/RVGyNDmP+Q5gYoPvw8kqcx+AtLHO?=
 =?us-ascii?Q?RCsurS5T9XJBN0kBKqNE8V7yiNsMpz46Ib/CVRMZ4pwG/CXnVUTvhc3tfuCN?=
 =?us-ascii?Q?9c+t15K8iVMjtvxTylO2Ac1Cs9cSHlIS7L0gCxwaBUxLhjf8bxYo/vWBL+4r?=
 =?us-ascii?Q?ny8Lf/W5SbbeybBO9aCLvNFTQz54NaSr3sK7LaQyLSzkuh7r6VQmd6p2FVhr?=
 =?us-ascii?Q?6eYz+DO4qPrbDNgfaauFPYX1/5Sh9rrf1VXe142qNai1Q/hwfospTJKmGTXk?=
 =?us-ascii?Q?3iUGn7C21R09ye3Fg2YNF8Ii+8N4TZ195brVRZxRIynATEcC9wZ+Uww/BMya?=
 =?us-ascii?Q?9TYMwD7fOxpVlF8Jo+ICuiNlJn/r74pxo2kclzCeN/zRXwcw9eYF45tF/DAL?=
 =?us-ascii?Q?lD+A371zSqbBUlBOKAi1Byu188rz9SS87QQMOHSUM+d5QhCafEDn7cbUZ2aZ?=
 =?us-ascii?Q?FuV3cX2ytJezPuAJl/j2KKBzjbk7Mz9KflWe+9TvJMpcYSrgpTDW5hkY55Tn?=
 =?us-ascii?Q?nYIL67aMD3DOKw3V8HvhFiRnm5x97+ure0tiIcRVeSvi570iFZIpEinRgdVH?=
 =?us-ascii?Q?ISF65pRbt9P3iiCqjZ+T5bu4lxfMzrtym2HSKM5iUeMkb9CA/WDIfKOSJgCc?=
 =?us-ascii?Q?v3Qp0NvHYDvoUL8LMfk+BYFGYh0dkwQjYf6a+YcbbfOZj/1C87NBflVB7UGO?=
 =?us-ascii?Q?FgRagmzaA/fzv7GNbktoIMXtfhtBcqG1StNzKNISW+kH0/fYO8t+vgoluFqa?=
 =?us-ascii?Q?HiOr2jUjW153scrpZ9i23UzfbaPOPnjmBf6Ix3xTvdORxOOnT6rukHI43bX+?=
 =?us-ascii?Q?l3p9H/uQ9CWyDNLN8Trh66v6U0Rq34bt1BOh2CJOq+oDnI0LfI1O++vGVWIh?=
 =?us-ascii?Q?XMqM9+tq/pC33oRO4DOQ2qdXs6eRWqbJEdEJVA/9qoGQ2mgrawX9x3uvkFAP?=
 =?us-ascii?Q?U58JQ+7ZIjV9vpcHlovMiCpUu9KbrkmAx6mqBzJfBRvIh9IRAwi9H3ItusXs?=
 =?us-ascii?Q?RkRUyLdELElYZ+8jdnP+dU6em7Idv/64?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 00:55:54.5937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42be6d08-ea52-4f07-9cf8-08dcc6330153
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223

From: Victor Lira <victorm.lira@amd.com>

Fixes the CI failure introduced by 95764a0817.

Update xilinx-smoke tests to use the "expect" utility for early exit from
tests. Generalize the script "qemu-key.exp" to be used by both QEMU and
hardware tests. Add a missing "-continue_timer" flag for the expect script
to properly time out.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 .../build/ubuntu/xenial-xilinx.dockerfile     |  1 +
 automation/gitlab-ci/test.yaml                |  2 ++
 .../scripts/{qemu-key.exp => console.exp}     | 27 +++++++++++--------
 automation/scripts/qemu-alpine-x86_64.sh      |  8 +++---
 automation/scripts/qemu-smoke-dom0-arm32.sh   |  8 +++---
 automation/scripts/qemu-smoke-dom0-arm64.sh   |  8 +++---
 .../scripts/qemu-smoke-dom0less-arm32.sh      |  8 +++---
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  8 +++---
 automation/scripts/qemu-smoke-ppc64le.sh      |  8 +++---
 automation/scripts/qemu-smoke-riscv64.sh      |  8 +++---
 automation/scripts/qemu-smoke-x86-64.sh       |  8 +++---
 automation/scripts/qemu-xtf-dom0less-arm64.sh |  8 +++---
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 21 +++++++--------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 20 +++++++-------
 14 files changed, 76 insertions(+), 67 deletions(-)
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
index 3b339f387f..62dbed93d2 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -179,6 +179,8 @@ xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough:

 xilinx-smoke-dom0-x86_64-gcc-debug:
   extends: .xilinx-x86_64
+  variables:
+    TEST_TIMEOUT: 500
   script:
     - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh ping 2>&1 | tee ${LOGFILE}
   needs:
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
index 42a89e86b0..b701b917a5 100755
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
@@ -85,8 +85,8 @@ export QEMU_CMD="qemu-system-x86_64 \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"

-export QEMU_LOG="smoke.serial"
+export TEST_LOGFILE="smoke.serial"
 export LOG_MSG="Domain-0"
-export PASSED="BusyBox"
+export TEST_PASS_MSG="BusyBox"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index fd64b19358..ea68f9973e 100755
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
@@ -92,8 +92,8 @@ export QEMU_CMD="./qemu-system-arm \
    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="${serial_log}"
+export TEST_LOGFILE="${serial_log}"
 export LOG_MSG="Domain-0"
-export PASSED="/ #"
+export TEST_PASS_MSG="/ #"

-../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+../automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e0cea742b0..2ddb20b219 100755
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
@@ -105,8 +105,8 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOGFILE="smoke.serial"
 export LOG_MSG="Domain-0"
-export PASSED="BusyBox"
+export TEST_PASS_MSG="BusyBox"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index e824cb7c2a..fedc37d644 100755
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
@@ -145,8 +145,8 @@ export QEMU_CMD="./qemu-system-arm \
     -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="${serial_log}"
+export TEST_LOGFILE="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
-export PASSED="${passed}"
+export TEST_PASS_MSG="${passed}"

-../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+../automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f42ba5d196..0885bd0179 100755
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
@@ -216,8 +216,8 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
+export TEST_LOGFILE="smoke.serial"
 export LOG_MSG="Welcome to Alpine Linux"
-export PASSED="${passed}"
+export TEST_PASS_MSG="${passed}"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 594f92c19c..85f2181ddd 100755
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
@@ -22,7 +22,7 @@ export QEMU_CMD="qemu-system-ppc64 \
     -serial stdio \
     -kernel binaries/xen"

-export QEMU_LOG="${serial_log}"
-export PASSED="Hello, ppc64le!"
+export TEST_LOGFILE="${serial_log}"
+export TEST_PASS_MSG="Hello, ppc64le!"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index c2595f657f..c2b5914e3f 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,14 +6,14 @@ set -ex
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
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 3440b1761d..f792df3b7d 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -16,12 +16,12 @@ esac

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
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 4042fe5060..0eceb4a74c 100755
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
@@ -62,7 +62,7 @@ export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"

 export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
-export QEMU_LOG="smoke.serial"
-export PASSED="${passed}"
+export TEST_LOGFILE="smoke.serial"
+export TEST_PASS_MSG="${passed}"

-./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
+./automation/scripts/console.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 4559e2b9ee..144d9e73a1 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -27,7 +27,6 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-TIMEOUT_SECONDS=200

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -125,20 +124,20 @@ boot

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
-
-fatal "Test failed"
+# Capture the test result and power off board before exiting.
+export TEST_PASS_MSG="${PASS_MSG}"
+export TEST_CMD_START="cat ${SERIAL_DEV}"
+export TEST_LOGFILE="smoke.serial"
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+TEST_RESULT=$?
+sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
+exit ${TEST_RESULT}
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 18aa07f0a2..3a852e0798 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -137,13 +137,15 @@ cd $START
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
+mkfifo console
+sed 's/\r\+$//' < console &
+./automation/scripts/console.exp > console
+TEST_RESULT=$?
+sh /scratch/gitlab-runner/zcu102.sh 2
+exit ${TEST_RESULT}
--
2.25.1



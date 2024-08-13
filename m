Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E994FBBF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 04:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775909.1186085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdhAq-0007WR-Kx; Tue, 13 Aug 2024 02:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775909.1186085; Tue, 13 Aug 2024 02:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdhAq-0007Uf-HP; Tue, 13 Aug 2024 02:22:12 +0000
Received: by outflank-mailman (input) for mailman id 775909;
 Tue, 13 Aug 2024 02:22:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=elVi=PM=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sdhAp-0007UZ-Bo
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 02:22:11 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2412::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d547fe9c-591a-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 04:22:07 +0200 (CEST)
Received: from BY3PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:39b::21)
 by PH7PR12MB9173.namprd12.prod.outlook.com (2603:10b6:510:2ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 02:22:00 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::1) by BY3PR05CA0046.outlook.office365.com
 (2603:10b6:a03:39b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15 via Frontend
 Transport; Tue, 13 Aug 2024 02:21:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 13 Aug 2024 02:21:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 21:21:56 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 21:21:56 -0500
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
X-Inumbo-ID: d547fe9c-591a-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuKtq5ziYzWMEkMHEADKD6BvCr/94jYBIkpn2QblOlQFpqkFY0Lkxerix/dRo6rlaedGroR1/Vbir02sObbu8ztXyAw6OD9Pq0ybzgmpA/2LYzfETo31NGrTBOrbyOTgjXaU3Ku6Zrej0VAJnDA9tV4AMwfuRY0pGLDjXpgpxowz+vx4yPwlcVoAcmc5jmy6sfu1iyA3RcnnyLgADeRifJP3zab2c9lilbZbiJVCD+7j1SGAbKMZ2NgKOCI6InSTFyZqYoydad7ekbcy8F6sYefkds10PYq3ILwmTXySpPwnXNrq9jItKkvD3XqZJO6jPXA+va+NeH2M21PMV4vRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEK2Yp6JSBett6EwEG8/jNCCCT7ZqlAIhyHAGLRVgNY=;
 b=zNSjA8PnyLchc38RI/1hcZj5YTIJBGl3Q0a5+jwQY/tfE+kCvvd0Sp0huOPw6JqPvv5u40TOefybKPWsIpJF6jwpH1WZ0pSctGzNLqBt/087o3IBmoidcuru+2GhfzG2D+UK4ARzigaoWUjn4iFAAmhWY9DFhcEWZfjjb/TyiRk4MLkcmxhejBv1rYdvTrt9WvktRpTGA6LtxKNgA4XuleKEfif4+nhStpzft/xBT2CK46wlI+BBZDsJuwt4HZrjO6mDdY145+aEkVzm3dt1PzmcUEW5K23YxbB/XxTmeho+bph2OZKmoOiGNTtkfagfGqpf+oeN30LJ9d8RdZKDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEK2Yp6JSBett6EwEG8/jNCCCT7ZqlAIhyHAGLRVgNY=;
 b=ZGWs4gp4ZrhsldbghDaFiOYIjpE9Xt5Y4kxSN19HU1bxUp8N5gbcVdb5Pnqe4fsCq2zvdjJFLDKcZ/hm/gjyirHkC76FpY3TJ2JgrtbA25040pD28Jxbm0pN7VzJDRISkgR+IFQpyg2FOB4yyLLgxgRd2qykc/k+jKr7Tw7poPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <michal.orzel@amd.com>, <cardoe@cardoe.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] automation: use expect to run QEMU
Date: Mon, 12 Aug 2024 19:21:53 -0700
Message-ID: <20240813022153.1246072-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|PH7PR12MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e8534c-c1d0-4bd8-aa51-08dcbb3eb582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EFjFl6ToBZl1BaN6nJicITYmxMhGUk5cgK8+FIwlz7EEkIQAD7qKCzaQYK00?=
 =?us-ascii?Q?9oq5dNkAgGvVdQoRdM7kTizv73qeBAudVm6Qc8ha9XoSwldcMWbDHEWLZd4p?=
 =?us-ascii?Q?NRSIcriLME1dZ/BD3zspe1uipNx81kMz6HuZnfnlXJT4OP1Lr//d8qQC5Mol?=
 =?us-ascii?Q?yT0KBS4+dDOQ2vCiQ/t/7Lq+vYHf92Gc4aW6A/gUbTASKbcdx+8SSBBLk90D?=
 =?us-ascii?Q?sncblQly+74MeKfRIgKFsvC9ib1N+sfpvT3ACDtmC1zjci01TPW2es5vIKgb?=
 =?us-ascii?Q?lzWxy55OBo+Z6hgQ/r6IFVHiCpAYjhSc2buHCeh3znr3+Xtaqde78D6phUJy?=
 =?us-ascii?Q?Ee8/rTnqtS3Ou3lkV3T5nxyzjLC0IUI0eKaeR7qb+CvMK9e95jbAhYqc2jQV?=
 =?us-ascii?Q?s3ocYYCO2tOtMcfTPvn9Gysd8ZlIiatZpLc+557Iz/mVPo+VK8h0waIjmlE+?=
 =?us-ascii?Q?SG6/XFWuObwNEG0K5Eg6Lwe2LvdOdI5yZCBhVlTeOAUVPGCO3Fldrf7MsE6X?=
 =?us-ascii?Q?c2u4/QDv+YeOpezrESBniCtmUw0rjqry+ELi4vZje8H96TJrZQ+nc0Y22zzO?=
 =?us-ascii?Q?+U/OSn/yPzGrrCvqagAi3fqE4uRxvXuwJ83omJHwWI/eBVQK7B6U9HU96T/f?=
 =?us-ascii?Q?ZbSYkI5E+wJuZaVLQ8GvE8fYJcladn5Knhv/lLhmP+f+M/w9YWalUcXjk6E5?=
 =?us-ascii?Q?KvbMNUsVfgaOjGbwloctmly7beKcSrlvvJonUMyciLwZS8HHzTbYEsl6Hppl?=
 =?us-ascii?Q?2xEpnMelatZVyQS2cL4neItaon37pYphh7PE44ooyUXPesNiB5iDLxk3xAyC?=
 =?us-ascii?Q?sGxLeCUvuX5Y8aKLgPn7EG3cu6CXeXnXs//e2/FnFtSLsibi0cLnnDV6P1hk?=
 =?us-ascii?Q?exlFxGMhW/Wmak6toZ8uhORi95lOE/QBLilSloIm3OissRkh+04SN8p9HfG6?=
 =?us-ascii?Q?4wEgvU6B1of3QCVPN7AT2pQc9fXFNi82woSBfd6nP3+2NLEbT56VKVyyShyM?=
 =?us-ascii?Q?+EjnGSzFJfU0HV7RQzd71YbZSFsfB5OfrnrlYWcq9hcg/pATXyPJOpYuSZNm?=
 =?us-ascii?Q?WIkk6rCzx94UuQggRzJAkGtM7G0+OLvlsvUmrFLnnL4jKMCQB2uELxSmkGQP?=
 =?us-ascii?Q?YX8yv7j45gYPkO8rmjP54S5H9t7aGqATEem1EugEa2ZR0nRJJ4mJhLe45qVK?=
 =?us-ascii?Q?xKYggwh5U6iB5Leo03+grPfvLVLLlJlMtoDHledV1VcTJhdolkVm1yR0dedq?=
 =?us-ascii?Q?wk9qKShhF03crGtMEsiK/Qu3RxZ6qzTmuPR44lJyxvX7HfClqKdk0Xc+urGF?=
 =?us-ascii?Q?9uR80Qa3C7SyROzUWan2w12ZThHii6UcyPXR34e35JQDrFZDYdHG03Jv1vR/?=
 =?us-ascii?Q?2K1Ih55xjdxAgiPFP30EhoagdpZGsne8Ui5Pa1e+4mdhUWgYvuyWMKpH0QJi?=
 =?us-ascii?Q?IjMZxMZ2W8aFXt7esbqjnUgZUNHXImZA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 02:21:58.5811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e8534c-c1d0-4bd8-aa51-08dcbb3eb582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9173

Use expect to invoke QEMU so that we can terminate the test as soon as
we get the right string in the output instead of waiting until the
final timeout.

For timeout, instead of an hardcoding the value, use a Gitlab CI
variable "QEMU_TIMEOUT" that can be changed depending on the latest
status of the Gitlab CI runners.

Note that for simplicity in the case of dom0less test, the script only
checks for the $PASSED string. That is because the dom0 prompt and the
$PASSED string could happen in any order making it difficult to check
with expect which checks for strings in a specific order.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

---
Changes in v2:
- add empty lines for readability
- changes qemu-key file extension to exp
- drop xen_msg that is unused
- use capital letters for exported variables
- check for both dom0 and domU message on dom0less tests

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1410820286
---
 automation/scripts/qemu-alpine-x86_64.sh      | 16 +++---
 automation/scripts/qemu-key.exp               | 51 +++++++++++++++++++
 automation/scripts/qemu-smoke-dom0-arm32.sh   | 15 +++---
 automation/scripts/qemu-smoke-dom0-arm64.sh   | 15 +++---
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 17 +++----
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 15 +++---
 automation/scripts/qemu-smoke-ppc64le.sh      | 12 ++---
 automation/scripts/qemu-smoke-riscv64.sh      | 12 ++---
 automation/scripts/qemu-smoke-x86-64.sh       | 14 ++---
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 14 +++--
 10 files changed, 110 insertions(+), 71 deletions(-)
 create mode 100755 automation/scripts/qemu-key.exp

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 8e398dcea3..5359e0820b 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -77,18 +77,16 @@ EOF
 # Run the test
 rm -f smoke.serial
 set +e
-timeout -k 1 720 \
-qemu-system-x86_64 \
+export QEMU_CMD="qemu-system-x86_64 \
     -cpu qemu64,+svm \
     -m 2G -smp 2 \
     -monitor none -serial stdio \
     -nographic \
     -device virtio-net-pci,netdev=n0 \
-    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
-        # Remove carriage returns from the stdout output, as gitlab
-        # interface chokes on them
-        tee smoke.serial | sed 's/\r//'
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
 
-set -e
-(grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
-exit 0
+export QEMU_LOG="smoke.serial"
+export LOG_MSG="Domain-0"
+export PASSED="BusyBox"
+
+./automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-key.exp b/automation/scripts/qemu-key.exp
new file mode 100755
index 0000000000..9f3a3364fa
--- /dev/null
+++ b/automation/scripts/qemu-key.exp
@@ -0,0 +1,51 @@
+#!/usr/bin/expect -f
+
+set timeout $env(QEMU_TIMEOUT)
+
+log_file -a $env(QEMU_LOG)
+
+match_max 10000
+
+eval spawn $env(QEMU_CMD)
+
+expect_after {
+    -re "(.*)\r" {
+        exp_continue
+    }
+    timeout {send_user "ERROR-Timeout!\n"; exit 1}
+    eof {send_user "ERROR-EOF!\n"; exit 1}
+}
+
+if {[info exists env(UBOOT_CMD)]} {
+    expect "=>"
+
+    send "$env(UBOOT_CMD)\r"
+}
+
+if {[info exists env(LOG_MSG)] && [info exists env(PASSED)]} {
+    expect {
+        "$env(PASSED)" {
+            expect "$env(LOG_MSG)"
+            exit 0
+        }
+        "$env(LOG_MSG)" {
+            expect "$env(PASSED)"
+            exit 0
+        }
+    }
+}
+
+if {[info exists env(LOG_MSG)]} {
+    expect "$env(LOG_MSG)"
+}
+
+if {[info exists env(PASSED)]} {
+    expect {
+        "$env(PASSED)" {
+            exit 0
+        }
+    }
+}
+
+expect eof
+
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index eaaea5a982..b235b1476a 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -78,9 +78,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 rm -f ${serial_log}
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 720 \
-./qemu-system-arm \
+export QEMU_CMD="./qemu-system-arm \
    -machine virt \
    -machine virtualization=true \
    -smp 4 \
@@ -91,9 +89,10 @@ timeout -k 1 720 \
    -no-reboot \
    -device virtio-net-pci,netdev=n0 \
    -netdev user,id=n0,tftp=./ \
-   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& \
-      tee ${serial_log} | sed 's/\r//'
+   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"
 
-set -e
-(grep -q "Domain-0" ${serial_log} && grep -q "^/ #" ${serial_log}) || exit 1
-exit 0
+export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export QEMU_LOG="${serial_log}"
+export LOG_MSG="Domain-0"
+export PASSED="/ #"
+../automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 352963a741..5e12b136d5 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -94,9 +94,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 720 \
-./binaries/qemu-system-aarch64 \
+export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
@@ -104,9 +102,10 @@ timeout -k 1 720 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
-        tee smoke.serial | sed 's/\r//'
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
 
-set -e
-(grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
-exit 0
+export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export QEMU_LOG="smoke.serial"
+export LOG_MSG="Domain-0"
+export PASSED="BusyBox"
+./automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index c027c8c5c8..5cdf9c4365 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -5,7 +5,7 @@ set -ex
 test_variant=$1
 
 # Prompt to grep for to check if dom0 booted successfully
-dom0_prompt="^/ #"
+dom0_prompt="/ #"
 
 serial_log="$(pwd)/smoke.serial"
 
@@ -131,9 +131,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 # Run the test
 rm -f ${serial_log}
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 240 \
-./qemu-system-arm \
+export QEMU_CMD="./qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
@@ -144,9 +142,10 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=./ \
-    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& \
-        tee ${serial_log} | sed 's/\r//'
+    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"
 
-set -e
-(grep -q "${dom0_prompt}" ${serial_log} && grep -q "${passed}" ${serial_log}) || exit 1
-exit 0
+export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export QEMU_LOG="${serial_log}"
+export LOG_MSG="${dom0_prompt}"
+export PASSED="${passed}"
+../automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 15258692d5..1290ac95a6 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -205,9 +205,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 240 \
-./binaries/qemu-system-aarch64 \
+export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
     -m 2048 -monitor none -serial stdio \
@@ -215,9 +213,10 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
-        tee smoke.serial | sed 's/\r//'
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
 
-set -e
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
-exit 0
+export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export QEMU_LOG="smoke.serial"
+export LOG_MSG="Welcome to Alpine Linux"
+export PASSED="${passed}"
+./automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 9088881b73..e411a6a504 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -11,8 +11,7 @@ machine=$1
 rm -f ${serial_log}
 set +e
 
-timeout -k 1 20 \
-qemu-system-ppc64 \
+export QEMU_CMD="qemu-system-ppc64 \
     -bios skiboot.lid \
     -M $machine \
     -m 2g \
@@ -21,9 +20,8 @@ qemu-system-ppc64 \
     -monitor none \
     -nographic \
     -serial stdio \
-    -kernel binaries/xen \
-    |& tee ${serial_log} | sed 's/\r//'
+    -kernel binaries/xen"
 
-set -e
-(grep -q "Hello, ppc64le!" ${serial_log}) || exit 1
-exit 0
+export QEMU_LOG="${serial_log}"
+export PASSED="Hello, ppc64le!"
+./automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index f90df3c051..1b1f5b3bf2 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,15 +6,13 @@ set -ex
 rm -f smoke.serial
 set +e
 
-timeout -k 1 2 \
-qemu-system-riscv64 \
+export QEMU_CMD="qemu-system-riscv64 \
     -M virt \
     -smp 1 \
     -nographic \
     -m 2g \
-    -kernel binaries/xen \
-    |& tee smoke.serial | sed 's/\r//'
+    -kernel binaries/xen"
 
-set -e
-(grep -q "All set up" smoke.serial) || exit 1
-exit 0
+export QEMU_LOG="smoke.serial"
+export PASSED="All set up"
+./automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 3014d07314..c7fcf0ff6e 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -16,11 +16,11 @@ esac
 
 rm -f smoke.serial
 set +e
-timeout -k 1 30 \
-qemu-system-x86_64 -nographic -kernel binaries/xen \
+export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
         -initrd xtf/tests/example/$k \
-        -append "loglvl=all console=com1 noreboot console_timestamps=boot $extra" \
-        -m 512 -monitor none -serial file:smoke.serial
-set -e
-grep -q 'Test result: SUCCESS' smoke.serial || exit 1
-exit 0
+        -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
+        -m 512 -monitor none -serial stdio"
+
+export QEMU_LOG="smoke.serial"
+export PASSED="Test result: SUCCESS"
+./automation/scripts/qemu-key.exp
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index b08c2d44fb..9659adee2b 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -51,9 +51,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 120 \
-./binaries/qemu-system-aarch64 \
+export QEMU_CMD="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt \
     -m 2048 -monitor none -serial stdio \
@@ -61,9 +59,9 @@ timeout -k 1 120 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
-        tee smoke.serial | sed 's/\r//'
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
 
-set -e
-(grep -q "${passed}" smoke.serial) || exit 1
-exit 0
+export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export QEMU_LOG="smoke.serial"
+export PASSED="${passed}"
+./automation/scripts/qemu-key.exp
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F4194DB2C
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2024 09:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775039.1185429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4h-00086V-7e; Sat, 10 Aug 2024 06:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775039.1185429; Sat, 10 Aug 2024 06:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scg4h-00083m-38; Sat, 10 Aug 2024 06:59:39 +0000
Received: by outflank-mailman (input) for mailman id 775039;
 Sat, 10 Aug 2024 06:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jkHu=PJ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1scg4e-0007L7-VP
 for xen-devel@lists.xenproject.org; Sat, 10 Aug 2024 06:59:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:200a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18a00e15-56e6-11ef-bc04-fd08da9f4363;
 Sat, 10 Aug 2024 08:59:34 +0200 (CEST)
Received: from CH5PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610:1f0::29)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 06:59:29 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::65) by CH5PR05CA0024.outlook.office365.com
 (2603:10b6:610:1f0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.12 via Frontend
 Transport; Sat, 10 Aug 2024 06:59:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Sat, 10 Aug 2024 06:59:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 10 Aug
 2024 01:59:26 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 10 Aug 2024 01:59:25 -0500
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
X-Inumbo-ID: 18a00e15-56e6-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y06hgCpMKbnVFsBeizTCc3Af0vtNkDcWcTxouAj/qSkjGKEuszbof2QSXdsPOnpp56tqymMlzNn3MnRQn1ah9QiTJHaX9lONSh07XL5H2H+ma6zrvh52LQO5Ss7VqRwqhPjSX1/RPjnTGVE5JXWND+mDhbkIvKFg5RRqNrHM972Gat+EigEOSvEuiuIi7XPa92BZP8Wq8VpN+ResJKICszT3xErDZLyb7BCFUdY4ywbBXlEdJbi7EDyzQ/9npML+2+f2PNbdL7rH39A9a2cIlHGEqkhTo1H5TYN3wmw4YQYrY4ydPtmwW5rLihuEkgGPdstb2BZkTM2PV0T527zMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XnNG3qW9EH+V9tal+y68KGxesAb9KisVIj+BBdD00Y=;
 b=wTn8DPaowUe6vvqOhAfPAcucr6GUFSgOYTT+Pq07t85jI00wvhWRXp27ryZJ77BpWRmVheZkax/VmtELvchMvWL3YJi0eZCsMSzXht5Habj0a5Hk9m6ygH/Y6RwrDNiLosQ5jW18z6iRakay0FN0Bn7G8hfXxc934NtGXRSOZO9ozSnCMSgyxVBzJnyH11dJyv+LwUPGHcMGtEFo8r2P/J0XM6nqrV1P1LWX4IBVDEcRs4vmu/6TXuRDHtUkkbh6mpxiKhiAnEL2pOqy4MUOzRY+4g29NvlJxIrvc8sX5WwGa60AcxUfSfrksc6xcjMCTO219fW0oSCVht3vfAthKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XnNG3qW9EH+V9tal+y68KGxesAb9KisVIj+BBdD00Y=;
 b=saOU/ixInAAdcHjTZ5OJKOqZ7tgK/o8YVcTqTt87vCqmqa+HfVm7BaZ9sEnjFn+ed5o2momwOlVzZy9GcpN0XdnJ3qjVXIa4xePvYqzRSYryjLcWz0deAPx/LNV50dVknYpsHIvuJm3DuPUAQ/faO+Sqcy7xdf32667s6JFDmU8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <cardoe@cardoe.com>, <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 3/3] automation: use expect to run QEMU
Date: Fri, 9 Aug 2024 23:59:20 -0700
Message-ID: <20240810065920.415345-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2408091700560.298534@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c468a8-08ae-4c26-0671-08dcb909faa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgB3pkC2bdWt83dcgGrwrcuGRqdkUu/PwMKa1feoUP7foIBzd8YonaAvA3Gc?=
 =?us-ascii?Q?tzRVZwCmKr8c4zUceJC/OLvRStkgic2MAdmuYOzdl3H8zSgNOZQT7Uyq4K5k?=
 =?us-ascii?Q?GBv2ctcx2hn4NK25Y8F3degJaGzEQnGPoAS7XGxkQ/pbyiw5/fx/Dypvxdws?=
 =?us-ascii?Q?hNnAjGkACbIoHLP3r/QirLkQFpGDf8IrCS5S9+9+yPZTLO/OqPjkHhCc5a0l?=
 =?us-ascii?Q?tNr+wvXMmKq/HF1yF+qSC+AAKnjDz870PfSzDOq7Q019epdUqkW2hgkUCLI9?=
 =?us-ascii?Q?d5A1akPEcfuAnl9Rg2Fqepbw8ELbhUrgNiWnuokYTLyjMC4mtm+UMvzT86mX?=
 =?us-ascii?Q?PyGFb/h65ucOGQeCJFBk3AqEN7w2NwyYsgxjg9Oy01Dyb8kgQZBoftIf2n6A?=
 =?us-ascii?Q?o6FK7qEqFC9mT/yRYWNMx3o7Jz9ZNqA60lAFHyUvUa4SQPpabPxeKpjJ/5qK?=
 =?us-ascii?Q?sSMIsd6T8c0DcPwHPKCxUZ7xm86GCGdsu//n4ozp6JJZJbqhx0+B7SkZQdke?=
 =?us-ascii?Q?gPi9NREjFnf34o16Oq+wVZ3w2TwvA4k2Cwf2cNSvaf+VRYuy/qAvfUGOTwko?=
 =?us-ascii?Q?21IdyBU8QnOMIV3XG430TIBzwZXOUTL3aSrSATFAZ9/8oYt7xP2hIgdShj+k?=
 =?us-ascii?Q?vZFGucMsCIfaBmgAJpVYzE5qunj4w9W5Gt6HxZmLgDrVU46pPY6Qa/lOals1?=
 =?us-ascii?Q?D22FwagjhU+F3d9qNI1BqUM207BV6iGe9x5QVEPahur4bPK3xXYSA6JPz9dv?=
 =?us-ascii?Q?u1ur0Ou/svWS67LdpDFnDfu6J2Q7aM8EZ2xG880waRpjoYIhOlSyxi1RK5aa?=
 =?us-ascii?Q?OyJmoOYojjKSwqll7s7yUeQcizRLD/gVh4DBGEoj/YWpnvbLHFAu9a+QNKbh?=
 =?us-ascii?Q?TOE5mKPTHPVXJYSm8aYJ0/FUutaweBU2wkI7DeWXOTbNG3CzeZPQs8E8jLU4?=
 =?us-ascii?Q?RYp/qFlHy7BdafU2IGHuAaJffKJKDhLCa85DYeXGw0DaM6Vt3+nTCPzw9iR4?=
 =?us-ascii?Q?cSl0KsNZDgK/h6Jd24NWeQTbySMkYqorYDRQ+n8Ei8NWR0ZzvsOcdp/lTff0?=
 =?us-ascii?Q?qU9WxwmlJvHItubOkHI6qAYGJYM39eYWSgoswDS+luyn1SoHbKEuLmKmdt+d?=
 =?us-ascii?Q?wt9ddMRNvQYpGZt3fmxutgCd7cdF5QOnF3o4J4wY2w/tRLR+85m2C0Lrd9f7?=
 =?us-ascii?Q?co9GsTvN0gn8K5sQnDwj8mWdB+WE2NsdmOyDTuvUzAWnI7HnCeNPcOEcr7oK?=
 =?us-ascii?Q?jVDa8uyKvNqqGoO7r8TgXvYIdeg2Mkqp4E8IViMW2TxipaRJ2HV7fsggaRhw?=
 =?us-ascii?Q?effiNQllIEVCRyxpVLlPv89MICIH8xVgKqhjZ5+/FqywTfupde2+qpFqRUWv?=
 =?us-ascii?Q?TyvIuSD0ESqXer6Hk60Aol5FjAXrg34oyZxTDmTxQuB/i4+XwcUEGSaOavih?=
 =?us-ascii?Q?ipACmuK+LIeG4dUFFJ/MxNilER5bCTlC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 06:59:28.9677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c468a8-08ae-4c26-0671-08dcb909faa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192

Use expect to invoke QEMU so that we can terminate the test as soon as
we get the right string in the output instead of waiting until the
final timeout.

For timeout, instead of an hardcoding the value, use a Gitlab CI
variable "QEMU_TIMEOUT" that can be changed depending on the latest
status of the Gitlab CI runners.

Note that for simplicity in the case of dom0less test, the script only
checks for the $passed string. That is because the dom0 prompt and the
$passed string could happen in any order making it difficult to check
with expect which checks for strings in a specific order.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/scripts/qemu-alpine-x86_64.sh      | 15 +++----
 automation/scripts/qemu-key.ex                | 42 +++++++++++++++++++
 automation/scripts/qemu-smoke-dom0-arm32.sh   | 15 ++++---
 automation/scripts/qemu-smoke-dom0-arm64.sh   | 15 ++++---
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 14 +++----
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 14 +++----
 automation/scripts/qemu-smoke-ppc64le.sh      | 12 +++---
 automation/scripts/qemu-smoke-riscv64.sh      | 12 +++---
 automation/scripts/qemu-smoke-x86-64.sh       | 14 +++----
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 14 +++----
 10 files changed, 97 insertions(+), 70 deletions(-)
 create mode 100755 automation/scripts/qemu-key.ex

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 8e398dcea3..24b23a573c 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -77,18 +77,15 @@ EOF
 # Run the test
 rm -f smoke.serial
 set +e
-timeout -k 1 720 \
-qemu-system-x86_64 \
+export qemu_cmd="qemu-system-x86_64 \
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
+export qemu_log="smoke.serial"
+export log_msg="Domain-0"
+export passed="BusyBox"
+./automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-key.ex b/automation/scripts/qemu-key.ex
new file mode 100755
index 0000000000..569ef2781f
--- /dev/null
+++ b/automation/scripts/qemu-key.ex
@@ -0,0 +1,42 @@
+#!/usr/bin/expect -f
+
+set timeout $env(QEMU_TIMEOUT)
+
+log_file -a $env(qemu_log)
+
+match_max 10000
+
+eval spawn $env(qemu_cmd)
+
+expect_after {
+    -re "(.*)\r" {
+        exp_continue
+    }
+    timeout {send_user "ERROR-Timeout!\n"; exit 1}
+    eof {send_user "ERROR-EOF!\n"; exit 1}
+}
+
+if {[info exists env(uboot_cmd)]} {
+    expect "=>"
+
+    send "$env(uboot_cmd)\r"
+}
+
+if {[info exists env(log_msg)]} {
+    expect "$env(log_msg)"
+}
+
+if {[info exists env(xen_cmd)]} {
+    send "$env(xen_cmd)\r"
+}
+
+if {[info exists env(passed)]} {
+    expect {
+        "$env(passed)" {
+            exit 0
+        }
+    }
+}
+
+expect eof
+
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index eaaea5a982..2835d8a908 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -78,9 +78,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 rm -f ${serial_log}
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 720 \
-./qemu-system-arm \
+export qemu_cmd="./qemu-system-arm \
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
+export uboot_cmd="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export qemu_log="${serial_log}"
+export log_msg="Domain-0"
+export passed="/ #"
+../automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 352963a741..c2eac941d2 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -94,9 +94,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 720 \
-./binaries/qemu-system-aarch64 \
+export qemu_cmd="./binaries/qemu-system-aarch64 \
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
+export uboot_cmd="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export qemu_log="smoke.serial"
+export log_msg="Domain-0"
+export passed="BusyBox"
+./automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index c027c8c5c8..9fe08c337a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -131,9 +131,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 # Run the test
 rm -f ${serial_log}
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 240 \
-./qemu-system-arm \
+export qemu_cmd="./qemu-system-arm \
     -machine virt \
     -machine virtualization=true \
     -smp 4 \
@@ -144,9 +142,9 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=./ \
-    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& \
-        tee ${serial_log} | sed 's/\r//'
+    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin"
 
-set -e
-(grep -q "${dom0_prompt}" ${serial_log} && grep -q "${passed}" ${serial_log}) || exit 1
-exit 0
+export uboot_cmd="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export qemu_log="${serial_log}"
+export passed="${passed}"
+../automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 15258692d5..fd11482f25 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -205,9 +205,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 240 \
-./binaries/qemu-system-aarch64 \
+export qemu_cmd="./binaries/qemu-system-aarch64 \
     -machine virtualization=true \
     -cpu cortex-a57 -machine type=virt,gic-version=$gic_version \
     -m 2048 -monitor none -serial stdio \
@@ -215,9 +213,9 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
-        tee smoke.serial | sed 's/\r//'
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin"
 
-set -e
-(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
-exit 0
+export uboot_cmd="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export qemu_log="smoke.serial"
+export passed="${passed}"
+./automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 9088881b73..72ee9765e9 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -11,8 +11,7 @@ machine=$1
 rm -f ${serial_log}
 set +e
 
-timeout -k 1 20 \
-qemu-system-ppc64 \
+export qemu_cmd="qemu-system-ppc64 \
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
+export qemu_log="${serial_log}"
+export passed="Hello, ppc64le!"
+./automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index f90df3c051..64630ba7d7 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,15 +6,13 @@ set -ex
 rm -f smoke.serial
 set +e
 
-timeout -k 1 2 \
-qemu-system-riscv64 \
+export qemu_cmd="qemu-system-riscv64 \
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
+export qemu_log="smoke.serial"
+export passed="All set up"
+./automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 3014d07314..269396f805 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -16,11 +16,11 @@ esac
 
 rm -f smoke.serial
 set +e
-timeout -k 1 30 \
-qemu-system-x86_64 -nographic -kernel binaries/xen \
+export qemu_cmd="qemu-system-x86_64 -nographic -kernel binaries/xen \
         -initrd xtf/tests/example/$k \
-        -append "loglvl=all console=com1 noreboot console_timestamps=boot $extra" \
-        -m 512 -monitor none -serial file:smoke.serial
-set -e
-grep -q 'Test result: SUCCESS' smoke.serial || exit 1
-exit 0
+        -append \"loglvl=all console=com1 noreboot console_timestamps=boot $extra\" \
+        -m 512 -monitor none -serial stdio"
+
+export qemu_log="smoke.serial"
+export passed="Test result: SUCCESS"
+./automation/scripts/qemu-key.ex
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index b08c2d44fb..042f4ed2d9 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -51,9 +51,7 @@ bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/conf
 # Run the test
 rm -f smoke.serial
 set +e
-echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
-timeout -k 1 120 \
-./binaries/qemu-system-aarch64 \
+export qemu_cmd="./binaries/qemu-system-aarch64 \
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
+export uboot_cmd="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"
+export qemu_log="smoke.serial"
+export passed="${passed}"
+./automation/scripts/qemu-key.ex
-- 
2.25.1



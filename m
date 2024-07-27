Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17C93DCFF
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 03:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765812.1176460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXWgF-0001FX-5o; Sat, 27 Jul 2024 01:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765812.1176460; Sat, 27 Jul 2024 01:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXWgF-0001Ce-30; Sat, 27 Jul 2024 01:57:07 +0000
Received: by outflank-mailman (input) for mailman id 765812;
 Sat, 27 Jul 2024 01:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9te9=O3=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sXWgD-0001CY-GP
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2024 01:57:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83887ab8-4bbb-11ef-8776-851b0ebba9a2;
 Sat, 27 Jul 2024 03:57:02 +0200 (CEST)
Received: from MW4PR03CA0278.namprd03.prod.outlook.com (2603:10b6:303:b5::13)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 01:56:58 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::e6) by MW4PR03CA0278.outlook.office365.com
 (2603:10b6:303:b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Sat, 27 Jul 2024 01:56:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 27 Jul 2024 01:56:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 26 Jul
 2024 20:56:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 26 Jul
 2024 20:56:55 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 26 Jul 2024 20:56:55 -0500
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
X-Inumbo-ID: 83887ab8-4bbb-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/VXJUZzrlkN1prrYNXr7khurNUJi8TI7lTkx4CtAwcT4XyjsKEpq5oWZvtNElyrhVpSM/TO8Yq3uzcsCNfmpO9szWGsZTlAPAFGR6qqJtTo6H7IgYjbuxVvsJMeNjEXUqLcR7Q7u3+1SiFgHBdjBt6DzXohqmj22qpIygjBQye5D6q3o3Rwx7gzVACwLe4Cj0/NOsQMJYEe94/mYMMKgPaOs4Mhxmq+EfdX3AtEyGcIx2NXLiHIR+ROfy3jPmkqbjC0r8Ce3XZfnpG+LM5fRpbxtZBfeeg2BZyJGOpb3f3/sy0GvfsbqdV3EOJB+NIZTdcof8fe50+2U3WF09my1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=com1FW1lk64G/Gzr/egji+D781kvGjwH+ntR26SMN8s=;
 b=PzGF/5EOrkMnwJz5bW3LrQPAdrkq0kt6A3RPmjZLGfBPGFeGNywYYx6IAkudkSqNL/p92Soy3XX+MgkORSsDJghVJUzOjmtud1m+WqZsd+NkN7YXiSEDW9LEf3gfPK9i22uetE6zrM0dlHtrxjR8Vuui2yP4B09JXLsHVTfJQMSjQVgSbqEbwAxNIg9p4NGqCzX6VpfVJ7ES1HP6kzUDzfWrBhDvos2kmZ1NdYwV/xXKRsKPzMC3D7a5do6ZRMvHpCquXPx3MGIeRSPI+/ku1avmoT3oCIm01KWSQhxvJm8yZoBytGXB8juQ4k5JKkxtcMiPSXyCjLpH+w+7/1NdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=com1FW1lk64G/Gzr/egji+D781kvGjwH+ntR26SMN8s=;
 b=4/h0m/Dqlnx+dtQJqlkTwIFQk168kiDkU3qJv5OSKO291+Nhzz59RGOCHOdsCskyn4UXBehln/Ky4fcG/+kRyGBbGDZP/SrurlbJ9xGq+wAzx8AtDTjncHmUI7ie0+Ny9GvI80HfYiY9muYxSq08yrGsfT80+QW/Wd79MbBwS0o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1] automation: add x86_64 xilinx smoke test
Date: Fri, 26 Jul 2024 18:56:39 -0700
Message-ID: <9c065e301bf1f00c218def202f4685b83083e1a1.1722044804.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: b0284a17-4267-4620-099b-08dcaddf65aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ENSWwGChdAa3u8F75NYq8roBxx+XGCRbOGCowmYA85lpInIXiPLgMlmiIed1?=
 =?us-ascii?Q?S1FFr2fLduLY6w2BskA0ZDAkS0Dj6GmN3pNT8pTPWIyOoXs07SMATi/nAlsj?=
 =?us-ascii?Q?v7GV1klRvNXJCbdE7FQvgLcUbJLjsql6Iq19t+oIg2EvjTEuuRsW/cbd7Dhy?=
 =?us-ascii?Q?GGDE3NhqMVQ4cvqZ8lPSSqEzv6HDLkDUs/rQwM9wjkCVsXvEd8Io8IiFYRP2?=
 =?us-ascii?Q?MODerahEZUlRJZxLb8GPl3EGwDM0d7W4FHf7XYWMFCVqq5h1SPtUUW7gKZar?=
 =?us-ascii?Q?zfI+WViCtog7Ht0ngWd8Ycz8lL/LutwRs2zpBsZoNOn/WFRW2z28538DMz1H?=
 =?us-ascii?Q?RJAm6t8SmK0G64lZPrKriftCc7O/pvS5AdjC3caV8M6mlFsPc0KrKVOrB5FM?=
 =?us-ascii?Q?KMVYxz+ZT6DXSCy52T9OmpMgg1Q02mW31pxP7N+NYyJLAJL7LnaP6XxBBRLN?=
 =?us-ascii?Q?yaclqAXugWJDWTFeSDQ7jLMwGpBRH/uRc3JucOPR5OO/0/WobjYt/ijo6SXc?=
 =?us-ascii?Q?CRKSeQXAWyVNMCxHBRnveiplb3rQriCUxlKTrLb7MPrnqIZXF744pho5RQAU?=
 =?us-ascii?Q?nZgoHIXP3MTHaY54rRjY5ip4+aEZAQ2+4rVHqRiZZRuDQAiACNSoyjAwLPLl?=
 =?us-ascii?Q?Aq8lN5Ctzg33LDZ59PGeE+rfn9eKty7CVLqKd1OXq/ogTU7ja1GJfsb69rIV?=
 =?us-ascii?Q?Srp2fP6q0IvPR2kGbjVv2Ta7PnRf1hWUO0p6wC4sge+92iZTqDUmD3rPq4Ow?=
 =?us-ascii?Q?Qi7h6hMS5WZtqiftB5EoUZw9Qg7CtdODXp9dfEoZz6G4rThUUaVcu0XfS2XW?=
 =?us-ascii?Q?YPe21yJULw0g20D5HHJkGd/5o7i3l5bV7UvQ3wGj10DAt25uQRNTEwKzBR4z?=
 =?us-ascii?Q?AmbS2OhWmQonZd8QlQUN9sP01WFggbYOUl9znQCouTxgMprjZRrB/blQAzKA?=
 =?us-ascii?Q?f7KtooPJOId79QkloF6e84csCmqAgqn+FgTPtRrdJ+67YJsEffFPuL6FuT9g?=
 =?us-ascii?Q?+z7TwM1VWG7KDp7zZyyM9g2Nt0vfvrR1YLwu/lZ8QaiDDINPZeJxey38Z8m5?=
 =?us-ascii?Q?aLbqLQYUOfIidzbrLF7DVP+6eEvUK80SatIJ8IiVrhpBmerG7cHxoaQ8VQir?=
 =?us-ascii?Q?M8RhUBtU2HeYLPaCeYmVYWnwm+RJW9HxVQSmZyXngxmOaoYqrol6oISfxYeP?=
 =?us-ascii?Q?/tDyo/1I/dO4DXrWNbToDu3OzajXqhhVWw8+5mD/mIcfism9rlBcqAWdp0tE?=
 =?us-ascii?Q?URDeXqRp4ouQ5hK4QgYCwu3q+PgaPEf98yMLK6CHnwcJ6NAmrzgzXR3pl26g?=
 =?us-ascii?Q?P+Qc3ais4TxAbiNX7zEbcv6mTi/Sblr50vRTShOlXr/+Dz1Xynkjsp873NhP?=
 =?us-ascii?Q?udGTiKPRfzJSLv6gW7jyCN0xljwIDKY99lhqokBklXvrM5wKPz1/XeqDyBIM?=
 =?us-ascii?Q?n302FGgu/wxLMt0okdMFcpnCpZr4CpXs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 01:56:57.3003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0284a17-4267-4620-099b-08dcaddf65aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167

From: Victor Lira <victorm.lira@amd.com>

Add a test script and related job for running x86_64 dom0 tests.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
---
 automation/gitlab-ci/test.yaml                |  24 +++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 144 ++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100755 automation/scripts/xilinx-smoke-dom0-x86_64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d89e41f244..4e74946419 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -96,6 +96,22 @@
   tags:
     - xilinx

+.xilinx-x86_64:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: ubuntu:xenial-xilinx
+    LOGFILE: xilinx-smoke-x86_64.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  only:
+    variables:
+      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  tags:
+    - xilinx
+
 .adl-x86-64:
   extends: .test-jobs-common
   variables:
@@ -159,6 +175,14 @@ xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64

+xilinx-smoke-dom0-x86_64-gcc-debug:
+  extends: .xilinx-x86_64
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh ping 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-debug
+
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
   script:
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
new file mode 100755
index 0000000000..e6e6fac6a5
--- /dev/null
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -0,0 +1,144 @@
+#!/bin/sh
+
+# Run x86_64 dom0 tests on hardware.
+
+set -ex
+
+fatal() {
+    echo "$(basename "$0") $*" >&2
+    exit 1
+}
+
+# Test parameter defaults.
+TEST="$1"
+PASS_MSG="Test passed: ${TEST}"
+XEN_CMD_CONSOLE="console=com1 com1=115200,8n1,0x3F8,4"
+XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
+XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
+XEN_CMD_EXTRA=""
+DOM0_CMD=""
+DOMU_CMD=""
+DOMU_CFG='
+type = "pvh"
+name = "domU"
+kernel = "/boot/vmlinuz"
+ramdisk = "/boot/initrd-domU"
+extra = "root=/dev/ram0 console=hvc0"
+memory = 512
+vif = [ "bridge=xenbr0", ]
+disk = [ ]
+'
+TIMEOUT_SECONDS=120
+
+# Select test variant.
+if [ "${TEST}" = "ping" ]; then
+    DOMU_MSG="domU online"
+    DOMU_CMD="
+ifconfig eth0 192.168.0.2
+until ping -c 10 192.168.0.1; do
+    sleep 1
+done
+echo \"${DOMU_MSG}\"
+"
+    DOM0_CMD="
+set +x
+until grep -q \"${DOMU_MSG}\" /var/log/xen/console/guest-domU.log; do
+    sleep 1
+done
+set -x
+echo \"${PASS_MSG}\"
+"
+else
+    fatal "Unknown test: ${TEST}"
+fi
+
+# Set up domU rootfs.
+mkdir -p rootfs
+cd rootfs
+tar xzf ../binaries/initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+echo "#!/bin/sh
+
+${DOMU_CMD}
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+sed -i -e 's/^Welcome/domU \0/' etc/issue
+find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+cd ..
+rm -rf rootfs
+
+# Set up dom0 rootfs.
+mkdir -p rootfs
+cd rootfs
+tar xzf ../binaries/initrd.tar.gz
+mkdir boot
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../binaries/dist/install/* .
+echo "#!/bin/bash
+
+export LD_LIBRARY_PATH=/usr/local/lib
+bash /etc/init.d/xencommons start
+
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+
+# get domU console content into test log
+tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
+xl create /etc/xen/domU.cfg
+${DOM0_CMD}
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "${DOMU_CFG}" > etc/xen/domU.cfg
+echo "rc_verbose=yes" >> etc/rc.conf
+echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
+echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
+mkdir -p var/log/xen/console
+cp ../binaries/bzImage boot/vmlinuz
+cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
+find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cd ..
+
+# Load software into TFTP server directory.
+TFTP="/scratch/gitlab-runner/tftp"
+XEN_CMDLINE="${XEN_CMD_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
+cp -f binaries/xen ${TFTP}/pxelinux.cfg/xen
+cp -f binaries/bzImage ${TFTP}/pxelinux.cfg/vmlinuz
+cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/pxelinux.cfg/initrd-dom0
+echo "
+net_default_server=10.0.6.1
+multiboot2 (tftp)/pxelinux.cfg/xen ${XEN_CMDLINE}
+module2 (tftp)/pxelinux.cfg/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
+module2 (tftp)/pxelinux.cfg/initrd-dom0
+boot
+" > ${TFTP}/pxelinux.cfg/grub.cfg
+
+# Power cycle board and collect serial port output.
+SERIAL_CMD="cat /dev/ttyUSB9 | tee smoke.serial | sed 's/\r//'"
+sh /scratch/gitlab-runner/v2000a.sh 2
+sleep 5
+sh /scratch/gitlab-runner/v2000a.sh 1
+sleep 5
+set +e
+stty -F /dev/ttyUSB9 115200
+timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
+sh /scratch/gitlab-runner/v2000a.sh 2
+
+set -e
+
+if grep -q "${PASS_MSG}" smoke.serial; then
+    exit 0
+fi
+
+fatal "Test failed"
--
2.25.1



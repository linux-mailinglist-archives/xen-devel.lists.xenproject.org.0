Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A3495D949
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 00:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782727.1192238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shcmm-0004CP-N5; Fri, 23 Aug 2024 22:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782727.1192238; Fri, 23 Aug 2024 22:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shcmm-00049D-K7; Fri, 23 Aug 2024 22:29:36 +0000
Received: by outflank-mailman (input) for mailman id 782727;
 Fri, 23 Aug 2024 22:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yg4r=PW=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1shcml-000497-Ef
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 22:29:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a989c54-619f-11ef-8776-851b0ebba9a2;
 Sat, 24 Aug 2024 00:29:32 +0200 (CEST)
Received: from PH1PEPF000132FA.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2b)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22; Fri, 23 Aug
 2024 22:29:25 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f913::1) by PH1PEPF000132FA.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 22:29:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 22:29:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 17:29:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 17:29:22 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 17:29:22 -0500
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
X-Inumbo-ID: 2a989c54-619f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9ezWBk81ExZbDqIduBYpdmM5WPwwpi2abQ+4sBpXOwjp5jqloqhHuxZKdKF+XgaNXpFTFcfRJ65Q81OrUrxMwqSsLdv4pug5HM983PyFhelKJI9vKW1qqhO+WaCg7uvyRuYLathRyq653THsgNg0iKCS+kd9Qb3hViPZ9iDf2hl3i4kZg0ngayIrbOyYpOAUQ+93GPem+9PCHqGvoInr7UqOJoRHdzmW6U8x+CG3fRvHCtAUYH/NzWQl3IfdNavQ5fj4drfdkbXMdtd1VAoYdKO3oTqj3nfE++CLxj4gmonWZW2cWW6KK8+JdFWSArdgyEF55vLsUGt9/nSw8u3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHyfLdJ5rqccJpxu6iDb17bnVwujeMyggvhgUMvzF8c=;
 b=lq+6Vm0nM3aBx5qUdLR7Wbx9gxx1x5Ubi1kAEwuZhj+N8i8yjCwUNxRieNx4brq20sOMPFlb5JjwPLT6MmsUgNThT/QC0qQsHy591a5tEeU+T1+/zyipu3Y1meQl485tbBSRxd3mePgnEjZLwLjdmWopVqgYGtXEMEESyLo0a8r/VFayBwBeIXap59asp0GOCDh8qMrpxBAyxiqzXtSzKmlTkOmC07WinRks/3WNN1a9UDj55sCoK++9bbgxSroMkJfZMOZJLjUbkOU081PlWFf3bhNUBPxrjdKMF5GjweyDALSPom0CtaKWYaeMfKDw0Wc9z8NtIw3VQe6EcHObvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHyfLdJ5rqccJpxu6iDb17bnVwujeMyggvhgUMvzF8c=;
 b=SKE66CpCd8FSUZI7I14VFIGFWC90CF2Lo8TIFb3wrik9veeEG9EPjSI0nznRBBfBqiLm1m6t1p58Yb09M4cUGDnmR5ZMk7M3uPb8FUybBcft1pgtktfkCl+hoTwkEbcTednX/koQ8RZ/A04KLeobUNSHlCR/2+Q2KoGvgHLIQwI=
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
Subject: [XEN][PATCH v2] automation: update xilinx test scripts (tty)
Date: Fri, 23 Aug 2024 15:29:04 -0700
Message-ID: <8cf7c010d8412d23d2e1da272f1103477d751037.1724451299.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8b1008-c2a1-4444-a65f-08dcc3c30a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eSdJpBi3/IfU0hnauM+1xKLXidhrDgnFUuuXXkF/Q61jEEUIbVzJ8Yf9sJhJ?=
 =?us-ascii?Q?S26Pl7Sf18E0t32g79x/zGFgpBX/AfwFO/ZAuVSykl2Um6pbf/ToiNr2/phK?=
 =?us-ascii?Q?2GVVoVG6FydrTR6Qs6ZSZHlWFFBkolprR4lSoJAi7lmj/vP4KFdPA1ytUIeP?=
 =?us-ascii?Q?Br6vg38fSlZRgUxq1OrzY4vki7LYHVGePW3LAIlEAdhael2Z9CuyipBrug0y?=
 =?us-ascii?Q?8GAl6NlCP6xJuXQwTbQil4ziUA2RmqrFrRjsr7TgfQSAcVhsmRdWOQn1Cz1x?=
 =?us-ascii?Q?WCpBQR63caUT4ouw4bBVmPRNlFtL220a/HNm4MB8mi17q+RDro+urGKWCqhR?=
 =?us-ascii?Q?Yf1Jfxv/Nptr92xfqc2uVNu0Ks9ZxFK+PWQsBHsLScjqmw+oGqteiRiFTWsN?=
 =?us-ascii?Q?g8lE/wX8Eh6LBnTKvkAQExjO235ityPJ8QICS+QA1IqPbOFsFYkIH5e7Z3sy?=
 =?us-ascii?Q?DeOEqh1atL8feABMFWqhwaAT1tD1qy8R9ssl/abLV5a9m/wZ+t+z8ZwADMZJ?=
 =?us-ascii?Q?TWNqrC2l2Bu9jL9dP6NkJAMA9LyXJWmwn5arud42/f+QzfT5lYF1OX/gsFUt?=
 =?us-ascii?Q?1XTgCfv6cIuWX8ICIdb0Wiy6Malp60Haf7jBTWaIJ2DqhP1Q0OzwZmvSefIB?=
 =?us-ascii?Q?UJkedkqRoSaqSEajJmVpXlwNZeroufX6K4DsJu2A2jtTF3WjdN5HjkXbeN/R?=
 =?us-ascii?Q?y6K/4gZ7Vku2MwUwFjT1t6sn+Ycwm+8dVpqaF9OxQkL7I8mtKtIdsAIvUPTD?=
 =?us-ascii?Q?hDN4hf5jDWAOpjYqiUu29Dq4TvsCC6dynG4ckTtpwp0J5Jy8I+n5O4jpGzIm?=
 =?us-ascii?Q?LZqMh3939EEg94CQ5o7E6kjUInlOu+efGQ2kl3WauDTPQPQGxwiMwwW+PIDo?=
 =?us-ascii?Q?DML+2n4DQiSZ71SQZIzKuhV8Y+0zYu+z7Fw5znatB4R6FN88zdIkcgI5EQ6g?=
 =?us-ascii?Q?czvrye0LjN/PDBkvrH94iJAZAr1FvBPwo0o6wiC17CvgCOZ090i2Rb1KX9NF?=
 =?us-ascii?Q?D1tykw2Yws1Cq+bdhCNwx3cfsnViNdQCE7dW1ugvjdmarTT6OGCKDZ/9Q6Fq?=
 =?us-ascii?Q?PStptImmGg5SKMT49g5FnmX3kBay9h4vHOfjDCaISA/G5rYQZZIEK1j+j3qT?=
 =?us-ascii?Q?bzk5L+uZOFTtP+sliAuYiAK5VAb6aoKRPjFhmv8wjQ/tt+D7BcG4sew0lxq6?=
 =?us-ascii?Q?7tuiBV6vSn1sCi23sJIhYUN3NVr6+HUl2hEAnXLHoq4eoaVb5IiVdBabyGkX?=
 =?us-ascii?Q?6Y3twrlVGzZtzyeSh4o8aiZuKFPkNv/YTZHxLJoKD89a30TIWV9v8/rVEc9U?=
 =?us-ascii?Q?cA3dP0e4yyf6unKkl29uoPbHiVfJkaigQ+X3kxywQXPwJBgqYX5BG2M5/mFo?=
 =?us-ascii?Q?fgO3HHg9X016dXWIEIVIOEwBjLGumO3tu3XwBzpqWXFgB2SixcuwTY6PdkKG?=
 =?us-ascii?Q?yE4ZLoWJfCBX/BdkE90jHSrl+P5SEVEb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 22:29:23.6238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8b1008-c2a1-4444-a65f-08dcc3c30a3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276

From: Victor Lira <victorm.lira@amd.com>

Update serial device names from ttyUSB* to test board specific names.

Update xilinx-smoke-dom0-x86_64 with new Xen command line console options,
which are now set as Gitlab CI/CD variables. Abstract the directory where
binaries are stored. Increase the timeout to match new setup.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/test.yaml                |  2 ++
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 28 +++++++++----------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    |  5 ++--
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 4e74946419..3b339f387f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -101,6 +101,8 @@
   variables:
     CONTAINER: ubuntu:xenial-xilinx
     LOGFILE: xilinx-smoke-x86_64.log
+    XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
+    TEST_BOARD: "crater"
   artifacts:
     paths:
       - smoke.serial
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index e6e6fac6a5..4559e2b9ee 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -12,7 +12,6 @@ fatal() {
 # Test parameter defaults.
 TEST="$1"
 PASS_MSG="Test passed: ${TEST}"
-XEN_CMD_CONSOLE="console=com1 com1=115200,8n1,0x3F8,4"
 XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
 XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
 XEN_CMD_EXTRA=""
@@ -28,7 +27,7 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-TIMEOUT_SECONDS=120
+TIMEOUT_SECONDS=200

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -113,27 +112,28 @@ cd ..
 # Load software into TFTP server directory.
 TFTP="/scratch/gitlab-runner/tftp"
 XEN_CMDLINE="${XEN_CMD_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
-cp -f binaries/xen ${TFTP}/pxelinux.cfg/xen
-cp -f binaries/bzImage ${TFTP}/pxelinux.cfg/vmlinuz
-cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/pxelinux.cfg/initrd-dom0
+cp -f binaries/xen ${TFTP}/${TEST_BOARD}/xen
+cp -f binaries/bzImage ${TFTP}/${TEST_BOARD}/vmlinuz
+cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/${TEST_BOARD}/initrd-dom0
 echo "
 net_default_server=10.0.6.1
-multiboot2 (tftp)/pxelinux.cfg/xen ${XEN_CMDLINE}
-module2 (tftp)/pxelinux.cfg/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
-module2 (tftp)/pxelinux.cfg/initrd-dom0
+multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE}
+module2 (tftp)/${TEST_BOARD}/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
+module2 (tftp)/${TEST_BOARD}/initrd-dom0
 boot
-" > ${TFTP}/pxelinux.cfg/grub.cfg
+" > ${TFTP}/${TEST_BOARD}/grub.cfg

 # Power cycle board and collect serial port output.
-SERIAL_CMD="cat /dev/ttyUSB9 | tee smoke.serial | sed 's/\r//'"
-sh /scratch/gitlab-runner/v2000a.sh 2
+SERIAL_DEV="/dev/serial/${TEST_BOARD}"
+SERIAL_CMD="cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
+sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
 sleep 5
-sh /scratch/gitlab-runner/v2000a.sh 1
+sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
 sleep 5
 set +e
-stty -F /dev/ttyUSB9 115200
+stty -F ${SERIAL_DEV} 115200
 timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
-sh /scratch/gitlab-runner/v2000a.sh 2
+sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2

 set -e

diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 666411d6a0..18aa07f0a2 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -134,9 +134,10 @@ sleep 5
 cd $START

 # connect to serial
+SERIAL_DEV="/dev/serial/zynq"
 set +e
-stty -F /dev/ttyUSB0 115200
-timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial | sed 's/\r//'"
+stty -F ${SERIAL_DEV} 115200
+timeout -k 1 120 nohup sh -c "cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"

 # stop the board
 cd /scratch/gitlab-runner
--
2.37.6



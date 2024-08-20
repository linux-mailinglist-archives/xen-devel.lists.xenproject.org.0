Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD0958DBA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 20:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780721.1190355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgTAc-0002G8-Pe; Tue, 20 Aug 2024 18:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780721.1190355; Tue, 20 Aug 2024 18:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgTAc-0002Dg-MF; Tue, 20 Aug 2024 18:01:26 +0000
Received: by outflank-mailman (input) for mailman id 780721;
 Tue, 20 Aug 2024 18:01:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvfb=PT=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sgTAb-0002Da-Su
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 18:01:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2415::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35715f14-5f1e-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 20:01:23 +0200 (CEST)
Received: from BLAPR03CA0007.namprd03.prod.outlook.com (2603:10b6:208:32b::12)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 18:01:13 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::4c) by BLAPR03CA0007.outlook.office365.com
 (2603:10b6:208:32b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20 via Frontend
 Transport; Tue, 20 Aug 2024 18:01:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 18:01:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 13:01:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 13:01:12 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 20 Aug 2024 13:01:12 -0500
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
X-Inumbo-ID: 35715f14-5f1e-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ma150mf3K4k25yDQL6UdWjBjvvnde3cBcsoqt+UkuDOv5qxP7KuP0X8dGds6a77+kJ4xHii0qhSNv8fN0jR6z46Zhbs6jq1MtUf8DJambyEgDaKDh4LrWpBAZyjxGz0CgIt3egjSnwLHsF1WNJ8X5zuIQYzMLPGe7YIzs7EHKSMA+uYvuo/1A81gOX6B6VUL8jbCU+1tAq5fpTNk0dvohhg03c1+pS5hpWGh1iiXeDQtdapyjKaety3DmwNAdY0RPgjuQeoutYdsvX2FQyXpZLbqO30CYd/BLMmXkmUHO5eANAB0uSKJpFOi8sDyhmamjG3ETihaQAxxT3Xt6/q5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2c38QiJTMcl0y+jcYjv48Mj3RBdPJkz0pyUUsKDurA=;
 b=LA6LKfr8Q+7gnPVQu6DWf8lIzvbPNzC0VTQNZf5tuVGSYhSMqfL7AYmPftOEHZvyEgOIJsMDhise2m0omcCMgIonuVtgWXoVNi94HV6Cr9WcJyiwH6Mgr/7fbEyPiOb6zs2DxlWFQ923KxK2KQVXbs+vWMUJ3gu2aTFnc1jfEd4kyIZb+TInUV969PWvTWSv0fcAdcooeaaSVLYtdUMiUdLAt6e0Xe/RcEe0T0haA7+ZA74gcaUA/nTSpXJCqdPLaYsjy8CuMffl7zKTkYmIZz5ecufrW1gczmHIsWD4Dueeh8seCZXUSBcwZylYWABh1c47p1fzTW1iaxzeIZpM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2c38QiJTMcl0y+jcYjv48Mj3RBdPJkz0pyUUsKDurA=;
 b=uQaEafZkNeRwYa520FDxi4ujgioZpsB/Yv0jRd85h48Xvk0fKI9CtTdkvGfO0swwEHZEJkiPeyB3zKUb7w9QW8Q/9CpMmPLZnaoiMsCQdMhgbaBi2dFfDzGkd2jSEwa3tsxafkMKQW1d4M0ZSVblsNdo1pcRx2YbEPvmuohMphs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v1] automation: update xilinx test scripts config
Date: Tue, 20 Aug 2024 11:00:59 -0700
Message-ID: <6b69088c886ce53ca17fe11ad97e3c364c2220de.1724176414.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af9cc5f-1ca3-4eef-f9a7-08dcc1421444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cqw1geMVvI8h5MOqjYO1ikJt/bJaiS3WhWrQhBDYEW5hewYnHOwQjhFZqWbx?=
 =?us-ascii?Q?J/VX0wcFmX/9Rq0CC2bl3+AVjQbuYbrjdzJl3QKzoxiFdveU3LCAiQTmFHvy?=
 =?us-ascii?Q?Ii/ChSA6IMN156HYZXJoJHYyl/dGic6OQddbwJg41cqkGnl0hmvVTLwzTyiv?=
 =?us-ascii?Q?h925gS1+j8MsRhiJs+uYMuOwpIP0vg5YessMn3KQzTxlzgy4few3kl1JVfx/?=
 =?us-ascii?Q?P4VtLt+scOyxgq/dK2RTxY/JWefKl09+N2AeTx7G+8fS6tKWmMfjIf58wULT?=
 =?us-ascii?Q?y2lSUjTMqYRs8kuFj74zRCkTVVE1me/V6GdIJTthcCQEzDdBH90/4Z4m3Ry/?=
 =?us-ascii?Q?AlzSCd0AxSQOwDznS6ltqnXaIgcMx4xotSMcGYHXlxxZdqKYLT6ryAq8qIkD?=
 =?us-ascii?Q?8BO6x5iFV+fno+l1lj42JAogLFcQ04dPykF5IWAup5Vk52hMhbYr9X4OHJ89?=
 =?us-ascii?Q?7UJy8eKhfoPNkbdq+345FlBRksm8/rNS3gCPK35mSLqmX+pVOGLp6BZZ0m/V?=
 =?us-ascii?Q?KCZ0e2IY5HtSIZOfoqCD8aJNQ2QQFlsVIDqEVX32S3+Qac4EXg77Fsc+4Ke8?=
 =?us-ascii?Q?WhG/bvk6igZNLr7ZJIyvTqDDKoNfgMnN484g48xO027/3mkJuTXpMDt+7uu+?=
 =?us-ascii?Q?rG8WRVPmMpOWoYq52EuybS+bwYDCMnagnbR7KsAmTbfReNE8Y57AuvhLYBTZ?=
 =?us-ascii?Q?SXFYE0uD91hxc6Ldkqlooa0NXf7P1yW6v8z7uQNWkwXv+G5NPJ6tmaBOsZas?=
 =?us-ascii?Q?FIzy2lYISCKhSpUso07Kzzqkp23y1kGaO7Cw94VqTBXOYATl+OgY5Z0UR/4S?=
 =?us-ascii?Q?VpJg1aUYUvvUBphR68eIfjd0ts5oWn/BZH0/Sivt1jg9n8eKi6LQsIhD0ZO7?=
 =?us-ascii?Q?bae1L4J0O9RQT5bYT9vUKVaYfwyRU4KHbaRSaug475dmsuKabuO1V4bA7UDH?=
 =?us-ascii?Q?uWhfZCiZx2l0Aokwqk48iZ6f9t9Qk2llAoil3lpNFvzWcnwtKgrDN4K1ElMX?=
 =?us-ascii?Q?S1OuSHM6I4gZPVQ0MeOkNoFsfIe5ejQuL9hdjvhWpZgykmd+pJAtBGKKmVNG?=
 =?us-ascii?Q?12qkbuSfCBTRTbJwdWuUJuEfQFOZivs3z0ZsHZG2UO6lnew9+I4y5373zLH6?=
 =?us-ascii?Q?xYbCidNGXSiPLlyr6IGCozOf3CkD5r6ybyTeLYnN+fgjiuaDCgWqo3M2Y13q?=
 =?us-ascii?Q?G/YtWgMhfMU9YLlwgveL3buMrMwX6jacKRFW3I6j8vNHeV/taoSxT3wx1laX?=
 =?us-ascii?Q?M41glHWrYKdQB/Qxd9tQCo8HlKpCZfogjn9/+5KsP/tQ0emNe9rT/43yDtaI?=
 =?us-ascii?Q?jr8D3iPeT3ipOXmrfPgGmzweEIYhLUZT1+4/ZI5TqOxEiSvYO5O4fQ/E0AOW?=
 =?us-ascii?Q?XKStaDDniM9jIzoCYD+HHYVHdLhuRqG1pc9MMWsc27inxU5LM9PlZqtG41nf?=
 =?us-ascii?Q?Krg0KxeiG/WsUTH7L3AdF4ufb/WLQIZ0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 18:01:13.1053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af9cc5f-1ca3-4eef-f9a7-08dcc1421444
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417

From: Victor Lira <victorm.lira@amd.com>

Change xen command line parameters to support new test board.
Abstract serial port device name and tftp boot directory.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 29 +++++++++++--------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    |  5 ++--
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index e6e6fac6a5..2696bc84bd 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -12,10 +12,12 @@ fatal() {
 # Test parameter defaults.
 TEST="$1"
 PASS_MSG="Test passed: ${TEST}"
-XEN_CMD_CONSOLE="console=com1 com1=115200,8n1,0x3F8,4"
+XEN_CMD_CONSOLE="console=com2 com2=115200,8n1,0x2e8,4"
 XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
 XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
-XEN_CMD_EXTRA=""
+XEN_CMD_EXTRA="noreboot=true sync_console"
+DOM0_CMDLINE="console=hvc0 root=/dev/ram0 earlyprintk=xen"
+DOM0_CMDLINE="${DOM0_CMDLINE} loglevel=8 ignore_loglevel no_console_suspend"
 DOM0_CMD=""
 DOMU_CMD=""
 DOMU_CFG='
@@ -28,7 +30,7 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-TIMEOUT_SECONDS=120
+TIMEOUT_SECONDS=200

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -112,26 +114,29 @@ cd ..

 # Load software into TFTP server directory.
 TFTP="/scratch/gitlab-runner/tftp"
+BOARD_ID="x86_64-0"
+BOARD_DIR="${TFTP}/${BOARD_ID}"
 XEN_CMDLINE="${XEN_CMD_CONSOLE} ${XEN_CMD_XEN} ${XEN_CMD_DOM0} ${XEN_CMD_EXTRA}"
-cp -f binaries/xen ${TFTP}/pxelinux.cfg/xen
-cp -f binaries/bzImage ${TFTP}/pxelinux.cfg/vmlinuz
-cp -f binaries/dom0-rootfs.cpio.gz ${TFTP}/pxelinux.cfg/initrd-dom0
+cp -f binaries/xen ${BOARD_DIR}/xen
+cp -f binaries/bzImage ${BOARD_DIR}/vmlinuz
+cp -f binaries/dom0-rootfs.cpio.gz ${BOARD_DIR}/initrd-dom0
 echo "
 net_default_server=10.0.6.1
-multiboot2 (tftp)/pxelinux.cfg/xen ${XEN_CMDLINE}
-module2 (tftp)/pxelinux.cfg/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
-module2 (tftp)/pxelinux.cfg/initrd-dom0
+multiboot2 (tftp)/${BOARD_ID}/xen ${XEN_CMDLINE} updated_test
+module2 (tftp)/${BOARD_ID}/vmlinuz ${DOM0_CMDLINE}
+module2 (tftp)/${BOARD_ID}/initrd-dom0
 boot
-" > ${TFTP}/pxelinux.cfg/grub.cfg
+" > ${BOARD_DIR}/grub.cfg

 # Power cycle board and collect serial port output.
-SERIAL_CMD="cat /dev/ttyUSB9 | tee smoke.serial | sed 's/\r//'"
+SERIAL_DEV="/dev/serial/${BOARD_ID}"
+SERIAL_CMD="cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"
 sh /scratch/gitlab-runner/v2000a.sh 2
 sleep 5
 sh /scratch/gitlab-runner/v2000a.sh 1
 sleep 5
 set +e
-stty -F /dev/ttyUSB9 115200
+stty -F ${SERIAL_DEV} 115200
 timeout -k 1 ${TIMEOUT_SECONDS} nohup sh -c "${SERIAL_CMD}"
 sh /scratch/gitlab-runner/v2000a.sh 2

diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 666411d6a0..c8382bb0c7 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -134,9 +134,10 @@ sleep 5
 cd $START

 # connect to serial
+SERIAL_DEV="/dev/serial/arm64-0"
 set +e
-stty -F /dev/ttyUSB0 115200
-timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial | sed 's/\r//'"
+stty -F ${SERIAL_DEV} 115200
+timeout -k 1 120 nohup sh -c "cat ${SERIAL_DEV} | tee smoke.serial | sed 's/\r//'"

 # stop the board
 cd /scratch/gitlab-runner
--
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3FA2B87C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883304.1293382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZW-0006F2-F7; Fri, 07 Feb 2025 01:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883304.1293382; Fri, 07 Feb 2025 01:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZW-0006DQ-Bo; Fri, 07 Feb 2025 01:54:22 +0000
Received: by outflank-mailman (input) for mailman id 883304;
 Fri, 07 Feb 2025 01:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZU-0003b1-Vw
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:54:20 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 710ee2e2-e4f6-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 02:54:19 +0100 (CET)
Received: from MN2PR04CA0020.namprd04.prod.outlook.com (2603:10b6:208:d4::33)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 01:54:15 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::d9) by MN2PR04CA0020.outlook.office365.com
 (2603:10b6:208:d4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 01:54:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:54:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:47 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:47 -0600
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
X-Inumbo-ID: 710ee2e2-e4f6-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTsfhD3EcRtRxCZyWWD+vzeZneWaMsfX1HP6fzbHmbuBE30I9h6D+eNy/OhnB9tGTuLy+K/ucgQFgZZTOQX9ZKTKaWEl+mxg0/KXqCMRtVOeuKCLboFTOxkvdvREPZ2D6XvlfmttuFfP5TTi0gp2vdeAE7jtmiDnn71PhkqP98LUAlOgZ4nGLGIwO3Cpf0OVbJWam044hClBVYPgjxyVrrtJRkhzC3vIkyZk01jeSBPxLgIyYsoeVPIaGRsXmtM8Ql5oI8HJ2V5LsUHZ5QoR1NoAmuu+ysj/vymAy7EDDVIga1RN+BM9YvwVywG0XDGZmQRbUbAKZC+UWhweiqi6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZVSMrbZ1nm/qxWuwEbr55z3NXMCsSyc2dendwsVuj4=;
 b=dt92ARsoFXL3jx3J5zJ42H6kS5muKjXM8qATNa3UtgxuECGJm1yy1vTzNq6mphXDcH8dSr/WrdMQzld92YrP9QDY92T97xLP2odAzy198Vr56WiDATIp2+4uZBonmXziTt7MQWMDHIcEPfjuaMStpadZEfSRT/jCzgGrkPdasfUbaYFmGhymZQhvrYM6/F8Ffi7yrxWG4dFrPBOw671OrSb0xNCp8fYDdmbcM7pWmVNQMd+eqo6BykCmQskpffVngM/dOGDgYFL9ZWqm1Ykb75PDAAxgVLnWbif6YoX/ReqQqRaf1eqmG1+9QoSwRDTU3K+IwcmGHHB6wkcaZxBYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZVSMrbZ1nm/qxWuwEbr55z3NXMCsSyc2dendwsVuj4=;
 b=NcN4LsqwUKlfw0Q4oy+MSOHlkCCMsHP5aulyL1klw+GyWEvz4529adiL/yPLQ3k5/2nobFbdCmwX3en3/e9m5b/mtzjgzYiiUVgO7zjqOHsSq0r6ag1fD3KbYyeJmIDkzN+5WIPHyajQnAdtFC4SrQve6E+/C1l5JTs9gqrMemY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v6 7/7] [DO NOT COMMIT] automation: add one test using an older unpatched Linux kernel
Date: Thu, 6 Feb 2025 17:53:41 -0800
Message-ID: <20250207015341.1208429-7-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dbec53-721a-4e0b-fed0-08dd471a52c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ycECRAqyaGWD1i/odLRN3qr0HMjjD5RZhjSBM3YjhgTn0gZrImEmnmVNkWi?=
 =?us-ascii?Q?V0VV5jph75kwiDjgPhs3tMmxcw/bx/VsjP3cl2saU4GqRK7DuUcFMnkqxokM?=
 =?us-ascii?Q?pfp92Esn5bHAg0w7cAPkTi3rqjzGzhok+bewUfdbFp5dYYmQ661EG68mz0Sa?=
 =?us-ascii?Q?QmqBKt5yhr+TN7mx/9DGcSovKvJ4lfg/D0oAmCZFfkfRsQKNLnsF+Ewto2Og?=
 =?us-ascii?Q?pursf0On09lGfrLSXn3SL46cZM7DTNzX56hdw7s1eJIVHStLefIWqIYpiOs8?=
 =?us-ascii?Q?HcY8N49nHQEvdYhYXPILLaKHG9EXa5deW8rJrebbBf3IVtI81uQa6ceP7SsO?=
 =?us-ascii?Q?JtUDcqLQ1UnWeCtNjFiDIudDEH9yaq07aYvo8pBrScYUlJUR1VvbM4cETcA8?=
 =?us-ascii?Q?W2B0CIItKM0Odfht8UHax2JeAvaaXBjAMq+SfeuGLyFkIM8wsjazMvOL1K5Y?=
 =?us-ascii?Q?JAruxf05oGXE/Z8tpgBzG8WaPhuZrLVaNtbeUVkIcTIgmbQ9/uIi/dSTq07T?=
 =?us-ascii?Q?b4HSIoh1J9OCX2WovbvaoENE27CI4gkSfEzLqa9IrxverUq0yKLKnpDVHpHj?=
 =?us-ascii?Q?VafvuYNNBcx++b4gOIXX/ICqsO2C6Ilruoo67m9AfXMp/vFXbleHA7HG+TP1?=
 =?us-ascii?Q?K85qvEq8uu/+pmyEPbMVv9FQb0YUWBQtizIGB6qPMXESwGzjkVlDqpUlsQ+a?=
 =?us-ascii?Q?e+7HbxGgppEyd0rLtNOtZP9YHYtFmTo6dzwbu9hzbHf137R4CTibAC5vkYeI?=
 =?us-ascii?Q?+njMsjytbjrYpzn9K1kScety6hapIvEe7D+p2ycilcnVfGoV3S7MzR95cldz?=
 =?us-ascii?Q?oWckjcCOTtibnW2nTO6y7x1cEKfFPE0QZpKs/fo3aZbXLWpHOgzqaGHRcddQ?=
 =?us-ascii?Q?MuEhx/mA9ncPpAmvDvS7vIKmO5HsGvBAvRSJZibW9lpp4o9B0oiCgPMkzwZg?=
 =?us-ascii?Q?FZFdbdT0DAhMIEuFhYVl6pwDSlqZMQR0Tcs5d6opDs5fXEJzZ6pETwEFpXWM?=
 =?us-ascii?Q?F5f4S3vYQVVxPM1edWVWdQks5HAiGHYTA5Av9DETS9nTPI+hUYNHEAMWacus?=
 =?us-ascii?Q?FjYud2NAIWTKg6G5RrNSq6r9G4lrXF2xwm1hX32+Iwn5GIbht1kJ5iQfbI5b?=
 =?us-ascii?Q?L4oj4YcPS5rnSSYiXl3Zrl+NZzftB/IKt3EMdKNTcpm8jVtf8vfVZ02KPbcV?=
 =?us-ascii?Q?iGSeYvPNAl2nXppqCRkjY9cGrjmZ0WMEXevCv6Jj/Geq0LhomjHzI9N4wUmv?=
 =?us-ascii?Q?GI+1VXbrmGIgurxZXpM4KJ7TUBH4UkYslq2KEtK5Yd9VDeRDRLNnIQNAc3ey?=
 =?us-ascii?Q?Ny8jObm74sZg39bodndcoaiTCQSzL6J3sqw5BDDjQJy9NdY5/+HE+W2CZn/l?=
 =?us-ascii?Q?Ht3na787ysvRwzmh6xktydpgh9FpEdVB8ChvRFCb1Dpg6eV+7oiQNbTZpDzw?=
 =?us-ascii?Q?1tZV1cxYaS0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:54:13.9323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dbec53-721a-4e0b-fed0-08dd471a52c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782

The original patch series broke compatibility with older Linux kernels.
In the meantime, Linux backported a fix that improves the general
behavior and also resolve the problem.

However, we still want to check Xen against possible regressions, even
against old unpatches kernels. We can use the older Linux kernel version
we had to do that.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/gitlab-ci/build.yaml                 | 11 +++++++++++
 automation/gitlab-ci/test.yaml                  | 10 ++++++++++
 automation/scripts/qemu-smoke-dom0less-arm64.sh |  7 +++++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 411b4902b5..0a867c3ced 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -269,6 +269,17 @@ alpine-3.18-arm64-rootfs-export:
   tags:
     - arm64
 
+kernel-5.19-arm64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
+  script:
+    - mkdir binaries && cp /Image binaries/Image
+  artifacts:
+    paths:
+      - binaries/Image
+  tags:
+    - arm64
+
 kernel-6.6.74-arm64-export:
   extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.6.74-arm64v8
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 6ad45269ea..06ee2fcc7e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -335,6 +335,16 @@ qemu-smoke-dom0less-arm64-gcc-debug:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64
 
+qemu-smoke-dom0less-arm64-gcc-debug-old:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh old 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.18-arm64-rootfs-export
+    - qemu-system-aarch64-6.0.0-arm64-export
+    - alpine-3.18-gcc-debug-arm64
+    - kernel-5.19-arm64-export
+
 qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f72d209361..ddb158987a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -7,7 +7,7 @@ test_variant=$1
 # Default GIC version
 gic_version="2"
 
-if [ -z "${test_variant}" ]; then
+if [ -z "${test_variant}" -o "${test_variant}" == "old" ]; then
     passed="ping test passed"
     domU_check="
 until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
@@ -203,7 +203,10 @@ fi
 rm -rf imagebuilder
 git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
-
+if [ "${test_variant}" == "old" ]; then
+    sed -i "s/enabled/legacy/g" binaries/boot.source
+    mkimage -A arm64 -T script -C none -a 0x40200000 -e 0x40200000 -d binaries/boot.source binaries/boot.scr
+fi
 
 # Run the test
 rm -f smoke.serial
-- 
2.25.1



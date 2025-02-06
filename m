Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E908A29E3C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882396.1292586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO5-0000WQ-R4; Thu, 06 Feb 2025 01:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882396.1292586; Thu, 06 Feb 2025 01:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO5-0000MK-BD; Thu, 06 Feb 2025 01:09:01 +0000
Received: by outflank-mailman (input) for mailman id 882396;
 Thu, 06 Feb 2025 01:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO3-0007da-3e
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:59 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f009cfc2-e426-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 02:08:56 +0100 (CET)
Received: from CH2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:610:54::27)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 01:08:53 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::88) by CH2PR11CA0017.outlook.office365.com
 (2603:10b6:610:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.22 via Frontend Transport; Thu,
 6 Feb 2025 01:08:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:52 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:52 -0600
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
X-Inumbo-ID: f009cfc2-e426-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9LQrdzxCPSOzg+I8gYIyagWiZc1WQTYUPjsIcUrETPtGZ71BLsCrM6XL8b13xUTENUDTL2IDqxCcpwhb2wU80JknSs35d4GFoHwwftDO+IHQz5/hkTiJ5nJ83xnTkyV5KXeFy8eVkN6wTVxGtvgCc73t9tezy+RdNzQYSZ9ANSbHU9SbElc20D6Hwtdm+kzwBX2V2zX6CP+Ng0DuvlI48XS7Qkj0ACR+BYEEM96JiObHtKYYt/UGCeuyODanQRIadXNgNawwmOWXIkn4dHro110rHrm9K3qq+3wSa0x6IYDgsYSN74ZlgBPqiEi+tZ2MqD00wlXMvLsBsG273NyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZVSMrbZ1nm/qxWuwEbr55z3NXMCsSyc2dendwsVuj4=;
 b=lFJFi3Htj3DpaoCNl1o98Kl4M2cJAW04fn2Zb9pV40hXb+PYXABzT1ssX09Iyqhp9iOCfQdTA9avPsLFysbMpv7CDs8tqQxuSohdWIWn3mnIpR9GOCS5mA2BijGUFmVX9vZUi4/TCki/krmE5uHdlowGQxNKu0PFIHNJBw3kNuaxXkfPRI249CBgMZoUCWpOdin4FlcMzGPa3pbEa2HlqLeY20jgqF7muF+Pxd481iq2wCAm4iz9PNfmZFSlUJ7IL7eObQCGqKdNVSXmLuJTQjBTD6Y+4RRY69X+kw+NUBRSH5TmKlO8VFJI/MaeKgOz0+6l7ibmC4fgQ3sU6Xkc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZVSMrbZ1nm/qxWuwEbr55z3NXMCsSyc2dendwsVuj4=;
 b=iv0OMJf++KmUb4vrj5DLYFW2qrDaUCSVyzzgUswXxL2P1OVkmcuJUgjt+qX3dHLgvxh4Z1KVNcan4iewWhbfYFwzMFRCGd6jIcF4Tl/NTTRqvLE5uZBcdrFXB3QcvUtHISpGNnvt5ftuYTAn13px8XtaFqEaf5G2nrMflDP2gCs=
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
Subject: [PATCH v5 9/9] [DO NOT COMMIT] automation: add one test using an older unpatched Linux kernel
Date: Wed, 5 Feb 2025 17:08:43 -0800
Message-ID: <20250206010843.618280-9-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: d432965f-7437-4699-50ad-08dd464ad2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?32Tl+VJ1GutqiflkWs4BqIVr1QsjxBiGEUNjfEwO6k2Dw9zLZ0cy5pyGdhLN?=
 =?us-ascii?Q?NN9fmE0C9ZyqviAFV3nVEhPSRnwVRXgJk6aNILzVnliqrWSd5+DRbIpIy8vz?=
 =?us-ascii?Q?MkaoGLbgw2ZaC3ON6/bdG2o4F+MOQmkU2Hg4C/AdgfgEIc0Zgi3dKEV9flKG?=
 =?us-ascii?Q?haaCpjBPFXa5v1+ofqbu6EcKwwrTl9I4SuTjB47F8ZX/uEP650OBOKb16NRK?=
 =?us-ascii?Q?FcUYcDowRHxzvWoqwwKPAyJGHuy06YppxwmudsD9YrBNXoyC+wZkburNp+J1?=
 =?us-ascii?Q?kWNNRYxABEW0NKqaOMeMZX4Z9tuYUiDEhu+ckrNtOoZaFRRteWbWlGlhfEJl?=
 =?us-ascii?Q?t+qyJkwlv9UbssTHibw5XJuCqTzhEmPOnSeqTHNNY0rBlm0bGz8KlIR5KiQy?=
 =?us-ascii?Q?JEIJ0VyjLgRJ07onyhv9K79ymVEmjIOqAKx8RWnXZg7DEFi1uLKfFQiF975V?=
 =?us-ascii?Q?nnxhNxPhoRrx2HE3GAJKKsnsDdw8oKueA275PyNrL1r9cx9r2LjVYG0abH91?=
 =?us-ascii?Q?cnGrw43HvccIaYPPgu7OUYuZE1l926wefr9cfMwK1Eo051xVWrBJ8RBRQY2j?=
 =?us-ascii?Q?h30oGmfjLa8WRl5tWFAK0VyVPwmUwXlSwvZ5bayurHO7VC1yKL1k23PxWnL1?=
 =?us-ascii?Q?OHnilT9FsgfMcIFKXT1nvHyqUjTsBXxUlTkjg+eDxaFNqVzicIn+5gudmylt?=
 =?us-ascii?Q?12TviArUfq3tkjwafo6ya3fQEQTGvrsLpiR9eqpJstt6PkgDB5Tgho+3xMp7?=
 =?us-ascii?Q?PIfReKAz8F39Kpff5RIK+e1oISKkzjhixThuYc6VdmGicr4L26omP+IfxD+W?=
 =?us-ascii?Q?BW6auQRLOiCweV4PrO2uKAT/d1ViS5krPVkZ7SFey3+vcs7DI4tdN9tsecpG?=
 =?us-ascii?Q?Dxcy4HkUaJ2xHEgd2w3Nq233/H8F5Ri/xiBu0HZOGeg2m3mtA3ujTjUhkVqE?=
 =?us-ascii?Q?1Qh5mPIkk7IaskNu15fHVyq6qcMtz6Pviixpn5oksmk81aOWd8WENf+cPHhh?=
 =?us-ascii?Q?dPwtn1j4wbhcNOlWdDobZ+MJ2y5DlOhA60Cppf36ls0LpZ/ESxvuQA7gD9tR?=
 =?us-ascii?Q?Gt1esgCt4LlAmd3UN9xdqqrfftplvyXxzgCC5q779qhVXH4g9fD+hveEe3Eq?=
 =?us-ascii?Q?G4TMuHUD8SRHuxSForfNfr+iWFnd6S9vQowvyNkrq2kvnUGolGbcR/cT558h?=
 =?us-ascii?Q?hMcqkg68xuioD0XR9ot9avOKZoIvcL8s71dScSxP6rlcRd6eDZINKglVTTtk?=
 =?us-ascii?Q?iGWzDuhfn7Mb+o5YgPC4PYLoEI7qYu0xDogY5g6iHu7x0kmW1wcAvLdXw/k1?=
 =?us-ascii?Q?QhDU02FvoK/h4JIM8YVEonhU3Ap6raG+e9vkWALG3qyYTFYBZxUk/GCVuJie?=
 =?us-ascii?Q?b0jv1lslHI17kuN0iRkaMQuf4DH3+ye7u+turhHSquRzZZYUhGAxnjXLAv+d?=
 =?us-ascii?Q?2P2yN7wZFx0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:53.3433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d432965f-7437-4699-50ad-08dd464ad2c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125

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



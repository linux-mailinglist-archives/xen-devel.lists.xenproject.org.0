Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6392CE53
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 11:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756675.1165377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTm7-0005Co-Fs; Wed, 10 Jul 2024 09:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756675.1165377; Wed, 10 Jul 2024 09:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRTm7-0005Ad-Bn; Wed, 10 Jul 2024 09:38:11 +0000
Received: by outflank-mailman (input) for mailman id 756675;
 Wed, 10 Jul 2024 09:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drOD=OK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sRTm5-0003T0-SW
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 09:38:09 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:2408::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf2a40d-3ea0-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 11:38:07 +0200 (CEST)
Received: from MW2PR2101CA0027.namprd21.prod.outlook.com (2603:10b6:302:1::40)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Wed, 10 Jul
 2024 09:38:03 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::9a) by MW2PR2101CA0027.outlook.office365.com
 (2603:10b6:302:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.11 via Frontend
 Transport; Wed, 10 Jul 2024 09:38:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 09:38:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 04:38:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 04:38:01 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 10 Jul 2024 04:38:00 -0500
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
X-Inumbo-ID: 1cf2a40d-3ea0-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loZDxAxO1eMQD+6g2ZnSPEG1TYehSx0G7lcSDzizhzs+BgHdfj0KtbXnLYGaT9ww1ZxUhDmDYRn1U/MdrToHGc0QzRjfcJYTuGm5V5T/nQ19WKrXUY+NtdLoJ6Q2CyxzCoEYJIOSyzcwyvhF1qh7FuLra9mnlpIyWvKOYtZRKvxEbV+XzxUJ5ZYW2twwSxJEDXoUZMt4Sb4YBQPUwYqA8pxX03Bm7zEReP/4tSiZFt1FydwY90tZjtribv2rPwxGKkSZZ0LwLuooZ6p37mqirnMijcCh8NydusWIXMoA3RmIz6ESEHXIkFDIsLJU4rWdUpmfVr34ZfDlOTDOdVTlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nu466F27GBCKOIfte4vaJfFLdDQKHsp54cfXurZ5O8=;
 b=Er5QBO0e8JIgPGV+wVP0UOp2rVqt5PvA6NXJ74RsXJs3hp6MKZabLBvkbym0cotbv/DEVf6a/obN2DHQ3fB0y3N/MzMFpgZYOEycXo+Da8lkQdz2EsiUXY07Ubpm4Jv2pYFKYea1R6ACdn77Up/XhIlU4Rxs+OMMwdl7iCBzMpw639syWJaOXyfn7G7tepTrk0PGZykec3egWbvXyRs7guQ7gS5CF/IkCrDVVmlquGA8ufucrPPywUJ/c9TQZKVRZ9B/C4zZnjWAZmQGw4c//Y/CE2lLIQbH9+aLd/Is6TZvX3Gt/36PenD/aylhP+HSE/vip7XAnoAo+JUndr/XdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nu466F27GBCKOIfte4vaJfFLdDQKHsp54cfXurZ5O8=;
 b=ejnF0rLwdJYdQVaWm5O2Ir9q6ZnhZpehbK1crD9TFpy+91t04nzn6mVGoNLUu1R3re7bm+5OSzqecj4ErvRlsgDAk97c52VMGkxN/+TYb0KdHCJwxyqJozh6W0l2PaBtS44EGYZ3JPoeLRRgky0Q9GxPNccYiJobIzeq93kf8+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 v2] automation: Use a different ImageBuilder repository URL
Date: Wed, 10 Jul 2024 11:37:51 +0200
Message-ID: <20240710093751.25154-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|PH8PR12MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7d8c9e-0450-4aa8-d9c6-08dca0c3fec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6OBO/McF07D20mHt8JqEkRHLUnnZj0bYn7JRDUUqq0tFRi1K+i1kpubmo4pu?=
 =?us-ascii?Q?EXMg7ee5sjMfV8xj7NlGl7OyO9HsYEQgcl/ugi3YH6eWYNgEgOum6HDDuhVu?=
 =?us-ascii?Q?7/ErNYZhKqRqo3GUC+fr1EfEpZtM7cs6Puwsf4y9ZqOxgNCpmRvPHF3Fv5hM?=
 =?us-ascii?Q?ksvvQEDe9s7xrVlVUJ3+ueT6fqMnHy9PHfQ4s1qrBk2FqoDABaD7yB8R5VDn?=
 =?us-ascii?Q?33vuiXUdlpNGX7Kr3jNoZrE2/9S4sslPeHRYLlvkUvTPd6C7uzYG0rKyj9az?=
 =?us-ascii?Q?9MV2Sn3Sl/GNYFyKwvHHXdVkGoglLSKHodSboSlTOyQgeLJ1OP7EDbZZee/K?=
 =?us-ascii?Q?HJixZXZJw6YOL36RYLnIX/6y+OXY9LGflTnemE29dDo/70dwogajPNTfFqN+?=
 =?us-ascii?Q?mjKhMIHDo0OHw014ijc0w9RhsxK+grDvgMH4Ye+eP61AMwEUZi+KXpzTjz1X?=
 =?us-ascii?Q?95VS9iJIj2LtIv4UeadE4xueKacLPH0kEdj+rwTsza4NvkjVfPacqTpLjJIw?=
 =?us-ascii?Q?SmYTm6QhogvBXIdPDelJfWb6GOmrO+843FOIlnoWvPBogTC2DW62aN0XEWbw?=
 =?us-ascii?Q?awfQ40DB4zi33pwC91/8bEGDjZXnm1Ln50wRBodMKVxZ1NdG3WCOVZmsZN+x?=
 =?us-ascii?Q?gKNOu00Hvwz4QLUgtsn58XhBl+wTmwbT/lyRkSvZTwYLcBE/QBtlEIoytDHf?=
 =?us-ascii?Q?D9GmPpyBVDQRICvoh0zL4Dq0JgaYEsoo1XzeFpPel+29ea9EYWncWURhBhJP?=
 =?us-ascii?Q?vGYBy/QpzW3/EqkKv/vcA9UWBu8gkl6zLOfSLwJY/zkV8VqTMGwA8UfcNyHk?=
 =?us-ascii?Q?qhtqIBmDDRQHgV9ionQiR2UE8HMmNbAl5CwYCHbHj4jD1CslF2NYGXjAyKl/?=
 =?us-ascii?Q?dJ3rCLzzGeCaNuWQ8clcJXKyUobC/2uWt3Ri8kWUbedafRwzVeZ1vOww09YZ?=
 =?us-ascii?Q?zlBQhOy5RhDxoJVuC+UBLLcNQBFepFqHQn5CmCeWVMX4V6pAUntViIlYTJzU?=
 =?us-ascii?Q?CaMJfkaJWY591LNBxOfcLBICths27zM6pbFkL5RM6ryiVh4I1T2oMEpgcZ1N?=
 =?us-ascii?Q?MjthUbessGd3KeAR6knh+EReJ0CdLiyIyMHsyuJaBqyRdlamiqeaSdbQKQ4z?=
 =?us-ascii?Q?bXU9duWZco8EIFOXeB7reUy3fMm7O2RmJoi0g5Ja/KvALVa70SPv/ZCHHw2T?=
 =?us-ascii?Q?ubCJsp7PcdLxNoUav4bfbQd5KvP56P3ZVKBbPHRy6aeVCFJ3yrWybEiCDSCI?=
 =?us-ascii?Q?tt6VQDp6AlNyoRFkdj6jXM8fjIDk7RQWbR9Ai+3fPGZxJqYUuW8tsgiYDFSq?=
 =?us-ascii?Q?mYFHbIiZDTmYJJK7ZgV8VNDZ2T4P7NpH78U38g5EBd3ZVCVZuQg79pMe/M1z?=
 =?us-ascii?Q?l8HJP0q3R8HYwYPvO+TUZr520Ol0o04rao2AZsF/UJI81vS/HA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 09:38:02.9867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7d8c9e-0450-4aa8-d9c6-08dca0c3fec4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111

Switch to using https://gitlab.com/xen-project/imagebuilder.git which
should be considered official ImageBuilder repo.

Take the opportunity to truncate the git history when cloning using
--depth 1.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
 - truncate history when cloning
---
 automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index d91648905669..31c05cc840e5 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -73,7 +73,7 @@ UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > config
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 rm -f ${serial_log}
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e0bb37af3610..352963a741ce 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -87,7 +87,7 @@ LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 1e2b939aadf7..c027c8c5c823 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -125,7 +125,7 @@ if [[ "${test_variant}" == "without-dom0" ]]; then
 fi
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 # Run the test
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 292c38a56147..15258692d58c 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -198,7 +198,7 @@ NUM_CPUPOOLS=1' >> binaries/config
 fi
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index a667e0412c92..b08c2d44fb4f 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -45,7 +45,7 @@ UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 # Run the test
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 4a071c6ef148..666411d6a065 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -122,7 +122,7 @@ if [[ "${test_variant}" == "gem-passthrough" ]]; then
 fi
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
 
 # restart the board
-- 
2.25.1



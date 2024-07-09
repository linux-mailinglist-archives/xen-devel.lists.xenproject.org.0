Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C303992B949
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 14:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756241.1164785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9qg-0006Og-E4; Tue, 09 Jul 2024 12:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756241.1164785; Tue, 09 Jul 2024 12:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9qg-0006Ma-Ad; Tue, 09 Jul 2024 12:21:34 +0000
Received: by outflank-mailman (input) for mailman id 756241;
 Tue, 09 Jul 2024 12:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q52q=OJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sR9qe-0006MU-8r
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 12:21:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c499d2dd-3ded-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 14:21:29 +0200 (CEST)
Received: from SA9PR13CA0078.namprd13.prod.outlook.com (2603:10b6:806:23::23)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 12:21:26 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::86) by SA9PR13CA0078.outlook.office365.com
 (2603:10b6:806:23::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19 via Frontend
 Transport; Tue, 9 Jul 2024 12:21:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 12:21:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 07:21:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 07:21:24 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 9 Jul 2024 07:21:23 -0500
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
X-Inumbo-ID: c499d2dd-3ded-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQf5pg2RsMQ4xeh4p7PAhnU97NjdubcyP5Ymh2NUapZsApKXGMOcA7Ia6jsCtKnN8pcjlceQ2Ew1Sr2cPlNS57R/RmgORdRVLCAjmxB+efQIq1nzvZTrlSIlybujqGa3hBCes9kKLPnQMvsqBxBzPEqQo235CnJOGEZQGEcbYFyYncs0oV9/bYzHWdZ0v3E+CY+C8m54+BPHQJhkSEsszFbasVU7h1UKHUD5EdEku5RJyNyjiOfFYqhgdoNTV7mgbFcsmsvxhOPypVFUxIqxWX92k2VMq1aogsAAnPrBZOdlTx8C28cEkVLX1rxLjU8/e5fbjpOFhi+lTS/Ok5jp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSPIfzwGNJX9cV8n4c4vAotsL0TGycWT9xwxmaklVSo=;
 b=Zon31/1tNVZ5sEpbyFVu1cCnyErDszxVNbAc31nvSJKhT2WM+yAjx1BGju5cbTaPvU9hSCvF943kyjty38Qu9b9hZV42XCo/xVjMZfkV7QGlbIMEJxeRL7AQ0QGJgPBUA1UpDAvdEy1tLNWUmHGhydyuoL3J536FDrWEcxcUEynLoDhpgLKabyLUTCuaDJjCX/8EXH3l2QHaBapdClCnLus6KCQfDKchzMfb5EbVtE2zT/j9XbrAWeylSxcSlbhhL3sVanZ4MOWxM4TfrMW/4dW97vEJTv3bm17eVtpHZxcO506SdfdmrNyVmraj8j5W+xsWfGjZH/UnqXBwsCMvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSPIfzwGNJX9cV8n4c4vAotsL0TGycWT9xwxmaklVSo=;
 b=HuvxnLkgSxACugGpqlfD3WAmrChFiL4hvW1xRVf5eKUbmVZ1JxPhsnGCOS/TpUe2r5j+Sh/M/lSnOuwbNDyYJGhvl7N3Zrq9bfZjZQYOkYJjqgTtKK3x8ZBT4jK4p8Va12+GDDOuopL/UvHII2U3fb/qpnio2TcDfvUt7mEvaT4=
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
Subject: [PATCH for-4.20] automation: Use a different ImageBuilder repository URL
Date: Tue, 9 Jul 2024 14:21:17 +0200
Message-ID: <20240709122117.48051-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a15cae-e611-4af7-4fb5-08dca011a6de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uXmAkYxkp1OqTZDpipjyYDc/RrxZXHYFGR0/cN6EcCmSF20OdV4cegjlbVHU?=
 =?us-ascii?Q?BzxkI/TeI1Y4B5t95uhWTBKkCdwKW4uG37iw1/awLnhMhorfOn8gYGtIkSHr?=
 =?us-ascii?Q?0tCZoqU45HiH4oNJ52Nf1BviO2jk/L9eCqDq1EXzEqo3CUnaVw1U3itW9YF2?=
 =?us-ascii?Q?wEQx/hjFeV8qDcdf/GzZ0aF+SMnyD+4Old8VGCJJAQpzVGBUoGoYwdD5yeB2?=
 =?us-ascii?Q?UCohApUJKbTgLEZzY483QDxdN5Xd61ORH5JnAOARXFrEID4FQq5uL5ybpfJr?=
 =?us-ascii?Q?Fya9zT+6g4RTjc3UzTbFM6q5fHxVkjhOSLULiudUJt2ZyI/6kal/viKJgE2W?=
 =?us-ascii?Q?MmE0dZ0/oLJ7ENSXMNeSqRQbzJ15WUripCuRiGzd20hHEVUvgkoBdnIiKweA?=
 =?us-ascii?Q?Ns0ZQzBIXmPscjwFfFaKRFyRRsgiI2na0U6do8s4S2cjQ7HiWQz/WOsNKjP2?=
 =?us-ascii?Q?2dkMDd69AVVJ7SbYP3YP3YOnjBR/H9CKuLAfpH2vO98jeuXHU+MJ+mkD2hiL?=
 =?us-ascii?Q?pCManl9+J8rQiKdJMgZRhnZFgVobcT5B3AP86B4g+d86U/cKQ3BQaPEqKt/3?=
 =?us-ascii?Q?25oQ250yekYKRdzzDYkWVjGjB9UhSKV3fadiboS6uZzohLyC2W3oMuJu50Gy?=
 =?us-ascii?Q?kJnMCSxN9e4m4oZA8ma+l2M5/DTSPF/O/X6BZtPZOyQs+lqwFk2XxPEKQB4A?=
 =?us-ascii?Q?b2qa9sj8zc0N0alvJSPQ2ioUGl/4lztNvpxGtZ65r8KerDlkWvbFrOFodTXY?=
 =?us-ascii?Q?37rmJE03L1ziNTg1LCjs8L8NidCeUfqu54MDaFHvAuUarhCJX18W2+1MPTI0?=
 =?us-ascii?Q?jYDB6HEeSrP41xtDBiDtuVpveEtlH1oyB4pg6+ajBU7d9dCGlA+76wXtSl3U?=
 =?us-ascii?Q?w25iPqSxNILfsWwO4KQF7xxYzcTyaxRRqCttD+H9OqxaYK40fO69Pu11bO4P?=
 =?us-ascii?Q?eMyPJIcNCNCfFcYXXNQarsgKUx7/HNs6KxfVt4GfuHZ4OkXeI68yIlvCbxSY?=
 =?us-ascii?Q?PdOJYmjhK6chYN+bRV543lkfal2gHv992mj7bPkv4oTrkqJvKRNCxopbe7os?=
 =?us-ascii?Q?BPFU87uUl41lj6ZvsEUjWOoVg1XiKmINSwba1byHg26oB8CgKJAaoCLTVM1K?=
 =?us-ascii?Q?v/kTXjaxv4CA+DvTXCeMEAMSrwh1W1Ukj0PIaRFFLMTz2/rHaor0YiDdPtj+?=
 =?us-ascii?Q?v/YagdXgyXP18vu+CHZUFPbmteTm+ST4XFgWAMrWlNogD/2N33cRRnps0whZ?=
 =?us-ascii?Q?cHid/87bkJhUtoIFJHwhNvSXXqA27FnLvizUG5KajiQyl+d+hShhxeuEHxyX?=
 =?us-ascii?Q?9MdfU1+U5H6AofJw4waKgZ1HPKhHfI2j5gZbWWv4wILOl0alDv+nW0RBEp1p?=
 =?us-ascii?Q?GIHWhQ1I/32nWMWsnbmyLxKxsMAKzNmYWRO2u2hw2tgXDZAQbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 12:21:25.3305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a15cae-e611-4af7-4fb5-08dca011a6de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230

Switch to using https://gitlab.com/xen-project/imagebuilder.git which
should be considered official ImageBuilder repo.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh     | 2 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index d91648905669..5b62e3f691f1 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -73,7 +73,7 @@ UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > config
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 rm -f ${serial_log}
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e0bb37af3610..ca59bdec1b2b 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -87,7 +87,7 @@ LOAD_CMD="tftpb"
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 1e2b939aadf7..11804cbd729f 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -125,7 +125,7 @@ if [[ "${test_variant}" == "without-dom0" ]]; then
 fi
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 # Run the test
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 292c38a56147..4b548d1f8e54 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -198,7 +198,7 @@ NUM_CPUPOOLS=1' >> binaries/config
 fi
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index a667e0412c92..59f926d35fb9 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -45,7 +45,7 @@ UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"' > binaries/config
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 # Run the test
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 4a071c6ef148..e3f7648d5031 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -122,7 +122,7 @@ if [[ "${test_variant}" == "gem-passthrough" ]]; then
 fi
 
 rm -rf imagebuilder
-git clone https://gitlab.com/ViryaOS/imagebuilder
+git clone https://gitlab.com/xen-project/imagebuilder.git
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
 
 # restart the board
-- 
2.25.1



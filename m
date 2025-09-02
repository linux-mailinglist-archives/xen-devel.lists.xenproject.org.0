Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C91B3F6CD
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 09:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105761.1456602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLdl-00035X-C6; Tue, 02 Sep 2025 07:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105761.1456602; Tue, 02 Sep 2025 07:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLdl-000341-8d; Tue, 02 Sep 2025 07:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1105761;
 Tue, 02 Sep 2025 07:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvP2=3N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1utLdj-00033u-SP
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 07:41:15 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2417::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3313329a-87d0-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 09:41:13 +0200 (CEST)
Received: from BN8PR15CA0004.namprd15.prod.outlook.com (2603:10b6:408:c0::17)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:41:08 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:c0:cafe::8b) by BN8PR15CA0004.outlook.office365.com
 (2603:10b6:408:c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 07:41:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:41:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:41:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:41:06 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 2 Sep 2025 02:41:05 -0500
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
X-Inumbo-ID: 3313329a-87d0-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGMIEeRLYO/GHDqLPMVvbJuD1RB+7Ytxh7d9kstaQSU0bzyenNy2vf7HnzrvebJYpVUS9Wp1SFijvYzO+cdGb/7Hj2kYYpzsKq0a2ZyRiptoEN/3Iu1SXw9h/1jz1n345fMBg53iXz2Jzfi+y4lPqS4aUVBHcjJTDLH4en1IYIpaepcc37FPpNnfP5UecVy14qn8TaQzE5xssK2PubX87bYJ18sxhuqaF9xXZyagliVAJWpJAscfJ3VCOJczGTiSnisveaPSOugcagspX7oUns4heCjy5/Ug0bP/NouQ+YSGElHNGeBjpd8frLDU+wL/YozbH2/a1X9yuvR22Efyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PypRkw6gaVGzZSLokYgt0zMAdxYAKVqWEWSnmDuouAI=;
 b=elRvcw5GtNQZRkOKSV0JUgFGG1hpN3AkJ9zT2f+3MOuBLNP/xOfNfRJy3Xd7A29TNprNSX7nI9qe6tIAh1vAf2R569aIJtjemL68HIcZtNWPFabsL0CuiCQ6Ex/d8VAm/ENdZCYeJviwm6qk0Eft0jAtjMuCOirQCioQO9xQ3AMLKbqlV0VC8g7AWpm8vFplnlReIj2pYHmOL9gyYYDwj+hjkoOjlP+g1Tqdvs7Zxc76nnXvYt6Cq0GPvPQgS1AL4esTHogGZFoyiFSjlRnO7C2XLzvuT18EmOzkC8Xv9RKEOgevay61/OBcftFMOBTmrboGT+cdJE8qJ9u10gQVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PypRkw6gaVGzZSLokYgt0zMAdxYAKVqWEWSnmDuouAI=;
 b=WdbjlZElnKY9BvAw6Ni09JlfowTZOlmbkOxWOqHFpd31hkcXEusQIo33AjJprfhDn+TGhHoh2+0MSWJj1HfyxEKCCn2tiffzw9yXmGKcdLoFamvxNFURRMt9HMt93eIfuJJFko3zF7ur4HQI/j1t1l85YXgJxnj6FGKMMoI4PIM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86: Fix AMD_SVM and INTEL_VMX dependency
Date: Tue, 2 Sep 2025 09:40:48 +0200
Message-ID: <20250902074048.12094-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5c893c-84f4-4df4-9c91-08dde9f41475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?40O+Evd8WffvRm8r7nIP+4hOmqpI8gVWyWPpVeHCKrdSjeTFXBKNgYPKaaan?=
 =?us-ascii?Q?zSHQz83VN71zgnXEj5AjM4jPERxWzzpD1DeJP9I8c9RYuoa39cK7AD6PSs2v?=
 =?us-ascii?Q?S68cNT+oPiwnAQR3A3JEQTgKM8HtEo+IWLsdEkYldcLgc84DYUGBJqV7RWcx?=
 =?us-ascii?Q?PnYK0VaUXPl/YMueVYKJUxsloPzp2kip+gSB+LA+OYskgrbkVkkHVTQwc84n?=
 =?us-ascii?Q?Qky/JduyCLy70NvVb2rW345BNY/xP74Rv/Y6mu/aGyM3SUVU9bHbXRc9WWLc?=
 =?us-ascii?Q?jFla5MO1kAR69RZdZPMpE8dD0M1RbK5JGpoOKIWEYX4QXsQ66hAu2oMSbcZ4?=
 =?us-ascii?Q?/B4eVIOO8HRPvFFaXDBbIe+k1tgTF+Yf1oe53oBAGXV1/PBlDUwKhFannGc3?=
 =?us-ascii?Q?I72Vf8XgnhghKHz6adESqL2t7TFGknwI+SsUypU99UA5p8JJ/EoHE/h8WFax?=
 =?us-ascii?Q?HwiXCmDgeUxdt5v5l3L+9Y/UyWRgzYNcGNBI6S3O9xpid0SL1SrbFQgW8wqT?=
 =?us-ascii?Q?Ayl71T2tYxN/CX33ZBTT+SdTYjsppYSAjlLIffwUsc2IKpIXXYkfWdEuZ0ek?=
 =?us-ascii?Q?r8n7fGybHH+8C5dxfxeOaWfF59q4fQe6MxI5p3lFrQDh8k14rtUzopYftGAv?=
 =?us-ascii?Q?n76qrmpwukTkYStylEPu0CEh/yAysyxPwlWg/3wNifvG9iI7sRWIjdQReM7S?=
 =?us-ascii?Q?DtYE9zblxAPtnGhuwlBV+M4Me6wjgN/l6Yawtt3uu2WAURaWz54ahvMVndbu?=
 =?us-ascii?Q?l5ZQpgqRIGSsuok9nUEeaD91OzD7Rr+zbUeohymT6L18vJg2qcz4ADW4PplK?=
 =?us-ascii?Q?qDy+gVkiIhwQePzB1joU7zaxHXLTZNPLcSw785XqilxH/pI2DvojCGuuJ8gh?=
 =?us-ascii?Q?IvYHG2oU4Rhtnl3dA2zBu5pHbXQ0gNXE3ziUc7i/E5oLhHW1DkHPkHTNU02g?=
 =?us-ascii?Q?3WUMd2pe9ghnBuY/20KTC4zPYSZqUtlsZpnhTQ869e5oWA5K7lLasKO6dfba?=
 =?us-ascii?Q?zFiGGjKIX2i/bB82ecahCTHYlPSQFZfRhXJ2JR9w4Kygotdo1uBMBrJyo2aJ?=
 =?us-ascii?Q?Ar/0BRRTrdln0RaGH4fHWfjXQ4l2HwQ53WMNlst7fNjz3ZMJYnPIjgVtqqub?=
 =?us-ascii?Q?lz4RRrdCsE4eWk4LQ5UHkvkwayNjMSc8WYnN++gH8ijqaQYVxKGOT9Rd73+M?=
 =?us-ascii?Q?pAK71n0EoIJYXSGboNBLHnTApvN/ZWhk2fv3zvWaedUsEvZkZIjyEVXqCU+g?=
 =?us-ascii?Q?P1i1pXanFAC0g+AoiQRJCJubM3puDzrdIE9IjNnpl8Gbu/KhUVOGzr5dXEBk?=
 =?us-ascii?Q?GFCQn8qStMtpfm3lYWfynW+xCxw+vQodNwAeSCH33qMlIoiLyjLbXy/gacud?=
 =?us-ascii?Q?wFP1czs6L4Hi0lHgrafpsL6XhmbAmKJDMIXAM6PEneihDmZ+L9iIwQS8JRFG?=
 =?us-ascii?Q?omb9h70neV+etVSFXEXqVigl/dvZfsXZSV0tGALdEthFvEKO0nyWyN6JPfWc?=
 =?us-ascii?Q?R3WJD6dEuwanNPkHz/U4y6q50H2suZnms4J/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:41:08.0581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5c893c-84f4-4df4-9c91-08dde9f41475
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655

Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
INTEL_VMX on INTEL. This dependency was reflected using 'if' next to a
prompt which is incorrect as it that deals only with the visibility of the
given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
when INTEL is disabled (option is hidden). Fix it while keeping the
possibility of e.g. enabling INTEL_VMX when INTEL is disabled.

Fixes: e3ed540f2e9f ("x86/hvm: add HVM-specific Kconfig")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - change default instead (Jan)
---
 xen/arch/x86/hvm/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index b903764bda0d..5cb9f2904255 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -16,8 +16,8 @@ menuconfig HVM
 if HVM
 
 config AMD_SVM
-	bool "AMD-V" if AMD && EXPERT
-	default y
+	bool "AMD-V" if EXPERT
+	default AMD
 	help
 	  Enables virtual machine extensions on platforms that implement the
 	  AMD Virtualization Technology (AMD-V).
@@ -25,8 +25,8 @@ config AMD_SVM
 	  If in doubt, say Y.
 
 config INTEL_VMX
-	bool "Intel VT-x" if INTEL && EXPERT
-	default y
+	bool "Intel VT-x" if EXPERT
+	default INTEL
 	select ARCH_VCPU_IOREQ_COMPLETION
 	help
 	  Enables virtual machine extensions on platforms that implement the
-- 
2.43.0



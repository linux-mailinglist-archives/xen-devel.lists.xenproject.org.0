Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F3A559F8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904236.1312183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJu7-0000Bm-Nq; Thu, 06 Mar 2025 22:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904236.1312183; Thu, 06 Mar 2025 22:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJu7-0008UM-Ht; Thu, 06 Mar 2025 22:41:23 +0000
Received: by outflank-mailman (input) for mailman id 904236;
 Thu, 06 Mar 2025 22:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKO-0000St-54
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4453e15-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:21 +0100 (CET)
Received: from BN8PR15CA0008.namprd15.prod.outlook.com (2603:10b6:408:c0::21)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:04:17 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:c0:cafe::c2) by BN8PR15CA0008.outlook.office365.com
 (2603:10b6:408:c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Thu,
 6 Mar 2025 22:04:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:15 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:14 -0600
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
X-Inumbo-ID: f4453e15-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAUBJVD7RE3GQRpISjcpcpUmMapB8vP/xvawGwV1MDNiklPa8nxvmGF5OF97PyOy1glynVGiSz4QXF57Sb+p6c9heDo9Gz6U+QEpLoEvf8GwUHXenDqiOTkS1ARwC76lAaWjda6f1yYrXjDE2w3+/yQzBFOTZZFgLzk3DNHVtEULrXfISOadGRavAR5Uxq6T0IQ+wlM8tE6LOOc9rndK7fYnVMyliNTHktDE2FHJjWSZGHtxr8ojGxlSZiiDD4Q4iLwaZOKzsUtlfEVrAV9In8EWVmyaoIgPsms5b9g879SoyU2EOoqaxaXMnxA7wr2YCV8jB7PYL0TvK/oIlJG94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUhXI5hfUJRz8vEpwnsKqvXWD86IJzc1qF1Le5xsGbI=;
 b=ZM/aZLqWgpKdlNIQWHC7c5Pbhm+Bita2a1OfAYig7QWP4lsTxl2Opr0/bo0966dFhrNMlS+1T5IR4LYY1ZKPIw3TAQ6KoEcF2pvhIQ88p0EgMnlJMrR3fyrACKPlJXuSrTJ01PXYZiUDzB9HZnfkNUKDeLN4f5L0vXctd/OhbRZGupPhqW0qZRkyw5toUYLtilVf4IJMbzsbYQV6v+YhHx2a7veG5ImhHJmz6eNlNV9kO87bUlFdmIb0cn9jQsD1O2R0WfjDyR6u2ak/TKkVC+mhrotU0soMqmrENfu2XcyJ2Ca/0AdmQWPqbQ2NzBiQFG8Qmpolhj3ifvIAZxLBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUhXI5hfUJRz8vEpwnsKqvXWD86IJzc1qF1Le5xsGbI=;
 b=T/bYlYz1ntyt3Kt/SjOChpgLOO72bW4g4ojsRzBpp4Ql57O2S2IbS5tJ1ybPcTiq36ZXcUXzDaxX4IvrrK2YDNpFZQI8Re3enFoTIwPfBRu1uDY8kC9MmAQj1twBLjchdNvE443WdCbYibz6yrDTpmp5agdCWIPfxiC4idO75NY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 23/23] DO NOT COMMIT: automation: updated imagebuilder
Date: Thu, 6 Mar 2025 17:03:43 -0500
Message-ID: <20250306220343.203047-24-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|PH7PR12MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 58325df1-fbbb-47f8-e5b3-08dd5cfad5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0P6avvlLzlPZ2dnNAx4o/kKSXpf1r1CQZxOhUDTBpNza/C19r4q9TTD6t/K7?=
 =?us-ascii?Q?+NGFgDqlasbusCXjRdnEo9mcDESTwZ6cJowuh9b2a3rw/z+evgkuCrNlwsWC?=
 =?us-ascii?Q?cw2tT9oZhMYMaMu4XMhQNj9S5s0Tzc8afi9zINr2EEk3VA1ZDVYBDcROaKRv?=
 =?us-ascii?Q?nBeb1RMd/Qo+OntiAwvqejDaCbShZ2XXYL/RzSmyQyGJ7RCvss/zNI9PdsV2?=
 =?us-ascii?Q?IVUerCSCvOhNpN0hNF94E+NYS6U+f3C5Eb0L7NtKzl8FLdibSx1J5bcDm/17?=
 =?us-ascii?Q?GIT+++DlEeFKEKjUyGi0OYIOilhbNqnt9Hdg3DtZwGXNsxU0i0/k9ObWZEVc?=
 =?us-ascii?Q?NhzyTPoimE36IpfeKeqsbzLaIMIen1vFXboXVhFYbnaER/Vb7mA4lJHiIH2p?=
 =?us-ascii?Q?0HX/Bbk/NU2880aza641d0lOti3Yecneh+lbFCCzJ6R1iYdB3CKJ5HnDRj58?=
 =?us-ascii?Q?4SwWE/8XnDBz3SD4YbmynMonQgtZdUNL7Iz5Ozss4yofcXegOKTUp0OC8dXE?=
 =?us-ascii?Q?bqotL+bNa70/lXMSULkEkSLSpojhfTXmNy/nr89NfKBLf2py9Y/UwwVoeSYi?=
 =?us-ascii?Q?ROeFWoYgeLJZAPthJ3SIusnX7JFy5dgSzHpAyCxpxFk2gfoxY0fD8/9G5Z4s?=
 =?us-ascii?Q?muckb3/v7QFWCtScIzMXJ2DLmds6Kxg0wtU/mSceJBmcZGkQEs1BbWlDaSUG?=
 =?us-ascii?Q?0LqUiGKP/EUx4K+l2tspSm5zNsEEhjLE+64jZBl33/UCHdH0LxxAoWGQhws+?=
 =?us-ascii?Q?4YyFsnbcQjMD7SWNTni57bAatwko/9lrwmYNjGSrb2JjYwwOkWzZqzonU6Mh?=
 =?us-ascii?Q?Va61Pwpl5UvOCd6zMh9TUP0fwegwgOo8QcAY1wL96fhLE79drli25G4kdqCU?=
 =?us-ascii?Q?KM8VWfJW8y2rRKqVI6eSjnyK3YbGtS3WZ9fVUvbJ13h7FWV5/sVCxWCCXno8?=
 =?us-ascii?Q?2se+kIDCO+1ESXZWFhiJmK5lZc1ik/gSb7sBG5nLu8po33WxtBc7rOh7t/Xc?=
 =?us-ascii?Q?Fza/wZccryVXMAnrl/mA7UP+agY+mVgACBYMfvyLCbL0MVHjOZwtkaw9y6nw?=
 =?us-ascii?Q?WgTBxiNoARO7XPZDRZrSON+wNgLNdK3HB8AwAj4v3IAeTcNDBg1AndFHTELI?=
 =?us-ascii?Q?uJefsRA8YqBJMzpDyKIm3yhwkPCdyka0ci6jE2+uYfRJkyYfDh+KyOLDTwH/?=
 =?us-ascii?Q?c+JnCvIVElXaOwxAbgdf70XYeGOarr7gqgSomGp9BCGGbEfkzrNVFqx/A+Rc?=
 =?us-ascii?Q?AgMLhOOFvDSNUIYH0vwkGQmpkk5lOTk4Vy/LPHf23XGFdemDB8SpGbEBy27z?=
 =?us-ascii?Q?O4l/FVBGjhpZPwhM9fMsK6LEcrnF9v+6Y0bAldqaATWtS80LPVHRpYnrzqjd?=
 =?us-ascii?Q?SETbgtxkx6FmgvCl1Lzfp9xFUKhOepSz7Ign4GjZlr2L0nvEIm8S/ydNQbaF?=
 =?us-ascii?Q?EMteiJdgGmOOqYDpRl7AdSvMKIThPT8EBWNwV2OB9cL1/fJ+cvWpMLgP/3CN?=
 =?us-ascii?Q?rUDG9TnHe3joLjY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:15.7447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58325df1-fbbb-47f8-e5b3-08dd5cfad5f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126

Temp commit to update imagebuilder repo for domain capabilities.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 39614720a4..26493ecd88 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -250,7 +250,7 @@ NUM_CPUPOOLS=1' >> binaries/config
 fi
 
 rm -rf imagebuilder
-git clone --depth 1 https://gitlab.com/xen-project/imagebuilder.git
+git clone --depth 1 https://gitlab.com/jandryuk-amd/imagebuilder.git -b dom0less-caps
 bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
 
 
-- 
2.48.1



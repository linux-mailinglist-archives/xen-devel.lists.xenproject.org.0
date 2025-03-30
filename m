Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E07A75BA8
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 20:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931677.1333889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0l-0005G0-FY; Sun, 30 Mar 2025 18:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931677.1333889; Sun, 30 Mar 2025 18:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0l-0005Ca-Aq; Sun, 30 Mar 2025 18:03:55 +0000
Received: by outflank-mailman (input) for mailman id 931677;
 Sun, 30 Mar 2025 18:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bHYC=WR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tyx0j-0004t7-KB
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 18:03:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55a84312-0d91-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 20:03:52 +0200 (CEST)
Received: from DS7PR03CA0267.namprd03.prod.outlook.com (2603:10b6:5:3b3::32)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 18:03:47 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::fc) by DS7PR03CA0267.outlook.office365.com
 (2603:10b6:5:3b3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.47 via Frontend Transport; Sun,
 30 Mar 2025 18:03:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sun, 30 Mar 2025 18:03:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:46 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Sun, 30 Mar 2025 13:03:45 -0500
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
X-Inumbo-ID: 55a84312-0d91-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqvniTc+AaRaTIAev9/N7QpGWClP+QYflNGXcYQGR63wg/V/D2ld0pqH7O0Tp5GJqGEhQgUqMtNggvDp2jFFknJO0hh8PutxaZcKYpjizKwpAtqN0e/HWDgbm5TL4sPC6ghr6/nLiBK5v23T5qihEOaLAfVYWzu57DFvbiOXZpZcPR7Aj/qmKjLZM9KWfdevCHsZX7U4GLyI2vhrnNQGu6QSuWM5DPFL2n5UegPcJSnjtNakw2g4URNzTCY4SJulqjPYdPzIIZeEK3mKo0S+RoUa+ON+NQeFRgtnLL5wKYJPai4QrCjop5AW2S+dtJwroNBg7sArwdt/7Tdq6NWvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tw4vQmhwXk5rZi4zLUAovAZaiFWCQqbg/If8Nb8ytW0=;
 b=IUA9RoIJotfA6VLXyR5Ox1fYZC0pb8xz6Ij+G3jsGnipHpy6uXNTrTJbtoyDAgilJhVhOCQiD4NElQ+TmBu2tF0g/Jp313UnzGRCKwCiLHA0mQyt4N8U1WTvSfXtxk987sNErQYTGaXFTtx1M3tAG7I6hzEKEzcaP9LdKNyFsl1N0GxfNmlvqaGyfSDOcmr3yigUlZH1dvrOM0TAaL6I2yskPOsJX7L5oFes6Z98X4GRlHewnxngse62RVkP5O79aT4Xd6KKL0OtYCosa3k0yq2PYwjmEnFrVcczXGbCkblZgkfF9s7Ku4iAo7sWqZ8asRa08bf3I5UbI2DNwiwaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tw4vQmhwXk5rZi4zLUAovAZaiFWCQqbg/If8Nb8ytW0=;
 b=xMcSo9CEVkgAYBeq0QbwNDqNX//guxQEDcMd3D/TGqK6diZfa3yilavgYKoGA39RmCOyRz2J+RN+G397TvUUkjo2f/sMJ4st6I0ToVIsJY/zeD99wq1dRMDLP9TIF8papxrsoKTaf65S44X6sRHFpp8f+kSMfrzou/C9Vq0yD28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 4/5] xen/arm32: Allow ARM_PA_BITS_40 only if !MPU
Date: Sun, 30 Mar 2025 19:03:07 +0100
Message-ID: <20250330180308.2551195-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f766f5-1af0-41eb-ffc0-08dd6fb537ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gWeIVktA5KcZWgzQHCjH9be00iEH0qkYUZdwjb7PTNAJMpJ2mwwuoUV2zAhw?=
 =?us-ascii?Q?vQ9Iky7a+9AqbuYY3c1bT8uY7YIJy2+daln2oR+TJx+wU69vJSpoYH7stmpN?=
 =?us-ascii?Q?dngrNZPOBtmfXcDhJm89XzMPkEkh9QCqAw0sFo+b3o0b/nNdRkzG5AIsl5KB?=
 =?us-ascii?Q?hfLzefUFOH3ZnC9izb0fuKzMwaIn+CzCIir6wSwyLk3Knl7B1Twhv+gsfW7E?=
 =?us-ascii?Q?yWzry9OjWobozK+D/1EUDz3oxUrxC2371o1VF229E0ekhFJNLpTL1CsILZuF?=
 =?us-ascii?Q?b3lj/Bt42yXpwSDMgKHYEJ3d3wjnIHMCAHUgURBhfMUCzhYeT3bIn2ejLLwl?=
 =?us-ascii?Q?OvdfzCrz7WmAfjC2W9CCH15YlasCNlLghNjagzjyRxTOxSDY8arc4jFgUy/x?=
 =?us-ascii?Q?vFUeTpUPl7vCXP4grT+DvupokE830cQFJRnspKT4F/J5iveIqWk/+NAxiRCu?=
 =?us-ascii?Q?y/zQyiEI6o1PmzwK3Zslh7WKyIGpW/HmxCbc0AMsIDrrPGr0RwItReUc61Te?=
 =?us-ascii?Q?I7VX3es9Wg733fXhiubOJA8rVFNRBkgnmMp+zgH0uYD2KGh6x06kvPsM5b9y?=
 =?us-ascii?Q?GzwlOGS8ASAgnXb+yjx98+4cWyd7ks4t4qsPsj5c78IiuYrukqX6s5HsFEI+?=
 =?us-ascii?Q?eZP2hDPn5hLbDhFjiwN94zbkBQvNglVukUyaUffgvyit9NLnxqI6fM3FUVOn?=
 =?us-ascii?Q?FsKRYpnEPuXmf2AwluO/F5Fio3mO7/Jy4AHzhzBUAXaZxqch4FiEWOzNhzn9?=
 =?us-ascii?Q?ztSnXyld/qRHa8aHQJA3EqKHTqGjbfEK7cCZKqbo/91X4ZTQuq66D0Wf0qk5?=
 =?us-ascii?Q?Z9er3mkm3QrollRFmwFCFbS+1ZkPMkDBv0FzNstwDeI63OdoqIibagl8L6m+?=
 =?us-ascii?Q?4RPtOIlgu9sr0+DOvW6eLcsC8gQe4vyJxe5zQ1CmUcWYSdMF4+38lXUQupc4?=
 =?us-ascii?Q?AnR7SQRhmzqeDzClIY4Bn90ujBEd/PEDm5M8sc5lOG82TWg3TNNYLuUwDPJS?=
 =?us-ascii?Q?UyLQAQ+dOBVnD+x5vbojOlCs8YeyVFlJtLNopG0EVaFukKa3ieNmrDbX15bb?=
 =?us-ascii?Q?2LUFQhYQx7X2gYgrlv9+0z5CMK3Ak/d0eByF7sWTyIo+HJ+fzh/3Zci4sRYQ?=
 =?us-ascii?Q?j777TrGrkexYb2e1R2xJyBk2MwJ2cXDrxobbdnvzqcc2hdxfGLZwlaBKcenh?=
 =?us-ascii?Q?dco0ADd1vcgP7TNBK+fkI4wZAbSafhoAmYAdQqNnPImmD6CDXnMRSyzaQXjo?=
 =?us-ascii?Q?JYJE2N9ONVFUKYMokkrTiBetKKaa1h2z0RHz5WJIjcmxJerSq8brycUk+XB+?=
 =?us-ascii?Q?b2MGPQCx984/epFvlH6bNQDTUmgsmdXQ6Zyg+kxRZJS+5aEjA6nSFLVYXpBY?=
 =?us-ascii?Q?wWMqeHOGp6ad2BTJcZc16qpP8UwCn0/rEezp2O72+9Cbih1xjddhM/MpnGYM?=
 =?us-ascii?Q?9iejb8UIYleoHiQ3vNgwHg/4st3o0UyS7NYPo8C/WSthq+klovuXKk3+6ged?=
 =?us-ascii?Q?cmE+OWcEIFIImlA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 18:03:47.3649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f766f5-1af0-41eb-ffc0-08dd6fb537ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542

From: Michal Orzel <michal.orzel@amd.com>

ArmV8-R AArch32 does not support LPAE. The reason being PMSAv8-32
supports 32-bit physical address only.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from 

v1 - 1. New patch.

v2 - 1. No changes

 xen/arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a4af0b85f1..565f288331 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -58,7 +58,7 @@ config ARM_PA_BITS_32
 
 config ARM_PA_BITS_40
 	bool "40-bit"
-	depends on ARM_32
+	depends on ARM_32 && !MPU
 endchoice
 
 config PADDR_BITS
-- 
2.25.1



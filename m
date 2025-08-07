Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58DB1DC9C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073412.1436245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4gZ-0007iZ-1C; Thu, 07 Aug 2025 17:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073412.1436245; Thu, 07 Aug 2025 17:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk4gY-0007gA-Uf; Thu, 07 Aug 2025 17:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1073412;
 Thu, 07 Aug 2025 17:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uc=2T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uk4gY-0007g2-AL
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:45:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5708508f-73b6-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 19:45:45 +0200 (CEST)
Received: from MW4PR03CA0180.namprd03.prod.outlook.com (2603:10b6:303:8d::35)
 by CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 17:45:40 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::14) by MW4PR03CA0180.outlook.office365.com
 (2603:10b6:303:8d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Thu,
 7 Aug 2025 17:45:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 17:45:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 12:45:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 12:45:38 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Aug 2025 12:45:37 -0500
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
X-Inumbo-ID: 5708508f-73b6-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrWBqLOmLt1AvMuybeJLDM81LMm7Ho2zvJ+e1yxMdWO2w3brFVEir0qOvnr3c78d/JEPRrk1p8r7k6JeB/WorwMUIDI7jYKmwwsp/3T06KjZfxwLp9mDbRwHan/LyCjwMNUMdsl+bKQzx9L6rJE3aRGj0qNxTAgKhiNPBgUWbLEXwEytDheSjI5P5w3La1VLlTgAcssYaG9KdcSTSsNn8dEr6K4U7pN10d8ItTVNrJy8eQb6o5Sg5HzfpwJZRbT7Nk1+8omoBg6LU5GE7vcft3sxjQWq+Xv3/fJYBGb9uObGZmYaf7RRuBwJ8lGZ/5EHFD4A+AduUKCrvhDheFZypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViRN9/MbwbgAKy455kGDx2MnZnuG0OZMSNBYgyjNvI4=;
 b=Fe5GKlQqWKXPj9YgSTx177++KNX7L3ZBu4xwDE8ImYVPHsewMHLb9Obl9a6IvkN0kBIsymNz6neFp3sUtQy98Cj5GtKmeoHbh2OKUwF0FyDZX5C/BOhcRBD3PZ4oA7iBwbKId8NlUXSAk/+K6OdY1Z3MBPbgHJNvikbih/zdKrDGlcC+ZLaOh+U935C3F3vRojmovcT/FjGTWJn14mCx0pO1kdFij+zhdATJckVwuQZE6zqmsNhiAPm0qlADiKWq1pO02Q8wr970OOpZG3dCp1kYziN4iLM4cB2k6WhuXU7W/emFqYd3CFiXN7grkW5NSDHJ/uAkGpufEqQXsjS2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViRN9/MbwbgAKy455kGDx2MnZnuG0OZMSNBYgyjNvI4=;
 b=08b5db288A8uoaNdoEQB6JPFQz+eY8BDwqcyI4e2sDq6o8RDJXU6yVMKA9it/Ef7Zj60XRNtN+Ot3PXd9hFSRBRFoaI/22+B4XD13uaQg/MP9fJWnLxXE08wrp8LDSY887Ja/RcxIdjQS/23JVjQh3f9BOkFqQ1ARHhX3j+MJSM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/2] R52 MPU support (for "Third series for R82 MPU")
Date: Thu, 7 Aug 2025 18:45:27 +0100
Message-ID: <20250807174529.595577-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|CH3PR12MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff0b281-180e-48ba-bcdb-08ddd5da3945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oy0jk0U+FDIGEui6oELbcsfFGUhW77tfevs/6cJJHLNyVXgIN/nHcsaXQoj4?=
 =?us-ascii?Q?FsYsYy86JV+G2UrJGdSb+1AAzJWXo7X3pSD8zpMMjeTFOjAfHB3y6bcoabCa?=
 =?us-ascii?Q?TCeMi6nz+rhjTZ9D6H+AiXVXKCu+yrptBiH9VN6h9g4j1r4gUPoAoUCJ06sL?=
 =?us-ascii?Q?3juehHBjEQAiGer1Ej3gCA3QuU3fCmZ7HMlw6rPP+8nT8jtm0GpdIkhlcQbC?=
 =?us-ascii?Q?r+ms7oL6Dqxzuahzuz+PUiBvILHibEu4Iix799BmHPxFHmW/ALJymY9yHtd1?=
 =?us-ascii?Q?h8ePFQARKUdRTP8LPvp5aGC58xOxRkWc5GjrbVK7at6dDYfSYaopMNG5lZHV?=
 =?us-ascii?Q?bYYMcXB1f3FdnF8gBKFroaOT+ziSLYyEzfHlYRu1+N/OawfpK7fhSua4pl+a?=
 =?us-ascii?Q?C/ehOUHuD+1lY9uV810lArXSpcI8dWz1Iw6rl1bxs8iaHtMS5Tig58I9yGAB?=
 =?us-ascii?Q?Dj5kIXLAbX25CWuLBqRgXLrsNxQRyIxrcfwq+JiPpvacAoi3nYE9PaPVppGd?=
 =?us-ascii?Q?VDKy1k7FTHd9xLolMsH3xsL9lY+4/JXmpXscllK8EpBifISQScFxHL8GONWA?=
 =?us-ascii?Q?UwtAdzIh7GvV9BGiI+U+nfMIoGrxblq3s14EUH/Xgae4RmwSEzcduwl5DVhV?=
 =?us-ascii?Q?aCbaW0ANErQU705RxrWZStqRR8F0gDTz2L93ZOEd+U6wmnjDDfl4evKlCHD7?=
 =?us-ascii?Q?r2ab59AtPiESbYlp2rbuqzknvB/bHTBBeyC5A8gQH6NsBtYP/Mf75PkvK99j?=
 =?us-ascii?Q?gYJDXpoZhj+jd8vyhAfXQNBCbwJzxKfZswcq3Adr28kaS7r1WKNQd2YZ29HE?=
 =?us-ascii?Q?GErIvuy4ANGolYVppLTRYRBAGhgdr6b4DPlAuzes5CJE7agoOIHc80A4uCeR?=
 =?us-ascii?Q?XyQ91AGI+fz82OgkKCCI3fGQnnSRAn5sPlWkvhE6Ud3DFUX8H/xECo3BkgLs?=
 =?us-ascii?Q?wcgtJEFWiLpxAUcj5ci1vep8SmTrk7FqKSlK1VrNLrLnugyVdcOn3qJU9t6p?=
 =?us-ascii?Q?PNeMXGs5Xkcu321v9JMUASJFrc8x6lOgFO9gB4+Uu/lmRx1CFUxJgSNr4wB4?=
 =?us-ascii?Q?/bBhnC4IVkbPF4M1dOhEvIiGQQ1YtpTF20nnZUs1wRilAkMfPM5x+5Hw8BH4?=
 =?us-ascii?Q?m28H3xmeZBg41AtTPTg/wOEgwzW6pxaP5aoc/eHDC4V1BoKIIh/iHoZOhXpm?=
 =?us-ascii?Q?AU5PrtehHJ68g8NNF+kujihBhJgMRJMi3wCdK/l1I8kQtRtCpSncHiiO+wUU?=
 =?us-ascii?Q?0kzyuau7Lp+eeB7NQrl2FQqz3QCFDpFGFHWUQRyw8yRl1ctNty6IPDlAmR7P?=
 =?us-ascii?Q?GvVFF4u5oUP3JKnfYiG2uWqYSuKe+gzLRk7EVivfB08eKReKvMzYwHaDr43X?=
 =?us-ascii?Q?yfgFliQFX+qpk0Fh+YkuEziF/VcVpGszIQMaU6LUmrpDyKmhXa552qtHj2b7?=
 =?us-ascii?Q?DDTlqPu3Gw113UybmlR27nW+WbgjgOL2wS8ZinVmNOk4hWtZtoGA9yydde75?=
 =?us-ascii?Q?dVIQULuEfTSKTaFtsQu1k66PgWJvycBH7mn+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 17:45:39.5595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff0b281-180e-48ba-bcdb-08ddd5da3945
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305

Hi all,

This series is related to
"[PATCH 0/5] Third series for R82 MPU support". There is no build dependency
between the two series.

At the end of these 2 series, R82 and R52 boot till the same point
(approximately).

Kind regards,
Ayan

Ayan Kumar Halder (2):
  arm/mpu: Enable is_xen_heap_page and co for ARM_32
  arm/mpu: Disable map_domain_page for MPU

 xen/arch/arm/Kconfig              |  2 +-
 xen/arch/arm/include/asm/mm.h     |  2 --
 xen/arch/arm/include/asm/mpu/mm.h |  5 ----
 xen/arch/arm/mpu/domain-page.c    | 45 -------------------------------
 4 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 xen/arch/arm/mpu/domain-page.c

-- 
2.25.1



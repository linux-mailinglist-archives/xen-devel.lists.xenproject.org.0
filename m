Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5399988BA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816165.1230357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytmx-00066i-B3; Thu, 10 Oct 2024 14:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816165.1230357; Thu, 10 Oct 2024 14:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytmx-00064R-6b; Thu, 10 Oct 2024 14:05:11 +0000
Received: by outflank-mailman (input) for mailman id 816165;
 Thu, 10 Oct 2024 14:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytmv-00063w-L8
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:05:09 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2414::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a78d3aec-8710-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 16:05:08 +0200 (CEST)
Received: from BYAPR07CA0055.namprd07.prod.outlook.com (2603:10b6:a03:60::32)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:05:04 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::b4) by BYAPR07CA0055.outlook.office365.com
 (2603:10b6:a03:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Thu, 10 Oct 2024 14:05:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:05:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:02 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:05:01 -0500
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
X-Inumbo-ID: a78d3aec-8710-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpBqMK4l3xZ2j/hJmq+48GMWetyBvvrm49ZyvuHKm6CrPO7eMbNvQLR35eoQC3NsH7naqFRZdCwFWkqI9QOxg+7ZOVLYZEwITv399NIJKisgG/DxQ5SasNAFeGmGBiUbhQlotqMp1ckIFTAcJkfuuQPhp/EtPVzIuKCkbRw5OMZxuHoKv+ZJJeMnY2r0Z/EzQ+MOt+/jCPEQrX7qFZ5a3J5Duo3q3SNWqEd6ATrjZO6zjPA5cI1WUnJ+B/8ea6TBMnzXbWlSuXcsMsLjTpG8NAXb7X42ltvu0vpsvZ53z/Aagg5lplBz19g5bgxwYk09e0AHFQZr5TbSwb1KCWIKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTS5053fXyYgQouB1JyqqibqFE9wN/f7atCB/eIP6wc=;
 b=byRIcKvlolCES8F5akyOxLzjz0dsJq0TXHGdbWWnx5bbCJNioLEmUzQ+7UN07EHpetNwE2vs2mqhowPhSKm/NuaOGe1qqcfQeLf+dDvEdeuPKirNJeLQgRdhAdMEuJ6zAozRinkhVFOP7uIPQUVELSCLy2LeeimZ/rcodfqkA/CnSkkjEQHBbteaWn3UW0QdER9frPrbCaBy6+r5v0+Czdka0KmJ23woWWOmLTSoB+KzIjwTqOCUJEGRjtq7hHR9HnkGomSHv4Y41MvROAO9f2HqeFPOsi5AumQz7LOBDDn7yrFyDEepP8t1r1Ml4xs8off1EOXu+lD84NKyGhKJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTS5053fXyYgQouB1JyqqibqFE9wN/f7atCB/eIP6wc=;
 b=vPbEWnXxZE5ccCxTIcKlMqQj7V8CrgGMshWFQciXMnHpz17hPvp/tkILw7Ihs25MiydpLWwoy6WJ20Dm4nRg7nI8wp+JUvtoxUEnFvLBRyFd2Rg9J88l6tYCUYyP1tCYhjFSlKh3XMSY+JxFbNbn/1VdmtNQBNSWvWqUXut97kU=
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
Subject: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it is empty
Date: Thu, 10 Oct 2024 15:03:46 +0100
Message-ID: <20241010140351.309922-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 66456338-bf59-4d11-e413-08dce934895e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q0yFZtAMVMj3pS+ctfs7eUMLxNUCw3aIGuWQiO8oZ04dumzbHECvLQ03zKln?=
 =?us-ascii?Q?eK8zqIuTf3NSU6Xn2EkmhPQoDO08KR11ULSDSepd+Q5prh7Uul4f6m/tQvPy?=
 =?us-ascii?Q?T0h+pftYMnJsROIAEnbIghs63pkTUFMWmVghasBRpz071SCSIeuNoEmdoQY3?=
 =?us-ascii?Q?3FTVqYKkUgmEkpXUnwjZhVdC5VbxbQli0g2rdazmLyP7ka8lL6En1AkdSDhH?=
 =?us-ascii?Q?+D/8CnSsD5W2sfDhfDt2P2r5JDCX9i5wV6Sa87EbmA94+FnSZxtBLCf30ohF?=
 =?us-ascii?Q?5obtE750AqyuJPmxVE026rgjH+LKWUXWGgEV+b3XDxOwJrZFbvL64/HfWBXM?=
 =?us-ascii?Q?zvw60G4qzjszETOfYnoSftWXhEPT6mMQBr8OttLmv/d7aNNL/eRh6zVKqRYz?=
 =?us-ascii?Q?Aa/InT3lpTVjkICfQL4LTbXpX5THi484BHC+jwO2eW2w4m7TRf2NXroUAZTh?=
 =?us-ascii?Q?+irFOwWcTasCEOIj5yR2x5wAquqOjuE6hvybQECDkpiz7DhOT9Dy3IUg2QKq?=
 =?us-ascii?Q?oyLC0Ui4QLM80MNkbgyNsEYsRNWiLzb6AjHeNTQ3gdJC6wUERGzoXKSUfRhB?=
 =?us-ascii?Q?/8r1W5T94H7MTbPY+1C2pMHvUh7ieQE8tDguS8ANqF1wAITliKnF+MhW6/do?=
 =?us-ascii?Q?F6HjJfOEJt6ophikUBfIZa5it9J47bztsPylkaFxkLKxXcKvgrfCRE0DFcSA?=
 =?us-ascii?Q?V+5pi1S/aG2+BzXgpBYtnaf60LiU6kX3X+7nKMJxlFpcaaYxrYLhRNPrRThc?=
 =?us-ascii?Q?wkxk7SAsL3S7sfDb8MrivWavruQd7ZNIWYHc1TbeAhuxtLU5ARM7SsOXqW3G?=
 =?us-ascii?Q?nNiqwdS+wTlr/S7GQ5HpMamvieSiH/dMMAGDvc+z+2zwaKhk8ZhA6Qqa+wjU?=
 =?us-ascii?Q?eFNo9nZjTPursi2jf8USAN9BUzBtZAKZyQCCESjUc+A+7IDZPLJHHrLYzbLx?=
 =?us-ascii?Q?Cge0oeBRYPijc6h5KjIqcnujoraDyjqQCXJHGh8uv1AiS6O2T4mWDPQwlU3G?=
 =?us-ascii?Q?Jwq9DP8PRCQYwz3WsR0Ew1OuE0Z6QT2BxkVcla+K2cxPZlrxy4t4ssvTnriG?=
 =?us-ascii?Q?vfOnK/Rl480lEEWX7v8AqEsMrRo4ETXGMMqHYp60waPhu1Dq7cXhYbDoI9Z5?=
 =?us-ascii?Q?gzOU97eIEo4v1XE0bSRSuj8mpgWgBOqs2YZJ4WmGM038y9W1//MUymuXKTVA?=
 =?us-ascii?Q?vk+0r5tNTjb1UIPNJ7qP1ADA/GqfRewwVGJD1YUthvXvJY2annby6OG9Txm+?=
 =?us-ascii?Q?ye5h24fU7WcV1CvQBwdrlZ3AtpuBRabzQ2WkgP2wiTh2LhYEXFZei8PgpJTe?=
 =?us-ascii?Q?eJwA/jdeWneCj0OGKu/d+beIqNTcWeYhP1MN8FHwmZI561bcMInKO96EkW94?=
 =?us-ascii?Q?MgGVinc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:05:03.0630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66456338-bf59-4d11-e413-08dce934895e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660

If the BSS section is empty, then the function can just return.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1..v2 - New patch introduced in v3. 

 xen/arch/arm/arm64/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 14c3720d80..72c7b24498 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
         PRINT("- Zero BSS -\r\n")
         ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
         ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
+        cmp   x1, x0
+        beq   skip_bss
 
 1:      str   xzr, [x0], #8
         cmp   x0, x1
-- 
2.25.1



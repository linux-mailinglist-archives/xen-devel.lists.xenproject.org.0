Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F1D11F8D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:43:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200013.1516034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFNr-0002lD-Cz; Mon, 12 Jan 2026 10:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200013.1516034; Mon, 12 Jan 2026 10:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFNr-0002iD-AK; Mon, 12 Jan 2026 10:42:51 +0000
Received: by outflank-mailman (input) for mailman id 1200013;
 Mon, 12 Jan 2026 10:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9BL2=7R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfFNp-0002b6-RX
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:42:49 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b37e30e-efa3-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:42:41 +0100 (CET)
Received: from SN6PR2101CA0008.namprd21.prod.outlook.com
 (2603:10b6:805:106::18) by IA1PR12MB8467.namprd12.prod.outlook.com
 (2603:10b6:208:448::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:42:37 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::84) by SN6PR2101CA0008.outlook.office365.com
 (2603:10b6:805:106::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.1 via Frontend Transport; Mon,
 12 Jan 2026 10:42:32 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 10:42:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 04:42:35 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 02:42:35 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 12 Jan 2026 04:42:34 -0600
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
X-Inumbo-ID: 6b37e30e-efa3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQzdDNjHn4M2yxZo4TtBWnH/mLROr1exfxG4prZOL5AHEdXg/sD0DSXo3V1k2pzJnJbV1lIDnVovfSyp84x0+1Afn8xxpMrjCU276432kmxdRajV5HP1imPJuosyIbBxpMsA0O2q2Gx+lC2Szasao+HwzWrl0hXIAVlT04x78KaqDX8plS60KTdGEnB7GeCJaYIlo4Zc/kcsN3Ht8F8EjV9Jjt4TQsrMSrrvRZG2vLtk5Uyv4gXnsBLOtqXID27YYaHzPVH6kQO4aYKNT9kBPTqmYPjYH/hVUwMpJc3yejVJdooA+PnlTwRkxc+J1SbPgAExZpMlLaNWMTN3fUyZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8Z8tMEL18pzb7Go51wP5wIZcdCu9OhODICjfie3kbA=;
 b=BjacwQikCj+5gv97HMeg9TlvmiFB7UbmxfhTwcvKZhhvNGWaS1rR/LaGXi3O5mAKRl/gHdrooJigwJy9o5UVE5cr6I60Q32JIT/zchs6ogjBVIqkkC/rDamJzBlP9Lt5UJNIl6COBq3U6URfGE7K+1FbRZKj5PLx4Ls10qhadlmmivTdw8vQM3ddKZclcI0I0QbpYmLDbxFvhuTFzkRofxWfbt0gGjl/K5ldJH5S2x3hZ/yLV9D4Bj546r8CJtAEv2fq9xd4QxJ4Ho4paqb3P0AyNvUsWbC3T6t5eLP4gUa1xOIwVz0tEgNjcKCxnwVVvaBOuAqFqS1ua4AElXUXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Z8tMEL18pzb7Go51wP5wIZcdCu9OhODICjfie3kbA=;
 b=dXJL4clPVOUO8DjOXl/XZvgGuH7kroFEn9DcFS05BWiTsz5YeJWgYG7eccT4KHsQoDvBHcBcBRdVgjPZ50sc3KgLEQRgnyUGIuLUacZ4dhTH5+alSLS7kvO74hCofpZmL+t4N5DjXojRsz7DDgxjdVyVaQNGpKaAQ5iVYzXm22Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Print correct domid in allocate_memory_11
Date: Mon, 12 Jan 2026 11:42:32 +0100
Message-ID: <20260112104233.86482-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA1PR12MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: 142285ae-a067-42eb-b4dc-08de51c74cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UzLkXOYcAcAY92GP10Bg/F+nImhmzLlhHUJe+alnVBVo+A4byhA07siHWrC1?=
 =?us-ascii?Q?rNC+6I8vzJ1GxRJQaCIPOQ/w3Zyy5007wfZqwLWkdITxydaeEdzkiLIlpiFR?=
 =?us-ascii?Q?omCumx5CbUmG+zUuAkgr+Q15HVi5K7kzLlfBzUyC/ZSTmCOKWYinEPhnkiPQ?=
 =?us-ascii?Q?Gaq388ZniUiq+MWbyEqS+bYC7G9UjpHfZbM5/UMz3HoGn7392r8f11QZ80P2?=
 =?us-ascii?Q?X7HeYixoDxmDKNhOab81NwHqGlBtwp/d0KKqJSki73H/KouoYg0jLh3BmUzf?=
 =?us-ascii?Q?l6yCZW4Jne6pQtX4/C0A5RzS75cJy1QmS6ABMn3I9G8U3QdrY9jeqevQVUeo?=
 =?us-ascii?Q?czRyHtN8kPUsJ1zHRscuzGtC2HdXQG9yNIVvGsFlEHhlTWuPPQTo3/bE58cN?=
 =?us-ascii?Q?9SCy/VRGPiU1Po7EHqpFU7zhHI4Zdip8Pj2tlgzuiqXqQptJRfTi0CcSWoHU?=
 =?us-ascii?Q?+Cszry9GLb2m399rYhYcllDwCFG5+XIZQyMAlnGE0jO2IxNec0Ow65RtTXCl?=
 =?us-ascii?Q?g0EBNVA+dr+UTvhfksKFrlhv9LiMk8FMYh1+AHXCn09WT+n6CuNUGXom8J8w?=
 =?us-ascii?Q?4dKhnHPNdbCUeIHNPWiRULyJglogA2S49qa+5+NbA95tbJ1xrug5B0kdTh9z?=
 =?us-ascii?Q?JddtJIIXL8cJJ0OVsTiR7GcH9JV17qv6lngubY6w4ijbu9pDlQAnKk+xn14h?=
 =?us-ascii?Q?ssiZAW+6FkY12wLuNZHZBGrMaNY/XjjeCs6UPlQX/pBITNpGRTUHOr4220/6?=
 =?us-ascii?Q?xS+w1iAsshH8OAlZIVk22YHGo2LKjawxaazTURGkcNW0mtdJRAxNO24vduW2?=
 =?us-ascii?Q?Oc2T0WrM6+0n5gRj+M5AW+eVBWENiUwTDppdvRxhBHYppzPAQbgC4XiyyTgc?=
 =?us-ascii?Q?NO3D21PqfcHwF8CvDzHQ6UM6MUrT5zSLK/yBfc2jSnegbXOkPimJFkAO/+Un?=
 =?us-ascii?Q?UjHtu6HP5PtoI0wfEl3UxgE+9jqiH6f5l0aVPXvvJuZxFhJijApianHLrTFc?=
 =?us-ascii?Q?NMIV1TJujWFG35SZWTk9VaR8k/pxS4hvhwuc71y9ptoNqXjNf51J2XqyhUeF?=
 =?us-ascii?Q?ZqHxU6hWCFc/YBVk0JNeMq62RfST9lqMsWxQoyg0LfiD53ZFuLHDmLtm7F2p?=
 =?us-ascii?Q?JpM7xOEQPwnIrJIdzNXAx+apLhsDp+1sHESZulhchz7+04kBm7L6m6TPtdPn?=
 =?us-ascii?Q?rpD+Oeuh1kSlUwRE1rp9/Lviy3mchJMmfKhsnLBIyeimxoLIX0mDUC7yss/N?=
 =?us-ascii?Q?UJ2dsTlYO78gXiaAZ6zo0V0SIjikszqKEhUPJW5CDUiMFBUpmUE/8xF/X1/7?=
 =?us-ascii?Q?YqzT7U7ohkiVhzjys2ZzRHoNOZe01kRqLBRCVFLrFMXvk+cVW26mrG+5D2bP?=
 =?us-ascii?Q?+tYu7KqmWOrf/AEGXHmOpP0eyGXezBEePeiDzPrvrrBa/qjAfHuCtGjw9rV7?=
 =?us-ascii?Q?w5oKEYCF4I6yx7dSkR7TuDpWXLThZWwii3w/2ulMraOPfOcWRIr1DZ7Kqa5K?=
 =?us-ascii?Q?+E6/CP5Mq8OTZqNs9rioOIiUCOF4dWZnzOXhUv0xL7+VlLJcyS3fEst4EcxJ?=
 =?us-ascii?Q?IV2cPf386RwmRia/Qg8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:42:36.0026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 142285ae-a067-42eb-b4dc-08de51c74cb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8467

allocate_memory_11() can be called for dom0 and direct-mapped hwdom
domU. In the latter scenario, a log message would still mention dom0
instead of the correct domid.

Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 986a456f171b..e8795745ddc7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -296,9 +296,9 @@ static void __init allocate_memory_11(struct domain *d,
      */
     BUG_ON(!is_domain_direct_mapped(d));
 
-    printk("Allocating 1:1 mappings totalling %ldMB for dom0:\n",
+    printk("Allocating 1:1 mappings totalling %ldMB for %pd:\n",
            /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20));
+           (unsigned long)(kinfo->unassigned_mem >> 20), d);
 
     mem->nr_banks = 0;
 
-- 
2.43.0



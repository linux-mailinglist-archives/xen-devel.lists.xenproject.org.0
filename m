Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552689270F9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 09:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753577.1161770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHIW-00057J-5Q; Thu, 04 Jul 2024 07:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753577.1161770; Thu, 04 Jul 2024 07:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPHIW-00055B-2b; Thu, 04 Jul 2024 07:54:32 +0000
Received: by outflank-mailman (input) for mailman id 753577;
 Thu, 04 Jul 2024 07:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axFx=OE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sPHIT-000555-TQ
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 07:54:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:200a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cecf28-39da-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 09:54:28 +0200 (CEST)
Received: from BL1PR13CA0023.namprd13.prod.outlook.com (2603:10b6:208:256::28)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 07:54:24 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::32) by BL1PR13CA0023.outlook.office365.com
 (2603:10b6:208:256::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.8 via Frontend
 Transport; Thu, 4 Jul 2024 07:54:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 07:54:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Jul
 2024 02:54:22 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 4 Jul 2024 02:54:21 -0500
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
X-Inumbo-ID: a2cecf28-39da-11ef-bbf9-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaDRFcVD2YSMincS0EwP3v0FhY4sn4VMuhaIHoaD7bypT37aHrCL4N+qf3UmgpBLn/ZlWbl4j652jiEMlS3z8F+Z4oRJvrrqT5IgTlPUW/hp3t4pMEWcZHy55hQqWYjAtpdjcEcLJ0amQh4CAw+1D5jWVNyICnlmyl0Z4OX36OW/D0IRfjJICxLOuW69vmYte+nbKbkPCC2TljerpGZT2yauIdp5UDPqACBzH7QtoRcUAn88GH2TiOSsbZv9/1jTRZ4AMqXZjPiUlpbFvLzt/hnVEwOYu9iD9rf3BFUXHHr3nYeOvhR11ifo7IN/sjkVu+qzacHpMlSsgWGfA2ueag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cn0TjFAKHF8HGar+yx4yKFzfxkU7wFq9wqkb/IYEq0o=;
 b=jsrX9pxiAUCkBMsVQKUfLvsF1eqf3BdJgNv99FIjw9eQF4Zv7nniPq+JDQpmEaEcvfWny12nYatjg81QTQp7hpqQK7VjQIi4ssrLZXNd/ZAkEebSJJTP50OOYATTCj7fRO/SKKyOKZ+FOjCBysh3p+fMtowhEwRYlI5gTu5W+ovJ9MkCfX1h7KYmky3UtV5MeeVdA/c9m7m2Pu4+Ir/nW8ma9j8pFyTqLUWoaFr7sGDHw77cubLg1vQSVoxLRrmC/NTnKwnLpAGZ4sCTWby7PCxCOTQZqbgJUMcaKgzbO9KeNpPchJnPd5P7xQ+i9GmhyytYJgfZ2e3qpOkl3AqSWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cn0TjFAKHF8HGar+yx4yKFzfxkU7wFq9wqkb/IYEq0o=;
 b=nSdTPfNn7MuSHNV7A4iN0jE+OnSztP6+WyWatdL/ZMrvizl6uL5Vkt14uELf7xhAIHg9+FH/7e49aQHuNVIjHd/U4hJmquESFtcTmIjKvnqmMEZrdYOal66hUYpgr/Gwngz/B8VBP8TYS1TieUzcFGarM0c5QbpLvQ4RKv+AdH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.20] xen/arm: dom0less: Add #redistributor-regions property to GICv3 node
Date: Thu, 4 Jul 2024 09:54:19 +0200
Message-ID: <20240704075419.34966-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: f350c216-bbb5-40a0-efb5-08dc9bfe84e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PUr3hA9CYk7APx55LE9dCVWZQ+dCaCgEw0NjSn+q0qyKbiB+XA5mtqYmS5dn?=
 =?us-ascii?Q?I3HpPpDv5F1slwqEQnkH168sadGUkV495ky8k76SCixjPfIQ0PPhEorcxzh7?=
 =?us-ascii?Q?GEgqWmzVIvBfxrXelohnIu+aEgG+rQMg7jbJ5StwTyWav1/7dGXtXAu5+f1a?=
 =?us-ascii?Q?5DPZ0CD/5CYlGc24Qcp7J2m3wnB8KFIbsFVpBACkEPVdWKMEF7DqvUxzSalh?=
 =?us-ascii?Q?dXYqrZTBbN7lPvEtOk1QWu+O7vJa/pzIx7Xq/yAiH0+FvqJypFZ/QwRONH7g?=
 =?us-ascii?Q?o0qIPmmmQ3BaWAD9R+T66Gdr26eGdMTFGQIZIYrQuiLpaE80f9c2DaUULOIQ?=
 =?us-ascii?Q?POtqaO4SYO6JCiu02l/TEDjqfjP6PJ8uxy6BuEgrwGuzvxEeYGfcJXKjqwE2?=
 =?us-ascii?Q?95bfxqAr9sXGmUuRh31EPEEYHOzaX7amGeLP+P2K7VdVd7fK2a1L8HfA6CFQ?=
 =?us-ascii?Q?9Ahhiomo5O6B7fkJLGDiZb2UA3TWFUIARnz3vdwqUY8cGal+QSu5RKEGQkZx?=
 =?us-ascii?Q?YVCF7JYJ7jgrJehQN1PnP51dYFGMX5YK9QONe8+m0jVkxPCwyXTUt9mW6Bv0?=
 =?us-ascii?Q?OKkN3+kQM4F73oQJFjgqo2guanuDKwZOBZsV+Y/DKnJMH4HQeN9WuVg0aKen?=
 =?us-ascii?Q?OZwcnQzh8YyKx741sPOZTvx4A1AtTi9w4h9pAJzT0cX6WbcwvolbFVvPnIhu?=
 =?us-ascii?Q?RLDXg46NVbi5ak46sCWYkLYBWV6t4bkaYrBrKOIKdTgFbdQn93F/1VlkANx2?=
 =?us-ascii?Q?2PtNS5l/5KIw3PO6x2Q2CYbgwqyPW2ouhyRZJR4uywHS1TNGvdZDGNphaR0Y?=
 =?us-ascii?Q?1Y71OkNQ19sDYuyKlJ0Er4qG3XK1P7MZwspA2uVYKcKeJmPrMsesYQr/BLkk?=
 =?us-ascii?Q?CfReoSquLCLrTKhbqackaVxgX1ISljOKmV7eZ70V0v+lyoKz5YkgCwFK4+45?=
 =?us-ascii?Q?ebRDTzOt4u/m0lkIvqPcdpLiMCMoGSfy3M0eI7ogin+DeRLELIvtpZ1zOhQH?=
 =?us-ascii?Q?D6tSHdn/ivaiuCQ1wFQLrysVWC9ArBGeCSIaf9gdK90Xggd2MhDlVFfP5oVd?=
 =?us-ascii?Q?/BepZXoW5otFrKfRQTHurinqTzcyyv7h58p51xTZpNEMCQWURDJ5ywC+vXr8?=
 =?us-ascii?Q?/yj3+GXzzJ55wqArIRYBongMxUz3z1LAueQjCHYBrufSicb3gplxwXP+RLNa?=
 =?us-ascii?Q?qvvomIAStA0mVOPSW5jLFSMohF45+qjiBAmC+DQSDOzDT4bS6VRVVMKp08oY?=
 =?us-ascii?Q?u8ekmihSpNiDdWWApvePFbwd6I+bWilSidilkB2yrprvGeYDj9TDuBV2lioe?=
 =?us-ascii?Q?gAS+30ISNzVuyOJMDuUYpRCmam3twafEHKWhF2+J48K8C10KqVQxiH4iYo4K?=
 =?us-ascii?Q?YbjrLdpilNReAskvOsp2JAO7q2iAeJuSgPJJuPFr+uJrAz+h3y1wVyhOeBqa?=
 =?us-ascii?Q?Dho5uuaaY31BfPOpOledcyspWXWeup0x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 07:54:23.2555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f350c216-bbb5-40a0-efb5-08dc9bfe84e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825

Dom0less domain using host memory layout may use more than one
re-distributor region (d->arch.vgic.nr_regions > 1). In that case Xen
will add them in a "reg" property of a GICv3 domU node. Guest needs to
know how many regions to search for, and therefore the GICv3 dt binding
[1] specifies that "#redistributor-regions" property is required if more
than one redistributor region is present. However, Xen does not add this
property which makes guest believe, there is just one such region. This
can lead to guest boot failure when doing GIC SMP initialization. Fix it
by adding this property, which matches what we do for hwdom.

[1] Linux: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Fixes: 4809f9ec7d71 ("xen/arm: if direct-map domain use native addresses for GICv3")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Tested with Qemu 8.2, virt machine with nr cpus > 123 which requires to use a
second redistributor region.
---
 xen/arch/arm/dom0less-build.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f919d3acf976..09b65e44aed3 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -176,6 +176,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
+    res = fdt_property_cell(fdt, "#redistributor-regions",
+                            d->arch.vgic.nr_regions);
+    if ( res )
+        return res;
+
     /* reg specifies all re-distributors and Distributor. */
     len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
           (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
-- 
2.25.1



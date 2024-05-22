Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED678CC94A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 01:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727922.1132643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwq-00025e-7G; Wed, 22 May 2024 23:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727922.1132643; Wed, 22 May 2024 23:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9uwq-00022H-3m; Wed, 22 May 2024 23:00:40 +0000
Received: by outflank-mailman (input) for mailman id 727922;
 Wed, 22 May 2024 23:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=31Ro=MZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s9uwo-0007HJ-Uu
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 23:00:38 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18087c7d-188f-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 01:00:38 +0200 (CEST)
Received: from DM6PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:100::34)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 23:00:31 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::59) by DM6PR03CA0057.outlook.office365.com
 (2603:10b6:5:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 23:00:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 23:00:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:00:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 18:00:30 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 18:00:23 -0500
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
X-Inumbo-ID: 18087c7d-188f-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd2Ybzmvg/1MIYTk7SOkvkxrXKIFu4+2/cgqFm2VEqs/WTypJ+XGibpbbeoFzTVLCUtaCbbICcEmm0l2V45kOYn3saYaWG+MQAFMcIgvrHRom8ZY98QXG3+CV9ES1dyvqYBy5mpUzfTvf3Wuxui7bLmKy0g2sQRWdgQmJjWO2ruGpef96OYVAcUGtxx2Nhib55HKDM5u3wkH9XmntzEKQkQcMp87CGrwY1SszGRmqh1IlZERfCEkaWjjeVf6Jh0jN9OkY6M1XnxgpBdMRdu7gRQc59sKwRM/qzlyJSxDvQp+TFhm7Uv8HwPrY9tVVAWGfUG5bNDjRxJrjLDXSmdJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg1lIYFsxCkrbMSdoPQQCZQ7ozFKfKSY7zA6PHJCXCc=;
 b=Ei4v0t+5iSUYlVRq4f0kyy5WD+V7a2sl6gJrvwnVSW+je3AGLIkbIbYnzJ/qRidXf+8ETA9R2dUibX81jsyyrWtJzyVUoNYQrUTjU+z+hecz30XWA5d0AShgVeIYkkkpN3rWSNsIJ+Oy4KJkg9I1nWqwZEZVhby4G9Jjo3YDywHJ+ewDDOCHe7eihqc14AGksxoz9WwZwJeprjJKxgetNcbB+/w67SgqQjhy2GBeSSQ219riyjTDvAE2WOoMND8itqJ8rI/tzb39fFhCNviryHBKlJArNkI/UFJlRUNnOozWQVMxXuU3VhFkaL/d9bNGk/yOOpIWcoUcBzKynyF4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg1lIYFsxCkrbMSdoPQQCZQ7ozFKfKSY7zA6PHJCXCc=;
 b=tlY1/bVaMY4/LpD5YxM+o85FZB1KQroOYHN/F3Bq7bi6WhPtwspq++/Cr3FSJP0anZWmjhxRZRcbaB7w3iabJHDkCJFd4KqeBcChiOPqO8zSKZpsvsGE2ZwOY71t8WVYuhw3UFON6w13FratC0+n+QVO19pU9NGm18tGf1r4eCw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v16 5/5] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Wed, 22 May 2024 18:59:24 -0400
Message-ID: <20240522225927.77398-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522225927.77398-1-stewart.hildebrand@amd.com>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 3400ac04-c933-4df0-d5d3-08dc7ab2fafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TLhkC9k/W5n731QommvrKtoFE5n2rWV9SKXCaE6U3kQE/0LjRzWJy2Wy+DYm?=
 =?us-ascii?Q?kfnHEhe5g6m/9h5rpeI9jesP+07czC74A/ruFqHrVcRQX7G0Ovb3mwooVg67?=
 =?us-ascii?Q?UbbbGHN11eQBgpH2ju3QM3l61xoXsqxNzdULEkEBtDHTj9JirczEdNHbvTuG?=
 =?us-ascii?Q?pakw53v3D21X1J921dZCpybK9QmSyZwov2+FA59zCCOZJ3SDXdg1ffa+QHo3?=
 =?us-ascii?Q?uGJqzF9O/aUEsBdcBHHEeVPzjp/yfpIOVoWmSqLHudN5UiQVYRQ9BAtDQAY5?=
 =?us-ascii?Q?T7k4EuOG24gSUqUqQ8jBn1UJX5bWSyYzGuOsOUnwQ+M38aSF87gI11fVnESv?=
 =?us-ascii?Q?mgnuiGV9+MMNkVrayt+eDcsmpYHTvHUTPlaunNoOnDU9rGZLo6T1+6F0rt4G?=
 =?us-ascii?Q?yOk4DLz0gDh2bzKVvLrMNnsQajhrWbF0QKhUdqZNvaKa1Eeb5WWiuFJSAtWJ?=
 =?us-ascii?Q?GqKpxxeigLSaR76mPZmH0cHGukHp+CUzfWyqTjqmzijZwxQStjW71EMHVePZ?=
 =?us-ascii?Q?a1aIgjutX05G/OPsxYUZs9O0YdC3D7OYMN0aJdA+FMGhfBuV9i+0Cn91ICzF?=
 =?us-ascii?Q?b2ZAUbHFAiE6j77OsUtI/ex3rvIiog2blcsLuAecvho79XQv1QugGuVsAgzd?=
 =?us-ascii?Q?1LRmqHr59MDu4YeIJnm1sa4cFPv6MJDrAsUQNax8viXtWg5UaX5YTbQKxSto?=
 =?us-ascii?Q?oA7AH4Z5H8ny/gok3gzZmyYaWCcWEQ2dMeMNSmLyglXevlVkXoNrEj+UZ2Es?=
 =?us-ascii?Q?LTF8solADg6tmtr5/NtoF3z65rRNv7o5p5ZwXORiUVucroU034h2i6+Z2O0v?=
 =?us-ascii?Q?gc7ayVVbBbeGMRlF/+76VVbKTbWghVowyZsL7ANcuidkvlsI/cBwfgjeW8Jv?=
 =?us-ascii?Q?A57+tWgsFKlBwQx9G8ObJ2zVvVAf2eTPuNNmZ5rORi4YaG9yZZQFIMYrv8NN?=
 =?us-ascii?Q?XtYqwuEC9YQCdtHioox6wtcy4Wh5Ka3x7eB+Y6BVPwosu7gEOsLNenqp2JNi?=
 =?us-ascii?Q?vFqWv5MWe/VUgg6hc/v6GBQbNK6pKt2wLwFJT9NJizmabMP7NvJ/ZIsT+/4W?=
 =?us-ascii?Q?Vu55rAP1otbaEItcwLvjYIwCUqge+cuJgRfFnTGyPjEnD9fZ8GDEYFzubBMI?=
 =?us-ascii?Q?LouvOwQPQ5ltR0fi10xlMC3/Jvp2MUKaLKixde4KhzxVtjw+UFFpDikzlp8/?=
 =?us-ascii?Q?sib7aZfWJh2/r6JAEKLjts9EnbNDgL25Z+ieg3LN0yd3E5hB0t1De32Lm4go?=
 =?us-ascii?Q?viXrt0BgL5o9+0zqbTTKaDuWpOSjpLaBq7t++kKRUMp+LmEYxoRxgX87uBuT?=
 =?us-ascii?Q?qwPjTY/bMKHVojk72gqlV5ueO4Pe/mfBnncWMRGWvQMBZatPLN55P9V+IcNQ?=
 =?us-ascii?Q?qVD6i6bEe6HRXyLRkZ6xlprHd7tf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 23:00:31.2602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3400ac04-c933-4df0-d5d3-08dc7ab2fafe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This depends on a constant defined in ("vpci: add initial support for
virtual PCI bus topology"), so cannot be committed without the
dependency.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 516933bebfb3..4779bbfa9be3 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -132,6 +132,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -152,7 +154,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.45.1



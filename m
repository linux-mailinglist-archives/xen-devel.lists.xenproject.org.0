Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D09522D3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 21:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777635.1187771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seK1d-0004oK-HL; Wed, 14 Aug 2024 19:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777635.1187771; Wed, 14 Aug 2024 19:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seK1d-0004lv-Cu; Wed, 14 Aug 2024 19:51:17 +0000
Received: by outflank-mailman (input) for mailman id 777635;
 Wed, 14 Aug 2024 19:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOS0=PN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1seK1b-0004UM-C2
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 19:51:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2416::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d9081b7-5a76-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 21:51:12 +0200 (CEST)
Received: from MW3PR05CA0020.namprd05.prod.outlook.com (2603:10b6:303:2b::25)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 19:51:06 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:2b:cafe::6b) by MW3PR05CA0020.outlook.office365.com
 (2603:10b6:303:2b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15 via Frontend
 Transport; Wed, 14 Aug 2024 19:51:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Wed, 14 Aug 2024 19:51:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 14:51:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 14:51:04 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 14:51:03 -0500
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
X-Inumbo-ID: 8d9081b7-5a76-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0la5UQPm76PK5TA657KnPdmtWCWGuPqv2HH5SnUjf1h5k6sSKN+BZ55onhEkhopR1Kq6qIjt1Re2qFz319NQRomvrb6W2/RVKUsgrvgyUSNnrc0BMlPVnB3zK3ozoSFhl4ICi+QXkdu3ONq1sszvTgPlcY0QFr2CHCDrGBlZHv5/ARScCqcKzvgDKCg+hnuktwqoLDBAhiD2SdEIlPvRxqCsWrTwIfc/ctQjWf8fCkKJP88XIzYSErFIChI1TzedE3WNz90Jf8ENtvZsvjNqXfqPoTPyBwkBGkGaQs8+MbvsMD9e2Yyxq2SYPO+SxvsfmIvmR5DZkICNpnhnzq64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOPcfC2cX70PP2HugDLaOnmeNk4w9wVC9RUQJaISFRw=;
 b=uoz1RtmRFyZgHxUoq4+Geo6AmYkTRyyVdVdtBsUj+8xyVAH5hTaA+TiIsL98v34cvAGz44TZ1P8l7BktAG2Ngbt9KnW/QRxdunaoz3d2Do8OTdtOegD5GP2oxitMeV35qqRiIBbfS+BGZ9F2nVoBOEMX+J+g5lJHm+yDAlT1Vorlr4p75fLE5745Va7GpZwgccehRFkjny/6l1pAdLJP83sr/Ng2sXZ0wQDasX7vXSpQcpC5Zz/UvUN9p2DN9N4UUk9VXXOsueyZqOqKUUV9CbyLDnGx68zUGn0NnSKsQ+avYG9PT8XnIhGGon2YT5axYK5iTtLLgY8l6SugDyqGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOPcfC2cX70PP2HugDLaOnmeNk4w9wVC9RUQJaISFRw=;
 b=2DGrPoUVgMFM/2KzUkBxr9iKsw3XgUWXUzAO6iGifrYo8Qq1jRiHEUkhnLZ9PwOajfkYy/1XtoMbaQfZ82OcnpQSci7eZLo4TUZ/JaR3d9kFFK14zZQ9Rs1e7Y9/l/Jpw7HTm3ttPrfVd2kMBCDKv+Qm4aEPJUMtsQJai6xKhUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v2 4/5] x86/kernel: Move page table macros to header
Date: Wed, 14 Aug 2024 15:50:52 -0400
Message-ID: <20240814195053.5564-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814195053.5564-1-jason.andryuk@amd.com>
References: <20240814195053.5564-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|CY5PR12MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d3049f-b2fe-4b09-3ddb-08dcbc9a6f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fzZe6rDlwFXHQtLVjW4ntm4/xf4q6PcJU1WGpb4zVyUBtLtJpNVVvew6x8rU?=
 =?us-ascii?Q?CPQx5r6hXAIGK4JLlCJKwr48lAOwfWMtUNd3jauikv+c4lji1az7Piqhq7wm?=
 =?us-ascii?Q?80sM2pJOMQGVkgltchumsHaWIod6+eBH+RRs3Pt4PmSdZ3W7isLj3mAGabWc?=
 =?us-ascii?Q?hsSv4mEYXuItsdnWnwY1c9eL8I7pGQ/mGHGWYpFMr6SVAkJs9FLR5qNH15f7?=
 =?us-ascii?Q?9TUak8AtFnZshpb5w1tiULvfTIlI4+MsDd+kJzdYnRLCHHIgG1W/d0bNCIIT?=
 =?us-ascii?Q?mc7geTsVlqhKN7on07FRYwpXYc4HVHm8XsX1sckwj09qHh+g4sOO5xNS9KXi?=
 =?us-ascii?Q?ONcH17EkBCG24zkntbgkwl2LTj1rTadvep05DuvJJF2GjFQswwvZQ5CD4SHW?=
 =?us-ascii?Q?8StgLa+9QgP5eBrH8AhZgns185Og1CbaimId6t8joCY7qTDnXwygiiG0Cf3I?=
 =?us-ascii?Q?1TCrHA3Flig9ZDIlLs90btBvpmEkLy7DaORVYkO1vYHP/ubXM91llnuYpO+u?=
 =?us-ascii?Q?RZBLeJbXsT37NQbzGgy51R7ECRA5CU1DgaGkDxi+k2qPee1SlNh80di3xDdU?=
 =?us-ascii?Q?WWPVsstvpC861xsVm4xbWhijP/XyvNFg2K3Me3rfFnuBikNWBUcbGBKuP9mb?=
 =?us-ascii?Q?XpB7YPEZtV2wJ7lhym34XH8hqhQYgX/Yhyyo4GiIwd688m9hETOOKzZenOqv?=
 =?us-ascii?Q?fMaQ6/NGFKPh2zGQ0iGzMaysYsaN5LV67RAoSa7aYTPzmSnURwWf8ZckT+oI?=
 =?us-ascii?Q?mDnJd4MGJH9fr+7i3i+7EBwj/WgG0WfFQo85o8/5G5OvvN7mqnPl/XjCY5Ja?=
 =?us-ascii?Q?Q+tlj99EpnzhvkNHnx0pPcrzzHLWOAm7FbeP8WXexPA7Mn11nb3kHA2GPqMb?=
 =?us-ascii?Q?1KinMjPrPt4krZZMsx+GXEaAw+SKfdeQlXft5sYYhd/qUe+JaExBoJZCcA/p?=
 =?us-ascii?Q?5Vb6U/3oUmD40q3oDZ0fs+QMAwJOdm7FXMm9knJ9vpP3cvXauu9r3/F+T+3o?=
 =?us-ascii?Q?NIhh6rLWARemGkny6ouGjIFNYvwFM7dNeeyC/Ou99MApIqzH7vPoDqtWUxOE?=
 =?us-ascii?Q?7dmvpVlDKleYzyFyIeLIpmsqJ/2awfKZTjRLWeeLNaNWOR6goRA+big2Vr2M?=
 =?us-ascii?Q?xKcKXo7ZCh2D6W9fNncjVhy6pa2FyoqJb0EdcEtI5B9hmqPnu357f1rH6wHq?=
 =?us-ascii?Q?YDJhPO44VodbvSS+nKXDhOun2ri5IYAzdYZ+r2NGLagR6JqoyNCAiVi3VZwp?=
 =?us-ascii?Q?4mKNft7gs+Mp2ybh+Im0WrIji5vGtz8QKe9Cs3BWaHzHmXX7uz4UvY0Qbz9v?=
 =?us-ascii?Q?KkfAyt2GJSfCdpFQX7rpgzVpvprQtPegpKZtkofs8SVvMdbjnOUrkwUV4pcM?=
 =?us-ascii?Q?2x9BUbfHUfEvoDHMfueqGLuGlU2e2F5zZaEOH0aLYVXQGmu5jHug0t0pBZ9e?=
 =?us-ascii?Q?AmXh4Y5vinOt8jvcp/NEGbsRpSrH3S7cymsOGG0eBD3YX1NtcWloKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:51:05.8505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d3049f-b2fe-4b09-3ddb-08dcbc9a6f70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624

The PVH entry point will need an additional set of prebuild page tables.
Move the macros and defines to pgtable_64.h, so they can be re-used.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use existing pgtable_64.h
s/-/ - / in pud_index()
Did not add Juergen's R-b in case the header movement matters
---
 arch/x86/include/asm/pgtable_64.h | 23 ++++++++++++++++++++++-
 arch/x86/kernel/head_64.S         | 20 --------------------
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index 3c4407271d08..72912b8edfdf 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -271,5 +271,26 @@ static inline bool gup_fast_permitted(unsigned long start, unsigned long end)
 
 #include <asm/pgtable-invert.h>
 
-#endif /* !__ASSEMBLY__ */
+#else /* __ASSEMBLY__ */
+
+#define l4_index(x)	(((x) >> 39) & 511)
+#define pud_index(x)	(((x) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
+
+L4_PAGE_OFFSET = l4_index(__PAGE_OFFSET_BASE_L4)
+L4_START_KERNEL = l4_index(__START_KERNEL_map)
+
+L3_START_KERNEL = pud_index(__START_KERNEL_map)
+
+#define SYM_DATA_START_PAGE_ALIGNED(name)			\
+	SYM_START(name, SYM_L_GLOBAL, .balign PAGE_SIZE)
+
+/* Automate the creation of 1 to 1 mapping pmd entries */
+#define PMDS(START, PERM, COUNT)			\
+	i = 0 ;						\
+	.rept (COUNT) ;					\
+	.quad	(START) + (i << PMD_SHIFT) + (PERM) ;	\
+	i = i + 1 ;					\
+	.endr
+
+#endif /* __ASSEMBLY__ */
 #endif /* _ASM_X86_PGTABLE_64_H */
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 330922b328bf..16752b8dfa89 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -32,13 +32,6 @@
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
  * because we need identity-mapped pages.
  */
-#define l4_index(x)	(((x) >> 39) & 511)
-#define pud_index(x)	(((x) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-
-L4_PAGE_OFFSET = l4_index(__PAGE_OFFSET_BASE_L4)
-L4_START_KERNEL = l4_index(__START_KERNEL_map)
-
-L3_START_KERNEL = pud_index(__START_KERNEL_map)
 
 	__HEAD
 	.code64
@@ -577,9 +570,6 @@ SYM_CODE_START_NOALIGN(vc_no_ghcb)
 SYM_CODE_END(vc_no_ghcb)
 #endif
 
-#define SYM_DATA_START_PAGE_ALIGNED(name)			\
-	SYM_START(name, SYM_L_GLOBAL, .balign PAGE_SIZE)
-
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 /*
  * Each PGD needs to be 8k long and 8k aligned.  We do not
@@ -601,14 +591,6 @@ SYM_CODE_END(vc_no_ghcb)
 #define PTI_USER_PGD_FILL	0
 #endif
 
-/* Automate the creation of 1 to 1 mapping pmd entries */
-#define PMDS(START, PERM, COUNT)			\
-	i = 0 ;						\
-	.rept (COUNT) ;					\
-	.quad	(START) + (i << PMD_SHIFT) + (PERM) ;	\
-	i = i + 1 ;					\
-	.endr
-
 	__INITDATA
 	.balign 4
 
@@ -708,8 +690,6 @@ SYM_DATA_START_PAGE_ALIGNED(level1_fixmap_pgt)
 	.endr
 SYM_DATA_END(level1_fixmap_pgt)
 
-#undef PMDS
-
 	.data
 	.align 16
 
-- 
2.34.1



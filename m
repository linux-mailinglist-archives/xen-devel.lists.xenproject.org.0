Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69F95D61A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782600.1192127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5Y-0002tl-5W; Fri, 23 Aug 2024 19:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782600.1192127; Fri, 23 Aug 2024 19:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5Y-0002rP-27; Fri, 23 Aug 2024 19:36:48 +0000
Received: by outflank-mailman (input) for mailman id 782600;
 Fri, 23 Aug 2024 19:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt9W=PW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sha5X-0002Oa-81
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:36:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2415::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081d9907-6187-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 21:36:46 +0200 (CEST)
Received: from BN9PR03CA0624.namprd03.prod.outlook.com (2603:10b6:408:106::29)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 23 Aug
 2024 19:36:42 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::6f) by BN9PR03CA0624.outlook.office365.com
 (2603:10b6:408:106::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18 via Frontend
 Transport; Fri, 23 Aug 2024 19:36:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 19:36:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 14:36:41 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 14:36:40 -0500
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
X-Inumbo-ID: 081d9907-6187-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3sMVq8VN0eDPtNrm6Y5209AmqJDoEaZnWPVYtlW0agBUGgv6vTxEW5RPrn+G4JtOaFvoyjLQ+QBvZSuTnYE3bXJgKs40/v5g12sbZX1VniIG9Z/eylVwOI9YJ11aHdObwx4uLrtjVDfuaIXR0e6p+XvWtzTT1zu1Dl6iFxQLNLQ0KZgE3RluBWK8NEdn5DRXT7SlDzWqhat/im87jmInZmLPZbitUmZURrhOWeOni0Dwhv5wDE/PU2Oj2a2yo+pSPf18O6Fwy4t5a3B0Bn7BWTR+bdG11kM3sZRTA+MySklJXENQssqIs2vcj77bTJa/fBlMZQhgPeH6jM6ZroqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WNcTBJWFqlSsl7h7qLZb7kjFufC1sLILMFbSKVwKI0=;
 b=sFMohX8S/ImnJ3sw6spbBG4PjYY8gVTWZrsVJyAa0ajT7qbLecV1/OItoQ2OoFFFlfGO3Gow+D5YfD2fQcBSIYyWejKfyNAKA8G/FksM2TpTY6jiw16x8MksEqqVw5MKsno4yOgzmGZMBFdAVMwej3x/D4wB8EobM4quR+6lwdeUsVhb/dEDQFMcjKSt2k/n2pb9NpHSJXj/cQTvXVwqKMlLY7WrQ3ZrgDRkVWIcQSwcR9NXozdyIyoFPtAN+768ASQpuQvx8X/LaO9gZYPa2fzqUvHVYIqbrBOfdQhAhZgCZSwMJW8vPrEEgFaaJ2xdPJX4t5uUUnsCDIwZLmBlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WNcTBJWFqlSsl7h7qLZb7kjFufC1sLILMFbSKVwKI0=;
 b=SuKBJWW2TgJPv/AzenI46xrSKx4hRZkVhavDABFrHESx3llNncuJ6RMZAceYvz3D6Jm1gOTLPzmzPCIfDCrCLnPpo26iax+b7+tFpdfSiEXOztmWzsnQ55FZjBvFILvC9IbOF2XBb2LzR7m0NDnjERFOXxQW8sHtLYxAEDhjmDY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
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
Subject: [PATCH v3 4/5] x86/kernel: Move page table macros to header
Date: Fri, 23 Aug 2024 15:36:29 -0400
Message-ID: <20240823193630.2583107-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823193630.2583107-1-jason.andryuk@amd.com>
References: <20240823193630.2583107-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b003c65-0cc8-4f84-cd82-08dcc3aaea46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FDkRxvEsmk7D7g/8OineGBnboTwpnh3LX7xNXaMrANKqOxE6Ji4PBzHBewAK?=
 =?us-ascii?Q?/jUfg9tKXlgvCzzDjt09xmKeTQ/tc4O9houcL4XpbvS++G/kV9tYJpW7f2rW?=
 =?us-ascii?Q?o1iT/pe7yvhEJvKebrp2dxCHnyAPqOdUgoVT0rWjsSGEM64cStourjuRxVmd?=
 =?us-ascii?Q?VtC6p4pQXzPZn2IuepiXpr+Cy/fulkzscrIXLyYN9WZsO42MLugy1HDv7yjj?=
 =?us-ascii?Q?8uxsu9WHA97FOLyAtgIfz5Vf90dZYoGVcnnatAqsZBGXZ0OzQJv8MB0Gev+7?=
 =?us-ascii?Q?TzUFKACoklyruxxfu3lEvmEUhJZw0ATqAacgnq1Im4oY2Q3wuDCCMBVvl/CB?=
 =?us-ascii?Q?w8UcrE1MBFFBjtTMEyexgYAUVnFY4EVUcizDe9hK+EuIiqOsiq8Nqg+1UAK6?=
 =?us-ascii?Q?mnKidXRphMNeUUqCfu/rXaR85VgYPL+LFKt1eKbPg6UKH0u6iRU8neCuXm34?=
 =?us-ascii?Q?7DNokj/VInOIx+unQAYJLfCb3Ij6iYMoCW20bFr4R/uDH3TfBumFSuYKOX8Q?=
 =?us-ascii?Q?melLKUhN+ACk2bEb5xlZKA70UTLiEo5gP+OfveaMKhBxhdRhdSnJMBOa+Ccy?=
 =?us-ascii?Q?has+emkpcuZQ73RKbMLQelIsnDeeOnwSHasfsv/JYCOXCd14BVbSADE0ABlv?=
 =?us-ascii?Q?GRGZcBFxRcEFzkRWN0KhezO1FSXtbeswhlOMYBv80gidzzqFt7IQOOeN76l+?=
 =?us-ascii?Q?r10BNdAGjscMgeSI7KwInAO3a2QBMu+mC4lyyE03sPwaa3FZk3V5W3+iObnK?=
 =?us-ascii?Q?uC5iR1ti6f8+PA61BardvHEXNTCJzHKCo1tYiH5rXIivDNCQ+DHrQeosoEIb?=
 =?us-ascii?Q?92G/sdBwJ/JNKXENVCRX1nK5W+53stqjlzh6CpbZQuOpTCMF5jft66qoZfG4?=
 =?us-ascii?Q?WUfCfW7m6q4oZRYyFJ1gHmshgeQbV1zBJ9wyjKjXy/lw/3dvWIGz0cpPr7Ym?=
 =?us-ascii?Q?2RRdgcws4hyB1GeTHpJoCNtyxARWVDjm18F1usHAs2QKzagYPyX05Y3626rT?=
 =?us-ascii?Q?VGCJtJPAYhvJ0wXTvokP+lTuiD986dZM2o9i+v+TY2GQ1Htl+hTwpOQVBQ+Q?=
 =?us-ascii?Q?AWfLUCmK7mog9mdspr0NcFM+8ubmnYH5hgOYmQPRmAWq2AcDmXrJF41ZIO+v?=
 =?us-ascii?Q?/99IL+MrA+O/J+DDu0NyECUCsitHmmG9m3bFBx3AN99gB9bfcVHYActJjjk7?=
 =?us-ascii?Q?7CvMxkMFmy6HTSDMSi35W4Bxho/kn1+u8ynHmT/Soy3tPXmY8W5h4SlrDTVl?=
 =?us-ascii?Q?pQD7yMpvWXtr8JYatmgXDZuUN8u/KvUKlFIWb8lzMXxoDaaqbpd9XQRfT848?=
 =?us-ascii?Q?hd+8Y8a+VMXrGBzPAQkhhS0/jqyxPf2LOaw3aAUIkE/5dDsy9UHhkVG50gEP?=
 =?us-ascii?Q?TeyQ3lhH2rovTOnf9JCD0by7zd25EbkJbMK7f0CW/K25a1MUcQCfmNcmD2w+?=
 =?us-ascii?Q?OxWxEWIC2U2anTO7ZukxQ7/Uuv46wLqNfgYC9JMTAng6KhPcyeHJZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:36:42.1508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b003c65-0cc8-4f84-cd82-08dcc3aaea46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089

The PVH entry point will need an additional set of prebuild page tables.
Move the macros and defines to pgtable_64.h, so they can be re-used.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v3:
Add Juergen's R-b

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



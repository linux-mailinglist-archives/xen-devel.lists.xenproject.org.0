Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104A9522D6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 21:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777634.1187761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seK1b-0004Wj-8H; Wed, 14 Aug 2024 19:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777634.1187761; Wed, 14 Aug 2024 19:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seK1b-0004U5-4y; Wed, 14 Aug 2024 19:51:15 +0000
Received: by outflank-mailman (input) for mailman id 777634;
 Wed, 14 Aug 2024 19:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOS0=PN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1seK1Z-0003Wx-03
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 19:51:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2412::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8deaaf9b-5a76-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 21:51:11 +0200 (CEST)
Received: from MW4PR03CA0008.namprd03.prod.outlook.com (2603:10b6:303:8f::13)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 19:51:08 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::4f) by MW4PR03CA0008.outlook.office365.com
 (2603:10b6:303:8f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 19:51:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Wed, 14 Aug 2024 19:51:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 14:51:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 14:51:06 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 14:51:05 -0500
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
X-Inumbo-ID: 8deaaf9b-5a76-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unFpCT3m6Y3JVMv0vah3nxgNKFtwCXVTogf+Vv/R9XT1ZZUug0WqFwSvzfAE3kfDJdWOXOph4jGE+1b2DugxF0ISCebP86cwEGX5M6D2WsB4vetnuDlVhUjY72+1eEXJnK4wpz3CirG8q+er2lU9K7bAQ2+kvTabr2ldvVP3zsc40nzBAH2BiRzwuxBVgpj6poQ1+H0VRSgbSZawg6ueMcecH2vWp+jDYQS1sMh0eOIoNwxhVHQnkK6ayEniGrbjyT2tFBOF99dpGuiaJWF73VhGicL7cKy/S7hTTRfPtEItZxNEtCp6KVIEyRR+poJ+sPDDm27CvIGSDLxend5dyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC/ZgKM1sNnirwUIzOYUrUnoB4T1UGuhE4FPq7nsUVM=;
 b=cFxDRR8j/zRFD3XkRCEHPrL9UZJQC1XgUHI+mzLznLHTxU/mFOLrM/R1B0GKFWDag2TwGuJh263lVXbsnwE0Y/9AKULpkr425efWAFj9JguE7wEWYVXYXS+1OTiulyyoiZAlJ0QEIkVKmTxgajlViGUQQOOTPhKFh9UFl356kPcPamxtzv3t4f7lbUbY8j0jpx/YJGHyaKzmZS+4VhfQX0c22TaYnxTNA/0xJMgQFfglxAMLkCcyOqnMDqIdICvb7dSun7b7wX89Z7OVsS8eueJ3jQGQ8UeeqnWOgtFSrV4Gib/rv5Orr/6JpvkzVcdfWcTLqHOWfZrBex2nGVyroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC/ZgKM1sNnirwUIzOYUrUnoB4T1UGuhE4FPq7nsUVM=;
 b=K/ZOyqyGzBXWcPuvjdEhiU6bwc84Gen2NgSvh1ZXtdMtreiF7cI+8CsA6/dxw9dbH4aOeePPb8qczm/04cYLZIMiVFsmklC+lEBThCtuiFO6Y92WEki/GBG/LWLcZ/x3YQxKz3Y8wkncximqax3zqcsZkswdiBX5FQR/I/s/4LY=
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
Subject: [PATCH v2 5/5] x86/pvh: Add 64bit relocation page tables
Date: Wed, 14 Aug 2024 15:50:53 -0400
Message-ID: <20240814195053.5564-6-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 654818fb-f78b-496e-9fa0-08dcbc9a7095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?izBEj8tOuyf48lDIrwaZjYcEg5WsLVapYQRRyEGh+vLcoMoKahMuLtVNYmGL?=
 =?us-ascii?Q?Pjz4xndpLAieuCjK/9c8o0bCmcVMU8SkentwAE+Z4Nak3el+J9/YicvccF8z?=
 =?us-ascii?Q?/z5tlQNDIf7EGotgb73sfZ/BF9CwxLkG+RVno/NqZu/IizE1d51nVTXe537a?=
 =?us-ascii?Q?NqqbIsWJjXtQqKStJTxyL7CJPSAkfMou2H79M/RAyD7Hpdls5SGjxAzod7p1?=
 =?us-ascii?Q?twJZF8Vc4QsdAOxjrAE1OXTzrUwCfzc5DwJnHEFOhKQS4CHWYs1ASM0eSA9z?=
 =?us-ascii?Q?yEnmOqbqNVx86kh/xxFO2c8tOVU5ky70X+y/lMKz+v7sFv/FOXcodn3D7wuw?=
 =?us-ascii?Q?e3iG1oftRkyRRpau9yphQVgkn3N0Q4HZqPiaWfMMgM1LFAMWbhjf9klLOKeJ?=
 =?us-ascii?Q?uIc+lphxiXOB33oG5om01fnQkhYti1ky+YqVEBwWDoHPZhIuNNhjD+PHh1pP?=
 =?us-ascii?Q?ey0YRh1sUnUP8+dIp9nyH/1werFfCW0lf3JGs9PFp4Os7e1iZ0euPgn2BUgr?=
 =?us-ascii?Q?WA6YnLRNa8Tu+b7ljwxkOtWfDI8/gQhxE6AIFZbzrTjKeFel7n1ySKivo885?=
 =?us-ascii?Q?QRb/nof0JF7YbmvPYw0cH/cmknZmHd7e1tvHL3jM2ZpPOrB9csyhQcuPAS58?=
 =?us-ascii?Q?aFkf1NNnBJ+fsjqVE36boV2kShcT9ef5fPnihpPUFxEdpMSpBbekkqLSuYR5?=
 =?us-ascii?Q?f6CSLTJWTemZZfvMbVaGCeclZzXNnXz/RvW2Ab9Xo3FPIZSgiMvbLn0uKFLu?=
 =?us-ascii?Q?WBEaOpPju0DEmoaI4p2da6jjjBkmi6M3TYdDkbX/+pfzdppGJ8SniOnAJ8H4?=
 =?us-ascii?Q?LyLcPaLe5u2f34AhYMHLePwIaKvu0iJ5iNt/o3Z0txz6gXSL6KV77kpje3Ae?=
 =?us-ascii?Q?HFl8TJ+tj/c96nUzCBD9HIUApsZYzUysqgc20PZOFw914aFRJFfS8rCyaBkd?=
 =?us-ascii?Q?/yzsbR5ZzaxL3C1TPLp8CFYUg8o9fPMz/uftTQ1BsuMR8QUEf6W+DJ5xLjJS?=
 =?us-ascii?Q?0PplwSh6m9zwpA5DfNFbqbv4NRxYMrzzt+mWZiySne9QhdPhmuFFs9pkrgpH?=
 =?us-ascii?Q?5CW/n+oIeJsNUlaqeGg72SBln0KGabqjKod3GeVxBK2ARYX/UZHJ96K9NH6Z?=
 =?us-ascii?Q?3RZUPSzMiydN7UgcUmDfy4yYs29QKMCuhxm3c9wGUwUTKZu9ZWk2gDDakCid?=
 =?us-ascii?Q?+0YghZoD3vF1G55WC3yT0sGEMJ+z6irBomiDrFdIdkcuXbWLRA0PRufkJ7Eq?=
 =?us-ascii?Q?AMoHLgUS1b0vYBpF1eZMrH6Srk1On+jrk/t1hsSxgDO4YLfO7f89Mz9CRTp5?=
 =?us-ascii?Q?FyFjPtU4eE9yNlidy0fBMsoo2Ic1jAdHAk+NJUrhbpg1mzx4+MKwBn6TZOnb?=
 =?us-ascii?Q?Juyx2zVD0F46+3znzFHoO+ySsOnkZVcLCwr+KC2IasZkoJgVfmMThOefTtK8?=
 =?us-ascii?Q?I72lwduyKxfQFYE6QnAgHv+Njslf4TDV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:51:07.7732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 654818fb-f78b-496e-9fa0-08dcbc9a7095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949

The PVH entry point is 32bit.  For a 64bit kernel, the entry point must
switch to 64bit mode, which requires a set of page tables.  In the past,
PVH used init_top_pgt.

This works fine when the kernel is loaded at LOAD_PHYSICAL_ADDR, as the
page tables are prebuilt for this address.  If the kernel is loaded at a
different address, they need to be adjusted.

__startup_64() adjusts the prebuilt page tables for the physical load
address, but it is 64bit code.  The 32bit PVH entry code can't call it
to adjust the page tables, so it can't readily be re-used.

64bit PVH entry needs page tables set up for identity map, the kernel
high map and the direct map.  pvh_start_xen() enters identity mapped.
Inside xen_prepare_pvh(), it jumps through a pv_ops function pointer
into the highmap.  The direct map is used for __va() on the initramfs
and other guest physical addresses.

Add a dedicated set of prebuild page tables for PVH entry.  They are
adjusted in assembly before loading.

Add XEN_ELFNOTE_PHYS32_RELOC to indicate support for relocation
along with the kernel's loading constraints.  The maximum load address,
KERNEL_IMAGE_SIZE - 1, is determined by a single pvh_level2_ident_pgt
page.  It could be larger with more pages.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use some defines: PTRS_PER_PGD, PTRS_PER_PMD, PAGE_SIZE
Add some spaces around operators and after commas
Include asm/pgtable_64.h
s/LOAD_PHYSICAL_ADDR/_pa(pvh_start_xen)/ in case they differ
---
 arch/x86/platform/pvh/head.S | 104 ++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 14b4345d9bae..cab168428d94 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -16,6 +16,7 @@
 #include <asm/segment.h>
 #include <asm/asm.h>
 #include <asm/boot.h>
+#include <asm/pgtable_64.h>
 #include <asm/processor-flags.h>
 #include <asm/msr.h>
 #include <asm/nospec-branch.h>
@@ -102,8 +103,47 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	btsl $_EFER_LME, %eax
 	wrmsr
 
+	mov %ebp, %ebx
+	subl $_pa(pvh_start_xen), %ebx /* offset */
+	jz .Lpagetable_done
+
+	/* Fixup page-tables for relocation. */
+	leal rva(pvh_init_top_pgt)(%ebp), %edi
+	movl $PTRS_PER_PGD, %ecx
+2:
+	testl $_PAGE_PRESENT, 0x00(%edi)
+	jz 1f
+	addl %ebx, 0x00(%edi)
+1:
+	addl $8, %edi
+	decl %ecx
+	jnz 2b
+
+	/* L3 ident has a single entry. */
+	leal rva(pvh_level3_ident_pgt)(%ebp), %edi
+	addl %ebx, 0x00(%edi)
+
+	leal rva(pvh_level3_kernel_pgt)(%ebp), %edi
+	addl %ebx, (PAGE_SIZE - 16)(%edi)
+	addl %ebx, (PAGE_SIZE - 8)(%edi)
+
+	/* pvh_level2_ident_pgt is fine - large pages */
+
+	/* pvh_level2_kernel_pgt needs adjustment - large pages */
+	leal rva(pvh_level2_kernel_pgt)(%ebp), %edi
+	movl $PTRS_PER_PMD, %ecx
+2:
+	testl $_PAGE_PRESENT, 0x00(%edi)
+	jz 1f
+	addl %ebx, 0x00(%edi)
+1:
+	addl $8, %edi
+	decl %ecx
+	jnz 2b
+
+.Lpagetable_done:
 	/* Enable pre-constructed page tables. */
-	leal rva(init_top_pgt)(%ebp), %eax
+	leal rva(pvh_init_top_pgt)(%ebp), %eax
 	mov %eax, %cr3
 	mov $(X86_CR0_PG | X86_CR0_PE), %eax
 	mov %eax, %cr0
@@ -198,5 +238,67 @@ SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
 
+#ifdef CONFIG_X86_64
+/*
+ * Xen PVH needs a set of identity mapped and kernel high mapping
+ * page tables.  pvh_start_xen starts running on the identity mapped
+ * page tables, but xen_prepare_pvh calls into the high mapping.
+ * These page tables need to be relocatable and are only used until
+ * startup_64 transitions to init_top_pgt.
+ */
+SYM_DATA_START_PAGE_ALIGNED(pvh_init_top_pgt)
+	.quad   pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
+	.org    pvh_init_top_pgt + L4_PAGE_OFFSET * 8, 0
+	.quad   pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
+	.org    pvh_init_top_pgt + L4_START_KERNEL * 8, 0
+	/* (2^48-(2*1024*1024*1024))/(2^39) = 511 */
+	.quad   pvh_level3_kernel_pgt - __START_KERNEL_map + _PAGE_TABLE_NOENC
+SYM_DATA_END(pvh_init_top_pgt)
+
+SYM_DATA_START_PAGE_ALIGNED(pvh_level3_ident_pgt)
+	.quad	pvh_level2_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
+	.fill	511, 8, 0
+SYM_DATA_END(pvh_level3_ident_pgt)
+SYM_DATA_START_PAGE_ALIGNED(pvh_level2_ident_pgt)
+	/*
+	 * Since I easily can, map the first 1G.
+	 * Don't set NX because code runs from these pages.
+	 *
+	 * Note: This sets _PAGE_GLOBAL despite whether
+	 * the CPU supports it or it is enabled.  But,
+	 * the CPU should ignore the bit.
+	 */
+	PMDS(0, __PAGE_KERNEL_IDENT_LARGE_EXEC, PTRS_PER_PMD)
+SYM_DATA_END(pvh_level2_ident_pgt)
+SYM_DATA_START_PAGE_ALIGNED(pvh_level3_kernel_pgt)
+	.fill	L3_START_KERNEL, 8, 0
+	/* (2^48-(2*1024*1024*1024)-((2^39)*511))/(2^30) = 510 */
+	.quad	pvh_level2_kernel_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
+	.quad	0 /* no fixmap */
+SYM_DATA_END(pvh_level3_kernel_pgt)
+
+SYM_DATA_START_PAGE_ALIGNED(pvh_level2_kernel_pgt)
+	/*
+	 * Kernel high mapping.
+	 *
+	 * The kernel code+data+bss must be located below KERNEL_IMAGE_SIZE in
+	 * virtual address space, which is 1 GiB if RANDOMIZE_BASE is enabled,
+	 * 512 MiB otherwise.
+	 *
+	 * (NOTE: after that starts the module area, see MODULES_VADDR.)
+	 *
+	 * This table is eventually used by the kernel during normal runtime.
+	 * Care must be taken to clear out undesired bits later, like _PAGE_RW
+	 * or _PAGE_GLOBAL in some cases.
+	 */
+	PMDS(0, __PAGE_KERNEL_LARGE_EXEC, KERNEL_IMAGE_SIZE / PMD_SIZE)
+SYM_DATA_END(pvh_level2_kernel_pgt)
+
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_RELOC,
+		     .long CONFIG_PHYSICAL_ALIGN;
+		     .long LOAD_PHYSICAL_ADDR;
+		     .long KERNEL_IMAGE_SIZE - 1)
+#endif
+
 	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
 	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
-- 
2.34.1



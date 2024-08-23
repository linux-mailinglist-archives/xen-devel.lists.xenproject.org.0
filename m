Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBF95D61B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782602.1192146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5a-0003Pd-Ru; Fri, 23 Aug 2024 19:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782602.1192146; Fri, 23 Aug 2024 19:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha5a-0003NZ-NM; Fri, 23 Aug 2024 19:36:50 +0000
Received: by outflank-mailman (input) for mailman id 782602;
 Fri, 23 Aug 2024 19:36:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt9W=PW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sha5Y-0002Oa-OF
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:36:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2417::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08dcf510-6187-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 21:36:47 +0200 (CEST)
Received: from BN8PR03CA0030.namprd03.prod.outlook.com (2603:10b6:408:94::43)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 19:36:44 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:94:cafe::ce) by BN8PR03CA0030.outlook.office365.com
 (2603:10b6:408:94::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 19:36:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 19:36:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 14:36:43 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 14:36:42 -0500
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
X-Inumbo-ID: 08dcf510-6187-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrLdvVAYNnK0GXqQoPQm4dyZhaTVDxuvnrEqN6inGJdNrYhU4z25N2fHaSwOxCwifPjhi/rlVRt2HPZvA6l5MlwALoGjQhhRwkpTF5leYyv0YjU4iW4HlsrtbqtQZtZgwxaYo+6naUP3KKVW31PU6ArynM8DedR23wRiLoPIbqrBhfknUFxcJomkrRkPNDno654xRrKfeCmZnStmauXwWLOpfxhWyKqMLPBDsnr4xfxzx/i9Sv7OSD+WSWwrummQ2g874nS4owIPGFVRg1e1Em7DJFidqK0/dxJjrNJ0pZgIBQzPEsLq9Cj5c1SwNljktDnQSszUvgjqTxEUXiFhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54RpaQe43r3m1s3jgsbEk0pLsaUFOLQtoTRxmGcRr5Q=;
 b=xU8bLOxXWQBIDXUnfFu0V6bIeC69ocSKPjGVRgA12hHb/79sN9Tf/x1UhCWHVEexeJpVhBU2FJfDNCXG4BPE/D+Ay88kcI+463RqKZ8KTgn04s7vDMyj9o07874oiHq2MKTc9nJlA28/c609c8nYskmNi7x7/E/rrR0XSwM7MQdowiFAQ9Oiy96Oyr4XWD0eFIE1/gP8tbyXewy6DEhPAfS5bdap5mNfY3KeEBf9Jdw1McqbVOmF1QPp4+IZOMxxNdGGCT+Q+mV0rp0zP1MR0FmgzxnLnOodIAlGWa1O1LQqGhNfflbX1CXgxKoRB1RTAPUNCbeL95qTON4OzM4lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54RpaQe43r3m1s3jgsbEk0pLsaUFOLQtoTRxmGcRr5Q=;
 b=FjkcPNpZ1ZKQqoTmzy3n3sNLAaQ/2kAC31pgibFrQ2PikK3IWsJNhQ5rQIYqWXCuP/zqeW6Jb4nKuFHrfSkT4xTYkTTLrXK+Lf67f+fvNSFW8/+eW2shQVhYnrZvgtVRmf1NeIHJHSCxMeHQGhFbyIh4qeYDf8LpK8AzaFlb4Ic=
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
Subject: [PATCH v3 5/5] x86/pvh: Add 64bit relocation page tables
Date: Fri, 23 Aug 2024 15:36:30 -0400
Message-ID: <20240823193630.2583107-6-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f124fd5-18ca-4ed9-1407-08dcc3aaeb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kfGL76HojrxbYgwwBDmpX+cNmS9nZnQffV2efutiCAaLOqj5QxTU9Q2qUtLe?=
 =?us-ascii?Q?Axzp4zhDdm2rdA76xJSyEpx+5PpSRBQ/jG7MNBzGNQ4m5jFZGEQ8lU26+PPm?=
 =?us-ascii?Q?TAa7l/4dD89wjkkG7bK/z3Gg0HsM6saP3V4HBQY522fBY10aOsiJL+0bQnrH?=
 =?us-ascii?Q?7jCr9iot1JeY0g2Ijo3frjQLfCZT5/37eFgp0s+UnbYmR6Wcat0R3uRSED4e?=
 =?us-ascii?Q?39qmsRzk6ntGdSDwqWF06IfQEU/8EMMS6FVm+dYECz/Kds+SR6hJk1KfF07x?=
 =?us-ascii?Q?xPamdRPUmvj1y+oYKpNHGNsWLoWBqc4U0RBFoXUU5ITLWGtF95mCNgxkhOI1?=
 =?us-ascii?Q?ngxvvbCWDKGspH1EnGU4OuuY6GHBzXOLqOq+k9IjYXjCGystsXnfDyY8UnBu?=
 =?us-ascii?Q?kM/Xj9KuDyyFcKKLteXht6bnYnu9tCE+lBB+/DWl8FwFVCwygUMk12ezD27c?=
 =?us-ascii?Q?5e/tzR1ppddxQ29DQuHiJErfesky7ZsE2ig35DLSXb46vcKKo0nMlT+GgXMf?=
 =?us-ascii?Q?b5gGVnBC9jLGfQRuorZNKvdAkjiVynrE2D6EEoMQLe3BlpLMWZ57QXAHJVAD?=
 =?us-ascii?Q?lHcD/QTsDP7R7I9Zrh1HudEUUahw/A0ms+rXYbGUJgk4vVqYiSKFFmLbSXZt?=
 =?us-ascii?Q?Ow/hAC7+76AwOSnUtRrDkyLYkrqlOHnEjEchPkEh9MGNTaM+uo8nr0Gllb0P?=
 =?us-ascii?Q?DWyTjxyG3Pra3+qOmIaes5FzyTtNddDRb6N67sSvsSUVmPhP885XhdG4t3RT?=
 =?us-ascii?Q?RS8KwAIFziFHyXMn8wpvB5zPacieogWW14Zgl/NNy+zHRBZQtH3nKeXZE6AZ?=
 =?us-ascii?Q?GvLNOeXv+nn6rFgnwT2JDJ2gDy9FsZLuBARyeUuWmGG8pxxAnngrrsCyh9xZ?=
 =?us-ascii?Q?/dH8FAuOxolOeYRMa71wFunkBH/HF3ahNOKnoXt+534ZZx4gVGr0b/ZXT7ME?=
 =?us-ascii?Q?R9hY1eVON+WHCXML32eQL2YHxwbhOYmbJgHjwtjbqJtiTJsHjJfmrThaulR2?=
 =?us-ascii?Q?E9zk1XXY+Ng4KJ3EonWwqf53Gt8h7EpysOIDy7P+fhVRnf2wNNZSmVogw7RT?=
 =?us-ascii?Q?s0T4xh/GhrESOpTBMWldS+3KzfY2tjKzygpYaiJn8QJtQ4bdF/ya+hYj/bTk?=
 =?us-ascii?Q?WhHmbX+UG2cCnx36SST3LdOAim9NwbLomj8Ea04JM4JKRb3eIlhyG9S7sLTp?=
 =?us-ascii?Q?ZZJQayJCLYsUfs2QNwDQwvkgm7eUhvAZx1blXDii66hMXcOHeJCH2vrzeec4?=
 =?us-ascii?Q?+bBk0YsnNOtVwDtBm/33D8tZJDczYy2y+1oMeTO4s+VwE2x2vAZGZuJCUpn6?=
 =?us-ascii?Q?eyvDjhlN7BIIlVWGiOsBeWTnlDiFZxK0ZKf4/cy2IYqZlx0eoYPyCehcHTYQ?=
 =?us-ascii?Q?/xMEYYFcXyELKqpzrc5C0JapW8quVx+LsZnx/9Yrcue+Vzt/DHVVlV5smDZE?=
 =?us-ascii?Q?HGr0/A1hc6VoX8POkkJW1FEipT8TfWHE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 19:36:43.7965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f124fd5-18ca-4ed9-1407-08dcc3aaeb49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822

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
v3:
Include asm/pgtable.h to avoid 32bit build failure

v2:
Use some defines: PTRS_PER_PGD, PTRS_PER_PMD, PAGE_SIZE
Add some spaces around operators and after commas
Include asm/pgtable_64.h
s/LOAD_PHYSICAL_ADDR/_pa(pvh_start_xen)/ in case they differ
---
 arch/x86/platform/pvh/head.S | 104 ++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 14b4345d9bae..64fca49cd88f 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -16,6 +16,7 @@
 #include <asm/segment.h>
 #include <asm/asm.h>
 #include <asm/boot.h>
+#include <asm/pgtable.h>
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



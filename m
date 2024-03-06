Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E087406E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 20:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689493.1074525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwzp-00024e-Vp; Wed, 06 Mar 2024 19:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689493.1074525; Wed, 06 Mar 2024 19:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwzp-000229-Rz; Wed, 06 Mar 2024 19:32:09 +0000
Received: by outflank-mailman (input) for mailman id 689493;
 Wed, 06 Mar 2024 19:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toy5=KM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rhwzo-000221-57
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 19:32:08 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 367deeb3-dbf0-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 20:32:05 +0100 (CET)
Received: from BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22) by
 BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 19:32:02 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::30) by BYAPR01CA0009.outlook.office365.com
 (2603:10b6:a02:80::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Wed, 6 Mar 2024 19:32:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 19:32:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 13:32:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 11:32:00 -0800
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 13:32:00 -0600
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
X-Inumbo-ID: 367deeb3-dbf0-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvKevZAJPNu3YrFrW/fz35Xx7DHkt+Z2RW0N58akXOdH6loFNxpF28dTWM0nXKDLL6fWz4y15kjQS2cesjHfmf9raIHpimR8Acdg6rMrWlgvM4XqTu549DuN/go0xASPsvXKnjOteScQn65Tg70MnCuPwGtl4S+kDI3aX4kMH5ovZbsLGAqvKw0phN5f6pH8UhkoQE1rB/NLEvFjR3/7N9nUamvgsiHHrHrHRRcTLyJdFtKkabV3zVbYfBr+/wzXKAj6Qcgo5TzdMbBwLmmbPr7q1VHTT3nTkP3wBUEI5n5En1R5oGT09kENS+yxSJfnUA9qEL12RkTWRinaUT+BjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8ONsRt7COxj9gZV6Ct67FmT23zTc3WUV1SKIWOuv+Y=;
 b=kVT+fdiryFiyf7zkN11H/X6uKxZHgp5++xi6pP3jzG9R0dKqnbvztlS17zNkZRGcZ7aEao/aUH5b1r3wOkbtt2+6YaTvnKmR2aqrDL2zSwHj4uEXaSK1lGgHSaRRKKdFBBbrp/uLmaeXqdtkxwiKYbqabNxi1Fo90KVWrzW2SKKYMbZBIkYYHlNXmD3+amuW+poWVzfWuEKEkRB4qO6ISMTYwhqP8oiMDNmVYHf22cGxvt/zziv186zffwX02HFOtVgS632ViekUESdUJYyzbI34JK1Y8jv0wL45nx8vw+C5Kqv4CdSHOQAp9puizl9zHmZW2zvAJj5ZPd4WcFcAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8ONsRt7COxj9gZV6Ct67FmT23zTc3WUV1SKIWOuv+Y=;
 b=SzF5u2BxbFkCXqt05Kj5KHJmav1d2SxQ0tu2+onA/rdK7busQiIKU8cWjsPFy9KWfEgkTPcWvjJ4eVGL5H7SfaK3BiVq9Qyl5VB08X9gx2H97bYZUeZdpnoks6DfdkRq9bYRol/uwmQK0JIVXomFke9b3USsQ9RcYzXMxGhxYuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jason
 Andryuk <jason.andryuk@amd.com>
Subject: [LINUX PATCH] RFC: x86/pvh: Make Xen PVH entrypoint PIC
Date: Wed, 6 Mar 2024 14:31:58 -0500
Message-ID: <20240306193158.104680-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306185032.103216-1-jason.andryuk@amd.com>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 5993f048-c7e8-40e8-d7bf-08dc3e141902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWmQyTuW0iZT2iCWgeHDRMzbwoyiAP/Fs+lYpTBKidLoQ09FoyCsKhhM6hTNsrGaY5jofoG55do43s6Z3FZvi2jaiU98ZVnSLgUYfEmC5GzFkcfb6Yc0g9cRRNFjkGc9XgvTJvbai0l5BEuastDZg3FOYODhRu4sma49K9wOeXX6rLQWVwNneWstLY5LKXMryuGmTExUDNumbiLxqz3np/5auBk8Tv8cTwjUZbZgXADR/uV/epN7xTz2IjRLjogP6xoRGBbCyYC+QAniEym7Q5RyWGafBIm0wfafook2LRViiaQKEaq0/XVu1bCs2TtXtbia357q6ISZM/ZcfDp4cfYAWUfe+9uZpl2wE7pyxIQwacoKqIw4Uu0PQS19lwB+eEzc6EBQBlULDmb4cOLI9+ntDs72ekjOEZ9Ft8/wi75sba/Jj6lb+gck74U5X6NFWSER/xUaGPjbaRUPxywP64RooL27GiqtvM5Iyac2rZ79UHVV18Z5oTCaMuKqVgiKTc/O68Eqgsti2+7Ndle/fgezSzSWjZ8hU6IQsgmwjbixKjSgtwVIFyoJGuBOiDDwODUoW0lrxphHtXFXNxSWewYS23hozM9fDHtbgxDztIf2NloYTAJdEsCY0hTDXnVJwAhD7GITnuUTi9ziv/hS6+3k4ecaJ8vfZphvPNDfqRo+bSrkDil7pG41VnTFs8SmigsjEar5cmTeTlgPLyNpB6mbh5+NE+pqm5gYZPaIqNJzLUaYTRm5ZVJwPA700mVU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 19:32:01.8246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5993f048-c7e8-40e8-d7bf-08dc3e141902
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274

The Xen PVH entrypoint is 32bit non-PIC code running at a default load
address of 0x1000000 (16MB) (CONFIG_PHYSICAL_START).  Xen loads the
kernel at that physical address inside the PVH container.

When running a PVH Dom0, the system reserved addresses are mapped 1-1
into the PVH container.  There exist system firmwares (Coreboot/EDK2)
with reserved memory at 16MB.  This creates a conflict where the PVH
kernel cannot be loaded at that address.

Modify the PVH entrypoint to be position-indepedent to allow flexibility
in load address.

Initial PVH entry runs at the physical addresses and then transitions to
the identity mapped address.  While executing xen_prepare_pvh() calls
through pv_ops function pointers transition to the high mapped
addresses.  Additionally, __va() is called on some hvm_start_info
physical addresses, we need the directmap address range is used.  So we
need to run page tables with all of those ranges mapped.

Modifying init_top_pgt tables ran into issue since
startup_64/__startup_64() will modify those page tables again.  Use a
dedicated set of page tables - pvh_init_top_pgt  - for the PVH entry to
avoid unwanted interactions.

In xen_pvh_init(), __pa() is called to find the physical address of the
hypercall page.  Set phys_base temporarily before calling into
xen_prepare_pvh(), which calls xen_pvh_init(), and clear it afterwards.
__startup_64() assumes phys_base is zero and adds load_delta to it.  If
phys_base is already set, the calculation results in an incorrect cr3.

TODO: The 32bit entry path needs additional work to have relocatable
pagetables.

TODO: Sync features.h from xen.git commit xxxxxxxxxx when it is
commited.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Put this out as an example for the Xen modifications.  Will split for
actual submission.

Instead of setting and clearing phys_base, add a dedicated variable?

Make __startup_64() exit if phys_base is already set to allow calling
multiple times, and use that and init_top_pgt instead of adding
additional page tables?
---
 arch/x86/platform/pvh/head.S     | 195 ++++++++++++++++++++++++++++---
 arch/x86/xen/xen-head.S          |   7 +-
 include/xen/interface/features.h |   5 +
 3 files changed, 190 insertions(+), 17 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..bab857db55ef 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -50,11 +50,32 @@
 #define PVH_CS_SEL		(PVH_GDT_ENTRY_CS * 8)
 #define PVH_DS_SEL		(PVH_GDT_ENTRY_DS * 8)
 
+#define rva(x) ((x) - pvh_start_xen)
+
 SYM_CODE_START_LOCAL(pvh_start_xen)
 	UNWIND_HINT_END_OF_STACK
 	cld
 
-	lgdt (_pa(gdt))
+	/*
+	 * See the comment for startup_32 for more details.  We need to
+	 * execute a call to get the execution address to be position
+	 * independent, but we don't have a stack.  Save and restore the
+	 * magic field of start_info in ebx, and use that as the stack.
+	 */
+	mov	(%ebx), %eax
+	leal	4(%ebx), %esp
+	ANNOTATE_INTRA_FUNCTION_CALL
+	call	1f
+1:	popl	%ebp
+	mov	%eax, (%ebx)
+	subl	$ rva(1b), %ebp
+	movl	$0, %esp
+
+	leal	rva(gdt)(%ebp), %eax
+	movl	%eax, %ecx
+	leal	rva(gdt_start)(%ebp), %ecx
+	movl	%ecx, 2(%eax)
+	lgdt	(%eax)
 
 	mov $PVH_DS_SEL,%eax
 	mov %eax,%ds
@@ -62,14 +83,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	mov %eax,%ss
 
 	/* Stash hvm_start_info. */
-	mov $_pa(pvh_start_info), %edi
+	leal rva(pvh_start_info)(%ebp), %edi
 	mov %ebx, %esi
-	mov _pa(pvh_start_info_sz), %ecx
+	movl rva(pvh_start_info_sz)(%ebp), %ecx
 	shr $2,%ecx
 	rep
 	movsl
 
-	mov $_pa(early_stack_end), %esp
+	leal rva(early_stack_end)(%ebp), %esp
 
 	/* Enable PAE mode. */
 	mov %cr4, %eax
@@ -83,29 +104,83 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	btsl $_EFER_LME, %eax
 	wrmsr
 
+	mov %ebp, %ebx
+	subl $LOAD_PHYSICAL_ADDR, %ebx /* offset */
+	jz .Lpagetable_done
+
+	/* Fixup page-tables for relocation. */
+	leal rva(pvh_init_top_pgt)(%ebp), %edi
+	movl $512, %ecx
+2:
+	movl 0x00(%edi), %eax
+	addl 0x04(%edi), %eax
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
+	addl %ebx, (4096 - 16)(%edi)
+	addl %ebx, (4096 - 8)(%edi)
+
+	/* pvh_level2_ident_pgt is fine - large pages */
+
+	/* pvh_level2_kernel_pgt needs adjustment - large pages */
+	leal rva(pvh_level2_kernel_pgt)(%ebp), %edi
+	movl $512, %ecx
+2:
+	movl 0x00(%edi), %eax
+	addl 0x04(%edi), %eax
+	jz 1f
+	addl %ebx, 0x00(%edi)
+1:
+	addl $8, %edi
+	decl %ecx
+	jnz 2b
+
+.Lpagetable_done:
 	/* Enable pre-constructed page tables. */
-	mov $_pa(init_top_pgt), %eax
+	leal rva(pvh_init_top_pgt)(%ebp), %eax
 	mov %eax, %cr3
 	mov $(X86_CR0_PG | X86_CR0_PE), %eax
 	mov %eax, %cr0
 
 	/* Jump to 64-bit mode. */
-	ljmp $PVH_CS_SEL, $_pa(1f)
+	pushl $PVH_CS_SEL
+	leal  rva(1f)(%ebp), %eax
+	pushl %eax
+	lretl
 
 	/* 64-bit entry point. */
 	.code64
 1:
 	/* Set base address in stack canary descriptor. */
 	mov $MSR_GS_BASE,%ecx
-	mov $_pa(canary), %eax
+	leal rva(canary)(%ebp), %eax
 	xor %edx, %edx
 	wrmsr
 
+	/* Calculate load offset from LOAD_PHYSICAL_ADDR and store in
+	 * phys_base.  __pa() needs phys_base set to calculate the the
+	 * hypercall page in xen_pvh_init(). */
+	movq %rbp, %rbx
+	subq $LOAD_PHYSICAL_ADDR, %rbx
+	movq %rbx, phys_base(%rip)
 	call xen_prepare_pvh
+	/* Clear phys_base.  startup_64/__startup_64 will *add* to its value,
+	   so start from 0. */
+	xor  %rbx, %rbx
+	movq %rbx, phys_base(%rip)
 
 	/* startup_64 expects boot_params in %rsi. */
-	mov $_pa(pvh_bootparams), %rsi
-	mov $_pa(startup_64), %rax
+	lea rva(pvh_bootparams)(%ebp), %rsi
+	lea rva(startup_64)(%ebp), %rax
 	ANNOTATE_RETPOLINE_SAFE
 	jmp *%rax
 
@@ -113,20 +188,27 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 
 	call mk_early_pgtbl_32
 
-	mov $_pa(initial_page_table), %eax
+	leal rva(initial_page_table)(%ebp), %eax
 	mov %eax, %cr3
 
 	mov %cr0, %eax
 	or $(X86_CR0_PG | X86_CR0_PE), %eax
 	mov %eax, %cr0
 
-	ljmp $PVH_CS_SEL, $1f
+	pushl $PVH_CS_SEL
+	leal  rva(1f)(%ebp), %eax
+	pushl %eax
+	lretl
+
 1:
 	call xen_prepare_pvh
-	mov $_pa(pvh_bootparams), %esi
+	leal rva(pvh_bootparams)(%ebp), %esi
 
 	/* startup_32 doesn't expect paging and PAE to be on. */
-	ljmp $PVH_CS_SEL, $_pa(2f)
+	pushl $PVH_CS_SEL
+	leal  rva(2f)(%ebp), %eax
+	pushl %eax
+	lretl
 2:
 	mov %cr0, %eax
 	and $~X86_CR0_PG, %eax
@@ -135,15 +217,19 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	and $~X86_CR4_PAE, %eax
 	mov %eax, %cr4
 
-	ljmp $PVH_CS_SEL, $_pa(startup_32)
+	pushl $PVH_CS_SEL
+	leal  rva(startup_32)(%ebp), %eax
+	pushl %eax
+	lretl
 #endif
+
 SYM_CODE_END(pvh_start_xen)
 
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
-	.word gdt_end - gdt_start
-	.long _pa(gdt_start)
+	.word gdt_end - gdt_start - 1
+	.long 0
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
@@ -163,5 +249,82 @@ SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
 
+/*
+ * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
+ * because we need identity-mapped pages.
+ */
+#define l4_index(x)     (((x) >> 39) & 511)
+#define pud_index(x)    (((x) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
+
+L4_PAGE_OFFSET  = l4_index(__PAGE_OFFSET_BASE_L4)
+L4_START_KERNEL = l4_index(__START_KERNEL_map)
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
+/*
+ * Xen PVH needs a set of identity mapped and kernel high mapping
+ * page tables.  pvh_start_xen starts running on the identity mapped
+ * page tables, but xen_prepare_pvh calls into the high mapping.
+ * These page tables are need to be relocatable and are only used until
+ * startup_64 transitions to init_top_pgt.
+ */
+SYM_DATA_START_PAGE_ALIGNED(pvh_init_top_pgt)
+	.quad   pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
+	.org    pvh_init_top_pgt + L4_PAGE_OFFSET*8, 0
+	.quad   pvh_level3_ident_pgt - __START_KERNEL_map + _KERNPG_TABLE_NOENC
+	.org    pvh_init_top_pgt + L4_START_KERNEL*8, 0
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
+	.fill	L3_START_KERNEL,8,0
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
+	PMDS(0, __PAGE_KERNEL_LARGE_EXEC, KERNEL_IMAGE_SIZE/PMD_SIZE)
+SYM_DATA_END(pvh_level2_kernel_pgt)
+
 	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
 	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index a0ea285878db..e6994aaa8cc3 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -106,7 +106,12 @@ SYM_CODE_END(xen_cpu_bringup_again)
 # define FEATURES_PV 0
 #endif
 #ifdef CONFIG_XEN_PVH
-# define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
+# ifdef CONFIG_RELOCATABLE
+#   define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted) | \
+                        (1 << XENFEAT_pvh_relocatable)
+# else
+#   define FEATURES_PVH (1 << XENFEAT_linux_rsdp_unrestricted)
+# endif
 #else
 # define FEATURES_PVH 0
 #endif
diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 53f760378e39..92e7da9194c8 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -97,6 +97,11 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+/*
+ * PVH: If set, the guest supports being relocated in physical memory on entry.
+ */
+#define XENFEAT_pvh_relocatable           20
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.44.0
g


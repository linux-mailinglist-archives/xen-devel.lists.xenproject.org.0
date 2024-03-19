Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1878806A1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 22:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695624.1085523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgpM-0004Jv-Bv; Tue, 19 Mar 2024 21:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695624.1085523; Tue, 19 Mar 2024 21:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgpM-0004IN-8M; Tue, 19 Mar 2024 21:16:56 +0000
Received: by outflank-mailman (input) for mailman id 695624;
 Tue, 19 Mar 2024 21:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7vt=KZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmgpJ-0004IH-Vu
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 21:16:54 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00a0d2b0-e636-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 22:16:52 +0100 (CET)
Received: from BN9PR03CA0065.namprd03.prod.outlook.com (2603:10b6:408:fc::10)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 21:16:48 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::ce) by BN9PR03CA0065.outlook.office365.com
 (2603:10b6:408:fc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Tue, 19 Mar 2024 21:16:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 21:16:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 16:16:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 16:16:47 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 16:16:45 -0500
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
X-Inumbo-ID: 00a0d2b0-e636-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kv0WpY+MfXV67jd440bY0IuYMQtGjFGdIQGC9nNxHSq9yFrXLhfvifhgSLancdbnAnOHbcK1NynlUmgWX5BiwOVHuVfdp7XfQ4UtRkJSbRGXhidMnKO/T6RmuPAOoLCBWEOuSfruT7eOSxAOsfYjk3sFNQdMf+ITrytgEAqAxlwa8W1ud+YnGbuoqcCiWE3puZm0jl3/gEk7XADG5bpHPN/tSmWFoDHq+30i6XEV7lq64gIATvyy4OMz4/7/jB/3OWSC4x5qUziAmuwwaMhUvI1gezOGHhhd7HpPVwAoAZX8Gxz3ftWXpR0PooQngdqa78wEpTpN3cy95wQ1gPglXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PuMDGtUD/XLKJYe09YVh1jNPocEXZXSyjJVy0LVCdg=;
 b=IMz3LM/23Ht1w6XQWAFOjtpm1Ip/C24ZRDo7b/6fWc0kdURGOE5yMapQ7XP2Y9dtogEKTjrI1G0NXyP0183rpWPrFeLWx1EyFblF4es3L5jvjY/GHEAEdgVWzH+mrnBs9NEU/LNB99/Hj/5pD4rSZHeV9QqLBs8PuIVv6I1kMakQ50oTrruF4pHvru4GOdLCxEZGmVGfPc7wiH0NTlFeKWbP8nSyDBzgqYVpa9/3wb32dtq9u16FIjdpYGER+WxQDkzFaGeKdajZv2tjB6uHQnVd2XXEnJ6g4OLoc7j9HSjhFwZHCik+Yi2q8U87xszvs5g+7Vu2qO2sxbEDtxLEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PuMDGtUD/XLKJYe09YVh1jNPocEXZXSyjJVy0LVCdg=;
 b=Uez5F48TrGiwkfJeD3x4EFCdYnB1zx+VFrNbg0VeLihkmAnFg4zqGA2YFahnEx7YFjrmuNIw90J+GaHkVXryqytdDOYSAoS54o0cDotXvGK972y5IytV7COvVJvH74N/NTEKSgALWCrTVj3I/ajzwwUpCcWMsYU3tdOaXMGMkGY=
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
Subject: [PATCH v3] RFC: x86/pvh: Make Xen PVH entrypoint PIC for x86-64
Date: Tue, 19 Mar 2024 17:16:32 -0400
Message-ID: <20240319211632.122596-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319205849.115884-1-jason.andryuk@amd.com>
References: <20240319205849.115884-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4565a3d6-8338-4a3e-2546-08dc4859e314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+j009ctJ5iJ070zPrFLUcHxm+FVIVauWSFwwOFFwcDRrXFzS39CF5hsMzylQCfGmiP7GmGtHESzkAtleyRiLZJhuIRjn9SGG10uHX4AlXho0lUIhn8OnOByX5BzVP7CHLEsjHbCya133nQy9J4L+eNdqVNzbJzTlWrnXP1tKWnS01qmcspm+xCnS10J1gNn48D7/tAZfnZtbogP0Hvr/PbycynQ1YY4V7xo8xQWdVwx2so5Lp0Qkj3h3fNfplrypRHMeX9npOQ4T9tgULomt0eR9+VHnnl5k5kCvsS0IW1cUqB/DVY0fZPBecEojOBzjkfVFGydHKB5tiMisHB0qIzCtlrw7TyEDOLtoerr2hJqFpaedwyUoJ6ep+9VTVFBtwX5tZDEwxWGutR0CKi2/cVHG0Y5/N5uplOkSrMm1S/8M2+zoZVVFq8PtM2T/pOUXyhKrPwemBIEMfh6sVHEYEfbP2RKBMti4Yri6GP683mUdA4xD75dNmDPRnGYuJOrfbVFD8UzUFrh2s1/xh88IbotMjUKaI2AQH21tUqXKURFfG9WwR+cSJp4+GDlxiE4lb81RqJfmR3ps9VIKQSdBEAK9DIxnEEHsQAsBEckrKwmI5BKZ4eNGZ96fHBlaWOgnTXXttvFDvFqMVxtvEt3l0LPAd4GOuqzYWziMrhNgzAxX8XB/fhwpS+c9YA9qNStI+NRIOw8kkK0fyIDHn8jOfqqE8CPcxrJxhsEAMbjXMlThr+UixVSH5GL9UmP92+8u
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 21:16:47.8492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4565a3d6-8338-4a3e-2546-08dc4859e314
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964

The Xen PVH entrypoint is 32bit non-PIC code running at a default load
address of 0x1000000 (16MB) (CONFIG_PHYSICAL_START).  Xen loads the
kernel at that physical address inside the PVH container.

When running a PVH Dom0, the system reserved addresses are mapped 1-1
into the PVH container.  There exist system firmwares (Coreboot/EDK2)
with reserved memory at 16MB.  This creates a conflict where the PVH
kernel cannot be loaded at that address.

Modify the PVH entrypoint to be position-indepedent to allow flexibility
in load address.  Only the 64bit entry path is converted.  A 32bit
kernel is not PIC, so calling into other parts of the kernel, like
xen_prepare_pvh() and mk_pgtable_32(), don't work properly when
relocated.

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

TODO: Sync elfnote.h from xen.git commit xxxxxxxxxx when it is
commited.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Put this out as an example for the Xen modifications

Instead of setting and clearing phys_base, add a dedicated variable?
Clearing phys_base is a little weird, but it leaves the kernel more
consistent when running non-entry code.

Make __startup_64() exit if phys_base is already set to allow calling
multiple times, and use that and init_top_pgt instead of adding
additional page tables?  That won't work.  __startup_64 is 64bit code,
and pvh needs to create page tables in 32bit code before it can
transition to 64bit long mode.  Hence it can't be re-used to relocate
page tables.
---
 arch/x86/platform/pvh/head.S    | 184 +++++++++++++++++++++++++++++---
 include/xen/interface/elfnote.h |  18 +++-
 2 files changed, 189 insertions(+), 13 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..ee7f69e2cb9d 100644
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
 
@@ -137,13 +212,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 
 	ljmp $PVH_CS_SEL, $_pa(startup_32)
 #endif
+
 SYM_CODE_END(pvh_start_xen)
 
 	.section ".init.data","aw"
 	.balign 8
 SYM_DATA_START_LOCAL(gdt)
-	.word gdt_end - gdt_start
-	.long _pa(gdt_start)
+	.word gdt_end - gdt_start - 1
+	.long _pa(gdt_start) /* x86-64 will overwrite if relocated. */
 	.word 0
 SYM_DATA_END(gdt)
 SYM_DATA_START_LOCAL(gdt_start)
@@ -163,5 +239,89 @@ SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
 
+#ifdef CONFIG_X86_64
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
+ * These page tables need to be relocatable and are only used until
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
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_RELOC,
+		     .long KERNEL_IMAGE_SIZE;
+		     .long LOAD_PHYSICAL_ADDR;
+		     .long CONFIG_PHYSICAL_ALIGN)
+#endif
+
 	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
-	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
+	             .long (pvh_start_xen - __START_KERNEL_map))
diff --git a/include/xen/interface/elfnote.h b/include/xen/interface/elfnote.h
index 38deb1214613..9ebd4e79bb41 100644
--- a/include/xen/interface/elfnote.h
+++ b/include/xen/interface/elfnote.h
@@ -185,9 +185,25 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
+/*
+ * Physical loading constraints for PVH kernels
+ *
+ * Used to place constraints on the guest physical loading addresses and
+ * alignment for a PVH kernel.
+ *
+ * The presence of this note indicates the kernel supports relocating itself.
+ *
+ * The note may include up to three 32bit values in the following order:
+ *  - a maximum address for the entire image to be loaded below (default
+ *      0xffffffff)
+ *  - a minimum address for the start of the image (default 0)
+ *  - a required start alignment (default 0x200000)
+ */
+#define XEN_ELFNOTE_PHYS32_RELOC 19
+
 /*
  * The number of the highest elfnote defined.
  */
-#define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_ENTRY
+#define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_RELOC
 
 #endif /* __XEN_PUBLIC_ELFNOTE_H__ */
-- 
2.44.0



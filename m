Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25014899066
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 23:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701010.1094993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUfJ-0006GY-WC; Thu, 04 Apr 2024 21:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701010.1094993; Thu, 04 Apr 2024 21:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUfJ-0006DV-Rz; Thu, 04 Apr 2024 21:30:33 +0000
Received: by outflank-mailman (input) for mailman id 701010;
 Thu, 04 Apr 2024 21:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsUfH-0006DP-FM
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 21:30:31 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ee38b8d-f2ca-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 23:30:30 +0200 (CEST)
Received: from DS7PR03CA0275.namprd03.prod.outlook.com (2603:10b6:5:3ad::10)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 21:30:26 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::89) by DS7PR03CA0275.outlook.office365.com
 (2603:10b6:5:3ad::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.28 via Frontend
 Transport; Thu, 4 Apr 2024 21:30:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 21:30:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 16:30:25 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 16:30:24 -0500
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
X-Inumbo-ID: 8ee38b8d-f2ca-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbIc1YmKZoBi9O+siu7DhoOuJaenapF6cnP1dv7xrZpU2FIvoS1iwy0gxwRPW9SMOYfgq6orG9F10ONhQwzoOZKtQtw8CB5ndahR7QEID2qt1kvOLUyjtApxKdZVl8bQws0uxK1UZh7cb+cW3xa6+eufekLni0Fg7gfhWj9l6J/Mk1zcf0utNXv4ko/HOfxOyetmMjxi8YxzZd+Kw5QFJQCkRB/Xb2zaUmJdcFOIr5CWqiw14KwqdBumHwm5bAZ5pf/AoB8QcjtzwNvJgV7qYmnYwAjR5HIngZjQg5BPGxU5zGymEHQgUK5m+O9dEdF5Z6Ol6H9MSi7uWMrJfykFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxBKuBih+0VrF6aX5kEWzaJZV/UO7PiZ2dpCkevziic=;
 b=K77hX6fDILlSi1M1lEqVV5OYLwuQ85xrj3k89p48lqEoBFoaHlW4oTexLyrsM6UL1q1z3TQ2Zt1VptRc2t/5iOYONtm1EIH4rSpiPrg9rIu9qdTahQM5/+EINmmlOjLPuMQ9+ZUY9vXbgYk8gGbV3qoBHHteurqcKzBWLugjSYE4bSyzu1bUPIeF+psF4QjGwH8fZjmp0EM9oLJ/w8Hpj3tCMfsz0Fl0oGGGfGfD+aikJu4zkHpZPZR4JvGugpRjBs9gBshB2he2YdzqkrWlrnUaPghHF6nnlDA7N9zkvqTd9yC78T5WHIFOeL5HLUFD+edXC8sCTUbMHPAco1Dnyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxBKuBih+0VrF6aX5kEWzaJZV/UO7PiZ2dpCkevziic=;
 b=TQqSOYxn69F5g3iuX9R9Mg6U20EAPQa1n7gkEP5MQDwLpOfHD3QTC9FyCa5LyHZUlNcO6gOzyLyCBpG+Pv1p8+mrhw+g5K4x1Btf9x4ebtANyUvOLnzWguamKtVYJokaWzcGC2BPBedj9DjtA/9tduEBAqoBjvo1KihKZTpyOuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Jason Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v7] RFC: x86/pvh: Make Xen PVH entrypoint PIC for x86-64
Date: Thu, 4 Apr 2024 17:30:15 -0400
Message-ID: <20240404213015.29035-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404212519.16401-1-jason.andryuk@amd.com>
References: <20240404212519.16401-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c78f08-9775-4710-f84b-08dc54ee717c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OZQlP4MATrJmGdm9Aci/nSfpNebxcUB3qsD0FuQWtCvc0jygc7XvtqJpgC/2spNHuMX385Hyc4VoPY1k+8Q+gMhCVcAQ8tNGBZkaUSGNI1HxLA0mii4k29uvwzCGttndK5NAOlHzE7aYG+/byJBTnAXPEUdajXYGy4K6SW1fs8AycrJUeqrC34mNOXHCNq7qRpuNtJgJvGOwNSedUGg0EJb+FzCeo0uMR6UnxqUAZt8a6U8AR7TYTVuSZHZdTplT1Oe1888EqT2GRZ1FFM+QfbkcSN4BqIu1Xfltt1L1A68TZ44G6QgoBkph588e5edMEfhR8SxaSMrgk2D+n7Hn2phRmaTgPSK5JXmaClieoD6c10kTKxgHjZUcuqJ0TnISXK7zCR/uGacyO6EWLr/Fk6zHHDEf6Rv8m4UTs1us1OEmtmQ36XS6YAz8PQ65HBbbdU83OuUZxDudcGHWNRr2anV95MSIfBwKalrDDXDhes/0QWeWpgS2gncDhu7ganv6WaTNGpgGfh2rHwL5Nc9CqjG9WJ5hnbrvck4Kh1Pf269XNlShueiRevq9fnZrdr+3u+EWQ9Hk8WJlgrGJhpsYIPSZ9RgRzXbA9zIc0n4574zqZeYx8O+ot4Ibaje9rAeCBeVLo0IaWlkhSsgjc0CxEH6/lCGiIbwwW4e86UQJZu9gOmapAwV6SFZLBy5SoPUs1YpwSTHdFaKaaIk/ztRNzKOrQGfyvxu11tH6MdnfmL98ye2mPjR0mEwHoXK69aYp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 21:30:26.1482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c78f08-9775-4710-f84b-08dc54ee717c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474

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
startup_64/__startup_64() will modify those page tables again.  Create
dedicated set of page tables - pvh_init_top_pgt  - for the PVH entry to
avoid unwanted interactions.

To avoid statically allocating space, the .bss is used.  It is unused on
entry and only cleared later.  This saves 32kb that would otherwise be
added to vmlinux.   A minimum of 20kb would be needed, which would only
map the lower 1GB or ram.

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

UNWIND_HINT_END_OF_STACK after lret is to silence:
vmlinux.o: warning: objtool: pvh_start_xen+0x168: unreachable instruction

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
 arch/x86/platform/pvh/head.S    | 168 +++++++++++++++++++++++++++++---
 include/xen/interface/elfnote.h |  20 +++-
 2 files changed, 175 insertions(+), 13 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index f7235ef87bc3..48480fc8d786 100644
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
@@ -83,29 +104,145 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	btsl $_EFER_LME, %eax
 	wrmsr
 
-	/* Enable pre-constructed page tables. */
-	mov $_pa(init_top_pgt), %eax
+/*
+ * Xen PVH needs a set of identity mapped and kernel high mapping
+ * page tables.  pvh_start_xen starts running on the identity mapped
+ * page tables, but xen_prepare_pvh calls into the high mapping.  Inside,
+ * __va is used, so the L4_PAGE_OFFSET needs to be populated.
+ *
+ * Instead of allocating memory memory in .init.data, we just use
+ * space in the BSS.  This will only be used until startup_64 switches
+ * to the main page tables.  Later, the bss will be cleared.
+ */
+#define pvh_init_top_pgt      rva(__bss_start)
+#define pvh_level3_ident_pgt  (pvh_init_top_pgt + PAGE_SIZE)
+#define pvh_level2_ident_pgt  (pvh_level3_ident_pgt + PAGE_SIZE)
+#define pvh_level3_kernel_pgt (pvh_level2_ident_pgt + 4 * PAGE_SIZE)
+#define pvh_level2_kernel_pgt (pvh_level3_kernel_pgt + PAGE_SIZE)
+
+#define l4_index(x)     (((x) >> 39) & 511)
+#define pud_index(x)    (((x) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
+
+L4_PAGE_OFFSET  = l4_index(__PAGE_OFFSET_BASE_L4)
+L4_START_KERNEL = l4_index(__START_KERNEL_map)
+L3_START_KERNEL = pud_index(__START_KERNEL_map)
+
+	/* Clear pvh_init_top_pgt */
+	leal pvh_init_top_pgt(%ebp), %edi
+	movl $(PAGE_SIZE / 4), %ecx
+	xorl %eax, %eax
+	rep stosl
+
+	/* pvh_init_top_pgt[0] = pvh_level3_ident_pgt */
+	leal pvh_init_top_pgt(%ebp), %edi
+	leal pvh_level3_ident_pgt(%ebp), %esi
+	movl %esi, 0x00(%edi)
+	addl $_KERNPG_TABLE_NOENC, 0x00(%edi)
+
+	/* pvh_init_top_pgt[L4_PAGE_OFFSET] = pvh_level3_ident_pgt */
+	movl %esi, (L4_PAGE_OFFSET * 8)(%edi)
+	addl $_KERNPG_TABLE_NOENC, (L4_PAGE_OFFSET * 8)(%edi)
+
+	/* pvh_init_top_pgt[L4_START_KERNEL] = pvh_level3_kernel_pgt */
+	leal pvh_level3_kernel_pgt(%ebp), %esi
+	movl %esi, (L4_START_KERNEL * 8)(%edi)
+	addl $_PAGE_TABLE_NOENC, (L4_START_KERNEL * 8)(%edi)
+
+	/* Clear pvh_level3_ident_pgt */
+	leal pvh_level3_ident_pgt(%ebp), %edi
+	movl $(PAGE_SIZE / 4), %ecx
+	xorl %eax, %eax
+	rep stosl
+
+	/* Set pvh_level3_ident_pgt[0] = pvh_level2_ident_pgt */
+	leal pvh_level3_ident_pgt(%ebp), %edi
+	leal pvh_level2_ident_pgt(%ebp), %esi
+	addl $_KERNPG_TABLE_NOENC, %esi
+	movl %esi, 0x00(%edi)
+	addl $PAGE_SIZE, %esi
+	/* ... pvh_level3_ident_pgt[1] = pvh_level2_ident_pgt+0x1000 */
+	movl %esi, 0x08(%edi)
+	addl $PAGE_SIZE, %esi
+	/* ... pvh_level3_ident_pgt[2] = pvh_level2_ident_pgt+0x2000 */
+	movl %esi, 0x10(%edi)
+	addl $PAGE_SIZE, %esi
+	/* ... pvh_level3_ident_pgt[3] = pvh_level2_ident_pgt+0x3000 */
+	movl %esi, 0x18(%edi)
+
+	/* Fill pvh_level2_ident_pgt with large ident pages. */
+	leal pvh_level2_ident_pgt(%ebp), %edi
+	movl $__PAGE_KERNEL_IDENT_LARGE_EXEC, %esi
+	movl $(PTRS_PER_PMD*4), %ecx
+1:	movl %esi, 0(%edi)
+	addl $(1 << PMD_SHIFT), %esi
+	addl $8, %edi
+	decl %ecx
+	jnz 1b
+
+	/* Clear pvh_level3_kernel_pgt */
+	leal pvh_level3_kernel_pgt(%ebp), %edi
+	movl $(PAGE_SIZE / 4), %ecx
+	xorl %eax, %eax
+	rep stosl
+
+	/* pvh_level3_kernel_pgt[L3_START_KERNEL] = pvh_level2_kernel_pgt */
+	leal pvh_level3_kernel_pgt(%ebp), %edi
+	leal pvh_level2_kernel_pgt(%ebp), %esi
+	movl %esi, (L3_START_KERNEL * 8)(%edi)
+	addl $_KERNPG_TABLE_NOENC, (L3_START_KERNEL * 8)(%edi)
+
+	mov %ebp, %ebx
+	subl $LOAD_PHYSICAL_ADDR, %ebx /* offset */
+
+	/* Fill pvh_level2_kernel_pgt with large pages. */
+	leal pvh_level2_kernel_pgt(%ebp), %edi
+	movl $__PAGE_KERNEL_LARGE_EXEC, %esi
+	addl %ebx, %esi
+	movl $(KERNEL_IMAGE_SIZE / PMD_SIZE), %ecx
+1:	movl %esi, 0(%edi)
+	addl $(1 << PMD_SHIFT), %esi
+	addl $8, %edi
+	decl %ecx
+	jnz 1b
+
+	/* Switch to page tables. */
+	leal pvh_init_top_pgt(%ebp), %eax
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
+	UNWIND_HINT_END_OF_STACK
+
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
 
@@ -137,13 +274,14 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 
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
@@ -163,5 +301,11 @@ SYM_DATA_START_LOCAL(early_stack)
 	.fill BOOT_STACK_SIZE, 1, 0
 SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
 
+#ifdef CONFIG_X86_64
+	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_RELOC,
+		     .long CONFIG_PHYSICAL_ALIGN;
+		     .long LOAD_PHYSICAL_ADDR;
+		     .long 0xffffffff)
+#endif
 	ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY,
 	             _ASM_PTR (pvh_start_xen - __START_KERNEL_map))
diff --git a/include/xen/interface/elfnote.h b/include/xen/interface/elfnote.h
index 38deb1214613..4deb63ca7633 100644
--- a/include/xen/interface/elfnote.h
+++ b/include/xen/interface/elfnote.h
@@ -185,9 +185,27 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
+/*
+ * Physical loading constraints for PVH kernels
+ *
+ * The presence of this note indicates the kernel supports relocating itself.
+ *
+ * The note may include up to three 32bit values to place constraints on the
+ * guest physical loading addresses and alignment for a PVH kernel.  Values
+ * are read in the following order:
+ *  - a required start alignment (default 0x200000)
+ *  - a minimum address for the start of the image (default 0)
+ *  - a maximum address for the last byte of the image (default 0xffffffff)
+ *
+ *  When this note specifies an alignment value, it is used.  Otherwise the
+ *  maximum p_align value from loadable ELF Program Headers is used, if it is
+ *  greater than or equal to 4k (0x1000).  Otherwise, the default is used.
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



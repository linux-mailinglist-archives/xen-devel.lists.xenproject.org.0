Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6E7E3ABC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 12:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628767.980575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JsM-0001h0-RU; Tue, 07 Nov 2023 11:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628767.980575; Tue, 07 Nov 2023 11:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JsM-0001fL-OO; Tue, 07 Nov 2023 11:04:06 +0000
Received: by outflank-mailman (input) for mailman id 628767;
 Tue, 07 Nov 2023 11:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5W1=GU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r0JsL-0001Me-BI
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 11:04:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5af40c2c-7d5d-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 12:04:02 +0100 (CET)
Received: from MN2PR16CA0037.namprd16.prod.outlook.com (2603:10b6:208:234::6)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 11:03:56 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::37) by MN2PR16CA0037.outlook.office365.com
 (2603:10b6:208:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 11:03:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 11:03:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 05:03:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 03:03:19 -0800
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Tue, 7 Nov 2023 05:03:17 -0600
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
X-Inumbo-ID: 5af40c2c-7d5d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPDtKc83tcZbxqBPMY9Aio9F5RUvJY5K9kEaEGSt6gEfBAHhnucaIShtzpN/x1bcetdkDJ5qJVHHDmEu2hN6K+5CyOdwi6pqc2LRCtYBUzzhp8q/Ms4JUN0rZz6/K37GK8G61xWIkpzyCwZ+al5wVtSWbvmOX4ZDtBCL519DVlQpeOOjRYpRvbuZ8iLh9+alRHU00Pb+Sf4CIWxzfyauPv+9psoQoSgR874miaW2VbUFa+E/h/hwP1JVeCNloY2iDdn274WqgbqheVqvO/kVXUob7I5YXXTRO0QDwko3KNwH09hM3b0oYsPKOnosYMIVCoeaWLqr/exRI/+cE0YTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzWhtqy3DjJ0q7rFcCDDZezJg6AZI6wyqVhKWBNv+cg=;
 b=XyypnAfWKn4MSngJz8hc3AkfRP91xbeks2+KrNzIDnCxTF8Npon7ZBmfQHeBRrTrAnbmagk6F+WqqG8rYNuvUGgM9LZ11QeON9SQSAu36xqkIeakR9qlpb/s9a5ArOWlGY0UO+XcBOO45e/972p/acAhROLZI6bZ6Vv6PjktxlrXwSRoMdqXPm/Ee4jp+NQ9Iq8ZfJ8gUpub5AEPE50ZSzpmdIlsifVwugyfIBUbNwckaWHuGPRsLVbzJN80cG3NLsL5gepXHQFFhBJfPVZdnoXYoQrni3aZS3Z3POSSBPPywSJ3kEUEcuwQE2skCNIjssLHxTkzsr/NDvMaEeDE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzWhtqy3DjJ0q7rFcCDDZezJg6AZI6wyqVhKWBNv+cg=;
 b=3PuHpEpEdXR3hZFARpaLBP8ORNA6WhVbLjL8d52lHQ5CqmkA+AgKhVx9ZY3Extx01xrcDDzNZ2sTnefqNa8n42oIn6GfS827of5UY1MZfR3oHCtN96Oweq5BOd/Sg8TUIXpO3V8K0fWmt2D8FXaJFXCMGP8cE2iCmvG2+pUJ1i8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 2/2] xen/arm32: head Split and move MMU-specific head.S to mmu/head.S
Date: Tue, 7 Nov 2023 11:02:17 +0000
Message-ID: <20231107110217.1827379-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
References: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SA1PR12MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c649299-46d9-4693-c444-08dbdf813c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NxQJMRyXkpLzJZ8i4ZYKcKfXyTE57oIge2rBAdLGAiCxHrdy7W3tJRaEc5iPSCig0HhSQA31FharEC5YVLt2RX8sw4zmjphjBRu92KX32hp2aDyFhSqUe4yQx+fcAu6pubOLNBkbjyUaD5yePLbu6GOertVfeyAzl/aS3X3d2tiByxB++qjFxv8qrE0l2L9r1atvzFsbrfRxhvcdyGrM4By4hpzqbM80QiG2u79bpOk5/5bRTg9wdOiDIMAWkqJijSKcvpLEtvAJZvU3ENdiErxJt8ZKn8C5LwTxa2a9xBId5tzykS8EhS8z5pOABES+nUmkbfuUfoiKBLE78jIlUON05xLoPdTSIZrskLradVk3u0tWuuscs3A1ddw6j4NHyCkv72HWX/CshY3qmUu8jqCBtVneJQx7D6nXmgGwU2jHqMnNOOp2MgAEbmZgkY5luk6b1v5sS7X+18UmGoHA9IhzzWEaA9qnlrP/O9Y3kAqhMaEvj+QofB2iFYFfHkpbyUaHUzaag8nDQy7H8hWto5aP5NjUx9PZfwPOpxMIPInArlxxPt3c1dklj/vGBe/FGBaEqSGHdlNgORzMLtIQsYGXXmv7n6atsiWddCisiDKcxNgo3KYNW4IA6tG8ixt2M2BUsHh7EczGbvHpyMyeCe/a0FxoPtF9lQf2rNbgwgNcfMQ13yGHEH+Sj5xfGxd49VmrSGXsUOZXF4piO3VUzpuVRfnV1J+iW1o0NnEuWWAHetCoLrZ+Ij5MrkvJ/WGRDx5SOgpuKXkFg/YWBmLaE98gcbsiFxuIzSMbIiZFzoZQ/Ap+GNxgoasCWd82mWQOvIint8SSmMIoYE3Og1GldA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(82310400011)(451199024)(1800799009)(186009)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(47076005)(83380400001)(36860700001)(36756003)(8936002)(4326008)(103116003)(41300700001)(2906002)(86362001)(30864003)(8676002)(316002)(478600001)(356005)(6916009)(82740400003)(81166007)(336012)(5660300002)(1076003)(26005)(54906003)(70586007)(426003)(70206006)(2616005)(21314003)(36900700001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 11:03:55.9207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c649299-46d9-4693-c444-08dbdf813c5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669

The MMU specific code in head.S will not be used on MPU systems.
Instead of introducing more #ifdefs which will bring complexity
to the code, move MMU related code to mmu/head.S and keep common
code in head.S. Two notes while moving:
 - As "fail" in original head.S is very simple and this name is too
   easy to be conflicted, duplicate it in mmu/head.S instead of
   exporting it.
 - Realigned ".macro ret" so that the alignment matches to the other
   macros.
 - Rename puts to asm_puts, putn to asm_putn (this denotes that the
   macros are used within the context of assembly only).
 - Use ENTRY() for enable_secondary_cpu_mm, enable_boot_cpu_mm,
   setup_fixmap, asm_puts, asm_putn  as they will be used externally.

Also move the assembly macros shared by head.S and mmu/head.S to
macros.h.

This is based on 6734327d76be ("xen/arm64: Split and move MMU-specific head.S to mmu/head.S").

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-

1. Added a commit message

2. Moved load_paddr to mmu/head.S

v2 :-

1. Renamed puts to asm_puts and putn to asm_putn. Exported asm_putn().
2. Moved XEN_TEMPORARY_OFFSET to head.S.
3. Some style issues.

 xen/arch/arm/arm32/head.S               | 628 +-----------------------
 xen/arch/arm/arm32/mmu/Makefile         |   1 +
 xen/arch/arm/arm32/mmu/head.S           | 573 +++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  58 ++-
 4 files changed, 637 insertions(+), 623 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/head.S

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 2204ea6dce..1448d092d1 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -22,86 +22,10 @@
 
 #define ZIMAGE_MAGIC_NUMBER 0x016f2818
 
-#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
-#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
-#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
-#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
-#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
-
-#define PT_UPPER(x) (PT_##x & 0xf00)
-#define PT_LOWER(x) (PT_##x & 0x0ff)
-
-/* Convenience defines to get slot used by Xen mapping. */
-#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
-#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
-
-/* Offset between the early boot xen mapping and the runtime xen mapping */
-#define XEN_TEMPORARY_OFFSET      (TEMPORARY_XEN_VIRT_START - XEN_VIRT_START)
-
 #if defined(CONFIG_EARLY_PRINTK) && defined(CONFIG_EARLY_PRINTK_INC)
 #include CONFIG_EARLY_PRINTK_INC
 #endif
 
-/*
- * Move an immediate constant into a 32-bit register using movw/movt
- * instructions.
- */
-.macro mov_w reg, word
-        movw  \reg, #:lower16:\word
-        movt  \reg, #:upper16:\word
-.endm
-
-/*
- * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
- * within the range +/- 4GB of the PC.
- *
- * @dst: destination register
- * @sym: name of the symbol
- */
-.macro adr_l, dst, sym
-        mov_w \dst, \sym - .Lpc\@
-        .set  .Lpc\@, .+ 8          /* PC bias */
-        add   \dst, \dst, pc
-.endm
-
-.macro load_paddr rb, sym
-        mov_w \rb, \sym
-        add   \rb, \rb, r10
-.endm
-
-/*
- * Flush local TLBs
- *
- * @tmp: Scratch register
- *
- * See asm/arm32/flushtlb.h for the explanation of the sequence.
- */
-.macro flush_xen_tlb_local tmp
-        dsb   nshst
-        mcr   CP32(\tmp, TLBIALLH)
-        dsb   nsh
-        isb
-.endm
-
-/*
- * Enforce Xen page-tables do not contain mapping that are both
- * Writable and eXecutables.
- *
- * This should be called on each secondary CPU.
- */
-.macro pt_enforce_wxn tmp
-        mrc   CP32(\tmp, HSCTLR)
-        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
-        dsb
-        mcr   CP32(\tmp, HSCTLR)
-        /*
-         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
-         * before flushing the TLBs.
-         */
-        isb
-        flush_xen_tlb_local \tmp
-.endm
-
 /*
  * Common register usage in this file:
  *   r0  -
@@ -121,38 +45,6 @@
  *   r14 - LR
  *   r15 - PC
  */
-#ifdef CONFIG_EARLY_PRINTK
-/*
- * Macro to print a string to the UART, if there is one.
- *
- * Clobbers r0 - r3
- */
-#define PRINT(_s)           \
-        mov   r3, lr       ;\
-        adr_l r0, 98f      ;\
-        bl    puts         ;\
-        mov   lr, r3       ;\
-        RODATA_STR(98, _s)
-
-/*
- * Macro to print the value of register \rb
- *
- * Clobbers r0 - r4
- */
-.macro print_reg rb
-        mov   r0, \rb
-        mov   r4, lr
-        bl    putn
-        mov   lr, r4
-.endm
-
-#else /* CONFIG_EARLY_PRINTK */
-#define PRINT(s)
-
-.macro print_reg rb
-.endm
-
-#endif /* !CONFIG_EARLY_PRINTK */
 
         .section .text.header, "ax", %progbits
         .arm
@@ -355,480 +247,6 @@ cpu_init_done:
         mov   pc, r5                        /* Return address is in r5 */
 ENDPROC(cpu_init)
 
-/*
- * Macro to find the slot number at a given page-table level
- *
- * slot:     slot computed
- * virt:     virtual address
- * lvl:      page-table level
- *
- * Note that ubxf is unpredictable when the end bit is above 32-bit. So we
- * can't use it for first level offset.
- */
-.macro get_table_slot, slot, virt, lvl
-    .if \lvl == 1
-        lsr   \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl)
-    .else
-        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
-    .endif
-.endm
-
-/*
- * Macro to create a page table entry in \ptbl to \tbl (physical
- * address)
- *
- * ptbl:    table symbol where the entry will be created
- * tbl:     physical address of the table to point to
- * virt:    virtual address
- * lvl:     page-table level
- *
- * Preserves \virt
- * Clobbers \tbl, r1 - r3
- *
- * Note that \tbl and \virt should be in a register other than r1 - r3
- */
-.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
-        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tbl */
-        lsl   r1, r1, #3                /* r1 := slot offset in \tbl */
-
-        movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
-        orr   r2, r2, \tbl           /*           + \tbl paddr */
-        mov   r3, #0
-
-        adr_l \tbl, \ptbl            /* \tbl := (v,p)addr of \ptbl */
-
-        strd  r2, r3, [\tbl, r1]
-.endm
-
-
-/*
- * Macro to create a page table entry in \ptbl to \tbl (symbol)
- *
- * ptbl:    table symbol where the entry will be created
- * tbl:     table symbol to point to
- * virt:    virtual address
- * lvl:     page-table level
- *
- * Preserves \virt
- * Clobbers r1 - r4
- *
- * Also use r10 for the phys offset.
- *
- * Note that \virt should be in a register other than r1 - r4
- */
-.macro create_table_entry, ptbl, tbl, virt, lvl
-        load_paddr r4, \tbl
-        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
- .endm
-
-/*
- * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
- * level table (i.e page granularity) is supported.
- *
- * ptbl:     table symbol where the entry will be created
- * virt:    virtual address
- * phys:    physical address
- * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
- *
- * Preserves \virt, \phys
- * Clobbers r1 - r4
- *
- * Note that \virt and \paddr should be in other registers than r1 - r4
- * and be distinct.
- */
-.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3
-        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
-        lsr   r1, \virt, #THIRD_SHIFT
-        and   r1, r1, r2             /* r1 := slot in \tlb */
-        lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
-
-        lsr   r4, \phys, #THIRD_SHIFT
-        lsl   r4, r4, #THIRD_SHIFT   /* r4 := PAGE_ALIGNED(phys) */
-
-        movw  r2, #\type             /* r2:r3 := right for section PT */
-        orr   r2, r2, r4             /*          + PAGE_ALIGNED(phys) */
-        mov   r3, #0
-
-        adr_l r4, \ptbl
-
-        strd  r2, r3, [r4, r1]
-.endm
-
-/*
- * Rebuild the boot pagetable's first-level entries. The structure
- * is described in mm.c.
- *
- * After the CPU enables paging it will add the fixmap mapping
- * to these page tables, however this may clash with the 1:1
- * mapping. So each CPU must rebuild the page tables here with
- * the 1:1 in place.
- *
- * Inputs:
- *   r9 : paddr(start)
- *   r10: phys offset
- *
- * Output:
- *   r12: Was a temporary mapping created?
- *
- * Clobbers r0 - r5
- */
-create_page_tables:
-        /* Prepare the page-tables for mapping Xen */
-        mov_w r0, XEN_VIRT_START
-
-        /*
-         * We need to use a stash register because
-         * create_table_entry_paddr() will clobber the register storing
-         * the physical address of the table to point to.
-         */
-        adr_l r5, boot_third
-        mov_w r4, XEN_VIRT_START
-.rept XEN_NR_ENTRIES(2)
-        mov   r0, r5                        /* r0 := paddr(l3 table) */
-        create_table_entry_from_paddr boot_second, r0, r4, 2
-        add   r4, r4, #XEN_PT_LEVEL_SIZE(2) /* r4 := Next vaddr */
-        add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
-.endr
-
-        /*
-         * Find the size of Xen in pages and multiply by the size of a
-         * PTE. This will then be compared in the mapping loop below.
-         *
-         * Note the multiplication is just to avoid using an extra
-         * register/instruction per iteration.
-         */
-        mov_w r0, _start            /* r0 := vaddr(_start) */
-        mov_w r1, _end              /* r1 := vaddr(_end) */
-        sub   r0, r1, r0            /* r0 := effective size of Xen */
-        lsr   r0, r0, #PAGE_SHIFT   /* r0 := Number of pages for Xen */
-        lsl   r0, r0, #3            /* r0 := Number of pages * PTE size */
-
-        /* Setup boot_third: */
-        adr_l r4, boot_third
-
-        lsr   r2, r9, #THIRD_SHIFT  /* Base address for 4K mapping */
-        lsl   r2, r2, #THIRD_SHIFT
-        orr   r2, r2, #PT_UPPER(MEM_L3) /* r2:r3 := map */
-        orr   r2, r2, #PT_LOWER(MEM_L3)
-        mov   r3, #0x0
-
-        /* ... map of vaddr(start) in boot_third */
-        mov   r1, #0
-1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
-        add   r2, r2, #PAGE_SIZE     /* Next page */
-        add   r1, r1, #8             /* Next slot */
-        cmp   r1, r0                 /* Loop until we map all of Xen */
-        blo   1b
-
-        /*
-         * Setup the 1:1 mapping so we can turn the MMU on. Note that
-         * only the first page of Xen will be part of the 1:1 mapping.
-         */
-        create_table_entry boot_pgtable, boot_second_id, r9, 1
-        create_table_entry boot_second_id, boot_third_id, r9, 2
-        create_mapping_entry boot_third_id, r9, r9
-
-        /*
-         * Find the first slot used. If the slot is not the same
-         * as TEMPORARY_AREA_FIRST_SLOT, then we will want to switch
-         * to the temporary mapping before jumping to the runtime
-         * virtual mapping.
-         */
-        get_table_slot r1, r9, 1     /* r1 := first slot */
-        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
-        bne   use_temporary_mapping
-
-        mov_w r0, XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
-        mov   r12, #0                /* r12 := temporary mapping not created */
-        mov   pc, lr
-
-use_temporary_mapping:
-        /*
-         * The identity mapping is not using the first slot
-         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
-         * See switch_to_runtime_mapping for more details.
-         */
-        PRINT("- Create temporary mapping -\r\n")
-
-        /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
-        mov_w r0, TEMPORARY_XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
-
-        mov   r12, #1                /* r12 := temporary mapping created */
-        mov   pc, lr
-ENDPROC(create_page_tables)
-
-/*
- * Turn on the Data Cache and the MMU. The function will return
- * to the virtual address provided in LR (e.g. the runtime mapping).
- *
- * Inputs:
- *   r9 : paddr(start)
- *  r12 : Was the temporary mapping created?
- *   lr : Virtual address to return to
- *
- * Clobbers r0 - r5
- */
-enable_mmu:
-        PRINT("- Turning on paging -\r\n")
-
-        /*
-         * The state of the TLBs is unknown before turning on the MMU.
-         * Flush them to avoid stale one.
-         */
-        flush_xen_tlb_local r0
-
-        /* Write Xen's PT's paddr into the HTTBR */
-        adr_l r0, boot_pgtable
-        mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
-        mcrr  CP64(r0, r1, HTTBR)
-        isb
-
-        mrc   CP32(r0, HSCTLR)
-        /* Enable MMU and D-cache */
-        orr   r0, r0, #(SCTLR_Axx_ELx_M|SCTLR_Axx_ELx_C)
-        dsb                          /* Flush PTE writes and finish reads */
-        mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
-        isb                          /* Now, flush the icache */
-
-        /*
-         * The MMU is turned on and we are in the 1:1 mapping. Switch
-         * to the runtime mapping.
-         */
-        mov   r5, lr                /* Save LR before overwritting it */
-        mov_w lr, 1f                /* Virtual address in the runtime mapping */
-        b     switch_to_runtime_mapping
-1:
-        mov   lr, r5                /* Restore LR */
-        /*
-         * At this point, either the 1:1 map or the temporary mapping
-         * will be present. The former may clash with other parts of the
-         * Xen virtual memory layout. As both of them are not used
-         * anymore, remove them completely to avoid having to worry
-         * about replacing existing mapping afterwards.
-         *
-         * On return this will jump to the virtual address requested by
-         * the caller.
-         */
-        teq   r12, #0
-        beq   remove_identity_mapping
-        b     remove_temporary_mapping
-ENDPROC(enable_mmu)
-
-/*
- * Switch to the runtime mapping. The logic depends on whether the
- * runtime virtual region is clashing with the physical address
- *
- *  - If it is not clashing, we can directly jump to the address in
- *    the runtime mapping.
- *  - If it is clashing, create_page_tables() would have mapped Xen to
- *    a temporary virtual address. We need to switch to the temporary
- *    mapping so we can remove the identity mapping and map Xen at the
- *    correct position.
- *
- * Inputs
- *    r9: paddr(start)
- *   r12: Was a temporary mapping created?
- *    lr: Address in the runtime mapping to jump to
- *
- * Clobbers r0 - r4
- */
-switch_to_runtime_mapping:
-        /*
-         * Jump to the runtime mapping if the virt and phys are not
-         * clashing
-         */
-        teq   r12, #0
-        beq   ready_to_switch
-
-        /* We are still in the 1:1 mapping. Jump to the temporary Virtual address. */
-        mov_w r0, 1f
-        add   r0, r0, #XEN_TEMPORARY_OFFSET /* r0 := address in temporary mapping */
-        mov   pc, r0
-
-1:
-        /* Remove boot_second_id */
-        mov   r2, #0
-        mov   r3, #0
-        adr_l r0, boot_pgtable
-        get_table_slot r1, r9, 1            /* r1 := first slot */
-        lsl   r1, r1, #3                    /* r1 := first slot offset */
-        strd  r2, r3, [r0, r1]
-
-        flush_xen_tlb_local r0
-
-        /* Map boot_second into boot_pgtable */
-        mov_w r0, XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
-
-        /* Ensure any page table updates are visible before continuing */
-        dsb   nsh
-        /*
-         * The function will return on the runtime mapping. So we want
-         * to prevent instruction fetch before the dsb completes.
-         */
-        isb
-
-ready_to_switch:
-        mov   pc, lr
-ENDPROC(switch_to_runtime_mapping)
-
-/*
- * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
- * The function will return to the virtual address provided in LR (e.g. the
- * runtime mapping).
- *
- * Inputs:
- *   r9 : paddr(start)
- *   r10: phys offset
- *   lr : Virtual address to return to.
- *
- * Output:
- *   r12: Was a temporary mapping created?
- *
- * Clobbers r0 - r6
- */
-enable_secondary_cpu_mm:
-        mov   r6, lr
-
-        bl    create_page_tables
-
-        /* Address in the runtime mapping to jump to after the MMU is enabled */
-        mov_w lr, 1f
-        b     enable_mmu
-1:
-        /*
-         * Non-boot CPUs need to move on to the proper pagetables, which were
-         * setup in prepare_secondary_mm.
-         *
-         * XXX: This is not compliant with the Arm Arm.
-         */
-        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
-        ldrd  r4, r5, [r4]           /* Actual value */
-        dsb
-        mcrr  CP64(r4, r5, HTTBR)
-        dsb
-        isb
-        flush_xen_tlb_local r0
-        pt_enforce_wxn r0
-
-        /* Return to the virtual address requested by the caller. */
-        mov   pc, r6
-ENDPROC(enable_secondary_cpu_mm)
-
-/*
- * Enable mm (turn on the data cache and the MMU) for the boot CPU.
- * The function will return to the virtual address provided in LR (e.g. the
- * runtime mapping).
- *
- * Inputs:
- *   r9 : paddr(start)
- *   r10: phys offset
- *   lr : Virtual address to return to.
- *
- * Output:
- *   r12: Was a temporary mapping created?
- *
- * Clobbers r0 - r6
- */
-enable_boot_cpu_mm:
-        mov   r6, lr
-
-        bl    create_page_tables
-
-        /* Address in the runtime mapping to jump to after the MMU is enabled */
-        mov_w lr, 1f
-        b     enable_mmu
-1:
-        /*
-         * Prepare the fixmap. The function will return to the virtual address
-         * requested by the caller.
-         */
-        mov   lr, r6
-
-        b     setup_fixmap
-ENDPROC(enable_boot_cpu_mm)
-
-/*
- * Remove the 1:1 map from the page-tables. It is not easy to keep track
- * where the 1:1 map was mapped, so we will look for the top-level entry
- * exclusive to the 1:1 map and remove it.
- *
- * Inputs:
- *   r9 : paddr(start)
- *
- * Clobbers r0 - r3
- */
-remove_identity_mapping:
-        /* r2:r3 := invalid page-table entry */
-        mov   r2, #0x0
-        mov   r3, #0x0
-
-        /* Find the first slot used and remove it */
-        get_table_slot r1, r9, 1     /* r1 := first slot */
-        mov_w r0, boot_pgtable       /* r0 := root table */
-        lsl   r1, r1, #3             /* r1 := Slot offset */
-        strd  r2, r3, [r0, r1]
-
-        flush_xen_tlb_local r0
-        mov   pc, lr
-ENDPROC(remove_identity_mapping)
-
-/*
- * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
- *
- * Clobbers r0 - r3
- */
-remove_temporary_mapping:
-        /* r2:r3 := invalid page-table entry */
-        mov   r2, #0
-        mov   r3, #0
-
-        adr_l r0, boot_pgtable
-        mov_w r1, TEMPORARY_XEN_VIRT_START
-        get_table_slot r1, r1, 1     /* r1 := first slot */
-        lsl   r1, r1, #3             /* r1 := first slot offset */
-        strd  r2, r3, [r0, r1]
-
-        flush_xen_tlb_local r0
-
-        mov  pc, lr
-ENDPROC(remove_temporary_mapping)
-
-/*
- * Map the UART in the fixmap (when earlyprintk is used) and hook the
- * fixmap table in the page tables.
- *
- * The fixmap cannot be mapped in create_page_tables because it may
- * clash with the 1:1 mapping.
- *
- * Inputs:
- *   r10: Physical offset
- *   r11: Early UART base physical address
- *
- * Clobbers r0 - r4
- */
-setup_fixmap:
-#if defined(CONFIG_EARLY_PRINTK)
-        /* Add UART to the fixmap table */
-        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
-#endif
-        /* Map fixmap into boot_second */
-        mov_w r0, FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, r0, 2
-        /* Ensure any page table updates made above have occurred. */
-        dsb   nshst
-        /*
-         * The fixmap area will be used soon after. So ensure no hardware
-         * translation happens before the dsb completes.
-         */
-        isb
-
-        mov   pc, lr
-ENDPROC(setup_fixmap)
-
 /*
  * Setup the initial stack and jump to the C world
  *
@@ -856,38 +274,6 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
-/*
- * Switch TTBR
- * r1:r0       ttbr
- *
- * TODO: This code does not comply with break-before-make.
- */
-ENTRY(switch_ttbr)
-        dsb                            /* Ensure the flushes happen before
-                                        * continuing */
-        isb                            /* Ensure synchronization with previous
-                                        * changes to text */
-        mcr   CP32(r0, TLBIALLH)       /* Flush hypervisor TLB */
-        mcr   CP32(r0, ICIALLU)        /* Flush I-cache */
-        mcr   CP32(r0, BPIALL)         /* Flush branch predictor */
-        dsb                            /* Ensure completion of TLB+BP flush */
-        isb
-
-        mcrr  CP64(r0, r1, HTTBR)
-
-        dsb                            /* ensure memory accesses do not cross
-                                        * over the TTBR0 write */
-        isb                            /* Ensure synchronization with previous
-                                        * changes to text */
-        mcr   CP32(r0, TLBIALLH)       /* Flush hypervisor TLB */
-        mcr   CP32(r0, ICIALLU)        /* Flush I-cache */
-        mcr   CP32(r0, BPIALL)         /* Flush branch predictor */
-        dsb                            /* Ensure completion of TLB+BP flush */
-        isb
-
-        mov pc, lr
-ENDPROC(switch_ttbr)
-
 #ifdef CONFIG_EARLY_PRINTK
 /*
  * Initialize the UART. Should only be called on the boot CPU.
@@ -912,14 +298,14 @@ ENDPROC(init_uart)
  * r11: Early UART base address
  * Clobbers r0-r1
  */
-puts:
+ENTRY(asm_puts)
         early_uart_ready r11, r1
         ldrb  r1, [r0], #1           /* Load next char */
         teq   r1, #0                 /* Exit on nul */
         moveq pc, lr
         early_uart_transmit r11, r1
-        b puts
-ENDPROC(puts)
+        b asm_puts
+ENDPROC(asm_puts)
 
 /*
  * Print a 32-bit number in hex.  Specific to the PL011 UART.
@@ -927,7 +313,7 @@ ENDPROC(puts)
  * r11: Early UART base address
  * Clobbers r0-r3
  */
-putn:
+ENTRY(asm_putn)
         adr_l r1, hex
         mov   r3, #8
 1:
@@ -939,7 +325,7 @@ putn:
         subs  r3, r3, #1
         bne   1b
         mov   pc, lr
-ENDPROC(putn)
+ENDPROC(asm_putn)
 
 RODATA_STR(hex, "0123456789abcdef")
 
@@ -947,8 +333,8 @@ RODATA_STR(hex, "0123456789abcdef")
 
 ENTRY(early_puts)
 init_uart:
-puts:
-putn:   mov   pc, lr
+asm_puts:
+asm_putn:   mov   pc, lr
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
diff --git a/xen/arch/arm/arm32/mmu/Makefile b/xen/arch/arm/arm32/mmu/Makefile
index b18cec4836..a8a750a3d0 100644
--- a/xen/arch/arm/arm32/mmu/Makefile
+++ b/xen/arch/arm/arm32/mmu/Makefile
@@ -1 +1,2 @@
+obj-y += head.o
 obj-y += mm.o
diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
new file mode 100644
index 0000000000..6d427328f3
--- /dev/null
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -0,0 +1,573 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/arm32/mmu/head.S
+ *
+ * Arm32 MMU specific start-of-day code.
+ */
+
+#include <asm/page.h>
+#include <asm/early_printk.h>
+
+#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
+#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
+#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
+
+#define PT_UPPER(x) (PT_##x & 0xf00)
+#define PT_LOWER(x) (PT_##x & 0x0ff)
+
+/* Convenience defines to get slot used by Xen mapping. */
+#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
+#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
+
+/* Offset between the early boot xen mapping and the runtime xen mapping */
+#define XEN_TEMPORARY_OFFSET      (TEMPORARY_XEN_VIRT_START - XEN_VIRT_START)
+
+.macro load_paddr rb, sym
+        mov_w \rb, \sym
+        add   \rb, \rb, r10
+.endm
+
+/*
+ * Flush local TLBs
+ *
+ * @tmp: Scratch register
+ *
+ * See asm/arm32/flushtlb.h for the explanation of the sequence.
+ */
+.macro flush_xen_tlb_local tmp
+        dsb   nshst
+        mcr   CP32(\tmp, TLBIALLH)
+        dsb   nsh
+        isb
+.endm
+
+/*
+ * Enforce Xen page-tables do not contain mapping that are both
+ * Writable and eXecutables.
+ *
+ * This should be called on each secondary CPU.
+ */
+.macro pt_enforce_wxn tmp
+        mrc   CP32(\tmp, HSCTLR)
+        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
+        dsb
+        mcr   CP32(\tmp, HSCTLR)
+        /*
+         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
+         * before flushing the TLBs.
+         */
+        isb
+        flush_xen_tlb_local \tmp
+.endm
+
+/* Macro to find the slot number at a given page-table level
+ *
+ * slot:     slot computed
+ * virt:     virtual address
+ * lvl:      page-table level
+ *
+ * Note that ubxf is unpredictable when the end bit is above 32-bit. So we
+ * can't use it for first level offset.
+ */
+.macro get_table_slot, slot, virt, lvl
+    .if \lvl == 1
+        lsr   \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl)
+    .else
+        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
+    .endif
+.endm
+
+/*
+ * Macro to create a page table entry in \ptbl to \tbl (physical
+ * address)
+ *
+ * ptbl:    table symbol where the entry will be created
+ * tbl:     physical address of the table to point to
+ * virt:    virtual address
+ * lvl:     page-table level
+ *
+ * Preserves \virt
+ * Clobbers \tbl, r1 - r3
+ *
+ * Note that \tbl and \virt should be in a register other than r1 - r3
+ */
+.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
+        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tbl */
+        lsl   r1, r1, #3                /* r1 := slot offset in \tbl */
+
+        movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
+        orr   r2, r2, \tbl           /*           + \tbl paddr */
+        mov   r3, #0
+
+        adr_l \tbl, \ptbl            /* \tbl := (v,p)addr of \ptbl */
+
+        strd  r2, r3, [\tbl, r1]
+.endm
+
+
+/*
+ * Macro to create a page table entry in \ptbl to \tbl (symbol)
+ *
+ * ptbl:    table symbol where the entry will be created
+ * tbl:     table symbol to point to
+ * virt:    virtual address
+ * lvl:     page-table level
+ *
+ * Preserves \virt
+ * Clobbers r1 - r4
+ *
+ * Also use r10 for the phys offset.
+ *
+ * Note that \virt should be in a register other than r1 - r4
+ */
+.macro create_table_entry, ptbl, tbl, virt, lvl
+        load_paddr r4, \tbl
+        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
+ .endm
+
+/*
+ * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
+ * level table (i.e page granularity) is supported.
+ *
+ * ptbl:     table symbol where the entry will be created
+ * virt:    virtual address
+ * phys:    physical address
+ * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
+ *
+ * Preserves \virt, \phys
+ * Clobbers r1 - r4
+ *
+ * Note that \virt and \paddr should be in other registers than r1 - r4
+ * and be distinct.
+ */
+.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3
+        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
+        lsr   r1, \virt, #THIRD_SHIFT
+        and   r1, r1, r2             /* r1 := slot in \tlb */
+        lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
+
+        lsr   r4, \phys, #THIRD_SHIFT
+        lsl   r4, r4, #THIRD_SHIFT   /* r4 := PAGE_ALIGNED(phys) */
+
+        movw  r2, #\type             /* r2:r3 := right for section PT */
+        orr   r2, r2, r4             /*          + PAGE_ALIGNED(phys) */
+        mov   r3, #0
+
+        adr_l r4, \ptbl
+
+        strd  r2, r3, [r4, r1]
+.endm
+
+.section .text.idmap, "ax", %progbits
+
+/*
+ * Rebuild the boot pagetable's first-level entries. The structure
+ * is described in mm.c.
+ *
+ * After the CPU enables paging it will add the fixmap mapping
+ * to these page tables, however this may clash with the 1:1
+ * mapping. So each CPU must rebuild the page tables here with
+ * the 1:1 in place.
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *   r10: phys offset
+ *
+ * Output:
+ *   r12: Was a temporary mapping created?
+ *
+ * Clobbers r0 - r5
+ */
+create_page_tables:
+        /* Prepare the page-tables for mapping Xen */
+        mov_w r0, XEN_VIRT_START
+
+        /*
+         * We need to use a stash register because
+         * create_table_entry_paddr() will clobber the register storing
+         * the physical address of the table to point to.
+         */
+        adr_l r5, boot_third
+        mov_w r4, XEN_VIRT_START
+.rept XEN_NR_ENTRIES(2)
+        mov   r0, r5                        /* r0 := paddr(l3 table) */
+        create_table_entry_from_paddr boot_second, r0, r4, 2
+        add   r4, r4, #XEN_PT_LEVEL_SIZE(2) /* r4 := Next vaddr */
+        add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
+.endr
+
+        /*
+         * Find the size of Xen in pages and multiply by the size of a
+         * PTE. This will then be compared in the mapping loop below.
+         *
+         * Note the multiplication is just to avoid using an extra
+         * register/instruction per iteration.
+         */
+        mov_w r0, _start            /* r0 := vaddr(_start) */
+        mov_w r1, _end              /* r1 := vaddr(_end) */
+        sub   r0, r1, r0            /* r0 := effective size of Xen */
+        lsr   r0, r0, #PAGE_SHIFT   /* r0 := Number of pages for Xen */
+        lsl   r0, r0, #3            /* r0 := Number of pages * PTE size */
+
+        /* Setup boot_third: */
+        adr_l r4, boot_third
+
+        lsr   r2, r9, #THIRD_SHIFT  /* Base address for 4K mapping */
+        lsl   r2, r2, #THIRD_SHIFT
+        orr   r2, r2, #PT_UPPER(MEM_L3) /* r2:r3 := map */
+        orr   r2, r2, #PT_LOWER(MEM_L3)
+        mov   r3, #0x0
+
+        /* ... map of vaddr(start) in boot_third */
+        mov   r1, #0
+1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
+        add   r2, r2, #PAGE_SIZE     /* Next page */
+        add   r1, r1, #8             /* Next slot */
+        cmp   r1, r0                 /* Loop until we map all of Xen */
+        blo   1b
+
+        /*
+         * Setup the 1:1 mapping so we can turn the MMU on. Note that
+         * only the first page of Xen will be part of the 1:1 mapping.
+         */
+        create_table_entry boot_pgtable, boot_second_id, r9, 1
+        create_table_entry boot_second_id, boot_third_id, r9, 2
+        create_mapping_entry boot_third_id, r9, r9
+
+        /*
+         * Find the first slot used. If the slot is not the same
+         * as TEMPORARY_AREA_FIRST_SLOT, then we will want to switch
+         * to the temporary mapping before jumping to the runtime
+         * virtual mapping.
+         */
+        get_table_slot r1, r9, 1     /* r1 := first slot */
+        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
+        bne   use_temporary_mapping
+
+        mov_w r0, XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_second, r0, 1
+        mov   r12, #0                /* r12 := temporary mapping not created */
+        mov   pc, lr
+
+use_temporary_mapping:
+        /*
+         * The identity mapping is not using the first slot
+         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
+         * See switch_to_runtime_mapping for more details.
+         */
+        PRINT("- Create temporary mapping -\r\n")
+
+        /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
+        mov_w r0, TEMPORARY_XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_second, r0, 1
+
+        mov   r12, #1                /* r12 := temporary mapping created */
+        mov   pc, lr
+ENDPROC(create_page_tables)
+
+/*
+ * Turn on the Data Cache and the MMU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *  r12 : Was the temporary mapping created?
+ *   lr : Virtual address to return to
+ *
+ * Clobbers r0 - r5
+ */
+enable_mmu:
+        PRINT("- Turning on paging -\r\n")
+
+        /*
+         * The state of the TLBs is unknown before turning on the MMU.
+         * Flush them to avoid stale one.
+         */
+        flush_xen_tlb_local r0
+
+        /* Write Xen's PT's paddr into the HTTBR */
+        adr_l r0, boot_pgtable
+        mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
+        mcrr  CP64(r0, r1, HTTBR)
+        isb
+
+        mrc   CP32(r0, HSCTLR)
+        /* Enable MMU and D-cache */
+        orr   r0, r0, #(SCTLR_Axx_ELx_M|SCTLR_Axx_ELx_C)
+        dsb                          /* Flush PTE writes and finish reads */
+        mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
+        isb                          /* Now, flush the icache */
+
+        /*
+         * The MMU is turned on and we are in the 1:1 mapping. Switch
+         * to the runtime mapping.
+         */
+        mov   r5, lr                /* Save LR before overwritting it */
+        mov_w lr, 1f                /* Virtual address in the runtime mapping */
+        b     switch_to_runtime_mapping
+1:
+        mov   lr, r5                /* Restore LR */
+        /*
+         * At this point, either the 1:1 map or the temporary mapping
+         * will be present. The former may clash with other parts of the
+         * Xen virtual memory layout. As both of them are not used
+         * anymore, remove them completely to avoid having to worry
+         * about replacing existing mapping afterwards.
+         *
+         * On return this will jump to the virtual address requested by
+         * the caller.
+         */
+        teq   r12, #0
+        beq   remove_identity_mapping
+        b     remove_temporary_mapping
+ENDPROC(enable_mmu)
+
+/*
+ * Switch to the runtime mapping. The logic depends on whether the
+ * runtime virtual region is clashing with the physical address
+ *
+ *  - If it is not clashing, we can directly jump to the address in
+ *    the runtime mapping.
+ *  - If it is clashing, create_page_tables() would have mapped Xen to
+ *    a temporary virtual address. We need to switch to the temporary
+ *    mapping so we can remove the identity mapping and map Xen at the
+ *    correct position.
+ *
+ * Inputs
+ *    r9: paddr(start)
+ *   r12: Was a temporary mapping created?
+ *    lr: Address in the runtime mapping to jump to
+ *
+ * Clobbers r0 - r4
+ */
+switch_to_runtime_mapping:
+        /*
+         * Jump to the runtime mapping if the virt and phys are not
+         * clashing
+         */
+        teq   r12, #0
+        beq   ready_to_switch
+
+        /* We are still in the 1:1 mapping. Jump to the temporary Virtual address. */
+        mov_w r0, 1f
+        add   r0, r0, #XEN_TEMPORARY_OFFSET /* r0 := address in temporary mapping */
+        mov   pc, r0
+
+1:
+        /* Remove boot_second_id */
+        mov   r2, #0
+        mov   r3, #0
+        adr_l r0, boot_pgtable
+        get_table_slot r1, r9, 1            /* r1 := first slot */
+        lsl   r1, r1, #3                    /* r1 := first slot offset */
+        strd  r2, r3, [r0, r1]
+
+        flush_xen_tlb_local r0
+
+        /* Map boot_second into boot_pgtable */
+        mov_w r0, XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_second, r0, 1
+
+        /* Ensure any page table updates are visible before continuing */
+        dsb   nsh
+        /*
+         * The function will return on the runtime mapping. So we want
+         * to prevent instruction fetch before the dsb completes.
+         */
+        isb
+
+ready_to_switch:
+        mov   pc, lr
+ENDPROC(switch_to_runtime_mapping)
+
+/*
+ * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *   r10: phys offset
+ *   lr : Virtual address to return to.
+ *
+ * Output:
+ *   r12: Was a temporary mapping created?
+ *
+ * Clobbers r0 - r6
+ */
+ENTRY(enable_secondary_cpu_mm)
+        mov   r6, lr
+
+        bl    create_page_tables
+
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, 1f
+        b     enable_mmu
+1:
+        /*
+         * Non-boot CPUs need to move on to the proper pagetables, which were
+         * setup in prepare_secondary_mm.
+         *
+         * XXX: This is not compliant with the Arm Arm.
+         */
+        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
+        ldrd  r4, r5, [r4]           /* Actual value */
+        dsb
+        mcrr  CP64(r4, r5, HTTBR)
+        dsb
+        isb
+        flush_xen_tlb_local r0
+        pt_enforce_wxn r0
+
+        /* Return to the virtual address requested by the caller. */
+        mov   pc, r6
+ENDPROC(enable_secondary_cpu_mm)
+
+/*
+ * Enable mm (turn on the data cache and the MMU) for the boot CPU.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *   r10: phys offset
+ *   lr : Virtual address to return to.
+ *
+ * Output:
+ *   r12: Was a temporary mapping created?
+ *
+ * Clobbers r0 - r6
+ */
+ENTRY(enable_boot_cpu_mm)
+        mov   r6, lr
+
+        bl    create_page_tables
+
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, 1f
+        b     enable_mmu
+1:
+        /* Return to the virtual address requested by the caller. */
+        mov   lr, r6
+
+        b     setup_fixmap
+ENDPROC(enable_boot_cpu_mm)
+
+/*
+ * Remove the 1:1 map from the page-tables. It is not easy to keep track
+ * where the 1:1 map was mapped, so we will look for the top-level entry
+ * exclusive to the 1:1 map and remove it.
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *
+ * Clobbers r0 - r3
+ */
+remove_identity_mapping:
+        /* r2:r3 := invalid page-table entry */
+        mov   r2, #0x0
+        mov   r3, #0x0
+
+        /* Find the first slot used and remove it */
+        get_table_slot r1, r9, 1     /* r1 := first slot */
+        mov_w r0, boot_pgtable       /* r0 := root table */
+        lsl   r1, r1, #3             /* r1 := Slot offset */
+        strd  r2, r3, [r0, r1]
+
+        flush_xen_tlb_local r0
+        mov   pc, lr
+ENDPROC(remove_identity_mapping)
+
+/*
+ * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
+ *
+ * Clobbers r0 - r3
+ */
+remove_temporary_mapping:
+        /* r2:r3 := invalid page-table entry */
+        mov   r2, #0
+        mov   r3, #0
+
+        adr_l r0, boot_pgtable
+        mov_w r1, TEMPORARY_XEN_VIRT_START
+        get_table_slot r1, r1, 1     /* r1 := first slot */
+        lsl   r1, r1, #3             /* r1 := first slot offset */
+        strd  r2, r3, [r0, r1]
+
+        flush_xen_tlb_local r0
+
+        mov  pc, lr
+ENDPROC(remove_temporary_mapping)
+
+/*
+ * Map the UART in the fixmap (when earlyprintk is used) and hook the
+ * fixmap table in the page tables.
+ *
+ * The fixmap cannot be mapped in create_page_tables because it may
+ * clash with the 1:1 mapping.
+ *
+ * Inputs:
+ *   r10: Physical offset
+ *   r11: Early UART base physical address
+ *
+ * Clobbers r0 - r4
+ */
+setup_fixmap:
+#if defined(CONFIG_EARLY_PRINTK)
+        /* Add UART to the fixmap table */
+        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
+        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
+#endif
+        /* Map fixmap into boot_second */
+        mov_w r0, FIXMAP_ADDR(0)
+        create_table_entry boot_second, xen_fixmap, r0, 2
+        /* Ensure any page table updates made above have occurred. */
+        dsb   nshst
+        /*
+         * The fixmap area will be used soon after. So ensure no hardware
+         * translation happens before the dsb completes.
+         */
+        isb
+
+        mov   pc, lr
+ENDPROC(setup_fixmap)
+
+/* Fail-stop */
+fail:   PRINT("- Boot failed -\r\n")
+1:      wfe
+        b     1b
+ENDPROC(fail)
+
+/*
+ * Switch TTBR
+ * r1:r0       ttbr
+ *
+ * TODO: This code does not comply with break-before-make.
+ */
+ENTRY(switch_ttbr)
+        dsb                            /* Ensure the flushes happen before
+                                        * continuing */
+        isb                            /* Ensure synchronization with previous
+                                        * changes to text */
+        mcr   CP32(r0, TLBIALLH)       /* Flush hypervisor TLB */
+        mcr   CP32(r0, ICIALLU)        /* Flush I-cache */
+        mcr   CP32(r0, BPIALL)         /* Flush branch predictor */
+        dsb                            /* Ensure completion of TLB+BP flush */
+        isb
+
+        mcrr  CP64(r0, r1, HTTBR)
+
+        dsb                            /* ensure memory accesses do not cross
+                                        * over the TTBR0 write */
+        isb                            /* Ensure synchronization with previous
+                                        * changes to text */
+        mcr   CP32(r0, TLBIALLH)       /* Flush hypervisor TLB */
+        mcr   CP32(r0, ICIALLU)        /* Flush I-cache */
+        mcr   CP32(r0, BPIALL)         /* Flush branch predictor */
+        dsb                            /* Ensure completion of TLB+BP flush */
+        isb
+
+        mov pc, lr
+ENDPROC(switch_ttbr)
diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
index a4e20aa520..c6e390cc5f 100644
--- a/xen/arch/arm/include/asm/arm32/macros.h
+++ b/xen/arch/arm/include/asm/arm32/macros.h
@@ -1,8 +1,62 @@
 #ifndef __ASM_ARM_ARM32_MACROS_H
 #define __ASM_ARM_ARM32_MACROS_H
 
-    .macro ret
+.macro ret
         mov     pc, lr
-    .endm
+.endm
 
+/*
+ * Move an immediate constant into a 32-bit register using movw/movt
+ * instructions.
+ */
+.macro mov_w reg, word
+        movw  \reg, #:lower16:\word
+        movt  \reg, #:upper16:\word
+.endm
+
+/*
+ * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
+ * within the range +/- 4GB of the PC.
+ *
+ * @dst: destination register
+ * @sym: name of the symbol
+ */
+.macro adr_l, dst, sym
+        mov_w \dst, \sym - .Lpc\@
+        .set  .Lpc\@, .+ 8          /* PC bias */
+        add   \dst, \dst, pc
+.endm
+
+#ifdef CONFIG_EARLY_PRINTK
+/*
+ * Macro to print a string to the UART, if there is one.
+ *
+ * Clobbers r0 - r3
+ */
+#define PRINT(_s)           \
+        mov   r3, lr       ;\
+        adr_l r0, 98f      ;\
+        bl    puts         ;\
+        mov   lr, r3       ;\
+        RODATA_STR(98, _s)
+
+/*
+ * Macro to print the value of register \rb
+ *
+ * Clobbers r0 - r4
+ */
+.macro print_reg rb
+        mov   r0, \rb
+        mov   r4, lr
+        bl    asm_putn
+        mov   lr, r4
+.endm
+
+#else /* CONFIG_EARLY_PRINTK */
+#define PRINT(s)
+
+.macro print_reg rb
+.endm
+
+#endif /* !CONFIG_EARLY_PRINTK */
 #endif /* __ASM_ARM_ARM32_MACROS_H */
-- 
2.25.1



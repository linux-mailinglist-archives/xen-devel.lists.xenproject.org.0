Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BFA538BCE
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 09:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339125.563959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzj-00014f-9R; Tue, 31 May 2022 07:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339125.563959; Tue, 31 May 2022 07:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvvzj-0000wf-3y; Tue, 31 May 2022 07:08:47 +0000
Received: by outflank-mailman (input) for mailman id 339125;
 Tue, 31 May 2022 06:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfOh=WH=gmail.com=xiexun162534@srs-se1.protection.inumbo.net>)
 id 1nvvpS-00080v-3u
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 06:58:10 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04acad78-e0af-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 08:58:04 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so654757wmh.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 23:58:09 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::944:e002])
 by smtp.gmail.com with ESMTPSA id
 n187-20020a1c27c4000000b0039c151298b7sm1279153wmn.10.2022.05.30.23.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 23:58:08 -0700 (PDT)
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
X-Inumbo-ID: 04acad78-e0af-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CEpuS4nyL9xBeJ8gWg6KUIfHgSQdlLCHmTciU0vGv5I=;
        b=OtHXDSEXHUywGqt/aOY4wMPgBa0YKJSXraa0I4Y0zE+D1Z3DNEYumIlw/7ZKY4Rvnu
         4G4XGLBLOwhl2l9RxwlWY+xHtvrhS7WEfsWYZFafQQElJEFkBBJpVRMcAu6YEWPDwHJX
         Lq63srqShfnyPTvUPcjO9pBqPy9/KIlfFqA1b5+DtXOgmQM+YygIeyH3FdswKFIudoUj
         Uy69c0gKEAECpcwUO+PCbBgJCHrE7ASss++GOJ+6xazwAfVtGHEOQ11uAs/R/wIgGgCe
         akH+Y08AbUh2N20c/e0VaLbJX4wMuoeFehbrkdpWmOq3C9gTFWcpscCDI4xxz9kvRbjd
         qV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CEpuS4nyL9xBeJ8gWg6KUIfHgSQdlLCHmTciU0vGv5I=;
        b=1VN5D13cFogFC7fKEFL1gxOxgzzBs7l2LcDUuLCktQ1dOwbUDIJXqs7E4IdJsTQUgE
         YnK3DudAuoROoUVLkku8Qn6er8Dpi5Er4myMHx171IQPIKveBsVixtSZnJfLiGVyit9g
         FAnqkjYFVm/FbiLoJtOEFP1+L8QDSyuCxc17DBU40ZrFfB85wlZYduuf7idgUpRngvXo
         q7HhSAHLpU7xh1t468tf/2UUe6uknHE8ldImcYE7HTR1S2b4V8cTsUuairswKzsxfsDJ
         6nt4Gr3LrdtWPWS86wx9+SJiS1okE9Irh+4Pl3nqamfrmf338qI98ai+U1kj1XlrGFBw
         eKig==
X-Gm-Message-State: AOAM531QEgvLVGRmB8NrGztUtFzbIsNJy1dJ8fBSG+DrIlRDA8ifcl4i
	Ga6iMkO3rZrnPhS6TmAWmLn1OHvDqm8=
X-Google-Smtp-Source: ABdhPJwxB+/No5F95vSmzrt4YN9i3rg7L4H8aG4oml3GEuLelptEEhBsfCTROm6wewZ1UdIQl8RS8w==
X-Received: by 2002:a1c:e903:0:b0:397:36b8:795a with SMTP id q3-20020a1ce903000000b0039736b8795amr22807136wmc.98.1653980288810;
        Mon, 30 May 2022 23:58:08 -0700 (PDT)
From: Xie Xun <xiexun162534@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xie Xun <xiexun162534@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [RFC PATCH 3/6] xen/riscv: Add head.S
Date: Tue, 31 May 2022 14:57:09 +0800
Message-Id: <0829a14c1fab18619fc0ef53cda6387e8bc09d1e.1653977696.git.xiexun162534@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653977696.git.xiexun162534@gmail.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

head.S initializes bss, calls _setup_initial_pagetables to set up
initial page tables, switch from load address to virtual address, and
jump to C entry start_xen.

Signed-off-by: Xie Xun <xiexun162534@gmail.com>
---
 xen/arch/riscv/riscv64/head.S | 206 ++++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 5cccab09c7..66c44cadf7 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -7,7 +7,213 @@
 
 	.section .text.header, "ax", %progbits
 ENTRY(start)
+	/* Mask all interrupts */
+	csrw CSR_SIE, zero
+
+	/*
+	 * Disable FPU to detect illegal usage of
+	 * floating point in kernel space
+	 */
+	li t0, SSTATUS_FS
+	csrc CSR_SSTATUS, t0
+
+	/* Save HART ID and DTB base */
+	lla	a6, _bootcpu_reg0
+	REG_S	a0, (a6)
+	lla	a6, _bootcpu_reg1
+	REG_S	a1, (a6)
+
+	/*
+	 * Select CPU 0, hang the rest.
+	 * TODO: support SMP
+	 */
+	lla a3, hart_lottery
+	li a2, 1
+	amoadd.w a3, a2, (a3)
+	bnez a3, _start_hang
+
+_save_load_addresses:
+	/* Save load addresses
+	 * a2 -> load start
+	 * a3 -> load end
+	 * a4 -> execution start
+	 * a5 -> execution end
+	 */
+	lla	a2, _start
+	lla	a6, __exec_start
+	REG_L	a4, (a6)
+	lla	a6, __exec_end
+	REG_L	a5, (a6)
+	sub	a6, a5, a4
+	add	a3, a2, a6
+	lla	a6, _load_start
+	REG_S	a2, (a6)
+	lla	a6, _load_end
+	REG_S	a3, (a6)
+	lla	a6, _end
+	REG_S	a3, (a6)
+
+_bss_zero_start:
+	/* Zero-out bss section */
+	lla	a6, __bss_start
+	REG_L	a0, (a6)
+	sub	a0, a0, a4
+	add	a0, a0, a2
+	lla	a6, __bss_end
+	REG_L	a1, (a6)
+	sub	a1, a1, a4
+	add	a1, a1, a2
+_bss_zero_loop:
+	REG_S	zero, (a0)
+	add	a0, a0, __SIZEOF_POINTER__
+	blt	a0, a1, _bss_zero_loop
+
+	/* Setup temporary stack */
+	lla	a6, __hvc_stack_end
+	REG_L	a0, (a6)
+	sub	a0, a0, a4
+	add	sp, a0, a2
+
+        /* Setup hang for IRQ vector w/ virtual address */
+	lla	a6, __debug_irq_vector
+        REG_L   a4, (a6)
+	csrw	CSR_STVEC, a4
+
+	/* Setup initial page table */
+	lla	a6, _load_start
+	REG_L	a0, (a6)
+	lla	a6, _load_end
+	REG_L	a1, (a6)
+	lla	a6, __exec_start
+	REG_L	a2, (a6)
+	lla	a6, __exec_end
+	REG_L	a3, (a6)
+	call	_setup_initial_pagetables
+
+    lla      a0, _bootcpu_reg0
+    REG_L   a0, (a0)
+
+/* a0 must equal the hartid */
+_set_xen_tp:
+    /* Load pcpu_info[NR_CPUS] address */
+    lla  a6, pcpu_info
+
+    /* Adjust by phys_offset so it doesn't require the identity map */
+    lla  a7, phys_offset
+    REG_L   a7, (a7)
+    sub a6, a6, a7
+
+    /* Index into pcpu_info array with hartid */
+    li  a7, PCPUINFO_sizeof
+    mul a7, a7, a0
+    add a6, a6, a7
+
+    /* Set tp = &pcpu_info[hartid] */
+    add tp, a6, zero
+
+    /* set processor id of pcpu_info[hartid].processor_id */
+    REG_S a0, RISCV_PCPUINFO_OFFSET(processor_id)(tp)
+
+    /* Move stack pointer */
+    lla  t0, phys_offset
+    REG_L   t0, (t0)
+    sub sp, sp, t0
+    
+
+	j	_start_secondary_nopen
+
+	.align	3
+_start_lottery:
+	RISCV_PTR	0
+	.align	3
+__start_secondary_pen_release:
+	RISCV_PTR	start_secondary_pen_release
+
+	/*
+	 * Note: From this point primary CPU startup is same as secondary CPU
+	 */
+_start_secondary_nopen:
+	/* Set trap vector to spin forever to help debug */
+	//lla	a6, _start_hang
+	//csrw	CSR_STVEC, a6
+
+	/* Jump to final execution address */
+	lla	a6, __cpu_init
+	REG_L	a0, (a6)
+	jalr	a0
+
+        .align 4
 _start_hang:
 	wfi
 	j	_start_hang
+
+	.align 3
+__phys_offset:
+	RISCV_PTR phys_offset
+__pgtbl_root:
+	RISCV_PTR xen_second_pagetable
+__exec_start:
+	RISCV_PTR _code_start
+__exec_end:
+	RISCV_PTR _code_end
+__bss_start:
+	RISCV_PTR _bss_start
+__bss_end:
+	RISCV_PTR _bss_end
+__debug_irq_vector:
+	RISCV_PTR _start_hang
+__cpu_init:
+	RISCV_PTR _cpu_init
+
+	/*
+	 * Boot register 0 passed by bootloader
+	 */
+	.globl _bootcpu_reg0
+_bootcpu_reg0:
+	RISCV_PTR 0x0
+
+	/*
+	 * Boot register 1 passed by bootloader
+	 */
+	.globl _boot_reg1
+_bootcpu_reg1:
+	RISCV_PTR 0x0
+
+	/*
+	 * Load start address storage
+	 */
+	.globl _load_start
+_load_start:
+	RISCV_PTR 0x0
+
+	/*
+	 * Load end address storage
+	 */
+	.globl _load_end
+_load_end:
+	RISCV_PTR 0x0
+
+        .globl _end
+_end:
+	RISCV_PTR 0x0
+
+	/*
+	 * Exception stacks.
+	 */
+__hvc_stack_end:
+	RISCV_PTR _hvc_stack_end
+
+	.align 3
+	.globl _cpu_init
+_cpu_init:
+	/* Jump to C code */
+	lla	a6, _bootcpu_reg1
+	REG_L	a0, (a6)
+	lla  a6, phys_offset
+	REG_L   a1, (a6)
+
+	call	start_xen
+
+	/* Hang !!! */
+	j	_start_hang
 ENDPROC(start)
-- 
2.30.2



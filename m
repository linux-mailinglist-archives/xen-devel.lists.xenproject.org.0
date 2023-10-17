Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C827CC8CB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 18:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618302.961780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmvt-0006b3-FW; Tue, 17 Oct 2023 16:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618302.961780; Tue, 17 Oct 2023 16:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmvt-0006VS-Br; Tue, 17 Oct 2023 16:28:37 +0000
Received: by outflank-mailman (input) for mailman id 618302;
 Tue, 17 Oct 2023 16:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QyJ2=F7=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qsmvs-0006TP-EY
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 16:28:36 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377a6e79-6d0a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 18:28:34 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso9140867a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 09:28:34 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 b42-20020a509f2d000000b0053e43492ef1sm1515759edf.65.2023.10.17.09.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 09:28:33 -0700 (PDT)
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
X-Inumbo-ID: 377a6e79-6d0a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697560114; x=1698164914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qD1TIlJEBCWEp5FpDJPkSVLZhr5746v+N1MHVT+wqUc=;
        b=lKFTHmMFYUWcObPkus4cfjhK8pP5FF3bUA9bmCiIvFhnLghyZTyEJGomV9EYCOK4s7
         tvDMHPgndD3tENanAFEuKMbLQedkgITEH+0J6S19U5gAvbELJBd6LWs4tETkTIfo+ldp
         lf71mPC5AFI9FVi0G1AvUZ7EW4mb8pul1OSqgGj8PeUFi591olgI4JGdn8hRsl36ICTW
         rO+Tw1H2x2n8nI4QvspJfqOW/zYCTNxdWTw7Sy4yNQpJAUTOvmSHiVq5RT7zcUm8Ug4n
         AYF1hzrxOPuXz74ir41AQtxmHxsQehBCN8nNrmy7hpKe+YSlYO/mhcoSGqa+JWY5vdQj
         Ei4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560114; x=1698164914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qD1TIlJEBCWEp5FpDJPkSVLZhr5746v+N1MHVT+wqUc=;
        b=cxUnIo8ECECQPNHl0byPTxDRMKQBTFJNqbexEyb1Q1hk55xYGXWwXrD8GVrvLhJe4z
         UHT2yfwbWSO+xgu5iEDDTBrPiZTA7Z0vD0KPappSu3DL1Cn7WVyBuonbPTdbWxj3XSR0
         cG2BB7iLGeNtXfQqCwXUsE879qs0h5UVISMgHmgxSwg0O/gEMiqcCBDpzbqBghHjklFe
         WDkSoVVtlxksz1xIk1dZfXdSAZcwiKdDht9J7TCUD+7+QwTPsPTcmQJS7uNF/lH5w4Mb
         9R6Mp73EUYRPk2rIrItbea5cR7qoo3MvvIBKSHSyATi2ucWFrhDSq8iv8EopSeHrWEn8
         t/Fw==
X-Gm-Message-State: AOJu0Yz1JNsgZG2RSiIoWGW1ynr1jBaCIhT9OJCcr+HnnyMBlxT5nM/B
	HQZ2MvIUAsYQiAsT3FbIAYs=
X-Google-Smtp-Source: AGHT+IE3Cfh9b/JzqGg6j8gIi+dTtztg88/AEC+rLc5ZXs12bE5RhG34cZdOWcisCjIuoDPYLKhuIg==
X-Received: by 2002:a05:6402:40ce:b0:53d:d8ad:4d46 with SMTP id z14-20020a05640240ce00b0053dd8ad4d46mr2756595edb.36.1697560113606;
        Tue, 17 Oct 2023 09:28:33 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip v3 1/3] x86/percpu: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Tue, 17 Oct 2023 18:27:32 +0200
Message-ID: <20231017162811.200569-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PER_CPU_VAR macro should be applied to a symbol and its addend.
Inconsistent usage is currently harmless, but needs to be corrected
before %rip-relative addressing is introduced to PER_CPU_VAR macro.

No functional changes intended.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/entry/calling.h  | 2 +-
 arch/x86/entry/entry_32.S | 2 +-
 arch/x86/entry/entry_64.S | 2 +-
 arch/x86/kernel/head_64.S | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index f6907627172b..47368ab0bda0 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -173,7 +173,7 @@ For 32-bit we have the following conventions - kernel is built with
 .endm
 
 #define THIS_CPU_user_pcid_flush_mask   \
-	PER_CPU_VAR(cpu_tlbstate) + TLB_STATE_user_pcid_flush_mask
+	PER_CPU_VAR(cpu_tlbstate + TLB_STATE_user_pcid_flush_mask)
 
 .macro SWITCH_TO_USER_CR3_NOSTACK scratch_reg:req scratch_reg2:req
 	ALTERNATIVE "jmp .Lend_\@", "", X86_FEATURE_PTI
diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index c73047bf9f4b..4e295798638b 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -305,7 +305,7 @@
 .macro CHECK_AND_APPLY_ESPFIX
 #ifdef CONFIG_X86_ESPFIX32
 #define GDT_ESPFIX_OFFSET (GDT_ENTRY_ESPFIX_SS * 8)
-#define GDT_ESPFIX_SS PER_CPU_VAR(gdt_page) + GDT_ESPFIX_OFFSET
+#define GDT_ESPFIX_SS PER_CPU_VAR(gdt_page + GDT_ESPFIX_OFFSET)
 
 	ALTERNATIVE	"jmp .Lend_\@", "", X86_BUG_ESPFIX
 
diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index de6469dffe3a..1a88ad8a7b48 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -190,7 +190,7 @@ SYM_FUNC_START(__switch_to_asm)
 
 #ifdef CONFIG_STACKPROTECTOR
 	movq	TASK_stack_canary(%rsi), %rbx
-	movq	%rbx, PER_CPU_VAR(fixed_percpu_data) + FIXED_stack_canary
+	movq	%rbx, PER_CPU_VAR(fixed_percpu_data + FIXED_stack_canary)
 #endif
 
 	/*
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 086a2c3aaaa0..3dcabbc49149 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -448,7 +448,7 @@ SYM_CODE_START(soft_restart_cpu)
 	UNWIND_HINT_END_OF_STACK
 
 	/* Find the idle task stack */
-	movq	PER_CPU_VAR(pcpu_hot) + X86_current_task, %rcx
+	movq	PER_CPU_VAR(pcpu_hot + X86_current_task), %rcx
 	movq	TASK_threadsp(%rcx), %rsp
 
 	jmp	.Ljump_to_C_code
-- 
2.41.0



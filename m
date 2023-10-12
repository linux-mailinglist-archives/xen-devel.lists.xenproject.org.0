Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54617C722E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 18:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615915.957476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIu-0003ft-CU; Thu, 12 Oct 2023 16:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615915.957476; Thu, 12 Oct 2023 16:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIu-0003d1-9M; Thu, 12 Oct 2023 16:12:52 +0000
Received: by outflank-mailman (input) for mailman id 615915;
 Thu, 12 Oct 2023 16:12:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qqyIs-00039I-DY
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 16:12:50 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ffdc354-691a-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 18:12:49 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so185611266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 09:12:49 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b009a2235ed496sm11414461ejb.141.2023.10.12.09.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:12:48 -0700 (PDT)
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
X-Inumbo-ID: 2ffdc354-691a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127168; x=1697731968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDMSEbE6Ie84T5BkOrHBUuyCR3ToRtFXIBnMpzsN9Bo=;
        b=hn8MyaatYHscqsveVfaTn48fml4MZnlVKcZ80z2VgUhQWJUTsnnJL74jCSa0gd7zuR
         A2gPZyN7S+JY7RlcuV+Htk4qmLcw4wx4suaaJqs8v2qejhLfSe+vhvt07z54zGq8rKPW
         y4GzQDR324Ki6hI+dV3zlJXjH5X4c+FrV5DXRD6a2ajQuCJ9A9MKHMbxVw48KkOUkfbn
         fyUku6nCaX/40rJgrtG4CcZS4VUYPOsl02dWjZvEOUtaB03h8u5Mm/cRmiPF0vDGbcCL
         XzGizY0S7gLpHO9KIO4ICexVNEAbOn1KckQ+t4vT8p1azbs4XDZEJVzC2At+FPZBNms8
         /BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127168; x=1697731968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDMSEbE6Ie84T5BkOrHBUuyCR3ToRtFXIBnMpzsN9Bo=;
        b=vH8fN9ikea+xZ9636kIBXP+bZw68ml5KQskTC5uL7QXV5hZQnc1S/VW5481ByjKz8U
         qsMOsrUs6l/5z2DPL+Y1zNNYzA6X6261QWqgi+zAfUMiieC/G8KNtXaSZqy5jxPcnb5/
         nU7feWyfe/3eS1U08EvF+L2uCi8DnS38dwf9HVIrYvkBX3ohfeef2mdr7WaB4cqguCSx
         ALficSmoOxlX+Do9rsHnWWi9eG74Dmmvtc/o5lmXEH4KqGoxhGZXmSyfwUaetCWYoqCw
         PAQXZVBOntWvyOJm1f2G5/BQkndPIORASiRCSPnbXrLI5wimaOyr45lmErOZbAB7I9gw
         s1vQ==
X-Gm-Message-State: AOJu0YwuT7DR+sn20TgV332wsEOxYiH8G2YL8V2rX75DgdZrXwaSEh52
	nA2vTNeV9pUJ56aP4EOg1SQ=
X-Google-Smtp-Source: AGHT+IEJe39mReMmuqoI7tLyKV8yCFM2VE+XW0dysIJl/d8IcLEFQpg5Cv5p2IFg4LrOKeuqQ65l1Q==
X-Received: by 2002:a17:906:2d1:b0:9b2:b765:8802 with SMTP id 17-20020a17090602d100b009b2b7658802mr24346581ejk.40.1697127168624;
        Thu, 12 Oct 2023 09:12:48 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 2/4] x86/percpu: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Thu, 12 Oct 2023 18:10:37 +0200
Message-ID: <20231012161237.114733-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012161237.114733-1-ubizjak@gmail.com>
References: <20231012161237.114733-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PER_CPU_VAR macro should be applied to a symbol and its addend.
Inconsistent usage is currently harmless, but needs to be corrected
before %rip-relative addressing is introduced to PER_CPU_VAR macro.

No functional changes intended.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
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
index 6e6af42e044a..d4e094b2c877 100644
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
index 43606de22511..3d6770b87b87 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -252,7 +252,7 @@ SYM_FUNC_START(__switch_to_asm)
 
 #ifdef CONFIG_STACKPROTECTOR
 	movq	TASK_stack_canary(%rsi), %rbx
-	movq	%rbx, PER_CPU_VAR(fixed_percpu_data) + FIXED_stack_canary
+	movq	%rbx, PER_CPU_VAR(fixed_percpu_data + FIXED_stack_canary)
 #endif
 
 	/*
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index ea6995920b7a..bfe5ec2f4f83 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -449,7 +449,7 @@ SYM_CODE_START(soft_restart_cpu)
 	UNWIND_HINT_END_OF_STACK
 
 	/* Find the idle task stack */
-	movq	PER_CPU_VAR(pcpu_hot) + X86_current_task, %rcx
+	movq	PER_CPU_VAR(pcpu_hot + X86_current_task), %rcx
 	movq	TASK_threadsp(%rcx), %rsp
 
 	jmp	.Ljump_to_C_code
-- 
2.41.0



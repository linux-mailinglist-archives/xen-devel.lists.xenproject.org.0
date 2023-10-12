Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105B7C77C4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 22:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616002.957653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr286-0006FL-CS; Thu, 12 Oct 2023 20:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616002.957653; Thu, 12 Oct 2023 20:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr286-000696-7d; Thu, 12 Oct 2023 20:17:58 +0000
Received: by outflank-mailman (input) for mailman id 616002;
 Thu, 12 Oct 2023 20:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr284-00065W-Tk
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 20:17:56 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e02db8e-693c-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 22:17:56 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so211927066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 13:17:56 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709064ec300b00997d7aa59fasm11692552ejv.14.2023.10.12.13.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:17:55 -0700 (PDT)
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
X-Inumbo-ID: 6e02db8e-693c-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697141875; x=1697746675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDMSEbE6Ie84T5BkOrHBUuyCR3ToRtFXIBnMpzsN9Bo=;
        b=HKW2VW07oRHR+EE7e693Prw/yDl9jPk7xnPtRYI0DpEScXozacnbJ7+dMsAzUvv8uj
         WFFyYC+hmAJdtDdR5skipow80yxnD0tIarn5ndnnGwVs4nOaYI3pPfZjEzm91i1mGp2C
         agN30yoTnce4OWGXIamrGovRaHkYIZSzVTDEF6R7kiHstOezPuApZGzlj6b6GZ0WgJEy
         7jnDxVoyw3oCly+aypNIGqily1JAUWJO+65Hb43R6WHFe72aRLiuBKwcqNYic3Psxocc
         CXaqIavRjboMlIVzGKcdlqU7A9pitLAVD4K4/4ESSIZA/0tF8wJRfKWfVCU6KK5R49BK
         RJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141875; x=1697746675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDMSEbE6Ie84T5BkOrHBUuyCR3ToRtFXIBnMpzsN9Bo=;
        b=O8td+M1m9qgZab606f/N3QSWcJw/FuOSIRY+ZddtYQu8otYl2324BP6uhCsL7gkZDq
         bBlZpekkAIkgiEMUEeYEHC1GkdTyYZhHuSCmum5iwIkE/mBRy4pWJgufrJ2yigfDQruR
         r5qw/R5zzmEZCi4SAIYkhbqTR+qDqRJi7vLmQssNK5VNN3zRSWYCVPZ9kaXoHV+bX93w
         GJTAGdITb2hZh2mzPhQvUnQN4bnVUTD5GjNo9xEty//LW4Dl05LoEMZ6yopbc0AYO5eX
         Y2D78dJq/stxZau/b0sXcISRt6Y7UsJY/bIZ2oQQ+FCTGrGWvH4IFl09D16isb77j7St
         uqLw==
X-Gm-Message-State: AOJu0Yxht8tI3o5tIahsoQT0advc6fJYTygw199L/kzg9EVRUAUtk5V2
	gNLGTt6D5ppU3mrJGVyLiek=
X-Google-Smtp-Source: AGHT+IGhoWha4M/ka8e2JRhDL76Q3hwso5VE/0ZSrUJ5K72lB/D3qkiWMd0b7LflyD+sVTpFdiWVHw==
X-Received: by 2002:a17:906:3e52:b0:9b2:aa2f:ab69 with SMTP id t18-20020a1709063e5200b009b2aa2fab69mr24396120eji.30.1697141875609;
        Thu, 12 Oct 2023 13:17:55 -0700 (PDT)
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
Subject: [PATCH v2 2/4] x86/percpu: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Thu, 12 Oct 2023 22:12:05 +0200
Message-ID: <20231012201743.292149-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012201743.292149-1-ubizjak@gmail.com>
References: <20231012201743.292149-1-ubizjak@gmail.com>
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



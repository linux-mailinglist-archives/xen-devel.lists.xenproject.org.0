Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C87C99F0
	for <lists+xen-devel@lfdr.de>; Sun, 15 Oct 2023 18:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617167.959567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qs3ha-0003qo-Np; Sun, 15 Oct 2023 16:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617167.959567; Sun, 15 Oct 2023 16:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qs3ha-0003oN-Kz; Sun, 15 Oct 2023 16:10:50 +0000
Received: by outflank-mailman (input) for mailman id 617167;
 Sun, 15 Oct 2023 16:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YdO5=F5=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qs3hZ-0003oD-UN
 for xen-devel@lists.xenproject.org; Sun, 15 Oct 2023 16:10:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 665ad019-6b75-11ee-9b0e-b553b5be7939;
 Sun, 15 Oct 2023 18:10:47 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso6350082a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Oct 2023 09:10:46 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 rh14-20020a17090720ee00b009b947f81c4asm2421863ejb.155.2023.10.15.09.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 09:10:45 -0700 (PDT)
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
X-Inumbo-ID: 665ad019-6b75-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697386246; x=1697991046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6M2BQ1j3esHLsNrh33huqDf3/RvkLGOffuZFGUfaNiI=;
        b=Ns7FTvVpqegCI75ot6N/i4q1V20ut9Dq0VoL+PuWQaAyshcsCG9s9rmpUyeogejr1f
         vzj9wEyxwbg2X8CnxEcQHJAGTG4K9FhnO+r0J3HzSKg5GlKzCkD7yZtoLL+LcRJRgByn
         7LMWArAy302R5iPPQ16w1O+lEhJVBHdmp0jS9Tb4GihREPef+tDdgCWeqKrn3Ypaucb7
         9xxAp0wY4Iqp4CIP5nvOW1/dplwhqlx80+HFTuCLrXDMKHY4U5gswiNDcL2ucnT9izY6
         Uo8zBx+OL9Jcq32VEIKIyhca/I8zIImMcQUPhAMvETCEYBaJkVMQrTe4DM7Hl+usrrGO
         M55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697386246; x=1697991046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M2BQ1j3esHLsNrh33huqDf3/RvkLGOffuZFGUfaNiI=;
        b=M22jpkzRZwoiPEJXT8M0QivUNfKLaChQrhMVYhvq3K0OFnKXYY1QXOs+PgHKIfJmLW
         Kk5Cu4uKnnkgee1s118ZicjjykqJireUsHIpFvgfL/RgpXXy8tSRF9aj67KP8yEc3mKe
         7CL9GWw/1r3EiikjIPCPwrdxf7A1VPCaml/gEiN+maI0L9W+TeS1QAJby7fnuaERi2nb
         tV6n/l8m/u6/yzL/3tFJt/nlFdZJ8wMzhu0ufwaZ88aRmua2k1VbMvqRoSOZpSeCVY8B
         a9L/F+qlp3Ku1rmgupPl0bCX4DYgXFkEO3Jp0q2dYZi5eAlwpuAhJwd9n7vWr9EprTf1
         TxJA==
X-Gm-Message-State: AOJu0Yz5UaChsPPA1+iD0pt//MGdr/fp5GG6wGJkoeWsH5narrOR1mNp
	8hqsdvjy/K/L6aSs08axXzQ=
X-Google-Smtp-Source: AGHT+IEvlhJjwyQxB/GihB1vaJMXVxCuUzFpGcYEAGzxv4qn4tTRurqXJe51uzZpYjAHwtycAh8vUw==
X-Received: by 2002:a17:906:c5:b0:9ad:c763:bc7a with SMTP id 5-20020a17090600c500b009adc763bc7amr26258797eji.23.1697386246235;
        Sun, 15 Oct 2023 09:10:46 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND 1/2] x86/percpu: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Sun, 15 Oct 2023 18:08:55 +0200
Message-ID: <20231015161036.39689-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
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



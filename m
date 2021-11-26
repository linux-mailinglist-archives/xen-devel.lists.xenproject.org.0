Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2545EB1B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 11:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232494.403107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqYDL-0006w1-BS; Fri, 26 Nov 2021 10:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232494.403107; Fri, 26 Nov 2021 10:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqYDL-0006t1-88; Fri, 26 Nov 2021 10:12:19 +0000
Received: by outflank-mailman (input) for mailman id 232494;
 Fri, 26 Nov 2021 10:12:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXrr=QN=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1mqYDJ-0006st-Ed
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 10:12:17 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 537236c1-4ea1-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 11:12:16 +0100 (CET)
Received: by mail-pf1-x433.google.com with SMTP id o4so8443995pfp.13
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 02:12:15 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id j2sm3870184pgl.73.2021.11.26.02.12.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:12:12 -0800 (PST)
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
X-Inumbo-ID: 537236c1-4ea1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o/JsKbfMes+8HN/WC8BxQrxJb7eO4f1vtnbbvoObfIw=;
        b=qAEXRhJCQualuXUI/E9TTZKF+vyX2KzxEvmGfinCNMQN3bZc4v5qw3+auBqPTn+kKu
         M+3yBhQ9LskJvs7Q/3TRBzenI80zV6/EYs6sk1uLx9XviHrar+L9NvzCIJqtwm2S2GrH
         lWvF7UeRX4zY/2QoY7wT0yR/2sl3S08YxRA7654v7s6infsNz74W//YjCQgEHUuKhMrZ
         2m17i10/Sx8RwyaFqN4DhtC4TweDXrlOyLXpYhFpPgupCUjLoWkzYGJm9z6TddPtex55
         j44Gtoy91BW19/Bq4WUmCnpxueDztG3aTN7yG1DtiCT6i5jKAXHRemC2Bl7j2sJDrjrW
         rJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/JsKbfMes+8HN/WC8BxQrxJb7eO4f1vtnbbvoObfIw=;
        b=GyTPZhpanqKNrBII7bQJJFoNMKVV1n97nb+5yovNz1v/DvWwWaIoolSYpTH4/wqKsq
         jT54nFkZaoUiW3kbJQdB4cCgn8K7iYFyWW4nYXMg6KNFH3iwT1+xWAbX4rzHQuHfRo7r
         gclZPDi5IsxCHF10Bs9r5H+A9oVzH2c+5L7XGl0bf7ZxwO9Vq1bJHJ65rPU+ZZl2RHJB
         H34ABqhu4TyjTp7qVSAfaj2oFnaKpNxyFez68+8GxQWpZxmeZoRZ5tRUr9KcWDLLrCnX
         V2O9qFVAdmlmhE2aBQiLlb5SzgVr78Dim611IYsw703enOAs64UUBcgtJtaiC+k1rE0T
         L47w==
X-Gm-Message-State: AOAM533hFivJfrNM6OHWQubZJJG6jX2QrJT2zSSJj71LhFUOe3askukU
	A+a/YEqgHJ3+Z2RNtNAmcmk=
X-Google-Smtp-Source: ABdhPJwQkD5yFxnX+taigMIodM5mVwgcHezaHYIaCCLRC2t7bnJOlp6G7/Oyuib5tURhRHES5mL3XQ==
X-Received: by 2002:a05:6a00:1412:b0:4a7:ec46:29d1 with SMTP id l18-20020a056a00141200b004a7ec4629d1mr12919164pfu.16.1637921533272;
        Fri, 26 Nov 2021 02:12:13 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>,
	Peter Anvin <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH V6 03/49] x86/xen: Add xenpv_restore_regs_and_return_to_usermode()
Date: Fri, 26 Nov 2021 18:11:23 +0800
Message-Id: <20211126101209.8613-4-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211126101209.8613-1-jiangshanlai@gmail.com>
References: <20211126101209.8613-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

While in the native case, PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is the
trampoline stack.  But XEN pv doesn't use trampoline stack, so
PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is also the kernel stack.  Hence source
and destination stacks are identical in that case, which means reusing
swapgs_restore_regs_and_return_to_usermode() in XEN pv would cause %rsp
to move up to the top of the kernel stack and leave the IRET frame below
%rsp, which is dangerous to be corrupted if #NMI / #MC hit as either of
these events occurring in the middle of the stack pushing would clobber
data on the (original) stack.

And, when XEN pv, swapgs_restore_regs_and_return_to_usermode() pushing
the IRET frame on to the original address is useless and error-prone
when there is any future attempt to modify the code.

Fixes: 7f2590a110b8 ("x86/entry/64: Use a per-CPU trampoline stack for IDT entries")
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Juergen Gross <jgross@suse.com>
Cc: Peter Anvin <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S |  4 ++++
 arch/x86/xen/xen-asm.S    | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 4967edded48d..68e697acefac 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -574,6 +574,10 @@ SYM_INNER_LABEL(swapgs_restore_regs_and_return_to_usermode, SYM_L_GLOBAL)
 	ud2
 1:
 #endif
+#ifdef CONFIG_XEN_PV
+	ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
+#endif
+
 	POP_REGS pop_rdi=0
 
 	/*
diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 220dd9678494..444d824775f6 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -20,6 +20,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <../entry/calling.h>
 
 .pushsection .noinstr.text, "ax"
 /*
@@ -192,6 +193,25 @@ SYM_CODE_START(xen_iret)
 	jmp hypercall_iret
 SYM_CODE_END(xen_iret)
 
+/*
+ * XEN pv doesn't use trampoline stack, PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is
+ * also the kernel stack.  Reusing swapgs_restore_regs_and_return_to_usermode()
+ * in XEN pv would cause %rsp to move up to the top of the kernel stack and
+ * leave the IRET frame below %rsp, which is dangerous to be corrupted if #NMI
+ * interrupts. And swapgs_restore_regs_and_return_to_usermode() pushing the IRET
+ * frame at the same address is useless.
+ */
+SYM_CODE_START(xenpv_restore_regs_and_return_to_usermode)
+	UNWIND_HINT_REGS
+	POP_REGS
+
+	/* stackleak_erase() can work safely on the kernel stack. */
+	STACKLEAK_ERASE_NOCLOBBER
+
+	addq	$8, %rsp	/* skip regs->orig_ax */
+	jmp xen_iret
+SYM_CODE_END(xenpv_restore_regs_and_return_to_usermode)
+
 /*
  * Xen handles syscall callbacks much like ordinary exceptions, which
  * means we have:
-- 
2.19.1.6.gb485710b



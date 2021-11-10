Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C844C069
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 12:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224269.387480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkmEo-0001tR-Mt; Wed, 10 Nov 2021 11:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224269.387480; Wed, 10 Nov 2021 11:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkmEo-0001rI-Jd; Wed, 10 Nov 2021 11:57:58 +0000
Received: by outflank-mailman (input) for mailman id 224269;
 Wed, 10 Nov 2021 11:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wakI=P5=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1mkmEm-0001rC-64
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 11:57:56 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fe9d3dd-421d-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 12:57:55 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id b11so2729495pld.12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 03:57:54 -0800 (PST)
Received: from localhost ([198.11.178.15])
 by smtp.gmail.com with ESMTPSA id pj12sm5597014pjb.51.2021.11.10.03.57.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:57:53 -0800 (PST)
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
X-Inumbo-ID: 6fe9d3dd-421d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7gp55vNbAiMPJFZt1vvuRfVDBF8kbd0dyE3oVrC7LSs=;
        b=ErpuCwTPM/lAhllg01n0htQnpfjyhCsJ4Z/ygE8rrUDFG89OS/Z6ULi/yfQ5l83SYR
         ekv8ETDGrJjZzC7nCGROQepEj6colRUgxdsfFTqNnkgR2ZPDVBxL8xh66fuzKX5cShvN
         ZaHy/eUh/VJNLkeeKO+mQ2K9mzWExjacm4qxtX59L+qgue1LMg1KIK6KA3p/wAFPIAjo
         L+7YzOnJ8Y/+2UXpv9hojsf/YYi7itNaVK39H/vDlTSF+FglB5DD50JUhlAFjr+G/pJE
         oGOvcr+x1h6OkctFppsKXnxnul6dmzYcVWEIg/qoyiUIGtCUtr/UqqcE16vL2uzGDSVW
         19Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7gp55vNbAiMPJFZt1vvuRfVDBF8kbd0dyE3oVrC7LSs=;
        b=DIVvzx8kQX0VpA6X+XXOm2cVcr+cHU9RV9130s8phet6T/sppOixQ3z4hJ/sK5AihL
         4ecnWJ01INB9AvlMsXW+DmWdPN7qr4FTyLqMejwiUnyG6kCtCVtPrFA9V9TEOuXgOwoV
         UmeC0meAFKIs5t4OvOdCg90IDXF0RP4yHS5DrXCp98lo6CKoZYgQi4V1+TTkRFR/UEBH
         bCu+IaZxPQAlsCUBe/poCJ3CX5pTltJoBoGX3iJdIOjspMPX6z8jRD+q5/X61VPWxPkH
         eT/v33paxjZAaBLp+Hz56KCrTu/E7qarnoUns1OFZyk1XVkk9zewIPdZgRKM/Wxbd2BM
         rOtA==
X-Gm-Message-State: AOAM533WdgqzLJ8eDD5OwvwymmQkFjqgQ816WcDUFl8bdOZIaF8z+Kpw
	CibA3LcRDKxHvRnMh6k3pe4=
X-Google-Smtp-Source: ABdhPJw4orw2dz/h+6dMeylsEPNNBFO9JalnXgfoeA7xVTZjRqfO80WskbTNDh4CQU7WOIh36roALQ==
X-Received: by 2002:a17:902:d28a:b0:142:61ce:ae4c with SMTP id t10-20020a170902d28a00b0014261ceae4cmr15090581plc.35.1636545473614;
        Wed, 10 Nov 2021 03:57:53 -0800 (PST)
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
Subject: [PATCH V5 04/50] x86/xen: Add xenpv_restore_regs_and_return_to_usermode()
Date: Wed, 10 Nov 2021 19:56:50 +0800
Message-Id: <20211110115736.3776-5-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211110115736.3776-1-jiangshanlai@gmail.com>
References: <20211110115736.3776-1-jiangshanlai@gmail.com>
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
index 6189a0dc83ab..ebcc17e1d7f1 100644
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



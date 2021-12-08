Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD14246D1A4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242143.418851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoS-0007CS-IB; Wed, 08 Dec 2021 11:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242143.418851; Wed, 08 Dec 2021 11:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoS-0007AU-Ep; Wed, 08 Dec 2021 11:08:40 +0000
Received: by outflank-mailman (input) for mailman id 242143;
 Wed, 08 Dec 2021 11:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuoR-0006Yt-4P
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:08:39 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 312e853b-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:08:38 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so1816347pjb.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:08:38 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id e29sm2222262pge.17.2021.12.08.03.08.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:36 -0800 (PST)
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
X-Inumbo-ID: 312e853b-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v0Rti8J9O/DOw+Q8wf2xojRDpLT8xHVZ9Lxf2e0cKZk=;
        b=PsLrL5Aie1ZtnPQWX5QQBbXXhbTKSUKu0PazbTlH+ol9j3w7v0vsbVraLGwI8/WUBo
         4JFmDJF1Et2cG6j/knBCajQznDaPYEV9uSmcNxrp0vZqTMFNZiS2SDO75XkRhd5Vvo9d
         iLJGeDUeMxGOuQ9nEeBVyRfyOPmkTlLH91yzjTTVSbHnK38Z+QOAMnm5Va2wTSFbnJfJ
         L8u2+h3MCb0UMPsvd3lGAk9BW7XraGPnmMNDp1DmWaALPZBg//tjNUNJfUiPJyE54GZA
         uoM15nO2f6/MMfuxIpBsbi2/4pmj+7Z/2GspSMt57V6sUf7bF36VCpuwxizpG3+DZLvh
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v0Rti8J9O/DOw+Q8wf2xojRDpLT8xHVZ9Lxf2e0cKZk=;
        b=7DIQE05OQ3NOvA7HDjZ5uHMzGGX8GfrzSoAhSZ62u+2TBnBQLvlyeYpVfbSoKez/Hg
         S8A7l/SuH8AQ791cJVnyeHS+p81ACg+DHf2qEbnnmnbk3M+mRESX6B2iZXd97xUKFWLS
         vp6Y+XsvSnfr8SF/crtM+UmFMBQfq4hqS64hjnMk2/HAj56d47AVoFsLEeH0IrhYXOt/
         Drwi4u9MR8fHAEATkM2NGmk6PpbWsMA+gU+Q82ZTATpqRLkT/cvhvT03GxAeBfYdyxfk
         AwCF/DMbalLDKY4JmGSee+Sto7PZO47C/hw8giJtLF2Ozo31MUAU5dmU8HlsPJBK8ceT
         ZS2A==
X-Gm-Message-State: AOAM530orrPGkHjtkxVvvKl7imlBM846k6R7JCnGlvVUkB8JKrce2sBk
	99gPXrRxiLauHCIqzjzKffo=
X-Google-Smtp-Source: ABdhPJxpeELdxfo0JipJhaLLz4786jh3lr2fXOrOICnzD3O4qx8UMsz1Z1IGRVnoqDN8NDdQgTJz/g==
X-Received: by 2002:a17:90b:3889:: with SMTP id mu9mr6279578pjb.160.1638961716971;
        Wed, 08 Dec 2021 03:08:36 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Joerg Roedel <jroedel@suse.de>,
	"Chang S. Bae" <chang.seok.bae@intel.com>
Subject: [PATCH 02/11] x86/traps: Move pt_regs only in fixup_bad_iret()
Date: Wed,  8 Dec 2021 19:08:24 +0800
Message-Id: <20211208110833.65366-3-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

fixup_bad_iret() and sync_regs() have similar arguments and do similar
work that copies full or partial pt_regs to a place and switches stack
after return.  They are quite the same, but fixup_bad_iret() not only
copies the pt_regs but also the return address of error_entry() while
sync_regs() copies the pt_regs only and the return address of
error_entry() was preserved and handled in ASM code.

This patch makes fixup_bad_iret() work like sync_regs() and the
handling of the return address of error_entry() is moved in ASM code.

It removes the need to use the struct bad_iret_stack, simplifies
fixup_bad_iret() and makes the ASM error_entry() call fixup_bad_iret()
as the same as calling sync_regs() which adds readability because
the calling patterns are exactly the same.

It is prepared for later patch to do the stack switch after the
error_entry() which simplifies the code further.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S    |  5 ++++-
 arch/x86/include/asm/traps.h |  2 +-
 arch/x86/kernel/traps.c      | 17 ++++++-----------
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index d95a02ecee16..f8faff3ca61e 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -1040,9 +1040,12 @@ SYM_CODE_START_LOCAL(error_entry)
 	 * Pretend that the exception came from user mode: set up pt_regs
 	 * as if we faulted immediately after IRET.
 	 */
-	mov	%rsp, %rdi
+	popq	%r12				/* save return addr in %12 */
+	movq	%rsp, %rdi			/* arg0 = pt_regs pointer */
 	call	fixup_bad_iret
 	mov	%rax, %rsp
+	ENCODE_FRAME_POINTER
+	pushq	%r12
 	jmp	.Lerror_entry_from_usermode_after_swapgs
 SYM_CODE_END(error_entry)
 
diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 6221be7cafc3..1cdd7e8bcba7 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -13,7 +13,7 @@
 #ifdef CONFIG_X86_64
 asmlinkage __visible notrace struct pt_regs *sync_regs(struct pt_regs *eregs);
 asmlinkage __visible notrace
-struct bad_iret_stack *fixup_bad_iret(struct bad_iret_stack *s);
+struct pt_regs *fixup_bad_iret(struct pt_regs *bad_regs);
 void __init trap_init(void);
 asmlinkage __visible noinstr struct pt_regs *vc_switch_off_ist(struct pt_regs *eregs);
 #endif
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index c9d566dcf89a..a6c0bc9ee36f 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -761,13 +761,8 @@ asmlinkage __visible noinstr struct pt_regs *vc_switch_off_ist(struct pt_regs *r
 }
 #endif
 
-struct bad_iret_stack {
-	void *error_entry_ret;
-	struct pt_regs regs;
-};
-
 asmlinkage __visible noinstr
-struct bad_iret_stack *fixup_bad_iret(struct bad_iret_stack *s)
+struct pt_regs *fixup_bad_iret(struct pt_regs *bad_regs)
 {
 	/*
 	 * This is called from entry_64.S early in handling a fault
@@ -777,19 +772,19 @@ struct bad_iret_stack *fixup_bad_iret(struct bad_iret_stack *s)
 	 * just below the IRET frame) and we want to pretend that the
 	 * exception came from the IRET target.
 	 */
-	struct bad_iret_stack tmp, *new_stack =
-		(struct bad_iret_stack *)__this_cpu_read(cpu_tss_rw.x86_tss.sp0) - 1;
+	struct pt_regs tmp, *new_stack =
+		(struct pt_regs *)__this_cpu_read(cpu_tss_rw.x86_tss.sp0) - 1;
 
 	/* Copy the IRET target to the temporary storage. */
-	__memcpy(&tmp.regs.ip, (void *)s->regs.sp, 5*8);
+	__memcpy(&tmp.ip, (void *)bad_regs->sp, 5*8);
 
 	/* Copy the remainder of the stack from the current stack. */
-	__memcpy(&tmp, s, offsetof(struct bad_iret_stack, regs.ip));
+	__memcpy(&tmp, bad_regs, offsetof(struct pt_regs, ip));
 
 	/* Update the entry stack */
 	__memcpy(new_stack, &tmp, sizeof(tmp));
 
-	BUG_ON(!user_mode(&new_stack->regs));
+	BUG_ON(!user_mode(new_stack));
 	return new_stack;
 }
 #endif
-- 
2.19.1.6.gb485710b



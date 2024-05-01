Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FA8B9FBA
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716035.1118064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU1-0000st-HJ; Thu, 02 May 2024 17:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716035.1118064; Thu, 02 May 2024 17:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU1-0000pr-ER; Thu, 02 May 2024 17:44:37 +0000
Received: by outflank-mailman (input) for mailman id 716035;
 Thu, 02 May 2024 17:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aTz-0000pk-If
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:35 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2e17859-08ab-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 19:44:33 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51967f75729so9994573e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:33 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac2562f000000b0051884ea2a32sm244102lff.31.2024.05.02.10.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:31 -0700 (PDT)
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
X-Inumbo-ID: a2e17859-08ab-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671872; x=1715276672; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOE/YLLSPbJgtqh9FaZ/GX1mmt9IgzaYsZgTTrSiNM8=;
        b=RaLH4dfs3KJ5VikZ3O2qPpKGgG44sblzksb6c17Zb8tZBjdXTuMymAPOSlBMu6JtZl
         rL8Za+2WqhjEH/C44MnGCsHHzVK1OP0Bsre7gx0GFHgxft8mFG4yXtkpFZLEVpAQ03ty
         SJJWo7goN9+bkzQ4ma0SZb7kfp0O+j5+WNalbT7MgtK8YZDFuSuS6DkS1E1YDLuoZ4Z8
         BVWKb3FSxjd3bqL/krnfsUaL4C/cjMnC04u4+Vj7/BvGlET7gFkg7cGAg8E8zgn5ZcsT
         updqZtiALPaWVKnRaCqWjSR8ymzKmwF427xFjvs4nzQ9hUV/KoD4mFQ4h5NVo7jOQCNR
         OmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671872; x=1715276672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOE/YLLSPbJgtqh9FaZ/GX1mmt9IgzaYsZgTTrSiNM8=;
        b=paUYRzZzpp7RP7JSn3XXbRMmloB8Jdxu3kCCaBB/sjdgc8GjF4TUwl5+HyRVs87zwg
         0pwOvvbbQJ3XDm1hjwLKec/xY8yM43MAIGRAu8wzZIhCvXMOG1+Q593yuySMOIO8BGb2
         Qhax4QjknnNAhRqF8PuqzKOpd//z4FjqkSZkDu6atVambWZJ8FQtUuedS36kDTTUgvLs
         p8G+qelIhJ7YK1Gstamueudk7NnGr7sCiVmXz5s8DW1I7/R1vaEKpXnxomF7QcQ2uiin
         CRlyl3Fec4+1ua4lztDlMy0t+2SPeX8vMACKpO8lSKQwznJCIYUs8vcZTXPypS2lKHQ1
         C1LA==
X-Gm-Message-State: AOJu0YwYC9e711Nq/NlkFT7DYUZKs3oormZjYGWaC9QrTSLecqcWIPJC
	qVBXsM+Sl7qWNmZbffkKwnJo3L1NZfWOUhvxmqhcWynbBzqFF1MGR0fXSsgR
X-Google-Smtp-Source: AGHT+IGbcCm5fc38UKPK1zDJdfmBtwkHYVUiZ0vyqiprQuSB5aWnfRR1u8dWIJi9bSESJAk8I6IWfg==
X-Received: by 2002:ac2:520b:0:b0:518:b144:9020 with SMTP id a11-20020ac2520b000000b00518b1449020mr309556lfl.61.1714671872244;
        Thu, 02 May 2024 10:44:32 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 1/9] xen/arm64: entry: Add missing code symbol annotations
Date: Wed,  1 May 2024 05:54:40 +0200
Message-Id: <20240501035448.964625-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501035448.964625-1-edgar.iglesias@gmail.com>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/arm/arm64/entry.S | 72 +++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index f963c923bb..af9a592cae 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -289,21 +289,25 @@
         b       do_bad_mode
         .endm
 
-hyp_sync_invalid:
+FUNC_LOCAL(hyp_sync_invalid)
         entry   hyp=1
         invalid BAD_SYNC
+END(hyp_sync_invalid)
 
-hyp_irq_invalid:
+FUNC_LOCAL(hyp_irq_invalid)
         entry   hyp=1
         invalid BAD_IRQ
+END(hyp_irq_invalid)
 
-hyp_fiq_invalid:
+FUNC_LOCAL(hyp_fiq_invalid)
         entry   hyp=1
         invalid BAD_FIQ
+END(hyp_fiq_invalid)
 
-hyp_error_invalid:
+FUNC_LOCAL(hyp_error_invalid)
         entry   hyp=1
         invalid BAD_ERROR
+END(hyp_error_invalid)
 
 /*
  * SError received while running in the hypervisor mode.
@@ -313,11 +317,12 @@ hyp_error_invalid:
  * simplicity, as SError should be rare and potentially fatal,
  * all interrupts are kept masked.
  */
-hyp_error:
+FUNC_LOCAL(hyp_error)
         entry   hyp=1
         mov     x0, sp
         bl      do_trap_hyp_serror
         exit    hyp=1
+END(hyp_error)
 
 /*
  * Synchronous exception received while running in the hypervisor mode.
@@ -327,7 +332,7 @@ hyp_error:
  * some of them. So we want to inherit the state from the interrupted
  * context.
  */
-hyp_sync:
+FUNC_LOCAL(hyp_sync)
         entry   hyp=1
 
         /* Inherit interrupts */
@@ -338,6 +343,7 @@ hyp_sync:
         mov     x0, sp
         bl      do_trap_hyp_sync
         exit    hyp=1
+END(hyp_sync)
 
 /*
  * IRQ received while running in the hypervisor mode.
@@ -352,7 +358,7 @@ hyp_sync:
  * would require some rework in some paths (e.g. panic, livepatch) to
  * ensure the ordering is enforced everywhere.
  */
-hyp_irq:
+FUNC_LOCAL(hyp_irq)
         entry   hyp=1
 
         /* Inherit D, A, F interrupts and keep I masked */
@@ -365,8 +371,9 @@ hyp_irq:
         mov     x0, sp
         bl      do_trap_irq
         exit    hyp=1
+END(hyp_irq)
 
-guest_sync:
+FUNC_LOCAL(guest_sync)
         /*
          * Save x0, x1 in advance
          */
@@ -413,8 +420,9 @@ fastpath_out_workaround:
         mov     x1, xzr
         eret
         sb
+END(guest_sync)
 
-wa2_ssbd:
+FUNC_LOCAL(wa2_ssbd)
 #ifdef CONFIG_ARM_SSBD
 alternative_cb arm_enable_wa2_handling
         b       wa2_end
@@ -450,42 +458,55 @@ wa2_end:
         mov     x0, xzr
         eret
         sb
-guest_sync_slowpath:
+END(wa2_ssbd)
+
+FUNC_LOCAL(guest_sync_slowpath)
         /*
          * x0/x1 may have been scratch by the fast path above, so avoid
          * to save them.
          */
         guest_vector compat=0, iflags=IFLAGS__AI_, trap=guest_sync, save_x0_x1=0
+END(guest_sync_slowpath)
 
-guest_irq:
+FUNC_LOCAL(guest_irq)
         guest_vector compat=0, iflags=IFLAGS__A__, trap=irq
+END(guest_irq)
 
-guest_fiq_invalid:
+FUNC_LOCAL(guest_fiq_invalid)
         entry   hyp=0, compat=0
         invalid BAD_FIQ
+END(guest_fiq_invalid)
 
-guest_error:
+FUNC_LOCAL(guest_error)
         guest_vector compat=0, iflags=IFLAGS__AI_, trap=guest_serror
+END(guest_error)
 
-guest_sync_compat:
+FUNC_LOCAL(guest_sync_compat)
         guest_vector compat=1, iflags=IFLAGS__AI_, trap=guest_sync
+END(guest_sync_compat)
 
-guest_irq_compat:
+FUNC_LOCAL(guest_irq_compat)
         guest_vector compat=1, iflags=IFLAGS__A__, trap=irq
+END(guest_irq_compat)
 
-guest_fiq_invalid_compat:
+FUNC_LOCAL(guest_fiq_invalid_compat)
         entry   hyp=0, compat=1
         invalid BAD_FIQ
+END(guest_fiq_invalid_compat)
 
-guest_error_compat:
+FUNC_LOCAL(guest_error_compat)
         guest_vector compat=1, iflags=IFLAGS__AI_, trap=guest_serror
+END(guest_error_compat)
 
-ENTRY(return_to_new_vcpu32)
+FUNC(return_to_new_vcpu32)
         exit    hyp=0, compat=1
-ENTRY(return_to_new_vcpu64)
+END(return_to_new_vcpu32)
+
+FUNC(return_to_new_vcpu64)
         exit    hyp=0, compat=0
+END(return_to_new_vcpu64)
 
-return_from_trap:
+FUNC_LOCAL(return_from_trap)
         msr     daifset, #IFLAGS___I_ /* Mask interrupts */
 
         ldr     x21, [sp, #UREGS_PC]            /* load ELR */
@@ -524,6 +545,7 @@ return_from_trap:
 
         eret
         sb
+END(return_from_trap)
 
 /*
  * Consume pending SError generated by the guest if any.
@@ -536,7 +558,7 @@ return_from_trap:
  * it. So the function will unmask SError exception for a small window and
  * then mask it again.
  */
-check_pending_guest_serror:
+FUNC_LOCAL(check_pending_guest_serror)
         /*
          * Save elr_el2 to check whether the pending SError exception takes
          * place while we are doing this sync exception.
@@ -586,7 +608,7 @@ abort_guest_exit_end:
         cset    x19, ne
 
         ret
-ENDPROC(check_pending_guest_serror)
+END(check_pending_guest_serror)
 
 /*
  * Exception vectors.
@@ -597,7 +619,7 @@ ENDPROC(check_pending_guest_serror)
         .endm
 
         .align  11
-ENTRY(hyp_traps_vector)
+FUNC(hyp_traps_vector)
         ventry  hyp_sync_invalid            /* Synchronous EL2t */
         ventry  hyp_irq_invalid             /* IRQ EL2t */
         ventry  hyp_fiq_invalid             /* FIQ EL2t */
@@ -617,6 +639,7 @@ ENTRY(hyp_traps_vector)
         ventry  guest_irq_compat            /* IRQ 32-bit EL0/EL1 */
         ventry  guest_fiq_invalid_compat    /* FIQ 32-bit EL0/EL1 */
         ventry  guest_error_compat          /* Error 32-bit EL0/EL1 */
+END(hyp_traps_vector)
 
 /*
  * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
@@ -626,7 +649,7 @@ ENTRY(hyp_traps_vector)
  *
  * Returns prev in x0
  */
-ENTRY(__context_switch)
+FUNC(__context_switch)
         add     x8, x0, #VCPU_arch_saved_context
         mov     x9, sp
         stp     x19, x20, [x8], #16         /* store callee-saved registers */
@@ -647,6 +670,7 @@ ENTRY(__context_switch)
         ldr     lr, [x8]
         mov     sp, x9
         ret
+END(__context_switch)
 
 /*
  * Local variables:
-- 
2.40.1



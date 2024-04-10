Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A66989EEE9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 11:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702960.1098683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUJB-0006tc-Fu; Wed, 10 Apr 2024 09:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702960.1098683; Wed, 10 Apr 2024 09:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUJB-0006qs-Cv; Wed, 10 Apr 2024 09:31:57 +0000
Received: by outflank-mailman (input) for mailman id 702960;
 Wed, 10 Apr 2024 09:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruUJA-0006XG-1z
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 09:31:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b02e34a-f71d-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 11:31:54 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516dc51bb72so4985643e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 02:31:54 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 y21-20020ac24475000000b005170a946960sm1071418lfl.87.2024.04.10.02.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 02:31:52 -0700 (PDT)
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
X-Inumbo-ID: 2b02e34a-f71d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712741513; x=1713346313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrHNHtlt8FUpJ9wMxd9V9rpHBMaDrTyKZ2os3fPl9w0=;
        b=Xrs1tK7nABtGHP/k+m3JHUQg9FJKYVS958h7xFja3Mck8/3Hp/yrY5TZe/hnFs8TVG
         bPCcwkJMYXQwkraXpMS8w5D2ImZSQTYvYK8C8PO5lNkjHUxnn6rNJBV9X/jedAuFoKtv
         gskbe3822Ybh3Mi8k05O+llhagVlk6BCL9VPBjHw4BuUpi9i768JQkUy62MQCtutdU44
         gKpJjAcnGctoCHcA1d4gWYzKSw7xc8apJ/qpgFPU+S2mMykcP6IaGa723rkpUjS6mW4k
         WEmMF2Vh7qbSrxNSmemC7E083Ng5SHPeF4nw/wf4oQmCVy84p+jtG4CtNsn4lva+iVap
         f5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741513; x=1713346313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrHNHtlt8FUpJ9wMxd9V9rpHBMaDrTyKZ2os3fPl9w0=;
        b=hAw7rKIYGiCaFpeJklCTgIWODAhjZKCLiQ8wOlTn3oHYXSo/tD/AhCTW76ChyGGhxk
         YkMNo7ryCV0GISqDIUG6bYV3emQpW/lzZFOcKLKndFjZLm99oyNp841bQEnfP/Lp85Zl
         dA1fatRTDb5rJHwE/mNPAAXmFIU7x524TdcSeFJLCcv4c9EHIleHU41u3l2u3jyuAHiN
         tlBFGksS1Nye4E/CmYrMl8SqeQobIQMGQlG0picWZfh+WrfRkciyGgE4dHhHrCPnhixc
         1FIp/Nyd8Bv7wxm5853Zxf+ARVZXmEPLgrUQ6smUtPwiSFAxdeQEvCSdjzUq9tCi9c16
         PGsA==
X-Gm-Message-State: AOJu0Yz21+3tlrJTKOJTNN6MkwPTH1tZDbpgvuO0eQExcq96fJVgDJHQ
	ZObva7ev1pDBeFaxRizTAwHt9KMjF+bBsdqQ68f3j4qoHC39ohE976kbgPW1YhuKfA==
X-Google-Smtp-Source: AGHT+IEWDn5A82mPXnEXA6gVl1X9JVHOR8A0zSGHpa8cmyTDh13m38j9Khy0JNuwpAIXMJ0JKgXvng==
X-Received: by 2002:a05:6512:614:b0:515:d335:a0ab with SMTP id b20-20020a056512061400b00515d335a0abmr1176626lfe.37.1712741513171;
        Wed, 10 Apr 2024 02:31:53 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	edgar.iglesias@amd.com
Subject: [RFC PATCH v1 2/2] xen/arm64: entry: Add missing code symbol annotations
Date: Wed, 10 Apr 2024 11:19:47 +0200
Message-Id: <20240410091947.1498695-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
References: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add missing code symbol annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/entry.S | 60 ++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 6188dd2416..af9a592cae 100644
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
 
 FUNC(return_to_new_vcpu32)
         exit    hyp=0, compat=1
+END(return_to_new_vcpu32)
+
 FUNC(return_to_new_vcpu64)
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
@@ -617,6 +639,7 @@ FUNC(hyp_traps_vector)
         ventry  guest_irq_compat            /* IRQ 32-bit EL0/EL1 */
         ventry  guest_fiq_invalid_compat    /* FIQ 32-bit EL0/EL1 */
         ventry  guest_error_compat          /* Error 32-bit EL0/EL1 */
+END(hyp_traps_vector)
 
 /*
  * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
@@ -647,6 +670,7 @@ FUNC(__context_switch)
         ldr     lr, [x8]
         mov     sp, x9
         ret
+END(__context_switch)
 
 /*
  * Local variables:
-- 
2.40.1



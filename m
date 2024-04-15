Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779618A6628
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706737.1104086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweF4-0007D1-Cp; Tue, 16 Apr 2024 08:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706737.1104086; Tue, 16 Apr 2024 08:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweF4-00077a-7r; Tue, 16 Apr 2024 08:32:38 +0000
Received: by outflank-mailman (input) for mailman id 706737;
 Tue, 16 Apr 2024 08:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heP+=LV=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1rweF2-00075P-D9
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:32:36 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e04220e3-fbcb-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 10:32:35 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-518a3e0d2e4so2503912e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 01:32:35 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a19e048000000b00516d2c05b3dsm1536151lfj.299.2024.04.16.01.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 01:32:33 -0700 (PDT)
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
X-Inumbo-ID: e04220e3-fbcb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713256354; x=1713861154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48w9RzVCrAnY6y/pfkpqctofcQ2H9eeAikbtyqILiGI=;
        b=Axj63OieN+ykBecywtON76I552+Aflbkae8YY+Ud1WvK7pRCR4TBMszPKJZzMLdNKo
         XCXxX8mWqzcjT9KcGlNMIU+CNRXpJJYV/9jeMVGhpLUvGt6nYKaazv7OsJFjUjmoB0FS
         2SeCabxkQR3+Fo/Ldv5WHjtdl5KHY0DsVEWId0YIaBvOUA19d481HG99w1t6RcZw70Nd
         C9mqsVcBAE4PABh4AB+eeKDAdXc3tg7+PGfAJeMOGLk98fMiRRYx4ellghT/Rt8wjCwo
         a4HkBCW5lVk601W5Ejw++erhdcm6udbWZYCOQZxXqBtRbq1iqWvIOGgXqFhpKfCa7PZG
         ONLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256354; x=1713861154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48w9RzVCrAnY6y/pfkpqctofcQ2H9eeAikbtyqILiGI=;
        b=ujZQABNIfPKTMCxHrx+PVBgR4LFJW1kucuKIgGdlkEaCSmdvq0cX0yFpKQTTZYH7KJ
         TrN/b9fcGCewHJz2XBnpYJyOdQLZCf1fQZ9beqqv7Z9+w0bECmVwDBBI/vP17VoPBiPC
         9cq/jIOKpXPrQj+qh4fVw2/qJciaDcDPlzb9ai0Lo5KDzY/tSxStWJnQylx4XAmuJMRy
         F9aEfkOg6cY5gipjs7kRYMP2Fo+mULV2vQVXyomOWIE/Dgoqp0vyCyO3YdJNMf0Kvfke
         ey2gdZcRLDU8J1dxEf4htO9GQqgmGD9cD8L74o6xp8n3e8lbHFZ3AmY0/sm0kYcik1TD
         Hnug==
X-Gm-Message-State: AOJu0Yx6OARivfYSphQsSYloDavH52WHkacVzbMtb3LbNchRZ5uBWYOy
	8zAySy/sEszAYkOyoRxteXWojF3mwHolX0S8mM8yWo0E/jkDXQsqpVjaJD2vuwk=
X-Google-Smtp-Source: AGHT+IEa3tKx5rjWqZfWHJBSXXcUtO9RlNJxcYMAveDZF2+FeRxeqW5Je6Ppec8PXNOFXlqfqp64WQ==
X-Received: by 2002:a05:6512:691:b0:519:99c:9018 with SMTP id t17-20020a056512069100b00519099c9018mr438000lfe.11.1713256353690;
        Tue, 16 Apr 2024 01:32:33 -0700 (PDT)
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
Subject: [PATCH v2 1/1] xen/arm64: entry: Add missing code symbol annotations
Date: Tue, 16 Apr 2024 01:15:41 +0200
Message-Id: <20240415231541.4140052-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415231541.4140052-1-edgar.iglesias@gmail.com>
References: <20240415231541.4140052-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros when and add missing
code symbol annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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



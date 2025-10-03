Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC34BB859D
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136913.1473445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of7-0000NU-6D; Fri, 03 Oct 2025 22:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136913.1473445; Fri, 03 Oct 2025 22:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of6-0000CX-Bd; Fri, 03 Oct 2025 22:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1136913;
 Fri, 03 Oct 2025 22:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4of2-0004mK-OT
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:00 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9024e14-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4060b4b1200so2364479f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:59 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:57 -0700 (PDT)
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
X-Inumbo-ID: d9024e14-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532038; x=1760136838; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7HaizuWoCOqmZuee74baF1kDN75Kwc6FxkeaKG4Enc=;
        b=k1DGaaqcWANTBp0S61SuRqdWkNCcljlKPNtpK0U0WBU883UJz6gcYs3sXdcyt0MDrT
         Zrqa0csQJJqYNWu8jbfmNM+c/KfIK3jrotCHmfAPP4d+pzQrzz4NKcVVIZQrA4PhtgP+
         0hxbdribFQTGy7dkDen99l8iC2nQhxzCnd5kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532038; x=1760136838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7HaizuWoCOqmZuee74baF1kDN75Kwc6FxkeaKG4Enc=;
        b=nnikoz0n8LN6Yzyowwa1U84d/1GZ5XWyTVeGNAn/0vZoOIcarvjl5ZuKrS+40ROp5r
         Q9yk1w4TeUg67XlZxAhFBETWTskx6h4drkBpTzRX9yEWMv6ugLMk6znESJD1w3WKwR44
         76xh8I+IUQZ/Sjp8cP/ZkHRNF5iY6LUQ5H1HcNQSrQmxr5yAzmspU+HYHtzalPV5YeLr
         6yC2rQay9SObpYm4YE11kccME9M7ymya033EHCQy7Y1mG/C5AiZIgLcS5vPVTOhgF0wv
         7d31T3jioopONp7kq9/6AvbVZcqJuHEPr1HuhA3QAT1gqE2Aq1uP8UKtjPTy5PW6zSNL
         0cSQ==
X-Gm-Message-State: AOJu0YzQxnrD5Gw4Ip63YQb8/nIfCM7vsc+LXkIjLIUFhtym4EjPIfRZ
	ElTXZ0VJsGaRCWd6+wN0JmvHGMrLIKn9a+uo5ib/ZDdceTq6N4b5XUNp3jNEk4B6sn92YgAMPxD
	kC9tPfYqqNw==
X-Gm-Gg: ASbGncsKdAnnygK5a9720qolJVWKjDbheHY1B70QrQ0oYpXWN1P3WvpDYXpf5BC5795
	ZlfAOBO+eR96CskI1SKKipnkfOLgR+TMpDlCqdW5KpjBQ4Spu51nIud8hxkrdRXDFKxkUk1YPKM
	r5jRc6/axEPW5fIJ+quFP0ElpPdTfrMmMzIULqFLbmejl/eltZWFiFIJ4PI5VnI4hLnQl40AkUZ
	TLhyNm0eV5zrO8Gse72ul+5Uz7Nt5YxSZCEfAO/9Yv3yVEP7tLFlCFyCFJYiRg2Sq8bn7Tq2Cdn
	rkucnOlMtf7mXNHJRHw+GQTEPiT2+S5zStqulfOc9oQgqxua6RBREK4qbueEN7f9Vox+weXqnlA
	WtiWSMYDcpDjp1wOPgLqYiS1c1yonQ7n1JyWeEY6efbyyJKl+xtdHwTg6K7EqABdN5AQ01Fkjkw
	G3u32NUEae58t9HGg9lFb6
X-Google-Smtp-Source: AGHT+IELJCVFGLqkCST4IltIhXDZM9S/siO085/FDhprxOh2wFsisvOsYxp1EzupU4fvuGfuKFAMGg==
X-Received: by 2002:a05:6000:616:b0:3fe:efa8:7f1d with SMTP id ffacd0b85a97d-42567137428mr2651888f8f.7.1759532038150;
        Fri, 03 Oct 2025 15:53:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 15/22] x86/entry: Alter how IRET faults are recognised
Date: Fri,  3 Oct 2025 23:53:27 +0100
Message-Id: <20251003225334.2123667-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now we have two IRET instructions that can fault for guest reasons, and
the pre exception table gives handle_exception as the fixup for both.

Instead, we can have compat_restore_all_guest() use restore_all_guest()'s IRET
which gives us just a single position to handle specially.

In exception_with_ints_disabled(), remove search_pre_exception_table() and use
a simpler check.  Explain how the recovery works, because this isn't the first
time I've had to reverse engineer it for my own understanding.

The reference to iret_to_guest highlights that any checking here is specific
to CONFIG_PV, so exclude it in !PV builds.

Later in exception_with_ints_disabled(), it suffices to load %ecx rather than
%rcx, and remove a stray semi-colon from the rep movsq.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/x86_64/compat/entry.S |  3 +--
 xen/arch/x86/x86_64/entry.S        | 31 ++++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index d7b381ea546d..39925d80a677 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -167,8 +167,7 @@ FUNC(compat_restore_all_guest)
             scf=STK_REL(CPUINFO_scf,      CPUINFO_rip), \
             sel=STK_REL(CPUINFO_verw_sel, CPUINFO_rip)
 
-.Lft0:  iretq
-        _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+        jmp     iret_to_guest
 END(compat_restore_all_guest)
 
 /* Callers can cope with both %rax and %rcx being clobbered. */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index c02245ac064c..01b431793b7b 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -241,8 +241,9 @@ iret_exit_to_guest:
         SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
 
         addq  $8,%rsp
-.Lft0:  iretq
-        _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+
+LABEL(iret_to_guest, 0)
+        iretq
 END(restore_all_guest)
 
 /*
@@ -920,10 +921,23 @@ handle_exception_saved:
 exception_with_ints_disabled:
         testb $3,UREGS_cs(%rsp)         # interrupts disabled outside Xen?
         jnz   FATAL_exception_with_ints_disabled
-        movq  %rsp,%rdi
-        call  search_pre_exception_table
-        testq %rax,%rax                 # no fixup code for faulting EIP?
-        jz    .Ldispatch_exceptions
+
+#ifndef CONFIG_PV
+        /* No PV?  No IRETs-to-guest to worry about. */
+        jmp .Ldispatch_exceptions
+#else
+        /* Check to see if the exception was on the IRET to guest context. */
+        lea   iret_to_guest(%rip), %rax
+        cmp   %rax, UREGS_rip(%rsp)
+        jne   .Ldispatch_exceptions
+
+        /*
+         * Recovery is at handle_exception.  It may be necessary to make space
+         * on the interrupted stack for ec/ev, after which the current ec/ev
+         * is copied to make it appear as if this exception occurred in guest
+         * context.
+         */
+        lea   handle_exception(%rip), %rax
         movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
 
 #ifdef CONFIG_XEN_SHSTK
@@ -940,13 +954,14 @@ exception_with_ints_disabled:
         movq  %rsp,%rsi
         subq  $8,%rsp
         movq  %rsp,%rdi
-        movq  $UREGS_kernel_sizeof/8,%rcx
-        rep;  movsq                     # make room for ec/ev
+        mov   $UREGS_kernel_sizeof/8, %ecx
+        rep movsq                       # make room for ec/ev
 1:      movq  UREGS_error_code(%rsp),%rax # ec/ev
         movq  %rax,UREGS_kernel_sizeof(%rsp)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %r13b, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp   restore_all_xen           # return to fixup code
+#endif /* !CONFIG_PV */
 
 /* No special register assumptions. */
 FATAL_exception_with_ints_disabled:
-- 
2.39.5



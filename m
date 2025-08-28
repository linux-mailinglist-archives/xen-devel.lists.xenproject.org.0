Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDBEB3A3C8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099225.1453233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureI8-0006FT-P9; Thu, 28 Aug 2025 15:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099225.1453233; Thu, 28 Aug 2025 15:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureI8-0006AH-HV; Thu, 28 Aug 2025 15:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1099225;
 Thu, 28 Aug 2025 15:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCT-00035A-9A
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83e94ca9-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:03 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b618e067eso15234705e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:03 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:01 -0700 (PDT)
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
X-Inumbo-ID: 83e94ca9-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393563; x=1756998363; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DynKY6t4eG496mBBC39U8RWm4bWhTy2jBJs5lw0EOc=;
        b=u9boWzKpFPPHpEufPl+6c1Q5ujpHLMH+krTvAkfi6VOItQv6O9z2KEn/oFpTlwD5QT
         nAQF7cyA2gDQytJpHrleeuu5DUA/hTWdbUjmPmUQ1Suj54dkEmBoQl/RC4Ks+qvjRKWT
         TSwVPx2WJCMOSKFeViFzRS3+QMiST0RMHo4sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393563; x=1756998363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DynKY6t4eG496mBBC39U8RWm4bWhTy2jBJs5lw0EOc=;
        b=t57AoKquGkXxx7NoErbr8Ad+QH1bh6kXhhGKcAep8stclNn0YHcpYJYMldDtx8nzXu
         VNiLN3S+P//VkOuidh10A3t7Rb80DpzottNxcC7VoqInmW3/xOG8v1QDpZxtcOC+v9xH
         7d/frcpzmWrpa7dN+Xs5gtE6EBR2tvPgUzXRSCFPtTcPBQLRyEX1exQmZ6Zb8iHOI++V
         JB3bKekbU35W7QSTzBR5yWCU1iMn0msnYpvcBZJ+O4XKtq0k9VjQfV5135pBkHZesHii
         doIkITLlSubjYPQ6+hBwR2kiz2/mNzpb7svEpD8MF+3m2umzoFaMkIrbxs2ucuX/Ov8F
         9ErQ==
X-Gm-Message-State: AOJu0YwkhKvMe8jO2NzVxhL2RY8IuxyvUH81akVzsxJKbgCsJh3KHPVR
	tbIoTavqwB4s0mg3m5B90/JruCJ13tTze6By4k4XAljQNIy6IXmV8KxlmCbAMTyoaseVMA0j+J5
	mk9E9
X-Gm-Gg: ASbGncuy7NscJ8/Zoh8tZ1DLb/dPyDfM5kmGcHchrghVNZyvetuySR2yA00RvRVpwux
	V+aFyc2gaiFnL+CmkD9C5AyaE/7zm7czw5nN9VPoGxL0YW8bk6f4ts+1eR/2Zjrp/GMPkBHjkgF
	qc64TDeM6amr3XWfo+uFj22ZdYQDSlUmoQoXiHOdTPLsbj4RVVO/VqrE62JwTB7V8zTqrPpGb8R
	CDGjhKLZsxAEfJUJBoa3fNv8YAsPsoJIKJeJ64e8DptKEELSq+QGavWeZ6tl7SqC9MGZ0+Maefa
	zx/3bNBIem0Un7N1WUKZkTIXyZGBtjkNyEP/eN7Uio7vzQltqVM2lTxgeEVMVjNNU4Gm9h1RF2O
	4QJmzqnxbj95E93KNgDcB0LnMYjqPyaTIzJPm0wqBsfd3Z8eqZ9jvA7o7ihlMAMOkJGXje6BUGk
	z6KK/ghrmhYng=
X-Google-Smtp-Source: AGHT+IGIg69RaxPXalNtvgdkDfZzuEgN/maUA0NU09ZfV4DXuJGacLH+Dnaxa6jb0/6qldNxuvJkVA==
X-Received: by 2002:a05:600c:a402:b0:45b:7510:4042 with SMTP id 5b1f17b1804b1-45b75104244mr37200115e9.17.1756393562644;
        Thu, 28 Aug 2025 08:06:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 10/23] x86/traps: Make an IDT-specific #DB helper
Date: Thu, 28 Aug 2025 16:03:56 +0100
Message-Id: <20250828150409.901315-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED provides PENDING_DBG in the the stack frame, avoiding the need to read
%dr6 manually.

Rename do_debug() to handle_DB(), and update it to take a dbg field using
positive polarity.

Introduce a new handle_DB_IDT() which reads %dr6.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/traps.c        | 28 +++++++++++++++++-----------
 xen/arch/x86/x86_64/entry.S |  2 +-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7ae46ae20f98..0372f1c386a8 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1992,14 +1992,11 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
 
 void nocall sysenter_eflags_saved(void);
 
-void asmlinkage do_debug(struct cpu_user_regs *regs)
+/* Handle #DB.  @dbg is PENDING_DBG, a.k.a. %dr6 with positive polarity. */
+static void handle_DB(struct cpu_user_regs *regs, unsigned long dbg)
 {
-    unsigned long dr6;
     struct vcpu *v = current;
 
-    /* Stash dr6 as early as possible. */
-    dr6 = read_debugreg(6);
-
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
      *
@@ -2066,13 +2063,13 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
          * If however we do, safety measures need to be enacted.  Use a big
          * hammer and clear all debug settings.
          */
-        if ( dr6 & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
+        if ( dbg & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
         {
             unsigned int bp, dr7 = read_debugreg(7);
 
             for ( bp = 0; bp < 4; ++bp )
             {
-                if ( (dr6 & (1u << bp)) && /* Breakpoint triggered? */
+                if ( (dbg & (1u << bp)) && /* Breakpoint triggered? */
                      (dr7 & (3u << (bp * DR_ENABLE_SIZE))) && /* Enabled? */
                      ((dr7 & (3u << ((bp * DR_CONTROL_SIZE) + /* Insn? */
                                      DR_CONTROL_SHIFT))) == DR_RW_EXECUTE) )
@@ -2093,9 +2090,9 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
          * so ensure the message is ratelimited.
          */
         gprintk(XENLOG_WARNING,
-                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dr6 %lx\n",
+                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dbg %lx\n",
                 regs->cs, _p(regs->rip), _p(regs->rip),
-                regs->ss, _p(regs->rsp), dr6);
+                regs->ss, _p(regs->rsp), dbg);
 
         return;
     }
@@ -2107,7 +2104,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
      * by debugging actions completed behind it's back.
      */
     v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
-                                v->arch.dr6, dr6 ^ X86_DR6_DEFAULT);
+                                v->arch.dr6, dbg);
 
     if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
     {
@@ -2115,7 +2112,16 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    pv_inject_DB(dr6 ^ X86_DR6_DEFAULT);
+    pv_inject_DB(dbg);
+}
+
+/*
+ * When using IDT delivery, it is our responsibility to read %dr6.  Convert it
+ * to positive polarity.
+ */
+void asmlinkage handle_DB_IDT(struct cpu_user_regs *regs)
+{
+    handle_DB(regs, read_debugreg(6) ^ X86_DR6_DEFAULT);
 }
 
 void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 39c7b9d17f9e..789687488c5f 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1171,7 +1171,7 @@ FUNC(handle_ist_exception)
 .L_ ## vec ## _done:
 
         DISPATCH(X86_EXC_NMI, do_nmi)
-        DISPATCH(X86_EXC_DB,  do_debug)
+        DISPATCH(X86_EXC_DB,  handle_DB_IDT)
         DISPATCH(X86_EXC_MC,  do_machine_check)
 #undef DISPATCH
 
-- 
2.39.5



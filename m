Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CC9BB85DB
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137091.1473523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohO-0007HN-Id; Fri, 03 Oct 2025 22:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137091.1473523; Fri, 03 Oct 2025 22:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohO-0007Dx-Er; Fri, 03 Oct 2025 22:56:26 +0000
Received: by outflank-mailman (input) for mailman id 1137091;
 Fri, 03 Oct 2025 22:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4ofB-0004mK-A8
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:09 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd247d1e-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:54:06 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso17314265e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:54:04 -0700 (PDT)
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
X-Inumbo-ID: dd247d1e-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532045; x=1760136845; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAM/JhGgwRbXnxpkX9BmZCueQhFCGHIiDKu4L8Kc5NI=;
        b=l+ocZeIZ7vHcWu6WaT7MfDWYXWo42Ht1hVndHlnC17zavjX+u7XhIevnEb6Ced6xLN
         KkBKPn6P4m34+8EikLU7FY9QdACP1T7xNTRXQkpx2C+SyqPwXKp5Yoo2WbkbkrZY/2au
         aD626tyTuShJHxRhVYZYW078kPCzGGKsfKgqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532045; x=1760136845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAM/JhGgwRbXnxpkX9BmZCueQhFCGHIiDKu4L8Kc5NI=;
        b=WIBkLixK8g6awlNH+PtqplhMobx/YM5FyJ2vp2LilMZlj0rniFG9UxZvj5wqyCkUDg
         p7e2+KwVUfjzb4WP7/A2VjL7g3oCqMxfBk6F+8pJfPw0W9E0f9nvTjZZ6SDmM/xNzYMm
         Of5UGjdpBBkZp+l1mUDxa462nrjB63F+/R8zrSf3hMYiF//YjYwKK4kWxZ9BCNV5jeAX
         q7bGQq2sb/VTOBKPK5FZD6mWnxpOsF8xz0Gt/FU5gChkK85V/9IR0q0rMnpeDjaX+5Y/
         mDCuKfOkhhia3JKYYFRt06BaB/GhMMMK2TXK7UG/nq+Nnph/ohpSf+77MpO/BY4QRpGw
         btQQ==
X-Gm-Message-State: AOJu0Yx4L1bTvyFlQLq8ETKVF7P9pLCFRCpK+qkopguUz0CTIG3dO6a3
	njABXmDdw876RWJUnmLkI7uU0JOWRlkQQ6RRD0+GCX2IEUaCGVad556FZjEre/fk7R2VBGDIjp7
	X9sOK4E8rBbnJ
X-Gm-Gg: ASbGncs4goLPk59ySaGFnsukY33H7VGvymHO+bj48+Eo377Fw2mR9fJjIEaOAtmDJvF
	lDEcSgvyvB8nYJld2xtiymAubQR9Gs/OKg3Z2hbjgQn69fufUdhwko4dx4Sx4rJBrtQNy8dxkgK
	hiSyPtIY2LdfGri0ek3d8oPYo6dmU+lfDu6E6CIv6fALlcDRV12a+iybdGtS8VUWrq8tOLkgjjL
	4pm7Z5M4hkYPpvOAIjcln5KRgX971zYe0AuNBX8bs5MjTuOxUbIFwBQWcVXk0CfjQU79QZWgQj3
	PcfKpwZ2+0+usf1hTJtQDhzFbGmkVAV9QiB3Sg/jTOdP1Pm+/j3aQBGFFsBJIKIa8OTNmeuM1fL
	AvETTyEv4vMjnrvzilffgNXv/G8WXDBWN+L5P4HHmH99SIQMkb/T9okkLGqayKMJmvRsIlOYzoR
	/COCt3rQkVwQNBOOJcXKp3
X-Google-Smtp-Source: AGHT+IHf/5Lk7C3mfMNu6HKxbtLJZy158+oGM/lvWpJaZ1zxx5/FO9MKr26tOoQHviQmduexjGe1xg==
X-Received: by 2002:a5d:64e7:0:b0:3ff:d5c5:6b01 with SMTP id ffacd0b85a97d-42567135191mr2675741f8f.19.1759532045068;
        Fri, 03 Oct 2025 15:54:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 20/22] x86/pv: ERETU error handling
Date: Fri,  3 Oct 2025 23:53:32 +0100
Message-Id: <20251003225334.2123667-21-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ERETU can fault for guest reasons, and like IRET needs special handling to
forward the error into the guest.

As this is largely written in C, take the opportunity to better classify the
sources of error, and in particilar, not forward errors that are actually
Xen's fault into the guest, opting for a domain crash instead.

Because ERETU does not enable NMIs if it faults, a corner case exists if an
NMI was taken while in guest context, and the ERETU back out faults.  Recovery
must involve an ERETS with the interrupted context's NMI flag.

See the comments for full details.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/traps.c             | 115 +++++++++++++++++++++++++++++++
 xen/arch/x86/x86_64/entry-fred.S |  13 ++++
 2 files changed, 128 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 3f7db11c247b..955cff32d75f 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2345,6 +2345,113 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
     fatal_trap(regs, false);
 }
 
+void nocall eretu_error_dom_crash(void);
+
+/*
+ * Classify an event at the ERETU instruction, and handle if possible.
+ * Returns @true if handled, @false if the event should continue down the
+ * normal handlers.
+ */
+static bool handle_eretu_event(struct cpu_user_regs *regs)
+{
+    unsigned long recover;
+
+    /*
+     * WARNING: The GPRs in gregs overlaps with regs.  Only gregs->error_code
+     *          and later are legitimate to access.
+     */
+    struct cpu_user_regs *gregs =
+        _p(regs->rsp - offsetof(struct cpu_user_regs, error_code));
+
+    /*
+     * The asynchronous or fatal events (INTR, NMI, #MC, #DF) have been dealt
+     * with, meaning we only have syncrhonous ones to consider.  Anything
+     * which isn't a hardware exception wants handling normally.
+     */
+    if ( regs->fred_ss.type != X86_ET_HW_EXC )
+        return false;
+
+    /*
+     * Guests are permitted to write non-present GDT/LDT entries.  Therefore
+     * #NP[sel] (%cs) and #SS[sel] (%ss) must be handled as guest errors.  The
+     * only other source of #SS is for a bad %ss-relative memory access in
+     * Xen, and if the stack is that bad, we'll have escalated to #DF.
+     *
+     * #PF can happen from ERETU accessing the GDT/LDT.  Xen may translate
+     * these into #GP for the guest, so must be handled as guest errors.  In
+     * theory we can get #PF for a bad instruction fetch or bad stack access,
+     * but either of these will be fatal and not end up here.
+     */
+    switch ( regs->fred_ss.vector )
+    {
+    case X86_EXC_GP:
+        /*
+         * #GP[0] can occur because of a NULL %cs or %ss (which are a guest
+         * error), but some #GP[0]'s are errors in Xen (ERETU at SL != 0), or
+         * errors of Xen handling guest state (bad metadata).  These magic
+         * numbers came from the FRED Spec; they check that ERETU is trying to
+         * return to Ring 3, and that reserved or inapplicable bits are 0.
+         */
+        if ( regs->error_code == 0 && (gregs->cs & ~3) && (gregs->ss & ~3) &&
+             (regs->fred_cs.sl != 0 ||
+              (gregs->csx    & 0xffffffffffff0003UL) != 3 ||
+              (gregs->rflags & 0xffffffffffc2b02aUL) != 2 ||
+              (gregs->ssx    &         0xfff80003UL) != 3) )
+        {
+            recover = (unsigned long)eretu_error_dom_crash;
+
+            if ( regs->fred_cs.sl )
+                gprintk(XENLOG_ERR, "ERETU at SL %u\n", regs->fred_cs.sl);
+            else
+                gprintk(XENLOG_ERR, "Bad return state: csx %#lx, rflags %#lx, ssx %#x\n",
+                        gregs->csx, gregs->rflags, (unsigned int)gregs->ssx);
+            break;
+        }
+        fallthrough;
+    case X86_EXC_NP:
+    case X86_EXC_SS:
+    case X86_EXC_PF:
+        recover = (unsigned long)entry_FRED_R3;
+        break;
+
+        /*
+         * Handle everything else normally.  #BP and #DB would be debugging
+         * activities in Xen.  In theory we can get #UD if CR4.FRED gets
+         * cleared, but in practice if that were the case we wouldn't be here
+         * handling the result.
+         */
+    default:
+        return false;
+    }
+
+    this_cpu(last_extable_addr) = regs->rip;
+
+    /*
+     * Everything else is recoverable, one way or another.
+     *
+     * If an NMI was taken in guest context and the ERETU faulted, NMIs will
+     * still be blocked.  Therefore we copy the interrupted frame's NMI status
+     * into our own, and must ERETS as part of recovery.
+     */
+    regs->fred_ss.nmi = gregs->fred_ss.nmi;
+
+    /*
+     * Next, copy the exception information from the current frame back onto
+     * the interrupted frame, preserving the interrupted frame's %cs and %ss.
+     */
+    *cpu_regs_fred_info(regs) = *cpu_regs_fred_info(gregs);
+    gregs->ssx = (regs->ssx & ~0xffff) | gregs->ss;
+    gregs->csx = (regs->csx & ~0xffff) | gregs->cs;
+    gregs->error_code   = regs->error_code;
+    gregs->entry_vector = regs->entry_vector;
+
+    fixup_exception_return(regs, recover, 0);
+
+    return true;
+}
+
+void nocall eretu(void);
+
 void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
 {
     struct fred_info *fi = cpu_regs_fred_info(regs);
@@ -2383,6 +2490,14 @@ void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
     if ( regs->eflags & X86_EFLAGS_IF )
         local_irq_enable();
 
+    /*
+     * An event taken at the ERETU instruction may be because of guest state
+     * and in that case will need special handling.
+     */
+    if ( unlikely(regs->rip == (unsigned long)eretu) &&
+         handle_eretu_event(regs) )
+        return;
+
     switch ( type )
     {
     case X86_ET_HW_EXC:
diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
index a1ff9a4a9747..2fa57beb930c 100644
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -27,9 +27,22 @@ END(entry_FRED_R3)
 
 FUNC(eretu_exit_to_guest)
         POP_GPRS
+
+        /*
+         * Exceptions here are handled by redirecting either to
+         * entry_FRED_R3() (for an error to be passed to the guest), or to
+         * eretu_error_dom_crash() (for a Xen error handling guest state).
+         */
+LABEL(eretu, 0)
         eretu
 END(eretu_exit_to_guest)
 
+FUNC(eretu_error_dom_crash)
+        PUSH_AND_CLEAR_GPRS
+        sti
+        call    asm_domain_crash_synchronous  /* Does not return */
+END(eretu_error_dom_crash)
+
         /* The Ring0 entrypoint is at Ring3 + 0x100. */
         .org entry_FRED_R3 + 0x100, 0xcc
 
-- 
2.39.5



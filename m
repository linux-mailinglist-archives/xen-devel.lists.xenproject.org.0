Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7FB3A3BB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099195.1453178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHf-0002cm-MY; Thu, 28 Aug 2025 15:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099195.1453178; Thu, 28 Aug 2025 15:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHf-0002XG-AJ; Thu, 28 Aug 2025 15:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1099195;
 Thu, 28 Aug 2025 15:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCn-0003MD-Ee
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b17f2f-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:06:25 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so3838295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:25 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:23 -0700 (PDT)
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
X-Inumbo-ID: 90b17f2f-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393584; x=1756998384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9VifVPyRYNO8P2YadoE86GWM+l9cyVgWHH3NXrObOM=;
        b=SHeYSmSKmPgVrzBzLTPjUGPRZqRznzDjsolGLM72xFs07LKTztj7gaRW/hEMlMWnB+
         XATKnaKtJ45M8zXAOJoD5f9fPU11w9ibQyfTLqYlTV3qJ6UsVigsEqwTjIPSPv3JiOzZ
         mPCsLo493DJJ9fzODYmDU5HeeaRbOtvVwpGok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393584; x=1756998384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9VifVPyRYNO8P2YadoE86GWM+l9cyVgWHH3NXrObOM=;
        b=nMVgf8qu1T1pWEB7chfF2sM5F6vRqJ3zMWTacG1xOmp32ZV56Lq5RUk2TAdzRqHKh9
         dYUSnKV+NpYl/fflrtCSdaRhKd870vNCl0xndnJ4jnvRzR2+qxgI0OPzgAmpp8XdDqqS
         wQKTCOAIxzCxdcSFyBomfpySqHWaSNJjxLN2/DT5dDErpOWD1ZMEuuATsIKk9epGDtdA
         XbmOf7xa1d48Uj2Lw3a8QN0GVdJzszWY3M7fDIhXwRUKnp8c+9RFUi/xYbEfK0294WC+
         bfToxkWBkC+/Y3uBuDAFVE0Izk6NpR/50zpMsEs1u/7aCdVpRhcbZ9NqvYElQmfF2zNd
         lCyQ==
X-Gm-Message-State: AOJu0YwnDGoQ3lFtvhBXjavWutnCQT7lVYiolPyaXTJvr3K81QU5rzjG
	iY9VlE7lITwHT1zQGANuC/Wb40AfpB5+A0jtgMcHaeGKaihXfxZfO3dyPJ10AjfH6STDXWrfgUY
	yCgPC
X-Gm-Gg: ASbGnctQxv/HdmFvxmbNCm6LTug3f1RcYv6u18JoZl2yUkv00e3KtMxtGD/jCIsT7ju
	vGE599Qc2/b8qP+rjRCSwTLpc0ZBGJ+2fmYD7AOh2HAypyWboZ8F30v3COznlElNu49r2a3mfJ3
	MpMdZTEojDSYeVtef3LJQCR/W61GZfA98l/3EVYiFZC2Qqs6UpcxyJ4V4l8pnNNx/XGutESStW+
	sTlW6vs7mbGHWydYBFFaNaFdiN/W6MR8ZeCxFdQxrea4/S9j5raGDppjYr044OESNoj717aK+VA
	utI5ACZDNs6JFVHziEi6jgerICzqbZZhFIHz1UKU2W7NnxQT0sRJD+8NsHfXHlp2XutfZYjwjqQ
	jGvJLF0ziXxmoVpU0j0tdD4eYNSMDPM+CSMFBvKGq3/gmAzCr5ksJpRsLxry+NdkYOwD/uS0xy4
	RMGFZMGrpuDzU=
X-Google-Smtp-Source: AGHT+IGNDVxoec5ifGp7ItTPWwPLlGe9Bl9ZKPx+k7h/X2UHoruYrK5FmiyPA21+6coxA0yX15wV1w==
X-Received: by 2002:a05:600c:1c92:b0:458:bfe1:4a81 with SMTP id 5b1f17b1804b1-45b6193c94dmr140920095e9.17.1756393584033;
        Thu, 28 Aug 2025 08:06:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 21/23] x86/pv: ERETU error handling
Date: Thu, 28 Aug 2025 16:04:07 +0100
Message-Id: <20250828150409.901315-22-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
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
index 72df446a6a78..e10b4e771824 100644
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
index 07684f38a078..8b5cafb866e2 100644
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



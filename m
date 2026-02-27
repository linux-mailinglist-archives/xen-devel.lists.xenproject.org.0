Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLeiOfIlommL0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5F41BEF2E
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243152.1543231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74t-0003AE-Fy; Fri, 27 Feb 2026 23:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243152.1543231; Fri, 27 Feb 2026 23:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74s-00032V-P4; Fri, 27 Feb 2026 23:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1243152;
 Fri, 27 Feb 2026 23:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74q-0001Do-1B
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:56 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66064ac5-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:51 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-4398f9e3b40so2692986f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:51 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:50 -0800 (PST)
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
X-Inumbo-ID: 66064ac5-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234211; x=1772839011; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mPsNS3LpQ9n9lXMqkSeJXydtadjNiDxPpSog7A2Jaw=;
        b=PdjhBNUzXeKG5TFAcbNR1UbXPQwTxr46q7dh0n8XrILY8ncoEHcMbnPBtV741sLYe9
         ZKmSRnSaJJ8aiFeIbSu3KUZ1iYE77MuDnUe0dGd39rgPt/A1rvMR2ZKCGHyxoANjDs6s
         caPxN4Mjd3Dl/fYLkltU2he5mEWdeiuDqONVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234211; x=1772839011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+mPsNS3LpQ9n9lXMqkSeJXydtadjNiDxPpSog7A2Jaw=;
        b=C4PDdfQAWDkpMVNe7Azk0b+WMjaiCRJhmgW1TL1dpb4EA70EFCJYxu46PRi+ZO7MZg
         3jBtA6xVOnHb5XbTfpaTZzH/IQWtloOFjEExRyqM7Tk7PANC3M0pSJHIz5oKCnfRfU/G
         Um4PsD1mgKZbN1ZPaXyR1PlEyX4Q0wY0Q8u69/3gAQtZA/j5AP0IJf5xu4JZ8l1+Gh9A
         44B7Df7ocwiClV+xl3fpnUUL/VHBhPp1pWVO5dKgPAPVtQg8bRIEcxoBl0lPIAcvCbrY
         6CFhH6tM9NQKe+CvB+DJPBR8StLq6pvHsnFMHou1hYMkpsYA4XRUL+F0FMPvybCfeTuS
         6saw==
X-Gm-Message-State: AOJu0YzewyUad9XglwYsYOC3n2s/dj2OVEzcrmaEXqJweM+gONO1hoxS
	47QC3Nyoy7AQxM+X8uId3fBSEntTgkkweBdsDGbjP9jQhJTkcb0xn8MXMyDAyBHvjUnLaqknQzO
	6bTx8uh2OK5jf
X-Gm-Gg: ATEYQzyI0CRFEDiPMAKVs96VXZqbxgex+bPLPjlCTUgSplaBcBRisSA+Bp7sVVZSnos
	8S4aFXcSvcXyL6Y3TjrRoq28VhfKSTgVGFN0oL+TbkhX7s0ZdODBgp1GcvLBdnRhnrLAGWjUBQN
	QOMtV4Qr94w9l+JfefHxKylj/qqZF2vfyIrcZ6S++5TAK49QbnMOOqk0HKywPZ0G+FLM+ohjzRq
	lLYBOCkUTkYY2KuYjeUnZU2rOeNTbtxFe5jalw0XnolH9UWmf3DzhNfUR5zWrWJU0hdIaIcsxi1
	gCZG9RY5naUcppdtsoccdW3+6+nF4MPsUT0tPWxzkXAXBc6DfMpbga8yeqQoXGXwwSYIlDgjx/0
	DUgHpebFKKLjjDWWaNMNITBT67Ix9XIhVNQYY+VxS4dW+yAPO8Do8RUOOytRmNx4hb6uzu4Uprc
	7vudvUAUjvSyKstyc3CvM+TIARdKPqygRmKJxZQnhC4fR/OjeHgeQ9Yvs0qeYjp26afQ0xJvQ=
X-Received: by 2002:a05:6000:144c:b0:430:f3ab:56af with SMTP id ffacd0b85a97d-4399de4a662mr8040445f8f.48.1772234210832;
        Fri, 27 Feb 2026 15:16:50 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 11/14] x86/pv: ERETU error handling
Date: Fri, 27 Feb 2026 23:16:33 +0000
Message-Id: <20260227231636.3955109-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F5F41BEF2E
X-Rspamd-Action: no action

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * Tweak comments.

v2:
 * New
---
 xen/arch/x86/traps.c             | 115 +++++++++++++++++++++++++++++++
 xen/arch/x86/x86_64/entry-fred.S |  13 ++++
 2 files changed, 128 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7563576fb477..2f40f628cbff 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2348,6 +2348,113 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
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
+     * with, meaning we only have synchronous ones to consider.  Anything
+     * which isn't a hardware exception (e.g. #BP) wants handling normally.
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
+         * errors of Xen's handling of guest state (bad metadata).
+         *
+         * These magic numbers came from the FRED Spec; they check that ERETU
+         * is trying to return to Ring 3, and that reserved or inapplicable
+         * bits are 0.
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
+         * Handle everything else normally.  e.g. #DB would be debugging
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
@@ -2389,6 +2496,14 @@ void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
     if ( regs->eflags & X86_EFLAGS_IF )
         local_irq_enable();
 
+    /*
+     * An event taken at the ERETU instruction may be because of bad guest
+     * state.  If so, it will need special handling.
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



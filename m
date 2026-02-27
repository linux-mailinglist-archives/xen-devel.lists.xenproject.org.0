Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBZwK/ElommL0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646231BEF12
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243151.1543221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74s-0002wT-3o; Fri, 27 Feb 2026 23:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243151.1543221; Fri, 27 Feb 2026 23:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74r-0002ok-PX; Fri, 27 Feb 2026 23:16:57 +0000
Received: by outflank-mailman (input) for mailman id 1243151;
 Fri, 27 Feb 2026 23:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74p-0001Do-0s
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:55 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65a17652-1432-11f1-9ccf-f158ae23cfc8;
 Sat, 28 Feb 2026 00:16:51 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4398d9a12c6so2002729f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:51 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:49 -0800 (PST)
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
X-Inumbo-ID: 65a17652-1432-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234210; x=1772839010; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPkD49jGeQX0+NTjYasufq4vkWv8Wa7wJQ5GOxuUBzw=;
        b=aWu0v+aKBSi+ZKXTbUAIbhqLiQ3t0UCag3SY/IXNU8JtgkdzoJIrQ60VGwJb9cv4Y4
         jNGvfp2rCW7wSHNUZy3zh3kDtFHniQVLflFDdMPuqlR4IRkD2OQJX3rR/25hji2Yr8HH
         VuPEQ7C6rHI5+6XRZF9iwNbB4CWl99pMP+7y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234210; x=1772839010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPkD49jGeQX0+NTjYasufq4vkWv8Wa7wJQ5GOxuUBzw=;
        b=DdWnCDvVvP4AqNzRXCvmgu0RjdtbedXT+uxnK61aVSi9EDuCwNfkBsgDWQ4Vcwko49
         xwMSpOstGei/PHJf3MFw9W2upjdGZ+sNsAQk4rh7CnqLKupX75CqsoAhnEOHxOpGkgOX
         ddq/UDaizVe57NPvgGQxav1UFkWJ0pd8Ys2PB0ddmk/x8uDTuz37FymzbxcyPMreON6A
         ekJ9BcEk14xtQ6f17AYzFMHurBy/GchNZf9lKE7PgF/v1ObU126ndDvhd3KeqNMAqTWD
         JqOzLffncvpIa/J4wsVLsLVVQqARTK4gs1tSxN10sECeeCgOCR60X7XjvUHz2uuzHfZz
         63vA==
X-Gm-Message-State: AOJu0Yynw/kQWYsK7Gl9vJD84x3w0caPwULE5E+XnTFTR8JB4EaySAv4
	oeIifRzWvhN0xnR5cXv0IGhvQ83fwdGX8zMaSmX5PJ09dyR/k6cavq26iOzcfMyeRYpNn8FjcDu
	rBGxP2XccOA==
X-Gm-Gg: ATEYQzwLpygoeAfajVlmhzf9oEj32veKnLugd0DsSSkyl+XViBax4otbgprtdLRlHlv
	e1il92qsxUkEZ0jvQkPNWGWwkp7uXKp/WfvLRgjw68mj60YUlX8DXRourpImchy6ITOvimnvd79
	+X9F5L7LKCL2QulJqnKjX+7PoZzC30h0Y4gbGJ3OP+f9EHl0I3PS+aeYp8j1CpYyycst19XIttL
	EumeAkxACZMWjf3iF8akKhdggWsYxv261LEgmXnq3EOrtb5y3wzilNEhT/BAQPjPn4VXlADKy5X
	GaC6zhylzoN2GHUUZ13EIYDYARmyO6C+cFiU0EQEo296G16TQa7xeLtuQrNMk0i4ui0GR/qOdc4
	iWhfv2RJkYNt7XQ10YJvl8KfliWzwPzFnaQjXMVakXSmfr3vv+U1r+BCIs74URBXCUy4YjqISdn
	3yAkuBG23jG3jY4ViUIaqAwz0aDJdwiQi+cZ7NYVQ1gRbL3LadQRIR58ae6qXPIHi62ocJ1fo=
X-Received: by 2002:a05:6000:4301:b0:439:8487:73b2 with SMTP id ffacd0b85a97d-4399ddf1330mr8136464f8f.14.1772234210254;
        Fri, 27 Feb 2026 15:16:50 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 10/14] x86/pv: Guest exception handling in FRED mode
Date: Fri, 27 Feb 2026 23:16:32 +0000
Message-Id: <20260227231636.3955109-11-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 646231BEF12
X-Rspamd-Action: no action

Under FRED, entry_from_pv() handles everything.  To start with, implement
exception handling in the same manner as entry_from_xen(), although we can
unconditionally enable interrupts after the async/fatal events.

After entry_from_pv() returns, test_all_events() needs to run to perform
exception and interrupt injection.  Split entry_FRED_R3() into two and
introduce eretu_exit_to_guest() as the latter half, coming unilaterally from
restore_all_guest().

For all of this, there is a slightly complicated relationship with CONFIG_PV.
entry_FRED_R3() must exist irrespective of CONFIG_PV, because it's the
entrypoint registered with hardware.  For simplicity, entry_from_pv() is
always called, but it collapses into fatal_trap() in the !PV case.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * Treat nested events as fatal.

v3:
 * Adjust comments.
 * Group CP with others.  It's definitely wrong for perf, but that's out the
   window anyway now that we're letting a compiler make the decision tree.
v2:
 * New
---
 xen/arch/x86/traps.c             | 78 +++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/entry-fred.S | 13 +++++-
 xen/arch/x86/x86_64/entry.S      |  4 +-
 3 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 48667c71d591..7563576fb477 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2266,9 +2266,85 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 
 void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 {
+    struct fred_info *fi = cpu_regs_fred_info(regs);
+    uint8_t type = regs->fred_ss.type;
+    uint8_t vec = regs->fred_ss.vector;
+
     /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
-    regs->entry_vector = regs->fred_ss.vector;
+    regs->entry_vector = vec;
+
+    if ( !IS_ENABLED(CONFIG_PV) )
+        goto fatal;
+
+    /*
+     * First, handle the asynchronous or fatal events.  These are either
+     * unrelated to the interrupted context, or may not have valid context
+     * recorded, and all have special rules on how/whether to re-enable IRQs.
+     */
+    if ( regs->fred_ss.nested )
+        goto fatal;
+
+    switch ( type )
+    {
+    case X86_ET_EXT_INTR:
+        return do_IRQ(regs);
+
+    case X86_ET_NMI:
+        return do_nmi(regs);
+
+    case X86_ET_HW_EXC:
+        switch ( vec )
+        {
+        case X86_EXC_DF: return do_double_fault(regs);
+        case X86_EXC_MC: return do_machine_check(regs);
+        }
+        break;
+    }
 
+    /*
+     * With the asynchronous events handled, what remains are the synchronous
+     * ones.  PV guest context always had interrupts enabled.
+     */
+    local_irq_enable();
+
+    switch ( type )
+    {
+    case X86_ET_HW_EXC:
+    case X86_ET_PRIV_SW_EXC:
+    case X86_ET_SW_EXC:
+        switch ( vec )
+        {
+        case X86_EXC_PF:  handle_PF(regs, fi->edata); break;
+        case X86_EXC_GP:  do_general_protection(regs); break;
+        case X86_EXC_UD:  do_invalid_op(regs); break;
+        case X86_EXC_NM:  do_device_not_available(regs); break;
+        case X86_EXC_BP:  do_int3(regs); break;
+        case X86_EXC_DB:  handle_DB(regs, fi->edata); break;
+        case X86_EXC_CP:  do_entry_CP(regs); break;
+
+        case X86_EXC_DE:
+        case X86_EXC_OF:
+        case X86_EXC_BR:
+        case X86_EXC_NP:
+        case X86_EXC_SS:
+        case X86_EXC_MF:
+        case X86_EXC_AC:
+        case X86_EXC_XM:
+            do_trap(regs);
+            break;
+
+        default:
+            goto fatal;
+        }
+        break;
+
+    default:
+        goto fatal;
+    }
+
+    return;
+
+ fatal:
     fatal_trap(regs, false);
 }
 
diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
index 3c3320df22cb..a1ff9a4a9747 100644
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -15,9 +15,20 @@ FUNC(entry_FRED_R3, 4096)
         mov     %rsp, %rdi
         call    entry_from_pv
 
+#ifdef CONFIG_PV
+        GET_STACK_END(14)
+        movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
+
+        jmp     test_all_events
+#else
+        BUG     /* Not Reached */
+#endif
+END(entry_FRED_R3)
+
+FUNC(eretu_exit_to_guest)
         POP_GPRS
         eretu
-END(entry_FRED_R3)
+END(eretu_exit_to_guest)
 
         /* The Ring0 entrypoint is at Ring3 + 0x100. */
         .org entry_FRED_R3 + 0x100, 0xcc
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 8b83082413a5..17ca6a493906 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -63,7 +63,7 @@ UNLIKELY_END(syscall_no_callback)
         /* Conditionally clear DF */
         and   %esi, UREGS_eflags(%rsp)
 /* %rbx: struct vcpu */
-test_all_events:
+LABEL(test_all_events, 0)
         ASSERT_NOT_IN_ATOMIC
         cli                             # tests must not race interrupts
 /*test_softirqs:*/
@@ -152,6 +152,8 @@ END(switch_to_kernel)
 FUNC_LOCAL(restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
 
+        ALTERNATIVE "", "jmp eretu_exit_to_guest", X86_FEATURE_XEN_FRED
+
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
         mov VCPU_arch_msrs(%rbx), %rdx
         mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
-- 
2.39.5



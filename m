Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IG1FvMlommG0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C661BEF35
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243143.1543169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74m-0001cG-HA; Fri, 27 Feb 2026 23:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243143.1543169; Fri, 27 Feb 2026 23:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74m-0001Xx-AX; Fri, 27 Feb 2026 23:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1243143;
 Fri, 27 Feb 2026 23:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74k-0008WD-Eh
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64a23d16-1432-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 00:16:49 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so2508815f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:49 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:47 -0800 (PST)
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
X-Inumbo-ID: 64a23d16-1432-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234209; x=1772839009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UFkS5LRVpmC0KP6ipyZ4ETPBXtVQAe04/RvjF0fewY=;
        b=Cvna4BAnfjmVea8EYBguec/SIJ54FYSiFw6gdPhB6LP5SVDRKl+kmXZ3exQly+xriw
         cTFSYfL2qDqJgsElxix0kL+m6gvUSbCe89WM2O5PwSfpggfnocBJhTUJMLdmA7z9rOek
         25pasuPJHgclQSOB+OBawF0VbaYHxv6X4KcC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234209; x=1772839009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0UFkS5LRVpmC0KP6ipyZ4ETPBXtVQAe04/RvjF0fewY=;
        b=nVqmpVHGilYf1jrojZoJ2589McoZe7sH64MO8Z0K8QuPoByNkKF/x6MqNO9iV94fzf
         WD1b/5z1cPaEXNmzRCsAQRtMlaMNJa8uFBXigrfAbDTi8hryrxlj8d7Ltt+MqyNY9djF
         BzfWMkUc3mBiaP9hq05wwhPylYdy2WDcpQzPd48m2dCgd5UDEXGvK6ecH2uvLaSPMgg0
         j/NFoLh8So51kNxOVDeQetYTzgjw7wqZNR87zWaHZRwSazK2tVSKkLij6gZkF37KBlvu
         FImyb9aribDSlBSiMUtKjR9qRBz9JYzJxSDD0lOvJbC03gY4lWMhmNFD6tcym8GZMju+
         Od4w==
X-Gm-Message-State: AOJu0YzAnf85+91Sc+RYZIcquMot2Iie//pG/KzDg02HqxQas8+KGoqO
	dX0sPtZwtzePEI/NA72rnjmOrXjEK7dHjQSZjSojgH0DNql0ZeRekrwRsyi3MhwN/t58Ds45dgD
	CJJUq
X-Gm-Gg: ATEYQzxU1CBRfw8h1JkqvHqijWhpiEwMHrN/0YLOipz5qJAchjonktSzeHRtONU+fM2
	Xs3ybIK8mbREjtJwBAqJXiBpVXMaD8LQexwLKEYxIZuPUXohaJihcGYN3QukG62kVVz61kN3rfU
	w+pkQb6dp7L2VuSCT9kgeZIdxb5XM9Qk1jTeop0oERZ+JJUYz54DegRoCMMUcRM5C0Vv0ncivVN
	aJQmQ0uyvI8G2fiqkfT4k1YZTXVNSRBSN/YqvVJx1NkSfMm7t/6LCHIiTDbT9adokvmiKg9wxCS
	e4YJbhruJOgFNTAQIOdMEPF+iiwYdpysWae0JkV6D/vDR7b2rXZJazEXYdvcVp8BoD9wRX47b7B
	eQJkhCVvfmyPfRoGFFAD9HIPVZw5dkt/hjctyZcVTACZbZWY2p8KxbBMclfVjEICfxoClp3CNfn
	0Q6Ihyn15F1HhrMPJAreIQTYzwoqHwfpgj/xuvOjCQJC/AxG4OlQnVF80wtbJzh8SafbQ+hFtJB
	vic/qbPMw==
X-Received: by 2002:a5d:5f94:0:b0:435:9144:1417 with SMTP id ffacd0b85a97d-4399de2baacmr8254016f8f.49.1772234208054;
        Fri, 27 Feb 2026 15:16:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 07/14] x86/traps: Introduce FRED entrypoints
Date: Fri, 27 Feb 2026 23:16:29 +0000
Message-Id: <20260227231636.3955109-8-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 10C661BEF35
X-Rspamd-Action: no action

Under FRED, there's one entrypoint from Ring 3, and one from Ring 0.

FRED gives us a good stack (even for SYSCALL/SYSENTER), and a unified event
frame on the stack, meaing that all software needs to do is spill the GPRs
with a line of PUSHes.  Introduce PUSH_AND_CLEAR_GPRS for this purpose, along
with the matching POP_GPRS.

Introduce entry_FRED_R0() which to a first appoximation is complete for all
event handling within Xen.

entry_FRED_R0() needs deriving from entry_FRED_R3(), so introduce a basic
handler.  There is more work required to make the return-to-guest path work
under FRED.

Also introduce entry_from_{xen,pv}() to be the C level handlers.  By simply
copying regs->fred_ss.vector into regs->entry_vector, we can reuse all the
existing fault handlers.

Extend fatal_trap() to render the event type, including by name, when FRED is
active.  This is slightly complicated, because X86_ET_OTHER must not use
vector_name() or SYSCALL and SYSENTER get rendered as #BP and #DB.

This is sufficient to handle all interrupts and exceptions encountered during
development, including plenty of Double Faults.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4:
 * Drop POP_GPRS %rax parameter for now.
 * Treat nested events as fatal.  Even if the condition didn't escalate to
   #DF, it still indicates an error with the linkage setup.

v3:
 * Adjust commit message to remove stale details
 * Adjust formatting in fatal_trap()
 * Group CP with others.  It's probably wrong for perf, but that's out the
   window anyway now that we're letting a compiler make the decision tree.

v2:
 * Don't render a vector name for X86_ET_SW_INT
 * Fix typos in names[]
 * Link entry-fred.o first

SIMICS hasn't been updated to the FRED v9, and still wants ENDBR instructions
at the entrypoints.
---
 xen/arch/x86/include/asm/asm_defns.h |  63 +++++++++++
 xen/arch/x86/traps.c                 | 155 +++++++++++++++++++++++++++
 xen/arch/x86/x86_64/Makefile         |   1 +
 xen/arch/x86/x86_64/entry-fred.S     |  33 ++++++
 4 files changed, 252 insertions(+)
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 4a21a7b46684..0dd63270fc7c 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -312,6 +312,69 @@ static always_inline void stac(void)
         subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
 .endm
 
+/*
+ * Push and clear GPRs
+ */
+.macro PUSH_AND_CLEAR_GPRS
+        push  %rdi
+        xor   %edi, %edi
+        push  %rsi
+        xor   %esi, %esi
+        push  %rdx
+        xor   %edx, %edx
+        push  %rcx
+        xor   %ecx, %ecx
+        push  %rax
+        xor   %eax, %eax
+        push  %r8
+        xor   %r8d, %r8d
+        push  %r9
+        xor   %r9d, %r9d
+        push  %r10
+        xor   %r10d, %r10d
+        push  %r11
+        xor   %r11d, %r11d
+        push  %rbx
+        xor   %ebx, %ebx
+        push  %rbp
+#ifdef CONFIG_FRAME_POINTER
+/* Indicate special exception stack frame by inverting the frame pointer. */
+        mov   %rsp, %rbp
+        not   %rbp
+#else
+        xor   %ebp, %ebp
+#endif
+        push  %r12
+        xor   %r12d, %r12d
+        push  %r13
+        xor   %r13d, %r13d
+        push  %r14
+        xor   %r14d, %r14d
+        push  %r15
+        xor   %r15d, %r15d
+.endm
+
+/*
+ * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
+ */
+.macro POP_GPRS
+        pop   %r15
+        pop   %r14
+        pop   %r13
+        pop   %r12
+        pop   %rbp
+        pop   %rbx
+        pop   %r11
+        pop   %r10
+        pop   %r9
+        pop   %r8
+        pop   %rax
+        pop   %rcx
+        pop   %rdx
+        pop   %rsi
+        pop   %rdi
+.endm
+
 #ifdef CONFIG_PV32
 #define CR4_PV32_RESTORE                               \
     ALTERNATIVE_2 "",                                  \
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 907fb4c186c0..48667c71d591 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -88,6 +88,13 @@ const unsigned int nmi_cpu;
 #define stack_words_per_line 4
 #define ESP_BEFORE_EXCEPTION(regs) ((unsigned long *)(regs)->rsp)
 
+/* Only valid to use when FRED is active. */
+static inline struct fred_info *cpu_regs_fred_info(struct cpu_user_regs *regs)
+{
+    ASSERT(read_cr4() & X86_CR4_FRED);
+    return &container_of(regs, struct cpu_info, guest_cpu_user_regs)->_fred;
+}
+
 struct extra_state
 {
     unsigned long cr0, cr2, cr3, cr4;
@@ -1028,6 +1035,32 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
         printk("Non-responding CPUs: {%*pbl}\n", CPUMASK_PR(&show_state_mask));
 }
 
+static const char *x86_et_name(unsigned int type)
+{
+    static const char *const names[] = {
+        [X86_ET_EXT_INTR]    = "EXT_INTR",
+        [X86_ET_NMI]         = "NMI",
+        [X86_ET_HW_EXC]      = "HW_EXC",
+        [X86_ET_SW_INT]      = "SW_INT",
+        [X86_ET_PRIV_SW_EXC] = "PRIV_SW_EXC",
+        [X86_ET_SW_EXC]      = "SW_EXC",
+        [X86_ET_OTHER]       = "OTHER",
+    };
+
+    return (type < ARRAY_SIZE(names) && names[type]) ? names[type] : "???";
+}
+
+static const char *x86_et_other_name(unsigned int what)
+{
+    static const char *const names[] = {
+        [0] = "MTF",
+        [1] = "SYSCALL",
+        [2] = "SYSENTER",
+    };
+
+    return (what < ARRAY_SIZE(names) && names[what]) ? names[what] : "???";
+}
+
 const char *vector_name(unsigned int vec)
 {
     static const char names[][4] = {
@@ -1106,6 +1139,38 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
         }
     }
 
+    if ( read_cr4() & X86_CR4_FRED )
+    {
+        bool render_ec = false;
+        const char *vec_name = NULL;
+
+        switch ( regs->fred_ss.type )
+        {
+        case X86_ET_HW_EXC:
+        case X86_ET_PRIV_SW_EXC:
+        case X86_ET_SW_EXC:
+            render_ec = true;
+            vec_name = vector_name(regs->fred_ss.vector);
+            break;
+
+        case X86_ET_OTHER:
+            vec_name = x86_et_other_name(regs->fred_ss.vector);
+            break;
+        }
+
+        if ( render_ec )
+            panic("FATAL TRAP: type %u, %s, vec %u, %s[%04x]%s\n",
+                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
+                  regs->fred_ss.vector, vec_name ?: "",
+                  regs->error_code,
+                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
+        else
+            panic("FATAL TRAP: type %u, %s, vec %u, %s%s\n",
+                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
+                  regs->fred_ss.vector, vec_name ?: "",
+                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
+    }
+
     panic("FATAL TRAP: vec %u, %s[%04x]%s\n",
           trapnr, vector_name(trapnr), regs->error_code,
           (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
@@ -2199,6 +2264,96 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 }
 #endif
 
+void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
+{
+    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
+    regs->entry_vector = regs->fred_ss.vector;
+
+    fatal_trap(regs, false);
+}
+
+void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
+{
+    struct fred_info *fi = cpu_regs_fred_info(regs);
+    uint8_t type = regs->fred_ss.type;
+
+    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
+    regs->entry_vector = regs->fred_ss.vector;
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
+        switch ( regs->fred_ss.vector )
+        {
+        case X86_EXC_DF: return do_double_fault(regs);
+        case X86_EXC_MC: return do_machine_check(regs);
+        }
+        break;
+    }
+
+    /*
+     * With the asynchronous events handled, what remains are the synchronous
+     * ones.  If we interrupted an IRQs-on region, we should re-enable IRQs
+     * now; for #PF and #DB, %cr2 and PENDING_DBG are on the stack in edata.
+     */
+    if ( regs->eflags & X86_EFLAGS_IF )
+        local_irq_enable();
+
+    switch ( type )
+    {
+    case X86_ET_HW_EXC:
+    case X86_ET_PRIV_SW_EXC:
+    case X86_ET_SW_EXC:
+        switch ( regs->fred_ss.vector )
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
+    fatal_trap(regs, false);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/x86_64/Makefile b/xen/arch/x86/x86_64/Makefile
index f20763088740..c0a0b6603221 100644
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_PV32) += compat/
 
+obj-bin-y += entry-fred.o
 obj-bin-y += entry.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += pci.o
diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
new file mode 100644
index 000000000000..3c3320df22cb
--- /dev/null
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+        .file "x86_64/entry-fred.S"
+
+#include <asm/asm_defns.h>
+#include <asm/page.h>
+
+        .section .text.entry, "ax", @progbits
+
+        /* The Ring3 entry point is required to be 4k aligned. */
+
+FUNC(entry_FRED_R3, 4096)
+        PUSH_AND_CLEAR_GPRS
+
+        mov     %rsp, %rdi
+        call    entry_from_pv
+
+        POP_GPRS
+        eretu
+END(entry_FRED_R3)
+
+        /* The Ring0 entrypoint is at Ring3 + 0x100. */
+        .org entry_FRED_R3 + 0x100, 0xcc
+
+FUNC_LOCAL(entry_FRED_R0, 0)
+        PUSH_AND_CLEAR_GPRS
+
+        mov     %rsp, %rdi
+        call    entry_from_xen
+
+        POP_GPRS
+        erets
+END(entry_FRED_R0)
-- 
2.39.5



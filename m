Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5843BB85A6
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136904.1473426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of3-00081p-Nd; Fri, 03 Oct 2025 22:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136904.1473426; Fri, 03 Oct 2025 22:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of2-0007u7-S8; Fri, 03 Oct 2025 22:54:00 +0000
Received: by outflank-mailman (input) for mailman id 1136904;
 Fri, 03 Oct 2025 22:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oez-0004mK-Pk
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d71c6f6f-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:53:55 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so1843220f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:55 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:54 -0700 (PDT)
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
X-Inumbo-ID: d71c6f6f-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532035; x=1760136835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1bN21O9E9iaUXFirFx56v5gHa9tBSUu8dMdcIlZelw=;
        b=svLuul7Zyw7GDhNe0hczkZWm5sadyJAE7EHwq5fIOqVmNRxcaz6K/V5qixsLl9csgz
         tDA3tOet6OSI4uilhdK8zx7UrHweeAeUEmysLiTffNYrlZZu4wsBa7KMgsdikHbvGSqi
         fRTG7drwSS75DEodDU1ZLYCiMbLbzxXdRGsHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532035; x=1760136835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1bN21O9E9iaUXFirFx56v5gHa9tBSUu8dMdcIlZelw=;
        b=wnxR0UP537ZF9C1uT/u7Vlikt3Y2b2ogjGST7G7vuQ2hSXK5iBY0n19tP8GTptQYAx
         SNRAudQ1Cm8TM6Sd60mBN8PZNqvYb+H/WHu/RNCFbsSwbVpi4VxtjR7RUgMKkkn1Mi5R
         avgbvbx3B7TSzqVGA1x7kFOfqlujvsEtJifXN381o1W0s9ubK1PQZ3PpJiQLwozg/flm
         83BBdBx/ckaRjst2xFdjd5rSYA76/2oHIiHPjT47ucIbnf8hOfDqUK9bGwrpD+WzAfOp
         lZez6qXh8kEiRkvBJbf0Zo8Y5dqIbqdGnRNfhTbNwu1P0+IfGJ4QvdIUWMmxvnuTYYyY
         bGQw==
X-Gm-Message-State: AOJu0YxwVhM14zr6Qhgk20x9v7gA2VOHOXj3QKbgL1qEXxhOFJHRYyV6
	mgXo3bHTG+wgcEKvimqZwurJ5bXWqQ3fSKCMI1shYJ23tW2bl0gRkX16NIUCXp5k1OkbvX2ZXJj
	ZOw4iPzkEpA==
X-Gm-Gg: ASbGncvIEP84ZD/QY0HO1B199SK8kWMeYLl4FUaXnv5ZXypiSbg26kKWwK3sMF2fbNh
	CeevSBOZY9bZdH68OSuXWdXM0EyBArlLeK5wT64JSiBDyonwTLjxWh010cCIjJmhBniv5R5Qc37
	nlZzMG/D4MPclKfGoSZzHm+GhUmi7lX53T4mXXjy24D1YHJyMjBghrsWijXNDVnDAMbeL0t86sy
	OhVjUoYEnX1M71nprH3bbEgaPbhsVmxYTdbSjZ3QkB6YBgcUguPWrP28dFu06pcHaVPolpl9kjo
	lWX92eVBnjmjjxOKux9BSFQy/pKnqZmRK2+ONf/0DrTMqQ7jUorI9YvA+KDRI36gb2NzM6C/F+C
	kdZ7gEshIRBMxDaDaWTrv3bTKy3/gABCGKVq6Ujc5RaLGjAwdQI/xnelh6580fnNROnh+HND/n9
	ySqt+tYFTBNFRI/a+YKR3j
X-Google-Smtp-Source: AGHT+IE6GpiPnDTB08HyF1hebJipc0fF1gsf1JZSsnRWscEJCy2txLu4bZbcKp/RbdYEJP1l2iFp+A==
X-Received: by 2002:a05:6000:1869:b0:3e7:458e:f69 with SMTP id ffacd0b85a97d-425671c381bmr3226464f8f.56.1759532034939;
        Fri, 03 Oct 2025 15:53:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 12/22] x86/traps: Introduce FRED entrypoints
Date: Fri,  3 Oct 2025 23:53:24 +0100
Message-Id: <20251003225334.2123667-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, there's one entrypoint from Ring 3, and one from Ring 0.

FRED gives us a good stack (even for SYSCALL/SYSENTER), and a unified event
frame on the stack, meaing that all software needs to do is spill the GPRs
with a line of PUSHes.  Introduce PUSH_AND_CLEAR_GPRS and POP_GPRS for this
purpose.

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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

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
 xen/arch/x86/include/asm/asm_defns.h |  65 ++++++++++++
 xen/arch/x86/traps.c                 | 152 +++++++++++++++++++++++++++
 xen/arch/x86/x86_64/Makefile         |   1 +
 xen/arch/x86/x86_64/entry-fred.S     |  33 ++++++
 4 files changed, 251 insertions(+)
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 72a0082d319d..a81a4043d0f1 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -315,6 +315,71 @@ static always_inline void stac(void)
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
+        notq  %rbp
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
+ *
+ * @rax: Alternative destination for the %rax value on the stack.
+ */
+.macro POP_GPRS rax=%rax
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
+        pop   \rax
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
index 2e3efe45edf4..0027f096a6c3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -89,6 +89,13 @@ const unsigned int nmi_cpu;
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
@@ -1023,6 +1030,32 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
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
@@ -1101,6 +1134,38 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
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
@@ -2199,6 +2264,93 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
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
+     * now; for #PF and #DB, %cr2 and %dr6 are on the stack in edata.
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



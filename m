Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F6B1EF86
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075066.1437635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTjw-00081c-EG; Fri, 08 Aug 2025 20:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075066.1437635; Fri, 08 Aug 2025 20:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTjw-0007yV-B1; Fri, 08 Aug 2025 20:31:00 +0000
Received: by outflank-mailman (input) for mailman id 1075066;
 Fri, 08 Aug 2025 20:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcp-0005tJ-Cb
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 903ed1c6-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:36 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso16336355e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:36 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:35 -0700 (PDT)
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
X-Inumbo-ID: 903ed1c6-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684616; x=1755289416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsFhpIo0YigHSrjbxG9J6eIfg+GeQRU9SY28qtRRbpw=;
        b=gbseeufeN3+19RuT5mg5UqzSK8el5b/jA6KIDXbRFu0/eayo/gR3og4TnyqvYPs/Ja
         EDa0XkPPmXcCxiYNFMkeRbTU+NBuAwFhWKxiTSNOtK+UgaCV3JsDeH9QSHX3wyFhbmZO
         Q0joQ+M2660J3SsG8lSPA9sRwaYAJGif/rI0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684616; x=1755289416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsFhpIo0YigHSrjbxG9J6eIfg+GeQRU9SY28qtRRbpw=;
        b=gy87NyOUhUl132Na+doXVpO2oolcFOuppWncazus608jE1Rl8M/jP1dHK58dUUG5t1
         /IhVGpAOAlIwOqj0AUM5VRPClWF8V5upp60Yu+mwsdhBhQuUEO54eSujbVcBknNQbF62
         2p1oW34+W+lNRidVGXKPaXrsqqkmHMhpJj2dA4g6GLQSxMrI+wOYKiaE+rLZlGguroNX
         8kNQ/r0WW4dOy2j9+geo16PtQSmquLm2VEAqEU406d6IPmhwjjFdJVFEDKO+Htq1Lz+s
         5Iy3Bjo8f2Ks9rP6H+Ho4LW+PG9qsTs/UDzQy2NkvVTYFEm5uZi5haUw5soGFJHvMLbw
         nyJA==
X-Gm-Message-State: AOJu0YyCC0SkfJ4WfVyZ2xK/mTKA6TOcZqaaKbGYfhY0RPp4QZ1sB0Wb
	k2vQBQyMsaGMqbNzgpfQ7K1RxOT+QPz9e9Jio3+H+9xetF9DkzDH0ptzy8JZ0Or1Lzn9KnNIqBB
	C1URhDF8=
X-Gm-Gg: ASbGncuRaOR1sRpS0XzKGG36SDf91JYXgx3Pcv6UlInpmuGIQ1SCaZi/wWuTNe5YIGk
	kXNSmn0Qjz+MW8Kz/4jdH+ZmO0w6PlJZ4tDC6KVreKTQNxQdS9DNiJCyXtb6ENFyfcr5XPjHiLd
	+WrsoPnP4cbRJl6Rq52Pl6+tGfns6JDTyyELixUf/zc9FfKqGxVxq7rSWY8iyeB7YANP1jRipNH
	KeHKr1kd64B0hlog1HnHMDNGyw2to126ZwVMCHRbNEsSSK2QODgBBIwS6jWroBRtI3vKGqyLQn0
	8hcpn/B+hzOARxEUmOApxJFc9jv6daAhsY17a0lef/EP2P6Q5s/PhAfZuvXuEnrfeE34Kli6Agf
	MieE/W56+fatgi1nhKjeyLNQnCoTIrtRbcdn8VaNkXinQdl7BAqB6sLJwRS233fySCqIr1ybBMJ
	G+
X-Google-Smtp-Source: AGHT+IE572nf5LZxzkOTMhXEn8wFDD0IPspugflCbO1IMUJ6sUJcgov1fEG344lninmoXczdA611pA==
X-Received: by 2002:a05:6000:26c9:b0:3b8:ff3a:86c2 with SMTP id ffacd0b85a97d-3b900b4da7cmr2978215f8f.37.1754684615819;
        Fri, 08 Aug 2025 13:23:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 21/22] x86/traps: Introduce FRED entrypoints
Date: Fri,  8 Aug 2025 21:23:13 +0100
Message-Id: <20250808202314.1045968-22-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
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
under FRED, so leave a BUG clearly in place.

Also introduce entry_from_{xen,pv}() to be the C level handlers.  By simply
copying regs->fred_ss.vector into regs->entry_vector, we can reuse all the
existing fault handlers.

Extend fatal_trap() to render the event type, including by name, when FRED is
active.  This is slightly complicated, because X86_ET_OTHER must not use
vector_name() or SYSCALL and SYSENTER get rendered as #BP and #DB.  Also,
{read,write}_gs_shadow() needs modifying to avoid the SWAPGS instruction,
which is disallowed in FRED mode.

This is sufficient to handle all interrupts and exceptions encountered during
development, including plenty of Double Faults.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

SIMICS hasn't been updated to the FRED v9, and still wants ENDBR instructions
at the entrypoints.
---
 xen/arch/x86/include/asm/asm_defns.h |  65 ++++++++++++
 xen/arch/x86/include/asm/msr.h       |   8 +-
 xen/arch/x86/traps.c                 | 153 ++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/Makefile         |   1 +
 xen/arch/x86/x86_64/entry-fred.S     |  35 ++++++
 5 files changed, 256 insertions(+), 6 deletions(-)
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
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index b6b85b04c3fd..01f510315ffe 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -202,9 +202,9 @@ static inline unsigned long read_gs_base(void)
 
 static inline unsigned long read_gs_shadow(void)
 {
-    unsigned long base;
+    unsigned long base, cr4 = read_cr4();
 
-    if ( read_cr4() & X86_CR4_FSGSBASE )
+    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
     {
         asm volatile ( "swapgs" );
         base = __rdgsbase();
@@ -234,7 +234,9 @@ static inline void write_gs_base(unsigned long base)
 
 static inline void write_gs_shadow(unsigned long base)
 {
-    if ( read_cr4() & X86_CR4_FSGSBASE )
+    unsigned long cr4 = read_cr4();
+
+    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
     {
         asm volatile ( "swapgs\n\t"
                        "wrgsbase %0\n\t"
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 270b93ed623e..e67a428e4362 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1013,6 +1013,32 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
         printk("Non-responding CPUs: {%*pbl}\n", CPUMASK_PR(&show_state_mask));
 }
 
+static const char *x86_et_name(unsigned int type)
+{
+    static const char *const names[] = {
+        [X86_ET_EXT_INTR]    = "EXT_INTR",
+        [X86_ET_NMI]         = "NMI",
+        [X86_ET_HW_EXC]      = "HW_EXC",
+        [X86_ET_SW_INT]      = "SW_INT",
+        [X86_ET_PRIV_SW_EXC] = "PRIV_SW_EXEC",
+        [X86_ET_SW_EXC]      = "SW_EXEC",
+        [X86_ET_OTHER]       = "OTHER",
+    };
+
+    return (type < ARRAY_SIZE(names) && names[type]) ? names[type] : "???";
+}
+
+static const char *x86_et_other_name(unsigned int vec)
+{
+    static const char *const names[] = {
+        [0] = "MTF",
+        [1] = "SYSCALL",
+        [2] = "SYSENTER",
+    };
+
+    return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
+}
+
 const char *vector_name(unsigned int vec)
 {
     static const char names[][4] = {
@@ -1091,9 +1117,42 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
         }
     }
 
-    panic("FATAL TRAP: vec %u, %s[%04x]%s\n",
-          trapnr, vector_name(trapnr), regs->error_code,
-          (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
+    if ( read_cr4() & X86_CR4_FRED )
+    {
+        bool render_ec = false;
+        const char *vec_name = NULL;
+
+        switch ( regs->fred_ss.type )
+        {
+        case X86_ET_HW_EXC:
+        case X86_ET_SW_INT:
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
+            panic("Fatal TRAP: type %u, %s, vec %u, %s[%04x]%s\n",
+                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
+                  regs->fred_ss.vector, vec_name ?: "",
+                  regs->error_code,
+                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
+        else
+            panic("Fatal TRAP: type %u, %s, vec %u, %s%s\n",
+                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
+                  regs->fred_ss.vector, vec_name ?: "",
+                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
+    }
+    else
+        panic("FATAL TRAP: vec %u, %s[%04x]%s\n",
+              trapnr, vector_name(trapnr), regs->error_code,
+              (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }
 
 void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs *regs)
@@ -2181,6 +2240,94 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
 }
 #endif
 
+void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
+{
+    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
+    regs->entry_vector = regs->fred_ss.vector;
+
+    switch ( regs->fred_ss.type )
+    {
+    case X86_ET_EXT_INTR:
+        do_IRQ(regs);
+        break;
+
+    case X86_ET_NMI:
+        do_nmi(regs);
+        break;
+
+    case X86_ET_HW_EXC:
+    case X86_ET_SW_INT:
+    case X86_ET_PRIV_SW_EXC:
+    case X86_ET_SW_EXC:
+        goto fatal;
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
+void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
+{
+    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
+    regs->entry_vector = regs->fred_ss.vector;
+
+    switch ( regs->fred_ss.type )
+    {
+    case X86_ET_EXT_INTR:
+        do_IRQ(regs);
+        break;
+
+    case X86_ET_NMI:
+        do_nmi(regs);
+        break;
+
+    case X86_ET_HW_EXC:
+    case X86_ET_SW_INT:
+    case X86_ET_PRIV_SW_EXC:
+    case X86_ET_SW_EXC:
+        switch ( regs->fred_ss.vector )
+        {
+        case X86_EXC_PF:  do_page_fault(regs); break;
+        case X86_EXC_GP:  do_general_protection(regs); break;
+        case X86_EXC_UD:  do_invalid_op(regs); break;
+        case X86_EXC_NM:  do_device_not_available(regs); break;
+        case X86_EXC_BP:  do_int3(regs); break;
+        case X86_EXC_DB:  do_debug(regs); break;
+        case X86_EXC_DF:  do_double_fault(regs); break;
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
+        case X86_EXC_CP:  do_entry_CP(regs); break;
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
index f20763088740..5ec933539adb 100644
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_PV32) += compat/
 
 obj-bin-y += entry.o
+obj-bin-y += entry-fred.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += pci.o
 obj-y += acpi_mmcfg.o
diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
new file mode 100644
index 000000000000..88d262b91f92
--- /dev/null
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -0,0 +1,35 @@
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
+        BUG     /* TODO - return to guest path */
+
+        POP_GPRS
+        eretu
+END(entry_FRED_R3)
+
+        /* The Ring0 entrypoint is at Ring3 + 256. */
+        .org entry_FRED_R3 + 256, 0xcc
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



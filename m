Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95662A4F211
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 01:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901605.1309600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFw-0001zu-QJ; Wed, 05 Mar 2025 00:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901605.1309600; Wed, 05 Mar 2025 00:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFw-0001xU-JU; Wed, 05 Mar 2025 00:05:00 +0000
Received: by outflank-mailman (input) for mailman id 901605;
 Wed, 05 Mar 2025 00:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpcFv-0000xS-0q
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 00:04:59 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7912729a-f955-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 01:04:57 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43bcf9612f4so6506445e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 16:04:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435300esm476005e9.29.2025.03.04.16.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 16:04:55 -0800 (PST)
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
X-Inumbo-ID: 7912729a-f955-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741133096; x=1741737896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dM4r6wNUx/Klr24NaqonEE1UAEJ3OJfXBPkJkMHiYvc=;
        b=gWZIiAHTuK3f2uRRL8FhOOQ2s7hb4i64yquXT0TgVh+ixGFKf/gJC1hRA1Ltdmaf0Y
         AJ0lg4YF5iavZrZlnrfVVXQxOwB0zeclk1YdGywf1daRnGw36YvHcioP4cVEM52m3W1y
         aFWrdXOqgd71bIP0WKmEHoHP4f6dLB0/mCjco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133096; x=1741737896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM4r6wNUx/Klr24NaqonEE1UAEJ3OJfXBPkJkMHiYvc=;
        b=Jv9jelucaKyKq+dKfUDd/9A40KX4sZfILmLA0SHApz0Z450pObiIE+i0lAodVKm27y
         N2VqlueVtc6hiBHZXmw4DkUiOzoMUlvStYbIu6Y6eWJjJNXX+KBX4gyaxswiyrjXn0vj
         ZK2vcO0GYXlkEml5vHHdMcwQFKB9ru6cbwnYzFwtQK75rJgVUNCXPYcFgcpXS0AVOiSp
         bf9SK/0NgY6wq4R8RRaPocIXq5VOJwiGiY7wW2CyKScdR5TyJeQmJFTrOo7MNdq7Wz1z
         6hHeK+u/67JT6j3NPBfMg2zw+rWh3SvsMJg/Z09iVlO/RVgMCI1hC6/duHt22E2FdxOc
         imVA==
X-Gm-Message-State: AOJu0YyHssqgqlEwq4Xovxa4/628Z6ZKoB1xH84nodmvEao8AyvIirSl
	2bzke4g3GLPMi5Y+etne9B7F8PZuEpUznhA61rGJd9h1pMSKce2zS6uYFHctJCMk6PAlaPLdrhz
	/
X-Gm-Gg: ASbGncvppnK+WwcZZNZHo6zaRjVoEf0t+MJ4EycgTaQlCsIM8bUxz7LiH/1HMs/R97E
	1cWAPU2YSzOL4FzjGq5Sv56ej0tB449jeFdeL+ozDqcJlem7zaJj9MDMQPOSpX4aVbYMfYZu2nz
	NA/JCF5MWeX2jBrTnHzT6yniQPLV5FWAY2VWsI/teYEMhBT+WQjoxx8GqpxjOndi5v7wRU4X3Rb
	ExiLyOxCIkXKJ3I/MzQy32U6vbOEF9sq1cHr3yqu2J+FBbw1xDme1MbHEPMQs+yNDleaXpXeyN7
	o2vIq5gyh9Ns1HWd3EqPkF+Ev2GgAeowbtbXZJKxUj7zRGVfbon2aLCtsFavJ4SX1JTwuZmZilx
	5zxThnUkNZ++C+Pol2RFOhgdn
X-Google-Smtp-Source: AGHT+IFjFo4O0t42lwijHbZ+hfTi0MwgYOUX5AK7+LHUgul7hN80H53Rb6wzJyleFmF6smxBCOZUJQ==
X-Received: by 2002:a05:600c:1c85:b0:439:94ef:3780 with SMTP id 5b1f17b1804b1-43bd2aec27emr5466205e9.30.1741133096210;
        Tue, 04 Mar 2025 16:04:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/5] x86/IDT: Don't rewrite bsp_idt[] at boot time
Date: Wed,  5 Mar 2025 00:02:46 +0000
Message-Id: <20250305000247.2772029-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that bsp_idt[] is constructed at build time, we do not need to manually
initialise it in init_idt_traps() and trap_init().

When swapping the early pagefault handler for the normal one, switch to using
_update_gate_addr_lower() as we do on the kexec path for NMI and #MC.

This in turn allows us to drop set_{intr,swint}_gate() and the underlying
infrastructure.  It also lets us drop autogen_entrypoints[] and that
underlying infrastructure.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Adjust the commit message to not give the impression that there's only a
   single edit on boot.

Bloat-o-meter reports:

  add/remove: 0/3 grow/shrink: 1/2 up/down: 9/-6482 (-6473)
  Function                                     old     new   delta
  trap_init                                    425     434      +9
  __set_intr_gate                               84       -     -84
  pv_trap_init                                 163      17    -146
  init_idt_traps                               469     105    -364
  autogen_entrypoints                         2048       -   -2048
  autogen_stubs                               3840       -   -3840

The 3840 for autogen_stubs isn't really a saving here; it was introduced under
different names in the prior patch.  We do safe 2k on autogen_entrypoints by
having the linker complete the work at build time.
---
 xen/arch/x86/include/asm/idt.h | 16 -------
 xen/arch/x86/pv/traps.c        | 13 ------
 xen/arch/x86/traps.c           | 76 +---------------------------------
 xen/arch/x86/x86_64/entry.S    | 60 ---------------------------
 4 files changed, 1 insertion(+), 164 deletions(-)

diff --git a/xen/arch/x86/include/asm/idt.h b/xen/arch/x86/include/asm/idt.h
index d795798d3eca..f613d5693e0e 100644
--- a/xen/arch/x86/include/asm/idt.h
+++ b/xen/arch/x86/include/asm/idt.h
@@ -60,22 +60,6 @@ static inline void disable_each_ist(idt_entry_t *idt)
     set_ist(&idt[X86_EXC_DB],  IST_NONE);
 }
 
-#define _set_gate(gate_addr,type,dpl,addr)               \
-do {                                                     \
-    (gate_addr)->a = 0;                                  \
-    smp_wmb(); /* disable gate /then/ rewrite */         \
-    (gate_addr)->b =                                     \
-        ((unsigned long)(addr) >> 32);                   \
-    smp_wmb(); /* rewrite /then/ enable gate */          \
-    (gate_addr)->a =                                     \
-        (((unsigned long)(addr) & 0xFFFF0000UL) << 32) | \
-        ((unsigned long)(dpl) << 45) |                   \
-        ((unsigned long)(type) << 40) |                  \
-        ((unsigned long)(addr) & 0xFFFFUL) |             \
-        ((unsigned long)__HYPERVISOR_CS << 16) |         \
-        (1UL << 47);                                     \
-} while (0)
-
 /*
  * Write the lower 64 bits of an IDT Entry. This relies on the upper 32
  * bits of the address not changing, which is a safe assumption as all
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 4aeb6cab5238..932800555bca 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -141,21 +141,8 @@ static void cf_check nmi_softirq(void)
     *v_ptr = NULL;
 }
 
-void nocall entry_int80(void);
-void nocall entry_int82(void);
-
 void __init pv_trap_init(void)
 {
-#ifdef CONFIG_PV32
-    /* The 32-on-64 hypercall vector is only accessible from ring 1. */
-    _set_gate(bsp_idt + HYPERCALL_VECTOR,
-              SYS_DESC_irq_gate, 1, entry_int82);
-#endif
-
-    /* Fast trap for int80 (faster than taking the #GP-fixup path). */
-    _set_gate(bsp_idt + LEGACY_SYSCALL_VECTOR, SYS_DESC_irq_gate, 3,
-              &entry_int80);
-
     open_softirq(NMI_SOFTIRQ, nmi_softirq);
 }
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d52840848d30..7698fa580ef7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1864,22 +1864,6 @@ void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
     panic("CONTROL-FLOW PROTECTION FAULT: #CP[%04x] %s\n", ec, err);
 }
 
-static void __init noinline __set_intr_gate(unsigned int n,
-                                            uint32_t dpl, void *addr)
-{
-    _set_gate(&bsp_idt[n], SYS_DESC_irq_gate, dpl, addr);
-}
-
-static void __init set_swint_gate(unsigned int n, void *addr)
-{
-    __set_intr_gate(n, 3, addr);
-}
-
-static void __init set_intr_gate(unsigned int n, void *addr)
-{
-    __set_intr_gate(n, 0, addr);
-}
-
 void percpu_traps_init(void)
 {
     subarch_percpu_traps_init();
@@ -1888,50 +1872,10 @@ void percpu_traps_init(void)
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
 }
 
-/* Exception entries */
-void nocall entry_DE(void);
-void nocall entry_DB(void);
-void nocall entry_NMI(void);
-void nocall entry_BP(void);
-void nocall entry_OF(void);
-void nocall entry_BR(void);
-void nocall entry_UD(void);
-void nocall entry_NM(void);
-void nocall entry_DF(void);
-void nocall entry_TS(void);
-void nocall entry_NP(void);
-void nocall entry_SS(void);
-void nocall entry_GP(void);
-void nocall early_page_fault(void);
 void nocall entry_PF(void);
-void nocall entry_MF(void);
-void nocall entry_AC(void);
-void nocall entry_MC(void);
-void nocall entry_XM(void);
-void nocall entry_CP(void);
 
 void __init init_idt_traps(void)
 {
-    set_intr_gate (X86_EXC_DE,  entry_DE);
-    set_intr_gate (X86_EXC_DB,  entry_DB);
-    set_intr_gate (X86_EXC_NMI, entry_NMI);
-    set_swint_gate(X86_EXC_BP,  entry_BP);
-    set_swint_gate(X86_EXC_OF,  entry_OF);
-    set_intr_gate (X86_EXC_BR,  entry_BR);
-    set_intr_gate (X86_EXC_UD,  entry_UD);
-    set_intr_gate (X86_EXC_NM,  entry_NM);
-    set_intr_gate (X86_EXC_DF,  entry_DF);
-    set_intr_gate (X86_EXC_TS,  entry_TS);
-    set_intr_gate (X86_EXC_NP,  entry_NP);
-    set_intr_gate (X86_EXC_SS,  entry_SS);
-    set_intr_gate (X86_EXC_GP,  entry_GP);
-    set_intr_gate (X86_EXC_PF,  early_page_fault);
-    set_intr_gate (X86_EXC_MF,  entry_MF);
-    set_intr_gate (X86_EXC_AC,  entry_AC);
-    set_intr_gate (X86_EXC_MC,  entry_MC);
-    set_intr_gate (X86_EXC_XM,  entry_XM);
-    set_intr_gate (X86_EXC_CP,  entry_CP);
-
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
     enable_each_ist(bsp_idt);
 
@@ -1979,31 +1923,13 @@ static void __init init_ler(void)
     setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
 }
 
-extern void (*const autogen_entrypoints[X86_IDT_VECTORS])(void);
 void __init trap_init(void)
 {
-    unsigned int vector;
-
     /* Replace early pagefault with real pagefault handler. */
-    set_intr_gate(X86_EXC_PF, entry_PF);
+    _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
 
     pv_trap_init();
 
-    for ( vector = 0; vector < X86_IDT_VECTORS; ++vector )
-    {
-        if ( autogen_entrypoints[vector] )
-        {
-            /* Found autogen entry: check we won't clobber an existing trap. */
-            ASSERT(bsp_idt[vector].b == 0);
-            set_intr_gate(vector, autogen_entrypoints[vector]);
-        }
-        else
-        {
-            /* No entry point: confirm we have an existing trap in place. */
-            ASSERT(bsp_idt[vector].b != 0);
-        }
-    }
-
     init_ler();
 
     /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 84d0c29530bf..d81a626d1667 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1304,63 +1304,3 @@ END(bsp_idt)
             .error "Bad bsp_idt size, should be PAGE_SIZE"
         .endif
         .popsection
-
-/* Table of automatically generated entry points.  One per vector. */
-        .pushsection .init.rodata, "a", @progbits
-DATA(autogen_entrypoints, 8)
-        /* pop into the .init.rodata section and record an entry point. */
-        .macro entrypoint ent
-        .pushsection .init.rodata, "a", @progbits
-        .quad \ent
-        .popsection
-        .endm
-
-        .popsection
-FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
-
-        vec = 0
-        .rept X86_IDT_VECTORS
-
-        /* Common interrupts, heading towards do_IRQ(). */
-#if defined(CONFIG_PV32)
-        .if vec >= FIRST_IRQ_VECTOR && vec != HYPERCALL_VECTOR && vec != LEGACY_SYSCALL_VECTOR
-#elif defined(CONFIG_PV)
-        .if vec >= FIRST_IRQ_VECTOR && vec != LEGACY_SYSCALL_VECTOR
-#else
-        .if vec >= FIRST_IRQ_VECTOR
-#endif
-
-        .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL
-1:
-        ENDBR64
-        pushq $0
-        movb  $vec, EFRAME_entry_vector(%rsp)
-        jmp   common_interrupt
-
-        entrypoint 1b
-
-        /* Reserved exceptions, heading towards do_unhandled_trap(). */
-        .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
-                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < X86_EXC_NUM)
-
-1:
-        ENDBR64
-        test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
-        jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
-        pushq $0             /* error code, and insert an empty one if not.              */
-2:      movb  $vec, EFRAME_entry_vector(%rsp)
-        jmp   handle_exception
-
-        entrypoint 1b
-
-        /* Hand crafted entry points above. */
-        .else
-        entrypoint 0
-        .endif
-
-        vec = vec + 1
-        .endr
-END(autogen_stubs)
-
-        .section .init.rodata, "a", @progbits
-END(autogen_entrypoints)
-- 
2.39.5



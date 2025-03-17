Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55205A65DCB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918004.1322775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0m-0005se-9I; Mon, 17 Mar 2025 19:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918004.1322775; Mon, 17 Mar 2025 19:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0m-0005l0-4M; Mon, 17 Mar 2025 19:20:32 +0000
Received: by outflank-mailman (input) for mailman id 918004;
 Mon, 17 Mar 2025 19:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuG0k-0005ZB-JE
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:20:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e36cedf1-0364-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 20:20:29 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso26882595e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:20:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm113505845e9.20.2025.03.17.12.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:20:28 -0700 (PDT)
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
X-Inumbo-ID: e36cedf1-0364-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742239229; x=1742844029; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr8DI3nBv401BCL/XAx6lN4oA/5pcywS2sI15DoEEvo=;
        b=sdO54gCBM6krVT/cbawWHix6XS9Js0hRXOGmqc9QOd17VaGPTGLe5fb5heOoRkTxYN
         WpVloRBRtvobkI4MS0Xi3VjIZ2NXDXGj9Qqc913lg62FHL/+qQFvkGGoVwVeqFlnQsdx
         YYGQeyos3yEsZNoIqHPY2zSKeYoGcSoKP8fMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742239229; x=1742844029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr8DI3nBv401BCL/XAx6lN4oA/5pcywS2sI15DoEEvo=;
        b=SzDEcY6MSBC3MXIH5hJaegH+JPRqR0CGXbwaCHak9MJfZvTcamkufV/9blVrM3OMyY
         zEQWGnbquPZPR4/XsJIw+rMJCKGSm/EQjzhbELf3jDfxXzfGnJRRe2eQAgHZDNeZBYBc
         c9f1M9f5CWEo5U4UydzN6t3i8YnJJ2t3PYZ8KhECcC88vihn+UC0ULrWw/ZR12lJFXUa
         tIwyVUah/RUOvpbiMgUks/l2N0WSwksebSvp18XQVPF7BM6oveb5XIW2DNsM1o3zJvLL
         2SJaXwKxGtJhHs2Fwnkk/5uG17srXsVDXqfuYF5Wzkkyz4kmguAsVK651Brys9R8zIZv
         xTaA==
X-Gm-Message-State: AOJu0YyFGroSt+XtNj81JMMHsnXmD4I0dE/+GTDxcQ1WG3Ew3+OBzFZQ
	YkS7UKlTmCxwcBl7GfTA8voGCVs0NumVyodNju5SPGw5+fbD1HSpXmER2xq5PuWod/7Nr/jXz9I
	y
X-Gm-Gg: ASbGncv2SLBx9c5ZZztVYJj4QltKGX7+oxtUCPjp0lGUtRXxs+b2aQ65gapTfAJYJGk
	JhZdsBv+mU3n8P484/2Mx63g2hXY7oB8bt4/cE90Sef7hp9n0XupcAOGU7SitKev+L4Jozwi5+/
	x9/81ArgKnE9FgdoPt3OmO+L9biqEK+G5DsV56meaaudp6GGxNYWYVxLzGFGnHNN/h/AivK52Nw
	V+3UiU6FVYZzy2w9oc6xuUboTaKDQioNeZ/qVgkVabEtSCWx+n4k9MGMegTID9ESPWY9j7OYmLw
	SWO/m/rtuXHEY2RqP2Mn2G4M9Vx8Tiv803cHQdtBohG22zpeF5OEmCLfwFyHdyDBi7SDVpJZg9I
	7dmi6B/qRfnaaVQ0j3iotRtV+
X-Google-Smtp-Source: AGHT+IFrmZrN+A0yETYgzcrUEIuIBFCET8LfBxmDWDE3Gwl7zIbPOM5HVlusn95h1j3ItZ2R4zkfSw==
X-Received: by 2002:a05:600c:4e47:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43d285684famr82499145e9.13.1742239228873;
        Mon, 17 Mar 2025 12:20:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/traps: Move trap_init() into traps-setup.c
Date: Mon, 17 Mar 2025 19:20:22 +0000
Message-Id: <20250317192023.568432-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317192023.568432-1-andrew.cooper3@citrix.com>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and rename to traps_init() for consistency.  Move the declaration from
asm/system.h into asm/traps.h.

This also involves moving init_ler() and variables.  Move the declaration of
ler_msr from asm/msr.h to asm/traps.h.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msr.h    |  2 -
 xen/arch/x86/include/asm/system.h |  1 -
 xen/arch/x86/include/asm/traps.h  |  3 ++
 xen/arch/x86/setup.c              |  2 +-
 xen/arch/x86/traps-setup.c        | 66 +++++++++++++++++++++++++++++++
 xen/arch/x86/traps.c              | 61 ----------------------------
 6 files changed, 70 insertions(+), 65 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 7b00a4db5d48..549d40b404cb 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -279,8 +279,6 @@ static inline void write_efer(uint64_t val)
     wrmsrl(MSR_EFER, val);
 }
 
-extern unsigned int ler_msr;
-
 DECLARE_PER_CPU(uint32_t, tsc_aux);
 
 /* Lazy update of MSR_TSC_AUX */
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 73364056c702..1bf6bd026852 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -263,7 +263,6 @@ static inline int local_irq_is_enabled(void)
 #define BROKEN_ACPI_Sx          0x0001
 #define BROKEN_INIT_AFTER_S1    0x0002
 
-void trap_init(void);
 void init_idt_traps(void);
 void load_system_tables(void);
 void subarch_percpu_traps_init(void);
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 825f7441c86e..3d30aa6738d4 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -7,8 +7,11 @@
 #ifndef ASM_TRAP_H
 #define ASM_TRAP_H
 
+void traps_init(void);
 void percpu_traps_init(void);
 
+extern unsigned int ler_msr;
+
 const char *vector_name(unsigned int vec);
 
 #endif /* ASM_TRAP_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b092106ccca5..5e2411a008f5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2023,7 +2023,7 @@ void asmlinkage __init noreturn __start_xen(void)
                                            &this_cpu(stubs).mfn);
     BUG_ON(!this_cpu(stubs.addr));
 
-    trap_init();
+    traps_init(); /* Needs stubs allocated. */
 
     cpu_init();
 
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index fa78a35a7ebf..1a7b42c14bf2 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -2,6 +2,9 @@
 /*
  * Configuration of event handling for all CPUs.
  */
+#include <xen/init.h>
+#include <xen/param.h>
+
 #include <asm/idt.h>
 #include <asm/msr.h>
 #include <asm/system.h>
@@ -9,6 +12,69 @@
 
 DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
 
+/* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
+unsigned int __ro_after_init ler_msr;
+static bool __initdata opt_ler;
+boolean_param("ler", opt_ler);
+
+void nocall entry_PF(void);
+
+static void __init init_ler(void)
+{
+    unsigned int msr = 0;
+
+    if ( !opt_ler )
+        return;
+
+    /*
+     * Intel Pentium 4 is the only known CPU to not use the architectural MSR
+     * indicies.
+     */
+    switch ( boot_cpu_data.x86_vendor )
+    {
+    case X86_VENDOR_INTEL:
+        if ( boot_cpu_data.x86 == 0xf )
+        {
+            msr = MSR_P4_LER_FROM_LIP;
+            break;
+        }
+        fallthrough;
+    case X86_VENDOR_AMD:
+    case X86_VENDOR_HYGON:
+        msr = MSR_IA32_LASTINTFROMIP;
+        break;
+    }
+
+    if ( msr == 0 )
+    {
+        printk(XENLOG_WARNING "LER disabled: failed to identify MSRs\n");
+        return;
+    }
+
+    ler_msr = msr;
+    setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
+}
+
+/*
+ * Configure complete exception, interrupt and syscall handling.
+ */
+void __init traps_init(void)
+{
+    /* Replace early pagefault with real pagefault handler. */
+    _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
+
+    init_ler();
+
+    /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
+    this_cpu(gdt_l1e) =
+        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
+    if ( IS_ENABLED(CONFIG_PV32) )
+        this_cpu(compat_gdt_l1e) =
+            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
+
+    percpu_traps_init();
+}
+
 /*
  * Set up per-CPU linkage registers for exception, interrupt and syscall
  * handling.
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 29d7e4123f90..79d92f21acf5 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -107,12 +107,6 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_page, tss_page);
 static int debug_stack_lines = 20;
 integer_param("debug_stack_lines", debug_stack_lines);
 
-static bool __initdata opt_ler;
-boolean_param("ler", opt_ler);
-
-/* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
-unsigned int __ro_after_init ler_msr;
-
 const unsigned int nmi_cpu;
 
 #define stack_words_per_line 4
@@ -1864,8 +1858,6 @@ void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
     panic("CONTROL-FLOW PROTECTION FAULT: #CP[%04x] %s\n", ec, err);
 }
 
-void nocall entry_PF(void);
-
 void __init init_idt_traps(void)
 {
     /* Specify dedicated interrupt stacks for NMI, #DF, and #MC. */
@@ -1879,59 +1871,6 @@ void __init init_idt_traps(void)
         this_cpu(compat_gdt) = boot_compat_gdt;
 }
 
-static void __init init_ler(void)
-{
-    unsigned int msr = 0;
-
-    if ( !opt_ler )
-        return;
-
-    /*
-     * Intel Pentium 4 is the only known CPU to not use the architectural MSR
-     * indicies.
-     */
-    switch ( boot_cpu_data.x86_vendor )
-    {
-    case X86_VENDOR_INTEL:
-        if ( boot_cpu_data.x86 == 0xf )
-        {
-            msr = MSR_P4_LER_FROM_LIP;
-            break;
-        }
-        fallthrough;
-    case X86_VENDOR_AMD:
-    case X86_VENDOR_HYGON:
-        msr = MSR_IA32_LASTINTFROMIP;
-        break;
-    }
-
-    if ( msr == 0 )
-    {
-        printk(XENLOG_WARNING "LER disabled: failed to identify MSRs\n");
-        return;
-    }
-
-    ler_msr = msr;
-    setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
-}
-
-void __init trap_init(void)
-{
-    /* Replace early pagefault with real pagefault handler. */
-    _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
-
-    init_ler();
-
-    /* Cache {,compat_}gdt_l1e now that physically relocation is done. */
-    this_cpu(gdt_l1e) =
-        l1e_from_pfn(virt_to_mfn(boot_gdt), __PAGE_HYPERVISOR_RW);
-    if ( IS_ENABLED(CONFIG_PV32) )
-        this_cpu(compat_gdt_l1e) =
-            l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
-
-    percpu_traps_init();
-}
-
 void asm_domain_crash_synchronous(unsigned long addr)
 {
     /*
-- 
2.39.5



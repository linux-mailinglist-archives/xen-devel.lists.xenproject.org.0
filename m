Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1266B1EF71
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075027.1437538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTch-0007gV-Bt; Fri, 08 Aug 2025 20:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075027.1437538; Fri, 08 Aug 2025 20:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcg-0007a4-Pt; Fri, 08 Aug 2025 20:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1075027;
 Fri, 08 Aug 2025 20:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTce-0005tW-L5
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:28 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b1d62d2-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:28 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-454f428038eso22148205e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:28 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:27 -0700 (PDT)
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
X-Inumbo-ID: 8b1d62d2-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684607; x=1755289407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycWquJLCuLcfKthxLYACscQrBOx1g62XAtvbDRfueiI=;
        b=FKijCjbRt280AOa/FvYi3b762G+b1MIqw4vG+5HVNoTvUM+zAz1/N0np5RIIPVddCV
         WaFp860TTrk+lhcs9cw9bfyi5GL255BddELv6qZj0dzXHzgFMb1bktMMDioafslTF1Yu
         T+Ax+T0vba/NYDWoES7X7R99LbB+n/94Z7eWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684607; x=1755289407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycWquJLCuLcfKthxLYACscQrBOx1g62XAtvbDRfueiI=;
        b=XsbXEd0HXhvLkqz81CLohObsTMyc0Rl7VGif7CklZQFYqUkD7niSbqGd6xQActxrrr
         08W34fVFr70TlbYLM078bXvJB0vQ+A85YqmxmFwEAZIif4YYsXnhy1VV8zLzIdbm4pkc
         EEn6idTSy6DFfG9b+YwRFWp3EoEBC5ludy8xslDAhtgdZZmGdc+TOztwdHzSU8oxUVmH
         7ArOi4GLAH0MjrckUvEZlOorml9gRGI1ZqTXXzL8EVqA54SqdIdOO9ANQYWlCxPtrLaO
         KNIhFivwiOmYu31aBNG5U85o97HUT7MwZO4RzorFOiuxspxERxPZjbWf8Q2ODKTKGkZw
         zRTg==
X-Gm-Message-State: AOJu0Yy6mlxSY1Dzu7D6WhYfs1B7J7myFksVGW7XkP+iIu3M9OlsS0Zo
	woHlt6xXqZbFqZfiCv7jMp55hdBEXFQM4H6shmsLKIN+imk+Opms/ac0z0IxlkAhcAiLzaAkZNU
	G+kn8ajs=
X-Gm-Gg: ASbGncuDu0SrQkx44kdL52pErPdlaFsR8j4UvX4LmLtERCXbGaoP5pdYrcMLjQjj+D1
	4o/OZcsaQK5DPlXhrXkenPYSBTjhbLOO/UVMoPxMUlf4vxD6rrVY5UQ7USjVsFbn2kn2Usi6hII
	Kh5Maqsl5uPY0NVZe2boTQmk3oNj5cuFQ/2tVKyFWHS6WiWhhbkN2rrASLa6d5dAqMoG/6j+voE
	i8K3na4XOOHAJK92FDfQAMAYbdvk4cyCODYXxEXGE1JgJquuvzX1j5wTUl9dc66JkKP0CqIGzv1
	cCi9JXCr78IArXO0hGKBChQ5wFQBGad/irGyjWwy6voiro1s7AGRz4uXkX+T001hx7ZJC+VDQrZ
	lT6YCcVpb3XjNjDqhN6GH5dfpYKTLGKWrRiYbC2J5s3YX9PnKCbVem8rOZMHQ0t+syfEwzyobxF
	/E
X-Google-Smtp-Source: AGHT+IHC1e3aIoYtIc1z104Icp0iXqK9OPOFRvHJgtTMLHe0A8+iMJldljWaYTsqa9SCuWx0CufkMg==
X-Received: by 2002:a05:600c:3b8d:b0:458:a992:6f1e with SMTP id 5b1f17b1804b1-459fc09db82mr3514055e9.5.1754684607458;
        Fri, 08 Aug 2025 13:23:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/22] x86/traps: Move subarch_percpu_traps_init() into traps-setup.c
Date: Fri,  8 Aug 2025 21:23:02 +0100
Message-Id: <20250808202314.1045968-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... along with the supporting functions.  Switch to Xen coding style, and make
static as there are no external callers.

Rename to legacy_syscall_init() as a more accurate name.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/system.h |  2 -
 xen/arch/x86/traps-setup.c        | 97 ++++++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/traps.c       | 92 -----------------------------
 3 files changed, 95 insertions(+), 96 deletions(-)

diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 3cdc56e4ba6d..6c2800d8158d 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -256,6 +256,4 @@ static inline int local_irq_is_enabled(void)
 #define BROKEN_ACPI_Sx          0x0001
 #define BROKEN_INIT_AFTER_S1    0x0002
 
-void subarch_percpu_traps_init(void);
-
 #endif
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 13b8fcf0ba51..fbae7072c292 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -2,13 +2,15 @@
 /*
  * Configuration of event handling for all CPUs.
  */
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/param.h>
 
+#include <asm/endbr.h>
 #include <asm/idt.h>
 #include <asm/msr.h>
 #include <asm/shstk.h>
-#include <asm/system.h>
+#include <asm/stubs.h>
 #include <asm/traps.h>
 
 DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
@@ -19,6 +21,8 @@ static bool __initdata opt_ler;
 boolean_param("ler", opt_ler);
 
 void nocall entry_PF(void);
+void nocall lstar_enter(void);
+void nocall cstar_enter(void);
 
 /*
  * Sets up system tables and descriptors for IDT devliery.
@@ -138,6 +142,95 @@ static void load_system_tables(void)
     BUG_ON(stack_bottom & 15);
 }
 
+static unsigned int write_stub_trampoline(
+    unsigned char *stub, unsigned long stub_va,
+    unsigned long stack_bottom, unsigned long target_va)
+{
+    unsigned char *p = stub;
+
+    if ( cpu_has_xen_ibt )
+    {
+        place_endbr64(p);
+        p += 4;
+    }
+
+    /* Store guest %rax into %ss slot */
+    /* movabsq %rax, stack_bottom - 8 */
+    *p++ = 0x48;
+    *p++ = 0xa3;
+    *(uint64_t *)p = stack_bottom - 8;
+    p += 8;
+
+    /* Store guest %rsp in %rax */
+    /* movq %rsp, %rax */
+    *p++ = 0x48;
+    *p++ = 0x89;
+    *p++ = 0xe0;
+
+    /* Switch to Xen stack */
+    /* movabsq $stack_bottom - 8, %rsp */
+    *p++ = 0x48;
+    *p++ = 0xbc;
+    *(uint64_t *)p = stack_bottom - 8;
+    p += 8;
+
+    /* jmp target_va */
+    *p++ = 0xe9;
+    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
+    p += 4;
+
+    /* Round up to a multiple of 16 bytes. */
+    return ROUNDUP(p - stub, 16);
+}
+
+static void legacy_syscall_init(void)
+{
+    unsigned long stack_bottom = get_stack_bottom();
+    unsigned long stub_va = this_cpu(stubs.addr);
+    unsigned char *stub_page;
+    unsigned int offset;
+
+    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return;
+
+    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
+
+    /*
+     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
+     * context switch logic relies on the SYSCALL trampoline being at the
+     * start of the stubs.
+     */
+    wrmsrl(MSR_LSTAR, stub_va);
+    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
+                                   stub_va, stack_bottom,
+                                   (unsigned long)lstar_enter);
+    stub_va += offset;
+
+    if ( cpu_has_sep )
+    {
+        /* SYSENTER entry. */
+        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
+        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
+        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
+    }
+
+    /* Trampoline for SYSCALL entry from compatibility mode. */
+    wrmsrl(MSR_CSTAR, stub_va);
+    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
+                                    stub_va, stack_bottom,
+                                    (unsigned long)cstar_enter);
+
+    /* Don't consume more than half of the stub space here. */
+    ASSERT(offset <= STUB_BUF_SIZE / 2);
+
+    unmap_domain_page(stub_page);
+
+    /* Common SYSCALL parameters. */
+    wrmsrl(MSR_STAR, XEN_MSR_STAR);
+    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
+}
+
 static void __init init_ler(void)
 {
     unsigned int msr = 0;
@@ -241,7 +334,7 @@ void bsp_traps_reinit(void)
  */
 void percpu_traps_init(void)
 {
-    subarch_percpu_traps_init();
+    legacy_syscall_init();
 
     if ( cpu_has_xen_lbr )
         wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 34adf55e48df..81e64466e47e 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -311,98 +311,6 @@ void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
     panic("DOUBLE FAULT -- system shutdown\n");
 }
 
-static unsigned int write_stub_trampoline(
-    unsigned char *stub, unsigned long stub_va,
-    unsigned long stack_bottom, unsigned long target_va)
-{
-    unsigned char *p = stub;
-
-    if ( cpu_has_xen_ibt )
-    {
-        place_endbr64(p);
-        p += 4;
-    }
-
-    /* Store guest %rax into %ss slot */
-    /* movabsq %rax, stack_bottom - 8 */
-    *p++ = 0x48;
-    *p++ = 0xa3;
-    *(uint64_t *)p = stack_bottom - 8;
-    p += 8;
-
-    /* Store guest %rsp in %rax */
-    /* movq %rsp, %rax */
-    *p++ = 0x48;
-    *p++ = 0x89;
-    *p++ = 0xe0;
-
-    /* Switch to Xen stack */
-    /* movabsq $stack_bottom - 8, %rsp */
-    *p++ = 0x48;
-    *p++ = 0xbc;
-    *(uint64_t *)p = stack_bottom - 8;
-    p += 8;
-
-    /* jmp target_va */
-    *p++ = 0xe9;
-    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
-    p += 4;
-
-    /* Round up to a multiple of 16 bytes. */
-    return ROUNDUP(p - stub, 16);
-}
-
-void nocall lstar_enter(void);
-void nocall cstar_enter(void);
-
-void subarch_percpu_traps_init(void)
-{
-    unsigned long stack_bottom = get_stack_bottom();
-    unsigned long stub_va = this_cpu(stubs.addr);
-    unsigned char *stub_page;
-    unsigned int offset;
-
-    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
-    if ( !IS_ENABLED(CONFIG_PV) )
-        return;
-
-    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
-
-    /*
-     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
-     * context switch logic relies on the SYSCALL trampoline being at the
-     * start of the stubs.
-     */
-    wrmsrl(MSR_LSTAR, stub_va);
-    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
-                                   stub_va, stack_bottom,
-                                   (unsigned long)lstar_enter);
-    stub_va += offset;
-
-    if ( cpu_has_sep )
-    {
-        /* SYSENTER entry. */
-        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
-        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
-        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
-    }
-
-    /* Trampoline for SYSCALL entry from compatibility mode. */
-    wrmsrl(MSR_CSTAR, stub_va);
-    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
-                                    stub_va, stack_bottom,
-                                    (unsigned long)cstar_enter);
-
-    /* Don't consume more than half of the stub space here. */
-    ASSERT(offset <= STUB_BUF_SIZE / 2);
-
-    unmap_domain_page(stub_page);
-
-    /* Common SYSCALL parameters. */
-    wrmsrl(MSR_STAR, XEN_MSR_STAR);
-    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
-}
-
 /*
  * Local variables:
  * mode: C
-- 
2.39.5



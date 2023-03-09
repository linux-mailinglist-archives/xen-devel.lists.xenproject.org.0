Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89F6B2586
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 14:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508267.782811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGOx-0002Rj-V1; Thu, 09 Mar 2023 13:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508267.782811; Thu, 09 Mar 2023 13:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGOx-0002O0-RC; Thu, 09 Mar 2023 13:33:47 +0000
Received: by outflank-mailman (input) for mailman id 508267;
 Thu, 09 Mar 2023 13:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZdn=7B=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1paGOv-00013B-L3
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 13:33:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 034f0fef-be7f-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 14:33:44 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id k37so1175288wms.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 05:33:44 -0800 (PST)
Received: from fedora.. (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003df5be8987esm2672209wmb.20.2023.03.09.05.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 05:33:43 -0800 (PST)
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
X-Inumbo-ID: 034f0fef-be7f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678368824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zAWdmipjTmyv+kU5KlZ3LiEbu3zViDQxHONb1o9/AU=;
        b=kfcJIUgDxs0RiU5N8LXvIRPaV5ko7lgDLBfizoUDAUlPntl4IeR5R7qlYr5CIiR/lD
         9pqYSz39Q6U0GSLoIeKVeYLCGoP0YHP46MiXzUGMcYF3ZuFcDKtxTUA+YP2qZPHCb55q
         B+pGRqH6dtPSuh+5KB0EZtSiwj/jdRzgrOqXKpWpb/OO7ctHs2tTZduP3WX9IM9/e1Rx
         zF1yT4Weoob0hJYSS9dpd6WjBhjusjidXMJQDXhONw7c1yZ2o/sdBlWmSDSHXUoOQqud
         0d3uqj859hMpfsdfSV0odZOUleYJp0WqItPMiGup2Qp6aCp1RwetuWvCdUu/5B9vK20g
         wjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zAWdmipjTmyv+kU5KlZ3LiEbu3zViDQxHONb1o9/AU=;
        b=YS69sC7aMPDp+wrgqMlxJJZEJj5DXC/3AdwN/8YuN0XCI3977oucKKl/EMhXLmscnh
         kgVdmZnsjJFK2s0L6AyTX7m9s+ln3l922vxD0QesWaU4VcIsWOMZQV4KD3+TK1Ga6THc
         niItguEVn+Yd+ZLYEm1TP/4pfqzE0NHqa53Avl/Qedc3FZCaYP7/kJHzFdSewMP94JWG
         11ltSaoexAwn9yeL7PtQ+FlUE5T9L5rehpWN3qhNOE7NbQtaWLM2NkWim8vnWVN0GpeM
         U+Y/jnW5tWrci97L/gdq4Ux3l2Bw4bfEjeMSKgu5kqD51v4kV+abLEtrlchY/NSiSoU3
         fMsg==
X-Gm-Message-State: AO0yUKXPULCIH+yMGTvg0evYlwS/iyJEv5Rv8AZlTieKoRHWV67k1LRb
	65UB32B866+iMrvf90/eOj2qdqoHNeVu9g==
X-Google-Smtp-Source: AK7set/JUDTcInR86wuJ01MgZ+bOm9ddP0FkutXHBZb0VSMBdGdsYvQUEIk7Ics1nqXebAf2lZmjkw==
X-Received: by 2002:a05:600c:4fd4:b0:3eb:2b88:867e with SMTP id o20-20020a05600c4fd400b003eb2b88867emr19349876wmq.10.1678368823771;
        Thu, 09 Mar 2023 05:33:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 5/5] xen/x86: switch x86 to use generic implemetation of bug.h
Date: Thu,  9 Mar 2023 15:33:28 +0200
Message-Id: <2e803fd639a4af558153635a40d034b0af250e4e.1678368234.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678368234.git.oleksii.kurochko@gmail.com>
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made:
* Make GENERIC_BUG_FRAME mandatory for X86
* Update asm/bug.h using generic implementation in <xen/bug.h>
* Update do_invalid_op using generic do_bug_frame()
* Define BUG_DEBUGGER_TRAP_FATAL to debugger_trap_fatal(X86_EXC_GP,regs)
* type of eip variable was changed to 'const void *'
* add '#include <xen/debugger.h>'

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7:
 * update the commit message
 * make eip 'const void *'
 * change [eip = (unsigned char *)eip + sizeof(bug_insn);] to [eip += sizeof(bug_insn);]
 * add '#include <xen/debugger.h>' to <asm/bug.h>
 * add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 * update the commit message
 * update the type of eip to 'void *' in do_invalid_op()
 * fix the logic of do_invalid_op()
 * move macros BUG_DEBUGGER_TRAP_FATAL under #ifndef __ASSEMBLY__ as
   it is not necessary to be in assembly code.
---
Changes in V5:
 * Nothing changed
---
Changes in V4:
 * Back comment /* !__ASSEMBLY__ */ for #else case in <asm/bug.h>
 * Remove changes related to x86/.../asm/debuger.h as do_bug_frame() prototype
   was updated and cpu_user_regs isn't const any more.
---
Changes in V3:
 * As prototype and what do_bug_frame() returns was changed so patch 3 and 4
   was updated to use a new version of do_bug_frame
 * MODIFIER was change to BUG_ASM_CONST to align with generic implementation
---
Changes in V2:
  * Remove all unnecessary things from <asm/bug.h> as they were introduced in
    <xen/bug.h>.
  * Define BUG_INSTR = 'ud2' and MODIFIER = 'c' ( it is needed to skip '$'
    when use an imidiate in x86 assembly )
  * Update do_invalid_op() to re-use handle_bug_frame() and find_bug_frame()
    from generic implemetation of CONFIG_GENERIC_BUG_FRAME
  * Code style fixes.
---
 xen/arch/x86/Kconfig           |  1 +
 xen/arch/x86/include/asm/bug.h | 69 ++---------------------------
 xen/arch/x86/traps.c           | 81 ++++------------------------------
 3 files changed, 13 insertions(+), 138 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba..b0ff1f3ee6 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -11,6 +11,7 @@ config X86
 	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
+	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index 4b3e7b019d..8531d5f91e 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -3,73 +3,12 @@
 
 #ifndef __ASSEMBLY__
 
-#define BUG_FRAME_STRUCT
+#include <xen/debugger.h>
 
-struct bug_frame {
-    signed int loc_disp:BUG_DISP_WIDTH;
-    unsigned int line_hi:BUG_LINE_HI_WIDTH;
-    signed int ptr_disp:BUG_DISP_WIDTH;
-    unsigned int line_lo:BUG_LINE_LO_WIDTH;
-    signed int msg_disp[];
-};
+#define BUG_DEBUGGER_TRAP_FATAL(regs) debugger_trap_fatal(X86_EXC_GP,regs)
 
-#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
-#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
-#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
-                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
-                      BUG_LINE_LO_WIDTH) +                                   \
-                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
-                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
-#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
-
-#define _ASM_BUGFRAME_TEXT(second_frame)                                     \
-    ".Lbug%=: ud2\n"                                                         \
-    ".pushsection .bug_frames.%c[bf_type], \"a\", @progbits\n"               \
-    ".p2align 2\n"                                                           \
-    ".Lfrm%=:\n"                                                             \
-    ".long (.Lbug%= - .Lfrm%=) + %c[bf_line_hi]\n"                           \
-    ".long (%c[bf_ptr] - .Lfrm%=) + %c[bf_line_lo]\n"                        \
-    ".if " #second_frame "\n"                                                \
-    ".long 0, %c[bf_msg] - .Lfrm%=\n"                                        \
-    ".endif\n"                                                               \
-    ".popsection\n"                                                          \
-
-#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
-    [bf_type]    "i" (type),                                                 \
-    [bf_ptr]     "i" (ptr),                                                  \
-    [bf_msg]     "i" (msg),                                                  \
-    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
-                      << BUG_DISP_WIDTH),                                    \
-    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
-
-#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
-    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH));         \
-    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
-    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
-                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
-} while (0)
-
-
-#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
-#define BUG() do {                                              \
-    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
-    unreachable();                                              \
-} while (0)
-
-/*
- * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
- * and use a real static inline here to get proper type checking of fn().
- */
-#define run_in_exception_handler(fn)                            \
-    do {                                                        \
-        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
-        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
-    } while ( 0 )
-
-#define assert_failed(msg) do {                                 \
-    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
-    unreachable();                                              \
-} while (0)
+#define BUG_INSTR       "ud2"
+#define BUG_ASM_CONST   "c"
 
 #else  /* !__ASSEMBLY__ */
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8..c36e3f855b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -24,6 +24,7 @@
  * Gareth Hughes <gareth@valinux.com>, May 2000
  */
 
+#include <xen/bug.h>
 #include <xen/init.h>
 #include <xen/sched.h>
 #include <xen/lib.h>
@@ -1166,12 +1167,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
 
 void do_invalid_op(struct cpu_user_regs *regs)
 {
-    const struct bug_frame *bug = NULL;
     u8 bug_insn[2];
-    const char *prefix = "", *filename, *predicate, *eip = (char *)regs->rip;
-    unsigned long fixup;
-    int id = -1, lineno;
-    const struct virtual_region *region;
+    const void *eip = (const void *)regs->rip;
+    int id;
 
     if ( likely(guest_mode(regs)) )
     {
@@ -1185,83 +1183,20 @@ void do_invalid_op(struct cpu_user_regs *regs)
          memcmp(bug_insn, "\xf\xb", sizeof(bug_insn)) )
         goto die;
 
-    region = find_text_region(regs->rip);
-    if ( region )
-    {
-        for ( id = 0; id < BUGFRAME_NR; id++ )
-        {
-            const struct bug_frame *b;
-            unsigned int i;
-
-            for ( i = 0, b = region->frame[id].bugs;
-                  i < region->frame[id].n_bugs; b++, i++ )
-            {
-                if ( bug_loc(b) == eip )
-                {
-                    bug = b;
-                    goto found;
-                }
-            }
-        }
-    }
-
- found:
-    if ( !bug )
+    id = do_bug_frame(regs, regs->rip);
+    if ( id < 0 )
         goto die;
-    eip += sizeof(bug_insn);
-    if ( id == BUGFRAME_run_fn )
-    {
-        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
-
-        fn(regs);
-        fixup_exception_return(regs, (unsigned long)eip);
-        return;
-    }
 
-    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
-    filename = bug_ptr(bug);
-    if ( !is_kernel(filename) && !is_patch(filename) )
-        goto die;
-    fixup = strlen(filename);
-    if ( fixup > 50 )
-    {
-        filename += fixup - 47;
-        prefix = "...";
-    }
-    lineno = bug_line(bug);
+    eip += sizeof(bug_insn);
 
     switch ( id )
     {
+    case BUGFRAME_run_fn:
     case BUGFRAME_warn:
-        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
-        show_execution_state(regs);
         fixup_exception_return(regs, (unsigned long)eip);
-        return;
-
     case BUGFRAME_bug:
-        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return;
-
-        show_execution_state(regs);
-        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
     case BUGFRAME_assert:
-        /* ASSERT: decode the predicate string pointer. */
-        predicate = bug_msg(bug);
-        if ( !is_kernel(predicate) && !is_patch(predicate) )
-            predicate = "<unknown>";
-
-        printk("Assertion '%s' failed at %s%s:%d\n",
-               predicate, prefix, filename, lineno);
-
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return;
-
-        show_execution_state(regs);
-        panic("Assertion '%s' failed at %s%s:%d\n",
-              predicate, prefix, filename, lineno);
+        return;
     }
 
  die:
-- 
2.39.2



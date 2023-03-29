Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB66CD7E7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516188.799944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOb-0000P8-58; Wed, 29 Mar 2023 10:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516188.799944; Wed, 29 Mar 2023 10:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOa-0000Bu-Sq; Wed, 29 Mar 2023 10:51:12 +0000
Received: by outflank-mailman (input) for mailman id 516188;
 Wed, 29 Mar 2023 10:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phTOZ-0007lb-4v
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:51:11 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d5fdfb1-ce1f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:51:09 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id y20so19584158lfj.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 03:51:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b004eb0f6b7ccfsm1173572lfh.134.2023.03.29.03.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 03:51:09 -0700 (PDT)
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
X-Inumbo-ID: 9d5fdfb1-ce1f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680087069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIBTQ+/gJzftoYOKQxHsDF5nCeh3hAxpIqkYkUYYTMY=;
        b=pKJwHoFeJf4Co42bNQ5W2ghNeKhv63JzLkAc+zxHSA7GSrDe8ZHt7xNxn3m6zGAwzp
         SClf5sDPvpSTTDvcSqZxa3HMgw8h2KexmVkDPnOONrAIOBkVBNOF2mdQx4WIYvsRGMuS
         NnPoWS4hk40zgII3NeWl6vLJCzHR8lCgoENncATiJxNV2SVibPopB0V6HdFFmM194XBk
         gzkTbwP6Z8MMo+tCl+rqnZCHQKhnz7NAr5X63U47aBAyzI9BDHmGC80YteFm5aOnQpYb
         l5N9FvNtiCIJoOfqTamImdt0KBhFb9zGRGEjZ4CUBf9UKO3XdCpvLmRqWmM2Hip6jHmH
         aYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIBTQ+/gJzftoYOKQxHsDF5nCeh3hAxpIqkYkUYYTMY=;
        b=fnXQ6EC2t0VkfuhkqBHnQ2oNfuYindWevkUV1ab0hTFLXRinN6r+bhXSp7vWJ6M2l0
         j2RVAfjU37RjMIH00/myKWzRqWg5DuVPJceOdE225GdkNqtidVlZinq1uBvz0Km5teWI
         1SS2Z4ZvBuIb9VJhPvsflFmiV+jWopAvlhwxZPLX7nGHYMmGih0lOfj49bdc+Gt6MUgK
         h44ZXppl0AoU484rxXYxduT1MXLEPMT6OLwAGqYMd24FKDZsvDUMn7/WTKUcQ2F+vEWv
         PBRkgUFg17XYdGeTOgjr22gaaFs+tTYgBa4PTivFouqeRlc+LRBMSgz3foBg2NpSPlf4
         hAgQ==
X-Gm-Message-State: AAQBX9f/CtSaflBZ0ko33QenrokiWw1v9I0zFQnbVFnagg234M5jf25s
	yKhIB9bFHogHn1B3vIEvt5ceV6sgSyk=
X-Google-Smtp-Source: AKy350ZNeIHeMYGuilMAahLbuTiRVF+c5zy4VfaaE4cnemjYkZDyiwrRWCC3HmTVTQBmo53NkUYngA==
X-Received: by 2002:ac2:5df2:0:b0:4a4:68b7:d64b with SMTP id z18-20020ac25df2000000b004a468b7d64bmr4782586lfq.50.1680087069326;
        Wed, 29 Mar 2023 03:51:09 -0700 (PDT)
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
Subject: [PATCH v9 5/5] xen/x86: switch x86 to use generic implemetation of bug.h
Date: Wed, 29 Mar 2023 13:50:32 +0300
Message-Id: <c5f48581421a7b0927b2f4b900443de9e02b30e1.1680086655.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680086655.git.oleksii.kurochko@gmail.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made:
* Make GENERIC_BUG_FRAME mandatory for X86
* Update asm/bug.h using generic implementation in <xen/bug.h>
* Update do_invalid_op using generic do_bug_frame()
* Define BUG_DEBUGGER_TRAP_FATAL to debugger_trap_fatal(X86_EXC_GP,regs)
* type of eip variable was changed to 'const void *'

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 * update the commit message
 * add additional explanation to <asm/bug.h> header
---
Changes in V8:
 * move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix compilation issue.
   The following compilation issue occurs:
     In file included from ./arch/x86/include/asm/smp.h:10,
                 from ./include/xen/smp.h:4,
                 from ./arch/x86/include/asm/processor.h:10,
                 from ./arch/x86/include/asm/system.h:6,
                 from ./arch/x86/include/asm/atomic.h:5,
                 from ./include/xen/gdbstub.h:24,
                 from ./arch/x86/include/asm/debugger.h:10,
                 from ./include/xen/debugger.h:24,
                 from ./arch/x86/include/asm/bug.h:7,
                 from ./include/xen/bug.h:15,
                 from ./include/xen/lib.h:27,
                 from ./include/xen/perfc.h:6,
                 from arch/x86/x86_64/asm-offsets.c:9:
     ./include/xen/cpumask.h: In function 'cpumask_check':
     ./include/xen/cpumask.h:84:9: error: implicit declaration of function 'ASSERT' [-Werror=implicit-function-declaration]
                    84 |         ASSERT(cpu < nr_cpu_ids);

   It happens in case when CONFIG_CRASH_DEBUG is enabled and the reason for that is when
   <xen/lib.h> is included in <x86_64/asm-offsets.c>:9 the "layout" of <xen/lib.h> would be
   the following:
     #include <xen/bug.h>:
     #include <asm/bug.h>:
     #include <xen/debugger.h>:
         ....
              cpumask.h:
                     ....
                    ASSERT(cpu < nr_cpu_ids);
	            return cpu;
                     .... 
     ....
     #define ASSERT ...
     ....
   Thereby ASSERT is defined after it was used in <xen/cpumask.h>.

 * Rebase the patch series on the top of the latest staging: it was a merge conflict
   inisde x86/Kconfig.
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
 xen/arch/x86/include/asm/bug.h | 87 ++++++++--------------------------
 xen/arch/x86/traps.c           | 81 ++++---------------------------
 3 files changed, 30 insertions(+), 139 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2a5c3304e2..406445a358 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -11,6 +11,7 @@ config X86
 	select ARCH_MAP_DOMAIN_PAGE
 	select ARCH_SUPPORTS_INT128
 	imply CORE_PARKING
+	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index 4b3e7b019d..7fe879a8cc 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,75 +1,30 @@
 #ifndef __X86_BUG_H__
 #define __X86_BUG_H__
 
-#ifndef __ASSEMBLY__
-
-#define BUG_FRAME_STRUCT
-
-struct bug_frame {
-    signed int loc_disp:BUG_DISP_WIDTH;
-    unsigned int line_hi:BUG_LINE_HI_WIDTH;
-    signed int ptr_disp:BUG_DISP_WIDTH;
-    unsigned int line_lo:BUG_LINE_LO_WIDTH;
-    signed int msg_disp[];
-};
-
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
 /*
- * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
- * and use a real static inline here to get proper type checking of fn().
+ * Please do not include in the header any header that might
+ * use BUG/ASSERT/etc maros asthey will be defined later after
+ * the return to <xen/bug.h> from the current header:
+ * 
+ * <xen/bug.h>:
+ *  ...
+ *   <asm/bug.h>:
+ *     ...
+ *     <any_header_which_uses_BUG/ASSERT/etc macros.h>
+ *     ...
+ *  ...
+ *  #define BUG() ...
+ *  ...
+ *  #define ASSERT() ...
+ *  ...
  */
-#define run_in_exception_handler(fn)                            \
-    do {                                                        \
-        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
-        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
-    } while ( 0 )
 
-#define assert_failed(msg) do {                                 \
-    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
-    unreachable();                                              \
-} while (0)
+#ifndef __ASSEMBLY__
+
+#define BUG_DEBUGGER_TRAP_FATAL(regs) debugger_trap_fatal(X86_EXC_GP,regs)
+
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



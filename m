Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0886CD7E4
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516186.799927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOZ-0008Q6-OP; Wed, 29 Mar 2023 10:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516186.799927; Wed, 29 Mar 2023 10:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phTOZ-0008Jm-I1; Wed, 29 Mar 2023 10:51:11 +0000
Received: by outflank-mailman (input) for mailman id 516186;
 Wed, 29 Mar 2023 10:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phTOY-0007lb-4i
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:51:10 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cf3b944-ce1f-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 12:51:09 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id j11so19519676lfg.13
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 03:51:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b004eb0f6b7ccfsm1173572lfh.134.2023.03.29.03.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 03:51:08 -0700 (PDT)
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
X-Inumbo-ID: 9cf3b944-ce1f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680087068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4hm0NhPYtnVD8krpgBcFgSPSXUb/9KSDjrwyawhzs4=;
        b=Ti4IqCK97MPndFrP8PVZIVu+Q79yqwYq68VMR0d21qgNXnLwL7LGvNW3ziw7+ueBjt
         TiosmseI0q4zvaBg6HdYGos65WBPDgPSMRCdB6fdDrF9r45+t625/SWX74lonnILo6Jg
         FYSvAxs6UeUEd3IkRYevF9th4/ZdvQ8ySzs+p/hI5hzptw4lRfqDaaPrmExAvTgSaKM6
         1+L6uoYywk5Vaz4+0FEXh0M8GB6qv7jFQUsfJlyC64zaVbYoaOb5wv44rU/s1+ErGo/F
         Qj1KJRhZqbWyRuZb727X0O3A9UnkEaejZbDr7EigZBBzWUkmUCDGCsRacC7sZTaVn9l1
         2IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680087068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4hm0NhPYtnVD8krpgBcFgSPSXUb/9KSDjrwyawhzs4=;
        b=3Prvovyl4BZ8Xs8CEKrDupSJAz1iN/pC4TKeahbquVs1AmoTzCPBf/Y4S8HkV8u3n/
         xZ05gSxSORxW1JIFuPnyF1ass3c3T4Hr1xWs43ZhF3pkRd2Y+i6kxjqvazLJwlPAyA+1
         Vwl8Tv36PKAmLtArLMw14K25VugtfhIR4JwVuEcj43T5CnwbMTiBjjImme+sImQcFhDD
         dzJ2Gdf8gdPxSa7WTnnF4i4Jp38GbaJlq0HvcxbF7hJa2yS5SVTF9tB7GWlDYSimJL8Q
         Sa3SvL1b5Wk1TZndJfwmSgMrHNmH3a89OJUi4moFwl48XSr5/K89FrcYt+IizMrqrLO2
         Mo/w==
X-Gm-Message-State: AAQBX9ezZ5K6IH0kNzYp7FGfsvqBAJHgwERElVDWxhPn890q+6VlkMrD
	Np+6JL1LbDGJ/A7eqq9udixqFr716WE=
X-Google-Smtp-Source: AKy350aZ+yRz5s1d6x6XlDfDtkrtemdQFAaW9oZQdezm35Wzno1h/TZqKTfQeeqfRruQK3WnqPMkcA==
X-Received: by 2002:a19:f602:0:b0:4e8:a093:5eea with SMTP id x2-20020a19f602000000b004e8a0935eeamr577637lfe.11.1680087068545;
        Wed, 29 Mar 2023 03:51:08 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 4/5] xen/arm: switch ARM to use generic implementation of bug.h
Date: Wed, 29 Mar 2023 13:50:31 +0300
Message-Id: <8fdb98350ae4fc6029738d0aabe13a57e1945a50.1680086655.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680086655.git.oleksii.kurochko@gmail.com>
References: <cover.1680086655.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made:
* make GENERIC_BUG_FRAME mandatory for ARM
* As do_bug_frame() returns -EINVAL in case something goes wrong
  otherwise id of bug frame. Thereby 'if' cases where do_bug_frame() was
  updated to check if the returned value is less than 0
* Switch ARM's implementation of bug.h macros to generic one

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V9:
 * add additional explanation to <asm/bug.h> header
---
Changes in V8:
 * Nothing changed.
---
Changes in V7:
 * Rebase the patch.
---
Changes in V6:
 * Update the "changes in v5"
 * Rebase on top of the patch [xen: introduce CONFIG_GENERIC_BUG_FRAME] as
   there were minor changes.
---
Changes in V5:
 * common/bug.c changes were removed after rebase
   (the patch [xen: introduce CONFIG_GENERIC_BUG_FRAME] was reworked to make
    ARM implementation to use generic do_bug_frame())
---
Changes in V4:
 * Switch ARM implementation to generic one
 * Remove BUG_FN_REG from arm{16,32}/bug.h as it isn't needed after switch to generic implementation
 * Update commit message
---
Changes in V3:
 * As prototype and what do_bug_frame() returns was changed so patch 3 and 4
   was updated to use a new version of do_bug_frame
---
Changes in V2:
 * Rename bug_file() in ARM implementation to bug_ptr() as
   generic do_bug_frame() uses bug_ptr().
 * Remove generic parts from bug.h
 * Remove declaration of 'int do_bug_frame(...)'
   from <asm/traps.h> as it was introduced in <xen/bug.h>
---
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/arm32/traps.c           |  2 +-
 xen/arch/arm/include/asm/arm32/bug.h |  2 -
 xen/arch/arm/include/asm/arm64/bug.h |  2 -
 xen/arch/arm/include/asm/bug.h       | 89 ++++++----------------------
 xen/arch/arm/include/asm/traps.h     |  2 -
 xen/arch/arm/traps.c                 | 81 +------------------------
 7 files changed, 22 insertions(+), 157 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..aad6644a7b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,6 +12,7 @@ config ARM_64
 
 config ARM
 	def_bool y
+	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
index a2fc1c22cb..61c61132c7 100644
--- a/xen/arch/arm/arm32/traps.c
+++ b/xen/arch/arm/arm32/traps.c
@@ -48,7 +48,7 @@ void do_trap_undefined_instruction(struct cpu_user_regs *regs)
     if ( instr != BUG_OPCODE )
         goto die;
 
-    if ( do_bug_frame(regs, pc) )
+    if ( do_bug_frame(regs, pc) < 0 )
         goto die;
 
     regs->pc += 4;
diff --git a/xen/arch/arm/include/asm/arm32/bug.h b/xen/arch/arm/include/asm/arm32/bug.h
index 25cce151dc..3e66f35969 100644
--- a/xen/arch/arm/include/asm/arm32/bug.h
+++ b/xen/arch/arm/include/asm/arm32/bug.h
@@ -10,6 +10,4 @@
 
 #define BUG_INSTR ".word " __stringify(BUG_OPCODE)
 
-#define BUG_FN_REG r0
-
 #endif /* __ARM_ARM32_BUG_H__ */
diff --git a/xen/arch/arm/include/asm/arm64/bug.h b/xen/arch/arm/include/asm/arm64/bug.h
index 5e11c0dfd5..59f664d7de 100644
--- a/xen/arch/arm/include/asm/arm64/bug.h
+++ b/xen/arch/arm/include/asm/arm64/bug.h
@@ -6,6 +6,4 @@
 
 #define BUG_INSTR "brk " __stringify(BRK_BUG_FRAME_IMM)
 
-#define BUG_FN_REG x0
-
 #endif /* __ARM_ARM64_BUG_H__ */
diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index cacaf014ab..3fb0471a9b 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -1,6 +1,24 @@
 #ifndef __ARM_BUG_H__
 #define __ARM_BUG_H__
 
+/*
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
+ */
+
 #include <xen/types.h>
 
 #if defined(CONFIG_ARM_32)
@@ -11,76 +29,7 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_FRAME_STRUCT
-
-struct bug_frame {
-    signed int loc_disp;    /* Relative address to the bug address */
-    signed int file_disp;   /* Relative address to the filename */
-    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
-    uint16_t line;          /* Line number */
-    uint32_t pad0:16;       /* Padding for 8-bytes align */
-};
-
-#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
-#define bug_file(b) ((const void *)(b) + (b)->file_disp);
-#define bug_line(b) ((b)->line)
-#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
-
-/* Many versions of GCC doesn't support the asm %c parameter which would
- * be preferable to this unpleasantness. We use mergeable string
- * sections to avoid multiple copies of the string appearing in the
- * Xen image. BUGFRAME_run_fn needs to be handled separately.
- */
-#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
-    BUILD_BUG_ON((line) >> 16);                                             \
-    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
-    asm ("1:"BUG_INSTR"\n"                                                  \
-         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
-         "2:\t.asciz " __stringify(file) "\n"                               \
-         "3:\n"                                                             \
-         ".if " #has_msg "\n"                                               \
-         "\t.asciz " #msg "\n"                                              \
-         ".endif\n"                                                         \
-         ".popsection\n"                                                    \
-         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
-         "4:\n"                                                             \
-         ".p2align 2\n"                                                     \
-         ".long (1b - 4b)\n"                                                \
-         ".long (2b - 4b)\n"                                                \
-         ".long (3b - 4b)\n"                                                \
-         ".hword " __stringify(line) ", 0\n"                                \
-         ".popsection");                                                    \
-} while (0)
-
-/*
- * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
- * flag but instead rely on the default value from the compiler). So the
- * easiest way to implement run_in_exception_handler() is to pass the to
- * be called function in a fixed register.
- */
-#define  run_in_exception_handler(fn) do {                                  \
-    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
-         "1:"BUG_INSTR"\n"                                                  \
-         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
-         "             \"a\", %%progbits\n"                                 \
-         "2:\n"                                                             \
-         ".p2align 2\n"                                                     \
-         ".long (1b - 2b)\n"                                                \
-         ".long 0, 0, 0\n"                                                  \
-         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
-} while (0)
-
-#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
-
-#define BUG() do {                                              \
-    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
-    unreachable();                                              \
-} while (0)
-
-#define assert_failed(msg) do {                                 \
-    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
-    unreachable();                                              \
-} while (0)
+#define BUG_ASM_CONST   "c"
 
 #endif /* __ARM_BUG_H__ */
 /*
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 883dae368e..c6518008ec 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -69,8 +69,6 @@ void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
 void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr);
 void do_trap_hvc_smccc(struct cpu_user_regs *regs);
 
-int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc);
-
 void noreturn do_unexpected_trap(const char *msg,
                                  const struct cpu_user_regs *regs);
 void do_trap_hyp_sync(struct cpu_user_regs *regs);
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 061c92acbd..9c6eb66422 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1197,85 +1197,6 @@ void do_unexpected_trap(const char *msg, const struct cpu_user_regs *regs)
     panic("CPU%d: Unexpected Trap: %s\n", smp_processor_id(), msg);
 }
 
-int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
-{
-    const struct bug_frame *bug = NULL;
-    const char *prefix = "", *filename, *predicate;
-    unsigned long fixup;
-    int id = -1, lineno;
-    const struct virtual_region *region;
-
-    region = find_text_region(pc);
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
-                if ( ((vaddr_t)bug_loc(b)) == pc )
-                {
-                    bug = b;
-                    goto found;
-                }
-            }
-        }
-    }
- found:
-    if ( !bug )
-        return -ENOENT;
-
-    if ( id == BUGFRAME_run_fn )
-    {
-        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
-
-        fn(regs);
-        return 0;
-    }
-
-    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
-    filename = bug_file(bug);
-    if ( !is_kernel(filename) )
-        return -EINVAL;
-    fixup = strlen(filename);
-    if ( fixup > 50 )
-    {
-        filename += fixup - 47;
-        prefix = "...";
-    }
-    lineno = bug_line(bug);
-
-    switch ( id )
-    {
-    case BUGFRAME_warn:
-        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
-        show_execution_state(regs);
-        return 0;
-
-    case BUGFRAME_bug:
-        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-        show_execution_state(regs);
-        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-    case BUGFRAME_assert:
-        /* ASSERT: decode the predicate string pointer. */
-        predicate = bug_msg(bug);
-        if ( !is_kernel(predicate) )
-            predicate = "<unknown>";
-
-        printk("Assertion '%s' failed at %s%s:%d\n",
-               predicate, prefix, filename, lineno);
-        show_execution_state(regs);
-        panic("Assertion '%s' failed at %s%s:%d\n",
-              predicate, prefix, filename, lineno);
-    }
-
-    return -EINVAL;
-}
-
 #ifdef CONFIG_ARM_64
 static void do_trap_brk(struct cpu_user_regs *regs, const union hsr hsr)
 {
@@ -1292,7 +1213,7 @@ static void do_trap_brk(struct cpu_user_regs *regs, const union hsr hsr)
     switch ( hsr.brk.comment )
     {
     case BRK_BUG_FRAME_IMM:
-        if ( do_bug_frame(regs, regs->pc) )
+        if ( do_bug_frame(regs, regs->pc) < 0 )
             goto die;
 
         regs->pc += 4;
-- 
2.39.2



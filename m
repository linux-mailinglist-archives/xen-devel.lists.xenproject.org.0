Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6276A1B6A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500925.772510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIN-0005ga-35; Fri, 24 Feb 2023 11:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500925.772510; Fri, 24 Feb 2023 11:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIN-0005eV-03; Fri, 24 Feb 2023 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 500925;
 Fri, 24 Feb 2023 11:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWIK-0004Yi-IV
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:31:20 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c16ed476-b436-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 12:31:18 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id a10so13919272ljq.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:31:18 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a2ea613000000b00295a815e555sm92682ljp.134.2023.02.24.03.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:31:17 -0800 (PST)
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
X-Inumbo-ID: c16ed476-b436-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0G6bE1AlT3k8lziFMWj2l/M2niQSqBi5lrDekN1qx28=;
        b=GYUYtzeTNuhG3D/yG/hHVooXpxlTJ0x1pReKqll9NUaF9Vu0cEEK1hg3/zR3JOMXQ8
         lDdRVSQFNDZlkxD8kj+VY4W7rge5cwmIGQ+ZXa3XpeD7lOcIZp/Y3kw7foaF46eanqg+
         MB2JJ97nWiir3SLqq0fjOjmOddvri+8ZsaJvOpvFy88SZ+4T1vfhWUBwBYI8NR3OKsGo
         dx8xUMCl8rzmx8tH939fPYX0+HeWNlKykOXiRsrw8SrI5fYVSKnkIcH+fOMzToapoo7K
         c0cKow1BGl9yo6VU+RkDZf+A/O44J8Mhp0PkAzTALbeUhijVzhc15zrYWqNMGrC4WtSx
         U7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G6bE1AlT3k8lziFMWj2l/M2niQSqBi5lrDekN1qx28=;
        b=jLjd0/pDDBuDOsBcQ49ost2w0cix1//Ex20I8Nk7GZtIlzl5Cylb080MAD4E2A/VZp
         FRW/8G7gAtzo190o+FX2u/XsQ4cnVNh0NlOwpBBF+AAbgYUv2iLfgqHf72ID2oN30Iv3
         jldIrf2jmvMIu6VMVeWcSnufXyf+dR9DNbT7rsccsP3KUTC3CQlVUkILwS+DrJBv5Pvc
         2vfSsK19NrYV8mOKYgG8UxlW8vlUQ0hD4H7v7SMZikQFG7ST7FZX6cmYJybpG4QXgXM7
         QnTj0LSE9QqlRAfSnjps81E0DHk5axuB+tf0pX4xc+H/Lx6f1DLm0NYFpnWb54aIMhkm
         ZhbQ==
X-Gm-Message-State: AO0yUKUifjhZEyFh9g20PEu0VmyzOk7nngQ4Mak25U2eWu5z+kaO0j38
	bgIXww17nEMWtwol3bb89xR/ZPzmL5U=
X-Google-Smtp-Source: AK7set9jt2Oel6r7VafLykfXdQdGunzpx2L3B48YkrPx2A0fDH3ADfKCtJqxLLOjL5rKb+ZkWvQ5AA==
X-Received: by 2002:a2e:b045:0:b0:293:4be1:29df with SMTP id d5-20020a2eb045000000b002934be129dfmr5548154ljl.36.1677238277999;
        Fri, 24 Feb 2023 03:31:17 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/4] xen/x86: switch x86 to use generic implemetation of bug.h
Date: Fri, 24 Feb 2023 13:31:07 +0200
Message-Id: <38bb75b9add8655288347aa4df1394450e4e10c9.1677233393.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677233393.git.oleksii.kurochko@gmail.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made:
* Make GENERIC_BUG_FRAME mandatory for X86
* Update asm/bug.h using generic implementation in <xen/bug.h>
* Change prototype of debugger_trap_fatal() in asm/debugger.h
  to align it with generic prototype in <xen/debugger.h>.
* Update do_invalid_op using generic do_bug_frame()

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/x86/Kconfig                |  1 +
 xen/arch/x86/include/asm/bug.h      | 73 ++------------------------
 xen/arch/x86/include/asm/debugger.h |  4 +-
 xen/arch/x86/traps.c                | 81 +++--------------------------
 4 files changed, 14 insertions(+), 145 deletions(-)

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
index 4b3e7b019d..d7eb41baf3 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -3,75 +3,10 @@
 
 #ifndef __ASSEMBLY__
 
-#define BUG_FRAME_STRUCT
+#define BUG_INSTR       "ud2"
+#define BUG_ASM_CONST   "c"
 
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
-
-#else  /* !__ASSEMBLY__ */
+#else
 
 /*
  * Construct a bugframe, suitable for using in assembly code.  Should always
@@ -113,6 +48,6 @@ struct bug_frame {
 #define ASSERT_FAILED(msg)                                      \
      BUG_FRAME BUGFRAME_assert, __LINE__, __FILE__, 1, msg
 
-#endif /* !__ASSEMBLY__ */
+#endif /* __ASSEMBLY__ */
 
 #endif /* __X86_BUG_H__ */
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index a5c299c6c3..1873dc5779 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
@@ -14,9 +14,9 @@
 
 /* Returns true if GDB handled the trap, or it is surviveable. */
 static inline bool debugger_trap_fatal(
-    unsigned int vector, struct cpu_user_regs *regs)
+    unsigned int vector, const struct cpu_user_regs *regs)
 {
-    int rc = __trap_to_gdb(regs, vector);
+    int rc = __trap_to_gdb((struct cpu_user_regs *)regs, vector);
 
     if ( rc == 0 )
         return true;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8..7c33ebceff 100644
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
+    const char *eip = (char *)regs->rip;
+    int id;
 
     if ( likely(guest_mode(regs)) )
     {
@@ -1185,83 +1183,18 @@ void do_invalid_op(struct cpu_user_regs *regs)
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
         return;
-
-    case BUGFRAME_bug:
-        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
-            return;
-
-        show_execution_state(regs);
-        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-    case BUGFRAME_assert:
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
     }
 
  die:
-- 
2.39.0



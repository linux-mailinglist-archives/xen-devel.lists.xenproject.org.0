Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A2B69D183
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 17:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498239.769108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9E5-0007dY-13; Mon, 20 Feb 2023 16:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498239.769108; Mon, 20 Feb 2023 16:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9E4-0007Zj-Sz; Mon, 20 Feb 2023 16:41:16 +0000
Received: by outflank-mailman (input) for mailman id 498239;
 Mon, 20 Feb 2023 16:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pU9E3-0006Vi-6U
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 16:41:15 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d86e37-b13d-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 17:41:14 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id l8so1771605ljq.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 08:41:14 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2e6a08000000b002934d555783sm65798ljc.6.2023.02.20.08.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 08:41:13 -0800 (PST)
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
X-Inumbo-ID: 63d86e37-b13d-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brWuH85TZkY9/IYxdPrwIkUjLxv9KxBhQf85+vQ58wk=;
        b=MmRKeCMdzrG6DgNv6Ggsgf8G/lMwhwCFonQEkCwdQDcQFu9ccqxj95wBG/IVOZaqnk
         Cn/Q0rk1b86MC+30UZd9NkmfPhLhAhJU7EVQLoI1wsBrv+2PAc6bZAcjnN/NohTxQ+pd
         G6xq1V8F1sVLqA9lXsE7KNvT4FURLrQ70PaUcwFpGDIFFh6yBZ3mwzHPqgR9W/3P3hWW
         fb6L5cXlx6isYkbd4QLSRu0tXhXj6MA2pERQmEnA2FP07hRbM6OLMcjDaYuKUB9ozDmL
         qTCctEWwAALncKXrK8hSO+BJt4zAahcE5X4kuWrsGRn0N3nAGlcutP6XeBh45iOzPyhT
         zuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brWuH85TZkY9/IYxdPrwIkUjLxv9KxBhQf85+vQ58wk=;
        b=aA8BOoE1Qfz5Q1LiyzCGu7y+n64+YWfpXrwiZUJa9rAkVw2k1nTqGuA7yVuFsrDbrm
         Zuj4ZLSgvKUEiRdLbLX7IgefwdCmomEQg7Eg1Ri5aSj5dpEEA1c7jOXNcN+XSy/4xSaB
         +vbvAbbcJnCGh3Fb7w1IXq8E3cUJ//dNDBrtsUSTeCcpPf6nOXgteCdTYLGMWv/pso4H
         ZtuU11hCSg+t5wTNhwjPP5/PRfLVZP3zurkmarf2GdlJjDS04pEGfZiYNFwmhKEvcwNS
         DvM1ZCCZd17yqrKsQyQ+tbrYap7VcFJYvYRG/tJUDeKo1hNtclSheVJRlq6jRZof+Azc
         CgbQ==
X-Gm-Message-State: AO0yUKXXITzrmVcGBgcN+lyPwaVgna6BR/KJGLhWHmST1QDt7Qb+iCmL
	oOT5WWqlKaeneq9Vz3jKeWtmfcvamvs=
X-Google-Smtp-Source: AK7set+NVAnmJghQX6aiBFVCLKdpyaj6Mv2mvGiPVfX8m5pajdpOfDnIQD0R+mBYQPtZNwJfbjXQjg==
X-Received: by 2002:a05:651c:1543:b0:293:5312:b021 with SMTP id y3-20020a05651c154300b002935312b021mr354992ljp.14.1676911273817;
        Mon, 20 Feb 2023 08:41:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/4] xen/x86: switch x86 to use generic implemetation of bug.h
Date: Mon, 20 Feb 2023 18:41:00 +0200
Message-Id: <14900d647181be59b5b7d90c013f0914ed273088.1676909088.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1676909088.git.oleksii.kurochko@gmail.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
 xen/arch/x86/include/asm/bug.h | 88 ++--------------------------------
 xen/arch/x86/traps.c           | 81 +++++--------------------------
 3 files changed, 18 insertions(+), 152 deletions(-)

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
index b7265bdfbe..31fc687669 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,92 +1,12 @@
 #ifndef __X86_BUG_H__
 #define __X86_BUG_H__
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
-#define BUGFRAME_run_fn 0
-#define BUGFRAME_warn   1
-#define BUGFRAME_bug    2
-#define BUGFRAME_assert 3
-
-#define BUGFRAME_NR     4
-
 #ifndef __ASSEMBLY__
 
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
-extern const struct bug_frame __start_bug_frames[],
-                              __stop_bug_frames_0[],
-                              __stop_bug_frames_1[],
-                              __stop_bug_frames_2[],
-                              __stop_bug_frames_3[];
+#define BUG_INSTR "ud2"
+#define MODIFIER  "c"
 
-#else  /* !__ASSEMBLY__ */
+#else
 
 /*
  * Construct a bugframe, suitable for using in assembly code.  Should always
@@ -128,6 +48,6 @@ extern const struct bug_frame __start_bug_frames[],
 #define ASSERT_FAILED(msg)                                      \
      BUG_FRAME BUGFRAME_assert, __LINE__, __FILE__, 1, msg
 
-#endif /* !__ASSEMBLY__ */
+#endif /* __ASSEMBLY__ */
 
 #endif /* __X86_BUG_H__ */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8..39f153a53b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -24,6 +24,7 @@
  * Gareth Hughes <gareth@valinux.com>, May 2000
  */
 
+#include <xen/bug.h>
 #include <xen/init.h>
 #include <xen/sched.h>
 #include <xen/lib.h>
@@ -1168,10 +1169,8 @@ void do_invalid_op(struct cpu_user_regs *regs)
 {
     const struct bug_frame *bug = NULL;
     u8 bug_insn[2];
-    const char *prefix = "", *filename, *predicate, *eip = (char *)regs->rip;
-    unsigned long fixup;
-    int id = -1, lineno;
-    const struct virtual_region *region;
+    const char *eip = (char *)regs->rip;
+    unsigned int id;
 
     if ( likely(guest_mode(regs)) )
     {
@@ -1185,83 +1184,29 @@ void do_invalid_op(struct cpu_user_regs *regs)
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
+    bug = find_bug_frame((unsigned long)eip, &id);
     if ( !bug )
         goto die;
+
     eip += sizeof(bug_insn);
-    if ( id == BUGFRAME_run_fn )
-    {
-        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
 
-        fn(regs);
-        fixup_exception_return(regs, (unsigned long)eip);
-        return;
+    switch ( id )
+    {
+    case BUGFRAME_bug:
+    case BUGFRAME_assert:
+        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
+            return;
     }
 
-    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
-    filename = bug_ptr(bug);
-    if ( !is_kernel(filename) && !is_patch(filename) )
+    if ( handle_bug_frame(regs, bug, id) )
         goto die;
-    fixup = strlen(filename);
-    if ( fixup > 50 )
-    {
-        filename += fixup - 47;
-        prefix = "...";
-    }
-    lineno = bug_line(bug);
 
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



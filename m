Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3366B2588
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 14:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508264.782781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGOu-0001bv-RQ; Thu, 09 Mar 2023 13:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508264.782781; Thu, 09 Mar 2023 13:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paGOu-0001Z9-NQ; Thu, 09 Mar 2023 13:33:44 +0000
Received: by outflank-mailman (input) for mailman id 508264;
 Thu, 09 Mar 2023 13:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZdn=7B=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1paGOs-0001IZ-Hc
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 13:33:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffd7611e-be7e-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 14:33:39 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1229303wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 05:33:38 -0800 (PST)
Received: from fedora.. (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 he11-20020a05600c540b00b003df5be8987esm2672209wmb.20.2023.03.09.05.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 05:33:37 -0800 (PST)
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
X-Inumbo-ID: ffd7611e-be7e-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678368818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FntExRJGSeNimov04w9TWjVBprfy6lHE5LgK1Zasik0=;
        b=RHYaePXORUl2qaT3YOZRCm2Q9Vv/EyTMsopl7Iu9m0smRDVd6Se8MwO3yPbfPhEiAd
         KBktSAyXQ2DFNoyJ19pvZsy/G98I1SwDI+x3KDaZ2dqKbS4gauM4PaN7zpn+dqaQj9Kp
         iuW7Seb0igpEC4JjINg0UygE3HGRFqZVELhIqr2DFgQyWrGWH1Y5JD+m0rEpewCKXqEj
         KFlPKMKQo5CC4JtjituoES8ZieGm4iUlW2zTMzdZ3AGrgd6q60YtQMxnu7Ezxp83WFsK
         tWdBDv/eXi6FqL3iCE7vL0yVF/KZRAHJ7AGqJEFwc7I0c0Z68CozZusV1RDxmgV4yz6/
         KzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FntExRJGSeNimov04w9TWjVBprfy6lHE5LgK1Zasik0=;
        b=OzX0YdudoeO3avG7UhPzxIohWevsFef6AqM3wc2LatIfZnXR6auRZktcWMLgVNz7ra
         40NhUzcJ72t+RZhTw5v/bGQEvevYML1ijOOI8ojja4M+JdsTvvGPrJnMPXi5jFf8PSfG
         DIcMIIx3Dj73GaD6Vs8X8E8ux8u8mQIjZMVfW82fBats9zmT4zS9e39J6x0OXrP8MMqQ
         LoWSLGiB8KhnWN6ZYMOuXRVYoqVAwABsn6igyKnNkbgwrueiHek1tAqcPgDpfZxpUAhG
         kvuUO3hNT7e+jRaODnAv3PEcdWRqhkxwtoLS0+Lm6cUDUlPU0rS4Qj5K6N3GjjLgRo3M
         cr/A==
X-Gm-Message-State: AO0yUKWhPQGGq/ASbgkCU4BNKPuGOckO7Uo6RfYzVGTw+qxJ8+aZ7px4
	E1AHCv3S2aylm1PSKjV0t/U9QxL0KJKTMw==
X-Google-Smtp-Source: AK7set/L/PuyYE2ohkvN0+isEBV3zDbPhSyBw2scZmmAHMwIgi9NqD/858cBPzeTWlGiIjabFPbZ9g==
X-Received: by 2002:a05:600c:310d:b0:3eb:13d2:c32c with SMTP id g13-20020a05600c310d00b003eb13d2c32cmr19722984wmo.40.1678368817852;
        Thu, 09 Mar 2023 05:33:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Date: Thu,  9 Mar 2023 15:33:24 +0200
Message-Id: <671cd744b92f14ddc0c47ca471e03e3229cb89ba.1678368234.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678368234.git.oleksii.kurochko@gmail.com>
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A large part of the content of the bug.h is repeated among all
architectures, so it was decided to create a new config
CONFIG_GENERIC_BUG_FRAME.

The version of <bug.h> from x86 was taken as the base version.

The patch introduces the following stuff:
  * common bug.h header
  * generic implementation of do_bug_frame
  * new config CONFIG_GENERIC_BUG_FRAME

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 * fix code style.
 * Remove '#include <xen/debugger.h>' from bug.c. it should be a part
   of <asm/bug.h>.
 * move BUILD_BUG_ON_LINE_WIDTH to '#ifndef BUG_FRAME_STRUCT' and define
   dummy BUILD_BUG_ON_LINE_WIDTH when BUG_FRAME_STRUCT is defined.
 * remove update prototype of 'void (*fn)(const struct cpu_user_regs *)' to
	 'void (*fn)(struct cpu_user_regs *)'.
 * add code to to make sure the type used in run_in_exception_handler()
	 matches the one used here.
---
Changes in V6:
 * fix code style.
 * change -EINVAL to -ENOENT in case when bug_frame wasn't found in
   generic do_bug_frame()
 * change all 'return id' to 'break' inside switch/case of generic do_bug_frame()
 * move up "#ifndef __ASSEMBLY__" to include BUG_DEBUGGER_TRAP_FATAL
 * update the comment of BUG_ASM_CONST
 * make the line with 'BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))' in
	 BUG_FRAME macros more abstract
 * remove #ifndef BUG_FRAME_STRUCT around BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH as it is
	 required to be defined before <asm/bug.h> as it is used by x86's <asm/bug.h> when
	 the header is included in assembly code.
---
Changes in V5:
 * Remove "#ifdef BUG_FN_REG..." from generic do_bug_frame() as ARM will
   use generic implementation fully.
---
Changes in V4:
 * common/bug.c:
		- Use BUG_DEBUGGER_TRAP_FATAL(regs) mnacros instead of debugger_trap_fatal(TRAP_invalid_op, regs)
		  in <common/bug.c> as TRAP_invalid_op is x86-specific thereby BUG_DEBUGGER_TRAP_FATAL should
		  be defined for each architecture.
		- add information about what do_bug_frame() returns.
		- invert the condition 'if ( region )' in do_bug_frame() to reduce the indention.
		- change type of variable i from 'unsigned int' to 'size_t' as it  is compared with
		  n_bugs which has type 'size_t'

 * xen/bug.h:
		- Introduce generic BUG_DEBUGGER_TRAP_FATAL(regs) mnacros which is used to deal with 
		  debugger_trap_fatal(TRAP_invalid_op, regs) where TRAP_invalid_op is x86-specific
		- remove '#include <xen/stringify.h>' as it doesn't need any more after switch to
		  x86 implementation.
		- remove '#include <xen/errno.h>' as it isn't needed any more
		- move bug_*() macros inside '#ifndef BUG_FRAME_STRUCT'
		- add <xen/lib.h> to fix compile issue with BUILD_ON()...
		- Add documentation for BUG_ASM_CONST.
 * Update the commit message
---
Changes in V3:
 * Add debugger_trap_fatal() to do_bug_frame(). It simplifies usage of
   do_bug_frame() for x86 so making handle_bug_frame() and find_bug_frame()
   not needed anymore.
 * Update do_bug_frame() to return -EINVAL if something goes wrong; otherwise
   id of bug_frame
 * Update _ASM_BUGFRAME_TEXT to make it more portable.
 * Drop unnecessary comments.
 * define stub value for TRAP_invalid_op in case if wasn't defined in
   arch-specific folders.
---
Changes in V2:
  - Switch to x86 implementation as generic as it is more compact
    ( at least from the point of view of bug frame structure ).
  - Rename CONFIG_GENERIC_DO_BUG_FRAME to CONFIG_GENERIC_BUG_FRAME.
  - Change the macro bug_loc(b) to avoid the need for a cast:
    #define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
  - Rename BUG_FRAME_STUFF to BUG_FRAME_STRUCT
  - Make macros related to bug frame structure more generic.
  - Introduce BUG_INSTR and MODIFIER to make _ASM_BUGFRAME_TEXT reusable
    between x86 and RISC-V.
  - Rework do_bug_frame() and introduce find_bug_frame() and handle_bug_frame()
    functions to make it reusable by x86.
  - code style fixes
---
 xen/common/Kconfig    |   3 +
 xen/common/Makefile   |   1 +
 xen/common/bug.c      | 107 ++++++++++++++++++++++++++++
 xen/include/xen/bug.h | 162 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8..b226323537 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -28,6 +28,9 @@ config ALTERNATIVE_CALL
 config ARCH_MAP_DOMAIN_PAGE
 	bool
 
+config GENERIC_BUG_FRAME
+	bool
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index bbd75b4be6..46049eac35 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
+obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
diff --git a/xen/common/bug.c b/xen/common/bug.c
new file mode 100644
index 0000000000..d583c37735
--- /dev/null
+++ b/xen/common/bug.c
@@ -0,0 +1,107 @@
+#include <xen/bug.h>
+#include <xen/errno.h>
+#include <xen/kernel.h>
+#include <xen/livepatch.h>
+#include <xen/string.h>
+#include <xen/types.h>
+#include <xen/virtual_region.h>
+
+#include <asm/processor.h>
+
+/*
+ * Returns a negative value in case of an error otherwise
+ * BUGFRAME_{run_fn, warn, bug, assert}
+ */
+int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
+{
+    const struct bug_frame *bug = NULL;
+    const struct virtual_region *region;
+    const char *prefix = "", *filename, *predicate;
+    unsigned long fixup;
+    unsigned int id = BUGFRAME_NR, lineno;
+
+    region = find_text_region(pc);
+    if ( !region )
+        return -EINVAL;
+
+    for ( id = 0; id < BUGFRAME_NR; id++ )
+    {
+        const struct bug_frame *b;
+        size_t i;
+
+        for ( i = 0, b = region->frame[id].bugs;
+              i < region->frame[id].n_bugs; b++, i++ )
+        {
+            if ( bug_loc(b) == pc )
+            {
+                bug = b;
+                goto found;
+            }
+        }
+    }
+
+ found:
+    if ( !bug )
+        return -ENOENT;
+
+    if ( id == BUGFRAME_run_fn )
+    {
+        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
+
+        fn(regs);
+
+        /* Re-enforce consistent types, because of the casts involved. */
+        if ( false )
+            run_in_exception_handler(fn);
+
+        return id;
+    }
+
+    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
+    filename = bug_ptr(bug);
+    if ( !is_kernel(filename) && !is_patch(filename) )
+        return -EINVAL;
+    fixup = strlen(filename);
+    if ( fixup > 50 )
+    {
+        filename += fixup - 47;
+        prefix = "...";
+    }
+    lineno = bug_line(bug);
+
+    switch ( id )
+    {
+    case BUGFRAME_warn:
+        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
+        show_execution_state(regs);
+
+        break;
+
+    case BUGFRAME_bug:
+        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
+
+        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
+            break;
+
+        show_execution_state(regs);
+        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+        if ( !is_kernel(predicate) && !is_patch(predicate) )
+            predicate = "<unknown>";
+
+        printk("Assertion '%s' failed at %s%s:%d\n",
+               predicate, prefix, filename, lineno);
+
+        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
+            break;
+
+        show_execution_state(regs);
+        panic("Assertion '%s' failed at %s%s:%d\n",
+              predicate, prefix, filename, lineno);
+    }
+
+    return id;
+}
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
new file mode 100644
index 0000000000..40442f2547
--- /dev/null
+++ b/xen/include/xen/bug.h
@@ -0,0 +1,162 @@
+#ifndef __XEN_BUG_H__
+#define __XEN_BUG_H__
+
+#define BUGFRAME_run_fn 0
+#define BUGFRAME_warn   1
+#define BUGFRAME_bug    2
+#define BUGFRAME_assert 3
+
+#define BUGFRAME_NR     4
+
+#define BUG_DISP_WIDTH    24
+#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
+#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
+
+#include <asm/bug.h>
+
+#ifndef __ASSEMBLY__
+
+#ifndef BUG_DEBUGGER_TRAP_FATAL
+#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
+#endif
+
+#include <xen/lib.h>
+
+#ifndef BUG_FRAME_STRUCT
+
+struct bug_frame {
+    signed int loc_disp:BUG_DISP_WIDTH;
+    unsigned int line_hi:BUG_LINE_HI_WIDTH;
+    signed int ptr_disp:BUG_DISP_WIDTH;
+    unsigned int line_lo:BUG_LINE_LO_WIDTH;
+    signed int msg_disp[];
+};
+
+#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
+
+#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
+
+#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
+                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
+                      BUG_LINE_LO_WIDTH) +                                   \
+                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
+                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
+
+#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
+
+#ifndef BUILD_BUG_ON_LINE_WIDTH
+#define BUILD_BUG_ON_LINE_WIDTH(line) \
+    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
+#endif
+
+#endif /* BUG_FRAME_STRUCT */
+
+/*
+ * Some architectures mark immediate instruction operands in a special way.
+ * In such cases the special marking may need omitting when specifying
+ * directive operands. Allow architectures to specify a suitable
+ * modifier.
+ */
+#ifndef BUG_ASM_CONST
+#define BUG_ASM_CONST ""
+#endif
+
+#ifndef _ASM_BUGFRAME_TEXT
+
+#define _ASM_BUGFRAME_TEXT(second_frame)                                            \
+    ".Lbug%=:"BUG_INSTR"\n"                                                         \
+    "   .pushsection .bug_frames.%"BUG_ASM_CONST"[bf_type], \"a\", %%progbits\n"    \
+    "   .p2align 2\n"                                                               \
+    ".Lfrm%=:\n"                                                                    \
+    "   .long (.Lbug%= - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_hi]\n"                 \
+    "   .long (%"BUG_ASM_CONST"[bf_ptr] - .Lfrm%=) + %"BUG_ASM_CONST"[bf_line_lo]\n"\
+    "   .if " #second_frame "\n"                                                    \
+    "   .long 0, %"BUG_ASM_CONST"[bf_msg] - .Lfrm%=\n"                              \
+    "   .endif\n"                                                                   \
+    "   .popsection\n"
+
+#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
+    [bf_type]    "i" (type),                                                 \
+    [bf_ptr]     "i" (ptr),                                                  \
+    [bf_msg]     "i" (msg),                                                  \
+    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
+                      << BUG_DISP_WIDTH),                                    \
+    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
+
+#endif /* _ASM_BUGFRAME_TEXT */
+
+#ifndef BUILD_BUG_ON_LINE_WIDTH
+#define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line))
+#endif
+
+#ifndef BUG_FRAME
+
+#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
+    BUILD_BUG_ON_LINE_WIDTH(line);                                           \
+    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
+    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
+                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
+} while ( false )
+
+#endif
+
+#ifndef run_in_exception_handler
+
+/*
+ * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
+ * and use a real static inline here to get proper type checking of fn().
+ */
+#define run_in_exception_handler(fn) do {                   \
+    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
+    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
+} while ( false )
+
+#endif /* run_in_exception_handler */
+
+#ifndef WARN
+#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
+#endif
+
+#ifndef BUG
+#define BUG() do {                                              \
+    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
+    unreachable();                                              \
+} while ( false )
+#endif
+
+#ifndef assert_failed
+#define assert_failed(msg) do {                                 \
+    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
+    unreachable();                                              \
+} while ( false )
+#endif
+
+#ifdef CONFIG_GENERIC_BUG_FRAME
+
+struct cpu_user_regs;
+
+/*
+ * Returns a negative value in case of an error otherwise
+ * BUGFRAME_{run_fn, warn, bug, assert}
+ */
+int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc);
+
+#endif /* CONFIG_GENERIC_BUG_FRAME */
+
+extern const struct bug_frame __start_bug_frames[],
+                              __stop_bug_frames_0[],
+                              __stop_bug_frames_1[],
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __XEN_BUG_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039C6BBABC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510152.787357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp2-00052T-60; Wed, 15 Mar 2023 17:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510152.787357; Wed, 15 Mar 2023 17:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp2-0004wK-2t; Wed, 15 Mar 2023 17:21:56 +0000
Received: by outflank-mailman (input) for mailman id 510152;
 Wed, 15 Mar 2023 17:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcUp0-0004sk-Rh
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:21:55 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e138a565-c355-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 18:21:53 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id ek18so47266261edb.6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 10:21:53 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 d20-20020a50cd54000000b004fd1ee3f723sm2736315edj.67.2023.03.15.10.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:21:52 -0700 (PDT)
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
X-Inumbo-ID: e138a565-c355-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678900913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY/rGMwCtIBPoX0Oz9SrutBs++A2oQlvoMf2SLu4vh0=;
        b=Ef8TkJ1xmmB9HfkscdNVfvxkN6QEIdHR9I/PAriCqxzKGr82CXrBYaHC2jEvNa08aG
         +5tiCOuzgwBs2XUUGFzM369wtBeAEIddzLYAJANxEH21RBatkCJomChQiO9mz8A4YxOP
         QTdJoAXMvRmN16DiMRqn/+sQ8Ug0QB5EhSi3VbOQuNuawXF6NwLI/SwLQ11xfbxZkJqO
         WOJLUNfCaN0bD4m4cRXaEJWbP+2YU8XKr6xTq78FgbotnTUbl6zAmND6d7nA/vnRBPyQ
         zRKLyTTUvGB6RP4rk3n6B8IIBzcoH8Zkwl2h6v+IT1NyL+e8MHyKWWwIIKa9XWwrshMr
         kxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zY/rGMwCtIBPoX0Oz9SrutBs++A2oQlvoMf2SLu4vh0=;
        b=RZB6fC2qZBA+ftz+BFF6w24Ytv1EGVhJUlmpU0ApZyzz8Gk7dDaerT9beuGvGedzx2
         FjFl8Cyle0qIuDNWRUhL4RAhhI11ZyqqmiH89yvflnW+StmCgq1eROoV3hqxjxiDb+mS
         v0mfw6szojCdia5N9BgbpnXqDR9UjjpEyz1soN/NnB6MZ1t3kn74zrRgq7G3dykCXLcV
         Ib0N1oLSZxmRdpAGcCpsGKnLy9wZAr1Tt9KrwWtkeWdE/4OnFKwQtOhMWahtr9JPeamL
         nBw2IOvx82UCTAJqxQDBcrEAWsHGHVlsTWcp0MuuEVE9fUF/yuRGxniZ/WLykvEkZ2+7
         ordg==
X-Gm-Message-State: AO0yUKWHsBrhJweYrvXWENO2ZONOOFyX8tuIjmjdyvaTRKIW4oRSSaZW
	q22WsIA5rTgQ7iKsWeHqxinhf7SifVg=
X-Google-Smtp-Source: AK7set/6l+lkfXvwSHFhXv+BUJE/CUAQXpabUPuGbTVNm4T/1bckvE+nkYPL0Z8BHSJDV5ChopCu5w==
X-Received: by 2002:a17:906:e206:b0:8b1:bab0:aa3d with SMTP id gf6-20020a170906e20600b008b1bab0aa3dmr7283987ejb.8.1678900913055;
        Wed, 15 Mar 2023 10:21:53 -0700 (PDT)
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
Subject: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Date: Wed, 15 Mar 2023 19:21:43 +0200
Message-Id: <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678900513.git.oleksii.kurochko@gmail.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
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
Changes in V8:
 * move  BUILD_BUG_ON_LINE_WIDTH(line) to "ifndef BUG_FRAME_STRUCT" and add #elif for
   "ifndef BUG_FRAME_STRUCT" to define stub for BUILD_BUG_ON_LINE_WIDTH.
 * move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix compilation issue
   ( more details in the changes to the patch [xen/x86: switch x86 to use generic
     implemetation of bug.h] ).
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
 xen/common/bug.c      | 108 ++++++++++++++++++++++++++++
 xen/include/xen/bug.h | 161 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 855c843113..3d2123a783 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -29,6 +29,9 @@ config ALTERNATIVE_CALL
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
index 0000000000..e86fba7713
--- /dev/null
+++ b/xen/common/bug.c
@@ -0,0 +1,108 @@
+#include <xen/bug.h>
+#include <xen/debugger.h>
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
+    unsigned int id, lineno;
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
index 0000000000..3409752342
--- /dev/null
+++ b/xen/include/xen/bug.h
@@ -0,0 +1,161 @@
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
+#define BUILD_BUG_ON_LINE_WIDTH(line) \
+    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
+
+#elif !defined(BUILD_BUG_ON_LINE_WIDTH)
+
+#define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)
+
+#endif /* BUG_FRAME_STRUCT */
+
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C769D185
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 17:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498236.769073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9Dy-0006n8-VE; Mon, 20 Feb 2023 16:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498236.769073; Mon, 20 Feb 2023 16:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9Dy-0006kw-SS; Mon, 20 Feb 2023 16:41:10 +0000
Received: by outflank-mailman (input) for mailman id 498236;
 Mon, 20 Feb 2023 16:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pU9Dx-0006Vi-20
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 16:41:09 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60147f3f-b13d-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 17:41:08 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id y44so1882976ljq.7
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 08:41:08 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2e6a08000000b002934d555783sm65798ljc.6.2023.02.20.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 08:41:07 -0800 (PST)
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
X-Inumbo-ID: 60147f3f-b13d-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRAP5KqQXYqAUnB17tHsxH6vdQ6lhjVqsW3lN6eZV4Y=;
        b=SYhVFq1KNWKNHzP99mNP54m4dLKi/BDsJP7iTrd+If6fwXFSvjeAGA1WSTw2cVXyXl
         pmuG9MGMnVXv+AaINVfCvOelfOf80k+gQo9rTy8ZZT7DZoeIRSanzTnoU+nwUQu6aScH
         DsuVSmq2YfmMXaM2/3V0H57Vg763TzoqJh7Ev5IIfu8zxbzDHentDVODxBmeOWp/7I6K
         +Eiw7VetcdAt4sY7L1AMqTMgG/L0n1Itm6puuiXcqZWAlR+i2zy0cbJkzlnDfJOz45+K
         ECQiENnnAJPpVMB98msRgRX/50b+em4jA7jiDK66Xa+I3mP6RmJkitj9JkwQLFfq/Ew+
         gy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRAP5KqQXYqAUnB17tHsxH6vdQ6lhjVqsW3lN6eZV4Y=;
        b=tumk9muWxEyMEeVniu/3M3I3nAjpNIG59aEdGdEoFk2wGkZJuxa64lnEbjhJ3sISy7
         OnhreChGSsNjLSukCpFe2rC6GCM1yuw4zYNafFvmfamLrO0BNmKwTXsPR4xpeSZYSCtM
         nADaY+Wxbs0v0q2NoYCOKB9pRRR2OP6qFE3TsdX+sJVHdHqq7DYQpdA5qU/xiu1wuEGK
         uCKeIAjeQ+wBGjtJUC3lkNdgovXprFuz970Gs3Yj3ByMkU5eXi2GDWMYLJ1W7zZrO4Wi
         SNQeLqpT6mwpPOWfZC9x54Fd2a7+/So7yTRgm/5AeMcV2EuYlcTazSXqnr/Tgz8rKxcl
         KJIw==
X-Gm-Message-State: AO0yUKUVwCdRON96L/H7UQoUHDF7c4u+e8WSArYwG9Jr6stneEyLCoAp
	2ftprHNRbYm1EnFNes0SgblMY+rk9Cc=
X-Google-Smtp-Source: AK7set9SWDvh2MqHKwEbdHQ91ctqf9v82DKc6GEWskqkDFUTB7n/ByGNtMv3bd0dVnQW0vANDstqAw==
X-Received: by 2002:a2e:9599:0:b0:290:6500:40f0 with SMTP id w25-20020a2e9599000000b00290650040f0mr696117ljh.42.1676911267595;
        Mon, 20 Feb 2023 08:41:07 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Date: Mon, 20 Feb 2023 18:40:57 +0200
Message-Id: <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1676909088.git.oleksii.kurochko@gmail.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A large part of the content of the bug.h is repeated among all
architectures, so it was decided to create a new config
CONFIG_GENERIC_BUG_FRAME.

The version of <bug.h> from x86 was taken as the base version.

The patch introduces the following stuff:
  * common bug.h header
  * generic implementation of do_bug_frame()
  * new config CONFIG_GENERIC_BUG_FRAME

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

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
 xen/common/bug.c      | 113 +++++++++++++++++++++++++++++
 xen/include/xen/bug.h | 161 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 278 insertions(+)
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
index 0000000000..5eab3ebb53
--- /dev/null
+++ b/xen/common/bug.c
@@ -0,0 +1,113 @@
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
+const struct bug_frame* find_bug_frame(unsigned long pc, unsigned int *id)
+{
+    const struct bug_frame *bug = NULL;
+    const struct virtual_region *region;
+
+    region = find_text_region(pc);
+    if ( region )
+    {
+        for ( *id = 0; *id < BUGFRAME_NR; (*id)++ )
+        {
+            const struct bug_frame *b;
+            unsigned int i;
+
+            for ( i = 0, b = region->frame[*id].bugs;
+                  i < region->frame[*id].n_bugs; b++, i++ )
+            {
+                if ( bug_loc(b) == pc )
+                {
+                    bug = b;
+                    goto found;
+                }
+            }
+        }
+    }
+
+ found:
+    return bug;
+}
+
+int handle_bug_frame(const struct cpu_user_regs *regs,
+                    const struct bug_frame *bug,
+                    unsigned int id)
+{
+    const char *prefix = "", *filename, *predicate;
+    unsigned long fixup;
+    unsigned int lineno;
+
+    if ( id == BUGFRAME_run_fn )
+    {
+#ifdef ARM        
+        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+#else
+        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
+#endif
+
+        fn(regs);
+        return 0;
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
+        return 0;
+
+    case BUGFRAME_bug:
+        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
+
+        show_execution_state(regs);
+        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+        if ( !is_kernel(predicate) )
+            predicate = "<unknown>";
+
+        printk("Assertion '%s' failed at %s%s:%d\n",
+               predicate, prefix, filename, lineno);
+
+        show_execution_state(regs);
+        panic("Assertion '%s' failed at %s%s:%d\n",
+              predicate, prefix, filename, lineno);
+    }
+
+    return -EINVAL;
+}
+
+int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)
+{
+    const struct bug_frame *bug = NULL;
+    unsigned int id;
+
+    bug = find_bug_frame(pc, &id);
+    if (!bug)
+        return -ENOENT;
+
+    return handle_bug_frame(regs, bug, id);
+}
+
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
new file mode 100644
index 0000000000..4aedebeb18
--- /dev/null
+++ b/xen/include/xen/bug.h
@@ -0,0 +1,161 @@
+#ifndef __XEN_BUG_H__
+#define __XEN_BUG_H__
+
+#define BUG_DISP_WIDTH    24
+#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
+#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
+
+#define BUGFRAME_run_fn 0
+#define BUGFRAME_warn   1
+#define BUGFRAME_bug    2
+#define BUGFRAME_assert 3
+
+#define BUGFRAME_NR     4
+
+#ifndef __ASSEMBLY__
+
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/stringify.h>
+#include <xen/types.h>
+
+#include <asm/bug.h>
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
+#endif /* BUG_FRAME_STRUCT */
+
+#ifndef bug_loc
+#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
+#endif /* bug_loc */
+
+#ifndef bug_ptr
+#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
+#endif /* bug_ptr */
+
+#ifndef bug_line
+#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
+                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
+                      BUG_LINE_LO_WIDTH) +                                   \
+                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
+                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
+#endif /* bug_line */
+
+#ifndef bug_msg
+#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
+#endif /* bug_msg */
+
+#ifndef _ASM_BUGFRAME_TEXT
+
+#define _ASM_BUGFRAME_TEXT(second_frame)                                    \
+    ".Lbug%=:"BUG_INSTR"\n"                                                 \
+    ".pushsection .bug_frames.%"MODIFIER"[bf_type], \"a\", @progbits\n"      \
+    ".p2align 2\n"                                                          \
+    ".Lfrm%=:\n"                                                            \
+    ".long (.Lbug%= - .Lfrm%=) + %"MODIFIER"[bf_line_hi]\n"                  \
+    ".long (%"MODIFIER"[bf_ptr] - .Lfrm%=) + %"MODIFIER"[bf_line_lo]\n"       \
+    ".if " #second_frame "\n"                                               \
+    ".long 0, %"MODIFIER"[bf_msg] - .Lfrm%=\n"                               \
+    ".endif\n"                                                              \
+    ".popsection\n"
+
+#endif /* _ASM_BUGFRAME_TEXT */
+
+#ifndef _ASM_BUGFRAME_INFO
+
+#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
+    [bf_type]    "i" (type),                                                 \
+    [bf_ptr]     "i" (ptr),                                                  \
+    [bf_msg]     "i" (msg),                                                  \
+    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
+                      << BUG_DISP_WIDTH),                                    \
+    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
+
+#endif /* _ASM_BUGFRAME_INFO */
+
+#ifndef BUG_FRAME
+
+#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
+    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH));         \
+    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
+    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
+                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
+} while (0)
+
+#endif
+
+#ifndef run_in_exception_handler
+
+/*
+ * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
+ * and use a real static inline here to get proper type checking of fn().
+ */
+#define run_in_exception_handler(fn)                            \
+    do {                                                        \
+        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
+        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
+    } while ( 0 )
+
+#endif /* run_in_exception_handler */
+
+#ifndef WARN
+#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
+#endif /* WARN */
+
+#ifndef BUG
+#define BUG() do {                                              \
+    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, NULL);      \
+    unreachable();                                              \
+} while (0)
+#endif
+
+#ifndef assert_failed
+#define assert_failed(msg) do {                                 \
+    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
+    unreachable();                                              \
+} while (0)
+#endif
+
+#ifdef CONFIG_GENERIC_BUG_FRAME
+
+struct cpu_user_regs;
+
+const struct bug_frame* find_bug_frame(unsigned long pc, unsigned int *id);
+
+int handle_bug_frame(const struct cpu_user_regs *regs,
+                    const struct bug_frame *bug,
+                    unsigned int id);
+
+int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
+
+#endif /* CONFIG_GENERIC_BUG_FRAME */
+
+extern const struct bug_frame __start_bug_frames[],
+                              __stop_bug_frames_0[],
+                              __stop_bug_frames_1[],
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
+
+#else /* !__ASSEMBLY__ */
+
+#include <asm/bug.h>
+
+#endif /* __ASSEMBLY__ */
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
2.39.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC9689FEF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 18:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489261.757617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVf-0002jT-Fu; Fri, 03 Feb 2023 17:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489261.757617; Fri, 03 Feb 2023 17:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVf-0002be-A2; Fri, 03 Feb 2023 17:05:59 +0000
Received: by outflank-mailman (input) for mailman id 489261;
 Fri, 03 Feb 2023 17:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulaf=57=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pNzVd-0002ZN-Q5
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 17:05:57 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0663cefd-a3e5-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 18:05:57 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id m14so5202688wrg.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 09:05:57 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.104.21.nat.umts.dynamic.t-mobile.pl. [46.204.104.21])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b002bfe266d710sm2452191wrt.90.2023.02.03.09.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:05:55 -0800 (PST)
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
X-Inumbo-ID: 0663cefd-a3e5-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+ff1E7mX9WhYpbpoBrQzNoWKjRBFV88fd7wUihi2Qc=;
        b=fyMBwyuNo6g5Xnun+n9KPuzqpdI1HAlf+fhuLWm3WTQydKG+afSiJrUXVMDZHwdYIr
         S7Acw7HKIRvBgnbOwJLI/CO5PLIynKjHJGCiE98g6M2yIcvzfZXDxjJIT1A970G2WepJ
         QIpfwg6O3kEpPv4WOZk3A34Pt2CL24cTe4XlgYDJVLVKGifEmdctHXNFYjXHlvvKyw8E
         BdcdVpFO1b2n/gUXA2Lcicd9fU6ff1DLuso4qC2fUk1dKaRhzH/CESeUBbuD6AmprLEs
         2L2mcQmQ+1pkp2poTTuMgcuhF3TEjVffWV3YVvQQlqZrWTFwbsYj3lDcHfOyUk7XsSn1
         uP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+ff1E7mX9WhYpbpoBrQzNoWKjRBFV88fd7wUihi2Qc=;
        b=BE8k9W2C3h9zFbjXabjbr+kyO85vfEdrR2cW6GGY58F/dUQKkXOR2c5eu1cL4j6UvD
         /d+OoTIkmmSrFXnOvt2qW2Zg7G14uCTW7hEw/0tf1Z1I21qcHzQTRfNytYHOs70jSCOR
         aIwxJY2SFtYGhR+NGpIpqC1iO7xob1+bEgQ95Lkjnoe23x/I97PYFtxPWXMlo7xCWTxh
         zZHzNj424jMpqyRVwADHiQGROuPETd2wdzP0+ZbcnQcPsu9XH1UcIai4ZyfmynnkeA33
         ssQYuPV/NGr/VZteXAJGgPpV1B0jKQYj04DQI2fsaZMW5tGRRq9Ac0AvH4NdRUFCRrsL
         B//g==
X-Gm-Message-State: AO0yUKXHpgJEopsDa4UEw2J8r9jrs5XHrDHMPmH3e3oaR3tYGeVjVFvS
	PLQLOzTlmfp7RDj+N3Msp4WDBaagtgo=
X-Google-Smtp-Source: AK7set9hy80yhziTOn3wgFU9CUlgc0skleSvABzW0WPwWlOlvBXOlcTunEo+b4Kwx8atuTza5zwJzg==
X-Received: by 2002:a5d:4d47:0:b0:2bf:de97:f3f8 with SMTP id a7-20020a5d4d47000000b002bfde97f3f8mr9230469wru.28.1675443956225;
        Fri, 03 Feb 2023 09:05:56 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Date: Fri,  3 Feb 2023 19:05:47 +0200
Message-Id: <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675441720.git.oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A large part of the content of the bug.h is repeated among all
architectures, so it was decided to create a new config
CONFIG_GENERIC_BUG_FRAME.

The version of <bug.h> from ARM was taken as the base version,
as it looks the most portable.

The patch introduces the following stuff:
  * common bug.h header
  * generic implementation of do_bug_frame()
  * new config CONFIG_GENERIC_BUG_FRAME

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/common/Kconfig    |   6 ++
 xen/common/Makefile   |   1 +
 xen/common/bug.c      |  88 +++++++++++++++++++++++++++++
 xen/include/xen/bug.h | 127 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 222 insertions(+)
 create mode 100644 xen/common/bug.c
 create mode 100644 xen/include/xen/bug.h

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8..811b4eaf3b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -92,6 +92,12 @@ config STATIC_MEMORY
 
 	  If unsure, say N.
 
+config GENERIC_DO_BUG_FRAME
+	bool
+	help
+	  Generic do_bug_frame() function is needed to handle the type of bug
+	  frame and print an information about it.
+
 menu "Speculative hardening"
 
 config INDIRECT_THUNK
diff --git a/xen/common/Makefile b/xen/common/Makefile
index bbd75b4be6..7d04c8d3b2 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
+obj-$(CONFIG_GENERIC_DO_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
diff --git a/xen/common/bug.c b/xen/common/bug.c
new file mode 100644
index 0000000000..393e58d571
--- /dev/null
+++ b/xen/common/bug.c
@@ -0,0 +1,88 @@
+#include <xen/bug.h>
+#include <xen/errno.h>
+#include <xen/types.h>
+#include <xen/kernel.h>
+#include <xen/string.h>
+#include <xen/virtual_region.h>
+
+#include <asm/processor.h>
+
+int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
+{
+    const struct bug_frame *bug = NULL;
+    const char *prefix = "", *filename, *predicate;
+    unsigned long fixup;
+    int id = -1, lineno;
+    const struct virtual_region *region;
+
+    region = find_text_region(pc);
+    if ( region )
+    {
+        for ( id = 0; id < BUGFRAME_NR; id++ )
+        {
+            const struct bug_frame *b;
+            unsigned int i;
+
+            for ( i = 0, b = region->frame[id].bugs;
+                  i < region->frame[id].n_bugs; b++, i++ )
+            {
+                if ( ((vaddr_t)bug_loc(b)) == pc )
+                {
+                    bug = b;
+                    goto found;
+                }
+            }
+        }
+    }
+ found:
+    if ( !bug )
+        return -ENOENT;
+
+    if ( id == BUGFRAME_run_fn )
+    {
+        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+
+        fn(regs);
+        return 0;
+    }
+
+    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
+    filename = bug_file(bug);
+    if ( !is_kernel(filename) )
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
+        show_execution_state(regs);
+        panic("Assertion '%s' failed at %s%s:%d\n",
+              predicate, prefix, filename, lineno);
+    }
+
+    return -EINVAL;
+}
+
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
new file mode 100644
index 0000000000..b46dae035e
--- /dev/null
+++ b/xen/include/xen/bug.h
@@ -0,0 +1,127 @@
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
+#include <xen/stringify.h>
+#include <xen/types.h>
+#include <xen/lib.h>
+
+#include <asm/bug.h>
+
+#ifndef BUG_FRAME_STUFF
+struct bug_frame {
+    signed int loc_disp;    /* Relative address to the bug address */
+    signed int file_disp;   /* Relative address to the filename */
+    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
+    uint16_t line;          /* Line number */
+    uint32_t pad0:16;       /* Padding for 8-bytes align */
+};
+
+#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
+#define bug_file(b) ((const void *)(b) + (b)->file_disp);
+#define bug_line(b) ((b)->line)
+#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
+#endif /* BUG_FRAME_STUFF */
+
+#ifndef BUG_FRAME
+/* Many versions of GCC doesn't support the asm %c parameter which would
+ * be preferable to this unpleasantness. We use mergeable string
+ * sections to avoid multiple copies of the string appearing in the
+ * Xen image. BUGFRAME_run_fn needs to be handled separately.
+ */
+#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
+    BUILD_BUG_ON((line) >> 16);                                             \
+    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
+    asm ("1:"BUG_INSTR"\n"                                                  \
+         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
+         "2:\t.asciz " __stringify(file) "\n"                               \
+         "3:\n"                                                             \
+         ".if " #has_msg "\n"                                               \
+         "\t.asciz " #msg "\n"                                              \
+         ".endif\n"                                                         \
+         ".popsection\n"                                                    \
+         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
+         "4:\n"                                                             \
+         ".p2align 2\n"                                                     \
+         ".long (1b - 4b)\n"                                                \
+         ".long (2b - 4b)\n"                                                \
+         ".long (3b - 4b)\n"                                                \
+         ".hword " __stringify(line) ", 0\n"                                \
+         ".popsection");                                                    \
+} while (0)
+#endif /* BUG_FRAME */
+
+#ifndef run_in_exception_handler
+/*
+ * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
+ * flag but instead rely on the default value from the compiler). So the
+ * easiest way to implement run_in_exception_handler() is to pass the to
+ * be called function in a fixed register.
+ */
+#define  run_in_exception_handler(fn) do {                                  \
+    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);                 \
+    asm ("1:"BUG_INSTR"\n"                                                  \
+         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
+         "             \"a\", %%progbits\n"                                 \
+         "2:\n"                                                             \
+         ".p2align 2\n"                                                     \
+         ".long (1b - 2b)\n"                                                \
+         ".long 0, 0, 0\n"                                                  \
+         ".popsection" :: "r" (fn_));                                       \
+} while (0)
+#endif /* run_in_exception_handler */
+
+#ifndef WARN
+#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
+#endif /* WARN */
+
+#ifndef BUG
+#define BUG() do {                                              \
+    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
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
+extern const struct bug_frame __start_bug_frames[],
+                              __stop_bug_frames_0[],
+                              __stop_bug_frames_1[],
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
+
+#else /* !__ASSEMBLY__ */
+
+#ifdef CONFIG_X86
+#include <asm/bug.h>
+#endif
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



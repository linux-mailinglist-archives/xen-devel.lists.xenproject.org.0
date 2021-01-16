Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6C2F8CD3
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 11:34:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68968.123639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0iu4-00060M-Cw; Sat, 16 Jan 2021 10:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68968.123639; Sat, 16 Jan 2021 10:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0iu4-0005zf-8z; Sat, 16 Jan 2021 10:33:56 +0000
Received: by outflank-mailman (input) for mailman id 68968;
 Sat, 16 Jan 2021 10:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=czoR=GT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0iu3-0005tA-1c
 for xen-devel@lists.xenproject.org; Sat, 16 Jan 2021 10:33:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad9e1843-02ac-45c6-83c8-a64b5fda3e87;
 Sat, 16 Jan 2021 10:33:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6FDBAA6F;
 Sat, 16 Jan 2021 10:33:42 +0000 (UTC)
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
X-Inumbo-ID: ad9e1843-02ac-45c6-83c8-a64b5fda3e87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610793222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zAaEKFd+UVmLUtUOB8vH8lgK68eWLXdf9gU5ZOXZ0o4=;
	b=YfzZXFP3iO2354hjepjAZB7ySUlQ6AmhcT3LRpS2eHVTwDFIC5XDFuRvJmSbvbYdrDAIR/
	ZEG4XvGZSpuDtgOvnijWzh5jjse6NBsVm3tFisVbuNCa3eiI7yXms3teY4La9L1A8FLWIw
	hM+WTtCSzUUNjxwi6fReMhM3BvGtqOo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 1/3] xen/arm: add support for run_in_exception_handler()
Date: Sat, 16 Jan 2021 11:33:37 +0100
Message-Id: <20210116103339.21708-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210116103339.21708-1-jgross@suse.com>
References: <20210116103339.21708-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to run a function in an exception handler for Arm. Do it
as on x86 via a bug_frame, but pass the function pointer via a
register (this needs to be done that way, because inline asm support
for 32-bit Arm lacks the needed functionality to reference an
arbitrary function via the bugframe).

Use the same BUGFRAME_* #defines as on x86 in order to make a future
common header file more easily achievable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V4:
- new patch

V5:
- adjust BUG_FRAME() macro (Jan Beulich)
- adjust arm linker script (Jan Beulich)
- drop #ifdef x86 in common/virtual_region.c

V6:
- use register for function address (Arm32 build failure noticed by
  Julien Grall)
---
 xen/arch/arm/traps.c            |  8 ++++++++
 xen/arch/arm/xen.lds.S          |  2 ++
 xen/common/virtual_region.c     |  2 --
 xen/include/asm-arm/arm32/bug.h |  2 ++
 xen/include/asm-arm/arm64/bug.h |  2 ++
 xen/include/asm-arm/bug.h       | 31 +++++++++++++++++++++++++------
 6 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 1af1bb9f1b..d0df33b218 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1236,6 +1236,14 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
     if ( !bug )
         return -ENOENT;
 
+    if ( id == BUGFRAME_run_fn )
+    {
+        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
+
+        fn(regs);
+        return 0;
+    }
+
     /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
     filename = bug_file(bug);
     if ( !is_kernel(filename) )
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 6342ac4ead..004b182acb 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -49,6 +49,8 @@ SECTIONS
        __stop_bug_frames_1 = .;
        *(.bug_frames.2)
        __stop_bug_frames_2 = .;
+       *(.bug_frames.3)
+       __stop_bug_frames_3 = .;
        *(.rodata)
        *(.rodata.*)
        *(.data.rel.ro)
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 4fbc02e35a..30b0b4ab9c 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -123,9 +123,7 @@ void __init setup_virtual_regions(const struct exception_table_entry *start,
         __stop_bug_frames_0,
         __stop_bug_frames_1,
         __stop_bug_frames_2,
-#ifdef CONFIG_X86
         __stop_bug_frames_3,
-#endif
         NULL
     };
 
diff --git a/xen/include/asm-arm/arm32/bug.h b/xen/include/asm-arm/arm32/bug.h
index 3e66f35969..25cce151dc 100644
--- a/xen/include/asm-arm/arm32/bug.h
+++ b/xen/include/asm-arm/arm32/bug.h
@@ -10,4 +10,6 @@
 
 #define BUG_INSTR ".word " __stringify(BUG_OPCODE)
 
+#define BUG_FN_REG r0
+
 #endif /* __ARM_ARM32_BUG_H__ */
diff --git a/xen/include/asm-arm/arm64/bug.h b/xen/include/asm-arm/arm64/bug.h
index 59f664d7de..5e11c0dfd5 100644
--- a/xen/include/asm-arm/arm64/bug.h
+++ b/xen/include/asm-arm/arm64/bug.h
@@ -6,4 +6,6 @@
 
 #define BUG_INSTR "brk " __stringify(BRK_BUG_FRAME_IMM)
 
+#define BUG_FN_REG x0
+
 #endif /* __ARM_ARM64_BUG_H__ */
diff --git a/xen/include/asm-arm/bug.h b/xen/include/asm-arm/bug.h
index 36c803357c..e9341daef1 100644
--- a/xen/include/asm-arm/bug.h
+++ b/xen/include/asm-arm/bug.h
@@ -26,16 +26,17 @@ struct bug_frame {
 #define bug_line(b) ((b)->line)
 #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
 
-#define BUGFRAME_warn   0
-#define BUGFRAME_bug    1
-#define BUGFRAME_assert 2
+#define BUGFRAME_run_fn 0
+#define BUGFRAME_warn   1
+#define BUGFRAME_bug    2
+#define BUGFRAME_assert 3
 
-#define BUGFRAME_NR     3
+#define BUGFRAME_NR     4
 
 /* Many versions of GCC doesn't support the asm %c parameter which would
  * be preferable to this unpleasantness. We use mergeable string
  * sections to avoid multiple copies of the string appearing in the
- * Xen image.
+ * Xen image. BUGFRAME_run_fn needs to be handled separately.
  */
 #define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
     BUILD_BUG_ON((line) >> 16);                                             \
@@ -58,6 +59,23 @@ struct bug_frame {
          ".popsection");                                                    \
 } while (0)
 
+/*
+ * Unfortunately gcc for arm 32-bit doesn't support the "i" constraint, so
+ * the easiest way to implement run_in_exception_handler() is to pass the
+ * to be called function in a fixed register.
+ */
+#define  run_in_exception_handler(fn) do {                                  \
+    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
+         "1:"BUG_INSTR"\n"                                                  \
+         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
+         "             \"a\", %%progbits\n"                                 \
+         "2:\n"                                                             \
+         ".p2align 2\n"                                                     \
+         ".long (1b - 2b)\n"                                                \
+         ".long 0, 0, 0\n"                                                  \
+         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
+} while (0)
+
 #define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
 
 #define BUG() do {                                              \
@@ -73,7 +91,8 @@ struct bug_frame {
 extern const struct bug_frame __start_bug_frames[],
                               __stop_bug_frames_0[],
                               __stop_bug_frames_1[],
-                              __stop_bug_frames_2[];
+                              __stop_bug_frames_2[],
+                              __stop_bug_frames_3[];
 
 #endif /* __ARM_BUG_H__ */
 /*
-- 
2.26.2



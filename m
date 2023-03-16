Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504F76BD289
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510653.788771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcole-0008BF-4y; Thu, 16 Mar 2023 14:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510653.788771; Thu, 16 Mar 2023 14:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcold-00085y-W1; Thu, 16 Mar 2023 14:39:46 +0000
Received: by outflank-mailman (input) for mailman id 510653;
 Thu, 16 Mar 2023 14:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolc-0006WA-26
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:44 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c912cb-c408-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 15:39:43 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id r11so8604768edd.5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:43 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:42 -0700 (PDT)
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
X-Inumbo-ID: 63c912cb-c408-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7oCfkecOQ2j8RepZ+CNQJX2PvriCtlq7k5FrgLtuck=;
        b=ReeUJVL8vnLrnkGDEYCiEAvmh2/kVs6V6fBk3Cao+CH5kHEuDwfI1oiab9Px+Owjtn
         ipCS/XESu7EKCBflzL8xyII5DBsiQ8/9aMXyFCob+UrVT84rGzbebryKQB4Isty34Ym4
         U4HClM8HwrvJBw1DzqYA9LbQoLocSItziAcEjK+Ad2nOQdMvnr1MkMPmN7ukAG37uyJO
         OBtT/9UTldewNl/nFSmgu4TQB5w/Ab4hrUCVDnDMKlbZ7eV4z6j2hIpziyhu9oI7LsEq
         OU/LGWI3uRHxc3h3K4RlOvLMUKFlXQn9GbejX6pTYUADiKI8KgHL+fsyYvRX3gfbt3XJ
         rcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7oCfkecOQ2j8RepZ+CNQJX2PvriCtlq7k5FrgLtuck=;
        b=7KqNYB/SenSwcbQe3WM3+YGQbc5OnlWc3Bn5mIQRmZ5PmB1JoOmVZEpY6CokrLHD9H
         /AnJpEXN6fRfbPviJSfF5T+LA9hEhKE1/GRiY6pOhrVq8LqVdTsjgpMHQQEILgiwp2MP
         fPfdatl00SSxNo06dkfn/ZodthBb63wHNbUWAm3eqkV4df0XPY4fB/9Eppyuea79Ug3O
         245QUmi/asWEC5CCIX1Zy/3GcLi9Ep5JjAzcB0evouy3//Acb/M9reTwwyMYnKzoGUuY
         Q6RY97YFNwBswAK0mFL7zisFyVBTSxiq3J4MY/rI2AS2YLF56NM7lZu+foxxBv8z1PP4
         BLpQ==
X-Gm-Message-State: AO0yUKX5+hC+IuXtX4Yit7i5Dw2T2hQ2Srg2sd8Yi60QXzaeDrM8TMKG
	vdAWWtWJJPbUGKgEm++74xchcW8WXGqHvw==
X-Google-Smtp-Source: AK7set+q1LnSNVGK3HLixY3bvOEyRMc7E0nYtEaG8ouEXoSfiSM/qCUkTuNzaUhLt52K7viCbzpyRA==
X-Received: by 2002:a17:906:5a95:b0:7e0:eed0:8beb with SMTP id l21-20020a1709065a9500b007e0eed08bebmr10305130ejq.41.1678977582626;
        Thu, 16 Mar 2023 07:39:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 6/7] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Thu, 16 Mar 2023 16:39:28 +0200
Message-Id: <67807e242d3e12f1080956eea052285cb67a7dbf.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces macros: BUG(), WARN(), run_in_exception(),
assert_failed.
To be precise, the macros from generic bug implementation (<xen/bug.h>)
will be used.

The implementation uses "ebreak" instruction in combination with
diffrent bug frame tables (for each type) which contains useful
information.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
  - Remove "#include <xen/types.h>" from <asm/bug.h> as there is no any need in it anymore
  - Update macros GET_INSN_LENGTH: remove UL and 'unsigned int len;' from it
  - Remove " include <xen/bug.h>" from risc/setup.c. it is not needed in the current version of
    the patch
  - change an argument type from vaddr_t to uint32_t for is_valid_bugaddr and introduce read_instr() to
    read instruction properly as the length of qinstruction can be either 32 or 16 bits.
  - Code style fixes
  - update the comments before do_bug_frame() in riscv/trap.c
  - Refactor is_valid_bugaddr() function.
  - introduce macros cast_to_bug_frame(addr) to hide casts.
  - use LINK_TO_LOAD() for addresses which are linker time relative.
---
Changes in V4:
  - Updates in RISC-V's <asm/bug.h>:
    * Add explanatory comment about why there is only defined for 32-bits length
      instructions and 16/32-bits BUG_INSN_{16,32}.
    * Change 'unsigned long' to 'unsigned int' inside GET_INSN_LENGTH().
    * Update declaration of is_valid_bugaddr(): switch return type from int to bool
      and the argument from 'unsigned int' to 'vaddr'.
  - Updates in RISC-V's traps.c:
    * replace /xen and /asm includes 
    * update definition of is_valid_bugaddr():switch return type from int to bool
      and the argument from 'unsigned int' to 'vaddr'. Code style inside function
      was updated too.
    * do_bug_frame() refactoring:
      * local variables start and bug became 'const struct bug_frame'
      * bug_frames[] array became 'static const struct bug_frame[] = ...'
      * remove all casts
      * remove unneeded comments and add an explanatory comment that the do_bug_frame()
        will be switched to a generic one.
    * do_trap() refactoring:
      * read 16-bits value instead of 32-bits as compressed instruction can
        be used and it might happen than only 16-bits may be accessible.
      * code style updates
      * re-use instr variable instead of re-reading instruction.
  - Updates in setup.c:
    * add blank line between xen/ and asm/ includes.
---
Changes in V3:
  - Rebase the patch "xen/riscv: introduce an implementation of macros
    from <asm/bug.h>" on top of patch series [introduce generic implementation
    of macros from bug.h]
---
Changes in V2:
  - Remove __ in define namings
  - Update run_in_exception_handler() with
    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
  - Remove bug_instr_t type and change it's usage to uint32_t
---
 xen/arch/riscv/include/asm/bug.h       |  28 +++++
 xen/arch/riscv/include/asm/processor.h |   2 +
 xen/arch/riscv/traps.c                 | 139 +++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S               |  10 ++
 4 files changed, 179 insertions(+)

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index e8b1e40823..bf3194443f 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -7,4 +7,32 @@
 #ifndef _ASM_RISCV_BUG_H
 #define _ASM_RISCV_BUG_H
 
+#ifndef __ASSEMBLY__
+
+#define BUG_INSTR "ebreak"
+
+/*
+ * The base instruction set has a fixed length of 32-bit naturally aligned
+ * instructions.
+ *
+ * There are extensions of variable length ( where each instruction can be
+ * any number of 16-bit parcels in length ) but they aren't used in Xen
+ * and Linux kernel ( where these definitions were taken from ).
+ *
+ * Compressed ISA is used now where the instruction length is 16 bit  and
+ * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
+ * depending on if compressed ISA is used or not )
+ */
+#define INSN_LENGTH_MASK        _UL(0x3)
+#define INSN_LENGTH_32          _UL(0x3)
+
+#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
+#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
+#define COMPRESSED_INSN_MASK    _UL(0xffff)
+
+#define GET_INSN_LENGTH(insn)                               \
+    (((insn) & INSN_LENGTH_MASK) == INSN_LENGTH_32 ? 4 : 2) \
+
+#endif /* !__ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_BUG_H */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index a71448e02e..ef23d9589e 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -69,6 +69,8 @@ static inline void die(void)
         wfi();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 581f34efbc..2afcabb912 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,8 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
 
 #include <asm/boot-info.h>
@@ -13,6 +15,10 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+#define cast_to_bug_frame(addr) \
+    (const struct bug_frame *)(LINK_TO_LOAD((char *)addr))
+
+
 void trap_init(void)
 {
     unsigned long addr = (unsigned long)&handle_trap;
@@ -99,7 +105,140 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    early_printk("implement show_execution_state(regs)\n");
+}
+
+/*
+ * TODO: change early_printk's function to early_printk with format
+ *       when s(n)printf() will be added.
+ *
+ * Probably the TODO won't be needed as generic do_bug_frame()
+ * has been introduced and current implementation will be replaced
+ * with generic one when panic(), printk() and find_text_region()
+ * (virtual memory?) will be ready/merged
+ */
+int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
+{
+    const struct bug_frame *start, *end;
+    const struct bug_frame *bug = NULL;
+    unsigned int id = 0;
+    const char *filename, *predicate;
+    int lineno;
+
+    static const struct bug_frame* bug_frames[] = {
+        &__start_bug_frames[0],
+        &__stop_bug_frames_0[0],
+        &__stop_bug_frames_1[0],
+        &__stop_bug_frames_2[0],
+        &__stop_bug_frames_3[0],
+    };
+
+    for ( id = 0; id < BUGFRAME_NR; id++ )
+    {
+        start = cast_to_bug_frame(bug_frames[id]);
+        end   = cast_to_bug_frame(bug_frames[id + 1]);
+
+        while ( start != end )
+        {
+            if ( (vaddr_t)bug_loc(start) == pc )
+            {
+                bug = start;
+                goto found;
+            }
+
+            start++;
+        }
+    }
+
+ found:
+    if ( bug == NULL )
+        return -ENOENT;
+
+    if ( id == BUGFRAME_run_fn )
+    {
+        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
+
+        fn(regs);
+
+        goto end;
+    }
+
+    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
+    filename = bug_ptr(bug);
+    lineno = bug_line(bug);
+
+    switch ( id )
+    {
+    case BUGFRAME_warn:
+        early_printk("Xen WARN at ");
+        early_printk(filename);
+        early_printk("\n");
+
+        show_execution_state(regs);
+
+        goto end;
+
+    case BUGFRAME_bug:
+        early_printk("Xen BUG at ");
+        early_printk(filename);
+        early_printk("\n");
+
+        show_execution_state(regs);
+        early_printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+
+        early_printk("Assertion \'");
+        early_printk(predicate);
+        early_printk("\' failed at ");
+        early_printk(filename);
+        early_printk("\n");
+
+        show_execution_state(regs);
+        early_printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+    }
+
+    return -EINVAL;
+
+ end:
+    return 0;
+}
+
+static bool is_valid_bugaddr(uint32_t insn)
+{
+    return insn == BUG_INSN_32 ||
+           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
+}
+
+static uint32_t read_instr(unsigned long pc)
+{
+    uint16_t instr16 = *(uint16_t *)pc;
+
+    if ( GET_INSN_LENGTH(instr16) == 2 )
+        return (uint32_t)instr16;
+    else
+        return *(uint32_t *)pc;
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint32_t instr = read_instr(pc);
+
+    if ( is_valid_bugaddr(instr) )
+    {
+        if ( !do_bug_frame(cpu_regs, pc) )
+        {
+            cpu_regs->sepc += GET_INSN_LENGTH(instr);
+            return;
+        }
+    }
+
     do_unexpected_trap(cpu_regs);
 }
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index f299ea8422..eed457c492 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -40,6 +40,16 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata = .;          /* Read-only data */
+        /* Bug frames table */
+       __start_bug_frames = .;
+       *(.bug_frames.0)
+       __stop_bug_frames_0 = .;
+       *(.bug_frames.1)
+       __stop_bug_frames_1 = .;
+       *(.bug_frames.2)
+       __stop_bug_frames_2 = .;
+       *(.bug_frames.3)
+       __stop_bug_frames_3 = .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
-- 
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1803779202
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582539.912361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTGY-0008Ci-Gd; Fri, 11 Aug 2023 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582539.912361; Fri, 11 Aug 2023 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTGY-00088x-CU; Fri, 11 Aug 2023 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 582539;
 Fri, 11 Aug 2023 14:37:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUTCJ-00049h-WA
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:33:04 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ca3bd4-3853-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 16:33:02 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so3719472e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 07:33:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004fe07f06337sm753453lfn.53.2023.08.11.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:33:00 -0700 (PDT)
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
X-Inumbo-ID: f9ca3bd4-3853-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764381; x=1692369181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxemZPSrKphIU1DOnZWltN7srrgDFj6wafS5aBn4TaY=;
        b=RledqS7a4a44XsG7EKTMY24d/SDPhktwyck2xu6KGzJ7wyApw2dfUkQd7Kryd3TO1/
         a5TgrjPSpWXNbIEhgiP1MnemhYvo/Lr102dhbYyr9A6jTFWPOHyuRdA584aSCTQeEO1S
         1MQiQeqq0GFpRj/dpFRe7uVBzXr0aVrIQYwmpfMTu/quwxag+61u6TDRZXrmLEhLJ/4I
         n4hVXqoug9eVGd6w20vIrfK4eroSNCicM04l5OCxpWrUD+EamEGvlA0JrpZaTFHCcUc7
         C9Kfnct8VHop8wCVc69ObTkBuNfHeafbAXIxFe6eFzyLKYAj3i5DaE399QspFyDppNnq
         qCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764381; x=1692369181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxemZPSrKphIU1DOnZWltN7srrgDFj6wafS5aBn4TaY=;
        b=ft+g4b0aH+l074sNllTs/DVG/2admK8Pt3eGu3PhEIsAblkj/wP5AWaZwFs3TI7xX0
         RMxMeelta3TfHaU01FiRlTp34ZuB6DSTdOL6EQqXjRhwlFUI8YrVjAOHR+Y/hdlE5bLF
         uuuHUz5XCFqifj1crin61aviR04x/xEDkN6jKyACQOsRIz4rhGF4v/9MMKFEcuu3/3U4
         shE2+8MMUip7Sv2ySkxAny2UGKgLlD92djRXA7/uVHLx9U7oDwXl/xvAs10m9s6ApRTy
         GX3KhcqlfTE2d/tWieNlb/mxz6E7CWZs+WR07AS6hT9LSse33EoGDmMgFmVBX47+ccT3
         m7wg==
X-Gm-Message-State: AOJu0Yy4GMyHxyPDIVPOt+uBiv9qJ8A1Q8LQVysvunc9dN50Csy4YVX9
	oVKCEDa9k1zB7Bk1QlIr/rTq98zotSw=
X-Google-Smtp-Source: AGHT+IFdYvM9CDX0s6tuokZtE3ADXkxDijqkkbycTjKUe2GpoqCgYMO++xnf4wBPtEU2jr/fZOk7aA==
X-Received: by 2002:a05:6512:3d8b:b0:4fd:d226:adcc with SMTP id k11-20020a0565123d8b00b004fdd226adccmr2129948lfv.21.1691764380992;
        Fri, 11 Aug 2023 07:33:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 5/6] xen/riscv: implement do_bug_frame()
Date: Fri, 11 Aug 2023 17:32:54 +0300
Message-ID: <bb1ebda319fc6f74456306a4051dd6da721bb797.1691763757.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces the temporary implementation of do_bug_frame().
When common code is merged, CONFIG_GENERIC_BUG_FRAME should
be used instead.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
  - remove Pointless initializer of id.
  - make bug_frames[] array constant.
  - remove cast_to_bug_frame(addr).
  - rename is_valig_bugaddr to is_valid_bug_insn().
  - add check that read_instr is used only on xen code
  - update the commit message.
---
Changes in V7:
 - move to this patch the definition of cast_to_bug_frame() from the previous patch.
 - update the comment in bug.h.
 - update the comment above do_bug_frame().
 - fix code style.
 - add comment to read_instr func.
 - add space for bug_frames in lds.S. 
---
Changes in V6:
  - Avoid LINK_TO_LOAD() as bug.h functionality expected to be used
    after MMU is enabled.
  - Change early_printk() to printk()
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
 xen/arch/riscv/traps.c   | 138 +++++++++++++++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S |  10 +++
 2 files changed, 148 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index c1175668b6..b096dce6c7 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,8 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
 
 #include <asm/csr.h>
@@ -101,7 +103,143 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
 }
 
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    printk("implement show_execution_state(regs)\n");
+}
+
+/*
+ * TODO: generic do_bug_frame() should be used instead of current
+ * implementation panic(), printk() and find_text_region()
+ * (virtual memory?) will be ready/merged
+ */
+int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
+{
+    const struct bug_frame *start, *end;
+    const struct bug_frame *bug = NULL;
+    unsigned int id;
+    const char *filename, *predicate;
+    int lineno;
+
+    static const struct bug_frame * const bug_frames[] = {
+        &__start_bug_frames[0],
+        &__stop_bug_frames_0[0],
+        &__stop_bug_frames_1[0],
+        &__stop_bug_frames_2[0],
+        &__stop_bug_frames_3[0],
+    };
+
+    for ( id = 0; id < BUGFRAME_NR; id++ )
+    {
+        start = bug_frames[id];
+        end   = bug_frames[id + 1];
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
+        printk("Xen WARN at %s:%d\n", filename, lineno);
+
+        show_execution_state(regs);
+
+        goto end;
+
+    case BUGFRAME_bug:
+        printk("Xen BUG at %s:%d\n", filename, lineno);
+
+        show_execution_state(regs);
+
+        printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+
+    case BUGFRAME_assert:
+        /* ASSERT: decode the predicate string pointer. */
+        predicate = bug_msg(bug);
+
+        printk("Assertion %s failed at %s:%d\n", predicate, filename, lineno);
+
+        show_execution_state(regs);
+
+        printk("change wait_for_interrupt to panic() when common is available\n");
+        die();
+    }
+
+    return -EINVAL;
+
+ end:
+    return 0;
+}
+
+static bool is_valid_bug_insn(uint32_t insn)
+{
+    return insn == BUG_INSN_32 ||
+           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
+}
+
+/* There are no guests for now so  the func has to return alwasys false */
+static inline bool guest_mode(void)
+{
+    return false;
+}
+
+/* Should be used only on Xen code */
+static uint32_t read_instr(unsigned long pc)
+{
+    uint16_t instr16 = *(uint16_t *)pc;
+
+    if ( guest_mode() )
+    {
+        printk("%s should be called only on Xen code\n", __func__);
+        die();
+    }
+
+    if ( GET_INSN_LENGTH(instr16) == 2 )
+        return instr16;
+    else
+        return *(uint32_t *)pc;
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint32_t instr = read_instr(pc);
+
+    if ( is_valid_bug_insn(instr) )
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
index 3fa7db3bf9..a10e0ad87c 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -45,6 +45,16 @@ SECTIONS
     . = ALIGN(PAGE_SIZE);
     .rodata : {
         _srodata = .;          /* Read-only data */
+        /* Bug frames table */
+        __start_bug_frames = .;
+        *(.bug_frames.0)
+        __stop_bug_frames_0 = .;
+        *(.bug_frames.1)
+        __stop_bug_frames_1 = .;
+        *(.bug_frames.2)
+        __stop_bug_frames_2 = .;
+        *(.bug_frames.3)
+        __stop_bug_frames_3 = .;
         *(.rodata)
         *(.rodata.*)
         *(.data.rel.ro)
-- 
2.41.0



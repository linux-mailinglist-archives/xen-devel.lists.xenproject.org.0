Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29206A1B6D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500952.772557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWMC-0008T1-0k; Fri, 24 Feb 2023 11:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500952.772557; Fri, 24 Feb 2023 11:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWMB-0008LX-Rx; Fri, 24 Feb 2023 11:35:19 +0000
Received: by outflank-mailman (input) for mailman id 500952;
 Fri, 24 Feb 2023 11:35:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWM9-0008F6-JN
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:35:17 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e97e729-b437-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 12:35:15 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id m7so17451980lfj.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:35:15 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05651c031900b00295a8d1ecc7sm50489ljp.18.2023.02.24.03.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:35:14 -0800 (PST)
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
X-Inumbo-ID: 4e97e729-b437-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51X9MeY84AeI86UksVCXFvV/ywJXDcqY/IRT+9++n+0=;
        b=Cm3iRbMNcUp94s2Ne+koA/IZarQkv+AuXuJQGinD3yoETGZxCS5ZTTBkWfUwQbTUDV
         +U0Omhk1NpXJlMZgGbmGgEktbRg0ISL7W5jRcyHCXR+DxUnpIsiYymmRqxahcTTF6xJt
         LzPoaiP69oL2FQmuu4J/Kcai1W8LGjDvFtxXHI3kZ3SRppYbcArl//S6cJElWlfbiwxS
         O83FiFSbyyzpAUmZhEfKcj4b9ycFlTQN98CdpLGO4JUKGg6BtqmRSET2Ysy04TS6s3Rf
         FZriy3YtvdXg/uWv6aX3M0cOP0gscdZlcDEQef+NAfpyO2VkLqZxkY5bY8FRE5OJQn/o
         mRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51X9MeY84AeI86UksVCXFvV/ywJXDcqY/IRT+9++n+0=;
        b=ObOGbBgfFxVdrRTNSfXbz7xfaJams4uxJe1M5xmMA/jfnRaFVZx1FtFhusBIWDpGOx
         ALU44CYodzCes7xW+FdZMIv9GsoYu0t2Sd5SG7TRPhyvH96TVBasBJm8pUnwAdhr/sRx
         7Ts4e9rhf2NKk0s2+KF4OTAD7u1ENTylu9GFsFJI9kPOqjz/7/7aROr78GY2+uh2dad5
         r/HXfwwtGlVCy7DgG2O7fQ7XHOG3T9QDJUtnbHrXh1aNRJJjlId5W0G8gSM2uqIrOLVq
         RsZcQ1LMLWvMp7kLipGrbh331E78JaVH9hSbe0HIaKVVHwf1ci+StJ0jEh5xrtDPRrAF
         skew==
X-Gm-Message-State: AO0yUKWzXP0zcYRN6knVS7eaYjy5IKJ3EClH5odZU9nwnEs4XOgCoPHB
	ZoPfl2Eg8HuTvOPyL0PP6zAwpPX+Xyg=
X-Google-Smtp-Source: AK7set+oZ+AFDYIcbDmMMFFIbxZwMRNFhQH6aO+qx8QQaR//6vlQ2TEWysdF5xvyqn4sb4oxguCajg==
X-Received: by 2002:ac2:5927:0:b0:4dd:9a38:fcc with SMTP id v7-20020ac25927000000b004dd9a380fccmr3430648lfi.63.1677238514815;
        Fri, 24 Feb 2023 03:35:14 -0800 (PST)
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
Subject: [PATCH v4 3/5] xen/riscv: introduce an implementation of macros from <asm/bug.h>
Date: Fri, 24 Feb 2023 13:35:03 +0200
Message-Id: <a70ce0599da9549b5c4e601e5b410cfec5fc185b.1677237653.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677237653.git.oleksii.kurochko@gmail.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces macros: BUG(), WARN(), run_in_exception(),
assert_failed.

The implementation uses "ebreak" instruction in combination with
diffrent bug frame tables (for each type) which contains useful
information.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/bug.h       |  48 ++++++++++
 xen/arch/riscv/include/asm/processor.h |   2 +
 xen/arch/riscv/setup.c                 |   1 +
 xen/arch/riscv/traps.c                 | 125 +++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S               |  10 ++
 5 files changed, 186 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..67ade6f895
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021-2023 Vates
+ *
+ */
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#include <xen/types.h>
+
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
+({                                                          \
+    unsigned int len;                                       \
+    len = ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32) ?   \
+        4UL : 2UL;                                          \
+    len;                                                    \
+})
+
+/* These are defined by the architecture */
+bool is_valid_bugaddr(vaddr_t addr);
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BUG_H */
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
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index c8513ca4f8..73b9a82883 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,3 +1,4 @@
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ad7311f269..d87a9cfd2c 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,7 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
 #include <xen/errno.h>
 #include <xen/lib.h>
 
@@ -99,7 +100,131 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
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
+ * Probably the TODO won't be needed as generic do_bug_frame() (at
+ * least, for ARM and RISC-V) has been introduced and current
+ * implementation will be replaced with generic one when panic(),
+ * printk() and find_text_region() (virtual memory?) will be
+ * ready/merged
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
+bool is_valid_bugaddr(vaddr_t insn)
+{
+    if ( (insn & INSN_LENGTH_MASK) == INSN_LENGTH_32 )
+        return ( insn == BUG_INSN_32 );
+    else
+        return ( (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16 );
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
+    register_t pc = cpu_regs->sepc;
+    uint16_t instr = *(uint16_t *)pc;
+
+    if ( is_valid_bugaddr(instr) ) {
+        if ( !do_bug_frame(cpu_regs, cpu_regs->sepc) ) {
+            cpu_regs->sepc += GET_INSN_LENGTH(instr);
+            return;
+        }
+    }
+
     do_unexpected_trap(cpu_regs);
 }
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index ca57cce75c..139e2d04cb 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -39,6 +39,16 @@ SECTIONS
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
2.39.0



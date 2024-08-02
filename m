Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F7945EEA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771218.1181795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsjZ-0003CM-Hm; Fri, 02 Aug 2024 13:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771218.1181795; Fri, 02 Aug 2024 13:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsjZ-000397-Bz; Fri, 02 Aug 2024 13:54:17 +0000
Received: by outflank-mailman (input) for mailman id 771218;
 Fri, 02 Aug 2024 13:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZsjY-00036j-4z
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:54:16 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b42042f5-50d6-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 15:54:14 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef27bfd15bso104951951fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 06:54:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e1ae4easm1684271fa.43.2024.08.02.06.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 06:54:13 -0700 (PDT)
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
X-Inumbo-ID: b42042f5-50d6-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722606854; x=1723211654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vYENS4GOrzDyoLqzf6YJMTgRNv1aUaS9P/N7H1oUq4=;
        b=AU0nBErxAefkckDo35pM0PB6HRscd5GLz5hRg61lP6VYubOkKxdzyh7A5GDtJ4lK+z
         W8fogpy3HAN/+UR417JKUEhvW38TzChX/eBSDnjKWmktOg4vldp1XuCIqA9Brke0nwkw
         WIqqTZLBnzv1uGnzztRFP/RuhwZ0VUkWSw8HX+HEZfRm5r9Ta4D/KixjIqWTF1l+8ATC
         uZJfahBXmy5/Uq78SWSzBLdIdJ76XD5QNy6wWW1tEFk8Qn1SGskVO0kME0B/tCnEo/4S
         bOh1YkUi5lpC9YQOH9Of3Lnq/pCDW5lyl79gDflFx7vK8Bvu8NIt1snbIIe48uHK4PBm
         dFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722606854; x=1723211654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vYENS4GOrzDyoLqzf6YJMTgRNv1aUaS9P/N7H1oUq4=;
        b=pS0pPW8aPtnDYjyxQMwK9fNgf9Lgsk9BhkfuNC3pa3gQRX/LwQQvd9E5Tu5zGY5QqO
         0TpMq7Y0itZhsbBB3cCBOnuBQbiNtRoR4wW+fVVppcadm+Cc/Y/xYQOac4ljWlUKl96P
         YbkuAO4iKmPohDal4sFjJZhTDSbXf1JdtNkPEAK3nZEd96dt13l+4pUjm1rPt1WXZtEH
         T4w3Xb1SLHx/ckgJUrGDUX6t8ojqAOB5PZZnKQsfcCvE3qFvvdDPt/TOjOxVCc1+wDw/
         i2Vor5vDUdcvjP5EhSkHww1eEdicqP1tMBVrl149oiyufyYzNHdsWSeGmzIlrjBopotn
         E44g==
X-Gm-Message-State: AOJu0YwxMd0GgovULa6XYbeM2u5avnfs38S67VCeDDVrTOCKE0GFXndm
	S7ERZmcSsRZ0p5loQbikYZixuWCkLjFuIjmz2NT3TRzCznHCZpFHL1DImg==
X-Google-Smtp-Source: AGHT+IFqAyT4ng08KrkKSh6DAucBsCP0itGzNsRbWuHjWX1FPj1vH48eGKEHoyxLs8vKk0vc8tuTQA==
X-Received: by 2002:a2e:9606:0:b0:2ef:23ec:9357 with SMTP id 38308e7fff4ca-2f15a9f988emr27541791fa.0.1722606853462;
        Fri, 02 Aug 2024 06:54:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v12 1/3] xen/riscv: enable GENERIC_BUG_FRAME
Date: Fri,  2 Aug 2024 15:54:07 +0200
Message-ID: <3d507ce45606d22e9fa07dd6087870c16b5c4a4e.1722605952.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722605952.git.oleksii.kurochko@gmail.com>
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
and run_in_exception_handler().

The 0x0000 opcode is used for BUG_INSTR, which, when macros from
<xen/bug.h> are used, triggers an exception with the
ILLEGAL_INSTRUCTION cause.
This opcode is encoded as a 2-byte instruction and is invalid if
CONFIG_RISCV_ISA_C is enabled or not.
Using 'ebreak' as BUG_INSTR does not guarantee proper handling of macros
from <xen/bug.h>. If a debugger inserts a breakpoint (using the 'ebreak'
instruction) at a location where Xen already uses 'ebreak', it
creates ambiguity. Xen cannot distinguish whether the 'ebreak'
instruction is inserted by the debugger or is part of Xen's own code.

Remove BUG_INSN_32 and BUG_INSN_16 macros as they encode the ebreak
instruction, which is no longer used for BUG_INSN.

Update the commit above the definition of INS_LENGTH_MASK as ebreak
isn't and 2-byte instruction is used to encode BUG_INSTR so it doesn't
matter if CONFIG_RISCV_ISA_C is enabled or not.

<xen/lib.h> is included for the reason that panic() and printk() are
used in common/bug.c and RISC-V fails if it is not included.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V12:
 - Update the commit message
 - Use 0x0000 as BUG_INSTR instead of 'ebreak' to deal with cases when
   the debugger inserts 'ebreak' into the place where Xen has ebreak.
 - Remove BUG_INSN_32 and BUG_INSN_16 macros as they encode the ebreak
   instruction, which is no longer used for BUG_INSN.
 - Update the commit above the definition of INS_LENGTH_MASK.
 - Move break inside "if ( do_bug_frame(cpu_regs, pc) >= 0 )".
---
Changes in V11:
  - update the commit message
  - change "%lx" to "%#x" for PC register printing.
  - drop +1 in argument of is_kernel_text(pc) and is_kernel_inittext(pc).
  - drop return for case CAUSE_BREAKPOINT.
  - add break to default and add a blank like above it.
  - add a comment CAUSE_BREAKPOINT is handled instead of illegal instruction.
---
Changes in V10:
 - put 'select GENERIC_BUG_FRAME' in "Config RISCV".
 - rework do_trap() to not fetch an instruction in case when the cause of trap
   is BUG_insn.
 - drop read_instr() and is_valid_bug_insn().
 - update the commit message.
---
Changes in V9:
 - Rebase on the top of current staging.
 - use GENERIC_BUG_FRAME as now we have common code available.
 - add xen/lib.h to bug.c to fix a compilation error around printk.
 - update the commit message.
 - update the code of read_instr() in traps.c
 - fold two-s if into 1 in do_trap.
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
 xen/arch/riscv/Kconfig           |  1 +
 xen/arch/riscv/include/asm/bug.h | 12 +++++-------
 xen/arch/riscv/traps.c           | 25 ++++++++++++++++++++++++-
 xen/common/bug.c                 |  1 +
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index b4b354a778..f531e96657 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -1,6 +1,7 @@
 config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
+	select GENERIC_BUG_FRAME
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
index f5ff96140f..1fffef5037 100644
--- a/xen/arch/riscv/include/asm/bug.h
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -9,7 +9,11 @@
 
 #ifndef __ASSEMBLY__
 
-#define BUG_INSTR "ebreak"
+#include <xen/stringify.h>
+
+#define BUG_OPCODE  0x0000
+
+#define BUG_INSTR ".hword " __stringify(BUG_OPCODE)
 
 /*
  * The base instruction set has a fixed length of 32-bit naturally aligned
@@ -17,16 +21,10 @@
  *
  * There are extensions of variable length ( where each instruction can be
  * any number of 16-bit parcels in length ).
- *
- * Compressed ISA is used now where the instruction length is 16 bit  and
- * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
- * depending on if compressed ISA is used or not )
  */
 #define INSN_LENGTH_MASK        _UL(0x3)
 #define INSN_LENGTH_32          _UL(0x3)
 
-#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
-#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
 #define COMPRESSED_INSN_MASK    _UL(0xffff)
 
 #define GET_INSN_LENGTH(insn)                               \
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index cb18b30ff2..72ffdcd79e 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -5,6 +5,7 @@
  * RISC-V Trap handlers
  */
 
+#include <xen/bug.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 
@@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
 
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
-    do_unexpected_trap(cpu_regs);
+    register_t pc = cpu_regs->sepc;
+    unsigned long cause = csr_read(CSR_SCAUSE);
+
+    switch ( cause )
+    {
+    case CAUSE_ILLEGAL_INSTRUCTION:
+        if ( do_bug_frame(cpu_regs, pc) >= 0 )
+        {
+            if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
+            {
+                printk("Something wrong with PC: %#lx\n", pc);
+                die();
+            }
+
+            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
+
+            break;
+        }
+
+    default:
+        do_unexpected_trap(cpu_regs);
+        break;
+    }
 }
 
 void vcpu_show_execution_state(struct vcpu *v)
diff --git a/xen/common/bug.c b/xen/common/bug.c
index b7c5d8fd4d..75cb35fcfa 100644
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -1,6 +1,7 @@
 #include <xen/bug.h>
 #include <xen/errno.h>
 #include <xen/kernel.h>
+#include <xen/lib.h>
 #include <xen/livepatch.h>
 #include <xen/string.h>
 #include <xen/types.h>
-- 
2.45.2



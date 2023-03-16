Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B56BD287
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510647.788713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolV-0006Zd-C0; Thu, 16 Mar 2023 14:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510647.788713; Thu, 16 Mar 2023 14:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolV-0006WG-8h; Thu, 16 Mar 2023 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 510647;
 Thu, 16 Mar 2023 14:39:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolT-0006WA-M2
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e97beab-c408-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 15:39:34 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cy23so8470658edb.12
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:34 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:33 -0700 (PDT)
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
X-Inumbo-ID: 5e97beab-c408-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0WoQS+bl9ik87f+wKqiqUNywEFPDuqMEAzeMRb3Bv8s=;
        b=mfmrUqe8lU9YhH3myUA3j8TYpht3kw4m5uKYJ5de4DNHSfqv3toN82QrhI1ceWdtWT
         b0lX1y8cMZiRKWPhAbG8dBFUYpfaYdA7j+TyR9JJHXbYBNtnNvcrQixUHlWFVz0h58yS
         xEKLrw1mCihUmy+ruB81xa+i/EESTva0OIuMCfttsOxbKZ684+v5R1l+lCu2D9HCWHDz
         MAr0WsxDuJjJ5rJtFCgdlnURC7i8+6yNLFMTnTJxkQ/uNxwjSNgfT5jTpTlsnbqQM5Ax
         0aez6u25303CTGkaFDMROo11Gj4q3OYiCD9IUBgpNxK9vkPwimboROfSnGqDMA0Xy9Aa
         rPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WoQS+bl9ik87f+wKqiqUNywEFPDuqMEAzeMRb3Bv8s=;
        b=CSJqb7ze0hc8dZktk5qkY9ieYhajhi+odK8c5F0FMshBi17eP/Z4b6wlupgP4V+d7O
         xYS3a+m0Tva4EFnLuK23+DOi4J1jzuWd3Vg1t36PMkX1cGukQP568Fufbz/SYP+/EvU9
         mFdRLa35vnAWegjzwTRWSvQDo0KCSfQOKF+5Dptpjx3FbnF3OE/HV+TF5dYAWBCpwnqS
         dPuYAHoWkI0ljbxY1Ui+rd/ucl3ahITF+zxYQ7tMdXJKF744YNhmRSLHQBMk5mn8hWtU
         xDjpa8d5FtUG1uY2Qmheg+8OLN8Z7fPx4UF4fHV3qfxbkJGNVe7K+b4V77n5DMANPkd7
         WHNA==
X-Gm-Message-State: AO0yUKWxkUcBS/+omtdhyhGTFr0r66AGMU1xILCnaS54EwTP056f1rzG
	JsdpBycXiqGVs+ZI0IkFFnQpPEqVjV+fjQ==
X-Google-Smtp-Source: AK7set+px2KAPYMmtzZU1BVc6pKcg9bhwUKYmQgkFRZNDMlFpJUvMz3CGJdkmdKXPClDql2wEej5QQ==
X-Received: by 2002:a17:906:8393:b0:8ae:f73e:233f with SMTP id p19-20020a170906839300b008aef73e233fmr11714411ejx.32.1678977573784;
        Thu, 16 Mar 2023 07:39:33 -0700 (PDT)
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
Subject: [PATCH v5 0/7] RISCV basic exception handling implementation
Date: Thu, 16 Mar 2023 16:39:22 +0200
Message-Id: <cover.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on:
* [introduce generic implementation of macros from bug.h][1]
* [Do basic initialization things][2]
* [Deal with GOT stuff for RISC-V][3]
which haven't been commited yet.

The patch series provides a basic implementation of exception handling.
It can do only basic things such as decode a cause of an exception,
save/restore registers and execute "wfi" instruction if an exception
can not be handled.

To verify that exception handling works well it was implemented macros
from <asm/bug.h> such as BUG/WARN/run_in_exception/assert_failed.
The implementation of macros is used "ebreak" instruction and set up bug
frame tables for each type of macros.
Also it was implemented register save/restore to return and continue work
after WARN/run_in_exception.
Not all functionality of the macros was implemented as some of them
require hard-panic the system which is not available now. Instead of
hard-panic 'wfi' instruction is used but it should be definitely changed
in the neareset future.
It wasn't implemented show_execution_state() and stack trace discovering
as it's not necessary now.

[1] https://lore.kernel.org/xen-devel/cover.1678900513.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/cover.1677838213.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/69e031eb-6172-1ab0-5ffa-4650f69e83a7@citrix.com/T/#t
---
Changes in V5:
 - Rebase on top of [1] and [2]
 - Add new patch which introduces stub for <asm/bug.h> to keep Xen compilable
   as in the patch [xen/riscv: introduce decode_cause() stuff] is used
   header <xen/lib.h> which requires <asm/bug.h>.
 - Remove <xen/error.h> from riscv/traps/c as nothing would require
   inclusion.
 - decode_reserved_interrupt_cause(), decode_interrupt_cause(),
   decode_cause, do_unexpected_trap() were made as static they are expected
   to be used only in traps.c
 - Remove "#include <xen/types.h>" from <asm/bug.h> as there is no any need in it anymore
 - Update macros GET_INSN_LENGTH: remove UL and 'unsigned int len;' from it
 - Remove " include <xen/bug.h>" from risc/setup.c. it is not needed in the current version of
   the patch
 - change an argument type from vaddr_t to uint32_t for is_valid_bugaddr and introduce 
   read_instr() to read instruction properly as the length of qinstruction can be
   either 32 or 16 bits.
 - Code style fixes
 - update the comments before do_bug_frame() in riscv/trap.c
 - [[PATCH v4 5/5] automation: modify RISC-V smoke test ] was dropped as it was provided
   more simple solution by Andrew.  CI: Simplify RISCV smoke testing
 - Refactor is_valid_bugaddr() function.
 - 2 new patches ([PATCH v5 {1-2}/7]) were introduced, the goal of which is to recalculate
   addresses used in traps.c, which can be linker time relative. It is needed as we don't
   have enabled MMU yet.
---
Changes in V4:
  - Rebase the patch series on top of new version of [introduce generic
    implementation of macros from bug.h] patch series.
  - Update the cover letter message as 'Early printk' was merged and
    the current one patch series is based only on [introduce generic
    implementation of macros from bug.h] which hasn't been commited yet.
  - The following patches of the patch series were merged to staging:
      [PATCH v3 01/14] xen/riscv: change ISA to r64G
      [PATCH v3 02/14] xen/riscv: add <asm/asm.h> header
      [PATCH v3 03/14] xen/riscv: add <asm/riscv_encoding.h header
      [PATCH v3 04/14] xen/riscv: add <asm/csr.h> header
      [PATCH v3 05/14] xen/riscv: introduce empty <asm/string.h>
      [PATCH v3 06/14] xen/riscv: introduce empty <asm/cache.h>
      [PATCH v3 07/14] xen/riscv: introduce exception context
      [PATCH v3 08/14] xen/riscv: introduce exception handlers implementation
      [PATCH v3 10/14] xen/riscv: mask all interrupts
  - Fix addressed comments in xen-devel mailing list.

---
Changes in V3:
  - Change the name of config RISCV_ISA_RV64IMA to RISCV_ISA_RV64G
    as instructions from Zicsr and Zifencei extensions aren't part of
    I extension any more.
  - Rebase the patch "xen/riscv: introduce an implementation of macros
    from <asm/bug.h>" on top of patch series [introduce generic implementation
    of macros from bug.h]
  - Update commit messages
---
Changes in V2:
  - take the latest riscv_encoding.h from OpenSBI, update it with Xen
    related changes, and update the commit message with "Origin:"
    tag and the commit message itself.
  - add "Origin:" tag to the commit messag of the patch
    [xen/riscv: add <asm/csr.h> header].
  - Remove the patch [xen/riscv: add early_printk_hnum() function] as the
    functionality provided by the patch isn't used now.
  - Refactor prcoess.h: move structure offset defines to asm-offsets.c,
    change register_t to unsigned long.
  - Refactor entry.S to use offsets defined in asm-offsets.C
  - Rename {__,}handle_exception to handle_trap() and do_trap() to be more
    consistent with RISC-V spec.
  - Merge the pathc which introduces do_unexpected_trap() with the patch
    [xen/riscv: introduce exception handlers implementation].
  - Rename setup_trap_handler() to trap_init() and update correspondingly
    the patches in the patch series.
  - Refactor bug.h, remove bug_instr_t type from it.
  - Refactor decode_trap_cause() function to be more optimization-friendly.
  - Add two new empty headers: <cache.h> and <string.h> as they are needed to
    include <xen/lib.h> which provides ARRAY_SIZE and other macros.
  - Code style fixes.
---

Oleksii Kurochko (7):
  xen/riscv: introduce boot information structure
  xen/riscv: initialize boot_info structure
  xen/riscv: introduce dummy <asm/bug.h>
  xen/riscv: introduce decode_cause() stuff
  xen/riscv: introduce trap_init()
  xen/riscv: introduce an implementation of macros from <asm/bug.h>
  xen/riscv: test basic handling stuff

 xen/arch/riscv/include/asm/boot-info.h |  15 ++
 xen/arch/riscv/include/asm/bug.h       |  38 ++++
 xen/arch/riscv/include/asm/processor.h |   2 +
 xen/arch/riscv/include/asm/traps.h     |   1 +
 xen/arch/riscv/riscv64/asm-offsets.c   |   3 +
 xen/arch/riscv/setup.c                 |  34 ++++
 xen/arch/riscv/traps.c                 | 233 ++++++++++++++++++++++++-
 xen/arch/riscv/xen.lds.S               |  10 ++
 8 files changed, 335 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/boot-info.h
 create mode 100644 xen/arch/riscv/include/asm/bug.h

-- 
2.39.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAEE76E7CE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576304.902282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX58-0003AZ-Oc; Thu, 03 Aug 2023 12:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576304.902282; Thu, 03 Aug 2023 12:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX58-00037k-IV; Thu, 03 Aug 2023 12:05:30 +0000
Received: by outflank-mailman (input) for mailman id 576304;
 Thu, 03 Aug 2023 12:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX56-0002sc-D0
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 080a0305-31f6-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 14:05:26 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe216edaf7so2512093e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:24 -0700 (PDT)
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
X-Inumbo-ID: 080a0305-31f6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064325; x=1691669125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMex7KAok8kJ3fYDsnZYNrb6j4rgrDMOCX/LkNSGack=;
        b=oKHyysyJy6wfxFmYBZqHe723s/tEjI0XJyms8bL2CcRzoJ/oh7Aeb00IMF9/LIZ6YT
         DIKLkjbc/ppHtGgzXmc5wISbu9P79n0AbaHclrnOO6cjoyxmSltOGML2pk3kuOL+vySH
         0H3E278eN59PX0Qy7vEYStNVWwUUH9OMVzKZVBbbH1EApbHo8dehl9CCitfsIN1tZ47/
         3VYS5S92PHNqBWXHsu432QME5s7Vl8XFxXLtnD+A8pF+AmXhJRsErzyL/kRqrDjmQsuH
         JnmyAAg4K88eQGfPAR6ZZUqmI+SFsGrkmrVO+UPJ7bgGMblhsKbabd+2CjZobTNpv+P/
         NHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064325; x=1691669125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMex7KAok8kJ3fYDsnZYNrb6j4rgrDMOCX/LkNSGack=;
        b=Pn9HM4BQgY1opPCs2iCoAX/k6fiRsye9ovR5N9ct3rIPmy2tAazPBM0FcBQncYRS86
         xLaow9wRhMXTzgb1PYzw11xRGmNI3SawVNqlcGuVNX4CRxy+rKfVSed23+8Sxc1KbqsC
         kArdW7IaEhVjAUMcKYeQhTblWhfYuov0eMQGSG9oR7CVm/ci6G6iTdvyYJecBE8eUsDO
         jC43R/IOa7mtg6IltQTIaJaYeiSLZIGEIv5RalwjQxUZCISigYNBvwq8oVPgWrHeTKpZ
         9Z+/IrRXfVjJb07qxBM9GUm7X0iGdALyr6xVXBFVCMGd0+CA9aaHt9R4ART7wTSJHzRo
         4s4A==
X-Gm-Message-State: ABy/qLYANt+q2XMnfzNRHC567ocO5A9Us7qjqRVxqWpZvaP4CrIG+NWb
	14Emk6GmXaTqa04okM/1GTlloFKBDbE=
X-Google-Smtp-Source: APBJJlHmIBGtGsUqFlzSiGadFsBF/jw2fizwPFT8rf5AF+V/B47QKdC/GnZj4w7iQbfuuyX3B0vvnA==
X-Received: by 2002:a05:6512:e83:b0:4fe:3291:6b50 with SMTP id bi3-20020a0565120e8300b004fe32916b50mr3287761lfb.7.1691064325111;
        Thu, 03 Aug 2023 05:05:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 0/6] RISCV basic exception handling implementation
Date: Thu,  3 Aug 2023 15:05:16 +0300
Message-ID: <cover.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on:
    xen/riscv: introduce identity mapping [1]
which haven't been merged yet.

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

[1] https://lore.kernel.org/xen-devel/cover.1690899325.git.oleksii.kurochko@gmail.com/

---
Changes in V7:
 - Update the depenency ( mentioned in the cover letter message ) of the current
   patch series.
 - clean up comments.
 - code style fixes.
 - move definition of cast_to_bug_frame() from patch 4 to 5.
---
Changes in V6:
 - Update the cover letter message: the patch set is based on MMU patch series.
 - Introduce new patch with temporary printk functionality. ( it will be
   removed when Xen common code will be ready )
 - Change early_printk() to printk().
 - Remove usage of LINK_TO_LOAD() due to the MMU being enabled first.
 - Add additional explanatory comments.
 - Remove patch "xen/riscv: initialize boot_info structure" from the patch
   series.
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

Oleksii Kurochko (6):
  xen/riscv: introduce temporary printk stuff
  xen/riscv: introduce dummy <asm/bug.h>
  xen/riscv: introduce decode_cause() stuff
  xen/riscv: introduce trap_init()
  xen/riscv: introduce an implementation of macros from <asm/bug.h>
  xen/riscv: test basic handling stuff

 xen/arch/riscv/early_printk.c      | 168 ++++++++++++++++++++++
 xen/arch/riscv/include/asm/bug.h   |  37 +++++
 xen/arch/riscv/include/asm/traps.h |   1 +
 xen/arch/riscv/setup.c             |  20 +++
 xen/arch/riscv/traps.c             | 224 ++++++++++++++++++++++++++++-
 xen/arch/riscv/xen.lds.S           |  10 ++
 6 files changed, 459 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

-- 
2.41.0



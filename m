Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B96B9495A9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 18:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772986.1183436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbNC9-0000S1-6w; Tue, 06 Aug 2024 16:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772986.1183436; Tue, 06 Aug 2024 16:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbNC9-0000NL-2r; Tue, 06 Aug 2024 16:37:57 +0000
Received: by outflank-mailman (input) for mailman id 772986;
 Tue, 06 Aug 2024 16:37:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbNC8-0000K5-4V
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 16:37:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a7fa595-5412-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 18:37:54 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so1072515a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 09:37:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839708c56sm6130442a12.2.2024.08.06.09.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 09:37:52 -0700 (PDT)
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
X-Inumbo-ID: 3a7fa595-5412-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722962273; x=1723567073; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NggYMZ36LWwkaetnIEf12MqUml0kytycMiC2PqmClSs=;
        b=Glq4wqAm2V3hZOQHcPsSLEGldHKJFIRqEAEyIB7IQ1KU67RoiDelo02K45FwkQz3gx
         cNH2C5OOmhtwpBkU3sXjaTPCMVs+q4PPWD+d33CRUZ1jdgW8fdPOjvJOl9mGpgvd/k4z
         2VHn4N0p6AQ0xHNYpidlqZ/WtsRd51hNWoT9j+eX5ISjIV4K2DPlLtEBlKU6+pRSkfTh
         U3d0+JjzPfN3VnnqGy8F3B5DDWQ6Wpda+XI75nn1ogvdk6NjgsiPuX1MP5psjzuhjz7o
         pRo6FNqSrwyJqz0OuEgczE1qWjLMYSW2LA9GOj6RFWU1f8twIvOxVGRPMkIu8q3yL7LM
         ThKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722962273; x=1723567073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NggYMZ36LWwkaetnIEf12MqUml0kytycMiC2PqmClSs=;
        b=MlRximGS/0S5qTkZ4AcX2fGk5Bb45FSqQOg9Cp1Yl9z7hVTC7TT4RIUZ7WeOFUhZDD
         9Nhx63v9nZBJXL78kZU82LmvYx1jgxVCNVz/L2PiU3y0fW/JQfbb4hvpZmjIx+Ze1IJt
         9v28ktH8JoDGbZw+QDfIbBLY/pMGdIlCAc72hZ8evCd5euFyXvDQjaLmCqRvug7F46MR
         J1IhAthk7mHuNPopSEmzvbVIT3QKDy5bPzR3co65rkeGTlJgGIA9EtbwMShHbjFE3inq
         F1csragjJy553NQm2iaQxANFumHIJfUUMZo3RMxgx4U80zCHmGs0FXM3tQcfsCHh4HTZ
         Y3oA==
X-Gm-Message-State: AOJu0Yw743Q2QNNuFhfFtfG373fqzYrUZCZViAVreSCqhipjdBgc1Hdg
	j55r4Te0crshQr7BmvzWeiwA3HQXhuBbkaWNRbnWRsi4KrM4xdjM6+Fpww==
X-Google-Smtp-Source: AGHT+IHANTbhAMM695xuKO3SXkk6yDeMCZfwrM3Xx7TLmC7orh5rJZIeN3E95TK/jJMueP668j7Dsw==
X-Received: by 2002:a05:6402:284:b0:5af:51d6:d8e with SMTP id 4fb4d7f45d1cf-5b7f419f7f8mr10748346a12.20.1722962272788;
        Tue, 06 Aug 2024 09:37:52 -0700 (PDT)
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
Subject: [PATCH v13 0/2] RISCV basic exception handling implementation
Date: Tue,  6 Aug 2024 18:37:48 +0200
Message-ID: <cover.1722960083.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series provides a basic implementation of exception handling.
It can do only basic things such as decode a cause of an exception,
save/restore registers and execute "wfi" instruction if an exception
can not be handled.

To verify that exception handling works well it was used macros
from <asm/bug.h> such as BUG/WARN/run_in_exception/assert_failed.

It wasn't implemented show_execution_state() and stack trace discovering
as it's not necessary now.

CI results:
 https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1402965420

---
Changes in V13:
 - The following patches were merged to staging:
   [PATCH v12 3/3] xen/riscv: refactor decode_trap_cause()
 - Define BUG_INSTR as "UNIMP" to cover properly the cases when
   CONFIG_RISCV_ISA_C is enabled and not.
 - All other changes please look in patch separately.
 - Add link to CI results of this patch series.
 - Rebase patch series on top of current staging.
---
Changes in V12:
 - Drop patch series depenency from "Enable build of full Xen for RISC-V" as
   this depenency has been merged to staging.
 - Change BUG_INSTR from 'ebreak' to 0x0000 ( UNIMP instruction ).
 - add new patch with refactoring of decode_trap_cause().
 - The following patches were merged to staging:
   - [PATCH v11 1/5] xen/riscv: use printk() instead of early_printk()
   - [PATCH v11 2/5] xen/riscv: introduce decode_cause() stuff
   - [PATCH v11 3/5] xen/riscv: introduce trap_init()
 - All other changes please look in patch separately.
---
Changes in V10 - V11:
 - No generic changes to describe here. Please look at patch-specific changes.
---
Changes in V9:
 - Update the cover letter message.
 - s/early_printk/printk.
 - use GENERIC_BUG_FRAME instead of arch-specific implementation of do_bug_frame().
 - Rebase on top of current staging and riscv-full-xen-build-v14.
---
Changes in V8:
 - Update the commit message of the cover letter.
 - Remove the patch with an introduction of dummy asm/bug.h and introduce
   normal asm/bug.h
 - Fix typo in return string from decode_reserved_interrupt_cause
 - Add "Acked-by: Alistair Francis <alistair.francis@wdc.com>" for the patch
   "xen/riscv: introduce decode_cause() stuff"
 - Remove Pointless initializer of id in do_bug_frame().
 - Make bug_frames[] array constant in do_bug_frame().
 - Remove cast_to_bug_frame(addr).
 - Rename is_valig_bugaddr to is_valid_bug_insn().
 - Add check that read_instr is used only on Xen code
 - Update the commit message.
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
Oleksii Kurochko (2):
  xen/riscv: enable GENERIC_BUG_FRAME
  xen/riscv: test basic exception handling stuff

 xen/arch/riscv/Kconfig           |  1 +
 xen/arch/riscv/include/asm/bug.h |  8 +++-----
 xen/arch/riscv/setup.c           | 20 ++++++++++++++++++++
 xen/arch/riscv/traps.c           | 26 +++++++++++++++++++++++++-
 xen/common/bug.c                 |  1 +
 5 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.45.2



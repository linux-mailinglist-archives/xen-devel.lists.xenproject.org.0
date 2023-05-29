Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FC71492F
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 14:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540604.842464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkf-0005Vh-D9; Mon, 29 May 2023 12:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540604.842464; Mon, 29 May 2023 12:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3bkf-0005SN-7N; Mon, 29 May 2023 12:13:29 +0000
Received: by outflank-mailman (input) for mailman id 540604;
 Mon, 29 May 2023 12:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi1m=BS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3bkd-0005DI-Uh
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 12:13:27 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357cbe60-fe1a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 14:13:23 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2afb2874e83so34087091fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 May 2023 05:13:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a2e964e000000b002ac87c15fd4sm2427762ljh.95.2023.05.29.05.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 05:13:22 -0700 (PDT)
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
X-Inumbo-ID: 357cbe60-fe1a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362403; x=1687954403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wS4sHj5fpuxy/8ZdBzZWymM7lvOzvF/cgGKwz35zSs=;
        b=oFhjRCZKzrYwF+owkbb3RKWL6/jm79aylv+J2iwZ2QOMkVysM58yvLz7OifkhRv6LI
         nMvskOlsnJnV+oK4UR0HMdOo7pczmnSCt7GC2fNrcnII+Z3lACFOiEJjqBrJeYFnZIo5
         2miIrnv1V5yLrx+ttlgqpCh710HwaZsDSNrobvR9osjpiUPWlXtLeQ+0ndVDBNBGysuu
         fh/5T6vAAaNTH0G8PqN82doOTH2U6FrW/WsUAxYtOvDA8xi1sAISDK8PoRoWQFUy+ZDN
         5nr0gchXb68mRd8UqpNShytU5hG4xo0OlAa6WzgYgx7YzcY5CJDaRebbEp4+/tMhNv6I
         oLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362403; x=1687954403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wS4sHj5fpuxy/8ZdBzZWymM7lvOzvF/cgGKwz35zSs=;
        b=Sx8rwMwkYWsuLeiNEB6GwxsOk0NyUXwzWQH9HZh45rP16q0MsSLy2Qx+kDIm48aEtx
         BQfUlf8QBjY8XRWEs6Wjn+1NirKcyov0bl1PVHWe+xKxRkbYv58eQPjBrArK5DBceDZ4
         AyPD+fUQAl0QvOu+G+3UJs+TPHBYubdiJBXqqnsWdIGanTVklZMA09P7Zm+zLflrlkzI
         zHhJj+e8WjOgjXLqiJwQozX8IDfWFkmJr7t5+ri39F/+7jrFYbPYeaXXbt19UKdm7RUQ
         Lek0EmQAlbOsJYVyqMIHdsasARK3pol0E/nlYWN+QVpnEr/ShcO796jx8b0kszOgUyw8
         rqeA==
X-Gm-Message-State: AC+VfDwhjr9qe4KwuEVIFbaNbgIHNfeCs6y3axRCRD45KToqUHZVbk33
	CWOdvsdtfgTSajtXKxFF6KFFRvRXOY4=
X-Google-Smtp-Source: ACHHUZ6g1/rL6bvLFZMs6yUzD4ZO31HbVGegA9JXfMzmJTfDMwfha26Jy6fwh3bmxnXm5MeZxT6JJg==
X-Received: by 2002:a2e:9049:0:b0:2ac:7852:4096 with SMTP id n9-20020a2e9049000000b002ac78524096mr3709634ljg.24.1685362402851;
        Mon, 29 May 2023 05:13:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 0/6] [PATCH v5 0/7] RISCV basic exception handling implementation
Date: Mon, 29 May 2023 15:13:13 +0300
Message-Id: <cover.1685359848.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on:
    enable MMU for RISC-V [1]
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

[1] https://lore.kernel.org/xen-devel/cover.1685027257.git.oleksii.kurochko@gmail.com/T/#t

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

 xen/arch/riscv/early_printk.c      | 168 ++++++++++++++++++++
 xen/arch/riscv/include/asm/bug.h   |  38 +++++
 xen/arch/riscv/include/asm/traps.h |   1 +
 xen/arch/riscv/setup.c             |  20 +++
 xen/arch/riscv/traps.c             | 238 ++++++++++++++++++++++++++++-
 xen/arch/riscv/xen.lds.S           |  10 ++
 6 files changed, 474 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

-- 
2.40.1



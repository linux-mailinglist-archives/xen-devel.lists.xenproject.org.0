Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B740D68DC0D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491185.760175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFJ-00046z-Kv; Tue, 07 Feb 2023 14:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491185.760175; Tue, 07 Feb 2023 14:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPPFJ-00043f-Hk; Tue, 07 Feb 2023 14:46:57 +0000
Received: by outflank-mailman (input) for mailman id 491185;
 Tue, 07 Feb 2023 14:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPPFH-00043Z-Mg
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 14:46:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 435db7ae-a6f6-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 15:46:54 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id o18so13802520wrj.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 06:46:54 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm5269743wrw.117.2023.02.07.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:46:53 -0800 (PST)
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
X-Inumbo-ID: 435db7ae-a6f6-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMHmfkHHTHE0v8pkna6MESdKkLlHbxr+3nLxEqnuiC4=;
        b=JJI6HdRHIWyCG0Qcly/fFIST+Tcw6IpEg44w2jU+neU9OLHt6feqdUdJUAC+jR9jMZ
         27ARJoCYBkXc0FL0UjJWCPiJEWaASW6ffCQKesJjBg6FvS2WixNHIzBgX38hvF2CAVPU
         FFJwy7qKs/C+nw8uk0h45KmcB3qZHZGAOvRGEUTTGeOmC1g9oOdfpxHqVNsMl8Kl86wM
         swKJxCoqZ6zDJPG45WlE59CIdFEeOWAASU0adaTHk40Ey3jyDKp4aruCMpKqGJy2Bp6B
         aiCHdeIxntwjD6/wnyK2Usu48SNyrjXlylq28uJeyCtaYCgSbHIZPPwFMQlFJtyth0cz
         wTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMHmfkHHTHE0v8pkna6MESdKkLlHbxr+3nLxEqnuiC4=;
        b=RTLw/nuySScArWW/Ybk/auOP3rVOhZtEtvbZPXsxTYbJ7D+Kf+Sozd+G6Z1rVYm5R0
         mNWRhb8WZBzKhjgUbV05XH+ZlcLbLdaJ8VR4RI+RbVGiso1wcToA5YQD9IUeklWWee4K
         IQMY22gqGiapw23H2fViNqeqAjaOHTiaefVqx3kRvF3W8MOkDW+FUOwFeCc1UAjcjpMF
         jtup7StB2LT4EW1PkpmfsjS3B8txJb8m3mCQBpVbA2NaN0nOMVcNP8tKFvXGgDK5enNk
         pxExPzd/aC+xYa1ISXAv6Spr26HCiuRAu6+j3srdP5IAze2q6J6eyhnIOjyJ6/J66pLh
         2Gxw==
X-Gm-Message-State: AO0yUKVLLlr+hRd0axTBoCo6GVVEzCfb9UvOHb/nGLYz8I36w36LT+FT
	x3R5SWN2QQhYuY07YxdoRWGrVC+AlJM=
X-Google-Smtp-Source: AK7set98BUQF2JfES/VGC6uCGFzYm12btefrioeDJfWkGepohAAunlIN0GLPqqAWrAY6y6FHTg6uwQ==
X-Received: by 2002:adf:e786:0:b0:2c3:def9:7e1a with SMTP id n6-20020adfe786000000b002c3def97e1amr3055414wrm.44.1675781213722;
        Tue, 07 Feb 2023 06:46:53 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 00/14] RISCV basic exception handling implementation
Date: Tue,  7 Feb 2023 16:46:35 +0200
Message-Id: <cover.1675779308.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch series is based on another one [Basic early_printk and smoke
test implementation] and [introduce generic implementation
of macros from bug.h] which haven't been commited yet.

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

Oleksii Kurochko (14):
  xen/riscv: change ISA to r64G
  xen/riscv: add <asm/asm.h> header
  xen/riscv: add <asm/riscv_encoding.h header
  xen/riscv: add <asm/csr.h> header
  xen/riscv: introduce empty <asm/string.h>
  xen/riscv: introduce empty <asm/cache.h>
  xen/riscv: introduce exception context
  xen/riscv: introduce exception handlers implementation
  xen/riscv: introduce decode_cause() stuff
  xen/riscv: mask all interrupts
  xen/riscv: introduce trap_init()
  xen/riscv: introduce an implementation of macros from <asm/bug.h>
  xen/riscv: test basic handling stuff
  automation: modify RISC-V smoke test

 automation/scripts/qemu-smoke-riscv64.sh    |   2 +-
 xen/arch/riscv/Kconfig                      |  14 +-
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/arch.mk                      |   2 +-
 xen/arch/riscv/entry.S                      |  94 ++
 xen/arch/riscv/include/asm/asm.h            |  54 ++
 xen/arch/riscv/include/asm/bug.h            |  38 +
 xen/arch/riscv/include/asm/cache.h          |   6 +
 xen/arch/riscv/include/asm/csr.h            |  84 ++
 xen/arch/riscv/include/asm/processor.h      |  82 ++
 xen/arch/riscv/include/asm/riscv_encoding.h | 927 ++++++++++++++++++++
 xen/arch/riscv/include/asm/string.h         |   6 +
 xen/arch/riscv/include/asm/traps.h          |  14 +
 xen/arch/riscv/riscv64/asm-offsets.c        |  53 ++
 xen/arch/riscv/riscv64/head.S               |   5 +
 xen/arch/riscv/setup.c                      |  22 +-
 xen/arch/riscv/traps.c                      | 233 +++++
 xen/arch/riscv/xen.lds.S                    |  10 +
 18 files changed, 1640 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/entry.S
 create mode 100644 xen/arch/riscv/include/asm/asm.h
 create mode 100644 xen/arch/riscv/include/asm/bug.h
 create mode 100644 xen/arch/riscv/include/asm/cache.h
 create mode 100644 xen/arch/riscv/include/asm/csr.h
 create mode 100644 xen/arch/riscv/include/asm/processor.h
 create mode 100644 xen/arch/riscv/include/asm/riscv_encoding.h
 create mode 100644 xen/arch/riscv/include/asm/string.h
 create mode 100644 xen/arch/riscv/include/asm/traps.h
 create mode 100644 xen/arch/riscv/traps.c

-- 
2.39.0



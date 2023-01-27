Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE867E79C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485588.752914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGd-0000qu-DE; Fri, 27 Jan 2023 13:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485588.752914; Fri, 27 Jan 2023 13:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGd-0000nX-8Z; Fri, 27 Jan 2023 13:59:47 +0000
Received: by outflank-mailman (input) for mailman id 485588;
 Fri, 27 Jan 2023 13:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGb-0000nM-DE
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:45 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da0b65de-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:44 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id d14so5043679wrr.9
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:44 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:43 -0800 (PST)
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
X-Inumbo-ID: da0b65de-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAx0Mn8J44WfqcJprMgRa+KRzCfpCYZQMBUBNPmWHMc=;
        b=Dh8kanroU5lGejeoxm13ZdObW+mHxL4ASiLXDKXz83rGCndbXmma3cMH6iP/BCNp4U
         7moNydA++TOZ2SeXtZasQbz7SnOGOKupJMT4kAl1V8u1U2xM6AElMdU/EV+l1AJlM4m0
         X3obuKErQPJV8Dy1joozmRIJp8niaIJrCrTdXvM3CrlU21w88R5SRxDUTqYBKtNfgjKk
         Ss0032Vr/l7fc0fslRi3HL0GBfaNnrBbNTwQLSs5PP/ZmgJw07uGOas/7KCdqO2dqrVI
         8tL7gUHaKcfkJs/E20sb5A1mlgqVvDnCPcKZfhiAwJzFCYcc66diRmICBCCmd4UBbhEG
         GEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAx0Mn8J44WfqcJprMgRa+KRzCfpCYZQMBUBNPmWHMc=;
        b=CZkPYm8Fq1NLL9dkpFwsHMWueI19LQ37PA0qajURHB6r/DJfX5Bw11Csub0iW89vIR
         Ari7iHEnO1/hzlByjU9j9WD7aIU1G/6SvClkqgpuevJY7YQxoo6/e1U81vhKrISfNs9S
         A8ISm7+FQ6RgeisOyupz8boxjZEPzz048NZawebk0+ZdzLxUPyTdf3Ocr2dZwfa4VYjk
         qF/eEYm3ecp5aA/8FpIe98XcaQAwHFqHkLj14E2OcvbUM+WdB4cblarGLZQQ91NfC1hy
         8cHEkTxkxPkH4LwsuMKzRFr8/CIgJr+W1U5WMuJw6RV8Y5zf2BMB9kC1ysu4RN/oLZlW
         tmPg==
X-Gm-Message-State: AO0yUKUr31Aw/Wx+YKD1xe3hCBbU85rH81NGZHUOq9eUQ8rWvUdSH3rb
	xsk+q9WQPDQ4BQA1JHeUHDWflIcM2PE=
X-Google-Smtp-Source: AK7set9PC/KvhFFh9eyiGgoGgyU6s5oxi2Ehj2TQe37co4M0b1Rza/+MtECDMsjNvKBCD+Xhs2307A==
X-Received: by 2002:a5d:664f:0:b0:2bf:be0f:b016 with SMTP id f15-20020a5d664f000000b002bfbe0fb016mr8450627wrw.23.1674827983434;
        Fri, 27 Jan 2023 05:59:43 -0800 (PST)
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
Subject: [PATCH v2 00/14] RISCV basic exception handling implementation
Date: Fri, 27 Jan 2023 15:59:05 +0200
Message-Id: <cover.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on another one [Basic early_printk and smoke
test implementation] which hasn't been commited yet.

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
  xen/riscv: add _zicsr to CFLAGS
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
  automation: add smoke test to verify macros from bug.h

 automation/scripts/qemu-smoke-riscv64.sh    |   2 +-
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/arch.mk                      |   2 +-
 xen/arch/riscv/entry.S                      |  94 ++
 xen/arch/riscv/include/asm/asm.h            |  54 ++
 xen/arch/riscv/include/asm/bug.h            | 118 +++
 xen/arch/riscv/include/asm/cache.h          |   6 +
 xen/arch/riscv/include/asm/csr.h            |  84 ++
 xen/arch/riscv/include/asm/processor.h      |  82 ++
 xen/arch/riscv/include/asm/riscv_encoding.h | 927 ++++++++++++++++++++
 xen/arch/riscv/include/asm/string.h         |   6 +
 xen/arch/riscv/include/asm/traps.h          |  14 +
 xen/arch/riscv/riscv64/asm-offsets.c        |  53 ++
 xen/arch/riscv/riscv64/head.S               |   5 +
 xen/arch/riscv/setup.c                      |  21 +
 xen/arch/riscv/traps.c                      | 231 +++++
 xen/arch/riscv/xen.lds.S                    |  10 +
 17 files changed, 1709 insertions(+), 2 deletions(-)
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



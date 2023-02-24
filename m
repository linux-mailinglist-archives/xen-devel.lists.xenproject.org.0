Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A216A1B70
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500948.772521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWM5-0007VI-L6; Fri, 24 Feb 2023 11:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500948.772521; Fri, 24 Feb 2023 11:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWM5-0007Sh-GC; Fri, 24 Feb 2023 11:35:13 +0000
Received: by outflank-mailman (input) for mailman id 500948;
 Fri, 24 Feb 2023 11:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWM3-0007Ri-MH
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:35:11 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bd9b731-b437-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 12:35:10 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id h9so13753861ljq.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:35:10 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05651c031900b00295a8d1ecc7sm50489ljp.18.2023.02.24.03.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:35:09 -0800 (PST)
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
X-Inumbo-ID: 4bd9b731-b437-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECAcOZyAZg3Dpbh3eSLd5IFMQTfPPWRvoFGodXIgSFw=;
        b=Iofvxq4DQPxocp3qHrjr3PYdeA4JbyjCZArwGn0tGHCLpZqYicU5bRku/Pxq5rzrUp
         VpMDGEzRdFW/c9kyIXmWMJyLs98eM6Fhs0lHJs03XzqqfSiW9oxYus/eeAjZE9tsl0I6
         LXpt3kXN0BNZjuMGRSI72vSOE6FqPeFFUk9wFPE1OjgPRGGsQlUKcPd1FR5HrSWPqwTm
         zKRAFYw9q3Eu651L78RRmY18ppuAVW4IRt/FiezUnlax7bJbMYG5tHlig4fnXZfFaHQy
         hca/Ow07pou/lngYc0j9naKpAJ+Sdbd4XoXny2yu1ZGzFDzQ7iK1Rm6jO7mJpyxFvZpS
         FlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECAcOZyAZg3Dpbh3eSLd5IFMQTfPPWRvoFGodXIgSFw=;
        b=YwJriQpQINVhE2L8UlIWviz2Jd0q8H0ulQUIL92URMnH2qWleMHqtZxsc0ky3zQcK8
         5A686NUjQRhqdWzkz9OoZLkx8ehPx0hhqf4BooDTqY9So+uoDaFIHHOyWd12Mq6141Jc
         7WIa6HN9rg0cQHDgT56nCcOLfQIQcv8a7VRl7ppYlBOxnYGMXqmtFH+93qiO1SvobEwu
         6PhpHvPzLg1Ce2UoP6uPQmjK/Pe76yCRHNZosrR5Qijefgx7+lwvuSBIQ6ec+0z14ej1
         gowp0GUcGOzkcXLY2Y2wH2TIUe/+ILvo743+rjvj/u0VxXvTkmvHRgpX7wnWPQ3kWLie
         kJIw==
X-Gm-Message-State: AO0yUKVNJxHsPLyNeKU2OecR0Q42gDD9pEWvqkqPV5FId7QT/JHG4kiH
	+IAMW2i+2r90lr6T7crJWAmHGoJ9AZI=
X-Google-Smtp-Source: AK7set8TfNbsO2VU0reGOpxaezKx6LgtuB3hEs+cSb0Mugc2HEDpDislI8aa1WVXzK7d/NgVSur0Bw==
X-Received: by 2002:a2e:bc0e:0:b0:294:6b9a:baa7 with SMTP id b14-20020a2ebc0e000000b002946b9abaa7mr8551645ljf.38.1677238510173;
        Fri, 24 Feb 2023 03:35:10 -0800 (PST)
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
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 0/5] RISCV basic exception handling implementation
Date: Fri, 24 Feb 2023 13:35:00 +0200
Message-Id: <cover.1677237653.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on [introduce generic implementation
of macros from bug.h] which hasn't been commited yet.

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

Oleksii Kurochko (5):
  xen/riscv: introduce decode_cause() stuff
  xen/riscv: introduce trap_init()
  xen/riscv: introduce an implementation of macros from <asm/bug.h>
  xen/riscv: test basic handling stuff
  automation: modify RISC-V smoke test

 automation/scripts/qemu-smoke-riscv64.sh |   2 +-
 xen/arch/riscv/include/asm/bug.h         |  48 +++++
 xen/arch/riscv/include/asm/processor.h   |   2 +
 xen/arch/riscv/include/asm/traps.h       |   1 +
 xen/arch/riscv/setup.c                   |  21 +++
 xen/arch/riscv/traps.c                   | 219 ++++++++++++++++++++++-
 xen/arch/riscv/xen.lds.S                 |  10 ++
 7 files changed, 301 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

-- 
2.39.0



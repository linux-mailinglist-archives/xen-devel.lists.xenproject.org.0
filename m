Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D9F923C53
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752358.1160557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc6-0001og-Qw; Tue, 02 Jul 2024 11:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752358.1160557; Tue, 02 Jul 2024 11:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObc6-0001mO-O3; Tue, 02 Jul 2024 11:23:58 +0000
Received: by outflank-mailman (input) for mailman id 752358;
 Tue, 02 Jul 2024 11:23:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObc5-0001m7-G4
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:23:57 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 914bb0cd-3865-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:23:55 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso39513081fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:23:55 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5161fb73sm16149981fa.33.2024.07.02.04.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:23:53 -0700 (PDT)
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
X-Inumbo-ID: 914bb0cd-3865-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719919434; x=1720524234; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iYIw6PrAlaN9W8hvNxbXZNFyJo9LoXimbSCaQ0+315c=;
        b=UufXK9ANzl/3x8cd0AgqmBP9n5J8HGmQxgUrNYaldn/p0We7iL9uW/fqTS5h2kBK4h
         0b4bOU9rMCcfvyIT8WFKXfJehl4KFo63qxQpGDWGwMItKGMj15JEbvUhFEZ7UJGfFukL
         Ck76eOrLYenZE7J8LScOkVVun+b4XJ1KUO0g3dJZ1vbgBfFDBe4Fbcb4ZjftRqHCqhGE
         8CNd42trYEDw+eMQehZf1WpoeFv5eoLNkjdVrTMRG+SSCQKD3dHBl3vOupDuw5SQV78G
         LbE88W00Sfp7dPIXbi9+MeM1E6hJm/qptI+YDBMxiiaItL9fTE5eZxWGPrksLZ9g1fk5
         a35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719919434; x=1720524234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYIw6PrAlaN9W8hvNxbXZNFyJo9LoXimbSCaQ0+315c=;
        b=f3/KkWMtIA5p8Fd+igOTyHqY9AFwPD35wiRPLdfVFOn+DjrADnJ4HoBZmlrgbiQE3D
         BgVMMVx86M/KEyJHKED+C6kJw8AeEw9FcWvVZ1Rqj/wdEMngx3j65HtABJwTu8/juUI+
         CFABz+8TmFKZnKn31JWlziAstcPuZ4ktPXVGAsN5zClYNzo2GAyCCJEILrEO2dL/nlYF
         iOhVq/3/ImsuLpQ6jzI/Wsd25D08JQDhx04+kO+Y6ZweOn040WYx7p8M4/YIaAYoShW5
         YaCNbjb9k3U7fFipk5k4Jjt4HSbv+DcdlD9TbCW2UULUviWaFk+mfGuOOroWxEnIMNdp
         BfhQ==
X-Gm-Message-State: AOJu0YxS3946wy5X506HZRP7xXjZiKvKPyqARgy3cIRSZANlu3qQEkf9
	F/kThcEFv1AkN25H8wHSWCF9+PE6CLDiHir10hCF6E5QcrV+kNpTJpORPg8B
X-Google-Smtp-Source: AGHT+IFjbaRcGhDWKjnNGOUL5pMoubI/0kR78HXjxRq6xQtZrLbcHhPOddabrIvOA92ZPhJOxMSNMQ==
X-Received: by 2002:a2e:8684:0:b0:2ee:4c2e:3d35 with SMTP id 38308e7fff4ca-2ee5e38c978mr47149971fa.23.1719919433980;
        Tue, 02 Jul 2024 04:23:53 -0700 (PDT)
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
Subject: [PATCH for 4.20 v9 0/5] RISCV basic exception handling implementation
Date: Tue,  2 Jul 2024 13:23:45 +0200
Message-ID: <cover.1719918148.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series is based on:
    Enable build of full Xen for RISC-V [1]
which haven't fully been merged yet.

The patch series provides a basic implementation of exception handling.
It can do only basic things such as decode a cause of an exception,
save/restore registers and execute "wfi" instruction if an exception
can not be handled.

To verify that exception handling works well it was used macros
from <asm/bug.h> such as BUG/WARN/run_in_exception/assert_failed.

It wasn't implemented show_execution_state() and stack trace discovering
as it's not necessary now.

[1] https://lore.kernel.org/xen-devel/cover.1719917348.git.oleksii.kurochko@gmail.com/T/#m8ee766297511fb6fb4a38b7753ab6b792361be04

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

Oleksii Kurochko (5):
  xen/riscv: use printk() instead of early_printk()
  xen/riscv: introduce decode_cause() stuff
  xen/riscv: introduce trap_init()
  xen/riscv: enable GENERIC_BUG_FRAME
  xen/riscv: test basic handling stuff

 xen/arch/riscv/Kconfig             |   1 +
 xen/arch/riscv/include/asm/traps.h |   1 +
 xen/arch/riscv/setup.c             |  21 ++++-
 xen/arch/riscv/traps.c             | 123 ++++++++++++++++++++++++++++-
 xen/common/bug.c                   |   1 +
 5 files changed, 144 insertions(+), 3 deletions(-)

-- 
2.45.2



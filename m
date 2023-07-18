Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17BA75861E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 22:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565458.883568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrMq-00070o-Bk; Tue, 18 Jul 2023 20:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565458.883568; Tue, 18 Jul 2023 20:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrMq-0006yc-8W; Tue, 18 Jul 2023 20:32:20 +0000
Received: by outflank-mailman (input) for mailman id 565458;
 Tue, 18 Jul 2023 20:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxnk=DE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qLrMo-0006yG-J9
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 20:32:18 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e81f482-25aa-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 22:32:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B70CF8285AED;
 Tue, 18 Jul 2023 15:32:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tOLoozPT1EFX; Tue, 18 Jul 2023 15:32:13 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 413978285801;
 Tue, 18 Jul 2023 15:32:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XwmBic4oMqLn; Tue, 18 Jul 2023 15:32:13 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C14BC8285396;
 Tue, 18 Jul 2023 15:32:12 -0500 (CDT)
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
X-Inumbo-ID: 2e81f482-25aa-11ee-b23a-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 413978285801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1689712333; bh=hu0VBkQj2Z11eNO2gz3GrqyEnSUtPkSDbP3E1U420fY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NR0kssY9UvU09hQeIL0QAg9WTdu72JL2hyEJIAWrnaeO3XlqUc8plbesgNf9/ijqD
	 QrY7H1g/WUiSXkdQufok2eXpou2rpX2liT3X6hcapiGpCqnzuslPGuVT51sV0Rd5Oc
	 fDGGOeig3v4c/+hsCncllzHhlIWmy67YfTxRmXzU=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 0/4] Early serial on Power
Date: Tue, 18 Jul 2023 15:20:21 -0500
Message-Id: <cover.1689710519.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This series adds support for early serial printing on Power, as well as
a simple CI smoke test modeled after the riscv one.

The first patch is responsible for setting up a basic C environment with
an initial stack while the second sets up an Open Firmware serial console
and primitive early_printk infrastructure.

This will currently only run on QEMU pseries VMs, since the firmware
interface on bare metal differs significantly. Support for bare metal
will be added in a future series along with support for the
position-independent code model.

Based on v3 of Jan's "common: move a few macros out of xen/lib.h"
(https://lists.xen.org/archives/html/xen-devel/2023-07/msg00582.html)

Thanks,
Shawn

--
Changes in v4:
  - Add macros.h patch for ARRAY_SIZE
    - Based on v3 of Jan's "common: move a few macros out of xen/lib.h"
  - (head.S) Remove unnecessary '.section .init.data'
  - (head.S) Fixup spacing, remove unnecessary parens
  - (setup.c, processor.h) Fix style of HMT_very_low macro
  - (early_printk.c) Build early_printk.c as .init.o
  - (early_printk.c) Mark putchar_func as __initdata
  - (boot-of.c) Clarify original license in top comment
  - (boot-of.c) Add parens around ADDR macro definition
  - (boot-of.c) Add missing ADDR() for pointer arguments
  - (boot-of.c) Add comment explaining ADDR macro
  - (boot-of.c) Fix style (indentation, comment capitalization)
  - (boot-of.c) Fix type inconsistency in boot-of.c
  - (boot-of.c) Use ARRAY_SIZE instead of hard-coding nrets
  - (boot-of.c) Change bof_chosen variable to function-scope
  - (processor.h) Remove duplicate <xen/types.h> include
  - (processor.h) Remove unnecessary <xen/config.h> include
  - (processor.h) Move HMT_very_low macro to !defined(ASSEMBLY) block
  - (processor.h) Fixup struct cpu_user_regs comment style

Changes in v3:
  - Set up r2 TOC pointer in start
  - Change indirect call to start_xen to a direct one
  - Use 32-bit constant loads for stack pointer, etc. in start
      - Our load address is < 4GB so this works fine
      - In a future series we'll get -fPIC working and change all of
        these immediate address loads to TOC-relative ones.
  - Move .bss initialization to patch 2
  - Move cpu0_boot_stack declaration to setup.c
  - Bump stack size down to one page (64k), previous was way overkill.
  - Remove unnecessary STACK_FRAME_OVERHEAD component from of-call.S
    stack frame size calculation
  - Add assertion that `struct cpu_user_regs` is stack-aligned
  - Move magic `or 31,31,31` to appropriately-named macro
  - Fix formatting of loop in setup.c
  - Add newline in arch/ppc/Makefile to preserve alphabetical ordering
    per group
  - Rebase on staging, including the final version of
    'xen/types: Rework stdint vs __{u,s}$N types'

Changes in v2:
  - Split main patch into two - one for basic C environment setup and
    one for serial
  - Mark OpenFirmware functions and early_printk functions as __init and
    change boot-of.o to boot-of.init.o in Makefile
  - Change <xen/lib.h> include to <xen/stdarg.h> and drop skeleton
    headers that are no longer necessary for build as a result
  - Add loop to clear .bss before jumping to C environment that was
    accidentally excluded from the first series
  - Move common asm macros from processor.h to asm-defns.h
  - Change note in head.S about preserved registers to a multi-line
    comment so it's more noticeable
  - Drop reg-defs.h and use '%'-prefixed register names in assembly
      - This is necessary since -mregnames, which allows standard
        non-prefixed register names without manual macro definitions,
        is not supported by LLVM's assembler.
  - Drop inline asm swab routines in favor of __builtin_bswap family
  - Fix up types.h in accordance with (as of now, unmerged)
    'xen/types: Rework stdint vs __{u,s}$N types'
  - Remove unnecessary braces for single-line statements
  - Remove unnecessary license text when SPDX header is present
  - Fix alphabetical ordering of object declarations in Makefile
  - Drop 'extern' from enter_of prototype, ensure prototypes have
    argument names

Shawn Anastasio (4):
  common: Move a few more standalone macros from xen/lib.h to
    xen/macros.h
  xen/ppc: Set up a basic C environment
  xen/ppc: Implement early serial printk on pseries
  automation: Add smoke test for ppc64le

 automation/gitlab-ci/test.yaml           |  20 ++++
 automation/scripts/qemu-smoke-ppc64le.sh |  27 +++++
 xen/arch/ppc/Kconfig.debug               |   5 +
 xen/arch/ppc/Makefile                    |   4 +
 xen/arch/ppc/boot-of.c                   | 113 +++++++++++++++++++
 xen/arch/ppc/configs/ppc64_defconfig     |   1 +
 xen/arch/ppc/early_printk.c              |  28 +++++
 xen/arch/ppc/include/asm/asm-defns.h     |  57 ++++++++++
 xen/arch/ppc/include/asm/boot.h          |  23 ++++
 xen/arch/ppc/include/asm/byteorder.h     |  12 ++
 xen/arch/ppc/include/asm/config.h        |   5 +-
 xen/arch/ppc/include/asm/early_printk.h  |  15 +++
 xen/arch/ppc/include/asm/msr.h           |  51 +++++++++
 xen/arch/ppc/include/asm/processor.h     | 138 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/types.h         |  21 ++++
 xen/arch/ppc/ppc64/Makefile              |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c         |  59 ++++++++++
 xen/arch/ppc/ppc64/head.S                |  47 ++++----
 xen/arch/ppc/ppc64/of-call.S             |  83 ++++++++++++++
 xen/arch/ppc/setup.c                     |  32 ++++++
 xen/include/xen/lib.h                    |  28 -----
 xen/include/xen/macros.h                 |  32 ++++++
 22 files changed, 753 insertions(+), 49 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-ppc64le.sh
 create mode 100644 xen/arch/ppc/boot-of.c
 create mode 100644 xen/arch/ppc/early_printk.c
 create mode 100644 xen/arch/ppc/include/asm/asm-defns.h
 create mode 100644 xen/arch/ppc/include/asm/boot.h
 create mode 100644 xen/arch/ppc/include/asm/byteorder.h
 create mode 100644 xen/arch/ppc/include/asm/early_printk.h
 create mode 100644 xen/arch/ppc/include/asm/msr.h
 create mode 100644 xen/arch/ppc/include/asm/processor.h
 create mode 100644 xen/arch/ppc/include/asm/types.h
 create mode 100644 xen/arch/ppc/ppc64/of-call.S
 create mode 100644 xen/arch/ppc/setup.c

--
2.30.2



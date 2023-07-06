Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D3874A41D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 21:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560045.875618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI4-0005gD-Rj; Thu, 06 Jul 2023 19:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560045.875618; Thu, 06 Jul 2023 19:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI4-0005d5-No; Thu, 06 Jul 2023 19:05:20 +0000
Received: by outflank-mailman (input) for mailman id 560045;
 Thu, 06 Jul 2023 19:05:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuuY=CY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qHUI3-0005ct-92
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 19:05:19 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ae538e6-1c30-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 21:05:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A2F0C8285741;
 Thu,  6 Jul 2023 14:05:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yOAFtSgPUg5c; Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ED0DE8285730;
 Thu,  6 Jul 2023 14:05:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BHL8IxSI0nzW; Thu,  6 Jul 2023 14:05:13 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 699948285345;
 Thu,  6 Jul 2023 14:05:13 -0500 (CDT)
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
X-Inumbo-ID: 0ae538e6-1c30-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com ED0DE8285730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688670314; bh=0ZI6Xig5+7HzPsOyKIZS0BXKLNylwn8aTM6JW5kDEnQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=aHvaAQoi66MQre51zEv5esh32hD0EUigBhEgWw4Eq/yfnzH/lYsbj7CEqdPrjaund
	 NeuHdRdA536znI0Sk79rNreaylud6ew9EP4uDlqfGAyXqRgkke7V869hXvtIcgxwYQ
	 Hv5T+1iFAhRbJHAA4FfXS6McfQY9HWm0tIo6VlRc=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 0/3] Early serial on Power
Date: Thu,  6 Jul 2023 14:04:38 -0500
Message-Id: <cover.1688670018.git.sanastasio@raptorengineering.com>
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
will be added in a future series.

Thanks,
Shawn

--
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

Shawn Anastasio (3):
  xen/ppc: Set up a basic C environment
  xen/ppc: Implement early serial printk on pseries
  automation: Add smoke test for ppc64le

 automation/gitlab-ci/test.yaml           |  20 ++++
 automation/scripts/qemu-smoke-ppc64le.sh |  27 +++++
 xen/arch/ppc/Kconfig.debug               |   5 +
 xen/arch/ppc/Makefile                    |   4 +
 xen/arch/ppc/boot-of.c                   | 100 ++++++++++++++++
 xen/arch/ppc/configs/ppc64_defconfig     |   1 +
 xen/arch/ppc/early_printk.c              |  28 +++++
 xen/arch/ppc/include/asm/asm-defns.h     |  57 ++++++++++
 xen/arch/ppc/include/asm/boot.h          |  23 ++++
 xen/arch/ppc/include/asm/byteorder.h     |  12 ++
 xen/arch/ppc/include/asm/config.h        |   5 +-
 xen/arch/ppc/include/asm/early_printk.h  |  15 +++
 xen/arch/ppc/include/asm/msr.h           |  51 +++++++++
 xen/arch/ppc/include/asm/processor.h     | 139 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/types.h         |  21 ++++
 xen/arch/ppc/ppc64/Makefile              |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c         |  59 ++++++++++
 xen/arch/ppc/ppc64/head.S                |  49 ++++----
 xen/arch/ppc/ppc64/of-call.S             |  83 ++++++++++++++
 xen/arch/ppc/setup.c                     |  32 ++++++
 20 files changed, 711 insertions(+), 21 deletions(-)
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



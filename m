Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3CC73A9BF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553942.864816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNR-0006Z6-M6; Thu, 22 Jun 2023 20:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553942.864816; Thu, 22 Jun 2023 20:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNR-0006Td-DZ; Thu, 22 Jun 2023 20:58:01 +0000
Received: by outflank-mailman (input) for mailman id 553942;
 Thu, 22 Jun 2023 20:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yL9z=CK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qCRNP-0006Mr-Lr
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:57:59 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 765e0976-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:57:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E729B8285AE2;
 Thu, 22 Jun 2023 15:57:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zYJAGN4Mu1JA; Thu, 22 Jun 2023 15:57:54 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CF88F8285AE5;
 Thu, 22 Jun 2023 15:57:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LlOnPt1zgnWp; Thu, 22 Jun 2023 15:57:54 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 399718285ABF;
 Thu, 22 Jun 2023 15:57:54 -0500 (CDT)
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
X-Inumbo-ID: 765e0976-113f-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CF88F8285AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687467474; bh=0wj7QPlwOBqbHvF4gwVP4i4KfRt2HA9VfGoE95wa7yo=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=jO+gBSvY47iiWUgEi0aThEBlqtzDH+eNQNJBI/VO54MrYZas342v/UXT8UiboyBx/
	 ewmkqXWPx4bPHSlAMwvCNkREEZ01tjGaw1uGT1SHQovf9p6s1JfNGBlBTwTsWid8NE
	 YKSyeGlmJfQsabKYcDuE/TDrQ+60eDViKxeTnBZ8=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] Early serial on Power
Date: Thu, 22 Jun 2023 15:57:47 -0500
Message-Id: <cover.1687466822.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This series adds support for early serial printing on Power, as well as
a simple CI smoke test modeled after the riscv one.

The first patch is responsible for setting up a basic C environment with
an initial stack and a cleared .bss while the second sets up an Open
Firmware serial console and primitive early_printk infrastructure.

Of note is that this series is currently based on the following series
from Andrew Cooper: '[PATCH 0/2] xen/types: Cleanup'
(https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01601.ht=
ml)

This will currently only run on QEMU pseries VMs, since the firmware
interface on bare metal differs significantly. Support for bare metal
will be added in a future series.

Thanks,
Shawn

--
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
 xen/arch/ppc/Makefile                    |   3 +
 xen/arch/ppc/boot-of.c                   | 100 +++++++++++++++++
 xen/arch/ppc/configs/ppc64_defconfig     |   1 +
 xen/arch/ppc/early_printk.c              |  28 +++++
 xen/arch/ppc/include/asm/asm-defns.h     |  53 +++++++++
 xen/arch/ppc/include/asm/boot.h          |  23 ++++
 xen/arch/ppc/include/asm/byteorder.h     |  12 ++
 xen/arch/ppc/include/asm/early_printk.h  |  15 +++
 xen/arch/ppc/include/asm/msr.h           |  51 +++++++++
 xen/arch/ppc/include/asm/processor.h     | 136 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/types.h         |  21 ++++
 xen/arch/ppc/ppc64/Makefile              |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c         |  55 +++++++++
 xen/arch/ppc/ppc64/head.S                |  55 +++++----
 xen/arch/ppc/ppc64/of-call.S             |  83 ++++++++++++++
 xen/arch/ppc/setup.c                     |  28 +++++
 19 files changed, 697 insertions(+), 20 deletions(-)
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



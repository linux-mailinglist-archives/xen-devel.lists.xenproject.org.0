Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DED76DB31
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 01:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575860.901342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsF-0002q6-Lz; Wed, 02 Aug 2023 23:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575860.901342; Wed, 02 Aug 2023 23:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRKsF-0002mk-I5; Wed, 02 Aug 2023 23:03:23 +0000
Received: by outflank-mailman (input) for mailman id 575860;
 Wed, 02 Aug 2023 23:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qRKsD-0002Xg-KX
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 23:03:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c461f0e5-3188-11ee-b265-6b7b168915f2;
 Thu, 03 Aug 2023 01:03:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CCB3382867D6;
 Wed,  2 Aug 2023 18:03:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 89gNs2vIgyAc; Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 858D082854B3;
 Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fUmWstjzii5g; Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0975682853DD;
 Wed,  2 Aug 2023 18:03:15 -0500 (CDT)
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
X-Inumbo-ID: c461f0e5-3188-11ee-b265-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 858D082854B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691017395; bh=tcDUbXvor3Abx3L0/suO4KclBQRdywXt5N4X3WqZUt8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZcdhIBKkTIX0iC2GYS9WP2stox3fAcZx7VzpECgVJap6ytyLcaZeMxS1rtOGiPlwX
	 vpQF/5Y43ijsrJGHSaxOMCfeMb2U2PE+d4y/um5KQ76lrPL5hTkAKV4JROdbDHSo9f
	 4mVsygeluQw2zSrRAv7QdrW2YkFAX2k2TanbLAcw=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 0/9] ppc: Enable full Xen build
Date: Wed,  2 Aug 2023 18:02:56 -0500
Message-Id: <cover.1691016993.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This patch series performs all of the additions necessary to drop the
build overrides for PPC and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple, unimplemented stubs
that just call BUG().

A few miscellaneous changes were also made to non-ppc code as well,
namely a few missing header fixes as well as an ARM-ism in the ns16550
driver.

Thanks,
Shawn

Shawn Anastasio (9):
  xen/common: Add missing #includes treewide
  xen/ppc: Add public/arch-ppc.h
  xen/ppc: Implement atomic.h
  xen/ppc: Implement bitops.h
  xen/ppc: Define minimal stub headers required for full build
  ns16550: Guard accesses to `vuart` field by CONFIG_ARM
  xen/ppc: Define bug frames table in linker script
  xen/ppc: Add stub function and symbol definitions
  xen/ppc: Enable full Xen build

 xen/arch/ppc/Kconfig                     |   1 +
 xen/arch/ppc/Makefile                    |  17 +-
 xen/arch/ppc/arch.mk                     |   3 -
 xen/arch/ppc/include/asm/altp2m.h        |  39 +++
 xen/arch/ppc/include/asm/atomic.h        | 387 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/bitops.h        | 331 ++++++++++++++++++-
 xen/arch/ppc/include/asm/bug.h           |   7 +
 xen/arch/ppc/include/asm/cache.h         |   2 +
 xen/arch/ppc/include/asm/config.h        |   9 +
 xen/arch/ppc/include/asm/cpufeature.h    |   9 +
 xen/arch/ppc/include/asm/current.h       |  42 +++
 xen/arch/ppc/include/asm/delay.h         |  11 +
 xen/arch/ppc/include/asm/desc.h          |   0
 xen/arch/ppc/include/asm/device.h        |  53 ++++
 xen/arch/ppc/include/asm/div64.h         |  14 +
 xen/arch/ppc/include/asm/domain.h        |  46 +++
 xen/arch/ppc/include/asm/event.h         |  35 ++
 xen/arch/ppc/include/asm/flushtlb.h      |  23 ++
 xen/arch/ppc/include/asm/grant_table.h   |   0
 xen/arch/ppc/include/asm/guest_access.h  |  54 ++++
 xen/arch/ppc/include/asm/guest_atomics.h |  14 +
 xen/arch/ppc/include/asm/hardirq.h       |  18 ++
 xen/arch/ppc/include/asm/hypercall.h     |   0
 xen/arch/ppc/include/asm/io.h            |  15 +
 xen/arch/ppc/include/asm/iocap.h         |   7 +
 xen/arch/ppc/include/asm/iommu.h         |   7 +
 xen/arch/ppc/include/asm/irq.h           |  32 ++
 xen/arch/ppc/include/asm/mem_access.h    |   0
 xen/arch/ppc/include/asm/memory.h        |  34 ++
 xen/arch/ppc/include/asm/mm.h            | 255 ++++++++++++++-
 xen/arch/ppc/include/asm/monitor.h       |  48 +++
 xen/arch/ppc/include/asm/nospec.h        |  18 ++
 xen/arch/ppc/include/asm/numa.h          |  26 ++
 xen/arch/ppc/include/asm/p2m.h           | 105 ++++++
 xen/arch/ppc/include/asm/page.h          |  19 ++
 xen/arch/ppc/include/asm/paging.h        |   7 +
 xen/arch/ppc/include/asm/pci.h           |   7 +
 xen/arch/ppc/include/asm/percpu.h        |  26 ++
 xen/arch/ppc/include/asm/procarea.h      |  38 +++
 xen/arch/ppc/include/asm/processor.h     |   6 +
 xen/arch/ppc/include/asm/random.h        |   9 +
 xen/arch/ppc/include/asm/regs.h          |   2 +
 xen/arch/ppc/include/asm/setup.h         |   6 +
 xen/arch/ppc/include/asm/smp.h           |  18 ++
 xen/arch/ppc/include/asm/softirq.h       |   8 +
 xen/arch/ppc/include/asm/spinlock.h      |  15 +
 xen/arch/ppc/include/asm/system.h        | 243 +++++++++++++-
 xen/arch/ppc/include/asm/time.h          |  20 ++
 xen/arch/ppc/include/asm/vm_event.h      |  49 +++
 xen/arch/ppc/include/asm/xenoprof.h      |   0
 xen/arch/ppc/mm-radix.c                  |  46 ++-
 xen/arch/ppc/opal.c                      |   2 -
 xen/arch/ppc/setup.c                     |  10 +-
 xen/arch/ppc/stubs.c                     | 351 ++++++++++++++++++++
 xen/arch/ppc/tlb-radix.c                 |   2 +-
 xen/arch/ppc/xen.lds.S                   |  10 +
 xen/common/memory.c                      |   1 +
 xen/common/symbols.c                     |   1 +
 xen/common/xmalloc_tlsf.c                |   1 +
 xen/drivers/char/ns16550.c               |   2 +
 xen/include/public/arch-ppc.h            | 140 ++++++++
 xen/include/public/hvm/save.h            |   2 +
 xen/include/public/pmu.h                 |   2 +
 xen/include/public/xen.h                 |   2 +
 xen/include/xen/domain.h                 |   1 +
 xen/include/xen/iommu.h                  |   1 +
 xen/include/xen/sched.h                  |   1 +
 67 files changed, 2693 insertions(+), 17 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/altp2m.h
 create mode 100644 xen/arch/ppc/include/asm/atomic.h
 create mode 100644 xen/arch/ppc/include/asm/cpufeature.h
 create mode 100644 xen/arch/ppc/include/asm/current.h
 create mode 100644 xen/arch/ppc/include/asm/delay.h
 create mode 100644 xen/arch/ppc/include/asm/desc.h
 create mode 100644 xen/arch/ppc/include/asm/device.h
 create mode 100644 xen/arch/ppc/include/asm/div64.h
 create mode 100644 xen/arch/ppc/include/asm/domain.h
 create mode 100644 xen/arch/ppc/include/asm/event.h
 create mode 100644 xen/arch/ppc/include/asm/flushtlb.h
 create mode 100644 xen/arch/ppc/include/asm/grant_table.h
 create mode 100644 xen/arch/ppc/include/asm/guest_access.h
 create mode 100644 xen/arch/ppc/include/asm/guest_atomics.h
 create mode 100644 xen/arch/ppc/include/asm/hardirq.h
 create mode 100644 xen/arch/ppc/include/asm/hypercall.h
 create mode 100644 xen/arch/ppc/include/asm/io.h
 create mode 100644 xen/arch/ppc/include/asm/iocap.h
 create mode 100644 xen/arch/ppc/include/asm/iommu.h
 create mode 100644 xen/arch/ppc/include/asm/irq.h
 create mode 100644 xen/arch/ppc/include/asm/mem_access.h
 create mode 100644 xen/arch/ppc/include/asm/memory.h
 create mode 100644 xen/arch/ppc/include/asm/monitor.h
 create mode 100644 xen/arch/ppc/include/asm/nospec.h
 create mode 100644 xen/arch/ppc/include/asm/numa.h
 create mode 100644 xen/arch/ppc/include/asm/p2m.h
 create mode 100644 xen/arch/ppc/include/asm/paging.h
 create mode 100644 xen/arch/ppc/include/asm/pci.h
 create mode 100644 xen/arch/ppc/include/asm/percpu.h
 create mode 100644 xen/arch/ppc/include/asm/procarea.h
 create mode 100644 xen/arch/ppc/include/asm/random.h
 create mode 100644 xen/arch/ppc/include/asm/setup.h
 create mode 100644 xen/arch/ppc/include/asm/smp.h
 create mode 100644 xen/arch/ppc/include/asm/softirq.h
 create mode 100644 xen/arch/ppc/include/asm/spinlock.h
 create mode 100644 xen/arch/ppc/include/asm/time.h
 create mode 100644 xen/arch/ppc/include/asm/vm_event.h
 create mode 100644 xen/arch/ppc/include/asm/xenoprof.h
 create mode 100644 xen/arch/ppc/stubs.c
 create mode 100644 xen/include/public/arch-ppc.h

--
2.30.2



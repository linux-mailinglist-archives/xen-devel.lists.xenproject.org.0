Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA5786130
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589511.921448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8d-0004Y3-Lk; Wed, 23 Aug 2023 20:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589511.921448; Wed, 23 Aug 2023 20:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYu8d-0004Vu-IY; Wed, 23 Aug 2023 20:07:35 +0000
Received: by outflank-mailman (input) for mailman id 589511;
 Wed, 23 Aug 2023 20:07:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2Dg=EI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYu8c-0004Vf-9g
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:07:34 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1a07918-41f0-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 22:07:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B7063828556D;
 Wed, 23 Aug 2023 15:07:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BqzCzCq5iCkc; Wed, 23 Aug 2023 15:07:30 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7B75C82855DC;
 Wed, 23 Aug 2023 15:07:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sB7DRz0y0DOz; Wed, 23 Aug 2023 15:07:30 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id EC4FB82854AE;
 Wed, 23 Aug 2023 15:07:29 -0500 (CDT)
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
X-Inumbo-ID: b1a07918-41f0-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7B75C82855DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692821250; bh=nlIU48HQ2yi2f+3BsZi02EOPrJtql+H7fvyUot2YPQ0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=uHSWJGE6sPafFX+X2qlJtFPI6McDq9lrFCYvdU/LI52eawfjUYcKd6E84F65GF+Pn
	 2AtYTvG3EWJS+eZRJbwx5Gb8KQNbuKgl9nwXEM5xKnHiATBZ2hpTHN5fqX31f5muGi
	 dRSr2ft8m1dgKIWji4r/npcnUuSGC0zemvkwDIX4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/8] ppc: Enable full Xen build
Date: Wed, 23 Aug 2023 15:07:11 -0500
Message-Id: <cover.1692816595.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello all,

This patch series performs all of the additions necessary to drop the
build overrides for PPC and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple, unimplemented stubs
that just call BUG_ON("unimplemented").

A few miscellaneous changes were also made to non-ppc code as well,
specifically a few missing header fixes in common.

Thanks,
Shawn

--
v2: Address review comments from v1. Some changes are still pending until
the following patches are merged:
  - [PATCH] mem-sharing: move (x86) / drop (Arm) arch_dump_shared_mem_inf=
o()
  https://lists.xen.org/archives/html/xen-devel/2023-08/msg00887.html

  - [PATCH] move max_page and total_pages to common code
  https://lists.xen.org/archives/html/xen-devel/2023-08/msg00874.html

Shawn Anastasio (8):
  xen/common: Add missing #includes treewide
  xen/ppc: Add public/arch-ppc.h
  xen/ppc: Implement atomic.h
  xen/ppc: Implement bitops.h
  xen/ppc: Define minimal stub headers required for full build
  xen/ppc: Define bug frames table in linker script
  xen/ppc: Add stub function and symbol definitions
  xen/ppc: Enable full Xen build

 xen/arch/ppc/Kconfig                     |   1 +
 xen/arch/ppc/Makefile                    |  17 +-
 xen/arch/ppc/arch.mk                     |   3 -
 xen/arch/ppc/include/asm/altp2m.h        |  25 ++
 xen/arch/ppc/include/asm/atomic.h        | 390 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/bitops.h        | 332 ++++++++++++++++++-
 xen/arch/ppc/include/asm/bug.h           |   9 +
 xen/arch/ppc/include/asm/cache.h         |   2 +
 xen/arch/ppc/include/asm/config.h        |   9 +
 xen/arch/ppc/include/asm/cpufeature.h    |   9 +
 xen/arch/ppc/include/asm/current.h       |  42 +++
 xen/arch/ppc/include/asm/delay.h         |  11 +
 xen/arch/ppc/include/asm/device.h        |  53 +++
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
 xen/arch/ppc/include/asm/mm.h            | 249 ++++++++++++++-
 xen/arch/ppc/include/asm/monitor.h       |  46 +++
 xen/arch/ppc/include/asm/nospec.h        |  18 ++
 xen/arch/ppc/include/asm/numa.h          |  26 ++
 xen/arch/ppc/include/asm/p2m.h           | 105 ++++++
 xen/arch/ppc/include/asm/page.h          |  19 ++
 xen/arch/ppc/include/asm/paging.h        |   7 +
 xen/arch/ppc/include/asm/pci.h           |   7 +
 xen/arch/ppc/include/asm/percpu.h        |  24 ++
 xen/arch/ppc/include/asm/procarea.h      |  20 ++
 xen/arch/ppc/include/asm/processor.h     |  10 +
 xen/arch/ppc/include/asm/random.h        |   9 +
 xen/arch/ppc/include/asm/setup.h         |   6 +
 xen/arch/ppc/include/asm/smp.h           |  18 ++
 xen/arch/ppc/include/asm/softirq.h       |   8 +
 xen/arch/ppc/include/asm/spinlock.h      |  15 +
 xen/arch/ppc/include/asm/system.h        | 229 ++++++++++++-
 xen/arch/ppc/include/asm/time.h          |  20 ++
 xen/arch/ppc/include/asm/vm_event.h      |  49 +++
 xen/arch/ppc/include/asm/xenoprof.h      |   0
 xen/arch/ppc/mm-radix.c                  |  44 ++-
 xen/arch/ppc/setup.c                     |   8 +
 xen/arch/ppc/stubs.c                     | 345 ++++++++++++++++++++
 xen/arch/ppc/tlb-radix.c                 |   2 +-
 xen/arch/ppc/xen.lds.S                   |  10 +
 xen/common/memory.c                      |   1 +
 xen/common/symbols.c                     |   1 +
 xen/common/xmalloc_tlsf.c                |   1 +
 xen/include/public/arch-ppc.h            | 110 +++++++
 xen/include/public/hvm/save.h            |   2 +
 xen/include/public/pmu.h                 |   2 +
 xen/include/public/xen.h                 |   2 +
 xen/include/xen/domain.h                 |   1 +
 xen/include/xen/iommu.h                  |   1 +
 xen/include/xen/sched.h                  |   1 +
 63 files changed, 2607 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/altp2m.h
 create mode 100644 xen/arch/ppc/include/asm/atomic.h
 create mode 100644 xen/arch/ppc/include/asm/cpufeature.h
 create mode 100644 xen/arch/ppc/include/asm/current.h
 create mode 100644 xen/arch/ppc/include/asm/delay.h
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



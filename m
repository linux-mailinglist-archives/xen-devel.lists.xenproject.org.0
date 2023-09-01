Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB0790204
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 20:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594729.928154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8pv-0000PM-Pn; Fri, 01 Sep 2023 18:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594729.928154; Fri, 01 Sep 2023 18:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8pv-0000Lp-Lg; Fri, 01 Sep 2023 18:25:39 +0000
Received: by outflank-mailman (input) for mailman id 594729;
 Fri, 01 Sep 2023 18:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dN/X=ER=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qc8pu-0000IY-9a
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 18:25:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0e0bba7-48f4-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 20:25:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E9FC982856EE;
 Fri,  1 Sep 2023 13:25:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hk7pN1Vy8hSi; Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8D39D8285699;
 Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LRXrqQmT6By6; Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 348E18285413;
 Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
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
X-Inumbo-ID: f0e0bba7-48f4-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8D39D8285699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693592732; bh=djKn+q6TnbD7tmrQ3qegjd46k3TROOAefW6U0hVilSY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=N2R6hYhpWVOw8EkLGPUdu33t3910QMnu8r09so02pD9xxshb5YNPla53+Q6Cuu6PP
	 waVzSwDNQhLYTMAsAuwQP4zab/qqK4PTjH9CzuzvbYZDouL9YL+MD9i5CCDhfudtDr
	 +DL5GLeDP4IZQLMBGHYpSqTZ928hj9O/Mm3ohq/4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 0/5] ppc: Enable full Xen build
Date: Fri,  1 Sep 2023 13:25:13 -0500
Message-Id: <cover.1693590982.git.sanastasio@raptorengineering.com>
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
v3: Address review comments from v2.

v2: Address review comments from v1. Some changes are still pending until
the following patches are merged:
  - [PATCH] mem-sharing: move (x86) / drop (Arm) arch_dump_shared_mem_inf=
o()
  https://lists.xen.org/archives/html/xen-devel/2023-08/msg00887.html

  - [PATCH] move max_page and total_pages to common code
  https://lists.xen.org/archives/html/xen-devel/2023-08/msg00874.html

Shawn Anastasio (5):
  xen/ppc: Implement atomic.h
  xen/ppc: Implement bitops.h
  xen/ppc: Define minimal stub headers required for full build
  xen/ppc: Add stub function and symbol definitions
  xen/ppc: Enable full Xen build

 xen/arch/ppc/Kconfig                     |   1 +
 xen/arch/ppc/Makefile                    |  17 +-
 xen/arch/ppc/arch.mk                     |   3 -
 xen/arch/ppc/include/asm/altp2m.h        |  25 ++
 xen/arch/ppc/include/asm/atomic.h        | 384 +++++++++++++++++++++++
 xen/arch/ppc/include/asm/bitops.h        | 330 ++++++++++++++++++-
 xen/arch/ppc/include/asm/bug.h           |   9 +
 xen/arch/ppc/include/asm/cache.h         |   2 +
 xen/arch/ppc/include/asm/config.h        |  10 +
 xen/arch/ppc/include/asm/cpufeature.h    |  10 +
 xen/arch/ppc/include/asm/current.h       |  43 +++
 xen/arch/ppc/include/asm/delay.h         |  12 +
 xen/arch/ppc/include/asm/device.h        |  53 ++++
 xen/arch/ppc/include/asm/div64.h         |  14 +
 xen/arch/ppc/include/asm/domain.h        |  47 +++
 xen/arch/ppc/include/asm/event.h         |  36 +++
 xen/arch/ppc/include/asm/flushtlb.h      |  24 ++
 xen/arch/ppc/include/asm/grant_table.h   |   5 +
 xen/arch/ppc/include/asm/guest_access.h  |  68 ++++
 xen/arch/ppc/include/asm/guest_atomics.h |  23 ++
 xen/arch/ppc/include/asm/hardirq.h       |  19 ++
 xen/arch/ppc/include/asm/hypercall.h     |   5 +
 xen/arch/ppc/include/asm/io.h            |  16 +
 xen/arch/ppc/include/asm/iocap.h         |   8 +
 xen/arch/ppc/include/asm/iommu.h         |   8 +
 xen/arch/ppc/include/asm/irq.h           |  33 ++
 xen/arch/ppc/include/asm/mem_access.h    |   5 +
 xen/arch/ppc/include/asm/memory.h        |  34 ++
 xen/arch/ppc/include/asm/mm.h            | 248 ++++++++++++++-
 xen/arch/ppc/include/asm/monitor.h       |  43 +++
 xen/arch/ppc/include/asm/nospec.h        |  15 +
 xen/arch/ppc/include/asm/numa.h          |  26 ++
 xen/arch/ppc/include/asm/p2m.h           | 105 +++++++
 xen/arch/ppc/include/asm/page.h          |  18 ++
 xen/arch/ppc/include/asm/paging.h        |   7 +
 xen/arch/ppc/include/asm/pci.h           |   7 +
 xen/arch/ppc/include/asm/percpu.h        |  24 ++
 xen/arch/ppc/include/asm/processor.h     |  10 +
 xen/arch/ppc/include/asm/random.h        |   9 +
 xen/arch/ppc/include/asm/setup.h         |   6 +
 xen/arch/ppc/include/asm/smp.h           |  18 ++
 xen/arch/ppc/include/asm/softirq.h       |   8 +
 xen/arch/ppc/include/asm/spinlock.h      |  15 +
 xen/arch/ppc/include/asm/system.h        | 224 ++++++++++++-
 xen/arch/ppc/include/asm/time.h          |  21 ++
 xen/arch/ppc/include/asm/vm_event.h      |  49 +++
 xen/arch/ppc/include/asm/xenoprof.h      |   0
 xen/arch/ppc/mm-radix.c                  |  44 ++-
 xen/arch/ppc/setup.c                     |   8 +
 xen/arch/ppc/stubs.c                     | 345 ++++++++++++++++++++
 xen/arch/ppc/tlb-radix.c                 |   2 +-
 xen/include/public/hvm/save.h            |   2 +
 xen/include/public/pmu.h                 |   2 +
 xen/include/public/xen.h                 |   2 +
 54 files changed, 2491 insertions(+), 11 deletions(-)
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
 create mode 100644 xen/arch/ppc/include/asm/random.h
 create mode 100644 xen/arch/ppc/include/asm/setup.h
 create mode 100644 xen/arch/ppc/include/asm/smp.h
 create mode 100644 xen/arch/ppc/include/asm/softirq.h
 create mode 100644 xen/arch/ppc/include/asm/spinlock.h
 create mode 100644 xen/arch/ppc/include/asm/time.h
 create mode 100644 xen/arch/ppc/include/asm/vm_event.h
 create mode 100644 xen/arch/ppc/include/asm/xenoprof.h
 create mode 100644 xen/arch/ppc/stubs.c

--
2.30.2



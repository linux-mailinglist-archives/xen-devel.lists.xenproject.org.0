Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3C7A0DC7
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602640.939328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrcx-0002AP-KS; Thu, 14 Sep 2023 19:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602640.939328; Thu, 14 Sep 2023 19:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrcx-00027u-Gz; Thu, 14 Sep 2023 19:03:47 +0000
Received: by outflank-mailman (input) for mailman id 602640;
 Thu, 14 Sep 2023 19:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYVF=E6=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qgrcw-00027n-Ve
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:03:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d3f5d99-5331-11ee-8788-cb3800f73035;
 Thu, 14 Sep 2023 21:03:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 10AE38285AF8;
 Thu, 14 Sep 2023 14:03:44 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Qb2nJYNDubs5; Thu, 14 Sep 2023 14:03:42 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B7692828518F;
 Thu, 14 Sep 2023 14:03:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id N5a6YuRu3C99; Thu, 14 Sep 2023 14:03:42 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id DF0168285146;
 Thu, 14 Sep 2023 14:03:41 -0500 (CDT)
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
X-Inumbo-ID: 6d3f5d99-5331-11ee-8788-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B7692828518F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694718222; bh=SlcfViZ8PVobFSUAn5b3XiYb5tQIcuHoy2EfPPCIYK8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=AMTf/+narDyb8zbKmHsr+LVCd2u/gAaCeVEeBAMt2M+y+F7+WUTdPCf5u2vDwfjk3
	 938/7Cc0tJWtdYN6ZBDXGWoEWxNMS+z0T5WHpOzriCD1rYNP5XMGjBRAwxw2Jnv8HK
	 faQ8c8oSoQiwJslESmq6gy+bkNV3ojXXmJHydApE=
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v6 0/4] ppc: Enable full Xen build
Date: Thu, 14 Sep 2023 14:03:30 -0500
Message-Id: <cover.1694717278.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This patch series performs all of the additions necessary to drop the
build overrides for PPC and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. bitops.h), the
newly added definitions are simple, unimplemented stubs that just call
BUG_ON("unimplemented").

Thanks,
Shawn

Shawn Anastasio (4):
  xen/ppc: Implement bitops.h
  xen/ppc: Define minimal stub headers required for full build
  xen/ppc: Add stub function and symbol definitions
  xen/ppc: Enable full Xen build

 xen/arch/ppc/Kconfig                     |   1 +
 xen/arch/ppc/Makefile                    |  17 +-
 xen/arch/ppc/arch.mk                     |   3 -
 xen/arch/ppc/include/asm/Makefile        |   2 +
 xen/arch/ppc/include/asm/altp2m.h        |  25 ++
 xen/arch/ppc/include/asm/bitops.h        | 332 +++++++++++++++++++++-
 xen/arch/ppc/include/asm/bug.h           |   9 +
 xen/arch/ppc/include/asm/cache.h         |   2 +
 xen/arch/ppc/include/asm/config.h        |  10 +
 xen/arch/ppc/include/asm/cpufeature.h    |  10 +
 xen/arch/ppc/include/asm/current.h       |  43 +++
 xen/arch/ppc/include/asm/delay.h         |  12 +
 xen/arch/ppc/include/asm/device.h        |  53 ++++
 xen/arch/ppc/include/asm/div64.h         |  14 +
 xen/arch/ppc/include/asm/domain.h        |  47 ++++
 xen/arch/ppc/include/asm/event.h         |  36 +++
 xen/arch/ppc/include/asm/flushtlb.h      |  24 ++
 xen/arch/ppc/include/asm/grant_table.h   |   5 +
 xen/arch/ppc/include/asm/guest_access.h  |  68 +++++
 xen/arch/ppc/include/asm/guest_atomics.h |  23 ++
 xen/arch/ppc/include/asm/hardirq.h       |  19 ++
 xen/arch/ppc/include/asm/hypercall.h     |   5 +
 xen/arch/ppc/include/asm/io.h            |  16 ++
 xen/arch/ppc/include/asm/iocap.h         |   8 +
 xen/arch/ppc/include/asm/iommu.h         |   8 +
 xen/arch/ppc/include/asm/irq.h           |  33 +++
 xen/arch/ppc/include/asm/mem_access.h    |   5 +
 xen/arch/ppc/include/asm/mm.h            | 243 +++++++++++++++-
 xen/arch/ppc/include/asm/monitor.h       |  43 +++
 xen/arch/ppc/include/asm/nospec.h        |  15 +
 xen/arch/ppc/include/asm/numa.h          |  26 ++
 xen/arch/ppc/include/asm/p2m.h           |  95 +++++++
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
 xen/arch/ppc/include/asm/system.h        | 219 ++++++++++++++-
 xen/arch/ppc/include/asm/time.h          |  23 ++
 xen/arch/ppc/include/asm/xenoprof.h      |   0
 xen/arch/ppc/mm-radix.c                  |  44 ++-
 xen/arch/ppc/setup.c                     |   8 +
 xen/arch/ppc/stubs.c                     | 339 +++++++++++++++++++++++
 xen/arch/ppc/tlb-radix.c                 |   2 +-
 xen/include/public/hvm/save.h            |   2 +
 xen/include/public/pmu.h                 |   2 +
 xen/include/public/xen.h                 |   2 +
 52 files changed, 2004 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/Makefile
 create mode 100644 xen/arch/ppc/include/asm/altp2m.h
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
 create mode 100644 xen/arch/ppc/include/asm/xenoprof.h
 create mode 100644 xen/arch/ppc/stubs.c

--
2.30.2



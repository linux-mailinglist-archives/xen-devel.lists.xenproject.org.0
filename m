Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BC81CBDF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659407.1028999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDL-0007OP-GM; Fri, 22 Dec 2023 15:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659407.1028999; Fri, 22 Dec 2023 15:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDL-0007KW-9m; Fri, 22 Dec 2023 15:13:27 +0000
Received: by outflank-mailman (input) for mailman id 659407;
 Fri, 22 Dec 2023 15:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDJ-0007Ie-OS
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:25 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a627a4ab-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:23 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ccaf5955aeso4103971fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:21 -0800 (PST)
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
X-Inumbo-ID: a627a4ab-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258002; x=1703862802; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAX5vYsxQNw32fik7G3mdyj6qy5Jhcwz9IRIZs83x3s=;
        b=IvVgdBLWTrDdHA1OjctiAombrbAfl4lOtavsxGGKKlhSsD/TcJgwS/3+DShswY/oA0
         9/7thIX5/mb7FRwq0hJvAHUhoG5gFYp2rZaV3TinxqpaZz8LTyw8yD7+HreF4gsUYKup
         WaV0UENjdb1Iz5iVmpqGy8zlRKU2DS5PgLMy36thFcb9GsSMRGkFNoziuP0lJwgFJvb9
         tyvndXbrLLEnTfvktdcMLUiBbg0Kkbt+u4E1PM1OTL2NB8kBB1bOyCJPwDu6HDnQrjPK
         PGxR0ejycW5KjOOfzxJ70s21TV4/curkKyZtZDaPU4v7o5TMlAIP46arXdMzaNtJ1LmR
         1KrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258002; x=1703862802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAX5vYsxQNw32fik7G3mdyj6qy5Jhcwz9IRIZs83x3s=;
        b=pDCv0qTtLPtwdJcBcOf/mMtrYsVTVCrVxFatlM0W9av7XWcLYDwFQ1H9kQOZk2tzoJ
         diGKzRaYa93fyX/CjDrkdh7EPaEncjnmCmGusQ0dDlzXp92/3o8rZJFegpnTqf3NLIOf
         ImoJwukKYcYDbCBz9Gsyht9A3Evej2dz40LEWDhrFgVBsqLXVFEb4qMwl4qlJ+UJDABs
         mJku4BFKew3Yh88+rzaLYE0vazTblICO8XEv7Pig8OeuRjDk8bHi1wFlxHtoGEceF62e
         izIJgo7qnoHcLmknSFHPzfIKei4dRLYGcpRLRf1P5+mIRuen4g5yHF+GO2ToP0UDr0Uf
         lWaA==
X-Gm-Message-State: AOJu0Yw9XTQza4QK5D4CMQjZuHql8y1nYKVcP+HMv/xiaQsAzVne95B1
	cxTQ4mMW1yJQPOoX5sUp29cvON42Oqw=
X-Google-Smtp-Source: AGHT+IEfeNjw0wKkk4eV2sqYb2+OdBWdHBDb9OzLkhYEOwUHsVjkX8IIxVTUkNc1GGvH87pOX39uLA==
X-Received: by 2002:ac2:4882:0:b0:50e:3203:957a with SMTP id x2-20020ac24882000000b0050e3203957amr732422lfc.101.1703258002070;
        Fri, 22 Dec 2023 07:13:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v3 00/34]  Enable build of full Xen for RISC-V
Date: Fri, 22 Dec 2023 17:12:44 +0200
Message-ID: <cover.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

The patch series is based on the following patch series:
-	[PATCH v6 0/9] Introduce generic headers   [1]
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[1] https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
 
---
Changes in V3:
 - Update the cover letter message
 - The following patches were dropped as they were merged to staging:
    [PATCH v2 03/39] xen/riscv:introduce asm/byteorder.h
    [PATCH v2 04/39] xen/riscv: add public arch-riscv.h
    [PATCH v2 05/39] xen/riscv: introduce spinlock.h
    [PATCH v2 20/39] xen/riscv: define bug frame tables in xen.lds.S
    [PATCH v2 34/39] xen: add RISCV support for pmu.h
    [PATCH v2 35/39] xen: add necessary headers to common to build full Xen for RISC-V
 - Instead of the following patches were introduced new:
    [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
    [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
 - remove "asm/"  for commit messages which start with "xen/riscv:"
 - code style updates.
 - add emulation of {cmp}xchg_* for 1 and 2 bytes types.
 - code style fixes.
 - add SPDX and footer for the newly added headers.
 - introduce generic find-next-bit.c.
 - some other mionor changes. ( details please find in a patch )
---
Changes in V2:
  - Drop the following patches as they are the part of [2]:
      [PATCH v1 06/57] xen/riscv: introduce paging.h
      [PATCH v1 08/57] xen/riscv: introduce asm/device.h
      [PATCH v1 10/57] xen/riscv: introduce asm/grant_table.h
      [PATCH v1 12/57] xen/riscv: introduce asm/hypercall.h
      [PATCH v1 13/57] xen/riscv: introduce asm/iocap.h
      [PATCH v1 15/57] xen/riscv: introduce asm/mem_access.h
      [PATCH v1 18/57] xen/riscv: introduce asm/random.h
      [PATCH v1 21/57] xen/riscv: introduce asm/xenoprof.h
      [PATCH v1 24/57] xen/riscv: introduce asm/percpu.h
      [PATCH v1 29/57] xen/riscv: introduce asm/hardirq.h
      [PATCH v1 33/57] xen/riscv: introduce asm/altp2m.h
      [PATCH v1 38/57] xen/riscv: introduce asm/monitor.h
      [PATCH v1 39/57] xen/riscv: introduce asm/numa.h
      [PATCH v1 42/57] xen/riscv: introduce asm/softirq.h
  - xen/lib.h in most of the cases were changed to xen/bug.h as
    mostly functionilty of bug.h is used.
  - align arch-riscv.h with Arm's version of it.
  - change the Author of commit with introduction of asm/atomic.h.
  - update some definition from spinlock.h.
  - code style changes.
---

Bobby Eshleman (1):
  xen/riscv: introduce atomic.h

Oleksii Kurochko (33):
  xen/riscv: disable unnecessary configs
  xen/riscv: use some asm-generic headers
  xen: add support in public/hvm/save.h for PPC and RISC-V
  xen/riscv: introduce cpufeature.h
  xen/riscv: introduce guest_atomics.h
  xen: avoid generation of empty asm/iommu.h
  xen/asm-generic: introdure nospec.h
  xen/riscv: introduce setup.h
  xen/riscv: introduce system.h
  xen/riscv: introduce bitops.h
  xen/riscv: introduce flushtlb.h
  xen/riscv: introduce smp.h
  xen/riscv: introduce cmpxchg.h
  xen/riscv: introduce io.h
  xen/lib: introduce generic find next bit operations
  xen/riscv: add compilation of generic find-next-bit.c
  xen/riscv: introduce domain.h
  xen/riscv: introduce guest_access.h
  xen/riscv: introduce irq.h
  xen/riscv: introduce p2m.h
  xen/riscv: introduce regs.h
  xen/riscv: introduce time.h
  xen/riscv: introduce event.h
  xen/riscv: introduce monitor.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: define an address of frame table
  xen/riscv: add required things to current.h
  xen/riscv: add minimal stuff to page.h to build full Xen
  xen/riscv: add minimal stuff to processor.h to build full Xen
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/rirscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64

 README                                        |   3 +
 .../gitlab-ci/riscv-fixed-randconfig.yaml     |  27 +
 xen/arch/arm/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/Makefile             |   1 +
 xen/arch/ppc/include/asm/nospec.h             |  15 -
 xen/arch/ppc/include/asm/p2m.h                |   3 +-
 xen/arch/riscv/Kconfig                        |   1 +
 xen/arch/riscv/Makefile                       |  17 +-
 xen/arch/riscv/arch.mk                        |   4 -
 xen/arch/riscv/configs/tiny64_defconfig       |  18 +
 xen/arch/riscv/early_printk.c                 | 168 ------
 xen/arch/riscv/include/asm/Makefile           |  14 +
 xen/arch/riscv/include/asm/atomic.h           | 384 ++++++++++++++
 xen/arch/riscv/include/asm/bitops.h           | 267 ++++++++++
 xen/arch/riscv/include/asm/cache.h            |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h          | 496 ++++++++++++++++++
 xen/arch/riscv/include/asm/config.h           |  87 +--
 xen/arch/riscv/include/asm/cpufeature.h       |  23 +
 xen/arch/riscv/include/asm/current.h          |  19 +
 xen/arch/riscv/include/asm/domain.h           |  53 ++
 xen/arch/riscv/include/asm/event.h            |  40 ++
 xen/arch/riscv/include/asm/fence.h            |  22 +
 xen/arch/riscv/include/asm/flushtlb.h         |  33 ++
 xen/arch/riscv/include/asm/guest_access.h     |  29 +
 xen/arch/riscv/include/asm/guest_atomics.h    |  49 ++
 xen/arch/riscv/include/asm/io.h               | 142 +++++
 xen/arch/riscv/include/asm/irq.h              |  37 ++
 xen/arch/riscv/include/asm/mm.h               | 249 ++++++++-
 xen/arch/riscv/include/asm/monitor.h          |  26 +
 xen/arch/riscv/include/asm/p2m.h              | 102 ++++
 xen/arch/riscv/include/asm/page.h             |  22 +
 xen/arch/riscv/include/asm/processor.h        |  15 +
 xen/arch/riscv/include/asm/regs.h             |  29 +
 xen/arch/riscv/include/asm/setup.h            |  17 +
 xen/arch/riscv/include/asm/smp.h              |  28 +
 xen/arch/riscv/include/asm/system.h           |  90 ++++
 xen/arch/riscv/include/asm/time.h             |  29 +
 xen/arch/riscv/mm.c                           |  52 +-
 xen/arch/riscv/setup.c                        |   9 +-
 xen/arch/riscv/stubs.c                        | 422 +++++++++++++++
 xen/arch/riscv/traps.c                        |  25 +
 xen/common/Kconfig                            |   3 +
 xen/include/asm-generic/bitops/bitops-bits.h  |  10 +
 xen/include/asm-generic/bitops/ffs.h          |   9 +
 xen/include/asm-generic/bitops/ffz.h          |  13 +
 .../asm-generic/bitops/find-first-bit-set.h   |  17 +
 xen/include/asm-generic/bitops/fls.h          |  18 +
 xen/include/asm-generic/bitops/flsl.h         |  10 +
 xen/include/asm-generic/bitops/hweight.h      |  13 +
 xen/include/asm-generic/bitops/test-bit.h     |  16 +
 .../asm => include/asm-generic}/nospec.h      |  10 +-
 xen/include/public/hvm/save.h                 |   4 +-
 xen/include/xen/iommu.h                       |   4 +
 xen/lib/Makefile                              |   1 +
 xen/lib/find-next-bit.c                       | 281 ++++++++++
 55 files changed, 3248 insertions(+), 231 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/nospec.h
 create mode 100644 xen/arch/riscv/include/asm/Makefile
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h
 create mode 100644 xen/arch/riscv/include/asm/domain.h
 create mode 100644 xen/arch/riscv/include/asm/event.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/irq.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/include/asm/p2m.h
 create mode 100644 xen/arch/riscv/include/asm/regs.h
 create mode 100644 xen/arch/riscv/include/asm/setup.h
 create mode 100644 xen/arch/riscv/include/asm/smp.h
 create mode 100644 xen/arch/riscv/include/asm/system.h
 create mode 100644 xen/arch/riscv/include/asm/time.h
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffz.h
 create mode 100644 xen/include/asm-generic/bitops/find-first-bit-set.h
 create mode 100644 xen/include/asm-generic/bitops/fls.h
 create mode 100644 xen/include/asm-generic/bitops/flsl.h
 create mode 100644 xen/include/asm-generic/bitops/hweight.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h
 rename xen/{arch/arm/include/asm => include/asm-generic}/nospec.h (54%)
 create mode 100644 xen/lib/find-next-bit.c

-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F5587D342
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693986.1082687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwn-00060V-Cf; Fri, 15 Mar 2024 18:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693986.1082687; Fri, 15 Mar 2024 18:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwn-0005yu-9W; Fri, 15 Mar 2024 18:06:25 +0000
Received: by outflank-mailman (input) for mailman id 693986;
 Fri, 15 Mar 2024 18:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwm-0005yV-2k
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:24 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba9e6de7-e2f6-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 19:06:21 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so27142321fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:19 -0700 (PDT)
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
X-Inumbo-ID: ba9e6de7-e2f6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525980; x=1711130780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GkZggCrWPbf3X2AL5ciXfMI66Mlu4MhD31Gm8gx0G1k=;
        b=hl9O6P8kt0tKbnSGVGWicvvAVvA4jFkeyL0GN0SwyZKOrhK4dZPBczriFX2Bts4lEJ
         Im0fs+Kt6YrA48gRBEQigT1QjJtNx6w2aJxFOCyv0NuKs9h8LFbjvgnM0WoaNrYYQV/b
         nNAoWcVBAZPgD/N5F8y4H1bng5PILJeXkGe65Aq7MEc5yc3gW0abE3ruJIlJrf079MKH
         tjF/QfckBXntNUT/KHsY/VL3jNoXgBfqPw0IMU5GjYPdQTtix5sVu8RjdTXFqwQaDR7K
         UbfPLhFHNgJdifSVeRerfx8QVcyl9AOsoT+LY7272ToJoIbD+D2LL7LxV4UzEyrcedAB
         RMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525980; x=1711130780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkZggCrWPbf3X2AL5ciXfMI66Mlu4MhD31Gm8gx0G1k=;
        b=dlB4AjQdk09BvG7RChZ1M9UigowAAfg7FgjGHofQv9OtuLJDka5cZ2Wy8/Mm409RO9
         xw7EWemuCw9NBR5IhIAarQrOWaTo5748NyhQzAt0Z4kjUOvPG8qN3G7cb4h552+tqJKA
         0SqWK+3UExgDpJtS/RLyPEM5p7koEvAnh2enCem9UxReuL0717v9HTQnT/3axxY000oE
         L5uzHLS0Sn2ohwdK1umx41GnRLZVtxhOnLvSqfVidfvqS7i/iNChSI0Ang91kJLLYfq+
         XJH1krfQTE1u5/4aaBv7KQR5Otd9L8qVSuFtcWOZBqlNWMtSxvhS8END0bZ4vc+T9dw1
         ixPg==
X-Gm-Message-State: AOJu0Yx5BuxeJEjoEKiiH2AHj3JC6jhuyw8NlR6UkaOldSwI9w1kfsIL
	uxwIiDiJ8jqyszA+PGUrkyoQhABvdV/GR6En4U0VrTQdtVL3TrSxPjlrSymN7DA=
X-Google-Smtp-Source: AGHT+IH+rHID2h5TgUUuyNzF//n6i3Pu3XMrcrb0J/9YNKd6G8QVlgc5AeIZItqShMmUFYSQjTd48g==
X-Received: by 2002:a05:651c:a0d:b0:2d2:7a4e:f5ec with SMTP id k13-20020a05651c0a0d00b002d27a4ef5ecmr4441010ljq.7.1710525979921;
        Fri, 15 Mar 2024 11:06:19 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v6 00/20] Enable build of full Xen for RISC-V
Date: Fri, 15 Mar 2024 19:05:56 +0100
Message-ID: <cover.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

The patch series is based on the following patch series:
- [PATCH 0/7] xen/bitops: Reduce the mess, starting with ffs() [1]
- [PATCH] move __read_mostly to xen/cache.h  [2]
- [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [3]


Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[1] https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t
[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
[3] https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com/

---
Changes in V6:
 - Update the cover letter message: drop already merged dependecies and add
   a new one.
 - Patches were merged to staging:
   - [PATCH v5 02/23] xen/riscv: use some asm-generic headers ( even v4 was
     merged to staging branch, I just wasn't apply changes on top of the latest staging branch )
   - [PATCH v5 03/23] xen/riscv: introduce nospec.h
   - [PATCH v5 10/23] xen/riscv: introduces acrquire, release and full barriers
 - Introduce new patches:
   - xen/riscv: introduce extenstion support check by compiler
   - xen/bitops: put __ffs() and ffz() into linux compatible header
   - xen/bitops: implement fls{l}() in common logic
 - The following patches were dropped:
   - drop some patches related to bitops operations as they were introduced in another
     patch series [...]
   - introduce new version for generic __ffs(), ffz() and fls{l}().
 - Merge patch from patch series "[PATCH v9 0/7]  Introduce generic headers" to this patch
   series as only one patch left in the generic headers patch series and it is more about
   RISC-V.
 - Other changes are specific to specific patches. please look at specific patch.
---
Changes in V5:
 - Update the cover letter as one of the dependencies were merged to staging.
 - Was introduced asm-generic for atomic ops and separate patches for asm-generic bit ops
 - Moved fence.h to separate patch to deal with some patches dependecies on fence.h
 - Patches were dropped as they were merged to staging:
   * [PATCH v4 03/30] xen: add support in public/hvm/save.h for PPC and RISC-V
   * [PATCH v4 04/30] xen/riscv: introduce cpufeature.h
   * [PATCH v4 05/30] xen/riscv: introduce guest_atomics.h
   * [PATCH v4 06/30] xen: avoid generation of empty asm/iommu.h
   * [PATCH v4 08/30] xen/riscv: introduce setup.h
   * [PATCH v4 10/30] xen/riscv: introduce flushtlb.h
   * [PATCH v4 11/30] xen/riscv: introduce smp.h
   * [PATCH v4 15/30] xen/riscv: introduce irq.h
   * [PATCH v4 16/30] xen/riscv: introduce p2m.h
   * [PATCH v4 17/30] xen/riscv: introduce regs.h
   * [PATCH v4 18/30] xen/riscv: introduce time.h
   * [PATCH v4 19/30] xen/riscv: introduce event.h
   * [PATCH v4 22/30] xen/riscv: define an address of frame table
 - Other changes are specific to specific patches. please look at specific patch
---
Changes in V4:
 - Update the cover letter message: new patch series dependencies.
 - Some patches were merged to staging, so they were dropped in this patch series:
     [PATCH v3 09/34] xen/riscv: introduce system.h
     [PATCH v3 18/34] xen/riscv: introduce domain.h
     [PATCH v3 19/34] xen/riscv: introduce guest_access.h
 - Was sent out of this patch series:
     [PATCH v3 16/34] xen/lib: introduce generic find next bit operations
 - [PATCH v3 17/34] xen/riscv: add compilation of generic find-next-bit.c was
   droped as CONFIG_GENERIC_FIND_NEXT_BIT was dropped.
 - All other changes are specific to a specific patch.
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

Oleksii Kurochko (20):
  automation: introduce fixed randconfig for RISC-V
  xen/riscv: disable unnecessary configs
  xen/riscv: introduce extenstion support check by compiler
  xen/asm-generic: introduce generic non-atomic test_*bit()
  xen/bitops: implement fls{l}() in common logic
  xen/bitops: put __ffs() and ffz() into linux compatible header
  xen/riscv: introduce bitops.h
  xen/riscv: introduce cmpxchg.h
  xen/riscv: introduce io.h
  xen/riscv: introduce atomic.h
  xen/riscv: introduce monitor.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: add required things to current.h
  xen/riscv: add minimal stuff to page.h to build full Xen
  xen/riscv: add minimal stuff to processor.h to build full Xen
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/riscv: introduce vm_event_*() functions
  xen/riscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64

 README                                        |   4 +
 automation/gitlab-ci/build.yaml               |  38 +-
 docs/misc/riscv/booting.txt                   |  16 +
 xen/arch/arm/include/asm/arm32/bitops.h       |   2 +-
 xen/arch/arm/include/asm/arm64/bitops.h       |  27 +-
 xen/arch/arm/include/asm/bitops.h             |   7 +-
 xen/arch/ppc/include/asm/bitops.h             |  24 -
 xen/arch/riscv/Makefile                       |  18 +-
 xen/arch/riscv/arch.mk                        |  14 +-
 xen/arch/riscv/configs/tiny64_defconfig       |  17 +
 xen/arch/riscv/early_printk.c                 | 168 -------
 xen/arch/riscv/include/asm/atomic.h           | 263 +++++++++++
 xen/arch/riscv/include/asm/bitops.h           | 144 ++++++
 xen/arch/riscv/include/asm/cache.h            |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h          | 209 +++++++++
 xen/arch/riscv/include/asm/config.h           |   2 +
 xen/arch/riscv/include/asm/current.h          |  19 +
 xen/arch/riscv/include/asm/io.h               | 167 +++++++
 xen/arch/riscv/include/asm/mm.h               | 240 ++++++++++
 xen/arch/riscv/include/asm/monitor.h          |  26 ++
 xen/arch/riscv/include/asm/page.h             |  19 +
 xen/arch/riscv/include/asm/processor.h        |  20 +
 xen/arch/riscv/mm.c                           |  52 ++-
 xen/arch/riscv/setup.c                        |  10 +-
 xen/arch/riscv/stubs.c                        | 415 ++++++++++++++++++
 xen/arch/riscv/traps.c                        |  25 ++
 xen/arch/riscv/vm_event.c                     |  19 +
 xen/arch/x86/include/asm/bitops.h             |   6 +-
 xen/common/bitops.c                           |  22 +
 xen/drivers/passthrough/arm/smmu-v3.c         |   2 +
 xen/include/asm-generic/atomic-ops.h          |  97 ++++
 xen/include/asm-generic/bitops/bitops-bits.h  |  21 +
 .../asm-generic/bitops/generic-non-atomic.h   |  89 ++++
 xen/include/asm-generic/bitops/test-bit.h     |  18 +
 xen/include/xen/bitops.h                      |  24 +
 xen/include/xen/linux-compat.h                |   3 +
 xen/lib/find-next-bit.c                       |   1 +
 37 files changed, 2012 insertions(+), 238 deletions(-)
 create mode 100644 docs/misc/riscv/booting.txt
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/arch/riscv/vm_event.c
 create mode 100644 xen/include/asm-generic/atomic-ops.h
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/generic-non-atomic.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h

-- 
2.43.0



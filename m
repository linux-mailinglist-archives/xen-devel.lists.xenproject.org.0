Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C856867EDF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685690.1066814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewd-0007rR-G6; Mon, 26 Feb 2024 17:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685690.1066814; Mon, 26 Feb 2024 17:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewd-0007pe-BE; Mon, 26 Feb 2024 17:39:15 +0000
Received: by outflank-mailman (input) for mailman id 685690;
 Mon, 26 Feb 2024 17:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewb-0007o5-0J
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3200a8c-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:10 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso26737691fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:10 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:09 -0800 (PST)
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
X-Inumbo-ID: f3200a8c-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969149; x=1709573949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Em/qKiQQdW+4x5fl3Iv3jnukZezA0/bPJ5T9/Rqd5bY=;
        b=Ofjb7qwl3QRReWAg5ltfbo2+ZIosCYPNR/jh9YTVbvePbyM4s3RmuezXWhXuR0yNhA
         ATTx7uf/9JRU0ky4JSNw37gFghn2CLb8IUYafl8ATw8XBtIMUrrLs3nqICkco3CWmw31
         rSITbGUXRUOUdnst8PwDFGB4mG5ZbMkJV0X6tJnp4cfQXMvlHI7TmXojT1b/R7S+rEzY
         2LcnllWoDMdHeaeoNdxT/jljRn4DnZ8zuZcuFsSs3vSClh0ErxJJI4rSw0II4iBotElI
         uyCy0fMI8IqOzHc9l/CXv2TlbR44zxUJWgwYgH9clegckj3vecQwYgV+tNeqZITLvlXY
         SA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969149; x=1709573949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Em/qKiQQdW+4x5fl3Iv3jnukZezA0/bPJ5T9/Rqd5bY=;
        b=aPI+7MAz++9neMlOl8PXZlA9XxepHIw64ptbUEP2kmiTng+Rt1hXwcwyHC4yoN3thB
         r8pMdt/XtjIQm0FLdYD2oyt+OYpGVDbfxWZORnIZOHhtxDkK19RfP7TJh8A3mG8Paowv
         9ExwcCyTu7NMWBo7WZAmN92/bO4xoKSfvKalLi2jQouppaQWoDrycMWKUQ/tUQw+9m7X
         BP1SD8WU99F3pKtOPq8LJxdM0PWwtgJL+ItHzhsWuKOXS4El3bb8SLxY5v6f+s6K5B+2
         JZzN5fmMNrEUy1KLeBd+BFjcbyTfSHlQWewc3S/5wInplG3knAnTW8gMyO3QZS8Vmbsq
         BUNA==
X-Gm-Message-State: AOJu0YyOY0EXDN8KtKA8C16dcix3dxxt7C9dnjcoWs0SpSy2batRfmye
	Q8ORiFXxgpF3yyb/H89nZ7jzHt82YEhGQj8h4F1SvLe/DAaH93JAj78j+v5c
X-Google-Smtp-Source: AGHT+IEEzmg9fpq9zpc1oIs40IrTNM1Mv28s3DbGJ15V4HBez7INtD3UCq/lbbNlJ+HNOFSly/xYGg==
X-Received: by 2002:a2e:b0c5:0:b0:2d2:9345:78d8 with SMTP id g5-20020a2eb0c5000000b002d2934578d8mr339357ljl.31.1708969149238;
        Mon, 26 Feb 2024 09:39:09 -0800 (PST)
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v5 00/23] [PATCH v4 00/30]  Enable build of full Xen for RISC-V
Date: Mon, 26 Feb 2024 18:38:42 +0100
Message-ID: <cover.1708962629.git.oleksii.kurochko@gmail.com>
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
- [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [3]
- [PATCH] xen/lib: introduce generic find next bit operations [4]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[1] https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
[3] https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com/
[4] https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com/

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

Oleksii Kurochko (23):
  xen/riscv: disable unnecessary configs
  xen/riscv: use some asm-generic headers
  xen/riscv: introduce nospec.h
  xen/asm-generic: introduce generic fls() and flsl() functions
  xen/asm-generic: introduce generic find first set bit functions
  xen/asm-generic: introduce generic ffz()
  xen/asm-generic: introduce generic hweight64()
  xen/asm-generic: introduce generic non-atomic test_*bit()
  xen/riscv: introduce bitops.h
  xen/riscv: introduces acrquire, release and full barriers
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
  xen/rirscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64

 README                                        |   9 +
 automation/gitlab-ci/build.yaml               |  24 +
 docs/misc/riscv/booting.txt                   |   8 +
 xen/arch/riscv/Makefile                       |  18 +-
 xen/arch/riscv/arch.mk                        |  12 +-
 xen/arch/riscv/configs/tiny64_defconfig       |  17 +
 xen/arch/riscv/early_printk.c                 | 168 -------
 xen/arch/riscv/include/asm/Makefile           |  12 +
 xen/arch/riscv/include/asm/atomic.h           | 296 +++++++++++++
 xen/arch/riscv/include/asm/bitops.h           | 152 +++++++
 xen/arch/riscv/include/asm/cache.h            |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h          | 241 ++++++++++
 xen/arch/riscv/include/asm/config.h           |   2 +
 xen/arch/riscv/include/asm/current.h          |  19 +
 xen/arch/riscv/include/asm/fence.h            |   9 +
 xen/arch/riscv/include/asm/io.h               | 157 +++++++
 xen/arch/riscv/include/asm/mm.h               | 246 +++++++++++
 xen/arch/riscv/include/asm/monitor.h          |  26 ++
 xen/arch/riscv/include/asm/nospec.h           |  25 ++
 xen/arch/riscv/include/asm/page.h             |  19 +
 xen/arch/riscv/include/asm/processor.h        |  23 +
 xen/arch/riscv/mm.c                           |  52 ++-
 xen/arch/riscv/setup.c                        |  10 +-
 xen/arch/riscv/stubs.c                        | 415 ++++++++++++++++++
 xen/arch/riscv/traps.c                        |  25 ++
 xen/arch/riscv/vm_event.c                     |  19 +
 xen/include/asm-generic/atomic-ops.h          |  92 ++++
 xen/include/asm-generic/bitops/__ffs.h        |  47 ++
 xen/include/asm-generic/bitops/bitops-bits.h  |  21 +
 xen/include/asm-generic/bitops/ffs.h          |   9 +
 xen/include/asm-generic/bitops/ffsl.h         |  16 +
 xen/include/asm-generic/bitops/ffz.h          |  18 +
 .../asm-generic/bitops/find-first-set-bit.h   |  17 +
 xen/include/asm-generic/bitops/fls.h          |  18 +
 xen/include/asm-generic/bitops/flsl.h         |  10 +
 .../asm-generic/bitops/generic-non-atomic.h   |  89 ++++
 xen/include/asm-generic/bitops/hweight.h      |  13 +
 xen/include/asm-generic/bitops/test-bit.h     |  18 +
 38 files changed, 2198 insertions(+), 176 deletions(-)
 create mode 100644 docs/misc/riscv/booting.txt
 create mode 100644 xen/arch/riscv/include/asm/Makefile
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/include/asm/nospec.h
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/arch/riscv/vm_event.c
 create mode 100644 xen/include/asm-generic/atomic-ops.h
 create mode 100644 xen/include/asm-generic/bitops/__ffs.h
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffsl.h
 create mode 100644 xen/include/asm-generic/bitops/ffz.h
 create mode 100644 xen/include/asm-generic/bitops/find-first-set-bit.h
 create mode 100644 xen/include/asm-generic/bitops/fls.h
 create mode 100644 xen/include/asm-generic/bitops/flsl.h
 create mode 100644 xen/include/asm-generic/bitops/generic-non-atomic.h
 create mode 100644 xen/include/asm-generic/bitops/hweight.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h

-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E871977DE7A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584319.914888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdT-0003jh-Rj; Wed, 16 Aug 2023 10:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584319.914888; Wed, 16 Aug 2023 10:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdT-0003gI-LP; Wed, 16 Aug 2023 10:20:19 +0000
Received: by outflank-mailman (input) for mailman id 584319;
 Wed, 16 Aug 2023 10:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdR-0003RA-Ls
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ddbb7b7-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:15 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3196fdb3238so3156072f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:15 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:13 -0700 (PDT)
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
X-Inumbo-ID: 7ddbb7b7-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181214; x=1692786014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4nKKQayWyt1+rz2Ke2EYH6htOpAqTZN8PNzyXl6YM8=;
        b=IxZ6vQQ9R9K7ysXvD3HEX3oq5+BFcDo4RBDlp4B0uiT2OAqTm7friW01l2FxHOf9zD
         /1ZhfOZ2RcLoBQC+VnDc8YwAz8S/VE7ZZAen6UNJpUUQ36Mhj5H60LMlNGGGfuUCQ8FX
         8BgGFIHWhrNTdP6RHM9ZZoICoSYSr5k2hi0qszmKNBuIw0XGFRF64c22tBeyh//D0jOB
         YMejnguW+GylNeX+pyX/RW95sRsq9XQERC8usUTp7AEBy8v7ZfAZxMh+dPwla1RbAViW
         +VYU3QqM5eLIKmgC+CvOyPbtvRS9HwFa6xl3TJLEY13gOP/6ohKJFkHhNx7HlU0r3VHL
         EQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181214; x=1692786014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4nKKQayWyt1+rz2Ke2EYH6htOpAqTZN8PNzyXl6YM8=;
        b=aU9aqrholDUsN/zclI049bK3S24qit8mnwTSdMpc7jI4L0zJH9fAu0k4bxB31tG+PF
         otwYqngCbdEBz8D9YKkaaZGO0E8oAPJFO9wDJtUDcRvly5DhEVLSx7pi/pdyPdTUi5Wa
         XO7Ti8yOhDdFC/K63GTg2g829W/itf54FB2tJICI6a6GPq9PNt2oS5XNMXh7sp0xWz83
         6ByS/1kzl+Lw7PIhL1Gv1slt9AaoPce5ucWF3wwvd16m7t3g57jsgqyvQyS/pxWjgJAr
         UZ6muurf8s4dbtH/lxL2gqUgHpLQoqOBDabmxgffzEN6jedyjXcvFEcefQKLow3e0Bmp
         fl+A==
X-Gm-Message-State: AOJu0Yz5cnnFX7PRvo+Vt3wZ/EfKoHdBAJ/VPrYM9Pvo11U5XBe4XajK
	vaBAhqqo/2iE1VUKdxJ5TT5KOC760yS8fnfh
X-Google-Smtp-Source: AGHT+IGFvG1jDFRGsq2Wpu9zIhy85VTXBj/nh1C+/b0fkdBo3hHAwl06Nu+pH66HbjqxcSkG/ZX3hQ==
X-Received: by 2002:a5d:674d:0:b0:315:a34f:b520 with SMTP id l13-20020a5d674d000000b00315a34fb520mr1133536wrw.71.1692181214294;
        Wed, 16 Aug 2023 03:20:14 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 00/57] Enable build of full Xen for RISC-V
Date: Wed, 16 Aug 2023 13:19:10 +0300
Message-ID: <cover.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

Also the patch series has open question described in the patch 57

Patch 56 is only needed for test purposes and will be removed.

Oleksii Kurochko (57):
  xen/riscv:introduce asm/byteorder.h
  xen/riscv: add public arch-riscv.h
  xen/riscv: introduce spinlock.h
  xen/riscv: introduce fence.h
  xen/riscv: introduce arch-riscv/hvm/save.h
  xen/riscv: introduce paging.h
  xen/riscv: introduce asm/cpufeature.h
  xen/riscv: introduce asm/device.h
  xen/riscv: introduce asm/event.h
  xen/riscv: introduce asm/grant_table.h
  xen/riscv: introduce asm/guest_atomics.h
  xen/riscv: introduce asm/hypercall.h
  xen/riscv: introduce asm/iocap.h
  xen/riscv: introduce asm/iommu.h
  xen/riscv: introduce asm/mem_access.h
  xen/riscv: introduce asm/nospec.h
  xen/riscv: introduce asm/pci.h
  xen/riscv: introduce asm/random.h
  xen/riscv: introduce asm/setup.h
  xen/riscv: introduce asm/system.h
  xen/riscv: introduce asm/xenoprof.h
  xen/riscv: introduce bitops.h
  xen/riscv: introduce flushtlb.h
  xen/riscv: introduce asm/percpu.h
  xen/riscv: introduce asm/smp.h
  xen/riscv: introduce asm/atomic.h
  xen/riscv: introduce cmpxchg.h
  xen/riscv: introduce asm/io.h
  xen/riscv: introduce asm/hardirq.h
  xen/riscv: introduce div64.h
  xen/riscv: define bug frame tables in xen.lds.S
  xen/riscv: introduce bit operations
  xen/riscv: introduce asm/altp2m.h
  xen/riscv: introduce asm/delay.h
  xen/riscv: introduce asm/domain.h
  xen/riscv: introduce asm/guest_access.h
  xen/riscv: introduce asm/irq.h
  xen/riscv: introduce asm/monitor.h
  xen/riscv: introduce asm/numa.h
  xen/riscv: introduce asm/p2m.h
  xen/riscv: introduce asm/regs.h
  xen/riscv: introduce asm/softirq.h
  xen/riscv: introduce asm/time.h
  xen/riscv: introduce asm/vm_event.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: define an address of frame table
  xen/riscv: add required things to asm/current.h
  xen/riscv: add minimal stuff to asm/page.h to build full Xen
  xen/riscv: add minimal stuff to asm/processor.h to build full Xen
  xen/riscv: add minimal stuff to asm/smp.h to build full Xen
  xen: add RISCV support for pmu.h
  xen: add necessary headers to common to build full Xen for RISC-V
  xen/riscv: add minimal stuff to asm/mm.h to build full Xen
  xen/rirscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  test only riscv
  xxxen/riscv: WIP ( need advise )

 automation/gitlab-ci/analyze.yaml          |  16 -
 automation/gitlab-ci/build.yaml            | 544 ---------------------
 automation/gitlab-ci/test.yaml             | 308 ------------
 xen/arch/riscv/Kconfig                     |   1 +
 xen/arch/riscv/Makefile                    |  18 +-
 xen/arch/riscv/arch.mk                     |   4 -
 xen/arch/riscv/configs/tiny64_defconfig    |  19 +-
 xen/arch/riscv/early_printk.c              | 168 -------
 xen/arch/riscv/include/asm/altp2m.h        |  28 ++
 xen/arch/riscv/include/asm/asm_defns.h     |  44 ++
 xen/arch/riscv/include/asm/atomic.h        | 375 ++++++++++++++
 xen/arch/riscv/include/asm/bitops.h        | 288 +++++++++++
 xen/arch/riscv/include/asm/byteorder.h     |  16 +
 xen/arch/riscv/include/asm/cache.h         |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h       | 373 ++++++++++++++
 xen/arch/riscv/include/asm/config.h        |  21 +
 xen/arch/riscv/include/asm/cpufeature.h    |  22 +
 xen/arch/riscv/include/asm/current.h       |  17 +
 xen/arch/riscv/include/asm/delay.h         |  17 +
 xen/arch/riscv/include/asm/device.h        |  55 +++
 xen/arch/riscv/include/asm/div64.h         |  22 +
 xen/arch/riscv/include/asm/domain.h        |  43 ++
 xen/arch/riscv/include/asm/event.h         |  34 ++
 xen/arch/riscv/include/asm/fence.h         |  12 +
 xen/arch/riscv/include/asm/flushtlb.h      |  31 ++
 xen/arch/riscv/include/asm/grant_table.h   |  61 +++
 xen/arch/riscv/include/asm/guest_access.h  |  29 ++
 xen/arch/riscv/include/asm/guest_atomics.h |  63 +++
 xen/arch/riscv/include/asm/hardirq.h       |  26 +
 xen/arch/riscv/include/asm/hypercall.h     |   4 +
 xen/arch/riscv/include/asm/io.h            | 132 +++++
 xen/arch/riscv/include/asm/iocap.h         |  16 +
 xen/arch/riscv/include/asm/iommu.h         |   7 +
 xen/arch/riscv/include/asm/irq.h           |  34 ++
 xen/arch/riscv/include/asm/livepatch.h     |   0
 xen/arch/riscv/include/asm/mem_access.h    |   4 +
 xen/arch/riscv/include/asm/mm.h            | 270 +++++++++-
 xen/arch/riscv/include/asm/monitor.h       |  53 ++
 xen/arch/riscv/include/asm/nospec.h        |  25 +
 xen/arch/riscv/include/asm/numa.h          |  38 ++
 xen/arch/riscv/include/asm/p2m.h           | 129 +++++
 xen/arch/riscv/include/asm/page.h          |  37 ++
 xen/arch/riscv/include/asm/paging.h        |   7 +
 xen/arch/riscv/include/asm/pci.h           |   7 +
 xen/arch/riscv/include/asm/percpu.h        |  33 ++
 xen/arch/riscv/include/asm/perfc_defn.h    |   0
 xen/arch/riscv/include/asm/processor.h     |  15 +
 xen/arch/riscv/include/asm/random.h        |   9 +
 xen/arch/riscv/include/asm/regs.h          |  27 +
 xen/arch/riscv/include/asm/setup.h         |   6 +
 xen/arch/riscv/include/asm/smp.h           |  23 +
 xen/arch/riscv/include/asm/softirq.h       |  16 +
 xen/arch/riscv/include/asm/spinlock.h      |  13 +
 xen/arch/riscv/include/asm/system.h        |  83 ++++
 xen/arch/riscv/include/asm/time.h          |  20 +
 xen/arch/riscv/include/asm/vm_event.h      |  52 ++
 xen/arch/riscv/include/asm/xenoprof.h      |   4 +
 xen/arch/riscv/lib/Makefile                |   1 +
 xen/arch/riscv/lib/find_next_bit.c         | 278 +++++++++++
 xen/arch/riscv/mm.c                        |  85 +++-
 xen/arch/riscv/setup.c                     |   9 +-
 xen/arch/riscv/stubs.c                     | 419 ++++++++++++++++
 xen/arch/riscv/traps.c                     |  25 +
 xen/arch/riscv/xen.lds.S                   |  10 +
 xen/common/memory.c                        |   1 +
 xen/common/symbols.c                       |   1 +
 xen/include/public/arch-riscv.h            |  90 ++++
 xen/include/public/arch-riscv/hvm/save.h   |  22 +
 xen/include/public/hvm/save.h              |   2 +
 xen/include/public/pmu.h                   |   2 +
 xen/include/public/xen.h                   |   2 +
 xen/include/xen/domain.h                   |   1 +
 xen/include/xen/iommu.h                    |   1 +
 xen/include/xen/sched.h                    |   1 +
 74 files changed, 3625 insertions(+), 1046 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/altp2m.h
 create mode 100644 xen/arch/riscv/include/asm/asm_defns.h
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/byteorder.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h
 create mode 100644 xen/arch/riscv/include/asm/delay.h
 create mode 100644 xen/arch/riscv/include/asm/device.h
 create mode 100644 xen/arch/riscv/include/asm/div64.h
 create mode 100644 xen/arch/riscv/include/asm/domain.h
 create mode 100644 xen/arch/riscv/include/asm/event.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h
 create mode 100644 xen/arch/riscv/include/asm/grant_table.h
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h
 create mode 100644 xen/arch/riscv/include/asm/hardirq.h
 create mode 100644 xen/arch/riscv/include/asm/hypercall.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/iocap.h
 create mode 100644 xen/arch/riscv/include/asm/iommu.h
 create mode 100644 xen/arch/riscv/include/asm/irq.h
 create mode 100644 xen/arch/riscv/include/asm/livepatch.h
 create mode 100644 xen/arch/riscv/include/asm/mem_access.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/include/asm/nospec.h
 create mode 100644 xen/arch/riscv/include/asm/numa.h
 create mode 100644 xen/arch/riscv/include/asm/p2m.h
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/pci.h
 create mode 100644 xen/arch/riscv/include/asm/percpu.h
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h
 create mode 100644 xen/arch/riscv/include/asm/random.h
 create mode 100644 xen/arch/riscv/include/asm/regs.h
 create mode 100644 xen/arch/riscv/include/asm/setup.h
 create mode 100644 xen/arch/riscv/include/asm/smp.h
 create mode 100644 xen/arch/riscv/include/asm/softirq.h
 create mode 100644 xen/arch/riscv/include/asm/spinlock.h
 create mode 100644 xen/arch/riscv/include/asm/system.h
 create mode 100644 xen/arch/riscv/include/asm/time.h
 create mode 100644 xen/arch/riscv/include/asm/vm_event.h
 create mode 100644 xen/arch/riscv/include/asm/xenoprof.h
 create mode 100644 xen/arch/riscv/lib/Makefile
 create mode 100644 xen/arch/riscv/lib/find_next_bit.c
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/include/public/arch-riscv.h
 create mode 100644 xen/include/public/arch-riscv/hvm/save.h

-- 
2.41.0



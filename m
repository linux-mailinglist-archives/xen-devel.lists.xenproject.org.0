Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D497F7178
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640365.998395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSs-0006k7-Pk; Fri, 24 Nov 2023 10:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640365.998395; Fri, 24 Nov 2023 10:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSs-0006iF-MU; Fri, 24 Nov 2023 10:31:14 +0000
Received: by outflank-mailman (input) for mailman id 640365;
 Fri, 24 Nov 2023 10:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSq-0006hx-VK
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:13 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95d5cadb-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:10 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54afe0fbde3so419400a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:10 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:09 -0800 (PST)
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
X-Inumbo-ID: 95d5cadb-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821869; x=1701426669; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq30o0Xb1mNIk6XxRQvFCEj+byNN+EwOJBFvFc9B2j4=;
        b=ljtYClu4gnqMTQ8RNrnAxZKcvLmlRO1Gfjh95BtG8kKNgBVIM2dWq94ZeJ3OUpySti
         WeUMMKtqyOPjCzJJ824ep2gnbENnDeB3nNp6lOiyCTq6Y+IAWF5hb+N/AhwmUa19xunk
         mrVSFWtgyI75ey91RluS/aevOxYA4UA0OME0FF28dh/iZl5FbBYpB+cvpGnhYUgDR2YH
         RZRgjmwpRdg82Z55gwPIyB7U8wtqBJ27Z4Y0sYb6ge0GXA+AbpCTDhh7L8ZWnLQRea3M
         2yY4DHB/svNMx3PDjMaTMq4xL8SKDwwYr0J0I7QOi1NxSGjVmdznO35t47fiYmRP65pq
         QSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821869; x=1701426669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gq30o0Xb1mNIk6XxRQvFCEj+byNN+EwOJBFvFc9B2j4=;
        b=cMwrvCk7iXhGWmot8Vkw3VFJjO0Xr0bv254effXIXAXAC8HBdTLnyO6YxLfS7e35Ah
         25axDGZdmzrq62AgXpc9Kiys32YtMNw0k2nMnO68ijuEz5UiFqpXTgKb48V7J1JY5Gh9
         Gl7aysuRtAn9KfIckyFxVEwLeajazNHfG4LL3+ODWR2qQmMaBSa1VIiA/n0Fl0ymbjxH
         E7JfCpLlAiihElutTN2g0C3c9q75W782m6h1vGKFYtPvKY/uoHL23nK1XYkJ+ZVRxVNx
         r+hVy0bXOf7mqkgLVtSxRRLOvHI7Kxw2fqtxrEP+WRQOS45GO+jJUxWcCNn55GuA8mRu
         6/xw==
X-Gm-Message-State: AOJu0Yxeu0zIeUo9TOUuBDyoQk/gfdXbWtNrDdp8CKLY7NdLzlYjzabF
	WecaE0lVLs1YxyUgHQj0tEkTtr/GqaglWA==
X-Google-Smtp-Source: AGHT+IHWlY4DyiLqt108rquIQtgNuwPVgqW7Ksd7mNOBIw6EvadF4yst+vYd1to6qaA/QTGZ6bthVw==
X-Received: by 2002:a17:907:2993:b0:a00:185a:a150 with SMTP id eu19-20020a170907299300b00a00185aa150mr1141546ejc.38.1700821869356;
        Fri, 24 Nov 2023 02:31:09 -0800 (PST)
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
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 00/39] Enable build of full Xen for RISC-V
Date: Fri, 24 Nov 2023 12:30:20 +0200
Message-ID: <cover.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

The patch series is based on the following patch series:
- [PATCH v2] xen: remove <asm/delay.h> [1]
- [PATCH v3 00/14] Introduce generic headers [2]

[1] https://lore.kernel.org/xen-devel/3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com/
[2] https://lore.kernel.org/xen-devel/cover.1700221559.git.oleksii.kurochko@gmail.com/

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
  xen/riscv: introduce asm/atomic.h

Oleksii Kurochko (38):
  xen/riscv: disable unnecessary configs
  xen/riscv: use some asm-generic headers
  xen/riscv:introduce asm/byteorder.h
  xen/riscv: add public arch-riscv.h
  xen/riscv: introduce spinlock.h
  xen/riscv: introduce fence.h
  xen/riscv: introduce arch-riscv/hvm/save.h
  xen/riscv: introduce asm/cpufeature.h
  xen/riscv: introduce asm/guest_atomics.h
  xen/riscv: introduce asm/iommu.h
  xen/riscv: introduce asm/nospec.h
  xen/riscv: introduce asm/setup.h
  xen/riscv: introduce asm/system.h
  xen/riscv: introduce bitops.h
  xen/riscv: introduce flushtlb.h
  xen/riscv: introduce asm/smp.h
  xen/riscv: introduce cmpxchg.h
  xen/riscv: introduce asm/io.h
  xen/riscv: define bug frame tables in xen.lds.S
  xen/riscv: introduce bit operations
  xen/riscv: introduce asm/domain.h
  xen/riscv: introduce asm/guest_access.h
  xen/riscv: introduce asm/irq.h
  xen/riscv: introduce asm/p2m.h
  xen/riscv: introduce asm/regs.h
  xen/riscv: introduce asm/time.h
  xen/riscv: introduce asm/event.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: define an address of frame table
  xen/riscv: add required things to asm/current.h
  xen/riscv: add minimal stuff to asm/page.h to build full Xen
  xen/riscv: add minimal stuff to asm/processor.h to build full Xen
  xen: add RISCV support for pmu.h
  xen: add necessary headers to common to build full Xen for RISC-V
  xen/riscv: add minimal stuff to asm/mm.h to build full Xen
  xen/rirscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen: fix compilation issue of serial.c

 automation/gitlab-ci/build.yaml            | 122 ++++++
 automation/scripts/build                   |   4 +-
 xen/arch/riscv/Makefile                    |  18 +-
 xen/arch/riscv/arch.mk                     |   4 -
 xen/arch/riscv/configs/tiny64_defconfig    |  19 +-
 xen/arch/riscv/early_printk.c              | 168 --------
 xen/arch/riscv/include/asm/Makefile        |  14 +
 xen/arch/riscv/include/asm/atomic.h        | 375 ++++++++++++++++++
 xen/arch/riscv/include/asm/bitops.h        | 288 ++++++++++++++
 xen/arch/riscv/include/asm/byteorder.h     |  16 +
 xen/arch/riscv/include/asm/cache.h         |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h       | 379 ++++++++++++++++++
 xen/arch/riscv/include/asm/config.h        |  21 +
 xen/arch/riscv/include/asm/cpufeature.h    |  22 ++
 xen/arch/riscv/include/asm/current.h       |  20 +
 xen/arch/riscv/include/asm/domain.h        |  43 +++
 xen/arch/riscv/include/asm/event.h         |  34 ++
 xen/arch/riscv/include/asm/fence.h         |  12 +
 xen/arch/riscv/include/asm/flushtlb.h      |  31 ++
 xen/arch/riscv/include/asm/guest_access.h  |  29 ++
 xen/arch/riscv/include/asm/guest_atomics.h |  48 +++
 xen/arch/riscv/include/asm/io.h            | 134 +++++++
 xen/arch/riscv/include/asm/iommu.h         |   7 +
 xen/arch/riscv/include/asm/irq.h           |  37 ++
 xen/arch/riscv/include/asm/mm.h            | 270 ++++++++++++-
 xen/arch/riscv/include/asm/nospec.h        |  25 ++
 xen/arch/riscv/include/asm/p2m.h           | 105 +++++
 xen/arch/riscv/include/asm/page.h          |  21 +
 xen/arch/riscv/include/asm/processor.h     |  15 +
 xen/arch/riscv/include/asm/regs.h          |  26 ++
 xen/arch/riscv/include/asm/setup.h         |   6 +
 xen/arch/riscv/include/asm/smp.h           |  23 ++
 xen/arch/riscv/include/asm/spinlock.h      |  15 +
 xen/arch/riscv/include/asm/system.h        |  79 ++++
 xen/arch/riscv/include/asm/time.h          |  19 +
 xen/arch/riscv/lib/Makefile                |   1 +
 xen/arch/riscv/lib/find_next_bit.c         | 278 ++++++++++++++
 xen/arch/riscv/mm.c                        |  52 ++-
 xen/arch/riscv/setup.c                     |   9 +-
 xen/arch/riscv/stubs.c                     | 426 +++++++++++++++++++++
 xen/arch/riscv/traps.c                     |  25 ++
 xen/arch/riscv/xen.lds.S                   |  10 +
 xen/drivers/char/serial.c                  |   2 +
 xen/include/public/arch-riscv.h            |  93 +++++
 xen/include/public/arch-riscv/hvm/save.h   |  20 +
 xen/include/public/hvm/save.h              |   2 +
 xen/include/public/pmu.h                   |   2 +
 xen/include/public/xen.h                   |   2 +
 xen/include/xen/domain.h                   |   1 +
 49 files changed, 3194 insertions(+), 180 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/Makefile
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/byteorder.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h
 create mode 100644 xen/arch/riscv/include/asm/domain.h
 create mode 100644 xen/arch/riscv/include/asm/event.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h
 create mode 100644 xen/arch/riscv/include/asm/flushtlb.h
 create mode 100644 xen/arch/riscv/include/asm/guest_access.h
 create mode 100644 xen/arch/riscv/include/asm/guest_atomics.h
 create mode 100644 xen/arch/riscv/include/asm/io.h
 create mode 100644 xen/arch/riscv/include/asm/iommu.h
 create mode 100644 xen/arch/riscv/include/asm/irq.h
 create mode 100644 xen/arch/riscv/include/asm/nospec.h
 create mode 100644 xen/arch/riscv/include/asm/p2m.h
 create mode 100644 xen/arch/riscv/include/asm/regs.h
 create mode 100644 xen/arch/riscv/include/asm/setup.h
 create mode 100644 xen/arch/riscv/include/asm/smp.h
 create mode 100644 xen/arch/riscv/include/asm/spinlock.h
 create mode 100644 xen/arch/riscv/include/asm/system.h
 create mode 100644 xen/arch/riscv/include/asm/time.h
 create mode 100644 xen/arch/riscv/lib/Makefile
 create mode 100644 xen/arch/riscv/lib/find_next_bit.c
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/include/public/arch-riscv.h
 create mode 100644 xen/include/public/arch-riscv/hvm/save.h

-- 
2.42.0



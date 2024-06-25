Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F191696C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747731.1155199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6aW-0006er-V8; Tue, 25 Jun 2024 13:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747731.1155199; Tue, 25 Jun 2024 13:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6aW-0006cn-Rn; Tue, 25 Jun 2024 13:52:00 +0000
Received: by outflank-mailman (input) for mailman id 747731;
 Tue, 25 Jun 2024 13:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6aV-0006cc-7Z
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:51:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16dd2238-32fa-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 15:51:58 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee83so5982545a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:51:57 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:51:56 -0700 (PDT)
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
X-Inumbo-ID: 16dd2238-32fa-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323517; x=1719928317; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NUbKUQs4rp1PGjsnlTng9LwdCaUfLHgJXj7GhVHCDU=;
        b=ETUWKzq70/P0mCC4BkX1Jso+3KTXy3uD95qfhI7iNxYV2PeGPi0BRSGweZuT77PgjK
         M1xVFc89/4z9NnekFMcWP3WxMjc84pXcQ6Nc05BeAP9DwV00Iv3ibG/qcgKRNFN3bW9z
         J2uhhF4OqbNqskj++DU8lo7UWAbzqZX+rVxRfePfcpBdKmVt+BRbzsZjTWffH3FTPdc/
         ynQDeDK9MhqlFqn7vD1jErM8wFrt5YZGv07kOc9Q6n8pZdlotn75ctpBpD6gDoDN44uR
         AZ6OilH4OMQIs6rs62zmBSkAs+59xOw6Q5HW8wlYz0gr4SCOO9yy8A8kadn58Imth/9W
         nXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323517; x=1719928317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NUbKUQs4rp1PGjsnlTng9LwdCaUfLHgJXj7GhVHCDU=;
        b=Puf2uHP5ybdtu1Lse+f+25D6YFmSzIHuJOeit1ujj+xBpfBJqkhYwDz08TXea2sP9b
         koS9pENr5+TXT6dfxV+YIYy7AlKiBmaQUgsx2rsEiwTCko6kfsE4fZo/QH55/3JBdgJP
         N+hZHzhbpmNXjnyZUzHuyyCuttlmSmVr6uuUVjrgWdWeJlNBZBNZ8ofKJeipKGEnYdrI
         Z7i4+eVKVDbqXSTZwNo0kLHta5Wrb6fFvI0BX2cGMSN4uroWsqdhllh5aOr7bKDdVl6t
         ZnaXdd/qnZqhYSGHRhGPy+SrjhnCPaV2spszTpR1wa+PI5Vj+ymiFWwcvsH4qCv+ASb5
         uoVA==
X-Gm-Message-State: AOJu0YynEJ7wCOhiruma8/GHKzmgYPFNKV+dHDcDkgXDB8iGudEoH8HR
	lgjd5NVfmoVow7E8ZcERS3tIjv/3FeKZtWbkFQjFapot5zADRMEKSX1yHQDA
X-Google-Smtp-Source: AGHT+IE+/gXldzx+kUNYRvRQVl5/JhWBG4srI9Q4L+vosdpzvaK0O9Khle+5/hNoyTw46VrrQ7yf8A==
X-Received: by 2002:a17:907:a60b:b0:a6f:51d0:d226 with SMTP id a640c23a62f3a-a716519a273mr583338466b.66.1719323516644;
        Tue, 25 Jun 2024 06:51:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH for-4.19? v13 0/10]  Enable build of full Xen for RISC-V
Date: Tue, 25 Jun 2024 15:51:42 +0200
Message-ID: <cover.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

***
I think that I need to write a separate email requesting approval for this patch
series to be included in Xen 4.19. Most of the patches are RISC-V specific,
so there is a low risk of breaking anything else.
There is only one patch that touches common or arch-specific files, and it
doesn't introduce any functional changes.
Since I can't approve it myself, I am asking for someone else to do so.
***

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

The patch series is based on the following patch series:
 - [PATCH 3/3] xen/ppc: Avoid using the legacy __read_mostly/__ro_after_init definitions [1]

The link to the branch with rebased patches on top of [1] could be found here:
  https://gitlab.com/xen-project/people/olkur/xen/-/commits/riscv-full-xen-build-v13

[1] https://lore.kernel.org/xen-devel/20240621201928.319293-4-andrew.cooper3@citrix.com/

---
Changes in V13:
 - Patch was merged to staging:
   - [PATCH v12 ] xen/riscv: Update Kconfig in preparation for a full
 - Rebase on top of the current staging.
 - Update cover letter message
 - It was added 2 new patches ( patches 8 and 9 ) which are not necessary for testing environment we
   have in CI but they improves compatability with older gcc and binutils.
 - It was added patch 10 as a clean up of [PATCH v12 2/8] xen: introduce generic non-atomic test_*bit()
   for x86.
 - Drop [PATCH v12 4/8] xen/riscv: add definition of __read_mostly as it was defined as generic now
   for all architectures.
 - It was added the patch [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
   to resolve compilation issue for RISC-V after reabsing on top of current staging.
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
---
Changes in V12:
 - Rebase the patch series on top of [1] mentioned above.
 - Update the cover letter message.
 - "[PATCH v11 3/9] xen/bitops: implement fls{l}() in common logic" was droped
   as it is a part of patch series [1] mentioned above.
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
---
Changes in V11:
  - Patch was merged to staging:
    - [PATCH v10 05/14] xen/riscv: introduce cmpxchg.h
	  - [PATCH v10 06/14] xen/riscv: introduce atomic.h
	  - [PATCH v10 07/14] xen/riscv: introduce monitor.h
	  - [PATCH v10 09/14] xen/riscv: add required things to current.h
	  - [PATCH v10 11/14] xen/riscv: introduce vm_event_*() functions
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
---
Changes in V10:
  - Patch was merged to staging:
    - [PATCH v9 04/15] xen/bitops: put __ffs() into linux compatible header
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
---
Changes in V9:
 - Patch was merged to staging:
    - [PATCH v8 07/17] xen/riscv: introduce io.h
  	- [PATCH v7 14/19] xen/riscv: add minimal stuff to page.h to build full Xen
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
---
Changes in V8:
 - Patch was merged to staging:
    - [PATCH v7 01/19] automation: introduce fixed randconfig for RISC-V
    - [PATCH v7 03/19] xen/riscv: introduce extenstion support check by compiler
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
 - Update the commit message:
     - drop the dependency from STATIC_ASSERT_UNREACHABLE() implementation.
     - Add suggestion to merge arch-specific changes related to __read_mostly.
---
Changes in V7:
 - Patch was merged to staging:
   [PATCH v6 15/20] xen/riscv: add minimal stuff to processor.h to build full Xen.
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.
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


Oleksii Kurochko (10):
  xen: introduce generic non-atomic test_*bit()
  xen/riscv: introduce bitops.h
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/riscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64
  xen/common: fix build issue for common/trace.c
  xen/riscv: change .insn to .byte in cpu_relax()
  xen/riscv: introduce ANDN_INSN
  xen/x86: drop constanst_test_bit() in asm/bitops.h

 README                                 |   3 +
 xen/arch/arm/include/asm/bitops.h      |  69 ----
 xen/arch/ppc/include/asm/bitops.h      |  54 ----
 xen/arch/ppc/include/asm/page.h        |   2 +-
 xen/arch/ppc/mm-radix.c                |   2 +-
 xen/arch/riscv/Makefile                |  17 +-
 xen/arch/riscv/arch.mk                 |   4 -
 xen/arch/riscv/early_printk.c          | 168 ----------
 xen/arch/riscv/include/asm/bitops.h    | 137 ++++++++
 xen/arch/riscv/include/asm/cmpxchg.h   |  16 +-
 xen/arch/riscv/include/asm/mm.h        | 235 ++++++++++++++
 xen/arch/riscv/include/asm/processor.h |   2 +-
 xen/arch/riscv/mm.c                    |  43 ++-
 xen/arch/riscv/setup.c                 |  10 +-
 xen/arch/riscv/stubs.c                 | 418 +++++++++++++++++++++++++
 xen/arch/riscv/traps.c                 |  25 ++
 xen/arch/x86/include/asm/bitops.h      |  39 +--
 xen/common/trace.c                     |   1 +
 xen/include/xen/bitops.h               | 182 +++++++++++
 19 files changed, 1096 insertions(+), 331 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/stubs.c

-- 
2.45.2



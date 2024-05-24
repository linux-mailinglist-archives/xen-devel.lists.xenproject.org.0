Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE998CE4BB
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729355.1134489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnF-0003FT-SU; Fri, 24 May 2024 11:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729355.1134489; Fri, 24 May 2024 11:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnF-0003DB-Ps; Fri, 24 May 2024 11:09:01 +0000
Received: by outflank-mailman (input) for mailman id 729355;
 Fri, 24 May 2024 11:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sASnE-0003Cz-IQ
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:09:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0473d943-19be-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 13:08:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-578517c7ae9so891483a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:08:58 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817c81sm116051366b.28.2024.05.24.04.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:08:56 -0700 (PDT)
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
X-Inumbo-ID: 0473d943-19be-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716548937; x=1717153737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJnzblV3ATfhEvm8cpMubqr58bn3DL3t5seeZzPNX1U=;
        b=QsFFGkJWk1BN/99HxBh2Xh0fBoTOV7BcMath7avcRT0AzTHpUSml4LFf+GlqdCnRoj
         9/9B89dFoMs0Ng0lKmSNOh29FSmG0lK5/qPXoEZ/jf3D3Up0kVMlp454+6hnsLMOXERs
         JjQUZb93gGV0cMlpA4ABsaPnWOZ9fFdxlY/TQsbr8AbBx3zmpWDveN9nydiHeuDyyj3m
         92p8RkLUEaG6CmYFr77QSQ9FLmNP1Q7yatZrNlVKaPGuou30d2bE9Sa7J7wciVcFRcrr
         hCOCcvPEWiEEMvQhEp63B+DDlhlX/HVgaup5JKKgFaNHQ82uOIGT3kMjFwIwf5Ur9ktK
         9y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548937; x=1717153737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJnzblV3ATfhEvm8cpMubqr58bn3DL3t5seeZzPNX1U=;
        b=BIGttqGtX4y/OkCFwKU6PNh+kaOq/NP/EMdO/82f+6MLvHE+5ZV0/jDCb2VVhWtg/L
         VeTbFsPl5+MfPSAm7prLZUserSwW+PbtHVYMh2t1aOxxCpozYYh7oqO0LXiwWE/ajPvG
         WaFuvIeyl3JahajkWOzQqmQ44zF/h+iWys0YMxm3HHklR38iqAo7fK6eg2a+aTmY6sH6
         HzN2zM6/Gvd18oU4YNsWheCwX5EB28mppq9oDjTDBrr9w1TTtXlJoWa79wVS082nVY1e
         0ibXfPxwfQ1RbIbD/SXBUoZXIEyTY8qAMIzgn/rrAxrydXHwH6vi5xCsPjUPDB2mjVnJ
         xViQ==
X-Gm-Message-State: AOJu0YwNeC8JhjCSmLAjRX6ACRzm3o+f3LSqtXy/TaTXc2mvoL0npodU
	0+Bt5xOPPQQ5LkCTT5iPs5aLnGVTmyxnos/Y4sR9jEIu2fNGhbuAYOL2tPbj
X-Google-Smtp-Source: AGHT+IGQajXeuKHlMohaunJCnJ8WItq0bGBPNWrIA+V3IdrWxBKN5BeU3lg2l2s8Gh+mKxqfr0RkYw==
X-Received: by 2002:a17:906:f59f:b0:a59:bd14:1f51 with SMTP id a640c23a62f3a-a62645d654amr155463766b.41.1716548937002;
        Fri, 24 May 2024 04:08:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v11 0/9] Enable build of full Xen for RISC-V
Date: Fri, 24 May 2024 13:08:46 +0200
Message-ID: <cover.1716547693.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs all of the additions necessary to drop the
build overrides for RISCV and enable the full Xen build. Except in cases
where compatibile implementations already exist (e.g. atomic.h and
bitops.h), the newly added definitions are simple.

The patch series is based on the following patch series:
- [PATCH 0/7] xen/bitops: Reduce the mess, starting with ffs() [1]
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.
As an option, it can be considered to merge arch-specific patch and then just
rebase [2] and drop arch-specific changes.

[1] https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t
[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

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
Oleksii Kurochko (9):
  xen/riscv: disable unnecessary configs
  xen: introduce generic non-atomic test_*bit()
  xen/bitops: implement fls{l}() in common logic
  xen/riscv: introduce bitops.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/riscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64

 README                                  |   4 +
 automation/gitlab-ci/build.yaml         |   4 +
 xen/arch/arm/include/asm/arm32/bitops.h |   2 +-
 xen/arch/arm/include/asm/arm64/bitops.h |   6 +-
 xen/arch/arm/include/asm/bitops.h       |  78 +----
 xen/arch/ppc/include/asm/bitops.h       |  56 ----
 xen/arch/ppc/include/asm/page.h         |   2 +-
 xen/arch/ppc/mm-radix.c                 |   2 +-
 xen/arch/riscv/Makefile                 |  17 +-
 xen/arch/riscv/arch.mk                  |   4 -
 xen/arch/riscv/configs/tiny64_defconfig |  12 +-
 xen/arch/riscv/early_printk.c           | 168 ----------
 xen/arch/riscv/include/asm/bitops.h     | 137 ++++++++
 xen/arch/riscv/include/asm/cache.h      |   2 +
 xen/arch/riscv/include/asm/domain.h     |   2 +
 xen/arch/riscv/include/asm/mm.h         | 240 ++++++++++++++
 xen/arch/riscv/include/asm/p2m.h        |   2 +
 xen/arch/riscv/mm.c                     |  52 ++-
 xen/arch/riscv/setup.c                  |  10 +-
 xen/arch/riscv/stubs.c                  | 415 ++++++++++++++++++++++++
 xen/arch/riscv/traps.c                  |  25 ++
 xen/arch/x86/include/asm/bitops.h       |  43 +--
 xen/common/page_alloc.c                 |   4 +-
 xen/include/xen/bitops.h                | 209 ++++++++++++
 24 files changed, 1147 insertions(+), 349 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/stubs.c

-- 
2.45.0



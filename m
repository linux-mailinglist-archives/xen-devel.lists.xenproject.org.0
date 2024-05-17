Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A88C878A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724178.1129356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3C-0001i7-4a; Fri, 17 May 2024 13:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724178.1129356; Fri, 17 May 2024 13:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3C-0001fb-1y; Fri, 17 May 2024 13:55:10 +0000
Received: by outflank-mailman (input) for mailman id 724178;
 Fri, 17 May 2024 13:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3B-0001cB-6C
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:09 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12488c2d-1455-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:55:08 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51f174e316eso741759e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:06 -0700 (PDT)
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
X-Inumbo-ID: 12488c2d-1455-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954107; x=1716558907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zat0qaq8czAsPhXnTr4M/ns8tt3lB7uw+7Hy5UjY58=;
        b=kEmKG0R4OsT5cvja9/IAe+ezVp1WiX0sYAHEf4snv/YH+PvEfaCXg1r1n4Xur8Hz1A
         V7xNlf+XdR11UkhF0SUvcvJPjUtYEuzyz8wAu8fjQsV3oWsikO5VYnx+KnAFl/so/ud6
         KqcQRRea5XeFddJnwolHEawHXPrKeJfkJppQveqOwerBo24WOx+HvYG3cLjorgaGOh18
         w9u+lQEEefWFkLsVXPv8HE2foUURdVEB1RC7ZIIZ5es8OC7O8/U027inI6mHqTGLnZVU
         V4F9Vzn9bsuNnNZUkMw0DuZzPHHCsh96gBukkF+W3oUqEDbV2ynKABLvK1P+R8Ti040u
         8Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954107; x=1716558907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zat0qaq8czAsPhXnTr4M/ns8tt3lB7uw+7Hy5UjY58=;
        b=tCwEtqWx+61bGU0TtXW7XBfdD5l/+L3Sp3BAmyo7px6qjOg6ZL1W0ZL5yN+pRrYk56
         v3n43Fj5oXsO8lqoo5kTr+blTXJvbzV+iMnNSFcavhTf/wIK9cyzbAurK8SITKDlBXkE
         +RxDZctSMfmabcA4+kD2NTPJRBbJTvLPS+JoNpLQtHWkqZto7EH1JbnLQ1E90ui0vYz5
         4jIPrcW8BiVqmKnrebw5HVNVyL+oGxlBRkAThKmRc6orsTe/+20ayho9AM1l848pplfq
         EM9x8nPcJ5FFKP2LHK/anwg+mT2IjNnJTr5iBxJRVaE6iMZUju1/g30Z/kqFSgCTuHK/
         MPDw==
X-Gm-Message-State: AOJu0YwUVON6H1X/2fpsrPInAHRHv3/fJVQSdtkT6kGieMKlcUO/924L
	bUBr8s6GwpOUSUH3rZ1RwOCjtHt4d9YXWePFaRn6+xY8ET4tHr2fE2ZV/gdw
X-Google-Smtp-Source: AGHT+IH6zdXU24EUIAVRScxLXMjJ/UC/CV4kd7SskYpsZ4Kqe3loCkAnKfktM/2pzTcc5IBMF0ZLxw==
X-Received: by 2002:ac2:592f:0:b0:523:89b0:9b64 with SMTP id 2adb3069b0e04-52389b09bbdmr6058436e87.7.1715954107129;
        Fri, 17 May 2024 06:55:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v10 00/14] Enable build of full Xen for RISC-V
Date: Fri, 17 May 2024 15:54:49 +0200
Message-ID: <cover.1715952103.git.oleksii.kurochko@gmail.com>
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

Oleksii Kurochko (14):
  xen/riscv: disable unnecessary configs
  xen: introduce generic non-atomic test_*bit()
  xen/bitops: implement fls{l}() in common logic
  xen/riscv: introduce bitops.h
  xen/riscv: introduce cmpxchg.h
  xen/riscv: introduce atomic.h
  xen/riscv: introduce monitor.h
  xen/riscv: add definition of __read_mostly
  xen/riscv: add required things to current.h
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/riscv: introduce vm_event_*() functions
  xen/riscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64

 README                                  |   4 +
 automation/gitlab-ci/build.yaml         |   4 +
 xen/arch/arm/arm64/livepatch.c          |   1 -
 xen/arch/arm/include/asm/arm32/bitops.h |   2 +-
 xen/arch/arm/include/asm/arm64/bitops.h |   6 +-
 xen/arch/arm/include/asm/bitops.h       |  76 +----
 xen/arch/ppc/include/asm/bitops.h       |  55 ----
 xen/arch/ppc/include/asm/page.h         |   2 +-
 xen/arch/ppc/mm-radix.c                 |   2 +-
 xen/arch/riscv/Makefile                 |  18 +-
 xen/arch/riscv/arch.mk                  |   4 -
 xen/arch/riscv/configs/tiny64_defconfig |  12 +-
 xen/arch/riscv/early_printk.c           | 168 ----------
 xen/arch/riscv/include/asm/atomic.h     | 280 ++++++++++++++++
 xen/arch/riscv/include/asm/bitops.h     | 137 ++++++++
 xen/arch/riscv/include/asm/cache.h      |   2 +
 xen/arch/riscv/include/asm/cmpxchg.h    | 241 ++++++++++++++
 xen/arch/riscv/include/asm/config.h     |   2 +
 xen/arch/riscv/include/asm/current.h    |  19 ++
 xen/arch/riscv/include/asm/domain.h     |   2 +
 xen/arch/riscv/include/asm/mm.h         | 240 ++++++++++++++
 xen/arch/riscv/include/asm/monitor.h    |  26 ++
 xen/arch/riscv/include/asm/p2m.h        |   2 +
 xen/arch/riscv/mm.c                     |  52 ++-
 xen/arch/riscv/setup.c                  |  10 +-
 xen/arch/riscv/stubs.c                  | 415 ++++++++++++++++++++++++
 xen/arch/riscv/traps.c                  |  25 ++
 xen/arch/riscv/vm_event.c               |  19 ++
 xen/arch/x86/include/asm/bitops.h       |  43 +--
 xen/common/bitops.c                     |  22 ++
 xen/common/page_alloc.c                 |   4 +-
 xen/include/asm-generic/atomic-ops.h    |  97 ++++++
 xen/include/xen/bitops.h                | 155 +++++++++
 33 files changed, 1800 insertions(+), 347 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
 create mode 100644 xen/arch/riscv/include/asm/monitor.h
 create mode 100644 xen/arch/riscv/stubs.c
 create mode 100644 xen/arch/riscv/vm_event.c
 create mode 100644 xen/include/asm-generic/atomic-ops.h

-- 
2.45.0



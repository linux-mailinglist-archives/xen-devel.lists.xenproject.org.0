Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB7923BF2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752280.1160459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGc-0000c6-Mn; Tue, 02 Jul 2024 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752280.1160459; Tue, 02 Jul 2024 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGc-0000Yv-JQ; Tue, 02 Jul 2024 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 752280;
 Tue, 02 Jul 2024 11:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGa-0000Yf-Kn
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76849f6b-3862-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:01:42 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a72988749f0so605710066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:40 -0700 (PDT)
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
X-Inumbo-ID: 76849f6b-3862-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918101; x=1720522901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VseXVwK7PdqYilTQ2Brl9sl5/J9tRpKpCtSSq7n/V58=;
        b=fqu4U82iWzJXUk10zR2rkGMZHhkrJ4wm8zKzPl4nNz92PDQHtQRvyPs0KK3VCbfJ3e
         l49aYXE6v5VZ0/Qyl9MIWSO8E/zyexchYEXkbHCCv5XIISM+4VyXg+9Aaj9jQizv2/9u
         kgsfsf0BV97cPZnw8/GNtdJTWn2NFLVvdivNOeA7CYISgruV+r+PAhkevV8v3VkoJGQK
         5A4PVJDFFImCamsK1XCkzbC7PIKoI2nLH71Fnhz5zaj+8789L+S/A7m+aenj/+X1jJjf
         rr7yt/eDJBwaJUVWrosB+xyNRtAkRC/Al0Ae7ZO/MF6HP5rHRMdTTAXYnOAHSYi5JJZ3
         zDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918101; x=1720522901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VseXVwK7PdqYilTQ2Brl9sl5/J9tRpKpCtSSq7n/V58=;
        b=KIoUlEo5Hd9dxVaUWRg0yYsMpksED3v/inyE/w2/+MMvMgw3uiB8LkQX0neNcN2jXc
         0OdsdBTh/IoPRZZBWCHaRzwXia6cGvQI6R7E9Cepy7i//CHA7TNM994OLE//cn8+l3YJ
         HjQLWGnQNvIJnU/y+6C/rLUfIMegSOSZqJTKhRYgH0I8g9VGXt1EZryD3L/99zB8+Dsd
         6D7rAZ8I7qQ+Hp0Cb0nDkGlF0oLLeolch7dwFAu1H6yogJH/WMf0j+Ffo+9NFQSiw2dc
         I47OX0C4QAtT0SlWzK7F35eCwinlExnz9R+cHglngh+IZHSqZVH2ovl3fWtp8SVQZ/FK
         Dlew==
X-Gm-Message-State: AOJu0YxgaC2rFV1mcE59/y8s0OoQ6MKtLdxwUQVpfAG52zLbMjVua+Zm
	WmeHaAjXEk9+VTGmz4nr2SdO9UwRzDRA+m6ikDIJclyXRvE7WssGPuUJb/CS
X-Google-Smtp-Source: AGHT+IGk64DbJh7RWACrFPqxxx/LhzPUXBzkFo5wjGPgm/YkGa/v8iX+lzh5+4w3I18mQvB77ZXZ7g==
X-Received: by 2002:a17:906:1ece:b0:a72:8c15:c73e with SMTP id a640c23a62f3a-a75144f638dmr495444566b.55.1719918100586;
        Tue, 02 Jul 2024 04:01:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH for 4.20 v14 0/9] Enable build of full Xen for RISC-V
Date: Tue,  2 Jul 2024 13:01:27 +0200
Message-ID: <cover.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Changes in V14:
 - Update the cover letter message ( add tag 4.20 and drop a request to have this
   patch series in 4.19 ).
 - The following patch were merged to staging:
     [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
 - Other changes are specific to specific patches. Please look at changes for
   specific patch.   
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

Oleksii Kurochko (9):
  xen: introduce generic non-atomic test_*bit()
  xen/riscv: introduce bitops.h
  xen/riscv: add minimal stuff to mm.h to build full Xen
  xen/riscv: add minimal amount of stubs to build full Xen
  xen/riscv: enable full Xen build
  xen/README: add compiler and binutils versions for RISC-V64
  xen/riscv: use .insn with operands to support the older gas
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
 xen/arch/riscv/include/asm/cmpxchg.h   |  15 +-
 xen/arch/riscv/include/asm/mm.h        | 235 ++++++++++++++
 xen/arch/riscv/include/asm/processor.h |   2 +-
 xen/arch/riscv/mm.c                    |  43 ++-
 xen/arch/riscv/setup.c                 |  10 +-
 xen/arch/riscv/stubs.c                 | 418 +++++++++++++++++++++++++
 xen/arch/riscv/traps.c                 |  25 ++
 xen/arch/x86/include/asm/bitops.h      |  39 +--
 xen/include/xen/bitops.h               | 182 +++++++++++
 18 files changed, 1094 insertions(+), 331 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/arch/riscv/stubs.c

-- 
2.45.2



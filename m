Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29FE8CEAA0
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729745.1134999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8l-0007DD-Ls; Fri, 24 May 2024 20:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729745.1134999; Fri, 24 May 2024 20:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8l-00079e-Fg; Fri, 24 May 2024 20:03:47 +0000
Received: by outflank-mailman (input) for mailman id 729745;
 Fri, 24 May 2024 20:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8k-000773-1Y
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:46 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8f00521-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:43 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57851e8b891so1960666a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:43 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:42 -0700 (PDT)
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
X-Inumbo-ID: b8f00521-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581023; x=1717185823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DI2nCTbDNK8GGdRlkLTCOYJkS9ZJd3XmZjCbJg+i8E=;
        b=CTURHOIdWxwiOiOg7oKUlc8hcvygFq6JFi0vfUj1DHPGbK4bCK4H50FJgT7gi8EcAT
         fbmI1Hgjw1B16SJIplFVG34aykFRlEMnDfR4ssdMLXscMc1WKign4W7suEiyuqXa7IqI
         tBqxhCSFjhqvrAeJZTxKtKzukOCylLCU175iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581023; x=1717185823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DI2nCTbDNK8GGdRlkLTCOYJkS9ZJd3XmZjCbJg+i8E=;
        b=UIwxZcYkIysnjT2sBfLTd5tS0Vsa4pnBixMOkIdAfEgf2cRLWBijr6Lig6yWx1lfKL
         7uXy8d/+QZz/G6QjFEWbo57r2oovKxbuk7XXeV63appU5/iobDnBDnGxFRO1Zpfm0GVG
         PEWxQwywpXZtSehHcykSzDMCHkYIJk/9Q2jXBGemT0u98juyik1UvLlaDViEx8nNAnDJ
         ECkZfx8DBoOhTRfhDUhqOZfrfUpj29vCtVI5DSew5odvientpduZIjPohp32FzR2fJJn
         D4NLaecJKfcuvVvKy3rAHqSb61EXYBmFwK/M0Jfs8IieZNB+hSCYCNYYxaedxA9hj09n
         Ys+w==
X-Gm-Message-State: AOJu0YyTU1h4iysD3RrCg3Q8MWn/zXsHs5fVKkihIweqEnSNdv6NzTVm
	s99mXBVFDnTB5D7YMELtMKp0IwctwhytDrxQjR1m8cw6meN/Dz4h/3+IOJ1BuxNmZZFIrI/GW2I
	pNzE=
X-Google-Smtp-Source: AGHT+IHtx2CakoNT3GAJbyRmjB+SV1sRndmi8tJ1g5NZaHxGMRzrt42n3ko48q6I8MnNs1MxySMElg==
X-Received: by 2002:a17:906:cccf:b0:a5d:239:1a59 with SMTP id a640c23a62f3a-a623e6d544fmr502847466b.3.1716581022890;
        Fri, 24 May 2024 13:03:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 for-4.19 00/13] xen/bitops: Untangle ffs()/fls() infrastructure
Date: Fri, 24 May 2024 21:03:25 +0100
Message-Id: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bitops.h is a mess.  It has grown organtically over many years, and forces
unreasonable repsonsibilities out into the per-arch stubs.

Start cleaning it up with ffs() and friends.  Across the board, this adds:

 * Functioning bitops without arch-specific asm
 * An option for arches to provide more optimal code generation
 * Compile-time constant folding
 * Testing at both compile time and during init that the basic operations
   behave according to spec.

and the only reason this series isn't a net reduction in code alone is the
because of the new unit testing.

This form is superior in many ways, including getting RISC-V support for free.

v2:
 * Many changes.  See patches for details
 * Include the fls() side of the infrastructure too.

Testing:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1304664544
  https://cirrus-ci.com/github/andyhhp/xen/

Series-wide net bloat-o-meter:

  x86:   up/down: 51/-247 (-196)
  ARM64: up/down: 40/-400 (-360)

and PPC64 reproduced in full, just to demonstrate how absurd it was to have
generic_f?s() as static inlines...

  add/remove: 1/0 grow/shrink: 1/11 up/down: 228/-4832 (-4604)
  Function                                     old     new   delta
  init_constructors                              -     220    +220
  start_xen                                     92     100      +8
  alloc_heap_pages                            1980    1744    -236
  xenheap_max_mfn                              360     120    -240
  free_heap_pages                              784     536    -248
  find_next_zero_bit                           564     276    -288
  find_next_bit                                548     260    -288
  find_first_zero_bit                          444     148    -296
  find_first_bit                               444     132    -312
  xmem_pool_free                              1776    1440    -336
  __do_softirq                                 604     252    -352
  init_heap_pages                             2328    1416    -912
  xmem_pool_alloc                             2920    1596   -1324


Andrew Cooper (12):
  ppc/boot: Run constructors on boot
  xen/bitops: Cleanup ahead of rearrangements
  ARM/bitops: Change find_first_set_bit() to be a define
  xen/page_alloc: Coerce min(flsl(), foo) expressions to being unsigned
  xen/bitops: Implement generic_f?sl() in lib/
  xen/bitops: Implement ffs() in common logic
  x86/bitops: Improve arch_ffs() in the general case
  xen/bitops: Implement ffsl() in common logic
  xen/bitops: Replace find_first_set_bit() with ffsl() - 1
  xen/bitops: Delete find_first_set_bit()
  xen/bitops: Clean up ffs64()/fls64() definitions
  xen/bitops: Rearrange the top of xen/bitops.h

Oleksii Kurochko (1):
  xen/bitops: Implement fls()/flsl() in common logic

 xen/arch/arm/include/asm/arm32/bitops.h      |   2 -
 xen/arch/arm/include/asm/arm64/bitops.h      |  12 --
 xen/arch/arm/include/asm/bitops.h            |  35 +---
 xen/arch/ppc/include/asm/bitops.h            |  17 +-
 xen/arch/ppc/setup.c                         |   2 +
 xen/arch/x86/guest/xen/xen.c                 |   4 +-
 xen/arch/x86/hvm/dom0_build.c                |   2 +-
 xen/arch/x86/hvm/hpet.c                      |   8 +-
 xen/arch/x86/include/asm/bitops.h            | 114 +++++++------
 xen/arch/x86/include/asm/pt-contig-markers.h |   2 +-
 xen/arch/x86/mm.c                            |   2 +-
 xen/arch/x86/mm/p2m-pod.c                    |   4 +-
 xen/common/Makefile                          |   1 +
 xen/common/bitops.c                          |  89 +++++++++++
 xen/common/page_alloc.c                      |   6 +-
 xen/common/softirq.c                         |   2 +-
 xen/drivers/passthrough/amd/iommu_map.c      |   2 +-
 xen/drivers/passthrough/iommu.c              |   4 +-
 xen/drivers/passthrough/x86/iommu.c          |   4 +-
 xen/include/xen/bitops.h                     | 159 ++++++++-----------
 xen/include/xen/boot-check.h                 |  60 +++++++
 xen/include/xen/compiler.h                   |   3 +-
 xen/lib/Makefile                             |   2 +
 xen/lib/generic-ffsl.c                       |  65 ++++++++
 xen/lib/generic-flsl.c                       |  68 ++++++++
 25 files changed, 444 insertions(+), 225 deletions(-)
 create mode 100644 xen/common/bitops.c
 create mode 100644 xen/include/xen/boot-check.h
 create mode 100644 xen/lib/generic-ffsl.c
 create mode 100644 xen/lib/generic-flsl.c

-- 
2.30.2



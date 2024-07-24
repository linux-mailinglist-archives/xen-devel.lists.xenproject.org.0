Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385993B3B2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764289.1174709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxz-0007RB-C6; Wed, 24 Jul 2024 15:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764289.1174709; Wed, 24 Jul 2024 15:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxz-0007NG-90; Wed, 24 Jul 2024 15:31:47 +0000
Received: by outflank-mailman (input) for mailman id 764289;
 Wed, 24 Jul 2024 15:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdxy-0005Od-3v
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:46 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d52a2c92-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:44 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ef1c12ae23so49921801fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:44 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:43 -0700 (PDT)
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
X-Inumbo-ID: d52a2c92-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835104; x=1722439904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6EXp2HkQVB8UrhglnsBxDgtSrAqoItcHexdbcYlEvM=;
        b=NjiOf5lJWw7W7Qu2FYVUs82TVabQi1M2DH2ROth79yekgJLBIEXSlFb8ewrf649pzC
         ngSGMVD9o91SP1cIRU4Zd+/4nSZReZQWvU96+0xN/ZHX+evvQqngbi9wSQWqLx8OXJ9m
         UxLd7MbQgu1Gri7Tq7qeA8nZX/9hWRuDZJJAiiSNTa2PPHQOwgE/QiLlHBl9zjWJfy6F
         hAV2huwk6k9Gsgj9GfzDvBzi8A8wbY4oKvHO1ty7uLkIK4TmFPqoQVsr8A5Ks+JKVQww
         Gs4DRP1G6d2Dwly4cRGY9dzUoagQDIaKKLjePVlnY3hXpQE0QhST4ZdA53PzdVaLrXpp
         bBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835104; x=1722439904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6EXp2HkQVB8UrhglnsBxDgtSrAqoItcHexdbcYlEvM=;
        b=LDR72oXOLNzH9SZCR39sGRpjCxu+Ox5FVepecJWNngsBemtBu9et7jeJc9c3K9HW07
         IcWBOMGTCUwBpEZMSAKy5tlaXfBtGdSx9eRLYyyBjflRbs+CUoCDY71mWjga3ek3BzzZ
         Dqrt95Lvcs9QU84s0hgejvcMPeQhpIBWVST2nBcJfmlAE0hRPpsNypUeEqAqnHKINQsX
         NsxkhWcFnkir6c63D11iMiFl1BUxJyAbSO7KrSJz2pHob75tHFXh8oqnWlJh2362GhGe
         Lywr6YGiKWbEgEtICD0z2txANEMG2nHgu9LrresWZmrJ0+T2FObZH/1i4q1oxLG1iptX
         FP2g==
X-Gm-Message-State: AOJu0YwN/qWursyk+q8/Rhkjp5YVkJhYU7hu3XPm8j/omZ+LAF9A4asb
	qpgkTKV+rKZnO6/G6rIldw7h4K5Tvxs3/OUnrRc1V2dlzN32Okfh/q11Y4Lf
X-Google-Smtp-Source: AGHT+IFqCl0athOfpD4+ml5FENpESTH7jrVQRDChYNM1L6Ka7N3dNIf8g4l10uSwAlKA5uaKrbJqiw==
X-Received: by 2002:a2e:3812:0:b0:2ef:32bb:536f with SMTP id 38308e7fff4ca-2f039d9438cmr1563071fa.36.1721835103577;
        Wed, 24 Jul 2024 08:31:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 0/9] RISCV device tree mapping
Date: Wed, 24 Jul 2024 17:31:31 +0200
Message-ID: <cover.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

Also, it introduces common stuff for working with fdt which is
based on the patches from [1]:
  [PATCH v4 2/6] xen/device-tree: Move Arm's setup.c bootinfo functions to common
  [PATCH v4 3/6] xen/common: Move Arm's bootfdt.c
All changes which were done on top of Shawn's patches please find in "Changes" section
of each patch.

Also there is another one depenency:
RISCV basic exception handling implementation [2]

[1] https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengineering.com/
[2] https://lore.kernel.org/xen-devel/cover.1720799487.git.oleksii.kurochko@gmail.com/T/#t

---
Changes in v3:
 - Introduce SBI RFENCE extension support.
 - Introduce and initialize pcpu_info[] and __cpuid_to_hartid_map[] and functionality
   to work with this arrays.
 - Make page table handling arch specific instead of trying to make it generic.
 - All other changes are patch specific so please look at the patch.
---
Changes in v2:
 - Update the cover letter message
 - introduce fixmap mapping
 - introduce pmap
 - introduce CONFIG_GENREIC_PT
 - update use early_fdt_map() after MMU is enabled.
---

Oleksii Kurochko (7):
  xen/riscv: enable CONFIG_HAS_DEVICE_TREE
  xen/riscv: setup fixmap mapping
  xen/riscv: introduce asm/pmap.h header
  xen/riscv: introduce functionality to work with cpu info
  xen/riscv: introduce and init SBI RFENCE extension
  xen/riscv: page table handling
  xen/riscv: introduce early_fdt_map()

Shawn Anastasio (2):
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common

 MAINTAINERS                            |    2 +
 xen/arch/arm/Makefile                  |    1 -
 xen/arch/arm/bootfdt.c                 |  622 -------
 xen/arch/arm/include/asm/setup.h       |  198 +--
 xen/arch/arm/setup.c                   |  432 -----
 xen/arch/riscv/Kconfig                 |    3 +
 xen/arch/riscv/Makefile                |    3 +
 xen/arch/riscv/include/asm/config.h    |    8 +
 xen/arch/riscv/include/asm/fixmap.h    |   44 +
 xen/arch/riscv/include/asm/flushtlb.h  |   37 +
 xen/arch/riscv/include/asm/mm.h        |    6 +
 xen/arch/riscv/include/asm/page-bits.h |   36 +
 xen/arch/riscv/include/asm/page.h      |   84 +-
 xen/arch/riscv/include/asm/pmap.h      |   33 +
 xen/arch/riscv/include/asm/processor.h |   35 +-
 xen/arch/riscv/include/asm/sbi.h       |   57 +
 xen/arch/riscv/include/asm/smp.h       |   10 +
 xen/arch/riscv/mm.c                    |  120 +-
 xen/arch/riscv/pt.c                    |  410 +++++
 xen/arch/riscv/sbi.c                   |  256 +++
 xen/arch/riscv/setup.c                 |   27 +
 xen/arch/riscv/smp.c                   |    4 +
 xen/arch/riscv/smpboot.c               |   12 +
 xen/arch/riscv/xen.lds.S               |    2 +-
 xen/common/Makefile                    |    2 +-
 xen/common/device-tree/Makefile        |    3 +
 xen/common/device-tree/bootfdt.c       |  635 +++++++
 xen/common/device-tree/bootinfo.c      |  459 +++++
 xen/common/device-tree/device_tree.c   | 2253 ++++++++++++++++++++++++
 xen/common/device_tree.c               | 2253 ------------------------
 xen/include/xen/bootfdt.h              |  209 +++
 31 files changed, 4740 insertions(+), 3516 deletions(-)
 delete mode 100644 xen/arch/arm/bootfdt.c
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/arch/riscv/pt.c
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c
 create mode 100644 xen/common/device-tree/Makefile
 create mode 100644 xen/common/device-tree/bootfdt.c
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/common/device-tree/device_tree.c
 delete mode 100644 xen/common/device_tree.c
 create mode 100644 xen/include/xen/bootfdt.h

-- 
2.45.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C598893B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806487.1217890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDzt-0001Zl-BI; Fri, 27 Sep 2024 16:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806487.1217890; Fri, 27 Sep 2024 16:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDzt-0001Xx-7h; Fri, 27 Sep 2024 16:39:13 +0000
Received: by outflank-mailman (input) for mailman id 806487;
 Fri, 27 Sep 2024 16:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuK-0001aC-Sm
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37dbb74f-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:25 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d43657255so339160066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:24 -0700 (PDT)
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
X-Inumbo-ID: 37dbb74f-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454805; x=1728059605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7MdF66dMXnYDdAsv4RVZ6qT8YweaA6jkpKVhqtxj7c=;
        b=hLaYIy1fScokoPqf12JNcdMsaKRNrTb+eCtjzxcxDV1ymz2K1AS8Lee4DEu4h3dKne
         8o4nGZ3UuvMVRIhMoo7ZJHQeCowuTSEBRsWUAIJLvuVephDr7C6xjU8CsOdJMSS+h8Vh
         tlyQyhrsm5jn8JTyBmMdidbKQ0tGMJD3iNEwPk1Z2u0bzMxPnCQ2G6CLLt50d1x7LcSJ
         vMprDHWyFUTPfoGeU6SlLXsd+TCdb/txE91QvvEYKi5Zth17O/MyRj37nQVaty7UY3j0
         KgrZlbSfQuWC/Y0yewUNSaKsZkNpRjU2K9K97ymadqVQr2Tf5Z7TQWw9wDRVwoiqYS2p
         QDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454805; x=1728059605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7MdF66dMXnYDdAsv4RVZ6qT8YweaA6jkpKVhqtxj7c=;
        b=Nwh8xCtUwKNzfvnBsEAHdtTpv8iDW6UR2IAUtaVwwsUQlyQWtXCL9+RgjYsGrNEBec
         5LcF08YyGmq88lv409wcExdSQiGoXj7lIy4FHxSlm4W5HZIKqKh6Iwq+RacBZcLl5xyW
         Ej1e3xrstthZLWcAiTj/6CqOD4ecr6w8rOeRcL1CqgTP8XenEDupHKImAk42mU1UlaAS
         kqCvW+PMvxXZhFt8TLg4IPiyHyLe4gFxkzi7IMOlgG6gYLMm5BSbWATKSngtOvtmcG4K
         kwqT/eomfjcbj/DgP/1zNtOgdUv93fta7bDTrmxDC73BLy4ajeKCOd4t0YF0QjYGxNSy
         k1ag==
X-Gm-Message-State: AOJu0YxJ/IxOoPu3p5rL7SkMquHsIGCttvEghN9bMSUD6zkDTGMCYQfZ
	9fHcylIry5UNClWSO8FbeCcjLi26AHzhFpj0M9KjWot4MfyPOAfA5NmFcg==
X-Google-Smtp-Source: AGHT+IGJql9OxJgNVQt2UsKsRgOuQ0w6qnUgWAiUBnlMtovYE7/QJYvJAumlig7E6omuMmA8kWfDtQ==
X-Received: by 2002:a17:907:9493:b0:a77:cca9:b212 with SMTP id a640c23a62f3a-a93c4a60b54mr398886566b.45.1727454804477;
        Fri, 27 Sep 2024 09:33:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 0/7] device tree mapping
Date: Fri, 27 Sep 2024 18:33:12 +0200
Message-ID: <cover.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

---
Changes in v8:
 - The following patch was merged to staging:
     [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
 - All other changes are patch specific so please look at the patch.
---
Changes in v7:
 - Drop the patch "xen/riscv: prevent recursion when ASSERT(), BUG*(), or panic() are called"
 - All other changes are patch specific so please look at the patch.
---
Changes in v6:
 - Add patch to fix recursion when ASSERT(), BUG*(), panic() are called.
 - Add patch to allow write_atomic() to work with  non-scalar types for consistence
   with read_atomic().
 - All other changes are patch specific so please look at the patch. 
---
Changes in v5:
 - The following patch was merged to staging:
     [PATCH v3 3/9] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
 - Drop depedency from "RISCV basic exception handling implementation" as
   it was meged to staging branch.
 - All other changes are patch specific so please look at the patch.
---
Changes in v4:
 - Drop depedency from common devicre tree patch series as it was merged to
   staging.
 - Update the cover letter message.
 - All other changes are patch specific so please look at the patch.
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
  xen/riscv: allow write_atomic() to work with non-scalar types
  xen/riscv: set up fixmap mappings
  xen/riscv: introduce asm/pmap.h header
  xen/riscv: introduce functionality to work with CPU info
  xen/riscv: introduce and initialize SBI RFENCE extension
  xen/riscv: page table handling
  xen/riscv: introduce early_fdt_map()

 xen/arch/riscv/Kconfig                      |   1 +
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/include/asm/atomic.h         |  11 +-
 xen/arch/riscv/include/asm/config.h         |  16 +-
 xen/arch/riscv/include/asm/current.h        |  27 +-
 xen/arch/riscv/include/asm/fixmap.h         |  46 +++
 xen/arch/riscv/include/asm/flushtlb.h       |  15 +
 xen/arch/riscv/include/asm/mm.h             |   6 +
 xen/arch/riscv/include/asm/page.h           |  99 +++++
 xen/arch/riscv/include/asm/pmap.h           |  36 ++
 xen/arch/riscv/include/asm/processor.h      |   3 -
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  62 +++
 xen/arch/riscv/include/asm/smp.h            |  18 +
 xen/arch/riscv/mm.c                         | 101 ++++-
 xen/arch/riscv/pt.c                         | 421 ++++++++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c        |   3 +
 xen/arch/riscv/riscv64/head.S               |  14 +
 xen/arch/riscv/sbi.c                        | 273 ++++++++++++-
 xen/arch/riscv/setup.c                      |  17 +
 xen/arch/riscv/smp.c                        |  15 +
 xen/arch/riscv/xen.lds.S                    |   2 +-
 22 files changed, 1171 insertions(+), 19 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/arch/riscv/pt.c
 create mode 100644 xen/arch/riscv/smp.c

-- 
2.46.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9E968C93
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788306.1197812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQk-0002w3-Qn; Mon, 02 Sep 2024 17:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788306.1197812; Mon, 02 Sep 2024 17:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQk-0002ss-O0; Mon, 02 Sep 2024 17:01:30 +0000
Received: by outflank-mailman (input) for mailman id 788306;
 Mon, 02 Sep 2024 17:01:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQi-0002e4-SH
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd62cb2-694c-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 19:01:27 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5343eeb4973so6794395e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:24 -0700 (PDT)
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
X-Inumbo-ID: fdd62cb2-694c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296486; x=1725901286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzdIUadINpa+Ubifjdyp4TQMayGTpc5idrtnbU8z3pU=;
        b=dd0lthEdSnfXBLJ6gnUG5e8LUfV/kCAQevZgjc4mJS1WiylS6HVAGHJ/eWClqPfJAR
         H7C32JoUVFCw7xHZR2BC+NeRQXg73na7QV26lZsr58CU25vc43XB6kzXGZUALQ5e4NG8
         xItGvmarUpANkJR2yGiwzSmJeIBO/G2PBJZmIr/fj+Cwu6U3/OXAQV24FxYjZCQ5WYfl
         fdZhylrQmJ1e/WwlPZV/svbykweqAEL0o0S9BQxf22E70IIfVlTPgFlaxBYfeMr7jp54
         CIA6k5304oVsuLpg51BmVI4u5QWTWQkhLJ8D/DuOwQye9tq2RC7dK55MSEPcxT8o27YF
         lXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296486; x=1725901286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzdIUadINpa+Ubifjdyp4TQMayGTpc5idrtnbU8z3pU=;
        b=EmMtUmgfo6ZywDSsqKpB+dcsFQBv4SBYgWEREc9neT9ETP7f/uFYPVnmQnUh3Hgis0
         RlKrKm3nWDS4XVXmk9q7Lw/jSmLUQcZB1MicGDG2RKyS41v482DToLk+uZLZWEYXbujK
         ttwaAs68+7k0Ws00RRZgx/sTokqcB0iXW9w9Jk5+AhS910H+D+Z7q5Bo+X/4WY12BQ2J
         rwDIR/mTThklX5s97aye59ouqSgzNAIeeHISNIm8vYTywjyWBHj1ZYqwHrTRssBFkwzA
         yn82l7gqEYUU8ZwF6e1qQzBBJBBWzcbUfmInjbYj9H257OBv70HuedthF0l2YEEVDPwE
         vB6w==
X-Gm-Message-State: AOJu0Yxuh9mRrk1dsTHVQEHwUay7v/4bD5iI5div2K3PGEOcS+ku2olg
	CtKiuy4Z6EylKKBnqzbhjvPnnROxFPiOardusImQZ18tpuHiHEZnF7cnnw==
X-Google-Smtp-Source: AGHT+IGOQs7MhwOkQEA7G8M8YIXjRnkD86n1m2t570J73sHdXMpY5EQttEZ7uqN6ZyvP2Kj/6dDttA==
X-Received: by 2002:a05:6512:3054:b0:52c:76ac:329b with SMTP id 2adb3069b0e04-53546b5da64mr10291191e87.35.1725296485256;
        Mon, 02 Sep 2024 10:01:25 -0700 (PDT)
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
Subject: [PATCH v6 0/9] RISCV device tree mapping
Date: Mon,  2 Sep 2024 19:01:13 +0200
Message-ID: <cover.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

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

Oleksii Kurochko (9):
  xen/riscv: prevent recursion when ASSERT(), BUG*(), or panic() are
    called
  xen/riscv: use {read,write}{b,w,l,q}_cpu() to define
    {read,write}_atomic()
  xen/riscv: allow write_atomic() to work with non-scalar types
  xen/riscv: set up fixmap mappings
  xen/riscv: introduce asm/pmap.h header
  xen/riscv: introduce functionality to work with CPU info
  xen/riscv: introduce and initialize SBI RFENCE extension
  xen/riscv: page table handling
  xen/riscv: introduce early_fdt_map()

 xen/arch/riscv/Kconfig                      |   1 +
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/include/asm/atomic.h         |  37 +-
 xen/arch/riscv/include/asm/config.h         |  16 +-
 xen/arch/riscv/include/asm/fixmap.h         |  46 +++
 xen/arch/riscv/include/asm/flushtlb.h       |  15 +
 xen/arch/riscv/include/asm/mm.h             |   6 +
 xen/arch/riscv/include/asm/page.h           |  91 +++++
 xen/arch/riscv/include/asm/pmap.h           |  36 ++
 xen/arch/riscv/include/asm/processor.h      |  27 +-
 xen/arch/riscv/include/asm/riscv_encoding.h |   1 +
 xen/arch/riscv/include/asm/sbi.h            |  63 +++
 xen/arch/riscv/include/asm/smp.h            |   9 +
 xen/arch/riscv/mm.c                         | 101 ++++-
 xen/arch/riscv/pt.c                         | 423 ++++++++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c        |   2 +
 xen/arch/riscv/riscv64/head.S               |  15 +
 xen/arch/riscv/sbi.c                        | 274 ++++++++++++-
 xen/arch/riscv/setup.c                      |  17 +
 xen/arch/riscv/smp.c                        |  15 +
 xen/arch/riscv/stubs.c                      |   2 +-
 xen/arch/riscv/xen.lds.S                    |   2 +-
 22 files changed, 1166 insertions(+), 35 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/arch/riscv/pt.c
 create mode 100644 xen/arch/riscv/smp.c

-- 
2.46.0



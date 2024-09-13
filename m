Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA33978544
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:58:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798297.1208477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gY-0000Mt-Gf; Fri, 13 Sep 2024 15:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798297.1208477; Fri, 13 Sep 2024 15:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gY-0000Fu-99; Fri, 13 Sep 2024 15:58:14 +0000
Received: by outflank-mailman (input) for mailman id 798297;
 Fri, 13 Sep 2024 15:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8gX-0000AA-AA
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:58:13 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8ca3573-71e8-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 17:58:09 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53653682246so2911641e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 08:58:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9038e3sm2348008e87.187.2024.09.13.08.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:58:07 -0700 (PDT)
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
X-Inumbo-ID: f8ca3573-71e8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243088; x=1726847888; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byC+PFPmG/lsX2eYpBBejY7iTmTSLbt1fTbA0EAe0Nc=;
        b=Uy2gP8u+zrT0BkDFYbtRMia39SNlhdQ05wSYSF/NPQGgUu5/viIQMVWW6zdR1bLd7H
         kqdY1c1lbVcK6cl+O/kMZs2XbQvvUmOIaniJzAyjZd2J6/sT3aIxQzfLDDWvNqohfuvR
         nTjpJu+/2CDtpxooJLlBOE7GnYwi1GtnKOM4xu6RPEv+uQxBwywnd4CV6GgUg6vzHCzP
         ot46cU/e05lHkkGRQcePeGry83iR5c7ploGm5iXwi7VLk+LPxAlD00PB++NZvNrh1PVw
         v+IG90c3cFkQ4p6DSbry5uhwiZwaA1K2HxPFWUSptDHpFmvm4brGYhBYXyU6Pj66nphZ
         NPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243088; x=1726847888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byC+PFPmG/lsX2eYpBBejY7iTmTSLbt1fTbA0EAe0Nc=;
        b=jc/sfN0KWd49gH0DMXrm8pAzt4E47tpUmxc7DNBbrlDfw9pMOFTWhJbHOsMe30GqdL
         uZF0HXJ6e2OQ5piPswHz6yPiAdiChtC+bQQ3MTHGBmj1objwo51rKJDhTu4UymvwYlOZ
         m8Wzgg5/W8QUUNrTvKftN5ZQ61ibT+UQ96HY0VPooEDwjhUzWZyLTDHYcgdcbJ+HcRjQ
         DZl2nWBj3uD3N09stzdZs2hsPRTP6rfD5XBsyhFLjoM6PKdKxpwKRFf2MZuHuS7evyON
         Rv2SqgHQxEanuwBYScHBhMaGlxwGu82hr8ZOIQACspJxZJpbFaRcjT4a99gO+LfciSH1
         R4xQ==
X-Gm-Message-State: AOJu0YwoKWp9BmgFAMkykfdWhRFW1AOa+qAqoGgL3T5SwM385w5jFeCm
	yYFTsqAjXEKYGU01oPBK9qCcmTCUjfj3fDNv9mNT9r3LPOha+eZ0Y2AGBg==
X-Google-Smtp-Source: AGHT+IF5e62q8215ZtubFFfBuoDdZHWjRHysYIMr4zPho2hlyU0Kd0jFfwI5K6plJPffbJl3Rt8FnQ==
X-Received: by 2002:a05:6512:ad6:b0:535:6400:1da2 with SMTP id 2adb3069b0e04-53678fbb34emr4648623e87.18.1726243087668;
        Fri, 13 Sep 2024 08:58:07 -0700 (PDT)
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
Subject: [PATCH v7 0/8] device tree mapping
Date: Fri, 13 Sep 2024 17:57:38 +0200
Message-ID: <cover.1726242605.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

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

Oleksii Kurochko (8):
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
 xen/arch/riscv/include/asm/atomic.h         |  32 +-
 xen/arch/riscv/include/asm/config.h         |  16 +-
 xen/arch/riscv/include/asm/current.h        |  27 +-
 xen/arch/riscv/include/asm/fixmap.h         |  46 +++
 xen/arch/riscv/include/asm/flushtlb.h       |  15 +
 xen/arch/riscv/include/asm/mm.h             |   6 +
 xen/arch/riscv/include/asm/page.h           | 105 +++++
 xen/arch/riscv/include/asm/pmap.h           |  36 ++
 xen/arch/riscv/include/asm/processor.h      |   3 -
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  62 +++
 xen/arch/riscv/include/asm/smp.h            |  18 +
 xen/arch/riscv/mm.c                         | 101 ++++-
 xen/arch/riscv/pt.c                         | 427 ++++++++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c        |   3 +
 xen/arch/riscv/riscv64/head.S               |  14 +
 xen/arch/riscv/sbi.c                        | 273 ++++++++++++-
 xen/arch/riscv/setup.c                      |  17 +
 xen/arch/riscv/smp.c                        |  15 +
 xen/arch/riscv/xen.lds.S                    |   2 +-
 22 files changed, 1192 insertions(+), 31 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/arch/riscv/pt.c
 create mode 100644 xen/arch/riscv/smp.c

-- 
2.46.0



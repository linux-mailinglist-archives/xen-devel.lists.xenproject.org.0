Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B195A264
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781292.1190840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqp-0003yH-NB; Wed, 21 Aug 2024 16:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781292.1190840; Wed, 21 Aug 2024 16:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqp-0003we-JQ; Wed, 21 Aug 2024 16:06:23 +0000
Received: by outflank-mailman (input) for mailman id 781292;
 Wed, 21 Aug 2024 16:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqo-0003sE-1x
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:22 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e4e80ed-5fd7-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:06:21 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53345dcd377so2438320e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:19 -0700 (PDT)
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
X-Inumbo-ID: 4e4e80ed-5fd7-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256380; x=1724861180; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUVh97Qey83DY9CbPXoXhl8KPvCK+TDOmaW7a07nuQg=;
        b=T0FkaP9G92/Yhi4jij1NwZdvnDjmXZnorVi2nZqcP+uJjNApMywP2oUBAiaEg0ilY4
         wWgkZVR4B/DsxK6NbWDrxN/dX1H1+N5v4bazOOCOMMk2aIbhNrGrTUKSwZBJRLuNr3Gi
         PV06JQRw0Pn39HTNthhFiljsGjBOwYYj+XxqmKmGLxR8TAzbXLtOKyt5Mak1ilmMtiF2
         MaF8rwx0e2dTWsKZxsb4h5cF+y1v9pPHrwd1JJeDeBUif76QEXKt4zto3Rv/1qTEa84l
         nMfNaO8ygKXPN46Fj4F9seYDTZ5pl2gjlBBMT//rOi11njIm7o/ROifEKnlnbvc4RXXo
         7nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256380; x=1724861180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUVh97Qey83DY9CbPXoXhl8KPvCK+TDOmaW7a07nuQg=;
        b=Ouwxv8DQ6tx9f+LOb184uMeShw+MKDyoEVz+2JgYPaEInZxuYxwmGTZsdSbTITqMJT
         npLyMhMrXfjjcv6fEM+36/juTpb/AFfgRRG7FbT8GLITDkAnBuZ46t/BdslMyf7G/45X
         u3B+KYOKV7uyU2uRdT+P0GepVs067ohQdZ8n3M/HqhK5xVbEtfZdqm8jvSyw0dSY+JMh
         hY2QMoc2vbuQcu5HIZTWmTWZKOlBxmMlX8Vgy84y3GXwFTkNSm+JLpP4tidL3jaXkWQ8
         +FAKJAM/Xv7AbSKluDgFAEonDXGZzox8zQZS0WSmYTAjXeaGiQbdIlAAHqxBWaybBFai
         Wr+g==
X-Gm-Message-State: AOJu0YyYzafXMQRjOIkyOjwOChAzt+lPKcyBich9SECrLd/TLC/RfbvW
	IFiy7iTPk7I086e3qDNiNIk2/O5F8ZTNsGr2phf0iHqApn+eE3gSZFMJmA==
X-Google-Smtp-Source: AGHT+IFkcBxZH+LiYKKUWiJHZGQpVOtt27YoKTTHB/eWwF8PoQAJuionkeNK6Ibih0k5uKidJe0FJQ==
X-Received: by 2002:a05:6512:118f:b0:52e:a699:2c8c with SMTP id 2adb3069b0e04-533485f2f40mr1810308e87.45.1724256379412;
        Wed, 21 Aug 2024 09:06:19 -0700 (PDT)
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
Subject: [PATCH v5 0/7]  RISCV device tree mapping
Date: Wed, 21 Aug 2024 18:06:09 +0200
Message-ID: <cover.1724256026.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

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
  xen/riscv: use {read,write}{b,w,l,q}_cpu() to define
    {read,write}_atomic()
  xen/riscv: set up fixmap mappings
  xen/riscv: introduce asm/pmap.h header
  xen/riscv: introduce functionality to work with CPU info
  xen/riscv: introduce and initialize SBI RFENCE extension
  xen/riscv: page table handling
  xen/riscv: introduce early_fdt_map()

 xen/arch/riscv/Kconfig                      |   1 +
 xen/arch/riscv/Makefile                     |   3 +
 xen/arch/riscv/include/asm/atomic.h         |  25 +-
 xen/arch/riscv/include/asm/config.h         |  15 +-
 xen/arch/riscv/include/asm/fixmap.h         |  46 +++
 xen/arch/riscv/include/asm/flushtlb.h       |  18 +
 xen/arch/riscv/include/asm/mm.h             |   6 +
 xen/arch/riscv/include/asm/page.h           |  76 ++++
 xen/arch/riscv/include/asm/pmap.h           |  36 ++
 xen/arch/riscv/include/asm/processor.h      |  29 +-
 xen/arch/riscv/include/asm/riscv_encoding.h |   1 +
 xen/arch/riscv/include/asm/sbi.h            |  63 +++
 xen/arch/riscv/include/asm/smp.h            |  11 +
 xen/arch/riscv/mm.c                         | 101 ++++-
 xen/arch/riscv/pt.c                         | 420 ++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S               |   4 +
 xen/arch/riscv/sbi.c                        | 273 ++++++++++++-
 xen/arch/riscv/setup.c                      |  17 +
 xen/arch/riscv/smp.c                        |  21 +
 xen/arch/riscv/smpboot.c                    |   8 +
 xen/arch/riscv/xen.lds.S                    |   2 +-
 21 files changed, 1150 insertions(+), 26 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/arch/riscv/pt.c
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c

-- 
2.46.0



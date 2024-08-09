Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21F94D481
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774846.1185252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLK-0001lK-Uu; Fri, 09 Aug 2024 16:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774846.1185252; Fri, 09 Aug 2024 16:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLK-0001iu-Rf; Fri, 09 Aug 2024 16:19:54 +0000
Received: by outflank-mailman (input) for mailman id 774846;
 Fri, 09 Aug 2024 16:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLJ-0001id-AG
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:53 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 346ec606-566b-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 18:19:52 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so2985523e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:49 -0700 (PDT)
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
X-Inumbo-ID: 346ec606-566b-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220390; x=1723825190; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HL48kB3/PM+2qrvRUySHv84IqBYDmZ6dcgwMZ9tmLEk=;
        b=QZLr1XgLFpumPtsyzSm/568tAy6+URMlVAEGBkKDYPbsYctFhoMiVw0GYKPvIWOewi
         1DWq2PuQVQ0h0Fv3brJk7pt/RvROE12f/nqZ8wAsTTnk4hL5pfUqXx0W/Y0mrmW9+0xr
         MSuhg7hFZQ7SstErvgogsPIIS5jATaJ05mQhduml8F52bkjGAdfwhJSHqdae7HCJNI9O
         e3wY87dz347JGNJIXin2F1LLqjkxyHIodTwfmOrAI2L5JbFeSxNuXcgL8ZOEexttCLay
         wlGzn019NqcZY+SLvMQYdOlqtulsYPpkkaYZcgROYz3OaX2CU+6u8x2eTsre4MEVqrxR
         bhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220390; x=1723825190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HL48kB3/PM+2qrvRUySHv84IqBYDmZ6dcgwMZ9tmLEk=;
        b=P+SUt9mUGb6/6Li6rmJbiOFDPL6unDgWXdQQx43kCEu86DImzkce6niQeNvB7w/NV9
         Cz4sZSQ7v8p5Pm8fcy2MUKIeT5zM634koeSrdnoiKQjYTU5tBAoLtI04LvXEYyfxdZvE
         f9R3JFcBRCaI8B6+ajzVewtjjJKSOCiFQ8eKRfff2+QyVqU/ry439PQfMLekWkEWretU
         IJjOCTNWz2qGdjR1RRU24LXxKs06eG8sMc+QM6GCxN+PuR1KSSH32W5h6Qw8h7VqaqNE
         ZOP8ZA/PvWoztSMcBtFPqOOMSanuF9s546R4QtBauVcjJu+NjB5kMsnHO3dUm+J32wDy
         18KQ==
X-Gm-Message-State: AOJu0Yy3XYDt4kxOK3o42rUtIkILgLmNOOrvQxc57M+KSMRhWjy+3lnf
	4dB5uj0Y65Frh6O7wF65/mRUcpBKIQCcPpyRqp1OELa/cjm+olUQ+fvqYg==
X-Google-Smtp-Source: AGHT+IFe2rLVwxAQT7az1xwUSBCspbo33+hRu2xSXkexa6tOAzF+YFKeQLmpuThDOmFs6Ko3oRzcIg==
X-Received: by 2002:a05:6512:3094:b0:52e:969c:db83 with SMTP id 2adb3069b0e04-530ee9951b8mr1399062e87.17.1723220390054;
        Fri, 09 Aug 2024 09:19:50 -0700 (PDT)
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
Subject: [PATCH v4 0/7] RISCV device tree mapping
Date: Fri,  9 Aug 2024 18:19:38 +0200
Message-ID: <cover.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

Also there is another one depenency:
RISCV basic exception handling implementation [2]

[2] https://lore.kernel.org/xen-devel/cover.1722960083.git.oleksii.kurochko@gmail.com/T/#t

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
  xen/riscv: enable CONFIG_HAS_DEVICE_TREE
  xen/riscv: set up fixmap mappings
  xen/riscv: introduce asm/pmap.h header
  xen/riscv: introduce functionality to work with CPU info
  xen/riscv: introduce and initialize SBI RFENCE extension
  xen/riscv: page table handling
  xen/riscv: introduce early_fdt_map()

 xen/arch/riscv/Kconfig                      |   2 +
 xen/arch/riscv/Makefile                     |   3 +
 xen/arch/riscv/include/asm/config.h         |   8 +
 xen/arch/riscv/include/asm/fixmap.h         |  44 +++
 xen/arch/riscv/include/asm/flushtlb.h       |  19 +
 xen/arch/riscv/include/asm/mm.h             |   6 +
 xen/arch/riscv/include/asm/page.h           |  88 +++++
 xen/arch/riscv/include/asm/pmap.h           |  36 ++
 xen/arch/riscv/include/asm/processor.h      |  28 +-
 xen/arch/riscv/include/asm/riscv_encoding.h |   1 +
 xen/arch/riscv/include/asm/sbi.h            |  64 +++
 xen/arch/riscv/include/asm/smp.h            |  10 +
 xen/arch/riscv/mm.c                         | 101 ++++-
 xen/arch/riscv/pt.c                         | 408 ++++++++++++++++++++
 xen/arch/riscv/sbi.c                        | 252 +++++++++++-
 xen/arch/riscv/setup.c                      |  26 ++
 xen/arch/riscv/smp.c                        |   4 +
 xen/arch/riscv/smpboot.c                    |  12 +
 xen/arch/riscv/xen.lds.S                    |   2 +-
 19 files changed, 1104 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/arch/riscv/pt.c
 create mode 100644 xen/arch/riscv/smp.c
 create mode 100644 xen/arch/riscv/smpboot.c

-- 
2.45.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C192FE5D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758166.1167525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ31-0008C0-8J; Fri, 12 Jul 2024 16:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758166.1167525; Fri, 12 Jul 2024 16:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ31-00088n-4g; Fri, 12 Jul 2024 16:23:03 +0000
Received: by outflank-mailman (input) for mailman id 758166;
 Fri, 12 Jul 2024 16:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ30-00088h-0I
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:02 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e37137-406b-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:23:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77c1658c68so272711966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:22:59 -0700 (PDT)
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
X-Inumbo-ID: 01e37137-406b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801380; x=1721406180; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpa/qShR+c9qyCzvxWIj3A6Xe/V4aj3zsajaq2WCFJg=;
        b=SZNIc93Axs5yB9FZAhcai8C6qp0tVNBkRv55/Fp7KqLF/vkz+ZX55Dq2aLk/ne+3Ro
         MUscH5xu2jUqwYRr5z0F9OtDQREMfxKXe1v4p0EQM8RSsEWgzUtSWpOwCfOspKnKfql5
         Mm5wXBEBNDRDJijRMd93mVJpUJ/fIn8GAJfJ+F4XCQI1Y/9pgzLx71cQETO0i2LD4KhQ
         S/9oyatwHs2KvQluiVs1sC63ea5uFztydHFHXRsFMQkSwzVZEBBRcCn1cFDZ4am7OZDe
         6DdYxhLVggTOe1nDJ1blJfyaGhznnQoN7cxlEQdGzuYShk9YSUblbIjP1228jngLd1mu
         B9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801380; x=1721406180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpa/qShR+c9qyCzvxWIj3A6Xe/V4aj3zsajaq2WCFJg=;
        b=s+wVsNMBOuHvVwH0VNk9dhoQjML++zWFP+56MhAFS79E30loLjkPm7BB2GcGKA+zLZ
         jVPIwPugIiGrXg7KSnY09uj9TbO9pawPIDoDQc23D/Bwou10ptV1cz9LMswnuzRU0zsM
         fDiUkGL5WzN+C+1Pk+noiO674TfNTToFK6HHkUAA+8CdETysYCKoB4bcXdzY2P8D19f1
         HeQOa9FpAQqm4DYdWLnADOMeLSypYmzsB0pB11wUQDdB7PihcGMFKClVS8hz1N7qfZud
         HFibve0iJjbmquaXKm1WhJjk3mkDbChw/f+ivo//aC2sEOvuo85i/uSdVyYvUfUDNL2R
         TJxg==
X-Gm-Message-State: AOJu0YwHcDB39sbK9jdzm2E0E4HvnfL1EsS5BtnvB80aZ+GJGn0vN917
	KdcNtXN9GChq0N1cJ0BXK/wBJBOPE0jRgqLi51i5qy4kqUZ+dd3PjX98HGLm
X-Google-Smtp-Source: AGHT+IG5sOysiWLiMTFti3JiCRmpUpDWOWJdzXjIMu58SmBACH30UnffWhCWDh4U/n+H1g1/QW7fAg==
X-Received: by 2002:a17:906:a89a:b0:a77:eb34:3b50 with SMTP id a640c23a62f3a-a780b6b1da2mr700394266b.20.1720801379883;
        Fri, 12 Jul 2024 09:22:59 -0700 (PDT)
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
Subject: [PATCH v2 0/8] RISCV device tree mapping
Date: Fri, 12 Jul 2024 18:22:49 +0200
Message-ID: <cover.1720799925.git.oleksii.kurochko@gmail.com>
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
Changes in v2:
 - Update the cover letter message
 - introduce fixmap mapping
 - introduce pmap
 - introduce CONFIG_GENREIC_PT
 - update use early_fdt_map() after MMU is enabled.
---

Oleksii Kurochko (6):
  xen/riscv: enable CONFIG_HAS_DEVICE_TREE
  xen/riscv: setup fixmap mapping
  xen/riscv: introduce asm/pmap.h header
  xen/riscv: introduce generic Xen page table handling
  xen/riscv: select CONFIG_GENREIC_PT
  xen/riscv: introduce early_fdt_map()

Shawn Anastasio (2):
  xen/device-tree: Move Arm's setup.c bootinfo functions to common
  xen/common: Move Arm's bootfdt.c to common

 MAINTAINERS                            |   2 +
 xen/arch/arm/Makefile                  |   1 -
 xen/arch/arm/bootfdt.c                 | 622 ------------------------
 xen/arch/arm/include/asm/setup.h       | 200 +-------
 xen/arch/arm/setup.c                   | 432 -----------------
 xen/arch/riscv/Kconfig                 |   3 +
 xen/arch/riscv/include/asm/config.h    |   9 +
 xen/arch/riscv/include/asm/fixmap.h    |  48 ++
 xen/arch/riscv/include/asm/mm.h        |  13 +
 xen/arch/riscv/include/asm/page-bits.h |  45 ++
 xen/arch/riscv/include/asm/page.h      |  82 +++-
 xen/arch/riscv/include/asm/pmap.h      |  28 ++
 xen/arch/riscv/mm.c                    | 167 ++++++-
 xen/arch/riscv/setup.c                 |  11 +
 xen/arch/riscv/xen.lds.S               |   2 +-
 xen/common/Kconfig                     |   5 +
 xen/common/Makefile                    |   2 +
 xen/common/device-tree/Makefile        |   2 +
 xen/common/device-tree/bootfdt.c       | 635 +++++++++++++++++++++++++
 xen/common/device-tree/bootinfo.c      | 459 ++++++++++++++++++
 xen/common/mmu/pt.c                    | 441 +++++++++++++++++
 xen/include/xen/bootfdt.h              | 210 ++++++++
 xen/include/xen/mm.h                   |  24 +
 23 files changed, 2181 insertions(+), 1262 deletions(-)
 delete mode 100644 xen/arch/arm/bootfdt.c
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h
 create mode 100644 xen/arch/riscv/include/asm/pmap.h
 create mode 100644 xen/common/device-tree/Makefile
 create mode 100644 xen/common/device-tree/bootfdt.c
 create mode 100644 xen/common/device-tree/bootinfo.c
 create mode 100644 xen/common/mmu/pt.c
 create mode 100644 xen/include/xen/bootfdt.h

-- 
2.45.2



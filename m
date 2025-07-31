Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA83EB1746D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065866.1431201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfv-0001N0-4u; Thu, 31 Jul 2025 15:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065866.1431201; Thu, 31 Jul 2025 15:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfu-0001I2-TD; Thu, 31 Jul 2025 15:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1065866;
 Thu, 31 Jul 2025 15:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVft-0001FB-00
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:33 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34589bde-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:31 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55516abe02cso1241424e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:31 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:29 -0700 (PDT)
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
X-Inumbo-ID: 34589bde-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977510; x=1754582310; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TAiMjtL3G6nfcsV7yyHthW3eByGMXA96M40EAt7DjU=;
        b=nkxffNKeui2iGTmfNyllosdf8VeRmgQ8uqUwmqkE106QMsLFMYC0bkQfICvXJwYKwE
         CK7mSDiC68IOhDQ5U+vlKv3GXGXxa7WrXMJ1jexioTdgbQmD/xUECXqg0Uaqv1L87wDq
         FfgpFS+A2PZK9JYY+zptTPLnoMFRrQIlVyPN83xohz6OPW3kLAOURXRJWSgAp4yl6QTL
         p+EUifJgcOJ/QIaQsHfhgywqPEBuVf0DvtHqz7JgGHh/o+LAAlRKrq1VYb5/Xgi//e8M
         8zHHI6SFC6E14InOoGXSOGrMrUWEoL8IAR7inOTi23ZEBWmJg3t4vFE8Hx63SzZi6ssl
         BpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977510; x=1754582310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TAiMjtL3G6nfcsV7yyHthW3eByGMXA96M40EAt7DjU=;
        b=bSdpVUMABwUT69iTFkN06LS5I95FpK8ClgnAwiW5RTgNxh1Vp8MQ+nqPRdFGbH4ZWc
         PkvJbqkhV5CrAz5aERvPGYxaDCNj+rsIACQZ00DldC4GT74y5lo2Z2GagEdS3ugjgycU
         xHa2mOBvugnaEAHAi7eSrnDVh+MEL3cy2jhXBMEoyLzosF/r8EqCzjuxEd9H/Vo2enwh
         JpsQ97HywSqIJXJCXMrn3mJc26Y3WBNg4d2K334pooKuzmkaW7YvILyuYiXp9WPfgZh/
         7BFbn29c7LtFy4wNAXLNoPCE8UEoXHG0i3WcLqfrTrSoP08mv8elw9oiZY5P29ZrSbKR
         ZovQ==
X-Gm-Message-State: AOJu0YylMfGoXitQK6dKPhfTZHvQteCcbLpSPGYIG/suJXPU64o8WyDI
	8bTuXgoMQRhbWaDYplLZS3+4LRHt2KzOKAhL4bviBssBUrzfi7OvGuAc27hn0g==
X-Gm-Gg: ASbGnctKEhTeYqur6++ukEhNj20L5ZKseX/P0wztRdhv1TpZvEEdsmKXWOi15w2Bt3E
	f6FQe4ET683+gTu5JTkHGhy8i3BMaHDv8dA3ILFdGwERzIJtGORaJNcAHWTCU3l+GqI5YiRtCUb
	BlZ7/63NcRG6uS+4djUpzuAKAYZFZqSnF2KXEGJNUwan9tKkUNBp+ZjTiuuo3CdKaGSlmyzwX56
	czAweaFIGvhd+pSiq0lwP1Rw8PX4lc3+P5h4kObJf16mKRpNs7jkJnp7iy6yqnjGYgRBlw108Sa
	CX9PbPb1jKWrQOxhYXisG4H/KMVBuMP0RsS7C2RtoNXJsFwz26h6BmHBMxDLU2pmczwVCeCAo19
	hZTCl9pGE/rwVWkPg3XuweQjLgg8u3TQq3nGJ1jMHgEs46pK3XJ3NalXHpxJ2cg==
X-Google-Smtp-Source: AGHT+IHBHM0LLm/yvw7+ReYt6vvrzjx+bDed083If97oiTI5HZNmZYT3lNdun4Vtkp/NFwyndD0phQ==
X-Received: by 2002:a05:6512:6d5:b0:55b:8308:f949 with SMTP id 2adb3069b0e04-55b88c80c3bmr811512e87.15.1753977509898;
        Thu, 31 Jul 2025 08:58:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 00/20] xen/riscv: introduce p2m functionality
Date: Thu, 31 Jul 2025 17:57:59 +0200
Message-ID: <cover.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

---
Changes in V3:
 - Introduce metadata table to store P2M types.
 - Use x86's way to allocate VMID.
 - Abstract Arm-specific p2m type name for device MMIO mappings.
 - All other updates please look at specific patch.
---
Changes in V2:
 - Merged to staging:
   - [PATCH v1 1/6] xen/riscv: add inclusion of xen/bitops.h to asm/cmpxchg.h
 - New patches:
   - xen/riscv: implement sbi_remote_hfence_gvma{_vmid}().
 - Split patch "xen/riscv: implement p2m mapping functionality" into smaller
   one patches:
   - xen/riscv: introduce page_set_xenheap_gfn()
   - xen/riscv: implement guest_physmap_add_entry() for mapping GFNs to MFNs
   - xen/riscv: implement p2m_set_entry() and __p2m_set_entry()
   - xen/riscv: Implement p2m_free_entry() and related helpers
   - xen/riscv: Implement superpage splitting for p2m mappings
   - xen/riscv: implement p2m_next_level()
   - xen/riscv: Implement p2m_entry_from_mfn() and support PBMT configuration
 - Move root p2m table allocation to separate patch:
   xen/riscv: add root page table allocation
 - Drop dependency of this patch series from the patch witn an introduction of
   SvPBMT as it was merged.
 - Patch "[PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures" was
   renamed to xen/riscv: introduce pte_{set,get}_mfn() as after dropping of
   bitfields for PTE structure, this patch introduce only pte_{set,get}_mfn().
 - Rename "xen/riscv: define pt_t and pt_walk_t structures" to
   "xen/riscv: introduce pte_{set,get}_mfn()" as pt_t and pt_walk_t were
   dropped.
 - Introduce guest domain's VMID allocation and manegement.
 - Add patches necessary to implement p2m lookup:
   - xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
   - xen/riscv: add support of page lookup by GFN
 - Re-sort patch series.
 - All other changes are patch-specific. Please check them.
---

Oleksii Kurochko (20):
  xen/riscv: implement sbi_remote_hfence_gvma()
  xen/riscv: introduce sbi_remote_hfence_gvma_vmid()
  xen/riscv: introduce VMID allocation and manegement
  xen/riscv: introduce things necessary for p2m initialization
  xen/riscv: construct the P2M pages pool for guests
  xen/riscv: add root page table allocation
  xen/riscv: introduce pte_{set,get}_mfn()
  xen/riscv: add new p2m types and helper macros for type classification
  xen/dom0less: abstract Arm-specific p2m type name for device MMIO
    mappings
  xen/riscv: introduce page_{get,set}_xenheap_gfn()
  xen/riscv: implement function to map memory in guest p2m
  xen/riscv: implement p2m_set_range()
  xen/riscv: Implement p2m_free_subtree() and related helpers
  xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration
  xen/riscv: implement p2m_next_level()
  xen/riscv: Implement superpage splitting for p2m mappings
  xen/riscv: implement put_page()
  xen/riscv: implement mfn_valid() and page reference, ownership
    handling helpers
  xen/riscv: add support of page lookup by GFN
  xen/riscv: introduce metadata table to store P2M type

 xen/arch/arm/include/asm/p2m.h              |    2 +
 xen/arch/riscv/Makefile                     |    3 +
 xen/arch/riscv/include/asm/Makefile         |    1 -
 xen/arch/riscv/include/asm/domain.h         |   23 +
 xen/arch/riscv/include/asm/flushtlb.h       |    5 +
 xen/arch/riscv/include/asm/mm.h             |   72 +-
 xen/arch/riscv/include/asm/p2m.h            |  145 ++-
 xen/arch/riscv/include/asm/page.h           |   38 +
 xen/arch/riscv/include/asm/paging.h         |   19 +
 xen/arch/riscv/include/asm/riscv_encoding.h |    6 +
 xen/arch/riscv/include/asm/sbi.h            |   32 +
 xen/arch/riscv/include/asm/vmid.h           |    8 +
 xen/arch/riscv/mm.c                         |   73 +-
 xen/arch/riscv/p2m.c                        | 1107 +++++++++++++++++++
 xen/arch/riscv/paging.c                     |  112 ++
 xen/arch/riscv/sbi.c                        |   14 +
 xen/arch/riscv/setup.c                      |    3 +
 xen/arch/riscv/vmid.c                       |  165 +++
 xen/common/device-tree/dom0less-build.c     |    2 +-
 19 files changed, 1809 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/paging.c
 create mode 100644 xen/arch/riscv/vmid.c

-- 
2.50.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DD4CC474F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188142.1509380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKw-0006i1-Lq; Tue, 16 Dec 2025 16:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188142.1509380; Tue, 16 Dec 2025 16:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKw-0006gl-Il; Tue, 16 Dec 2025 16:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1188142;
 Tue, 16 Dec 2025 16:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYKu-0006ge-Qi
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:44 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eb99f9e-daa0-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 17:55:42 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso912236166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:42 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:41 -0800 (PST)
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
X-Inumbo-ID: 0eb99f9e-daa0-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904142; x=1766508942; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqW5ArgVlVzIKuAb1wW3HrPVuRng7m0Z3vojlY8euyc=;
        b=H3QPsggcYlqpFJXVacKHN4g5X+8ufRZztgxdAeFn4dKHJc8U1hm6DNexDs3xMAcGOS
         Xi2L8lzI9aTLoQwNFdsOGgQfZxc8XhFXaygqkAwj33UwAA0+TcgJe1Va7vgyj/OW6H+F
         2jD/TCfKIA9B4jafo52SnaoafqDH2E5624ntnn+fS/Gtbg5FzMQXJ/oWfovvPaQWG8sD
         AoERgJ6VxJ50OdzQ5RWJd/oPL7UAZPo5/MMUMaHrTdyM5wMmg72oSs0ydisEN4KAcPb7
         hzKUQa3Mdx9M0Cv7GFximtAUi4N5UP+fNtFI2CmcRdsjbhnkQTxnDlKKnhkCcg7M6FGG
         RAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904142; x=1766508942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqW5ArgVlVzIKuAb1wW3HrPVuRng7m0Z3vojlY8euyc=;
        b=oWqMcvEu26vsHLQY+FK/kqX2gY8UQPeqRtl2PZIk3IRgAW/oSVa9bk71mEXtzkZvuM
         fQwTfa6TSSMOHJXV81ZzCLqGUd+PIVNVMi+0myo88kuiPvCN5E2Gk4YQrQL8ih4J2XFh
         MqqcXuO7rC1/kOhkL1FrPnOQt+RLnRyZqTYVyyfnQgz7FBfR/AOwUz9Z1tGmxARSi/0R
         dDHXrDnABXlJVKbAi97Jt73oowFN/0qujAz7f2YCRH2O7KRMD0X3XSWn/BQwysr1PluI
         NOgPbqH4r9thvar0FF3L0ky6IsbB4VplqZsRKkFrkCaJVvMyhQJnx5AZCtXeeMTD5ZgR
         +Yfw==
X-Gm-Message-State: AOJu0YwP8ixevZ51izLhekZYEXGkh2DTfFSmVqw+nP8x8mG6+PZMmlBn
	0foUyAk7NN8bq2WiowCEkfSGclw+e+LyOvZQcRkqCdZoMUif7bG2fMcjYz1b7w==
X-Gm-Gg: AY/fxX7XiRKTpvSegeP1zUNpqNjM1i6x8iinbDglfN16x3HXaexnoZ/LcRVeTJPSonF
	EI7RD78Mo1drFavIXs/GIrJfhEHGNtkQnKnL4ZC8kusQmj+jy4PLkQEzxyAJ+lyueCY5CO8yelB
	fuir+sDET04hiS6iCx9DLgIQeAVYmLwlrJkpRO5Oe+e8MIywdxU2O7FTJEAzVX66aeNO+pQdINs
	WbKaVqFV6CYnZM/6FdlwZDUAtSx3G3Cv08gEsyblSJep+2HvYRgbrm0l//z1PUgwdAyGB7ImXx6
	Z1xzYxMxcNtKam+dmvB91WVksIyZ5xGsW+d4FAi3OKjFXHKiy2Q0Ba2cCtguKBAQPQEAQeNM/Wt
	i56kXCiTr+neP2ySbUxxoQxAbTc5sZB9xOhq6fbodxHerV90CaATfJdogTWuD6K+avXRbvdr3ns
	Da6Y/ypqWhMf94eaZRJWh7MXEZ3frsYwho2jWoCf7emoLFLwIh9/8=
X-Google-Smtp-Source: AGHT+IEKvZTln+pLP8/yRDiEcYBmgYlecAZAe5LvH0hZQo+RsBQ/IfmpBbKiay1etofb5i6AYVBHkg==
X-Received: by 2002:a17:907:940a:b0:b72:599:5385 with SMTP id a640c23a62f3a-b7d23aa5654mr1562448166b.61.1765904141371;
        Tue, 16 Dec 2025 08:55:41 -0800 (PST)
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
Subject: [PATCH v7 00/19] xen/riscv: introduce p2m functionality
Date: Tue, 16 Dec 2025 17:55:10 +0100
Message-ID: <cover.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2217339779

---
Changes in V7:
 - Merged to staging:
   - xen/riscv: avoid redundant HGATP*_MODE_SHIFT and HGATP*_VMID_SHIFT
 - Introduce new patch:
   - xen/riscv: update p2m_set_entry to free unused metadata page
   (could be merged with previous one: xen/riscv: introduce metadata table to
    store P2M type )
 - Addressed comments for v6.
---
Changes in V6:
 - Addressed coment for v5.
---
Changes in V5:
 - Addressed comments for v4.
---
Changes in V4:
 - Merged to staging:
   - xen/riscv: introduce sbi_remote_hfence_gvma()
   - xen/riscv: introduce sbi_remote_hfence_gvma_vmid()
 - Drop "xen/riscv: introduce page_{get,set}_xenheap_gfn()" as grant tables aren't going to be introduced for the moment. Also, drops other parts connected to grant tables support.
 - All other changes are patch specific.
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

Oleksii Kurochko (19):
  xen/riscv: detect and initialize G-stage mode
  xen/riscv: introduce VMID allocation and manegement
  xen/riscv: introduce things necessary for p2m initialization
  xen/riscv: construct the P2M pages pool for guests
  xen/riscv: add root page table allocation
  xen/riscv: introduce pte_{set,get}_mfn()
  xen/riscv: add new p2m types and helper macros for type classification
  xen/dom0less: abstract Arm-specific p2m type name for device MMIO
    mappings
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
  xen/riscv: update p2m_set_entry to free unused metadata pages

 docs/misc/xen-command-line.pandoc           |    9 +
 xen/arch/arm/include/asm/p2m.h              |    5 +
 xen/arch/riscv/Makefile                     |    3 +
 xen/arch/riscv/cpufeature.c                 |    1 +
 xen/arch/riscv/include/asm/Makefile         |    1 -
 xen/arch/riscv/include/asm/cpufeature.h     |    1 +
 xen/arch/riscv/include/asm/domain.h         |   23 +
 xen/arch/riscv/include/asm/flushtlb.h       |   15 +-
 xen/arch/riscv/include/asm/mm.h             |   41 +-
 xen/arch/riscv/include/asm/p2m.h            |  185 ++-
 xen/arch/riscv/include/asm/page.h           |   37 +
 xen/arch/riscv/include/asm/paging.h         |   20 +
 xen/arch/riscv/include/asm/riscv_encoding.h |    7 +
 xen/arch/riscv/include/asm/vmid.h           |   14 +
 xen/arch/riscv/mm.c                         |   69 +-
 xen/arch/riscv/p2m.c                        | 1447 +++++++++++++++++++
 xen/arch/riscv/paging.c                     |  139 ++
 xen/arch/riscv/setup.c                      |    3 +
 xen/arch/riscv/stubs.c                      |    5 -
 xen/arch/riscv/vmid.c                       |  178 +++
 xen/common/device-tree/dom0less-build.c     |    2 +-
 21 files changed, 2179 insertions(+), 26 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/paging.c
 create mode 100644 xen/arch/riscv/vmid.c

-- 
2.52.0



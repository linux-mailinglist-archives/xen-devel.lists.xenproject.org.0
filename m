Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A9C807A8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170562.1495618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlk-0001ab-4n; Mon, 24 Nov 2025 12:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170562.1495618; Mon, 24 Nov 2025 12:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlk-0001Y3-1U; Mon, 24 Nov 2025 12:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1170562;
 Mon, 24 Nov 2025 12:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVli-0001Xp-SJ
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:10 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df2204a0-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:08 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b73545723ebso791712266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:08 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:07 -0800 (PST)
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
X-Inumbo-ID: df2204a0-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987648; x=1764592448; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+sSuYdsdwkxhTsu6a2x7f7aj3mdyYmC59jrVxhin0Uo=;
        b=ilr5LO2Jsh3gObk2tOqXR+5Vu26Ze3EJFaRAWdIsttF1CczFz19VTytmh/V4Z5GbL3
         2Tey5Z7cftmMscKigNfqcq7beN19fiyuMmS9q2TcicHBtDjCo5c4jPKWYmPxmFAnR650
         HiMgeuZdfYey79J/gzNbcsuLLw88fsVLpKzBbbVIRkr54Pop4OjmHFEpGpR96JIO63ez
         Zjvzs4I6Hh6oh+lMcKx/9JDpTGQGkE61riA83BrWcIjy5JsD5yZ6t4CMttYR78gfWatx
         N//Ds67T9NORYNr3yg6XhznzGyRvKyCYwy9V2EkZYnRhIvOc/PExVKvMghLcvFdprU2B
         26Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987648; x=1764592448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sSuYdsdwkxhTsu6a2x7f7aj3mdyYmC59jrVxhin0Uo=;
        b=aE2e5GQOzJAS3YOCs7ys7tlbLSxFgRYxtCfsKcFQRKr9du9XS2voUdo7UZkWICYNbo
         TUMpeVAGiinZKv4SAGMDJmiZXk4v8s0c7oJOSyKN9J/MN/0swWZJQnOlx4WyygOdJXCM
         37FKgCyMSI0JgjBVU7/0YKV5h/iFcJ75Kn2Re3TOdyuGfMOl0Y9GF4EdbaLTGJ0oHJRt
         Wj4m9a0nuIWtp4Ut10Q+Ne8Zy4T7roR8z2tDT/5OMrRSs0b00IBSXXekqSwjBvgSFqv8
         zdbWqlKuh6Lh3DVNoG276UtZowQxLUhkdt9oB+76O7RNqpvWvSSJ/+o0hqtZW9My2E9m
         oDZQ==
X-Gm-Message-State: AOJu0YwbQ+gTkrxmTaK8hKIejjTsK1tGhvNNrBgRg3IR3fpauLtQYYV5
	d5i3amLU94nBs1quz8+rlwRWp7HkbAS6EDW9zzNJvpanw9e3uGeGM/pPXp+JwT0a
X-Gm-Gg: ASbGnctGvD9KUN9MXMTTSJm02Novpikeu4v1sQPwgrqGkHhTVvqm61NfKvDXzxoOMSy
	o2/FqwxYNeYv2oI4Us/E6+QTAWApuREgnb45/Vw192VJ4zyBhqHqk0JT5vzs3N4elKubI1APVkb
	M/qznfjCi+l89zNdRi/6w5b7nNRviFrxSdBCi1T1bC1+XA5xU/Xm6zBkWu4TSV1b4vfuUPzca7K
	10P4zPe8p3sbuv8jMdJXfmTVWaxtQR3UWD3T553IOWKbtyw+Oi4FeFF3YeKDdkNah1eRoznDVK7
	HzbrFmsyBEAQ0SgUpA7jEFjY6m6ETYptVkoz6klMNlg2rUlfFlcWQSSp961vLjAi6Y5dTwxUCWg
	KgordK2eSXY7LWaJLdVYtf/DYG2Bh8Zixm7UrR0ml/24qN3N+/wxtpuqEFx5xarnqo32n1M5N+C
	1zJmk5szsJCyIA0VshTZ6K6cD3B9Ott0TX70bA4/Eedl2Hk74adhUeWg0=
X-Google-Smtp-Source: AGHT+IFeVvtdieypPfUUuFa98jmCPo/+NVn9t8wvxA4TkdblLsWeBbTIB7f6Iw/e9IzssQAGdXUBMg==
X-Received: by 2002:a17:907:d05:b0:b73:6b24:14b5 with SMTP id a640c23a62f3a-b7671a47bafmr1395645166b.31.1763987647315;
        Mon, 24 Nov 2025 04:34:07 -0800 (PST)
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
Subject: [PATCH v6 00/19] xen/riscv: introduce p2m functionality
Date: Mon, 24 Nov 2025 13:33:33 +0100
Message-ID: <cover.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

---
Changes in V5:
 - Addressed comments for v4.
 - The following patches were Acked-by:
   - [v5 16/18] xen/riscv: implement mfn_valid() and page
   - [v5 15/18] xen/riscv: implement put_page()
   - [v5 14/18] xen/riscv: Implement superpage splitting for p2m mappings
   - [v5 09/18] xen/riscv: implement function to map memory in guest p2m
   - [v5 07/18] xen/riscv: add new p2m types and helper macros for type classification
   - [v5 03/18] xen/riscv: introduce things necessary for p2m initialization
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
  xen/riscv: avoid redundant HGATP*_MODE_SHIFT and HGATP*_VMID_SHIFT
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

 docs/misc/xen-command-line.pandoc           |    9 +
 xen/arch/arm/include/asm/p2m.h              |    5 +
 xen/arch/riscv/Makefile                     |    3 +
 xen/arch/riscv/cpufeature.c                 |    1 +
 xen/arch/riscv/include/asm/Makefile         |    1 -
 xen/arch/riscv/include/asm/cpufeature.h     |    1 +
 xen/arch/riscv/include/asm/domain.h         |   23 +
 xen/arch/riscv/include/asm/flushtlb.h       |   13 +-
 xen/arch/riscv/include/asm/mm.h             |   29 +-
 xen/arch/riscv/include/asm/p2m.h            |  185 ++-
 xen/arch/riscv/include/asm/page.h           |   37 +
 xen/arch/riscv/include/asm/paging.h         |   20 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   23 +-
 xen/arch/riscv/include/asm/vmid.h           |   14 +
 xen/arch/riscv/mm.c                         |   69 +-
 xen/arch/riscv/p2m.c                        | 1443 +++++++++++++++++++
 xen/arch/riscv/paging.c                     |  139 ++
 xen/arch/riscv/setup.c                      |    3 +
 xen/arch/riscv/stubs.c                      |    5 -
 xen/arch/riscv/vmid.c                       |  170 +++
 xen/common/device-tree/dom0less-build.c     |    2 +-
 21 files changed, 2158 insertions(+), 37 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/paging.c
 create mode 100644 xen/arch/riscv/vmid.c

-- 
2.51.1



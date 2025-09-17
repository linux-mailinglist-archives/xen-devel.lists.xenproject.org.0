Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1911BB820A2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125581.1467475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz084-0007No-DN; Wed, 17 Sep 2025 21:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125581.1467475; Wed, 17 Sep 2025 21:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz084-0007M5-AV; Wed, 17 Sep 2025 21:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1125581;
 Wed, 17 Sep 2025 21:55:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz082-0007Lt-Vu
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:55:55 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13e2b581-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:55:52 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-267f0fe72a1so1858795ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:55:52 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:50 -0700 (PDT)
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
X-Inumbo-ID: 13e2b581-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146151; x=1758750951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7wL9p64D8keeYetVsE8VmLXNMGlwrZzPrEEjyLI3t0=;
        b=blGO3N7e81BDUJ9nY1j2yUIxZYqEPQ+x8D4ap4hLn4JD9NngClCbC12CRlpfRNuomK
         AyaoSE4OUQM6EspYC6kf5R2Ci/VwGzLSZ5f6ihXbTbBoRlABybFr2XPe4fbTWxBSuocm
         kSiv4BMdbI5/SRGXiqZzFVD0SAJoqPqdBOpTY7HKRyp5nvF9NafkSzPU/fvTazmcS7YS
         fAyUmsxKnUjWv0jKw3sUW4iO9gFIAe8UME8bjIrwtjePbpZrabjb9yNwEKGmJhKsZNXM
         POaYDDZ3PRMS7kHJaqqGrNPSWUKhtMiXQAtAhDBpchNE22/mOIQqazYehzmK3v2hj6jE
         c1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146151; x=1758750951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7wL9p64D8keeYetVsE8VmLXNMGlwrZzPrEEjyLI3t0=;
        b=s6NRjpJfCCsSrWPF/90Tt+lQptCF+KVQCup8MY0nNzD6i7P/fQdC8jXHw1zT2GkX17
         KhPnqLTS1dc48oenaV7tlxyMYtAudAr2SxLnu768pvvnwkC5dwBacm3NQVZvPhEQiflg
         MIlNw2GWrb1EhrT9AgLJqJchf0ZaGA9X4syqKABHqnXKAWrNCyBW/TdilbgYPiffOMtr
         LIgFmyC3M3bW9RJBb7WAmcB0edEGaVr2vQW6AvBS+zmUWJGbZcXAJrZWQ7vu7co+zDJv
         ZqA2NFafWxUaqHHepcoZjDtaMMUIbIO5vOqJYrjoAjBEfvzYxVes0tPsfsrTL8R9vSEr
         gUxA==
X-Gm-Message-State: AOJu0Yzl1E1KiQD8G6FnYerLOZrzpMlC2OmSSaXrCJSIblQ4jJa2IsjK
	N8wU+kcmVoePCkc0zORFK4ArCMMH/8xNanqOTdsZCd4ibhTCF93bvpKm8KQ+fVzkXgY=
X-Gm-Gg: ASbGncv0qax9O0ApvHqmKRtWjxHnr5Bfk1O8m2/jRy70QBBikR1ubTIAhiHka0htbOt
	+968lzuPleQjkJg9dEpUYW5n9fb6TD4dlD2RCKIZcBv7qwEQN/ekpDIzxh87qK7TBRx+eVmlQjk
	wM0im92oCtOVfITx7V2Uj5EPOru0QfAwiNjLF6dYKXhwrcEAfgzRWcIvfMuvjxjsRON5COlMmTn
	MgZVdIWFrOFCdwbaxDd1txnDpzTK+LjFj3IH3Pk55S9rbQRbXkVd+u5c3Wryndzm0N4rbuCEZ4t
	VB1BLi5rbY3liNTuiw14b71BMTtGao0Edcvv4x+o60jRriUrdrYOF4SaRFOOkdwN9Xjwh6aP2j4
	gBuH8XO+m8Iy6+AWDB6KO2uEMMOHfVXRu/pHbqzeKOVqY
X-Google-Smtp-Source: AGHT+IEgHMUp3Oo/HXbN6jZZ4INo1TLXrt9jqtZfEzKCEIqFDtAh06tMdONG8vYNaOEe8Vlgv+vS1A==
X-Received: by 2002:a17:903:3888:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-26811ba7117mr36774155ad.14.1758146150634;
        Wed, 17 Sep 2025 14:55:50 -0700 (PDT)
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
Subject: [PATCH v4 00/18 for 4.22] xen/riscv: introduce p2m functionality
Date: Wed, 17 Sep 2025 23:55:20 +0200
Message-ID: <cover.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

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

Oleksii Kurochko (18):
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

 xen/arch/arm/include/asm/p2m.h              |    5 +
 xen/arch/riscv/Makefile                     |    3 +
 xen/arch/riscv/cpufeature.c                 |    1 +
 xen/arch/riscv/include/asm/Makefile         |    1 -
 xen/arch/riscv/include/asm/cpufeature.h     |    1 +
 xen/arch/riscv/include/asm/domain.h         |   23 +
 xen/arch/riscv/include/asm/flushtlb.h       |   13 +-
 xen/arch/riscv/include/asm/mm.h             |   29 +-
 xen/arch/riscv/include/asm/p2m.h            |  183 ++-
 xen/arch/riscv/include/asm/page.h           |   38 +
 xen/arch/riscv/include/asm/paging.h         |   20 +
 xen/arch/riscv/include/asm/riscv_encoding.h |    7 +
 xen/arch/riscv/include/asm/vmid.h           |    8 +
 xen/arch/riscv/mm.c                         |   71 +-
 xen/arch/riscv/p2m.c                        | 1337 +++++++++++++++++++
 xen/arch/riscv/paging.c                     |  137 ++
 xen/arch/riscv/setup.c                      |    6 +
 xen/arch/riscv/stubs.c                      |    5 -
 xen/arch/riscv/vmid.c                       |  193 +++
 xen/common/device-tree/dom0less-build.c     |    2 +-
 20 files changed, 2058 insertions(+), 25 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/paging.c
 create mode 100644 xen/arch/riscv/vmid.c

-- 
2.51.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61CBF23F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146527.1478951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsGz-0004bF-M4; Mon, 20 Oct 2025 15:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146527.1478951; Mon, 20 Oct 2025 15:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsGz-0004Za-Go; Mon, 20 Oct 2025 15:58:13 +0000
Received: by outflank-mailman (input) for mailman id 1146527;
 Mon, 20 Oct 2025 15:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsGy-0004DQ-79
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:12 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9422407f-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:11 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso837228166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:11 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:10 -0700 (PDT)
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
X-Inumbo-ID: 9422407f-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975891; x=1761580691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAAAcMWBhBxylKcZtSq/DZF9jlzUAjaFiUSj3AuRmhc=;
        b=Ncy0H+2ksP0S0kcwbyiHHTygc8nVWRirQAZQJwPXtOyeQf6RW2Iqp7AzsfWCzHoPcz
         5+FQ0v/EEffls9m3uJCkkcMK28yPNe13xSeYj8l88kNrxC/fLBWvWyB91ISvz2PMvGyS
         Qd1g1PaX0R70SU8I7WQLr7BQT0RK6jHew10xMADF4XHION25fXSp16UrlAD2slxQvMk9
         ErLNkuGs1YDEdUVdMt8RMocOR58fMqb6D9bH5tVaWmIy4O9TfGdSS9I1fQoGhAjJ/qgZ
         5REAMc0LhzghZ7QirZdta/xI4TWB3XmLeZxxabTzk/gt5ttxgBc/uUHGnYAoYAHbiWXu
         OmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975891; x=1761580691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAAAcMWBhBxylKcZtSq/DZF9jlzUAjaFiUSj3AuRmhc=;
        b=pY3upC81/d/lY2uK84Qc11tTQbt4wxoVDSdyyEdVDcmk1B3pnIoTrhSGeFsUZjuTkM
         2yoz7P3dYqihbYawhzktGcCDJ7Duhla5GD+XsmDVaZ1cDbP14w2RX4v39WDuPdvnrc4R
         96cmoITpiug8XhRVrQThLMBCrk5NaJ2VzS7UddMzPR5xxyRU9QIYzZLNx4E2HPEmAge0
         XCOLnhJlGcph6FA6maeoHmxaaS8GWWPqwzh96PzAAya6vOt3R29PeYRI0dYMDzx4wTjK
         SXF/Ays9nTEkQRqmuK4CA5LsdGLE9GNIH1o1DGpw0tpHHdDHv0snp4iEdMHxGZ0T8NlG
         zkhA==
X-Gm-Message-State: AOJu0YzdlZJcRXPAw0SsgXmG9QyMFOLzt3e0FnaNK6TN55PM4qqLmiuO
	kdY6c9MNmwpL5FHYwGEYWArybH+TzGctUrm7uNGr0d/9YMk+cYQumN4AH7HIig==
X-Gm-Gg: ASbGncvER3Jcq+/U42moQS+2apjcLLHF994EdleyI5DUFqDYgItI9AyuQdGvQKgGJTi
	QEpLHZ2RKpr5rBOxSZmwqd9DYxRr503mkn29wDKuZMMAkQ/x/EOYrJ2Ftyw6kUp9ibhzBDkaI4X
	KaTY0rg0h9Vf/GTcqb2UQp3Yos28MQ3gj8iW6VIZ2Om860mjShvchnO02d+vuFBUzLohQosaVIY
	JkhSl3TJ6A9R/fkM3OPOzv0FTxlLB0GHmYY3vs7zKPbtzXUiwtk8rDOUzxumQGhS7jheUUfiPIN
	1k/oLqI6fXHCPaK4XDfTf4DwQApDEQ+Psz4ge1bqP0wW/kFObBP438E0CgdiYHVpD68k9/ap2tG
	Y6vU8T0NhtiVQ3OEUYiaghGqqgwOq95OsuL2qjqaajA0kh4KPBPcPwzuw3kwyA1d64pEWtEhlJa
	Dn6g3hg7mVsGJyTVnK+C2m0omeJANUzoKuYmwQrJy1C2TBqzQ/pS/fvlG28A==
X-Google-Smtp-Source: AGHT+IERGa9Gycy/DAA1FGoWTbukcN1BQpnNIDAzNa4GlHAeBF+BUoerkI8EHIoW0RL9P/ugXfaXFg==
X-Received: by 2002:a17:907:6d0f:b0:b0c:b51b:81f6 with SMTP id a640c23a62f3a-b647423c403mr1718978666b.43.1760975890637;
        Mon, 20 Oct 2025 08:58:10 -0700 (PDT)
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
Subject: [for 4.22 v5 00/18] xen/riscv: introduce p2m functionality
Date: Mon, 20 Oct 2025 17:57:43 +0200
Message-ID: <cover.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
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
 xen/arch/riscv/include/asm/p2m.h            |  182 ++-
 xen/arch/riscv/include/asm/page.h           |   37 +
 xen/arch/riscv/include/asm/paging.h         |   20 +
 xen/arch/riscv/include/asm/riscv_encoding.h |    7 +
 xen/arch/riscv/include/asm/vmid.h           |   14 +
 xen/arch/riscv/mm.c                         |   69 +-
 xen/arch/riscv/p2m.c                        | 1381 +++++++++++++++++++
 xen/arch/riscv/paging.c                     |  139 ++
 xen/arch/riscv/setup.c                      |    3 +
 xen/arch/riscv/stubs.c                      |    5 -
 xen/arch/riscv/vmid.c                       |  193 +++
 xen/common/device-tree/dom0less-build.c     |    2 +-
 20 files changed, 2103 insertions(+), 25 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/include/asm/vmid.h
 create mode 100644 xen/arch/riscv/p2m.c
 create mode 100644 xen/arch/riscv/paging.c
 create mode 100644 xen/arch/riscv/vmid.c

-- 
2.51.0



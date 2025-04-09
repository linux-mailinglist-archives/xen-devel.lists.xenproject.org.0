Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C66A82FE4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 21:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944594.1343007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2agQ-0003vz-Od; Wed, 09 Apr 2025 19:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944594.1343007; Wed, 09 Apr 2025 19:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2agQ-0003tC-L6; Wed, 09 Apr 2025 19:01:58 +0000
Received: by outflank-mailman (input) for mailman id 944594;
 Wed, 09 Apr 2025 19:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pLOg=W3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2agP-0003t6-0s
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 19:01:57 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a749ef2-1575-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 21:01:54 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5eb92df4fcbso105399a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 12:01:54 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd255sm134756466b.156.2025.04.09.12.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 12:01:52 -0700 (PDT)
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
X-Inumbo-ID: 1a749ef2-1575-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744225314; x=1744830114; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FIlT454pWFCXqqFx4gqqRYOkIzp5sdnWMGLVAXJgO9U=;
        b=TR9oG4AmUJSzdAntFtRh2VHMNSryrCW0I17aOwNkUpFSJ0pOP90Zq6NySVPOD9iP5y
         6Iqc912yRMct+pM7o7R/5VOd7dTKzqMOSZ+XNipd/b88O90NQpjP3cpGj8rxgzWKYMpC
         KFliHHA1ClYmsAgDR4HlHN4L8svDDGGOxZR8YbcnfRqAyNH7P0Ox+v/ZJvVjw045cwaO
         afS5rlRSU+1czKWtTXPiVJVAYVSLW/hfzsVNyx2y3bxSLBAGKGK2jSd8AYwE+1AoIF9g
         v/UyS9dfaVVmRPOZnXNujI287O17uLdIxmJzcT7hSbeee8aMZ9fhWYE+iCK71Dxhymj/
         imaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225314; x=1744830114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIlT454pWFCXqqFx4gqqRYOkIzp5sdnWMGLVAXJgO9U=;
        b=H2nUDe7Qvxr0FnYc9Ri5f5wYLikkl7cq0vEBf9NcesNX5BYsPyFjZaIIztd7LS1yL0
         0lpcX5RE9cyQiXGuaAYtjKFRNw/HrcdWnzO2uWah1lkNGKoOaacHIHV55NRa7YiNxVDp
         Fc8+6P9C9ZAouz4ar72dzS677dnCmA7fvDy2MmU7RbdlGYYqMlu0eoMMnX9K9TzeyL4/
         eW/CdAHuNiHq8ZTpagLZBc2WNjV5M2Fmqw+6ypNHcKEjO4uD48GvHzCXPicbzZdcytQx
         UFLGYuJtTNS3T4k0dazpsJg7FiG68HtRrJyAqSbjXHntz3i7d1/XeTUpuWgLZWP6OYiO
         OPWQ==
X-Gm-Message-State: AOJu0YwNFGiu/fBPj0UynBlQ4hkgHyqEjv81mO5u4L3bnauXGbLUyWmP
	VsqT7dJeUBna2WQy5n2iJD87wV+9wM4rRqr0plGQOqNsB5idot8sULlGCA==
X-Gm-Gg: ASbGncuKlqUjbGT5MOJN4uY66DpUREBuI5qdKkVpKm5d68SFv3Wm3RhgFfYp0WIL4GV
	xINDtEaqQ8Ht4jKpqyog28EosYwcD2qNC3D3fFrVuG9uOeC7UmLd0pfl3VKKY49XNvi4a6d1qoh
	3mJ0mKnYnuYmpP5D9ApEpfxqSbpE5jA0eHwSMsnl+BnZUKffmY8Y+lU7GG29kXXolmu6wB69MhF
	xhu1Q2caVlBiTiMj5+ljkrCWh3ttFKCZFVmQ9eRuYQwVtzj4bHjGVD2oaLrTZspZplqcPYAr50m
	aHauKFWKEe8YVVJ3hmckA3BoYi/b/F46nhv1XkgOg8Fwd5ML3cg6HCpiLCFYtpF11YMU/sm76mP
	GiOKXHSrsMg==
X-Google-Smtp-Source: AGHT+IHoNFW/8trAhc0Jipt6fSIUcAkVaMw8UFuQWDHIxEGH8CvefOv1rCBF7+X6u8se2rvkJz1Pxw==
X-Received: by 2002:a17:907:60d1:b0:abf:641a:5727 with SMTP id a640c23a62f3a-aca9d5cee01mr402411566b.7.1744225313660;
        Wed, 09 Apr 2025 12:01:53 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] xen/riscv: Increase XEN_VIRT_SIZE
Date: Wed,  9 Apr 2025 21:01:50 +0200
Message-ID: <eb20a5730b55c1731324cc3970c3a3c9ea666a85.1744214442.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A randconfig job failed with the following issue:
  riscv64-linux-gnu-ld: Xen too large for early-boot assumptions

The reason is that enabling the UBSAN config increased the size of
the Xen binary.

Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
and GCOV to be enabled together, with some slack for future growth.

Additionally, add ASSERTs to verify that XEN_VIRT_START is 1GB-aligned
and XEN_VIRT_SIZE is 2MB-aligned to reduce the number of page tables
needed for the initial mapping. In the future, when 2MB mappings are
used for .text (rx), .rodata (r), and .data (rw), this will also help
reduce TLB pressure.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Add ASSERT which checks .init* sections range. When Xen ends boot
   init* sections are going to be released.
 - Introduce is_init_section() macros.
 - Correct fixmap end address in RISCV-64 layour table.
 - Update ASSERT() which checks that `va` is in Xen virtual address
   range and drop BUILD_BUG_ON() as it isn't necessary anymore with
   the way how the ASSERT() looks now.
 - Add ASSERT() which checks that XEN_VIRT_START is 1gb aligned and
   add ASSERT() which checks that XEN_VIRT_SIZE is 2mb aligned.
   It helps us to reduce an amount of PGTBL_INITIAL_COUNT.
 - Update PGTBL_INITIAL_COUNT and the comment above.
 - Update the commit message.
---
Changes in v2:
 - Incerease XEN_VIRT_SIZE to 16 Mb to cover also the case if 2M mappings will
   be used for .text (rx), .rodata(r), and .data (rw).
 - Update layout table in config.h.
 - s/xen_virt_starn_vpn/xen_virt_start_vpn
 - Update BUILD_BUG_ON(... != MB(8)) check to "... > GB(1)".
 - Update definition of PGTBL_INITIAL_COUNT and the comment above.
---

 xen/arch/riscv/include/asm/config.h |  8 ++++----
 xen/arch/riscv/include/asm/mm.h     | 20 +++++++++++++++++---
 xen/arch/riscv/mm.c                 | 22 +++++++++++++---------
 xen/arch/riscv/xen.lds.S            |  4 ++++
 4 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7141bd9e46..5eba626f27 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,11 +41,11 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
+ *  0xffffffffc1800000  0xffffffffc19fffff L2 511          Fixmap
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0400000  0xffffffffc07fffff L2 511          FDT
+ *  0xffffffffc1200000  0xffffffffc15fffff L2 511          FDT
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0000000  0xffffffffc01fffff L2 511          Xen
+ *  0xffffffffc0000000  0xffffffffc0ffffff L2 511          Xen
  *                   .....                 L2 510          Unused
  *  0x3200000000        0x7f7fffffff       L2 200-509      Direct map
  *                   .....                 L2 199          Unused
@@ -78,7 +78,7 @@
 
 #define GAP_SIZE                MB(2)
 
-#define XEN_VIRT_SIZE           MB(2)
+#define XEN_VIRT_SIZE           MB(16)
 
 #define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE + GAP_SIZE)
 #define BOOT_FDT_VIRT_SIZE      MB(4)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 4035cd400a..1b0c4299c6 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -9,6 +9,7 @@
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
 #include <xen/pfn.h>
+#include <xen/sections.h>
 #include <xen/types.h>
 
 #include <asm/page-bits.h>
@@ -35,6 +36,11 @@ static inline void *maddr_to_virt(paddr_t ma)
     return (void *)va;
 }
 
+#define is_init_section(p) ({                   \
+    char *p_ = (char *)(unsigned long)(p);      \
+    (p_ >= __init_begin) && (p_ < __init_end);  \
+})
+
 /*
  * virt_to_maddr() is expected to work with virtual addresses from either
  * the directmap region or Xen's linkage (XEN_VIRT_START) region.
@@ -43,13 +49,21 @@ static inline void *maddr_to_virt(paddr_t ma)
  */
 static inline unsigned long virt_to_maddr(unsigned long va)
 {
+    const unsigned long xen_size = (unsigned long)(_end - _start);
+    const unsigned long xen_virt_start = _AC(XEN_VIRT_START, UL);
+    const unsigned long xen_virt_end = xen_virt_start + xen_size - 1;
+
     if ((va >= DIRECTMAP_VIRT_START) &&
         (va <= DIRECTMAP_VIRT_END))
         return directmapoff_to_maddr(va - directmap_virt_start);
 
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
+    ASSERT((va >= xen_virt_start) && (va <= xen_virt_end));
+
+    /*
+    * The .init* sections will be freed when Xen completes booting,
+    * so the [__init_begin, __init_end] range must be excluded.
+    */
+    ASSERT((system_state != SYS_STATE_active) || !is_init_section(va));
 
     /* phys_offset = load_start - XEN_VIRT_START */
     return phys_offset + va;
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f2bf279bac..064ae1ddc7 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,24 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
- * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Root page table is shared with the initial mapping and is declared
+ * separetely. (look at stage1_pgtbl_root)
  *
- * It might be needed one more page table in case when Xen load address
- * isn't 2 MB aligned.
+ * An amount of page tables between root page table and L0 page table
+ * (in the case of Sv39 it covers L1 table):
+ *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
+ *   the same amount are needed for Xen.
  *
- * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
- * except that the root page table is shared with the initial mapping
+ * An amount of L0 page tables:
+ *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
+ *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
+ *   one L0 is needed for indenity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
+                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)))
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index dffc6ae119..91e10b8e52 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -178,4 +178,8 @@ ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
  */
 ASSERT(_end - _start <= XEN_VIRT_SIZE, "Xen too large for early-boot assumptions")
 
+/* Changing these ASSERTs can require an update of PGTBL_INITIAL_COUNT */
+ASSERT(IS_ALIGNED(XEN_VIRT_START, GB(1)), "XEN_VIRT_START should be 1gb aligned")
+ASSERT(IS_ALIGNED(XEN_VIRT_SIZE, MB(2)), "XEN_VIRT_SIZE should be 2mb aligned")
+
 ASSERT(_ident_end - _ident_start <= IDENT_AREA_SIZE, "identity region is too big");
-- 
2.49.0



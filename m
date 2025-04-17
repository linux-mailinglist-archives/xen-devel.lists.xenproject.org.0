Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86719A92240
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958204.1351133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rmw-0005oD-S7; Thu, 17 Apr 2025 16:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958204.1351133; Thu, 17 Apr 2025 16:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rmw-0005lf-Ob; Thu, 17 Apr 2025 16:08:30 +0000
Received: by outflank-mailman (input) for mailman id 958204;
 Thu, 17 Apr 2025 16:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5Rmv-0005lV-B2
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:08:29 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3229461f-1ba6-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 18:08:27 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f620c5f7b9so511795a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 09:08:27 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6eefcf4fsm11813366b.109.2025.04.17.09.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 09:08:25 -0700 (PDT)
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
X-Inumbo-ID: 3229461f-1ba6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906106; x=1745510906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3NWB8mLbn4p6HtvClqdYwWaVWheS1paF4s/IftnNZg0=;
        b=j8MOuTB0SEw8Db1B5bBS1+AnGNHVcrAI9twDZQ7KLGkEDW48kpZTH7/wBjLpM/ogmq
         2fQFJONcKZh/96JhE0cCc5yMdW/VlNwmQtgBwZsbhyXv0e5sO1aCtUejQRxB0XtBT0v4
         7D0VPdlYBktnIEimOg95V3nxwXNgEW2OPaa8wKJMseQD7cOW78jBn8GY4LifJVNd+dAn
         78LdDRUaPLg8HfrtfN/SeVmLY7xznV6HXhfr7yu4/4AZiOLUOcg/5oOPi9d4TpGdBEom
         giK5O65AbOhi8C88u9hhW1GF3keY5iYvsDQ966n2lnNttlJnA+yo08RNhpKjjwqU66MX
         KffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906106; x=1745510906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NWB8mLbn4p6HtvClqdYwWaVWheS1paF4s/IftnNZg0=;
        b=Xla9iqhIId2azFLNQwtsrCg4aN3Mo2cb0tru1yn0YzzGk9XUa9C9a8h52imcNpgSuC
         udqmX5EaqFeJFvXxfQPkhMwV2ZfrriE7cyg+1Q+vLS2fXMtixemnC6XR9ffPcQi+tSP5
         hOELQfS9NmGdoBEIhdw8YNJIudIyLaiuxDlVkYurU5fSttg5Km9cihm9TUrthOYuHVG3
         r9GF1xNZ3uYyA2f5JzRIgd/JIlhDKwHMfe2ouv3WX2AwbpMVvgcpAJSjAC2bOel5xuxN
         b8yG1aPA1pQlQI2YJOqCEV4zdb64+/IGv/C8zdVHLfvl4RqRRbKlZhrHbz5AxX00rOwv
         HEqQ==
X-Gm-Message-State: AOJu0Yx7Vz/llXOYeafA1HLKnKcE8BnIQhaewWJuzo49Uu/yk94x5aqy
	I7abcdlCbrnqhmOKN/7+X1IFg4Z490sv+e0m7n1+OPr7WTgJfcLy33D/4g==
X-Gm-Gg: ASbGncvIV7AvEmn8D3ZaRyIG5Rb4PC0OE0yYuiMpjDckfLTdPOgjarN/SLxcH/lhNSW
	ymYwR4UgKii9TCXn0tlbsArjlMwnTLA09dUHVn/fxqdFJo9Kwo2AS6tv69o7xAJtEId2gb7RAKt
	chqL8xWoLdpNi1Ny/GmzizIeLm9kEBLx9CSOmMObzfEBuCxD5OScQxHQjuaY7JdoikGBDohI9H4
	jTdGCOnMtXlA4/wyqzQjbKvIo+2UK9m2J278aWha+CMmMTXPrrwy7epPIfOO6oYVZ5Ro0XaKLM6
	VacQdfWvEJEpuQVDkAqXEFdTHapgBtLaflDBnme0iJZFyvj5QhvzeUwFst1UDXzIdfq5GOwr6tg
	cog1R8vyywQ==
X-Google-Smtp-Source: AGHT+IHY5WK/9+EjSWe3x0M01GEY7IDf9i3WY4/VZftLp4beSojL3weDsp5TINYXGjWesvDpD208JQ==
X-Received: by 2002:a17:907:9443:b0:ac3:bd68:24eb with SMTP id a640c23a62f3a-acb42874d11mr526386966b.1.1744906105896;
        Thu, 17 Apr 2025 09:08:25 -0700 (PDT)
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
Subject: [PATCH v5] xen/riscv: Increase XEN_VIRT_SIZE
Date: Thu, 17 Apr 2025 18:08:23 +0200
Message-ID: <9fbb5e1389b84bed2e95f99e4c383d0215c7a524.1744889185.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A randconfig job failed with the following issue:
  riscv64-linux-gnu-ld: Xen too large for early-boot assumptions

The reason is that enabling the UBSAN config increased the size of
the Xen binary.

Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
and GCOV to be enabled together, with some slack for future growth.

Additionally, add checks to verify that XEN_VIRT_START is 1GB-aligned
and XEN_VIRT_SIZE is 2MB-aligned to reduce the number of page tables
needed for the initial mapping. In the future, when 2MB mappings are
used for .text (rx), .rodata (r), and .data (rw), this will also help
reduce TLB pressure.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - Introduce build_assertions() instead of open-code BUILD_BUG_ON().
 - Update the comment message above PGTBL_INITIAL_COUNT.
 - Add BUILD_BUG_ON() to check that XEN_VIRT_SIZE <= GB(1).
---
Changes in v4:
 - Move is_init_section() to xen/sections.h. Add const for
   declaration of `p` variable inside is_init_section() and
   for the cast.
 - Update the comment above ASSERT() with .init* section range:
   s/[__init_begin, __init_end]/[__init_begin, __init_end).
 - Update ASSERT condition:
   s/"system_state != SYS_STATE_active"/"system_state < SYS_STATE_active".
 - Drop MB after XEN_VIRT_SIZE in the comment above PGTBL_INITIAL_COUNT
   as XEN_VIRT_SIZE expands to MB(16).
 - Fix typos:
   s/separetely/separately
   s/indenity/identity
 - Add lost L0 table for identity mapping to PGTBL_INITIAL_COUNT.
 - Move checks to alignment checks of XEN_VIRT_SIZE and XEN_VIRT_SIZE
   closer to the definition of PGTBL_INITIAL_COUNT.
 - Update the commit message.
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
 xen/arch/riscv/include/asm/config.h |  8 +++----
 xen/arch/riscv/include/asm/mm.h     | 15 +++++++++---
 xen/arch/riscv/mm.c                 | 37 ++++++++++++++++++++++-------
 xen/include/xen/sections.h          |  4 ++++
 4 files changed, 48 insertions(+), 16 deletions(-)

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
index 4035cd400a..ef8b35d7c2 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -9,6 +9,7 @@
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
 #include <xen/pfn.h>
+#include <xen/sections.h>
 #include <xen/types.h>
 
 #include <asm/page-bits.h>
@@ -43,13 +44,21 @@ static inline void *maddr_to_virt(paddr_t ma)
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
+    * so the [__init_begin, __init_end) range must be excluded.
+    */
+    ASSERT((system_state < SYS_STATE_active) || !is_init_section(va));
 
     /* phys_offset = load_start - XEN_VIRT_START */
     return phys_offset + va;
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f2bf279bac..d3ece9f132 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,39 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then XEN_VIRT_SIZE.
  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
- * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Root page table is shared with the initial mapping and is declared
+ * separately (look at stage1_pgtbl_root), so it isn't taken into account
+ * in PGTBL_INITIAL_COUNT.
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
+ *   one L0 is needed for identity mapping.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
+                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)) + 1)
+
+/*
+ * Modifying these checks may require updating PGTBL_INITIAL_COUNT.
+ *
+ * If XEN_VIRT_{START,SIZE} are not properly aligned and XEN_VIRT_SIZE > GB(1),
+ * additional L1 and L0 page tables are required.
+ */
+static void __init __maybe_unused build_assertions(void)
+{
+    BUILD_BUG_ON(!IS_ALIGNED(XEN_VIRT_START, GB(1)));
+    BUILD_BUG_ON(!IS_ALIGNED(XEN_VIRT_SIZE, MB(2)));
+
+    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
+}
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
index f2fac8d7fa..fe49d7d0e6 100644
--- a/xen/include/xen/sections.h
+++ b/xen/include/xen/sections.h
@@ -7,6 +7,10 @@
 
 /* SAF-0-safe */
 extern char __init_begin[], __init_end[];
+#define is_init_section(p) ({                           \
+    const char *p_ = (const char *)(unsigned long)(p);  \
+    (p_ >= __init_begin) && (p_ < __init_end);          \
+})
 
 /*
  * Some data is expected to be written rarely (if at all).
-- 
2.49.0



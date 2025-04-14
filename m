Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58674A887DE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950722.1347030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MBB-0002RL-SO; Mon, 14 Apr 2025 15:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950722.1347030; Mon, 14 Apr 2025 15:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MBB-0002Ls-Jr; Mon, 14 Apr 2025 15:57:01 +0000
Received: by outflank-mailman (input) for mailman id 950722;
 Mon, 14 Apr 2025 15:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MBA-0008KQ-FT
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:57:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189d5def-1949-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:56:58 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac289147833so904669066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:58 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd1b9sm940683166b.147.2025.04.14.08.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:57 -0700 (PDT)
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
X-Inumbo-ID: 189d5def-1949-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646218; x=1745251018; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9dXdGg45Qgc2Gjf4NhwJNWU+j8wV5npfJCoRjaHCxk=;
        b=jK7bcnWRVzMMOMq9QCufySD9P440+j6GfzJLdMYuLdhN/w4i/ZgWMzmqxeVZebcLlV
         wUDFX3B0X6K/o19UzB4vFWBzInbo52W21in71KIOzc/gyb1vj352dOEVmRjbJegRT+n4
         AABYBxS2JD7lTlTsXm+JJZhxq8jJt+VQqMJuQluoV5BHR3HTVC5jkz9gxgrxBPwrTVJI
         OrciBXUcc4XLEOg5OMvxJrPgyxPZo6dWTm2BG++EoJfFSLM3qY1Gzbgrj/h2ieYwCatE
         slf+PpHm+iboWQLaXFmeO3uiBnDyUwhR7TBQdx9mxIu+TJbrAAcYObTjdlREPxbzse0f
         ffNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646218; x=1745251018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9dXdGg45Qgc2Gjf4NhwJNWU+j8wV5npfJCoRjaHCxk=;
        b=E9BGUQLrEmERRGUDf+66RjYczp8K/PXRBhfnxeRPc76mtk6ygWzSYuslqAS1hAQCiB
         Hdpa40zUMzsO6uDTKIMhvP9ycWK64jCpSeHN7Tokgry2395tsDg2SH1MXt1djpvphNxE
         D/RNDgFnElqq9NvA0wtAAnZHZzPY9ddpXOhkJ3pTryZWLN9yRNcfLmDfzSIFqgSRLwPU
         PGPfM9HW6FDNr1f8XjYcB8O9a149eFHxOTqqGjn1LZcedppyV1qG/DlgcT1YgWClOw5N
         b7n04gtr2gAmHnsAKzXYcl9Wgx4je++QGGCr5gFyrAHvfCymC2bx5YUXmDsOSwSVK7G9
         i8cg==
X-Gm-Message-State: AOJu0YzKZF3mg324l8HAzG3Evlmmbn71KoAdlkm7iqlNCH95OD7nnax3
	YxzJS97dFb4musIk1TzV7l/p8WMatlVvO2bf+XH2SE79qPIBwUrcbRSotg==
X-Gm-Gg: ASbGncu/7gTrOvaW7f3iGqbuEuhwW5oockbyUWg/ClR+vqFuxxwhrInmrDuYzjAFG3S
	quDDyjMGIgqnBu73l6tQ41dWfhSYXXX0DOh/Zm330lP0itLR9CfP1/NglOaLEq1+GBzwmY9Jsg/
	/qMF2lksE6qVNORZEvtv57cqiShw7xPKydpPsFKHgVeHL5SJ7ZVT6zcFasv04iaJzXRwRZ35902
	2WItYDYXPjMIaiNij8vohWmpnMTGLZnIh2Y5uTS/JQ7hRBQW1n4+G5O+uh3jZtKMf0c3MClne/4
	MBaE4TiU3zH8x3l+XB/ip0tf8teIc0D19KHFZSgsK2+ZZ8bCQo1+xV4kNEBHRx+Aq8hOGRh5Cc3
	sdfUprs925noM765p/6LB
X-Google-Smtp-Source: AGHT+IG7LNmuW/Yp9UP6y6R5BPBbgVvTdhwjobuPssvWJbi3/z8wGJC59MjSEDdsiv8yZqQ1pA9zqA==
X-Received: by 2002:a17:906:c44b:b0:aca:d66d:cd0d with SMTP id a640c23a62f3a-acad66dcdd4mr913946266b.30.1744646217516;
        Mon, 14 Apr 2025 08:56:57 -0700 (PDT)
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
Subject: [PATCH v4] xen/riscv: Increase XEN_VIRT_SIZE
Date: Mon, 14 Apr 2025 17:56:54 +0200
Message-ID: <0815b65aa0b526b85c737f5923148b119cc4104f.1744639515.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/config.h |  8 ++++----
 xen/arch/riscv/include/asm/mm.h     | 15 ++++++++++++---
 xen/arch/riscv/mm.c                 | 28 +++++++++++++++++++---------
 xen/include/xen/sections.h          |  4 ++++
 4 files changed, 39 insertions(+), 16 deletions(-)

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
index f2bf279bac..ee30ed7ff5 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,30 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
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
+ * separately. (look at stage1_pgtbl_root)
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
+/* Changing these checks can require an update of PGTBL_INITIAL_COUNT */
+_Static_assert(IS_ALIGNED(XEN_VIRT_START, GB(1)),
+               "XEN_VIRT_START should be 1gb aligned");
+_Static_assert(IS_ALIGNED(XEN_VIRT_SIZE, MB(2)),
+               "XEN_VIRT_SIZE should be 2mb aligned");
 
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



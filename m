Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B323AAD5D25
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011969.1390508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA9-0003M8-N5; Wed, 11 Jun 2025 17:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011969.1390508; Wed, 11 Jun 2025 17:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA9-0003K9-In; Wed, 11 Jun 2025 17:22:57 +0000
Received: by outflank-mailman (input) for mailman id 1011969;
 Wed, 11 Jun 2025 17:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPA7-0002dK-P9
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b619382b-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:55 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso86759f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:55 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a532435771sm16404330f8f.63.2025.06.11.10.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:53 -0700 (PDT)
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
X-Inumbo-ID: b619382b-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662574; x=1750267374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttrfu43pRWE6xwPmTOgphlvxFpMyWz3GgrH4WqitZoY=;
        b=ai9YvOzuSaybgXuqFf99uzC7SkG1aW2tFY0j3SzMOqSOhhCPzQ7vNkE7pPAi1rabJa
         lsJeYPDtChdq0HfY9QKA95YdLll9fLB4ewtMvUvfOoA/IehQDIaNKbyiCrln08kP+8Dq
         /1FR1glONtK1zhLqZkROkWFgl8SnkoyANYsTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662574; x=1750267374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttrfu43pRWE6xwPmTOgphlvxFpMyWz3GgrH4WqitZoY=;
        b=bal0uDxLgxgWIjfKnAlXh7R+TcFNR9YwKv/7E3n+5XCjf5vl92S33cJk9rbPQBHSlv
         fGy2thIo07yKVDC1B+0HYv7qNqvzwVQNzAeOojfsG3K5PuMPWgXvwkRWzq+9iMMiOGk5
         slQnDupefoCjDxW6wTEZd0Kz5dZxvUJBVFoTNhkaVU3wBLVz/WIjhHQnzL1CRIC20e+5
         C69pSC98CpQGs7AXU1QfjTSIen6zqIP0n+7mQtLrUTy0DbYwW26n+qH9uhwtniIVJU14
         E+CcibDA1hdJbLekd6on+b5vO89zU2S8EYsMarK1u4B/yzABvHKXBdjeurWoApQ/wryy
         Kr1g==
X-Gm-Message-State: AOJu0YzV80CAUhN7dAvGk5WCYdGCV9O9pt8+Ft7w5jQHrU5hF4DDv9tg
	2alXeC6bjSJlK+/yjtkJRxwywO4042bSm/WgFa+8mYIMhiytgHyhykj+HlruuVPnkBOTL8y/Kyr
	n62xb
X-Gm-Gg: ASbGncv2vaEJN0z/eW9BJ8FogWgoxUHyS9rIus+wTlrhFe2LdwOrsair0Xzo4dj70jz
	q6VfVAOS3/9xuCFKwuC1dZfQVb9EWA0umZhlvMhg0pobuk475Y/oqSngr+dkMD67Xdmx4EAHfTA
	8Z1zuq3VBAkOqX0f5BNLBNGEyKxfTqK+zf67nXcGgejyCCC2A+yrrpXoqiToCTfwlUy6mrB5hG+
	vblwsUojI+8O9Z/3dmErhylGPMygfkIMOpQ6G/UkAOWRsqWJN2zxex4VfLl/j75nJT3qoUnfl0D
	zGQSqb2AerEQxPIE0Lcaf5qAemz+OXZbpZFyMiIXkvZ8mwerA0hNLHVtHMgUcnf7jMnTa1iIAqo
	XM01QrWo+c1Xpy1f70z7Nh+xPFi7JJtlUjLk=
X-Google-Smtp-Source: AGHT+IGBuv1A6rD03lt3tuGkXIBzFKTXW9t2uvoWqXh1j3YfreQdjr3Ip7zMXU6tXWBGKsF90dyuqw==
X-Received: by 2002:a05:6000:4305:b0:3a5:1266:3e96 with SMTP id ffacd0b85a97d-3a558695737mr3511529f8f.15.1749662574140;
        Wed, 11 Jun 2025 10:22:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4/8] pdx: provide a unified set of unit functions
Date: Wed, 11 Jun 2025 19:16:32 +0200
Message-ID: <20250611171636.5674-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current setup (pdx_init_mask() and pdx_region_mask()) and init
(pfn_pdx_hole_setup()) PDX compression functions are tailored to the
existing PDX compression algorithm.

In preparation for introducing a new compression algorithm convert the
setup and init functions to more generic interfaces that aren't tied to the
compression in-use.  To accomplish this introduce a function that registers
all the PFN RAM ranges, plus an init function.

This has the downside of requiring a static array to store such ranges
ahead of being processed by the setup function, however it's the only way
to pass all the possible information to the different compression setup
functions without using per-compression specific setup functions.
Per-arch compression setup also need to be adjusted to use the new
interface.  There's a slight ordering adjustment, in that after PDX
compression setup the caller will check whether all the RAM regions are
properly covered by the newly setup compression, otherwise compression is
disabled by resetting to the initial values.

No functional change intended in the resulting PDX compression values.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/setup.c  |  34 ++++++-------
 xen/arch/x86/srat.c   |  28 ++++++----
 xen/common/pdx.c      | 116 ++++++++++++++++++++++++++++++++++++------
 xen/include/xen/pdx.h |  73 +++++++++-----------------
 4 files changed, 160 insertions(+), 91 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 734e23da4408..93ebfc29635e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -255,6 +255,10 @@ void __init init_pdx(void)
 {
     const struct membanks *mem = bootinfo_get_mem();
     paddr_t bank_start, bank_size, bank_end;
+    unsigned int bank;
+
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
+        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
 
     /*
      * Arm does not have any restrictions on the bits to compress. Pass 0 to
@@ -263,28 +267,24 @@ void __init init_pdx(void)
      * If the logic changes in pfn_pdx_hole_setup we might have to
      * update this function too.
      */
-    uint64_t mask = pdx_init_mask(0x0);
-    int bank;
+    pfn_pdx_compression_setup(0);
 
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
-        bank_start = mem->bank[bank].start;
-        bank_size = mem->bank[bank].size;
-
-        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
-    }
-
-    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
-    {
-        bank_start = mem->bank[bank].start;
-        bank_size = mem->bank[bank].size;
-
-        if (~mask & pdx_region_mask(bank_start, bank_size))
-            mask = 0;
+        if ( !pdx_is_region_compressible(mem->bank[bank].start,
+                 PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
+                 PFN_DOWN(mem->bank[bank].start)) )
+        {
+            pfn_pdx_compression_reset();
+            printk(XENLOG_WARNING
+                   "PFN compression disabled, RAM region [%#" PRIpaddr ", %#"
+                   PRIpaddr "] not covered\n",
+                   mem->bank[bank].start,
+                   mem->bank[bank].start + mem->bank[bank].size - 1);
+            break;
+        }
     }
 
-    pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
-
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
         bank_start = mem->bank[bank].start;
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 688f410287d4..7042fd3c3d88 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -261,8 +261,6 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 
 void __init acpi_numa_arch_fixup(void) {}
 
-static uint64_t __initdata srat_region_mask;
-
 static int __init cf_check srat_parse_region(
     struct acpi_subtable_header *header, const unsigned long end)
 {
@@ -282,15 +280,13 @@ static int __init cf_check srat_parse_region(
 		printk(KERN_INFO "SRAT: %013"PRIx64"-%013"PRIx64"\n",
 		       ma->base_address, ma->base_address + ma->length - 1);
 
-	srat_region_mask |= ma->base_address |
-			    pdx_region_mask(ma->base_address, ma->length);
+	pfn_pdx_add_region(ma->base_address, ma->length);
 
 	return 0;
 }
 
 void __init srat_parse_regions(paddr_t addr)
 {
-	u64 mask;
 	unsigned int i;
 
 	if (acpi_disabled || acpi_numa < 0 ||
@@ -299,19 +295,29 @@ void __init srat_parse_regions(paddr_t addr)
 
 	/* Set "PXM" as early as feasible. */
 	numa_fw_nid_name = "PXM";
-	srat_region_mask = pdx_init_mask(addr);
 	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 			      srat_parse_region, 0);
 
-	for (mask = srat_region_mask, i = 0; mask && i < e820.nr_map; i++) {
+	pfn_pdx_compression_setup(addr);
+
+	/* Ensure all ranges in the e820 are covered. */
+	for (i = 0; i < e820.nr_map; i++) {
 		if (e820.map[i].type != E820_RAM)
 			continue;
 
-		if (~mask & pdx_region_mask(e820.map[i].addr, e820.map[i].size))
-			mask = 0;
+		if (!pdx_is_region_compressible(e820.map[i].addr,
+		    PFN_UP(e820.map[i].addr + e820.map[i].size) -
+		    PFN_DOWN(e820.map[i].addr)))
+		{
+			pfn_pdx_compression_reset();
+			printk(XENLOG_WARNING
+			       "PFN compression disabled, RAM region [%#" PRIx64
+			       ", %#" PRIx64 "] not covered\n",
+			       e820.map[i].addr,
+			       e820.map[i].addr + e820.map[i].size - 1);
+			return;
+		}
 	}
-
-	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
 unsigned int numa_node_to_arch_nid(nodeid_t n)
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 4843630bee7f..65b337860d52 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -19,6 +19,7 @@
 #include <xen/mm.h>
 #include <xen/bitops.h>
 #include <xen/nospec.h>
+#include <xen/pfn.h>
 #include <xen/sections.h>
 
 /**
@@ -80,6 +81,39 @@ unsigned long get_max_pfn(unsigned long top_pfn)
     return pdx_to_pfn(pdx - 1) + 1;
 }
 
+#ifndef CONFIG_PDX_NONE
+
+#ifdef CONFIG_X86
+# include <asm/e820.h>
+# define MAX_PFN_RANGES E820MAX
+#elif defined(CONFIG_HAS_DEVICE_TREE)
+# include <xen/bootfdt.h>
+# define MAX_PFN_RANGES NR_MEM_BANKS
+#else
+# error "Missing architecture maximum number of RAM ranges"
+#endif
+
+/* Generic PFN compression helpers. */
+static struct pfn_range {
+    unsigned long base, size;
+} ranges[MAX_PFN_RANGES] __initdata;
+static unsigned int __initdata nr;
+
+void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
+{
+    if ( nr >= ARRAY_SIZE(ranges) )
+    {
+        ASSERT((nr + 1) > nr);
+        nr++;
+        return;
+    }
+
+    ranges[nr].base = PFN_DOWN(base);
+    ranges[nr++].size = PFN_UP(base + size) - PFN_DOWN(base);
+}
+
+#endif /* !CONFIG_PDX_NONE */
+
 #ifdef CONFIG_PDX_MASK_COMPRESSION
 
 /*
@@ -140,20 +174,25 @@ static uint64_t fill_mask(uint64_t mask)
     return mask;
 }
 
-bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
-{
-    return !(paddr_to_pfn(base) & pfn_hole_mask) &&
-           !(pdx_region_mask(base, npages * PAGE_SIZE) & ~ma_va_bottom_mask);
-}
-
-/* We don't want to compress the low MAX_ORDER bits of the addresses. */
-uint64_t __init pdx_init_mask(uint64_t base_addr)
-{
-    return fill_mask(max(base_addr,
-                         (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
-}
-
-uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+/**
+ * Calculates a mask covering "moving" bits of all addresses of a region
+ *
+ * The i-th bit of the mask must be set if there's 2 different addresses
+ * in the region that have different j-th bits. where j >= i.
+ *
+ * e.g:
+ *       base=0x1B00000000
+ *   len+base=0x1B00042000
+ *
+ *   ought to return 0x000007FFFF, which implies that every bit position
+ *   with a zero in the mask remains unchanged in every address of the
+ *   region.
+ *
+ * @param base Base address of the region
+ * @param len  Size in octets of the region
+ * @return Mask of moving bits at the bottom of all the region addresses
+ */
+static uint64_t pdx_region_mask(uint64_t base, uint64_t len)
 {
     /*
      * We say a bit "moves" in a range if there exist 2 addresses in that
@@ -168,9 +207,46 @@ uint64_t pdx_region_mask(uint64_t base, uint64_t len)
     return fill_mask(base ^ (base + len - 1));
 }
 
-void __init pfn_pdx_hole_setup(unsigned long mask)
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
+{
+    return !(paddr_to_pfn(base) & pfn_hole_mask) &&
+           !(pdx_region_mask(base, npages * PAGE_SIZE) & ~ma_va_bottom_mask);
+}
+
+/**
+ * Creates the mask to start from when calculating non-compressible bits
+ *
+ * This function is intimately related to pdx_region_mask(), and together
+ * they are meant to calculate the mask of non-compressible bits given the
+ * current memory map.
+ *
+ * @param base_addr Address of the first maddr in the system
+ * @return An integer of the form 2^n - 1
+ */
+static uint64_t __init pdx_init_mask(uint64_t base_addr)
+{
+    return fill_mask(max(base_addr,
+                         /* Don't compress the low MAX_ORDER bits. */
+                         (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
+}
+
+void __init pfn_pdx_compression_setup(paddr_t base)
 {
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
+    unsigned long mask = pdx_init_mask(base);
+
+    if ( nr > ARRAY_SIZE(ranges) )
+    {
+        printk(XENLOG_WARNING
+               "Too many PFN ranges (%u), not attempting PFN compression\n",
+               nr);
+        return;
+    }
+
+    for ( i = 0; i < nr; i++ )
+        mask |= pfn_to_paddr(ranges[i].base) |
+                pdx_region_mask(pfn_to_paddr(ranges[i].base),
+                                pfn_to_paddr(ranges[i].size));
 
     /*
      * We skip the first MAX_ORDER bits, as we never want to compress them.
@@ -209,6 +285,16 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
 }
 
+void __init pfn_pdx_compression_reset(void)
+{
+    pfn_pdx_bottom_mask = ~0UL;
+    ma_va_bottom_mask = ~0UL;
+    pfn_top_mask = 0;
+    ma_top_mask = 0;
+    pfn_hole_mask = 0;
+    pfn_pdx_hole_shift = 0;
+}
+
 #endif /* CONFIG_PDX_COMPRESSION */
 
 /*
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index ec0827936c2f..43ce36fcbb56 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -115,38 +115,6 @@ extern unsigned int pfn_pdx_hole_shift;
 extern unsigned long pfn_hole_mask;
 extern unsigned long pfn_top_mask, ma_top_mask;
 
-/**
- * Calculates a mask covering "moving" bits of all addresses of a region
- *
- * The i-th bit of the mask must be set if there's 2 different addresses
- * in the region that have different j-th bits. where j >= i.
- *
- * e.g:
- *       base=0x1B00000000
- *   len+base=0x1B00042000
- *
- *   ought to return 0x000007FFFF, which implies that every bit position
- *   with a zero in the mask remains unchanged in every address of the
- *   region.
- *
- * @param base Base address of the region
- * @param len  Size in octets of the region
- * @return Mask of moving bits at the bottom of all the region addresses
- */
-uint64_t pdx_region_mask(uint64_t base, uint64_t len);
-
-/**
- * Creates the mask to start from when calculating non-compressible bits
- *
- * This function is intimately related to pdx_region_mask(), and together
- * they are meant to calculate the mask of non-compressible bits given the
- * current memory map.
- *
- * @param base_addr Address of the first maddr in the system
- * @return An integer of the form 2^n - 1
- */
-uint64_t pdx_init_mask(uint64_t base_addr);
-
 /**
  * Map pfn to its corresponding pdx
  *
@@ -196,17 +164,6 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
             (offset & ma_va_bottom_mask));
 }
 
-/**
- * Initializes global variables with information about the compressible
- * range of the current memory regions.
- *
- * @param mask This mask is the biggest pdx_mask of every region in the
- *             system ORed with all base addresses of every region in the
- *             system. This results in a mask where every zero in a bit
- *             position marks a potentially compressible bit.
- */
-void pfn_pdx_hole_setup(unsigned long mask);
-
 #endif /* CONFIG_PDX_MASK_COMPRESSION */
 
 #ifdef CONFIG_PDX_NONE
@@ -227,17 +184,15 @@ static inline bool pdx_is_region_compressible(paddr_t base,
     return true;
 }
 
-static inline uint64_t pdx_init_mask(uint64_t base_addr)
+static inline void pfn_pdx_add_region(paddr_t base, paddr_t size)
 {
-    return 0;
 }
 
-static inline uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+static inline void pfn_pdx_compression_setup(paddr_t base)
 {
-    return 0;
 }
 
-static inline void pfn_pdx_hole_setup(unsigned long mask)
+static inline void pfn_pdx_compression_reset(void)
 {
 }
 
@@ -254,6 +209,28 @@ static inline void pfn_pdx_hole_setup(unsigned long mask)
  */
 bool pdx_is_region_compressible(paddr_t base, unsigned long npages);
 
+/**
+ * Register a RAM region with the PFN compression logic.
+ *
+ * @param base Start of the region in bytes.
+ * @param size Length of the region in bytes.
+ */
+void pfn_pdx_add_region(paddr_t base, paddr_t size);
+
+/**
+ * Initializes global variables with information about the compressible
+ * range of the current memory regions.
+ *
+ * @param base address to start compression from.
+ */
+void pfn_pdx_compression_setup(paddr_t base);
+
+/**
+ * Reset the global variables to it's default values, thus disabling PFN
+ * compression.
+ */
+void pfn_pdx_compression_reset(void);
+
 #endif /* !CONFIG_PDX_NONE */
 #endif /* __XEN_PDX_H__ */
 
-- 
2.49.0



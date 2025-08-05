Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7242B1B17A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070226.1433899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM9-0002k9-2i; Tue, 05 Aug 2025 09:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070226.1433899; Tue, 05 Aug 2025 09:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM8-0002g8-VA; Tue, 05 Aug 2025 09:53:16 +0000
Received: by outflank-mailman (input) for mailman id 1070226;
 Tue, 05 Aug 2025 09:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEM7-00026G-61
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:15 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00800a5b-71e2-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 11:53:13 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso2003675e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458f713eb44sm104033275e9.14.2025.08.05.02.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:11 -0700 (PDT)
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
X-Inumbo-ID: 00800a5b-71e2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387592; x=1754992392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsHoH88Bq1GawZ6maquU1VqYJOWUKfDJ8Tpkog2WGL4=;
        b=mzdWx2O/lD84MrDcO+0WpXXyTYnJxi12qxaNuB5dYjjD+JrarMO3EE6ZdCA56hXEcH
         aftY6E+50Q333rRBfvUeLXMyPBdigtvAxvUocEOA4NYTeelMPNAb7DUTk7zJa9V/xGgh
         u1JTcmIOTxuEaid2ViYUYleRH+O020abq2mrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387592; x=1754992392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsHoH88Bq1GawZ6maquU1VqYJOWUKfDJ8Tpkog2WGL4=;
        b=i37j8RcRSskP8JM7XmYuG2qYXdpg0Eyt2vNXuVx7KHy+6SWiHWbKvX8p11FA6wg1Ws
         li8pV9NXEXeklzeIKpa/nN8P/qhOq/qjfWlSTeOpq4uj1P5tmQKFdZvaSbvSaPloAh3c
         8JPQXd2yCmSYYT5JsfQ6NYVU/iztcrQFpBYL4gOjZPq+pVnZD/JQIf3wJeTdVWYbW5wu
         0v6MlWXmdndDEs7LZjSG/Rf0w/0z2KHKd9Dc0ZjIVeiwii437YgaRUEq3LhDfxNd+OSB
         UsUOBpkiSShVPZpXm+KjxnEzPMuIUdt7Jq8aYCusIQhrWTksvVaR9YkWNIj8h0KNC4ah
         ZLWQ==
X-Gm-Message-State: AOJu0YzPjG5JfQOgMlJux5SI30qbWt8DjPRaaSzOYPjZQEGb0QjLiBal
	zsnrxRgIzehUXS8zYPT49wx1/R+KTpt+T2EdeotFJzWSHpQ0mRFwo1CUsNtviMdfzNj4V/XWR/l
	3uvZX
X-Gm-Gg: ASbGnctL2SaReDRMbduPIYC6IDOxTRs0xskvd+lrAAJDSxn6OJsk7Yb2YuHSsHUnei5
	10ilmxrDFwragg9I+Vxi2Hu7JwuzntjVegHQiwuYIxuZSCdQDEJhz+yZVt9C6CZDTXV190NpGJG
	y6EJ7ZpTNxnWbut/tpDzu+60cQBLNT1wV5CXjlvf6PHhdpaGBCDfaMxHJY5ihQUIweXM2mAtnva
	ZrftDBtfV8sXjNisQpJ02O9ECFV32BrqK59rFhzaScS2k2mKEfERwrl56kM798xhyH7/v3U2fv3
	4vCt/7qWE+3e7HQ8KUs44d39UOdmBRuvA0arIDpgv46DxInjEeKi1zyx2/IGQxBM5RSrepdddBr
	l8LPVINqzY5QhKI3wW+gI2p1Jrrd2o3LJ+xvAXuj5ca7ZeSif68w7oWkfzxf/e5wMaA==
X-Google-Smtp-Source: AGHT+IFxvIar0IThaZT++liEgv3hQugAJuhVSOQvcs5FezgqdkMBUhbPoarb4rJsxvS11/W+diaoFA==
X-Received: by 2002:a05:600c:3b9c:b0:459:d3d0:650e with SMTP id 5b1f17b1804b1-459d3d065f9mr68179545e9.13.1754387592065;
        Tue, 05 Aug 2025 02:53:12 -0700 (PDT)
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
Subject: [PATCH v4 2/8] pdx: provide a unified set of unit functions
Date: Tue,  5 Aug 2025 11:52:51 +0200
Message-ID: <20250805095257.74975-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Rename base to base_pfn and size to pages.

Changes since v2:
 - Fix indentation.

Changes since v1:
 - s/nr/nr_ranges/
---
 xen/arch/arm/setup.c  |  34 ++++++------
 xen/arch/x86/srat.c   |  28 ++++++----
 xen/common/pdx.c      | 122 ++++++++++++++++++++++++++++++++++++------
 xen/include/xen/pdx.h |  73 +++++++++----------------
 4 files changed, 166 insertions(+), 91 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index a77b31071ed8..ba35bf1fe3bb 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -256,9 +256,11 @@ void __init init_pdx(void)
 {
     const struct membanks *mem = bootinfo_get_mem();
     paddr_t bank_start, bank_size, bank_end, ram_end = 0;
-    int bank;
+    unsigned int bank;
 
 #ifndef CONFIG_PDX_NONE
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
+        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
     /*
      * Arm does not have any restrictions on the bits to compress. Pass 0 to
      * let the common code further restrict the mask.
@@ -266,26 +268,24 @@ void __init init_pdx(void)
      * If the logic changes in pfn_pdx_hole_setup we might have to
      * update this function too.
      */
-    uint64_t mask = pdx_init_mask(0x0);
-
-    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
-    {
-        bank_start = mem->bank[bank].start;
-        bank_size = mem->bank[bank].size;
-
-        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
-    }
+    pfn_pdx_compression_setup(0);
 
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
-        bank_start = mem->bank[bank].start;
-        bank_size = mem->bank[bank].size;
-
-        if (~mask & pdx_region_mask(bank_start, bank_size))
-            mask = 0;
+        if ( !pdx_is_region_compressible(
+                  mem->bank[bank].start,
+                  PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
+                  PFN_DOWN(mem->bank[bank].start)) )
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
-
-    pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 #endif
 
     for ( bank = 0 ; bank < mem->nr_banks; bank++ )
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 688f410287d4..747607439fb4 100644
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
+	/* Ensure all RAM ranges in the e820 are covered. */
+	for (i = 0; i < e820.nr_map; i++) {
 		if (e820.map[i].type != E820_RAM)
 			continue;
 
-		if (~mask & pdx_region_mask(e820.map[i].addr, e820.map[i].size))
-			mask = 0;
+		if (!pdx_is_region_compressible(
+		          e820.map[i].addr,
+		          PFN_UP(e820.map[i].addr + e820.map[i].size) -
+		          PFN_DOWN(e820.map[i].addr))) {
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
index 00aa7e43006d..c5ea58873c0e 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -19,6 +19,7 @@
 #include <xen/mm.h>
 #include <xen/bitops.h>
 #include <xen/nospec.h>
+#include <xen/pfn.h>
 #include <xen/sections.h>
 
 /**
@@ -55,6 +56,44 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+#ifndef CONFIG_PDX_NONE
+
+#ifdef CONFIG_X86
+# include <asm/e820.h>
+# define MAX_PFN_RANGES E820MAX
+#elif defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
+# include <xen/bootinfo.h>
+# define MAX_PFN_RANGES NR_MEM_BANKS
+#endif
+
+#ifndef MAX_PFN_RANGES
+# error "Missing architecture maximum number of RAM ranges"
+#endif
+
+/* Generic PFN compression helpers. */
+static struct pfn_range {
+    unsigned long base_pfn, pages;
+} ranges[MAX_PFN_RANGES] __initdata;
+static unsigned int __initdata nr_ranges;
+
+void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
+{
+    if ( !size )
+        return;
+
+    if ( nr_ranges >= ARRAY_SIZE(ranges) )
+    {
+        ASSERT((nr_ranges + 1) > nr_ranges);
+        nr_ranges++;
+        return;
+    }
+
+    ranges[nr_ranges].base_pfn = PFN_DOWN(base);
+    ranges[nr_ranges++].pages = PFN_UP(base + size) - PFN_DOWN(base);
+}
+
+#endif /* !CONFIG_PDX_NONE */
+
 #ifdef CONFIG_PDX_MASK_COMPRESSION
 
 /*
@@ -115,20 +154,25 @@ static uint64_t fill_mask(uint64_t mask)
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
@@ -143,9 +187,45 @@ uint64_t pdx_region_mask(uint64_t base, uint64_t len)
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
+    unsigned long mask = pdx_init_mask(base) >> PAGE_SHIFT;
+
+    if ( nr_ranges > ARRAY_SIZE(ranges) )
+    {
+        printk(XENLOG_WARNING
+               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
+               nr_ranges, ARRAY_SIZE(ranges));
+        return;
+    }
+
+    for ( i = 0; i < nr_ranges; i++ )
+        mask |= ranges[i].base_pfn |
+                pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
 
     /*
      * We skip the first MAX_ORDER bits, as we never want to compress them.
@@ -184,6 +264,18 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
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
+
+    nr_ranges = 0;
+}
+
 #endif /* CONFIG_PDX_COMPRESSION */
 
 /*
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 8e373cac8b87..10153da98bf1 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -108,38 +108,6 @@ extern unsigned int pfn_pdx_hole_shift;
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
@@ -189,17 +157,6 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
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
@@ -220,17 +177,15 @@ static inline bool pdx_is_region_compressible(paddr_t base,
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
 
@@ -247,6 +202,28 @@ static inline void pfn_pdx_hole_setup(unsigned long mask)
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



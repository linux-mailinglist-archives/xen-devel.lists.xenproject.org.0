Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C194B10882
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055726.1424102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetlA-0002kM-Jd; Thu, 24 Jul 2025 11:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055726.1424102; Thu, 24 Jul 2025 11:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetlA-0002gO-D8; Thu, 24 Jul 2025 11:05:12 +0000
Received: by outflank-mailman (input) for mailman id 1055726;
 Thu, 24 Jul 2025 11:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetl9-0000v1-52
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:11 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10bb125a-687e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 13:05:10 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45629702e52so4067295e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b77078e537sm1582685f8f.12.2025.07.24.04.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:05:08 -0700 (PDT)
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
X-Inumbo-ID: 10bb125a-687e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355109; x=1753959909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpbmO3mRK8slUcG3TMeLuGAREyFitBGFQBxFIYHXj1k=;
        b=JGtxkI0e0iB8CW++vo63e4VvI8n4O3hyvhLKBhxtDGwaQXJhmhXpmMR4ULXTsy5l/m
         5cu/ZkFJ3J6pMqNJyOrEB+gitBb6dsl/JF92QoHY7DfFYZS7wMPLqJlwd8vflkf0wsYK
         UE/up7HMRoz5SrmzotBOC+u4eiUhLFr7jHvBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355109; x=1753959909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpbmO3mRK8slUcG3TMeLuGAREyFitBGFQBxFIYHXj1k=;
        b=Pipu/mBmuDG5ucr+PrnNy1utGllV+MT0KJIxtJ9T5UvtXaapB/KhoN5+bIiLgDIfKZ
         6tr4z/YcC+BrRyOQFbTBz7OV1cVd3lExjelQnlzwM0/xLBUYm12H1DZ0aWZ2EPCL6/6n
         q9at2H9tAEQ9ylo9EbCULoC7N2sf/OaK4kFfjsrdwceeW79SiE+panu75nhwDPR9OM81
         O864WfQxqD4P5NQOtoRCiZC8VWrNeraz6sqRDtP5lEANuKr3jdr4eMk51w+y2L1ctXc9
         vdzIS4DzqU4vwv4ODpVuUeteY+uOxLQIKwhC66Xfi7c8jvMGXSXnZOrbdmHARwaPiZKl
         UVcQ==
X-Gm-Message-State: AOJu0YwpdhklG+J+oi9tBgLiz1DakLC1YosbDDw3QBZc7j87pyhxMv6o
	H/XQK2w9IH6Xfsd0/qTdsbOmpS3XOagZuiHnqdn5Q1hKAcy5t3m4H2cv+sOygoBc/getLV2Ruaa
	V1GNP
X-Gm-Gg: ASbGncvvEVD3aQY08SQNJ0D7aJeLKR8SOTE66/GKrPiFTPMFSL+3p8IyhQ62qam48lh
	mI+u09Llu1HZX8vxaB8aS6hg4AJLM7ZYXI3EbAxsXny9OoQ4AljP15/JwpkE9jytS3tAW88Li97
	ne/gxRz7ZtEU8UoA4w9dq7Mi3Gwz9riyZeFkLB+OyueLNFDntp83vz4HdKXJA/BIfRXsaoLuHTM
	dbJclkPoYxqMfw3PdmYTciYAMB3xyw+lkoliRqck1qpcNdsJC89kHCENpNHWA2R2DGTOm6Nn/o4
	UhalEjigq9kXUTAQbVp0yB6l2wsUqXbJKx3DNr+FcIfOW6gKhbPS9o0r2PypOHWwnilz744sxRJ
	YCZn5q1r6YiIEmnMe2Z7KDaa7i3vxN32+hjJLu0n5ua4181dVE5ItD7CJwkS30DSXTvft5gbmZm
	gl
X-Google-Smtp-Source: AGHT+IE4u3udc4FlIO/FGtxM4E7OvA3KmJ96RZwnAduEwHhp1v7bm4GDz2HOBXPi3Q++3YYMaxftQA==
X-Received: by 2002:a05:600c:8b2b:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-4586e52be18mr21384985e9.26.1753355108735;
        Thu, 24 Jul 2025 04:05:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 7/8] pdx: introduce a new compression algorithm based on region offsets
Date: Thu, 24 Jul 2025 13:04:15 +0200
Message-ID: <20250724110416.2081-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the appearance of Intel Sierra Forest and Granite Rapids it's now
possible to get a production x86 host with the following memory map:

SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
SRAT: Node 0 PXM 0 [0000000100000000, 000000807fffffff]
SRAT: Node 1 PXM 1 [0000063e80000000, 000006be7fffffff]
SRAT: Node 2 PXM 2 [00000c7e80000000, 00000cfe7fffffff]
SRAT: Node 3 PXM 3 [000012be80000000, 0000133e7fffffff]

This is from a four socket Granite Rapids system, with each node having
512GB of memory.  The total amount of RAM on the system is 2TB, but without
enabling CONFIG_BIGMEM the last range is not accessible, as it's above the
16TB boundary covered by the frame table. Sierra Forest and Granite Rapids
are socket compatible, however Sierra Forest only supports 2 socket
configurations, while Granite Rapids can go up to 8 sockets.

Note that while the memory map is very sparse, it couldn't be compressed
using the current PDX_MASK compression algorithm, which relies on all
ranges having a shared zeroed region of bits that can be removed.

The memory map presented above has the property of all regions being
similarly spaced between each other, and all having also a similar size.
Use a lookup table to store the offsets to translate from/to PFN and PDX
spaces.  Such table is indexed based on the input PFN or PDX to translated.
The example PFN layout about would get compressed using the following:

PFN compression using PFN lookup table shift 29 and PDX region size 0x10000000
 range 0 [0000000000000, 0x0000807ffff] PFN IDX  0 : 0000000000000
 range 1 [0x00063e80000, 0x0006be7ffff] PFN IDX  3 : 0x00053e80000
 range 2 [0x000c7e80000, 0x000cfe7ffff] PFN IDX  6 : 0x000a7e80000
 range 3 [0x0012be80000, 0x00133e7ffff] PFN IDX  9 : 0x000fbe80000

Note how the tow ranges belonging to node 0 get merged into a single PDX
region by the compression algorithm.

The default size of lookup tables currently set in Kconfig is 64 entries,
and the example memory map consumes 10 entries.  Such memory map is from a
4 socket Granite Rapids host, which in theory supports up to 8 sockets
according to Intel documentation.  Assuming the layout of a 8 socket system
is similar to the 4 socket one, it would require 21 lookup table entries to
support it, way below the current default of 64 entries.

The valid range of lookup table size is currently restricted from 1 to 512
elements in Kconfig.

An extra array is used to keep track of the base PFN for each translated
range.  Non used slots are set to ~0UL, so that in mfn_valid() the mfn <
base check always fails, thus reporting the mfn as invalid.

Introduce __init_or_pdx_mask and use it on some shared functions between
PDX mask and offset compression, as otherwise some code becomes unreachable
after boot if PDX offset compression is used.  Mark the code as __init in
that case, so it's pruned after boot.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - s/PDX_OFFSET_TLB_ORDER/PDX_OFFSET_TBL_ORDER/.
 - Fix changelog mention of Sapphire Rapids.
 - Misc fixes in the test harness.
 - Use SWAP() macro.
 - Introduce an extra table to keep the bases of the valid ranges.

Changes since v1:
 - Use a lookup table with the offsets.
 - Split the adding of the test to a pre-patch.
 - Amend diagram to also show possible padding after compression.
---
 CHANGELOG.md               |   3 +
 tools/tests/pdx/.gitignore |   1 +
 tools/tests/pdx/Makefile   |   3 +-
 tools/tests/pdx/harness.h  |  14 ++
 tools/tests/pdx/test-pdx.c |   4 +
 xen/common/Kconfig         |  21 ++-
 xen/common/pdx.c           | 255 ++++++++++++++++++++++++++++++++++++-
 xen/include/xen/pdx.h      |  87 ++++++++++++-
 8 files changed, 382 insertions(+), 6 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe3f..f9ef893f4851 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      grant table or foreign memory.
 
 ### Added
+ - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
+   Granite Rapids having sparse memory maps.
+
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
diff --git a/tools/tests/pdx/.gitignore b/tools/tests/pdx/.gitignore
index a32c7db4de79..1202a531a7fd 100644
--- a/tools/tests/pdx/.gitignore
+++ b/tools/tests/pdx/.gitignore
@@ -1,2 +1,3 @@
 /pdx.h
 /test-pdx-mask
+/test-pdx-offset
diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
index b3734afde686..10b354f0cefd 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGETS := test-pdx-mask
+TARGETS := test-pdx-mask test-pdx-offset
 
 .PHONY: all
 all: $(TARGETS)
@@ -42,6 +42,7 @@ CFLAGS += $(APPEND_CFLAGS)
 CFLAGS += $(CFLAGS_xeninclude)
 
 test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
+test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
 
 test-pdx-%: test-pdx.c pdx.h
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
index 891b4de0bbb7..18935b283f71 100644
--- a/tools/tests/pdx/harness.h
+++ b/tools/tests/pdx/harness.h
@@ -44,8 +44,10 @@
 
 #define MAX_RANGES 16
 #define MAX_PFN_RANGES MAX_RANGES
+#define CONFIG_PDX_OFFSET_TBL_ORDER 6
 
 #define ASSERT assert
+#define ASSERT_UNREACHABLE() assert(0)
 
 #define CONFIG_DEBUG
 
@@ -66,6 +68,9 @@ static inline unsigned int find_next(
 #define find_next_zero_bit(a, s, o) find_next(a, s, o, false)
 #define find_next_bit(a, s, o)      find_next(a, s, o, true)
 
+#define flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
+#define ffsl(x) __builtin_ffsl(x)
+
 #define boolean_param(name, func)
 
 #define pdx_to_pfn pdx_to_pfn_xlate
@@ -75,6 +80,15 @@ static inline unsigned int find_next(
 
 typedef uint64_t paddr_t;
 
+#define SWAP(a, b) \
+   do { typeof(a) t_ = (a); (a) = (b); (b) = t_; } while ( 0 )
+
+#define sort(elem, nr, size, cmp, swp) ({                               \
+    /* Consume swp() so compiler doesn't complain it's unused. */       \
+    (void)swp;                                                          \
+    qsort(elem, nr, size, cmp);                                         \
+})
+
 #include "pdx.h"
 
 #endif
diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index 0798ccee359b..eefd54c76815 100644
--- a/tools/tests/pdx/test-pdx.c
+++ b/tools/tests/pdx/test-pdx.c
@@ -51,7 +51,11 @@ int main(int argc, char **argv)
                 { .start =  0xc7e80000UL, .end =  0xcfe80000UL },
                 { .start = 0x12be80000UL, .end = 0x133e80000UL },
             },
+#ifdef CONFIG_PDX_OFFSET_COMPRESSION
+            .compress = true,
+#else
             .compress = false,
+#endif
         },
         /* Simple hole. */
         {
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0014f9b3d6d7..1bfd1e49c8b9 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -59,7 +59,8 @@ config EVTCHN_FIFO
 
 choice
 	prompt "PDX (Page inDeX) compression"
-	default PDX_MASK_COMPRESSION if !X86 && !RISCV
+	default PDX_OFFSET_COMPRESSION if X86
+	default PDX_MASK_COMPRESSION if !RISCV
 	default PDX_NONE
 	help
 	  PDX compression is a technique designed to reduce the memory
@@ -78,12 +79,30 @@ config PDX_MASK_COMPRESSION
 	help
 	  Compression relying on all RAM addresses sharing a zeroed bit region.
 
+config PDX_OFFSET_COMPRESSION
+	bool "Offset compression"
+	help
+	  Compression relying on size and distance between RAM regions being
+	  compressible using an offset lookup table.
+
 config PDX_NONE
 	bool "None"
 	help
 	  No compression
 endchoice
 
+config PDX_OFFSET_TBL_ORDER
+	int "PDX offset compression lookup table order" if EXPERT
+	depends on PDX_OFFSET_COMPRESSION
+	default 6
+	range 0 9
+	help
+	  Order of the PFN to PDX and PDX to PFN translation lookup tables.
+	  Number of table entries is calculated as 2^N.
+
+	  Size of the tables can be adjusted from 1 entry (order 0) to 512
+	  entries (order 9).
+
 config ALTERNATIVE_CALL
 	bool
 
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index cfe2a3fd344b..34ce48170122 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -24,6 +24,7 @@
 #include <xen/param.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
+#include <xen/sort.h>
 
 /**
  * Maximum (non-inclusive) usable pdx. Must be
@@ -40,6 +41,12 @@ bool __mfn_valid(unsigned long mfn)
 
 #ifdef CONFIG_PDX_MASK_COMPRESSION
     invalid |= mfn & pfn_hole_mask;
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
+{
+    unsigned long base = pfn_bases[PFN_TBL_IDX(mfn)];
+
+    invalid |= mfn < base || mfn >= base + pdx_region_size;
+}
 #endif
 
     if ( unlikely(evaluate_nospec(invalid)) )
@@ -75,6 +82,13 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
 # error "Missing architecture maximum number of RAM ranges"
 #endif
 
+/* Some functions should be init when not using PDX mask compression. */
+#ifndef CONFIG_PDX_MASK_COMPRESSION
+# define __init_or_pdx_mask __init
+#else
+# define __init_or_pdx_mask
+#endif
+
 /* Generic PFN compression helpers. */
 static struct pfn_range {
     unsigned long base, size;
@@ -102,7 +116,7 @@ void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
 }
 
 /* Sets all bits from the most-significant 1-bit down to the LSB */
-static uint64_t fill_mask(uint64_t mask)
+static uint64_t __init_or_pdx_mask fill_mask(uint64_t mask)
 {
     while (mask & (mask + 1))
         mask |= mask + 1;
@@ -128,7 +142,7 @@ static uint64_t fill_mask(uint64_t mask)
  * @param len  Size in octets of the region
  * @return Mask of moving bits at the bottom of all the region addresses
  */
-static uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+static uint64_t __init_or_pdx_mask pdx_region_mask(uint64_t base, uint64_t len)
 {
     /*
      * We say a bit "moves" in a range if there exist 2 addresses in that
@@ -294,7 +308,242 @@ void __init pfn_pdx_compression_reset(void)
     nr_ranges = 0;
 }
 
-#endif /* CONFIG_PDX_COMPRESSION */
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
+
+unsigned int __ro_after_init pfn_index_shift;
+unsigned int __ro_after_init pdx_index_shift;
+
+unsigned long __ro_after_init pfn_pdx_lookup[CONFIG_PDX_NR_LOOKUP];
+unsigned long __ro_after_init pdx_pfn_lookup[CONFIG_PDX_NR_LOOKUP];
+unsigned long __ro_after_init pfn_bases[CONFIG_PDX_NR_LOOKUP];
+unsigned long __ro_after_init pdx_region_size = ~0UL;
+
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
+{
+    unsigned long pfn = PFN_DOWN(base);
+    unsigned long pfn_base = pfn_bases[PFN_TBL_IDX(pfn)];
+
+    return pfn >= pfn_base &&
+           pfn + npages <= pfn_base + pdx_region_size;
+}
+
+static int __init cf_check cmp_node(const void *a, const void *b)
+{
+    const struct pfn_range *l = a;
+    const struct pfn_range *r = b;
+
+    if ( l->base > r->base )
+        return 1;
+    if ( l->base < r->base )
+        return -1;
+
+    return 0;
+}
+
+static void __init cf_check swp_node(void *a, void *b, size_t size)
+{
+    SWAP(a, b);
+}
+
+static bool __init pfn_offset_sanitize_ranges(void)
+{
+    unsigned int i = 0;
+
+    if ( nr_ranges == 1 )
+    {
+        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
+               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));
+        return true;
+    }
+
+    while ( i + 1 < nr_ranges )
+    {
+        /*
+         * Ensure ranges [start, end] use the same offset table index.  Should
+         * be guaranteed by the logic that calculates the pfn shift.
+         */
+        if ( PFN_TBL_IDX(ranges[i].base) !=
+             PFN_TBL_IDX(ranges[i].base + ranges[i].size - 1) ||
+             PFN_TBL_IDX(ranges[i + 1].base) !=
+             PFN_TBL_IDX(ranges[i + 1].base + ranges[i + 1].size - 1) )
+        {
+            ASSERT_UNREACHABLE();
+            return false;
+        }
+
+        if ( PFN_TBL_IDX(ranges[i].base) != PFN_TBL_IDX(ranges[i + 1].base) )
+        {
+            i++;
+            continue;
+        }
+
+        /* Merge ranges with the same table index. */
+        ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
+                         ranges[i].base;
+        memmove(&ranges[i + 1], &ranges[i + 2],
+                (nr_ranges - (i + 2)) * sizeof(ranges[0]));
+        nr_ranges--;
+    }
+
+    return true;
+}
+
+bool __init pfn_pdx_compression_setup(paddr_t base)
+{
+    unsigned long mask = PFN_DOWN(pdx_init_mask(base)), idx_mask = 0;
+    unsigned long size = 0;
+    unsigned int i;
+
+    if ( !nr_ranges )
+    {
+        printk(XENLOG_DEBUG "PFN compression disabled%s\n",
+               pdx_compress ? ": no ranges provided" : "");
+        return false;
+    }
+
+    if ( nr_ranges > ARRAY_SIZE(ranges) )
+    {
+        printk(XENLOG_WARNING
+               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
+               nr_ranges, ARRAY_SIZE(ranges));
+        return false;
+    }
+
+    /* Sort ranges by start address. */
+    sort(ranges, nr_ranges, sizeof(*ranges), cmp_node, swp_node);
+
+    for ( i = 0; i < nr_ranges; i++ )
+    {
+        unsigned long start = ranges[i].base;
+
+        /*
+         * Align range base to MAX_ORDER.  This is required so the PDX offset
+         * for the bits below MAX_ORDER matches the MFN offset, and pages
+         * greater than the minimal order can be used to populate the
+         * directmap.
+         */
+        ranges[i].base = ranges[i].base & ~((1UL << MAX_ORDER) - 1);
+        ranges[i].size = start + ranges[i].size - ranges[i].base;
+
+        /*
+         * Only merge overlapped regions now, leave adjacent regions separated.
+         * They would be merged later if both use the same index into the
+         * lookup table.
+         */
+        if ( !i || ranges[i].base >= (ranges[i - 1].base + ranges[i - 1].size) )
+        {
+            /*
+             * We might parse the region at position 0 more than once, as for
+             * index 0 we don't attempt to merge to keep this simple.
+             */
+            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
+            continue;
+        }
+
+        ranges[i - 1].size = ranges[i].base + ranges[i].size -
+                             ranges[i - 1].base;
+
+        if ( i + 1 < nr_ranges )
+            memmove(&ranges[i], &ranges[i + 1],
+                    (nr_ranges - (i + 1)) * sizeof(ranges[0]));
+        else /* last range */
+            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
+        nr_ranges--;
+        i--;
+    }
+
+    /*
+     * Populate a mask with the non-equal bits of the different ranges, do this
+     * to calculate the maximum PFN shift to use as the lookup table index.
+     */
+    for ( i = 0; i < nr_ranges; i++ )
+        for ( unsigned int j = 0; j < nr_ranges; j++ )
+            idx_mask |= (ranges[i].base & ~mask) ^ (ranges[j].base & ~mask);
+
+    if ( !idx_mask )
+        /* Single region case. */
+        pfn_index_shift = flsl(mask);
+    else if ( flsl(idx_mask) - ffsl(idx_mask) < CONFIG_PDX_OFFSET_TBL_ORDER )
+        /* The changed mask fits in the table index width. */
+        pfn_index_shift = ffsl(idx_mask) - 1;
+    else
+        /* Changed mask is wider than array size, use most significant bits. */
+        pfn_index_shift = flsl(idx_mask) - CONFIG_PDX_OFFSET_TBL_ORDER;
+
+    /*
+     * Ensure correctness of the calculated values, plus merge ranges if they
+     * use the same lookup table index.
+     */
+    if ( !pfn_offset_sanitize_ranges() )
+    {
+        printk(XENLOG_DEBUG "PFN compression is invalid, disabling\n");
+        pfn_pdx_compression_reset();
+        return false;
+    }
+
+    /*
+     * Find the maximum PFN range size after having merged ranges with same
+     * index.  The rounded up region size will be the base for the PDX region
+     * size and shift.
+     */
+    for ( i = 0; i < nr_ranges; i++ )
+        size = max(size, ranges[i].size);
+
+    /* pdx_init_mask() already takes MAX_ORDER into account. */
+    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));
+    pdx_index_shift = flsl(mask);
+
+    /* Avoid compression if there's no gain. */
+    if ( (mask + 1) * (nr_ranges - 1) >= ranges[nr_ranges - 1].base )
+    {
+        printk(XENLOG_DEBUG
+               "PFN compression yields no space gain, disabling\n");
+        pfn_pdx_compression_reset();
+        return false;
+    }
+
+    /*
+     * Set all entries in the bases table to ~0 to force both mfn_valid() and
+     * pdx_is_region_compressible() to return false for non-handled pfns.
+     */
+    memset(pfn_bases, ~0, sizeof(pfn_bases));
+
+    pdx_region_size = mask + 1;
+
+    printk(XENLOG_INFO
+           "PFN compression using lookup table shift %u and region size %#lx\n",
+           pfn_index_shift, pdx_region_size);
+
+    for ( i = 0; i < nr_ranges; i++ )
+    {
+        unsigned int idx = PFN_TBL_IDX(ranges[i].base);
+
+        pfn_pdx_lookup[idx] = ranges[i].base - (mask + 1) * i;
+        pdx_pfn_lookup[i] = pfn_pdx_lookup[idx];
+        pfn_bases[idx] = ranges[i].base;
+
+        printk(XENLOG_DEBUG
+               " range %3u [%013lx, %013lx] PFN IDX %3u : %013lx\n",
+               i, ranges[i].base, ranges[i].base + ranges[i].size - 1,
+               idx,  pfn_pdx_lookup[idx]);
+    }
+
+    return true;
+}
+
+void __init pfn_pdx_compression_reset(void)
+{
+    memset(pfn_pdx_lookup, 0, sizeof(pfn_pdx_lookup));
+    memset(pdx_pfn_lookup, 0, sizeof(pfn_pdx_lookup));
+    memset(pfn_bases, 0, sizeof(pfn_bases));
+    pfn_index_shift = 0;
+    pdx_index_shift = 0;
+    pdx_region_size = ~0UL;
+
+    nr_ranges = 0;
+}
+
+#endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 91fc32370f21..57e47e6daa11 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -65,6 +65,46 @@
  * This scheme also holds for multiple regions, where HHHHHHH acts as
  * the region identifier and LLLLLL fully contains the span of every
  * region involved.
+ *
+ * ## PDX offset compression
+ *
+ * Alternative compression mechanism that relies on RAM ranges having a similar
+ * size and offset between them:
+ *
+ * PFN address space:
+ * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
+ * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
+ * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
+ * │<------>│          │
+ * │  size             │
+ * │<----------------->│
+ *         offset
+ *
+ * The compression reduces the holes between RAM regions:
+ *
+ * PDX address space:
+ * ┌────────┬───┬────────┬───┐   ┌─┬────────┐
+ * │ RAM 0  │   │ RAM 1  │   │...│ │ RAM N  │
+ * ├────────┴───┼────────┴───┘   └─┴────────┘
+ * │<---------->│
+ *   pdx region size
+ *
+ * The offsets to convert from PFN to PDX and from PDX to PFN are stored in a
+ * pair of lookup tables, and the index into those tables to find the offset
+ * for each PFN or PDX is obtained by shifting the to be translated address by
+ * a specific value calculated at boot:
+ *
+ * pdx = pfn - pfn_lookup_table[pfn >> pfn_shift]
+ * pfn = pdx + pdx_lookup_table[pdx >> pdx_shift]
+ *
+ * Note the indexes into the lookup tables are masked to avoid out of bounds
+ * accesses.
+ *
+ * This compression requires the PFN ranges to contain a non-equal most
+ * significant part that's smaller than the lookup table size, so that a valid
+ * shift value can be found to differentiate between PFN regions.  The setup
+ * algorithm might merge otherwise separate PFN ranges to use the same lookup
+ * table entry.
  */
 
 extern unsigned long max_pdx;
@@ -157,7 +197,52 @@ static inline paddr_t directmapoff_to_maddr_xlate(unsigned long offset)
             (offset & ma_va_bottom_mask));
 }
 
-#endif /* CONFIG_PDX_MASK_COMPRESSION */
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
+
+#include <xen/page-size.h>
+
+#define CONFIG_PDX_NR_LOOKUP (1UL << CONFIG_PDX_OFFSET_TBL_ORDER)
+#define PDX_TBL_MASK (CONFIG_PDX_NR_LOOKUP - 1)
+
+#define PFN_TBL_IDX(pfn) \
+    (((pfn) >> pfn_index_shift) & PDX_TBL_MASK)
+#define PDX_TBL_IDX(pdx) \
+    (((pdx) >> pdx_index_shift) & PDX_TBL_MASK)
+#define MADDR_TBL_IDX(ma) \
+    (((ma) >> (pfn_index_shift + PAGE_SHIFT)) & PDX_TBL_MASK)
+#define DMAPOFF_TBL_IDX(off) \
+    (((off) >> (pdx_index_shift + PAGE_SHIFT)) & PDX_TBL_MASK)
+
+extern unsigned int pfn_index_shift;
+extern unsigned int pdx_index_shift;
+
+extern unsigned long pfn_pdx_lookup[];
+extern unsigned long pdx_pfn_lookup[];
+extern unsigned long pfn_bases[];
+extern unsigned long pdx_region_size;
+
+static inline unsigned long pfn_to_pdx_xlate(unsigned long pfn)
+{
+    return pfn - pfn_pdx_lookup[PFN_TBL_IDX(pfn)];
+}
+
+static inline unsigned long pdx_to_pfn_xlate(unsigned long pdx)
+{
+    return pdx + pdx_pfn_lookup[PDX_TBL_IDX(pdx)];
+}
+
+static inline unsigned long maddr_to_directmapoff_xlate(paddr_t ma)
+{
+    return ma - ((paddr_t)pfn_pdx_lookup[MADDR_TBL_IDX(ma)] << PAGE_SHIFT);
+}
+
+static inline paddr_t directmapoff_to_maddr_xlate(unsigned long offset)
+{
+    return offset + ((paddr_t)pdx_pfn_lookup[DMAPOFF_TBL_IDX(offset)] <<
+                     PAGE_SHIFT);
+}
+
+#endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
 /*
  * Allow each architecture to define it's (possibly optimized) versions of the
-- 
2.49.0



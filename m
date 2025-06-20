Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F216EAE19B7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 13:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020852.1397049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZev-0007c8-N7; Fri, 20 Jun 2025 11:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020852.1397049; Fri, 20 Jun 2025 11:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSZev-0007XI-ER; Fri, 20 Jun 2025 11:11:49 +0000
Received: by outflank-mailman (input) for mailman id 1020852;
 Fri, 20 Jun 2025 11:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQmk=ZD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uSZet-0005XV-Ac
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 11:11:47 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59dcd9af-4dc7-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 13:11:45 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so16034065e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 04:11:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6d117bf84sm1799740f8f.52.2025.06.20.04.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 04:11:43 -0700 (PDT)
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
X-Inumbo-ID: 59dcd9af-4dc7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750417904; x=1751022704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EppsXevlN8t9Gr9z9XeGe/QocwyvsD0c3ipo1S2G3o=;
        b=v77PPkKLFkd0FhahMzY5fthx3M7oJbuzU/TQfe94GYFS4V0woo5yb8AmhHD11n0SzH
         bGi9yQDfv6uXSJfVDjXfkIcT1Oh/uZYFCwpUEpwOjy4RUCW8pYxHZqyXo/7s7mOpYebr
         HpeiIDpy/EZnXPhS4zVNqiBVUcqwxRTLuFp4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417904; x=1751022704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EppsXevlN8t9Gr9z9XeGe/QocwyvsD0c3ipo1S2G3o=;
        b=KhnyY+ehv8PckgFv1DWt+shU5oEzxiv3hvw0vkU98OtYlAa5WX8emx7NO28H/mc4Ei
         Nir3v9lKsLkgqRvwkGePzInVm36oZ0fbwToaM7JJT9i7WorPnkqMhM8vaP9om8O168HY
         LgABqOKamuuWQVZW6b926FZm9PAnd7v+CiBeqb14mbV8mHnPYoVoFLX5QkpAp2HjdkPs
         dz0ZZyEcBr3Qe6TnyPjl59yaP9kVj+sQk3uF75TdMIHQBtpVw0OTdBhoR4jJRXmamLhr
         uQARdGfCo4SOecGsvgwQiDU2P55mSKAW4hVrk9K9ojINW7JSFVEDT271Mvq6AeqsUuQj
         Yw1g==
X-Gm-Message-State: AOJu0YyaF1YzMZiYaMuvPWIDuxtfsJDQYDO4oWOenQklAfzYJSE2FcJJ
	z1TOXJP2T07Gr4cV6wUt6LwsOx7MgF2CfbXdN3uS9qBfLDGQLEzXrbqbGzHaCvFdJAHNC6duC+i
	HiU4F
X-Gm-Gg: ASbGncsuIUuy/IvmyxMJapMO+VtgU5wByEKnAQ8Prktt3PYM7Toa2QHRXlsRHZRqU5G
	ZlET22tSwO5Gh6xTGmVe77cq7la36T1agX3jejBb26Sf215wYJMnyq4jdvdMpF/ir4ijskPdo8j
	G3NrOWsNx/1K2IIZh0+TKzKUNdfLBc91AnwRu0aS1jJNCgQe5nWb5HPMX8FlmR8Dx6VGsjr/e42
	H0GloT4a0HK5GdJ3tKOUBl+EzVEqVwgAzIYgue/9ETfRyRZRG2dF5aoqsrOABmRgb4txhC6AkNf
	QufmwEi81byuQO2j/IuUgAixoENSSsw3AFADU0+VM4PWL7EZDvSWmiIuFFUi+GmJ9XKldWvAzek
	hr8qobRLZSjWC4vZ/0tXOqeR/g7N5Xg==
X-Google-Smtp-Source: AGHT+IHH4E8k77+piYjiOuRyGh86QQCIMgfRjfInHrK0vvRWK5fzMQEJ5BPi30ToGUQQYUL1Mv4DEg==
X-Received: by 2002:a05:6000:4203:b0:3a4:fea6:d49f with SMTP id ffacd0b85a97d-3a6d12eb49emr1750944f8f.49.1750417903822;
        Fri, 20 Jun 2025 04:11:43 -0700 (PDT)
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
Subject: [PATCH v2 8/8] pdx: introduce a new compression algorithm based on region offsets
Date: Fri, 20 Jun 2025 13:11:30 +0200
Message-ID: <20250620111130.29057-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620111130.29057-1-roger.pau@citrix.com>
References: <20250620111130.29057-1-roger.pau@citrix.com>
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

Unused lookup table entries are set to all ones (~0UL), so that we can
detect whether a pfn or pdx is valid just by checking whether its
translation is bi-directional.  The saturated offsets will prevent the
translation from being bidirectional if the lookup table entry is not
valid.

Introduce __init_or_pdx_mask and use it on some shared functions between
PDX mask and offset compression, as otherwise some code becomes unreachable
after boot if PDX offset compression is used.  Mark the code as __init in
that case, so it's pruned after boot.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use a lookup table with the offsets.
 - Split the adding of the test to a pre-patch.
 - Amend diagram to also show possible padding after compression.
---
 CHANGELOG.md               |   3 +
 tools/tests/pdx/.gitignore |   1 +
 tools/tests/pdx/Makefile   |   3 +-
 tools/tests/pdx/harness.h  |  10 ++
 tools/tests/pdx/test-pdx.c |   4 +
 xen/common/Kconfig         |  21 +++-
 xen/common/pdx.c           | 209 ++++++++++++++++++++++++++++++++++++-
 xen/include/xen/pdx.h      |  85 ++++++++++++++-
 8 files changed, 330 insertions(+), 6 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe3f..7023820b38c1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      grant table or foreign memory.
 
 ### Added
+ - Introduce new PDX compression algorithm to cope with Intel Sapphire and
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
index 99867b71c438..ba1724bb6616 100644
--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -1,7 +1,7 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-TARGETS := test-pdx-mask
+TARGETS := test-pdx-mask test-pdx-offset
 
 .PHONY: all
 all: $(TARGETS)
@@ -41,6 +41,7 @@ CFLAGS += $(APPEND_CFLAGS)
 CFLAGS += $(CFLAGS_xeninclude)
 
 test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
+test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION
 
 test-pdx-%: test-pdx.c pdx.h
 	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
index 64ec09f5e281..c58a6f27ad03 100644
--- a/tools/tests/pdx/harness.h
+++ b/tools/tests/pdx/harness.h
@@ -44,8 +44,10 @@
 
 #define MAX_RANGES 8
 #define MAX_PFN_RANGES MAX_RANGES
+#define CONFIG_PDX_OFFSET_TLB_ORDER 6
 
 #define ASSERT assert
+#define ASSERT_UNREACHABLE() assert(0);
 
 #define CONFIG_DEBUG
 
@@ -66,6 +68,8 @@ static inline unsigned int find_next(
 #define find_next_zero_bit(a, s, o) find_next(a, s, o, false)
 #define find_next_bit(a, s, o)      find_next(a, s, o, true)
 
+#define flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
+
 #define boolean_param(name, func)
 
 #define pdx_to_pfn pdx_to_pfn_xlate
@@ -75,6 +79,12 @@ static inline unsigned int find_next(
 
 typedef uint64_t paddr_t;
 
+#define sort(elem, nr, size, cmp, swp) {                                \
+    /* Consume swp() so compiler doesn't complain it's unused. */       \
+    (void)swp;                                                          \
+    qsort(elem, nr, size, cmp);                                         \
+}
+
 #include "pdx.h"
 
 #endif
diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
index b717cae00711..5041228a383c 100644
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
index de3e01d6320e..6d49ef535f0c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -54,7 +54,8 @@ config EVTCHN_FIFO
 
 choice
 	prompt "PDX (Page inDeX) compression"
-	default PDX_MASK_COMPRESSION if !X86 && !RISCV
+	default PDX_OFFSET_COMPRESSION if X86
+	default PDX_MASK_COMPRESSION if !RISCV
 	default PDX_NONE
 	help
 	  PDX compression is a technique designed to reduce the memory
@@ -73,12 +74,30 @@ config PDX_MASK_COMPRESSION
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
 
+config PDX_OFFSET_TLB_ORDER
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
index d5e469baffe2..ff3534122c72 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -24,6 +24,7 @@
 #include <xen/param.h>
 #include <xen/pfn.h>
 #include <xen/sections.h>
+#include <xen/sort.h>
 
 /**
  * Maximum (non-inclusive) usable pdx. Must be
@@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
 
 #ifdef CONFIG_PDX_MASK_COMPRESSION
     invalid |= mfn & pfn_hole_mask;
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
+    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));
 #endif
 
     if ( unlikely(evaluate_nospec(invalid)) )
@@ -75,6 +78,13 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
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
@@ -102,7 +112,7 @@ void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
 }
 
 /* Sets all bits from the most-significant 1-bit down to the LSB */
-static uint64_t fill_mask(uint64_t mask)
+static uint64_t __init_or_pdx_mask fill_mask(uint64_t mask)
 {
     while (mask & (mask + 1))
         mask |= mask + 1;
@@ -128,7 +138,7 @@ static uint64_t fill_mask(uint64_t mask)
  * @param len  Size in octets of the region
  * @return Mask of moving bits at the bottom of all the region addresses
  */
-static uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+static uint64_t __init_or_pdx_mask pdx_region_mask(uint64_t base, uint64_t len)
 {
     /*
      * We say a bit "moves" in a range if there exist 2 addresses in that
@@ -290,7 +300,200 @@ void __init pfn_pdx_compression_reset(void)
     nr_ranges = 0;
 }
 
-#endif /* CONFIG_PDX_COMPRESSION */
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
+
+unsigned long __ro_after_init pfn_pdx_lookup[CONFIG_PDX_NR_LOOKUP];
+unsigned int __ro_after_init pfn_index_shift;
+
+unsigned long __ro_after_init pdx_pfn_lookup[CONFIG_PDX_NR_LOOKUP];
+unsigned int __ro_after_init pdx_index_shift;
+
+bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
+{
+    unsigned long pfn = PFN_DOWN(base);
+
+    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);
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
+    struct pfn_range *l = a;
+    struct pfn_range *r = b;
+    struct pfn_range tmp = *l;
+
+    *l = *r;
+    *r = tmp;
+}
+
+static bool __init pfn_offset_sanitize_ranges(void)
+{
+    unsigned int i = 0;
+
+    if ( nr_ranges == 1 )
+    {
+        ASSERT(PFN_TBL_IDX_VALID(ranges[0].base));
+        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
+               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));
+        return true;
+    }
+
+    /* Sort nodes by start address. */
+    sort(ranges, nr_ranges, sizeof(struct pfn_range), cmp_node, swp_node);
+
+    /* Sanitize and merge ranges if possible. */
+    while ( i + 1 < nr_ranges )
+    {
+        /* No overlap between ranges. */
+        if ( ranges[i].base + ranges[i].size > ranges[i + 1].base )
+        {
+            printk(XENLOG_WARNING
+"Invalid ranges for PDX compression: [%#lx, %#lx] overlaps [%#lx, %#lx]\n",
+                   ranges[i].base, ranges[i].base + ranges[i].size - 1,
+                   ranges[i + 1].base,
+                   ranges[i + 1].base + ranges[i + 1].size - 1);
+            return false;
+        }
+
+        /* Ensure lookup indexes don't overflow table size. */
+        if ( !PFN_TBL_IDX_VALID(ranges[i].base) ||
+             !PFN_TBL_IDX_VALID(ranges[i].base + ranges[i].size - 1) ||
+             !PFN_TBL_IDX_VALID(ranges[i + 1].base) ||
+             !PFN_TBL_IDX_VALID(ranges[i + 1].base + ranges[i + 1].size - 1) )
+            return false;
+
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
+    unsigned long size = 0, mask = PFN_DOWN(pdx_init_mask(base));
+    unsigned int i;
+
+    if ( !nr_ranges )
+        return false;
+
+    if ( nr_ranges > ARRAY_SIZE(ranges) )
+    {
+        printk(XENLOG_WARNING
+               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
+               nr_ranges, ARRAY_SIZE(ranges));
+        return false;
+    }
+
+    for ( i = 0; i < nr_ranges; i++ )
+        mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
+
+    pfn_index_shift = flsl(mask);
+
+    /*
+     * Increase the shift as much as possible, removing bits that are equal in
+     * all regions, as this allows the usage of smaller indexes, and in turn
+     * smaller lookup tables.
+     */
+    for ( pfn_index_shift = flsl(mask); pfn_index_shift < sizeof(mask) * 8 - 1;
+          pfn_index_shift++ )
+    {
+        const unsigned long bit = ranges[0].base & (1UL << pfn_index_shift);
+
+        for ( i = 1; i < nr_ranges; i++ )
+            if ( bit != (ranges[i].base & (1UL << pfn_index_shift)) )
+                break;
+        if ( i != nr_ranges )
+            break;
+    }
+
+    /* Sort and sanitize ranges. */
+    if ( !pfn_offset_sanitize_ranges() )
+        return false;
+
+    /* Calculate PDX region size. */
+    for ( i = 0; i < nr_ranges; i++ )
+        size = max(size, ranges[i].size);
+
+    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));
+    pdx_index_shift = flsl(mask);
+
+    /* Avoid compression if there's no gain. */
+    if ( (mask + 1) * (nr_ranges - 1) >= ranges[nr_ranges - 1].base )
+        return false;
+
+    /* Poison all lookup table entries ahead of setting them. */
+    memset(pfn_pdx_lookup, ~0, sizeof(pfn_pdx_lookup));
+    memset(pdx_pfn_lookup, ~0, sizeof(pfn_pdx_lookup));
+
+    for ( i = 0; i < nr_ranges; i++ )
+    {
+        unsigned int idx = PFN_TBL_IDX(ranges[i].base);
+
+        pfn_pdx_lookup[idx] = ranges[i].base - (mask + 1) * i;
+        pdx_pfn_lookup[i] = pfn_pdx_lookup[idx];
+    }
+
+    printk(XENLOG_INFO
+           "PFN compression using PFN lookup table shift %u and PDX region size %#lx\n",
+           pfn_index_shift, mask + 1);
+
+    for ( i = 0; i < nr_ranges; i++ )
+        printk(XENLOG_DEBUG
+               " range %u [%#013lx, %#013lx] PFN IDX %3lu : %#013lx\n",
+               i, ranges[i].base, ranges[i].base + ranges[i].size - 1,
+               PFN_TBL_IDX(ranges[i].base),
+               pfn_pdx_lookup[PFN_TBL_IDX(ranges[i].base)]);
+
+    return true;
+}
+
+void __init pfn_pdx_compression_reset(void)
+{
+    memset(pfn_pdx_lookup, 0, sizeof(pfn_pdx_lookup));
+    memset(pdx_pfn_lookup, 0, sizeof(pfn_pdx_lookup));
+    pfn_index_shift = 0;
+    pdx_index_shift = 0;
+
+    nr_ranges = 0;
+}
+
+#endif /* CONFIG_PDX_OFFSET_COMPRESSION */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 91fc32370f21..450e07de2764 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -65,6 +65,43 @@
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
+ * This compression requires the PFN ranges to contain a non-equal most
+ * significant part that's smaller than the lookup table size, so that a valid
+ * shift value can be found to differentiate between PFN regions.  The setup
+ * algorithm might merge otherwise separate PFN ranges to use the same lookup
+ * table entry.
  */
 
 extern unsigned long max_pdx;
@@ -157,7 +194,53 @@ static inline paddr_t directmapoff_to_maddr_xlate(unsigned long offset)
             (offset & ma_va_bottom_mask));
 }
 
-#endif /* CONFIG_PDX_MASK_COMPRESSION */
+#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
+
+#include <xen/page-size.h>
+
+#define CONFIG_PDX_NR_LOOKUP (1UL << CONFIG_PDX_OFFSET_TLB_ORDER)
+#define PDX_TBL_MASK (CONFIG_PDX_NR_LOOKUP - 1)
+
+#define PFN_TBL_IDX_VALID(pfn) \
+    !(((pfn) >> pfn_index_shift) & ~PDX_TBL_MASK)
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
+extern unsigned long pfn_pdx_lookup[];
+extern unsigned int pfn_index_shift;
+
+extern unsigned long pdx_pfn_lookup[];
+extern unsigned int pdx_index_shift;
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



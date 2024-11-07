Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B539C0399
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:15:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831665.1247004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90TW-0002vD-2t; Thu, 07 Nov 2024 11:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831665.1247004; Thu, 07 Nov 2024 11:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90TV-0002t7-WF; Thu, 07 Nov 2024 11:14:54 +0000
Received: by outflank-mailman (input) for mailman id 831665;
 Thu, 07 Nov 2024 11:14:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h3Hw=SC=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1t90TT-0002sz-Pd
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:14:51 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2abefc-9cf9-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 12:14:47 +0100 (CET)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7b153047b29so54235685a.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:14:47 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32ac57c9bsm52636585a.54.2024.11.07.03.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 03:14:45 -0800 (PST)
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
X-Inumbo-ID: 7f2abefc-9cf9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjo3MmQiLCJoZWxvIjoibWFpbC1xazEteDcyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdmMmFiZWZjLTljZjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTc4MDg3LjMyNjA1OSwic2VuZGVyIjoiYmVybmhhcmQua2FpbmRsQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730978086; x=1731582886; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAL0jV1wYbpF9brwNg25ULVfF9qMZKxgs/nv5clUd7I=;
        b=e+yA22zZ99RudOBD1oP7MejjbYYhpNrHLwecRZTb7mHvghDToAfjrHGYt4xI8YI36a
         bPlEcf4k0GbZL1bP02jzp30kQTX85989DF1+fRFJglg7V4MPYa//jVngDWhUeB/WdMzR
         ECZLKJ0z3ufZC4PHJrliPjZxa4+IM2T08cMDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978086; x=1731582886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAL0jV1wYbpF9brwNg25ULVfF9qMZKxgs/nv5clUd7I=;
        b=a+cERawTQ8xuGxsJxaCx8oqcYJvC36tZ2MAXTxxRKYETlj6iXrNOmSL+yWx7UR8iWW
         GPUwPnOLGmZ8rL3xIgR1j9D/a0DcoC/y+tVDDsQj04tmYEfUHxKS8PJB559TYmgDdKpW
         2Tf1isDOujI42ENDUYIgALIKglvTN530haAX7Q0Bwjt8D/MDo1zljbn/00bc3zcoEzZs
         SKzGbmyJL5rKjtTW/iwgUOmSqGS65rVP2bt9nvwr2NlpzIZsti9qWS1qbV4vhfk+ReTM
         N9c+Sc2sdU1zz2WY0cHODxlcckh2Fhqlv4/D7MrSn3DYSl3PjUIZEI7GpH4syWOFYPVC
         zwng==
X-Gm-Message-State: AOJu0Yx7vkE8IHzPzEHh9Pgj/RLG8u9sk0csks0cbcikgB6QG+3sw5rW
	ufs7EpSVdM2xpM59qoiX5gGRxva+h0hxPKUtg1O/KCiYh6FPL9Iza+vgVs/telFAieAyql4XsAF
	25rZJEQ==
X-Google-Smtp-Source: AGHT+IGjlG1jy+C+giPHUEmtKnVUP4kdWakVDbvxMQ8lcpxjDrkelab0eNoKMsMo/FxYUcV6QTTKhA==
X-Received: by 2002:a05:620a:24cb:b0:7ac:b1b1:e730 with SMTP id af79cd13be357-7b193f5d485mr5899173085a.61.1730978085881;
        Thu, 07 Nov 2024 03:14:45 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] NUMA: Introduce NODE_DATA->node_present_pages(RAM pages)
Date: Thu,  7 Nov 2024 12:14:40 +0100
Message-ID: <20241107111440.443547-1-bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen tracks the total span of physical memory space of each NUMA node,
but the PFN span includes large MMIO holes in e.g. the first NUMA node.
Thus, the span is not the same as the amount of usable RAM of a node.

Xen does not need it, but NUMA node memory amount can be helpful for
management tools and HW information tools like hwloc/lstopo with its
Xen backend for Dom0: https://github.com/xenserver-next/hwloc/

Introduce node_present_pages to node_data[]:
On boot, set the count of usable PFNs and update it on memory_add().

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
Changes in v5:

- Checked node_present_pages on NUMA HW.
- Code and comments are exactly as suggested & affirmed in v4 review.
- Comment adjustments on commit are ok, but keep the code as-is: e.g.:
  'err' needs to be defined outside the loop to be in scope for check.
---
 xen/arch/x86/numa.c      | 13 +++++++++++++
 xen/arch/x86/x86_64/mm.c |  3 +++
 xen/common/numa.c        | 37 ++++++++++++++++++++++++++++++++-----
 xen/include/xen/numa.h   | 17 +++++++++++++++++
 4 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 4b0b297c7e..27cee68a4d 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -100,6 +100,19 @@ unsigned int __init arch_get_dma_bitsize(void)
                  + PAGE_SHIFT, 32);
 }
 
+/**
+ * @brief Retrieves the RAM range for a given index from the e820 memory map.
+ *
+ * This function fetches the starting and ending addresses of a RAM range
+ * specified by the given index idx from the e820 memory map.
+ *
+ * @param idx The index of the RAM range in the e820 memory map to retrieve.
+ * @param start Pointer to store the starting address of the RAM range.
+ * @param end Pointer to store the exclusive ending address of the RAM range.
+ *
+ * @return 0 on success, -ENOENT if the index is out of bounds,
+ *         or -ENODATA if the memory map at index idx is not of type E820_RAM.
+ */
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 {
     if ( idx >= e820.nr_map )
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index b2a280fba3..66b9bed057 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1334,6 +1334,9 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     share_hotadd_m2p_table(&info);
     transfer_pages_to_heap(&info);
 
+    /* Update the node's present pages (like the total_pages of the system) */
+    NODE_DATA(node)->node_present_pages += epfn - spfn;
+
     return 0;
 
 destroy_m2p:
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 209c546a3b..38369e487b 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -4,6 +4,7 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */
 
+#include "xen/pfn.h"
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/mm.h>
@@ -499,15 +500,41 @@ int __init compute_hash_shift(const struct node *nodes,
     return shift;
 }
 
-/* Initialize NODE_DATA given nodeid and start/end */
+/**
+ * @brief Initialize a NUMA node's node_data structure at boot.
+ *
+ * It is given the NUMA node's index in the node_data array as well
+ * as the start and exclusive end address of the node's memory span
+ * as arguments and initializes the node_data entry with this information.
+ *
+ * It then initializes the total number of usable memory pages within
+ * the NUMA node's memory span using the arch_get_ram_range() function.
+ *
+ * @param nodeid The index into the node_data array for the node.
+ * @param start The starting physical address of the node's memory range.
+ * @param end The exclusive ending physical address of the node's memory range.
+ */
 void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
 {
     unsigned long start_pfn = paddr_to_pfn(start);
     unsigned long end_pfn = paddr_to_pfn(end);
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
+    struct node_data *numa_node = NODE_DATA(nodeid);
+    unsigned int idx = 0;
+    int err;
+
+    numa_node->node_start_pfn = start_pfn;
+    numa_node->node_spanned_pages = end_pfn - start_pfn;
+    numa_node->node_present_pages = 0;
+
+    /* Calculate the number of present RAM pages within the node */
+    do {
+        paddr_t ram_start, ram_end;
+
+        err = arch_get_ram_range(idx++, &ram_start, &ram_end);
+        if ( !err && ram_start < end && ram_end > start )
+            numa_node->node_present_pages += PFN_DOWN(min(ram_end, end)) -
+                                             PFN_UP(max(ram_start, start));
+    } while ( err != -ENOENT );
     node_set_online(nodeid);
 }
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index fd1511a6fb..f6c1f27ca1 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -68,9 +68,24 @@ extern unsigned int memnode_shift;
 extern unsigned long memnodemapsize;
 extern nodeid_t *memnodemap;
 
+/* The memory information of NUMA nodes in the node_data[] array */
 struct node_data {
+    /* The starting page frame number (lowest pfn) of the NUMA node */
     unsigned long node_start_pfn;
+
+    /*
+     * The number of pages spanned by the NUMA node, including memory holes.
+     * Used for the pyhsical memory range when scrubbing unallocated memory.
+     */
     unsigned long node_spanned_pages;
+
+    /*
+     * Number of usable memory pages that are available in this NUMA node.
+     * The sum of these values from all NUMA nodes reflects total_pages.
+     * The Xen Hypervisor does not use this field internally, but it is useful
+     * for reporting the memory information of NUMA nodes to management tools.
+     */
+    unsigned long node_present_pages;
 };
 
 extern struct node_data node_data[];
@@ -91,6 +106,7 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
 #define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_present_pages(nid) (NODE_DATA(nid)->node_present_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
@@ -123,6 +139,7 @@ extern void numa_set_processor_nodes_parsed(nodeid_t node);
 extern mfn_t first_valid_mfn;
 
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_present_pages(nid) total_pages
 #define node_start_pfn(nid) mfn_x(first_valid_mfn)
 #define __node_distance(a, b) 20
 
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97E09B1EF2
	for <lists+xen-devel@lfdr.de>; Sun, 27 Oct 2024 15:44:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826247.1240458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t54UE-0006uF-Fv; Sun, 27 Oct 2024 14:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826247.1240458; Sun, 27 Oct 2024 14:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t54UE-0006r8-DF; Sun, 27 Oct 2024 14:43:22 +0000
Received: by outflank-mailman (input) for mailman id 826247;
 Sun, 27 Oct 2024 14:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQun=RX=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1t54UD-0006r2-NA
 for xen-devel@lists.xenproject.org; Sun, 27 Oct 2024 14:43:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb5764ae-9471-11ef-99a3-01e77a169b0f;
 Sun, 27 Oct 2024 15:43:19 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso36227865e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 27 Oct 2024 07:43:13 -0700 (PDT)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b5431c9sm108116165e9.0.2024.10.27.07.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 07:43:12 -0700 (PDT)
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
X-Inumbo-ID: cb5764ae-9471-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730040193; x=1730644993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBwj5xstmqnL4Yh+OFF6P5n824j5T5U5vzKlcLCJ0/Y=;
        b=eThlC2YSmu1Wo/XNr8JXC1PLTbPiuFywXYEfJfIa6KWTrGqYP7XlGkBqgn2iDwqmr6
         DJnNAVlwTe+egvvyiw8SyEj+cocPIj0zhgXRijCH+xml1dS13eDquDKQgeDHx6il3jKY
         y/Nto+tsxWiHX+VB9zvgCiGMbnLTu+53L1BFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040193; x=1730644993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBwj5xstmqnL4Yh+OFF6P5n824j5T5U5vzKlcLCJ0/Y=;
        b=UondKfNl+ZXL12DN34+4f2qalR8d8rAPHou6FdtCVIOC4yqYDYywhf7wF4facsM/Lz
         xtIi4rPmpnJi8iIlhChgG7ptyv2TuM04YrsyoGNMayF/dAvqIjCExTFZBv5DjokA2SMR
         oFmONtr/RdFHbqtOV/JtJh1gB86AL14E0mZ3GhUegDBRzNIRWGm7ZZG1haEQIVybt/wo
         9aFF47wE/UnKLTDD1HjaARAV5jUVqfCd1gBMUO3KisvtByh58e04AB4D/IpB5TEh+Z05
         UIsQicmPTB5soIUJNWi4cPPKiRqaoQkwNbXltNrR9VhRh9KRkrdlVapGZP8eXFYvOPlJ
         HQeQ==
X-Gm-Message-State: AOJu0Ywtm8A7gt22QOaDUg2KB1wzVtKrj4qF9l1kFb87bRcFRVJDQeh8
	JEjUBAehX/ZLB7qD3Vyep0w5oPUjmHkXhF8W0+/EcTmSLwW1kKBxCNLhLUyqtO5Qzqy7qF/G1hw
	hq+pbVA==
X-Google-Smtp-Source: AGHT+IGU6l2W2xdUSbROHTAgaSmOT3ivWTcmUhACjE5pG7FUcM+jjlL5ZoW4PxbDGZgKCQNXsEuq5w==
X-Received: by 2002:a05:600c:5118:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-4319ac6e507mr36461755e9.6.1730040192734;
        Sun, 27 Oct 2024 07:43:12 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
X-Google-Original-From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
To: xen-devel@lists.xenproject.org,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4] NUMA: Introduce NODE_DATA->node_present_pages(RAM pages)
Date: Sun, 27 Oct 2024 15:43:05 +0100
Message-ID: <20241027144305.1839348-1-bernhardkaindl7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bernhard Kaindl <bernhard.kaindl@cloud.com>

At the moment, Xen keeps track of the spans of PFNs of the NUMA nodes.
But the PFN span sometimes includes large MMIO holes, so these values
might not be an exact representation of the total usable RAM of nodes.

Xen does not need it, but the size of the NUMA node's memory can be
helpful for management tools and HW information tools like hwloc/lstopo
with its Xen backend for Dom0: https://github.com/xenserver-next/hwloc/

First, introduce NODE_DATA(nodeid)->node_present_pages to node_data[],
determine the sum of usable PFNs at boot and update them on memory_add().

(The Linux kernel handles NODE_DATA->node_present_pages likewise)

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
Changes in v3:
- Use PFN_UP/DOWN, refactored further to simplify the code while leaving
  compiler-level optimisations to the compiler's optimisation passes.
Changes in v4:
- Refactored code and doxygen documentation according to the review.
---
 xen/arch/x86/numa.c      | 13 +++++++++++++
 xen/arch/x86/x86_64/mm.c |  3 +++
 xen/common/numa.c        | 36 +++++++++++++++++++++++++++++++++---
 xen/include/xen/numa.h   | 21 +++++++++++++++++++++
 4 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 4b0b297c7e..3c0574f773 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -100,6 +100,19 @@ unsigned int __init arch_get_dma_bitsize(void)
                  + PAGE_SHIFT, 32);
 }
 
+/**
+ * @brief Retrieves the RAM range for a given index from the e820 memory map.
+ *
+ * This function fetches the start and end address (exclusive) of a RAM range
+ * specified by the given index idx from the e820 memory map.
+ *
+ * @param idx The index of the RAM range in the e820 memory map to retrieve.
+ * @param start Pointer to store the start address of the RAM range.
+ * @param end Pointer to store the end address of the RAM range.
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
index 209c546a3b..9a8b805dd7 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -4,6 +4,7 @@
  * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
  */
 
+#include "xen/pfn.h"
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/mm.h>
@@ -499,15 +500,44 @@ int __init compute_hash_shift(const struct node *nodes,
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
+    struct node_data *numa_node = NODE_DATA(nodeid);
+    paddr_t start_ram, end_ram;
+    unsigned int idx = 0;
+    unsigned long *pages = &numa_node->node_present_pages;
 
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+    numa_node->node_start_pfn = start_pfn;
+    numa_node->node_spanned_pages = end_pfn - start_pfn;
+
+    /* Calculate the number of present RAM pages within the node: */
+    *pages = 0;
+    do {
+        int err = arch_get_ram_range(idx++, &start_ram, &end_ram);
+
+        if (err == -ENOENT)
+            break;
+        if ( err || start_ram >= end || end_ram <= start )
+            continue;  /* range is outside of the node, or not usable RAM */
 
+        *pages += PFN_DOWN(min(end_ram, end)) - PFN_UP(max(start_ram, start));
+    } while (1);
     node_set_online(nodeid);
 }
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index fd1511a6fb..6e82dfd2a8 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -68,9 +68,28 @@ extern unsigned int memnode_shift;
 extern unsigned long memnodemapsize;
 extern nodeid_t *memnodemap;
 
+/**
+ * @struct numa_node
+ * @brief Represents the memory information of a NUMA node.
+ *
+ * @var numa_node::node_start_pfn
+ * The starting page frame number (lowest pfn) of the NUMA node.
+ *
+ * @var numa_node::node_spanned_pages
+ * The number of pages spanned by the NUMA node, including memory holes.
+ * Used to get the end of the node memory when scrubbing unallocated memory.
+ *
+ * @var numa_node::node_present_pages
+ * The total number of usable memory pages that are available in this NUMA node.
+ * The value of total_pages would be the sum of all node's node_present_pages.
+ *
+ * The Xen Hypervisor does not use this field internally, but it is useful
+ * for reporting the memory information of NUMA nodes to management tools.
+ */
 struct node_data {
     unsigned long node_start_pfn;
     unsigned long node_spanned_pages;
+    unsigned long node_present_pages;
 };
 
 extern struct node_data node_data[];
@@ -91,6 +110,7 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
 #define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
+#define node_present_pages(nid) (NODE_DATA(nid)->node_present_pages)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
                                  NODE_DATA(nid)->node_spanned_pages)
 
@@ -123,6 +143,7 @@ extern void numa_set_processor_nodes_parsed(nodeid_t node);
 extern mfn_t first_valid_mfn;
 
 #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_present_pages(nid) total_pages
 #define node_start_pfn(nid) mfn_x(first_valid_mfn)
 #define __node_distance(a, b) 20
 
-- 
2.43.0



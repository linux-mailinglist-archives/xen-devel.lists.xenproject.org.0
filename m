Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB85986425
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804355.1215310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUIL-0006Sb-M2; Wed, 25 Sep 2024 15:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804355.1215310; Wed, 25 Sep 2024 15:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUIL-0006Qq-Ix; Wed, 25 Sep 2024 15:51:13 +0000
Received: by outflank-mailman (input) for mailman id 804355;
 Wed, 25 Sep 2024 15:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgw0=QX=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1stUIK-0006PO-Sr
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:51:12 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbebdfc0-7b55-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:51:10 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso1659366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:51:10 -0700 (PDT)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5485asm223739166b.88.2024.09.25.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 08:51:08 -0700 (PDT)
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
X-Inumbo-ID: fbebdfc0-7b55-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727279469; x=1727884269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Tr2UcWiuyslUa0UHrNbt982S1/IvXvPFkiphxGh6Ps=;
        b=BzgCxh2nWR1qvnNt9F2xMPntWKSUQLqASLtURFcH1qbi4ZS8R0iNHrSSuCjRkc+sns
         wSRKQqYPr57aiRapV6/hzfwB0KKZjKd+OoH/7OpH7NJFgUV/9NKxxovkSI5NMtSKsOW1
         r/f5Sz599zHXoFGw5o6G24T28aX/VXJgROfW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279469; x=1727884269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Tr2UcWiuyslUa0UHrNbt982S1/IvXvPFkiphxGh6Ps=;
        b=SDhLCYgLmprD1rUr9QM+SKwlxwXVQHambcoi4h+JVx0Sg9vAR6We/yB160yhRoYb+x
         6JS1qUKWWtzfBAp6go2oOou0Ljx0zM+9gBB5kxtCwImo+wTwh5wIYULiBzmxeMUjZNxv
         sy9HqWsgwO1vKCUDK1CFrHUkVbGbieHMnYr5iSl/23dxKkzmRU6KOaKDbtA0BvBqHxtF
         skI+xxdIvL+anlMyf6Y3+BTOLMzszc/fKdti0w1+lazow2AzhKCnHhWWv1Drm00iTsOi
         jB76EA/ww/RAauSFTWM69uauYnDXxSSWiVKAsheeaQC0UR+TyIyptgfEYDNGxOGZ0AHK
         bzJA==
X-Gm-Message-State: AOJu0YzIDxAZdW6WrHe1G6yiLyXf7pat52DWLOw8xlTAaCdSABW5QSS3
	3Hl3xHNaWBPc0gPsuQo+CNgAkQgDhNq0D+KnbIfNvHwa15PkhojKSQ87XT042xeGs43I4sJNBd1
	Ur632NA==
X-Google-Smtp-Source: AGHT+IFWfuokuuuWNzHFGVcwKKa2v70f+C98dZD2VjA/mXsI/lQDsPlXpq0Nc1HcxZuOAqrJdGdhFQ==
X-Received: by 2002:a17:907:9602:b0:a90:3498:93b2 with SMTP id a640c23a62f3a-a93a033cb23mr362455066b.1.1727279469288;
        Wed, 25 Sep 2024 08:51:09 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Add/Improve function documentation for NUMA code
Date: Wed, 25 Sep 2024 17:50:45 +0200
Message-ID: <88fecfc05c551b0329b555ef570feeb718a8c021.1727279356.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 xen/arch/x86/srat.c      | 45 ++++++++++++++++++++++++++++++++++++++--
 xen/arch/x86/x86_64/mm.c | 22 ++++++++++++++++++--
 xen/common/numa.c        | 27 ++++++++++++++++++++++--
 3 files changed, 88 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 688f410287..a7f6b79324 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -51,6 +51,22 @@ nodeid_t pxm_to_node(unsigned pxm)
 	return NUMA_NO_NODE;
 }
 
+/**
+ * @brief Set up a NUMA node based on the given proximity domain (pxm).
+ *
+ * If the proximity domain is already found in the pxm2node array, this function
+ * returns the node ID associated with the given proximity domain.
+ *
+ * Otherwise, it assigns a new node ID to the proximity domain and returns it.
+ * If the maximum number of nodes has been reached, it returns an error code.
+ *
+ * @param pxm The proximity domain to set up or to find in the pxm2node array.
+ * @return The node ID associated with the given proximity domain,
+ *         or NUMA_NO_NODE if the setup fails
+ *         or the maximum number of nodes has been reached.
+ *
+ * @note Uses a static variable to assign the next NUMA node ID to be assigned.
+ */
 nodeid_t setup_node(unsigned pxm)
 {
 	nodeid_t node;
@@ -212,7 +228,19 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 		       pxm, pa->apic_id, node);
 }
 
-/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
+/**
+ * @brief Initialize memory affinity for an SRAT memory affinity structure.
+ * @param ma Pointer to the ACPI SRAT memory affinity structure to be parsed.
+ *
+ * Callback for parsing of the Proximity Domain <-> Memory Area mappings
+ * provided by the ACPI SRAT(System Resource Affinity Table)
+ *
+ * This function is called during the initialization phase and is responsible
+ * for setting up memory affinity information for NUMA nodes
+ * based on the provided ACPI SRAT entries.
+ *
+ * If valid, it updates the memory block information for the specified node.
+ */
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
@@ -314,16 +342,29 @@ void __init srat_parse_regions(paddr_t addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
+/**
+ * @brief Find the proximity domain of a given NUMA node ID
+ *
+ * @param node The NUMA node ID to look up.
+ * @return The proximity domain of the given NUMA node ID, or 0 if not found
+ *
+ * This funciton uses the pxm2node array to find the proximity domain:
+ * The pxm2node array maps proximity domains to NUMA nodes and is indexed by the
+ * proximity domain. Each entry contains the proximity domain and the NUMA node.
+ */
 unsigned int numa_node_to_arch_nid(nodeid_t n)
 {
 	unsigned int i;
 
+	/* If the NUMA node is found using the index, return the pxm directly: */
 	if ((n < ARRAY_SIZE(pxm2node)) && (pxm2node[n].node == n))
 		return pxm2node[n].pxm;
+
+	/* Else, scan over the pxm2node array to find the architecture node ID: */
 	for (i = 0; i < ARRAY_SIZE(pxm2node); i++)
 		if (pxm2node[i].node == n)
 			return pxm2node[i].pxm;
-	return 0;
+	return 0;  /* If the node ID is not found, return 0. */
 }
 
 u8 __node_distance(nodeid_t a, nodeid_t b)
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 0d8e602529..e8571000b2 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1218,8 +1218,26 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
 }
 
 /*
- * A bit paranoid for memory allocation failure issue since
- * it may be reason for memory add
+ * @brief Add a contiguous range of pages to the Xen hypervisor heap
+ *
+ * Update the machine-to-phys (m2p) and frame tables, the max_page, max_pdx and
+ * total_pages values, and set the page table entries for the new memory range.
+ *
+ * Also update the node_start_pfn and node_spanned_pages fields in the node_data
+ * structure for the NUMA node that the memory range belongs to.
+ *
+ * If the NUMA node is offline, set the node's online flag.
+ *
+ * If the hardware domain uses an IOMMU and the IOMMU pagetable
+ * is not using the HW domain's P2M table or is not kept in sync,
+ * also update the IOMMU maps for the newly added memory.
+ *
+ * When memory allocations or adding the memory fails, revert any changes made.
+ *
+ * @param spfn The starting page frame number of the range.
+ * @param epfn The ending page frame number of the range.
+ * @param pxm The proximity domain of the range, which represents the NUMA node.
+ * @return 0 on success, or a negative error code on failure.
  */
 int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
 {
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ce3991929c..5db0a6745e 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -140,6 +140,18 @@ bool __init numa_memblks_available(void)
 }
 
 /*
+ * @brief Update the memory blocks of a NUMA node.
+ *
+ * Check for overlaps and interleaves with existing memory blocks for the node.
+ * If none, update the node's memory range and maintain the sorting of blocks.
+ *
+ * @param node The node ID for which memory blocks are being updated.
+ * @param arch_nid The architecture node ID associated with the memory.
+ * @param start The starting physical address of the memory block.
+ * @param size The size of the memory block.
+ * @param hotplug Indicates if the memory is being hotplugged.
+ * @return true if the memory block was successfully added, false otherwise.
+ *
  * This function will be called by NUMA memory affinity initialization to
  * update NUMA node's memory range. In this function, we assume all memory
  * regions belonging to a single node are in one chunk. Holes (or MMIO
@@ -264,8 +276,17 @@ bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
 }
 
 /*
+ * @brief Check if all RAM ranges are covered by NUMA nodes.
+ *
  * Sanity check to catch more bad SRATs (they are amazingly common).
  * Make sure the PXMs cover all memory.
+ *
+ * This function iterates through the memory map and checks if each RAM range
+ * is covered by any of the NUMA nodes. If a RAM range is not covered by any
+ * node, it logs an error and returns false. If all RAM ranges are covered,
+ * it returns true.
+ *
+ * @return true if all RAM ranges are covered by NUMA nodes, false otherwise.
  */
 static bool __init nodes_cover_memory(void)
 {
@@ -291,18 +312,20 @@ static bool __init nodes_cover_memory(void)
 
         do {
             found = false;
+            /* Loop over the NUMA nodes and if check they cover this mapping */
             for_each_node_mask ( j, memory_nodes_parsed )
+                /* Check if this node's spanned pages are inside this mapping */
                 if ( start < numa_nodes[j].end && end > numa_nodes[j].start )
                 {
                     if ( start >= numa_nodes[j].start )
                     {
-                        start = numa_nodes[j].end;
+                        start = numa_nodes[j].end;  /* Check following memory */
                         found = true;
                     }
 
                     if ( end <= numa_nodes[j].end )
                     {
-                        end = numa_nodes[j].start;
+                        end = numa_nodes[j].start;  /* check preceding memory */
                         found = true;
                     }
                 }
-- 
2.43.0



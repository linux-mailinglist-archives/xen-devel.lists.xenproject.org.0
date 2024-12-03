Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B3C9E1AEC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 12:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847965.1262991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIR4h-0002wG-DI; Tue, 03 Dec 2024 11:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847965.1262991; Tue, 03 Dec 2024 11:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIR4h-0002u7-AX; Tue, 03 Dec 2024 11:28:15 +0000
Received: by outflank-mailman (input) for mailman id 847965;
 Tue, 03 Dec 2024 11:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRMW=S4=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tIR4f-0002u1-PW
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 11:28:13 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad7fa29b-b169-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 12:28:11 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa54adcb894so697047466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 03:28:11 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e7164sm612021766b.125.2024.12.03.03.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 03:28:10 -0800 (PST)
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
X-Inumbo-ID: ad7fa29b-b169-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733225290; x=1733830090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hA6nNf0bV2s6ks1c3yyy0VaM6y5y+WImctA+vf3iikc=;
        b=THkRh7vIIEC6Z/r7CLy0lEXrSutxhaOjUOKU/6q9+YTOzHyDM4CCzs/VuhcXUEuhzR
         ARU0JdiQhSMNc6kebkFRiQTUTpr0lZMZaurtQy/hGdUgx5gDyQGguzYljHVuoyOZlbfD
         8nO6887b2t+ma6y9Ct7gJN590gS2L8taINW+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733225290; x=1733830090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hA6nNf0bV2s6ks1c3yyy0VaM6y5y+WImctA+vf3iikc=;
        b=Tb61oPZdHZWIAdZluUUZKqRrdhnr/1i2SUuhGTSWG5zRTqZFRKBa+QS1awwbL0FNS+
         Z23PobATpOIxHzRbI5S+xtlbHGgFNDA0ThUQCPn/c/awqAnxiYWQoMR5u+1S9yCDkWsS
         rqfm9eSRWeQpDxkCK8GInqgrsucnaKJgFzUCNpgoNL8aN16aYpzTyIRkPLJYZ71OoLpQ
         szIqEgLFcV2f1Zv0loym8hsRfcMwEFiCMQPItoUZkg/H9nkKTJYVp5ZGOtGCqN6N27m+
         DA0bhMrXOAldhgk76SDfjNUfnKZ3f+ORB/cgQEbTZRGg6vOfD/KaWk3oB59eV7jvgGRE
         wJyg==
X-Gm-Message-State: AOJu0Yxx+fTVbzdb5JPIcFJtkKxwNv3TbW/7ewK0/TIHE+RSyz5sC+UY
	4XrOKbhbVvgScXVal391XFrOXdCeQ4z2p+VjnXtZkI5Dk7T18THSRroygxymyHlkdaID6BdyrDi
	xJ+M=
X-Gm-Gg: ASbGncuZOJLjZ/HQ1EEIbziQPNAsOYhX6vwc2izwQr6IMbM5ysa+jJ0k9BkUyUkgyli
	SmJBKCyA7bdFfden5aeRNiP1ED8g3F/vhpKHuKVriK7wp0tyN/CQEmR6zsRZx8UfC5eTjPrW6gl
	UpHuHggBpHYXlqk/hDBwy1vxqKfGZUOCHNzRjv51is3Tvzf/4/i/evzu4+neKkV0cb6AJPm4/ZK
	MFRWwkeX2HzNLUWVoCHlwEP4MUzff+8s3kI4P8DWlsJ2j/CIp9Oq6I=
X-Google-Smtp-Source: AGHT+IFuy0tbXMBYU/lpXkoyuI6W/CwCkRjmoAagEWafPY5CKZftjWG1PqhwWh8cud8zjxvA7L53Kg==
X-Received: by 2002:a17:906:3197:b0:aa5:324f:5319 with SMTP id a640c23a62f3a-aa5f7cce42amr162634566b.12.1733225290594;
        Tue, 03 Dec 2024 03:28:10 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] docs: Add function doc strings to a few x86 NUMA functions
Date: Tue,  3 Dec 2024 12:28:07 +0100
Message-ID: <eac797bfe774dd7a8063f518dd160863e2e10156.1733225252.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing x86 NUMA code, I noticed that some funcitons
could benefit from adding some function header doc strings.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CB76B507
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 14:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574138.899338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQong-0002bo-61; Tue, 01 Aug 2023 12:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574138.899338; Tue, 01 Aug 2023 12:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQonf-0002UK-U6; Tue, 01 Aug 2023 12:48:31 +0000
Received: by outflank-mailman (input) for mailman id 574138;
 Tue, 01 Aug 2023 12:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQone-0002MY-EP
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 12:48:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b614396e-3069-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 14:48:28 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 256D34EE0741;
 Tue,  1 Aug 2023 14:48:27 +0200 (CEST)
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
X-Inumbo-ID: b614396e-3069-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 1/3] xen/common: address MISRA C:2012 Rule 5.3
Date: Tue,  1 Aug 2023 14:47:42 +0200
Message-Id: <a2ec33d23fbc956d6b84e3736ff7f09549ab85b6.1690893696.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690893696.git.nicola.vetrini@bugseng.com>
References: <cover.1690893696.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following strategies are adopted to deal with violations
of MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

- s/nodes/numa_nodes/ for the file-scope variable in 'common/numa.c';
- move the variable 'struct compat_remove_from_physmap cmp' inside
  the outer union variable 'cmp' to avoid shadowing it.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Split the patch in common/ and drivers/.
- Moved the local cmp into the union as a member.
- Renamed the file-scope variable instead of parameters/local variables.
---
 xen/common/compat/memory.c |  7 +++----
 xen/common/numa.c          | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 8ca63ceda6..d000a5d93d 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -81,6 +81,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             struct compat_memory_exchange xchg;
             struct compat_add_to_physmap atp;
             struct compat_add_to_physmap_batch atpb;
+            struct compat_remove_from_physmap rmfp;
             struct compat_vnuma_topology_info vnuma;
             struct compat_mem_access_op mao;
             struct compat_mem_acquire_resource mar;
@@ -321,12 +322,10 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 
         case XENMEM_remove_from_physmap:
         {
-            struct compat_remove_from_physmap cmp;
-
-            if ( copy_from_guest(&cmp, compat, 1) )
+            if ( copy_from_guest(&cmp.rmfp, compat, 1) )
                 return -EFAULT;
 
-            XLAT_remove_from_physmap(nat.xrfp, &cmp);
+            XLAT_remove_from_physmap(nat.xrfp, &cmp.rmfp);
 
             break;
         }
diff --git a/xen/common/numa.c b/xen/common/numa.c
index fc1f7f665b..f454c4d894 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -15,7 +15,7 @@
 
 static nodemask_t __initdata processor_nodes_parsed;
 static nodemask_t __initdata memory_nodes_parsed;
-static struct node __initdata nodes[MAX_NUMNODES];
+static struct node __initdata numa_nodes[MAX_NUMNODES];
 
 static unsigned int __ro_after_init num_node_memblks;
 static struct node __ro_after_init node_memblk_range[NR_NODE_MEMBLKS];
@@ -117,7 +117,7 @@ static enum conflicts __init conflicting_memblks(
 
 static void __init cutoff_node(nodeid_t i, paddr_t start, paddr_t end)
 {
-    struct node *nd = &nodes[i];
+    struct node *nd = &numa_nodes[i];
 
     if ( nd->start < start )
     {
@@ -157,7 +157,7 @@ bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
     paddr_t end = start + size;
     paddr_t nd_start = start;
     paddr_t nd_end = end;
-    struct node *nd = &nodes[node];
+    struct node *nd = &numa_nodes[node];
 
     /*
      * For the node that already has some memory blocks, we will
@@ -292,17 +292,17 @@ static bool __init nodes_cover_memory(void)
         do {
             found = false;
             for_each_node_mask ( j, memory_nodes_parsed )
-                if ( start < nodes[j].end && end > nodes[j].start )
+                if ( start < numa_nodes[j].end && end > numa_nodes[j].start )
                 {
-                    if ( start >= nodes[j].start )
+                    if ( start >= numa_nodes[j].start )
                     {
-                        start = nodes[j].end;
+                        start = numa_nodes[j].end;
                         found = true;
                     }
 
-                    if ( end <= nodes[j].end )
+                    if ( end <= numa_nodes[j].end )
                     {
-                        end = nodes[j].start;
+                        end = numa_nodes[j].start;
                         found = true;
                     }
                 }
@@ -356,10 +356,10 @@ static bool __init numa_process_nodes(paddr_t start, paddr_t end)
     /* Finally register nodes */
     for_each_node_mask ( i, all_nodes_parsed )
     {
-        if ( nodes[i].end == nodes[i].start )
+        if ( numa_nodes[i].end == numa_nodes[i].start )
             printk(KERN_INFO "NUMA: node %u has no memory\n", i);
 
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+        setup_node_bootmem(i, numa_nodes[i].start, numa_nodes[i].end);
     }
 
     for ( i = 0; i < nr_cpu_ids; i++ )
-- 
2.34.1



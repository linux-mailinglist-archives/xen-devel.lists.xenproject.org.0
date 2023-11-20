Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6795E7F0ABC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636381.991874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRx-00055M-NB; Mon, 20 Nov 2023 02:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636381.991874; Mon, 20 Nov 2023 02:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRx-0004zs-Dk; Mon, 20 Nov 2023 02:55:49 +0000
Received: by outflank-mailman (input) for mailman id 636381;
 Mon, 20 Nov 2023 02:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRs-00081B-NW
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4bf700e6-8750-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 03:55:43 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D3131042;
 Sun, 19 Nov 2023 18:56:29 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03E6D3F6C4;
 Sun, 19 Nov 2023 18:55:40 -0800 (PST)
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
X-Inumbo-ID: 4bf700e6-8750-11ee-98df-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 15/17] xen/arm: Set correct per-cpu cpu_core_mask
Date: Mon, 20 Nov 2023 10:54:29 +0800
Message-Id: <20231120025431.14845-16-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the common sysctl command XEN_SYSCTL_physinfo, the cores_per_socket
is calculated based on the cpu_core_mask of CPU0. Currently on Arm
this is a fixed value 1 (can be checked via xl info), which is not
correct. This is because during the Arm cpu online process,
set_cpu_sibling_map() only sets the per-cpu cpu_core_mask for itself.

cores_per_socket refers to the number of cores that belong to the same
socket (NUMA node). Therefore, this commit introduces a helper function
numa_set_cpu_core_mask(cpu), which sets the per-cpu cpu_core_mask to
the cpus in the same NUMA node as cpu. Calling this function at the
boot time can ensure the correct cpu_core_mask, leading to the correct
cores_per_socket to be returned by XEN_SYSCTL_physinfo.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v6:
- Rebase on top of staging without code changes.
---
 xen/arch/arm/include/asm/numa.h |  7 +++++++
 xen/arch/arm/numa.c             | 11 +++++++++++
 xen/arch/arm/setup.c            |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 71b95a9a62..d4c89909d0 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -46,6 +46,7 @@ extern void numa_set_distance(nodeid_t from, nodeid_t to,
 extern void numa_detect_cpu_node(unsigned int cpu);
 extern int numa_device_tree_init(const void *fdt);
 extern void numa_init(void);
+extern void numa_set_cpu_core_mask(int cpu);
 
 /*
  * Device tree NUMA doesn't have architecural node id.
@@ -62,6 +63,12 @@ static inline unsigned int numa_node_to_arch_nid(nodeid_t n)
 #define cpu_to_node(cpu) 0
 #define node_to_cpumask(node)   (cpu_online_map)
 
+static inline void numa_set_cpu_core_mask(int cpu)
+{
+    cpumask_or(per_cpu(cpu_core_mask, cpu),
+               per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+}
+
 /*
  * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
  * is required because the dummy helpers are using it.
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 13a167fc4f..1ac2df37fc 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -52,6 +52,17 @@ int __init arch_numa_setup(const char *opt)
     return -EINVAL;
 }
 
+void numa_set_cpu_core_mask(int cpu)
+{
+    nodeid_t node = cpu_to_node[cpu];
+
+    if ( node == NUMA_NO_NODE )
+        node = 0;
+
+    cpumask_or(per_cpu(cpu_core_mask, cpu),
+               per_cpu(cpu_core_mask, cpu), &node_to_cpumask(node));
+}
+
 void __init numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance)
 {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 01affc12d9..af8631b6e5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1229,6 +1229,11 @@ void __init start_xen(unsigned long boot_phys_offset,
     }
 
     printk("Brought up %ld CPUs\n", (long)num_online_cpus());
+
+    /* Set per-cpu cpu_core_mask to cpus that belongs to the same NUMA node. */
+    for_each_online_cpu ( i )
+        numa_set_cpu_core_mask(i);
+
     /* TODO: smp_cpus_done(); */
 
     /* This should be done in a vpmu driver but we do not have one yet. */
-- 
2.25.1



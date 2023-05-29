Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E4714203
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 04:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540476.842278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Sbj-0004BD-GA; Mon, 29 May 2023 02:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540476.842278; Mon, 29 May 2023 02:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3Sbj-00049G-9n; Mon, 29 May 2023 02:27:39 +0000
Received: by outflank-mailman (input) for mailman id 540476;
 Mon, 29 May 2023 02:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x08u=BS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q3SUm-0006GL-6F
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 02:20:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5ebb7b14-fdc7-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 04:20:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD6BAB6;
 Sun, 28 May 2023 19:21:09 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FD823F64C;
 Sun, 28 May 2023 19:20:22 -0700 (PDT)
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
X-Inumbo-ID: 5ebb7b14-fdc7-11ed-8611-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 15/17] xen/arm: Set correct per-cpu cpu_core_mask
Date: Mon, 29 May 2023 10:19:19 +0800
Message-Id: <20230529021921.2606623-16-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529021921.2606623-1-Henry.Wang@arm.com>
References: <20230529021921.2606623-1-Henry.Wang@arm.com>
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
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. No change.
v1 -> v2:
1. New patch
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
index bfcb0c7b6b..9b586605a6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1226,6 +1226,11 @@ void __init start_xen(unsigned long boot_phys_offset,
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



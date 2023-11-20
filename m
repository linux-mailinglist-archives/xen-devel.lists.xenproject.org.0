Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D87F0AB2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636361.991797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRN-00019y-H2; Mon, 20 Nov 2023 02:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636361.991797; Mon, 20 Nov 2023 02:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRN-00015m-Dz; Mon, 20 Nov 2023 02:55:13 +0000
Received: by outflank-mailman (input) for mailman id 636361;
 Mon, 20 Nov 2023 02:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRM-00081B-0t
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 38983935-8750-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 03:55:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69BC1042;
 Sun, 19 Nov 2023 18:55:56 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E6503F6C4;
 Sun, 19 Nov 2023 18:55:08 -0800 (PST)
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
X-Inumbo-ID: 38983935-8750-11ee-98df-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 06/17] xen/arm: Add boot and secondary CPU to NUMA system
Date: Mon, 20 Nov 2023 10:54:20 +0800
Message-Id: <20231120025431.14845-7-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

In this patch, we make NUMA node online and add cpu to
its NUMA node. This will make NUMA-aware components
have NUMA affinity data to support their work.

To keep the mostly the same behavior of x86, we use
numa_detect_cpu_node to online node. The difference is that,
we have prepared cpu_to_node in dt_smp_init_cpus, so we don't
need to setup cpu_to_node in numa_detect_cpu_node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v6:
- Rebase on top of staging without code changes.
v1 -> v2:
- Use unsigned int instead of int for cpu id.
- Use static inline for stub to do type check.
---
 xen/arch/arm/include/asm/numa.h |  9 +++++++++
 xen/arch/arm/numa.c             | 10 ++++++++++
 xen/arch/arm/setup.c            |  5 +++++
 3 files changed, 24 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 97d4a67dea..b04ace26db 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -35,6 +35,7 @@ typedef u8 nodeid_t;
 extern bool numa_disabled(void);
 extern void numa_set_distance(nodeid_t from, nodeid_t to,
                               unsigned int distance);
+extern void numa_detect_cpu_node(unsigned int cpu);
 
 #else
 
@@ -72,6 +73,14 @@ static inline void numa_set_node(unsigned int cpu, nodeid_t node)
 {
 }
 
+static inline void numa_add_cpu(unsigned int cpu)
+{
+}
+
+static inline void numa_detect_cpu_node(unsigned int cpu)
+{
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index e9b2ec93bc..b5a87531f7 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -76,6 +76,16 @@ void __init numa_set_distance(nodeid_t from, nodeid_t to,
     node_distance_map[from][to] = distance;
 }
 
+void numa_detect_cpu_node(unsigned int cpu)
+{
+    nodeid_t node = cpu_to_node[cpu];
+
+    if ( node == NUMA_NO_NODE )
+        node = 0;
+
+    node_set_online(node);
+}
+
 unsigned char __node_distance(nodeid_t from, nodeid_t to)
 {
     if ( from == to )
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3f3a45719c..02bc887725 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1208,6 +1208,11 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     for_each_present_cpu ( i )
     {
+        /* Detect and online node based on cpu_to_node[]. */
+        numa_detect_cpu_node(i);
+        /* Set up node_to_cpumask based on cpu_to_node[]. */
+        numa_add_cpu(i);
+
         if ( (num_online_cpus() < nr_cpu_ids) && !cpu_online(i) )
         {
             int ret = cpu_up(i);
-- 
2.25.1



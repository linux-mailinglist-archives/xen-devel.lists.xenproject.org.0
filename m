Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD36E926C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524041.814620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSQK-000877-9Q; Thu, 20 Apr 2023 11:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524041.814620; Thu, 20 Apr 2023 11:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSQK-00083X-5T; Thu, 20 Apr 2023 11:26:00 +0000
Received: by outflank-mailman (input) for mailman id 524041;
 Thu, 20 Apr 2023 11:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE5v=AL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppSQI-0006Vv-5P
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:25:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1e98d4a4-df6e-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:25:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 924971480;
 Thu, 20 Apr 2023 04:26:40 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57DFA3F587;
 Thu, 20 Apr 2023 04:25:54 -0700 (PDT)
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
X-Inumbo-ID: 1e98d4a4-df6e-11ed-b21f-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 05/17] xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
Date: Thu, 20 Apr 2023 19:25:09 +0800
Message-Id: <20230420112521.3272732-6-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420112521.3272732-1-Henry.Wang@arm.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

NUMA implementation has a cpu_to_node array to store CPU to NODE
map. Xen is using CPU logical ID in runtime components, so we
use CPU logical ID as CPU index in cpu_to_node.

In device tree case, cpu_logical_map is created in dt_smp_init_cpus.
So, when NUMA is enabled, dt_smp_init_cpus will fetch CPU NUMA id
at the same time for cpu_to_node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v3:
1. No change.
v1 -> v2:
1. Use static inline to replace macros to perform
   function paramerters type check.
2. Add numa_disabled to gate the numa-node-id check for
   CONFIG_NUMA on but numa disabled user case.
3. Use macro instead of static inline function to stub
   numa_set_node.
---
 xen/arch/arm/include/asm/numa.h |  4 ++++
 xen/arch/arm/smpboot.c          | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 123a1a8dd0..e7a7d4e835 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -69,6 +69,10 @@ static inline bool arch_numa_broken(void)
     return true;
 }
 
+static inline void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 4a89b3a834..da7f2afd97 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -118,7 +118,12 @@ static void __init dt_smp_init_cpus(void)
     {
         [0 ... NR_CPUS - 1] = MPIDR_INVALID
     };
+    static nodeid_t node_map[NR_CPUS] __initdata =
+    {
+        [0 ... NR_CPUS - 1] = NUMA_NO_NODE
+    };
     bool bootcpu_valid = false;
+    unsigned int nid = 0;
     int rc;
 
     mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
@@ -169,6 +174,28 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
+        if ( IS_ENABLED(CONFIG_NUMA) )
+        {
+            /*
+             * When CONFIG_NUMA is set, try to fetch numa infomation
+             * from CPU dts node, otherwise the nid is always 0.
+             */
+            if ( !dt_property_read_u32(cpu, "numa-node-id", &nid) )
+            {
+                printk(XENLOG_WARNING
+                       "cpu[%d] dts path: %s: doesn't have numa information!\n",
+                       cpuidx, dt_node_full_name(cpu));
+                /*
+                 * During the early stage of NUMA initialization, when Xen
+                 * found any CPU dts node doesn't have numa-node-id info, the
+                 * NUMA will be treated as off, all CPU will be set to a FAKE
+                 * node 0. So if we get numa-node-id failed here, we should
+                 * set nid to 0.
+                 */
+                nid = 0;
+            }
+        }
+
         /*
          * 8 MSBs must be set to 0 in the DT since the reg property
          * defines the MPIDR[23:0]
@@ -228,9 +255,13 @@ static void __init dt_smp_init_cpus(void)
         {
             printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
             tmp_map[i] = MPIDR_INVALID;
+            node_map[i] = NUMA_NO_NODE;
         }
         else
+        {
             tmp_map[i] = hwid;
+            node_map[i] = nid;
+        }
     }
 
     if ( !bootcpu_valid )
@@ -246,6 +277,11 @@ static void __init dt_smp_init_cpus(void)
             continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
+
+        nid = node_map[i];
+        if ( nid >= MAX_NUMNODES )
+            nid = 0;
+        numa_set_node(i, nid);
     }
 }
 
-- 
2.25.1



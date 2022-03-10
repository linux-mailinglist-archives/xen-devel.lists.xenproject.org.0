Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696744D4FFC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288508.489280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJE-0003BL-Bt; Thu, 10 Mar 2022 17:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288508.489280; Thu, 10 Mar 2022 17:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMJE-00037e-4B; Thu, 10 Mar 2022 17:10:40 +0000
Received: by outflank-mailman (input) for mailman id 288508;
 Thu, 10 Mar 2022 17:10:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/tR=TV=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nSMJC-0001lh-2m
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:10:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 00d596e4-a095-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 18:10:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 554171692;
 Thu, 10 Mar 2022 09:10:36 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09C1C3F99C;
 Thu, 10 Mar 2022 09:10:34 -0800 (PST)
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
X-Inumbo-ID: 00d596e4-a095-11ec-8eba-a37418f5ba1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/6] arm/dom0less: assign dom0less guests to cpupools
Date: Thu, 10 Mar 2022 17:10:18 +0000
Message-Id: <20220310171019.6170-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310171019.6170-1-luca.fancellu@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>

Introduce domain-cpupool property of a xen,domain device tree node,
that specifies the cpupool device tree handle of a xen,cpupool node
that identifies a cpupool created at boot time where the guest will
be assigned on creation.

Add member to the xen_domctl_createdomain public interface so the
XEN_DOMCTL_INTERFACE_VERSION version is bumped.

Add public function to retrieve a pool id from the device tree
cpupool node.

Update documentation about the property.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
- Moved cpupool_id from arch specific to common part (Juergen)
- Implemented functions to retrieve the cpupool id from the
  cpupool dtb node.
---
 docs/misc/arm/device-tree/booting.txt |  5 +++++
 xen/arch/arm/domain_build.c           | 14 +++++++++++++-
 xen/common/boot_cpupools.c            | 24 ++++++++++++++++++++++++
 xen/common/domain.c                   |  2 +-
 xen/include/public/domctl.h           |  4 +++-
 xen/include/xen/sched.h               |  9 +++++++++
 6 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index a94125394e35..7b4a29a2c293 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -188,6 +188,11 @@ with the following properties:
     An empty property to request the memory of the domain to be
     direct-map (guest physical address == physical address).
 
+- domain-cpupool
+
+    Optional. Handle to a xen,cpupool device tree node that identifies the
+    cpupool where the guest will be started at boot.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de05..9c67a483d4a4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3172,7 +3172,8 @@ static int __init construct_domU(struct domain *d,
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
-    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+    const struct dt_device_node *cpupool_node,
+                                *chosen = dt_find_node_by_path("/chosen");
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -3241,6 +3242,17 @@ void __init create_domUs(void)
                                          vpl011_virq - 32 + 1);
         }
 
+        /* Get the optional property domain-cpupool */
+        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
+        if ( cpupool_node )
+        {
+            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
+            if ( pool_id < 0 )
+                panic("Error getting cpupool id from domain-cpupool (%d)\n",
+                      pool_id);
+            d_cfg.cpupool_id = pool_id;
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
diff --git a/xen/common/boot_cpupools.c b/xen/common/boot_cpupools.c
index e8529a902d21..01a69f894f14 100644
--- a/xen/common/boot_cpupools.c
+++ b/xen/common/boot_cpupools.c
@@ -11,6 +11,8 @@
 
 #define BTCPUPOOLS_DT_NODE_NO_REG     (-1)
 #define BTCPUPOOLS_DT_NODE_NO_LOG_CPU (-2)
+#define BTCPUPOOLS_DT_WRONG_NODE      (-3)
+#define BTCPUPOOLS_DT_CORRUPTED_NODE  (-4)
 
 struct pool_map {
     int pool_id;
@@ -53,6 +55,28 @@ get_logical_cpu_from_cpu_node(const struct dt_device_node *cpu_node)
     return cpu_num;
 }
 
+int __init btcpupools_get_domain_pool_id(const struct dt_device_node *node)
+{
+    const struct dt_device_node *phandle_node;
+    int cpu_num;
+
+    if ( !dt_device_is_compatible(node, "xen,cpupool") )
+        return BTCPUPOOLS_DT_WRONG_NODE;
+    /*
+     * Get first cpu listed in the cpupool, from its reg it's possible to
+     * retrieve the cpupool id.
+     */
+    phandle_node = dt_parse_phandle(node, "cpupool-cpus", 0);
+    if ( !phandle_node )
+        return BTCPUPOOLS_DT_CORRUPTED_NODE;
+
+    cpu_num = get_logical_cpu_from_cpu_node(phandle_node);
+    if ( cpu_num < 0 )
+        return cpu_num;
+
+    return pool_cpu_map[cpu_num].pool_id;
+}
+
 static int __init check_and_get_sched_id(const char* scheduler_name)
 {
     int sched_id = sched_get_id_by_name(scheduler_name);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 351029f8b239..0827400f4f49 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -698,7 +698,7 @@ struct domain *domain_create(domid_t domid,
         if ( !d->pbuf )
             goto fail;
 
-        if ( (err = sched_init_domain(d, 0)) != 0 )
+        if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
             goto fail;
 
         if ( (err = late_hwdom_init(d)) != 0 )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0aa..3d431a8031fd 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
+    unsigned int cpupool_id;
+
     struct xen_arch_domainconfig arch;
 };
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index de4e8feea399..30a6538452bc 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1182,6 +1182,7 @@ struct cpupool *btcpupools_get_cpupool(unsigned int cpu);
 
 #ifdef CONFIG_ARM
 void btcpupools_dtb_parse(void);
+int btcpupools_get_domain_pool_id(const struct dt_device_node *node);
 #else
 static inline void btcpupools_dtb_parse(void) {}
 #endif
@@ -1193,6 +1194,14 @@ static inline struct cpupool *btcpupools_get_cpupool(unsigned int cpu)
 {
     return cpupool0;
 }
+#ifdef CONFIG_ARM
+static inline int
+btcpupools_get_domain_pool_id(const struct dt_device_node *node)
+{
+    return 0;
+}
+#endif
+
 #endif
 
 #endif /* __SCHED_H__ */
-- 
2.17.1



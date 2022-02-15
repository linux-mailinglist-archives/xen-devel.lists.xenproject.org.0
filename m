Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AF4B6905
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272925.467960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusV-00043g-F0; Tue, 15 Feb 2022 10:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272925.467960; Tue, 15 Feb 2022 10:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusV-0003zm-6n; Tue, 15 Feb 2022 10:16:11 +0000
Received: by outflank-mailman (input) for mailman id 272925;
 Tue, 15 Feb 2022 10:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nJusU-0003iX-4j
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:16:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4ab89378-8e48-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:16:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B5B13D5;
 Tue, 15 Feb 2022 02:16:08 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4872E3F66F;
 Tue, 15 Feb 2022 02:16:06 -0800 (PST)
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
X-Inumbo-ID: 4ab89378-8e48-11ec-8eb8-a37418f5ba1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
Date: Tue, 15 Feb 2022 10:15:50 +0000
Message-Id: <20220215101551.23101-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220215101551.23101-1-luca.fancellu@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>

Introduce an architecture specific way to create different cpupools
at boot time, this is particularly useful on ARM big.LITTLE system
where there might be the need to have different cpupools for each type
of core, but also systems using NUMA can have different cpu pools for
each node.

The feature on arm relies on a specification of the cpupools from the
device tree to build pools and assign cpus to them.

Documentation is created to explain the feature.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++++
 xen/arch/arm/Kconfig                   |   9 ++
 xen/arch/arm/Makefile                  |   1 +
 xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++++
 xen/common/sched/cpupool.c             |   4 +-
 xen/include/xen/sched.h                |  11 +++
 6 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 docs/misc/arm/device-tree/cpupools.txt
 create mode 100644 xen/arch/arm/cpupool.c

diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
new file mode 100644
index 000000000000..7298b6394332
--- /dev/null
+++ b/docs/misc/arm/device-tree/cpupools.txt
@@ -0,0 +1,118 @@
+Boot time cpupools
+==================
+
+On arm, when BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is
+possible to create cpupools during boot phase by specifying them in the device
+tree.
+
+Cpupools specification nodes shall be direct childs of /chosen node.
+Each cpupool node contains the following properties:
+
+- compatible (mandatory)
+
+    Must always include the compatiblity string: "xen,cpupool".
+
+- cpupool-id (mandatory)
+
+    Must be a positive integer number.
+
+- cpupool-cpus (mandatory)
+
+    Must be a list of device tree phandle to nodes describing cpus (e.g. having
+    device_type = "cpu"), it can't be empty.
+
+- cpupool-sched (optional)
+
+    Must be a string having the name of a Xen scheduler, it has no effect when
+    used in conjunction of a cpupool-id equal to zero, in that case the
+    default Xen scheduler is selected (sched=<...> boot argument).
+
+
+Constraints
+===========
+
+The cpupool with id zero is implicitly created even if not specified, that pool
+must have at least one cpu assigned, otherwise Xen will stop.
+
+Every cpu brought up by Xen will be assigned to the cpupool with id zero if it's
+not assigned to any other cpupool.
+
+If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
+stop.
+
+
+Examples
+========
+
+A system having two types of core, the following device tree specification will
+instruct Xen to have two cpupools:
+
+- The cpupool with id 0 will have 4 cpus assigned.
+- The cpupool with id 1 will have 2 cpus assigned.
+
+As can be seen from the example, cpupool_a has only two cpus assigned, but since
+there are two cpus unassigned, they are automatically assigned to cpupool with
+id zero. The following example can work only if hmp-unsafe=1 is passed to Xen
+boot arguments, otherwise not all cores will be brought up by Xen and the
+cpupool creation process will stop Xen.
+
+
+a72_1: cpu@0 {
+        compatible = "arm,cortex-a72";
+        reg = <0x0 0x0>;
+        device_type = "cpu";
+        [...]
+};
+
+a72_2: cpu@1 {
+        compatible = "arm,cortex-a72";
+        reg = <0x0 0x1>;
+        device_type = "cpu";
+        [...]
+};
+
+a53_1: cpu@100 {
+        compatible = "arm,cortex-a53";
+        reg = <0x0 0x100>;
+        device_type = "cpu";
+        [...]
+};
+
+a53_2: cpu@101 {
+        compatible = "arm,cortex-a53";
+        reg = <0x0 0x101>;
+        device_type = "cpu";
+        [...]
+};
+
+cpu@102 {
+        compatible = "arm,cortex-a53";
+        reg = <0x0 0x102>;
+        device_type = "cpu";
+        [...]
+};
+
+cpu@103 {
+        compatible = "arm,cortex-a53";
+        reg = <0x0 0x103>;
+        device_type = "cpu";
+        [...]
+};
+
+chosen {
+
+    cpupool_a {
+        compatible = "xen,cpupool";
+        cpupool-id = <0>;
+        cpupool-cpus = <&a53_1 &a53_2>;
+    };
+    cpupool_b {
+        compatible = "xen,cpupool";
+        cpupool-id = <1>;
+        cpupool-cpus = <&a72_1 &a72_2>;
+        cpupool-sched = "credit2";
+    };
+
+    [...]
+
+};
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4d3..64c2879513b7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -33,6 +33,15 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+config BOOT_TIME_CPUPOOLS
+	bool "Create cpupools at boot time"
+	depends on ARM
+	default n
+	help
+
+	  Creates cpupools during boot time and assigns cpus to them. Cpupools
+	  options can be specified in the device tree.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index d0dee10102b6..6165da4e77b4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
 obj-y += bootfdt.init.o
 obj-y += cpuerrata.o
 obj-y += cpufeature.o
+obj-$(CONFIG_BOOT_TIME_CPUPOOLS) += cpupool.o
 obj-y += decode.o
 obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
diff --git a/xen/arch/arm/cpupool.c b/xen/arch/arm/cpupool.c
new file mode 100644
index 000000000000..a9d5b94635b9
--- /dev/null
+++ b/xen/arch/arm/cpupool.c
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/arch/arm/cpupool.c
+ *
+ * Code to create cpupools at boot time for arm architecture.
+ *
+ * Copyright (C) 2022 Arm Ltd.
+ */
+
+#include <xen/sched.h>
+
+static struct cpupool *__initdata pool_cpu_map[NR_CPUS];
+
+void __init arch_allocate_cpupools(const cpumask_t *cpu_online_map)
+{
+    const struct dt_device_node *chosen, *node;
+    unsigned int cpu_num, cpupool0_cpu_count = 0;
+    cpumask_t cpus_to_assign;
+
+    chosen = dt_find_node_by_path("/chosen");
+    if ( !chosen )
+        return;
+
+    cpumask_copy(&cpus_to_assign, cpu_online_map);
+
+    dt_for_each_child_node(chosen, node)
+    {
+        const struct dt_device_node *cpu_node;
+        unsigned int pool_id;
+        int i = 0, sched_id = -1;
+        const char* scheduler_name;
+        struct cpupool *pool = cpupool0;
+
+        if ( !dt_device_is_compatible(node, "xen,cpupool") )
+            continue;
+
+        if ( !dt_property_read_u32(node, "cpupool-id", &pool_id) )
+            panic("Missing cpupool-id property!\n");
+
+        if ( !dt_property_read_string(node, "cpupool-sched", &scheduler_name) )
+        {
+            sched_id = sched_get_id_by_name(scheduler_name);
+            if ( sched_id < 0 )
+                panic("Scheduler %s does not exists!\n", scheduler_name);
+        }
+
+        if ( pool_id )
+        {
+            pool = cpupool_create_pool(pool_id, sched_id);
+            if ( !pool )
+                panic("Error creating pool id %u!\n", pool_id);
+        }
+
+        cpu_node = dt_parse_phandle(node, "cpupool-cpus", 0);
+        if ( !cpu_node )
+            panic("Missing or empty cpupool-cpus property!\n");
+
+        while ( cpu_node )
+        {
+            register_t cpu_reg;
+            const __be32 *prop;
+
+            prop = dt_get_property(cpu_node, "reg", NULL);
+            if ( !prop )
+                panic("cpupool-cpus pointed node has no reg property!\n");
+
+            cpu_reg = dt_read_number(prop, dt_n_addr_cells(cpu_node));
+
+            /* Check if the cpu is online and in the set to be assigned */
+            for_each_cpu ( cpu_num, &cpus_to_assign )
+                if ( cpu_logical_map(cpu_num) == cpu_reg )
+                    break;
+
+            if ( cpu_num >= nr_cpu_ids )
+                panic("Cpu found in %s is not online or it's assigned twice!\n",
+                      dt_node_name(node));
+
+            pool_cpu_map[cpu_num] = pool;
+            cpumask_clear_cpu(cpu_num, &cpus_to_assign);
+
+            printk(XENLOG_INFO "CPU with MPIDR %"PRIregister" in Pool-%u.\n",
+                   cpu_reg, pool_id);
+
+            /* Keep track of how many cpus are assigned to Pool-0 */
+            if ( !pool_id )
+                cpupool0_cpu_count++;
+
+            cpu_node = dt_parse_phandle(node, "cpupool-cpus", ++i);
+        }
+    }
+
+    /* Assign every non assigned cpu to Pool-0 */
+    for_each_cpu ( cpu_num, &cpus_to_assign )
+    {
+        pool_cpu_map[cpu_num] = cpupool0;
+        cpupool0_cpu_count++;
+        printk(XENLOG_INFO "CPU with MPIDR %"PRIregister" in Pool-0.\n",
+               cpu_logical_map(cpu_num));
+    }
+
+    if ( !cpupool0_cpu_count )
+        panic("No cpu assigned to cpupool0!\n");
+}
+
+struct cpupool *__init arch_get_cpupool(unsigned int cpu)
+{
+    return pool_cpu_map[cpu];
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 4da12528d6b9..6013d75e2edd 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1257,12 +1257,14 @@ static int __init cpupool_init(void)
     cpupool_put(cpupool0);
     register_cpu_notifier(&cpu_nfb);
 
+    arch_allocate_cpupools(&cpu_online_map);
+
     spin_lock(&cpupool_lock);
 
     cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
 
     for_each_cpu ( cpu, &cpupool_free_cpus )
-        cpupool_assign_cpu_locked(cpupool0, cpu);
+        cpupool_assign_cpu_locked(arch_get_cpupool(cpu), cpu);
 
     spin_unlock(&cpupool_lock);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a67a9eb2fe9d..dda7db2ba51f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1177,6 +1177,17 @@ extern void dump_runq(unsigned char key);
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
 
+#ifdef CONFIG_BOOT_TIME_CPUPOOLS
+void arch_allocate_cpupools(const cpumask_t *cpu_online_map);
+struct cpupool *arch_get_cpupool(unsigned int cpu);
+#else
+static inline void arch_allocate_cpupools(const cpumask_t *cpu_online_map) {}
+static inline struct cpupool *arch_get_cpupool(unsigned int cpu)
+{
+    return cpupool0;
+}
+#endif
+
 #endif /* __SCHED_H__ */
 
 /*
-- 
2.17.1



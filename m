Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D683D4F9111
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 10:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301204.514024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckFN-0001Mz-Re; Fri, 08 Apr 2022 08:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301204.514024; Fri, 08 Apr 2022 08:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nckFN-0001K6-LQ; Fri, 08 Apr 2022 08:45:37 +0000
Received: by outflank-mailman (input) for mailman id 301204;
 Fri, 08 Apr 2022 08:45:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zQ4=US=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nckFL-0000Ej-Qo
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 08:45:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 41078176-b718-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 10:45:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91AF71650;
 Fri,  8 Apr 2022 01:45:33 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56693F73B;
 Fri,  8 Apr 2022 01:45:31 -0700 (PDT)
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
X-Inumbo-ID: 41078176-b718-11ec-a405-831a346695d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v6 4/6] xen/cpupool: Create different cpupools at boot time
Date: Fri,  8 Apr 2022 09:45:15 +0100
Message-Id: <20220408084517.33082-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220408084517.33082-1-luca.fancellu@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>

Introduce a way to create different cpupools at boot time, this is
particularly useful on ARM big.LITTLE system where there might be the
need to have different cpupools for each type of core, but also
systems using NUMA can have different cpu pools for each node.

The feature on arm relies on a specification of the cpupools from the
device tree to build pools and assign cpus to them.

ACPI is not supported for this feature.

Documentation is created to explain the feature.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
Changes in v6:
- Changed docs, return if booted with ACPI in btcpupools_dtb_parse,
  panic if /chosen does not exists. Changed commit message (Julien)
- Add Juergen R-by for the xen/common/sched part that didn't change
Changes in v5:
- Fixed wrong variable name, swapped schedulers, add scheduler info
  in the printk (Stefano)
- introduce assert in cpupool_init and btcpupools_get_cpupool_id to
  harden the code
Changes in v4:
- modify Makefile to put in *.init.o, fixed stubs and macro (Jan)
- fixed docs, fix brakets (Stefano)
- keep cpu0 in Pool-0 (Julien)
- moved printk from btcpupools_allocate_pools to
  btcpupools_get_cpupool_id
- Add to docs constraint about cpu0 and Pool-0
Changes in v3:
- Add newline to cpupools.txt and removed "default n" from Kconfig (Jan)
- Fixed comment, moved defines, used global cpu_online_map, use
  HAS_DEVICE_TREE instead of ARM and place arch specific code in header
  (Juergen)
- Fix brakets, x86 code only panic, get rid of scheduler dt node, don't
  save pool pointer and look for it from the pool list (Stefano)
- Changed data structures to allow modification to the code.
Changes in v2:
- Move feature to common code (Juergen)
- Try to decouple dtb parse and cpupool creation to allow
  more way to specify cpupools (for example command line)
- Created standalone dt node for the scheduler so it can
  be used in future work to set scheduler specific
  parameters
- Use only auto generated ids for cpupools
---
 docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
 xen/arch/arm/include/asm/smp.h         |   3 +
 xen/common/Kconfig                     |   7 +
 xen/common/Makefile                    |   1 +
 xen/common/boot_cpupools.c             | 207 +++++++++++++++++++++++++
 xen/common/sched/cpupool.c             |  12 +-
 xen/include/xen/sched.h                |  14 ++
 7 files changed, 383 insertions(+), 1 deletion(-)
 create mode 100644 docs/misc/arm/device-tree/cpupools.txt
 create mode 100644 xen/common/boot_cpupools.c

diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
new file mode 100644
index 000000000000..40cc8135c66f
--- /dev/null
+++ b/docs/misc/arm/device-tree/cpupools.txt
@@ -0,0 +1,140 @@
+Boot time cpupools
+==================
+
+When BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is possible to
+create cpupools during boot phase by specifying them in the device tree.
+ACPI is not supported for this feature.
+
+Cpupools specification nodes shall be direct childs of /chosen node.
+Each cpupool node contains the following properties:
+
+- compatible (mandatory)
+
+    Must always include the compatiblity string: "xen,cpupool".
+
+- cpupool-cpus (mandatory)
+
+    Must be a list of device tree phandle to nodes describing cpus (e.g. having
+    device_type = "cpu"), it can't be empty.
+
+- cpupool-sched (optional)
+
+    Must be a string having the name of a Xen scheduler. Check the sched=<...>
+    boot argument for allowed values [1]. When this property is omitted, the Xen
+    default scheduler will be used.
+
+
+Constraints
+===========
+
+If no cpupools are specified, all cpus will be assigned to one cpupool
+implicitly created (Pool-0).
+
+If cpupools node are specified, but not every cpu brought up by Xen is assigned,
+all the not assigned cpu will be assigned to an additional cpupool.
+
+If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
+stop.
+
+The boot cpu must be assigned to Pool-0, so the cpupool containing that core
+will become Pool-0 automatically.
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
+The following example can work only if hmp-unsafe=1 is passed to Xen boot
+arguments, otherwise not all cores will be brought up by Xen and the cpupool
+creation process will stop Xen.
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
+a53_3: cpu@102 {
+        compatible = "arm,cortex-a53";
+        reg = <0x0 0x102>;
+        device_type = "cpu";
+        [...]
+};
+
+a53_4: cpu@103 {
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
+        cpupool-cpus = <&a53_1 &a53_2 &a53_3 &a53_4>;
+    };
+    cpupool_b {
+        compatible = "xen,cpupool";
+        cpupool-cpus = <&a72_1 &a72_2>;
+        cpupool-sched = "credit2";
+    };
+
+    [...]
+
+};
+
+
+A system having the cpupools specification below will instruct Xen to have three
+cpupools:
+
+- The cpupool Pool-0 will have 2 cpus assigned.
+- The cpupool Pool-1 will have 2 cpus assigned.
+- The cpupool Pool-2 will have 2 cpus assigned (created by Xen with all the not
+  assigned cpus a53_3 and a53_4).
+
+chosen {
+
+    cpupool_a {
+        compatible = "xen,cpupool";
+        cpupool-cpus = <&a53_1 &a53_2>;
+    };
+    cpupool_b {
+        compatible = "xen,cpupool";
+        cpupool-cpus = <&a72_1 &a72_2>;
+        cpupool-sched = "null";
+    };
+
+    [...]
+
+};
+
+[1] docs/misc/xen-command-line.pandoc
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index af5a2fe65266..83c0cd69767b 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -34,6 +34,9 @@ extern void init_secondary(void);
 extern void smp_init_cpus(void);
 extern void smp_clear_cpu_maps (void);
 extern int smp_get_max_cpus (void);
+
+#define cpu_physical_id(cpu) cpu_logical_map(cpu)
+
 #endif
 
 /*
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d615e..70aac5220e75 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -22,6 +22,13 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config BOOT_TIME_CPUPOOLS
+	bool "Create cpupools at boot time"
+	depends on HAS_DEVICE_TREE
+	help
+	  Creates cpupools during boot time and assigns cpus to them. Cpupools
+	  options can be specified in the device tree.
+
 config ALTERNATIVE_CALL
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b1e076c30b81..218174ca8b6b 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
+obj-$(CONFIG_BOOT_TIME_CPUPOOLS) += boot_cpupools.init.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
diff --git a/xen/common/boot_cpupools.c b/xen/common/boot_cpupools.c
new file mode 100644
index 000000000000..9429a5025fc4
--- /dev/null
+++ b/xen/common/boot_cpupools.c
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/common/boot_cpupools.c
+ *
+ * Code to create cpupools at boot time.
+ *
+ * Copyright (C) 2022 Arm Ltd.
+ */
+
+#include <xen/sched.h>
+#include <asm/acpi.h>
+
+/*
+ * pool_cpu_map:   Index is logical cpu number, content is cpupool id, (-1) for
+ *                 unassigned.
+ * pool_sched_map: Index is cpupool id, content is scheduler id, (-1) for
+ *                 unassigned.
+ */
+static int __initdata pool_cpu_map[NR_CPUS]   = { [0 ... NR_CPUS-1] = -1 };
+static int __initdata pool_sched_map[NR_CPUS] = { [0 ... NR_CPUS-1] = -1 };
+static unsigned int __initdata next_pool_id;
+
+#define BTCPUPOOLS_DT_NODE_NO_REG     (-1)
+#define BTCPUPOOLS_DT_NODE_NO_LOG_CPU (-2)
+
+static int __init get_logical_cpu_from_hw_id(unsigned int hwid)
+{
+    unsigned int i;
+
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_physical_id(i) == hwid )
+            return i;
+    }
+
+    return -1;
+}
+
+static int __init
+get_logical_cpu_from_cpu_node(const struct dt_device_node *cpu_node)
+{
+    int cpu_num;
+    const __be32 *prop;
+    unsigned int cpu_reg;
+
+    prop = dt_get_property(cpu_node, "reg", NULL);
+    if ( !prop )
+        return BTCPUPOOLS_DT_NODE_NO_REG;
+
+    cpu_reg = dt_read_number(prop, dt_n_addr_cells(cpu_node));
+
+    cpu_num = get_logical_cpu_from_hw_id(cpu_reg);
+    if ( cpu_num < 0 )
+        return BTCPUPOOLS_DT_NODE_NO_LOG_CPU;
+
+    return cpu_num;
+}
+
+static int __init check_and_get_sched_id(const char* scheduler_name)
+{
+    int sched_id = sched_get_id_by_name(scheduler_name);
+
+    if ( sched_id < 0 )
+        panic("Scheduler %s does not exists!\n", scheduler_name);
+
+    return sched_id;
+}
+
+void __init btcpupools_dtb_parse(void)
+{
+    const struct dt_device_node *chosen, *node;
+
+    if ( !acpi_disabled )
+        return;
+
+    chosen = dt_find_node_by_path("/chosen");
+    if ( !chosen )
+        panic("/chosen missing. Boot time cpupools can't be parsed from DT.\n");
+
+    dt_for_each_child_node(chosen, node)
+    {
+        const struct dt_device_node *phandle_node;
+        int sched_id = -1;
+        const char* scheduler_name;
+        unsigned int i = 0;
+
+        if ( !dt_device_is_compatible(node, "xen,cpupool") )
+            continue;
+
+        if ( !dt_property_read_string(node, "cpupool-sched", &scheduler_name) )
+            sched_id = check_and_get_sched_id(scheduler_name);
+
+        phandle_node = dt_parse_phandle(node, "cpupool-cpus", i++);
+        if ( !phandle_node )
+            panic("Missing or empty cpupool-cpus property!\n");
+
+        while ( phandle_node )
+        {
+            int cpu_num;
+
+            cpu_num = get_logical_cpu_from_cpu_node(phandle_node);
+
+            if ( cpu_num < 0 )
+                panic("Error retrieving logical cpu from node %s (%d)\n",
+                      dt_node_name(node), cpu_num);
+
+            if ( pool_cpu_map[cpu_num] != -1 )
+                panic("Logical cpu %d already added to a cpupool!\n", cpu_num);
+
+            pool_cpu_map[cpu_num] = next_pool_id;
+
+            phandle_node = dt_parse_phandle(node, "cpupool-cpus", i++);
+        }
+
+        /* Save scheduler choice for this cpupool id */
+        pool_sched_map[next_pool_id] = sched_id;
+
+        /* Let Xen generate pool ids */
+        next_pool_id++;
+    }
+}
+
+void __init btcpupools_allocate_pools(void)
+{
+    unsigned int i;
+    bool add_extra_cpupool = false;
+    int swap_id = -1;
+
+    /*
+     * If there are no cpupools, the value of next_pool_id is zero, so the code
+     * below will assign every cpu to cpupool0 as the default behavior.
+     * When there are cpupools, the code below is assigning all the not
+     * assigned cpu to a new pool (next_pool_id value is the last id + 1).
+     * In the same loop we check if there is any assigned cpu that is not
+     * online.
+     */
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpumask_test_cpu(i, &cpu_online_map) )
+        {
+            /* Unassigned cpu gets next_pool_id pool id value */
+            if ( pool_cpu_map[i] < 0 )
+            {
+                pool_cpu_map[i] = next_pool_id;
+                add_extra_cpupool = true;
+            }
+
+            /*
+             * Cpu0 must be in cpupool0, otherwise some operations like moving
+             * cpus between cpupools, cpu hotplug, destroying cpupools, shutdown
+             * of the host, might not work in a sane way.
+             */
+            if ( !i && (pool_cpu_map[0] != 0) )
+                swap_id = pool_cpu_map[0];
+
+            if ( swap_id != -1 )
+            {
+                if ( pool_cpu_map[i] == swap_id )
+                    pool_cpu_map[i] = 0;
+                else if ( pool_cpu_map[i] == 0 )
+                    pool_cpu_map[i] = swap_id;
+            }
+        }
+        else
+        {
+            if ( pool_cpu_map[i] >= 0 )
+                panic("Pool-%d contains cpu%u that is not online!\n",
+                      pool_cpu_map[i], i);
+        }
+    }
+
+    /* A swap happened, swap schedulers between cpupool id 0 and the other */
+    if ( swap_id != -1 )
+    {
+        int swap_sched = pool_sched_map[swap_id];
+
+        pool_sched_map[swap_id] = pool_sched_map[0];
+        pool_sched_map[0] = swap_sched;
+    }
+
+    if ( add_extra_cpupool )
+        next_pool_id++;
+
+    /* Create cpupools with selected schedulers */
+    for ( i = 0; i < next_pool_id; i++ )
+        cpupool_create_pool(i, pool_sched_map[i]);
+}
+
+unsigned int __init btcpupools_get_cpupool_id(unsigned int cpu)
+{
+    ASSERT((cpu < NR_CPUS) && (pool_cpu_map[cpu] >= 0));
+
+    printk(XENLOG_INFO "Logical CPU %u in Pool-%d (Scheduler id: %d).\n",
+           cpu, pool_cpu_map[cpu], pool_sched_map[pool_cpu_map[cpu]]);
+
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
index 89a891af7076..86a175f99cd5 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1247,12 +1247,22 @@ static int __init cf_check cpupool_init(void)
     cpupool_put(cpupool0);
     register_cpu_notifier(&cpu_nfb);
 
+    btcpupools_dtb_parse();
+
+    btcpupools_allocate_pools();
+
     spin_lock(&cpupool_lock);
 
     cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
 
     for_each_cpu ( cpu, &cpupool_free_cpus )
-        cpupool_assign_cpu_locked(cpupool0, cpu);
+    {
+        unsigned int pool_id = btcpupools_get_cpupool_id(cpu);
+        struct cpupool *pool = cpupool_find_by_id(pool_id);
+
+        ASSERT(pool);
+        cpupool_assign_cpu_locked(pool, cpu);
+    }
 
     spin_unlock(&cpupool_lock);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b527f141a1d3..453e98f1cba8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1178,6 +1178,20 @@ extern void cf_check dump_runq(unsigned char key);
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
 
+#ifdef CONFIG_BOOT_TIME_CPUPOOLS
+void btcpupools_allocate_pools(void);
+unsigned int btcpupools_get_cpupool_id(unsigned int cpu);
+void btcpupools_dtb_parse(void);
+
+#else /* !CONFIG_BOOT_TIME_CPUPOOLS */
+static inline void btcpupools_allocate_pools(void) {}
+static inline void btcpupools_dtb_parse(void) {}
+static inline unsigned int btcpupools_get_cpupool_id(unsigned int cpu)
+{
+    return 0;
+}
+#endif
+
 #endif /* __SCHED_H__ */
 
 /*
-- 
2.17.1



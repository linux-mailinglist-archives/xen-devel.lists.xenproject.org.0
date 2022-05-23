Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE7530C4B
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335623.559789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt48F-0005lR-6d; Mon, 23 May 2022 09:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335623.559789; Mon, 23 May 2022 09:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt48F-0005jA-2m; Mon, 23 May 2022 09:13:43 +0000
Received: by outflank-mailman (input) for mailman id 335623;
 Mon, 23 May 2022 09:13:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6LT=V7=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nt48D-0005j4-J8
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:13:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a244e8a8-da78-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 11:13:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34C95ED1;
 Mon, 23 May 2022 02:13:39 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.7.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDC263F73D;
 Mon, 23 May 2022 02:13:36 -0700 (PDT)
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
X-Inumbo-ID: a244e8a8-da78-11ec-837e-e5687231ffcc
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Allow setting the number of CPUs to activate at runtime
Date: Mon, 23 May 2022 11:13:24 +0200
Message-Id: <20220523091324.137350-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a command line parameter "maxcpus" on Arm to allow adjusting
the number of CPUs to activate. Currently the limit is defined by the
config option CONFIG_NR_CPUS. Such parameter already exists on x86.

Define a parameter "maxcpus" and a corresponding static variable
max_cpus in Arm smpboot.c. Modify function smp_get_max_cpus to take
max_cpus as a limit and to return proper unsigned int instead of int.

Take the opportunity to remove redundant variable cpus from start_xen
function and to directly assign the return value from smp_get_max_cpus
to nr_cpu_ids (global variable in Xen used to store the number of CPUs
actually activated).

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
max_cpus is also defined in x86 setup.c. It would be possible to join
these definitions in xen/common/cpu.c. However in that case, max_cpus
would become global which is not really what we want. There is already
global nr_cpu_ids used everywhere and max_cpus being used only in x86
start_xen and Arm smp_get_max_cpus should be kept local. Also there are
already lots of places in Xen using max_cpus (local versions) and that
would start to be hard to read (variable shadowing).
---
 docs/misc/xen-command-line.pandoc |  2 +-
 xen/arch/arm/include/asm/smp.h    |  2 +-
 xen/arch/arm/setup.c              | 10 ++++------
 xen/arch/arm/smpboot.c            | 18 ++++++++++++------
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dc7e1ca07..a40d0ae2e8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1651,7 +1651,7 @@ with **crashinfo_maxaddr**.
 Specify the threshold below which Xen will inform dom0 that the quantity of
 free memory is getting low.  Specifying `0` will disable this notification.
 
-### maxcpus (x86)
+### maxcpus
 > `= <integer>`
 
 Specify the maximum number of CPUs that should be brought up.
diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index 83c0cd6976..8133d5c295 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -33,7 +33,7 @@ extern void init_secondary(void);
 
 extern void smp_init_cpus(void);
 extern void smp_clear_cpu_maps (void);
-extern int smp_get_max_cpus (void);
+extern unsigned int smp_get_max_cpus(void);
 
 #define cpu_physical_id(cpu) cpu_logical_map(cpu)
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..b8d97950b7 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -862,11 +862,10 @@ void __init start_xen(unsigned long boot_phys_offset,
                       unsigned long fdt_paddr)
 {
     size_t fdt_size;
-    int cpus, i;
     const char *cmdline;
     struct bootmodule *xen_bootmodule;
     struct domain *d;
-    int rc;
+    int rc, i;
 
     dcache_line_bytes = read_dcache_line_bytes();
 
@@ -942,9 +941,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     processor_id();
 
     smp_init_cpus();
-    cpus = smp_get_max_cpus();
-    printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", cpus);
-    nr_cpu_ids = cpus;
+    nr_cpu_ids = smp_get_max_cpus();
+    printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
 
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
@@ -988,7 +986,7 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     for_each_present_cpu ( i )
     {
-        if ( (num_online_cpus() < cpus) && !cpu_online(i) )
+        if ( (num_online_cpus() < nr_cpu_ids) && !cpu_online(i) )
         {
             int ret = cpu_up(i);
             if ( ret != 0 )
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 9bb32a301a..22fede6600 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -43,6 +43,10 @@ cpumask_t cpu_possible_map;
 
 struct cpuinfo_arm cpu_data[NR_CPUS];
 
+/* maxcpus: maximum number of CPUs to activate. */
+static unsigned int __initdata max_cpus;
+integer_param("maxcpus", max_cpus);
+
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
@@ -277,16 +281,18 @@ void __init smp_init_cpus(void)
                     "unless the cpu affinity of all domains is specified.\n");
 }
 
-int __init
-smp_get_max_cpus (void)
+unsigned int __init smp_get_max_cpus(void)
 {
-    int i, max_cpus = 0;
+    unsigned int i, cpus = 0;
+
+    if ( ( !max_cpus ) || ( max_cpus > nr_cpu_ids ) )
+        max_cpus = nr_cpu_ids;
 
-    for ( i = 0; i < nr_cpu_ids; i++ )
+    for ( i = 0; i < max_cpus; i++ )
         if ( cpu_possible(i) )
-            max_cpus++;
+            cpus++;
 
-    return max_cpus;
+    return cpus;
 }
 
 void __init
-- 
2.25.1



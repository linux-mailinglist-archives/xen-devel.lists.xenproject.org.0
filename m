Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5E7EB5EC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633083.987633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfO-0000zz-Az; Tue, 14 Nov 2023 17:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633083.987633; Tue, 14 Nov 2023 17:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfO-0000vq-2Y; Tue, 14 Nov 2023 17:57:38 +0000
Received: by outflank-mailman (input) for mailman id 633083;
 Tue, 14 Nov 2023 17:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYe-0004mK-HN
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:40 +0000
Received: from 15.mo582.mail-out.ovh.net (15.mo582.mail-out.ovh.net
 [188.165.39.161]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 527d9d79-8316-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:50:39 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.4.8])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 0D89C28CB6
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:39 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 941FD1FD24;
 Tue, 14 Nov 2023 17:50:38 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id YKg/IW6zU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:38 +0000
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
X-Inumbo-ID: 527d9d79-8316-11ee-98db-6d05b1d4d9a1
Authentication-Results:garm.ovh; auth=pass (GARM-103G005c5ae1aa5-3e0a-4190-bdc1-8585046cde6c,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/9] x86: don't access x86_cpu_to_apicid[] directly, use cpu_physical_id(cpu)
Date: Tue, 14 Nov 2023 18:49:59 +0100
Message-ID: <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699982111.git.krystian.hebel@3mdeb.com>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12929553056991455600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevtdevieehieeiveekvefhlefftdfhteefueelhfdvhedtjeegkedugfefvdekffenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht

This is done in preparation to move data from x86_cpu_to_apicid[]
elsewhere.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/acpi/cpu_idle.c      |  4 ++--
 xen/arch/x86/acpi/lib.c           |  2 +-
 xen/arch/x86/apic.c               |  2 +-
 xen/arch/x86/cpu/mwait-idle.c     |  4 ++--
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/mpparse.c            |  6 +++---
 xen/arch/x86/numa.c               |  2 +-
 xen/arch/x86/platform_hypercall.c |  2 +-
 xen/arch/x86/setup.c              | 14 +++++++-------
 xen/arch/x86/smpboot.c            |  4 ++--
 xen/arch/x86/spec_ctrl.c          |  2 +-
 xen/arch/x86/sysctl.c             |  2 +-
 12 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index cfce4cc0408f..d03e54bcef38 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1256,7 +1256,7 @@ int get_cpu_id(u32 acpi_id)
 
     for ( i = 0; i < nr_cpu_ids; i++ )
     {
-        if ( apic_id == x86_cpu_to_apicid[i] )
+        if ( apic_id == cpu_physical_id(i) )
             return i;
     }
 
@@ -1362,7 +1362,7 @@ long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power)
 
     if ( !cpu_online(cpu_id) )
     {
-        uint32_t apic_id = x86_cpu_to_apicid[cpu_id];
+        uint32_t apic_id = cpu_physical_id(cpu_id);
 
         /*
          * If we've just learned of more available C states, wake the CPU if
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 51cb082ca02a..87a1f38f3f5a 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -91,7 +91,7 @@ unsigned int acpi_get_processor_id(unsigned int cpu)
 {
 	unsigned int acpiid, apicid;
 
-	if ((apicid = x86_cpu_to_apicid[cpu]) == BAD_APICID)
+	if ((apicid = cpu_physical_id(cpu)) == BAD_APICID)
 		return INVALID_ACPIID;
 
 	for (acpiid = 0; acpiid < ARRAY_SIZE(x86_acpiid_to_apicid); acpiid++)
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 6acdd0ec1468..63e18968e54c 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -950,7 +950,7 @@ __next:
      */
     if (boot_cpu_physical_apicid == -1U)
         boot_cpu_physical_apicid = get_apic_id();
-    x86_cpu_to_apicid[0] = get_apic_id();
+    cpu_physical_id(0) = get_apic_id();
 
     ioapic_init();
 }
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index ff5c808bc952..88168da8a0ca 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1202,8 +1202,8 @@ static void __init ivt_idle_state_table_update(void)
 	unsigned int cpu, max_apicid = boot_cpu_physical_apicid;
 
 	for_each_present_cpu(cpu)
-		if (max_apicid < x86_cpu_to_apicid[cpu])
-			max_apicid = x86_cpu_to_apicid[cpu];
+		if (max_apicid < cpu_physical_id(cpu))
+			max_apicid = cpu_physical_id(cpu);
 	switch (apicid_to_socket(max_apicid)) {
 	case 0: case 1:
 		/* 1 and 2 socket systems use default ivt_cstates */
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3712e36df930..f45437511a46 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1615,7 +1615,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
             break;
 
         cpu_id.phys_id =
-            (uint64_t)x86_cpu_to_apicid[v->vcpu_id] |
+            (uint64_t)cpu_physical_id(v->vcpu_id) |
             ((uint64_t)acpi_get_processor_id(v->vcpu_id) << 32);
 
         rc = -EFAULT;
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449c6..b8cabebe7bf9 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -187,7 +187,7 @@ static int MP_processor_info_x(struct mpc_config_processor *m,
 			       " Processor with apicid %i ignored\n", apicid);
 			return cpu;
 		}
-		x86_cpu_to_apicid[cpu] = apicid;
+		cpu_physical_id(cpu) = apicid;
 		cpumask_set_cpu(cpu, &cpu_present_map);
 	}
 
@@ -822,12 +822,12 @@ void mp_unregister_lapic(uint32_t apic_id, uint32_t cpu)
 	if (!cpu || (apic_id == boot_cpu_physical_apicid))
 		return;
 
-	if (x86_cpu_to_apicid[cpu] != apic_id)
+	if (cpu_physical_id(cpu) != apic_id)
 		return;
 
 	physid_clear(apic_id, phys_cpu_present_map);
 
-	x86_cpu_to_apicid[cpu] = BAD_APICID;
+	cpu_physical_id(cpu) = BAD_APICID;
 	cpumask_clear_cpu(cpu, &cpu_present_map);
 }
 
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 4b0b297c7e09..39e131cb4f35 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -70,7 +70,7 @@ void __init init_cpu_to_node(void)
 
     for ( i = 0; i < nr_cpu_ids; i++ )
     {
-        u32 apicid = x86_cpu_to_apicid[i];
+        u32 apicid = cpu_physical_id(i);
         if ( apicid == BAD_APICID )
             continue;
         node = apicid < MAX_LOCAL_APIC ? apicid_to_node[apicid] : NUMA_NO_NODE;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 9469de9045c7..9a52e048f67c 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -588,7 +588,7 @@ ret_t do_platform_op(
         }
         else
         {
-            g_info->apic_id = x86_cpu_to_apicid[g_info->xen_cpuid];
+            g_info->apic_id = cpu_physical_id(g_info->xen_cpuid);
             g_info->acpi_id = acpi_get_processor_id(g_info->xen_cpuid);
             ASSERT(g_info->apic_id != BAD_APICID);
             g_info->flags = 0;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1285969901e0..a19fe219bbf6 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -319,7 +319,7 @@ static void __init init_idle_domain(void)
 void srat_detect_node(int cpu)
 {
     nodeid_t node;
-    u32 apicid = x86_cpu_to_apicid[cpu];
+    u32 apicid = cpu_physical_id(cpu);
 
     node = apicid < MAX_LOCAL_APIC ? apicid_to_node[apicid] : NUMA_NO_NODE;
     if ( node == NUMA_NO_NODE )
@@ -346,7 +346,7 @@ static void __init normalise_cpu_order(void)
 
     for_each_present_cpu ( i )
     {
-        apicid = x86_cpu_to_apicid[i];
+        apicid = cpu_physical_id(i);
         min_diff = min_cpu = ~0u;
 
         /*
@@ -357,12 +357,12 @@ static void __init normalise_cpu_order(void)
               j < nr_cpu_ids;
               j = cpumask_next(j, &cpu_present_map) )
         {
-            diff = x86_cpu_to_apicid[j] ^ apicid;
+            diff = cpu_physical_id(j) ^ apicid;
             while ( diff & (diff-1) )
                 diff &= diff-1;
             if ( (diff < min_diff) ||
                  ((diff == min_diff) &&
-                  (x86_cpu_to_apicid[j] < x86_cpu_to_apicid[min_cpu])) )
+                  (cpu_physical_id(j) < cpu_physical_id(min_cpu))) )
             {
                 min_diff = diff;
                 min_cpu = j;
@@ -378,9 +378,9 @@ static void __init normalise_cpu_order(void)
 
         /* Switch the best-matching CPU with the next CPU in logical order. */
         j = cpumask_next(i, &cpu_present_map);
-        apicid = x86_cpu_to_apicid[min_cpu];
-        x86_cpu_to_apicid[min_cpu] = x86_cpu_to_apicid[j];
-        x86_cpu_to_apicid[j] = apicid;
+        apicid = cpu_physical_id(min_cpu);
+        cpu_physical_id(min_cpu) = cpu_physical_id(j);
+        cpu_physical_id(j) = apicid;
     }
 }
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 4c54ecbc91d7..de87c5a41926 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1154,7 +1154,7 @@ void __init smp_prepare_cpus(void)
     print_cpu_info(0);
 
     boot_cpu_physical_apicid = get_apic_id();
-    x86_cpu_to_apicid[0] = boot_cpu_physical_apicid;
+    cpu_physical_id(0) = boot_cpu_physical_apicid;
 
     stack_base[0] = (void *)((unsigned long)stack_start & ~(STACK_SIZE - 1));
 
@@ -1374,7 +1374,7 @@ int __cpu_up(unsigned int cpu)
 {
     int apicid, ret;
 
-    if ( (apicid = x86_cpu_to_apicid[cpu]) == BAD_APICID )
+    if ( (apicid = cpu_physical_id(cpu)) == BAD_APICID )
         return -ENODEV;
 
     if ( (!x2apic_enabled && apicid >= APIC_ALL_CPUS) ||
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index a8d8af22f6d8..d54c8d93cff0 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -589,7 +589,7 @@ static bool __init check_smt_enabled(void)
      * has a non-zero thread id component indicates that SMT is active.
      */
     for_each_present_cpu ( cpu )
-        if ( x86_cpu_to_apicid[cpu] & (boot_cpu_data.x86_num_siblings - 1) )
+        if ( cpu_physical_id(cpu) & (boot_cpu_data.x86_num_siblings - 1) )
             return true;
 
     return false;
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index c107f40c6283..67d8ab3f824a 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -58,7 +58,7 @@ static long cf_check smt_up_down_helper(void *data)
     for_each_present_cpu ( cpu )
     {
         /* Skip primary siblings (those whose thread id is 0). */
-        if ( !(x86_cpu_to_apicid[cpu] & sibling_mask) )
+        if ( !(cpu_physical_id(cpu) & sibling_mask) )
             continue;
 
         if ( !up && core_parking_remove(cpu) )
-- 
2.41.0



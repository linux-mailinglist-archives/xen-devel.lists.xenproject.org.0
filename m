Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937777EB5ED
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633095.987687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfS-0002DB-KE; Tue, 14 Nov 2023 17:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633095.987687; Tue, 14 Nov 2023 17:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfR-0001wp-JX; Tue, 14 Nov 2023 17:57:41 +0000
Received: by outflank-mailman (input) for mailman id 633095;
 Tue, 14 Nov 2023 17:50:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYi-0004mK-ID
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:44 +0000
Received: from 8.mo575.mail-out.ovh.net (8.mo575.mail-out.ovh.net
 [46.105.74.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cf22dc-8316-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:50:41 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.138.246])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4424B293D2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:41 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CBEAA1FDE8;
 Tue, 14 Nov 2023 17:50:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id SFnkLnCzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:40 +0000
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
X-Inumbo-ID: 53cf22dc-8316-11ee-98db-6d05b1d4d9a1
Authentication-Results:garm.ovh; auth=pass (GARM-103G005a4eb1ba5-6e31-46c5-bb87-74b65d95b45a,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 04/10] x86/smp: drop x86_cpu_to_apicid, use cpu_data[cpu].apicid instead
Date: Tue, 14 Nov 2023 18:50:03 +0100
Message-ID: <8121d9b472b305be751158aa3af3fed98ff0572e.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12930116006647343472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehleekveevvdfhgeetlefhjedtjefgjedtkeekffeitdffkeffueetkedtgfeiueenucffohhmrghinhepgiekiegpieegrdhssgenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Both fields held the same data.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/boot/x86_64.S           |  8 +++++---
 xen/arch/x86/include/asm/asm_defns.h |  2 +-
 xen/arch/x86/include/asm/processor.h |  2 ++
 xen/arch/x86/include/asm/smp.h       |  4 ----
 xen/arch/x86/numa.c                  | 15 +++++++--------
 xen/arch/x86/smpboot.c               |  8 ++++----
 xen/arch/x86/x86_64/asm-offsets.c    |  4 +++-
 7 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index b85b47b5c1a0..195550b5c0ea 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -20,15 +20,17 @@ ENTRY(__high_start)
         jz      .L_stack_set
 
         /* APs only: get stack base from APIC ID saved in %esp. */
-        mov     $-1, %rax
-        lea     x86_cpu_to_apicid(%rip), %rcx
+        mov     $0, %rax
+        lea     cpu_data(%rip), %rcx
+        /* cpu_data[0] is BSP, skip it. */
 1:
         add     $1, %rax
+        add     $CPUINFO_X86_sizeof, %rcx
         cmp     $NR_CPUS, %eax
         jb      2f
         hlt
 2:
-        cmp     %esp, (%rcx, %rax, 4)
+        cmp     %esp, CPUINFO_X86_apicid(%rcx)
         jne     1b
 
         /* %eax is now Xen CPU index. */
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index baaaccb26e17..6b05d9d140b8 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -158,7 +158,7 @@ register unsigned long current_stack_pointer asm("rsp");
 #endif
 
 #define CPUINFO_FEATURE_OFFSET(feature)           \
-    (CPUINFO_features + (cpufeat_word(feature) * 4))
+    (CPUINFO_X86_features + (cpufeat_word(feature) * 4))
 
 #else
 
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index b0d2a62c075f..8345d58094da 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -92,6 +92,8 @@ struct x86_cpu_id {
 extern struct cpuinfo_x86 cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
+#define cpu_physical_id(cpu)	cpu_data[cpu].apicid
+
 extern bool probe_cpuid_faulting(void);
 extern void ctxt_switch_levelling(const struct vcpu *next);
 extern void (*ctxt_switch_masking)(const struct vcpu *next);
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c0b5d7cdd8dd..94c557491860 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -39,10 +39,6 @@ extern void (*mtrr_hook) (void);
 
 extern void zap_low_mappings(void);
 
-extern u32 x86_cpu_to_apicid[];
-
-#define cpu_physical_id(cpu)	x86_cpu_to_apicid[cpu]
-
 #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
 extern void cpu_exit_clear(unsigned int cpu);
 extern void cpu_uninit(unsigned int cpu);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 39e131cb4f35..91527be5b406 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -54,14 +54,13 @@ bool __init arch_numa_unavailable(void)
 /*
  * Setup early cpu_to_node.
  *
- * Populate cpu_to_node[] only if x86_cpu_to_apicid[],
- * and apicid_to_node[] tables have valid entries for a CPU.
- * This means we skip cpu_to_node[] initialisation for NUMA
- * emulation and faking node case (when running a kernel compiled
- * for NUMA on a non NUMA box), which is OK as cpu_to_node[]
- * is already initialized in a round robin manner at numa_init_array,
- * prior to this call, and this initialization is good enough
- * for the fake NUMA cases.
+ * Populate cpu_to_node[] only if cpu_data[], and apicid_to_node[]
+ * tables have valid entries for a CPU. This means we skip
+ * cpu_to_node[] initialisation for NUMA emulation and faking node
+ * case (when running a kernel compiled for NUMA on a non NUMA box),
+ * which is OK as cpu_to_node[] is already initialized in a round
+ * robin manner at numa_init_array, prior to this call, and this
+ * initialization is good enough for the fake NUMA cases.
  */
 void __init init_cpu_to_node(void)
 {
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index de87c5a41926..f061486e56eb 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -61,10 +61,8 @@ unsigned int __read_mostly nr_sockets;
 cpumask_t **__read_mostly socket_cpumask;
 static cpumask_t *secondary_socket_cpumask;
 
-struct cpuinfo_x86 cpu_data[NR_CPUS];
-
-u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
-	{ [0 ... NR_CPUS-1] = BAD_APICID };
+struct cpuinfo_x86 cpu_data[NR_CPUS] =
+        { [0 ... NR_CPUS-1] .apicid = BAD_APICID };
 
 static int cpu_error;
 static enum cpu_state {
@@ -81,7 +79,9 @@ void *stack_base[NR_CPUS];
 
 void initialize_cpu_data(unsigned int cpu)
 {
+    uint32_t apicid = cpu_physical_id(cpu);
     cpu_data[cpu] = boot_cpu_data;
+    cpu_physical_id(cpu) = apicid;
 }
 
 static bool smp_store_cpu_info(unsigned int id)
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 57b73a4e6214..e881cd5de0a0 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -159,7 +159,9 @@ void __dummy__(void)
     OFFSET(IRQSTAT_softirq_pending, irq_cpustat_t, __softirq_pending);
     BLANK();
 
-    OFFSET(CPUINFO_features, struct cpuinfo_x86, x86_capability);
+    OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);
+    OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
+    DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
     BLANK();
 
     OFFSET(MB_flags, multiboot_info_t, flags);
-- 
2.41.0



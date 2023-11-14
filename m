Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3FF7EB5E9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:57:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633096.987693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfT-0002c9-B1; Tue, 14 Nov 2023 17:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633096.987693; Tue, 14 Nov 2023 17:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfS-0002CH-Ud; Tue, 14 Nov 2023 17:57:42 +0000
Received: by outflank-mailman (input) for mailman id 633096;
 Tue, 14 Nov 2023 17:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYj-0004wk-7W
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:45 +0000
Received: from 9.mo575.mail-out.ovh.net (9.mo575.mail-out.ovh.net
 [46.105.78.111]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 550bf8cc-8316-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 18:50:43 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.138.246])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 515E429385
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:43 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 98AB31FDF1;
 Tue, 14 Nov 2023 17:50:42 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id kPhUInKzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:42 +0000
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
X-Inumbo-ID: 550bf8cc-8316-11ee-9b0e-b553b5be7939
Authentication-Results:garm.ovh; auth=pass (GARM-103G005f5dee295-d4f4-4524-b5c3-7761c38da2df,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 05/10] x86/smp: move stack_base to cpu_data
Date: Tue, 14 Nov 2023 18:50:06 +0100
Message-ID: <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12930678958905928138
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehleekveevvdfhgeetlefhjedtjefgjedtkeekffeitdffkeffueetkedtgfeiueenucffohhmrghinhepgiekiegpieegrdhssgenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

This location is easier to access from assembly. Having it close to
other data required during initialization has also positive (although
rather small) impact on prefetching data from RAM.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/boot/x86_64.S            |  5 ++---
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/smp.h        |  2 +-
 xen/arch/x86/setup.c                  |  6 +++---
 xen/arch/x86/smpboot.c                | 25 +++++++++++++------------
 xen/arch/x86/traps.c                  |  4 ++--
 xen/arch/x86/x86_64/asm-offsets.c     |  1 +
 xen/include/xen/smp.h                 |  2 --
 8 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 195550b5c0ea..8d61f270761f 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -33,9 +33,8 @@ ENTRY(__high_start)
         cmp     %esp, CPUINFO_X86_apicid(%rcx)
         jne     1b
 
-        /* %eax is now Xen CPU index. */
-        lea     stack_base(%rip), %rcx
-        mov     (%rcx, %rax, 8), %rsp
+        /* %rcx is now cpu_data[cpu], read stack base from it. */
+        mov     CPUINFO_X86_stack_base(%rcx), %rsp
 
         test    %rsp,%rsp
         jnz     1f
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 06e1dd7f3332..ff0e18864cc7 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -37,6 +37,7 @@ struct cpuinfo_x86 {
     unsigned int phys_proc_id;         /* package ID of each logical CPU */
     unsigned int cpu_core_id;          /* core ID of each logical CPU */
     unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
+    void *stack_base;
     unsigned short x86_clflush_size;
 } __cacheline_aligned;
 
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index 94c557491860..98739028a6ed 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -69,7 +69,7 @@ extern cpumask_t **socket_cpumask;
  * by certain scheduling code only.
  */
 #define get_cpu_current(cpu) \
-    (get_cpu_info_from_stack((unsigned long)stack_base[cpu])->current_vcpu)
+    (get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base)->current_vcpu)
 
 extern unsigned int disabled_cpus;
 extern bool unaccounted_cpus;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a19fe219bbf6..b2c0679725ea 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -798,7 +798,7 @@ static void __init noreturn reinit_bsp_stack(void)
     /* Update SYSCALL trampolines */
     percpu_traps_init();
 
-    stack_base[0] = stack;
+    cpu_data[0].stack_base = stack;
 
     rc = setup_cpu_root_pgt(0);
     if ( rc )
@@ -1959,8 +1959,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             /* Set up node_to_cpumask based on cpu_to_node[]. */
             numa_add_cpu(i);
 
-            if ( stack_base[i] == NULL )
-                stack_base[i] = cpu_alloc_stack(i);
+            if ( cpu_data[i].stack_base == NULL )
+                cpu_data[i].stack_base = cpu_alloc_stack(i);
         }
 
         for_each_present_cpu ( i )
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index f061486e56eb..8ae65ab1769f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -75,13 +75,15 @@ static enum cpu_state {
 } cpu_state;
 #define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
 
-void *stack_base[NR_CPUS];
-
 void initialize_cpu_data(unsigned int cpu)
 {
     uint32_t apicid = cpu_physical_id(cpu);
+    void *stack = cpu_data[cpu].stack_base;
+
     cpu_data[cpu] = boot_cpu_data;
+
     cpu_physical_id(cpu) = apicid;
+    cpu_data[cpu].stack_base = stack;
 }
 
 static bool smp_store_cpu_info(unsigned int id)
@@ -579,8 +581,6 @@ static int do_boot_cpu(int apicid, int cpu)
         printk("Booting processor %d/%d eip %lx\n",
                cpu, apicid, start_eip);
 
-    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
-
     /* This grunge runs the startup process for the targeted processor. */
 
     set_cpu_state(CPU_STATE_INIT);
@@ -856,7 +856,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
 
     /* Install direct map page table entries for stack, IDT, and TSS. */
     for ( off = rc = 0; !rc && off < STACK_SIZE; off += PAGE_SIZE )
-        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
+        rc = clone_mapping(__va(__pa(cpu_data[cpu].stack_base)) + off, rpt);
 
     if ( !rc )
         rc = clone_mapping(idt_tables[cpu], rpt);
@@ -1007,10 +1007,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
         FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
         FREE_XENHEAP_PAGE(idt_tables[cpu]);
 
-        if ( stack_base[cpu] )
+        if ( cpu_data[cpu].stack_base )
         {
-            memguard_unguard_stack(stack_base[cpu]);
-            FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
+            memguard_unguard_stack(cpu_data[cpu].stack_base);
+            FREE_XENHEAP_PAGES(cpu_data[cpu].stack_base, STACK_ORDER);
         }
     }
 }
@@ -1044,11 +1044,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     if ( node != NUMA_NO_NODE )
         memflags = MEMF_node(node);
 
-    if ( stack_base[cpu] == NULL &&
-         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
+    if ( cpu_data[cpu].stack_base == NULL &&
+         (cpu_data[cpu].stack_base = cpu_alloc_stack(cpu)) == NULL )
             goto out;
 
-    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
+    info = get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base);
     info->processor_id = cpu;
     info->per_cpu_offset = __per_cpu_offset[cpu];
 
@@ -1156,7 +1156,8 @@ void __init smp_prepare_cpus(void)
     boot_cpu_physical_apicid = get_apic_id();
     cpu_physical_id(0) = boot_cpu_physical_apicid;
 
-    stack_base[0] = (void *)((unsigned long)stack_start & ~(STACK_SIZE - 1));
+    cpu_data[0].stack_base = (void *)
+             ((unsigned long)stack_start & ~(STACK_SIZE - 1));
 
     set_nr_sockets();
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e1356f696aba..90d9201d1c52 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -611,9 +611,9 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
     unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
     unsigned long esp_top, esp_bottom;
 
-    if ( _p(curr_stack_base) != stack_base[cpu] )
+    if ( _p(curr_stack_base) != cpu_data[cpu].stack_base )
         printk("Current stack base %p differs from expected %p\n",
-               _p(curr_stack_base), stack_base[cpu]);
+               _p(curr_stack_base), cpu_data[cpu].stack_base);
 
     esp_bottom = (esp | (STACK_SIZE - 1)) + 1;
     esp_top    = esp_bottom - PRIMARY_STACK_SIZE;
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index e881cd5de0a0..d81a30344677 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -161,6 +161,7 @@ void __dummy__(void)
 
     OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);
     OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
+    OFFSET(CPUINFO_X86_stack_base, struct cpuinfo_x86, stack_base);
     DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
     BLANK();
 
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 0a9219173f0f..994fdc474200 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -67,8 +67,6 @@ void smp_send_call_function_mask(const cpumask_t *mask);
 
 int alloc_cpu_id(void);
 
-extern void *stack_base[NR_CPUS];
-
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
 
-- 
2.41.0



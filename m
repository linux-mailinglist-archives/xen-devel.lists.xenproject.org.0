Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03677EB5EF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633082.987629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfO-0000wa-4h; Tue, 14 Nov 2023 17:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633082.987629; Tue, 14 Nov 2023 17:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfN-0000kh-PF; Tue, 14 Nov 2023 17:57:37 +0000
Received: by outflank-mailman (input) for mailman id 633082;
 Tue, 14 Nov 2023 17:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYd-0004wk-SW
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:39 +0000
Received: from 16.mo582.mail-out.ovh.net (16.mo582.mail-out.ovh.net
 [87.98.139.208]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517bd937-8316-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 18:50:37 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.4.8])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 5C26D26EB0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CF8D91FD62;
 Tue, 14 Nov 2023 17:50:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id UOZsL2yzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:36 +0000
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
X-Inumbo-ID: 517bd937-8316-11ee-9b0e-b553b5be7939
Authentication-Results:garm.ovh; auth=pass (GARM-103G005b6c621e7-3c4f-4807-9890-c48c536404fa,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/smp: make cpu_state per-CPU
Date: Tue, 14 Nov 2023 18:49:56 +0100
Message-ID: <52083114d4cbbc75f021e8c61763ad0e166cf05b.1699981241.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981241.git.krystian.hebel@3mdeb.com>
References: <cover.1699981241.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12928990108247959920
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevtdevieehieeiveekvefhlefftdfhteefueelhfdvhedtjeegkedugfefvdekffenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht

This will be used for parallel AP bring-up.

CPU_STATE_INIT changed direction. It was previously set by BSP and never
consumed by AP. Now it signals that AP got through assembly part of
initialization and waits for BSP to call notifiers that set up data
structures required for further initialization.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/smpboot.c                | 80 ++++++++++++++++-----------
 2 files changed, 49 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ff0e18864cc7..1831b5fb368f 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -38,6 +38,7 @@ struct cpuinfo_x86 {
     unsigned int cpu_core_id;          /* core ID of each logical CPU */
     unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
     void *stack_base;
+    unsigned int cpu_state;
     unsigned short x86_clflush_size;
 } __cacheline_aligned;
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 39ffd356dbbc..cbea2d45f70d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -65,15 +65,18 @@ struct cpuinfo_x86 cpu_data[NR_CPUS] =
         { [0 ... NR_CPUS-1] .apicid = BAD_APICID };
 
 static int cpu_error;
-static enum cpu_state {
+enum cpu_state {
     CPU_STATE_DYING,    /* slave -> master: I am dying */
     CPU_STATE_DEAD,     /* slave -> master: I am completely dead */
-    CPU_STATE_INIT,     /* master -> slave: Early bringup phase 1 */
-    CPU_STATE_CALLOUT,  /* master -> slave: Early bringup phase 2 */
+    CPU_STATE_INIT,     /* slave -> master: Early bringup phase 1 completed */
+    CPU_STATE_CALLOUT,  /* master -> slave: Start early bringup phase 2 */
     CPU_STATE_CALLIN,   /* slave -> master: Completed phase 2 */
     CPU_STATE_ONLINE    /* master -> slave: Go fully online now. */
-} cpu_state;
-#define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
+};
+#define set_cpu_state(cpu, state) do { \
+    smp_mb(); \
+    cpu_data[cpu].cpu_state = (state); \
+} while (0)
 
 void initialize_cpu_data(unsigned int cpu)
 {
@@ -168,16 +171,7 @@ static void synchronize_tsc_slave(unsigned int slave)
 static void smp_callin(void)
 {
     unsigned int cpu = smp_processor_id();
-    int i, rc;
-
-    /* Wait 2s total for startup. */
-    Dprintk("Waiting for CALLOUT.\n");
-    for ( i = 0; cpu_state != CPU_STATE_CALLOUT; i++ )
-    {
-        BUG_ON(i >= 200);
-        cpu_relax();
-        mdelay(10);
-    }
+    int rc;
 
     /*
      * The boot CPU has finished the init stage and is spinning on cpu_state
@@ -213,12 +207,12 @@ static void smp_callin(void)
     }
 
     /* Allow the master to continue. */
-    set_cpu_state(CPU_STATE_CALLIN);
+    set_cpu_state(cpu, CPU_STATE_CALLIN);
 
     synchronize_tsc_slave(cpu);
 
     /* And wait for our final Ack. */
-    while ( cpu_state != CPU_STATE_ONLINE )
+    while ( cpu_data[cpu].cpu_state != CPU_STATE_ONLINE )
         cpu_relax();
 }
 
@@ -313,6 +307,9 @@ void start_secondary(unsigned int cpu)
 {
     struct cpu_info *info = get_cpu_info();
 
+    /* Tell BSP that we are awake. */
+    set_cpu_state(cpu, CPU_STATE_INIT);
+
     /*
      * Don't put anything before smp_callin(), SMP booting is so fragile that we
      * want to limit the things done here to the most necessary things.
@@ -320,6 +317,10 @@ void start_secondary(unsigned int cpu)
 
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
+    /* Wait until data set up by CPU_UP_PREPARE notifiers is ready. */
+    while ( cpu_data[cpu].cpu_state != CPU_STATE_CALLOUT )
+        cpu_relax();
+
     set_current(idle_vcpu[cpu]);
     this_cpu(curr_vcpu) = idle_vcpu[cpu];
     rdmsrl(MSR_EFER, this_cpu(efer));
@@ -585,26 +586,35 @@ static int do_boot_cpu(int apicid, int cpu)
 
     /* This grunge runs the startup process for the targeted processor. */
 
-    set_cpu_state(CPU_STATE_INIT);
-
     /* Starting actual IPI sequence... */
     boot_error = wakeup_secondary_cpu(apicid, start_eip);
 
     if ( !boot_error )
     {
-        /* Allow AP to start initializing. */
-        set_cpu_state(CPU_STATE_CALLOUT);
-        Dprintk("After Callout %d.\n", cpu);
-
-        /* Wait 5s total for a response. */
-        for ( timeout = 0; timeout < 50000; timeout++ )
+        /* Wait 2s total for a response. */
+        for ( timeout = 0; timeout < 20000; timeout++ )
         {
-            if ( cpu_state != CPU_STATE_CALLOUT )
+            if ( cpu_data[cpu].cpu_state == CPU_STATE_INIT )
                 break;
             udelay(100);
         }
 
-        if ( cpu_state == CPU_STATE_CALLIN )
+        if ( cpu_data[cpu].cpu_state == CPU_STATE_INIT )
+        {
+            /* Allow AP to start initializing. */
+            set_cpu_state(cpu, CPU_STATE_CALLOUT);
+            Dprintk("After Callout %d.\n", cpu);
+
+            /* Wait 5s total for a response. */
+            for ( timeout = 0; timeout < 500000; timeout++ )
+            {
+                if ( cpu_data[cpu].cpu_state != CPU_STATE_CALLOUT )
+                    break;
+                udelay(10);
+            }
+        }
+
+        if ( cpu_data[cpu].cpu_state == CPU_STATE_CALLIN )
         {
             /* number CPUs logically, starting from 1 (BSP is 0) */
             Dprintk("OK.\n");
@@ -612,7 +622,7 @@ static int do_boot_cpu(int apicid, int cpu)
             synchronize_tsc_master(cpu);
             Dprintk("CPU has booted.\n");
         }
-        else if ( cpu_state == CPU_STATE_DEAD )
+        else if ( cpu_data[cpu].cpu_state == CPU_STATE_DEAD )
         {
             smp_rmb();
             rc = cpu_error;
@@ -683,7 +693,7 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
 void cpu_exit_clear(unsigned int cpu)
 {
     cpu_uninit(cpu);
-    set_cpu_state(CPU_STATE_DEAD);
+    set_cpu_state(cpu, CPU_STATE_DEAD);
 }
 
 static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
@@ -1161,6 +1171,12 @@ void __init smp_prepare_cpus(void)
     cpu_data[0].stack_base = (void *)
              ((unsigned long)stack_start & ~(STACK_SIZE - 1));
 
+    /* Set state as CALLOUT so APs won't change it in initialize_cpu_data() */
+    boot_cpu_data.cpu_state = CPU_STATE_CALLOUT;
+
+    /* Not really used anywhere, but set it just in case. */
+    set_cpu_state(0, CPU_STATE_ONLINE);
+
     set_nr_sockets();
 
     socket_cpumask = xzalloc_array(cpumask_t *, nr_sockets);
@@ -1267,7 +1283,7 @@ void __cpu_disable(void)
 {
     int cpu = smp_processor_id();
 
-    set_cpu_state(CPU_STATE_DYING);
+    set_cpu_state(cpu, CPU_STATE_DYING);
 
     local_irq_disable();
     clear_local_APIC();
@@ -1292,7 +1308,7 @@ void __cpu_die(unsigned int cpu)
     unsigned int i = 0;
     enum cpu_state seen_state;
 
-    while ( (seen_state = cpu_state) != CPU_STATE_DEAD )
+    while ( (seen_state = cpu_data[cpu].cpu_state) != CPU_STATE_DEAD )
     {
         BUG_ON(seen_state != CPU_STATE_DYING);
         mdelay(100);
@@ -1393,7 +1409,7 @@ int __cpu_up(unsigned int cpu)
 
     time_latch_stamps();
 
-    set_cpu_state(CPU_STATE_ONLINE);
+    set_cpu_state(cpu, CPU_STATE_ONLINE);
     while ( !cpu_online(cpu) )
     {
         cpu_relax();
-- 
2.41.0



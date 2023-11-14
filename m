Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14E7EB5F9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633113.987765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xfh-0005WV-4U; Tue, 14 Nov 2023 17:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633113.987765; Tue, 14 Nov 2023 17:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xff-0004ve-5J; Tue, 14 Nov 2023 17:57:55 +0000
Received: by outflank-mailman (input) for mailman id 633113;
 Tue, 14 Nov 2023 17:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYo-0004wk-7B
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:50 +0000
Received: from 13.mo583.mail-out.ovh.net (13.mo583.mail-out.ovh.net
 [87.98.182.191]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f77c3e-8316-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 18:50:48 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.4.72])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 2550C22568
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:48 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AD48F1FE6E;
 Tue, 14 Nov 2023 17:50:47 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id 2KhrJ3ezU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:47 +0000
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
X-Inumbo-ID: 57f77c3e-8316-11ee-9b0e-b553b5be7939
Authentication-Results:garm.ovh; auth=pass (GARM-103G0050fe57c42-e597-4370-9d51-01f9505c8609,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 9/9] x86/smp: start APs in parallel during boot
Date: Tue, 14 Nov 2023 18:50:14 +0100
Message-ID: <77c9199eabf3a30ebcf89356b2dd35abd611a3a9.1699982111.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699982111.git.krystian.hebel@3mdeb.com>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12932086332910971248
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevtdevieehieeiveekvefhlefftdfhteefueelhfdvhedtjeegkedugfefvdekffenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht

Multiple delays are required when sending IPIs and waiting for
responses. During boot, 4 such IPIs were sent per each AP. With this
change, only one set of broadcast IPIs is sent. This reduces boot time,
especially for platforms with large number of cores.

Single CPU initialization is still possible, it is used for hotplug.

During wakeup from S3 APs are started one by one. It should be possible
to enable parallel execution there as well, but I don't have a way of
properly testing it as of now.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/include/asm/smp.h |  1 +
 xen/arch/x86/setup.c           |  2 +
 xen/arch/x86/smpboot.c         | 68 ++++++++++++++++++++++++----------
 3 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index 98739028a6ed..6ca0158a368d 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -31,6 +31,7 @@ DECLARE_PER_CPU(cpumask_var_t, send_ipi_cpumask);
 extern bool park_offline_cpus;
 
 void smp_send_nmi_allbutself(void);
+void smp_send_init_sipi_sipi_allbutself(void);
 
 void send_IPI_mask(const cpumask_t *, int vector);
 void send_IPI_self(int vector);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b2c0679725ea..42a9067b81eb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1963,6 +1963,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 cpu_data[i].stack_base = cpu_alloc_stack(i);
         }
 
+        smp_send_init_sipi_sipi_allbutself();
+
         for_each_present_cpu ( i )
         {
             if ( (park_offline_cpus || num_online_cpus() < max_cpus) &&
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index cbea2d45f70d..e9a7f78a5a6f 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -425,7 +425,7 @@ void start_secondary(unsigned int cpu)
 
 static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
-    unsigned long send_status = 0, accept_status = 0;
+    unsigned long send_status = 0, accept_status = 0, sh = 0;
     int maxlvt, timeout, i;
 
     /*
@@ -445,6 +445,12 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
         return 0;
 
+    /*
+     * Use destination shorthand for broadcasting IPIs during boot.
+     */
+    if ( phys_apicid == BAD_APICID )
+        sh = APIC_DEST_ALLBUT;
+
     /*
      * Be paranoid about clearing APIC errors.
      */
@@ -458,7 +464,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
         /*
          * Turn INIT on target chip via IPI
          */
-        apic_icr_write(APIC_INT_LEVELTRIG | APIC_INT_ASSERT | APIC_DM_INIT,
+        apic_icr_write(APIC_INT_LEVELTRIG | APIC_INT_ASSERT | APIC_DM_INIT | sh,
                        phys_apicid);
 
         if ( !x2apic_enabled )
@@ -475,7 +481,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 
             Dprintk("Deasserting INIT.\n");
 
-            apic_icr_write(APIC_INT_LEVELTRIG | APIC_DM_INIT, phys_apicid);
+            apic_icr_write(APIC_INT_LEVELTRIG | APIC_DM_INIT | sh, phys_apicid);
 
             Dprintk("Waiting for send to finish...\n");
             timeout = 0;
@@ -512,7 +518,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
          * STARTUP IPI
          * Boot on the stack
          */
-        apic_icr_write(APIC_DM_STARTUP | (start_eip >> 12), phys_apicid);
+        apic_icr_write(APIC_DM_STARTUP | (start_eip >> 12) | sh, phys_apicid);
 
         if ( !x2apic_enabled )
         {
@@ -565,7 +571,6 @@ int alloc_cpu_id(void)
 static int do_boot_cpu(int apicid, int cpu)
 {
     int timeout, boot_error = 0, rc = 0;
-    unsigned long start_eip;
 
     /*
      * Save current MTRR state in case it was changed since early boot
@@ -573,21 +578,31 @@ static int do_boot_cpu(int apicid, int cpu)
      */
     mtrr_save_state();
 
-    start_eip = bootsym_phys(trampoline_realmode_entry);
+    /* Check if AP is already up. */
+    if ( cpu_data[cpu].cpu_state != CPU_STATE_INIT )
+    {
+        /* This grunge runs the startup process for the targeted processor. */
+        unsigned long start_eip;
+        start_eip = bootsym_phys(trampoline_realmode_entry);
 
-    /* start_eip needs be page aligned, and below the 1M boundary. */
-    if ( start_eip & ~0xff000 )
-        panic("AP trampoline %#lx not suitably positioned\n", start_eip);
+        /* start_eip needs be page aligned, and below the 1M boundary. */
+        if ( start_eip & ~0xff000 )
+            panic("AP trampoline %#lx not suitably positioned\n", start_eip);
 
-    /* So we see what's up   */
-    if ( opt_cpu_info )
-        printk("Booting processor %d/%d eip %lx\n",
-               cpu, apicid, start_eip);
+        /* So we see what's up   */
+        if ( opt_cpu_info )
+            printk("AP trampoline at %lx\n", start_eip);
 
-    /* This grunge runs the startup process for the targeted processor. */
+        /* mark "stuck" area as not stuck */
+        bootsym(trampoline_cpu_started) = 0;
+        smp_mb();
 
-    /* Starting actual IPI sequence... */
-    boot_error = wakeup_secondary_cpu(apicid, start_eip);
+        /* Starting actual IPI sequence... */
+        boot_error = wakeup_secondary_cpu(apicid, start_eip);
+    }
+
+    if ( opt_cpu_info )
+        printk("Booting processor %d/%d\n", cpu, apicid);
 
     if ( !boot_error )
     {
@@ -646,10 +661,6 @@ static int do_boot_cpu(int apicid, int cpu)
         rc = -EIO;
     }
 
-    /* mark "stuck" area as not stuck */
-    bootsym(trampoline_cpu_started) = 0;
-    smp_mb();
-
     return rc;
 }
 
@@ -1155,6 +1166,23 @@ static struct notifier_block cpu_smpboot_nfb = {
     .notifier_call = cpu_smpboot_callback
 };
 
+void smp_send_init_sipi_sipi_allbutself(void)
+{
+    unsigned long start_eip;
+    start_eip = bootsym_phys(trampoline_realmode_entry);
+
+    /* start_eip needs be page aligned, and below the 1M boundary. */
+    if ( start_eip & ~0xff000 )
+        panic("AP trampoline %#lx not suitably positioned\n", start_eip);
+
+    /* So we see what's up   */
+    if ( opt_cpu_info )
+        printk("Booting APs in parallel, eip %lx\n", start_eip);
+
+    /* Starting actual broadcast IPI sequence... */
+    wakeup_secondary_cpu(BAD_APICID, start_eip);
+}
+
 void __init smp_prepare_cpus(void)
 {
     register_cpu_notifier(&cpu_smpboot_nfb);
-- 
2.41.0



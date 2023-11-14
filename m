Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FF7EB5FC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 18:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633141.987794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xh0-0003GB-BX; Tue, 14 Nov 2023 17:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633141.987794; Tue, 14 Nov 2023 17:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2xh0-0003DG-8G; Tue, 14 Nov 2023 17:59:18 +0000
Received: by outflank-mailman (input) for mailman id 633141;
 Tue, 14 Nov 2023 17:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HBD=G3=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1r2xYm-0004mK-J6
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 17:50:48 +0000
Received: from 2.mo575.mail-out.ovh.net (2.mo575.mail-out.ovh.net
 [46.105.52.162]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56e500ac-8316-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 18:50:46 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.1.219])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 6591E291FE
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 17:50:46 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x5j2z (unknown [10.110.115.90])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D435F1FE62;
 Tue, 14 Nov 2023 17:50:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-x5j2z with ESMTPSA
 id wKTdMHWzU2V/lwcATVRwWg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 14 Nov 2023 17:50:45 +0000
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
X-Inumbo-ID: 56e500ac-8316-11ee-98db-6d05b1d4d9a1
Authentication-Results:garm.ovh; auth=pass (GARM-103G0050aa832c6-640f-4b02-9663-a128ddce512f,
                    1C6EC45AC3E1968723EBE40916FD99D0F8B07574) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: Krystian Hebel <krystian.hebel@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Krystian Hebel <krystian.hebel@3mdeb.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 08/10] x86/smp: drop booting_cpu variable
Date: Tue, 14 Nov 2023 18:50:11 +0100
Message-ID: <22109ebd7edef1140cb438a6ec5fa1726cdf2c12.1699981248.git.krystian.hebel@3mdeb.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699981248.git.krystian.hebel@3mdeb.com>
References: <cover.1699981248.git.krystian.hebel@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12931523382006163824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudeffedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehleekveevvdfhgeetlefhjedtjefgjedtkeekffeitdffkeffueetkedtgfeiueenucffohhmrghinhepgiekiegpieegrdhssgenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

CPU id is obtained as a side effect of searching for appropriate
stack for AP. It can be used as a parameter to start_secondary().
Coincidentally this also makes further work on making AP bring-up
code parallel easier.

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
---
 xen/arch/x86/boot/x86_64.S | 13 +++++++++----
 xen/arch/x86/smpboot.c     | 15 +++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 8d61f270761f..ad01f20d548d 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -20,20 +20,24 @@ ENTRY(__high_start)
         jz      .L_stack_set
 
         /* APs only: get stack base from APIC ID saved in %esp. */
-        mov     $0, %rax
+        mov     $0, %rbx
         lea     cpu_data(%rip), %rcx
         /* cpu_data[0] is BSP, skip it. */
 1:
-        add     $1, %rax
+        add     $1, %rbx
         add     $CPUINFO_X86_sizeof, %rcx
-        cmp     $NR_CPUS, %eax
+        cmp     $NR_CPUS, %rbx
         jb      2f
         hlt
 2:
         cmp     %esp, CPUINFO_X86_apicid(%rcx)
         jne     1b
 
-        /* %rcx is now cpu_data[cpu], read stack base from it. */
+        /*
+         * At this point:
+         * - %rcx is cpu_data[cpu], read stack base from it,
+         * - %rbx (callee-save) is Xen cpu number, pass it to start_secondary().
+         */
         mov     CPUINFO_X86_stack_base(%rcx), %rsp
 
         test    %rsp,%rsp
@@ -101,6 +105,7 @@ ENTRY(__high_start)
 .L_ap_cet_done:
 #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
 
+        mov     %rbx, %rdi
         tailcall start_secondary
 
 .L_bsp:
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index a3895dafa267..39ffd356dbbc 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -222,8 +222,6 @@ static void smp_callin(void)
         cpu_relax();
 }
 
-static int booting_cpu;
-
 /* CPUs for which sibling maps can be computed. */
 static cpumask_t cpu_sibling_setup_map;
 
@@ -311,15 +309,14 @@ static void set_cpu_sibling_map(unsigned int cpu)
     }
 }
 
-void start_secondary(void *unused)
+void start_secondary(unsigned int cpu)
 {
     struct cpu_info *info = get_cpu_info();
 
     /*
-     * Dont put anything before smp_callin(), SMP booting is so fragile that we
+     * Don't put anything before smp_callin(), SMP booting is so fragile that we
      * want to limit the things done here to the most necessary things.
      */
-    unsigned int cpu = booting_cpu;
 
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
@@ -346,9 +343,9 @@ void start_secondary(void *unused)
      */
     spin_debug_disable();
 
-    get_cpu_info()->use_pv_cr3 = false;
-    get_cpu_info()->xen_cr3 = 0;
-    get_cpu_info()->pv_cr3 = 0;
+    info->use_pv_cr3 = false;
+    info->xen_cr3 = 0;
+    info->pv_cr3 = 0;
 
     /*
      * BUG_ON() used in load_system_tables() and later code may end up calling
@@ -575,8 +572,6 @@ static int do_boot_cpu(int apicid, int cpu)
      */
     mtrr_save_state();
 
-    booting_cpu = cpu;
-
     start_eip = bootsym_phys(trampoline_realmode_entry);
 
     /* start_eip needs be page aligned, and below the 1M boundary. */
-- 
2.41.0



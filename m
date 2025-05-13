Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70EAB5AD2
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983265.1369655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9c-0002Rc-2q; Tue, 13 May 2025 17:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983265.1369655; Tue, 13 May 2025 17:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt9b-0002OR-TZ; Tue, 13 May 2025 17:10:55 +0000
Received: by outflank-mailman (input) for mailman id 983265;
 Tue, 13 May 2025 17:10:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt5v-0003Mm-MA
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:07:07 +0000
Received: from 5.mo550.mail-out.ovh.net (5.mo550.mail-out.ovh.net
 [178.33.45.107]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2577972-301c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:07:06 +0200 (CEST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.157])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZK4lbhz1ZM1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:07:05 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tcckm (unknown [10.111.174.188])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A2E411FE80;
 Tue, 13 May 2025 17:07:04 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-5b5ff79f4f-tcckm with ESMTPSA
 id y6nVFzh8I2iTAAAAAykbXw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:07:04 +0000
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
X-Inumbo-ID: b2577972-301c-11f0-9eb6-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-101G004fda5cd54-5ed0-4765-9b19-9543bb7b2daa,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 15/22] x86/smpboot.c: TXT AP bringup
Date: Tue, 13 May 2025 20:05:52 +0300
Message-ID: <8319423a25ace730472a219593d6ddbf2cc05a3f.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8951185736398910620
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeggeeuvddvtedtteevudejjeeitdefhfetkeeggeffffelfeeivdffudeltdeihfenucffohhmrghinhepthhrrghmphholhhinhgvrdhssgenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehhedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=v6gFLoGxI5ES25EOdUe8CFrJ+DdQzcda3zZtZ52Zkfg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156025; v=1;
 b=C55d77izIIDdPTrW0zVla+Mu3KKFxdn76g52SXabSBEyNCJHRJK0neit0+90adLaZ5nQ10/5
 Dz8tKevumWtyTJnd8p3OFxaQTbCSw585ctPfUKWlSMwP0mHPZXoQNMjOTJUgQcBsUgt7IsgAYKn
 tPRCWttbrkUH3LpjjorAqzQ6ehR+0iC3OVVW5JLLsxE2XNL+zrWFrTHlJI9nFEuAVbyoNz+8VqC
 AdjFKlEH0ZSFjgZrKnAST+FnWry86vyo7sSbvkVsR9F19yr/yqZKsOs5Nf+sEalSMvxK7Djbys7
 rOtyqFexdS/7kPOcckzr1OiFmAGg1XYfeXyiayaN8mOiw==

From: Krystian Hebel <krystian.hebel@3mdeb.com>

On Intel TXT, APs are started in one of two ways, depending on ACM
which reports it in its information table. In both cases, all APs are
started simultaneously after BSP requests them to do so. Two possible
ways are:
- GETSEC[WAKEUP] instruction,
- MONITOR address.

GETSEC[WAKEUP] requires versions >= 7 of SINIT to MLE Data, but there is
no clear mapping of that version with regard to processor family and
it's not known which CPUs actually use it. It could have been designed
for TXT support on CPUs that lack MONITOR/MWAIT, because GETSEC[WAKEUP]
seems to be more complicated, in software and hardware alike.

This patch implements only MONITOR approach, GETSEC[WAKEUP] support will
be added later once more details and means of testing are available and
if there is a practical need for it.

With this patch, every AP goes through assembly part, and only when in
start_secondary() in C they re-enter MONITOR/MWAIT iff they are not the
AP that was asked to boot. The same address is reused for simplicity,
and on next wakeup call APs don't have to go through assembly part
again (GDT, paging, stack setting).

Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/boot/trampoline.S       | 19 ++++++++-
 xen/arch/x86/include/asm/intel-txt.h |  6 +++
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/smpboot.c               | 63 ++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index ed593acc46..8cd9881828 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -58,6 +58,16 @@ GLOBAL(entry_SIPI16)
         ljmpl   $BOOT_CS32,$bootsym_rel(trampoline_protmode_entry,6)
 
         .code32
+GLOBAL(txt_ap_entry)
+        /*
+         * APs enter here in protected mode without paging. GDT is set in JOIN
+         * structure, it points to trampoline_gdt. Interrupts are disabled by
+         * TXT (including NMI and SMI), so IDT doesn't matter at this point.
+         * The only missing point is telling that we are AP by saving non-zero
+         * value in EBX.
+         */
+        mov     $1, %ebx
+
 trampoline_protmode_entry:
         /* Set up a few descriptors: on entry only CS is guaranteed good. */
         mov     $BOOT_DS,%eax
@@ -143,7 +153,7 @@ start64:
         .word   0
 idt_48: .word   0, 0, 0 # base = limit = 0
 
-trampoline_gdt:
+GLOBAL(trampoline_gdt)
         .word   0                  /* 0x0000: unused (reused for GDTR) */
 gdt_48:
         .word   .Ltrampoline_gdt_end - trampoline_gdt - 1
@@ -154,6 +164,13 @@ gdt_48:
         .quad   0x00cf93000000ffff /* 0x0018: ring 0 data */
         .quad   0x00009b000000ffff /* 0x0020: real-mode code @ BOOT_TRAMPOLINE */
         .quad   0x000093000000ffff /* 0x0028: real-mode data @ BOOT_TRAMPOLINE */
+        /*
+         * Intel TXT requires these two in exact order. This isn't compatible
+         * with order required by syscall, so we have duplicated entries...
+         * If order ever changes, update selector numbers in asm/intel-txt.h.
+         */
+        .quad   0x00cf9b000000ffff /* 0x0030: ring 0 code, 32-bit mode */
+        .quad   0x00cf93000000ffff /* 0x0038: ring 0 data */
 .Ltrampoline_gdt_end:
 
         /* Relocations for trampoline Real Mode segments. */
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index bc51d2d287..5d76443d35 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -82,6 +82,9 @@
 
 #define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
 
+#define TXT_AP_BOOT_CS                  0x0030
+#define TXT_AP_BOOT_DS                  0x0038
+
 #ifndef __ASSEMBLY__
 
 #include <xen/slr-table.h>
@@ -96,6 +99,9 @@
 #define _txt(x) __va(x)
 #endif
 
+extern char txt_ap_entry[];
+extern uint32_t trampoline_gdt[];
+
 /*
  * Always use private space as some of registers are either read-only or not
  * present in public space.
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 75af7ea3c4..9957e3cb9e 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -473,6 +473,7 @@ void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
 enum ap_boot_method {
     AP_BOOT_NORMAL,
     AP_BOOT_SKINIT,
+    AP_BOOT_TXT,
 };
 extern enum ap_boot_method ap_boot_method;
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 54207e6d88..5e53cce20b 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -29,6 +29,7 @@
 #include <asm/flushtlb.h>
 #include <asm/guest.h>
 #include <asm/idt.h>
+#include <asm/intel-txt.h>
 #include <asm/io_apic.h>
 #include <asm/irq-vectors.h>
 #include <asm/mc146818rtc.h>
@@ -37,6 +38,7 @@
 #include <asm/mtrr.h>
 #include <asm/prot-key.h>
 #include <asm/setup.h>
+#include <asm/slaunch.h>
 #include <asm/spec_ctrl.h>
 #include <asm/tboot.h>
 #include <asm/time.h>
@@ -325,6 +327,29 @@ void asmlinkage start_secondary(void *unused)
      */
     unsigned int cpu = booting_cpu;
 
+    if ( ap_boot_method == AP_BOOT_TXT ) {
+        uint64_t misc_enable;
+        uint32_t my_apicid;
+        struct txt_sinit_mle_data *sinit_mle =
+              txt_sinit_mle_data_start(__va(read_txt_reg(TXTCR_HEAP_BASE)));
+
+        /* TXT released us with MONITOR disabled in IA32_MISC_ENABLE. */
+        rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
+        wrmsrl(MSR_IA32_MISC_ENABLE,
+               misc_enable | MSR_IA32_MISC_ENABLE_MONITOR_ENABLE);
+
+        /* get_apic_id() reads from x2APIC if it thinks it is enabled. */
+        x2apic_ap_setup();
+        my_apicid = get_apic_id();
+
+        while ( my_apicid != x86_cpu_to_apicid[cpu] ) {
+            asm volatile ("monitor; xor %0,%0; mwait"
+                          :: "a"(__va(sinit_mle->rlp_wakeup_addr)), "c"(0),
+                          "d"(0) : "memory");
+            cpu = booting_cpu;
+        }
+    }
+
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
     set_current(idle_vcpu[cpu]);
@@ -421,6 +446,28 @@ void asmlinkage start_secondary(void *unused)
     startup_cpu_idle_loop();
 }
 
+static int wake_aps_in_txt(void)
+{
+    struct txt_sinit_mle_data *sinit_mle =
+              txt_sinit_mle_data_start(__va(read_txt_reg(TXTCR_HEAP_BASE)));
+    uint32_t *wakeup_addr = __va(sinit_mle->rlp_wakeup_addr);
+
+    uint32_t join[4] = {
+        trampoline_gdt[1],               /* GDT limit */
+        bootsym_phys(trampoline_gdt),    /* GDT base */
+        TXT_AP_BOOT_CS,                  /* CS selector, DS = CS+8 */
+        bootsym_phys(txt_ap_entry)       /* EIP */
+    };
+
+    write_txt_reg(TXTCR_MLE_JOIN, __pa(join));
+
+    smp_mb();
+
+    *wakeup_addr = 1;
+
+    return 0;
+}
+
 static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
     unsigned long send_status = 0, accept_status = 0;
@@ -443,6 +490,9 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
         return 0;
 
+    if ( ap_boot_method == AP_BOOT_TXT )
+        return wake_aps_in_txt();
+
     /*
      * Be paranoid about clearing APIC errors.
      */
@@ -1150,6 +1200,13 @@ static struct notifier_block cpu_smpboot_nfb = {
 
 void __init smp_prepare_cpus(void)
 {
+    /*
+     * If the platform is performing a Secure Launch via TXT, secondary
+     * CPUs (APs) will need to be woken up in a TXT-specific way.
+     */
+    if ( slaunch_active && boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        ap_boot_method = AP_BOOT_TXT;
+
     register_cpu_notifier(&cpu_smpboot_nfb);
 
     mtrr_aps_sync_begin();
@@ -1418,6 +1475,12 @@ void __init smp_cpus_done(void)
 
     mtrr_save_state();
     mtrr_aps_sync_end();
+
+    /*
+     * After the initial startup the DRTM-specific method for booting APs
+     * should not longer be used unless DRTM sequence is started again.
+     */
+    ap_boot_method = AP_BOOT_NORMAL;
 }
 
 void __init smp_intr_init(void)
-- 
2.49.0



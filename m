Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38948AC8FBD
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000953.1381209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdq-0004AI-UU; Fri, 30 May 2025 13:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000953.1381209; Fri, 30 May 2025 13:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzdq-00048X-Pl; Fri, 30 May 2025 13:19:22 +0000
Received: by outflank-mailman (input) for mailman id 1000953;
 Fri, 30 May 2025 13:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdp-0003ZU-28
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:21 +0000
Received: from 11.mo581.mail-out.ovh.net (11.mo581.mail-out.ovh.net
 [87.98.173.157]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aec1e352-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:19:14 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.180])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4b83jZ30WQz1Yxh
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:14 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5d8n2 (unknown [10.111.174.164])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 39E9EC024C;
 Fri, 30 May 2025 13:19:13 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.111])
 by ghost-submission-5b5ff79f4f-5d8n2 with ESMTPSA
 id pQ4+OFCwOWjaBgAA4lxFtg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:13 +0000
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
X-Inumbo-ID: aec1e352-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-111S0054b49fc25-ab36-4bb2-9224-4168f55b003f,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 15/22] x86/smpboot.c: TXT AP bringup
Date: Fri, 30 May 2025 16:17:57 +0300
Message-ID: <bca9943d4ffb37531ec8facac09e85996bc2acb7.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12705217499186640028
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeeguedvvdettdetvedujeejiedtfefhteekgeegffffleefiedvffduledtiefhnecuffhomhgrihhnpehtrhgrmhhpohhlihhnvgdrshgsnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=gr1rPrDMI12BQGKfWWI47H6s2RO9Y2JqlRCdgepLO2s=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611154; v=1;
 b=Vxf6RhrwCxqkvQJezXfDi2WLBdjKF6Twig33138h07zBOd5pvSHlqX3Fx6o+3aiUz3pe2lKs
 hAzCw74Gd9pI83+NTYGfqnTHm4D4BymoNxlep9zsdNXq7p4E+Ju6eYBuJJqdZCtL3lgzpfaZF0g
 9hRMn9rlql/gx+HxQXyn3qzCIiIeNZC2BJ4tP2C6KT0m6BNWJvQ7hY/bkqgNDowuSTrx9A4mbfS
 bZt8VHBB++H75Xttax3p+88L/IturEkeut4bwmm6vLOpgqK6PAvaa5z+t6lzo0ylnQxxvLi/npz
 MREedbh55kw5YYFb/nFrPQAMfF2qT0439iIkrisfGBoRg==

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
index de7f23d4ff..c032ebb2e1 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -91,6 +91,9 @@
 
 #define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
 
+#define TXT_AP_BOOT_CS                  0x0030
+#define TXT_AP_BOOT_DS                  0x0038
+
 #ifndef __ASSEMBLY__
 
 #include <xen/slr-table.h>
@@ -105,6 +108,9 @@
 #define _txt(x) __va(x)
 #endif
 
+extern char txt_ap_entry[];
+extern uint32_t trampoline_gdt[];
+
 /*
  * Always use private space as some of registers are either read-only or not
  * present in public space.
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 96b9bf5f5e..20c85eb2f3 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -466,6 +466,7 @@ void set_in_pb_opt_ctrl(uint32_t mask, uint32_t val);
 enum ap_boot_method {
     AP_BOOT_NORMAL,
     AP_BOOT_SKINIT,
+    AP_BOOT_TXT,
 };
 extern enum ap_boot_method ap_boot_method;
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index a90caf45a5..74a7cbe23b 100644
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
 #include <asm/stubs.h>
 #include <asm/tboot.h>
@@ -321,6 +323,29 @@ void asmlinkage start_secondary(void)
     struct cpu_info *info = get_cpu_info();
     unsigned int cpu = smp_processor_id();
 
+    if ( ap_boot_method == AP_BOOT_TXT ) {
+        uint64_t misc_enable;
+        uint32_t my_apicid;
+        struct txt_sinit_mle_data *sinit_mle =
+              txt_sinit_mle_data_start(__va(txt_read(TXTCR_HEAP_BASE)));
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
+            cpu = smp_processor_id();
+        }
+    }
+
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
     set_current(idle_vcpu[cpu]);
@@ -418,6 +443,28 @@ void asmlinkage start_secondary(void)
     startup_cpu_idle_loop();
 }
 
+static int wake_aps_in_txt(void)
+{
+    struct txt_sinit_mle_data *sinit_mle =
+              txt_sinit_mle_data_start(__va(txt_read(TXTCR_HEAP_BASE)));
+    uint32_t *wakeup_addr = __va(sinit_mle->rlp_wakeup_addr);
+
+    uint32_t join[4] = {
+        trampoline_gdt[1],               /* GDT limit */
+        bootsym_phys(trampoline_gdt),    /* GDT base */
+        TXT_AP_BOOT_CS,                  /* CS selector, DS = CS+8 */
+        bootsym_phys(txt_ap_entry)       /* EIP */
+    };
+
+    txt_write(TXTCR_MLE_JOIN, __pa(join));
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
@@ -440,6 +487,9 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
         return 0;
 
+    if ( ap_boot_method == AP_BOOT_TXT )
+        return wake_aps_in_txt();
+
     /*
      * Be paranoid about clearing APIC errors.
      */
@@ -1147,6 +1197,13 @@ static struct notifier_block cpu_smpboot_nfb = {
 
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
@@ -1424,6 +1481,12 @@ void __init smp_cpus_done(void)
 
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



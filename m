Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6224B516F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272036.466819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEh-00028h-6O; Mon, 14 Feb 2022 13:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272036.466819; Mon, 14 Feb 2022 13:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEg-00023X-Vh; Mon, 14 Feb 2022 13:17:46 +0000
Received: by outflank-mailman (input) for mailman id 272036;
 Mon, 14 Feb 2022 13:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4c-0008IH-OG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a73c9dc-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:20 +0100 (CET)
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
X-Inumbo-ID: 0a73c9dc-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=LivTElKoKg6RGtpxx8XvSouEzTvppj+Csy+3sm8lMAU=;
  b=GquhXjR1NX390snx6hztGFyZvFKodtIme1F2Rk+2nGjMzkBJTIJVFanJ
   YRMRySx57C1+0Pj0EkkD8+AR1PluHOqnjG41OTdkfjuCykyz+xrh6If10
   RUc24kwCjBcUFpORYE0j5UdxJCpaX6uJ1k1I87pNULhX9c6qJlj4XtNuo
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: AjsViK0O9s9wW1s3wOF5KfVi+35Mzoq5/gn4EZEajFTvwqvP8sjoFNRl8dnspl2VDvsYMdRlmk
 N0ajlrs1l3+cUO4VYIzoGAKsYwYOV/dCIKsE6YdxVY4jqNccRViR/SXpDFOfwynFmX0IrVR89R
 ws3awO7tNSBFIEcqMo0TwHRG2d0jH4NmorV4P1vt7008RQBHt9lJGcAmMz5cZxSu4YJyZYfLyG
 AK+wiVyVO61VAWJ1lQH5F4KABCvvVI4Pz1Olj/fc1X/MCqKv9JcueoYuo+xHtXi+TPR93UIw9M
 3jy5yXrYVq6RbwnRM3htyvqH
X-SBRS: 5.1
X-MesageID: 64554420
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tniWyK/0TxnBGW6WYVleDrUDmHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WoaXGjQbvaCZmanKY92a4+080wDup7Tz9BjHFFv+X88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh11
 v9UjYO0EjwgZJaXqr8gChhEKX5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SQKuCO
 5BBAdZpRCyeUQRFamsSMYs/jPj4jHCuLyxWtnvA8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9G9lGSnY81bc
 HcdoBF1n/MPrU23dIbyCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKXJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxRXcHQyXTUG79l8FSVCxGtamO0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmHxvmzOLHcqjp/lluJLHDEOopX4+GAPmRogEAGms+VmEm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:2PPMJK7gdMtNMyj7nwPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554420"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 24/70] xen/keyhandler: CFI hardening
Date: Mon, 14 Feb 2022 12:50:41 +0000
Message-ID: <20220214125127.17985-25-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Tweak {IRQ_,}KEYHANDLER() to use a named initialiser instead of requiring a
pointer cast to compile in the IRQ case.

Reposition iommu_dump_page_tables() to avoid a forward declaration.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/acpi/cpu_idle.c             |  2 +-
 xen/arch/x86/hvm/irq.c                   |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c              |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c              |  2 +-
 xen/arch/x86/io_apic.c                   |  2 +-
 xen/arch/x86/irq.c                       |  2 +-
 xen/arch/x86/mm/p2m-ept.c                |  2 +-
 xen/arch/x86/mm/shadow/common.c          |  4 +--
 xen/arch/x86/msi.c                       |  2 +-
 xen/arch/x86/nmi.c                       |  4 +--
 xen/arch/x86/numa.c                      |  2 +-
 xen/arch/x86/time.c                      |  2 +-
 xen/common/debugtrace.c                  |  2 +-
 xen/common/event_channel.c               |  2 +-
 xen/common/grant_table.c                 |  2 +-
 xen/common/kexec.c                       |  2 +-
 xen/common/keyhandler.c                  | 35 ++++++++++++---------
 xen/common/livepatch.c                   |  2 +-
 xen/common/page_alloc.c                  |  4 +--
 xen/common/perfc.c                       |  4 +--
 xen/common/sched/cpupool.c               |  2 +-
 xen/common/spinlock.c                    |  4 +--
 xen/common/timer.c                       |  2 +-
 xen/drivers/char/console.c               |  8 ++---
 xen/drivers/passthrough/amd/iommu.h      |  2 +-
 xen/drivers/passthrough/amd/iommu_intr.c |  2 +-
 xen/drivers/passthrough/iommu.c          | 52 +++++++++++++++-----------------
 xen/drivers/passthrough/pci.c            |  2 +-
 xen/drivers/passthrough/vtd/extern.h     |  2 +-
 xen/drivers/passthrough/vtd/utils.c      |  2 +-
 xen/include/xen/perfc.h                  |  4 +--
 xen/include/xen/sched.h                  |  2 +-
 xen/include/xen/spinlock.h               |  4 +--
 33 files changed, 86 insertions(+), 83 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 22c8bb0c2d94..0142671bb836 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -377,7 +377,7 @@ static void print_acpi_power(uint32_t cpu, struct acpi_processor_power *power)
     print_hw_residencies(cpu);
 }
 
-static void dump_cx(unsigned char key)
+static void cf_check dump_cx(unsigned char key)
 {
     unsigned int cpu;
 
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 6045c9149bad..a7f8991a7b84 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -635,7 +635,7 @@ static void irq_dump(struct domain *d)
            hvm_irq->callback_via_asserted ? "" : " not");
 }
 
-static void dump_irq_info(unsigned char key)
+static void cf_check dump_irq_info(unsigned char key)
 {
     struct domain *d;
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index efa085032bb5..958309657799 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -226,7 +226,7 @@ void svm_destroy_vmcb(struct vcpu *v)
     svm->vmcb = NULL;
 }
 
-static void vmcb_dump(unsigned char ch)
+static void cf_check vmcb_dump(unsigned char ch)
 {
     struct domain *d;
     struct vcpu *v;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 2b6bafe9d542..d2cafd8ca1c5 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2117,7 +2117,7 @@ void vmcs_dump_vcpu(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-static void vmcs_dump(unsigned char ch)
+static void cf_check vmcs_dump(unsigned char ch)
 {
     struct domain *d;
     struct vcpu *v;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 4135a9c06052..4c5eaef86273 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1268,7 +1268,7 @@ static void __init print_IO_APIC(void)
         __print_IO_APIC(1);
 }
 
-static void _print_IO_APIC_keyhandler(unsigned char key)
+static void cf_check _print_IO_APIC_keyhandler(unsigned char key)
 {
     __print_IO_APIC(0);
 }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index d9bd355113d7..f43b926ed26b 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2424,7 +2424,7 @@ void free_domain_pirqs(struct domain *d)
     pcidevs_unlock();
 }
 
-static void dump_irqs(unsigned char key)
+static void cf_check dump_irqs(unsigned char key)
 {
     int i, irq, pirq;
     struct irq_desc *desc;
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b7ee441d4573..a8a6ad629528 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1433,7 +1433,7 @@ static const char *memory_type_to_str(unsigned int x)
     return memory_types[x][0] ? memory_types[x] : "?";
 }
 
-static void ept_dump_p2m_table(unsigned char key)
+static void cf_check ept_dump_p2m_table(unsigned char key)
 {
     struct domain *d;
     ept_entry_t *table, *ept_entry;
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index fb370af90b5c..83dedc8870aa 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -98,7 +98,7 @@ void shadow_vcpu_init(struct vcpu *v)
 #if SHADOW_AUDIT
 int shadow_audit_enable = 0;
 
-static void shadow_audit_key(unsigned char key)
+static void cf_check shadow_audit_key(unsigned char key)
 {
     shadow_audit_enable = !shadow_audit_enable;
     printk("%s shadow_audit_enable=%d\n",
@@ -1046,7 +1046,7 @@ void shadow_blow_tables_per_domain(struct domain *d)
 /* Blow all shadows of all shadowed domains: this can be used to cause the
  * guest's pagetables to be re-shadowed if we suspect that the shadows
  * have somehow got out of sync */
-static void shadow_blow_all_tables(unsigned char c)
+static void cf_check shadow_blow_all_tables(unsigned char c)
 {
     struct domain *d;
     printk("'%c' pressed -> blowing all shadow tables\n", c);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d1497254b188..77a4fbf13f9f 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1411,7 +1411,7 @@ void __init early_msi_init(void)
         return;
 }
 
-static void dump_msi(unsigned char key)
+static void cf_check dump_msi(unsigned char key)
 {
     unsigned int irq;
 
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index e20d1393c881..5c26e8785dfc 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -578,13 +578,13 @@ void self_nmi(void)
     local_irq_restore(flags);
 }
 
-static void do_nmi_trigger(unsigned char key)
+static void cf_check do_nmi_trigger(unsigned char key)
 {
     printk("Triggering NMI on APIC ID %x\n", get_apic_id());
     self_nmi();
 }
 
-static void do_nmi_stats(unsigned char key)
+static void cf_check do_nmi_stats(unsigned char key)
 {
     const struct vcpu *v;
     unsigned int cpu;
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 5de9db4e9943..680b7d9002c5 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -369,7 +369,7 @@ unsigned int __init arch_get_dma_bitsize(void)
                  + PAGE_SHIFT, 32);
 }
 
-static void dump_numa(unsigned char key)
+static void cf_check dump_numa(unsigned char key)
 {
     s_time_t now = NOW();
     unsigned int i, j, n;
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 5a72b66800e4..3d767d70f61f 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2541,7 +2541,7 @@ int tsc_set_info(struct domain *d,
 }
 
 /* vtsc may incur measurable performance degradation, diagnose with this */
-static void dump_softtsc(unsigned char key)
+static void cf_check dump_softtsc(unsigned char key)
 {
     struct domain *d;
     int domcnt = 0;
diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
index 160d00b79607..a272e5e43761 100644
--- a/xen/common/debugtrace.c
+++ b/xen/common/debugtrace.c
@@ -233,7 +233,7 @@ void debugtrace_printk(const char *fmt, ...)
     spin_unlock_irqrestore(&debugtrace_lock, flags);
 }
 
-static void debugtrace_key(unsigned char key)
+static void cf_check debugtrace_key(unsigned char key)
 {
     debugtrace_toggle();
 }
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 183e78ac17f1..ffb042a241a6 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1629,7 +1629,7 @@ static void domain_dump_evtchn_info(struct domain *d)
     spin_unlock(&d->event_lock);
 }
 
-static void dump_evtchn_info(unsigned char key)
+static void cf_check dump_evtchn_info(unsigned char key)
 {
     struct domain *d;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 1078e3e16cda..1e0762b064d7 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4275,7 +4275,7 @@ static void gnttab_usage_print(struct domain *rd)
         printk("no active grant table entries\n");
 }
 
-static void gnttab_usage_print_all(unsigned char key)
+static void cf_check gnttab_usage_print_all(unsigned char key)
 {
     struct domain *d;
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index b222a5fd782e..a2ffb6530cff 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -408,7 +408,7 @@ static long cf_check kexec_reboot(void *_image)
     return 0;
 }
 
-static void do_crashdump_trigger(unsigned char key)
+static void cf_check do_crashdump_trigger(unsigned char key)
 {
     printk("'%c' pressed -> triggering crashdump\n", key);
     kexec_crash(CRASHREASON_DEBUGKEY);
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index b568484ca62c..5dc650a37c5c 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -26,10 +26,11 @@
 static unsigned char keypress_key;
 static bool_t alt_key_handling;
 
-static keyhandler_fn_t show_handlers, dump_hwdom_registers,
-    dump_domains, read_clocks;
-static irq_keyhandler_fn_t do_toggle_alt_key, dump_registers,
-    reboot_machine, run_all_keyhandlers, do_debug_key;
+static keyhandler_fn_t cf_check show_handlers, cf_check dump_hwdom_registers,
+    cf_check dump_domains, cf_check read_clocks;
+static irq_keyhandler_fn_t cf_check do_toggle_alt_key, cf_check dump_registers,
+    cf_check reboot_machine, cf_check run_all_keyhandlers,
+    cf_check do_debug_key;
 
 static struct keyhandler {
     union {
@@ -43,10 +44,10 @@ static struct keyhandler {
 } key_table[128] __read_mostly =
 {
 #define KEYHANDLER(k, f, desc, diag)            \
-    [k] = { { (f) }, desc, 0, diag }
+    [k] = { { .fn = (f) }, desc, 0, diag }
 
 #define IRQ_KEYHANDLER(k, f, desc, diag)        \
-    [k] = { { (keyhandler_fn_t *)(f) }, desc, 1, diag }
+    [k] = { { .irq_fn = (f) }, desc, 1, diag }
 
     IRQ_KEYHANDLER('A', do_toggle_alt_key, "toggle alternative key handling", 0),
     IRQ_KEYHANDLER('d', dump_registers, "dump registers", 1),
@@ -124,7 +125,7 @@ void register_irq_keyhandler(unsigned char key, irq_keyhandler_fn_t fn,
     key_table[key].diagnostic = diagnostic;
 }
 
-static void show_handlers(unsigned char key)
+static void cf_check show_handlers(unsigned char key)
 {
     unsigned int i;
 
@@ -170,7 +171,8 @@ void dump_execstate(struct cpu_user_regs *regs)
     watchdog_enable();
 }
 
-static void dump_registers(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check dump_registers(
+    unsigned char key, struct cpu_user_regs *regs)
 {
     unsigned int cpu;
 
@@ -224,7 +226,7 @@ static void cf_check dump_hwdom_action(void *data)
     }
 }
 
-static void dump_hwdom_registers(unsigned char key)
+static void cf_check dump_hwdom_registers(unsigned char key)
 {
     struct vcpu *v;
 
@@ -246,13 +248,14 @@ static void dump_hwdom_registers(unsigned char key)
     }
 }
 
-static void reboot_machine(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check reboot_machine(
+    unsigned char key, struct cpu_user_regs *regs)
 {
     printk("'%c' pressed -> rebooting machine\n", key);
     machine_restart(0);
 }
 
-static void dump_domains(unsigned char key)
+static void cf_check dump_domains(unsigned char key)
 {
     struct domain *d;
     const struct sched_unit *unit;
@@ -372,7 +375,7 @@ static void cf_check read_clocks_slave(void *unused)
     local_irq_enable();
 }
 
-static void read_clocks(unsigned char key)
+static void cf_check read_clocks(unsigned char key)
 {
     unsigned int cpu = smp_processor_id(), min_stime_cpu, max_stime_cpu;
     unsigned int min_cycles_cpu, max_cycles_cpu;
@@ -461,7 +464,8 @@ static void cf_check run_all_nonirq_keyhandlers(void *unused)
 static DECLARE_TASKLET(run_all_keyhandlers_tasklet,
                        run_all_nonirq_keyhandlers, NULL);
 
-static void run_all_keyhandlers(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check run_all_keyhandlers(
+    unsigned char key, struct cpu_user_regs *regs)
 {
     struct keyhandler *h;
     unsigned int k;
@@ -494,7 +498,7 @@ static void do_debugger_trap_fatal(struct cpu_user_regs *regs)
     barrier();
 }
 
-static void do_debug_key(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_debug_key(unsigned char key, struct cpu_user_regs *regs)
 {
     printk("'%c' pressed -> trapping into debugger\n", key);
     if ( regs )
@@ -503,7 +507,8 @@ static void do_debug_key(unsigned char key, struct cpu_user_regs *regs)
         run_in_exception_handler(do_debugger_trap_fatal);
 }
 
-static void do_toggle_alt_key(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_alt_key(
+    unsigned char key, struct cpu_user_regs *regs)
 {
     alt_key_handling = !alt_key_handling;
     printk("'%c' pressed -> using %s key handling\n", key,
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 4e1c29ab7879..e8714920dc8f 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -2068,7 +2068,7 @@ static const char *state2str(unsigned int state)
     return names[state];
 }
 
-static void livepatch_printall(unsigned char key)
+static void cf_check livepatch_printall(unsigned char key)
 {
     struct payload *data;
     const void *binary_id = NULL;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 827617502e35..3caf5c954b24 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2522,7 +2522,7 @@ unsigned long avail_node_heap_pages(unsigned int nodeid)
 }
 
 
-static void pagealloc_info(unsigned char key)
+static void cf_check pagealloc_info(unsigned char key)
 {
     unsigned int zone = MEMZONE_XEN;
     unsigned long n, total = 0;
@@ -2572,7 +2572,7 @@ void scrub_one_page(struct page_info *pg)
 #endif
 }
 
-static void dump_heap(unsigned char key)
+static void cf_check dump_heap(unsigned char key)
 {
     s_time_t      now = NOW();
     int           i, j;
diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 3abe35892a83..7400667bf0c4 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -28,7 +28,7 @@ static const struct {
 
 DEFINE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
 
-void perfc_printall(unsigned char key)
+void cf_check perfc_printall(unsigned char key)
 {
     unsigned int i, j;
     s_time_t now = NOW();
@@ -115,7 +115,7 @@ void perfc_printall(unsigned char key)
     }
 }
 
-void perfc_reset(unsigned char key)
+void cf_check perfc_reset(unsigned char key)
 {
     unsigned int i, j;
     s_time_t now = NOW();
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 07f984a659cd..a6da4970506a 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -956,7 +956,7 @@ const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool)
     return pool->cpu_valid;
 }
 
-void dump_runq(unsigned char key)
+void cf_check dump_runq(unsigned char key)
 {
     s_time_t         now = NOW();
     struct cpupool *c;
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 5ce7e3363863..25bfbf3c47f7 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -393,7 +393,7 @@ static void spinlock_profile_print_elem(struct lock_profile *data,
            data->lock_cnt, data->time_hold, data->block_cnt, data->time_block);
 }
 
-void spinlock_profile_printall(unsigned char key)
+void cf_check spinlock_profile_printall(unsigned char key)
 {
     s_time_t now = NOW();
     s_time_t diff;
@@ -413,7 +413,7 @@ static void spinlock_profile_reset_elem(struct lock_profile *data,
     data->time_block = 0;
 }
 
-void spinlock_profile_reset(unsigned char key)
+void cf_check spinlock_profile_reset(unsigned char key)
 {
     s_time_t now = NOW();
 
diff --git a/xen/common/timer.c b/xen/common/timer.c
index 700f191a70b4..9b5016d5ed82 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -546,7 +546,7 @@ static void dump_timer(struct timer *t, s_time_t now)
            (t->expires - now) / 1000, t, t->function, t->data);
 }
 
-static void dump_timerq(unsigned char key)
+static void cf_check dump_timerq(unsigned char key)
 {
     struct timer  *t;
     struct timers *ts;
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d74b65f6bf23..380765ab02fd 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -280,7 +280,7 @@ static int *__read_mostly upper_thresh_adj = &xenlog_upper_thresh;
 static int *__read_mostly lower_thresh_adj = &xenlog_lower_thresh;
 static const char *__read_mostly thresh_adj = "standard";
 
-static void do_toggle_guest(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_guest(unsigned char key, struct cpu_user_regs *regs)
 {
     if ( upper_thresh_adj == &xenlog_upper_thresh )
     {
@@ -307,13 +307,13 @@ static void do_adj_thresh(unsigned char key)
            loglvl_str(*upper_thresh_adj));
 }
 
-static void do_inc_thresh(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_inc_thresh(unsigned char key, struct cpu_user_regs *regs)
 {
     ++*lower_thresh_adj;
     do_adj_thresh(key);
 }
 
-static void do_dec_thresh(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_dec_thresh(unsigned char key, struct cpu_user_regs *regs)
 {
     if ( *lower_thresh_adj )
         --*lower_thresh_adj;
@@ -424,7 +424,7 @@ void console_serial_puts(const char *s, size_t nr)
     pv_console_puts(s, nr);
 }
 
-static void dump_console_ring_key(unsigned char key)
+static void cf_check dump_console_ring_key(unsigned char key)
 {
     uint32_t idx, len, sofar, c;
     unsigned int order;
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 04517c1a024c..99be9aafcc53 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -297,7 +297,7 @@ unsigned int amd_iommu_read_ioapic_from_ire(
 int amd_iommu_msi_msg_update_ire(
     struct msi_desc *msi_desc, struct msi_msg *msg);
 int amd_setup_hpet_msi(struct msi_desc *msi_desc);
-void amd_iommu_dump_intremap_tables(unsigned char key);
+void cf_check amd_iommu_dump_intremap_tables(unsigned char key);
 
 extern struct ioapic_sbdf {
     u16 bdf, seg;
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index b166a0466654..e7804413c7f4 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -844,7 +844,7 @@ static int dump_intremap_mapping(const struct amd_iommu *iommu,
     return 0;
 }
 
-void amd_iommu_dump_intremap_tables(unsigned char key)
+void cf_check amd_iommu_dump_intremap_tables(unsigned char key)
 {
     if ( !shared_intremap_table )
     {
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 6ee267d2bfd4..e220fea72c2f 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -22,8 +22,6 @@
 #include <xen/keyhandler.h>
 #include <xsm/xsm.h>
 
-static void iommu_dump_page_tables(unsigned char key);
-
 unsigned int __read_mostly iommu_dev_iotlb_timeout = 1000;
 integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
 
@@ -224,6 +222,31 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
     return 0;
 }
 
+static void cf_check iommu_dump_page_tables(unsigned char key)
+{
+    struct domain *d;
+
+    ASSERT(iommu_enabled);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain(d)
+    {
+        if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
+            continue;
+
+        if ( iommu_use_hap_pt(d) )
+        {
+            printk("%pd sharing page tables\n", d);
+            continue;
+        }
+
+        iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
 void __hwdom_init iommu_hwdom_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
@@ -584,31 +607,6 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
-static void iommu_dump_page_tables(unsigned char key)
-{
-    struct domain *d;
-
-    ASSERT(iommu_enabled);
-
-    rcu_read_lock(&domlist_read_lock);
-
-    for_each_domain(d)
-    {
-        if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
-            continue;
-
-        if ( iommu_use_hap_pt(d) )
-        {
-            printk("%pd sharing page tables\n", d);
-            continue;
-        }
-
-        iommu_vcall(dom_iommu(d)->platform_ops, dump_page_tables, d);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index c170dd06ba51..79f49f0e6007 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1351,7 +1351,7 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
     return 0;
 }
 
-static void dump_pci_devices(unsigned char ch)
+static void cf_check dump_pci_devices(unsigned char ch)
 {
     printk("==== PCI devices ====\n");
     pcidevs_lock();
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index f97883a780a2..4595b65e5bce 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -31,7 +31,7 @@ extern const struct iommu_init_ops intel_iommu_init_ops;
 
 void print_iommu_regs(struct acpi_drhd_unit *drhd);
 void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn);
-keyhandler_fn_t vtd_dump_iommu_info;
+keyhandler_fn_t cf_check vtd_dump_iommu_info;
 
 bool intel_iommu_supports_eim(void);
 int intel_iommu_enable_eim(void);
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 56dfdff9bd0d..47922dc8e813 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -154,7 +154,7 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
     } while ( --level );
 }
 
-void vtd_dump_iommu_info(unsigned char key)
+void cf_check vtd_dump_iommu_info(unsigned char key)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index 6846e7119fa3..bb010b0aae93 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -96,8 +96,8 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
 struct xen_sysctl_perfc_op;
 int perfc_control(struct xen_sysctl_perfc_op *);
 
-extern void perfc_printall(unsigned char key);
-extern void perfc_reset(unsigned char key);
+extern void cf_check perfc_printall(unsigned char key);
+extern void cf_check perfc_reset(unsigned char key);
 
     
 #else /* CONFIG_PERF_COUNTERS */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f78cc4c4c9..67b0f6b86853 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1145,7 +1145,7 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
 unsigned int cpupool_get_id(const struct domain *d);
 const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);
-extern void dump_runq(unsigned char key);
+extern void cf_check dump_runq(unsigned char key);
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 9fa4e600c1f7..961891bea4d5 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -129,8 +129,8 @@ void _lock_profile_deregister_struct(int32_t, struct lock_profile_qhead *);
     _lock_profile_deregister_struct(type, &((ptr)->profile_head))
 
 extern int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc);
-extern void spinlock_profile_printall(unsigned char key);
-extern void spinlock_profile_reset(unsigned char key);
+extern void cf_check spinlock_profile_printall(unsigned char key);
+extern void cf_check spinlock_profile_reset(unsigned char key);
 
 #else
 
-- 
2.11.0



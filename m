Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230D145EE80
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232748.403620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauE-0003a0-Er; Fri, 26 Nov 2021 13:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232748.403620; Fri, 26 Nov 2021 13:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauE-0003XG-9z; Fri, 26 Nov 2021 13:04:46 +0000
Received: by outflank-mailman (input) for mailman id 232748;
 Fri, 26 Nov 2021 13:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauC-0003W9-Ux
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6abd2811-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:04:42 +0100 (CET)
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
X-Inumbo-ID: 6abd2811-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lyv9Zq2/wNiGM7cedY7jC5rNlTlcp+sDuu1OiqPjFTg=;
  b=M5aUjTN3C+ErM1grARTSTiuiEOO8CMpENPpVt8sHqH/eJfJxAVky0zx6
   CJou6ZfIJ8u1C/gz4oLSwlzNjZfR91YqggGCJ3kkqCJT3RxwP9zqow2Op
   inydMKMDeuaNEDarXfm5sozCj6+RJSCe7/vp5QIJJIPh8j9HiVH3TkjHV
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fOYU9aW3l2wmwGsPd6CF/fr/ZOec+IzVsloqAFGDwWe+hD09ck9tQvXWbEgXc3WZcidVlFk2lV
 3a01fkSNuUQ0fAsCDnP42VDS7pdx6DRRSnds6xOazrI5qLhtteHiVQqgrfqE/p7WwWRe67iAtr
 3E5vhOg1Envlt3lUjMZl2wExtaZStH4CO9kldE6FjaxLBUCheNDjG3O6yw0rnaXm82F5r0G2io
 hgUUfNtiLIX207yh8N0EGcD8Dg7XcETvayWqG+WzrGCs1QQg81Zhb7k1lx25x2QBx67UM2gSLo
 JpWHnT8ZCF5PKrYrGQ/5/dz2
X-SBRS: 5.1
X-MesageID: 60695210
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YDhxuKKufnPyGEB/FE+RJJIlxSXFcZb7ZxGr2PjKsXjdYENSgTJWy
 jEbUG/SaPbYZ2f9KN0nOYiz9B8G7Z/UnIJlQQNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2txuJQ7
 vlGpKWUdhokPK7VtcgASxtXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glo2JETR6+GD
 yYfQWFuSQrbXkxfAWkeWY8kvPmC2yjecTIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQglSJoxodUNp4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LRg2gpyzZXmMz5OrsD6wOjE4AXIaZyBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2OBjr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6raWNE/qQQ2d3XEy9hL0yX4FWy3yGsjTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Da+EMIcRM8QvKFTvEMRSiai4hDuFfK8Ey/xXB
 HtmWZz0USZy5VpPkFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNw/4Iy7yWp
 y7lASe1CjPX3BX6FOlDUVg7AJuHYHq1hSlT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:3tQAn62SzL3BLmlAceXccwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695210"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 20/65] xen/keyhandler: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:01 +0000
Message-ID: <20211126123446.32324-21-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Tweak {IRQ_,}KEYHANDLER() to use a named initialiser instead of requiring a
pointer cast to compile in the IRQ case.

Reposition iommu_dump_page_tables() to avoid a forward declaration.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
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
index 565e997155f2..811afb8fa8d6 100644
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
index 98fe91aff80b..1bb3710f7baa 100644
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
index 1459f66c006b..ac36afcc1d64 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1434,7 +1434,7 @@ static const char *memory_type_to_str(unsigned int x)
     return memory_types[x][0] ? memory_types[x] : "?";
 }
 
-static void ept_dump_p2m_table(unsigned char key)
+static void cf_check ept_dump_p2m_table(unsigned char key)
 {
     struct domain *d;
     ept_entry_t *table, *ept_entry;
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index b8cacbefef5f..03bcd9518c39 100644
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
index 1ebf5fca96cc..9f8fdb209041 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2536,7 +2536,7 @@ int tsc_set_info(struct domain *d,
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
index e26904e7508f..0e65178a524e 100644
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
index 7b2f593e8b6c..7ea72ca01251 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4257,7 +4257,7 @@ static void gnttab_usage_print(struct domain *rd)
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
index a95dd14f63b4..906bfb6679df 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2528,7 +2528,7 @@ unsigned long avail_node_heap_pages(unsigned int nodeid)
 }
 
 
-static void pagealloc_info(unsigned char key)
+static void cf_check pagealloc_info(unsigned char key)
 {
     unsigned int zone = MEMZONE_XEN;
     unsigned long n, total = 0;
@@ -2578,7 +2578,7 @@ void scrub_one_page(struct page_info *pg)
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
index 4eea296c8c7c..a2fc1969f402 100644
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
+        dom_iommu(d)->platform_ops->dump_page_tables(d);
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
-        dom_iommu(d)->platform_ops->dump_page_tables(d);
-    }
-
-    rcu_read_unlock(&domlist_read_lock);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e75c82d11bd6..81ab09649cd0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1282,7 +1282,7 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
     return 0;
 }
 
-static void dump_pci_devices(unsigned char ch)
+static void cf_check dump_pci_devices(unsigned char ch)
 {
     printk("==== PCI devices ====\n");
     pcidevs_lock();
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 6fb00a25c302..8c5e8397fd7e 100644
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



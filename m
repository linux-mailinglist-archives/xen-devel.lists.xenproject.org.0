Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2B4B5170
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272035.466811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEg-00020B-Ic; Mon, 14 Feb 2022 13:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272035.466811; Mon, 14 Feb 2022 13:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEg-0001wp-Di; Mon, 14 Feb 2022 13:17:46 +0000
Received: by outflank-mailman (input) for mailman id 272035;
 Mon, 14 Feb 2022 13:17:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4Z-0008IH-4W
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0890dc7a-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:16 +0100 (CET)
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
X-Inumbo-ID: 0890dc7a-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=RYqgg8QK5itpM+XCRkfvVJsrwtwu9tubXMHtrNs746Q=;
  b=QK/0VjMuIxrS6x9Jav8P4J6khlt1ooWda58GbgwSGQ/qBpnibFNcQlEK
   wT07bd/rFDzEqFYFvGpjL+bcepQw9Pz7M09bOEj7PktBTLfVlH+Usl2go
   UTOjMmAcbZeQbOfk1IvgFS6x4KCoGLWkOlVEw1zkr8WKtFv0F8AOrvyFW
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3cxq+WvPrVyp8Ps5hBhq5AfaZE+hRs39an1GJ3H6OqM8n/SsUOrpp4PAwWf7q5/FqFGO8ay5+X
 2eeULrVFhDpRFlTXmnLPUyOHiyooK/R6rDoZ7mHgEnCVS+DNGaPBk3z+apMPELNdbd5WrSkoqi
 6WG0lZnvq0bjLHJDdQ79EbJ5YOloWoe7BQb7aTKpOUI7mGaK46mOKlVOSD3wVKefYM72SbrIl1
 6nUPFn7s0Ow9o1u2TmfMCrNeVEIHlHHjBOd9UJZDSVHuLfzLHm1NuFipUeAR0Cb9stq6il8ka9
 lfQogxRSDVrhvTe7zPqqZfwM
X-SBRS: 5.1
X-MesageID: 64554399
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QPcKvqN3qyICkKDvrR29kMFynXyQoLVcMsEvi/4bfWQNrUoh0GRTx
 mAWUWuGM/2CYjenKIt/Ydm09koGsZCBmN5rSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxykj+lD+
 NZBjrGXcF07Yq/KvbkMYxYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmtt25wVTKe2i
 8wxankwXTjaTkNzOk5OD7M0m+2Hhlr/bGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3EuwPUtXqlAsRITuT+r6M0xg3IroAONPEIfXKWscCLuk2yYP94E
 hYGpigoiPUjxEP+G7ERQCaEiHKDuxcdXf9ZHOs79ByBx8Lo3uqJOoQXZmUfMYJ77afaURRvj
 wbUxI2xWVSDpZXIESr1y1uCkd+l1cH5x0cmbDRMcwYK6sKLTGob3kOWFYYL/EJYY7TI9dDML
 9Ki8XJWa1Y715djO0CHEbfv2WzEm3QxZlRpjjg7p0r8hu+DWKarZpaz9X/Q5utaIYCSQzGp5
 SZYx5fOvL1TVcjWzkRhpdnh+5nzuZ643MD02wYzT/HNCRzxk5JcQWygyG4nfxo4Wir1UTTof
 FXSqWtsCGx7ZxOXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH44owYuBV1+U3JE
 czAKpjE4LdzIfkP8QdasM9Dje51lnhmnzu7qFKS503P7IdyrUW9Ed8tWGZipMhgsvPsTNz9/
 4kNOs2U5Q9YVeGiMCDb/ZRKdQIBLGQhBICwoMtSL7bRLg1jEWAnKvnQ3bJ+JNA1w/ULzr/Fr
 iOnR0tV6Fvjnnmbew+EXW9uNeH0VpFloHNlYSF1ZQS022IuaJqE5bsEc8dlZqEu8eFulKYmT
 /QMd8iaLO5ITzDLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 uT5hA3BQJcFSwBzN+rsaaqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTEiPzWr4qtFOciTENWE3OCsOSzPCjeuGGi3ZVBQKCDejWEDDH4/6CrZ
 ON0yfDgMaJYwAYW4tQkS7s7n7gj49bPpqNBylU2FXrGWF2nF7d8LyTUxsJIrKBMmudUtAbet
 phjITWG1WFl4P/YLWM=
IronPort-HdrOrdr: A9a23:Tn1MEavEYcXo+qMACPcGz/BZ7skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554399"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 31/70] x86: CFI hardening for request_irq()
Date: Mon, 14 Feb 2022 12:50:48 +0000
Message-ID: <20220214125127.17985-32-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

... and friends; alloc_direct_apic_vector() and set_direct_apic_vector().

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/apic.c                      |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce_intel.c      |  4 ++--
 xen/arch/x86/guest/xen/xen.c             |  2 +-
 xen/arch/x86/hpet.c                      |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c               |  4 ++--
 xen/arch/x86/include/asm/irq.h           | 16 ++++++++--------
 xen/arch/x86/irq.c                       |  2 +-
 xen/arch/x86/smp.c                       |  6 +++---
 xen/arch/x86/time.c                      |  3 ++-
 xen/drivers/passthrough/amd/iommu_init.c |  4 ++--
 xen/drivers/passthrough/vtd/iommu.c      |  4 ++--
 11 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 68e4d870c749..5a7a58dc9830 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1361,7 +1361,7 @@ int reprogram_timer(s_time_t timeout)
     return apic_tmict || !timeout;
 }
 
-void apic_timer_interrupt(struct cpu_user_regs * regs)
+void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     perfc_incr(apic_timer);
@@ -1380,7 +1380,7 @@ void smp_send_state_dump(unsigned int cpu)
 /*
  * Spurious interrupts should _never_ happen with our APIC/SMP architecture.
  */
-void spurious_interrupt(struct cpu_user_regs *regs)
+void cf_check spurious_interrupt(struct cpu_user_regs *regs)
 {
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
@@ -1411,7 +1411,7 @@ void spurious_interrupt(struct cpu_user_regs *regs)
  * This interrupt should never happen with our APIC/SMP architecture
  */
 
-void error_interrupt(struct cpu_user_regs *regs)
+void cf_check error_interrupt(struct cpu_user_regs *regs)
 {
     static const char *const esr_fields[] = {
         "Send CS error",
@@ -1444,7 +1444,7 @@ void error_interrupt(struct cpu_user_regs *regs)
  * This interrupt handles performance counters interrupt
  */
 
-void pmu_apic_interrupt(struct cpu_user_regs *regs)
+void cf_check pmu_apic_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     vpmu_do_interrupt(regs);
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index a691e10bdcd6..7aaa56fd02eb 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -55,7 +55,7 @@ bool __read_mostly lmce_support;
 #define MCE_RING                0x1
 static DEFINE_PER_CPU(int, last_state);
 
-static void intel_thermal_interrupt(struct cpu_user_regs *regs)
+static void cf_check intel_thermal_interrupt(struct cpu_user_regs *regs)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -639,7 +639,7 @@ static void cpu_mcheck_disable(void)
         clear_cmci();
 }
 
-static void cmci_interrupt(struct cpu_user_regs *regs)
+static void cf_check cmci_interrupt(struct cpu_user_regs *regs)
 {
     mctelem_cookie_t mctc;
     struct mca_summary bs;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index b2aa3a009b4a..17807cdea688 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -170,7 +170,7 @@ static void __init init_memmap(void)
     }
 }
 
-static void xen_evtchn_upcall(struct cpu_user_regs *regs)
+static void cf_check xen_evtchn_upcall(struct cpu_user_regs *regs)
 {
     struct vcpu_info *vcpu_info = this_cpu(vcpu_info);
     unsigned long pending;
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 7b009a930498..c31fd97579dc 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -240,8 +240,8 @@ static void handle_hpet_broadcast(struct hpet_event_channel *ch)
     }
 }
 
-static void hpet_interrupt_handler(int irq, void *data,
-        struct cpu_user_regs *regs)
+static void cf_check hpet_interrupt_handler(
+    int irq, void *data, struct cpu_user_regs *regs)
 {
     struct hpet_event_channel *ch = data;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 36c8a12cfe7d..dade08f60279 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2533,7 +2533,7 @@ static struct hvm_function_table __initdata vmx_function_table = {
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
-static void pi_wakeup_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
 {
     struct vmx_vcpu *vmx, *tmp;
     spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
@@ -2565,7 +2565,7 @@ static void pi_wakeup_interrupt(struct cpu_user_regs *regs)
 }
 
 /* Handle VT-d posted-interrupt when VCPU is running. */
-static void pi_notification_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_notification_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     this_cpu(irq_count)++;
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 7c825e9d9c0a..b3f49abc5556 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -93,14 +93,14 @@ static inline struct cpu_user_regs *set_irq_regs(struct cpu_user_regs *new_regs)
 
 #define platform_legacy_irq(irq)	((irq) < 16)
 
-void event_check_interrupt(struct cpu_user_regs *regs);
-void invalidate_interrupt(struct cpu_user_regs *regs);
-void call_function_interrupt(struct cpu_user_regs *regs);
-void apic_timer_interrupt(struct cpu_user_regs *regs);
-void error_interrupt(struct cpu_user_regs *regs);
-void pmu_apic_interrupt(struct cpu_user_regs *regs);
-void spurious_interrupt(struct cpu_user_regs *regs);
-void irq_move_cleanup_interrupt(struct cpu_user_regs *regs);
+void cf_check event_check_interrupt(struct cpu_user_regs *regs);
+void cf_check invalidate_interrupt(struct cpu_user_regs *regs);
+void cf_check call_function_interrupt(struct cpu_user_regs *regs);
+void cf_check apic_timer_interrupt(struct cpu_user_regs *regs);
+void cf_check error_interrupt(struct cpu_user_regs *regs);
+void cf_check pmu_apic_interrupt(struct cpu_user_regs *regs);
+void cf_check spurious_interrupt(struct cpu_user_regs *regs);
+void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs);
 
 uint8_t alloc_hipriority_vector(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index f43b926ed26b..61e09a356f97 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -744,7 +744,7 @@ void move_native_irq(struct irq_desc *desc)
     desc->handler->enable(desc);
 }
 
-void irq_move_cleanup_interrupt(struct cpu_user_regs *regs)
+void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs)
 {
     unsigned vector, me;
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index b9a696f61963..33748e629a21 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -246,7 +246,7 @@ static cpumask_t flush_cpumask;
 static const void *flush_va;
 static unsigned int flush_flags;
 
-void invalidate_interrupt(struct cpu_user_regs *regs)
+void cf_check invalidate_interrupt(struct cpu_user_regs *regs)
 {
     unsigned int flags = flush_flags;
     ack_APIC_irq();
@@ -385,14 +385,14 @@ void smp_send_nmi_allbutself(void)
     send_IPI_mask(&cpu_online_map, APIC_DM_NMI);
 }
 
-void event_check_interrupt(struct cpu_user_regs *regs)
+void cf_check event_check_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     perfc_incr(ipis);
     this_cpu(irq_count)++;
 }
 
-void call_function_interrupt(struct cpu_user_regs *regs)
+void cf_check call_function_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     perfc_incr(ipis);
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 3d767d70f61f..b6e690b76fab 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -196,7 +196,8 @@ static void smp_send_timer_broadcast_ipi(void)
     }
 }
 
-static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
+static void cf_check timer_interrupt(
+    int irq, void *dev_id, struct cpu_user_regs *regs)
 {
     ASSERT(local_irq_is_enabled());
 
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index cebcd68a6c04..d2ad282e93d3 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -715,8 +715,8 @@ static void cf_check do_amd_iommu_irq(void *unused)
     }
 }
 
-static void iommu_interrupt_handler(int irq, void *dev_id,
-                                    struct cpu_user_regs *regs)
+static void cf_check iommu_interrupt_handler(
+    int irq, void *dev_id, struct cpu_user_regs *regs)
 {
     unsigned long flags;
     struct amd_iommu *iommu = dev_id;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 4d7703dd9a20..fc3ff064b692 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1117,8 +1117,8 @@ static void cf_check do_iommu_page_fault(void *unused)
         __do_iommu_page_fault(drhd->iommu);
 }
 
-static void iommu_page_fault(int irq, void *dev_id,
-                             struct cpu_user_regs *regs)
+static void cf_check iommu_page_fault(
+    int irq, void *dev_id, struct cpu_user_regs *regs)
 {
     /*
      * Just flag the tasklet as runnable. This is fine, according to VT-d
-- 
2.11.0



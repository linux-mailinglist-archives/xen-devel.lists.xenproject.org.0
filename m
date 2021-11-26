Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACB45EE99
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232773.403757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawL-0002iu-KO; Fri, 26 Nov 2021 13:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232773.403757; Fri, 26 Nov 2021 13:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawL-0002fS-EG; Fri, 26 Nov 2021 13:06:57 +0000
Received: by outflank-mailman (input) for mailman id 232773;
 Fri, 26 Nov 2021 13:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavn-0002zD-FE
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a61a7074-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:06:21 +0100 (CET)
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
X-Inumbo-ID: a61a7074-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U/I9hgUec63ZCE74xwerXvfwVJ+965BYzcV6BQ/X/5M=;
  b=HDJvTva2aFT9lS5HKDei2IOHanRaESWHvH+vB5yAKdHjjWog0Shkym2u
   gEG1DGThQTNBLUgHLpCs520qPNSYY/NBiQhljoL456ISJ48CLNyO7POHX
   enQuDr987lm05QnzXTMKoMdI3a6EeqD4qDe8OuF3p9o5rprUEJhDNN2v8
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: n3wspB8X/1QGbSpyAjzvfuL4qomhOltSGM+0Zm2Q2Pk33Un/TPkkYtjGi6GIMtuUUQoMDEiEMu
 uUmDMfKd7nQ3cyICQ+kV45K3Ic+YNQ5gi8iHZLphelpTm5smDPxg7CjpDZUPJNGPpapHPb/3nu
 mTcxC4//wO/FmBeeI9jXHB11ebNPyGU73LNmM/e42HYe3nmj2Wj+eTrqnkZP8a+iJFq37Tobwi
 jOmqRJabSJ+AT9RFbg61BJdjvk9Pq/MeQVHBxwfhbn8KCB+2U3sRQbMkHKMGW1nUe9WZ8uP+Jv
 47cFs2Ad4T+vgdlvH4RSYxk+
X-SBRS: 5.1
X-MesageID: 58676456
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iw27+ayeAyOF5bWx5Oh6t+f6wSrEfRIJ4+MujC+fZmUNrF6WrkUGx
 jEbCmCFPKuONDbwe9hyb4/i8kkG6pfRzNBqTVNppSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/4y5
 9tzlZiodTdzPoGPmbU4QUNgExgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25AQQqiCO
 pRxhTxHQxrSWCVuHnksEpcQwMSViiHlXSQGkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYyGPVeLc0+8D29kKr4oAfII3pedj54PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5OORECnCBtJ6sybp1qHHa5
 xDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmohdBk0bZdYJ2OyC
 KM2he+3zMQIVJdNRfUqC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9WremJOcFzNwdeLqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:dEQ32a4TaXYTBqloTgPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676456"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 27/65] x86: Annotate fnptr targets from request_irq()
Date: Fri, 26 Nov 2021 12:34:08 +0000
Message-ID: <20211126123446.32324-28-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

...and friends; alloc_direct_apic_vector() and set_direct_apic_vector().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/apic.c                      |  8 ++++----
 xen/arch/x86/cpu/mcheck/mce_intel.c      |  4 ++--
 xen/arch/x86/guest/xen/xen.c             |  2 +-
 xen/arch/x86/hpet.c                      |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c               |  4 ++--
 xen/arch/x86/irq.c                       |  2 +-
 xen/arch/x86/smp.c                       |  6 +++---
 xen/arch/x86/time.c                      |  3 ++-
 xen/drivers/passthrough/amd/iommu_init.c |  4 ++--
 xen/drivers/passthrough/vtd/iommu.c      |  4 ++--
 xen/include/asm-x86/irq.h                | 16 ++++++++--------
 11 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index dd6cf1529f1e..07611c481b0e 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1365,7 +1365,7 @@ int reprogram_timer(s_time_t timeout)
     return apic_tmict || !timeout;
 }
 
-void apic_timer_interrupt(struct cpu_user_regs * regs)
+void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     perfc_incr(apic_timer);
@@ -1384,7 +1384,7 @@ void smp_send_state_dump(unsigned int cpu)
 /*
  * Spurious interrupts should _never_ happen with our APIC/SMP architecture.
  */
-void spurious_interrupt(struct cpu_user_regs *regs)
+void cf_check spurious_interrupt(struct cpu_user_regs *regs)
 {
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
@@ -1415,7 +1415,7 @@ void spurious_interrupt(struct cpu_user_regs *regs)
  * This interrupt should never happen with our APIC/SMP architecture
  */
 
-void error_interrupt(struct cpu_user_regs *regs)
+void cf_check error_interrupt(struct cpu_user_regs *regs)
 {
     static const char *const esr_fields[] = {
         "Send CS error",
@@ -1448,7 +1448,7 @@ void error_interrupt(struct cpu_user_regs *regs)
  * This interrupt handles performance counters interrupt
  */
 
-void pmu_apic_interrupt(struct cpu_user_regs *regs)
+void cf_check pmu_apic_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     vpmu_do_interrupt(regs);
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 239b0b32327c..f587018cd2d2 100644
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
index 37c31c08b984..b1eee802fde7 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2470,7 +2470,7 @@ static struct hvm_function_table __initdata vmx_function_table = {
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
-static void pi_wakeup_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
 {
     struct vmx_vcpu *vmx, *tmp;
     spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
@@ -2502,7 +2502,7 @@ static void pi_wakeup_interrupt(struct cpu_user_regs *regs)
 }
 
 /* Handle VT-d posted-interrupt when VCPU is running. */
-static void pi_notification_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_notification_interrupt(struct cpu_user_regs *regs)
 {
     ack_APIC_irq();
     this_cpu(irq_count)++;
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
index 9f8fdb209041..dda09f0680b3 100644
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
index 498a9ea9c9c1..ad3abdcdacfd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1085,8 +1085,8 @@ static void cf_check do_iommu_page_fault(void *unused)
         __do_iommu_page_fault(drhd->iommu);
 }
 
-static void iommu_page_fault(int irq, void *dev_id,
-                             struct cpu_user_regs *regs)
+static void cf_check iommu_page_fault(
+    int irq, void *dev_id, struct cpu_user_regs *regs)
 {
     /*
      * Just flag the tasklet as runnable. This is fine, according to VT-d
diff --git a/xen/include/asm-x86/irq.h b/xen/include/asm-x86/irq.h
index 7c825e9d9c0a..b3f49abc5556 100644
--- a/xen/include/asm-x86/irq.h
+++ b/xen/include/asm-x86/irq.h
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
 
-- 
2.11.0



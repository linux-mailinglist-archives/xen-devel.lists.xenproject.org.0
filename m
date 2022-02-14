Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839644B5177
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272071.466899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbF4-0005oc-JU; Mon, 14 Feb 2022 13:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272071.466899; Mon, 14 Feb 2022 13:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbF4-0005hS-DX; Mon, 14 Feb 2022 13:18:10 +0000
Received: by outflank-mailman (input) for mailman id 272071;
 Mon, 14 Feb 2022 13:18:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3l-0008IH-Ec
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:29 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eadbca62-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:28 +0100 (CET)
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
X-Inumbo-ID: eadbca62-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=h+vNUb1K3qAiOZwiXH80qTGxNUF4bFpNl76o3YyTOpc=;
  b=ZdeQ/hRJt896EmCTmguNr53p9h0tcZqPceGtp/Bav7CuTjfSCIHot6Mo
   ZU5igBCAoGN3oErOgyKFxHcouIvottesB7vUB8frBPnFg0SVxKZuqGSB/
   4eiiI9Ml9X/yV6XO045UU3rTeYdpSY743cEtOlCm9ccURuIHVE/WAQcRq
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KulfqVaK5LenOMOoXmgXYyGfQJJez7i9OkIgiVROgNMzcLpsHBgqp/5NBBOAJYY42wQdr78krW
 e9yWNpEzg+P9vLzUpn1zSLH9nmjSgdvgCAoDsWySONr2xE4wh++RyQttCTAFPESaO1WaqFw4he
 XTtQr0bJ4nTrbS4i/sKtDr7XMObdBUOrYBOknFiFT9Jl+Dctrh87JuTvi6CVlJEktOqEIaFde+
 EO2SIBLHPzxDo4zy6UhWzeVZKzcW5g7c2stmgKJcBfCyUe06pj8urkM80uSXiMHOxsBymKq2os
 g9hvjxtEvD8ln8+hzNoN8kdt
X-SBRS: 5.1
X-MesageID: 64050701
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:loj35q9Mz78BUR+WFwm7DrUDmXmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WseXW/TO67fZGLwL950bInjpEhU75OBnNNmHQU/pHg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhOy
 tJS7pDtGDwbL5/LqfojegBcMihHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4SRauGO
 JJAAdZpRCb5UjpdHEgOMZgdgcel11j6aDgDuV3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9GGiEmhAN4Ce
 ncm6xgpnLYM3VWvb9DECkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKXJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxRXcHQyXTUG79l8FSVCxGtamO0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDmHxvmzOLHcqjp/lluJLHDEOopX4+GAPmRogEAGms+Vm9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:jNMuyK97mfFpEJgvLhluk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64050701"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 17/70] xen: CFI hardening for open_softirq()
Date: Mon, 14 Feb 2022 12:50:34 +0000
Message-ID: <20220214125127.17985-18-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/cpu/mcheck/mce.c       | 2 +-
 xen/arch/x86/domain.c               | 2 +-
 xen/arch/x86/include/asm/flushtlb.h | 2 +-
 xen/arch/x86/pv/traps.c             | 2 +-
 xen/arch/x86/smp.c                  | 2 +-
 xen/arch/x86/time.c                 | 2 +-
 xen/common/rcupdate.c               | 2 +-
 xen/common/sched/core.c             | 6 +++---
 xen/common/tasklet.c                | 2 +-
 xen/common/timer.c                  | 2 +-
 xen/drivers/passthrough/x86/hvm.c   | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 43f6c8471a90..3467e0f1a315 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1837,7 +1837,7 @@ static int mce_delayed_action(mctelem_cookie_t mctc)
 }
 
 /* Softirq Handler for this MCE# processing */
-static void mce_softirq(void)
+static void cf_check mce_softirq(void)
 {
     static DEFINE_MCE_BARRIER(mce_inside_bar);
     static DEFINE_MCE_BARRIER(mce_severity_bar);
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f943283b2a88..1c3a1ec2a080 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2523,7 +2523,7 @@ void vcpu_mark_events_pending(struct vcpu *v)
         vcpu_kick(v);
 }
 
-static void vcpu_kick_softirq(void)
+static void cf_check vcpu_kick_softirq(void)
 {
     /*
      * Nothing to do here: we merely prevent notifiers from racing with checks
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 0be2273387ed..18777f1d4c00 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -87,7 +87,7 @@ static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp)
             __cpumask_clear_cpu(cpu, mask);
 }
 
-void new_tlbflush_clock_period(void);
+void cf_check new_tlbflush_clock_period(void);
 
 /* Read pagetable base. */
 static inline unsigned long read_cr3(void)
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 170e1030982b..97fe54b5ee5a 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -130,7 +130,7 @@ bool set_guest_nmi_trapbounce(void)
 
 static DEFINE_PER_CPU(struct vcpu *, softirq_nmi_vcpu);
 
-static void nmi_softirq(void)
+static void cf_check nmi_softirq(void)
 {
     struct vcpu **v_ptr = &this_cpu(softirq_nmi_vcpu);
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index f6fd7f95df58..b9a696f61963 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -290,7 +290,7 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
 }
 
 /* Call with no locks held and interrupts enabled (e.g., softirq context). */
-void new_tlbflush_clock_period(void)
+void cf_check new_tlbflush_clock_period(void)
 {
     cpumask_t allbutself;
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index b444d6344e79..5a72b66800e4 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1455,7 +1455,7 @@ int cpu_frequency_change(u64 freq)
 static DEFINE_PER_CPU(struct cpu_time_stamp, cpu_calibration);
 
 /* Softirq handler for per-CPU time calibration. */
-static void local_time_calibration(void)
+static void cf_check local_time_calibration(void)
 {
     struct cpu_time *t = &this_cpu(cpu_time);
     const struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 423d6b1d6d02..212a99acd8c8 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -466,7 +466,7 @@ static void __rcu_process_callbacks(struct rcu_ctrlblk *rcp,
         rcu_do_batch(rdp);
 }
 
-static void rcu_process_callbacks(void)
+static void cf_check rcu_process_callbacks(void)
 {
     struct rcu_data *rdp = &this_cpu(rcu_data);
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 285de9ee2a19..b1836b591c0a 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2568,7 +2568,7 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
     return prev->next_task;
 }
 
-static void sched_slave(void)
+static void cf_check sched_slave(void)
 {
     struct vcpu          *v, *vprev = current;
     struct sched_unit    *prev = vprev->sched_unit, *next;
@@ -2632,7 +2632,7 @@ static void sched_slave(void)
  * - deschedule the current domain (scheduler independent).
  * - pick a new domain (scheduler dependent).
  */
-static void schedule(void)
+static void cf_check schedule(void)
 {
     struct vcpu          *vnext, *vprev = current;
     struct sched_unit    *prev = vprev->sched_unit, *next = NULL;
@@ -2928,7 +2928,7 @@ const cpumask_t *sched_get_opt_cpumask(enum sched_gran opt, unsigned int cpu)
     return mask;
 }
 
-static void schedule_dummy(void)
+static void cf_check schedule_dummy(void)
 {
     sched_tasklet_check_cpu(smp_processor_id());
 }
diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
index 1b16bbcdeb0b..3ad67b5c2493 100644
--- a/xen/common/tasklet.c
+++ b/xen/common/tasklet.c
@@ -135,7 +135,7 @@ void do_tasklet(void)
 }
 
 /* Softirq context work */
-static void tasklet_softirq_action(void)
+static void cf_check tasklet_softirq_action(void)
 {
     unsigned int cpu = smp_processor_id();
     struct list_head *list = &per_cpu(softirq_tasklet_list, cpu);
diff --git a/xen/common/timer.c b/xen/common/timer.c
index b788050ea1d8..700f191a70b4 100644
--- a/xen/common/timer.c
+++ b/xen/common/timer.c
@@ -450,7 +450,7 @@ static void execute_timer(struct timers *ts, struct timer *t)
 }
 
 
-static void timer_softirq_action(void)
+static void cf_check timer_softirq_action(void)
 {
     struct timer  *t, **heap, *next;
     struct timers *ts;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 527bd6a56d83..0e3c0f6aeed3 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -1003,7 +1003,7 @@ int arch_pci_clean_pirqs(struct domain *d)
  * Note: 'pt_pirq_softirq_reset' can clear the STATE_SCHED before we get to
  * doing it. If that is the case we let 'pt_pirq_softirq_reset' do ref-counting.
  */
-static void dpci_softirq(void)
+static void cf_check dpci_softirq(void)
 {
     unsigned int cpu = smp_processor_id();
     LIST_HEAD(our_list);
-- 
2.11.0



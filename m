Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E441C45EE84
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232754.403668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauQ-000558-TX; Fri, 26 Nov 2021 13:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232754.403668; Fri, 26 Nov 2021 13:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauQ-0004xK-If; Fri, 26 Nov 2021 13:04:58 +0000
Received: by outflank-mailman (input) for mailman id 232754;
 Fri, 26 Nov 2021 13:04:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauO-0003W9-JE
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73534a72-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:04:55 +0100 (CET)
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
X-Inumbo-ID: 73534a72-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Degf477TCtQ3FmowYF+lOZnis5KOFl3+kW7P+vUMuYY=;
  b=H+XzcUyQaqH+ckcmGQTOqLsup8sn70SJQDL+Y5z6FVYnzqTl9+h0xeDy
   8DyqmUmJI9kRWWmtQpVTFV37+5LjZmrfiPuapzqw5IzuGU9o/PR89ntrz
   ixtMjQGAlwWZquwD5vDywx0bDA1UdqXVjDACTkE6MFyPE7rV6ns+MAIji
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: S1H98ih+QfrsJlL1I6ZDXlwgw168vOd0Me5EUfzsKA+uvBpAg7qucL9EQ9wkGXRfWEsnnnBk+3
 ldVtCfDSNhdFWrQFVzEkJh++lga4vNG+ppaQCeHqucJbPjYQ/WUgUgsvTsO3hN+IyOl98UYbUK
 aUiLJ5YZ1uvHGHuj+GraK1V1SoeEWb+75XWqVWg9T4JGbrZdUW/7xcBZISFDmfa+bPQt9d4qP1
 KFQb/qpjZkcHYDaXz38nrvCeooWH9bdGyr8Z5pSG649QvOiiUWd3s01cYu29tMp17DHRHV7p2t
 mjNErD6SdXLDgMSnFIAZyDFB
X-SBRS: 5.1
X-MesageID: 58634956
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bRQitqtRba3EWiS2HQ43Q83e9OfnVKNZMUV32f8akzHdYApBsoF/q
 tZmKW+BaP+NZ2r9L9BzOti2/B8EscLdzNVjSAtlpC8xRS1D+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5K2gbxsRJaL2gMsEXT1IKhlMMLIaweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5RCNWsyMnwsZTV0Jn4bEsMcrNyplyP/QgMEgmyq9aootj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMHMN2SzxKV/3TqgfXA9QvgQ54bHrC88v9sgXWQy3YVBRlQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1rMx6eysQupNhINAnYMQT89dTkI/IXa9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPdb9P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YzQPHNFBz3ohZPmLy8Bhklfy+F1e5eJFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMMuJFHao3AyOxLLt4wIrKTKufpkU
 Xt8WZzxZUv29Iw9lGbmLwvj+eNDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 i3nBxIDlgOg3SavxMfjQikLVY4DlK1X9RoTVRHA937ys5T6SYrwvqoZabUterwrqL5qwfJuF
 qFXcMScGPVfDD/A/m1FP5X6qYVjcjWthB6PYHX5MGRuIcY4Slyb4MLgcyvu6DIKUni9u/whr
 uDyzQjcW5cCGVhvVZ6EdPK1wlqtlnEBg+YuDVDQK9xedRy0oohnIiD8lNEtJMQIJUmRzzeWz
 V/OUxwZufPMs8k+99yQ3fKIqIKgEu1fGEtGHjaEsebqZHeCpmf6mN1OSueFezzZRVjYwqT6a
 LUH1ez4Pd0GgE1O79h2HYF0wP9s/NDovbJbkFhpRS2Zc1SxB7p8CXCaxs0T5LZVz7pUtAbqC
 EKC/t5WZeeANM//SQNDIQMkaqKI1O0OmymU5vMweR2o6Chy9buBcENTIxjT13ANcOoraNsok
 bU7pcobyw2jkR57YN+Jgxdd+3mIMnFdAb4ssYsXAdOzhwcmor2YjUcw1sMiDEmzVuhx
IronPort-HdrOrdr: A9a23:rbnQl67AUyJohka1ZAPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58634956"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 13/65] xen: Annotate fnptr targets from open_softirq()
Date: Fri, 26 Nov 2021 12:33:54 +0000
Message-ID: <20211126123446.32324-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mcheck/mce.c     | 2 +-
 xen/arch/x86/domain.c             | 2 +-
 xen/arch/x86/pv/traps.c           | 2 +-
 xen/arch/x86/smp.c                | 2 +-
 xen/arch/x86/time.c               | 2 +-
 xen/common/rcupdate.c             | 2 +-
 xen/common/sched/core.c           | 6 +++---
 xen/common/tasklet.c              | 2 +-
 xen/common/timer.c                | 2 +-
 xen/drivers/passthrough/x86/hvm.c | 2 +-
 xen/include/asm-x86/flushtlb.h    | 2 +-
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
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 1d1cb0784c98..3e8ca8b6fc15 100644
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
index ea34b4343c17..1ebf5fca96cc 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1450,7 +1450,7 @@ int cpu_frequency_change(u64 freq)
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
index fef350ef3a1d..7a6d9ac3d40d 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -999,7 +999,7 @@ int arch_pci_clean_pirqs(struct domain *d)
  * Note: 'pt_pirq_softirq_reset' can clear the STATE_SCHED before we get to
  * doing it. If that is the case we let 'pt_pirq_softirq_reset' do ref-counting.
  */
-static void dpci_softirq(void)
+static void cf_check dpci_softirq(void)
 {
     unsigned int cpu = smp_processor_id();
     LIST_HEAD(our_list);
diff --git a/xen/include/asm-x86/flushtlb.h b/xen/include/asm-x86/flushtlb.h
index 0be2273387ed..18777f1d4c00 100644
--- a/xen/include/asm-x86/flushtlb.h
+++ b/xen/include/asm-x86/flushtlb.h
@@ -87,7 +87,7 @@ static inline void tlbflush_filter(cpumask_t *mask, uint32_t page_timestamp)
             __cpumask_clear_cpu(cpu, mask);
 }
 
-void new_tlbflush_clock_period(void);
+void cf_check new_tlbflush_clock_period(void);
 
 /* Read pagetable base. */
 static inline unsigned long read_cr3(void)
-- 
2.11.0



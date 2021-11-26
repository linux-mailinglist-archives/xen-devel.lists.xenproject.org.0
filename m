Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B736D45EE7D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232746.403597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqau9-00031f-NS; Fri, 26 Nov 2021 13:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232746.403597; Fri, 26 Nov 2021 13:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqau9-0002zZ-KF; Fri, 26 Nov 2021 13:04:41 +0000
Received: by outflank-mailman (input) for mailman id 232746;
 Fri, 26 Nov 2021 13:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqau8-0002zD-G7
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 689e494e-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:04:38 +0100 (CET)
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
X-Inumbo-ID: 689e494e-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d55qm7ys4wdtbliZHZYDOvFk3m78eojCdUL7/+gEI38=;
  b=ADWgvW3bWisRnX1HgQM2480yXL47vAfyhJ1pQ+puoAnI5PVlMmWYlkRj
   6aDiI0LqVKTnLhwoEDTIpFa1Ujxu6hBjaXhGbqWJiXNfthHI2NUx9hb2L
   7+iXUhSBp6Zkz5iOwub77pV344A7nQtU2arIJp7xbDUAMlBQCY40E8zWe
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eMfjpNUtZLp4DNM7oTeCqCyK0Y+kMb5uhCXCmKqqA29E7UXYX6nYCm1LTAnkujYlOV8RavWB6r
 Oqt9CbiWeoq1c407E1mk5kNnHYAAxdLvmnfmxsFam97CBv1bey2QUOuCxR4KVBX/4aWA2jyRxk
 Jka2q3cNVxLEwSyUBmc+FP7kMs5KWvhwctvrrLl/52293Yq/z5sIdddJmFdD4xcuKWHLh4Vtus
 IeOTCH47y6HfmsPq3cj4ksAb/0dLHKoNkacPQxHu15Pq037tLRIayd8pFsuU2ACBNtnbpv6W1b
 jmsPgaSI1b5F49D2iE1KrRtl
X-SBRS: 5.1
X-MesageID: 59063923
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zPK6GaxIIqoa8mrV+QF6t+fCwSrEfRIJ4+MujC+fZmUNrF6WrkUEx
 mQYUWiHafmJZGP3c9xybNuz/UJV7JHTyt9nGwVvrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Nh5
 NUS8qCtcB4kNJz2sbQNUSQFNC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25EWQ62PP
 ZFxhTxHUU/pMxFSHVorGps7ubyYql30VTRBpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE4mD4DxcyJNGZjz2f/RqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHk625SS3ayqqttD64CBI8fX8AWHIjQl5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjv9tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbGK0bb1HRcBJG9GRF5iLJts4DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66PMYoQP8cgKFHbp0mCgHJ8OUi2yyDAdollZ
 P+mnTuEVy5GWcyLMhLqLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwJzLqVp
 S/kBRcDoLc97FWeQTi3hrlYQOuHdf5CQbgTZ0TA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:zY9E4qEMFK0rMObxpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59063923"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 10/65] xen: Annotate fnptr targets from init_timer()
Date: Fri, 26 Nov 2021 12:33:51 +0000
Message-ID: <20211126123446.32324-11-andrew.cooper3@citrix.com>
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
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c    |  2 +-
 xen/arch/x86/hvm/pmtimer.c             |  2 +-
 xen/arch/x86/hvm/rtc.c                 |  6 +++---
 xen/arch/x86/hvm/viridian/time.c       |  2 +-
 xen/arch/x86/hvm/vpt.c                 |  2 +-
 xen/arch/x86/irq.c                     |  4 ++--
 xen/arch/x86/nmi.c                     |  2 +-
 xen/arch/x86/time.c                    |  4 ++--
 xen/common/rcupdate.c                  |  2 +-
 xen/common/sched/core.c                | 18 +++++++++---------
 xen/common/sched/credit.c              | 10 ++++------
 xen/common/sched/credit2.c             |  2 +-
 xen/common/sched/rt.c                  |  5 +++--
 xen/drivers/char/ehci-dbgp.c           |  2 +-
 xen/drivers/char/ns16550.c             |  6 +++---
 xen/drivers/cpufreq/cpufreq_ondemand.c |  2 +-
 17 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 6e8901530a69..da0bf85f0223 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -127,7 +127,7 @@ static void mce_amd_checkregs(void *info)
  * multiple correctable errors between two polls. In that case,
  * increase polling frequency higher than normal.
  */
-static void mce_amd_work_fn(void *data)
+static void cf_check mce_amd_work_fn(void *data)
 {
 	on_each_cpu(mce_amd_checkregs, data, 1);
 
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index 2679c220a8a2..f7e411c0870e 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -67,7 +67,7 @@ static void mce_checkregs (void *info)
 	}
 }
 
-static void mce_work_fn(void *data)
+static void cf_check mce_work_fn(void *data)
 { 
 	on_each_cpu(mce_checkregs, NULL, 1);
 
diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 97b9e41712fa..808819d1de91 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -124,7 +124,7 @@ static void pmt_update_time(PMTState *s)
 /* This function should be called soon after each time the MSB of the
  * pmtimer register rolls over, to make sure we update the status
  * registers and SCI at least once per rollover */
-static void pmt_timer_callback(void *opaque)
+static void cf_check pmt_timer_callback(void *opaque)
 {
     PMTState *s = opaque;
     uint32_t pmt_cycles_until_flip;
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 3150f5f1479b..09d3501276bc 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -217,7 +217,7 @@ static void check_update_timer(RTCState *s)
         s->use_timer = 0;
 }
 
-static void rtc_update_timer(void *opaque)
+static void cf_check rtc_update_timer(void *opaque)
 {
     RTCState *s = opaque;
 
@@ -230,7 +230,7 @@ static void rtc_update_timer(void *opaque)
     spin_unlock(&s->lock);
 }
 
-static void rtc_update_timer2(void *opaque)
+static void cf_check rtc_update_timer2(void *opaque)
 {
     RTCState *s = opaque;
 
@@ -421,7 +421,7 @@ static void alarm_timer_update(RTCState *s)
     }
 }
 
-static void rtc_alarm_cb(void *opaque)
+static void cf_check rtc_alarm_cb(void *opaque)
 {
     RTCState *s = opaque;
 
diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 24ff117edb20..b56fd6766292 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -126,7 +126,7 @@ static void stop_stimer(struct viridian_stimer *vs)
     vs->started = false;
 }
 
-static void stimer_expire(void *data)
+static void cf_check stimer_expire(void *data)
 {
     struct viridian_stimer *vs = data;
     struct vcpu *v = vs->v;
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 6fdc3e19fe8c..cb1d81bf9e82 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -271,7 +271,7 @@ void pt_restore_timer(struct vcpu *v)
     pt_vcpu_unlock(v);
 }
 
-static void pt_timer_fn(void *data)
+static void cf_check pt_timer_fn(void *data)
 {
     struct periodic_time *pt = data;
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index bcf46cd54d16..f9c808455535 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -935,7 +935,7 @@ void alloc_direct_apic_vector(
     spin_unlock(&lock);
 }
 
-static void irq_ratelimit_timer_fn(void *data)
+static void cf_check irq_ratelimit_timer_fn(void *data)
 {
     struct irq_desc *desc, *tmp;
     unsigned long flags;
@@ -1129,7 +1129,7 @@ static inline void clear_pirq_eoi(struct domain *d, unsigned int irq)
 
 static void set_eoi_ready(void *data);
 
-static void irq_guest_eoi_timer_fn(void *data)
+static void cf_check irq_guest_eoi_timer_fn(void *data)
 {
     struct irq_desc *desc = data;
     unsigned int i, irq = desc - irq_desc;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 5c101a9f97b3..c8ae4a5d7460 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -211,7 +211,7 @@ void __init check_nmi_watchdog(void)
     return;
 }
 
-static void nmi_timer_fn(void *unused)
+static void cf_check nmi_timer_fn(void *unused)
 {
     this_cpu(nmi_timer_ticks)++;
     set_timer(&this_cpu(nmi_timer), NOW() + MILLISECS(1000));
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 4ab0cf6731e3..b60c614bab6e 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -810,7 +810,7 @@ static s_time_t __read_platform_stime(u64 platform_time)
     return (stime_platform_stamp + scale_delta(diff, &plt_scale));
 }
 
-static void plt_overflow(void *unused)
+static void cf_check plt_overflow(void *unused)
 {
     int i;
     u64 count;
@@ -1850,7 +1850,7 @@ static void time_calibration_nop_rendezvous(void *rv)
 static void (*time_calibration_rendezvous_fn)(void *) =
     time_calibration_std_rendezvous;
 
-static void time_calibration(void *unused)
+static void cf_check time_calibration(void *unused)
 {
     struct calibration_rendezvous r = {
         .semaphore = ATOMIC_INIT(0)
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 2ec5606de5dd..f9dd2584a8b7 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -575,7 +575,7 @@ static void rcu_idle_timer_stop(void)
         stop_timer(&rdp->idle_timer);
 }
 
-static void rcu_idle_timer_handler(void* data)
+static void cf_check rcu_idle_timer_handler(void* data)
 {
     perfc_incr(rcu_idle_timer);
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 4a79971a1d45..cf1ba01b4d87 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -71,10 +71,10 @@ cpumask_t sched_res_mask;
 static DEFINE_SPINLOCK(sched_free_cpu_lock);
 
 /* Various timer handlers. */
-static void s_timer_fn(void *unused);
-static void vcpu_periodic_timer_fn(void *data);
-static void vcpu_singleshot_timer_fn(void *data);
-static void poll_timer_fn(void *data);
+static void cf_check s_timer_fn(void *unused);
+static void cf_check vcpu_periodic_timer_fn(void *data);
+static void cf_check vcpu_singleshot_timer_fn(void *data);
+static void cf_check poll_timer_fn(void *data);
 
 /* This is global for now so that private implementations can reach it */
 DEFINE_PER_CPU_READ_MOSTLY(struct sched_resource *, sched_res);
@@ -1535,7 +1535,7 @@ long vcpu_yield(void)
     return 0;
 }
 
-static void domain_watchdog_timeout(void *data)
+static void cf_check domain_watchdog_timeout(void *data)
 {
     struct domain *d = data;
 
@@ -2697,28 +2697,28 @@ static void schedule(void)
 }
 
 /* The scheduler timer: force a run through the scheduler */
-static void s_timer_fn(void *unused)
+static void cf_check s_timer_fn(void *unused)
 {
     raise_softirq(SCHEDULE_SOFTIRQ);
     SCHED_STAT_CRANK(sched_irq);
 }
 
 /* Per-VCPU periodic timer function: sends a virtual timer interrupt. */
-static void vcpu_periodic_timer_fn(void *data)
+static void cf_check vcpu_periodic_timer_fn(void *data)
 {
     struct vcpu *v = data;
     vcpu_periodic_timer_work(v);
 }
 
 /* Per-VCPU single-shot timer function: sends a virtual timer interrupt. */
-static void vcpu_singleshot_timer_fn(void *data)
+static void cf_check vcpu_singleshot_timer_fn(void *data)
 {
     struct vcpu *v = data;
     send_timer_event(v);
 }
 
 /* SCHEDOP_poll timeout callback. */
-static void poll_timer_fn(void *data)
+static void cf_check poll_timer_fn(void *data)
 {
     struct vcpu *v = data;
 
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index d0aa017c643e..5635271f6fea 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -230,8 +230,8 @@ struct csched_private {
     struct timer master_ticker;
 };
 
-static void csched_tick(void *_cpu);
-static void csched_acct(void *dummy);
+static void cf_check csched_tick(void *_cpu);
+static void cf_check csched_acct(void *dummy);
 
 static inline int
 __unit_on_runq(const struct csched_unit *svc)
@@ -1356,8 +1356,7 @@ csched_runq_sort(struct csched_private *prv, unsigned int cpu)
     pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
 }
 
-static void
-csched_acct(void* dummy)
+static void cf_check csched_acct(void* dummy)
 {
     struct csched_private *prv = dummy;
     unsigned long flags;
@@ -1563,8 +1562,7 @@ csched_acct(void* dummy)
     set_timer( &prv->master_ticker, NOW() + prv->tslice);
 }
 
-static void
-csched_tick(void *_cpu)
+static void cf_check csched_tick(void *_cpu)
 {
     unsigned int cpu = (unsigned long)_cpu;
     const struct sched_resource *sr = get_sched_res(cpu);
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index a5f073cda51e..d96e2749ddfb 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2072,7 +2072,7 @@ static inline void do_replenish(struct csched2_dom *sdom)
     sdom->budget += sdom->tot_budget;
 }
 
-static void replenish_domain_budget(void* data)
+static void cf_check replenish_domain_budget(void *data)
 {
     struct csched2_dom *sdom = data;
     unsigned long flags;
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index c24cd2ac3200..5ea6f01f263c 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -173,7 +173,7 @@
 #define TRC_RTDS_SCHED_TASKLET    TRC_SCHED_CLASS_EVT(RTDS, 5)
 #define TRC_RTDS_SCHEDULE         TRC_SCHED_CLASS_EVT(RTDS, 6)
 
-static void repl_timer_handler(void *data);
+static void cf_check repl_timer_handler(void *data);
 
 /*
  * System-wide private data, include global RunQueue/DepletedQ
@@ -1452,7 +1452,8 @@ rt_dom_cntl(
  * The replenishment timer handler picks units
  * from the replq and does the actual replenishment.
  */
-static void repl_timer_handler(void *data){
+static void cf_check repl_timer_handler(void *data)
+{
     s_time_t now;
     const struct scheduler *ops = data;
     struct rt_private *prv = rt_priv(ops);
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index c893d246defa..a6b57fdf2d19 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1289,7 +1289,7 @@ static void _ehci_dbgp_poll(struct cpu_user_regs *regs)
     set_timer(&dbgp->timer, NOW() + timeout);
 }
 
-static void ehci_dbgp_poll(void *data)
+static void cf_check ehci_dbgp_poll(void *data)
 {
     poll_port = data;
 #ifdef run_in_exception_handler
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 30596d60d4ed..990cad39fe85 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -111,7 +111,7 @@ struct ns16550_config_param {
 static void enable_exar_enhanced_bits(const struct ns16550 *uart);
 #endif
 
-static void ns16550_delayed_resume(void *data);
+static void cf_check ns16550_delayed_resume(void *data);
 
 static u8 ns_read_reg(const struct ns16550 *uart, unsigned int reg)
 {
@@ -229,7 +229,7 @@ static void __ns16550_poll(struct cpu_user_regs *regs)
     set_timer(&uart->timer, NOW() + MILLISECS(uart->timeout_ms));
 }
 
-static void ns16550_poll(void *data)
+static void cf_check ns16550_poll(void *data)
 {
     this_cpu(poll_port) = data;
 #ifdef run_in_exception_handler
@@ -532,7 +532,7 @@ static void _ns16550_resume(struct serial_port *port)
 }
 
 static int delayed_resume_tries;
-static void ns16550_delayed_resume(void *data)
+static void cf_check ns16550_delayed_resume(void *data)
 {
     struct serial_port *port = data;
     struct ns16550 *uart = port->uart;
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index cabd9ffa8886..ba03eaa2336d 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -172,7 +172,7 @@ static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
     }
 }
 
-static void do_dbs_timer(void *dbs)
+static void cf_check do_dbs_timer(void *dbs)
 {
     struct cpu_dbs_info_s *dbs_info = (struct cpu_dbs_info_s *)dbs;
 
-- 
2.11.0



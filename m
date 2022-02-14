Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710074B5104
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271649.466261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2M-0002bv-PG; Mon, 14 Feb 2022 13:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271649.466261; Mon, 14 Feb 2022 13:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2M-0002WP-BJ; Mon, 14 Feb 2022 13:05:02 +0000
Received: by outflank-mailman (input) for mailman id 271649;
 Mon, 14 Feb 2022 13:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2J-00023t-HR
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44e322f-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:04:56 +0100 (CET)
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
X-Inumbo-ID: b44e322f-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EY8ZkarZcewNBxs9p+GIs0w3h02UIU90azGWZSpiIn8=;
  b=OPx2bTsGVKk/62xkkCWnEYIam2zc40r8dNaavU1wSyynBFx+//M1zkrV
   pobGNGB9Fu/qah8WF+Ay239riHTBhtIWEM4Rc5pHLGUZBKC9/Y70carTR
   9izE0looKvP3jVrU6ffUh3AEOy3PSeJr8UbS5IjT6irMFy8n0kjeCRpXt
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lrGRbVeK6QOXSw5wAUcVhWcw7xA8/bUr8mDWXFRSxZpgxHVy02daTvWPD8OITqMjreflBfYFav
 +yyMZ5ougwpaZ56EPOY33dIfArG99TFW3Cn2p78/E3yB3QxLOKhgjRFtQERfGRJH9tlHTD2hlL
 8g4FO0eWLCaIRtdXOuMngBwtPVB35bqzJi9eWiupePa1m4/ormn/FSbVthalZ4ahKoDdKjhNiC
 D6M1a6o0HutMBDhRjv+zFDUYWph7F+iYLtuscB6qVRK8Z2+2sSJiIEI1PcxumX6B1bN/TZFH5b
 lXIoxcXKGR7IobCA5G8LuCMx
X-SBRS: 5.1
X-MesageID: 64149659
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RlvXQqm8pA1lK+JTilOzsl7o5gyeIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKW2mBOvmKMDD9f4glbtvioE4Ov5SHmtRqGVNkqCAxESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MQOiYa2bwknB7LRk9pNcyRXPhF7MJQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qHO
 5tHNGsHgBLobQETJA0xT4oEgbmTrSXQWTxCknaxqv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTZW4JPOTmrLgw2gTVnzFNTk1NPbemnRWnol/9Z8hZD
 UIawzUzppZi1HGkY+n4UiTt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4c9JRVDA1nJRoHGJ3j
 zdli/usXGUy6+PNFRpx45/J9WvaBMQDEYMVicbopyMh6sKrnow8hwmnoj1LQP/s1Y2d9d0dL
 lm3QMkCa1c70JRjO0aTpwmvb9eQSn/hFFBd2+kvdjj5hj6Vnab8D2BS1XDV7OxbMKGSRUSbs
 X4PlqC2tb5SUc7dxHHQGLxWRtlFAspp1xWG3zZS82QJrWzxqxZPg6gMiN2BGKuZGpldImK4C
 KMikQhQ+IVSLBOXgVxfOOqM5zAR5fG4T7zND6mMBvIXO8QZXFLXrUlGOB/Lt0iwwRdErE3KE
 crCGSpaJS1BUvoPIfvfb7p17ILHMQhgmT2NFcqmk3xKE9O2PRaodFvMC3PWBshR0U9OiFm9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:eA9V96uD7sAP5RijWtAMYd087skDdNV00zEX/kB9WHVpmszxra
 6TdZUgpGbJYVkqOE3I9ertBEDEewK4yXcX2/h2AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YGT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149659"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 14/70] xen: CFI hardening for init_timer()
Date: Mon, 14 Feb 2022 12:50:31 +0000
Message-ID: <20220214125127.17985-15-andrew.cooper3@citrix.com>
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
index 14f7d3fd635e..fac97023bf10 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -815,7 +815,7 @@ static s_time_t __read_platform_stime(u64 platform_time)
     return (stime_platform_stamp + scale_delta(diff, &plt_scale));
 }
 
-static void plt_overflow(void *unused)
+static void cf_check plt_overflow(void *unused)
 {
     int i;
     u64 count;
@@ -1855,7 +1855,7 @@ static void time_calibration_nop_rendezvous(void *rv)
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



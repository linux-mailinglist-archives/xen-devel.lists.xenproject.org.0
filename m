Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE744CB3E1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 01:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282639.481424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPZWW-0007R2-6i; Thu, 03 Mar 2022 00:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282639.481424; Thu, 03 Mar 2022 00:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPZWW-0007OI-3C; Thu, 03 Mar 2022 00:40:52 +0000
Received: by outflank-mailman (input) for mailman id 282639;
 Thu, 03 Mar 2022 00:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++p5=TO=citrix.com=prvs=054f29298=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPZWV-0007OC-1T
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 00:40:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 910642e1-9a8a-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 01:40:48 +0100 (CET)
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
X-Inumbo-ID: 910642e1-9a8a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646268048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3wDk5sjgceGIpGYWpd8sSIy5+b30C+/+xACaZX5XfAo=;
  b=UOqxcTXsRdtc3RiOXdQxbP+xjLGGWxeI7NeuthA+KYLVxn3ujrlQeRaY
   0y/hv6XTZHqxZ3Ba3Q9bl6SRBjR7DsOgIlt9VHNqpCKudx+02RZDNvZIR
   fAezV6LvZSp7m9cohGzTXgGCYe+zVJF3ArJCRnhgc7gbp6HRAChb66eJ6
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65355541
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:etSnw6CDt5MBOxVW/wrjw5YqxClBgxIJ4kV8jS/XYbTApGsn0zRSy
 zBOWmyGaaqCMWL2eot0PYXi8UxX657cx4U3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh2NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh1z
 vBilLmLSjwbEbfLisRAaBZdNTtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4TRquDO
 pZAAdZpRCqbUjBMZBAdMb8zmuyHoCWmcSRYjU3A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkWOtWQxjuC9nOEnfLUkGXwX4d6PJ+S++NugVaT7ncOExBQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LThplZK0bEmezYW7tzSgGXUuImokfwZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2KBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBuq7t3N702wcH83wdG9KFoSTLkWd4umwWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq5CKqIMIYfOccsLWdrGR2Cg2bKhQgBd2B2zMkC1
 WqzK57wXR7294w9pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29Et843K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ+x/UFzrqTp
 yrlMqKaoXKm7UD6xcyxQigLQNvSsVxX9BrX4QRE0Y6U5kUe
IronPort-HdrOrdr: A9a23:ZD9e1qrazpyTbYVHTa/HV0oaV5oleYIsimQD101hICG8cqSj9v
 xG+85rsyMc6QxhP03I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOj9K1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.90,150,1643691600"; 
   d="scan'208";a="65355541"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH RFC] xen/sched: Optimise when only one scheduler is compiled in
Date: Thu, 3 Mar 2022 00:40:15 +0000
Message-ID: <20220303004015.17688-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When only one scheduler is compiled in, function pointers can be optimised to
direct calls, and the hooks hardened against controlflow hijacking.

RFC for several reasons.

1) There's an almost beautiful way of not introducing MAYBE_SCHED() and hiding
   the magic in REGISTER_SCHEDULER(), except it falls over
   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91765 which has no comment or
   resolution at all.

2) A different alternative which almost works is to remove the indirection in
   .data.schedulers, but the singleton scheduler object can't be both there
   and in .init.rodata.cf_clobber.

3) I can't think of a way of build time check to enforce that new schedulers
   get added to the preprocessor magic.

And the blocker:
4) This isn't compatible with how sched_idle_ops get used for granularity > 1.

Suggestions very welcome.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
---
 xen/common/sched/arinc653.c |  2 +-
 xen/common/sched/core.c     |  4 +-
 xen/common/sched/credit.c   |  2 +-
 xen/common/sched/credit2.c  |  2 +-
 xen/common/sched/null.c     |  2 +-
 xen/common/sched/private.h  | 91 ++++++++++++++++++++++++++++++++-------------
 xen/common/sched/rt.c       |  2 +-
 7 files changed, 72 insertions(+), 33 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index a82c0d7314a1..73738b007e7d 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -694,7 +694,7 @@ a653sched_adjust_global(const struct scheduler *ops,
  * callback functions.
  * The symbol must be visible to the rest of Xen at link time.
  */
-static const struct scheduler sched_arinc653_def = {
+const struct scheduler MAYBE_SCHED(sched_arinc653_def) = {
     .name           = "ARINC 653 Scheduler",
     .opt_name       = "arinc653",
     .sched_id       = XEN_SCHEDULER_ARINC653,
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab67818106..020a5741ca31 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2263,7 +2263,7 @@ static struct sched_unit *do_schedule(struct sched_unit *prev, s_time_t now,
     struct sched_unit *next;
 
     /* get policy-specific decision on scheduling... */
-    sched->do_schedule(sched, prev, now, sched_tasklet_check(cpu));
+    sched_vcall(sched, do_schedule, sched, prev, now, sched_tasklet_check(cpu));
 
     next = prev->next_task;
 
@@ -2975,7 +2975,7 @@ void __init scheduler_init(void)
 
 #undef sched_test_func
 
-        if ( schedulers[i]->global_init && schedulers[i]->global_init() < 0 )
+        if ( sched_global_init(schedulers[i]) < 0 )
         {
             printk("scheduler %s failed initialization, dropped\n",
                    schedulers[i]->opt_name);
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 4d3bd8cba6fc..8b85e9617fc0 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -2230,7 +2230,7 @@ csched_deinit(struct scheduler *ops)
     }
 }
 
-static const struct scheduler sched_credit_def = {
+const struct scheduler MAYBE_SCHED(sched_credit_def) = {
     .name           = "SMP Credit Scheduler",
     .opt_name       = "credit",
     .sched_id       = XEN_SCHEDULER_CREDIT,
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 0e3f89e5378e..fda3812d7ac1 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -4199,7 +4199,7 @@ csched2_deinit(struct scheduler *ops)
     xfree(prv);
 }
 
-static const struct scheduler sched_credit2_def = {
+const struct scheduler MAYBE_SCHED(sched_credit2_def) = {
     .name           = "SMP Credit Scheduler rev2",
     .opt_name       = "credit2",
     .sched_id       = XEN_SCHEDULER_CREDIT2,
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 65a0a6c5312d..907a8ae1ca50 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -1025,7 +1025,7 @@ static void cf_check null_dump(const struct scheduler *ops)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static const struct scheduler sched_null_def = {
+const struct scheduler MAYBE_SCHED(sched_null_def) = {
     .name           = "null Scheduler",
     .opt_name       = "null",
     .sched_id       = XEN_SCHEDULER_NULL,
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index a870320146ef..f3ba0101ecc7 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -271,6 +271,33 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
     return NULL;
 }
 
+#if 1 ==                                                                \
+    defined(CONFIG_SCHED_CREDIT) + defined(CONFIG_SCHED_CREDIT2) +      \
+    defined(CONFIG_SCHED_RTDS) + defined(CONFIG_SCHED_ARINC653) +       \
+    defined(CONFIG_SCHED_NULL)
+
+extern const struct scheduler sched_ops;
+#define MAYBE_SCHED(x) __initdata_cf_clobber sched_ops
+#define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
+  __used_section(".data.schedulers") = &sched_ops;
+
+#define sched_call(s, fn, ...) \
+    alternative_call(sched_ops.fn, ##__VA_ARGS__)
+
+#define sched_vcall(s, fn, ...) \
+    alternative_vcall(sched_ops.fn, ##__VA_ARGS__)
+
+#else
+
+#define MAYBE_SCHED(x) static x
+#define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
+  __used_section(".data.schedulers") = &x;
+
+#define sched_call(s, fn, ...)  (s)->fn(__VA_ARGS__)
+#define sched_vcall(s, fn, ...) (s)->fn(__VA_ARGS__)
+
+#endif
+
 struct scheduler {
     const char *name;       /* full name for this scheduler      */
     const char *opt_name;   /* option name for this scheduler    */
@@ -333,39 +360,48 @@ struct scheduler {
     void         (*dump_cpu_state) (const struct scheduler *, int);
 };
 
+static inline int sched_global_init(const struct scheduler *s)
+{
+    if ( s->global_init )
+        return sched_call(s, global_init);
+    return 0;
+}
+
 static inline int sched_init(struct scheduler *s)
 {
-    return s->init(s);
+    return sched_call(s, init, s);
 }
 
 static inline void sched_deinit(struct scheduler *s)
 {
-    s->deinit(s);
+    sched_vcall(s, deinit, s);
 }
 
 static inline spinlock_t *sched_switch_sched(struct scheduler *s,
                                              unsigned int cpu,
                                              void *pdata, void *vdata)
 {
-    return s->switch_sched(s, cpu, pdata, vdata);
+    return sched_call(s, switch_sched, s, cpu, pdata, vdata);
 }
 
 static inline void sched_dump_settings(const struct scheduler *s)
 {
     if ( s->dump_settings )
-        s->dump_settings(s);
+        sched_vcall(s, dump_settings, s);
 }
 
 static inline void sched_dump_cpu_state(const struct scheduler *s, int cpu)
 {
     if ( s->dump_cpu_state )
-        s->dump_cpu_state(s, cpu);
+        sched_vcall(s, dump_cpu_state, s, cpu);
 }
 
 static inline void *sched_alloc_domdata(const struct scheduler *s,
                                         struct domain *d)
 {
-    return s->alloc_domdata ? s->alloc_domdata(s, d) : NULL;
+    if ( s->alloc_domdata )
+        return sched_call(s, alloc_domdata, s, d);
+    return NULL;
 }
 
 static inline void sched_free_domdata(const struct scheduler *s,
@@ -373,12 +409,14 @@ static inline void sched_free_domdata(const struct scheduler *s,
 {
     ASSERT(s->free_domdata || !data);
     if ( s->free_domdata )
-        s->free_domdata(s, data);
+        sched_vcall(s, free_domdata, s, data);
 }
 
 static inline void *sched_alloc_pdata(const struct scheduler *s, int cpu)
 {
-    return s->alloc_pdata ? s->alloc_pdata(s, cpu) : NULL;
+    if ( s->alloc_pdata )
+        return sched_call(s, alloc_pdata, s, cpu);
+    return NULL;
 }
 
 static inline void sched_free_pdata(const struct scheduler *s, void *data,
@@ -386,74 +424,74 @@ static inline void sched_free_pdata(const struct scheduler *s, void *data,
 {
     ASSERT(s->free_pdata || !data);
     if ( s->free_pdata )
-        s->free_pdata(s, data, cpu);
+        sched_vcall(s, free_pdata, s, data, cpu);
 }
 
 static inline void sched_deinit_pdata(const struct scheduler *s, void *data,
                                       int cpu)
 {
     if ( s->deinit_pdata )
-        s->deinit_pdata(s, data, cpu);
+        sched_vcall(s, deinit_pdata, s, data, cpu);
 }
 
 static inline void *sched_alloc_udata(const struct scheduler *s,
                                       struct sched_unit *unit, void *dom_data)
 {
-    return s->alloc_udata(s, unit, dom_data);
+    return sched_call(s, alloc_udata, s, unit, dom_data);
 }
 
 static inline void sched_free_udata(const struct scheduler *s, void *data)
 {
-    s->free_udata(s, data);
+    sched_vcall(s, free_udata, s, data);
 }
 
 static inline void sched_insert_unit(const struct scheduler *s,
                                      struct sched_unit *unit)
 {
     if ( s->insert_unit )
-        s->insert_unit(s, unit);
+        sched_vcall(s, insert_unit, s, unit);
 }
 
 static inline void sched_remove_unit(const struct scheduler *s,
                                      struct sched_unit *unit)
 {
     if ( s->remove_unit )
-        s->remove_unit(s, unit);
+        sched_vcall(s, remove_unit, s, unit);
 }
 
 static inline void sched_sleep(const struct scheduler *s,
                                struct sched_unit *unit)
 {
     if ( s->sleep )
-        s->sleep(s, unit);
+        sched_vcall(s, sleep, s, unit);
 }
 
 static inline void sched_wake(const struct scheduler *s,
                               struct sched_unit *unit)
 {
     if ( s->wake )
-        s->wake(s, unit);
+        sched_vcall(s, wake, s, unit);
 }
 
 static inline void sched_yield(const struct scheduler *s,
                                struct sched_unit *unit)
 {
     if ( s->yield )
-        s->yield(s, unit);
+        sched_vcall(s, yield, s, unit);
 }
 
 static inline void sched_context_saved(const struct scheduler *s,
                                        struct sched_unit *unit)
 {
     if ( s->context_saved )
-        s->context_saved(s, unit);
+        sched_vcall(s, context_saved, s, unit);
 }
 
 static inline void sched_migrate(const struct scheduler *s,
                                  struct sched_unit *unit, unsigned int cpu)
 {
     if ( s->migrate )
-        s->migrate(s, unit, cpu);
+        sched_vcall(s, migrate, s, unit, cpu);
     else
         sched_set_res(unit, get_sched_res(cpu));
 }
@@ -461,7 +499,7 @@ static inline void sched_migrate(const struct scheduler *s,
 static inline struct sched_resource *sched_pick_resource(
     const struct scheduler *s, const struct sched_unit *unit)
 {
-    return s->pick_resource(s, unit);
+    return sched_call(s, pick_resource, s, unit);
 }
 
 static inline void sched_adjust_affinity(const struct scheduler *s,
@@ -470,19 +508,23 @@ static inline void sched_adjust_affinity(const struct scheduler *s,
                                          const cpumask_t *soft)
 {
     if ( s->adjust_affinity )
-        s->adjust_affinity(s, unit, hard, soft);
+        sched_vcall(s, adjust_affinity, s, unit, hard, soft);
 }
 
 static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
                                    struct xen_domctl_scheduler_op *op)
 {
-    return s->adjust ? s->adjust(s, d, op) : 0;
+    if ( s->adjust )
+        return sched_call(s, adjust, s, d, op);
+    return 0;
 }
 
 static inline int sched_adjust_cpupool(const struct scheduler *s,
                                        struct xen_sysctl_scheduler_op *op)
 {
-    return s->adjust_global ? s->adjust_global(s, op) : 0;
+    if ( s->adjust_global )
+        return sched_call(s, adjust_global, s, op);
+    return 0;
 }
 
 static inline void sched_unit_pause_nosync(const struct sched_unit *unit)
@@ -501,9 +543,6 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
         vcpu_unpause(v);
 }
 
-#define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
-  __used_section(".data.schedulers") = &x;
-
 struct cpupool
 {
     unsigned int     cpupool_id;
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index d6de25531b3c..9b42852b2de5 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -1529,7 +1529,7 @@ static void cf_check repl_timer_handler(void *data)
     spin_unlock_irq(&prv->lock);
 }
 
-static const struct scheduler sched_rtds_def = {
+const struct scheduler MAYBE_SCHED(sched_rtds_def) = {
     .name           = "SMP RTDS Scheduler",
     .opt_name       = "rtds",
     .sched_id       = XEN_SCHEDULER_RTDS,
-- 
2.11.0



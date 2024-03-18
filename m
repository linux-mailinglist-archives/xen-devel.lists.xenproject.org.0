Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515AB87EDA8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694894.1084147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy0-0006Kh-C6; Mon, 18 Mar 2024 16:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694894.1084147; Mon, 18 Mar 2024 16:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy0-0006Ii-6v; Mon, 18 Mar 2024 16:36:04 +0000
Received: by outflank-mailman (input) for mailman id 694894;
 Mon, 18 Mar 2024 16:36:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFxy-0005JO-GX
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:36:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b45409c-e545-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:36:01 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a466e53f8c0so596821666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:36:01 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:35:59 -0700 (PDT)
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
X-Inumbo-ID: 9b45409c-e545-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779760; x=1711384560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1+TIJTTe6vbKVkQQzyzQLjvyWxN7MN/m4K6cIC1Be8=;
        b=BEx6t+/fYEi0z4xNzfjvmCcvyoMB5WwnxfquByAEHBE/Oc0nIC8tXT6H7kO0VpanAP
         FLBVxlNhkcp9DSGFteZP1NmtyDqP16F/QUJsoHYuww9/OdAVQT3h5P/zmsVq9z2vbabB
         hpk4IujbC8neqLhYqEoybc4uKgWIdfKExNE3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779760; x=1711384560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1+TIJTTe6vbKVkQQzyzQLjvyWxN7MN/m4K6cIC1Be8=;
        b=Rtwolck9/w7cevKYGRWazWW9vXWaPKoyPfush12/njQglg8v6vaesiOktJ2J7DpI15
         1TecVEHZAZzhCI3R7ir64aaLphn0RKGQXRqqtbEYMJ9VL3zD3lSKH+IpD8n9JpbURMZs
         x0PMbL59KI9dI5FIPQ60CN2+aM58y9ti86s72NG/ZWhS6P1gNlHT4FiZyZ2OHUK7JD8S
         WwFK6hvkEh1wZDz37haA+f6mMq0MUhkqra5nogQtRLm3kkZTJPU6Hf/pND9/pCVsTjaM
         pMhyKs2GeIo4rpGIDGRZegn8CmkqmP2CdijbESrgeQaD7/K9a2KzPUwI84EhJZmUYT88
         UEew==
X-Gm-Message-State: AOJu0YxOT+BT9oXOSgWa8/Cis5imkHrV26CcnX/suF3Yk86T82K7XeR7
	DvmjZJt01RECaVUQCFTTJsrMIufB49flgx/FA5LXRIcwDuseDjbGn6aUyTx31SqtfgxAqGwf7Zq
	x
X-Google-Smtp-Source: AGHT+IHztVPDUb2EwfK3dSyLyDrjgOO2EjrU9wAG3xcUThSleC6DVoqlKx6XIX8tPFsUp+jSg2NgPA==
X-Received: by 2002:a17:907:807:b0:a46:c06f:669e with SMTP id wv7-20020a170907080700b00a46c06f669emr2914527ejb.7.1710779760447;
        Mon, 18 Mar 2024 09:36:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 4/7] xen/sched: Clean up trace handling
Date: Mon, 18 Mar 2024 16:35:49 +0000
Message-Id: <20240318163552.3808695-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need for bitfields anywhere - use more sensible types.  There is
also no need to cast 'd' to (unsigned char *) before passing it to a function
taking void *.  Switch to new trace_time() API.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

v2:
 * New.
v3:
 * Rebase over core API changes.
---
 xen/common/sched/core.c   | 56 +++++++++++++++----------------
 xen/common/sched/credit.c | 70 ++++++++++++++++++---------------------
 xen/common/sched/null.c   | 63 ++++++++++++++++++++---------------
 3 files changed, 97 insertions(+), 92 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 3e48da1cdd4e..cd662280bbad 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -205,7 +205,7 @@ static inline struct scheduler *vcpu_scheduler(const struct vcpu *v)
 
 static inline void trace_runstate_change(const struct vcpu *v, int new_state)
 {
-    struct { uint32_t vcpu:16, domain:16; } d;
+    struct { uint16_t vcpu, domain; } d;
     uint32_t event;
 
     if ( likely(!tb_init_done) )
@@ -218,12 +218,12 @@ static inline void trace_runstate_change(const struct vcpu *v, int new_state)
     event |= ( v->runstate.state & 0x3 ) << 8;
     event |= ( new_state & 0x3 ) << 4;
 
-    __trace_var(event, 1/*tsc*/, sizeof(d), &d);
+    trace_time(event, sizeof(d), &d);
 }
 
 static inline void trace_continue_running(const struct vcpu *v)
 {
-    struct { uint32_t vcpu:16, domain:16; } d;
+    struct { uint16_t vcpu, domain; } d;
 
     if ( likely(!tb_init_done) )
         return;
@@ -231,7 +231,7 @@ static inline void trace_continue_running(const struct vcpu *v)
     d.vcpu = v->vcpu_id;
     d.domain = v->domain->domain_id;
 
-    __trace_var(TRC_SCHED_CONTINUE_RUNNING, 1/*tsc*/, sizeof(d), &d);
+    trace_time(TRC_SCHED_CONTINUE_RUNNING, sizeof(d), &d);
 }
 
 static inline void vcpu_urgent_count_update(struct vcpu *v)
@@ -872,7 +872,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
         return ret;
 
     SCHED_STAT_CRANK(dom_init);
-    TRACE_1D(TRC_SCHED_DOM_ADD, d->domain_id);
+    TRACE_TIME(TRC_SCHED_DOM_ADD, d->domain_id);
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -895,7 +895,7 @@ void sched_destroy_domain(struct domain *d)
     if ( d->cpupool )
     {
         SCHED_STAT_CRANK(dom_destroy);
-        TRACE_1D(TRC_SCHED_DOM_REM, d->domain_id);
+        TRACE_TIME(TRC_SCHED_DOM_REM, d->domain_id);
 
         rcu_read_lock(&sched_res_rculock);
 
@@ -936,7 +936,7 @@ void vcpu_sleep_nosync(struct vcpu *v)
     unsigned long flags;
     spinlock_t *lock;
 
-    TRACE_2D(TRC_SCHED_SLEEP, v->domain->domain_id, v->vcpu_id);
+    TRACE_TIME(TRC_SCHED_SLEEP, v->domain->domain_id, v->vcpu_id);
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -965,7 +965,7 @@ void vcpu_wake(struct vcpu *v)
     spinlock_t *lock;
     struct sched_unit *unit = v->sched_unit;
 
-    TRACE_2D(TRC_SCHED_WAKE, v->domain->domain_id, v->vcpu_id);
+    TRACE_TIME(TRC_SCHED_WAKE, v->domain->domain_id, v->vcpu_id);
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -1425,7 +1425,7 @@ void vcpu_block(void)
     }
     else
     {
-        TRACE_2D(TRC_SCHED_BLOCK, v->domain->domain_id, v->vcpu_id);
+        TRACE_TIME(TRC_SCHED_BLOCK, v->domain->domain_id, v->vcpu_id);
         raise_softirq(SCHEDULE_SOFTIRQ);
     }
 }
@@ -1498,7 +1498,7 @@ static long do_poll(const struct sched_poll *sched_poll)
     if ( sched_poll->timeout != 0 )
         set_timer(&v->poll_timer, sched_poll->timeout);
 
-    TRACE_2D(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
+    TRACE_TIME(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
 
     return 0;
@@ -1526,7 +1526,7 @@ long vcpu_yield(void)
 
     SCHED_STAT_CRANK(vcpu_yield);
 
-    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
+    TRACE_TIME(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
 }
@@ -1904,9 +1904,8 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
-        TRACE_3D(TRC_SCHED_SHUTDOWN,
-                 current->domain->domain_id, current->vcpu_id,
-                 sched_shutdown.reason);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
+                   current->vcpu_id, sched_shutdown.reason);
         ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
 
         break;
@@ -1921,8 +1920,8 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
-        TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
-                 d->domain_id, current->vcpu_id, sched_shutdown.reason);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_id,
+                   sched_shutdown.reason);
 
         spin_lock(&d->shutdown_lock);
         if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
@@ -2085,7 +2084,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     rcu_read_lock(&sched_res_rculock);
 
     if ( (ret = sched_adjust_dom(dom_scheduler(d), d, op)) == 0 )
-        TRACE_1D(TRC_SCHED_ADJDOM, d->domain_id);
+        TRACE_TIME(TRC_SCHED_ADJDOM, d->domain_id);
 
     rcu_read_unlock(&sched_res_rculock);
 
@@ -2180,14 +2179,13 @@ static void sched_switch_units(struct sched_resource *sr,
         sr->curr = next;
         sr->prev = prev;
 
-        TRACE_3D(TRC_SCHED_SWITCH_INFPREV, prev->domain->domain_id,
-                 prev->unit_id, now - prev->state_entry_time);
-        TRACE_4D(TRC_SCHED_SWITCH_INFNEXT, next->domain->domain_id,
-                 next->unit_id,
-                 (next->vcpu_list->runstate.state == RUNSTATE_runnable) ?
-                 (now - next->state_entry_time) : 0, prev->next_time);
-        TRACE_4D(TRC_SCHED_SWITCH, prev->domain->domain_id, prev->unit_id,
-                 next->domain->domain_id, next->unit_id);
+        TRACE_TIME(TRC_SCHED_SWITCH_INFPREV, prev->domain->domain_id,
+                   prev->unit_id, now - prev->state_entry_time);
+        TRACE_TIME(TRC_SCHED_SWITCH_INFNEXT, next->domain->domain_id, next->unit_id,
+                   (next->vcpu_list->runstate.state == RUNSTATE_runnable) ?
+                   (now - next->state_entry_time) : 0, prev->next_time);
+        TRACE_TIME(TRC_SCHED_SWITCH, prev->domain->domain_id, prev->unit_id,
+                   next->domain->domain_id, next->unit_id);
 
         ASSERT(!unit_running(next));
 
@@ -2378,10 +2376,10 @@ static void sched_context_switch(struct vcpu *vprev, struct vcpu *vnext,
 {
     if ( unlikely(vprev == vnext) )
     {
-        TRACE_4D(TRC_SCHED_SWITCH_INFCONT,
-                 vnext->domain->domain_id, vnext->sched_unit->unit_id,
-                 now - vprev->runstate.state_entry_time,
-                 vprev->sched_unit->next_time);
+        TRACE_TIME(TRC_SCHED_SWITCH_INFCONT,
+                   vnext->domain->domain_id, vnext->sched_unit->unit_id,
+                   now - vprev->runstate.state_entry_time,
+                   vprev->sched_unit->next_time);
         sched_context_switched(vprev, vnext);
 
         /*
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index a72d0715276a..020f44595ed0 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -493,7 +493,7 @@ static inline void __runq_tickle(const struct csched_unit *new)
         {
             /* Avoid TRACE_*: saves checking !tb_init_done each step */
             for_each_cpu(cpu, &mask)
-                __trace_var(TRC_CSCHED_TICKLE, 1, sizeof(cpu), &cpu);
+                trace_time(TRC_CSCHED_TICKLE, sizeof(cpu), &cpu);
         }
 
         /*
@@ -862,8 +862,7 @@ _csched_cpu_pick(const struct scheduler *ops, const struct sched_unit *unit,
     if ( commit && spc )
        spc->idle_bias = cpu;
 
-    TRACE_3D(TRC_CSCHED_PICKED_CPU, unit->domain->domain_id, unit->unit_id,
-             cpu);
+    TRACE_TIME(TRC_CSCHED_PICKED_CPU, unit->domain->domain_id, unit->unit_id, cpu);
 
     return cpu;
 }
@@ -907,8 +906,8 @@ __csched_unit_acct_start(struct csched_private *prv, struct csched_unit *svc)
         }
     }
 
-    TRACE_3D(TRC_CSCHED_ACCOUNT_START, sdom->dom->domain_id,
-             svc->unit->unit_id, sdom->active_unit_count);
+    TRACE_TIME(TRC_CSCHED_ACCOUNT_START, sdom->dom->domain_id,
+               svc->unit->unit_id, sdom->active_unit_count);
 
     spin_unlock_irqrestore(&prv->lock, flags);
 }
@@ -933,8 +932,8 @@ __csched_unit_acct_stop_locked(struct csched_private *prv,
         list_del_init(&sdom->active_sdom_elem);
     }
 
-    TRACE_3D(TRC_CSCHED_ACCOUNT_STOP, sdom->dom->domain_id,
-             svc->unit->unit_id, sdom->active_unit_count);
+    TRACE_TIME(TRC_CSCHED_ACCOUNT_STOP, sdom->dom->domain_id,
+               svc->unit->unit_id, sdom->active_unit_count);
 }
 
 static void
@@ -957,8 +956,8 @@ csched_unit_acct(struct csched_private *prv, unsigned int cpu)
     if ( svc->pri == CSCHED_PRI_TS_BOOST )
     {
         svc->pri = CSCHED_PRI_TS_UNDER;
-        TRACE_2D(TRC_CSCHED_BOOST_END, svc->sdom->dom->domain_id,
-                 svc->unit->unit_id);
+        TRACE_TIME(TRC_CSCHED_BOOST_END, svc->sdom->dom->domain_id,
+                   svc->unit->unit_id);
     }
 
     /*
@@ -1164,8 +1163,7 @@ csched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
     if ( !migrating && svc->pri == CSCHED_PRI_TS_UNDER &&
          !test_bit(CSCHED_FLAG_UNIT_PARKED, &svc->flags) )
     {
-        TRACE_2D(TRC_CSCHED_BOOST_START, unit->domain->domain_id,
-                 unit->unit_id);
+        TRACE_TIME(TRC_CSCHED_BOOST_START, unit->domain->domain_id, unit->unit_id);
         SCHED_STAT_CRANK(unit_boost);
         svc->pri = CSCHED_PRI_TS_BOOST;
     }
@@ -1671,8 +1669,8 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
         if ( __csched_unit_is_migrateable(prv, unit, cpu, cpumask_scratch) )
         {
             /* We got a candidate. Grab it! */
-            TRACE_3D(TRC_CSCHED_STOLEN_UNIT, peer_cpu,
-                     unit->domain->domain_id, unit->unit_id);
+            TRACE_TIME(TRC_CSCHED_STOLEN_UNIT, peer_cpu,
+                       unit->domain->domain_id, unit->unit_id);
             SCHED_UNIT_STAT_CRANK(speer, migrate_q);
             SCHED_STAT_CRANK(migrate_queued);
             runq_remove(speer);
@@ -1783,7 +1781,7 @@ csched_load_balance(struct csched_private *prv, int cpu,
                  */
                 if ( CSCHED_PCPU(peer_cpu)->nr_runnable <= 1 )
                 {
-                    TRACE_2D(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skipp'n */ 0);
+                    TRACE_TIME(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skipp'n */ 0);
                     goto next_cpu;
                 }
 
@@ -1799,11 +1797,11 @@ csched_load_balance(struct csched_private *prv, int cpu,
                 if ( !lock )
                 {
                     SCHED_STAT_CRANK(steal_trylock_failed);
-                    TRACE_2D(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skip */ 0);
+                    TRACE_TIME(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skip */ 0);
                     goto next_cpu;
                 }
 
-                TRACE_2D(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* checked */ 1);
+                TRACE_TIME(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* checked */ 1);
 
                 /* Any work over there to steal? */
                 speer = cpumask_test_cpu(peer_cpu, online) ?
@@ -1860,21 +1858,18 @@ static void cf_check csched_schedule(
     SCHED_STAT_CRANK(schedule);
     CSCHED_UNIT_CHECK(unit);
 
-    /*
-     * Here in Credit1 code, we usually just call TRACE_nD() helpers, and
-     * don't care about packing. But scheduling happens very often, so it
-     * actually is important that the record is as small as possible.
-     */
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned cpu:16, tasklet:8, idle:8;
-        } d;
-        d.cpu = cur_cpu;
-        d.tasklet = tasklet_work_scheduled;
-        d.idle = is_idle_unit(unit);
-        __trace_var(TRC_CSCHED_SCHEDULE, 1, sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t cpu;
+            uint8_t tasklet, idle;
+        } d = {
+            .cpu     = cur_cpu,
+            .tasklet = tasklet_work_scheduled,
+            .idle    = is_idle_unit(unit),
+        };
+
+        trace_time(TRC_CSCHED_SCHEDULE, sizeof(d), &d);
     }
 
     runtime = now - unit->state_entry_time;
@@ -1936,14 +1931,15 @@ static void cf_check csched_schedule(
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-                unsigned runtime;
-            } d;
-            d.dom = unit->domain->domain_id;
-            d.unit = unit->unit_id;
-            d.runtime = runtime;
-            __trace_var(TRC_CSCHED_RATELIMIT, 1, sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+                uint32_t runtime;
+            } d = {
+                .dom     = unit->domain->domain_id,
+                .unit    = unit->unit_id,
+                .runtime = runtime,
+            };
+
+            trace_time(TRC_CSCHED_RATELIMIT, sizeof(d), &d);
         }
 
         goto out;
@@ -1968,7 +1964,7 @@ static void cf_check csched_schedule(
         /* Tasklet work (which runs in idle UNIT context) overrides all else. */
         if ( tasklet_work_scheduled )
         {
-            TRACE_0D(TRC_CSCHED_SCHED_TASKLET);
+            TRACE_TIME(TRC_CSCHED_SCHED_TASKLET);
             snext = CSCHED_UNIT(sched_idle_unit(sched_cpu));
             snext->pri = CSCHED_PRI_TS_BOOST;
         }
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 2091337fcd06..7e31440e5b84 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -331,11 +331,13 @@ pick_res(const struct null_private *prv, const struct sched_unit *unit)
         struct {
             uint16_t unit, dom;
             uint32_t new_cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.new_cpu = new_cpu;
-        __trace_var(TRC_SNULL_PICKED_CPU, 1, sizeof(d), &d);
+        } d = {
+            .unit    = unit->unit_id,
+            .dom     = unit->domain->domain_id,
+            .new_cpu = new_cpu,
+        };
+
+        trace_time(TRC_SNULL_PICKED_CPU, sizeof(d), &d);
     }
 
     return get_sched_res(new_cpu);
@@ -359,11 +361,13 @@ static void unit_assign(struct null_private *prv, struct sched_unit *unit,
         struct {
             uint16_t unit, dom;
             uint32_t cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.cpu = cpu;
-        __trace_var(TRC_SNULL_UNIT_ASSIGN, 1, sizeof(d), &d);
+        } d = {
+            .unit = unit->unit_id,
+            .dom  = unit->domain->domain_id,
+            .cpu  = cpu,
+        };
+
+        trace_time(TRC_SNULL_UNIT_ASSIGN, sizeof(d), &d);
     }
 }
 
@@ -390,11 +394,13 @@ static bool unit_deassign(struct null_private *prv, const struct sched_unit *uni
         struct {
             uint16_t unit, dom;
             uint32_t cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.cpu = cpu;
-        __trace_var(TRC_SNULL_UNIT_DEASSIGN, 1, sizeof(d), &d);
+        } d = {
+            .unit = unit->unit_id,
+            .dom  = unit->domain->domain_id,
+            .cpu  = cpu,
+        };
+
+        trace_time(TRC_SNULL_UNIT_DEASSIGN, sizeof(d), &d);
     }
 
     spin_lock(&prv->waitq_lock);
@@ -695,12 +701,14 @@ static void cf_check null_unit_migrate(
         struct {
             uint16_t unit, dom;
             uint16_t cpu, new_cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.cpu = sched_unit_master(unit);
-        d.new_cpu = new_cpu;
-        __trace_var(TRC_SNULL_MIGRATE, 1, sizeof(d), &d);
+        } d = {
+            .unit    = unit->unit_id,
+            .dom     = unit->domain->domain_id,
+            .cpu     = sched_unit_master(unit),
+            .new_cpu = new_cpu,
+        };
+
+        trace_time(TRC_SNULL_MIGRATE, sizeof(d), &d);
     }
 
     /*
@@ -824,9 +832,11 @@ static void cf_check null_schedule(
         struct {
             uint16_t tasklet, cpu;
             int16_t unit, dom;
-        } d;
-        d.cpu = cur_cpu;
-        d.tasklet = tasklet_work_scheduled;
+        } d = {
+            .tasklet = tasklet_work_scheduled,
+            .cpu     = cur_cpu,
+        };
+
         if ( npc->unit == NULL )
         {
             d.unit = d.dom = -1;
@@ -836,12 +846,13 @@ static void cf_check null_schedule(
             d.unit = npc->unit->unit_id;
             d.dom = npc->unit->domain->domain_id;
         }
-        __trace_var(TRC_SNULL_SCHEDULE, 1, sizeof(d), &d);
+
+        trace_time(TRC_SNULL_SCHEDULE, sizeof(d), &d);
     }
 
     if ( tasklet_work_scheduled )
     {
-        trace_var(TRC_SNULL_TASKLET, 1, 0, NULL);
+        TRACE_TIME(TRC_SNULL_TASKLET);
         prev->next_task = sched_idle_unit(sched_cpu);
     }
     else
-- 
2.30.2



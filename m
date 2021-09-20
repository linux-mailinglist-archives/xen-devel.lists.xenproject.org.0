Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A00411E14
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191052.340966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3E-0005tu-Ks; Mon, 20 Sep 2021 17:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191052.340966; Mon, 20 Sep 2021 17:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3E-0005ni-Ax; Mon, 20 Sep 2021 17:25:56 +0000
Received: by outflank-mailman (input) for mailman id 191052;
 Mon, 20 Sep 2021 17:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN3C-0003ck-JO
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 860d3042-ecd5-46c3-b376-ddfe26a9aaff;
 Mon, 20 Sep 2021 17:25:40 +0000 (UTC)
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
X-Inumbo-ID: 860d3042-ecd5-46c3-b376-ddfe26a9aaff
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=z2fpwHvRQ55rgQU2q9tyaPf+/02t7tCkN4LhCvt/vE0=;
  b=IxZRA/1El0MKEngsfLYz7Y25wmVxkSdGuXwnZ1zQ+TVAxKcBiQDAGNQm
   ZzxCd+1f0GYsO1/tqB3UljIlRqocDLQCH1GGgG/qWA2SUJTLh7pvS/CHz
   S7MfMPmOtDFdQ4utec3eczA14ff/V0T6nGD1ytsl9m6d9+b6Y/87VHzZb
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dG2VgwG7HkkRDOBtHJ9Dj0/LE8KAeXmD9IpTllINph2ZL2Oif/r6rHLNMCruAfRUaV1kV/Utna
 DiuomtbjEwIguLXGxeiog8HomkXP5uMeEU3skfEdmFcpUcXutLuxsG6+mIfgglnYUn0yKT67if
 btp9pm5KtW7cqH74OTfV/0ebtSe9jM9ZI5qrTvrT5boIRQYzsmmuh40Z8vhAnUh89aht/GULlF
 eWhQMppWI6kOuknXzZYo4aSyTXYjzypAN/buCE8LQ/V5evyjC0/xyjQFi409E8OAbSBj64JsFW
 EfCdAgWfQqC2dBbPhyun00dX
X-SBRS: 5.1
X-MesageID: 53560995
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m6JGvam46DlwBKrjhoQ5Ypfo5gxpIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXmiHa6vfMWemcttxYdmx/BgC6MOEndMwHgtorHwwEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NVJsbeRRQBzBJ3rhcdACTV0LHpsA7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQK2DO
 ZJIOGcHgBLoURIIFQxIU5UEgf6KqXWnKWV5kWjLnP9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PLG2//FlgVqXx0QIFQYbE1C8pJGRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMTH0x
 xuroC9kvYU0kO1WjYmXwgvVvS358/AlUTUJChXrsnONt10iPd7+Nt3wszA3/t4bc93IFQDpU
 Gws3pHEtbFQV8nleDmlHb1VdIxF8cppJ9E1bbRHJJAn6z3l0HqqZ4k4DNpWdRoxb5psldMEZ
 ibuVeJtCH17ZyDCgUxfOdvZ5yEWIU/IT4+NaxwsRoASCqWdjSfelM2UWaJ144wKuBN2+ZzTx
 L/BKZr8ZZrkIf0/kVJauNvxIZd0n3tjlAs/tLjQzgi90Kr2WZJmYe5eazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwPx7+Uo
 SniChEHoLc97FWeQTi3hrlYQOuHdf5CQbgTZETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:yDiwv68g32XHn8dvub1uk+DkI+orL9Y04lQ7vn2ZLiYlFvBw9v
 re+cjzuiWE6wr5NEtApTniAse9qBHnhPlICOAqVN/JMTUO0FHYSr2KhrGSoQEIdRefygd179
 YYT0AgY+eaMbEBt6nHCaODYq4dKaK8nJyVuQ==
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53560995"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH v2 06/12] xen/credit2: Clean up trace handling
Date: Mon, 20 Sep 2021 18:25:23 +0100
Message-ID: <20210920172529.24932-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

There is no need for bitfields anywhere - use more sensible types.  There is
also no need to cast 'd' to (unsigned char *) before passing it to a function
taking void *.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>

v2:
 * Fix whitespace.
---
 xen/common/sched/credit2.c | 315 ++++++++++++++++++++++-----------------------
 1 file changed, 153 insertions(+), 162 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 41312158ec63..9b943e5168f0 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1080,13 +1080,13 @@ static void update_max_weight(struct csched2_runqueue_data *rqd, int new_weight,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned rqi:16, max_weight:16;
-        } d;
-        d.rqi = rqd->id;
-        d.max_weight = rqd->max_weight;
-        __trace_var(TRC_CSCHED2_RUNQ_MAX_WEIGHT, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t rqi, max_weight;
+        } d = {
+            .rqi        = rqd->id,
+            .max_weight = rqd->max_weight,
+        };
+
+        __trace_var(TRC_CSCHED2_RUNQ_MAX_WEIGHT, 1, sizeof(d), &d);
     }
 }
 
@@ -1114,9 +1114,7 @@ _runq_assign(struct csched2_unit *svc, struct csched2_runqueue_data *rqd)
             .rqi  = rqd->id,
         };
 
-        __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1, sizeof(d), &d);
     }
 
 }
@@ -1342,16 +1340,14 @@ update_runq_load(const struct scheduler *ops,
             uint8_t  rq_id, shift;
             uint32_t _pad;
         } d = {
-            .rq_avgload  = rqd->avgload,
-            .b_avgload   = rqd->b_avgload,
-            .rq_load     = rqd->load,
-            .rq_id       = rqd->id,
-            .shift       = P,
+            .rq_avgload = rqd->avgload,
+            .b_avgload  = rqd->b_avgload,
+            .rq_load    = rqd->load,
+            .rq_id      = rqd->id,
+            .shift      = P,
         };
 
-        __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1, sizeof(d), &d);
     }
 }
 
@@ -1401,16 +1397,16 @@ update_svc_load(const struct scheduler *ops,
     {
         struct {
             uint64_t v_avgload;
-            unsigned unit:16, dom:16;
-            unsigned shift;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.v_avgload = svc->avgload;
-        d.shift = P;
-        __trace_var(TRC_CSCHED2_UPDATE_UNIT_LOAD, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t shift;
+        } d = {
+            .v_avgload = svc->avgload,
+            .unit      = svc->unit->unit_id,
+            .dom       = svc->unit->domain->domain_id,
+            .shift     = P,
+        };
+
+        __trace_var(TRC_CSCHED2_UPDATE_UNIT_LOAD, 1, sizeof(d), &d);
     }
 }
 
@@ -1457,15 +1453,15 @@ static void runq_insert(struct csched2_unit *svc)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned pos;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.pos = pos;
-        __trace_var(TRC_CSCHED2_RUNQ_POS, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t pos;
+        } d = {
+            .unit = svc->unit->unit_id,
+            .dom  = svc->unit->domain->domain_id,
+            .pos  = pos,
+        };
+
+        __trace_var(TRC_CSCHED2_RUNQ_POS, 1, sizeof(d), &d);
     }
 }
 
@@ -1557,16 +1553,16 @@ static s_time_t tickle_score(const struct scheduler *ops, s_time_t now,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            int credit, score;
-        } d;
-        d.dom = cur->unit->domain->domain_id;
-        d.unit = cur->unit->unit_id;
-        d.credit = cur->credit;
-        d.score = score;
-        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t credit, score;
+        } d = {
+            .unit   = cur->unit->unit_id,
+            .dom    = cur->unit->domain->domain_id,
+            .credit = cur->credit,
+            .score  = score,
+        };
+
+        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1, sizeof(d), &d);
     }
 
     return score;
@@ -1604,17 +1600,16 @@ runq_tickle(const struct scheduler *ops, struct csched2_unit *new, s_time_t now)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned processor;
-            int credit;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.processor = cpu;
-        d.credit = new->credit;
-        __trace_var(TRC_CSCHED2_TICKLE_NEW, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t processor, credit;
+        } d = {
+            .dom       = unit->domain->domain_id,
+            .unit      = unit->unit_id,
+            .processor = cpu,
+            .credit    = new->credit,
+        };
+
+        __trace_var(TRC_CSCHED2_TICKLE_NEW, 1, sizeof(d), &d);
     }
 
     /*
@@ -1753,12 +1748,12 @@ runq_tickle(const struct scheduler *ops, struct csched2_unit *new, s_time_t now)
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned cpu:16, pad:16;
-        } d;
-        d.cpu = ipid; d.pad = 0;
-        __trace_var(TRC_CSCHED2_TICKLE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t cpu, _pad;
+        } d = {
+            .cpu = ipid,
+        };
+
+        __trace_var(TRC_CSCHED2_TICKLE, 1, sizeof(d), &d);
     }
 
     tickle_cpu(ipid, rqd);
@@ -1834,16 +1829,16 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-                int credit_start, credit_end;
-            } d;
-            d.dom = svc->unit->domain->domain_id;
-            d.unit = svc->unit->unit_id;
-            d.credit_start = start_credit;
-            d.credit_end = svc->credit;
-            __trace_var(TRC_CSCHED2_CREDIT_RESET, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+                uint32_t credit_start, credit_end;
+            } d = {
+                .unit         = svc->unit->unit_id,
+                .dom          = svc->unit->domain->domain_id,
+                .credit_start = start_credit,
+                .credit_end   = svc->credit,
+            };
+
+            __trace_var(TRC_CSCHED2_CREDIT_RESET, 1, sizeof(d), &d);
         }
     }
 
@@ -1889,18 +1884,17 @@ void burn_credits(struct csched2_runqueue_data *rqd,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            int credit, budget;
-            int delta;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.credit = svc->credit;
-        d.budget = has_cap(svc) ?  svc->budget : INT_MIN;
-        d.delta = delta;
-        __trace_var(TRC_CSCHED2_CREDIT_BURN, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t credit, budget, delta;
+        } d = {
+            .unit   = svc->unit->unit_id,
+            .dom    = svc->unit->domain->domain_id,
+            .credit = svc->credit,
+            .budget = has_cap(svc) ? svc->budget : INT_MIN,
+            .delta  = delta,
+        };
+
+        __trace_var(TRC_CSCHED2_CREDIT_BURN, 1, sizeof(d), &d);
     }
 }
 
@@ -2545,17 +2539,17 @@ csched2_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
     {
         struct {
             uint64_t b_avgload;
-            unsigned unit:16, dom:16;
-            unsigned rq_id:16, new_cpu:16;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.rq_id = min_rqd ? min_rqd->id : -1;
-        d.b_avgload = min_avgload;
-        d.new_cpu = new_cpu;
-        __trace_var(TRC_CSCHED2_PICKED_CPU, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint16_t rq_id, new_cpu;
+        } d = {
+            .b_avgload = min_avgload,
+            .unit      = unit->unit_id,
+            .dom       = unit->domain->domain_id,
+            .rq_id     = min_rqd ? min_rqd->id : -1,
+            .new_cpu   = new_cpu,
+        };
+
+        __trace_var(TRC_CSCHED2_PICKED_CPU, 1, sizeof(d), &d);
     }
 
     return get_sched_res(new_cpu);
@@ -2616,16 +2610,16 @@ static void migrate(const struct scheduler *ops,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned rqi:16, trqi:16;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.rqi = svc->rqd->id;
-        d.trqi = trqd->id;
-        __trace_var(TRC_CSCHED2_MIGRATE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint16_t rqi, trqi;
+        } d = {
+            .unit = unit->unit_id,
+            .dom  = unit->domain->domain_id,
+            .rqi  = svc->rqd->id,
+            .trqi = trqd->id,
+        };
+
+        __trace_var(TRC_CSCHED2_MIGRATE, 1, sizeof(d), &d);
     }
 
     if ( svc->flags & CSFLAG_scheduled )
@@ -2762,15 +2756,15 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned lrq_id:16, orq_id:16;
-                unsigned load_delta;
-            } d;
-            d.lrq_id = st.lrqd->id;
-            d.orq_id = st.orqd->id;
-            d.load_delta = st.load_delta;
-            __trace_var(TRC_CSCHED2_LOAD_CHECK, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t lrq_id, orq_id;
+                uint32_t load_delta;
+            } d = {
+                .lrq_id     = st.lrqd->id,
+                .orq_id     = st.orqd->id,
+                .load_delta = st.load_delta,
+            };
+
+            __trace_var(TRC_CSCHED2_LOAD_CHECK, 1, sizeof(d), &d);
         }
 
         /*
@@ -2808,15 +2802,13 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
             uint16_t lrq_id, orq_id;
             uint32_t _pad;
         } d = {
-            .lb_avgload  = st.lrqd->b_avgload,
-            .ob_avgload  = st.orqd->b_avgload,
-            .lrq_id      = st.lrqd->id,
-            .orq_id      = st.orqd->id,
+            .lb_avgload = st.lrqd->b_avgload,
+            .ob_avgload = st.orqd->b_avgload,
+            .lrq_id     = st.lrqd->id,
+            .orq_id     = st.orqd->id,
         };
 
-        __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1, sizeof(d), &d);
     }
 
     SCHED_STAT_CRANK(acct_load_balance);
@@ -3402,15 +3394,15 @@ runq_candidate(struct csched2_runqueue_data *rqd,
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-                unsigned runtime;
-            } d;
-            d.dom = scurr->unit->domain->domain_id;
-            d.unit = scurr->unit->unit_id;
-            d.runtime = now - scurr->unit->state_entry_time;
-            __trace_var(TRC_CSCHED2_RATELIMIT, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+                uint32_t runtime;
+            } d = {
+                .unit    = scurr->unit->unit_id,
+                .dom     = scurr->unit->domain->domain_id,
+                .runtime = now - scurr->unit->state_entry_time,
+            };
+
+            __trace_var(TRC_CSCHED2_RATELIMIT, 1, sizeof(d), &d);
         }
         return scurr;
     }
@@ -3463,13 +3455,13 @@ runq_candidate(struct csched2_runqueue_data *rqd,
         if ( unlikely(tb_init_done) )
         {
             struct {
-                unsigned unit:16, dom:16;
-            } d;
-            d.dom = svc->unit->domain->domain_id;
-            d.unit = svc->unit->unit_id;
-            __trace_var(TRC_CSCHED2_RUNQ_CAND_CHECK, 1,
-                        sizeof(d),
-                        (unsigned char *)&d);
+                uint16_t unit, dom;
+            } d = {
+                .unit = svc->unit->unit_id,
+                .dom  = svc->unit->domain->domain_id,
+            };
+
+            __trace_var(TRC_CSCHED2_RUNQ_CAND_CHECK, 1, sizeof(d), &d);
         }
 
         /*
@@ -3537,17 +3529,16 @@ runq_candidate(struct csched2_runqueue_data *rqd,
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned unit:16, dom:16;
-            unsigned tickled_cpu;
-            int credit;
-        } d;
-        d.dom = snext->unit->domain->domain_id;
-        d.unit = snext->unit->unit_id;
-        d.credit = snext->credit;
-        d.tickled_cpu = snext->tickled_cpu;
-        __trace_var(TRC_CSCHED2_RUNQ_CANDIDATE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t unit, dom;
+            uint32_t tickled_cpu, credit;
+        } d = {
+            .unit        = snext->unit->unit_id,
+            .dom         = snext->unit->domain->domain_id,
+            .tickled_cpu = snext->tickled_cpu,
+            .credit      = snext->credit,
+        };
+
+        __trace_var(TRC_CSCHED2_RUNQ_CANDIDATE, 1, sizeof(d), &d);
     }
 
     if ( unlikely(snext->tickled_cpu != -1 && snext->tickled_cpu != cpu) )
@@ -3603,18 +3594,18 @@ static void csched2_schedule(
     if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned cpu:16, rq_id:16;
-            unsigned tasklet:8, idle:8, smt_idle:8, tickled:8;
-        } d;
-        d.cpu = cur_cpu;
-        d.rq_id = c2r(sched_cpu);
-        d.tasklet = tasklet_work_scheduled;
-        d.idle = is_idle_unit(currunit);
-        d.smt_idle = cpumask_test_cpu(sched_cpu, &rqd->smt_idle);
-        d.tickled = tickled;
-        __trace_var(TRC_CSCHED2_SCHEDULE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+            uint16_t cpu, rq_id;
+            uint8_t tasklet, idle, smt_idle, tickled;
+        } d = {
+            .cpu      = cur_cpu,
+            .rq_id    = c2r(sched_cpu),
+            .tasklet  = tasklet_work_scheduled,
+            .idle     = is_idle_unit(currunit),
+            .smt_idle = cpumask_test_cpu(sched_cpu, &rqd->smt_idle),
+            .tickled  = tickled,
+        };
+
+        __trace_var(TRC_CSCHED2_SCHEDULE, 1, sizeof(d), &d);
     }
 
     /* Update credits (and budget, if necessary). */
-- 
2.11.0



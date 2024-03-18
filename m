Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005B87EDA6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694892.1084127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxx-0005nn-OL; Mon, 18 Mar 2024 16:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694892.1084127; Mon, 18 Mar 2024 16:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxx-0005mL-JE; Mon, 18 Mar 2024 16:36:01 +0000
Received: by outflank-mailman (input) for mailman id 694892;
 Mon, 18 Mar 2024 16:36:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFxw-0005JN-97
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:36:00 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 996fdeaf-e545-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:35:58 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-568aa3096e9so5493096a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:35:58 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:35:56 -0700 (PDT)
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
X-Inumbo-ID: 996fdeaf-e545-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779758; x=1711384558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3WegiCwiNXkkjs6VfwYfT79v4emqYj9IeVAQcTvOi4=;
        b=cpOoF0uaI4Pa8rubhx2A76gvCLgQDPevnFFRYNeTNO0wU+etRQUt5RuMJDO9s/350u
         ly/Hw4+GnD+RNILgwFwK+5rSLtYYxFnFHOeA+lkEm+Vo6BaCyy7poaaiE0D8UFx/Vw1R
         85VlsI2y5EcTKRJxCXQjvp/1xwHh5S/d0fHoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779758; x=1711384558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3WegiCwiNXkkjs6VfwYfT79v4emqYj9IeVAQcTvOi4=;
        b=BNgw4RTY+UZY0P6NYbdPCRUwrs46mNNFHWcsMF1MdG9DwqX+ISUyWNRPBRPd0euAXd
         GEEEAM/V5FKO6AX4rgp+3x4HqHJbDcqhzHCy/tkjIi5pjzQDeaWNL55NgPBF2x6x2gBL
         gi7W7KktYfhhtxdfIVKmp2YvubWFrpKalXVPv4tsPoYT5r9A+f54FmnU6HSesaNZzNgq
         lna7sjTl4Qn/gRmkpvCMU8cqg1gJa+1vOFcl5bX/W1qBCSUOF5xmgPc1Mex3TxpKMKlP
         /z2InVtITQJjMDUnIGacz3lRMfrt+yn0DjzEQ9ZLMjB+igmlLZgmKVWXmJrW7oV8z6wO
         /tsQ==
X-Gm-Message-State: AOJu0Yw+EVEIbMVp3xSOvb9zH4hED+4btHHGFFnOvV3JMzUVj9O/MfU9
	HiBcSOHxY9UecOMtiKbZpF+RNSN0vheDnV/nhhJ8Km0Xl/MynQLP8uHK0AKwPLMV+6umAMClWUg
	J
X-Google-Smtp-Source: AGHT+IFwQFT4d2T2VeU4ObTqUFuCgzNbdi9xZPxcaU1yxWCMOe8aG00Scb7/bBqScL2xuuXgVRZpVw==
X-Received: by 2002:a17:906:80c4:b0:a46:a8b8:f4cf with SMTP id a4-20020a17090680c400b00a46a8b8f4cfmr79151ejx.35.1710779757835;
        Mon, 18 Mar 2024 09:35:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 2/7] xen/credit2: Clean up trace handling
Date: Mon, 18 Mar 2024 16:35:47 +0000
Message-Id: <20240318163552.3808695-3-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
 * Fix whitespace.
v3:
 * Rebase over core API changes.
---
 xen/common/sched/credit2.c | 301 ++++++++++++++++++-------------------
 1 file changed, 146 insertions(+), 155 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index c76330d79d3a..b7df9f2a9111 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1085,13 +1085,13 @@ static void update_max_weight(struct csched2_runqueue_data *rqd, int new_weight,
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
+        trace_time(TRC_CSCHED2_RUNQ_MAX_WEIGHT, sizeof(d), &d);
     }
 }
 
@@ -1119,9 +1119,7 @@ _runq_assign(struct csched2_unit *svc, struct csched2_runqueue_data *rqd)
             .rqi  = rqd->id,
         };
 
-        __trace_var(TRC_CSCHED2_RUNQ_ASSIGN, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        trace_time(TRC_CSCHED2_RUNQ_ASSIGN, sizeof(d), &d);
     }
 
 }
@@ -1354,9 +1352,7 @@ update_runq_load(const struct scheduler *ops,
             .shift      = P,
         };
 
-        __trace_var(TRC_CSCHED2_UPDATE_RUNQ_LOAD, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        trace_time(TRC_CSCHED2_UPDATE_RUNQ_LOAD, sizeof(d), &d);
     }
 }
 
@@ -1406,16 +1402,16 @@ update_svc_load(const struct scheduler *ops,
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
+        trace_time(TRC_CSCHED2_UPDATE_UNIT_LOAD, sizeof(d), &d);
     }
 }
 
@@ -1424,7 +1420,7 @@ update_load(const struct scheduler *ops,
             struct csched2_runqueue_data *rqd,
             struct csched2_unit *svc, int change, s_time_t now)
 {
-    trace_var(TRC_CSCHED2_UPDATE_LOAD, 1, 0,  NULL);
+    TRACE_TIME(TRC_CSCHED2_UPDATE_LOAD);
 
     update_runq_load(ops, rqd, change, now);
     if ( svc )
@@ -1462,15 +1458,15 @@ static void runq_insert(struct csched2_unit *svc)
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
+        trace_time(TRC_CSCHED2_RUNQ_POS, sizeof(d), &d);
     }
 }
 
@@ -1563,16 +1559,16 @@ static s_time_t tickle_score(const struct scheduler *ops, s_time_t now,
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
+        trace_time(TRC_CSCHED2_TICKLE_CHECK, sizeof(d), &d);
     }
 
     return score;
@@ -1610,17 +1606,16 @@ runq_tickle(const struct scheduler *ops, struct csched2_unit *new, s_time_t now)
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
+        trace_time(TRC_CSCHED2_TICKLE_NEW, sizeof(d), &d);
     }
 
     /*
@@ -1759,12 +1754,12 @@ runq_tickle(const struct scheduler *ops, struct csched2_unit *new, s_time_t now)
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
+        trace_time(TRC_CSCHED2_TICKLE, sizeof(d), &d);
     }
 
     tickle_cpu(ipid, rqd);
@@ -1840,16 +1835,16 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
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
+            trace_time(TRC_CSCHED2_CREDIT_RESET, sizeof(d), &d);
         }
     }
 
@@ -1895,18 +1890,17 @@ void burn_credits(struct csched2_runqueue_data *rqd,
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
+        trace_time(TRC_CSCHED2_CREDIT_BURN, sizeof(d), &d);
     }
 }
 
@@ -2551,17 +2545,17 @@ csched2_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
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
+        trace_time(TRC_CSCHED2_PICKED_CPU, sizeof(d), &d);
     }
 
     return get_sched_res(new_cpu);
@@ -2622,16 +2616,16 @@ static void migrate(const struct scheduler *ops,
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
+        trace_time(TRC_CSCHED2_MIGRATE, sizeof(d), &d);
     }
 
     if ( svc->flags & CSFLAG_scheduled )
@@ -2768,15 +2762,15 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
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
+            trace_time(TRC_CSCHED2_LOAD_CHECK, sizeof(d), &d);
         }
 
         /*
@@ -2820,9 +2814,7 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
             .orq_id     = st.orqd->id,
         };
 
-        __trace_var(TRC_CSCHED2_LOAD_BALANCE, 1,
-                    sizeof(d),
-                    (unsigned char *)&d);
+        trace_time(TRC_CSCHED2_LOAD_BALANCE, sizeof(d), &d);
     }
 
     SCHED_STAT_CRANK(acct_load_balance);
@@ -3407,15 +3399,15 @@ runq_candidate(struct csched2_runqueue_data *rqd,
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
+            trace_time(TRC_CSCHED2_RATELIMIT, sizeof(d), &d);
         }
         return scurr;
     }
@@ -3468,13 +3460,13 @@ runq_candidate(struct csched2_runqueue_data *rqd,
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
+            trace_time(TRC_CSCHED2_RUNQ_CAND_CHECK, sizeof(d), &d);
         }
 
         /*
@@ -3542,17 +3534,16 @@ runq_candidate(struct csched2_runqueue_data *rqd,
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
+        trace_time(TRC_CSCHED2_RUNQ_CANDIDATE, sizeof(d), &d);
     }
 
     if ( unlikely(snext->tickled_cpu != -1 && snext->tickled_cpu != cpu) )
@@ -3608,18 +3599,18 @@ static void cf_check csched2_schedule(
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
+        trace_time(TRC_CSCHED2_SCHEDULE, sizeof(d), &d);
     }
 
     /* Update credits (and budget, if necessary). */
@@ -3654,7 +3645,7 @@ static void cf_check csched2_schedule(
     if ( tasklet_work_scheduled )
     {
         __clear_bit(__CSFLAG_unit_yield, &scurr->flags);
-        trace_var(TRC_CSCHED2_SCHED_TASKLET, 1, 0, NULL);
+        TRACE_TIME(TRC_CSCHED2_SCHED_TASKLET);
         snext = csched2_unit(sched_idle_unit(sched_cpu));
     }
     else
-- 
2.30.2



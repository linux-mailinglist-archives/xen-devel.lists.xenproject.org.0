Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6187EDA5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694893.1084137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxz-000666-3l; Mon, 18 Mar 2024 16:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694893.1084137; Mon, 18 Mar 2024 16:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFxy-00062Z-WF; Mon, 18 Mar 2024 16:36:03 +0000
Received: by outflank-mailman (input) for mailman id 694893;
 Mon, 18 Mar 2024 16:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFxx-0005JN-MY
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:36:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a5bf40b-e545-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:36:00 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a466f796fc1so587433066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:36:00 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:35:58 -0700 (PDT)
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
X-Inumbo-ID: 9a5bf40b-e545-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779759; x=1711384559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43RBkv9nNt2AeKgY3ovhftrUIQfOhkhQXVZiRG6YSx0=;
        b=ao95LOdoc7zdpUQ4jYJnKqA17h0rGI3dejjuPRtnGGrxignSsS5w4020N8y6RymxdH
         4fIg678LMf/VPL2J06Ab3e6Uuv4XJ5tSNfEyn2bsuauy4u0r64KhSes8qUfSEDB8iikW
         sEA9xjnBmenTnJPeICi3jiEqfqFILnHpTW0Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779759; x=1711384559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43RBkv9nNt2AeKgY3ovhftrUIQfOhkhQXVZiRG6YSx0=;
        b=UQDtyIFVXhVHC1Phm9WQMvO7EVG7YubIaBNehvesD9iHAuPXX4JyT0Fgg55Q4i075z
         6vOqZ/2VS2VDiqKorYorVbuXdKya3upgDdtvsPClkPlWl9lylx8A++HhaF/JgDqZdZnH
         d6yyOm2gj7xcoCTBgkCkDq4LMHFsIqou7f2QKhUo03GvbeOhErlAfp8mEcW5Jkk8r7pE
         Qpen9vOsKve0/7Ugbgu2kslqOvG3mKD3yaLnVEam1GX4Cna9p3rUqM9rdpCIRn3PnvI4
         ZEeyPPuh3mpUv15GXxnRUFtgpszGXXm0hX4hFEelQnYkyVCaGb5PY5gyyKSEhOF3XZVO
         +E/g==
X-Gm-Message-State: AOJu0YwOzRNoc3I2QbP5ATdG3HhZVbDaF+7USa9D46pZZmx7lhnxhjV9
	wfkgriKsqrYAGylO/CQtscmHsc+gxvPun1+pFITUKTIjvojBZmSHxFzG3URxxs9TPcxcpm56cER
	/
X-Google-Smtp-Source: AGHT+IHE1OrPskT/jI53hC6Cj/B9BDqWSE89qkPT9exCF/Pfak0XZaz2HnBAxNcRRpgi/aJbGFHuLw==
X-Received: by 2002:a17:906:190e:b0:a46:24fa:ea9f with SMTP id a14-20020a170906190e00b00a4624faea9fmr7551909eje.37.1710779758953;
        Mon, 18 Mar 2024 09:35:58 -0700 (PDT)
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
Subject: [PATCH 3/7] xen/rt: Clean up trace handling
Date: Mon, 18 Mar 2024 16:35:48 +0000
Message-Id: <20240318163552.3808695-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most uses of bitfields and __packed are unnecessary.  There is also no need to
cast 'd' to (unsigned char *) before passing it to a function taking void *.
Switch to new trace_time() API.

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
 xen/common/sched/rt.c | 99 ++++++++++++++++++++-----------------------
 1 file changed, 47 insertions(+), 52 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index b279f957f622..f368e0fdd5a5 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -455,21 +455,21 @@ rt_update_deadline(s_time_t now, struct rt_unit *svc)
     svc->cur_budget = svc->budget;
     svc->priority_level = 0;
 
-    /* TRACE */
+    if ( unlikely(tb_init_done) )
     {
-        struct __packed {
-            unsigned unit:16, dom:16;
-            unsigned priority_level;
+        struct {
+            uint16_t unit, dom;
+            uint32_t priority_level;
             uint64_t cur_deadline, cur_budget;
-        } d;
-        d.dom = svc->unit->domain->domain_id;
-        d.unit = svc->unit->unit_id;
-        d.priority_level = svc->priority_level;
-        d.cur_deadline = (uint64_t) svc->cur_deadline;
-        d.cur_budget = (uint64_t) svc->cur_budget;
-        trace_var(TRC_RTDS_BUDGET_REPLENISH, 1,
-                  sizeof(d),
-                  (unsigned char *) &d);
+        } d = {
+            .dom            = svc->unit->domain->domain_id,
+            .unit           = svc->unit->unit_id,
+            .priority_level = svc->priority_level,
+            .cur_deadline   = svc->cur_deadline,
+            .cur_budget     = svc->cur_budget,
+        };
+
+        trace_time(TRC_RTDS_BUDGET_REPLENISH, sizeof(d), &d);
     }
 
     return;
@@ -986,7 +986,7 @@ burn_budget(const struct scheduler *ops, struct rt_unit *svc, s_time_t now)
         }
     }
 
-    /* TRACE */
+    if ( unlikely(tb_init_done) )
     {
         struct __packed {
             uint16_t unit, dom;
@@ -1003,9 +1003,7 @@ burn_budget(const struct scheduler *ops, struct rt_unit *svc, s_time_t now)
             .has_extratime  = !!(svc->flags & RTDS_extratime),
         };
 
-        trace_var(TRC_RTDS_BUDGET_BURN, 1,
-                  sizeof(d),
-                  (unsigned char *) &d);
+        trace_time(TRC_RTDS_BUDGET_BURN, sizeof(d), &d);
     }
 }
 
@@ -1040,22 +1038,19 @@ runq_pick(const struct scheduler *ops, const cpumask_t *mask, unsigned int cpu)
         break;
     }
 
-    /* TRACE */
+    if ( unlikely(tb_init_done) && svc )
     {
-        if( svc != NULL )
-        {
-            struct __packed {
-                unsigned unit:16, dom:16;
-                uint64_t cur_deadline, cur_budget;
-            } d;
-            d.dom = svc->unit->domain->domain_id;
-            d.unit = svc->unit->unit_id;
-            d.cur_deadline = (uint64_t) svc->cur_deadline;
-            d.cur_budget = (uint64_t) svc->cur_budget;
-            trace_var(TRC_RTDS_RUNQ_PICK, 1,
-                      sizeof(d),
-                      (unsigned char *) &d);
-        }
+        struct __packed {
+            uint16_t unit, dom;
+            uint64_t cur_deadline, cur_budget;
+        } d = {
+            .unit         = svc->unit->unit_id,
+            .dom          = svc->unit->domain->domain_id,
+            .cur_deadline = svc->cur_deadline,
+            .cur_budget   = svc->cur_budget,
+        };
+
+        trace_time(TRC_RTDS_RUNQ_PICK, sizeof(d), &d);
     }
 
     return svc;
@@ -1076,18 +1071,19 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
     struct rt_unit *snext = NULL;
     bool migrated = false;
 
-    /* TRACE */
+    if ( unlikely(tb_init_done) )
     {
-        struct __packed {
-            unsigned cpu:16, tasklet:8, tickled:4, idle:4;
-        } d;
-        d.cpu = cur_cpu;
-        d.tasklet = tasklet_work_scheduled;
-        d.tickled = cpumask_test_cpu(sched_cpu, &prv->tickled);
-        d.idle = is_idle_unit(currunit);
-        trace_var(TRC_RTDS_SCHEDULE, 1,
-                  sizeof(d),
-                  (unsigned char *)&d);
+        struct {
+            uint16_t cpu;
+            uint8_t tasklet, tickled:4, idle:4;
+        } d = {
+            .cpu     = cur_cpu,
+            .tasklet = tasklet_work_scheduled,
+            .tickled = cpumask_test_cpu(sched_cpu, &prv->tickled),
+            .idle    = is_idle_unit(currunit),
+        };
+
+        trace_time(TRC_RTDS_SCHEDULE, sizeof(d), &d);
     }
 
     /* clear ticked bit now that we've been scheduled */
@@ -1098,7 +1094,7 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
 
     if ( tasklet_work_scheduled )
     {
-        trace_var(TRC_RTDS_SCHED_TASKLET, 1, 0,  NULL);
+        TRACE_TIME(TRC_RTDS_SCHED_TASKLET);
         snext = rt_unit(sched_idle_unit(sched_cpu));
     }
     else
@@ -1250,16 +1246,15 @@ runq_tickle(const struct scheduler *ops, const struct rt_unit *new)
     SCHED_STAT_CRANK(tickled_no_cpu);
     return;
  out:
-    /* TRACE */
+    if ( unlikely(tb_init_done) )
     {
         struct {
-            unsigned cpu:16, pad:16;
-        } d;
-        d.cpu = cpu_to_tickle;
-        d.pad = 0;
-        trace_var(TRC_RTDS_TICKLE, 1,
-                  sizeof(d),
-                  (unsigned char *)&d);
+            uint16_t cpu, _pad;
+        } d = {
+            .cpu = cpu_to_tickle,
+        };
+
+        trace_time(TRC_RTDS_TICKLE, sizeof(d), &d);
     }
 
     cpumask_set_cpu(cpu_to_tickle, &prv->tickled);
-- 
2.30.2



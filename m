Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084AD411E12
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191050.340944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN39-0004zk-N3; Mon, 20 Sep 2021 17:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191050.340944; Mon, 20 Sep 2021 17:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN39-0004wW-Io; Mon, 20 Sep 2021 17:25:51 +0000
Received: by outflank-mailman (input) for mailman id 191050;
 Mon, 20 Sep 2021 17:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN37-0003ck-J8
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3da059ef-c2a7-4fd9-b9e7-9e82b9762130;
 Mon, 20 Sep 2021 17:25:39 +0000 (UTC)
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
X-Inumbo-ID: 3da059ef-c2a7-4fd9-b9e7-9e82b9762130
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=PjTVtROVmKL1HBneR1Ooz1mqoxckEyucfjsCTUE+XFg=;
  b=Ozj3BsnLMabdSHAFo6BAi6ZQqTe6xpnmvvY0GQqeb4liiUFN/uoDrkiO
   TS4TKkM3Kvitti43Jquc+6kZOVPIbgfB7uAIPjsFVVWdURY3mvlGvniOe
   9rJb1B1gbqfh454qYuB09y1zoQ6jwbLm8SUKbeeL9YF4WzVXAXPtK1w8H
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fvWHELj4aqtuu/oBdfmJOefbJx7VCae4/OwcTFEZMZczMk6E9cSGfCSi9x35xRvWPVX6O3+JJ6
 8ANefdZqc0Np+xKeqRwAC2bQtPHOCIY9ZO82c+HfQsupQucvdlYWd58NOsM+TfhrjTXk4pzVJc
 8sOR1NyCvC8aUa9Z+G1ff0lM45j14MVZUDw7vklht6BCHYtKxet0NU3bOz47gKWDVHSDIJCvPG
 k0YdaQSxdEybFhYNn9P7X8oQiz0Zo6nlUf52k6oFQItpyKV+gnIZB6FUrTl9/Q8aRrLOq7juz7
 j/fDYSty/TjUDm0JaBHTfxGa
X-SBRS: 5.1
X-MesageID: 54938584
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ajyFH6zuT4yA1B8UMGx6t+exwSrEfRIJ4+MujC+fZmUNrF6WrkVUz
 WpNDDuGaf6OYDD9LtAgYNm+8U4PupfTx9A2Sgo6+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRh2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Zx2
 MQchZjpcyI0PvD1u/g/CTlCDggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25wfRqaDN
 5ZxhTxHPTTNQTlrHg0tCswnu8fyuD7vYRpltwfAzUYwyzeKl1EguFT3C/L3UNGXQcRenm6Du
 3nLuW/+B3kyNsGbyDeD2mKhgKnIhyyTcIcfErKo69ZhgUbV23QeDhtQWFemydG1hEexVNNYL
 0084Tc1oO4580nDZtjiXTWorXicpBkeVtFMVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43jhgyK996jNFzQQ+wWKZ0G5zFlZfpOMMtnABUfg0RpQEGqIZgDf5
 yFUwJnPtLpm4YKlz3PWEb5UdF29z7PcamSN3wQ3d3U032n1oxaekZZsDCaSzauDGv0NfyPgK
 GTXsBlYjHO4FCr3NfIrC25d5sJD8EQBKTgHfquPBjatSsIoHONiwM2JTRTLt10BaGB2zckC1
 W6zKK5A90r27JiLKxLtHY8gPUIDnHhilQs/u7iil0nPPUWiiI69Fu5ebQrmghERx6KYugTFm
 +uzxOPTkE43bQEKWQGOqdR7BQlTdRATXMmqw+QKJr/rClc3QwkJVq6OqY7NjqQ4xsy5YM+Tp
 SrjMqKZoXKi7UD6xfKiMCE7NOy3AsYh8hrW/0UEZD6V5pTqWq73hI93Snf9VeNPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:IYghL6GX72G5OYV6pLqE6seALOsnbusQ8zAXP0AYc3Jom62j5r
 mTdZsgtSMc5Ax8ZJhko6HkBEDiewK7yXcW2/hzAV7KZmCP0wHEEGgh1/qH/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="54938584"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Subject: [PATCH v2 07/12] xen/rt: Clean up trace handling
Date: Mon, 20 Sep 2021 18:25:24 +0100
Message-ID: <20210920172529.24932-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Most uses of bitfields and __packed are unnecessary.  There is also no need to
cast 'd' to (unsigned char *) before passing it to a function taking void *.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Meng Xu <mengxu@cis.upenn.edu>

v2:
 * New
---
 xen/common/sched/rt.c | 97 ++++++++++++++++++++++++---------------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index c58edca0de84..d5da35cac75e 100644
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
+            .dom             = svc->unit->domain->domain_id,
+            .unit            = svc->unit->unit_id,
+            .priority_level  = svc->priority_level,
+            .cur_deadline    = svc->cur_deadline,
+            .cur_budget      = svc->cur_budget,
+        };
+
+        __trace_var(TRC_RTDS_BUDGET_REPLENISH, 1, sizeof(d), &d);
     }
 
     return;
@@ -965,7 +965,7 @@ burn_budget(const struct scheduler *ops, struct rt_unit *svc, s_time_t now)
         }
     }
 
-    /* TRACE */
+    if ( unlikely(tb_init_done) )
     {
         struct __packed {
             uint16_t unit, dom;
@@ -982,9 +982,7 @@ burn_budget(const struct scheduler *ops, struct rt_unit *svc, s_time_t now)
             .has_extratime   = !!(svc->flags & RTDS_extratime),
         };
 
-        trace_var(TRC_RTDS_BUDGET_BURN, 1,
-                  sizeof(d),
-                  (unsigned char *) &d);
+        __trace_var(TRC_RTDS_BUDGET_BURN, 1, sizeof(d), &d);
     }
 }
 
@@ -1019,22 +1017,19 @@ runq_pick(const struct scheduler *ops, const cpumask_t *mask, unsigned int cpu)
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
+            .unit          = svc->unit->unit_id,
+            .dom           = svc->unit->domain->domain_id,
+            .cur_deadline  = svc->cur_deadline,
+            .cur_budget    = svc->cur_budget,
+        };
+
+        __trace_var(TRC_RTDS_RUNQ_PICK, 1, sizeof(d), &d);
     }
 
     return svc;
@@ -1055,18 +1050,19 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
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
+            .cpu      = cur_cpu,
+            .tasklet  = tasklet_work_scheduled,
+            .tickled  = cpumask_test_cpu(sched_cpu, &prv->tickled),
+            .idle     = is_idle_unit(currunit),
+        };
+
+        __trace_var(TRC_RTDS_SCHEDULE, 1, sizeof(d), &d);
     }
 
     /* clear ticked bit now that we've been scheduled */
@@ -1223,16 +1219,15 @@ runq_tickle(const struct scheduler *ops, const struct rt_unit *new)
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
+        __trace_var(TRC_RTDS_TICKLE, 1, sizeof(d), &d);
     }
 
     cpumask_set_cpu(cpu_to_tickle, &prv->tickled);
-- 
2.11.0



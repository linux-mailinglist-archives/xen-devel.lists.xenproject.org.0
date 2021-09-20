Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B76B411E24
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191056.340997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3L-0007IG-Dj; Mon, 20 Sep 2021 17:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191056.340997; Mon, 20 Sep 2021 17:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN3L-0007Ao-4J; Mon, 20 Sep 2021 17:26:03 +0000
Received: by outflank-mailman (input) for mailman id 191056;
 Mon, 20 Sep 2021 17:26:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN3I-0003cq-DE
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:26:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7800014-1a37-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:25:42 +0000 (UTC)
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
X-Inumbo-ID: c7800014-1a37-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=blg5bSVn1FtPA4eRCL98DmLL9LKNBmU4Jtzbra9P1k8=;
  b=D5uqt+QsDawWW35aCg8jt4mqlc+UIIlq0CvqVejgTOwLVPddQOjUZjkc
   oV4m9KbCx4J8Qk7WJdtPqGsZLqPfPV3Hek6vm3znzEIm2S2z7L9taUSPI
   wWqYgXy5tio6pdzmCocF52mlztBiQvh14LjzlXBo7i6WrjISTy2jZWHow
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +usJDprPJ7Vo3ZALqmwYSVG+CjURABaRCqpMYhYpw8Y1BL2bHBRRV1/FFKSMBeKjLhz5GNjKP9
 02ntmey2s4xsN5Q2UseyFRm+/f46R8Z7iJy5XBiGfGQwB3zXSgyehGxeTgY6SGeBZ+ipWbqJBQ
 NPQ2qC2dvck5YnvBnCIfr3hVDrS1XGbrDYf03SAy7w8N9DHlGerYcfYPLboY7Wvi7Eo5d7widn
 +yBj+tYJKKjSPO3tGTu05DP6U9JqUHpHos426uKNHoXiCaAJL8N4qTYUcqwIgpT7IAQk1mkjIq
 zABYCEpTLQC1uFLLt5sNtKVa
X-SBRS: 5.1
X-MesageID: 53560997
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sdl5R6mWI1Kde09Wk8JvH3To5gx6IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODG3TM/+PYWDzLtFyat7j9BsG75bSy95lGgFlqCg0HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NYdu7ibRiIIApHRhO0jciVjMTolGaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQK2DO
 ZJIOGUHgBLoMixmCEUWGYsHssCRt2GveGdhhU2FnP9ii4TU5FMoi+W8WDbPQfSob8hImkeTp
 krd4n/0RBodMbS3yyeB83+qrv/Cm2X8Qo16PLG2//FlgVqXx0QIFQYbE1C8pJGRiEGkXMlEA
 1cJ4Sdopq83nGSqUdvVTxC+uGSDvBMXR5xXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT/gDJpxmjg7n1chMp7zv2YlmH9Vhda9vwD2C30mQ3/cqsPa7AEALY7
 CNVypDEhAwdJcrSz33WGY3hCJnsvqzcYWOG2TaDCrF8r2zFxpK1QWxHDNiSzm9SO8AYcHfCZ
 EbJsGu9D7cCYSP3Mcebj2+3YvnGLJQM9/y+DZg4jfIUO/CdkTNrGwk0PiatM5jFyhRErE3GE
 c7znTyQ4ZMm5UNPl2Deegvg+eVzmnBWKZ37HMimp/hY7VZuTCHMEupUWLd/Rss48LmFsG3oH
 yV3bpDRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAV/bMiw8MOy/A8kXQLBSFXVEAGtEEkMLOe6HhJrzvbNuFVX+3OA8n/NyU
 dcffMCMXqZGRjjdomxPZpjhto1yMh+sgFvWbSaiZTE+eb9mRhDIpYC4Lle+qnFWA3rlr9Y6r
 p2hyhjfHcgJSTN9AZuEc/mo1V6w4yQQwbogQ0vSL9BPU0zw64w2eTfph/o6LphUexXOzzeXz
 SiMBhIcqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6tofesf
 +RYyf34IcYrplcSvtouCatvwII/+8Dr++1QwDN7ESiZdF+sEL5hfCWLhJEdqq1Xy7ZFkgKqQ
 UbTqMJCMLCENc65Ql4cIA0pMraK2f0Ow2SA6P00JAPx5TNt/arBWkJXZkHehCtYJbpzEYUk3
 eZ+55JGt13h0kInYoSckyRZ12WQNXhRAawou6YTDJLvlgd2mEpJZobRC3Ou7ZyCAzmW3pLG/
 tNAaHL+uolh
IronPort-HdrOrdr: A9a23:zzdLT6PsDXUPYcBcTv2jsMiBIKoaSvp037BN7TEUdfU1SL38qy
 nApoV56faZslcssRIb9+xoWpPwJk80nKQdieN9AV7LZniBhILCFvAB0WKN+V3d8gTFh5dgPf
 gKScND4afLYmSSJ/yKmDVQaOxN/OW6
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53560997"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2 08/12] xen/sched: Clean up trace handling
Date: Mon, 20 Sep 2021 18:25:25 +0100
Message-ID: <20210920172529.24932-9-andrew.cooper3@citrix.com>
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
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>

v2:
 * New
---
 xen/common/sched/core.c   |  4 ++--
 xen/common/sched/credit.c | 38 ++++++++++++++++++--------------------
 xen/common/sched/null.c   | 42 +++++++++++++++++++++++++-----------------
 3 files changed, 45 insertions(+), 39 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d1c..fe133cbf117c 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -205,7 +205,7 @@ static inline struct scheduler *vcpu_scheduler(const struct vcpu *v)
 
 static inline void trace_runstate_change(const struct vcpu *v, int new_state)
 {
-    struct { uint32_t vcpu:16, domain:16; } d;
+    struct { uint16_t vcpu, domain; } d;
     uint32_t event;
 
     if ( likely(!tb_init_done) )
@@ -223,7 +223,7 @@ static inline void trace_runstate_change(const struct vcpu *v, int new_state)
 
 static inline void trace_continue_running(const struct vcpu *v)
 {
-    struct { uint32_t vcpu:16, domain:16; } d;
+    struct { uint16_t vcpu, domain; } d;
 
     if ( likely(!tb_init_done) )
         return;
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index d0aa017c643e..f277fa37a8b1 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1828,21 +1828,18 @@ static void csched_schedule(
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
+        __trace_var(TRC_CSCHED_SCHEDULE, 1, sizeof(d), &d);
     }
 
     runtime = now - unit->state_entry_time;
@@ -1904,14 +1901,15 @@ static void csched_schedule(
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
+            __trace_var(TRC_CSCHED_RATELIMIT, 1, sizeof(d), &d);
         }
 
         goto out;
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 82d5d1baab85..deb59747fbe8 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -329,10 +329,12 @@ pick_res(const struct null_private *prv, const struct sched_unit *unit)
         struct {
             uint16_t unit, dom;
             uint32_t new_cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.new_cpu = new_cpu;
+        } d = {
+            .unit    = unit->unit_id,
+            .dom     = unit->domain->domain_id,
+            .new_cpu = new_cpu,
+        };
+
         __trace_var(TRC_SNULL_PICKED_CPU, 1, sizeof(d), &d);
     }
 
@@ -357,10 +359,12 @@ static void unit_assign(struct null_private *prv, struct sched_unit *unit,
         struct {
             uint16_t unit, dom;
             uint32_t cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.cpu = cpu;
+        } d = {
+            .unit = unit->unit_id,
+            .dom  = unit->domain->domain_id,
+            .cpu  = cpu,
+        };
+
         __trace_var(TRC_SNULL_UNIT_ASSIGN, 1, sizeof(d), &d);
     }
 }
@@ -388,10 +392,12 @@ static bool unit_deassign(struct null_private *prv, const struct sched_unit *uni
         struct {
             uint16_t unit, dom;
             uint32_t cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.cpu = cpu;
+        } d = {
+            .unit = unit->unit_id,
+            .dom  = unit->domain->domain_id,
+            .cpu  = cpu,
+        };
+
         __trace_var(TRC_SNULL_UNIT_DEASSIGN, 1, sizeof(d), &d);
     }
 
@@ -691,11 +697,13 @@ static void null_unit_migrate(const struct scheduler *ops,
         struct {
             uint16_t unit, dom;
             uint16_t cpu, new_cpu;
-        } d;
-        d.dom = unit->domain->domain_id;
-        d.unit = unit->unit_id;
-        d.cpu = sched_unit_master(unit);
-        d.new_cpu = new_cpu;
+        } d = {
+            .unit    = unit->unit_id,
+            .dom     = unit->domain->domain_id,
+            .cpu     = sched_unit_master(unit),
+            .new_cpu = new_cpu,
+        };
+
         __trace_var(TRC_SNULL_MIGRATE, 1, sizeof(d), &d);
     }
 
-- 
2.11.0



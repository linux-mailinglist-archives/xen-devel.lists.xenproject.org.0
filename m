Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA67A943F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:24:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606388.944276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIir-0004pQ-HV; Thu, 21 Sep 2023 12:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606388.944276; Thu, 21 Sep 2023 12:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIir-0004n3-ER; Thu, 21 Sep 2023 12:23:57 +0000
Received: by outflank-mailman (input) for mailman id 606388;
 Thu, 21 Sep 2023 12:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gqFj=FF=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qjIiq-0004mx-0E
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:23:56 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb13c40b-5879-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 14:23:54 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so860126f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 05:23:54 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d4005000000b0031c5dda3aedsm1620901wrp.95.2023.09.21.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 05:23:53 -0700 (PDT)
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
X-Inumbo-ID: bb13c40b-5879-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695299034; x=1695903834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saA8fJ2ZeQlapnn4EiEmFDuuaSgwbsaBe1MiDOt4CaE=;
        b=lWiHw+MJgiPOn0B0nXwr+A9EG370AH7EsjUaCfFywuPim3LgAuQaeFQrj97SmOcs9/
         Ug1Nic7JyGKs9VMtDyJRpB8quvlKzlVU7Jjdbbxhs+FSiLXtVoPva3P1iYFFY3si80Gq
         RBXp7EJx1iE2tYaXLga2HoI8XN760gkWRZgxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695299034; x=1695903834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saA8fJ2ZeQlapnn4EiEmFDuuaSgwbsaBe1MiDOt4CaE=;
        b=BUBUr6l5N+aqyA3EbKj1EhQVWtVyJwsAHtG65qonlt2ZExjl15vE8IRMMZQrPPGRx2
         7N8n3y798MDUCxCF9IKkxvu3bYXZzSzOk510aU99QnFVEeK0jTi/UHf4BRlnPEzO0iA1
         2DwhwZGGvp54KfB+mv6U4OjOrLs38ztA1PriOvRXM2k+HUhS3P5bv/w8Ywh6y/S4/86E
         +wsIUnuicLV+2cQYN6pP5FbErb9dH1fEPu4V6+aUSgZR0yyK8Uh8Q3oX/YEpd+PWQTex
         4+VHCmhGz0cyB4F+nT/r1XEgby7Uq0VrJS0VbN/LffRtsi+MtkRqR/4+jTWMlpCawkGo
         02OA==
X-Gm-Message-State: AOJu0YxMdTM18kLTLkFrivl9vm/v7Hd1AdDIAc8giMvf6wh/U+sOze0d
	pRhhis/EpeDpOuZ9atw64SpAUvqkLbrHsl1nWgw=
X-Google-Smtp-Source: AGHT+IHFPWiFzBwbxJRb3ZpsZQyu2i+rjOazfrsiQY+q3qLKekKZm05U42crXBzHqqK7nm8NelYElw==
X-Received: by 2002:a5d:554e:0:b0:319:775f:d553 with SMTP id g14-20020a5d554e000000b00319775fd553mr5568232wrw.9.1695299034021;
        Thu, 21 Sep 2023 05:23:54 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] credit: Limit load balancing to once per millisecond
Date: Thu, 21 Sep 2023 13:23:51 +0100
Message-Id: <20230921122352.2307574-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The credit scheduler tries as hard as it can to ensure that it always
runs scheduling units with positive credit (PRI_TS_UNDER) before
running those with negative credit (PRI_TS_OVER).  If the next
runnable scheduling unit is of priority OVER, it will always run the
load balancer, which will scour the system looking for another
scheduling unit of the UNDER priority.

Unfortunately, as the number of cores on a system has grown, the cost
of the work-stealing algorithm has dramatically increased; a recent
trace on a system with 128 cores showed this taking over 50
microseconds.

Add a parameter, load_balance_ratelimit, to limit the frequency of
load balance operations on a given pcpu.  Default this to 1
millisecond.

Invert the load balancing conditional to make it more clear, and line
up more closely with the comment above it.

Overall it might be cleaner to have the last_load_balance checking
happen inside csched_load_balance(), but that would require either
passing both now and spc into the function, or looking them up again;
both of which seemed to be worse than simply checking and setting the
values before calling it.

On a system with a vcpu:pcpu ratio of 2:1, running Windows guests
(which will end up calling YIELD during spinlock contention), this
patch increased performance significantly.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Changes since v1:
- Fix editing mistake in commit message
- Improve documentation
- global var is __ro_after_init
- Remove sysctl, as it's not used.  Define max value in credit.c.
- Fix some style issues
- Move comment tweak to the right patch
- In the event that the commandline-parameter value is too high, clip
  to the maximum value rather than setting to the default.

CC: Dario Faggioli <dfaggioli@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc |  8 ++++++
 xen/common/sched/credit.c         | 47 +++++++++++++++++++++++++------
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f88e6a70ae..9c3c72a7f9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1884,6 +1884,14 @@ By default, Xen will use the INVPCID instruction for TLB management if
 it is available.  This option can be used to cause Xen to fall back to
 older mechanisms, which are generally slower.
 
+### load-balance-ratelimit
+> `= <integer>`
+
+The minimum interval between load balancing events on a given pcpu, in
+microseconds.  A value of '0' will disable rate limiting.  Maximum
+value 1 second. At the moment only credit honors this parameter.
+Default 1ms.
+
 ### noirqbalance (x86)
 > `= <boolean>`
 
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index f2cd3d9da3..5c06f596d2 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -50,6 +50,10 @@
 #define CSCHED_TICKS_PER_TSLICE     3
 /* Default timeslice: 30ms */
 #define CSCHED_DEFAULT_TSLICE_MS    30
+/* Default load balancing ratelimit: 1ms */
+#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000
+/* Max load balancing ratelimit: 1s */
+#define CSCHED_MAX_LOAD_BALANCE_RATELIMIT_US     1000000
 #define CSCHED_CREDITS_PER_MSEC     10
 /* Never set a timer shorter than this value. */
 #define CSCHED_MIN_TIMER            XEN_SYSCTL_SCHED_RATELIMIT_MIN
@@ -153,6 +157,7 @@ struct csched_pcpu {
 
     unsigned int idle_bias;
     unsigned int nr_runnable;
+    s_time_t last_load_balance;
 
     unsigned int tick;
     struct timer ticker;
@@ -218,7 +223,7 @@ struct csched_private {
 
     /* Period of master and tick in milliseconds */
     unsigned int tick_period_us, ticks_per_tslice;
-    s_time_t ratelimit, tslice, unit_migr_delay;
+    s_time_t ratelimit, tslice, unit_migr_delay, load_balance_ratelimit;
 
     struct list_head active_sdom;
     uint32_t weight;
@@ -612,6 +617,8 @@ init_pdata(struct csched_private *prv, struct csched_pcpu *spc, int cpu)
     BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));
     cpumask_set_cpu(cpu, prv->idlers);
     spc->nr_runnable = 0;
+
+    spc->last_load_balance = NOW();
 }
 
 static void cf_check
@@ -1676,9 +1683,17 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
     return NULL;
 }
 
+/*
+ * Minimum delay, in microseconds, between load balance operations.
+ * This prevents spending too much time doing load balancing, particularly
+ * when the system has a high number of YIELDs due to spinlock priority inversion.
+ */
+static unsigned int __ro_after_init load_balance_ratelimit_us = CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
+integer_param("load-balance-ratelimit", load_balance_ratelimit_us);
+
 static struct csched_unit *
 csched_load_balance(struct csched_private *prv, int cpu,
-    struct csched_unit *snext, bool *stolen)
+                    struct csched_unit *snext, bool *stolen)
 {
     const struct cpupool *c = get_sched_res(cpu)->cpupool;
     struct csched_unit *speer;
@@ -1958,15 +1973,19 @@ static void cf_check csched_schedule(
         /*
          * SMP Load balance:
          *
-         * If the next highest priority local runnable UNIT has already eaten
-         * through its credits, look on other PCPUs to see if we have more
-         * urgent work... If not, csched_load_balance() will return snext, but
-         * already removed from the runq.
+         * If the next highest priority local runnable UNIT has
+         * already eaten through its credits (and we're below the
+         * balancing ratelimit), look on other PCPUs to see if we have
+         * more urgent work... If we don't, csched_load_balance() will
+         * return snext, but already removed from the runq.
          */
-        if ( snext->pri > CSCHED_PRI_TS_OVER )
-            __runq_remove(snext);
-        else
+        if ( snext->pri <= CSCHED_PRI_TS_OVER
+             && now - spc->last_load_balance > prv->load_balance_ratelimit) {
+            spc->last_load_balance = now;
             snext = csched_load_balance(prv, sched_cpu, snext, &migrated);
+        }
+        else
+            __runq_remove(snext);
 
     } while ( !unit_runnable_state(snext->unit) );
 
@@ -2181,6 +2200,14 @@ csched_global_init(void)
                XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US, vcpu_migration_delay_us);
     }
 
+    if ( load_balance_ratelimit_us > CSCHED_MAX_LOAD_BALANCE_RATELIMIT_US )
+    {
+        load_balance_ratelimit_us = CSCHED_MAX_LOAD_BALANCE_RATELIMIT_US;
+        printk("WARNING: load-balance-ratelimit outside of valid range [0,%d]us.\n"
+               "Setting to max.\n",
+               CSCHED_MAX_LOAD_BALANCE_RATELIMIT_US);
+    }
+
     return 0;
 }
 
@@ -2223,6 +2250,8 @@ csched_init(struct scheduler *ops)
 
     prv->unit_migr_delay = MICROSECS(vcpu_migration_delay_us);
 
+    prv->load_balance_ratelimit = MICROSECS(load_balance_ratelimit_us);
+
     return 0;
 }
 
-- 
2.25.1



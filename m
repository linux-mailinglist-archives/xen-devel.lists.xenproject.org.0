Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA55743AEF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 13:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557445.870800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCRv-00011D-KV; Fri, 30 Jun 2023 11:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557445.870800; Fri, 30 Jun 2023 11:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCRv-0000xk-G6; Fri, 30 Jun 2023 11:38:03 +0000
Received: by outflank-mailman (input) for mailman id 557445;
 Fri, 30 Jun 2023 11:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SFwN=CS=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qFCRt-0000x3-QF
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 11:38:01 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7082c9-173a-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 13:37:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51dd1e5a621so2159893a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 04:37:57 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7db43000000b0051a4361f3efsm6617282edt.61.2023.06.30.04.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 04:37:56 -0700 (PDT)
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
X-Inumbo-ID: 8f7082c9-173a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688125077; x=1690717077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzfbA4Kdd0x8KFR4T495Xa5yXrnJZrQ99E6PRchMhBw=;
        b=lFXKLv+hcMvfvoLg5cHDFxlG5tnvGD/RlzSlzD0W+h4FbPUE8Mu+GzaOJF3C01f4bX
         QXlAzNPPUUZsUtfL+SpnzxQbNJIX4d1QunVkZ7Hh20eJB8k0OEP5XI+6qCN9VRaZrJs7
         RteZkGKajtPZJ5rWgIF68Y1RBzIOQoIX10leI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688125077; x=1690717077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzfbA4Kdd0x8KFR4T495Xa5yXrnJZrQ99E6PRchMhBw=;
        b=ig2TsjDnXPtrjx1tGLerbvi43qWYxLsavD0mckkvRmgWHrDX1tEfQ0n3yFh0mCjXxQ
         dimMO7GfauNIF9yqmXIksPC7aAJOq11EUrKw7wdX+LWsWlkZY5t6yflvT7U0FaOu55ZT
         iB/WCfRgwaWQ2+KCDG12MRjHCOJ4neQK2hNwreehkcJaYvU+TaYMbmNWe61+GtXmJUsm
         seOm6V0yg19lGB+/86Afu5e+Efin9iACN3Pn9cMIiPjsoBfJyHUkH2biNbQb4mQaPzuD
         Mvt2ypq9nfglljdZ+ZjI7bWh9g6mG9Fg7kl2C45Kriit/EFKhn4ij5C9SZq441DBi0VH
         dnJQ==
X-Gm-Message-State: ABy/qLZ7HnpRZU+2jZotL1c7fqLvZEQU4c8XdlrZ/761EchGBVWc7Q+N
	amxJ7B7TicYcY9L5QrPgPaWBYcuQCauxwHRzD3E=
X-Google-Smtp-Source: APBJJlEthxwdgsaPnFeQqyuXpWvb+tdiYNDwi9AKIi2JIbfpn4WFZMAuSWpJgJsGmbLcJWQ7S6/IVA==
X-Received: by 2002:aa7:db48:0:b0:51b:fa0a:dc37 with SMTP id n8-20020aa7db48000000b0051bfa0adc37mr1684133edt.10.1688125077133;
        Fri, 30 Jun 2023 04:37:57 -0700 (PDT)
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
Subject: [PATCH 1/2] credit: Limit load balancing to once per millisecond
Date: Fri, 30 Jun 2023 12:37:55 +0100
Message-Id: <20230630113756.672607-1-george.dunlap@cloud.com>
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

Without this patch, on a system with a vcpu:pcpu ratio of 2:1, running
Windows guests (which will end up calling YIELD during spinlock
contention), this patch increased performance significantly.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc |  6 +++++
 xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
 xen/include/public/sysctl.h       |  6 +++++
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4060ebdc5d..369557020f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instruction for TLB management if
 it is available.  This option can be used to cause Xen to fall back to
 older mechanisms, which are generally slower.
 
+### load-balance-ratelimit
+> `= <integer>`
+
+The minimum interval between load balancing events on a given pcpu.
+At the moment only credit honors this parameter.
+
 ### noirqbalance (x86)
 > `= <boolean>`
 
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index f2cd3d9da3..b8bdfd5f6a 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -50,6 +50,8 @@
 #define CSCHED_TICKS_PER_TSLICE     3
 /* Default timeslice: 30ms */
 #define CSCHED_DEFAULT_TSLICE_MS    30
+/* Default load balancing ratelimit: 1ms */
+#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000
 #define CSCHED_CREDITS_PER_MSEC     10
 /* Never set a timer shorter than this value. */
 #define CSCHED_MIN_TIMER            XEN_SYSCTL_SCHED_RATELIMIT_MIN
@@ -153,6 +155,7 @@ struct csched_pcpu {
 
     unsigned int idle_bias;
     unsigned int nr_runnable;
+    s_time_t last_load_balance;
 
     unsigned int tick;
     struct timer ticker;
@@ -218,7 +221,7 @@ struct csched_private {
 
     /* Period of master and tick in milliseconds */
     unsigned int tick_period_us, ticks_per_tslice;
-    s_time_t ratelimit, tslice, unit_migr_delay;
+    s_time_t ratelimit, tslice, unit_migr_delay, load_balance_ratelimit;
 
     struct list_head active_sdom;
     uint32_t weight;
@@ -612,6 +615,8 @@ init_pdata(struct csched_private *prv, struct csched_pcpu *spc, int cpu)
     BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));
     cpumask_set_cpu(cpu, prv->idlers);
     spc->nr_runnable = 0;
+
+    spc->last_load_balance = NOW();
 }
 
 static void cf_check
@@ -1267,7 +1272,8 @@ csched_sys_cntl(const struct scheduler *ops,
                  && (params->ratelimit_us > XEN_SYSCTL_SCHED_RATELIMIT_MAX
                      || params->ratelimit_us < XEN_SYSCTL_SCHED_RATELIMIT_MIN))
              || MICROSECS(params->ratelimit_us) > MILLISECS(params->tslice_ms)
-             || params->vcpu_migr_delay_us > XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US )
+             || params->vcpu_migr_delay_us > XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US
+             || params->load_balance_ratelimit_us > XEN_SYSCTL_CSCHED_LB_RATE_MAX_US)
                 goto out;
 
         spin_lock_irqsave(&prv->lock, flags);
@@ -1278,6 +1284,7 @@ csched_sys_cntl(const struct scheduler *ops,
             printk(XENLOG_INFO "Disabling context switch rate limiting\n");
         prv->ratelimit = MICROSECS(params->ratelimit_us);
         prv->unit_migr_delay = MICROSECS(params->vcpu_migr_delay_us);
+        prv->load_balance_ratelimit = MICROSECS(params->load_balance_ratelimit_us);
         spin_unlock_irqrestore(&prv->lock, flags);
 
         /* FALLTHRU */
@@ -1285,6 +1292,7 @@ csched_sys_cntl(const struct scheduler *ops,
         params->tslice_ms = prv->tslice / MILLISECS(1);
         params->ratelimit_us = prv->ratelimit / MICROSECS(1);
         params->vcpu_migr_delay_us = prv->unit_migr_delay / MICROSECS(1);
+        params->load_balance_ratelimit_us = prv->load_balance_ratelimit / MICROSECS(1);
         rc = 0;
         break;
     }
@@ -1676,9 +1684,17 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
     return NULL;
 }
 
+/*
+ * Minimum delay, in microseconds, between load balance operations.
+ * This prevents spending too much time doing load balancing, particularly
+ * when the system has a high number of YIELDs due to spinlock priority inversion.
+ */
+static unsigned int __read_mostly load_balance_ratelimit_us = CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
+integer_param("load-balance-ratelimit", load_balance_ratelimit_us);
+
 static struct csched_unit *
 csched_load_balance(struct csched_private *prv, int cpu,
-    struct csched_unit *snext, bool *stolen)
+                    struct csched_unit *snext, bool *stolen)
 {
     const struct cpupool *c = get_sched_res(cpu)->cpupool;
     struct csched_unit *speer;
@@ -1963,10 +1979,12 @@ static void cf_check csched_schedule(
          * urgent work... If not, csched_load_balance() will return snext, but
          * already removed from the runq.
          */
-        if ( snext->pri > CSCHED_PRI_TS_OVER )
-            __runq_remove(snext);
-        else
+        if ( snext->pri <= CSCHED_PRI_TS_OVER
+             && now - spc->last_load_balance > prv->load_balance_ratelimit) {
+            spc->last_load_balance = now;
             snext = csched_load_balance(prv, sched_cpu, snext, &migrated);
+        } else
+            __runq_remove(snext);
 
     } while ( !unit_runnable_state(snext->unit) );
 
@@ -2181,6 +2199,14 @@ csched_global_init(void)
                XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US, vcpu_migration_delay_us);
     }
 
+    if ( load_balance_ratelimit_us > XEN_SYSCTL_CSCHED_LB_RATE_MAX_US )
+    {
+        load_balance_ratelimit_us = CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
+        printk("WARNING: load-balance-ratelimit outside of valid range [0,%d]us.\n"
+               "Resetting to default: %u\n",
+               XEN_SYSCTL_CSCHED_LB_RATE_MAX_US, load_balance_ratelimit_us);
+    }
+
     return 0;
 }
 
@@ -2223,6 +2249,8 @@ csched_init(struct scheduler *ops)
 
     prv->unit_migr_delay = MICROSECS(vcpu_migration_delay_us);
 
+    prv->load_balance_ratelimit = MICROSECS(load_balance_ratelimit_us);
+
     return 0;
 }
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9d06e92d0f..48f7f57037 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -641,6 +641,12 @@ struct xen_sysctl_credit_schedule {
     */
 #define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)
     uint32_t vcpu_migr_delay_us;
+    /*
+     * Minimum delay, in microseconds, between load balance
+     * operations; max 1 second.
+     */
+#define XEN_SYSCTL_CSCHED_LB_RATE_MAX_US (1000000)
+    uint32_t load_balance_ratelimit_us;
 };
 
 struct xen_sysctl_credit2_schedule {
-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DC6F12FE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 10:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527186.819498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9i-0003Nl-Ob; Fri, 28 Apr 2023 08:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527186.819498; Fri, 28 Apr 2023 08:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psJ9i-0003M4-LT; Fri, 28 Apr 2023 08:08:38 +0000
Received: by outflank-mailman (input) for mailman id 527186;
 Fri, 28 Apr 2023 08:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmhV=AT=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1psJ9h-00036x-5v
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 08:08:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe1bf24-e59b-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 10:08:35 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so65422235e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 01:08:35 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b003f31da39b62sm2569464wmo.18.2023.04.28.01.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 01:08:34 -0700 (PDT)
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
X-Inumbo-ID: dfe1bf24-e59b-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682669315; x=1685261315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcniXQbDbWeLRllJP53Ow0hRDGiOunRnJjI6sJOsHmU=;
        b=Tt9NLBoplSuQ4mo/EcdFjUCOO1/5GW1htY6ErRTJzM2I/E6v1i8WjeGghS5NQg54Bj
         DBIghLd/qZhORWId+mbFQiJ/xZGlY8KDRHPEcXyNAt7k7iPgktlPH44L9Ojzec1olVvt
         Sh1DQnmN0xpc+CsIbW6/Augr8nNKpdanhqrkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682669315; x=1685261315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcniXQbDbWeLRllJP53Ow0hRDGiOunRnJjI6sJOsHmU=;
        b=LU+j8ITf3kWVksi/Wv+VhnwTDAoWz5ePB12NBklEPXYFn0Va1CctWowizA5j/TFacH
         QRjiECnV1SRrBFwAybMAkli2Q04FfIclmKm0VJDV2nCvZ050M1hpLSqtrbd57icJTQH1
         frHY5eN/JJKUV6BQasK+Rgh4xWDgXnm9LTsVk0R8XoWnGZoB4USuy4j3PBqva8RLj6vX
         pDB5dNjHp74ZkDPyeS3ThC+1H7x1gK1uWwxbTJVB07eRuGLDYCmdQyQFgsttoRdLvhax
         jGwy3/+UP+Mvw5UVYykHn+GGlqqXQavj1VmowSd2qQPFc5De1mcL6M8mp1VPRgFyuej1
         l1gw==
X-Gm-Message-State: AC+VfDzJRcCy9ckXMBBj+39t+4fDzbuhfOzFRJ1ajHxVvBa2Zpc8Og4Y
	SXdJZd/+Pj4sWrVkNS5b5LrEq7VtF1RSeHZ7IAU=
X-Google-Smtp-Source: ACHHUZ6S2ykCEmxqd6YKHBi4EZgGUrRFvLs9W6AhzdzaFW9dxCuWknEEQ3+DRECWsIh8rXyXIB6rYw==
X-Received: by 2002:a7b:ce07:0:b0:3f1:e5f2:5e86 with SMTP id m7-20020a7bce07000000b003f1e5f25e86mr3185741wmc.23.1682669315034;
        Fri, 28 Apr 2023 01:08:35 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 3/5] credit: Limit load balancing to once per millisecond
Date: Fri, 28 Apr 2023 09:08:30 +0100
Message-Id: <20230428080832.2461044-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428080832.2461044-1-george.dunlap@cloud.com>
References: <20230428080832.2461044-1-george.dunlap@cloud.com>
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

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 docs/misc/xen-command-line.pandoc |  6 +++++
 xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
 xen/include/public/sysctl.h       |  6 +++++
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e0b89b7d33..ae51a8cfa2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1840,6 +1840,12 @@ By default, Xen will use the INVPCID instruction for TLB management if
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
index 2b24d6bfd0..192458d635 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -637,6 +637,12 @@ struct xen_sysctl_credit_schedule {
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



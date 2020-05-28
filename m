Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC371E6DA3
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ67-0000ZI-8D; Thu, 28 May 2020 21:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ66-0000Z6-Cb
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:29:54 +0000
X-Inumbo-ID: 5dfc8d56-a12a-11ea-a83e-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dfc8d56-a12a-11ea-a83e-12813bfff9fa;
 Thu, 28 May 2020 21:29:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so866668wrn.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=rQ7Tl9PBNxTBxCYn4Y9mVqk3mlMzPIyms5hZ/Bt2tmY=;
 b=XW2tBMNn0zNlfZv58/8SgZLlaHX5/d8REukdrsubBAeSTWiMX8u1mwBaJd/bUJDBnK
 ONXW6BJD1F59FfL49ynBEeT/yYCZnFhxoaU+hPfBqgmCV9AfieFljzfytoLz1SgpUA7M
 ZdYJBmxFMg+PGQKSY2gqjuRbbWxpi2xS/6LJ+P92MigyJu6BK6cC8Imx+5KBfHk6TbaV
 RX7Dcy7Sx6miCVHYDPvOSP4fSR9sJI1Nhd4YWRTugGq483Syb4HUoDfqggWhE76aRSvg
 TMB/LAlGI1cR9ezQtmks34jumw0N8sIkLgf64ZaO9Fgdb28wa3DXtE3sku1icgpEqlsb
 m7Cw==
X-Gm-Message-State: AOAM5330f5NY8sR2I3i6Dii3XSJLv1n1EmUmmCEzxnJpsKJh0Scoptmz
 8Dtb/edOd9gFRUBCHUZyQUM=
X-Google-Smtp-Source: ABdhPJy6mBC6m3+RplBD4/x+yE9izwjhW1w9Ukki0KWqb83MAezO3fTKYvF3932his/v/tC6w+pq8w==
X-Received: by 2002:adf:a3c9:: with SMTP id m9mr5312588wrb.405.1590701392123; 
 Thu, 28 May 2020 14:29:52 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id y207sm9318196wmd.7.2020.05.28.14.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:51 -0700 (PDT)
Subject: [PATCH v2 5/7] xen: credit2: compute cpus per-runqueue more
 dynamically.
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:50 +0200
Message-ID: <159070139062.12060.9216996770730278147.stgit@Palanthas>
In-Reply-To: <159070133878.12060.13318432301910522647.stgit@Palanthas>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

During boot, we use num_online_cpus() as an indication of how
many CPUs will end up in cpupool 0. We then decide (basing also
on the value of the boot time parameter opt_max_cpus_runqueue)
the actual number of CPUs that we want in each runqueue, in such
a way that the runqueue themselves are as balanced (in therms of
how many CPUs they have) as much as possible.

After boot, though, when for instance we are creating a cpupool,
it would be more appropriate to use the number of CPUs of the
pool, rather than the total number of online CPUs.

Do exactly that, even if this means (since from Xen's perspective
CPUs are added to pools one by one) we'll be computing a different
maximum number of CPUs per runqueue at each time.

In fact, we do it in preparation for the next change where,
after having computed the new value, we will also re-balance
the runqueues, by rebuilding them in such a way that the newly
computed maximum is actually respected for all of them.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
Changes from v1:
* new patch
---
 xen/common/sched/credit2.c |   30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index f4d3f8ae6b..af6d374677 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -922,7 +922,8 @@ cpu_runqueue_siblings_match(const struct csched2_runqueue_data *rqd,
 }
 
 static struct csched2_runqueue_data *
-cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
+cpu_add_to_runqueue(const struct scheduler *ops, unsigned int nr_cpus,
+                    unsigned int cpu)
 {
     struct csched2_private *prv = csched2_priv(ops);
     struct csched2_runqueue_data *rqd, *rqd_new;
@@ -943,8 +944,8 @@ cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
      * how many CPUs we have, so let's use the number of CPUs that are online
      * for that.
      */
-    min_rqs = ((num_online_cpus() - 1) / opt_max_cpus_runqueue) + 1;
-    max_cpus_runq = num_online_cpus() / min_rqs;
+    min_rqs = ((nr_cpus - 1) / opt_max_cpus_runqueue) + 1;
+    max_cpus_runq = nr_cpus / min_rqs;
 
     write_lock_irqsave(&prv->lock, flags);
 
@@ -3781,8 +3782,10 @@ csched2_dump(const struct scheduler *ops)
      */
     read_lock_irqsave(&prv->lock, flags);
 
-    printk("Active queues: %d\n"
+    printk("Active CPUs: %u\n"
+           "Active queues: %u\n"
            "\tdefault-weight     = %d\n",
+           cpumask_weight(&prv->initialized),
            prv->active_queues,
            CSCHED2_DEFAULT_WEIGHT);
     list_for_each_entry ( rqd, &prv->rql, rql )
@@ -3879,6 +3882,7 @@ csched2_alloc_pdata(const struct scheduler *ops, int cpu)
 {
     struct csched2_pcpu *spc;
     struct csched2_runqueue_data *rqd;
+    unsigned int nr_cpus;
 
     BUG_ON(cpu_to_socket(cpu) == XEN_INVALID_SOCKET_ID);
 
@@ -3886,7 +3890,23 @@ csched2_alloc_pdata(const struct scheduler *ops, int cpu)
     if ( spc == NULL )
         return ERR_PTR(-ENOMEM);
 
-    rqd = cpu_add_to_runqueue(ops, cpu);
+    /*
+     * If the system is booting, we know that, at this point, num_online_cpus()
+     * CPUs have been brought up, and will be added to the default cpupool and
+     * hence to this scheduler. This is valuable information that we can use
+     * to build the runqueues in an already balanced state.
+     *
+     * On the other hand, when we are live, and e.g., are creating a new
+     * cpupool, or adding CPUs to an already existing one,  we have no way to
+     * know in advance, from here, how many CPUs it will have. Therefore, in
+     * that case, we just use the current number of CPUs that the pool has,
+     * plus 1, because we are in the process of adding it, for the balancing.
+     * This will likely provide suboptimal results, and we rely on dynamic
+     * runqueue rebalancing for fixing it up.
+     */
+    nr_cpus = system_state < SYS_STATE_active ? num_online_cpus() :
+        cpumask_weight(&csched2_priv(ops)->initialized) + 1;
+    rqd = cpu_add_to_runqueue(ops, nr_cpus, cpu);
     if ( IS_ERR(rqd) )
     {
         xfree(spc);



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877781E6DA5
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ6E-0000kp-OF; Thu, 28 May 2020 21:30:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ6C-0000c9-Nn
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:30:00 +0000
X-Inumbo-ID: 62131932-a12a-11ea-a83e-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62131932-a12a-11ea-a83e-12813bfff9fa;
 Thu, 28 May 2020 21:29:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so867126wrn.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=fW30aG1W0jN7We9433N5nJ1Y6xjm4AOXMc+J0AYDRT0=;
 b=aoPYK8Y4idezJX48/tvAOnk18aUtbwgpwMpW4hadoxewRPhjwq99EclFNHu8AHAyht
 sS3mIoNxwC11a9NCorGXMGEnfTN2Gas/V4+xZUVkF+j7iMurBwGLzvEAQcytZSwhXoYS
 UrfasN4TsZZCfHjpycQGFSn8+mlb7sGPOUvLDWABndGRotgtsk4pEWJFTjO1v1yzhnnJ
 mOWpp/4Bp7VkSuGCPGp482HX2uTW7B0spszRDEw9WPI4bEhCiU5sTyT3sHnqQcu1OPpf
 0VVM6X14AgOKSWW1Sdd+rK7Cj+cFAYBnDwPA5bxEziEQNLuKCOosfflM7+uYUTEPiRd/
 svMA==
X-Gm-Message-State: AOAM531SPO9iHSzbA5cFFk3dLleab6jRUEfDgmhX3X6tSWRvboRPlYFB
 m2HMrTNOHvt2g/YUNOOAWGE=
X-Google-Smtp-Source: ABdhPJzwKIRpWKuB1+AU4ejvi/dOi5O1e15rqE5i9fKNhqi+asxrnpNPwSxZ+Hur5VKKNbo9+/1JVQ==
X-Received: by 2002:adf:8b0c:: with SMTP id n12mr5861182wra.340.1590701398903; 
 Thu, 28 May 2020 14:29:58 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id f128sm7845886wme.1.2020.05.28.14.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:58 -0700 (PDT)
Subject: [PATCH v2 6/7] cpupool: create an the 'cpupool sync' infrastructure
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:57 +0200
Message-ID: <159070139727.12060.7434914618426479787.stgit@Palanthas>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In case we want to make some live changes to the configuration
of (typically) the scheduler of a cpupool, we need things to be
quiet in that pool.

Not necessarily like with stop machine, but we at least need
to make sure that no domains are neither running not sitting
in the runqueues of the scheduler itself.

In fact, we need exactly something like this mechanism, for
changing "on the fly" which CPUs are assigned to which runqueue
in a Credit2 cpupool (check the following changes).
Therefore, instead than doing something specific for such a
use case, let's implement a generic mechanism.

Reason is, of course, that it may turn out to be useful for
other purposes, in future. But even for this specific case,
it is much easier and cleaner to just cede control to cpupool
code, instead of trying to do everything inside the scheduler.

Within the new cpupool_sync() function, we want to pause all
domains of a pool, including potentially the one calling
the function. Therefore, we defer the pausing, the actual work
and also the unpausing to a tasklet.

Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from v1:
* new patch
---
 xen/common/sched/cpupool.c |   52 ++++++++++++++++++++++++++++++++++++++++++++
 xen/common/sched/private.h |    6 +++++
 xen/include/xen/sched.h    |    1 +
 3 files changed, 59 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 7ea641ca26..122c371c7a 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -234,6 +234,42 @@ void cpupool_put(struct cpupool *pool)
     free_cpupool_struct(pool);
 }
 
+void do_cpupool_sync(void *arg)
+{
+    struct cpupool *c = arg;
+    struct domain *d;
+
+
+    spin_lock(&cpupool_lock);
+
+    /*
+     * With this second call (and this time to domain_pause()) we basically
+     * make sure that all the domains have actually stopped running.
+     */
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain_in_cpupool(d, c)
+        domain_pause(d);
+    rcu_read_unlock(&domlist_read_lock);
+
+    /*
+     * Let's invoke the function that the caller provided. We pass a reference
+     * to our own scheduler as a parameter, with which it should easily reach
+     * anything it needs.
+     */
+    c->sync_ctl.func(c->sched);
+
+    /* We called pause twice, so we need to to the same with unpause. */
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain_in_cpupool(d, c)
+    {
+        domain_unpause(d);
+        domain_unpause(d);
+    }
+    rcu_read_unlock(&domlist_read_lock);
+
+    spin_unlock(&cpupool_lock);
+}
+
 /*
  * create a new cpupool with specified poolid and scheduler
  * returns pointer to new cpupool structure if okay, NULL else
@@ -292,6 +328,8 @@ static struct cpupool *cpupool_create(
 
     *q = c;
 
+    tasklet_init(&c->sync_ctl.tasklet, do_cpupool_sync, c);
+
     spin_unlock(&cpupool_lock);
 
     debugtrace_printk("Created cpupool %d with scheduler %s (%s)\n",
@@ -332,6 +370,7 @@ static int cpupool_destroy(struct cpupool *c)
         return -EBUSY;
     }
     *q = c->next;
+    tasklet_kill(&c->sync_ctl.tasklet);
     spin_unlock(&cpupool_lock);
 
     cpupool_put(c);
@@ -372,6 +411,19 @@ int cpupool_move_domain(struct domain *d, struct cpupool *c)
     return ret;
 }
 
+void cpupool_sync(struct cpupool *c, void (*func)(void*))
+{
+    struct domain *d;
+
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain_in_cpupool(d, c)
+        domain_pause_nosync(d);
+    rcu_read_unlock(&domlist_read_lock);
+
+    c->sync_ctl.func = func;
+    tasklet_schedule_on_cpu(&c->sync_ctl.tasklet, cpumask_first(c->cpu_valid));
+}
+
 /*
  * assign a specific cpu to a cpupool
  * cpupool_lock must be held
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index df50976eb2..4705c8b119 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -503,6 +503,11 @@ static inline void sched_unit_unpause(const struct sched_unit *unit)
 #define REGISTER_SCHEDULER(x) static const struct scheduler *x##_entry \
   __used_section(".data.schedulers") = &x;
 
+struct cpupool_sync_ctl {
+    struct tasklet tasklet;
+    void (*func)(void*);
+};
+
 struct cpupool
 {
     int              cpupool_id;
@@ -514,6 +519,7 @@ struct cpupool
     struct scheduler *sched;
     atomic_t         refcnt;
     enum sched_gran  gran;
+    struct cpupool_sync_ctl sync_ctl;
 };
 
 static inline cpumask_t *cpupool_domain_master_cpumask(const struct domain *d)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ac53519d7f..e2a233c96c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1061,6 +1061,7 @@ extern enum cpufreq_controller {
 } cpufreq_controller;
 
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
+void cpupool_sync(struct cpupool *c, void (*func)(void*));
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
 int cpupool_get_id(const struct domain *d);
 const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C41E6DA8
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ60-0000Wv-Up; Thu, 28 May 2020 21:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ5z-0000Wd-KF
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:29:47 +0000
X-Inumbo-ID: 5a133d48-a12a-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a133d48-a12a-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 21:29:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j16so908973wrb.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=3OHWyR/HwCR9rAgCd2sPFwONc/WZNxWgzepLW7mEl5s=;
 b=O6ZQheLB0zc2hDGifGFP21rWCimraF4c6i5Q/171V7ADdEislZXv+y3ddg3/bSsR5J
 xv6EzoRkCIAqjwxjjNqxsnbmfCFmIg6bbPXL6HSvCRbr/gAe0nMUpd39oscDC57HSR2v
 7Fc7P9etgurKf6C+JhMsoDY6lZ0NnKQoHw5At30PgWH0YO/OCwlvHiSzUV32IbXPkEYQ
 LKOjDCddNZpF3dblT3d9NHo4DYVg4qJjzgJERYmg1zbRFmqBO89Bi6baSJ9to2ad4ZOS
 ipbYA0hr3yfHH+x0HMBG+glGDgi1yVgjTWU2dUc/vmsuKkOmzUAbhO1RKlulAoeQSOff
 zr1A==
X-Gm-Message-State: AOAM530o+25K35YLrLfA9Qbhn3n38BXHFFTiRmj4Yx+IJdi8qku5bNvS
 UeTtbtc5qi9cv5X4Q9tcjtbAo5vr
X-Google-Smtp-Source: ABdhPJyDtEKhRCBAmDt+TXjHz1fweMI24AbQNOf2IVNAfXv58Q7YnhR6n8/q/qoSew4h9144P3iIxQ==
X-Received: by 2002:adf:ee47:: with SMTP id w7mr5240607wro.171.1590701385533; 
 Thu, 28 May 2020 14:29:45 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id t185sm7871999wmt.28.2020.05.28.14.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:44 -0700 (PDT)
Subject: [PATCH v2 4/7] xen: credit2: limit the max number of CPUs in a
 runqueue
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:44 +0200
Message-ID: <159070138395.12060.9523981885146042705.stgit@Palanthas>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In Credit2 CPUs (can) share runqueues, depending on the topology. For
instance, with per-socket runqueues (the default) all the CPUs that are
part of the same socket share a runqueue.

On platform with a huge number of CPUs per socket, that could be a
problem. An example is AMD EPYC2 servers, where we can have up to 128
CPUs in a socket.

It is of course possible to define other, still topology-based, runqueue
arrangements (e.g., per-LLC, per-DIE, etc). But that may still result in
runqueues with too many CPUs on other/future platforms. For instance, a
system with 96 CPUs and 2 NUMA nodes will end up having 48 CPUs per
runqueue. Not as bad, but still a lot!

Therefore, let's set a limit to the max number of CPUs that can share a
Credit2 runqueue. The actual value is configurable (at boot time), the
default being 16. If, for instance,  there are more than 16 CPUs in a
socket, they'll be split among two (or more) runqueues.

Note: with core scheduling enabled, this parameter sets the max number
of *scheduling resources* that can share a runqueue. Therefore, with
granularity set to core (and assumint 2 threads per core), we will have
at most 16 cores per runqueue, which corresponds to 32 threads. But that
is fine, considering how core scheduling works.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>
---
Changes from v1:
- always try to add a CPU to the runqueue with the least CPUs already in
  it. This should guarantee a more even distribution of CPUs among
  runqueues, as requested during review;
- rename the matching function from foo_smt_bar() to foo_siblings_bar(),
  which is more generic, and do the same to the per-arch wrappers;
- deal with the case where the user is trying to set fewer CPUs per
  runqueue than there are siblings per core (by putting siblings in the
  same runq anyway, but logging a message), as requested during review;
- use the per-cpupool value for the scheduling granularity, as requested
  during review;
- add a comment about why we also count siblings that are currently
  outside of our cpupool, as suggested during review;
- add a boot command line doc entry;
- fix typos in comments;
---
 docs/misc/xen-command-line.pandoc |   14 ++++
 xen/common/sched/credit2.c        |  144 +++++++++++++++++++++++++++++++++++--
 xen/include/asm-arm/cpufeature.h  |    5 +
 xen/include/asm-x86/processor.h   |    5 +
 4 files changed, 162 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e16bb90184..1787f2c8fb 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1840,6 +1840,20 @@ with read and write permissions.
 
 Choose the default scheduler.
 
+### sched_credit2_max_cpus_runqueue
+> `= <integer>`
+
+> Default: `16`
+
+Defines how many CPUs will be put, at most, in each Credit2 runqueue.
+
+Runqueues are still arranged according to the host topology (and following
+what indicated by the 'credit2_runqueue' parameter). But we also have a cap
+to the number of CPUs that share each runqueues.
+
+A value that is a submultiple of the number of online CPUs is recommended,
+as that would likely produce a perfectly balanced runqueue configuration.
+
 ### sched_credit2_migrate_resist
 > `= <integer>`
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 8a4f28b9f5..f4d3f8ae6b 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -25,6 +25,7 @@
 #include <xen/trace.h>
 #include <xen/cpu.h>
 #include <xen/keyhandler.h>
+#include <asm/processor.h>
 
 #include "private.h"
 
@@ -471,6 +472,22 @@ static int __init parse_credit2_runqueue(const char *s)
 }
 custom_param("credit2_runqueue", parse_credit2_runqueue);
 
+/*
+ * How many CPUs will be put, at most, in each runqueue.
+ *
+ * Runqueues are still arranged according to the host topology (and according
+ * to the value of the 'credit2_runqueue' parameter). But we also have a cap
+ * to the number of CPUs that share runqueues.
+ *
+ * This should be considered an upper limit. In fact, we also try to balance
+ * the number of CPUs in each runqueue. And, when doing that, it is possible
+ * that fewer CPUs than what this parameters mandates will actually be put
+ * in each runqueue.
+ */
+#define MAX_CPUS_RUNQ 16
+static unsigned int __read_mostly opt_max_cpus_runqueue = MAX_CPUS_RUNQ;
+integer_param("sched_credit2_max_cpus_runqueue", opt_max_cpus_runqueue);
+
 /*
  * Per-runqueue data
  */
@@ -852,18 +869,83 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
            (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu));
 }
 
+/*
+ * Additional checks, to avoid separating siblings in different runqueues.
+ * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
+ * any similar concept will just have cpu_nr_siblings() always return 1, and
+ * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
+ * will just work as well.
+ */
+static bool
+cpu_runqueue_siblings_match(const struct csched2_runqueue_data *rqd,
+                            unsigned int cpu, unsigned int max_cpus_runq)
+{
+    unsigned int nr_sibls = cpu_nr_siblings(cpu);
+    unsigned int rcpu, tot_sibls = 0;
+
+    /*
+     * If we put the CPU in this runqueue, we must be sure that there will
+     * be enough room for accepting its sibling(s) as well.
+     */
+    cpumask_clear(cpumask_scratch_cpu(cpu));
+    for_each_cpu ( rcpu, &rqd->active )
+    {
+        ASSERT(rcpu != cpu);
+        if ( !cpumask_intersects(per_cpu(cpu_sibling_mask, rcpu), cpumask_scratch_cpu(cpu)) )
+        {
+            /*
+             * For each CPU already in the runqueue, account for it and for
+             * its sibling(s), independently from whether they are in the
+             * runqueue or not. Of course, we do this only once, for each CPU
+             * that is already inside the runqueue and all its siblings!
+             *
+             * This way, even if there are CPUs in the runqueue with siblings
+             * in a different cpupools, we still count all of them here.
+             * The reason for this is that, if at some future point we will
+             * move those sibling CPUs to this cpupool, we want them to land
+             * in this runqueue. Hence we must be sure to leave space for them.
+             */
+            cpumask_or(cpumask_scratch_cpu(cpu), cpumask_scratch_cpu(cpu),
+                       per_cpu(cpu_sibling_mask, rcpu));
+            tot_sibls += cpu_nr_siblings(rcpu);
+        }
+    }
+    /*
+     * We know that neither the CPU, nor any of its sibling are here,
+     * or we wouldn't even have entered the function.
+     */
+    ASSERT(!cpumask_intersects(cpumask_scratch_cpu(cpu),
+                               per_cpu(cpu_sibling_mask, cpu)));
+
+    /* Try adding CPU and its sibling(s) to the count and check... */
+    return tot_sibls + nr_sibls <= max_cpus_runq;
+}
+
 static struct csched2_runqueue_data *
-cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
+cpu_add_to_runqueue(const struct scheduler *ops, unsigned int cpu)
 {
+    struct csched2_private *prv = csched2_priv(ops);
     struct csched2_runqueue_data *rqd, *rqd_new;
+    struct csched2_runqueue_data *rqd_valid = NULL;
     struct list_head *rqd_ins;
     unsigned long flags;
     int rqi = 0;
-    bool rqi_unused = false, rqd_valid = false;
+    unsigned int min_rqs, max_cpus_runq;
+    bool rqi_unused = false;
 
     /* Prealloc in case we need it - not allowed with interrupts off. */
     rqd_new = xzalloc(struct csched2_runqueue_data);
 
+    /*
+     * While respecting the limit of not having more than the max number of
+     * CPUs per runqueue, let's also try to "spread" the CPU, as evenly as
+     * possible, among the runqueues. For doing that, we need to know upfront
+     * how many CPUs we have, so let's use the number of CPUs that are online
+     * for that.
+     */
+    min_rqs = ((num_online_cpus() - 1) / opt_max_cpus_runqueue) + 1;
+    max_cpus_runq = num_online_cpus() / min_rqs;
+
     write_lock_irqsave(&prv->lock, flags);
 
     rqd_ins = &prv->rql;
@@ -873,10 +955,59 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
         if ( !rqi_unused && rqd->id > rqi )
             rqi_unused = true;
 
+        /*
+         * First of all, let's check whether, according to the system
+         * topology, this CPU belongs in this runqueue.
+         */
         if ( cpu_runqueue_match(rqd, cpu) )
         {
-            rqd_valid = true;
-            break;
+            /*
+             * If the CPU has any siblings, they are online and they are
+             * being added to this cpupool, always keep them together. Even
+             * if that means violating what the opt_max_cpus_runqueue param
+             * indicates. However, if this happens, chances are high that a
+             * too small value was used for the parameter, so warn the user
+             * about that.
+             *
+             * Note that we cannot check this once and for all, say, during
+             * scheduler initialization. In fact, at least in theory, the
+             * number of siblings a CPU has may not be the same for all the
+             * CPUs.
+             */
+            if ( cpumask_intersects(&rqd->active, per_cpu(cpu_sibling_mask, cpu)) )
+            {
+                if ( cpumask_weight(&rqd->active) >= opt_max_cpus_runqueue )
+                {
+                        printk("WARNING: %s: more than opt_max_cpus_runqueue "
+                               "in a runqueue (%u vs %u), due to topology constraints.\n"
+                               "Consider raising it!\n",
+                               __func__, opt_max_cpus_runqueue,
+                               cpumask_weight(&rqd->active));
+                }
+                rqd_valid = rqd;
+                break;
+            }
+
+            /*
+             * If we're using core (or socket) scheduling, no need to do any
+             * further checking beyond the number of CPUs already in this
+             * runqueue respecting our upper bound.
+             *
+             * Otherwise, let's try to make sure that siblings stay in the
+             * same runqueue, pretty much under any cinrcumnstances.
+             */
+            if ( rqd->refcnt < max_cpus_runq && (ops->cpupool->gran != SCHED_GRAN_cpu ||
+                  cpu_runqueue_siblings_match(rqd, cpu, max_cpus_runq)) )
+            {
+                /*
+                 * This runqueue is ok, but as we said, we also want an even
+                 * distribution of the CPUs. So, unless this is the very first
+                 * match, we go on, check all runqueues and actually add the
+                 * CPU into the one that is less full.
+                 */
+                if ( !rqd_valid || rqd->refcnt < rqd_valid->refcnt )
+                    rqd_valid = rqd;
+            }
         }
 
         if ( !rqi_unused )
@@ -900,6 +1031,8 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
         rqd->pick_bias = cpu;
         rqd->id = rqi;
     }
+    else
+        rqd = rqd_valid;
 
     rqd->refcnt++;
 
@@ -3744,7 +3877,6 @@ csched2_dump(const struct scheduler *ops)
 static void *
 csched2_alloc_pdata(const struct scheduler *ops, int cpu)
 {
-    struct csched2_private *prv = csched2_priv(ops);
     struct csched2_pcpu *spc;
     struct csched2_runqueue_data *rqd;
 
@@ -3754,7 +3886,7 @@ csched2_alloc_pdata(const struct scheduler *ops, int cpu)
     if ( spc == NULL )
         return ERR_PTR(-ENOMEM);
 
-    rqd = cpu_add_to_runqueue(prv, cpu);
+    rqd = cpu_add_to_runqueue(ops, cpu);
     if ( IS_ERR(rqd) )
     {
         xfree(spc);
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 9af5666628..8fdf9685d7 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -64,6 +64,11 @@ static inline bool cpus_have_cap(unsigned int num)
     return test_bit(num, cpu_hwcaps);
 }
 
+static inline cpu_nr_siblings(unsigned int)
+{
+    return 1;
+}
+
 /* System capability check for constant cap */
 #define cpus_have_const_cap(num) ({                 \
         register_t __ret;                           \
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 070691882b..73017c3f4b 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -174,6 +174,11 @@ extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
 
 unsigned int apicid_to_socket(unsigned int);
 
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return cpu_data[cpu].x86_num_siblings;
+}
+
 /*
  * Generic CPUID function
  * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx



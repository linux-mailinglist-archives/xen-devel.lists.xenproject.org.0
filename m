Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4845EE9C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232778.403774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawN-0003DT-9d; Fri, 26 Nov 2021 13:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232778.403774; Fri, 26 Nov 2021 13:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawM-00036t-Ta; Fri, 26 Nov 2021 13:06:58 +0000
Received: by outflank-mailman (input) for mailman id 232778;
 Fri, 26 Nov 2021 13:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauc-0003W9-AW
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6cca6d-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:07 +0100 (CET)
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
X-Inumbo-ID: 7a6cca6d-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6W30pS4w00/O4PLw081oztrCfwf9uX+zMhuEsVt7eLg=;
  b=ee/XFbG1mvg+emKveS9yXuLkooUgH21db1aZLSXHazUkOT0p2NkHoKbw
   WPz5byUcX+pAv+mTPAwgNT17lHGYbo3KcKHjZgbARaytMIagyHoZ7PoQr
   qqhX3gSUYH9MvzRraas1YP0HnZVBMzLJNR+S3ybA0GxrMwzznX+OAJViR
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pcZI6XLvAbxV6CboBlEV7r7xBC7uET7Hqr/1oBRAM1aetUZt3tRmnVSE6F+YblWt4mlLnsNJOL
 1EAAyOYCRBnoO7jghjQeZNzv9XOxLvKKh+ldnVOD/SShfdnBWSlt4C43LyVZmOzYMDk9m7cj94
 YMRABTKhH5vjL2VXZKXFXhaJ/puMMU7nosm/UCmyPA/zx6+zax6tMW7S7Gd0qTYF4fAWopxFWy
 t8mWM8y8vrFdCrZpK8ltQuYHQyHYQCYBIjFBcL43mguM8oGVPCN0KchSP1Kw2wjBo/ZARqOAFR
 sVHZ83qatcwDTF6mUOoa4VlC
X-SBRS: 5.1
X-MesageID: 58695956
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ep98O6JTUqNIKmJLFE+RQZIlxSXFcZb7ZxGr2PjKsXjdYENS12ZWy
 GoeUTvTM/mDMDSjfd1/bt6+8BwH7JCGx4c1HFBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2FuvYyk
 4VymaDzUCB0DuqSxe0CSiZXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpg2JETTKuAD
 yYfQR12aybwJF4MAG1JWIM7n92XwUfUQjIN/Tp5ooJoujOOnWSdyoPFEvDYZ9iLTsV9hVuDq
 yTN+GGRKh0UPdOQyD2B81q3m/TC2yj8Xeo6FrKi8eVxqEaO3WFVAxoTPXO5vP24h0iWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRwtJWFRHTb8a2bxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5vNYj21Y3KNQ2z2
 hfXnG9g2rwMlPEEgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlzXTVGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WysNu/e/31PwNMebhr5d7exxlsAM8vy/C5jpgiJmOMQZSeN+1HgGibSs927silMwtqo0J
 I2Wd82hZV5DV/84nGTrGLZBj+Nwrszb+Y81bcugp/hA+eDDDEN5tJ9faAfeBgzHxP/sTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBgba0aX/d/L7bZSiI/QTlJI6aIndsJJtw094wIx7yg1
 izsBSdlJK/X2CSvxfOiMSs4NtsCnP9X8BoGAMDbFQryhiV4P9/wtPx3mlleVeBPydGPBMVcF
 5EtE/hsyNwUItge0zhCP5T7sqJ4cxGn2VCHMya/OWBtdJ98XQ3ZvNTje1K3piUJCyO2s+o4o
 qGhiVyHEcZSGVw6AZaEcu+rwnOwoWMZxLB4UXzXL4QBY07r6oVrdXD816dlP8EWJBzf7TKGz
 ALKUwwArOzArtZtotnEjKyJtamzFO56EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64clSuRl16Mz4dfrtoR29AU8ESWZdUmvB5NhPmKCgZtFuJpSy+ILogCxQ
 E+OpIVXYO3bJMP/HVcNDwM5deDfh+oMkzzf4PlpckX34Ch7oOiOXUlIZkTejSVcKP1+MZ8/w
 Pdns8kTslTthh0vO9eAryZV62XTcSBQD/R57skXUN3xlw4m6lBeepiNWCb57aaGZ8hILkR3c
 CSfg7DPhugEy0fPG5bp+aMhAQaJaUwyhS13
IronPort-HdrOrdr: A9a23:HP+c8KAaAU27XJHlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58695956"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 16/65] xen/sched: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:33:57 +0000
Message-ID: <20211126123446.32324-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/arinc653.c | 20 +++++++--------
 xen/common/sched/core.c     |  8 +++---
 xen/common/sched/credit.c   | 49 ++++++++++++++++++------------------
 xen/common/sched/credit2.c  | 51 +++++++++++++++++++-------------------
 xen/common/sched/null.c     | 60 +++++++++++++++++++++++----------------------
 xen/common/sched/rt.c       | 42 +++++++++++++++----------------
 6 files changed, 115 insertions(+), 115 deletions(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 542191822192..a82c0d7314a1 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -343,7 +343,7 @@ arinc653_sched_get(
  *                  <li> !0 = error
  *                  </ul>
  */
-static int
+static int cf_check
 a653sched_init(struct scheduler *ops)
 {
     a653sched_priv_t *prv;
@@ -366,7 +366,7 @@ a653sched_init(struct scheduler *ops)
  *
  * @param ops       Pointer to this instance of the scheduler structure
  */
-static void
+static void cf_check
 a653sched_deinit(struct scheduler *ops)
 {
     xfree(SCHED_PRIV(ops));
@@ -381,7 +381,7 @@ a653sched_deinit(struct scheduler *ops)
  *
  * @return          Pointer to the allocated data
  */
-static void *
+static void *cf_check
 a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
                       void *dd)
 {
@@ -442,7 +442,7 @@ a653sched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
  *
  * @param ops       Pointer to this instance of the scheduler structure
  */
-static void
+static void cf_check
 a653sched_free_udata(const struct scheduler *ops, void *priv)
 {
     a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
@@ -469,7 +469,7 @@ a653sched_free_udata(const struct scheduler *ops, void *priv)
  * @param ops       Pointer to this instance of the scheduler structure
  * @param unit      Pointer to struct sched_unit
  */
-static void
+static void cf_check
 a653sched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
 {
     if ( AUNIT(unit) != NULL )
@@ -489,7 +489,7 @@ a653sched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
  * @param ops       Pointer to this instance of the scheduler structure
  * @param unit      Pointer to struct sched_unit
  */
-static void
+static void cf_check
 a653sched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
 {
     if ( AUNIT(unit) != NULL )
@@ -505,7 +505,7 @@ a653sched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
  * @param ops       Pointer to this instance of the scheduler structure
  * @param now       Current time
  */
-static void
+static void cf_check
 a653sched_do_schedule(
     const struct scheduler *ops,
     struct sched_unit *prev,
@@ -604,7 +604,7 @@ a653sched_do_schedule(
  *
  * @return          Scheduler resource to run on
  */
-static struct sched_resource *
+static struct sched_resource *cf_check
 a653sched_pick_resource(const struct scheduler *ops,
                         const struct sched_unit *unit)
 {
@@ -634,7 +634,7 @@ a653sched_pick_resource(const struct scheduler *ops,
  * @param pdata     scheduler specific PCPU data (we don't have any)
  * @param vdata     scheduler specific UNIT data of the idle unit
  */
-static spinlock_t *
+static spinlock_t *cf_check
 a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
                   void *pdata, void *vdata)
 {
@@ -656,7 +656,7 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
  * @param ops       Pointer to this instance of the scheduler structure
  * @param sc        Pointer to the scheduler operation specified by Domain 0
  */
-static int
+static int cf_check
 a653sched_adjust_global(const struct scheduler *ops,
                         struct xen_sysctl_scheduler_op *sc)
 {
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index b1836b591c0a..9e09d9befa23 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -98,13 +98,13 @@ static bool scheduler_active;
 static void sched_set_affinity(
     struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
 
-static struct sched_resource *
+static struct sched_resource *cf_check
 sched_idle_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
     return unit->res;
 }
 
-static void *
+static void *cf_check
 sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
                        void *dd)
 {
@@ -112,12 +112,12 @@ sched_idle_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
     return ZERO_BLOCK_PTR;
 }
 
-static void
+static void cf_check
 sched_idle_free_udata(const struct scheduler *ops, void *priv)
 {
 }
 
-static void sched_idle_schedule(
+static void cf_check sched_idle_schedule(
     const struct scheduler *ops, struct sched_unit *unit, s_time_t now,
     bool tasklet_work_scheduled)
 {
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 5635271f6fea..4d3bd8cba6fc 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -507,7 +507,7 @@ static inline void __runq_tickle(const struct csched_unit *new)
         SCHED_STAT_CRANK(tickled_no_cpu);
 }
 
-static void
+static void cf_check
 csched_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
 {
     const struct csched_private *prv = CSCHED_PRIV(ops);
@@ -524,7 +524,7 @@ csched_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     xfree(pcpu);
 }
 
-static void
+static void cf_check
 csched_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
 {
     struct csched_private *prv = CSCHED_PRIV(ops);
@@ -566,7 +566,7 @@ csched_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static void *
+static void *cf_check
 csched_alloc_pdata(const struct scheduler *ops, int cpu)
 {
     struct csched_pcpu *spc;
@@ -615,7 +615,7 @@ init_pdata(struct csched_private *prv, struct csched_pcpu *spc, int cpu)
 }
 
 /* Change the scheduler of cpu to us (Credit). */
-static spinlock_t *
+static spinlock_t *cf_check
 csched_switch_sched(struct scheduler *new_ops, unsigned int cpu,
                     void *pdata, void *vdata)
 {
@@ -848,7 +848,7 @@ _csched_cpu_pick(const struct scheduler *ops, const struct sched_unit *unit,
     return cpu;
 }
 
-static struct sched_resource *
+static struct sched_resource *cf_check
 csched_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
     struct csched_unit *svc = CSCHED_UNIT(unit);
@@ -985,9 +985,8 @@ csched_unit_acct(struct csched_private *prv, unsigned int cpu)
     }
 }
 
-static void *
-csched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
-                   void *dd)
+static void *cf_check csched_alloc_udata(
+    const struct scheduler *ops, struct sched_unit *unit, void *dd)
 {
     struct csched_unit *svc;
 
@@ -1007,7 +1006,7 @@ csched_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
     return svc;
 }
 
-static void
+static void cf_check
 csched_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched_unit *svc = unit->priv;
@@ -1032,7 +1031,7 @@ csched_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
     SCHED_STAT_CRANK(unit_insert);
 }
 
-static void
+static void cf_check
 csched_free_udata(const struct scheduler *ops, void *priv)
 {
     struct csched_unit *svc = priv;
@@ -1042,7 +1041,7 @@ csched_free_udata(const struct scheduler *ops, void *priv)
     xfree(svc);
 }
 
-static void
+static void cf_check
 csched_unit_remove(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched_private *prv = CSCHED_PRIV(ops);
@@ -1069,7 +1068,7 @@ csched_unit_remove(const struct scheduler *ops, struct sched_unit *unit)
     BUG_ON( sdom == NULL );
 }
 
-static void
+static void cf_check
 csched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched_unit * const svc = CSCHED_UNIT(unit);
@@ -1094,7 +1093,7 @@ csched_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
         runq_remove(svc);
 }
 
-static void
+static void cf_check
 csched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched_unit * const svc = CSCHED_UNIT(unit);
@@ -1156,7 +1155,7 @@ csched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
     __runq_tickle(svc);
 }
 
-static void
+static void cf_check
 csched_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched_unit * const svc = CSCHED_UNIT(unit);
@@ -1165,7 +1164,7 @@ csched_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
     set_bit(CSCHED_FLAG_UNIT_YIELD, &svc->flags);
 }
 
-static int
+static int cf_check
 csched_dom_cntl(
     const struct scheduler *ops,
     struct domain *d,
@@ -1210,7 +1209,7 @@ csched_dom_cntl(
     return rc;
 }
 
-static void
+static void cf_check
 csched_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
                 const cpumask_t *hard, const cpumask_t *soft)
 {
@@ -1238,7 +1237,7 @@ __csched_set_tslice(struct csched_private *prv, unsigned int timeslice_ms)
     prv->credit = prv->credits_per_tslice * prv->ncpus;
 }
 
-static int
+static int cf_check
 csched_sys_cntl(const struct scheduler *ops,
                         struct xen_sysctl_scheduler_op *sc)
 {
@@ -1281,7 +1280,7 @@ csched_sys_cntl(const struct scheduler *ops,
     return rc;
 }
 
-static void *
+static void *cf_check
 csched_alloc_domdata(const struct scheduler *ops, struct domain *dom)
 {
     struct csched_dom *sdom;
@@ -1299,7 +1298,7 @@ csched_alloc_domdata(const struct scheduler *ops, struct domain *dom)
     return sdom;
 }
 
-static void
+static void cf_check
 csched_free_domdata(const struct scheduler *ops, void *data)
 {
     xfree(data);
@@ -1809,7 +1808,7 @@ csched_load_balance(struct csched_private *prv, int cpu,
  * This function is in the critical path. It is designed to be simple and
  * fast for the common case.
  */
-static void csched_schedule(
+static void cf_check csched_schedule(
     const struct scheduler *ops, struct sched_unit *unit, s_time_t now,
     bool tasklet_work_scheduled)
 {
@@ -2026,7 +2025,7 @@ csched_dump_unit(const struct csched_unit *svc)
     printk("\n");
 }
 
-static void
+static void cf_check
 csched_dump_pcpu(const struct scheduler *ops, int cpu)
 {
     const struct list_head *runq;
@@ -2079,7 +2078,7 @@ csched_dump_pcpu(const struct scheduler *ops, int cpu)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static void
+static void cf_check
 csched_dump(const struct scheduler *ops)
 {
     struct list_head *iter_sdom, *iter_svc;
@@ -2143,7 +2142,7 @@ csched_dump(const struct scheduler *ops)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static int __init
+static int __init cf_check
 csched_global_init(void)
 {
     if ( sched_credit_tslice_ms > XEN_SYSCTL_CSCHED_TSLICE_MAX ||
@@ -2173,7 +2172,7 @@ csched_global_init(void)
     return 0;
 }
 
-static int
+static int cf_check
 csched_init(struct scheduler *ops)
 {
     struct csched_private *prv;
@@ -2215,7 +2214,7 @@ csched_init(struct scheduler *ops)
     return 0;
 }
 
-static void
+static void cf_check
 csched_deinit(struct scheduler *ops)
 {
     struct csched_private *prv;
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index d96e2749ddfb..0e3f89e5378e 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -2164,7 +2164,7 @@ csched2_unit_check(const struct sched_unit *unit)
 #define CSCHED2_UNIT_CHECK(unit)
 #endif
 
-static void *
+static void *cf_check
 csched2_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
                     void *dd)
 {
@@ -2208,7 +2208,7 @@ csched2_alloc_udata(const struct scheduler *ops, struct sched_unit *unit,
     return svc;
 }
 
-static void
+static void cf_check
 csched2_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
@@ -2230,7 +2230,7 @@ csched2_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
         __clear_bit(__CSFLAG_delayed_runq_add, &svc->flags);
 }
 
-static void
+static void cf_check
 csched2_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
@@ -2285,7 +2285,7 @@ csched2_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
     return;
 }
 
-static void
+static void cf_check
 csched2_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
@@ -2293,7 +2293,7 @@ csched2_unit_yield(const struct scheduler *ops, struct sched_unit *unit)
     __set_bit(__CSFLAG_unit_yield, &svc->flags);
 }
 
-static void
+static void cf_check
 csched2_context_saved(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
@@ -2335,7 +2335,7 @@ csched2_context_saved(const struct scheduler *ops, struct sched_unit *unit)
 }
 
 #define MAX_LOAD (STIME_MAX)
-static struct sched_resource *
+static struct sched_resource *cf_check
 csched2_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
     struct csched2_private *prv = csched2_priv(ops);
@@ -2867,8 +2867,7 @@ static void balance_load(const struct scheduler *ops, int cpu, s_time_t now)
     return;
 }
 
-static void
-csched2_unit_migrate(
+static void cf_check csched2_unit_migrate(
     const struct scheduler *ops, struct sched_unit *unit, unsigned int new_cpu)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
@@ -2894,7 +2893,7 @@ csched2_unit_migrate(
         sched_set_res(unit, get_sched_res(new_cpu));
 }
 
-static int
+static int cf_check
 csched2_dom_cntl(
     const struct scheduler *ops,
     struct domain *d,
@@ -3100,7 +3099,7 @@ csched2_dom_cntl(
     return rc;
 }
 
-static void
+static void cf_check
 csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
                  const cpumask_t *hard, const cpumask_t *soft)
 {
@@ -3116,8 +3115,8 @@ csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
         __clear_bit(__CSFLAG_pinned, &svc->flags);
 }
 
-static int csched2_sys_cntl(const struct scheduler *ops,
-                            struct xen_sysctl_scheduler_op *sc)
+static int cf_check csched2_sys_cntl(
+    const struct scheduler *ops, struct xen_sysctl_scheduler_op *sc)
 {
     struct xen_sysctl_credit2_schedule *params = &sc->u.sched_credit2;
     struct csched2_private *prv = csched2_priv(ops);
@@ -3148,7 +3147,7 @@ static int csched2_sys_cntl(const struct scheduler *ops,
     return 0;
 }
 
-static void *
+static void *cf_check
 csched2_alloc_domdata(const struct scheduler *ops, struct domain *dom)
 {
     struct csched2_private *prv = csched2_priv(ops);
@@ -3180,7 +3179,7 @@ csched2_alloc_domdata(const struct scheduler *ops, struct domain *dom)
     return sdom;
 }
 
-static void
+static void cf_check
 csched2_free_domdata(const struct scheduler *ops, void *data)
 {
     struct csched2_dom *sdom = data;
@@ -3200,7 +3199,7 @@ csched2_free_domdata(const struct scheduler *ops, void *data)
     }
 }
 
-static void
+static void cf_check
 csched2_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
 {
     const struct csched2_unit *svc = unit->priv;
@@ -3231,7 +3230,7 @@ csched2_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
     CSCHED2_UNIT_CHECK(unit);
 }
 
-static void
+static void cf_check
 csched2_free_udata(const struct scheduler *ops, void *priv)
 {
     struct csched2_unit *svc = priv;
@@ -3239,7 +3238,7 @@ csched2_free_udata(const struct scheduler *ops, void *priv)
     xfree(svc);
 }
 
-static void
+static void cf_check
 csched2_unit_remove(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct csched2_unit * const svc = csched2_unit(unit);
@@ -3558,7 +3557,7 @@ runq_candidate(struct csched2_runqueue_data *rqd,
  * This function is in the critical path. It is designed to be simple and
  * fast for the common case.
  */
-static void csched2_schedule(
+static void cf_check csched2_schedule(
     const struct scheduler *ops, struct sched_unit *currunit, s_time_t now,
     bool tasklet_work_scheduled)
 {
@@ -3790,7 +3789,7 @@ dump_pcpu(const struct scheduler *ops, int cpu)
     }
 }
 
-static void
+static void cf_check
 csched2_dump(const struct scheduler *ops)
 {
     struct list_head *iter_sdom;
@@ -3898,7 +3897,7 @@ csched2_dump(const struct scheduler *ops)
     read_unlock_irqrestore(&prv->lock, flags);
 }
 
-static void *
+static void *cf_check
 csched2_alloc_pdata(const struct scheduler *ops, int cpu)
 {
     struct csched2_pcpu *spc;
@@ -3988,7 +3987,7 @@ init_pdata(struct csched2_private *prv, struct csched2_pcpu *spc,
 }
 
 /* Change the scheduler of cpu to us (Credit2). */
-static spinlock_t *
+static spinlock_t *cf_check
 csched2_switch_sched(struct scheduler *new_ops, unsigned int cpu,
                      void *pdata, void *vdata)
 {
@@ -4026,7 +4025,7 @@ csched2_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &rqd->lock;
 }
 
-static void
+static void cf_check
 csched2_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
 {
     unsigned long flags;
@@ -4086,7 +4085,7 @@ csched2_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     return;
 }
 
-static void
+static void cf_check
 csched2_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
 {
     struct csched2_private *prv = csched2_priv(ops);
@@ -4115,7 +4114,7 @@ csched2_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     xfree(pcpu);
 }
 
-static int __init
+static int __init cf_check
 csched2_global_init(void)
 {
     if ( opt_load_precision_shift < LOADAVG_PRECISION_SHIFT_MIN )
@@ -4142,7 +4141,7 @@ csched2_global_init(void)
     return 0;
 }
 
-static int
+static int cf_check
 csched2_init(struct scheduler *ops)
 {
     struct csched2_private *prv;
@@ -4190,7 +4189,7 @@ csched2_init(struct scheduler *ops)
     return 0;
 }
 
-static void
+static void cf_check
 csched2_deinit(struct scheduler *ops)
 {
     struct csched2_private *prv;
diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 82d5d1baab85..65a0a6c5312d 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -130,7 +130,7 @@ static inline bool unit_check_affinity(struct sched_unit *unit,
     return cpumask_test_cpu(cpu, cpumask_scratch_cpu(cpu));
 }
 
-static int null_init(struct scheduler *ops)
+static int cf_check null_init(struct scheduler *ops)
 {
     struct null_private *prv;
 
@@ -152,7 +152,7 @@ static int null_init(struct scheduler *ops)
     return 0;
 }
 
-static void null_deinit(struct scheduler *ops)
+static void cf_check null_deinit(struct scheduler *ops)
 {
     xfree(ops->sched_data);
     ops->sched_data = NULL;
@@ -166,7 +166,8 @@ static void init_pdata(struct null_private *prv, struct null_pcpu *npc,
     npc->unit = NULL;
 }
 
-static void null_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
+static void cf_check null_deinit_pdata(
+    const struct scheduler *ops, void *pcpu, int cpu)
 {
     struct null_private *prv = null_priv(ops);
     struct null_pcpu *npc = pcpu;
@@ -177,7 +178,7 @@ static void null_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     npc->unit = NULL;
 }
 
-static void *null_alloc_pdata(const struct scheduler *ops, int cpu)
+static void *cf_check null_alloc_pdata(const struct scheduler *ops, int cpu)
 {
     struct null_pcpu *npc;
 
@@ -188,13 +189,14 @@ static void *null_alloc_pdata(const struct scheduler *ops, int cpu)
     return npc;
 }
 
-static void null_free_pdata(const struct scheduler *ops, void *pcpu, int cpu)
+static void cf_check null_free_pdata(
+    const struct scheduler *ops, void *pcpu, int cpu)
 {
     xfree(pcpu);
 }
 
-static void *null_alloc_udata(const struct scheduler *ops,
-                              struct sched_unit *unit, void *dd)
+static void *cf_check null_alloc_udata(
+    const struct scheduler *ops, struct sched_unit *unit, void *dd)
 {
     struct null_unit *nvc;
 
@@ -210,15 +212,15 @@ static void *null_alloc_udata(const struct scheduler *ops,
     return nvc;
 }
 
-static void null_free_udata(const struct scheduler *ops, void *priv)
+static void cf_check null_free_udata(const struct scheduler *ops, void *priv)
 {
     struct null_unit *nvc = priv;
 
     xfree(nvc);
 }
 
-static void * null_alloc_domdata(const struct scheduler *ops,
-                                 struct domain *d)
+static void *cf_check null_alloc_domdata(
+    const struct scheduler *ops, struct domain *d)
 {
     struct null_private *prv = null_priv(ops);
     struct null_dom *ndom;
@@ -237,7 +239,7 @@ static void * null_alloc_domdata(const struct scheduler *ops,
     return ndom;
 }
 
-static void null_free_domdata(const struct scheduler *ops, void *data)
+static void cf_check null_free_domdata(const struct scheduler *ops, void *data)
 {
     struct null_dom *ndom = data;
     struct null_private *prv = null_priv(ops);
@@ -426,9 +428,8 @@ static bool unit_deassign(struct null_private *prv, const struct sched_unit *uni
 }
 
 /* Change the scheduler of cpu to us (null). */
-static spinlock_t *null_switch_sched(struct scheduler *new_ops,
-                                     unsigned int cpu,
-                                     void *pdata, void *vdata)
+static spinlock_t *cf_check null_switch_sched(
+    struct scheduler *new_ops, unsigned int cpu, void *pdata, void *vdata)
 {
     struct sched_resource *sr = get_sched_res(cpu);
     struct null_private *prv = null_priv(new_ops);
@@ -450,8 +451,8 @@ static spinlock_t *null_switch_sched(struct scheduler *new_ops,
     return &sr->_lock;
 }
 
-static void null_unit_insert(const struct scheduler *ops,
-                             struct sched_unit *unit)
+static void cf_check null_unit_insert(
+    const struct scheduler *ops, struct sched_unit *unit)
 {
     struct null_private *prv = null_priv(ops);
     struct null_unit *nvc = null_unit(unit);
@@ -516,8 +517,8 @@ static void null_unit_insert(const struct scheduler *ops,
     SCHED_STAT_CRANK(unit_insert);
 }
 
-static void null_unit_remove(const struct scheduler *ops,
-                             struct sched_unit *unit)
+static void cf_check null_unit_remove(
+    const struct scheduler *ops, struct sched_unit *unit)
 {
     struct null_private *prv = null_priv(ops);
     struct null_unit *nvc = null_unit(unit);
@@ -556,8 +557,8 @@ static void null_unit_remove(const struct scheduler *ops,
     SCHED_STAT_CRANK(unit_remove);
 }
 
-static void null_unit_wake(const struct scheduler *ops,
-                           struct sched_unit *unit)
+static void cf_check null_unit_wake(
+    const struct scheduler *ops, struct sched_unit *unit)
 {
     struct null_private *prv = null_priv(ops);
     struct null_unit *nvc = null_unit(unit);
@@ -632,8 +633,8 @@ static void null_unit_wake(const struct scheduler *ops,
         cpumask_raise_softirq(cpumask_scratch_cpu(cpu), SCHEDULE_SOFTIRQ);
 }
 
-static void null_unit_sleep(const struct scheduler *ops,
-                            struct sched_unit *unit)
+static void cf_check null_unit_sleep(
+    const struct scheduler *ops, struct sched_unit *unit)
 {
     struct null_private *prv = null_priv(ops);
     unsigned int cpu = sched_unit_master(unit);
@@ -667,15 +668,15 @@ static void null_unit_sleep(const struct scheduler *ops,
     SCHED_STAT_CRANK(unit_sleep);
 }
 
-static struct sched_resource *
+static struct sched_resource *cf_check
 null_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
     ASSERT(!is_idle_unit(unit));
     return pick_res(null_priv(ops), unit);
 }
 
-static void null_unit_migrate(const struct scheduler *ops,
-                              struct sched_unit *unit, unsigned int new_cpu)
+static void cf_check null_unit_migrate(
+    const struct scheduler *ops, struct sched_unit *unit, unsigned int new_cpu)
 {
     struct null_private *prv = null_priv(ops);
     struct null_unit *nvc = null_unit(unit);
@@ -801,8 +802,9 @@ static inline void null_unit_check(struct sched_unit *unit)
  *  - the unit assigned to the pCPU, if there's one and it can run;
  *  - the idle unit, otherwise.
  */
-static void null_schedule(const struct scheduler *ops, struct sched_unit *prev,
-                          s_time_t now, bool tasklet_work_scheduled)
+static void cf_check null_schedule(
+    const struct scheduler *ops, struct sched_unit *prev, s_time_t now,
+    bool tasklet_work_scheduled)
 {
     unsigned int bs;
     const unsigned int cur_cpu = smp_processor_id();
@@ -939,7 +941,7 @@ static inline void dump_unit(const struct null_private *prv,
                                 sched_unit_master(nvc->unit) : -1);
 }
 
-static void null_dump_pcpu(const struct scheduler *ops, int cpu)
+static void cf_check null_dump_pcpu(const struct scheduler *ops, int cpu)
 {
     struct null_private *prv = null_priv(ops);
     const struct null_pcpu *npc = get_sched_res(cpu)->sched_priv;
@@ -968,7 +970,7 @@ static void null_dump_pcpu(const struct scheduler *ops, int cpu)
     pcpu_schedule_unlock_irqrestore(lock, flags, cpu);
 }
 
-static void null_dump(const struct scheduler *ops)
+static void cf_check null_dump(const struct scheduler *ops)
 {
     struct null_private *prv = null_priv(ops);
     struct list_head *iter;
diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 5ea6f01f263c..d6de25531b3c 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -269,13 +269,13 @@ unit_on_q(const struct rt_unit *svc)
    return !list_empty(&svc->q_elem);
 }
 
-static struct rt_unit *
+static struct rt_unit *cf_check
 q_elem(struct list_head *elem)
 {
     return list_entry(elem, struct rt_unit, q_elem);
 }
 
-static struct rt_unit *
+static struct rt_unit *cf_check
 replq_elem(struct list_head *elem)
 {
     return list_entry(elem, struct rt_unit, replq_elem);
@@ -348,7 +348,7 @@ rt_dump_unit(const struct scheduler *ops, const struct rt_unit *svc)
             svc->flags, CPUMASK_PR(mask));
 }
 
-static void
+static void cf_check
 rt_dump_pcpu(const struct scheduler *ops, int cpu)
 {
     struct rt_private *prv = rt_priv(ops);
@@ -366,7 +366,7 @@ rt_dump_pcpu(const struct scheduler *ops, int cpu)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static void
+static void cf_check
 rt_dump(const struct scheduler *ops)
 {
     struct list_head *runq, *depletedq, *replq, *iter;
@@ -636,7 +636,7 @@ replq_reinsert(const struct scheduler *ops, struct rt_unit *svc)
  * Valid resource of an unit is intesection of unit's affinity
  * and available resources
  */
-static struct sched_resource *
+static struct sched_resource *cf_check
 rt_res_pick_locked(const struct sched_unit *unit, unsigned int locked_cpu)
 {
     cpumask_t *cpus = cpumask_scratch_cpu(locked_cpu);
@@ -659,7 +659,7 @@ rt_res_pick_locked(const struct sched_unit *unit, unsigned int locked_cpu)
  * Valid resource of an unit is intesection of unit's affinity
  * and available resources
  */
-static struct sched_resource *
+static struct sched_resource *cf_check
 rt_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 {
     struct sched_resource *res;
@@ -672,7 +672,7 @@ rt_res_pick(const struct scheduler *ops, const struct sched_unit *unit)
 /*
  * Init/Free related code
  */
-static int
+static int cf_check
 rt_init(struct scheduler *ops)
 {
     int rc = -ENOMEM;
@@ -701,7 +701,7 @@ rt_init(struct scheduler *ops)
     return rc;
 }
 
-static void
+static void cf_check
 rt_deinit(struct scheduler *ops)
 {
     struct rt_private *prv = rt_priv(ops);
@@ -714,7 +714,7 @@ rt_deinit(struct scheduler *ops)
 }
 
 /* Change the scheduler of cpu to us (RTDS). */
-static spinlock_t *
+static spinlock_t *cf_check
 rt_switch_sched(struct scheduler *new_ops, unsigned int cpu,
                 void *pdata, void *vdata)
 {
@@ -750,7 +750,7 @@ rt_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &prv->lock;
 }
 
-static void
+static void cf_check
 rt_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
 {
     unsigned long flags;
@@ -782,7 +782,7 @@ rt_deinit_pdata(const struct scheduler *ops, void *pcpu, int cpu)
     spin_unlock_irqrestore(&prv->lock, flags);
 }
 
-static void *
+static void *cf_check
 rt_alloc_domdata(const struct scheduler *ops, struct domain *dom)
 {
     unsigned long flags;
@@ -804,7 +804,7 @@ rt_alloc_domdata(const struct scheduler *ops, struct domain *dom)
     return sdom;
 }
 
-static void
+static void cf_check
 rt_free_domdata(const struct scheduler *ops, void *data)
 {
     struct rt_dom *sdom = data;
@@ -822,7 +822,7 @@ rt_free_domdata(const struct scheduler *ops, void *data)
     }
 }
 
-static void *
+static void * cf_check
 rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
 {
     struct rt_unit *svc;
@@ -850,7 +850,7 @@ rt_alloc_udata(const struct scheduler *ops, struct sched_unit *unit, void *dd)
     return svc;
 }
 
-static void
+static void cf_check
 rt_free_udata(const struct scheduler *ops, void *priv)
 {
     struct rt_unit *svc = priv;
@@ -865,7 +865,7 @@ rt_free_udata(const struct scheduler *ops, void *priv)
  * It inserts units of moving domain to the scheduler's RunQ in
  * dest. cpupool.
  */
-static void
+static void cf_check
 rt_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct rt_unit *svc = rt_unit(unit);
@@ -901,7 +901,7 @@ rt_unit_insert(const struct scheduler *ops, struct sched_unit *unit)
 /*
  * Remove rt_unit svc from the old scheduler in source cpupool.
  */
-static void
+static void cf_check
 rt_unit_remove(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct rt_unit * const svc = rt_unit(unit);
@@ -1042,7 +1042,7 @@ runq_pick(const struct scheduler *ops, const cpumask_t *mask, unsigned int cpu)
  * schedule function for rt scheduler.
  * The lock is already grabbed in schedule.c, no need to lock here
  */
-static void
+static void cf_check
 rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
             s_time_t now, bool tasklet_work_scheduled)
 {
@@ -1129,7 +1129,7 @@ rt_schedule(const struct scheduler *ops, struct sched_unit *currunit,
  * Remove UNIT from RunQ
  * The lock is already grabbed in schedule.c, no need to lock here
  */
-static void
+static void cf_check
 rt_unit_sleep(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct rt_unit * const svc = rt_unit(unit);
@@ -1244,7 +1244,7 @@ runq_tickle(const struct scheduler *ops, const struct rt_unit *new)
  * The lock is already grabbed in schedule.c, no need to lock here
  * TODO: what if these two units belongs to the same domain?
  */
-static void
+static void cf_check
 rt_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct rt_unit * const svc = rt_unit(unit);
@@ -1314,7 +1314,7 @@ rt_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
  * scurr has finished context switch, insert it back to the RunQ,
  * and then pick the highest priority unit from runq to run
  */
-static void
+static void cf_check
 rt_context_saved(const struct scheduler *ops, struct sched_unit *unit)
 {
     struct rt_unit *svc = rt_unit(unit);
@@ -1341,7 +1341,7 @@ rt_context_saved(const struct scheduler *ops, struct sched_unit *unit)
 /*
  * set/get each unit info of each domain
  */
-static int
+static int cf_check
 rt_dom_cntl(
     const struct scheduler *ops,
     struct domain *d,
-- 
2.11.0



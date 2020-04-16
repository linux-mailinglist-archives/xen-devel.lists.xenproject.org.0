Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89F1ABB50
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 10:34:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOzyC-0007RL-Fo; Thu, 16 Apr 2020 08:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wvvh=6A=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jOzyA-0007RG-EN
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:33:58 +0000
X-Inumbo-ID: 029ead9c-7fbd-11ea-8b65-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 029ead9c-7fbd-11ea-8b65-12813bfff9fa;
 Thu, 16 Apr 2020 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587026037;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=NgXOvquez9U/cttLx9tqkxe4NTlWEYntfETsT8qIthM=;
 b=YroKZK1GiHIPkdz9zNq6WdqKdZzvKWCGXg9zMBAKSVbw1rffsmG1atEs
 96nzUmoBLjCaw0sQnngC0XgoUIp3Pn65Db8wyxjOjjxA3N9VMIDqeyWf2
 9WB8T6CfqBS7TIrMRh9DzbNTyWxW5klkWrGcR35kXPB42mR36p1qckvSc o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u2M5NzuNL1QYGylOCtwnH8eWYCiSA4I8BdR2hGXE8UawawyirMNLVcgCwgCYEij9X4ENyh/7mT
 YQVo0aq4bUOpV+nfZ9Zb6MZS4wmvurkzF0hw9TYoueR6C9enRLaBQVwybobd9jE6ockvyve5PU
 T3tMcTW7iZ/tcgj4kCgR8+EdwgJOZL58eDP55EbKZpUw+4upqDhfy4Q4Y8cfpYVvqzbGH4UYez
 cikYAnCSvtcHpRYq39BvQwjwjbbXePPjm/IZ+UdqZ4t7fw3Xp48E3IzwX3Jv6Wpes5DNynLwtE
 Kc8=
X-SBRS: 2.7
X-MesageID: 15778273
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,390,1580792400"; d="scan'208";a="15778273"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] sched: print information about scheduler granularity
Date: Thu, 16 Apr 2020 09:33:41 +0100
Message-ID: <20200416083341.21122-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Currently it might be not obvious which scheduling mode is being used
by the scheduler. Alleviate this by printing additional information
about the selected granularity. Messages now look like these:

1. boot
(XEN) [00089808f0ea7496] Using scheduler: SMP Credit Scheduler (credit) in core-scheduling mode

2. xl debug-keys r
(XEN) [   45.914314] Scheduler: SMP Credit Scheduler (credit) in 2-way core-scheduling mode

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/common/sched/core.c    | 10 ++++++++--
 xen/common/sched/cpupool.c | 30 +++++++++++++++++++++++++++++-
 xen/common/sched/private.h |  2 ++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d4a6489929..b1b09a159b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2883,6 +2883,7 @@ void scheduler_enable(void)
 void __init scheduler_init(void)
 {
     struct domain *idle_domain;
+    char sched_gran[20];
     int i;
 
     scheduler_enable();
@@ -2937,7 +2938,9 @@ void __init scheduler_init(void)
         BUG();
     register_cpu_notifier(&cpu_schedule_nfb);
 
-    printk("Using scheduler: %s (%s)\n", ops.name, ops.opt_name);
+    printk("Using scheduler: %s (%s) in %s-scheduling mode\n",
+           ops.name, ops.opt_name,
+           sched_gran_str(sched_gran, sizeof(sched_gran)));
     if ( sched_init(&ops) )
         panic("scheduler returned error on init\n");
 
@@ -3267,6 +3270,7 @@ void schedule_dump(struct cpupool *c)
     unsigned int      i, j;
     struct scheduler *sched;
     cpumask_t        *cpus;
+    char              sched_gran[20];
 
     /* Locking, if necessary, must be handled withing each scheduler */
 
@@ -3276,7 +3280,9 @@ void schedule_dump(struct cpupool *c)
     {
         sched = c->sched;
         cpus = c->res_valid;
-        printk("Scheduler: %s (%s)\n", sched->name, sched->opt_name);
+        printk("Scheduler: %s (%s) in %s-scheduling mode\n",
+               sched->name, sched->opt_name,
+               sched_gran_str(sched_gran, sizeof(sched_gran)));
         sched_dump_settings(sched);
     }
     else
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index d40345b585..a37b97f4c2 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -38,7 +38,35 @@ static cpumask_t cpupool_locked_cpus;
 static DEFINE_SPINLOCK(cpupool_lock);
 
 static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
-static unsigned int __read_mostly sched_granularity = 1;
+static unsigned int __read_mostly sched_granularity;
+
+char *sched_gran_str(char *str, size_t size)
+{
+    char *mode = "";
+
+    switch ( opt_sched_granularity )
+    {
+    case SCHED_GRAN_cpu:
+        mode = "cpu";
+        break;
+    case SCHED_GRAN_core:
+        mode = "core";
+        break;
+    case SCHED_GRAN_socket:
+        mode = "socket";
+        break;
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+    if ( sched_granularity )
+        snprintf(str, size, "%u-way %s", sched_granularity, mode);
+    else
+        snprintf(str, size, "%s", mode);
+
+    return str;
+}
 
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
 static int __init sched_select_granularity(const char *str)
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index 367811a12f..fd49f545cb 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -30,6 +30,8 @@ enum sched_gran {
     SCHED_GRAN_socket
 };
 
+char *sched_gran_str(char *str, size_t size);
+
 /*
  * In order to allow a scheduler to remap the lock->cpu mapping,
  * we have a per-cpu pointer, along with a pre-allocated set of
-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5FA2DFF7B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57505.100646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjL-0000a1-8I; Mon, 21 Dec 2020 18:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57505.100646; Mon, 21 Dec 2020 18:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjL-0000ZT-3X; Mon, 21 Dec 2020 18:16:23 +0000
Received: by outflank-mailman (input) for mailman id 57505;
 Mon, 21 Dec 2020 18:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krPjJ-0000Yt-4S
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:16:21 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 499db0c6-1c04-4f23-bcff-a7f45c660f51;
 Mon, 21 Dec 2020 18:16:19 +0000 (UTC)
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
X-Inumbo-ID: 499db0c6-1c04-4f23-bcff-a7f45c660f51
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608574578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B/5dAlAFWaIIj98Nfhx+GTd6ypQExw4vEU95/xCjDHg=;
  b=RptR4pbhuiWfugIcYa2CFotfNAbTHwPPzNr3Ie/BxtvtLbKjVoVH2Suc
   hGwytbJmlDCwvhwTH8PqZoL4VOWEcuCUbggU3j5T0icOVGs06Je5VkPEM
   1A1UT9Lf1LuzxkreIw60m1JM/fUUGcHD9MQnRLpgDLDA3+m5NIxyrsuiD
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: B2W5j/M1lFQ4AS9cDmR2qgWNTidmuOzn0n9z0yNDaw/6TLT//jKQLoaUzyjGxlQZX0ekB3tpRO
 QhE9YPWHljtcL3rJa6q43GOmj6C+EtPvZFNj5toDju/qNoArojSJ3JZLc0eapxNpVtF1Lg6AIc
 vHqUacirXXlhjWLDaRwXjiQFQFz7ckwCFUUuVWucuDvARBuLsf5qKrvZm6R8/W4wv7bx2/1BKJ
 VBuRPehHIlDgMFOILQXNBoQWXDJbaXFFouUz3l47EZg1HMQhZ5Gp1K5MG5KL6TsmeKN6jP+b7h
 nwc=
X-SBRS: 5.2
X-MesageID: 33707581
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,437,1599537600"; 
   d="scan'208";a="33707581"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/evtchn: Clean up teardown handling
Date: Mon, 21 Dec 2020 18:14:46 +0000
Message-ID: <20201221181446.7791-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201221181446.7791-1-andrew.cooper3@citrix.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

First of all, rename the evtchn APIs:
 * evtchn_destroy       => evtchn_teardown
 * evtchn_destroy_final => evtchn_destroy

Move both calls into appropriate positions in domain_teardown() and
_domain_destroy(), which avoids having different cleanup logic depending on
the the cause of the cleanup.

In particular, this avoids evtchn_teardown() (previously named
evtchn_destroy()) being called redundantly thousands of times on a typical
XEN_DOMCTL_destroydomain hypercall.

No net change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

RFC.  While testing this, I observed this, after faking up an -ENOMEM in
dom0's construction:

  (XEN) [2020-12-21 16:31:20] NX (Execute Disable) protection active
  (XEN) [2020-12-21 16:33:04]
  (XEN) [2020-12-21 16:33:04] ****************************************
  (XEN) [2020-12-21 16:33:04] Panic on CPU 0:
  (XEN) [2020-12-21 16:33:04] Error creating domain 0
  (XEN) [2020-12-21 16:33:04] ****************************************

XSA-344 appears to have added nearly 2 minutes of wallclock time into the
domain_create() error path, which isn't ok.

Considering that event channels haven't even been initialised in this
particular scenario, it ought to take ~0 time.  Even if event channels have
been initalised, none can be active as the domain isn't visible to the system.
---
 xen/common/domain.c        | 17 ++++++++---------
 xen/common/event_channel.c |  8 ++++----
 xen/include/xen/sched.h    |  4 ++--
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index ef1987335b..701747b9d9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -284,6 +284,8 @@ custom_param("extra_guest_irqs", parse_extra_guest_irqs);
  */
 static int domain_teardown(struct domain *d)
 {
+    int rc;
+
     BUG_ON(!d->is_dying);
 
     /*
@@ -313,6 +315,10 @@ static int domain_teardown(struct domain *d)
         };
 
     case 0:
+        rc = evtchn_teardown(d);
+        if ( rc )
+            return rc;
+
     PROGRESS(done):
         break;
 
@@ -335,6 +341,8 @@ static void _domain_destroy(struct domain *d)
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
 
+    evtchn_destroy(d);
+
     xfree(d->pbuf);
 
     argo_destroy(d);
@@ -598,11 +606,7 @@ struct domain *domain_create(domid_t domid,
     if ( init_status & INIT_gnttab )
         grant_table_destroy(d);
     if ( init_status & INIT_evtchn )
-    {
-        evtchn_destroy(d);
-        evtchn_destroy_final(d);
         radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
-    }
     if ( init_status & INIT_watchdog )
         watchdog_domain_destroy(d);
 
@@ -792,9 +796,6 @@ int domain_kill(struct domain *d)
         rc = domain_teardown(d);
         if ( rc )
             break;
-        rc = evtchn_destroy(d);
-        if ( rc )
-            break;
         rc = domain_relinquish_resources(d);
         if ( rc != 0 )
             break;
@@ -987,8 +988,6 @@ static void complete_domain_destroy(struct rcu_head *head)
     if ( d->target != NULL )
         put_domain(d->target);
 
-    evtchn_destroy_final(d);
-
     radix_tree_destroy(&d->pirq_tree, free_pirq_struct);
 
     xfree(d->vcpu);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 4a48094356..c1af54eed5 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1401,7 +1401,7 @@ void free_xen_event_channel(struct domain *d, int port)
     {
         /*
          * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
-         * with the spin_barrier() and BUG_ON() in evtchn_destroy().
+         * with the spin_barrier() and BUG_ON() in evtchn_teardown().
          */
         smp_rmb();
         BUG_ON(!d->is_dying);
@@ -1421,7 +1421,7 @@ void notify_via_xen_event_channel(struct domain *ld, int lport)
     {
         /*
          * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
-         * with the spin_barrier() and BUG_ON() in evtchn_destroy().
+         * with the spin_barrier() and BUG_ON() in evtchn_teardown().
          */
         smp_rmb();
         ASSERT(ld->is_dying);
@@ -1499,7 +1499,7 @@ int evtchn_init(struct domain *d, unsigned int max_port)
     return 0;
 }
 
-int evtchn_destroy(struct domain *d)
+int evtchn_teardown(struct domain *d)
 {
     unsigned int i;
 
@@ -1534,7 +1534,7 @@ int evtchn_destroy(struct domain *d)
 }
 
 
-void evtchn_destroy_final(struct domain *d)
+void evtchn_destroy(struct domain *d)
 {
     unsigned int i, j;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3f35c537b8..bb22eeca38 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -142,8 +142,8 @@ struct evtchn
 } __attribute__((aligned(64)));
 
 int  evtchn_init(struct domain *d, unsigned int max_port);
-int  evtchn_destroy(struct domain *d); /* from domain_kill */
-void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
+int  evtchn_teardown(struct domain *d);
+void evtchn_destroy(struct domain *d);
 
 struct waitqueue_vcpu;
 
-- 
2.11.0



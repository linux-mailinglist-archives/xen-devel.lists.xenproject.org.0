Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470E2AC10F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 17:39:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22719.49121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcABe-0000wZ-2W; Mon, 09 Nov 2020 16:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22719.49121; Mon, 09 Nov 2020 16:38:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcABd-0000wA-VH; Mon, 09 Nov 2020 16:38:33 +0000
Received: by outflank-mailman (input) for mailman id 22719;
 Mon, 09 Nov 2020 16:38:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcABb-0000vD-LY
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:38:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40bef7d9-7384-4f85-bd59-998c1815a481;
 Mon, 09 Nov 2020 16:38:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0655AD11;
 Mon,  9 Nov 2020 16:38:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcABb-0000vD-LY
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 16:38:31 +0000
X-Inumbo-ID: 40bef7d9-7384-4f85-bd59-998c1815a481
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40bef7d9-7384-4f85-bd59-998c1815a481;
	Mon, 09 Nov 2020 16:38:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604939909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eDlo6s9/bQ6o2hmRgAhuAfISfO0llaHbAtq+TidIvI=;
	b=eIMoxiIGdcdaTDNok1VTLO3NcneGW58cITfTdFyjf9tOW7srpPEHzfmzJVYSA6dNFd05XZ
	nllz6wrLVbNeok3AsrdXbF0efN3/+3CvdFg8rNR2shRj06FWvHv0K6Re/JGtSrLDMREZoA
	GG+UCjHa7Gdj+S5pCD6XGm6SGfYmbn8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B0655AD11;
	Mon,  9 Nov 2020 16:38:29 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v6 3/3] xen/evtchn: revert 52e1fc47abc3a0123
Date: Mon,  9 Nov 2020 17:38:26 +0100
Message-Id: <20201109163826.13035-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109163826.13035-1-jgross@suse.com>
References: <20201109163826.13035-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the event channel lock no longer disabling interrupts commit
52e1fc47abc3a0123 ("evtchn/Flask: pre-allocate node on send path") can
be reverted again.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_channel.c  |  6 ---
 xen/include/xsm/xsm.h       |  1 -
 xen/xsm/flask/avc.c         | 78 ++++---------------------------------
 xen/xsm/flask/hooks.c       | 10 -----
 xen/xsm/flask/include/avc.h |  2 -
 5 files changed, 7 insertions(+), 90 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 43e3520df6..eacd96b92f 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -740,12 +740,6 @@ int evtchn_send(struct domain *ld, unsigned int lport)
     if ( !port_is_valid(ld, lport) )
         return -EINVAL;
 
-    /*
-     * As the call further down needs to avoid allocations (due to running
-     * with IRQs off), give XSM a chance to pre-allocate if needed.
-     */
-    xsm_evtchn_send(XSM_HOOK, ld, NULL);
-
     lchn = evtchn_from_port(ld, lport);
 
     evtchn_read_lock(lchn);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 358ec13ba8..7bd03d8817 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -59,7 +59,6 @@ struct xsm_operations {
     int (*evtchn_interdomain) (struct domain *d1, struct evtchn *chn1,
                                         struct domain *d2, struct evtchn *chn2);
     void (*evtchn_close_post) (struct evtchn *chn);
-    /* Note: Next hook may be called with 'chn' set to NULL. See call site. */
     int (*evtchn_send) (struct domain *d, struct evtchn *chn);
     int (*evtchn_status) (struct domain *d, struct evtchn *chn);
     int (*evtchn_reset) (struct domain *d1, struct domain *d2);
diff --git a/xen/xsm/flask/avc.c b/xen/xsm/flask/avc.c
index 2dfa1f4295..87ea38b7a0 100644
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -24,9 +24,7 @@
 #include <xen/prefetch.h>
 #include <xen/kernel.h>
 #include <xen/sched.h>
-#include <xen/cpu.h>
 #include <xen/init.h>
-#include <xen/percpu.h>
 #include <xen/rcupdate.h>
 #include <asm/atomic.h>
 #include <asm/current.h>
@@ -343,79 +341,17 @@ static inline int avc_reclaim_node(void)
     return ecx;
 }
 
-static struct avc_node *new_node(void)
-{
-    struct avc_node *node = xzalloc(struct avc_node);
-
-    if ( node )
-    {
-        INIT_RCU_HEAD(&node->rhead);
-        INIT_HLIST_NODE(&node->list);
-        avc_cache_stats_incr(allocations);
-    }
-
-    return node;
-}
-
-/*
- * avc_has_perm_noaudit() may consume up to two nodes, which we may not be
- * able to obtain from the allocator at that point. Since the is merely
- * about caching earlier decisions, allow for (just) one pre-allocated node.
- */
-static DEFINE_PER_CPU(struct avc_node *, prealloc_node);
-
-void avc_prealloc(void)
-{
-    struct avc_node **prealloc = &this_cpu(prealloc_node);
-
-    if ( !*prealloc )
-        *prealloc = new_node();
-}
-
-static int cpu_callback(struct notifier_block *nfb, unsigned long action,
-                        void *hcpu)
-{
-    unsigned int cpu = (unsigned long)hcpu;
-    struct avc_node **prealloc = &per_cpu(prealloc_node, cpu);
-
-    if ( action == CPU_DEAD && *prealloc )
-    {
-        xfree(*prealloc);
-        *prealloc = NULL;
-        avc_cache_stats_incr(frees);
-    }
-
-    return NOTIFY_DONE;
-}
-
-static struct notifier_block cpu_nfb = {
-    .notifier_call = cpu_callback,
-    .priority = 99
-};
-
-static int __init cpu_nfb_init(void)
-{
-    register_cpu_notifier(&cpu_nfb);
-    return 0;
-}
-__initcall(cpu_nfb_init);
-
 static struct avc_node *avc_alloc_node(void)
 {
-    struct avc_node *node, **prealloc = &this_cpu(prealloc_node);
+    struct avc_node *node;
 
-    node = *prealloc;
-    *prealloc = NULL;
+    node = xzalloc(struct avc_node);
+    if (!node)
+        goto out;
 
-    if ( !node )
-    {
-        /* Must not call xmalloc() & Co with IRQs off. */
-        if ( !local_irq_is_enabled() )
-            goto out;
-        node = new_node();
-        if ( !node )
-            goto out;
-    }
+    INIT_RCU_HEAD(&node->rhead);
+    INIT_HLIST_NODE(&node->list);
+    avc_cache_stats_incr(allocations);
 
     atomic_inc(&avc_cache.active_nodes);
     if ( atomic_read(&avc_cache.active_nodes) > avc_cache_threshold )
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index de050cc9fe..19b0d9e3eb 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -281,16 +281,6 @@ static int flask_evtchn_send(struct domain *d, struct evtchn *chn)
 {
     int rc;
 
-    /*
-     * When called with non-NULL chn, memory allocation may not be permitted.
-     * Allow AVC to preallocate nodes as necessary upon early notification.
-     */
-    if ( !chn )
-    {
-        avc_prealloc();
-        return 0;
-    }
-
     switch ( chn->state )
     {
     case ECS_INTERDOMAIN:
diff --git a/xen/xsm/flask/include/avc.h b/xen/xsm/flask/include/avc.h
index 722919b762..c14bd07a2b 100644
--- a/xen/xsm/flask/include/avc.h
+++ b/xen/xsm/flask/include/avc.h
@@ -91,8 +91,6 @@ int avc_has_perm_noaudit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
 int avc_has_perm(u32 ssid, u32 tsid, u16 tclass, u32 requested,
                                              struct avc_audit_data *auditdata);
 
-void avc_prealloc(void);
-
 /* Exported to selinuxfs */
 struct xen_flask_hash_stats;
 int avc_get_hash_stats(struct xen_flask_hash_stats *arg);
-- 
2.26.2



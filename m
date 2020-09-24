Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AE276F18
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:54:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOs9-0007yk-Sx; Thu, 24 Sep 2020 10:53:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLOs8-0007yf-8J
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:53:08 +0000
X-Inumbo-ID: 9e8aa4b4-e088-42fc-8258-89a3645cc4f8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e8aa4b4-e088-42fc-8258-89a3645cc4f8;
 Thu, 24 Sep 2020 10:53:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600944786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=inz4kaNPs764TGoAxz4khycMux1Dsk1Koek8xYZk+rA=;
 b=GADFmvoP1HHdSp/aR2y8eNOmh3y8W+TkmW/mz5h7cZq5ldgCbNmP27eGCWLhSnBTogFshV
 jwd+fsznVj60XNMiEs635fYoN4IKQldNZdZxxwPohRS66cltlONeQDWAMYlpfC79WzRMws
 fpyNJPpHFv6aV+eZr+8R1lMg1yufKFo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 258C9B13E;
 Thu, 24 Sep 2020 10:53:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] evtchn/Flask: pre-allocate node on send path
Message-ID: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
Date: Thu, 24 Sep 2020 12:53:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

xmalloc() & Co may not be called with IRQs off, or else check_lock()
will have its assertion trigger about locks getting acquired
inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
very reasonable, especially since the per-channel lock was introduced to
avoid acquiring the per-domain event lock on the send paths. Issue a
second call to xsm_evtchn_send() instead, before acquiring the lock, to
give XSM / Flask a chance to pre-allocate whatever it may need.

As these nodes are used merely for caching earlier decisions' results,
allocate just one node in AVC code despite two potentially being needed.
Things will merely be not as performant if a second allocation was
wanted, just like when the pre-allocation fails.

Fixes: c0ddc8634845 ("evtchn: convert per-channel lock to be IRQ-safe")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: An even easier fix could be to simply guard xzalloc() by a
     conditional checking local_irq_is_enabled(), but for a domain
     sending only interdomain events this would mean AVC's node caching
     would never take effect on the sending path, as allocation would
     then always be avoided.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -723,6 +723,12 @@ int evtchn_send(struct domain *ld, unsig
     if ( !port_is_valid(ld, lport) )
         return -EINVAL;
 
+    /*
+     * As the call further down needs to avoid allocations (due to running
+     * with IRQs off), give XSM a chance to pre-allocate if needed.
+     */
+    xsm_evtchn_send(XSM_HOOK, ld, NULL);
+
     lchn = evtchn_from_port(ld, lport);
 
     spin_lock_irqsave(&lchn->lock, flags);
--- a/xen/xsm/flask/avc.c
+++ b/xen/xsm/flask/avc.c
@@ -24,7 +24,9 @@
 #include <xen/prefetch.h>
 #include <xen/kernel.h>
 #include <xen/sched.h>
+#include <xen/cpu.h>
 #include <xen/init.h>
+#include <xen/percpu.h>
 #include <xen/rcupdate.h>
 #include <asm/atomic.h>
 #include <asm/current.h>
@@ -341,17 +343,79 @@ static inline int avc_reclaim_node(void)
     return ecx;
 }
 
+static struct avc_node *new_node(void)
+{
+    struct avc_node *node = xzalloc(struct avc_node);
+
+    if ( node )
+    {
+        INIT_RCU_HEAD(&node->rhead);
+        INIT_HLIST_NODE(&node->list);
+        avc_cache_stats_incr(allocations);
+    }
+
+    return node;
+}
+
+/*
+ * avc_has_perm_noaudit() may consume up to two nodes, which we may not be
+ * able to obtain from the allocator at that point. Since the is merely
+ * about caching earlier decisions, allow for (just) one pre-allocated node.
+ */
+static DEFINE_PER_CPU(struct avc_node *, prealloc_node);
+
+void avc_prealloc(void)
+{
+    struct avc_node **prealloc = &this_cpu(prealloc_node);
+
+    if ( !*prealloc )
+        *prealloc = new_node();
+}
+
+static int cpu_callback(struct notifier_block *nfb, unsigned long action,
+                        void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+    struct avc_node **prealloc = &per_cpu(prealloc_node, cpu);
+
+    if ( action == CPU_DEAD && *prealloc )
+    {
+        xfree(*prealloc);
+        *prealloc = NULL;
+        avc_cache_stats_incr(frees);
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+    .priority = 99
+};
+
+static int __init cpu_nfb_init(void)
+{
+    register_cpu_notifier(&cpu_nfb);
+    return 0;
+}
+__initcall(cpu_nfb_init);
+
 static struct avc_node *avc_alloc_node(void)
 {
-    struct avc_node *node;
+    struct avc_node *node, **prealloc = &this_cpu(prealloc_node);
 
-    node = xzalloc(struct avc_node);
-    if (!node)
-        goto out;
-
-    INIT_RCU_HEAD(&node->rhead);
-    INIT_HLIST_NODE(&node->list);
-    avc_cache_stats_incr(allocations);
+    node = *prealloc;
+    *prealloc = NULL;
+
+    if ( !node )
+    {
+        /* Must not call xmalloc() & Co with IRQs off. */
+        if ( !local_irq_is_enabled() )
+            goto out;
+        node = new_node();
+        if ( !node )
+            goto out;
+    }
 
     atomic_inc(&avc_cache.active_nodes);
     if ( atomic_read(&avc_cache.active_nodes) > avc_cache_threshold )
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -281,6 +281,16 @@ static int flask_evtchn_send(struct doma
 {
     int rc;
 
+    /*
+     * When called with non-NULL chn, memory allocation may not be permitted.
+     * Allow AVC to preallocate nodes as necessary upon early notification.
+     */
+    if ( !chn )
+    {
+        avc_prealloc();
+        return 0;
+    }
+
     switch ( chn->state )
     {
     case ECS_INTERDOMAIN:
--- a/xen/xsm/flask/include/avc.h
+++ b/xen/xsm/flask/include/avc.h
@@ -91,6 +91,8 @@ int avc_has_perm_noaudit(u32 ssid, u32 t
 int avc_has_perm(u32 ssid, u32 tsid, u16 tclass, u32 requested,
                                              struct avc_audit_data *auditdata);
 
+void avc_prealloc(void);
+
 /* Exported to selinuxfs */
 struct xen_flask_hash_stats;
 int avc_get_hash_stats(struct xen_flask_hash_stats *arg);


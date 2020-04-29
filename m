Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410411BE560
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqdP-0002AW-QP; Wed, 29 Apr 2020 17:36:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbvF=6N=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jTqdN-00029s-KT
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 17:36:33 +0000
X-Inumbo-ID: f68dd874-8a3f-11ea-9980-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f68dd874-8a3f-11ea-9980-12813bfff9fa;
 Wed, 29 Apr 2020 17:36:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 265DFAC37;
 Wed, 29 Apr 2020 17:36:30 +0000 (UTC)
Subject: [PATCH 1/2] xen: credit2: factor cpu to runqueue matching in a
 function
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 29 Apr 2020 19:36:30 +0200
Message-ID: <158818178990.24327.6732870355943077303.stgit@Palanthas>
In-Reply-To: <158818022727.24327.14309662489731832234.stgit@Palanthas>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
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
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just move the big if() condition in an inline function.

No functional change intended.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
---
 xen/common/sched/credit2.c |   28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 34f05c3e2a..697c9f917d 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -838,6 +838,20 @@ static inline bool same_core(unsigned int cpua, unsigned int cpub)
            cpu_to_core(cpua) == cpu_to_core(cpub);
 }
 
+static inline bool
+cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
+{
+    unsigned int peer_cpu = rqd->pick_bias;
+
+    BUG_ON(cpu_to_socket(peer_cpu) == XEN_INVALID_SOCKET_ID);
+
+    /* OPT_RUNQUEUE_CPU will never find an existing runqueue. */
+    return opt_runqueue == OPT_RUNQUEUE_ALL ||
+           (opt_runqueue == OPT_RUNQUEUE_CORE && same_core(peer_cpu, cpu)) ||
+           (opt_runqueue == OPT_RUNQUEUE_SOCKET && same_socket(peer_cpu, cpu)) ||
+           (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu));
+}
+
 static struct csched2_runqueue_data *
 cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
 {
@@ -855,21 +869,11 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
     rqd_ins = &prv->rql;
     list_for_each_entry ( rqd, &prv->rql, rql )
     {
-        unsigned int peer_cpu;
-
         /* Remember first unused queue index. */
         if ( !rqi_unused && rqd->id > rqi )
             rqi_unused = true;
 
-        peer_cpu = rqd->pick_bias;
-        BUG_ON(cpu_to_socket(cpu) == XEN_INVALID_SOCKET_ID ||
-               cpu_to_socket(peer_cpu) == XEN_INVALID_SOCKET_ID);
-
-        /* OPT_RUNQUEUE_CPU will never find an existing runqueue. */
-        if ( opt_runqueue == OPT_RUNQUEUE_ALL ||
-             (opt_runqueue == OPT_RUNQUEUE_CORE && same_core(peer_cpu, cpu)) ||
-             (opt_runqueue == OPT_RUNQUEUE_SOCKET && same_socket(peer_cpu, cpu)) ||
-             (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu)) )
+        if ( cpu_runqueue_match(rqd, cpu) )
         {
             rqd_valid = true;
             break;
@@ -3744,6 +3748,8 @@ csched2_alloc_pdata(const struct scheduler *ops, int cpu)
     struct csched2_pcpu *spc;
     struct csched2_runqueue_data *rqd;
 
+    BUG_ON(cpu_to_socket(cpu) == XEN_INVALID_SOCKET_ID);
+
     spc = xzalloc(struct csched2_pcpu);
     if ( spc == NULL )
         return ERR_PTR(-ENOMEM);



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611D48800D
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254714.436540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv8-0007Xw-Ly; Sat, 08 Jan 2022 00:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254714.436540; Sat, 08 Jan 2022 00:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv8-0007Nl-Ap; Sat, 08 Jan 2022 00:49:22 +0000
Received: by outflank-mailman (input) for mailman id 254714;
 Sat, 08 Jan 2022 00:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv6-000706-1v
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce8f032a-701c-11ec-81c1-a30af7de8005;
 Sat, 08 Jan 2022 01:49:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C23DB827C0;
 Sat,  8 Jan 2022 00:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82219C36AEF;
 Sat,  8 Jan 2022 00:49:14 +0000 (UTC)
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
X-Inumbo-ID: ce8f032a-701c-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602955;
	bh=5gqnkAJOfXnqVGXZ1qlNwhP+taPqzRbwoAe4Pxn2FBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OyHNvkvda/IppfmN5ffOApPiggGKdA6fHkKcxGtbEGfmCurNqL9cCKuEdWr40fJDA
	 4oC9SKxj8Ik2xh0JVoU3jItm0cwkfAtmPxE94JyN5/hR0INnezaoHoSj44UoDiCxBa
	 ilacuOy5whBIAbd1PbBP6MByN/c+Bvg92LcxBKpwsYxfDoHmi8TUgrKar2wKndw+Mm
	 eaI2MT5baBcnxq/rxkOJhS60EZMOs1kK4sHnwdWzOZ6CQw+HXjnXmAYfwYPTQle30n
	 bU8I4dUnMqpKdqLfhIckxGT4nfCCw6HZTiZK0TomvlNBzq7MgsZjCG1nLLFIU1oZNa
	 wxR6k7hYry/Vw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/7] xen: introduce _evtchn_alloc_unbound
Date: Fri,  7 Jan 2022 16:49:07 -0800
Message-Id: <20220108004912.3820176-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

The xenstore event channel will be allocated for dom0less domains. It is
necessary to have access to the evtchn_alloc_unbound function to do
that.

Factor out the part that actually allocates the event channel from
evtchn_alloc_unbound and introduce this new function as
_evtchn_alloc_unbound. (xsm_evtchn_unbound wouldn't work for a call
originated from Xen.)

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/event_channel.c | 49 +++++++++++++++++++++++++-------------
 xen/include/xen/event.h    |  3 +++
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index da88ad141a..8a19bbf7ae 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -18,6 +18,7 @@
 
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/err.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/irq.h>
@@ -284,11 +285,32 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
     xsm_evtchn_close_post(chn);
 }
 
-static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+struct evtchn *_evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
 {
     struct evtchn *chn;
+    int port;
+
+    if ( (port = get_free_port(d)) < 0 )
+        return ERR_PTR(port);
+    chn = evtchn_from_port(d, port);
+
+    evtchn_write_lock(chn);
+
+    chn->state = ECS_UNBOUND;
+    if ( (chn->u.unbound.remote_domid = remote_dom) == DOMID_SELF )
+        chn->u.unbound.remote_domid = current->domain->domain_id;
+    evtchn_port_init(d, chn);
+
+    evtchn_write_unlock(chn);
+
+    return chn;
+}
+
+static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
+{
+    struct evtchn *chn = NULL;
     struct domain *d;
-    int            port, rc;
+    int            rc;
     domid_t        dom = alloc->dom;
 
     d = rcu_lock_domain_by_any_id(dom);
@@ -297,27 +319,22 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
 
     spin_lock(&d->event_lock);
 
-    if ( (port = get_free_port(d)) < 0 )
-        ERROR_EXIT_DOM(port, d);
-    chn = evtchn_from_port(d, port);
+    chn = _evtchn_alloc_unbound(d, alloc->remote_dom);
+    if ( IS_ERR(chn) )
+    {
+        rc = PTR_ERR(chn);
+        ERROR_EXIT_DOM(rc, d);
+    }
 
     rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
     if ( rc )
         goto out;
 
-    evtchn_write_lock(chn);
-
-    chn->state = ECS_UNBOUND;
-    if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
-        chn->u.unbound.remote_domid = current->domain->domain_id;
-    evtchn_port_init(d, chn);
-
-    evtchn_write_unlock(chn);
-
-    alloc->port = port;
+    alloc->port = chn->port;
 
  out:
-    check_free_port(d, port);
+    if ( chn != NULL )
+        check_free_port(d, chn->port);
     spin_unlock(&d->event_lock);
     rcu_unlock_domain(d);
 
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..6aedbccbf1 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -68,6 +68,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest);
 /* Free an event channel. */
 void evtchn_free(struct domain *d, struct evtchn *chn);
 
+/* Create a new event channel port */
+struct evtchn *_evtchn_alloc_unbound(struct domain *d, domid_t remote_dom);
+
 /* Allocate a specific event channel port. */
 int evtchn_allocate_port(struct domain *d, unsigned int port);
 
-- 
2.25.1



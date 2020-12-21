Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6B2DFF79
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57506.100662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjP-0000e9-OG; Mon, 21 Dec 2020 18:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57506.100662; Mon, 21 Dec 2020 18:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krPjP-0000dR-It; Mon, 21 Dec 2020 18:16:27 +0000
Received: by outflank-mailman (input) for mailman id 57506;
 Mon, 21 Dec 2020 18:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm/H=FZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krPjN-0000Ys-W1
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:16:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecc297fa-f5ea-407d-8910-2d35caea21ad;
 Mon, 21 Dec 2020 18:16:21 +0000 (UTC)
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
X-Inumbo-ID: ecc297fa-f5ea-407d-8910-2d35caea21ad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608574581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hRzDOLHnk7AFo9Bf3bdweZ3XGJXNV7e3/ahLcdzLXdc=;
  b=PkeTYGYy5J+nu1yRvcPaFf1Eat/wOb5MuRUjuLPnlecyz8cWolXvkzue
   C0o6aubhD0qn4DMCYz88QJ/ekjSdrxJqw75vgbXQTYjp+JG2qfASGQtla
   A9w0txW93vt3ddhahEcN2cwNX9gx5lIFWO/RW5/4IcH991BptUfmu6vAH
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eCvJ8vVJQ+h1Yvf02LFBLnaUX2zruNYyojZwmjDu86rPk3OsY1YAJpD8hf6UX9QXu7VM/LGXdw
 Mfq/e9i8vDhIMvhBLTTwKJPhvUGgz7+970pi2fg0mXdV+5s4Qgy/WR7kX1Qf7AVSFz1AkS53CQ
 KCfJUjFqhJsEh2izW+lDXB+pRJ9DfMX6ATET2w4pGiIbXho9dAff3jM9/1gNbbhUKq74ne7Yzo
 Sb0m3H6WQSCXKvppEvIg7wtDjbw1GRpCC0dtdeuVhNVpQi80rKMQ6z0E6ef/OQgUp85jOvyNqm
 Ebk=
X-SBRS: 5.2
X-MesageID: 33707602
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,437,1599537600"; 
   d="scan'208";a="33707602"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/domain: Reorder trivial initialisation in early domain_create()
Date: Mon, 21 Dec 2020 18:14:44 +0000
Message-ID: <20201221181446.7791-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201221181446.7791-1-andrew.cooper3@citrix.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This improves the robustness of the error paths.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/common/domain.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5ec48c3e19..ce3667f1b4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -391,25 +391,7 @@ struct domain *domain_create(domid_t domid,
 
     TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
 
-    /*
-     * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
-     * resources want to be sized based on max_vcpus.
-     */
-    if ( !is_system_domain(d) )
-    {
-        err = -ENOMEM;
-        d->vcpu = xzalloc_array(struct vcpu *, config->max_vcpus);
-        if ( !d->vcpu )
-            goto fail;
-
-        d->max_vcpus = config->max_vcpus;
-    }
-
-    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
-
-    if ( (err = xsm_alloc_security_domain(d)) != 0 )
-        goto fail;
-
+    /* Trivial initialisation. */
     atomic_set(&d->refcnt, 1);
     RCU_READ_LOCK_INIT(&d->rcu_lock);
     spin_lock_init_prof(d, domain_lock);
@@ -434,6 +416,27 @@ struct domain *domain_create(domid_t domid,
     INIT_LIST_HEAD(&d->pdev_list);
 #endif
 
+    /* All error paths can depend on the above setup. */
+
+    /*
+     * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
+     * resources want to be sized based on max_vcpus.
+     */
+    if ( !is_system_domain(d) )
+    {
+        err = -ENOMEM;
+        d->vcpu = xzalloc_array(struct vcpu *, config->max_vcpus);
+        if ( !d->vcpu )
+            goto fail;
+
+        d->max_vcpus = config->max_vcpus;
+    }
+
+    lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
+
+    if ( (err = xsm_alloc_security_domain(d)) != 0 )
+        goto fail;
+
     err = -ENOMEM;
     if ( !zalloc_cpumask_var(&d->dirty_cpumask) )
         goto fail;
-- 
2.11.0



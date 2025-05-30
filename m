Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F9AC9817
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 01:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001602.1381735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL90L-0005Ro-T8; Fri, 30 May 2025 23:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001602.1381735; Fri, 30 May 2025 23:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL90L-0005PP-PG; Fri, 30 May 2025 23:19:13 +0000
Received: by outflank-mailman (input) for mailman id 1001602;
 Fri, 30 May 2025 23:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL90K-00055p-0H
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 23:19:12 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dcf4de1-3dac-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 01:19:10 +0200 (CEST)
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
X-Inumbo-ID: 7dcf4de1-3dac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748647149; x=1748906349;
	bh=YxCkgCQgEgcma2HR34BjqEKfMw9IKxiz4R9wP5xWv0o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=jvxVPpgTZDTnOQSspE04WazOKRkEo3XQBj9exJwLKtc//Vs5ZjcrhqWKUgz+D1XIv
	 Qku+ZLkqzGcAa7ALMwXXlOrF8mYZXbZsdqT5CDbdCqXyO/Ix6djWRxihpP8Hu2AOVY
	 y9dcbu5WRhDf1C1+wgn2pj+gBHIUqV340O9aIGk0qzkvEPPCZG6dbvhn+z5Vn385wB
	 Uz732eqr6IOd3Q/puYzYE+MsWUoRge18cdOR+e2wAR+Fz7Tp8oEOyIhr3SY+JlzZCZ
	 bY+E/bWXEZ4vVp0b7pnmsc4ET+W/39Zmf2QAybrzhkEG6iq6viQQ8aCVOh+tv3LlKj
	 pF4fOIJLfANBA==
Date: Fri, 30 May 2025 23:19:01 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 2/4] xen/console: introduce console input permission
Message-ID: <20250530231841.73386-3-dmukhin@ford.com>
In-Reply-To: <20250530231841.73386-1-dmukhin@ford.com>
References: <20250530231841.73386-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 49605cb8c5e79f6a3a4f10e2aed5b7481a08333f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add new flag to domain structure for marking permission to intercept
the physical console input by the domain.

Update console input switch logic accordingly.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- kept input_allowed as a separate flag
- updated logic for input_allowed in vpl011
- fixup for console_switch_input()
---
 xen/arch/arm/vpl011.c      |  1 +
 xen/arch/x86/pv/shim.c     |  2 ++
 xen/common/domain.c        |  2 ++
 xen/drivers/char/console.c | 18 +++++++++++++++++-
 xen/include/xen/sched.h    |  8 +++++++-
 5 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 66047bf33c..480fc664fc 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -713,6 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_=
init_info *info)
     }
     else
     {
+        d->console.input_allowed =3D true;
         vpl011->backend_in_domain =3D false;
=20
         vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index c506cc0bec..bc2a7dd5fa 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -238,6 +238,8 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgen=
try_t *l4start,
      * guest from depleting the shim memory pool.
      */
     d->max_pages =3D domain_tot_pages(d);
+
+    d->console.input_allowed =3D true;
 }
=20
 static void write_start_info(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 129b4fcb37..d75ece1b61 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -835,6 +835,8 @@ struct domain *domain_create(domid_t domid,
         flags |=3D CDF_hardware;
         if ( old_hwdom )
             old_hwdom->cdf &=3D ~CDF_hardware;
+
+        d->console.input_allowed =3D true;
     }
=20
     /* Holding CDF_* internal flags. */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 30701ae0b0..9a9836ba91 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -512,9 +512,21 @@ static unsigned int __read_mostly console_rx =3D 0;
=20
 struct domain *console_get_domain(void)
 {
+    struct domain *d;
+
     if ( console_rx =3D=3D 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_rx - 1);
+
+    d =3D rcu_lock_domain_by_id(console_rx - 1);
+    if ( !d )
+        return NULL;
+
+    if ( d->console.input_allowed )
+        return d;
+
+    rcu_unlock_domain(d);
+
+    return NULL;
 }
=20
 void console_put_domain(struct domain *d)
@@ -551,6 +563,10 @@ static void console_switch_input(void)
         if ( d )
         {
             rcu_unlock_domain(d);
+
+            if ( !d->console.input_allowed )
+                continue;
+
             console_rx =3D next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c..e91c99a8f3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -512,7 +512,7 @@ struct domain
     bool             auto_node_affinity;
     /* Is this guest fully privileged (aka dom0)? */
     bool             is_privileged;
-    /* Can this guest access the Xen console? */
+    /* XSM: permission to use HYPERCALL_console_io hypercall */
     bool             is_console;
     /* Is this guest being debugged by dom0? */
     bool             debugger_attached;
@@ -651,6 +651,12 @@ struct domain
     unsigned int num_llc_colors;
     const unsigned int *llc_colors;
 #endif
+
+    /* Console settings. */
+    struct {
+        /* Permission to take ownership of the physical console input. */
+        bool input_allowed;
+    } console;
 } __aligned(PAGE_SIZE);
=20
 static inline struct page_list_head *page_to_list(
--=20
2.34.1




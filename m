Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A37ABC82F
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990257.1374234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qv-0002Vn-HF; Mon, 19 May 2025 20:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990257.1374234; Mon, 19 May 2025 20:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qv-0002U8-Ch; Mon, 19 May 2025 20:12:49 +0000
Received: by outflank-mailman (input) for mailman id 990257;
 Mon, 19 May 2025 20:12:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6qt-0001j7-Qx
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:12:47 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1a2f019-34ed-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 22:12:47 +0200 (CEST)
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
X-Inumbo-ID: a1a2f019-34ed-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747685566; x=1747944766;
	bh=s9Xnr4J9o81p53iu9F5mfQfhSRRP2AAzWB/TipdHU3A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GxUrsqJP7iTVFfU6KuShVIQs6rT1SJDCEbhhBJC2XshG+JdWGazOPhn4cAAtZGJ9u
	 BNx2r0x2KP5MIhDdOc4RqS8AuK0Ms61Sd+aTw/dYwPo6dawEhVGBJTreqOFwZiE6LQ
	 NHmjaMj1RJfrEw/HQmZMUvI8o7K1zsV77HrbXuJYcdcIETOX6KXhPOZjN/6cXdudF8
	 UyuYZJAaQWVMZ52whWgS99tRsnL6xaDSjDytiFS/Ebv4dtnJNEjC/Ve+GppYSuAH0n
	 GL6Z4cc6HqlhyzwdtCg1DNvw+6n1V4OO8ULeTYSNUwPlVoI+yzTQdQMjxpmVvRcly/
	 ogMyGxpJTv2Ew==
Date: Mon, 19 May 2025 20:12:42 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 3/5] xen/console: introduce console input permission
Message-ID: <20250519201211.1366244-4-dmukhin@ford.com>
In-Reply-To: <20250519201211.1366244-1-dmukhin@ford.com>
References: <20250519201211.1366244-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 73229b2a4a156b643aacc4fab0873cf0afa39ded
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
Changes since v2:
- rebased
- Link to v2: https://lore.kernel.org/xen-devel/20250331230508.440198-2-dmu=
khin@ford.com/
---
 xen/arch/arm/vpl011.c      |  2 ++
 xen/arch/x86/pv/shim.c     |  2 ++
 xen/common/domain.c        |  2 ++
 xen/drivers/char/console.c | 18 +++++++++++++++++-
 xen/include/xen/sched.h    |  8 +++++++-
 5 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 0f58b2c900..d0e5504e9e 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -734,6 +734,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_=
init_info *info)
     register_mmio_handler(d, &vpl011_mmio_handler,
                           vpl011->base_addr, GUEST_PL011_SIZE, NULL);
=20
+    d->console.input_allowed =3D true;
+
     return 0;
=20
 out1:
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
index cb05156ff5..6a6cdd991b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -836,6 +836,8 @@ struct domain *domain_create(domid_t domid,
         flags |=3D CDF_hardware;
         if ( old_hwdom )
             old_hwdom->cdf &=3D ~CDF_hardware;
+
+        d->console.input_allowed =3D true;
     }
=20
     /* Holding CDF_* internal flags. */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 86fd0b427d..ccecda6523 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -476,9 +476,21 @@ static unsigned int __read_mostly console_rx =3D 0;
=20
 static struct domain *console_get_domain(void)
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
 static void console_put_domain(struct domain *d)
@@ -522,6 +534,10 @@ static void console_switch_input(void)
         if ( d )
         {
             rcu_unlock_domain(d);
+
+            if ( !d->console.input_allowed )
+                break;
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




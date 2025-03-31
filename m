Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E4A7713F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933114.1335149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCI-0003ZI-NM; Mon, 31 Mar 2025 23:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933114.1335149; Mon, 31 Mar 2025 23:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCI-0003Wa-Jl; Mon, 31 Mar 2025 23:05:38 +0000
Received: by outflank-mailman (input) for mailman id 933114;
 Mon, 31 Mar 2025 23:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCG-0003Id-St
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:05:36 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a73f650e-0e84-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 01:05:35 +0200 (CEST)
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
X-Inumbo-ID: a73f650e-0e84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462333; x=1743721533;
	bh=P4yUAieCFUccYuxlmELh6hErnzZb8oGQtjdxvGGyV3c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=U5AkLS0wHS8nRunrJiK1WSvCLvTqi5STt2CQoGyx3mfjLu4HoPAFx+Oo0k0D6ABCk
	 8+UNxU2FBVGFQ8KDow16P2GIA3PqOPtnl9tiE829fTjkuuj5j7KxILj17Cti48SMY6
	 HI8meuGCmtYJSQMVBq+evlfKJheOyifr2ou0hRErN7QycD5p3RqoPBMCIx+k7qttRI
	 1MbAuauuwfJ3CbTj0i4kJ+Gnvw15ff03KytfUMlD9jQIWLY8bq8AkC8i0QrIG+J+Wh
	 HvylXdq151ZEqMbNrUj11q73kEXazbV3hk2Lhep5N1aSGHQUbL8ih+iivWvzIaH4ld
	 DsuxI+lYZnVXQ==
Date: Mon, 31 Mar 2025 23:05:29 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/7] xen/console: introduce console input permission
Message-ID: <20250331230508.440198-2-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d22bea445843c75aa7cd8d61b6b10d7d282769c7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add new flag in domain structure for marking permission to intercept
the physical console input by the domain.

Update console input switch logic accordingly.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped change in __serial_rx()
---
 xen/arch/arm/vpl011.c      |  2 ++
 xen/arch/x86/pv/shim.c     |  2 ++
 xen/common/domain.c        |  2 ++
 xen/drivers/char/console.c | 32 +++++++++++++++++++++++++++-----
 xen/include/xen/sched.h    |  8 +++++++-
 5 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 66047bf33c..147958eee8 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -737,6 +737,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_=
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
index 585fd726a9..b9f549c617 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -827,6 +827,8 @@ struct domain *domain_create(domid_t domid,
=20
         old_hwdom =3D hardware_domain;
         hardware_domain =3D d;
+
+        d->console.input_allowed =3D true;
     }
=20
     TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..b312a1223e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -474,11 +474,26 @@ static unsigned int __read_mostly console_rx =3D 0;
=20
 #define max_console_rx (max_init_domid + 1)
=20
+static struct domain *console_get_domain_by_id(domid_t domid)
+{
+    struct domain *d =3D rcu_lock_domain_by_id(domid);
+
+    if ( !d )
+        return NULL;
+
+    if ( d->console.input_allowed )
+        return d;
+
+    rcu_unlock_domain(d);
+
+    return NULL;
+}
+
 struct domain *console_get_domain(void)
 {
     if ( console_rx =3D=3D 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_rx - 1);
+    return console_get_domain_by_id(console_rx - 1);
 }
=20
 void console_put_domain(struct domain *d)
@@ -487,6 +502,15 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
=20
+static bool console_is_input_allowed(domid_t domid)
+{
+    struct domain *d =3D console_get_domain_by_id(domid);
+
+    console_put_domain(d);
+
+    return !!d;
+}
+
 static void switch_serial_input(void)
 {
     unsigned int next_rx =3D console_rx;
@@ -498,7 +522,6 @@ static void switch_serial_input(void)
     for ( ; ; )
     {
         domid_t domid;
-        struct domain *d;
=20
         if ( next_rx++ >=3D max_console_rx )
         {
@@ -511,10 +534,9 @@ static void switch_serial_input(void)
             domid =3D get_initial_domain_id();
         else
             domid =3D next_rx - 1;
-        d =3D rcu_lock_domain_by_id(domid);
-        if ( d )
+
+        if ( console_is_input_allowed(domid) )
         {
-            rcu_unlock_domain(d);
             console_rx =3D next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c..292b1a91f9 100644
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
+        /* Permission to own physical console input. */
+        bool input_allowed;
+    } console;
 } __aligned(PAGE_SIZE);
=20
 static inline struct page_list_head *page_to_list(
--=20
2.34.1




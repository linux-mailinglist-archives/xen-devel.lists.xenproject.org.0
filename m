Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A625DA680CA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919887.1324240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUH-0004Vu-Kq; Tue, 18 Mar 2025 23:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919887.1324240; Tue, 18 Mar 2025 23:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUH-0004Sq-HK; Tue, 18 Mar 2025 23:36:45 +0000
Received: by outflank-mailman (input) for mailman id 919887;
 Tue, 18 Mar 2025 23:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUF-0004Rg-Ov
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:36:43 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d850c6d9-0451-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 00:36:41 +0100 (CET)
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
X-Inumbo-ID: d850c6d9-0451-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341000; x=1742600200;
	bh=owVvjEcu2jhrINTS+SqEPbxvoEDw03hS/2Hjj7grNLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LCC4KcnYfB5GtNUKbuYuKGGRwxSmtJ449Xq1CownOGpRmZyfi8H/2GuS5oQqGeYVK
	 +KvvnKbuOnBMwXmuAgOg5sXZKVyxazE5ko4HMYR69fUmuKAslrqCL0amhp9PRUYUBL
	 xqB1m4k0lHZXrxwqI0lzPOSgnlKKikvmyeGL69uq8SnACG9lrUkmSy+cL6QJ5mOIKr
	 0zipMnMjLebgULxIAVS3tHMkuDQOtdN1rujTVf/MwQCYJXZyQgI9CI8fPLzer7xIjw
	 EMtD4Gy22OG5K8MtJKMdpP6WKIs65SIOzbuiTNNB8eZg96copwMQBJfiJe0tKnisST
	 npYejPzKJGaHA==
Date: Tue, 18 Mar 2025 23:36:37 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 2/8] xen/console: introduce console input permission
Message-ID: <20250318233617.849903-3-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4b739d5ca3de234e1019e5b8e8ce34db19cc8ae8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add new flag in domain structure for marking permission to intercept
the physical console input by the domain.

Update console input switch logic accordingly.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c      |  2 ++
 xen/arch/x86/pv/shim.c     |  2 ++
 xen/common/domain.c        |  2 ++
 xen/drivers/char/console.c | 49 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/sched.h    |  8 ++++++-
 5 files changed, 56 insertions(+), 7 deletions(-)

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
index c3150fbdb7..d7d9800095 100644
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
+static bool console_check_focus_by_id(domid_t domid)
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
+        if ( console_check_focus_by_id(domid) )
         {
-            rcu_unlock_domain(d);
             console_rx =3D next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
@@ -564,10 +586,25 @@ static void __serial_rx(char c)
         /* Deliver input to the PV shim console. */
         rc =3D consoled_guest_tx(c);
=20
-    if ( rc )
+    switch ( rc )
+    {
+    case 0:
+        break;
+
+    case -EBUSY:    /* Loopback mode */
+    case -ENOSPC:   /* FIFO is full */
         guest_printk(d,
                      XENLOG_WARNING "failed to process console input: %d\n=
",
                      rc);
+        break;
+
+    default:
+        d->console.input_allowed =3D false;
+        guest_printk(d,
+                     XENLOG_ERR "disabled console input: %d\n",
+                     rc);
+        break;
+    }
=20
     console_put_domain(d);
 }
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




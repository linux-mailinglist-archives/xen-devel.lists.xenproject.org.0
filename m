Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B6A4041A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2025 01:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894722.1303440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tldLm-0001mE-Jc; Sat, 22 Feb 2025 00:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894722.1303440; Sat, 22 Feb 2025 00:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tldLm-0001kl-Gt; Sat, 22 Feb 2025 00:26:34 +0000
Received: by outflank-mailman (input) for mailman id 894722;
 Sat, 22 Feb 2025 00:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V16X=VN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tldLk-0001kf-Un
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 00:26:33 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b05750-f0b3-11ef-9aaa-95dc52dad729;
 Sat, 22 Feb 2025 01:26:29 +0100 (CET)
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
X-Inumbo-ID: a8b05750-f0b3-11ef-9aaa-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740183988; x=1740443188;
	bh=tRdPIW1FjsHSNc5Xmw1ilCkq3YhqjA3RMyWNbwiyEEM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=SJIO8phwNXLLidUPgyxoEsRt4H+ATx22c7dtWkmHkOGoy8yz3fZXAZMqTbLrRwFH5
	 8FjoRzGTjZyb8z2Ore0ZWy9TnYUVjFipKrmgr+WlMZBXF7XEkw5xM1B/JfaaDGonji
	 wQwy/tT3ip4+Yr/QEocJ/eBSX2n1MUm2IwKOkO2Yxvy4s3wQG1ldDMj3oLd4TWWaA6
	 /sJBqrmewLFMrMFIPMm7nDQAbu2o2A0Q5u5IEQrHAcmjywa6VFEIDSUc2Roif0CqJL
	 51iMO59avVELqlCo2n59BTw+hWpT8mVBDBe/hZiXfqFGUX942NdHFgW9bJFW5hgOJK
	 cp5j6jb0yCWJw==
Date: Sat, 22 Feb 2025 00:26:21 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/consoled: clean up console handling for pv_shim
Message-ID: <20250222002520.2482334-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 52e55e5ece72d3e50bf1175ea7cc67bb2cd44936
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

There are few places which check pv_shim console under CONFIG_PV_SHIM or
CONFIG_X86 in xen console driver.

Instead of #ifdef-ing, use new consoled_is_enabled() in switch_serial_input=
()
and __serial_rx() (where pv_shim condition is now detected correctly).

Signature of consoled_guest_{rx,tx} has changed so the errors can be logged
on the callsites.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/pv/shim.c      |  3 +--
 xen/drivers/char/console.c  | 15 ++++++---------
 xen/drivers/char/consoled.c | 17 +++++++++++++----
 xen/include/xen/consoled.h  | 32 +++++++++++++++++++++++++++-----
 4 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index b9c034ccff..cbc2e3fced 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -605,8 +605,7 @@ long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)
=20
         if ( pv_console && send.port =3D=3D pv_console_evtchn() )
         {
-            consoled_guest_rx();
-            rc =3D 0;
+            rc =3D consoled_guest_rx();
         }
         else
             rc =3D xen_hypercall_event_channel_op(EVTCHNOP_send, &send);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 992b37962e..c207fd8704 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -32,9 +32,9 @@
 #include <xen/pv_console.h>
 #include <asm/setup.h>
 #include <xen/sections.h>
+#include <xen/consoled.h>
=20
 #ifdef CONFIG_X86
-#include <xen/consoled.h>
 #include <asm/guest.h>
 #endif
 #ifdef CONFIG_SBSA_VUART_CONSOLE
@@ -507,11 +507,9 @@ static void switch_serial_input(void)
             break;
         }
=20
-#ifdef CONFIG_PV_SHIM
-        if ( next_rx =3D=3D 1 )
+        if ( consoled_is_enabled() && next_rx =3D=3D 1 )
             domid =3D get_initial_domain_id();
         else
-#endif
             domid =3D next_rx - 1;
         d =3D rcu_lock_domain_by_id(domid);
         if ( d )
@@ -562,13 +560,12 @@ static void __serial_rx(char c)
         rc =3D vpl011_rx_char_xen(d, c);
 #endif
=20
-#ifdef CONFIG_X86
-    if ( pv_shim && pv_console )
-        consoled_guest_tx(c);
-#endif
+    if ( consoled_is_enabled() )
+        /* Deliver input to the PV shim console. */
+        rc =3D consoled_guest_tx(c);
=20
     if ( rc )
-        guest_printk(d, XENLOG_G_WARNING
+        guest_printk(d, XENLOG_WARNING
                         "failed to process console input: %d\n", rc);
=20
     console_put_domain(d);
diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
index b415b632ce..8704ec251e 100644
--- a/xen/drivers/char/consoled.c
+++ b/xen/drivers/char/consoled.c
@@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
 static char buf[BUF_SZ + 1];
=20
 /* Receives characters from a domain's PV console */
-void consoled_guest_rx(void)
+int consoled_guest_rx(void)
 {
     size_t idx =3D 0;
     XENCONS_RING_IDX cons, prod;
=20
     if ( !cons_ring )
-        return;
+        return -ENODEV;
=20
     spin_lock(&rx_lock);
=20
@@ -91,15 +91,17 @@ void consoled_guest_rx(void)
=20
  out:
     spin_unlock(&rx_lock);
+
+    return 0;
 }
=20
 /* Sends a character into a domain's PV console */
-void consoled_guest_tx(char c)
+int consoled_guest_tx(char c)
 {
     XENCONS_RING_IDX cons, prod;
=20
     if ( !cons_ring )
-        return;
+        return -ENODEV;
=20
     cons =3D ACCESS_ONCE(cons_ring->in_cons);
     prod =3D cons_ring->in_prod;
@@ -125,6 +127,13 @@ void consoled_guest_tx(char c)
  notify:
     /* Always notify the guest: prevents receive path from getting stuck. =
*/
     pv_shim_inject_evtchn(pv_console_evtchn());
+
+    return 0;
+}
+
+bool consoled_is_enabled(void)
+{
+    return pv_shim && pv_console;
 }
=20
 /*
diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index bd7ab6329e..52a1358bea 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -1,14 +1,36 @@
-#ifndef __XEN_CONSOLED_H__
-#define __XEN_CONSOLED_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN__CONSOLED_H
+#define XEN__CONSOLED_H
=20
 #include <public/io/console.h>
=20
+#ifdef CONFIG_PV_SHIM
+
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
-void consoled_guest_rx(void);
-void consoled_guest_tx(char c);
+int consoled_guest_rx(void);
+int consoled_guest_tx(char c);
+bool consoled_is_enabled(void);
=20
-#endif /* __XEN_CONSOLED_H__ */
+#else
+
+static inline int consoled_guest_rx(void)
+{
+    ASSERT_UNREACHABLE();
+    return -ENODEV;
+}
+
+static inline int consoled_guest_tx(char c)
+{
+    ASSERT_UNREACHABLE();
+    return -ENODEV;
+}
+
+#define consoled_is_enabled()   (false)
+
+#endif /* CONFIG_PV_SHIM */
+
+#endif /* XEN__CONSOLED_H */
 /*
  * Local variables:
  * mode: C
--=20
2.34.1




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7641A3956E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 09:32:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891134.1300221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkJ1Q-0000ys-SQ; Tue, 18 Feb 2025 08:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891134.1300221; Tue, 18 Feb 2025 08:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkJ1Q-0000wQ-PA; Tue, 18 Feb 2025 08:32:04 +0000
Received: by outflank-mailman (input) for mailman id 891134;
 Tue, 18 Feb 2025 08:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dD1M=VJ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tkJ1O-0000wJ-54
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 08:32:03 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ed3c8e-edd2-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 09:31:59 +0100 (CET)
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
X-Inumbo-ID: d1ed3c8e-edd2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qa7lmzhflrgb3lcnf443tqr4sq.protonmail; t=1739867518; x=1740126718;
	bh=gerNu6CMr9u8/WvLNlYmlhDtV192ZjUBtdFRXO3fCug=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=dHZUq+n4nLYGKk+0dD8sOeD7twOOSlqUDJDpCXOcSvsNaYsd1PYDfNxlB6ARj3Nsu
	 QJ1h/ueZ7f4fGnNR5taXei7nvxv7r7hoxVXTgJ+89MPb8YFERkcufmwp2KfCPeJ/g0
	 eVrfK/z/LzkKUrZKJxnEAvrJslheZSv8TI4ThcMtc9EsHOqSgSPdxAWzIvRrCs8zzS
	 8YFdHZmyFwazmgxMMJP8N1tZ5ZG6m0KO6HeynaJDAxck1AlPnl4pm+HjG3zWa4uR8c
	 o2C86dcoqVusaSGkeHpnnlDsxo06FeF+tFZLEJ7KM52lwbV1puRgk+1z1HeigUTRu3
	 LBrnLnoiIHe3A==
Date: Tue, 18 Feb 2025 08:31:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/console: introduce console_{get,put}_domain()
Message-ID: <20250218083048.596012-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a378a0ab6d8bba07b7ffea7e89c659563cd7b5c4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

console_input_domain() takes an RCU lock to protect domain structure.
That implies call to rcu_unlock_domain() after use.

Introduce a pair of console_get_domain() / console_put_domain() to highligh=
t
the correct use of the call within the code interacting with Xen console
driver.

The new calls used in __serial_rx(), which also fixed console forwarding to
late hardware domains which run with domain IDs different from 0.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Link to the original patch:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-4-c5d36b31d=
66c@ford.com/
---
 xen/arch/arm/vpl011.c      |  6 ++---
 xen/drivers/char/console.c | 53 +++++++++++++++++++-------------------
 xen/include/xen/console.h  |  3 ++-
 3 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index c72f3778bf..66047bf33c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -78,7 +78,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8=
_t data)
     unsigned long flags;
     struct vpl011 *vpl011 =3D &d->arch.vpl011;
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
-    struct domain *input =3D console_input_domain();
+    struct domain *input =3D console_get_domain();
=20
     VPL011_LOCK(d, flags);
=20
@@ -123,8 +123,8 @@ static void vpl011_write_data_xen(struct domain *d, uin=
t8_t data)
     vpl011_update_interrupt_status(d);
=20
     VPL011_UNLOCK(d, flags);
-    if ( input !=3D NULL )
-        rcu_unlock_domain(input);
+
+    console_put_domain(input);
 }
=20
 /*
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2e23910dfa..992b37962e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -474,15 +474,18 @@ static unsigned int __read_mostly console_rx =3D 0;
=20
 #define max_console_rx (max_init_domid + 1)
=20
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-/* Make sure to rcu_unlock_domain after use */
-struct domain *console_input_domain(void)
+struct domain *console_get_domain(void)
 {
     if ( console_rx =3D=3D 0 )
             return NULL;
     return rcu_lock_domain_by_id(console_rx - 1);
 }
-#endif
+
+void console_put_domain(struct domain *d)
+{
+    if ( d )
+        rcu_unlock_domain(d);
+}
=20
 static void switch_serial_input(void)
 {
@@ -528,12 +531,18 @@ static void switch_serial_input(void)
=20
 static void __serial_rx(char c)
 {
-    switch ( console_rx )
-    {
-    case 0:
+    struct domain *d;
+    int rc =3D 0;
+
+    if ( console_rx =3D=3D 0 )
         return handle_keypress(c, false);
=20
-    case 1:
+    d =3D console_get_domain();
+    if ( !d )
+        return;
+
+    if ( is_hardware_domain(d) )
+    {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
@@ -546,31 +555,23 @@ static void __serial_rx(char c)
          * getting stuck.
          */
         send_global_virq(VIRQ_CONSOLE);
-        break;
-
+    }
 #ifdef CONFIG_SBSA_VUART_CONSOLE
-    default:
-    {
-        struct domain *d =3D rcu_lock_domain_by_id(console_rx - 1);
-
-        if ( d )
-        {
-            int rc =3D vpl011_rx_char_xen(d, c);
-            if ( rc )
-                guest_printk(d, XENLOG_G_WARNING
-                                "failed to process console input: %d\n", r=
c);
-            rcu_unlock_domain(d);
-        }
-
-        break;
-    }
+    else
+        /* Deliver input to the emulated UART. */
+        rc =3D vpl011_rx_char_xen(d, c);
 #endif
-    }
=20
 #ifdef CONFIG_X86
     if ( pv_shim && pv_console )
         consoled_guest_tx(c);
 #endif
+
+    if ( rc )
+        guest_printk(d, XENLOG_G_WARNING
+                        "failed to process console input: %d\n", rc);
+
+    console_put_domain(d);
 }
=20
 static void cf_check serial_rx(char c)
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index c4650231be..83cbc9fbda 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -32,7 +32,8 @@ void console_end_sync(void);
 void console_start_log_everything(void);
 void console_end_log_everything(void);
=20
-struct domain *console_input_domain(void);
+struct domain *console_get_domain(void);
+void console_put_domain(struct domain *d);
=20
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.
--=20
2.34.1




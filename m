Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42737AA88E7
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 20:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975647.1363028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrY-0002p0-Ve; Sun, 04 May 2025 18:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975647.1363028; Sun, 04 May 2025 18:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrY-0002mx-Rz; Sun, 04 May 2025 18:14:52 +0000
Received: by outflank-mailman (input) for mailman id 975647;
 Sun, 04 May 2025 18:14:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwa9=XU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uBdrY-00024w-4r
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 18:14:52 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2f3b1e-2913-11f0-9ffb-bf95429c2676;
 Sun, 04 May 2025 20:14:48 +0200 (CEST)
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
X-Inumbo-ID: aa2f3b1e-2913-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1746382488; x=1746641688;
	bh=vUW5r0Dl4Az223I5ofUyyuhJuLavlDSA1r91qpjTtqk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Cgsmta8guD4iZs6Mf+h7p4LB2Fqdl36V5qrd5awhBm/r6nayLekwyG2WRZSgnSA2H
	 r4X5clAP8ofx73yBu0E/NiFQuK1erQ1ThhfNDY1lxTgguVU9K4JBmJsa31KuG115z2
	 kLKoJ45IjRQzjmHyf6XcMt5QSNRrWFTiKTG09/iO5XFGsoeVy4YO+FPCzS06eJ9JGd
	 t7sIkgxWvgSI1M/vH51f5zLwNitfAl4qQQeSGdlflC+KbCcTwQqP6fXU5sHLwIfhA6
	 WEXkQLGgpvO1JGgvLhgA7rNOueFGapvysZVKRlgSpnEKCcbUJJBQhtU4HmMQumRjgL
	 50gZxore81ZuQ==
Date: Sun, 04 May 2025 18:14:45 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 3/3] xen/console: introduce conring_flush()
Message-ID: <20250504181423.2302345-4-dmukhin@ford.com>
In-Reply-To: <20250504181423.2302345-1-dmukhin@ford.com>
References: <20250504181423.2302345-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 83ee07173b30a3d7b88373a024dce807b7062f3a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce conring_flush() to ensure all messages kept in the internal
console ring are sent to all physical consoles (serial, VGA (x86))
after their initialization is completed.

Rename dump_console_ring_key to conring_dump_keyhandler to match the
notation for conring management symbols.

Resolves: https://gitlab.com/xen-project/xen/-/issues/184
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v2:
- Kept Stefano's R-b
---
 xen/drivers/char/console.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index b788427aa5..a089d6e292 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -455,23 +455,19 @@ void console_serial_puts(const char *s, size_t nr)
         serial_puts(sercon_handle, s, nr);
 }
=20
-static void cf_check dump_console_ring_key(unsigned char key)
+/*
+ * Flush contents of the conring to the physical console devices.
+ */
+static int conring_flush(void)
 {
     uint32_t idx, len, sofar, c;
     unsigned int order;
     char *buf;
=20
-    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
-
-    /* create a buffer in which we'll copy the ring in the correct
-       order and NUL terminate */
     order =3D get_order_from_bytes(conring_size + 1);
     buf =3D alloc_xenheap_pages(order, 0);
     if ( buf =3D=3D NULL )
-    {
-        printk("unable to allocate memory!\n");
-        return;
-    }
+        return -ENOMEM;
=20
     c =3D conringc;
     sofar =3D 0;
@@ -489,6 +485,18 @@ static void cf_check dump_console_ring_key(unsigned ch=
ar key)
     console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
=20
     free_xenheap_pages(buf, order);
+
+    return 0;
+}
+
+static void cf_check conring_dump_keyhandler(unsigned char key)
+{
+    int rc;
+
+    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
+    rc =3D conring_flush();
+    if ( rc )
+        printk("failed to dump console ring buffer: %d\n", rc);
 }
=20
 /*
@@ -1058,6 +1066,9 @@ void __init console_init_preirq(void)
     serial_set_rx_handler(sercon_handle, serial_rx);
     pv_console_set_rx_handler(serial_rx);
=20
+    /* NB: send conring contents to all enabled physical consoles, if any =
*/
+    conring_flush();
+
     /* HELLO WORLD --- start-of-day banner text. */
     nrspin_lock(&console_lock);
     __putstr(xen_banner());
@@ -1148,7 +1159,7 @@ void __init console_endboot(void)
     if ( opt_conswitch[1] =3D=3D 'x' )
         console_rx =3D max_console_rx;
=20
-    register_keyhandler('w', dump_console_ring_key,
+    register_keyhandler('w', conring_dump_keyhandler,
                         "synchronously dump console ring buffer (dmesg)", =
0);
     register_irq_keyhandler('+', &do_inc_thresh,
                             "increase log level threshold", 0);
--=20
2.34.1




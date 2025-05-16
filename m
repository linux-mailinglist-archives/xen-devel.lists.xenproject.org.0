Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B4AB93AB
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 03:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986098.1371790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFjzT-0005sU-Gm; Fri, 16 May 2025 01:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986098.1371790; Fri, 16 May 2025 01:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFjzT-0005ou-CT; Fri, 16 May 2025 01:35:59 +0000
Received: by outflank-mailman (input) for mailman id 986098;
 Fri, 16 May 2025 01:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=07xk=YA=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uFjzS-0004qs-5b
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 01:35:58 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ce2e1bb-31f6-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 03:35:56 +0200 (CEST)
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
X-Inumbo-ID: 1ce2e1bb-31f6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=pssu35x7p5ei7ltfjlh3oyl46y.protonmail; t=1747359355; x=1747618555;
	bh=v1HpdEG9MwONSRwSXD9E5J2+52J+MPn8gkPntIhkjwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=PBYDAOznvDuTZz4SSTmfUdkVL/E0P1cZQXE/0vlwK4C9bb1H9A28onnL4W8pIoFiH
	 u3N1USZ6/cWiv6OI2Uq7Bi+8HwVupnWvO/o/bjFfjf2wwgdqtUgJ5lvl0JlRdTt01e
	 KZRotpf2/apGAh1uHdA3jNdbPxPOBAxdeO5dCZdzCHSF9ZgA4n0rNrBwVPCuoJIS6W
	 9eMQXAuFrlKyoXRcSZ+GB3AcrY+urTQY7IJ8MUyTUUi4K4QvShNRLx/Ag5Mv/5oI15
	 35pFOfQZouvKixOj+wU/ACNUCRV6YpLso4pt9qy6V0GayCF1B4+y8tLKijmJErO7qF
	 FJIY2fXykC9fA==
Date: Fri, 16 May 2025 01:35:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 3/3] xen/console: introduce conring_flush()
Message-ID: <20250516013508.1144162-4-dmukhin@ford.com>
In-Reply-To: <20250516013508.1144162-1-dmukhin@ford.com>
References: <20250516013508.1144162-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ea23409224c8193f8ec1cd1eb166cd5e784b9da8
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
Changes since v3:
- rebased, kept R-b
---
 xen/drivers/char/console.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 3420e9630a..a3b59a7ffc 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -452,23 +452,19 @@ void console_serial_puts(const char *s, size_t nr)
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
@@ -486,6 +482,18 @@ static void cf_check dump_console_ring_key(unsigned ch=
ar key)
     console_send(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
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




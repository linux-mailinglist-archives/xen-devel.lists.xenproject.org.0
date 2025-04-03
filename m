Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7716A79933
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 02:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936150.1337479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086S-0002dO-Jb; Thu, 03 Apr 2025 00:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936150.1337479; Thu, 03 Apr 2025 00:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086S-0002aj-FZ; Thu, 03 Apr 2025 00:06:40 +0000
Received: by outflank-mailman (input) for mailman id 936150;
 Thu, 03 Apr 2025 00:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u086R-000234-AB
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 00:06:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 830b6832-101f-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 02:06:37 +0200 (CEST)
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
X-Inumbo-ID: 830b6832-101f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lluhb2firrddhpi264e3pc4bsy.protonmail; t=1743638797; x=1743897997;
	bh=GYrF79Lky+t8pJBLpkLDqHS5mjT9sR3p7CaY+cQEX88=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GjjTpaza1P+1T0MBPu3LhQ4JPYAc/JiUfL5MOerA+xFcmNwv6vGJit7Ht90Kshu/I
	 K3EWULEH/Pz8AaYQAjS3CbXlzavFt5Tbs7ZMFz8aQ7hPSuBcLzyPmo34WFPUxeOZCi
	 Txoy3EEzjK5fGMlwGyc7gTSOSBsj8hwcNJ1nIMueHRWq8OYycYlspL8xCAg6yQMrAV
	 gnp5mtxlebkEZ+/sElzxhJW+TsKkFMlfB1umiEiNlr6hgBGg+VMOhCqdlsv2PMLC7D
	 dc3hguy/FuQ4XnkFitHEOwOrTf7RO0lnHK3MO1wYLIJN4NqoXkPpMIVOj6x6aaa+Ab
	 T8OQvn3y1i2JA==
Date: Thu, 03 Apr 2025 00:06:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 3/3] xen/console: introduce conring_flush()
Message-ID: <20250403000604.169619-4-dmukhin@ford.com>
In-Reply-To: <20250403000604.169619-1-dmukhin@ford.com>
References: <20250403000604.169619-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9f9887882ae5bbc02fc76b68206c9230209cbb57
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce conring_flush() to ensure all messages kept in the internal
console ring are sent to all physical consoles (serial, VGA (x86))
after their initialization is completed.

Resolves: https://gitlab.com/xen-project/xen/-/issues/184
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
The patch conflicts with
  https://lore.kernel.org/xen-devel/20250331230508.440198-7-dmukhin@ford.co=
m/
in console_init_preirq()
---
 xen/drivers/char/console.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2618c2e47d..18eb66df89 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -446,24 +446,22 @@ void console_serial_puts(const char *s, size_t nr)
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
+    unsigned long flags;
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
+    flags =3D console_lock_recursive_irqsave();
     c =3D conringc;
     sofar =3D 0;
     while ( (c !=3D conringp) )
@@ -478,8 +476,21 @@ static void cf_check dump_console_ring_key(unsigned ch=
ar key)
     }
=20
     console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
+    console_unlock_recursive_irqrestore(flags);
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
@@ -1044,6 +1055,9 @@ void __init console_init_preirq(void)
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
@@ -1134,7 +1148,7 @@ void __init console_endboot(void)
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




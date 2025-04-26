Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7BA9DCCA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 20:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969289.1358470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kcB-0002eB-Qh; Sat, 26 Apr 2025 18:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969289.1358470; Sat, 26 Apr 2025 18:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kcB-0002bR-N3; Sat, 26 Apr 2025 18:51:03 +0000
Received: by outflank-mailman (input) for mailman id 969289;
 Sat, 26 Apr 2025 18:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8kcA-0001Xu-RJ
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 18:51:02 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ed2e56-22cf-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 20:51:01 +0200 (CEST)
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
X-Inumbo-ID: 65ed2e56-22cf-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745693460; x=1745952660;
	bh=2tSWIB/j3K1mPH/6nfOFSlv3PolnyH7aoGT1opO+DMs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gV7RmlORt0wUAM+lhrNTJP9lmdKoqI01ezCSZmKQmEwq598V0J0HPEFq7zyBuPQ/b
	 Y/sbW3AFFj71QYcHL8LZWzKj/GWWLnTjGpj1IYdQGcBhP8Vz/3MbQMS0wRdRGUaVzB
	 LFkgO6/n9l1H9VDUMCX6MeXFyI1wITMnmI5INymBh5z3HQf9xuRIfLl7oFaOwerPcV
	 RiyObNaVFun8rDqlD4YfhBFqlMJTWEh4GDk9r1gucY6dpbxkR1JhLFhNVdhX2y5rhD
	 GUwA7MVQLtFUyAoYE3DPoi2MaClSQoZTlMDIXmLwe9/irw0mZ+tr5NAuv5GpLE+P93
	 tJzRejX6UYf6w==
Date: Sat, 26 Apr 2025 18:50:55 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 3/3] xen/console: introduce conring_flush()
Message-ID: <20250426185021.100646-4-dmukhin@ford.com>
In-Reply-To: <20250426185021.100646-1-dmukhin@ford.com>
References: <20250426185021.100646-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2c3e2e974058430ecb216114d79e1d55f82ae312
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
Changes v1->v2:
- rebased
---
 xen/drivers/char/console.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 8f882a47d1..8e5fc6c58c 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -446,24 +446,20 @@ void console_serial_puts(const char *s, size_t nr)
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
     unsigned long flags;
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
     flags =3D console_lock_recursive_irqsave();
=20
@@ -485,6 +481,18 @@ static void cf_check dump_console_ring_key(unsigned ch=
ar key)
     console_unlock_recursive_irqrestore(flags);
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
@@ -1049,6 +1057,9 @@ void __init console_init_preirq(void)
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
@@ -1139,7 +1150,7 @@ void __init console_endboot(void)
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




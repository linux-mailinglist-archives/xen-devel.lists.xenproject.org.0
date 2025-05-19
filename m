Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF27ABC7F5
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990224.1374193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Lr-0005KO-Md; Mon, 19 May 2025 19:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990224.1374193; Mon, 19 May 2025 19:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Lr-0005Hg-Ih; Mon, 19 May 2025 19:40:43 +0000
Received: by outflank-mailman (input) for mailman id 990224;
 Mon, 19 May 2025 19:40:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6Lq-0004Yu-1h
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:40:42 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252dea66-34e9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 21:40:40 +0200 (CEST)
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
X-Inumbo-ID: 252dea66-34e9-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747683640; x=1747942840;
	bh=EAvg6x50bg20eIZqOFil9Se5UOlbAx31iaaUVq/HpdY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Ev4PjXE7PyD0grGId7W9taT1FuVEdPiZirMgKVTGVY+8TwkrzDek4+OF59a0ozQV6
	 VTxc8y2ButkY/MOHfoHu7RIYQ3vIsSZ0zUUPqYJGRnxznvMkcvG5/ChwVTEIGyTLvD
	 kZhZSlz6AcuD4amEedJW0xVKFdWyeYj/DcpGuONKHx8eWi1P83OsUwjssi8lS5H3uS
	 YrWVzYjp1W18y9A8mMrqBbD19puBM1XzWUM+orUEVD4+4dhqIINutfOB8zcLm2QjHZ
	 zSEb/sUF5qTtuqKy2vsnvqjISRdAHW2ZyuWUb60NQ2lb9sufdEqj7j57QL6zOjc9aD
	 XgbavepjKTesg==
Date: Mon, 19 May 2025 19:40:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 3/3] xen/console: introduce conring_flush()
Message-ID: <20250519194002.1365454-4-dmukhin@ford.com>
In-Reply-To: <20250519194002.1365454-1-dmukhin@ford.com>
References: <20250519194002.1365454-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 90728fbabf71f26f6fddcaa378fb988e2f88143e
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
Changes since v4:
- kept R-b
---
 xen/drivers/char/console.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0c0cc6677c..c15987f5bb 100644
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
@@ -1060,6 +1068,9 @@ void __init console_init_preirq(void)
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
@@ -1150,7 +1161,7 @@ void __init console_endboot(void)
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




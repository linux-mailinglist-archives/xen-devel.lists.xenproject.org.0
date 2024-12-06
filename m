Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063479E668E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849724.1264309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQQc-00078Q-RC; Fri, 06 Dec 2024 04:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849724.1264309; Fri, 06 Dec 2024 04:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQQc-00075H-Nu; Fri, 06 Dec 2024 04:58:58 +0000
Received: by outflank-mailman (input) for mailman id 849724;
 Fri, 06 Dec 2024 04:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA8-0004Kb-0Y
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64345bc6-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 753495C7328;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1675AC4CEE4;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA64E77173;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 64345bc6-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=pfeozTwM0lG3guW16R9YEzvHJZviJlXoXV1tkNollME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f6gF7PdCGex8zQ5mnanBXlfimZN+yyf9wVHGpLH0v6ONU5aF1nyYf9uODenzHMjZg
	 o7TVTyUr8MFFtqHsow6MDgvfsSCOEz9yXNXR4dOtTCuxIAZbKan3DSLU2yquYO7qp8
	 uY9B1aNpIuM2d8MvvF8szQdybnNboU4qdnHckcUhTtBFkU7RpNYDNDrEGd4DKh0TFS
	 98HivOcZfVQBNf2kz83KBaurJrL0Im3fLndLTxxr/PO4vTfPWk84Cvixwi4y3PH4My
	 GB7dHoXVLHiCIkByOrbVTRlPToks8znvhQwux0BcsAlLqSbrNYF+01+J3FrNbLUrRT
	 I22VL57Iv98zg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:57 -0800
Subject: [PATCH v2 27/35] xen/console: flush console ring to physical
 console
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-27-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=3110;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=9P4Y8stZ3v9veFAxdHp9EFeTfuXrbjGeXMl4yBrDrRM=;
 b=LcDAXG+yR65ns4PDQ7+Ep0c/twONKtCO6FP3OyvFTTqVtifqgbIkwSkeCUfa9psmIj3lFPPnM
 83h3+UYJFZ4D7QPLSxSZewJhQFIyiw2yPpSDbEylErgaWgtM7WS39IF
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Messages printed before the serial and VGA consoles are initialized end up in
the internal console buffer (conring). Flush contents of conring to all
external consoles after external consoles are fully initialied.

Link: https://gitlab.com/xen-project/xen/-/issues/184
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 54 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 581ee22b85302a54db5b9d5d28e8b2d689d31403..a26daee9c4c4b1134d0ae3d105ffdb656340b6df 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -426,23 +426,35 @@ void console_serial_puts(const char *s, size_t nr)
     pv_console_puts(s, nr);
 }
 
-static void cf_check dump_console_ring_key(unsigned char key)
+/*
+ * Write characters to physical console(s).
+ * That covers:
+ * - serial console;
+ * - video output.
+ */
+static void console_puts(const char *str, size_t len)
+{
+    ASSERT(rspin_is_locked(&console_lock));
+
+    console_serial_puts(str, len);
+    video_puts(str, len);
+}
+
+/*
+ * Flush contents of the conring to the physical console devices.
+ */
+static int console_flush(void)
 {
     uint32_t idx, len, sofar, c;
     unsigned int order;
     char *buf;
 
-    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
-
-    /* create a buffer in which we'll copy the ring in the correct
-       order and NUL terminate */
     order = get_order_from_bytes(conring_size + 1);
     buf = alloc_xenheap_pages(order, 0);
     if ( buf == NULL )
-    {
-        printk("unable to allocate memory!\n");
-        return;
-    }
+        return -ENOMEM;
+
+    nrspin_lock_irq(&console_lock);
 
     c = conringc;
     sofar = 0;
@@ -457,10 +469,23 @@ static void cf_check dump_console_ring_key(unsigned char key)
         c += len;
     }
 
-    console_serial_puts(buf, sofar);
-    video_puts(buf, sofar);
+    console_puts(buf, sofar);
+
+    nrspin_unlock_irq(&console_lock);
 
     free_xenheap_pages(buf, order);
+
+    return 0;
+}
+
+static void cf_check dump_console_ring_key(unsigned char key)
+{
+    int rc;
+
+    printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
+    rc = console_flush();
+    if ( rc )
+        printk("failed to dump console ring buffer: %d\n", rc);
 }
 
 /*
@@ -707,10 +732,7 @@ static inline void xen_console_write(const char *str, size_t len)
  */
 static void console_write(const char *str, size_t len)
 {
-    ASSERT(rspin_is_locked(&console_lock));
-
-    console_serial_puts(str, len);
-    video_puts(str, len);
+    console_puts(str, len);
 
     if ( opt_console_xen )
         xen_console_write(str, len);
@@ -1177,6 +1199,8 @@ void __init console_endboot(void)
 
     video_endboot();
 
+    /* NB: send conring contents to all enabled physical consoles, if any */
+    console_flush();
     use_conring = opt_console_to_ring;
     smp_wmb();
 

-- 
2.34.1




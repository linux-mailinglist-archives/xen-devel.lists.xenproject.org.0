Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC2D3BBC3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 00:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208362.1520542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhyhu-0003CZ-8t; Mon, 19 Jan 2026 23:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208362.1520542; Mon, 19 Jan 2026 23:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhyhu-0003AB-5l; Mon, 19 Jan 2026 23:30:50 +0000
Received: by outflank-mailman (input) for mailman id 1208362;
 Mon, 19 Jan 2026 23:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIhq=7Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vhyhs-0003A5-3x
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 23:30:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1316c65-f58e-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 00:30:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B036600CB;
 Mon, 19 Jan 2026 23:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3F8C116C6;
 Mon, 19 Jan 2026 23:30:43 +0000 (UTC)
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
X-Inumbo-ID: e1316c65-f58e-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768865445;
	bh=EN7ctvv9pHTp8U7XaRXHF3QmJYU6S5dpEJGH8sbixiY=;
	h=Date:From:To:cc:Subject:From;
	b=Oc5yBzMvIRA/1cNbKV4ip+iJw6NUBgRkDixeH/HU329KcUmS6WquRZkwoPcNxw3sz
	 TBdbvxfXyLbxbxfC7MPX0d0hcbfO2GyfwbJ6s5tcZsAUmSGE2xDes8m1ycevqSczoR
	 txeRmAqOeOq/9AMUZmSRCC7oNfAE8X3PjERj6RAM2nObIcTdU8PXn+bcQmyJOAjATl
	 GSfO2n2v+ON7p6O5FOiz8fjbFJosY4ufO5rKWIUMEbP1eg3+IfmeWQ+olblvvA4DPj
	 3ZrOhZ8UBuG6Yhqq4javndz9gQa8xlFyQQAPd9c0fSYR3UU7ubLpYc6Dj2yKrJqCF1
	 nBEq1QpdPqcSg==
Date: Mon, 19 Jan 2026 15:30:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, sstabellini@kernel.org, jbeulich@suse.com
Subject: [PATCH v4] xen/console: handle multiple domains using console_io
 hypercalls
Message-ID: <alpine.DEB.2.22.394.2601191529190.7192@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Allow multiple dom0less domains to use the console_io hypercalls to
print to the console. Handle them in a similar way to vpl011: only the
domain which has focus can read from the console. All domains can write
to the console but the ones without focus have a prefix. In this case
the prefix is applied by using guest_printk instead of printk or
console_puts which is what the original code was already doing.

When switching focus using Ctrl-AAA, discard any unread data in the
input buffer. Input is read quickly and the user would be aware of it
being slow or stuck as they use Ctrl-AAA to switch focus domain.
In that situation, it is to be expected that the unread input is lost.

The domain writes are buffered when the domain is not in focus. Push out
the buffer when the domain enters focus.

Add the console_lock around serial_rx_prod and serial_rx_cons
modifications to protect it against concurrent writes to it. Also
protect against changes of domain with focus while reading from the
serial.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v4:
- protect serial_rx_prod and serial_rx_cons with console_lock
- protect CONSOLEIO_read against concurrent changes of the focus domain
- if vpl011 is enabled, send characters to it (retains current behavior
  on ARM)
---
 xen/drivers/char/console.c | 52 ++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7b176da71a..acfc49d558 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -574,8 +574,12 @@ static void console_switch_input(void)
             if ( !d->console.input_allowed )
                 continue;
 
-            console_rx = next_rx;
             printk("*** Serial input to DOM%u", domid);
+            nrspin_lock_irq(&console_lock);
+            console_rx = next_rx;
+            /* Don't let the next dom read the previous dom's unread data. */
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             break;
         }
     }
@@ -594,10 +598,22 @@ static void __serial_rx(char c)
     if ( console_rx == 0 )
         return handle_keypress(c, false);
 
+    nrspin_lock_irq(&console_lock);
     d = console_get_domain();
     if ( !d )
+    {
+        nrspin_unlock_irq(&console_lock);
         return;
+    }
 
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+    /* Prioritize vpl011 if enabled for this domain */
+    if ( d->arch.vpl011.base_addr )
+    {
+        /* Deliver input to the emulated UART. */
+        rc = vpl011_rx_char_xen(d, c);
+    } else
+#endif
     if ( is_hardware_domain(d) || IS_ENABLED(CONFIG_DOM0LESS_BOOT) )
     {
         /*
@@ -613,11 +629,6 @@ static void __serial_rx(char c)
          */
         send_guest_domain_virq(d, VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    else
-        /* Deliver input to the emulated UART. */
-        rc = vpl011_rx_char_xen(d, c);
-#endif
 
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
@@ -629,6 +640,7 @@ static void __serial_rx(char c)
                      rc);
 
     console_put_domain(d);
+    nrspin_unlock_irq(&console_lock);
 }
 
 static void cf_check serial_rx(char c)
@@ -729,6 +741,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain *input;
 
     while ( count > 0 )
     {
@@ -741,17 +754,26 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        nrspin_lock_irq(&console_lock);
+        input = console_get_domain();
+        if ( input && cd == input )
         {
+            if ( cd->pbuf_idx )
+            {
+                console_send(cd->pbuf, cd->pbuf_idx, flags);
+                cd->pbuf_idx = 0;
+            }
             /* Use direct console output as it could be interactive */
-            nrspin_lock_irq(&console_lock);
             console_send(kbuf, kcount, flags);
+            console_put_domain(input);
             nrspin_unlock_irq(&console_lock);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
 
+            console_put_domain(input);
+            nrspin_unlock_irq(&console_lock);
             /* Strip non-printable characters */
             do
             {
@@ -793,6 +815,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    struct domain *d;
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -813,6 +836,15 @@ long do_console_io(
         if ( count > INT_MAX )
             break;
 
+        nrspin_lock_irq(&console_lock);
+        d = console_get_domain();
+        if ( d != current->domain )
+        {
+            console_put_domain(d);
+            nrspin_unlock_irq(&console_lock);
+            return 0;
+        }
+
         rc = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
@@ -825,11 +857,15 @@ long do_console_io(
             if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
             {
                 rc = -EFAULT;
+                console_put_domain(d);
+                nrspin_unlock_irq(&console_lock);
                 break;
             }
             rc += len;
             serial_rx_cons += len;
         }
+        console_put_domain(d);
+        nrspin_unlock_irq(&console_lock);
         break;
     default:
         rc = -ENOSYS;
-- 
2.25.1



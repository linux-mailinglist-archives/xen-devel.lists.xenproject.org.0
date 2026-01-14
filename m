Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F0D1BD46
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 01:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202417.1517990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfovd-0005wg-OK; Wed, 14 Jan 2026 00:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202417.1517990; Wed, 14 Jan 2026 00:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfovd-0005vp-Jw; Wed, 14 Jan 2026 00:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1202417;
 Wed, 14 Jan 2026 00:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5XS=7T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfovc-0005bB-4s
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 00:40:04 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f7bb6a5-f0e1-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 01:40:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9547540765;
 Wed, 14 Jan 2026 00:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA606C116C6;
 Wed, 14 Jan 2026 00:39:58 +0000 (UTC)
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
X-Inumbo-ID: 8f7bb6a5-f0e1-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768351200;
	bh=btgGbUV4PFGAKSPjJqxJj29N51HHpBgWuBJBYCxGcd4=;
	h=Date:From:To:cc:Subject:From;
	b=uUf2rLvXuQ4EeK4M3x9d8DFpBY8tiB1S5ZHaSUoDX7hhHpe35qj2pM9yfpJRLIpGH
	 JcUXKCpEPlw1hGVf5bnuM3RzyfPM9k39dZ/scLdsvEIUCXhNhfjiUsYIbz7fZv0JBy
	 GzTDna79TRCIgVndAM4/vn2ZQzi8exGIOpuTOP025Dv8ND0KjaWEGKMMDTg5gCOLy+
	 RjztMKkJjyAaHrAUm4njW85UlpePWiRC1qXcmmFsbqAaLoCGkDqfY41bY2ZfInpIJH
	 8DLAdawnRDUH8xx2YNSZ7eQE9dF45k9DdBbD9TZIksBjv9YFhaq8g8NRJ8bxzSPNds
	 9jEJbiGrgMYMw==
Date: Tue, 13 Jan 2026 16:39:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: jbeulich@suse.com, Stefano Stabellini <sstabellini@kernel.org>, 
    grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com
Subject: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
Message-ID: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop>
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

Add the console_lock around serial_rx_cons modifications to protect it
against concurrent writes to it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- move serial_rx_cons before printk
- call console_put_domain earlier on CONSOLEIO_read
- take console_lock earlier
- add console_lock around serial_rx_cons modifications

Changes in v2:
- fix code style
- pbuf_idx/idx after ada53067083e
- don't add extra \0
- clear input on console switch
---
 xen/drivers/char/console.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb4..58c32f22ef 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -577,6 +577,10 @@ static void console_switch_input(void)
 
             console_rx = next_rx;
             printk("*** Serial input to DOM%u", domid);
+            /* Don't let the next dom read the previous dom's unread data. */
+            nrspin_lock_irq(&console_lock);
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             break;
         }
     }
@@ -730,6 +734,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain *input;
 
     while ( count > 0 )
     {
@@ -742,18 +747,28 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        input = console_get_domain();
+        if ( input && cd == input )
         {
-            /* Use direct console output as it could be interactive */
+            struct domain_console *cons = cd->console;
+
             nrspin_lock_irq(&console_lock);
+            if ( cons->idx )
+            {
+                console_send(cons->buf, cons->idx, flags);
+                cons->idx = 0;
+            }
+            /* Use direct console output as it could be interactive */
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
+            console_put_domain(input);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
             struct domain_console *cons = cd->console;
 
+            console_put_domain(input);
             /* Strip non-printable characters */
             do
             {
@@ -795,6 +810,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    struct domain *d;
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -815,6 +831,11 @@ long do_console_io(
         if ( count > INT_MAX )
             break;
 
+        d = console_get_domain();
+        console_put_domain(d);
+        if ( d != current->domain )
+            return 0;
+
         rc = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
@@ -830,7 +851,10 @@ long do_console_io(
                 break;
             }
             rc += len;
-            serial_rx_cons += len;
+            nrspin_lock_irq(&console_lock);
+            if ( serial_rx_cons != serial_rx_prod )
+                serial_rx_cons += len;
+            nrspin_unlock_irq(&console_lock);
         }
         break;
     default:
-- 
2.25.1



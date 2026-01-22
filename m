Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SItkOxR/cWmnIAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 02:36:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F34F60648
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 02:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210329.1522050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vijbF-0000IS-03; Thu, 22 Jan 2026 01:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210329.1522050; Thu, 22 Jan 2026 01:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vijbE-0000FH-R3; Thu, 22 Jan 2026 01:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1210329;
 Thu, 22 Jan 2026 01:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZz6=73=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vijbC-0000F9-Qa
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 01:35:02 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9012099c-f732-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 02:35:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E274E40448;
 Thu, 22 Jan 2026 01:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C066C4CEF1;
 Thu, 22 Jan 2026 01:34:56 +0000 (UTC)
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
X-Inumbo-ID: 9012099c-f732-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769045697;
	bh=YmwG5XqwcJY3E9hnlisguppPgD11x4/SdCrdc5SMDE8=;
	h=Date:From:To:cc:Subject:From;
	b=btAfPPcshxTpTna23/cM20kqvtSxSLOlVArYCiRJKF9D2yfBGpenN9/RUHaJmHJrh
	 IpcPK4hXySGIkaA6UXA+KjrwUp6ApcD53wnmapMGSCu2Glfxvl9w5EeHiG3M09PNwY
	 giLZmDJtdyTIzNRj7PVYv0fwbCojMo1yLTq8JLBw3wA+KetIcS+Y1NTgQsThbvqgXY
	 6LdjUUhMFrzr3lYPASjrYtz9ilEafHJ0NZNvur4s+ji/Cj3RrJvrYSIXkgReE5ETwu
	 E9gfsVvpiuyLXuxfv4xFylZuOiKbIzXJdkA65KmG+PtevOdudaTqf+7MWoGKBALxKX
	 Gg9DgEOAKcUVA==
Date: Wed, 21 Jan 2026 17:34:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, sstabellini@kernel.org, jbeulich@suse.com
Subject: [PATCH v6] xen/console: handle multiple domains using console_io
 hypercalls
Message-ID: <alpine.DEB.2.22.394.2601211733070.7192@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7F34F60648
X-Rspamd-Action: no action

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
the buffer after the domain enters focus on the first guest write.

Move the vpl011 check first so that if vpl011 is enabled, it will be
used. In the future, the is_hardware_domain path might also be used by
other predefined domains so it makes sense to prioritize vpl011 to
retain the current behavior on ARM.

Locking updates:

- Guard every mutation of serial_rx_cons/prod with console_lock and
discard unread input under the lock when switching focus (including when
returning to Xen) so that cross-domain reads can't see stale data

- Require is_focus_domain() callers to hold console_lock, and take that
lock around the entire CONSOLEIO_read loop, re-checking focus after each
chunk so a focus change simply stops further copies without duplicating
or leaking input

- Hold cd->pbuf_lock while flushing buffered writes in the focus path
so the direct-write fast path does not race buffered guests or HVM
debug output

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v6:
- moved locks out of console_get/put_domain
- reworked locking from the ground up
- introduced is_focus_domain
- improved commit message
---
 xen/drivers/char/console.c | 64 +++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb4..d586572c5e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -540,6 +540,11 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
 
+static bool is_focus_domain(struct domain *d)
+{
+    return d != NULL && d->domain_id == console_rx - 1;
+}
+
 static void console_switch_input(void)
 {
     unsigned int next_rx = console_rx;
@@ -555,8 +560,11 @@ static void console_switch_input(void)
 
         if ( next_rx++ >= max_console_rx )
         {
-            console_rx = 0;
             printk("*** Serial input to Xen");
+            nrspin_lock_irq(&console_lock);
+            console_rx = 0;
+            serial_rx_cons = serial_rx_prod;
+            nrspin_unlock_irq(&console_lock);
             break;
         }
 
@@ -575,8 +583,12 @@ static void console_switch_input(void)
 
             rcu_unlock_domain(d);
 
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
@@ -599,14 +611,25 @@ static void __serial_rx(char c)
     if ( !d )
         return;
 
+#ifdef CONFIG_SBSA_VUART_CONSOLE
+    /* Prioritize vpl011 if enabled for this domain */
+    if ( d->arch.vpl011.base_addr )
+    {
+        /* Deliver input to the emulated UART. */
+        rc = vpl011_rx_char_xen(d, c);
+    }
+    else
+#endif
     if ( is_hardware_domain(d) )
     {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
          */
+        nrspin_lock_irq(&console_lock);
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
+        nrspin_unlock_irq(&console_lock);
 
         /*
          * Always notify the hardware domain: prevents receive path from
@@ -614,11 +637,6 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    else
-        /* Deliver input to the emulated UART. */
-        rc = vpl011_rx_char_xen(d, c);
-#endif
 
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
@@ -730,6 +748,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain_console *cons = cd->console;
 
     while ( count > 0 )
     {
@@ -742,18 +761,25 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        spin_lock(&cons->lock);
+        nrspin_lock_irq(&console_lock);
+        if ( is_focus_domain(cd) )
         {
+            if ( cons->idx )
+            {
+                console_send(cons->buf, cons->idx, flags);
+                cons->idx = 0;
+            }
             /* Use direct console output as it could be interactive */
-            nrspin_lock_irq(&console_lock);
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
+            spin_unlock(&cons->lock);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
-            struct domain_console *cons = cd->console;
 
+            nrspin_unlock_irq(&console_lock);
             /* Strip non-printable characters */
             do
             {
@@ -765,7 +791,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             } while ( --kcount > 0 );
 
             *kout = '\0';
-            spin_lock(&cons->lock);
             kcount = kin - kbuf;
             if ( c != '\n' &&
                  (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
@@ -815,6 +840,13 @@ long do_console_io(
         if ( count > INT_MAX )
             break;
 
+        nrspin_lock_irq(&console_lock);
+        if ( !is_focus_domain(current->domain) )
+        {
+            nrspin_unlock_irq(&console_lock);
+            return 0;
+        }
+
         rc = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
@@ -824,14 +856,16 @@ long do_console_io(
                 len = SERIAL_RX_SIZE - idx;
             if ( (rc + len) > count )
                 len = count - rc;
+            nrspin_unlock_irq(&console_lock);
             if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
-            {
-                rc = -EFAULT;
-                break;
-            }
+                return -EFAULT;
             rc += len;
+            nrspin_lock_irq(&console_lock);
+            if ( !is_focus_domain(current->domain) )
+                break;
             serial_rx_cons += len;
         }
+        nrspin_unlock_irq(&console_lock);
         break;
     default:
         rc = -ENOSYS;
-- 
2.25.1



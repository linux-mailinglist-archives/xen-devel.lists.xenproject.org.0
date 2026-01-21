Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cChXM/UYcGkEVwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 01:08:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2D4E4F4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 01:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209368.1521401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viLkh-0000Io-WC; Wed, 21 Jan 2026 00:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209368.1521401; Wed, 21 Jan 2026 00:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viLkh-0000Gi-Ru; Wed, 21 Jan 2026 00:07:15 +0000
Received: by outflank-mailman (input) for mailman id 1209368;
 Wed, 21 Jan 2026 00:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5F9=72=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1viLkg-0000GX-5W
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 00:07:14 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213132a8-f65d-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 01:07:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D1EC4088D;
 Wed, 21 Jan 2026 00:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F533C16AAE;
 Wed, 21 Jan 2026 00:07:07 +0000 (UTC)
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
X-Inumbo-ID: 213132a8-f65d-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768954029;
	bh=L0X3vSYqtAqnjQdqjelUxd34olRrSKja0RM8RlVgAME=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g6NOfqVCeAuDfsrPoPgEywU1x340Xk8SKqgmiSyGq7ny6hKQ1lUBvoOSPwtiDb68e
	 FW2arWXs0Vmn9A4ZOOsD2IXQLyS1hju7qRc4xyDHObfRrNWwoeDMShyzAcCmwFOj63
	 Q2hAUdMUAsH92HT8uaOdf35GD1OHagdmDh1UVHPvqW0CP2VT9q005Ftf9Cf8q1erAV
	 0RxctcDpX//DHdK+5Pp5xCgWSE4qsBo+6ZOCwW41IEbUFUjsZWkNBEEmBSp2/uiC3N
	 2FQ08ng9AsuziLcWB+4ZzW/AQiGPgfdtsANKY6RQ6d6NBql97JJLLyWMx7FLZghOfV
	 Bo2hJ7/6RtxDA==
Date: Tue, 20 Jan 2026 16:07:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, grygorii_strashko@epam.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/console: handle multiple domains using console_io
 hypercalls
In-Reply-To: <32d0a9a2-89df-4e20-8f7a-0f069cbff11f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601201601070.7192@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601131638350.6279@ubuntu-linux-20-04-desktop> <63c35c5e-577b-4346-b600-03808306177f@suse.com> <alpine.DEB.2.22.394.2601191522450.7192@ubuntu-linux-20-04-desktop> <32d0a9a2-89df-4e20-8f7a-0f069cbff11f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1619268939-1768953762=:7192"
Content-ID: <alpine.DEB.2.22.394.2601201602440.7192@ubuntu-linux-20-04-desktop>
X-Spamd-Result: default: False [0.41 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-diff];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 31D2D4E4F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1619268939-1768953762=:7192
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2601201602441.7192@ubuntu-linux-20-04-desktop>

On Tue, 20 Jan 2026, Jan Beulich wrote:
> On 20.01.2026 00:23, Stefano Stabellini wrote:
> > On Mon, 19 Jan 2026, Jan Beulich wrote:
> >> On 14.01.2026 01:39, Stefano Stabellini wrote:
> >>> @@ -815,6 +831,11 @@ long do_console_io(
> >>>          if ( count > INT_MAX )
> >>>              break;
> >>>  
> >>> +        d = console_get_domain();
> >>> +        console_put_domain(d);
> >>> +        if ( d != current->domain )
> >>> +            return 0;
> >>
> >> This isn't atomic (as in: in a suitably locked region) with ...
> >>
> >>> @@ -830,7 +851,10 @@ long do_console_io(
> >>>                  break;
> >>>              }
> >>>              rc += len;
> >>> -            serial_rx_cons += len;
> >>> +            nrspin_lock_irq(&console_lock);
> >>> +            if ( serial_rx_cons != serial_rx_prod )
> >>> +                serial_rx_cons += len;
> >>> +            nrspin_unlock_irq(&console_lock);
> >>>          }
> >>>          break;
> >>
> >> ... this. If the focus domain changes after the check in the earlier hunk,
> >> I think you need to also return with no input here. Or you need to acquire
> >> the lock earlier (and then similarly in console_switch_input()), albeit
> >> that would then mean holding it across a copy-to-guest. Which technically
> >> is perhaps not a problem, but it leaves an uneasy feeling.
> > 
> > I thought about it when writing this patch and I had the same feeling as
> > you. However, especially considering the other feedback, I don't see
> > another viable solution.
> 
> Taking just the logic here, an option might be to re-check the focus domain
> once holding the lock, and discard the most recent chunk of input from what
> would go back to the caller if the focus changed. But that would come with
> its own new complexities.

I attempted to make changes on top of v4 so that copy_to_guest_offset is
not called with the lock held.

I did introduce a focus domain check in the CONSOLEIO_read while loop,
but didn't discard input because now the focus domain is only changed
with the console_lock held and also the while loop is executed with the
console_lock held (except for copy_to_guest_offset) so as far as I can
tell it shouldn't be possible that a domain is reading someone else's
input data.



>From 71de8ddd0ce31090362115a3d54d1ebe161c229f Mon Sep 17 00:00:00 2001
From: Stefano Stabellini <stefano.stabellini@amd.com>
Date: Fri, 16 Jan 2026 13:07:43 -0800
Subject: [PATCH v5] xen/console: handle multiple domains using console_io
 hypercalls

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
 xen/drivers/char/console.c | 56 ++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7b176da71a..5c621b39bd 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -521,6 +521,8 @@ struct domain *console_get_domain(void)
 {
     struct domain *d;
 
+    nrspin_lock_irq(&console_lock);
+
     if ( console_rx == 0 )
             return NULL;
 
@@ -540,6 +542,8 @@ void console_put_domain(struct domain *d)
 {
     if ( d )
         rcu_unlock_domain(d);
+
+    nrspin_unlock_irq(&console_lock);
 }
 
 static void console_switch_input(void)
@@ -574,8 +578,12 @@ static void console_switch_input(void)
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
@@ -596,8 +604,19 @@ static void __serial_rx(char c)
 
     d = console_get_domain();
     if ( !d )
+    {
+        console_put_domain(d);
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
@@ -613,11 +632,6 @@ static void __serial_rx(char c)
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
@@ -729,6 +743,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain *input;
 
     while ( count > 0 )
     {
@@ -741,17 +756,23 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
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
-            nrspin_unlock_irq(&console_lock);
+            console_put_domain(input);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
 
+            console_put_domain(input);
             /* Strip non-printable characters */
             do
             {
@@ -793,6 +814,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    struct domain *d;
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -813,6 +835,13 @@ long do_console_io(
         if ( count > INT_MAX )
             break;
 
+        d = console_get_domain();
+        if ( d != current->domain )
+        {
+            console_put_domain(d);
+            return 0;
+        }
+
         rc = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
@@ -822,14 +851,23 @@ long do_console_io(
                 len = SERIAL_RX_SIZE - idx;
             if ( (rc + len) > count )
                 len = count - rc;
+
+            console_put_domain(d);
             if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
             {
                 rc = -EFAULT;
                 break;
             }
+            d = console_get_domain();
+            if ( d != current->domain )
+            {
+                console_put_domain(d);
+                break;
+            }
             rc += len;
             serial_rx_cons += len;
         }
+        console_put_domain(d);
         break;
     default:
         rc = -ENOSYS;
-- 
2.25.1
--8323329-1619268939-1768953762=:7192
Content-Type: text/x-diff; NAME=incremental.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2601201602420.7192@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=incremental.patch

ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMNCmluZGV4IGFjZmM0OWQ1NTguLjVj
NjIxYjM5YmQgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNv
bGUuYw0KKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMNCkBAIC01
MjEsNiArNTIxLDggQEAgc3RydWN0IGRvbWFpbiAqY29uc29sZV9nZXRfZG9t
YWluKHZvaWQpDQogew0KICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KIA0KKyAg
ICBucnNwaW5fbG9ja19pcnEoJmNvbnNvbGVfbG9jayk7DQorDQogICAgIGlm
ICggY29uc29sZV9yeCA9PSAwICkNCiAgICAgICAgICAgICByZXR1cm4gTlVM
TDsNCiANCkBAIC01NDAsNiArNTQyLDggQEAgdm9pZCBjb25zb2xlX3B1dF9k
b21haW4oc3RydWN0IGRvbWFpbiAqZCkNCiB7DQogICAgIGlmICggZCApDQog
ICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCisNCisgICAgbnJzcGlu
X3VubG9ja19pcnEoJmNvbnNvbGVfbG9jayk7DQogfQ0KIA0KIHN0YXRpYyB2
b2lkIGNvbnNvbGVfc3dpdGNoX2lucHV0KHZvaWQpDQpAQCAtNTk4LDExICs2
MDIsMTAgQEAgc3RhdGljIHZvaWQgX19zZXJpYWxfcngoY2hhciBjKQ0KICAg
ICBpZiAoIGNvbnNvbGVfcnggPT0gMCApDQogICAgICAgICByZXR1cm4gaGFu
ZGxlX2tleXByZXNzKGMsIGZhbHNlKTsNCiANCi0gICAgbnJzcGluX2xvY2tf
aXJxKCZjb25zb2xlX2xvY2spOw0KICAgICBkID0gY29uc29sZV9nZXRfZG9t
YWluKCk7DQogICAgIGlmICggIWQgKQ0KICAgICB7DQotICAgICAgICBucnNw
aW5fdW5sb2NrX2lycSgmY29uc29sZV9sb2NrKTsNCisgICAgICAgIGNvbnNv
bGVfcHV0X2RvbWFpbihkKTsNCiAgICAgICAgIHJldHVybjsNCiAgICAgfQ0K
IA0KQEAgLTY0MCw3ICs2NDMsNiBAQCBzdGF0aWMgdm9pZCBfX3NlcmlhbF9y
eChjaGFyIGMpDQogICAgICAgICAgICAgICAgICAgICAgcmMpOw0KIA0KICAg
ICBjb25zb2xlX3B1dF9kb21haW4oZCk7DQotICAgIG5yc3Bpbl91bmxvY2tf
aXJxKCZjb25zb2xlX2xvY2spOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBjZl9j
aGVjayBzZXJpYWxfcngoY2hhciBjKQ0KQEAgLTc1NCw3ICs3NTYsNiBAQCBz
dGF0aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0oY2hhcikgYnVmZmVyLA0KICAgICAgICAgaWYgKCBjb3B5X2Zy
b21fZ3Vlc3Qoa2J1ZiwgYnVmZmVyLCBrY291bnQpICkNCiAgICAgICAgICAg
ICByZXR1cm4gLUVGQVVMVDsNCiANCi0gICAgICAgIG5yc3Bpbl9sb2NrX2ly
cSgmY29uc29sZV9sb2NrKTsNCiAgICAgICAgIGlucHV0ID0gY29uc29sZV9n
ZXRfZG9tYWluKCk7DQogICAgICAgICBpZiAoIGlucHV0ICYmIGNkID09IGlu
cHV0ICkNCiAgICAgICAgIHsNCkBAIC03NjYsMTQgKzc2NywxMiBAQCBzdGF0
aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0oY2hhcikgYnVmZmVyLA0KICAgICAgICAgICAgIC8qIFVzZSBkaXJl
Y3QgY29uc29sZSBvdXRwdXQgYXMgaXQgY291bGQgYmUgaW50ZXJhY3RpdmUg
Ki8NCiAgICAgICAgICAgICBjb25zb2xlX3NlbmQoa2J1Ziwga2NvdW50LCBm
bGFncyk7DQogICAgICAgICAgICAgY29uc29sZV9wdXRfZG9tYWluKGlucHV0
KTsNCi0gICAgICAgICAgICBucnNwaW5fdW5sb2NrX2lycSgmY29uc29sZV9s
b2NrKTsNCiAgICAgICAgIH0NCiAgICAgICAgIGVsc2UNCiAgICAgICAgIHsN
CiAgICAgICAgICAgICBjaGFyICpraW4gPSBrYnVmLCAqa291dCA9IGtidWYs
IGM7DQogDQogICAgICAgICAgICAgY29uc29sZV9wdXRfZG9tYWluKGlucHV0
KTsNCi0gICAgICAgICAgICBucnNwaW5fdW5sb2NrX2lycSgmY29uc29sZV9s
b2NrKTsNCiAgICAgICAgICAgICAvKiBTdHJpcCBub24tcHJpbnRhYmxlIGNo
YXJhY3RlcnMgKi8NCiAgICAgICAgICAgICBkbw0KICAgICAgICAgICAgIHsN
CkBAIC04MzYsMTIgKzgzNSwxMCBAQCBsb25nIGRvX2NvbnNvbGVfaW8oDQog
ICAgICAgICBpZiAoIGNvdW50ID4gSU5UX01BWCApDQogICAgICAgICAgICAg
YnJlYWs7DQogDQotICAgICAgICBucnNwaW5fbG9ja19pcnEoJmNvbnNvbGVf
bG9jayk7DQogICAgICAgICBkID0gY29uc29sZV9nZXRfZG9tYWluKCk7DQog
ICAgICAgICBpZiAoIGQgIT0gY3VycmVudC0+ZG9tYWluICkNCiAgICAgICAg
IHsNCiAgICAgICAgICAgICBjb25zb2xlX3B1dF9kb21haW4oZCk7DQotICAg
ICAgICAgICAgbnJzcGluX3VubG9ja19pcnEoJmNvbnNvbGVfbG9jayk7DQog
ICAgICAgICAgICAgcmV0dXJuIDA7DQogICAgICAgICB9DQogDQpAQCAtODU0
LDE4ICs4NTEsMjMgQEAgbG9uZyBkb19jb25zb2xlX2lvKA0KICAgICAgICAg
ICAgICAgICBsZW4gPSBTRVJJQUxfUlhfU0laRSAtIGlkeDsNCiAgICAgICAg
ICAgICBpZiAoIChyYyArIGxlbikgPiBjb3VudCApDQogICAgICAgICAgICAg
ICAgIGxlbiA9IGNvdW50IC0gcmM7DQorDQorICAgICAgICAgICAgY29uc29s
ZV9wdXRfZG9tYWluKGQpOw0KICAgICAgICAgICAgIGlmICggY29weV90b19n
dWVzdF9vZmZzZXQoYnVmZmVyLCByYywgJnNlcmlhbF9yeF9yaW5nW2lkeF0s
IGxlbikgKQ0KICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgcmMg
PSAtRUZBVUxUOw0KKyAgICAgICAgICAgICAgICBicmVhazsNCisgICAgICAg
ICAgICB9DQorICAgICAgICAgICAgZCA9IGNvbnNvbGVfZ2V0X2RvbWFpbigp
Ow0KKyAgICAgICAgICAgIGlmICggZCAhPSBjdXJyZW50LT5kb21haW4gKQ0K
KyAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgY29uc29sZV9wdXRf
ZG9tYWluKGQpOw0KLSAgICAgICAgICAgICAgICBucnNwaW5fdW5sb2NrX2ly
cSgmY29uc29sZV9sb2NrKTsNCiAgICAgICAgICAgICAgICAgYnJlYWs7DQog
ICAgICAgICAgICAgfQ0KICAgICAgICAgICAgIHJjICs9IGxlbjsNCiAgICAg
ICAgICAgICBzZXJpYWxfcnhfY29ucyArPSBsZW47DQogICAgICAgICB9DQog
ICAgICAgICBjb25zb2xlX3B1dF9kb21haW4oZCk7DQotICAgICAgICBucnNw
aW5fdW5sb2NrX2lycSgmY29uc29sZV9sb2NrKTsNCiAgICAgICAgIGJyZWFr
Ow0KICAgICBkZWZhdWx0Og0KICAgICAgICAgcmMgPSAtRU5PU1lTOw0K

--8323329-1619268939-1768953762=:7192--


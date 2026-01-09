Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1AD0C76D
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 23:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199236.1515840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veL4u-0006Ll-BU; Fri, 09 Jan 2026 22:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199236.1515840; Fri, 09 Jan 2026 22:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veL4u-0006Ix-8o; Fri, 09 Jan 2026 22:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1199236;
 Fri, 09 Jan 2026 22:35:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T30I=7O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1veL4t-0006Ir-B4
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 22:35:31 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7de3d039-edab-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 23:35:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E14A141967;
 Fri,  9 Jan 2026 22:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B306C4CEF1;
 Fri,  9 Jan 2026 22:35:23 +0000 (UTC)
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
X-Inumbo-ID: 7de3d039-edab-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767998124;
	bh=X/vRzRZWLUwYDzodjQulZ5IvQIgKleYTtC7NTW/JlRI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MJu6is3r4C5LMyPSFI5SGk/sm6qiWQhimlBU6w7i7B3qEmFSzYChRUffSRftuYv1N
	 TK8gQj4HR7TJlSSest9oCpbfEASTuRNfVAJW4K1dMMVOPjs4YASMAGo56bjG349j8N
	 Lld8VZtQZCpWsZZOPJ8E+g3w6nFlmIo9jObTrv/BYARDa7I7Q2krxBy4riBbluxFzv
	 VRRO3vhugUbeoPuHumM7qfOrriZg9LPf9M65j+evv7qreTIFTzDV+gk0RT1oja2Gva
	 tf9DtLGnWNgc8G7BWYeSp2jWRcw/kRIp/OZnF0QA5BFzT2B+CVcfatOiZPhahx24yb
	 whQcZSFPMoFiQ==
Date: Fri, 9 Jan 2026 14:35:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <grygorii_strashko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN][PATCH] console/consoleio: account for xen serial input
 focus during write
In-Reply-To: <20251204233211.980862-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601091435130.992863@ubuntu-linux-20-04-desktop>
References: <20251204233211.980862-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Dec 2025, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> When 2 or more domains are created and:
> - one is hwdom with "hvc0" (console_io) console
> - other DomUs with vpl011 or "hvc0" (console_io) console
> console output from hwdom may mix with output from other domains.
> 
> Example:
> [    2.288816] Key type id_legacy registered
> [    2.291894] n(XEN) DOM1: [    1.016950] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> fs4filelayout_init: NFSv4 File Layout Driver Registering...
> (XEN) DOM1: [    1.018846] audit: initializing netlink subsys (disabled)
> 
> This happens because for hwdom the console output is produced by domain and
> handled by Xen as stream of chars, which can be interrupted when hwdom is
> scheduled out and so, cause console output mix.
> The Xen consoleio code trying to mimic serial HW behavior for hwdom
> unconditionally by sending available data to serial HW on arrival.
> Xen consoleio code does not account for Xen console input focus, comparing
> to emulated serial hw, like vpl011, which does the same for domain with
> active Xen console input focus only.
> 
> Switching console input focus to Xen improves situation, but not enough.
> 
> This patch changes consoleio code to account for domain with active Xen
> console input focus - console output will be sent directly to serial HW
> only if domain has active Xen console input focus. For other domains -
> console output will be buffered and sync on per-line basis.
> 
> Example output:
> (d2) [    4.263417] Key type id_legacy registered
> (XEN) DOM1: [    4.658080] Advanced Linux Sound Architecture Driver Initialized.
> (d2) [    4.277824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

I independently wrote this patch which also supports console reads.
Sorry about the mixed messages.

---


xen/console: handle multiple domains using console_io hypercalls

Allow multiple dom0less domains to use the console_io hypercalls to
print to the console. Handle them in a similar way to vpl011: only the
domain which has focus can read from the console. All domains can write
to the console but the ones without focus have a prefix. In this case
the prefix is applied by using guest_printk instead of printk or
console_puts which is what the original code was already doing.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/drivers/char/console.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index dcc31170f2..826bee3848 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -729,6 +729,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain *input;
 
     while ( count > 0 )
     {
@@ -741,17 +742,26 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        input = console_get_domain();
+        if (input && cd == input)
         {
+            if ( cd->pbuf_idx )
+            {
+                cd->pbuf[cd->pbuf_idx] = '\0';
+                console_send(cd->pbuf, cd->pbuf_idx + 1, flags);
+                cd->pbuf_idx = 0;
+            }
             /* Use direct console output as it could be interactive */
             nrspin_lock_irq(&console_lock);
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
+            console_put_domain(input);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
 
+            console_put_domain(input);
             /* Strip non-printable characters */
             do
             {
@@ -793,6 +803,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    struct domain *d;
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -813,6 +824,13 @@ long do_console_io(
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
@@ -824,12 +842,14 @@ long do_console_io(
                 len = count - rc;
             if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
             {
+                console_put_domain(d);
                 rc = -EFAULT;
                 break;
             }
             rc += len;
             serial_rx_cons += len;
         }
+        console_put_domain(d);
         break;
     default:
         rc = -ENOSYS;
-- 
2.25.1



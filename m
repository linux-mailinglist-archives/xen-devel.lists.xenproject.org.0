Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C9D162B3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 02:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201034.1516776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfTEe-0005bc-FA; Tue, 13 Jan 2026 01:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201034.1516776; Tue, 13 Jan 2026 01:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfTEe-0005YY-8p; Tue, 13 Jan 2026 01:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1201034;
 Tue, 13 Jan 2026 01:30:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjAJ=7S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfTEd-0005YS-1o
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 01:30:15 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670faf60-f01f-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 02:30:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 85AB142A6F;
 Tue, 13 Jan 2026 01:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCB1C116D0;
 Tue, 13 Jan 2026 01:30:08 +0000 (UTC)
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
X-Inumbo-ID: 670faf60-f01f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768267810;
	bh=SiWZQYRKLJAqHCntm3wrDbeXCBsTGpiRR4DYrso5ExU=;
	h=Date:From:To:cc:Subject:From;
	b=higinGka6b6qYNL72znTsEsJ2nzghu61V1rjnLRcIAjwsJZA1MnIeb0Fcm/6ANPAi
	 0kvssPUIAgJAvcHhw5ngwasB+oJH7Gbb7P7/8ZYNrJZGR90cSUVfjB+LMnPw8FSV7c
	 QklHC0WRStR8gYP3/wRqbpRsVr+yRloLrxkTc6n5dxEWyuHAFIOI+pAgNxhvFUwSvS
	 RTNdH+xK0f1KQw0SYUsqdquxJJxL4A9j7vwtgXzeJOAAAN35y9SQiEyKkgSGyPoD4o
	 IAl42rQl5ZD2JqgquKxYT1L8zMkibztFXG7rZ8fLupfu0dm8WZXhCJjTsUD+zlqiLb
	 mmkWyazYTBsDQ==
Date: Mon, 12 Jan 2026 17:30:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, jbeulich@suse.com, grygorii_strashko@epam.com, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>, 
    andrew.cooper3@citrix.com
Subject: [PATCH v2] xen/console: handle multiple domains using console_io
 hypercalls
Message-ID: <alpine.DEB.2.22.394.2601121728380.992863@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Allow multiple dom0less domains to use the console_io hypercalls to
print to the console. Handle them in a similar way to vpl011: only the
domain which has focus can read from the console. All domains can write
to the console but the ones without focus have a prefix. In this case
the prefix is applied by using guest_printk instead of printk or
console_puts which is what the original code was already doing.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- fix code style
- pbuf_idx/idx after ada53067083e
- don't add extra \0
- clear input on console switch
---
 xen/drivers/char/console.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb4..6c7a6592c5 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -576,6 +576,8 @@ static void console_switch_input(void)
             rcu_unlock_domain(d);
 
             console_rx = next_rx;
+            /* don't let the next dom read the previous dom's unread data */
+            serial_rx_cons = serial_rx_prod;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -730,6 +732,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain *input;
 
     while ( count > 0 )
     {
@@ -742,18 +745,28 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        input = console_get_domain();
+        if ( input && cd == input )
         {
+            struct domain_console *cons = cd->console;
+
+            if ( cons->idx )
+            {
+                console_send(cons->buf, cons->idx, flags);
+                cons->idx = 0;
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
             struct domain_console *cons = cd->console;
 
+            console_put_domain(input);
             /* Strip non-printable characters */
             do
             {
@@ -795,6 +808,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    struct domain *d;
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -815,6 +829,13 @@ long do_console_io(
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
@@ -826,12 +847,14 @@ long do_console_io(
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



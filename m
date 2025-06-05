Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3528AACE798
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 02:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006090.1385360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMykb-0003zn-7q; Thu, 05 Jun 2025 00:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006090.1385360; Thu, 05 Jun 2025 00:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMykb-0003xa-4L; Thu, 05 Jun 2025 00:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1006090;
 Thu, 05 Jun 2025 00:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nB46=YU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMykZ-0003dI-Ox
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 00:46:31 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85806f2c-41a6-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 02:46:31 +0200 (CEST)
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
X-Inumbo-ID: 85806f2c-41a6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749084390; x=1749343590;
	bh=9smI6UqtAGVdne0R3e2rtMBynR9rK4/XlXYqfjo4GgM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EOHAc1s/hRHY6RAFcNVziAL7IfSuCMtYXXQmUVtwAsFXeG6D7Wl2oyvTzUbP9UZWr
	 pdyRYReQGJ4cSLyW7r7flv7CVLqKomL24gfj13n5vM6YtuqPmCgz2fMcXkZrZQgy0z
	 50cafQQGoQVOuelkAEZl8wSdzRQTuJ6/vN4d5SAAqF0BIeDFvxsqhJPkZU/ucbuGlw
	 grp7QP2Ues7r7ZLAh157S3jl1OMzUyMmRWw0od/mWp1z4yiPKZNeKJIPJfKAHhETwn
	 jV4YZjnYEK+WDj+ao6ZPK/NG5UgFrKGfChipWsPlQGzafelKMPmP8Hoebx5BDD2aQA
	 VcUoZw9hHBuyA==
Date: Thu, 05 Jun 2025 00:46:25 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <20250605004601.1142090-3-dmukhin@ford.com>
In-Reply-To: <20250605004601.1142090-1-dmukhin@ford.com>
References: <20250605004601.1142090-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0def410e3d0ccdb8d9d0833aa67447765c7cbd6a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

If virtual UART from domain X prints on the physical console, the behavior =
is
updated to (see [1]):
- console focus in domain X: do not prefix messages;
- no console focus in domain X: prefix all messages with "(dX)".

Use guest_printk() without rate-limiting in all current in-hypervisor UART
emulators. That aligns the behavior with debug I/O port 0xe9 handler on x86=
 and
slightly improves the logging since guest_printk() already prints the domai=
n
ID. guest_printk() was modified to account for console focus ownership.

Modify guest_console_write() for hardware domain case by adding domain ID t=
o
the message when hwdom does not have console focus.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360.463=
523@ubuntu-linux-20-04-desktop/
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- dropped change for debug port and for HYPERVISOR_console_io hypercall
---
 xen/arch/arm/vpl011.c      |  6 +++---
 xen/arch/arm/vuart.c       |  2 +-
 xen/drivers/char/console.c | 23 +++++++++++++++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 480fc664fc..2b6f2a09bc 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -87,7 +87,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8=
_t data)
     {
         if ( intf->out_prod =3D=3D 1 )
         {
-            printk("%c", data);
+            guest_printk(d, "%c", data);
             intf->out_prod =3D 0;
         }
         else
@@ -95,7 +95,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8=
_t data)
             if ( data !=3D '\n' )
                 intf->out[intf->out_prod++] =3D '\n';
             intf->out[intf->out_prod++] =3D '\0';
-            printk("%s", intf->out);
+            guest_printk(d, "%s", intf->out);
             intf->out_prod =3D 0;
         }
     }
@@ -107,7 +107,7 @@ static void vpl011_write_data_xen(struct domain *d, uin=
t8_t data)
             if ( data !=3D '\n' )
                 intf->out[intf->out_prod++] =3D '\n';
             intf->out[intf->out_prod++] =3D '\0';
-            printk("DOM%u: %s", d->domain_id, intf->out);
+            guest_printk(d, "%s", intf->out);
             intf->out_prod =3D 0;
         }
     }
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index bd2f425214..8c9f9e2182 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -89,7 +89,7 @@ static void vuart_print_char(struct vcpu *v, char c)
         if ( c !=3D '\n' )
             uart->buf[uart->idx++] =3D '\n';
         uart->buf[uart->idx] =3D '\0';
-        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
+        guest_printk(d, "%s", uart->buf);
         uart->idx =3D 0;
     }
     spin_unlock(&uart->lock);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a8cb6363ea..616f4968b0 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
(char) buffer,
         if ( is_hardware_domain(cd) )
         {
             /* Use direct console output as it could be interactive */
+            char prefix[16] =3D "";
+            struct domain *consd;
+
+            consd =3D console_get_domain();
+            if ( consd !=3D cd )
+                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
+            console_put_domain(consd);
+
             nrspin_lock_irq(&console_lock);
+            if ( prefix[0] !=3D '\0' )
+                console_send(prefix, strlen(prefix), flags);
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
@@ -1029,12 +1039,21 @@ void printk(const char *fmt, ...)
     va_end(args);
 }
=20
+/*
+ * Print message from the guest on the diagnostic console.
+ * Prefixes all messages w/ "(dX)" if domain X does not own physical conso=
le
+ * focus.
+ */
 void guest_printk(const struct domain *d, const char *fmt, ...)
 {
     va_list args;
-    char prefix[16];
+    char prefix[16] =3D "";
+    struct domain *consd;
=20
-    snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
+    consd =3D console_get_domain();
+    if ( consd !=3D d )
+        snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
+    console_put_domain(consd);
=20
     va_start(args, fmt);
     vprintk_common(fmt, args, prefix);
--=20
2.34.1




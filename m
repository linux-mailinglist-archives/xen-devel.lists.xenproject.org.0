Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6EAC988F
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001670.1381814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9iJ-0007Av-Qa; Sat, 31 May 2025 00:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001670.1381814; Sat, 31 May 2025 00:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9iJ-00078n-NW; Sat, 31 May 2025 00:04:39 +0000
Received: by outflank-mailman (input) for mailman id 1001670;
 Sat, 31 May 2025 00:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nViP=YP=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL9iI-0006dJ-4t
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:04:38 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d602e921-3db2-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:04:35 +0200 (CEST)
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
X-Inumbo-ID: d602e921-3db2-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748649874; x=1748909074;
	bh=jLza7oYui7MAKA/WA30qHXm75fT4X1v0Cyk+pVm2zJU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=TgwiE2gOORRE3AZ86dmeTGSzqDxX52EPna3pU5tF4pe5xfFeuqEMPFOjIfDPr/5BX
	 6ld41ApwGRL56ppkYXPQjcfb1BG2uz6v3dy1S8+Wb0AZ7vPnN7drQ/pCVw2EYQTznH
	 o+9aGSljhitjs7LqSvVc7WGl/mwkkaL2sM9HvDO0J0c2cAwe/RKJZ07wJA9y6IefJJ
	 2fSTRgjax7sUSfJ6soRsvHqJZJ6dFzSEQ1X0U9YALUkO9xcfdKoZqwUTNjCEjA69mF
	 tAUtyMcd6wYEVEFKucHxLZgigtgfdeS3CXbV2NuLZ3mi/RlU1bpTWJT6C1BCaqWg3J
	 JnGGnoejzfLFw==
Date: Sat, 31 May 2025 00:04:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 2/2] xen/console: unify printout behavior for UART emulators
Message-ID: <20250531000417.81750-3-dmukhin@ford.com>
In-Reply-To: <20250531000417.81750-1-dmukhin@ford.com>
References: <20250531000417.81750-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7926c79b27fa54c5217a24e08014cab5f982e754
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

If virtual UART from domain X prints on the physical console, the behavior =
is
updated to (see [1]):
- console focus in domain X: do not prefix messages;
- no console focus in domain X: prefix all messages with "(dX)".

Use guest_printk() in all current in-hypervisor UART emulators. That aligns
behavior with debug I/O port 0xe9 handler in x86 port and slightly improves=
 the
logging since guest_printk() already prints the domain ID. guest_printk() w=
as
modified to account for console focus ownership.

Modify guest_console_write() for hardware domain case by adding domain ID
to the message when hwdom does not have console focus.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2412121655360.463=
523@ubuntu-linux-20-04-desktop/
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c      |  6 +++---
 xen/arch/arm/vuart.c       |  2 +-
 xen/arch/x86/hvm/hvm.c     |  2 +-
 xen/drivers/char/console.c | 25 ++++++++++++++++++++++---
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 66047bf33c..6298e377b3 100644
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
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046..8cc94bee81 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -577,7 +577,7 @@ static int cf_check hvm_print_line(
     if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n') )
     {
         cd->pbuf[cd->pbuf_idx] =3D '\0';
-        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
+        guest_printk(cd, "%s\n", cd->pbuf);
         cd->pbuf_idx =3D 0;
     }
     spin_unlock(&cd->pbuf_lock);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 27e3f8d8c6..16d6003a0f 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -724,7 +724,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
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
@@ -755,7 +765,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
             else
             {
                 cd->pbuf[cd->pbuf_idx] =3D '\0';
-                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
+                guest_printk(cd, "%s%s\n", cd->pbuf, kbuf);
                 cd->pbuf_idx =3D 0;
             }
             spin_unlock(&cd->pbuf_lock);
@@ -1013,12 +1023,21 @@ void printk(const char *fmt, ...)
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




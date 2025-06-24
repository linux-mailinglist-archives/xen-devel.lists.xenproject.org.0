Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E4AE5AB8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022966.1398897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqL-0004L5-LZ; Tue, 24 Jun 2025 04:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022966.1398897; Tue, 24 Jun 2025 04:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqL-0004Gj-FH; Tue, 24 Jun 2025 04:01:09 +0000
Received: by outflank-mailman (input) for mailman id 1022966;
 Tue, 24 Jun 2025 04:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTult-0006IZ-Ez
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:33 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 366a6e5a-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:56:31 +0200 (CEST)
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
X-Inumbo-ID: 366a6e5a-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4ck5bogpevd5jkat5koiapv2s4.protonmail; t=1750737390; x=1750996590;
	bh=WzrROE+QI/UTY1xrOQAZvzV0WY59/mzY+ZWQRvx/c2U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N2YwSZg3r4hR7riv+uBnF0UBwlN1gRkqsvv+3BT4xrwLNYpVhqnZhDa0zxlZ0Iusp
	 u7EIDsUs/S14/DgcmNqpZjKBcRu0WU2QrWObJxudWFfkwcwCI/+yTgSp0FqGJdwSES
	 jGQDFubrdcEcSG9LYTK77vfFyytjeDmde6Rk7yxbbfCFc9cKuFm3g4ixixJMFHMMRx
	 ms8OtGTspelJmSpil2R52j+pjL4VB8Mt9noLv9Y44kS2uBHVDzaba8PJ/eTxF1eOst
	 XiJHUD7KiYG9btHXVjGSBwuGGWpmhf9ZODETJf2AQuPEW0aZvlyjm+BSslwim8FtjF
	 ObhvNwkfMJPGw==
Date: Tue, 24 Jun 2025 03:56:26 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 10/16] arm/vuart: merge vuart_print_char() with vuart_mmio_write()
Message-ID: <20250624035443.344099-11-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5a420a27ef110bf70270096b3b46a04f5ae9dc1f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Simplify code a bit since there's only one user of vuart_print_char().

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vuart.c | 45 ++++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index d2f90ab0c64f..66fac6c994ce 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * xen/arch/arm/vuart.c
- *
  * Virtual UART Emulator.
  *
  * This emulator uses the information from dtuart. This is not intended to=
 be
@@ -21,6 +19,7 @@
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2012 Citrix Systems.
  */
+
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/errno.h>
@@ -99,27 +98,6 @@ void domain_vuart_free(struct domain *d)
     }
 }
=20
-static void vuart_print_char(struct vcpu *v, char c)
-{
-    struct domain *d =3D v->domain;
-    struct vuart *uart =3D d->arch.vuart;
-
-    if ( !is_console_printable(c) )
-        return ;
-
-    spin_lock(&uart->lock);
-    uart->buf[uart->idx++] =3D c;
-    if ( (uart->idx =3D=3D (VUART_BUF_SIZE - 2)) || (c =3D=3D '\n') )
-    {
-        if ( c !=3D '\n' )
-            uart->buf[uart->idx++] =3D '\n';
-        uart->buf[uart->idx] =3D '\0';
-        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, uart->buf);
-        uart->idx =3D 0;
-    }
-    spin_unlock(&uart->lock);
-}
-
 static int vuart_mmio_read(struct vcpu *v, mmio_info_t *info,
                            register_t *r, void *priv)
 {
@@ -145,12 +123,26 @@ static int vuart_mmio_write(struct vcpu *v, mmio_info=
_t *info,
     struct domain *d =3D v->domain;
     struct vuart *vdev =3D d->arch.vuart;
     paddr_t offset =3D info->gpa - vdev->info->base_addr;
+    char ch =3D r & 0xFF; /* ignore any status bits */
=20
     perfc_incr(vuart_writes);
=20
-    if ( offset =3D=3D vdev->info->data_off )
-        /* ignore any status bits */
-        vuart_print_char(v, r & 0xFF);
+    if ( !vdev || offset !=3D vdev->info->data_off || !is_console_printabl=
e(ch) )
+        return 1;
+
+    spin_lock(&vdev->lock);
+
+    vdev->buf[vdev->idx++] =3D ch;
+    if ( (vdev->idx =3D=3D (VUART_BUF_SIZE - 2)) || (ch =3D=3D '\n') )
+    {
+        if ( ch !=3D '\n' )
+            vdev->buf[vdev->idx++] =3D '\n';
+        vdev->buf[vdev->idx] =3D '\0';
+        printk(XENLOG_G_DEBUG "DOM%u: %s", d->domain_id, vdev->buf);
+        vdev->idx =3D 0;
+    }
+
+    spin_unlock(&vdev->lock);
=20
     return 1;
 }
@@ -163,4 +155,3 @@ static int vuart_mmio_write(struct vcpu *v, mmio_info_t=
 *info,
  * indent-tabs-mode: nil
  * End:
  */
-
--=20
2.34.1




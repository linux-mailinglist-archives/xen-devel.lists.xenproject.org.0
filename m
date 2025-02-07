Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA71A2CF7F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 22:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884014.1293810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgVyr-0006o1-2h; Fri, 07 Feb 2025 21:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884014.1293810; Fri, 07 Feb 2025 21:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgVyq-0006mf-VZ; Fri, 07 Feb 2025 21:33:44 +0000
Received: by outflank-mailman (input) for mailman id 884014;
 Fri, 07 Feb 2025 21:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vKp5=U6=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tgVyo-0006mZ-Bo
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 21:33:43 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30facf80-e59b-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 22:33:38 +0100 (CET)
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
X-Inumbo-ID: 30facf80-e59b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=cgmrjnyzorh6hbm45sgkzvyage.protonmail; t=1738964017; x=1739223217;
	bh=fwD4WFli0ZgOIzGAPoTOCvJkemKZxnP2fcVOEw9cuY0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dE59TH3IuSQyugKzoByWgAQp7KbtKBoBXYK6+yrzt9zNGwtwVOcY3fn+yXXvZRK1f
	 Gy3AyCIF7gU8ZK1Zev0GZlRF81cMdRuKKvJbE47jWjvhIxwxcl2kk45SomjKi0+QjG
	 Sh3r9cVTBbwSBnkLYaRKGdQMbEv3b3Inx+80g3ItgLeBIoIV0rCY+EM2Srb3prbrdE
	 ffJUZDDBZPs1GWSI/KvzYnX9BGJy6mpREpQYawoGRRkcdgOgLpLYkxeiO1g+b2zitT
	 oyagQFyo1w3JmK/k6wvnkpIS5WU1iCcSBMAAtY5gYVapW6LfUacr6GTWAYeg5o79o2
	 wTy2gpoPQ5ehQ==
Date: Fri, 07 Feb 2025 21:33:31 +0000
To: jbeulich@suse.com
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, dmkhn@proton.me, dmukhin@ford.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/console: introduce is_console_printable()
Message-ID: <20250207213320.2253618-1-dmukhin@ford.com>
In-Reply-To: <fed6f1dd-8c32-47d7-b879-e38b372bf4eb@suse.com>
References: <20250207005532.345746-1-dmkhn@proton.me> <fed6f1dd-8c32-47d7-b879-e38b372bf4eb@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f9c34c957178fa76cdf6836a378ae02d7593230c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add is_console_printable() to implement a common check for printable charac=
ters
in the UART emulation and guest logging code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vuart.c       | 5 ++---
 xen/arch/x86/hvm/hvm.c     | 5 ++---
 xen/drivers/char/console.c | 3 +--
 xen/include/xen/console.h  | 6 ++++++
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index d5ba483f1e..bd2f425214 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -24,7 +24,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/errno.h>
-#include <xen/ctype.h>
+#include <xen/console.h>
 #include <xen/serial.h>
 #include <asm/mmio.h>
 #include <xen/perfc.h>
@@ -79,8 +79,7 @@ static void vuart_print_char(struct vcpu *v, char c)
     struct domain *d =3D v->domain;
     struct vuart *uart =3D &d->arch.vuart;
=20
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c !=3D '\n') && (c !=3D '\t') )
+    if ( !is_console_printable(c) )
         return ;
=20
     spin_lock(&uart->lock);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 39e39ce4ce..219028969a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -7,7 +7,6 @@
  * Copyright (c) 2008, Citrix Systems, Inc.
  */
=20
-#include <xen/ctype.h>
 #include <xen/init.h>
 #include <xen/ioreq.h>
 #include <xen/lib.h>
@@ -30,6 +29,7 @@
 #include <xen/vpci.h>
 #include <xen/nospec.h>
 #include <xen/vm_event.h>
+#include <xen/console.h>
 #include <asm/shadow.h>
 #include <asm/hap.h>
 #include <asm/current.h>
@@ -561,8 +561,7 @@ static int cf_check hvm_print_line(
     if ( dir !=3D IOREQ_WRITE )
         return X86EMUL_UNHANDLEABLE;
=20
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c !=3D '\n') && (c !=3D '\t') )
+    if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
=20
     spin_lock(&cd->pbuf_lock);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f..b4cec77247 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -24,7 +24,6 @@
 #include <xen/shutdown.h>
 #include <xen/video.h>
 #include <xen/kexec.h>
-#include <xen/ctype.h>
 #include <xen/warning.h>
 #include <asm/div64.h>
 #include <xen/hypercall.h> /* for do_console_io */
@@ -674,7 +673,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
                 c =3D *kin++;
                 if ( c =3D=3D '\n' )
                     break;
-                if ( isprint(c) || c =3D=3D '\t' )
+                if ( is_console_printable(c) )
                     *kout++ =3D c;
             } while ( --kcount > 0 );
=20
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 6dfbade3ec..c4650231be 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -8,6 +8,7 @@
 #define __CONSOLE_H__
=20
 #include <xen/inttypes.h>
+#include <xen/ctype.h>
 #include <public/xen.h>
=20
 struct xen_sysctl_readconsole;
@@ -50,4 +51,9 @@ void console_serial_puts(const char *s, size_t nr);
=20
 extern int8_t opt_console_xen;
=20
+static inline bool is_console_printable(unsigned char c)
+{
+    return isprint(c) || c =3D=3D '\n' || c =3D=3D '\t';
+}
+
 #endif /* __CONSOLE_H__ */
--=20
2.34.1




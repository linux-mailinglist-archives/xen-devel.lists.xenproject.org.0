Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BDA304E5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 08:52:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885113.1294890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thl3j-0006GT-GU; Tue, 11 Feb 2025 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885113.1294890; Tue, 11 Feb 2025 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thl3j-0006Ea-Du; Tue, 11 Feb 2025 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 885113;
 Tue, 11 Feb 2025 07:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ER+F=VC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1thl3i-0006EU-0F
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 07:51:54 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dba1f75-e84d-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 08:51:51 +0100 (CET)
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
X-Inumbo-ID: 0dba1f75-e84d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739260310; x=1739519510;
	bh=oIrwSdoAyq9/6GETWOeNvgz1vMONiOtKEzqIzC/YIY0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=EVjqpTFIdrSwSWMomV4ZHhIwP+rTsoY8rblk59Yp2T4CsNxUzz4h6vSFqAxHumluR
	 frCGehd1YPy4bwmsHUM5AbvTZIShf7Wcqwpb8v1/nIzqOi+sCeC2vlB1VDKNWtqR9n
	 iHF4IcqpGi0IMBPUwGfFRxCE2niHoJCdahawL5e0cTC+V6Hxe9nXNV4JDaJzn1BoIn
	 cSQkBvzK97nBPoSNdogirWPsCUvy4n8/TB0f/G2g/hgH98aKSJnhb5hNf/mKghVl1M
	 +Tm2tpHYCDJ1VOhdAy0E0n+XoTuUp2Cr5YVmph+pAxIPz3yawfK/pMMawdNyGLv+S2
	 vt6OzTEhLMNIA==
Date: Tue, 11 Feb 2025 07:51:46 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] xen/console: introduce is_console_printable()
Message-ID: <20250211074911.190636-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 93408087f4939b63eb85eafabbc5b4a9e6aaf7a6
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add is_console_printable() to implement a common check for printable charac=
ters
in the UART emulation and guest logging code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- switched from tabs to 4 spaces
- Link to v1: https://lore.kernel.org/xen-devel/20250207005532.345746-1-dmk=
hn@proton.me/
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




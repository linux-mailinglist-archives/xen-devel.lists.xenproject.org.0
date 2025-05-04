Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F9AA88E5
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 20:15:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975645.1363006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrS-0002Em-Ii; Sun, 04 May 2025 18:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975645.1363006; Sun, 04 May 2025 18:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrS-00026p-Dx; Sun, 04 May 2025 18:14:46 +0000
Received: by outflank-mailman (input) for mailman id 975645;
 Sun, 04 May 2025 18:14:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwa9=XU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uBdrQ-00024w-EH
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 18:14:44 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5718f84-2913-11f0-9ffb-bf95429c2676;
 Sun, 04 May 2025 20:14:40 +0200 (CEST)
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
X-Inumbo-ID: a5718f84-2913-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1746382479; x=1746641679;
	bh=0aRmvpa4fxwrMSGMYMT22HdGNClvlgiK8yFRqz28IYE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=O4phzPdQZXHTGF52PuaP2WEKwh4YzdCAjVoe75hQcQ5lvJd4CT86wPJBUsuFp01aU
	 hFM6V5Pzf8+VJQoKoktQTFicHHS5t9fwVenGblughbtCx2kg0Y5tw68IZ0z8Syuv3p
	 Sni+Q/p6hyzIaWFPsmmNO9ocwi8WVSTAjm6kZ74NrFkfaZU/ocb2sEfxODNvbcmAYM
	 ZSExZzZn+zPWIv+swpT9LlpwPCKbxbaEG5hVV37uxoIh8/rlfOAzWn9hBR5/JAn2J5
	 gRbPi4COkH3nso6sb65NZJIgMkFkRWJEiVxRqKCH+BIq8wsxzkAAY8BD/fOQwyl/ts
	 AZWsw54XZLMyw==
Date: Sun, 04 May 2025 18:14:37 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 1/3] xen/console: cleanup conring management
Message-ID: <20250504181423.2302345-2-dmukhin@ford.com>
In-Reply-To: <20250504181423.2302345-1-dmukhin@ford.com>
References: <20250504181423.2302345-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9636db80b5fd8e160d9f8706508cfcd92eaee727
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add new parameter to conring_puts() to trigger conring VIRQ when needed.

That cleans up the conring management because it removes VIRQ tasklet code =
from
few places.

Move conring tasklet code close to conring definitions in the console drive=
r to
enable symbols use in conring_puts(). While doing it, rename conring taskle=
t
variables to match the code.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- renamed notify_dom0_con_ring_ prefix to conring_ prefix for readability
- renamed console_locks_busted to conring_no_notify for readability
- added extra parameter to conring_puts() to trigger VIRQ_CON_RING
---
 xen/drivers/char/console.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..20504060cb 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -325,7 +325,17 @@ static void cf_check do_dec_thresh(unsigned char key, =
bool unused)
  * ********************************************************
  */
=20
-static void conring_puts(const char *str, size_t len)
+static void cf_check conring_notify(void *unused)
+{
+    send_global_virq(VIRQ_CON_RING);
+}
+
+static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
+
+/* NB: Do not send conring VIRQs during panic. */
+static bool conring_no_notify;
+
+static void conring_puts(const char *str, size_t len, bool notify)
 {
     ASSERT(rspin_is_locked(&console_lock));
=20
@@ -334,6 +344,9 @@ static void conring_puts(const char *str, size_t len)
=20
     if ( conringp - conringc > conring_size )
         conringc =3D conringp - conring_size;
+
+    if ( notify )
+        tasklet_schedule(&conring_tasklet);
 }
=20
 long read_console_ring(struct xen_sysctl_readconsole *op)
@@ -594,13 +607,6 @@ static void cf_check serial_rx(char c)
     __serial_rx(c);
 }
=20
-static void cf_check notify_dom0_con_ring(void *unused)
-{
-    send_global_virq(VIRQ_CON_RING);
-}
-static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
-                               notify_dom0_con_ring, NULL);
-
 #ifdef CONFIG_X86
 static inline void xen_console_write_debug_port(const char *buf, size_t le=
n)
 {
@@ -648,10 +654,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
(char) buffer,
 #endif
=20
             if ( opt_console_to_ring )
-            {
-                conring_puts(kbuf, kcount);
-                tasklet_schedule(&notify_dom0_con_ring_tasklet);
-            }
+                conring_puts(kbuf, kcount, true);
=20
             nrspin_unlock_irq(&console_lock);
         }
@@ -753,8 +756,6 @@ long do_console_io(
  * *****************************************************
  */
=20
-static bool console_locks_busted;
-
 static void __putstr(const char *str)
 {
     size_t len =3D strlen(str);
@@ -774,10 +775,7 @@ static void __putstr(const char *str)
     }
 #endif
=20
-    conring_puts(str, len);
-
-    if ( !console_locks_busted )
-        tasklet_schedule(&notify_dom0_con_ring_tasklet);
+    conring_puts(str, len, !conring_no_notify);
 }
=20
 static int printk_prefix_check(char *p, char **pp)
@@ -1171,7 +1169,7 @@ void console_force_unlock(void)
     spin_debug_disable();
     rspin_lock_init(&console_lock);
     serial_force_unlock(sercon_handle);
-    console_locks_busted =3D 1;
+    conring_no_notify =3D true;
     console_start_sync();
 }
=20
--=20
2.34.1




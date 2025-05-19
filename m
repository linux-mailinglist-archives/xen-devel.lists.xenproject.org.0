Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D94ABC7F3
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:40:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990218.1374174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Lf-0004c8-7k; Mon, 19 May 2025 19:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990218.1374174; Mon, 19 May 2025 19:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Lf-0004Zo-3w; Mon, 19 May 2025 19:40:31 +0000
Received: by outflank-mailman (input) for mailman id 990218;
 Mon, 19 May 2025 19:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6Ld-0004Yu-9j
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:40:29 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d525ac1-34e9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 21:40:27 +0200 (CEST)
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
X-Inumbo-ID: 1d525ac1-34e9-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ufywkf3bczcgxnxdujomkfrazu.protonmail; t=1747683626; x=1747942826;
	bh=ExNNPytRMx+TBBWpl9H7gQEHGZzIhvwOBb7pDt+Cih4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D9gtujnHEiPenjxpAsyV5MDOwTmxxQPLufxBNWkg/GoSE9M0ol07YcOK4UqTQ06S8
	 aTWhmgUmTHns8QvfldBhSd3H/w1GUOitEFZLvfMpnGrKW6iJ4RLnfXRZ0zIOPcBxTy
	 +scs9ZL0zcHfPgYPHPG7w1bP8qDYl3Za35Z9dopiNfScGrQ+4ysL6nKJF/iI8AYRKY
	 fhzOsskjZcRKA0XIePfKef2Oxvwbk+ZMniz9jz1w0UY0iBACksXOLevdSJxgXy8aEV
	 L3b1MHe1pts8bzS5/vtWVBq7+T8ehnIaxXSpQgZaPYFop/eRyWNDsMN81YIZhKF4ii
	 3rW6hXpPpHkNg==
Date: Mon, 19 May 2025 19:40:20 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 1/3] xen/console: cleanup conring management
Message-ID: <20250519194002.1365454-2-dmukhin@ford.com>
In-Reply-To: <20250519194002.1365454-1-dmukhin@ford.com>
References: <20250519194002.1365454-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 56815f0c1ca0b0fc7f720a24e22918ab5df4d45f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Move conring tasklet code close to conring definitions in the console drive=
r
and rename conring tasklet variables by adding conring_ prefix for better
readability.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v4:
- added R-b
---
 xen/drivers/char/console.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..b4757844e6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -325,6 +325,16 @@ static void cf_check do_dec_thresh(unsigned char key, =
bool unused)
  * ********************************************************
  */
=20
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
 static void conring_puts(const char *str, size_t len)
 {
     ASSERT(rspin_is_locked(&console_lock));
@@ -594,13 +604,6 @@ static void cf_check serial_rx(char c)
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
@@ -650,7 +653,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(=
char) buffer,
             if ( opt_console_to_ring )
             {
                 conring_puts(kbuf, kcount);
-                tasklet_schedule(&notify_dom0_con_ring_tasklet);
+                tasklet_schedule(&conring_tasklet);
             }
=20
             nrspin_unlock_irq(&console_lock);
@@ -753,8 +756,6 @@ long do_console_io(
  * *****************************************************
  */
=20
-static bool console_locks_busted;
-
 static void __putstr(const char *str)
 {
     size_t len =3D strlen(str);
@@ -775,9 +776,8 @@ static void __putstr(const char *str)
 #endif
=20
     conring_puts(str, len);
-
-    if ( !console_locks_busted )
-        tasklet_schedule(&notify_dom0_con_ring_tasklet);
+    if ( !conring_no_notify )
+        tasklet_schedule(&conring_tasklet);
 }
=20
 static int printk_prefix_check(char *p, char **pp)
@@ -1171,7 +1171,7 @@ void console_force_unlock(void)
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




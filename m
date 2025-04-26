Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED0A9DCCC
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 20:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969283.1358451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kby-0001sV-8R; Sat, 26 Apr 2025 18:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969283.1358451; Sat, 26 Apr 2025 18:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kby-0001pP-5A; Sat, 26 Apr 2025 18:50:50 +0000
Received: by outflank-mailman (input) for mailman id 969283;
 Sat, 26 Apr 2025 18:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8kbw-0001Xu-RD
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 18:50:48 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dffd455-22cf-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 20:50:48 +0200 (CEST)
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
X-Inumbo-ID: 5dffd455-22cf-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745693446; x=1745952646;
	bh=iey7/TFInYOca1c5c+QCwD1da9aOSx54FLyeif0g//M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=emMKyYH9GS+mZuU+sAyQdIS+asoVTPCYhuqtCfLUIcQD+r2a3SHLAk718EaKqM1MO
	 XLudeLW2WvG1ku7feIIAVT15MsL/fg7yb+VOAzxwOPQS0tvL9PhrBc2rcEOSO0dSsK
	 +1iw5qP+aFPnIgBUJ/L5k858rmxpxMg50BPXdvQN1x+XyCfpIQ4GdJ8iL9GmboS1iF
	 OIjlYTphJy/tJqr/MFpHewwPx3D41Oh3pLegYnEB7PCkFEEYaOaikWjsHVjL7UvlxZ
	 Koo7LOp2EJklE1fym6bWWaSxqWnZY7Di5r8PCxSRNxwopiNMKgRG7Lap3cXKZw1BFa
	 3CD4ISTQ1O8lQ==
Date: Sat, 26 Apr 2025 18:50:41 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/3] xen/console: cleanup conring management
Message-ID: <20250426185021.100646-2-dmukhin@ford.com>
In-Reply-To: <20250426185021.100646-1-dmukhin@ford.com>
References: <20250426185021.100646-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c0842f0b4534ea8c129fd7ecc838092ce8bcf57b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Move console_locks_busted handling inside conring_puts() to remove
tasklet code duplication.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes v1->v2:
- added Stefano's R-b
---
 xen/drivers/char/console.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c3150fbdb7..aaa97088aa 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -325,6 +325,17 @@ static void cf_check do_dec_thresh(unsigned char key, =
bool unused)
  * ********************************************************
  */
=20
+static void cf_check notify_dom0_con_ring(void *unused)
+{
+    send_global_virq(VIRQ_CON_RING);
+}
+
+static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
+                               notify_dom0_con_ring,
+                               NULL);
+
+static bool console_locks_busted;
+
 static void conring_puts(const char *str, size_t len)
 {
     ASSERT(rspin_is_locked(&console_lock));
@@ -334,6 +345,9 @@ static void conring_puts(const char *str, size_t len)
=20
     if ( conringp - conringc > conring_size )
         conringc =3D conringp - conring_size;
+
+    if ( !console_locks_busted )
+        tasklet_schedule(&notify_dom0_con_ring_tasklet);
 }
=20
 long read_console_ring(struct xen_sysctl_readconsole *op)
@@ -594,13 +608,6 @@ static void cf_check serial_rx(char c)
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
@@ -648,10 +655,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
(char) buffer,
 #endif
=20
             if ( opt_console_to_ring )
-            {
                 conring_puts(kbuf, kcount);
-                tasklet_schedule(&notify_dom0_con_ring_tasklet);
-            }
=20
             nrspin_unlock_irq(&console_lock);
         }
@@ -753,8 +757,6 @@ long do_console_io(
  * *****************************************************
  */
=20
-static bool console_locks_busted;
-
 static void __putstr(const char *str)
 {
     size_t len =3D strlen(str);
@@ -775,9 +777,6 @@ static void __putstr(const char *str)
 #endif
=20
     conring_puts(str, len);
-
-    if ( !console_locks_busted )
-        tasklet_schedule(&notify_dom0_con_ring_tasklet);
 }
=20
 static int printk_prefix_check(char *p, char **pp)
--=20
2.34.1




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF30A79932
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 02:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936147.1337458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086K-00025t-3J; Thu, 03 Apr 2025 00:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936147.1337458; Thu, 03 Apr 2025 00:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086K-00023I-00; Thu, 03 Apr 2025 00:06:32 +0000
Received: by outflank-mailman (input) for mailman id 936147;
 Thu, 03 Apr 2025 00:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u086I-000234-P9
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 00:06:30 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dba8132-101f-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 02:06:29 +0200 (CEST)
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
X-Inumbo-ID: 7dba8132-101f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=loyd6buz5vf63b67ydln5ulsbm.protonmail; t=1743638788; x=1743897988;
	bh=TBQLnMlSerAh3mR7qO98G0AbutCfSkHB8vVcz9TwNvY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=PppSoZd4UgwV5D/68YhO2Lbx4eJjbIX9gzEMQ4qIb3yfQbGmFCTRKFH8chjItIRmq
	 vGitz+iz9RUM6bPLc/wKjR4P7ISo/NFy9MPefeEi59jkr8J5eiJ/sjAXvR9DLHYvcv
	 qpwHE4Rv3fydF6uWc82lzJPmV7UV3UpY+8ogDuqpl99pKlUYOEy1s2tBbxaUkgOxtP
	 LEHM6riRiQxR/4XPeoRo3Tyd71eoY3Pn6i9dXaYGtehUD32vaju6nKQwIsoq6xm4LP
	 Lmh0X1Lg/YsBwSriH+YDfUVyrZrzqkmqwUb/HiS3I0/WLYJ5LQx3709CQzgjGa2yEh
	 f95i2zubfAUwA==
Date: Thu, 03 Apr 2025 00:06:22 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 1/3] xen/console: cleanup conring management
Message-ID: <20250403000604.169619-2-dmukhin@ford.com>
In-Reply-To: <20250403000604.169619-1-dmukhin@ford.com>
References: <20250403000604.169619-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4c3ff2d98affcb365872036c446a394a36e85caa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Move console_locks_busted handling inside conring_puts() to remove
tasklet code duplication.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
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




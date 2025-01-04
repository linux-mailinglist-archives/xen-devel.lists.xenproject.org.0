Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF74A011A6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864711.1276004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQo-0006i9-9N; Sat, 04 Jan 2025 01:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864711.1276004; Sat, 04 Jan 2025 01:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQn-0006b6-M5; Sat, 04 Jan 2025 01:58:25 +0000
Received: by outflank-mailman (input) for mailman id 864711;
 Sat, 04 Jan 2025 01:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQk-0005Ay-Gz
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d120322-ca3f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 02:58:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AB401A411CE;
 Sat,  4 Jan 2025 01:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9937EC4CEE6;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9332FE77198;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5d120322-ca3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=J1IQdeQ98d0vl6JdSs/gueZbYb4U6ovRO5LjK7ff2wk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XQAZPVJ0qTKM/gXH+OPM9HCQu5UK1W10JCYvPHJREPMm+iwdwKPdyLjrd7mwZnDJ+
	 tXPEJ/sCMvOJ32DH5fK46DnIokHK4hHcNe+bgrH+ihb9KBV8EJuL6XvAITd8TqHMS6
	 EhyKA+gJbQ2R+wOSMrAP85FRIvzMWg8Yamp05s2iF5S+xZkWNkLO2zue0XNpqgcJG0
	 kV/jDoguwyMmw+JCvBmoEpsIdEc28fbXmiBrIO6PHZ+2V+LEf8ZOOYlsR5GoIV2Gwf
	 UlOT1QpwsJf0U4LvMbaaYZYXhoIJZndOXwx4/Gvs36HIen6H9EzUADxTZmPm4byDE0
	 tZkP8R9bBDm4A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:22 -0800
Subject: [PATCH v3 16/24] xen/console: introduce console_write()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-16-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=4614;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=DQVskSH09OmedMdoHofKReknLx5qPNl8KeCzK1S41sE=;
 b=JfKZBsVOthWu4FvX+ORA18fOi5NiAdEjNH8Vtw0QxvRj8s+KeCXrvayD9yOs3vC+Koqfp1eeD
 kFqogSxq7OtC3pAsXmZfIeTbMvdrO3vcUFADurPkJJ2GGhzt05pytia
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

PV Linux kernel uses HYPERVISOR_console_io hypercall for early console which
ends up being handled by Xen's console driver's guest_console_write().

guest_console_write() duplicates the code from __putstr(), elimitate code
duplication.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 103 ++++++++++++++++++++++++---------------------
 1 file changed, 55 insertions(+), 48 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a33132b8fad95a1ad7e0aab4aef3fa3e46a5c03a..2f776b2f07cb15fae8060f3574db73234a38727a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -40,6 +40,11 @@
 #include <asm/guest.h>
 #endif
 
+/* Console flags. */
+enum {
+    CONSOLE_RING    = BIT(0, U),
+};
+
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] = OPT_CONSOLE_STR;
 string_param("console", opt_console);
@@ -636,6 +641,16 @@ static void cf_check notify_dom0_con_ring(void *unused)
 static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
                                notify_dom0_con_ring, NULL);
 
+static bool console_locks_busted;
+
+static void conring_write(const char *str, size_t len)
+{
+    conring_puts(str, len);
+
+    if ( !console_locks_busted )
+        tasklet_schedule(&notify_dom0_con_ring_tasklet);
+}
+
 #ifdef CONFIG_X86
 static inline void xen_console_write_debug_port(const char *buf, size_t len)
 {
@@ -644,8 +659,47 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
                    : "=&S" (tmp), "=&c" (tmp)
                    : "0" (buf), "1" (len), "d" (XEN_HVM_DEBUGCONS_IOPORT) );
 }
+
+static void xen_console_write(const char *str, size_t len)
+{
+    if ( xen_guest )
+        xen_hypercall_console_write(str, len);
+    else
+        xen_console_write_debug_port(str, len);
+}
 #endif
 
+/*
+ * Write characters to console.
+ *
+ * That will handle all possible scenarios working w/ console
+ * - serial console;
+ * - VGA console (x86 only);
+ * - __HYPERVISOR_console_io hypercall (x86 only);
+ * - debug I/O port (x86 only);
+ * - PV console.
+ */
+static void console_write(const char *str, size_t len, unsigned int flags)
+{
+    ASSERT(rspin_is_locked(&console_lock));
+
+    console_serial_puts(str, len);
+    video_puts(str, len);
+
+#ifdef CONFIG_X86
+    if ( opt_console_xen )
+        xen_console_write(str, len);
+#endif
+
+    if ( flags & CONSOLE_RING )
+        conring_write(str, len);
+}
+
+static inline void __putstr(const char *str)
+{
+    console_write(str, strlen(str), CONSOLE_RING);
+}
+
 static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                                 unsigned int count)
 {
@@ -666,28 +720,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
 
         if ( is_hardware_domain(cd) )
         {
-            /* Use direct console output as it could be interactive */
             nrspin_lock_irq(&console_lock);
-
-            console_serial_puts(kbuf, kcount);
-            video_puts(kbuf, kcount);
-
-#ifdef CONFIG_X86
-            if ( opt_console_xen )
-            {
-                if ( xen_guest )
-                    xen_hypercall_console_write(kbuf, kcount);
-                else
-                    xen_console_write_debug_port(kbuf, kcount);
-            }
-#endif
-
-            if ( opt_console_to_ring )
-            {
-                conring_puts(kbuf, kcount);
-                tasklet_schedule(&notify_dom0_con_ring_tasklet);
-            }
-
+            console_write(kbuf, kcount, !!opt_console_to_ring);
             nrspin_unlock_irq(&console_lock);
         }
         else
@@ -788,33 +822,6 @@ long do_console_io(
  * *****************************************************
  */
 
-static bool console_locks_busted;
-
-static void __putstr(const char *str)
-{
-    size_t len = strlen(str);
-
-    ASSERT(rspin_is_locked(&console_lock));
-
-    console_serial_puts(str, len);
-    video_puts(str, len);
-
-#ifdef CONFIG_X86
-    if ( opt_console_xen )
-    {
-        if ( xen_guest )
-            xen_hypercall_console_write(str, len);
-        else
-            xen_console_write_debug_port(str, len);
-    }
-#endif
-
-    conring_puts(str, len);
-
-    if ( !console_locks_busted )
-        tasklet_schedule(&notify_dom0_con_ring_tasklet);
-}
-
 static int printk_prefix_check(char *p, char **pp)
 {
     int loglvl = -1;

-- 
2.34.1




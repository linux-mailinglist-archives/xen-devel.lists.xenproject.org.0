Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006A9E6695
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 06:01:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849771.1264338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQT4-0002Nq-N9; Fri, 06 Dec 2024 05:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849771.1264338; Fri, 06 Dec 2024 05:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQT4-0002MJ-KI; Fri, 06 Dec 2024 05:01:30 +0000
Received: by outflank-mailman (input) for mailman id 849771;
 Fri, 06 Dec 2024 05:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA8-0004Ka-No
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64187365-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C87F5C7320;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3109C4CEE0;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CCB59E77171;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
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
X-Inumbo-ID: 64187365-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=eiE+Vk1+xwNQSS5lGvaUqRJncjb6mebSOM3N939URVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d7BCDKwQXwZ4cbD1bFWhjDN/m+kXVWns99wYk96kr3EEL6V5TOfihPPg1zdjHjzYE
	 hbhg3UGCriGtvZwt73RW5evUKX2XjkeYiDqjSa/hWTbaza3FSVSlasA/bLG4ECCjuR
	 3C71xULHuxVorDFC9FXMO9uOOpM6Msregplpkrb71Kd9Nus2tuNTqYwGJmq6ZN6n9s
	 N6tfJBP8EvviPMtZ0KcOpzCVI6F73bO3nHt3c2tH/jVHmCMD+A4rAjTZ+nvbT5VHxt
	 XhxI6AQayVJ5sIuSPZsArLR72nEYNXrHvpPYAepN2BrXFBJmh+6eiRau/op/7QioEa
	 9ZzR5RMXS6d3A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:53 -0800
Subject: [PATCH v2 23/35] xen/console: introduce console_write()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-23-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=5090;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=IJndR90ln3ebR9JBLgcF8uZuUsxgXYKVX60Wdeeyfgg=;
 b=jHyeiWGUT3FC9wqdvmDyFZNzJI9ClfZ3Imp+FXv2XyaFHnvRcCAdBiVl5YgFppU5q80Nh4ylX
 0lCDMsThybKD8ezbX7OiCuZe8c8k5/af+wQnUOUAs2dL7Iq58CX25YI
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
 xen/drivers/char/console.c | 97 +++++++++++++++++++++++++---------------------
 1 file changed, 53 insertions(+), 44 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ce3639a4cdcda00ea63e3bf119bc3b242cbfdf6a..115967d179998cba4a81578caba09db4e4aca7f7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -63,6 +63,8 @@ static const char __initconst warning_sync_console[] =
     "However it can introduce SIGNIFICANT latencies and affect\n"
     "timekeeping. It is NOT recommended for production use!\n";
 
+/* Flag: use conring for early console; switches to opt_console_to_ring */
+static bool __read_mostly use_conring = true;
 /* console_to_ring: send guest (incl. dom 0) console data to console ring. */
 static bool __read_mostly opt_console_to_ring;
 boolean_param("console_to_ring", opt_console_to_ring);
@@ -661,6 +663,16 @@ static void cf_check notify_dom0_con_ring(void *unused)
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
@@ -669,8 +681,44 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
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
+#else
+static inline void xen_console_write(const char *str, size_t len)
+{
+}
 #endif
 
+/*
+ * Write characters to console.
+ *
+ * That will handle all possible scenarios working w/ console
+ * - serial console;
+ * - video output;
+ * - __HYPERVISOR_console_io hypercall (x86 only);
+ * - debug I/O port (x86 only);
+ * - forward to Xen event channel.
+ */
+static void console_write(const char *str, size_t len)
+{
+    ASSERT(rspin_is_locked(&console_lock));
+
+    console_serial_puts(str, len);
+    video_puts(str, len);
+
+    if ( opt_console_xen )
+        xen_console_write(str, len);
+
+    if ( use_conring )
+        conring_write(str, len);
+}
+
 static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                                 unsigned int count)
 {
@@ -691,28 +739,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
 
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
+            console_write(kbuf, kcount);
             nrspin_unlock_irq(&console_lock);
         }
         else
@@ -813,31 +841,9 @@ long do_console_io(
  * *****************************************************
  */
 
-static bool console_locks_busted;
-
 static void __putstr(const char *str)
 {
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
+    console_write(str, strlen(str));
 }
 
 static int printk_prefix_check(char *p, char **pp)
@@ -1171,6 +1177,9 @@ void __init console_endboot(void)
 
     video_endboot();
 
+    use_conring = opt_console_to_ring;
+    smp_wmb();
+
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);
     register_irq_keyhandler('+', &do_inc_thresh,

-- 
2.34.1




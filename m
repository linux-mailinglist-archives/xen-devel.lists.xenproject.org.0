Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9E9D9FB4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844323.1259905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG57f-0002Po-Pj; Tue, 26 Nov 2024 23:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844323.1259905; Tue, 26 Nov 2024 23:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG57f-0002Nj-MX; Tue, 26 Nov 2024 23:37:35 +0000
Received: by outflank-mailman (input) for mailman id 844323;
 Tue, 26 Nov 2024 23:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sn-0000Ao-NE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fc4fba5-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F59F5C5D77;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45451C4CED0;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3B882D66B8E;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3fc4fba5-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNmYzRmYmE1LWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzI1LjgxMDY0OCwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=5p7FQirypDNvXa/ADc/A3qm2m9f35PQKXZmP0f/F4yM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vPwWjyWIjN/ljcfhd3K4w3gyn1iFmZMe/TRHxFN8DZvVAIz/5prMPhINBiaGqzQZz
	 9uEe5ei3yODyUP9cJ2uVHO6ISEktdurzgm7RNtBS4mULVAWdTDQmBp1WyCpeyQ0XoE
	 QfgnSdSQzQeebIYM4HUrqztxN3OIzzNl1Y7eabDWYKyfNG8SSMbHjZiIDARIilMOCt
	 ahAKkPlpuCK5srsQ0IvgjOyI/mLPDUJT86iwSDM+ZVtsYNQ5lhj1GNZERmjScV8MXV
	 Ke1BRLvORdIaANR5/Wf8mOIniodkcTgkgvU2VMGtnMrvsHkXG4usxTxKLrq1RQex+/
	 Pt9f8eaqqaz4w==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:16 -0800
Subject: [PATCH 26/36] xen/console: introduce console_write()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-26-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=4283;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=mC1dfr4+26P41BllPMG6MZbu9F46btGiiA2X1kH3gME=;
 b=hb4ZH7CsrUUdK9/NkrG9FYu22AqGi/bZMiyvvI9e3EZYIzNKn/vse7pJTCknstGu43n9nc68n
 zegv/33ak9sCf0BS87RJVnZ4f1YoDras7AKDidQNrQtdz43jVQn137A
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
 xen/drivers/char/console.c | 94 ++++++++++++++++++++++++----------------------
 1 file changed, 50 insertions(+), 44 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 4439e00763631969767719053cdc81e67c2cda2c..3d8d3c852e69d8fddd1d978fdd8932eb75551f25 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -665,6 +665,19 @@ static void cf_check notify_dom0_con_ring(void *unused)
 static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
                                notify_dom0_con_ring, NULL);
 
+static bool console_locks_busted;
+
+static void conring_write(const char *str, size_t len)
+{
+    if ( opt_console_to_ring )
+    {
+        conring_puts(str, len);
+
+        if ( !console_locks_busted )
+            tasklet_schedule(&notify_dom0_con_ring_tasklet);
+    }
+}
+
 #ifdef CONFIG_X86
 static inline void xen_console_write_debug_port(const char *buf, size_t len)
 {
@@ -673,8 +686,43 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
                    : "=&S" (tmp), "=&c" (tmp)
                    : "0" (buf), "1" (len), "d" (XEN_HVM_DEBUGCONS_IOPORT) );
 }
+
+static void xen_console_write(const char *str, size_t len)
+{
+    if ( opt_console_xen )
+    {
+        if ( xen_guest )
+            xen_hypercall_console_write(str, len);
+        else
+            xen_console_write_debug_port(str, len);
+    }
+}
+#else
+static void xen_console_write(const char *str, size_t len)
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
+    xen_console_write(str, len);
+    conring_write(str, len);
+}
+
 static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                                 unsigned int count)
 {
@@ -695,28 +743,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
 
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
@@ -817,31 +845,9 @@ long do_console_io(
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

-- 
2.34.1




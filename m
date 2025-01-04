Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60172A011A7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864708.1275975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQl-00062d-NV; Sat, 04 Jan 2025 01:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864708.1275975; Sat, 04 Jan 2025 01:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQl-0005wf-CW; Sat, 04 Jan 2025 01:58:23 +0000
Received: by outflank-mailman (input) for mailman id 864708;
 Sat, 04 Jan 2025 01:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQi-0005Ax-QA
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca73fa4-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E33BF5C60ED;
 Sat,  4 Jan 2025 01:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D71FBC4CEE2;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CF2FCE77188;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
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
X-Inumbo-ID: 5ca73fa4-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955894;
	bh=+3lCSi+uoUjLrXI5KsViTk7A/iJtn55QaL5KYfpM3dY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VtKbMyAsDxs/eyxr7xdavPZ/ZX8Cz0NvMrqSJFth6/byn76U9CHyJ4UFMd2mM7tlY
	 mupTUqBtSA8RRG8PsQz1Ge2aCj9LMffCfedtw2fktoQxfEJXiv8FiIbI6p8yRhWSRI
	 u+yI4HgeZKfSbx6Pv8r5JhF5SEDSJDISEsXCoxp2npdZSp6RRuqOFQysZ9PxoEbAqu
	 5E7fkgS98rnm+pB4ROJeykD+r3/D/WymT0Bw3jWnEnzhs5SX2MuancdfEzFpSRJQGm
	 MH8xKVnACypKZoTV7lvcmv0uukCf7QYSjGoAnWkjD6nHDzHCwkLwgMpdDw/Ob9ezCL
	 7U8CzPUPEx8Mg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:10 -0800
Subject: [PATCH v3 04/24] xen/console: introduce console_{get,put}_domain()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-4-c5d36b31d66c@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=4310;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=R8dApJ/XiKqchnt0Y9PJCOHsEWibqS36Kuatzu/KWu8=;
 b=rK9fr+LsEaTbokvlrCZ5xF8dd1MfNZorXXzg3xb4JWUj/zpaTVp8S/Q0xZx0mVKdNRQp0oBC1
 1zCgsNnNpYABQvoEcda1xy4WpELmdyQjZUv036bWzaLNEjynD9w9v9J
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

console_input_domain() takes an RCU lock to protect domain structure.
That implies call to rcu_unlock_domain() after use.

Introduce a pair of console_get_domain() / console_put_domain() to highlight
the correct use of the call within the code interacting with Xen console
driver.

Also, use new calls in the console driver in __serial_rx(). That prepares
the code for the follow-on console driver cleanup series.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c      |  6 +++---
 xen/drivers/char/console.c | 44 +++++++++++++++++++++-----------------------
 xen/include/xen/console.h  |  3 ++-
 3 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index c72f3778bfedf9434f9d1a0cd7fa33852563112d..66047bf33cedb930a6bd7c96577913cd1ae08f05 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -78,7 +78,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
     unsigned long flags;
     struct vpl011 *vpl011 = &d->arch.vpl011;
     struct vpl011_xen_backend *intf = vpl011->backend.xen;
-    struct domain *input = console_input_domain();
+    struct domain *input = console_get_domain();
 
     VPL011_LOCK(d, flags);
 
@@ -123,8 +123,8 @@ static void vpl011_write_data_xen(struct domain *d, uint8_t data)
     vpl011_update_interrupt_status(d);
 
     VPL011_UNLOCK(d, flags);
-    if ( input != NULL )
-        rcu_unlock_domain(input);
+
+    console_put_domain(input);
 }
 
 /*
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 1411c991977b5fb26ee5709e523b7bc32b612808..4785f0e93a17e3ecba79a7813d2928f946abab8f 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -475,15 +475,18 @@ static unsigned int __read_mostly console_rx = 0;
 
 #define max_console_rx (max_init_domid + 1)
 
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-/* Make sure to rcu_unlock_domain after use */
-struct domain *console_input_domain(void)
+struct domain *console_get_domain(void)
 {
     if ( console_rx == 0 )
             return NULL;
     return rcu_lock_domain_by_id(console_rx - 1);
 }
-#endif
+
+void console_put_domain(struct domain *d)
+{
+    if ( d )
+        rcu_unlock_domain(d);
+}
 
 static void switch_serial_input(void)
 {
@@ -529,14 +532,18 @@ static void switch_serial_input(void)
 
 static void __serial_rx(char c)
 {
+    struct domain *d;
     int rc = 0;
 
-    switch ( console_rx )
-    {
-    case 0:
+    if ( console_rx == 0 )
         return handle_keypress(c, false);
 
-    case 1:
+    d = console_get_domain();
+    if ( !d )
+        return;
+
+    if ( is_hardware_domain(d) )
+    {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
@@ -549,23 +556,12 @@ static void __serial_rx(char c)
          * getting stuck.
          */
         send_global_virq(VIRQ_CONSOLE);
-        break;
-
+    }
 #ifdef CONFIG_SBSA_VUART_CONSOLE
-    default:
-    {
-        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
-
-        if ( d )
-        {
-            rc = vpl011_rx_char_xen(d, c);
-            rcu_unlock_domain(d);
-        }
-
-        break;
-    }
+    else
+        /* Deliver input to the emulated UART. */
+        rc = vpl011_rx_char_xen(d, c);
 #endif
-    }
 
 #ifdef CONFIG_X86
     if ( pv_shim && pv_console )
@@ -574,6 +570,8 @@ static void __serial_rx(char c)
 
     if ( rc )
         printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
+
+    console_put_domain(d);
 }
 
 static void cf_check serial_rx(char c)
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 6dfbade3ece36352c74f1124305da945b210f2a7..8631fd279bfe1aba42b61d76fbdb45016c2859f9 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -31,7 +31,8 @@ void console_end_sync(void);
 void console_start_log_everything(void);
 void console_end_log_everything(void);
 
-struct domain *console_input_domain(void);
+struct domain *console_get_domain(void);
+void console_put_domain(struct domain *d);
 
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.

-- 
2.34.1




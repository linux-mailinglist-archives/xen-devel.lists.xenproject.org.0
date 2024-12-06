Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7B9E6651
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849423.1264141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA9-00080E-G9; Fri, 06 Dec 2024 04:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849423.1264141; Fri, 06 Dec 2024 04:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA8-0007hl-Lk; Fri, 06 Dec 2024 04:41:56 +0000
Received: by outflank-mailman (input) for mailman id 849423;
 Fri, 06 Dec 2024 04:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA0-0004Ka-Mb
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 631ce79d-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B68855C7311;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51702C4CEE1;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 469A7E77171;
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
X-Inumbo-ID: 631ce79d-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=owjhPqMN/sfHwDFdAwELQ23W67gacGzY3DCmgAbUG18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DLTBKB4oxMWdcE1LnVcKmfZjfrKJIOFEgEJ1YU6TUpJ3qeYzBimAOcHSF5Y0zuJk3
	 cvauLBWrtXW/9TNGZwEg8SHr14QqSa1+q+jRj6tt4Gexg+KYBDCYxxnuvsRCi54Nm3
	 MNKzuFfuXxm57lkeHvO72G3bm8U6dD5vh3n3klUHX/2R913vGc/KkcC6Z8JMiLveQr
	 hflxbWwGj9pwzj3JZhpxZNFh2Nw30U2zleCYzIatOYhuN8D5Ux+qKwJPJeiAWawYiG
	 cR3ux1HHjGZBMVbYyukJS1P44BHpt1Y/yobwsJx9+MGA573+zrf0FRX5L+gfc3GTYH
	 AgjQzBjBJzH6Q==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:45 -0800
Subject: [PATCH v2 15/35] xen/console: rename console_rx to console_owner
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-15-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=3503;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=adx3ttDq9DGxs5v/iNqFG/t0SkuLKBWjA23PcHLO1+c=;
 b=U0p0Hzrt1FgB0xBL5A9gFP0Y7Mk23wTztAC/UqxMEAxRrYxGJSk3Xqom8dczkyZN2c2Nxokon
 RNRJP3sESjoB+bT52kOM2zEVS1JjKi7wpMFA62krW9kIMHww0XCdO41
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Preparation for the follow on change to switch console_owner to
domid_t address space.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f8a7db385c9525cabc69ceb1a84d73f57863aa45..86bf899ada8f8221ffc77bcffb1f58777a22198e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -467,11 +467,11 @@ static void cf_check dump_console_ring_key(unsigned char key)
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
 /*
- * console_rx=0 => input to xen
- * console_rx=1 => input to dom0 (or the sole shim domain)
- * console_rx=N => input to dom(N-1)
+ * console_owner=0 => input to xen
+ * console_owner=1 => input to dom0 (or the sole shim domain)
+ * console_owner=N => input to dom(N-1)
  */
-static unsigned int __read_mostly console_rx = 0;
+static unsigned int __read_mostly console_owner = 0;
 
 #define max_console_rx (max_init_domid + 1)
 
@@ -479,15 +479,15 @@ static unsigned int __read_mostly console_rx = 0;
 /* Make sure to rcu_unlock_domain after use */
 struct domain *rcu_lock_domain_console_owner(void)
 {
-    if ( console_rx == 0 )
+    if ( console_owner == 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_rx - 1);
+    return rcu_lock_domain_by_id(console_owner - 1);
 }
 #endif
 
 static void console_find_owner(void)
 {
-    unsigned int next_rx = console_rx;
+    unsigned int next_rx = console_owner;
 
     /*
      * Rotate among Xen, dom0 and boot-time created domUs while skipping
@@ -500,7 +500,7 @@ static void console_find_owner(void)
 
         if ( next_rx++ >= max_console_rx )
         {
-            console_rx = 0;
+            console_owner = 0;
             printk("*** Serial input to Xen");
             break;
         }
@@ -515,7 +515,7 @@ static void console_find_owner(void)
         if ( d )
         {
             rcu_unlock_domain(d);
-            console_rx = next_rx;
+            console_owner = next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -529,7 +529,7 @@ static void console_find_owner(void)
 
 static void __serial_rx(char c)
 {
-    switch ( console_rx )
+    switch ( console_owner )
     {
     case 0:
         return handle_keypress(c, false);
@@ -552,7 +552,7 @@ static void __serial_rx(char c)
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     default:
     {
-        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
+        struct domain *d = rcu_lock_domain_by_id(console_owner - 1);
 
         /*
          * If we have a properly initialized vpl011 console for the
@@ -563,7 +563,7 @@ static void __serial_rx(char c)
             vpl011_rx_char_xen(d, c);
         else
             printk("Cannot send chars to Dom%d: no UART available\n",
-                   console_rx - 1);
+                   console_owner - 1);
 
         if ( d != NULL )
             rcu_unlock_domain(d);
@@ -1116,7 +1116,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_rx = max_console_rx;
+        console_owner = max_console_rx;
 
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);

-- 
2.34.1




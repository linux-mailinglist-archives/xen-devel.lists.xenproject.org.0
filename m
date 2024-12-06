Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B89E668C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849686.1264287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQOa-0005Zw-6S; Fri, 06 Dec 2024 04:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849686.1264287; Fri, 06 Dec 2024 04:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQOa-0005XW-3w; Fri, 06 Dec 2024 04:56:52 +0000
Received: by outflank-mailman (input) for mailman id 849686;
 Fri, 06 Dec 2024 04:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA4-0004Kb-0M
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 634d5860-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 077005C7318;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995A9C4CEDE;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF5CE77173;
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
X-Inumbo-ID: 634d5860-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=Msd9ALOQsKWgqYjqZp3vEbU4YxKp+IL/6j5doF/TX4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X+rwlw/Zhai565ag9BYuM8ARm2DmW+qeIP0rEQDoOGMhV8nJZiXDotnvEi2++uIOv
	 tIZVZeOY8vKJou4RWDXs6BDXUHTYW/wiaDpDWvqEhJtJ+tcbs5dl0Hn/SxL1DMXWx6
	 mT9SrdjkqUkGBqZtgwS5Lw5L5MaFD5MQrqvzgInx43ChGbWJzE0Qemtll4RsmutM9g
	 fuPkDIIyCU5D9dh+XvlrNsFgSzL8yN71Xt6F5GUUURgqUT18KBmJdLY3cLMsyo7F6Y
	 QRWBJ7c4h+zrWvJXpzuthPGUaGfrc1nCNpPPOSdTmkil9QBGNbrA+0JuQTtBs1qp09
	 FQfBt7I9O/AGw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:49 -0800
Subject: [PATCH v2 19/35] xen/console: introduce console_set_owner()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=6105;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=LaoLtTtPVB803Wx66ywoNWCuGefL+9P7BcXWkOi4Ttw=;
 b=qIUuqjar9jBz7vlbvZO91eK5QZyrPGkyZdxoOW+bK/PhH1tCuhvcar4R2tTKQ6B0C7F6lxM93
 WMCmcpor8byDDi3SZubIYvLxdlI1nk8JsNjv/6WTA/rYizZqV4c2rlQ
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

console_set_owner() is introduced for setting the new console owner.

Switches console owner to domain ID vs range of integer numbers mapped to
domain IDs.

This a public API to console driver, will be used in the follow on code change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 122 ++++++++++++++++++++++++++-------------------
 xen/include/xen/console.h  |   1 +
 2 files changed, 71 insertions(+), 52 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 8cbac54c66044ae8581e486a782102b75c8bfaa9..52cf64dbf6fd18d599cb88835d03501a23b3e3c4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(unsigned char key)
 
 /*
  * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
- * and the DomUs started from Xen at boot.
+ * and the DomUs.
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
+
 /*
- * console_owner=0 => input to xen
- * console_owner=1 => input to dom0 (or the sole shim domain)
- * console_owner=N => input to dom(N-1)
+ * Current console owner domain ID: either Xen or domain w/ d->is_console ==
+ * true.
+ *
+ * Initialized in console_endboot().
  */
-static unsigned int __read_mostly console_owner = 0;
+static domid_t __read_mostly console_owner;
 
-#define max_console_rx (max_init_domid + 1)
+static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
+{
+    struct domain *d;
+
+    d = rcu_lock_domain_by_id(domid);
+
+    if ( d == NULL )
+        return NULL;
+
+    if ( d->is_console )
+        return d;
+
+    rcu_unlock_domain(d);
+
+    return NULL;
+}
 
-#ifdef CONFIG_SBSA_VUART_CONSOLE
 /* Make sure to rcu_unlock_domain after use */
 struct domain *rcu_lock_domain_console_owner(void)
 {
-    if ( console_owner == 0 )
-            return NULL;
-    return rcu_lock_domain_by_id(console_owner - 1);
+    return rcu_lock_domain_console_by_id(console_owner);
 }
-#endif
 
-static void console_find_owner(void)
+static bool console_owner_possible(domid_t domid)
 {
-    unsigned int next_rx = console_owner;
-
-    /*
-     * Rotate among Xen, dom0 and boot-time created domUs while skipping
-     * switching serial input to non existing domains.
-     */
-    for ( ; ; )
-    {
-        domid_t domid;
-        struct domain *d;
-
-        if ( next_rx++ >= max_console_rx )
-        {
-            console_owner = 0;
-            printk("*** Serial input to Xen");
-            break;
-        }
-
-        if ( consoled_is_enabled() && next_rx == 1 )
-            domid = get_initial_domain_id();
-        else
-            domid = next_rx - 1;
-
-        d = rcu_lock_domain_by_id(domid);
-        if ( d == NULL )
-            continue;
-
-        if ( d->is_console )
-        {
-            rcu_unlock_domain(d);
-            console_owner = next_rx;
-            printk("*** Serial input to DOM%u", domid);
-            break;
-        }
+    struct domain *d;
 
+    d = rcu_lock_domain_console_by_id(domid);
+    if ( d != NULL )
         rcu_unlock_domain(d);
-    }
+
+    return d != NULL;
+}
+
+int console_set_owner(domid_t domid)
+{
+    if ( domid == DOMID_XEN )
+        printk("*** Serial input to Xen");
+    else if ( console_owner_possible(domid) )
+        printk("*** Serial input to DOM%u", domid);
+    else
+        return -ENOENT;
+
+    console_owner = domid;
 
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
                opt_conswitch[0]);
     printk("\n");
+
+    return 0;
+}
+
+/*
+ * Switch console input focus.
+ * Rotates input focus among Xen, dom0 and boot-time created domUs while
+ * skipping switching serial input to non existing domains.
+ */
+static void console_find_owner(void)
+{
+    domid_t i, n = max_init_domid + 1;
+
+    if ( console_owner == DOMID_XEN )
+        i = get_initial_domain_id();
+    else
+        i = console_owner + 1;
+
+    for ( ; i < n; i++ )
+        if ( !console_set_owner(i) )
+            break;
+    if ( i == n )
+        console_set_owner(DOMID_XEN);
 }
 
 static void __serial_rx(char c)
 {
     switch ( console_owner )
     {
-    case 0:
+    case DOMID_XEN:
         return handle_keypress(c, false);
 
-    case 1:
+    case 0:
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
@@ -556,7 +574,7 @@ static void __serial_rx(char c)
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     default:
     {
-        struct domain *d = rcu_lock_domain_by_id(console_owner - 1);
+        struct domain *d = rcu_lock_domain_by_id(console_owner);
 
         /*
          * If we have a properly initialized vpl011 console for the
@@ -567,7 +585,7 @@ static void __serial_rx(char c)
             vpl011_rx_char_xen(d, c);
         else
             printk("Cannot send chars to Dom%d: no UART available\n",
-                   console_owner - 1);
+                   console_owner);
 
         if ( d != NULL )
             rcu_unlock_domain(d);
@@ -1126,7 +1144,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_owner = max_console_rx;
+        console_owner = DOMID_XEN;
 
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 0e211e44d9703c804e18f52c9743916f8d2a9d4e..57c482cfbf2da15b011e64841ea086e779f4588d 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -32,6 +32,7 @@ void console_start_log_everything(void);
 void console_end_log_everything(void);
 
 struct domain *rcu_lock_domain_console_owner(void);
+int console_set_owner(domid_t);
 
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.

-- 
2.34.1




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE629E667E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849574.1264227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJD-00012n-65; Fri, 06 Dec 2024 04:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849574.1264227; Fri, 06 Dec 2024 04:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQJD-00011D-3J; Fri, 06 Dec 2024 04:51:19 +0000
Received: by outflank-mailman (input) for mailman id 849574;
 Fri, 06 Dec 2024 04:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA2-0004Ka-Mj
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64042d93-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B98C5C731E;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1AD2C4CEE3;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BC688E77173;
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
X-Inumbo-ID: 64042d93-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=veV7CIvzm41wMp2I++KuzZXz6Dndb+ahoqqMyVD1SYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hZTS+FIs6hRZT6n7ePbupewCgCGWvHLzGBsxXoqKjFHNtPVV+uUthUW166T4EKCwp
	 oa36bOKHyxxHG0qkF4ahxl10NOheu6W/wN0XwKFEeMnWYVYNKQuDpSrqRtUUYTMYk3
	 c45M3cThzdQwXBgFxK6Zt6d1S9yaZKZmnHErA+ltwvuKPajEokq8ROZGaRbxlZObfR
	 ysqQwqGZQueyFq8ptU/PZvjNlyWeVKFT7uxNSXWVw3990flDly05RCiD4pJT2PlBEP
	 Ala+FDE+cTe4Wk8qK8lsd8a6xjCZd69FD5fyEgruUZdd+gk5zmxUf/5BkecXJX6bE7
	 bQjFS8KDGB5yA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:52 -0800
Subject: [PATCH v2 22/35] xen/console: introduce
 handle_keypress_in_domain()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-22-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=3261;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=4Oy6tSy4ntedYhToxhGSrQwpwAn7T/tf6/puha/ackI=;
 b=SIjDO2ws3eUPEyBeLQ5QQZasuvP/vMSYzru4/T8IBkGlLwzyl1Bg1uoR7rFhT+sbGwXgUo04+
 zxn9LrrwYdHAnc0oTPGSzkubS8ZnaOVnYA38M7BnDrd3OcReHl/I/5H
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

With introduction of NS8250 emulator for x86, the logic of switching console
focus gets more convoluted: HVM domain w/ NS8205 must be able to receive the
physical console input for guest VM debugging.

Also, existing code does not honor `hardware_dom=` xen command line parameter
(hardware domain ID does _not_ necessarily starts from 0).

Introduce handle_keypress_in_domain() to account for all scenarios of console
input forwarding.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 72 +++++++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 6261bdb5a2ac1075bc89fa408c0fd6cfef380ae6..ce3639a4cdcda00ea63e3bf119bc3b242cbfdf6a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -570,14 +570,16 @@ static void console_init_owner(void)
     console_set_owner(domid);
 }
 
-static void __serial_rx(char c)
+static void handle_keypress_in_domain(struct domain *d, char c)
 {
-    switch ( console_owner )
-    {
-    case DOMID_XEN:
-        return handle_keypress(c, false);
+    int rc = 0;
 
-    case 0:
+    /*
+     * Deliver input to the hardware domain buffer.
+     * NB: must be the first check: hardware domain may have emulated UART.
+     */
+    if ( d == hardware_domain )
+    {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
@@ -590,34 +592,44 @@ static void __serial_rx(char c)
          * getting stuck.
          */
         send_global_virq(VIRQ_CONSOLE);
-        break;
-
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    default:
-    {
-        struct domain *d = rcu_lock_domain_by_id(console_owner);
-
-        /*
-         * If we have a properly initialized vpl011 console for the
-         * domain, without a full PV ring to Dom0 (in that case input
-         * comes from the PV ring), then send the character to it.
-         */
-        if ( d != NULL )
-            vpl011_rx_char_xen(d, c);
-        else
-            printk("Cannot send chars to Dom%d: no UART available\n",
-                   console_owner);
-
-        if ( d != NULL )
-            rcu_unlock_domain(d);
-
-        break;
     }
+    /*
+     * Deliver input to the emulated UART.
+     */
+    else if ( domain_has_vuart(d) )
+    {
+#if defined(CONFIG_SBSA_VUART_CONSOLE)
+        rc = vpl011_rx_char_xen(d, c);
 #endif
     }
-
+    /*
+     * Deliver input to the PV shim console.
+     */
     if ( consoled_is_enabled() )
-        consoled_guest_tx(c);
+        rc = consoled_guest_tx(c);
+
+    if ( rc && rc != -ENODEV )
+        printk(KERN_WARNING "console input domain %d: not ready: %d\n",
+               d->domain_id, rc);
+}
+
+static void __serial_rx(char c)
+{
+    struct domain *d;
+
+    if ( console_owner == DOMID_XEN )
+    {
+        handle_keypress(c, false);
+        return;
+    }
+
+    d = rcu_lock_domain_console_owner();
+    if ( d == NULL )
+        return;
+
+    handle_keypress_in_domain(d, c);
+
+    rcu_unlock_domain(d);
 }
 
 static void cf_check serial_rx(char c)

-- 
2.34.1




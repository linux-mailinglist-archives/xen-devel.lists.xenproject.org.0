Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8549D9FA5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844209.1259810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG51k-0004Wz-9b; Tue, 26 Nov 2024 23:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844209.1259810; Tue, 26 Nov 2024 23:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG51k-0004Ti-2H; Tue, 26 Nov 2024 23:31:28 +0000
Received: by outflank-mailman (input) for mailman id 844209;
 Tue, 26 Nov 2024 23:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sr-0000At-EN
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4019797e-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 950025C5D22;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C34ACC4CED7;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B4ACDD66B8E;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 4019797e-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjQwMTk3OTdlLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzI2LjM1NjQ2OCwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=50fKjc2QOVuxtHeCWL67mp4YIYRrVBdHtpZLvHIma5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BBoTyplhMIAPEAOnJhFln241XCN141CxblrzJCf0bRaf3R6yqKmOnrTKzlU0yhCaJ
	 L6+hYvAMtPk6+Nv2Ss611hnJD51ZQUDtgCo5B4LvRPpieEBOrdGl6+LBZ9T2XaBrBU
	 UKqv/PKH2bKvM1+Du0mEFXUp0eXEgqDM8TwOxn1b6w7OWODGqHLCCzOlnZ5uVQldgQ
	 xoSmncVBRkZ2ld06R5RYwAszQNZaL7ZL/b7V5lFcb7rXXbsCo22I/e4BsjcnLBxd++
	 awpFMdzAAym2D0wjAK8isiYRERxu94xr6vRbLkamxim8KEK4+AJzVsL9cjSPu1jwI2
	 s06zjdIbGWvyA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:10 -0800
Subject: [PATCH 20/36] xen/console: introduce consoled_is_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-20-87b9a8375b7a@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=4384;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=dmfspZvPgoI4EGX+YrlzVMe2EpWEao1fcT911zaxlEE=;
 b=b8yT+vorsOT/zpMXLcXELRcjbP8A5xks6ATDBkx57XKFIDY+aHn3Ylyvhm4Z3AH3+ZRx1C8qL
 Jwel3yfp81XClJATR0JRkeqv+Ek2LpNbnP2Vh/Z/EibO0x25KL5xBeT
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

There are few places which check pv_shim console under CONFIG_PV_SHIM in xen
console driver. Instead of #ifdef-ing, use new consoled_is_enabled() to
customize the logic.

Header file now can be included w/o CONFIG_X86.

Signature of consoled_guest_{rx,tx} has changed to account for follow-on
console switch logic cleanup.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c  | 10 +++-------
 xen/drivers/char/consoled.c | 18 ++++++++++++++----
 xen/include/xen/consoled.h  | 35 +++++++++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f034ce5aab3f3bf59b0df9fa583ee9ce32dbf665..60c055396b697869b04b9132b0dcfa832fabe932 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,9 +33,9 @@
 #include <xen/pv_console.h>
 #include <asm/setup.h>
 #include <xen/sections.h>
+#include <xen/consoled.h>
 
 #ifdef CONFIG_X86
-#include <xen/consoled.h>
 #include <asm/guest.h>
 #endif
 #ifdef CONFIG_SBSA_VUART_CONSOLE
@@ -505,11 +505,9 @@ static void console_find_owner(void)
             break;
         }
 
-#ifdef CONFIG_PV_SHIM
-        if ( next_rx == 1 )
+        if ( consoled_is_enabled() && next_rx == 1 )
             domid = get_initial_domain_id();
         else
-#endif
             domid = next_rx - 1;
         d = rcu_lock_domain_by_id(domid);
         if ( d )
@@ -573,10 +571,8 @@ static void __serial_rx(char c)
 #endif
     }
 
-#ifdef CONFIG_X86
-    if ( pv_shim && pv_console )
+    if ( consoled_is_enabled() )
         consoled_guest_tx(c);
-#endif
 }
 
 static void cf_check serial_rx(char c)
diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
index b415b632cecc0a80e161b701d7b70ba4f3cc5fb8..d6624e7697f56e1a1959b0efa5dca104f34af002 100644
--- a/xen/drivers/char/consoled.c
+++ b/xen/drivers/char/consoled.c
@@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
 static char buf[BUF_SZ + 1];
 
 /* Receives characters from a domain's PV console */
-void consoled_guest_rx(void)
+int consoled_guest_rx(void)
 {
     size_t idx = 0;
     XENCONS_RING_IDX cons, prod;
 
     if ( !cons_ring )
-        return;
+        return 0;
 
     spin_lock(&rx_lock);
 
@@ -91,15 +91,17 @@ void consoled_guest_rx(void)
 
  out:
     spin_unlock(&rx_lock);
+
+    return 0;
 }
 
 /* Sends a character into a domain's PV console */
-void consoled_guest_tx(char c)
+int consoled_guest_tx(char c)
 {
     XENCONS_RING_IDX cons, prod;
 
     if ( !cons_ring )
-        return;
+        return 0;
 
     cons = ACCESS_ONCE(cons_ring->in_cons);
     prod = cons_ring->in_prod;
@@ -118,6 +120,7 @@ void consoled_guest_tx(char c)
 
     cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] = c;
 
+
     /* Write to the ring before updating the pointer */
     smp_wmb();
     ACCESS_ONCE(cons_ring->in_prod) = prod;
@@ -125,6 +128,13 @@ void consoled_guest_tx(char c)
  notify:
     /* Always notify the guest: prevents receive path from getting stuck. */
     pv_shim_inject_evtchn(pv_console_evtchn());
+
+    return 0;
+}
+
+bool consoled_is_enabled(void)
+{
+    return pv_shim && pv_console;
 }
 
 /*
diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index bd7ab6329ee8a7c466484021247241ded8ed03c7..b88e3025fde84a52d7027b785b0a51ada8493832 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -3,10 +3,41 @@
 
 #include <public/io/console.h>
 
+#if defined(CONFIG_PV_SHIM)
+
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
-void consoled_guest_rx(void);
-void consoled_guest_tx(char c);
+int consoled_guest_rx(void);
+int consoled_guest_tx(char c);
+bool consoled_is_enabled(void);
+
+#else
+
+void consoled_set_ring_addr(struct xencons_interface *ring)
+{
+}
+
+struct xencons_interface *consoled_get_ring_addr(void)
+{
+    return NULL;
+}
+
+int consoled_guest_rx(void)
+{
+    return 0;
+}
+
+int consoled_guest_tx(char c)
+{
+    return 0;
+}
+
+bool consoled_is_enabled(void)
+{
+    return false;
+}
+
+#endif /* #if defined(CONFIG_PV_SHIM) */
 
 #endif /* __XEN_CONSOLED_H__ */
 /*

-- 
2.34.1




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40382A011A4
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864714.1276029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQq-0007GV-Rx; Sat, 04 Jan 2025 01:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864714.1276029; Sat, 04 Jan 2025 01:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQq-000740-2d; Sat, 04 Jan 2025 01:58:28 +0000
Received: by outflank-mailman (input) for mailman id 864714;
 Sat, 04 Jan 2025 01:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQl-0005Ax-Qi
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dd063cb-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08B4B5C613E;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB6A4C4CED6;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E2F05E77198;
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
X-Inumbo-ID: 5dd063cb-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=AA7+mFgdv/CLreA2xkAbjLNCRVAgqmaEv1ja2uxK2AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kIWEW/eRK6fqXTa7M+eKyUBgFAU6g0f4xk5l5oE99ZnF0P1X0cWwRnuDgYGKYj6hc
	 MIncbo7zBD1qIRsMYWCiYlmw7UAxjoHbCe08EEqxpQzX8uuCGAgySBCGBPuKb6WLIS
	 OjUd4CKhK1BFxt/OpBtsmUKre/E+9ezEn6cbx5JwlxPeTWlNxOmxMjUkWLKHvItOEE
	 tDuEwpinIHXawJOr104bGNSab64JRwi3g8jQjty0IlyrOvivNYa5ygUjA7zigC/E8Z
	 k1RCWGsxcFTx3I8cSs3FgPAJygzY3zuCUvLP2VzTE9d6nICd+1zMTgOqxazXKaVtAP
	 0aA++obj1Ul3A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:11 -0800
Subject: [PATCH v3 05/24] xen/console: introduce consoled_is_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=4404;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=n4Aqa3ybnKIx5xmfT+5F0wUDK/FeirbGr0o6DW85ymA=;
 b=C4K8KLpFn1MjYhJMBZQMxhbcwkSQbMQPkN60/GkOpUDva4wrnJU3OI1jMwq1OYrhFKd3FJAbL
 pLO5JKF6+JdBYum8mrIHzPA5dZ7qRLqRtkU0jOY0jQiRbsCifK3SU4j
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

Signature of consoled_guest_{rx,tx} has changed so the error can be logged.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c  | 13 +++++--------
 xen/drivers/char/consoled.c | 17 +++++++++++++----
 xen/include/xen/consoled.h  | 32 +++++++++++++++++++++++++++-----
 3 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 4785f0e93a17e3ecba79a7813d2928f946abab8f..2d20a9d7531e069803eaf30ce79354b998c4a52f 100644
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
@@ -508,11 +508,9 @@ static void switch_serial_input(void)
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
@@ -563,10 +561,9 @@ static void __serial_rx(char c)
         rc = vpl011_rx_char_xen(d, c);
 #endif
 
-#ifdef CONFIG_X86
-    if ( pv_shim && pv_console )
-        consoled_guest_tx(c);
-#endif
+    if ( consoled_is_enabled() )
+        /* Deliver input to the PV shim console. */
+        rc = consoled_guest_tx(c);
 
     if ( rc )
         printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
index b415b632cecc0a80e161b701d7b70ba4f3cc5fb8..8704ec251eb19e9c1cdc5927f896aeb20cc5af1e 100644
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
+        return -ENODEV;
 
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
+        return -ENODEV;
 
     cons = ACCESS_ONCE(cons_ring->in_cons);
     prod = cons_ring->in_prod;
@@ -125,6 +127,13 @@ void consoled_guest_tx(char c)
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
index bd7ab6329ee8a7c466484021247241ded8ed03c7..14e5e3284a86201919f0f70a8c2785609f35b15f 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -1,14 +1,36 @@
-#ifndef __XEN_CONSOLED_H__
-#define __XEN_CONSOLED_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN__CONSOLED_H
+#define XEN__CONSOLED_H
 
 #include <public/io/console.h>
 
+#ifdef CONFIG_PV_SHIM
+
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
-void consoled_guest_rx(void);
-void consoled_guest_tx(char c);
+int consoled_guest_rx(void);
+int consoled_guest_tx(char c);
+bool consoled_is_enabled(void);
 
-#endif /* __XEN_CONSOLED_H__ */
+#else
+
+static inline int consoled_guest_rx(void)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+static inline int consoled_guest_tx(char c)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+#define consoled_is_enabled() ( false )
+
+#endif /* CONFIG_PV_SHIM */
+
+#endif /* XEN__CONSOLED_H */
 /*
  * Local variables:
  * mode: C

-- 
2.34.1




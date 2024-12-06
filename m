Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647B9E667D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849559.1264217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQIn-0000Qx-VF; Fri, 06 Dec 2024 04:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849559.1264217; Fri, 06 Dec 2024 04:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQIn-0000PA-SK; Fri, 06 Dec 2024 04:50:53 +0000
Received: by outflank-mailman (input) for mailman id 849559;
 Fri, 06 Dec 2024 04:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA3-0004Kb-0L
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 631cddf8-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8A8B5C7314;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7917CC4CEE3;
 Fri,  6 Dec 2024 04:41:38 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 70AFAE77173;
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
X-Inumbo-ID: 631cddf8-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460098;
	bh=VfxhkDTfiR4LTXzGz0uTAKeAy5NNBjyHiibYeZqaqmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fNb4aYvZhcL1WRoi5y/2Vn2DQM91di4kthUq+ulgmgme60LJZfKOqyq6i0c5XaTRP
	 sqNSIxqti4kqnSD8+DvL9iRMxXL9k0WBX0YeM7Q31UlUcu//vHnZeuIABS9jZrnpN3
	 enxv9dFpzZ1MPRbjy6Dn8w1djRfaFSRTL0BIaH28UIeLw30USI7NA/aTm3yAdj1b2v
	 ceH8jWb2K5lu2qrt2YD626y+3/vfWRgO0CgYzWOI/p0d9XZA1pJhyMkUujCK+EK1TH
	 QLwMiwLaumBD/v2r1Zt2XsFdviHVNPnU5icOOh+wO8vGKBk09W3BmEc+0E6NiUlYJI
	 NB+Ftmx2yopqA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:47 -0800
Subject: [PATCH v2 17/35] xen/console: introduce consoled_is_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=4454;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=xhuHq6Qjuj4L9zlqilD/J1w4YyMosaifg1eUidT/6sY=;
 b=M3vrUCaT7Fshofkz23ivWXpzsFNrw5I6pGc14oCE9mPf6+CxOMss7QO9J5jIdUoJl7errU366
 uw7W0G+g9R3Cll7yHkk1J6d3Myf566U/qHlna4OTq3D3KwwW1iMVJlC
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
index bd7ab6329ee8a7c466484021247241ded8ed03c7..696677fa5a3be458a0ec93360e08376c3471f95b 100644
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
+static inline void consoled_set_ring_addr(struct xencons_interface *ring)
+{
+}
+
+static inline struct xencons_interface *consoled_get_ring_addr(void)
+{
+    return NULL;
+}
+
+static inline int consoled_guest_rx(void)
+{
+    return 0;
+}
+
+static inline int consoled_guest_tx(char c)
+{
+    return 0;
+}
+
+static inline bool consoled_is_enabled(void)
+{
+    return false;
+}
+
+#endif /* #if defined(CONFIG_PV_SHIM) */
 
 #endif /* __XEN_CONSOLED_H__ */
 /*

-- 
2.34.1




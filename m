Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98F860E15
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684706.1064745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRyB-0006De-7h; Fri, 23 Feb 2024 09:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684706.1064745; Fri, 23 Feb 2024 09:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRyB-0006C3-4M; Fri, 23 Feb 2024 09:35:51 +0000
Received: by outflank-mailman (input) for mailman id 684706;
 Fri, 23 Feb 2024 09:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hL0v=KA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rdRy9-0006BX-1V
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:35:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecdb525a-d22e-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 10:35:48 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id B667E4EE0741;
 Fri, 23 Feb 2024 10:35:46 +0100 (CET)
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
X-Inumbo-ID: ecdb525a-d22e-11ee-8a57-1f161083a0e0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/2] xen/console: drop return value from consoled_guest_rx/tx
Date: Fri, 23 Feb 2024 10:35:36 +0100
Message-Id: <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708680104.git.nicola.vetrini@bugseng.com>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions never saw a usage of their return value since
they were introduced, so it can be dropped since their usages
violate MISRA C Rule 17.7:
"The value returned by a function having non-void return type shall be used".

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/char/consoled.c | 17 +++++------------
 xen/include/xen/consoled.h  |  4 ++--
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
index 222e01844271..b415b632cecc 100644
--- a/xen/drivers/char/consoled.c
+++ b/xen/drivers/char/consoled.c
@@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
 static char buf[BUF_SZ + 1];
 
 /* Receives characters from a domain's PV console */
-size_t consoled_guest_rx(void)
+void consoled_guest_rx(void)
 {
-    size_t recv = 0, idx = 0;
+    size_t idx = 0;
     XENCONS_RING_IDX cons, prod;
 
     if ( !cons_ring )
-        return 0;
+        return;
 
     spin_lock(&rx_lock);
 
@@ -73,7 +73,6 @@ size_t consoled_guest_rx(void)
         char c = cons_ring->out[MASK_XENCONS_IDX(cons++, cons_ring->out)];
 
         buf[idx++] = c;
-        recv++;
 
         if ( idx >= BUF_SZ )
         {
@@ -92,18 +91,15 @@ size_t consoled_guest_rx(void)
 
  out:
     spin_unlock(&rx_lock);
-
-    return recv;
 }
 
 /* Sends a character into a domain's PV console */
-size_t consoled_guest_tx(char c)
+void consoled_guest_tx(char c)
 {
-    size_t sent = 0;
     XENCONS_RING_IDX cons, prod;
 
     if ( !cons_ring )
-        return 0;
+        return;
 
     cons = ACCESS_ONCE(cons_ring->in_cons);
     prod = cons_ring->in_prod;
@@ -121,7 +117,6 @@ size_t consoled_guest_tx(char c)
         goto notify;
 
     cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] = c;
-    sent++;
 
     /* Write to the ring before updating the pointer */
     smp_wmb();
@@ -130,8 +125,6 @@ size_t consoled_guest_tx(char c)
  notify:
     /* Always notify the guest: prevents receive path from getting stuck. */
     pv_shim_inject_evtchn(pv_console_evtchn());
-
-    return sent;
 }
 
 /*
diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index 2b30516b3a0a..bd7ab6329ee8 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -5,8 +5,8 @@
 
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
-size_t consoled_guest_rx(void);
-size_t consoled_guest_tx(char c);
+void consoled_guest_rx(void);
+void consoled_guest_tx(char c);
 
 #endif /* __XEN_CONSOLED_H__ */
 /*
-- 
2.34.1



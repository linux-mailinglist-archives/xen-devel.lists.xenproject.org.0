Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFDwMjL0g2n6wAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A46EDB21
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 02:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221351.1529621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI4-0001xP-IY; Thu, 05 Feb 2026 01:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221351.1529621; Thu, 05 Feb 2026 01:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI4-0001uv-EA; Thu, 05 Feb 2026 01:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1221351;
 Thu, 05 Feb 2026 01:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI3-0001iz-6Q
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI3-003wQC-0N;
 Thu, 05 Feb 2026 01:36:14 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI2-00HVX2-1u;
 Thu, 05 Feb 2026 01:36:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=2hWVAX5cInV9+JHNZ4ERQlXamvda79ZLFDIRyBNBnyg=; b=WxbR2H+NO/hx9lVr0ieB68MZO1
	bdXxPrxCmpFVs8mf4ofpC35FMRpfjksgu01WDUKkJthpYm2MMtecQxX14e0A8s87rZ1PPnBuABYjP
	Sf88iq0ZzaRvu22v4l9Gv6AoVZeNhiutYr8GNdwIEziqNFonoF+wX7ThC5dXjiSEkLJQ=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 1/6] xen/console: group conring code together
Date: Wed,  4 Feb 2026 17:36:01 -0800
Message-ID: <20260205013606.3384798-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205013606.3384798-1-dmukhin@ford.com>
References: <20260205013606.3384798-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:mid,ford.com:email,xen.org:dkim];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5A46EDB21
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Groups conring buffer management code in the console driver for ease of
maintaining this code.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/drivers/char/console.c | 161 ++++++++++++++++++-------------------
 1 file changed, 80 insertions(+), 81 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2bdb4d5fb417..86319600e0af 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -126,17 +126,6 @@ static int cf_check parse_console_timestamps(const char *s);
 custom_runtime_param("console_timestamps", parse_console_timestamps,
                      con_timestamp_mode_upd);
 
-/* conring_size: allows a large console ring than default (16kB). */
-static uint32_t __initdata opt_conring_size;
-size_param("conring_size", opt_conring_size);
-
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
-static char __initdata _conring[_CONRING_SIZE];
-static char *__read_mostly conring = _conring;
-static uint32_t __read_mostly conring_size = _CONRING_SIZE;
-static uint32_t conringc, conringp;
-
 static int __read_mostly sercon_handle = -1;
 
 #ifdef CONFIG_X86
@@ -350,6 +339,17 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
  * ********************************************************
  */
 
+/* conring_size: allows a large console ring than default (16kB). */
+static uint32_t __initdata opt_conring_size;
+size_param("conring_size", opt_conring_size);
+
+#define _CONRING_SIZE 16384
+#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+static char __initdata _conring[_CONRING_SIZE];
+static char *__read_mostly conring = _conring;
+static uint32_t __read_mostly conring_size = _CONRING_SIZE;
+static uint32_t conringc, conringp;
+
 static void cf_check conring_notify(void *unused)
 {
     send_global_virq(VIRQ_CON_RING);
@@ -416,47 +416,6 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 }
 #endif /* CONFIG_SYSCTL */
 
-
-/*
- * *******************************************************
- * *************** ACCESS TO SERIAL LINE *****************
- * *******************************************************
- */
-
-/* Characters received over the serial line are buffered for domain 0. */
-#define SERIAL_RX_SIZE 128
-#define SERIAL_RX_MASK(_i) ((_i)&(SERIAL_RX_SIZE-1))
-static char serial_rx_ring[SERIAL_RX_SIZE];
-static unsigned int serial_rx_cons, serial_rx_prod;
-
-static void (*serial_steal_fn)(const char *str, size_t nr) = early_puts;
-
-int console_steal(int handle, void (*fn)(const char *str, size_t nr))
-{
-    if ( (handle == -1) || (handle != sercon_handle) )
-        return 0;
-
-    if ( serial_steal_fn != NULL )
-        return -EBUSY;
-
-    serial_steal_fn = fn;
-    return 1;
-}
-
-void console_giveback(int id)
-{
-    if ( id == 1 )
-        serial_steal_fn = NULL;
-}
-
-void console_serial_puts(const char *s, size_t nr)
-{
-    if ( serial_steal_fn != NULL )
-        serial_steal_fn(s, nr);
-    else
-        serial_puts(sercon_handle, s, nr);
-}
-
 /*
  * Flush contents of the conring to the selected console devices.
  */
@@ -501,6 +460,75 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
         printk("failed to dump console ring buffer: %d\n", rc);
 }
 
+void __init console_init_ring(void)
+{
+    char *ring;
+    unsigned int i, order, memflags;
+    unsigned long flags;
+
+    if ( !opt_conring_size )
+        return;
+
+    order = get_order_from_bytes(max(opt_conring_size, conring_size));
+    memflags = MEMF_bits(crashinfo_maxaddr_bits);
+    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
+    {
+        BUG_ON(order == 0);
+        order--;
+    }
+    opt_conring_size = PAGE_SIZE << order;
+
+    nrspin_lock_irqsave(&console_lock, flags);
+    for ( i = conringc ; i != conringp; i++ )
+        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
+    conring = ring;
+    smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
+    conring_size = opt_conring_size;
+    nrspin_unlock_irqrestore(&console_lock, flags);
+
+    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
+}
+
+/*
+ * *******************************************************
+ * *************** ACCESS TO SERIAL LINE *****************
+ * *******************************************************
+ */
+
+/* Characters received over the serial line are buffered for domain 0. */
+#define SERIAL_RX_SIZE 128
+#define SERIAL_RX_MASK(_i) ((_i)&(SERIAL_RX_SIZE-1))
+static char serial_rx_ring[SERIAL_RX_SIZE];
+static unsigned int serial_rx_cons, serial_rx_prod;
+
+static void (*serial_steal_fn)(const char *str, size_t nr) = early_puts;
+
+int console_steal(int handle, void (*fn)(const char *str, size_t nr))
+{
+    if ( (handle == -1) || (handle != sercon_handle) )
+        return 0;
+
+    if ( serial_steal_fn != NULL )
+        return -EBUSY;
+
+    serial_steal_fn = fn;
+    return 1;
+}
+
+void console_giveback(int id)
+{
+    if ( id == 1 )
+        serial_steal_fn = NULL;
+}
+
+void console_serial_puts(const char *s, size_t nr)
+{
+    if ( serial_steal_fn != NULL )
+        serial_steal_fn(s, nr);
+    else
+        serial_puts(sercon_handle, s, nr);
+}
+
 /*
  * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
  * and the DomUs started from Xen at boot.
@@ -1125,35 +1153,6 @@ void __init console_init_preirq(void)
     }
 }
 
-void __init console_init_ring(void)
-{
-    char *ring;
-    unsigned int i, order, memflags;
-    unsigned long flags;
-
-    if ( !opt_conring_size )
-        return;
-
-    order = get_order_from_bytes(max(opt_conring_size, conring_size));
-    memflags = MEMF_bits(crashinfo_maxaddr_bits);
-    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
-    {
-        BUG_ON(order == 0);
-        order--;
-    }
-    opt_conring_size = PAGE_SIZE << order;
-
-    nrspin_lock_irqsave(&console_lock, flags);
-    for ( i = conringc ; i != conringp; i++ )
-        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
-    conring = ring;
-    smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
-    conring_size = opt_conring_size;
-    nrspin_unlock_irqrestore(&console_lock, flags);
-
-    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
-}
-
 void __init console_init_irq(void)
 {
     serial_init_irq();
-- 
2.52.0



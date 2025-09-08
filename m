Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7AB49BA1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115543.1462168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9h-0001OK-2o; Mon, 08 Sep 2025 21:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115543.1462168; Mon, 08 Sep 2025 21:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9g-0001Fi-LF; Mon, 08 Sep 2025 21:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1115543;
 Mon, 08 Sep 2025 21:12:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9f-000164-7u
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:12:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9f-000FUE-01;
 Mon, 08 Sep 2025 21:12:03 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9f-000gN1-0G;
 Mon, 08 Sep 2025 21:12:02 +0000
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
	bh=b4hUxqYghrvWW5yLlDTNdgPS7IjF5GT2QqKNV0EctlI=; b=JkzGM+cpJE/hIL99ZEjDEJcHoH
	vkoNQIP/dyxrYsu5nhCithcAwxfUYQLUS7gngL77ITVYpL0r+M1SqzjE6QnVVZIQp29ciVAqT7iTp
	QMgUIJvFNj8p0PQBzJIiBeCA44D8O/i8+r2E15UUxTxNIp0am0JLwQ0DTYvO2mWJ5W1Q=;
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
Subject: [PATCH v7 10/16] emul/ns16x50: implement THR register
Date: Mon,  8 Sep 2025 14:11:43 -0700
Message-ID: <20250908211149.279143-11-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add THR register emulation to the I/O port handlder.

Add TX FIFO management code since THR depends on TX FIFO.

TX FIFOs is not emulated as per UART specs for simplicity (not need to emulate
baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
NS16750 (64 bytes).

TX FIFOs is emulated by using xencons_interface which conveniently provides
primitives for buffer management and later can be used for inter-domain
communication similarly to vpl011.

Account for DLL == 0: in this case, disable transmitter.

Add UART_IIR_THR interrupt reason handling since it depends on THR register
access.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- added DLL == 0 case handling as per Mykola's suggestion
- dropped UART_IIR_THR clearing in UART_IIR register emulation in ns16x50_io_write8()
- simplified UART_IIR_THR handling
- updated ns16x50_iir_check_thr()
---
 xen/common/emul/vuart/ns16x50.c | 82 ++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 250411e0a7d8..137ce08f4e1d 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -149,6 +149,66 @@ static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
     return rc;
 }
 
+static bool ns16x50_fifo_tx_full(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->out_prod - cons->out_cons == ARRAY_SIZE(cons->out);
+}
+
+static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    cons->out_cons = cons->out_prod;
+}
+
+/*
+ * Flush cached output to Xen console.
+ */
+static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    struct domain *d = vdev->owner;
+    XENCONS_RING_IDX i, n, len = cons->out_prod - cons->out_cons;
+
+    ASSERT(len <= ARRAY_SIZE(cons->out));
+    if ( !len )
+        return;
+
+    i = MASK_XENCONS_IDX(cons->out_cons, cons->out);
+    n = min_t(XENCONS_RING_IDX, len, ARRAY_SIZE(cons->out) - i);
+    if ( n )
+        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
+
+    i = 0;
+    n = len - n;
+    if ( n )
+        guest_printk(d, guest_prefix "%.*s", n, &cons->out[i]);
+
+    cons->out_cons += len;
+}
+
+/*
+ * Accumulate guest OS output before sending to Xen console.
+ */
+static void ns16x50_fifo_tx_putchar(struct vuart_ns16x50 *vdev, char ch)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    if ( !is_console_printable(ch) )
+        return;
+
+    if ( !ns16x50_fifo_tx_full(vdev) )
+    {
+        cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)] = ch;
+        cons->out_prod++;
+    }
+
+    if ( ch == '\n' || ch == '\0' || ns16x50_fifo_tx_full(vdev) )
+        ns16x50_fifo_tx_flush(vdev);
+}
+
 static bool ns16x50_is_running(const struct vuart_ns16x50 *vdev)
 {
     /* DLL set to 0 disables serial communication. */
@@ -172,7 +232,7 @@ static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
 
 static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return !ns16x50_fifo_tx_full(vdev);
 }
 
 static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
@@ -294,6 +354,22 @@ static int ns16x50_io_write8(
     {
         switch ( reg )
         {
+        case UART_THR:
+            if ( !ns16x50_is_running(vdev) )
+                break;
+
+            if ( regs[UART_MCR] & UART_MCR_LOOP )
+            {
+                if ( ns16x50_fifo_rx_putchar(vdev, val) )
+                    regs[UART_LSR] |= UART_LSR_OE;
+
+                regs[UART_LSR] |= UART_LSR_DR;
+            }
+            else
+                ns16x50_fifo_tx_putchar(vdev, val);
+
+            break;
+
         case UART_IER:
             regs[UART_IER] = val & UART_IER_MASK;
             break;
@@ -646,6 +722,10 @@ static void cf_check ns16x50_deinit(void *arg)
     struct vuart_ns16x50 *vdev = arg;
 
     ASSERT(vdev);
+
+    spin_lock(&vdev->lock);
+    ns16x50_fifo_tx_flush(vdev);
+    spin_unlock(&vdev->lock);
 }
 
 static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
-- 
2.51.0



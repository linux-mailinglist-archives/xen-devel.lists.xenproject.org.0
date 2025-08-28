Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F286B3AEA6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100178.1453788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRh-0005Jg-G6; Thu, 28 Aug 2025 23:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100178.1453788; Thu, 28 Aug 2025 23:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRh-0005Es-9i; Thu, 28 Aug 2025 23:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1100178;
 Thu, 28 Aug 2025 23:54:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRf-0004tl-SQ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRf-00B9ta-1P;
 Thu, 28 Aug 2025 23:54:19 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRf-006h8b-1L;
 Thu, 28 Aug 2025 23:54:19 +0000
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
	bh=O38Uk+zJS9Rhc5rqzUTb4AWzTER9hWI5fpYyEBOAJ5A=; b=i2wo1RwkqRdPFXHyC8RmxVISX6
	ec3XbvmqE8K0RlUAY4EWaANKojueqnQnHoNPh1Cqx96d1hhkdgRIQgJ+cHILuVXFX5+sS279g8Q2W
	w/UBy2Glht0IUeg4bnp6dsipHriXQekBgzzLhfkrKGsKQcwQSI7EqosrBjJYneT6h8Os=;
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
Subject: [PATCH v5 06/15] emul/ns16x50: implement THR/RBR registers
Date: Thu, 28 Aug 2025 16:54:00 -0700
Message-ID: <20250828235409.2835815-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add RBR/THR registers emulation to the I/O port handlder.

Also, add RX/TX FIFO management code since RBR depends on RX FIFO and
THR depends on TX FIFO.

FIFOs are not emulated as per UART specs for simplicity (not need to emulate
baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
NS16750 (64 bytes).

FIFOs are emulated by means of using xencons_interface which conveniently
provides primitives for buffer management and later can be used for
inter-domain communication similarly to vpl011.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/common/emul/vuart/ns16x50.c | 135 ++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 20597cc36b35..efb2f4c6441c 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -92,6 +92,119 @@ static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
     return cons->in_prod == cons->in_cons;
 }
 
+static bool ns16x50_fifo_rx_full(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
+}
+
+static void ns16x50_fifo_rx_reset(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    cons->in_cons = cons->in_prod;
+}
+
+static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    int rc;
+
+    if ( ns16x50_fifo_rx_empty(vdev) )
+    {
+        ns16x50_debug(vdev, "RX FIFO empty\n");
+        rc = -ENODATA;
+    }
+    else
+    {
+        rc = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
+        cons->in_cons++;
+    }
+
+    return rc;
+}
+
+static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    int rc;
+
+    /*
+     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
+     * of the THR.
+     */
+    if ( ns16x50_fifo_rx_full(vdev) )
+    {
+        ns16x50_debug(vdev, "RX FIFO full; resetting\n");
+        ns16x50_fifo_rx_reset(vdev);
+        rc = -ENOSPC;
+    }
+    else
+        rc = 0;
+
+    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
+    cons->in_prod++;
+
+    return rc;
+}
+
+static bool ns16x50_fifo_tx_empty(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->out_prod == cons->out_cons;
+}
+
+static void ns16x50_fifo_tx_reset(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    cons->out_prod = 0;
+    ASSERT(cons->out_cons == cons->out_prod);
+}
+
+/*
+ * Flush cached output to Xen console.
+ */
+static void ns16x50_fifo_tx_flush(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    struct domain *d = vdev->owner;
+
+    if ( ns16x50_fifo_tx_empty(vdev) )
+        return;
+
+    ASSERT(cons->out_prod < ARRAY_SIZE(cons->out));
+    cons->out[cons->out_prod] = '\0';
+    cons->out_prod++;
+
+    guest_printk(d, guest_prefix "%s", cons->out);
+
+    ns16x50_fifo_tx_reset(vdev);
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
+    if ( ch != '\0' )
+    {
+        cons->out[cons->out_prod] = ch;
+        cons->out_prod++;
+    }
+
+    if ( cons->out_prod == ARRAY_SIZE(cons->out) - 1 ||
+         ch == '\n' || ch == '\0' )
+        ns16x50_fifo_tx_flush(vdev);
+}
+
 static inline uint8_t cf_check ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
 {
     return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
@@ -228,6 +341,16 @@ static int ns16x50_io_write8(
     {
         switch ( reg )
         {
+        case UART_THR:
+            if ( regs[UART_MCR] & UART_MCR_LOOP )
+                rc = ns16x50_fifo_rx_putchar(vdev, val);
+            else
+                ns16x50_fifo_tx_putchar(vdev, val);
+
+            rc = 0;
+
+            break;
+
         case UART_IER:
             /*
              * NB: Make sure THR interrupt is re-triggered once guest OS
@@ -312,6 +435,14 @@ static int ns16x50_io_read8(
     else {
         switch ( reg )
         {
+        case UART_RBR:
+            rc = ns16x50_fifo_rx_getchar(vdev);
+            if ( rc >= 0 )
+                val = (uint8_t)rc;
+
+            rc = 0;
+            break;
+
         case UART_IER:
             val = regs[UART_IER];
             break;
@@ -499,6 +630,10 @@ static void cf_check ns16x50_deinit(void *arg)
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



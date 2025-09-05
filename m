Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B490FB4672B
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112637.1460916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq7-0003Un-9E; Fri, 05 Sep 2025 23:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112637.1460916; Fri, 05 Sep 2025 23:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq6-0003OG-Pl; Fri, 05 Sep 2025 23:27:30 +0000
Received: by outflank-mailman (input) for mailman id 1112637;
 Fri, 05 Sep 2025 23:27:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq4-0002x4-PL
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq4-008ABr-15;
 Fri, 05 Sep 2025 23:27:28 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq4-0005DM-12;
 Fri, 05 Sep 2025 23:27:28 +0000
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
	bh=WS5zJJrZC73EleKCg8ae2WORbb1w+LMvbUphJXaEKpA=; b=jNWrRxuNVdg6IdrqX02mQgeaLh
	9i2kbBLF2tQf/yS4UWx8xi4u02rnPFtwimxiMqeclPlnu7RhMTz1P7svgzN58dM/MuOZe4+MPdzs2
	w5s83fTbNIwgKaYh5yBve9JnS2qw8d7UBL7De14jV80wtdZATPqkWS2gzjKv6GAnaGqA=;
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
Subject: [PATCH v6 09/15] emul/ns16x50: implement RBR register
Date: Fri,  5 Sep 2025 16:27:08 -0700
Message-ID: <20250905232715.440758-10-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add RBR register emulation to the I/O port handlder.

Add RX FIFO management code since RBR depends on RX FIFO.

RX FIFO is not emulated as per UART specs for simplicity (not need to emulate
baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
NS16750 (64 bytes).

RX FIFO is emulated by means of using xencons_interface which conveniently
provides primitives for buffer management and later can be used for
inter-domain communication similarly to vpl011.

Add UART_LSR_DR handling since it depends on RBR register access.

Finally, implement put_rx() vUART hook for placing a character into the
emulated RX FIFO from console driver. That implements physical console
forwarding to the guest OS over emulated NS16550.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- new patch
- Link to v5 (both THR/RBR): https://lore.kernel.org/xen-devel/20250828235409.2835815-7-dmukhin@ford.com/
- Link to v5 (rx_put): https://lore.kernel.org/xen-devel/20250828235409.2835815-12-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 121 +++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index a8ec9f6c3a04..cac5128f0573 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -86,6 +86,68 @@ struct vuart_ns16x50 {
     struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
 };
 
+static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->in_prod == cons->in_cons;
+}
+
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
+/*
+ * Transfer character from RX FIFO and return the RX FIFO status after the
+ * transfer.
+ */
+static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev, uint8_t *ptr)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    if ( ns16x50_fifo_rx_empty(vdev) )
+        return -ENODATA;
+
+    *ptr = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
+    cons->in_cons++;
+
+    return ns16x50_fifo_rx_empty(vdev) ? -ENODATA : 0;
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
 static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
 {
     return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
@@ -98,7 +160,7 @@ static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
 
 static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return !ns16x50_fifo_rx_empty(vdev);
 }
 
 static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
@@ -360,6 +422,17 @@ static int ns16x50_io_read8(
     {
         switch ( reg )
         {
+        case UART_RBR:
+            /* NB: do not forget to clear overrun condition */
+            regs[UART_LSR] &= ~UART_LSR_OE;
+
+            if ( ns16x50_fifo_rx_getchar(vdev, &val) )
+                regs[UART_LSR] &= ~UART_LSR_DR;
+            else
+                regs[UART_LSR] |= UART_LSR_DR;
+
+            break;
+
         case UART_IER:
             val = regs[UART_IER];
             break;
@@ -610,13 +683,57 @@ static void cf_check ns16x50_free(void *arg)
     xvfree(arg);
 }
 
+static int cf_check ns16x50_put_rx(void *arg, char ch)
+{
+    struct vuart_ns16x50 *vdev = arg;
+    uint8_t *regs;
+    uint8_t dlab;
+    int rc = -EBUSY;
+
+    spin_lock(&vdev->lock);
+
+    dlab = ns16x50_dlab_get(vdev);
+    regs = vdev->regs;
+
+    if ( dlab )
+        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=1\n");
+    else if ( regs[UART_MCR] & UART_MCR_LOOP )
+        ns16x50_debug(vdev, "THR/RBR access disabled: loopback mode\n");
+    else
+    {
+        const struct domain *d = vdev->owner;
+
+        /*
+         * Echo the user input on Xen console iff Xen console input is owned
+         * by ns16x50 domain.
+         * NB: use 'console_timestamps=none' to disable Xen timestamps.
+         */
+        if ( is_console_printable(ch) )
+            guest_printk(d, "%c", ch);
+
+        if ( ns16x50_fifo_rx_putchar(vdev, ch) )
+            regs[UART_LSR] |= UART_LSR_OE;
+
+        regs[UART_LSR] |= UART_LSR_DR;
+
+        /* TODO: check FCR when to fire an interrupt */
+        ns16x50_irq_check(vdev);
+
+        rc = 0;
+    }
+
+    spin_unlock(&vdev->lock);
+
+    return rc;
+}
+
 #define ns16x50_emulator                \
 {                                       \
     .compatible = "ns16550",            \
     .alloc      = ns16x50_alloc,        \
     .free       = ns16x50_free,         \
     .dump_state = NULL,                 \
-    .put_rx     = NULL,                 \
+    .put_rx     = ns16x50_put_rx,       \
 }
 
 VUART_REGISTER(ns16x50, ns16x50_emulator);
-- 
2.51.0



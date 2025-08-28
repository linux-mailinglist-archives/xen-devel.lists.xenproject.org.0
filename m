Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4246B3AEA9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100185.1453836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRo-0006ib-6n; Thu, 28 Aug 2025 23:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100185.1453836; Thu, 28 Aug 2025 23:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRn-0006Y0-N0; Thu, 28 Aug 2025 23:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1100185;
 Thu, 28 Aug 2025 23:54:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRl-0006Ai-6y
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRk-00B9uc-2H;
 Thu, 28 Aug 2025 23:54:24 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRk-006h91-2H;
 Thu, 28 Aug 2025 23:54:24 +0000
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
	bh=nO3uRTV+51tCmahHSzswC5+DP1xOPTW2iImj0Yua62E=; b=fO+Lv+KaTvVTuj8aoVRYxR7D8+
	kOvMvcGsxYEW8MWnnt7FuhFH0ElFBVQgc0Tdmv2sbPmJOOzJhxUg/mCRXao7d7vn4FAjcEhZQqPC2
	H3ss4UsB6IE8JDePJwjJUKnyXMrSE186HXqA3TCH+JMQH3yT60ompIeBJXjKwp/21qzI=;
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
Subject: [PATCH v5 11/15] emul/ns16x50: implement put_rx() hook
Date: Thu, 28 Aug 2025 16:54:05 -0700
Message-ID: <20250828235409.2835815-12-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Implement put_rx() vUART hook for placing a character into the emulated RX
FIFO from console driver.

That implements physical console forwarding to the guest OS over emulated
NS16550.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/common/emul/vuart/ns16x50.c | 48 ++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index d57695564329..1fb65370d464 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -804,13 +804,59 @@ static void cf_check ns16x50_free(void *arg)
     XVFREE(vdev);
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
+        struct vuart *vuart = container_of(arg, struct vuart, vdev);
+        struct domain *d = vuart->owner;
+        uint8_t val = 0;
+
+        rc = ns16x50_fifo_rx_putchar(vdev, ch);
+        if ( rc == -ENOSPC )
+            val |= UART_LSR_OE;
+
+        /* NB: UART_LSR_DR is also set when UART_LSR is accessed. */
+        regs[UART_LSR] |= UART_LSR_DR | val;
+
+        /*
+         * Echo the user input on Xen console iff Xen console input is owned
+         * by ns16x50 domain.
+         * NB: use 'console_timestamps=none' to disable Xen timestamps.
+         */
+        if ( is_console_printable(ch) )
+            guest_printk(d, "%c", ch);
+
+        /* FIXME: check FCR when to fire an interrupt */
+        ns16x50_irq_check(vdev);
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



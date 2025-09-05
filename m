Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9FB4672D
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112643.1460942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufqB-0004R4-DT; Fri, 05 Sep 2025 23:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112643.1460942; Fri, 05 Sep 2025 23:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufqA-0004C5-Uw; Fri, 05 Sep 2025 23:27:34 +0000
Received: by outflank-mailman (input) for mailman id 1112643;
 Fri, 05 Sep 2025 23:27:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq8-0003lL-82
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq7-008ACU-2B;
 Fri, 05 Sep 2025 23:27:31 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq7-0005DY-2A;
 Fri, 05 Sep 2025 23:27:31 +0000
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
	bh=u2jdc7rLZ93+UT0tmBIy3UeulgEZY7zZ1DBAZKI8/+g=; b=us44G4mHhQkzqi+a5rTigbberW
	DnTiESUfEPrrt/+dqdcPnY+djyikMBzPjhNUgfvQefLwkIwxvgNpdQmHu2ijFn0KXgidlXHwroc7i
	Yu1ryjQ5U6MP2GTTDbd9gnou7KFoFOJxghmL3ozDz77Jtx/swpPAQ7kBW39sIordgTXo=;
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
Subject: [PATCH v6 12/15] emul/ns16550: implement dump_state() hook
Date: Fri,  5 Sep 2025 16:27:11 -0700
Message-ID: <20250905232715.440758-13-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Implement dump_state() vUART hook for debugging UART state machine over Xen
console. dump_state() prints state of all emulated registers (including
state-less IIR) and state of RX/TX FIFOs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- Fixed printouts formatters
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-13-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 59 ++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 3fc1112709df..a4fa3a9be713 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -648,6 +648,58 @@ static int ns16x50_io_read(
     return rc;
 }
 
+static void cf_check ns16x50_dump_state(void *arg)
+{
+#ifdef CONFIG_VUART_NS16X50_DEBUG
+    struct vuart_ns16x50 *vdev = arg;
+    const struct domain *d = vdev->owner;
+    const struct vuart_info *info = vdev->info;
+    const struct xencons_interface *cons;
+    const uint8_t *regs;
+
+    if ( !vdev )
+        return;
+
+    /* Allow printing state in case of a deadlock. */
+    if ( !spin_trylock(&vdev->lock) )
+        return;
+
+    cons = &vdev->cons;
+    regs = &vdev->regs[0];
+
+    printk("Virtual " pr_prefix " (%s) I/O port 0x%04x IRQ#%d owner %pd\n",
+            vdev->name, info->base_addr, info->irq, d);
+
+    printk("  RX FIFO size %ld in_prod %d in_cons %d used %d\n",
+            ARRAY_SIZE(cons->in), cons->in_prod, cons->in_cons,
+            cons->in_prod - cons->in_cons);
+
+    printk("  TX FIFO size %ld out_prod %d out_cons %d used %d\n",
+            ARRAY_SIZE(cons->out), cons->out_prod, cons->out_cons,
+            cons->out_prod - cons->out_cons);
+
+    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DLM %02"PRIx8"\n",
+            UART_RBR,
+            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
+            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],
+            regs[NS16X50_REGS_NUM + UART_DLL],
+            regs[NS16X50_REGS_NUM + UART_DLM]);
+
+    printk("  %02"PRIx8" IER %02"PRIx8"\n", UART_IER, regs[UART_IER]);
+
+    printk("  %02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
+            UART_FCR, regs[UART_FCR], ns16x50_iir_get(vdev));
+
+    printk("  %02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, regs[UART_LCR]);
+    printk("  %02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, regs[UART_MCR]);
+    printk("  %02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, regs[UART_LSR]);
+    printk("  %02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, regs[UART_MSR]);
+    printk("  %02"PRIx8" SCR %02"PRIx8"\n", UART_SCR, regs[UART_SCR]);
+
+    spin_unlock(&vdev->lock);
+#endif /* CONFIG_VUART_NS16X50_DEBUG */
+}
+
 /*
  * Emulate I/O access to ns16x50 register.
  * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
@@ -724,6 +776,9 @@ static int cf_check ns16x50_io_handle(
 
     spin_unlock(&vdev->lock);
 
+    if ( ns16x50_log_level >= 3 )
+        ns16x50_dump_state(vdev);
+
 out:
     rcu_unlock_domain(d);
 
@@ -854,6 +909,8 @@ static int cf_check ns16x50_put_rx(void *arg, char ch)
     }
 
     spin_unlock(&vdev->lock);
+    if ( ns16x50_log_level >= 3 )
+        ns16x50_dump_state(vdev);
 
     return rc;
 }
@@ -863,7 +920,7 @@ static int cf_check ns16x50_put_rx(void *arg, char ch)
     .compatible = "ns16550",            \
     .alloc      = ns16x50_alloc,        \
     .free       = ns16x50_free,         \
-    .dump_state = NULL,                 \
+    .dump_state = ns16x50_dump_state,   \
     .put_rx     = ns16x50_put_rx,       \
 }
 
-- 
2.51.0



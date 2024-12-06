Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505179E6697
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 06:02:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849798.1264358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQTQ-0003dE-6i; Fri, 06 Dec 2024 05:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849798.1264358; Fri, 06 Dec 2024 05:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQTQ-0003bJ-2n; Fri, 06 Dec 2024 05:01:52 +0000
Received: by outflank-mailman (input) for mailman id 849798;
 Fri, 06 Dec 2024 05:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA9-0004Ka-No
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64608fcb-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8AC75C72FD;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A760C4CEE0;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 62D13E77179;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 64608fcb-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=JVQCV0PI1+svIuRPhSKIXE4RQ76vQm0E6vam6EPtrcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W6lEgWydg2RAPebKAr16/tct2cGa72FS3Sam7Hdj1prK15nvWBh/GwfZ1GeWPxh7o
	 b/M9RtuoMe+3OCo21F1efsSdMhKQxJlijnUvu5Uy0OAU9Gnt6jx+Q+jjs4pliIanGg
	 RmCWD3kYhgZREq3GlEwSwSFDmaGNk4WsW2t3XC+CFKcs07uscaRG3/uh/WnpQL25cu
	 5BCgiNcqlb9vrr4aLImKUG7Pd4CehQqXhcBOZuei/WAymH78qrNNQ9rb1tSL9+W+2Y
	 cLel7bfYxe+/5oNf7+TBJVZ9lN60RnD6b6xvEJ3f5pE5+6XZ5/8Z/5L6l9AKHx+UEp
	 5q+znPHry/3FQ==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:42:02 -0800
Subject: [PATCH v2 32/35] x86/hvm: add debugging facility to NS8250 UART
 emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=5202;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=fA/jJbL46n/cnt80o0lruMDE2CrX4KhOfstGR8R1g3U=;
 b=iKpHnHA52J7NwfZnAJaaYuYval44oMyAoTpLRR63oT969Q6ILWC0DwKXqePHb5y1UuvSLSiJD
 tf8/iPi9W0YBRYqrwgNGNpvlhNKnoHkaE//16iIF3La5S0GB4zMmWcD
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Enable keyhandler mechanism for dumping state of emulated NS8250 on the
console.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/vuart_ns8250.c | 122 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/xen/arch/x86/hvm/vuart_ns8250.c b/xen/arch/x86/hvm/vuart_ns8250.c
index 779dbd80d7be4e070ea9df3ae736ecdc662a527a..c8c75afaf2b2419d1dae999da1d1e400fd367791 100644
--- a/xen/arch/x86/hvm/vuart_ns8250.c
+++ b/xen/arch/x86/hvm/vuart_ns8250.c
@@ -25,6 +25,7 @@
 
 /* Development debugging */
 #define NS8250_LOG_LEVEL    0
+#undef NS8250_DEBUG
 
 #include <xen/types.h>
 #include <xen/event.h>
@@ -35,6 +36,9 @@
 #include <xen/resource.h>
 #include <xen/ctype.h>
 #include <xen/param.h>
+#if defined(NS8250_DEBUG)
+#include <xen/keyhandler.h>
+#endif
 #include <xen/console.h> /* console_input_domid() */
 #include <asm/setup.h>   /* max_init_domid */
 #include <asm/iocap.h>
@@ -625,6 +629,121 @@ static const char *ns8250_regname(
     return reg_names[reg][dir];
 }
 
+#if defined(NS8250_DEBUG)
+static void ns8250_dump(struct vuart_ns8250 *vdev)
+{
+    struct xencons_interface *cons = vdev->cons;
+    uint8_t val;
+
+    printk("I/O port %02"PRIx64" IRQ %d flags %"PRIx32" owner %d\n",
+            vdev->io_addr, vdev->irq,
+            vdev->flags, vdev->owner->domain_id);
+
+    printk("RX size %ld in_prod %d in_cons %d used %d\n",
+            sizeof(cons->in),
+            cons->in_prod, cons->in_cons,
+            cons->in_prod - cons->in_cons);
+
+    printk("TX size %ld out_prod %d out_cons %d used %d\n",
+            sizeof(cons->out),
+            cons->out_prod, cons->out_cons,
+            cons->out_prod - cons->out_cons);
+
+    printk("%02x RBR [ %c ] THR [ %c ] DLL %02x DLM %02x\n",
+            UART_RBR,
+            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons)],
+            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons)],
+            vdev->dl & 0xFFU, vdev->dl >> 8);
+
+    printk("%02"PRIx8" IER %02"PRIx8"\n", UART_IER, vdev->regs[UART_IER]);
+
+    val = (vdev->regs[UART_FCR] & UART_FCR_ENABLE) ? UART_IIR_FE_MASK : 0;
+    val |= ns8250_irq_reason(vdev);
+    printk("%02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
+            UART_FCR, vdev->regs[UART_FCR], val);
+
+    printk("%02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, vdev->regs[UART_LCR]);
+    printk("%02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, vdev->regs[UART_MCR]);
+    printk("%02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, vdev->regs[UART_LSR]);
+    printk("%02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, vdev->regs[UART_MSR]);
+}
+
+static struct domain *rcu_find_first_domain_with_vuart(void)
+{
+    struct domain *d = NULL;
+    domid_t i;
+
+    for ( i = 0; i < max_init_domid + 1; i++ )
+    {
+        d = rcu_lock_domain_by_id(i);
+        if ( d == NULL )
+            continue;
+
+        if ( domain_has_vuart(d) )
+            break;
+
+        rcu_unlock_domain(d);
+    }
+
+    return d;
+}
+
+static void cf_check ns8250_keyhandler_show(unsigned char key)
+{
+    struct vuart_ns8250 *vdev;
+    struct domain *d;
+
+    d = rcu_find_first_domain_with_vuart();
+    if ( d == NULL )
+        return;
+
+    printk("'%c' pressed -> dumping virtual NS8250 state (d%d)\n",
+            key, d->domain_id);
+
+    vdev = &d->arch.hvm.vuart;
+    spin_lock(&vdev->lock);
+    ns8250_dump(vdev);
+    spin_unlock(&vdev->lock);
+
+    rcu_unlock_domain(d);
+}
+
+static void cf_check ns8250_keyhandler_irq(unsigned char key)
+{
+    struct vuart_ns8250 *vdev;
+    struct domain *d;
+
+    d = rcu_find_first_domain_with_vuart();
+    if ( d == NULL )
+        return;
+
+    printk("'%c' pressed -> triggering IRQ on virtual NS8250 (d%d)\n",
+            key, d->domain_id);
+
+    vdev = &d->arch.hvm.vuart;
+    spin_lock(&vdev->lock);
+    ns8250_irq_assert(vdev);
+    spin_unlock(&vdev->lock);
+
+    rcu_unlock_domain(d);
+}
+
+static void ns8250_keyhandler_init(void)
+{
+    register_keyhandler('1', ns8250_keyhandler_show,
+                        "dump virtual NS8250 state", 0);
+    register_keyhandler('2', ns8250_keyhandler_irq,
+                        "trigger IRQ from virtual NS8250", 0);
+}
+#else
+static inline void ns8250_keyhandler_init(void)
+{
+}
+static inline void ns8250_dump(struct vuart_ns8250 *vdev)
+{
+}
+#endif /* #if defined(NS8250_DEBUG) */
+
 /*
  * Emulate I/O access to NS8250 register.
  */
@@ -688,6 +807,7 @@ static int cf_check ns8250_io_handle(
     rc = X86EMUL_OKAY;
 
 out:
+    ns8250_dump(vdev);
     spin_unlock(&vdev->lock);
 
     return rc;
@@ -786,6 +906,7 @@ static int ns8250_init(struct domain *d, const struct resource *r)
     }
 
     spin_lock_init(&vdev->lock);
+    ns8250_keyhandler_init();
     hvm_irq_lower(d, vdev->irq);
 
     vdev->dl = (UART_CLOCK_HZ / 115200) >> 4; /* Report 115200 baud rate */
@@ -852,6 +973,7 @@ int vuart_putchar(struct vuart_ns8250 *vdev, char ch)
     ns8250_irq_assert(vdev);
 
 out:
+    ns8250_dump(vdev);
     spin_unlock(&vdev->lock);
 
     return rc;

-- 
2.34.1




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D8B46726
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112634.1460881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq3-0002VY-NG; Fri, 05 Sep 2025 23:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112634.1460881; Fri, 05 Sep 2025 23:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq3-0002SL-Bs; Fri, 05 Sep 2025 23:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1112634;
 Fri, 05 Sep 2025 23:27:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq1-00029m-Ky
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq1-008ABJ-0F;
 Fri, 05 Sep 2025 23:27:25 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq1-0005DA-0C;
 Fri, 05 Sep 2025 23:27:25 +0000
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
	bh=fu1wH8axdO9Xp+ceQdcC/+izkB5lgAddWuqh9BIqll0=; b=bwea3ctxQQOh7UunFyJLzy2ygL
	NZ3ytO+Gm1Ebm3oJW6QtcrdBqROvEq07jdQEg2/CKDbHwe0jxBFWr83CKzOYRO7rg3f9dpuf0Uq5T
	6kn+al4qtzr/n7uypoKvae66fcAPaNgl8AJ0ARqhzz7yXna0R5Qk0t4m1JdGAM1dHFRA=;
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
Subject: [PATCH v6 06/15] emul/ns16x50: implement IER/IIR registers
Date: Fri,  5 Sep 2025 16:27:05 -0700
Message-ID: <20250905232715.440758-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add interrupt enable register emulation (IER) and interrupt identity reason
(IIR) register emulation to the I/O port handler.

Also add routines for asserting/deasserting the virtual ns16x50 interrupt
line as a dependent on IIR code.

Poke ns16x50_irq_check() on every I/O register access because the emulator
does not have clock emulation anyway (e.g. for baud rate emulation).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- stubbed out ns16x50_iir_check_xxx()
- dropped UART_IIR_THR handling (moved to THR register patch)
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-6-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 135 ++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 51ec85e57627..a7429c84c36e 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -91,6 +91,121 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
     return 0;
 }
 
+static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
+{
+    return false;
+}
+
+/*
+ * Get the interrupt identity reason.
+ *
+ * IIR is re-calculated once called, because ns16x50 always reports high
+ * priority events first.
+ * regs[NS16X50_REGS_NUM + UART_IIR] is used to store THR reason only.
+ */
+static uint8_t ns16x50_iir_get(const struct vuart_ns16x50 *vdev)
+{
+    /*
+     * Interrupt identity reasons by priority.
+     * NB: high priority are at lower indexes below.
+     */
+    static const struct {
+        bool (*check)(const struct vuart_ns16x50 *vdev);
+        uint8_t ier;
+        uint8_t iir;
+    } iir_by_prio[] = {
+        [0] = { ns16x50_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
+        [1] = { ns16x50_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
+        [2] = { ns16x50_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
+        [3] = { ns16x50_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
+    };
+    const uint8_t *regs = vdev->regs;
+    uint8_t iir = 0;
+    unsigned int i;
+
+    /*
+     * NB: every interaction w/ ns16x50 registers (except DLAB=1) goes
+     * through that call.
+     */
+    ASSERT(spin_is_locked(&vdev->lock));
+
+    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
+    {
+        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
+             iir_by_prio[i].check(vdev) )
+            break;
+
+    }
+    if ( i == ARRAY_SIZE(iir_by_prio) )
+        iir |= UART_IIR_NOINT;
+    else
+        iir |= iir_by_prio[i].iir;
+
+    if ( regs[UART_FCR] & UART_FCR_ENABLE )
+        iir |= UART_IIR_FE;
+
+    return iir;
+}
+
+static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
+{
+    struct domain *d = vdev->owner;
+    const struct vuart_info *info = vdev->info;
+    int vector;
+
+    if ( has_vpic(d) )
+        vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
+    else
+        ASSERT_UNREACHABLE();
+
+    ns16x50_debug(vdev, "IRQ#%d vector %d assert\n", info->irq, vector);
+}
+
+static void ns16x50_irq_deassert(const struct vuart_ns16x50 *vdev)
+{
+    struct domain *d = vdev->owner;
+    const struct vuart_info *info = vdev->info;
+
+    if ( has_vpic(d) )
+        hvm_isa_irq_deassert(d, info->irq);
+    else
+        ASSERT_UNREACHABLE();
+
+    ns16x50_debug(vdev, "IRQ#%d deassert\n", info->irq);
+}
+
+/*
+ * Assert/deassert virtual ns16x50 interrupt line.
+ */
+static void ns16x50_irq_check(const struct vuart_ns16x50 *vdev)
+{
+    uint8_t iir = ns16x50_iir_get(vdev);
+    const struct vuart_info *info = vdev->info;
+
+    if ( iir & UART_IIR_NOINT )
+        ns16x50_irq_deassert(vdev);
+    else
+        ns16x50_irq_assert(vdev);
+
+    ns16x50_debug(vdev, "IRQ#%d IIR 0x%02x %s\n", info->irq, iir,
+                  (iir & UART_IIR_NOINT) ? "deassert" : "assert");
+}
+
 /*
  * Emulate 8-bit write access to ns16x50 register.
  */
@@ -107,6 +222,10 @@ static int ns16x50_io_write8(
     {
         switch ( reg )
         {
+        case UART_IER:
+            regs[UART_IER] = val & UART_IER_MASK;
+            break;
+
         /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
         case UART_SCR:
             regs[UART_SCR] = val;
@@ -116,6 +235,8 @@ static int ns16x50_io_write8(
             rc = -EINVAL;
             break;
         }
+
+        ns16x50_irq_check(vdev);
     }
 
     return rc;
@@ -183,6 +304,14 @@ static int ns16x50_io_read8(
     {
         switch ( reg )
         {
+        case UART_IER:
+            val = regs[UART_IER];
+            break;
+
+        case UART_IIR: /* RO */
+            val = ns16x50_iir_get(vdev);
+            break;
+
         case UART_SCR:
             val = regs[UART_SCR];
             break;
@@ -191,6 +320,8 @@ static int ns16x50_io_read8(
             rc = -EINVAL;
             break;
         }
+
+        ns16x50_irq_check(vdev);
     }
 
     *data = val;
@@ -344,6 +475,10 @@ static int ns16x50_init(void *arg)
 
     register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
 
+    spin_lock(&vdev->lock);
+    ns16x50_irq_check(vdev);
+    spin_unlock(&vdev->lock);
+
     return 0;
 }
 
-- 
2.51.0



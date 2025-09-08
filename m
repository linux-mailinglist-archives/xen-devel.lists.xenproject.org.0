Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B3B49B95
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115539.1462134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9c-0000RC-3c; Mon, 08 Sep 2025 21:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115539.1462134; Mon, 08 Sep 2025 21:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9b-0000Kl-VF; Mon, 08 Sep 2025 21:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1115539;
 Mon, 08 Sep 2025 21:11:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9a-0000E8-Vi
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:11:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9a-000FTE-26;
 Mon, 08 Sep 2025 21:11:58 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9a-000gMH-2K;
 Mon, 08 Sep 2025 21:11:58 +0000
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
	bh=UpqDmrURqhicTlP+xGJnrT1Wd61lJrVuEW9MZuV9LUw=; b=QJ+W5RoOargplJeMWgu+XCccUz
	wZJBB6qyLmwA6PakBbMOh8500+D+mgMfVMPDgHPZa+OZ+1SGo2fo3OIGrZuQUuI5j7qmTXKN26yCk
	91RDoRYIJxLN6G66S7CZlRJkXeYy3HRRx+GeUjjYcAXXbOLUFQ8ld2hXjiPr35WrAJP8=;
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
Subject: [PATCH v7 06/16] emul/ns16x50: implement IER/IIR registers
Date: Mon,  8 Sep 2025 14:11:39 -0700
Message-ID: <20250908211149.279143-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add interrupt enable register emulation (IER) and interrupt identity reason
(IIR) register emulation to the I/O port handler.

Also add routines for asserting/deasserting the virtual ns16x50 interrupt
line as a dependent on IIR code. vPIC case is implemented (HVM), vIOAPIC
case is stubbed out (for follow on PVH).

Poke ns16x50_irq_check() on every I/O register access because the emulator
does not have clock emulation anyway (e.g. for baud rate emulation).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- removed asserts for !has_vpic() paths
---
 xen/common/emul/vuart/ns16x50.c | 138 ++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 5643ef4cc01e..664d799ddaee 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -90,6 +90,124 @@ static uint8_t ns16x50_dlab_get(const struct vuart_ns16x50 *vdev)
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
+    else if ( has_vioapic(d) )
+        /* TODO */
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
+    else if ( has_vioapic(d) )
+        /* TODO */
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
@@ -106,6 +224,10 @@ static int ns16x50_io_write8(
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
@@ -115,6 +237,8 @@ static int ns16x50_io_write8(
             rc = -EINVAL;
             break;
         }
+
+        ns16x50_irq_check(vdev);
     }
 
     return rc;
@@ -182,6 +306,14 @@ static int ns16x50_io_read8(
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
@@ -190,6 +322,8 @@ static int ns16x50_io_read8(
             rc = -EINVAL;
             break;
         }
+
+        ns16x50_irq_check(vdev);
     }
 
     *data = val;
@@ -342,6 +476,10 @@ static int ns16x50_init(void *arg)
 
     register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
 
+    spin_lock(&vdev->lock);
+    ns16x50_irq_check(vdev);
+    spin_unlock(&vdev->lock);
+
     return 0;
 }
 
-- 
2.51.0



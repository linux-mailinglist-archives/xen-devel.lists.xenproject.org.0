Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E889E6683
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849635.1264278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQKm-0004KS-K3; Fri, 06 Dec 2024 04:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849635.1264278; Fri, 06 Dec 2024 04:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQKm-0004Iv-Fj; Fri, 06 Dec 2024 04:52:56 +0000
Received: by outflank-mailman (input) for mailman id 849635;
 Fri, 06 Dec 2024 04:52:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQAA-0004Ka-O2
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6470a81d-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BAEF15C72FF;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B6CFC4CED2;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 52BB3E77173;
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
X-Inumbo-ID: 6470a81d-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=7ox8AYuku3MUu+7+JCRRTVFu9hJNAn02RVHVzf791I4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gIA2SOY1FfFYBYT1Mmn4tWVnGT57WAyk1dcQl+Fw8XfrjJyy9Um+J5ZAvBrPlWslv
	 QzDQZ3gW/E1Ci1SkfDbo+0ggHYViOgCsDZh7dJSrXYhmhqCo1hK4HNGfJhSizGYtL5
	 a+S00kY3yAJqwRR7N81KJ77s9k2QTTz578/1ds7mi266oCf/DQvW8VfihtgFMRIGjh
	 kIkOTAZxAI9/c9X9HDOiDv2ouuURQEryJYIWyuisFo0fsU1KtfzlzrkAYUfbvg7tb8
	 gABL97+S6AMlFfIeqlBSXZd6U888fdMFcWA+rXACKuuy7X+YfAG+RtfGNbozuPHS1b
	 alMobDk4jzjBg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:42:01 -0800
Subject: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=30223;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=42CO+kpsKd8aGqw1Wi2RPUjXAFZtPSxxxhuC3C8Cx0s=;
 b=7jSym1HCgQXK3tY7REAoo34oHbZ8fob7eg2BunF86hE4iqf1r6WP4Bhl5Ef95ykA0IYEOqUXA
 v32CRfUfgP0DKJanKLEugltnyzw1PzKz2qld3GUsKHDMHu2CnzCfS1C
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs under
CONFIG_HAS_VUART_NS8250.

In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
early guest OS bringup debugging, because it eliminates dependency on the
external emulator being operational by the time domains are created. Also,
there's no early console facility similar to vpl011 to support x86 guest OS
bring up.

By default, CONFIG_HAS_VUART_NS8250 enables emulatio of NS8250 at I/O port
0x3f8, IRQ#4 in guest OS.

Limitations:
- Only x86;
- Only Linux guest tested so far;
- Only legacy COM{1,2,3,4} resources, no customization;
- Only Xen console as a backend, no inter-domain communication (similar to
  vpl011 on Arm);
- Only 8-bit characters;
- Baud rate is not emulated;
- FIFO-less mode is not emulated properly;
- RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
  has special FCR handling;
- No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
  friends);
- Assumes no ISA-device IRQ sharing;
- MMIO-based UART is not supported.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/Kconfig                    |  14 +
 xen/arch/x86/hvm/Makefile                   |   1 +
 xen/arch/x86/hvm/hvm.c                      |  13 +
 xen/arch/x86/hvm/vuart_ns8250.c             | 886 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/domain.h       |   5 +
 xen/arch/x86/include/asm/hvm/vuart_ns8250.h |  75 +++
 6 files changed, 994 insertions(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 361bb6572e633f3cf0fc972a3b391e8341c33361..af6e698b8be0d82af94b00c0cfdaf9a2bc24b154 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -61,3 +61,17 @@ config HVM_FEP
 	  for use in production.
 
 	  If unsure, say N.
+
+config HAS_VUART_NS8250
+	bool "NS8250-compatible UART Emulation"
+	depends on HVM && HAS_IOPORTS
+	default n
+	help
+	  In-hypervisor NS8250/NS16x50 UART emulation.
+
+	  Only legacy PC I/O ports are emulated.
+
+	  This is strictly for testing purposes (early HVM guest console), and not
+	  appropriate for use in production.
+
+	  If unsure, say N.
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2bf75d336b39f343241bfced5b91b09..14761435e0694109f815da63289666c0f1cbf0ce 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -29,3 +29,4 @@ obj-y += vm_event.o
 obj-y += vmsi.o
 obj-y += vpic.o
 obj-y += vpt.o
+obj-$(CONFIG_HAS_VUART_NS8250) += vuart_ns8250.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 493b699c708949b2109c26573a107565543f5d45..db61af7defc5f5da795b7a613fe4d32fbff7d93e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -55,6 +55,7 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/viridian.h>
 #include <asm/hvm/vm_event.h>
+#include <asm/hvm/vuart_ns8250.h>
 #include <asm/altp2m.h>
 #include <asm/mtrr.h>
 #include <asm/apic.h>
@@ -679,6 +680,15 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc != 0 )
         goto fail1;
 
+    if ( domain_has_vuart(d) )
+    {
+        rc = domain_vuart_init(d);
+        if ( rc == 0 )
+            d->is_console = true;
+        else if ( rc != -ENODEV )
+            goto out_vioapic_deinit;
+    }
+
     stdvga_init(d);
 
     rtc_init(d);
@@ -699,6 +709,9 @@ int hvm_domain_initialise(struct domain *d,
     return 0;
 
  fail2:
+    if ( domain_has_vuart(d) )
+        domain_vuart_free(d);
+ out_vioapic_deinit:
     vioapic_deinit(d);
  fail1:
     if ( is_hardware_domain(d) )
diff --git a/xen/arch/x86/hvm/vuart_ns8250.c b/xen/arch/x86/hvm/vuart_ns8250.c
new file mode 100644
index 0000000000000000000000000000000000000000..779dbd80d7be4e070ea9df3ae736ecdc662a527a
--- /dev/null
+++ b/xen/arch/x86/hvm/vuart_ns8250.c
@@ -0,0 +1,886 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * NS8250-compatible UART Emulator.
+ *
+ * Limitations:
+ * - Only x86;
+ * - Only Linux guest tested so far;
+ * - Only legacy COM{1,2,3,4} resources, no customization;
+ * - Only Xen console as a backend, no inter-domain communication (similar to
+ *   vpl011 on Arm);
+ * - Only 8-bit characters;
+ * - Baud rate is not emulated;
+ * - FIFO-less mode is not emulated properly;
+ * - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
+ *   has special FCR handling;
+ * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
+ *   friends);
+ * - Assumes no ISA-device IRQ sharing;
+ * - MMIO-based UART is not supported;
+ * - PCI UART is not supported.
+ */
+
+#define pr_fmt(fmt)         "ns8250: " fmt
+#define pr_log_level        hvm_ns8250_log_level
+
+/* Development debugging */
+#define NS8250_LOG_LEVEL    0
+
+#include <xen/types.h>
+#include <xen/event.h>
+#include <xen/lib.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/trace.h>
+#include <xen/resource.h>
+#include <xen/ctype.h>
+#include <xen/param.h>
+#include <xen/console.h> /* console_input_domid() */
+#include <asm/setup.h>   /* max_init_domid */
+#include <asm/iocap.h>
+#include <asm/hvm/hvm.h>
+#include <asm/hvm/io.h>
+#include <asm/hvm/vuart_ns8250.h>
+
+#if !defined(pr_fmt)
+#define pr_fmt(fmt) fmt
+#endif
+
+#if !defined(pr_log_level)
+#define pr_log_level 0
+#endif
+
+#define pr_err(fmt, args...) \
+    gprintk(KERN_ERR, pr_fmt(fmt), ## args)
+#define pr_warn(fmt, args...) \
+    if (pr_log_level) gprintk(KERN_WARNING, pr_fmt(fmt), ## args)
+#define pr_info(fmt, args...) \
+    if (pr_log_level) gprintk(KERN_INFO, pr_fmt(fmt), ## args)
+#define pr_debug(fmt, args...) \
+    if (pr_log_level) gprintk(KERN_DEBUG, pr_fmt(fmt), ## args)
+
+/*
+ * NS8250 emulator state machine logging (development only)
+ * FIXME: use similar to parse_guest_loglvl()
+ */
+static unsigned int __read_mostly hvm_ns8250_log_level = NS8250_LOG_LEVEL;
+integer_param("hvm.ns8250.log_level", hvm_ns8250_log_level);
+
+/*
+ * Default emulated NS8250 resources.
+ * If not specified, COM1 (I/O port 0x3f8, IRQ#4) is emulated.
+ * FIXME: follow Linux'es console= syntax or re-use
+ * ns16550_parse_port_config().
+ */
+static char __read_mostly hvm_ns8250_console[64];
+string_param("hvm.ns8250.console", hvm_ns8250_console);
+
+/* I/O access mask */
+static const uint32_t io_access_mask[] = {
+    [0] = 0X00000000U,
+    [1] = 0X000000FFU,
+    [2] = 0X0000FFFFU,
+    [4] = 0XFFFFFFFFU,
+};
+
+/*
+ * Legacy IBM PC NS8250 resources.
+ * There are only 4 I/O port ranges, hardcoding all of them here.
+ */
+static const struct {
+    const char *name;
+    const struct resource *res;
+} ns8250_x86_legacy_uarts[4] = {
+    [0] = {
+        .name = "com1",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x3F8, .size = UART_MAX },
+            { .type = IORESOURCE_IRQ, .addr = 4,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+    [1] = {
+        .name = "com2",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x2F8, .size = UART_MAX },
+            { .type = IORESOURCE_IRQ, .addr = 3,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+    [2] = {
+        .name = "com3",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x3E8, .size = UART_MAX },
+            { .type = IORESOURCE_IRQ, .addr = 4,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+    [3] = {
+        .name = "com4",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x2E8, .size = UART_MAX },
+            { .type = IORESOURCE_IRQ, .addr = 3,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+};
+
+static bool ns8250_fifo_rx_empty(struct vuart_ns8250 *vdev)
+{
+    struct xencons_interface *cons = vdev->cons;
+
+    return cons->in_prod == cons->in_cons;
+}
+
+static bool ns8250_fifo_rx_full(struct vuart_ns8250 *vdev)
+{
+    struct xencons_interface *cons = vdev->cons;
+
+    return cons->in_prod - cons->in_cons == sizeof(cons->in);
+}
+
+static void ns8250_fifo_rx_reset(struct vuart_ns8250 *vdev)
+{
+    struct xencons_interface *cons = vdev->cons;
+
+    cons->in_cons = cons->in_prod;
+}
+
+static int ns8250_fifo_rx_getchar(struct vuart_ns8250 *vdev)
+{
+    struct xencons_interface *cons = vdev->cons;
+    int rc = -1;
+
+    if ( !ns8250_fifo_rx_empty(vdev) )
+    {
+        rc = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
+        cons->in_cons++;
+    }
+
+    return rc;
+}
+
+static int ns8250_fifo_rx_putchar(struct vuart_ns8250 *vdev, char c)
+{
+    struct xencons_interface *cons = vdev->cons;
+    int rc = 0;
+
+    /*
+     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
+     * of the THR.
+     */
+    if ( ns8250_fifo_rx_full(vdev) )
+    {
+        ns8250_fifo_rx_reset(vdev);
+        rc = -ENOSPC;
+    }
+
+    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
+    cons->in_prod++;
+
+    return rc;
+}
+
+/*
+ * Flush cached output to Xen console.
+ * Can be called from ns8250_exit().
+ */
+static void ns8250_fifo_tx_reset(struct vuart_ns8250 *vdev)
+{
+    struct xencons_interface *cons = vdev->cons;
+
+    if ( cons->out_prod == 0 )
+        return;
+
+    cons->out[cons->out_prod++] = '\0';
+
+    /*
+     * NB: do not show domain ID if the domain owning the virtual UART also
+     * owns Xen input console.
+     */
+    if ( vdev->owner->domain_id == console_owner_domid() )
+        printk_common("%s", cons->out);
+    else
+        guest_printk(vdev->owner, "%s", cons->out);
+
+    cons->out_prod = 0;
+}
+
+/*
+ * Send a character to Xen console.
+ */
+static void ns8250_fifo_tx_putchar(struct vuart_ns8250 *vdev, char ch)
+{
+    struct xencons_interface *cons = vdev->cons;
+
+    if ( !isconsole(ch) )
+        return;
+
+    cons->out[cons->out_prod] = ch;
+    cons->out_prod++;
+
+    if ( cons->out_prod == ARRAY_SIZE(cons->out) - 1
+            || ch == '\n' || ch == '\0' )
+        ns8250_fifo_tx_reset(vdev);
+}
+
+static bool cf_check ns8250_iir_check_lsi(struct vuart_ns8250 *vdev)
+{
+    return  !!( vdev->regs[UART_LSR] & UART_LSR_MASK );
+}
+
+static bool cf_check ns8250_iir_check_rda(struct vuart_ns8250 *vdev)
+{
+    return !ns8250_fifo_rx_empty(vdev);
+}
+
+static bool cf_check ns8250_iir_check_thr(struct vuart_ns8250 *vdev)
+{
+    return !!( vdev->flags & NS8250_IRQ_THRE_PENDING );
+}
+
+static bool cf_check ns8250_iir_check_msi(struct vuart_ns8250 *vdev)
+{
+    return !!( vdev->regs[UART_MSR] & UART_MSR_DELTA );
+}
+
+/*
+ * Interrupt identity reasons by priority.
+ * NB: highest priority are at lower indexes.
+ */
+static const struct {
+    uint8_t ier_mask;
+    uint8_t iir_mask;
+    bool (*iir_check)(struct vuart_ns8250 *vdev);
+} iir_by_prio[] = {
+    [0] = { UART_IER_ELSI,   UART_IIR_LSI, ns8250_iir_check_lsi },
+    [1] = { UART_IER_ERDAI,  UART_IIR_RDA, ns8250_iir_check_rda },
+    [2] = { UART_IER_ETHREI, UART_IIR_THR, ns8250_iir_check_thr },
+    [3] = { UART_IER_EMSI,   UART_IIR_MSI, ns8250_iir_check_msi },
+};
+
+/*
+ * Define the interrupt identity reason.
+ * NB: NS8250 always reports high priority events first.
+ */
+static uint8_t ns8250_irq_reason(struct vuart_ns8250 *vdev)
+{
+    int i;
+
+    ASSERT( spin_is_locked(&vdev->lock) );
+    for ( i = 0; i < ARRAY_SIZE(iir_by_prio); i++ )
+    {
+        if ( (vdev->regs[UART_IER] & iir_by_prio[i].ier_mask)
+                && iir_by_prio[i].iir_check(vdev) )
+            return iir_by_prio[i].iir_mask;
+    }
+
+    return UART_IIR_NOINT;
+}
+
+/*
+ * Assert virtual NS8250 interrupt line.
+ */
+static void ns8250_irq_assert(struct vuart_ns8250 *vdev)
+{
+    uint8_t iir;
+
+    iir = ns8250_irq_reason(vdev);
+    if (iir & UART_IIR_NOINT)
+        hvm_irq_lower(vdev->owner, vdev->irq);
+    else
+        hvm_irq_raise(vdev->owner, vdev->irq);
+
+    pr_debug("IRQ#%d %x %s\n", vdev->irq, iir,
+            !!(iir & UART_IIR_NOINT) ? "lower" : "raise");
+}
+
+/*
+ * Emulate 8-bit write access to NS8250 register.
+ */
+static int ns8250_io_write8(
+    struct vuart_ns8250 *vdev, uint32_t reg, uint8_t *data)
+{
+    uint8_t val;
+    int rc = 0;
+
+    val = *data;
+
+    switch ( reg )
+    {
+    /* DLAB=0 */
+    case UART_THR:
+        if ( vdev->regs[UART_MCR] & UART_MCR_LOOP )
+        {
+            ns8250_fifo_rx_putchar(vdev, val);
+            vdev->regs[UART_LSR] |= UART_LSR_OE;
+        }
+        else
+            ns8250_fifo_tx_putchar(vdev, val);
+
+        vdev->flags |= NS8250_IRQ_THRE_PENDING;
+
+        break;
+
+    case UART_IER:
+        if ( val & vdev->regs[UART_IER] & UART_IER_ETHREI )
+            vdev->flags |= NS8250_IRQ_THRE_PENDING;
+
+        vdev->regs[UART_IER] = val & UART_IER_MASK;
+
+        break;
+
+    case UART_FCR: /* WO */
+        if ( val & UART_FCR_CLRX )
+            ns8250_fifo_rx_reset(vdev);
+
+        if ( val & UART_FCR_CLTX )
+            ns8250_fifo_tx_reset(vdev);
+
+        if ( !(val & UART_FCR_ENABLE) )
+            val = 0;
+
+        vdev->regs[UART_FCR] = val & (UART_FCR_ENABLE |
+                                      UART_FCR_DMA |
+                                      UART_FCR_TRG_MASK);
+
+        break;
+
+    case UART_LCR:
+        vdev->regs[UART_LCR] = val;
+        break;
+
+    case UART_MCR: {
+        uint8_t msr_curr, msr_next, msr_delta;
+
+        msr_curr = vdev->regs[UART_MSR];
+        msr_next = 0;
+        msr_delta = 0;
+
+        /* Set modem status */
+        if ( val & UART_MCR_LOOP )
+        {
+            if ( val & UART_MCR_DTR )
+                msr_next |= UART_MSR_DSR;
+            if ( val & UART_MCR_RTS )
+                msr_next |= UART_MSR_CTS;
+            if ( val & UART_MCR_OUT1 )
+                msr_next |= UART_MSR_RI;
+            if ( val & UART_MCR_OUT2 )
+                msr_next |= UART_MSR_DCD;
+        }
+        else
+            msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
+
+        /* Calculate changes in modem status */
+        if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
+            msr_delta |= UART_MSR_DCTS;
+        if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS) )
+            msr_delta |= UART_MSR_DDSR;
+        if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
+            msr_delta |= UART_MSR_TERI;
+        if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
+            msr_delta |= UART_MSR_DDCD;
+
+        vdev->regs[UART_MCR] = val & UART_MCR_MASK;
+        vdev->regs[UART_MSR] = msr_next | msr_delta;
+
+        break;
+    }
+
+    case UART_LSR: /* RO */
+    case UART_MSR: /* RO */
+        rc = -EINVAL;
+        break;
+
+    /*
+     * NB: Firmware like OVMF rely on SCR presence to initialize the ns8250
+     * driver.
+     */
+    case UART_SCR:
+        vdev->regs[UART_SCR] = val;
+        break;
+
+    /* DLAB=1 */
+    case UART_MAX + UART_DLL:
+        vdev->dl = (vdev->dl & 0xFF00U) | val;
+        break;
+
+    case UART_MAX + UART_DLM:
+        vdev->dl = (val << 8) | (vdev->dl & 0x00FFU);
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
+    return rc;
+}
+
+/*
+ * Emulate 16-bit write access to NS8250 register.
+ * NB: some guest OSes use outw() to access UART_DLL.
+ */
+static int ns8250_io_write16(
+    struct vuart_ns8250 *vdev, uint32_t reg, uint16_t *data)
+{
+    int rc;
+
+    switch ( reg )
+    {
+    case UART_MAX + UART_DLL:
+        vdev->dl = *data;
+        rc = 0;
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
+    return rc;
+}
+
+/*
+ * Emulate write access to NS8250 register.
+ */
+static int ns8250_io_write(
+    struct vuart_ns8250 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
+{
+    int rc = -EINVAL;
+
+    switch ( size )
+    {
+    case 1:
+        rc = ns8250_io_write8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc = ns8250_io_write16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        break;
+    }
+
+    ns8250_irq_assert(vdev);
+
+    return rc;
+}
+
+/*
+ * Emulate 8-bit read access to NS8250 register.
+ */
+static int ns8250_io_read8(
+    struct vuart_ns8250 *vdev, uint32_t reg, uint8_t *data)
+{
+    int rc = 0;
+    uint8_t val;
+
+    switch ( reg )
+    {
+    /* DLAB=0 */
+    case UART_RBR:
+        val = (uint8_t)ns8250_fifo_rx_getchar(vdev);
+        /* NB: do not forget to clear overrun condition */
+        vdev->regs[UART_LSR] &= ~UART_LSR_OE;
+        break;
+
+    case UART_IER: /* RO */
+        val = vdev->regs[UART_IER];
+        break;
+
+    case UART_IIR:
+        val = ns8250_irq_reason(vdev);
+        if ( val & UART_IIR_THR )
+            vdev->flags &= ~NS8250_IRQ_THRE_PENDING;
+
+        if ( vdev->regs[UART_FCR] & UART_FCR_ENABLE )
+            val |= UART_IIR_FE_MASK;
+
+        break;
+
+    case UART_LCR:
+        val = vdev->regs[UART_LCR];
+        break;
+
+    case UART_MCR:
+        val = vdev->regs[UART_MCR];
+        break;
+
+    case UART_LSR:
+        val = vdev->regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
+        if ( ns8250_fifo_rx_empty(vdev) )
+            val &= ~UART_LSR_DR;
+        else
+            val |= UART_LSR_DR;
+
+        vdev->regs[UART_LSR] = val & ~UART_LSR_MASK;
+
+        break;
+
+    case UART_MSR:
+        val = vdev->regs[UART_MSR];
+        vdev->regs[UART_MSR] &= ~UART_MSR_DELTA;
+        break;
+
+    case UART_SCR:
+        val = vdev->regs[UART_SCR];
+        break;
+
+    /* DLAB=1 */
+    case UART_MAX + UART_DLL:
+        val = vdev->dl & 0xFFU;
+        break;
+
+    case UART_MAX + UART_DLM:
+        val = vdev->dl >> 8;
+        break;
+
+    default:
+        val = (uint8_t)io_access_mask[1];
+        rc = -EINVAL;
+        break;
+    }
+
+    *data = val;
+
+    return rc;
+}
+
+/*
+ * Emulate 16-bit read access to NS8250 register.
+ */
+static int ns8250_io_read16(
+    struct vuart_ns8250 *vdev, uint32_t reg, uint16_t *data)
+{
+    uint16_t val;
+    int rc;
+
+    switch ( reg )
+    {
+    case UART_MAX + UART_DLL:
+        val = vdev->dl;
+        rc = 0;
+        break;
+
+    default:
+        val = (uint16_t)io_access_mask[2];
+        rc = -EINVAL;
+        break;
+    }
+
+    *data = val;
+
+    return rc;
+}
+
+/*
+ * Emulate read access to NS8250 register.
+ */
+static int ns8250_io_read(
+    struct vuart_ns8250 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc = ns8250_io_read8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc = ns8250_io_read16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        *data = io_access_mask[size];
+        rc = -EINVAL;
+        break;
+    }
+
+    ns8250_irq_assert(vdev);
+
+    return rc;
+}
+
+static const char *ns8250_regname(
+    const struct vuart_ns8250 *vdev, uint32_t reg, int dir)
+{
+    static const char *reg_names[UART_MAX + 2][2] = {
+        /* register                 W      R   */
+        [UART_RBR] =            { "THR", "RBR" },
+        [UART_IER] =            { "IER", "IER" },
+        [UART_IIR] =            { "FCR", "IIR" },
+        [UART_LCR] =            { "LCR", "LCR" },
+        [UART_MCR] =            { "MCR", "MCR" },
+        [UART_LSR] =            { "LSR", "LSR" },
+        [UART_MSR] =            { "MSR", "MSR" },
+        [UART_SCR] =            { "SCR", "SCR" },
+        [UART_MAX + UART_DLL] = { "DLL", "DLL" },
+        [UART_MAX + UART_DLM] = { "DLM", "DLM" },
+    };
+
+    return reg_names[reg][dir];
+}
+
+/*
+ * Emulate I/O access to NS8250 register.
+ */
+static int cf_check ns8250_io_handle(
+    int dir, unsigned int addr, unsigned int size, uint32_t *data)
+{
+#define op(dir)     (((dir) == IOREQ_WRITE) ? 'W' : 'R')
+    struct domain *d = rcu_lock_current_domain();
+    struct vuart_ns8250 *vdev = &d->arch.hvm.vuart;
+    uint32_t offset, reg;
+    int rc;
+
+    spin_lock(&vdev->lock);
+
+    BUG_ON( vdev->owner != d );
+
+    if ( !(vdev->flags & NS8250_READY) )
+    {
+        pr_err("%c io 0x%04x %d 0x%08"PRIx32": propagate to external I/O emulator\n",
+                op(dir), addr, size, *data);
+        rc = X86EMUL_UNHANDLEABLE;
+        goto out;
+    }
+
+    reg = addr - vdev->io_addr;
+    BUG_ON( reg >= UART_MAX );
+    if ( reg % size != 0 )
+    {
+        pr_err("%c 0x%04x %d 0x%08"PRIx32": unaligned access\n",
+                op(dir), addr, size, *data & io_access_mask[size]);
+        rc = X86EMUL_OKAY;
+        goto out;
+    }
+
+    /* Redirect access to divisor latch registers */
+    if ( !!(vdev->regs[UART_LCR] & UART_LCR_DLAB)
+            && (reg == UART_DLL || reg == UART_DLM) )
+        offset = UART_MAX + reg;
+    else
+        offset = reg;
+
+    if ( dir == IOREQ_WRITE )
+    {
+        pr_debug("%c 0x%04x %d 0x%08"PRIx32" %s[0x%02"PRIx32"]\n",
+                op(dir), addr, size,
+                *data & io_access_mask[size],
+                ns8250_regname(vdev, offset, dir), reg);
+        rc = ns8250_io_write(vdev, offset, size, data);
+    }
+    else
+    {
+        rc = ns8250_io_read(vdev, offset, size, data);
+        pr_debug("%c 0x%04x %d 0x%08"PRIx32" %s[0x%02"PRIx32"]\n",
+                op(dir), addr, size,
+                *data & io_access_mask[size],
+                ns8250_regname(vdev, offset, dir), reg);
+    }
+    if ( rc )
+        pr_err("%c 0x%04x %d 0x%08"PRIx32": unsupported access\n",
+                op(dir), addr, size, *data & io_access_mask[size]);
+    rc = X86EMUL_OKAY;
+
+out:
+    spin_unlock(&vdev->lock);
+
+    return rc;
+#undef op
+}
+
+/*
+ * Parse virtual NS8250 configuration.
+ *   hvm.ns8250.console=[com1|com2|com3|com4]
+ */
+static const struct resource *ns8250_parse(void)
+{
+    int i;
+
+    for ( i = 0; i < ARRAY_SIZE(ns8250_x86_legacy_uarts); i++ )
+        if ( !strcasecmp(hvm_ns8250_console, ns8250_x86_legacy_uarts[i].name) )
+            return ns8250_x86_legacy_uarts[i].res;
+
+    return ns8250_x86_legacy_uarts[0].res;
+}
+
+/*
+ * Claim virtual NS8250 resources to domain.
+ */
+static int ns8250_claim(
+    struct vuart_ns8250 *vdev, const struct resource *r, struct domain *d)
+{
+    unsigned long size;
+    unsigned long start;
+    unsigned long end;
+
+    vdev->irq = NO_IRQ;
+    vdev->io_addr = IORESOURCE_UNKNOWN;
+    vdev->io_size = IORESOURCE_UNKNOWN;
+
+    foreach_resource(r)
+    {
+        if ( r->type & IORESOURCE_IO )
+        {
+            size = r->size;
+            start = r->addr;
+            end = r->addr + r->size - 1;
+
+            if ( !ioports_access_permitted(d, start, end) )
+                ioports_permit_access(d, start, end);
+
+            register_portio_handler(d, start, size, ns8250_io_handle);
+
+            /* Used to assert I/O port handler */
+            vdev->io_addr = start;
+            vdev->io_size = size;
+        }
+        else if ( r->type & IORESOURCE_IRQ )
+            /* "Claim" virtual IRQ; assumes no ISA-device IRQ sharing */
+            vdev->irq = r->addr;
+        else
+            return -EINVAL;
+    }
+
+    if ( vdev->irq == NO_IRQ
+            || vdev->io_addr == IORESOURCE_UNKNOWN
+            || vdev->io_size == IORESOURCE_UNKNOWN )
+        return -ENODEV;
+
+    return 0;
+}
+
+/*
+ * Unclaim virtual NS8250 resources.
+ */
+static void ns8250_unclaim(struct vuart_ns8250 *vdev, struct domain *d)
+{
+    unsigned long size = vdev->io_size;
+    unsigned long start = vdev->io_addr;
+    unsigned long end = start + size - 1;
+
+    if ( ioports_access_permitted(d, start, end) )
+        ioports_deny_access(d, start, size);
+}
+
+static int ns8250_init(struct domain *d, const struct resource *r)
+{
+    struct vuart_ns8250 *vdev = &d->arch.hvm.vuart;
+    struct xencons_interface *cons;
+    int rc;
+
+    cons = _xzalloc(sizeof(*vdev->cons), sizeof(void *));
+    if ( cons == NULL )
+        return -ENOMEM;
+
+    rc = ns8250_claim(vdev, r, d);
+    if ( rc )
+    {
+        xfree(cons);
+        return rc;
+    }
+
+    spin_lock_init(&vdev->lock);
+    hvm_irq_lower(d, vdev->irq);
+
+    vdev->dl = (UART_CLOCK_HZ / 115200) >> 4; /* Report 115200 baud rate */
+    vdev->cons = cons;
+    vdev->owner = d;
+    vdev->flags = NS8250_READY | NS8250_IRQ_THRE_PENDING;
+
+    return 0;
+}
+
+static void ns8250_exit(struct domain *d)
+{
+    struct vuart_ns8250 *vdev = &d->arch.hvm.vuart;
+
+    spin_lock(&vdev->lock);
+
+    if ( !(vdev->flags & NS8250_READY) )
+        goto out;
+
+    ns8250_unclaim(vdev, d);
+    ns8250_fifo_tx_reset(vdev);
+    xfree(vdev->cons);
+
+    vdev->cons = NULL;
+    vdev->owner = NULL;
+    vdev->flags = 0;
+
+out:
+    spin_unlock(&vdev->lock);
+}
+
+int vuart_putchar(struct vuart_ns8250 *vdev, char ch)
+{
+    int rc;
+
+    spin_lock(&vdev->lock);
+
+    if ( !(vdev->flags & NS8250_READY) )
+    {
+        rc = -ENODEV;
+        goto out;
+    }
+
+    /* Echo the user input on the console */
+    printk("%c", ch);
+
+    /*
+     * Device is in loopback mode; do nothing.
+     */
+    if ( vdev->regs[UART_MCR] & UART_MCR_LOOP )
+    {
+        rc = -EBUSY;
+        goto out;
+    }
+
+    rc = ns8250_fifo_rx_putchar(vdev, ch);
+    if ( rc == -ENOSPC )
+        vdev->regs[UART_LSR] |= UART_LSR_OE | UART_LSR_DR;
+    else
+        /* NB: UART_LSR_DR is also set when UART_LSR is accessed. */
+        vdev->regs[UART_LSR] |= UART_LSR_DR;
+
+    /* FIXME: check FCR when to fire an interrupt */
+    ns8250_irq_assert(vdev);
+
+out:
+    spin_unlock(&vdev->lock);
+
+    return rc;
+}
+
+int domain_vuart_init(struct domain *d)
+{
+    struct vuart_ns8250 *vdev = &d->arch.hvm.vuart;
+    const struct resource *r;
+
+    memset(vdev, 0, sizeof(*vdev));
+
+    r = ns8250_parse();
+    if ( r != NULL )
+        return ns8250_init(d, r);
+
+    return -ENODEV;
+}
+
+void domain_vuart_free(struct domain *d)
+{
+    ns8250_exit(d);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2ac01676646b9b277b551f06d43c3a5..d4ce25896259fc9763477e88d56bacbe4f78af5b 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -16,6 +16,7 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/svm/vmcb.h>
+#include <asm/hvm/vuart_ns8250.h>
 
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
@@ -73,6 +74,10 @@ struct hvm_domain {
     struct hvm_vioapic    **vioapic;
     unsigned int           nr_vioapics;
 
+#if defined(CONFIG_HAS_VUART_NS8250)
+    struct vuart_ns8250    vuart;
+#endif
+
     /*
      * hvm_hw_pmtimer is a publicly-visible name. We will defer renaming
      * it to the more appropriate hvm_hw_acpi until the expected
diff --git a/xen/arch/x86/include/asm/hvm/vuart_ns8250.h b/xen/arch/x86/include/asm/hvm/vuart_ns8250.h
new file mode 100644
index 0000000000000000000000000000000000000000..e1013751f955441a9089ea38c96c4605a7f4cb75
--- /dev/null
+++ b/xen/arch/x86/include/asm/hvm/vuart_ns8250.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * NS8250-compatible UART Emulator.
+ */
+#if !defined(HVM__VUART_NS8250_H)
+#define HVM__VUART_NS8250_H
+
+#include <xen/spinlock.h>
+#include <xen/8250-uart.h>
+#include <public/io/console.h> /* xencons_interface */
+
+/*
+ * NS8250 emulator operational flags.
+ */
+enum {
+    /* Emulator is ready */
+    NS8250_READY                = BIT(0, U),
+    /* Trigger re-delivery of THRE interrupt */
+    NS8250_IRQ_THRE_PENDING     = BIT(1, U),
+};
+
+/*
+ * Virtual NS8250 device state.
+ */
+struct vuart_ns8250 {
+    uint16_t dl;                    /* Divisor Latch */
+    uint8_t regs[UART_MAX];         /* Registers */
+    uint32_t flags;                 /* Virtual device flags */
+    uint64_t io_addr;               /* Guest I/O region base address */
+    uint64_t io_size;               /* Guest I/O region size */
+    int irq;                        /* Guest IRQ# */
+    struct xencons_interface *cons; /* Emulated RX/TX FIFOs */
+    struct domain *owner;           /* Owner domain */
+    spinlock_t lock;                /* Protection */
+};
+
+#if defined(CONFIG_HAS_VUART_NS8250)
+
+int vuart_putchar(struct vuart_ns8250 *vdev, char ch);
+
+/*
+ * Match the names w/ arch/arm/vuart.h
+ * FIXME: move to common vuart.h
+ */
+int domain_vuart_init(struct domain *d);
+void domain_vuart_free(struct domain *d);
+
+#else
+
+static inline int vuart_putchar(struct vuart_ns8250 *vdev, char ch)
+{
+    return -1;
+}
+
+static inline int domain_vuart_init(struct domain *d)
+{
+    return -ENODEV;
+}
+
+static inline void domain_vuart_free(struct domain *d)
+{
+}
+
+#endif /* #if defined(CONFIG_HAS_VUART_NS8250) */
+
+#endif /* #if !defined(HVM__VUART_NS8250_H) */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */

-- 
2.34.1




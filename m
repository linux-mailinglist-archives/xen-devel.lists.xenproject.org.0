Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B2A0119F
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864719.1276081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQz-0000h9-NU; Sat, 04 Jan 2025 01:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864719.1276081; Sat, 04 Jan 2025 01:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQy-0000JU-4G; Sat, 04 Jan 2025 01:58:36 +0000
Received: by outflank-mailman (input) for mailman id 864719;
 Sat, 04 Jan 2025 01:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQo-0005Ay-Hd
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ec58b77-ca3f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 02:58:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E209E5C63D5;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 035ACC4CEE3;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F03C5E77199;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5ec58b77-ca3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955896;
	bh=ard5UX4ASLQLjRYgt3OZQKzVUpMmaZiWJf8THwt2c1U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pjT2u1B9stcTye2oZXoJSsok8YnbeR7APOvvZFDRY0fe6gy/gUN7cnm1CQxp1BcRu
	 7wi2S1ioJ3dRXU0weq+015+gHH8TUEY5boJIqgPwa/1FfSqbIJnjvCMemyLLVgt0tF
	 +fX1ORtEjRWQpMsYqrJipU/tdibJlndU5Wo1oh9jyqnbrl7Zjpkre6Tdbt5XCjyGhC
	 w1dseJbChMBv/79CvAMfypfZ6iOYcAtxpzGJHrrH0i1khL3kPVutT5Wm97jgGz4T6B
	 z7ME3lylYuKs644SevAIRaNwbHWLHl/TjBwq+bUz7cjPLfCmadEYC7XVIsQQ0d8350
	 9iLCM4gcg3Rtg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:27 -0800
Subject: [PATCH v3 21/24] x86/hvm: introduce NS16550-compatible UART
 emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-21-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=33000;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=JY8NnZN8J5h06Ci6rDls8X8bQvMTHJfCNc/lld0E2cs=;
 b=2L8iKGD6AUVIWHDKbg1Szk28hZQ7CfLJIVQJjGAYiGG79anmV/wrsZvPM0l5Hnhq0mnMfWHzd
 xCxAPAR0ODWAHGiqBl8VFqx9dgImRsResgUdqpT4oyCEr7K/CMEP7x/
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs under
CONFIG_VUART_NS16550.

x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
guest OS bring up in the embedded setups.

In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
early guest firmware and OS bringup debugging, because it eliminates dependency
on the external emulator (qemu) being operational by the time domains are
created.

The emulator also allows to forward the physical console input to the x86
domain which is useful when a system has only one physical UART for early
debugging and this UART is owned by Xen.

By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O port
0x3f8, IRQ#4 in guest OS (legacy COM1).

Legacy COM resources can be selected at built-time and cannot be configured
per-domain yet.

Please refer to the NS16550 emulator code for limitations.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/Kconfig              |  48 ++
 xen/arch/x86/hvm/Makefile             |   1 +
 xen/arch/x86/hvm/hvm.c                |  10 +
 xen/arch/x86/hvm/vuart-ns16550.c      | 928 ++++++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/domain.h |   4 +
 xen/drivers/virtdev-uart.c            |   6 +
 xen/include/xen/resource.h            |   3 +
 7 files changed, 1000 insertions(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index fdfa9f80d30347ac9c34e52f5ba829bc11916dc0..29de48c147d8362be8bf4f07a3dc0302a0547497 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -71,4 +71,52 @@ config HVM_FEP
 
 	  If unsure, say N.
 
+config VUART_NS16550
+	bool "NS16550-compatible UART Emulation" if EXPERT
+	depends on HAS_IOPORTS
+	select HAS_VUART
+	help
+	  In-hypervisor NS16550/NS16x50 UART emulation.
+
+	  Only legacy PC I/O ports are emulated.
+
+	  This is strictly for testing purposes (such as early HVM guest console),
+	  and not appropriate for use in production.
+
+choice VUART_NS16550_PC
+	prompt "IBM PC COM resources"
+	depends on VUART_NS16550
+	default VUART_NS16550_PC_COM1
+	help
+	  Default emulated NS16550 resources.
+
+config VUART_NS16550_PC_COM1
+	bool "COM1 (I/O port 0x3f8, IRQ#4)"
+
+config VUART_NS16550_PC_COM2
+	bool "COM2 (I/O port 0x2f8, IRQ#3)"
+
+config VUART_NS16550_PC_COM3
+	bool "COM3 (I/O port 0x3e8, IRQ#4)"
+
+config VUART_NS16550_PC_COM4
+	bool "COM4 (I/O port 0x2e8, IRQ#3)"
+
+endchoice
+
+config VUART_NS16550_LOG_LEVEL
+	int "UART emulator verbosity level"
+	range 0 3
+	default "1"
+	depends on VUART_NS16550
+	help
+	  Set the default log level of UART emulator.
+	  See include/xen/config.h for more details.
+
+config VUART_NS16550_DEBUG
+	bool "UART emulator development debugging"
+	depends on VUART_NS16550
+	help
+	  Enable development debugging.
+
 endif
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index 4c1fa5c6c2bf75d336b39f343241bfced5b91b09..ba2baa850183c31b199e4d080aa549e59947ddc1 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -29,3 +29,4 @@ obj-y += vm_event.o
 obj-y += vmsi.o
 obj-y += vpic.o
 obj-y += vpt.o
+obj-$(CONFIG_VUART_NS16550) += vuart-ns16550.o
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ce21f5884b554f27991f19d9953731a9e8241e90..cf610c8e01974df012a93c60657218ae96ca36d9 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -680,6 +680,13 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc != 0 )
         goto fail1;
 
+    if ( domain_has_vuart(d) )
+    {
+        rc = virtdev_uart_init(d, NULL);
+        if ( rc != 0 )
+            goto out_vioapic_deinit;
+    }
+
     stdvga_init(d);
 
     rtc_init(d);
@@ -700,6 +707,9 @@ int hvm_domain_initialise(struct domain *d,
     return 0;
 
  fail2:
+    if ( domain_has_vuart(d) )
+        virtdev_uart_exit(d);
+ out_vioapic_deinit:
     vioapic_deinit(d);
  fail1:
     if ( is_hardware_domain(d) )
diff --git a/xen/arch/x86/hvm/vuart-ns16550.c b/xen/arch/x86/hvm/vuart-ns16550.c
new file mode 100644
index 0000000000000000000000000000000000000000..d0c19f53399bd8241f54d2fe2716e62046b8e59d
--- /dev/null
+++ b/xen/arch/x86/hvm/vuart-ns16550.c
@@ -0,0 +1,928 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * NS16550-compatible UART Emulator.
+ *
+ * See:
+ * - Serial and UART Tutorial:
+ *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-uart_en.pdf
+ * - UART w/ 16 byte FIFO:
+ *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
+ * - UART w/ 64 byte FIFO:
+ *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
+ *
+ * Limitations:
+ * - Only x86;
+ * - Only HVM domains support (build-time), PVH domains are not supported yet;
+ * - Only legacy COM{1,2,3,4} resources via Kconfig, custom I/O ports/IRQs
+ *   are not supported;
+ * - Only Xen console as a backend, no inter-domain communication (similar to
+ *   vpl011 on Arm);
+ * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
+ * - No toolstack integration;
+ * - No baud rate emulation (reports 115200 baud to the guest OS);
+ * - No FIFO-less mode emulation;
+ * - No RX FIFO interrupt moderation (FCR) emulation;
+ * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
+ *   friends);
+ * - No ISA IRQ sharing allowed;
+ * - No MMIO-based UART emulation.
+ */
+
+#define pr_prefix               "ns16550"
+#define pr_fmt(fmt)             pr_prefix ": " fmt
+#define pr_log_level            CONFIG_VUART_NS16550_LOG_LEVEL
+
+#include <asm/setup.h>   /* max_init_domid */
+#include <public/io/console.h>
+#include <xen/8250-uart.h>
+#include <xen/ctype.h>
+#include <xen/ioreq.h>
+#include <xen/resource.h>
+#include <xen/virtdev-uart.h>
+#include <xen/xvmalloc.h>
+
+#define pr_err(fmt, args...) do { \
+    gprintk(KERN_ERR, pr_fmt(fmt), ## args); \
+} while (0)
+
+#define pr_warn(fmt, args...) do { \
+    if ( pr_log_level >= 1) \
+        gprintk(KERN_WARNING, pr_fmt(fmt), ## args); \
+} while (0)
+
+#define pr_info(fmt, args...) do { \
+    if ( pr_log_level >= 2 ) \
+        gprintk(KERN_INFO, pr_fmt(fmt), ## args); \
+} while (0)
+
+#define pr_debug(fmt, args...) do { \
+    if ( pr_log_level >= 3 ) \
+        gprintk(KERN_DEBUG, pr_fmt(fmt), ## args); \
+} while (0)
+
+#if defined(CONFIG_VUART_NS16550_PC_COM1)
+#define X86_PC_UART_IDX         0
+#elif defined(CONFIG_VUART_NS16550_PC_COM2)
+#define X86_PC_UART_IDX         1
+#elif defined(CONFIG_VUART_NS16550_PC_COM3)
+#define X86_PC_UART_IDX         2
+#elif defined(CONFIG_VUART_NS16550_PC_COM4)
+#define X86_PC_UART_IDX         3
+#else
+#error "Unsupported I/O port"
+#endif
+
+/*
+ * Number of supported registers in the UART.
+ */
+#define NS16550_REGS_NUM        ( UART_SCR + 1 )
+
+/*
+ * Number of emulated registers.
+ *
+ * - Emulated registers [0..NS16550_REGS_NUM] are R/W registers for DLAB=0.
+ * - DLAB=1, R/W, DLL            = NS16550_REGS_NUM + 0
+ * - DLAB=1, R/W, DLM            = NS16550_REGS_NUM + 1
+ * -         R/O, IIR (IIR_THR)  = NS16550_REGS_NUM + 2
+ */
+#define NS16550_EMU_REGS_NUM    ( NS16550_REGS_NUM + 3 )
+
+/*
+ * Virtual NS16550 device state.
+ */
+struct vuart_ns16550 {
+    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
+    uint8_t regs[NS16550_EMU_REGS_NUM]; /* Emulated registers */
+    unsigned int irq;                   /* Emulated IRQ# */
+    uint64_t io_addr;                   /* Emulated I/O region base address */
+    uint64_t io_size;                   /* Emulated I/O region size */
+    const char *name;                   /* Device name */
+    struct domain *owner;               /* Owner domain */
+    spinlock_t lock;                    /* Protection */
+};
+
+/*
+ * Virtual device description.
+ */
+struct virtdev_desc {
+    const char *name;
+    const struct resource *res;
+};
+
+/*
+ * Legacy IBM PC NS16550 resources.
+ * There are only 4 I/O port ranges, hardcoding all of them here.
+ */
+static const struct virtdev_desc x86_pc_uarts[4] = {
+    [0] = {
+        .name = "COM1",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x3F8, .size = NS16550_REGS_NUM },
+            { .type = IORESOURCE_IRQ, .addr = 4,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+    [1] = {
+        .name = "COM2",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x2F8, .size = NS16550_REGS_NUM },
+            { .type = IORESOURCE_IRQ, .addr = 3,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+    [2] = {
+        .name = "COM3",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x3E8, .size = NS16550_REGS_NUM },
+            { .type = IORESOURCE_IRQ, .addr = 4,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+    [3] = {
+        .name = "COM4",
+        .res = (const struct resource[]){
+            { .type = IORESOURCE_IO,  .addr = 0x2E8, .size = NS16550_REGS_NUM },
+            { .type = IORESOURCE_IRQ, .addr = 3,     .size = 1 },
+            { .type = IORESOURCE_UNKNOWN },
+        },
+    },
+};
+
+static bool ns16550_fifo_rx_empty(const struct vuart_ns16550 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->in_prod == cons->in_cons;
+}
+
+static bool ns16550_fifo_rx_full(const struct vuart_ns16550 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
+}
+
+static void ns16550_fifo_rx_reset(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    cons->in_cons = cons->in_prod;
+}
+
+static int ns16550_fifo_rx_getchar(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    int rc;
+
+    if ( ns16550_fifo_rx_empty(vdev) )
+    {
+        pr_debug("%s: RX FIFO empty\n", vdev->name);
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
+static int ns16550_fifo_rx_putchar(struct vuart_ns16550 *vdev, char c)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    int rc;
+
+    /*
+     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
+     * of the THR.
+     */
+    if ( ns16550_fifo_rx_full(vdev) )
+    {
+        pr_debug("%s: RX FIFO full; resetting\n", vdev->name);
+        ns16550_fifo_rx_reset(vdev);
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
+static bool ns16550_fifo_tx_empty(const struct vuart_ns16550 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->out_prod == cons->out_cons;
+}
+
+static void ns16550_fifo_tx_reset(struct vuart_ns16550 *vdev)
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
+static void ns16550_fifo_tx_flush(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    if ( ns16550_fifo_tx_empty(vdev) )
+        return;
+
+    ASSERT(cons->out_prod < ARRAY_SIZE(cons->out));
+    cons->out[cons->out_prod] = '\0';
+    cons->out_prod++;
+
+    guest_printk(vdev->owner, "%s", cons->out);
+
+    ns16550_fifo_tx_reset(vdev);
+}
+
+/*
+ * Accumulate guest OS output before sending to Xen console.
+ */
+static void ns16550_fifo_tx_putchar(struct vuart_ns16550 *vdev, char ch)
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
+        ns16550_fifo_tx_flush(vdev);
+}
+
+static inline uint8_t cf_check ns16550_dlab_get(const struct vuart_ns16550 *vdev)
+{
+    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
+}
+
+static bool cf_check ns16550_iir_check_lsi(const struct vuart_ns16550 *vdev)
+{
+    return !!(vdev->regs[UART_LSR] & UART_LSR_MASK);
+}
+
+static bool cf_check ns16550_iir_check_rda(const struct vuart_ns16550 *vdev)
+{
+    return !ns16550_fifo_rx_empty(vdev);
+}
+
+static bool cf_check ns16550_iir_check_thr(const struct vuart_ns16550 *vdev)
+{
+    return !!(vdev->regs[NS16550_REGS_NUM + UART_IIR] & UART_IIR_THR);
+}
+
+static bool cf_check ns16550_iir_check_msi(const struct vuart_ns16550 *vdev)
+{
+    return !!(vdev->regs[UART_MSR] & UART_MSR_CHANGE);
+}
+
+/*
+ * Get the interrupt identity reason.
+ *
+ * IIR is re-calculated once called, because NS16550 always reports high
+ * priority events first.
+ * regs[NS16550_REGS_NUM + UART_IIR] is used to store THR reason only.
+ */
+static uint8_t ns16550_iir_get(const struct vuart_ns16550 *vdev)
+{
+    /*
+     * Interrupt identity reasons by priority.
+     * NB: high priority are at lower indexes below.
+     */
+    static const struct {
+        bool (*check)(const struct vuart_ns16550 *vdev);
+        uint8_t ier;
+        uint8_t iir;
+    } iir_by_prio[] = {
+        [0] = { ns16550_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
+        [1] = { ns16550_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
+        [2] = { ns16550_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
+        [3] = { ns16550_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
+    };
+    const uint8_t *regs = vdev->regs;
+    uint8_t iir = 0;
+    unsigned int i;
+
+    /*
+     * NB: every interaction w/ NS16550 registers (except DLAB=1) goes
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
+/*
+ * Assert/deassert virtual NS16550 interrupt line.
+ */
+static void ns16550_irq_check(const struct vuart_ns16550 *vdev)
+{
+    uint8_t iir = ns16550_iir_get(vdev);
+
+    if ( iir & UART_IIR_NOINT )
+        hvm_isa_irq_assert(vdev->owner, vdev->irq, NULL);
+    else
+        hvm_isa_irq_deassert(vdev->owner, vdev->irq);
+
+    pr_debug("%s: IRQ#%d %x %s\n", vdev->name, vdev->irq, iir,
+             (iir & UART_IIR_NOINT) ? "deassert" : "assert");
+}
+
+/*
+ * Emulate 8-bit write access to NS16550 register.
+ */
+static int ns16550_io_write8(
+    struct vuart_ns16550 *vdev, uint32_t reg, uint8_t *data)
+{
+    uint8_t *regs = vdev->regs;
+    uint8_t val = *data;
+    int rc = 0;
+
+    if ( ns16550_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
+        regs[NS16550_REGS_NUM + reg] = val;
+    else
+    {
+        switch ( reg )
+        {
+        case UART_THR:
+            if ( regs[UART_MCR] & UART_MCR_LOOP )
+            {
+                (void)ns16550_fifo_rx_putchar(vdev, val);
+                regs[UART_LSR] |= UART_LSR_OE;
+            }
+            else
+                ns16550_fifo_tx_putchar(vdev, val);
+
+            regs[NS16550_REGS_NUM + UART_IIR] |= UART_IIR_THR;
+
+            break;
+
+        case UART_IER:
+            /*
+             * NB: Make sure THR interrupt is re-triggered once guest OS
+             * re-enabled ETHREI in EIR.
+             */
+            if ( val & regs[UART_IER] & UART_IER_ETHREI )
+                regs[NS16550_REGS_NUM + UART_IIR] |= UART_IIR_THR;
+
+            regs[UART_IER] = val & UART_IER_MASK;
+
+            break;
+
+        case UART_FCR: /* WO */
+            if ( val & UART_FCR_RESERVED0 )
+                pr_warn("%s: FCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_FCR_RESERVED0);
+
+            if ( val & UART_FCR_RESERVED1 )
+                pr_warn("%s: FCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_FCR_RESERVED1);
+
+            if ( val & UART_FCR_CLRX )
+                ns16550_fifo_rx_reset(vdev);
+
+            if ( val & UART_FCR_CLTX )
+                ns16550_fifo_tx_flush(vdev);
+
+            if ( val & UART_FCR_ENABLE )
+                val &= UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_MASK;
+            else
+                val = 0;
+
+            regs[UART_FCR] = val;
+
+            break;
+
+        case UART_LCR:
+            regs[UART_LCR] = val;
+            break;
+
+        case UART_MCR: {
+            uint8_t msr_curr, msr_next, msr_delta;
+
+            msr_curr = regs[UART_MSR];
+            msr_next = 0;
+            msr_delta = 0;
+
+            if ( val & UART_MCR_RESERVED0 )
+                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_MCR_RESERVED0);
+
+            if ( val & UART_MCR_RESERVED1 )
+                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_MCR_RESERVED1);
+
+            if ( val & UART_MCR_RESERVED2 )
+                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_MCR_RESERVED2);
+
+            /* Set modem status */
+            if ( val & UART_MCR_LOOP )
+            {
+                if ( val & UART_MCR_DTR )
+                    msr_next |= UART_MSR_DSR;
+                if ( val & UART_MCR_RTS )
+                    msr_next |= UART_MSR_CTS;
+                if ( val & UART_MCR_OUT1 )
+                    msr_next |= UART_MSR_RI;
+                if ( val & UART_MCR_OUT2 )
+                    msr_next |= UART_MSR_DCD;
+            }
+            else
+                msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
+
+            /* Calculate changes in modem status */
+            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
+                msr_delta |= UART_MSR_DCTS;
+            if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS) )
+                msr_delta |= UART_MSR_DDSR;
+            if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
+                msr_delta |= UART_MSR_TERI;
+            if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
+                msr_delta |= UART_MSR_DDCD;
+
+            regs[UART_MCR] = val & UART_MCR_MASK;
+            regs[UART_MSR] = msr_next | msr_delta;
+
+            break;
+        }
+
+        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
+        case UART_SCR:
+            regs[UART_SCR] = val;
+            break;
+
+        case UART_LSR: /* RO */
+        case UART_MSR: /* RO */
+        default:
+            rc = -EINVAL;
+            break;
+        }
+
+        ns16550_irq_check(vdev);
+    }
+
+    return rc;
+}
+
+/*
+ * Emulate 16-bit write access to NS16550 register.
+ * NB: some guest OSes use outw() to access UART_DLL.
+ */
+static int ns16550_io_write16(
+    struct vuart_ns16550 *vdev, uint32_t reg, uint16_t *data)
+{
+    uint16_t val = *data;
+    int rc;
+
+    if ( ns16550_dlab_get(vdev) && reg == UART_DLL )
+    {
+        vdev->regs[NS16550_REGS_NUM + UART_DLL] = val & 0xFF;
+        vdev->regs[NS16550_REGS_NUM + UART_DLM] = (val >> 8) & 0xFF;
+        rc = 0;
+    }
+    else
+        rc = -EINVAL;
+
+    return rc;
+}
+
+/*
+ * Emulate write access to NS16550 register.
+ */
+static int ns16550_io_write(
+    struct vuart_ns16550 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc = ns16550_io_write8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc = ns16550_io_write16(vdev, reg, (uint16_t *)data);
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
+ * Emulate 8-bit read access to NS16550 register.
+ */
+static int ns16550_io_read8(
+    struct vuart_ns16550 *vdev, uint32_t reg, uint8_t *data)
+{
+    uint8_t *regs = vdev->regs;
+    uint8_t val = 0xFFU;
+    int rc = 0;
+
+    if ( ns16550_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
+        val = regs[NS16550_REGS_NUM + reg];
+    else {
+        switch ( reg )
+        {
+        case UART_RBR:
+            /* NB: do not forget to clear overrun condition */
+            regs[UART_LSR] &= ~UART_LSR_OE;
+
+            rc = ns16550_fifo_rx_getchar(vdev);
+            if ( rc >= 0 )
+                val = (uint8_t)rc;
+
+            break;
+
+        case UART_IER:
+            val = regs[UART_IER];
+            break;
+
+        case UART_IIR: /* RO */
+            val = ns16550_iir_get(vdev);
+
+            /* NB: clear IIR scratch location */
+            if ( val & UART_IIR_THR )
+                regs[NS16550_REGS_NUM + UART_IIR] &= ~UART_IIR_THR;
+
+            break;
+
+        case UART_LCR:
+            val = regs[UART_LCR];
+            break;
+
+        case UART_MCR:
+            val = regs[UART_MCR];
+            break;
+
+        case UART_LSR:
+            val = regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
+            if ( ns16550_fifo_rx_empty(vdev) )
+                val &= ~UART_LSR_DR;
+            else
+                val |= UART_LSR_DR;
+
+            regs[UART_LSR] = val & ~UART_LSR_MASK;
+
+            break;
+
+        case UART_MSR:
+            val = regs[UART_MSR];
+            regs[UART_MSR] &= ~UART_MSR_CHANGE;
+            break;
+
+        case UART_SCR:
+            val = regs[UART_SCR];
+            break;
+
+        default:
+            rc = -EINVAL;
+            break;
+        }
+
+        ns16550_irq_check(vdev);
+    }
+
+    *data = val;
+
+    return rc;
+}
+
+/*
+ * Emulate 16-bit read access to NS16550 register.
+ */
+static int ns16550_io_read16(
+    struct vuart_ns16550 *vdev, uint32_t reg, uint16_t *data)
+{
+    uint16_t val = 0xFFFFU;
+    int rc = -EINVAL;
+
+    if ( ns16550_dlab_get(vdev) && reg == UART_DLL )
+    {
+        val = vdev->regs[NS16550_REGS_NUM + UART_DLM] << 8 |
+              vdev->regs[NS16550_REGS_NUM + UART_DLL];
+        rc = 0;
+    }
+
+    *data = val;
+
+    return rc;
+}
+
+/*
+ * Emulate read access to NS16550 register.
+ */
+static int ns16550_io_read(
+    struct vuart_ns16550 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc = ns16550_io_read8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc = ns16550_io_read16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        *data = 0xFFFFFFFFU;
+        rc = -EINVAL;
+        break;
+    }
+
+    return rc;
+}
+
+static void cf_check ns16550_dump(struct domain *d)
+{
+    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
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
+    printk("Virtual " pr_prefix " (%s) I/O port 0x%04"PRIx64" IRQ#%d owner %pd\n",
+            vdev->name, vdev->io_addr, vdev->irq, vdev->owner);
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
+            regs[NS16550_REGS_NUM + UART_DLL],
+            regs[NS16550_REGS_NUM + UART_DLM]);
+
+    printk("  %02"PRIx8" IER %02"PRIx8"\n", UART_IER, regs[UART_IER]);
+
+    printk("  %02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
+            UART_FCR, regs[UART_FCR], ns16550_iir_get(vdev));
+
+    printk("  %02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, regs[UART_LCR]);
+    printk("  %02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, regs[UART_MCR]);
+    printk("  %02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, regs[UART_LSR]);
+    printk("  %02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, regs[UART_MSR]);
+    printk("  %02"PRIx8" SCR %02"PRIx8"\n", UART_SCR, regs[UART_SCR]);
+
+    spin_unlock(&vdev->lock);
+}
+
+/*
+ * Emulate I/O access to NS16550 register.
+ * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
+ */
+static int cf_check ns16550_io_handle(
+    int dir, unsigned int addr, unsigned int size, uint32_t *data)
+{
+#define op(dir)     (((dir) == IOREQ_WRITE) ? 'W' : 'R')
+    struct domain *d = rcu_lock_current_domain();
+    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
+    uint32_t reg;
+    unsigned dlab;
+    int rc;
+
+    if ( !vdev )
+    {
+        pr_err("%s: %c io 0x%04x %d: not initialized\n",
+                vdev->name, op(dir), addr, size);
+
+        ASSERT_UNREACHABLE();
+        goto out;
+    }
+
+    if ( d != vdev->owner )
+    {
+        pr_err("%s: %c io 0x%04x %d: does not match current domain %pv\n",
+                vdev->name, op(dir), addr, size, d);
+
+        ASSERT_UNREACHABLE();
+        goto out;
+    }
+
+    reg = addr - vdev->io_addr;
+    if ( !IS_ALIGNED(reg, size) )
+    {
+        pr_err("%s: %c 0x%04x %d: unaligned access\n",
+                vdev->name, op(dir), addr, size);
+        goto out;
+    }
+
+    dlab = ns16550_dlab_get(vdev);
+    if ( reg >= NS16550_REGS_NUM )
+    {
+        pr_err("%s: %c io 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32": not implemented\n",
+                vdev->name, op(dir), addr, size,
+                dlab, reg, *data);
+        goto out;
+    }
+
+    spin_lock(&vdev->lock);
+
+    if ( dir == IOREQ_WRITE )
+    {
+        pr_debug("%s: %c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
+                 vdev->name, op(dir), addr, size,
+                 dlab, reg, *data);
+        rc = ns16550_io_write(vdev, reg, size, data);
+    }
+    else
+    {
+        rc = ns16550_io_read(vdev, reg, size, data);
+        pr_debug("%s: %c 0x%04x %d: DLAB=%d %02"PRIx32" 0x%08"PRIx32"\n",
+                 vdev->name, op(dir), addr, size,
+                 dlab, reg, *data);
+    }
+    if ( rc < 0 )
+        pr_err("%s: %c 0x%04x %d: DLAB=%d %02"PRIx32" x%08"PRIx32": unsupported access\n",
+               vdev->name, op(dir), addr, size,
+               dlab, reg, *data);
+
+    spin_unlock(&vdev->lock);
+#ifdef CONFIG_VUART_NS16550_DEBUG
+    ns16550_dump(d);
+#endif
+
+out:
+    rcu_unlock_domain(d);
+
+    return X86EMUL_OKAY;
+#undef op
+}
+
+static int cf_check ns16550_init(struct domain *d,
+                                struct virtdev_uart_params *params)
+{
+    const struct virtdev_desc *desc = &x86_pc_uarts[X86_PC_UART_IDX];
+    const struct resource *r = desc->res;
+    const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
+    struct vuart_ns16550 *vdev;
+
+    BUG_ON(d->arch.hvm.vuart);
+
+    vdev = xvzalloc(typeof(*vdev));
+    if ( !vdev )
+        return -ENOMEM;
+
+    for_each_resource(r)
+    {
+        if ( r->type & IORESOURCE_IO )
+        {
+            register_portio_handler(d, r->addr, r->size, ns16550_io_handle);
+
+            /* Used to assert I/O port handler */
+            vdev->io_addr = r->addr;
+            vdev->io_size = r->size;
+        }
+        else if ( r->type & IORESOURCE_IRQ )
+            /* "Claim" virtual IRQ; assumes no ISA-device IRQ sharing */
+            vdev->irq = r->addr;
+        else
+            ASSERT_UNREACHABLE();
+    }
+
+    vdev->owner = d;
+    vdev->name = desc->name;
+
+    /* NB: report 115200 baud rate */
+    vdev->regs[NS16550_REGS_NUM + UART_DLL] = divisor & 0xFFU;
+    vdev->regs[NS16550_REGS_NUM + UART_DLM] = (divisor >> 8) & 0xFFU;
+
+    spin_lock_init(&vdev->lock);
+    hvm_isa_irq_deassert(vdev->owner, vdev->irq);
+
+    d->arch.hvm.vuart = vdev;
+
+    return 0;
+}
+
+static void cf_check ns16550_exit(struct domain *d)
+{
+    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
+
+    if ( vdev )
+    {
+        spin_lock(&vdev->lock);
+        ns16550_fifo_tx_flush(vdev);
+        spin_unlock(&vdev->lock);
+    }
+
+    XFREE(d->arch.hvm.vuart);
+}
+
+static int cf_check ns16550_putchar(struct domain *d, char ch)
+{
+    struct vuart_ns16550 *vdev = d->arch.hvm.vuart;
+    uint8_t *regs;
+    uint8_t dlab;
+    int rc;
+
+    ASSERT(d == vdev->owner);
+    if ( !vdev )
+        return -ENODEV;
+
+    spin_lock(&vdev->lock);
+
+    dlab = ns16550_dlab_get(vdev);
+    regs = vdev->regs;
+
+    if ( dlab )
+    {
+        pr_debug("%s: THR/RBR access disabled: DLAB=1\n", vdev->name);
+        rc = -EBUSY;
+    }
+    else if ( regs[UART_MCR] & UART_MCR_LOOP )
+    {
+        pr_debug("%s: THR/RBR access disabled: loopback mode\n", vdev->name);
+        rc = -EBUSY;
+    }
+    else
+    {
+        uint8_t val = 0;
+
+        rc = ns16550_fifo_rx_putchar(vdev, ch);
+        if ( rc == -ENOSPC )
+            val |= UART_LSR_OE;
+
+        /* NB: UART_LSR_DR is also set when UART_LSR is accessed. */
+        regs[UART_LSR] |= UART_LSR_DR | val;
+
+        /*
+         * Echo the user input on Xen console.
+         * NB: use 'console_timestamps=none' to disable Xen timestamps.
+         */
+        printk("%c", ch);
+
+        /* FIXME: check FCR when to fire an interrupt */
+        ns16550_irq_check(vdev);
+    }
+
+    spin_unlock(&vdev->lock);
+#ifdef CONFIG_VUART_NS16550_DEBUG
+    ns16550_dump(d);
+#endif
+
+    return rc;
+}
+
+VIRTDEV_UART_REGISTER(ns16550);
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
index 333501d5f2ac01676646b9b277b551f06d43c3a5..61f3c5ceec3b6753db657ce0027e89472dc52e1e 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -149,6 +149,10 @@ struct hvm_domain {
 #ifdef CONFIG_MEM_SHARING
     struct mem_sharing_domain mem_sharing;
 #endif
+
+#ifdef CONFIG_HAS_VUART
+    void *vuart; /* Virtual UART handle. */
+#endif
 };
 
 #endif /* __ASM_X86_HVM_DOMAIN_H__ */
diff --git a/xen/drivers/virtdev-uart.c b/xen/drivers/virtdev-uart.c
index fe119e3e6e938957613b182cbef0a29bf67230d2..7011f7b5afa26ac93a71249a3b700eb9a385cccf 100644
--- a/xen/drivers/virtdev-uart.c
+++ b/xen/drivers/virtdev-uart.c
@@ -12,6 +12,9 @@ int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params)
     int rc;
 
     ASSERT(__start_virtdev_uart);
+#if defined(__i386__) || defined(__x86_64__)
+    ASSERT(d->arch.emulation_flags & VIRTDEV_UART);
+#endif
 
     rc = __start_virtdev_uart->init(d, params);
     if ( rc )
@@ -28,6 +31,9 @@ int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params)
 void virtdev_uart_exit(struct domain *d)
 {
     ASSERT(__start_virtdev_uart);
+#if defined(__i386__) || defined(__x86_64__)
+    ASSERT(d->arch.emulation_flags & VIRTDEV_UART);
+#endif
 
     __start_virtdev_uart->exit(d);
 
diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
index 4512658133defe8dc62d87192ffd19ad94b63c3b..bdd9df4ded632082c8db929787455bc1aea96e9f 100644
--- a/xen/include/xen/resource.h
+++ b/xen/include/xen/resource.h
@@ -31,4 +31,7 @@ struct resource {
 
 #define resource_size(res)      ( (res)->size )
 
+#define for_each_resource(res) \
+    for ( ; (res) && (res)->type != IORESOURCE_UNKNOWN; (res)++ )
+
 #endif /* XEN__RESOURCE_H */

-- 
2.34.1




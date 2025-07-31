Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCCEB17693
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066278.1431528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYr1-0000HQ-1D; Thu, 31 Jul 2025 19:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066278.1431528; Thu, 31 Jul 2025 19:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYr0-0000Ep-U5; Thu, 31 Jul 2025 19:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1066278;
 Thu, 31 Jul 2025 19:22:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYqz-0008Dk-Af
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:22:13 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8c849e9-6e43-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 21:22:12 +0200 (CEST)
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
X-Inumbo-ID: a8c849e9-6e43-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753989731; x=1754248931;
	bh=INa7AdafSXJBPiiF3uGn95loVPki98w0EmLpX6ZpnoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=brVyTV2lK51d0xOxLioXlHQLhMRcgoEX8OvjGXLKpgsY7oswVaoXkKDdFpHVlZU0K
	 aC6dV1lAqqmTcvBbYN2XMopbuAAG0E3aiVOcZqdyBt6uXlvj36I74J0Otou9IoA6tI
	 CdhlDr3oLZwid6TbQyg+yYC0keUGsXXVwwYvSq9KVRDE2FMCwYCTIU50gKg8D514L8
	 /WalWX/8I9kPTw9KOWSh+NyJ5A+YdXUiqJXPptD7lciYKqgn0zdNbgduXlSTAZGVAS
	 51bvxUk9Aeknj3iOE/CL4TOVyiYth+Rqsqq3zHNa+e6pilQT6nEv2C6cAmPOlidrKY
	 Vn9DjB/K717XA==
Date: Thu, 31 Jul 2025 19:22:06 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 5/8] emul/vuart-ns16550: introduce NS16550-compatible UART emulator (x86)
Message-ID: <20250731192130.3948419-6-dmukhin@ford.com>
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>
References: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 47796ced57213997a31ad285e6fdb41dce55cd6f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs unde=
r
CONFIG_VUART_NS16550 for x86 port of Xen.

x86 port of Xen lacks vUART facility similar to Arm's SBSA emulator to supp=
ort
x86 guest OS bring up in the embedded setups.

In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
early guest firmware and/or OS bringup debugging, because it eliminates
dependency on the external emulator (qemu) being operational by the time
domains are created.

The emulator also allows to forward the physical console input to the x86
domain which is useful when a system has only one physical UART for early
debugging and this UART is owned by Xen. Such functionality is limited to d=
om0
use currently.

By default, CONFIG_VUART_NS16550 enables emulation of NS16550 at I/O port
0x3f8, IRQ#4 in guest OS (legacy COM1).

Legacy COM resources can be selected at built-time and cannot be configured
per-domain via .cfg or DT yet.

Introduce new emulation flag for virtual UART on x86 and plumb it through
domain creation code so NS16550 emulator can be instantiated properly.

Please refer to the NS16550 emulator code for full list of limitations.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- feedback addressed
- adjusted to new vUART framework APIs
- Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1=
-21-c5d36b31d66c@ford.com/
---
 xen/arch/x86/hvm/hvm.c                |    9 +
 xen/arch/x86/include/asm/domain.h     |    4 +-
 xen/arch/x86/include/asm/hvm/domain.h |    4 +
 xen/common/emul/vuart/Kconfig         |   48 ++
 xen/common/emul/vuart/Makefile        |    1 +
 xen/common/emul/vuart/vuart-ns16550.c | 1009 +++++++++++++++++++++++++
 xen/common/emul/vuart/vuart.c         |    4 +
 xen/include/public/arch-x86/xen.h     |    4 +-
 xen/include/xen/resource.h            |    3 +
 9 files changed, 1084 insertions(+), 2 deletions(-)
 create mode 100644 xen/common/emul/vuart/vuart-ns16550.c

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b7edb1d6555d..1156e7ebcc4c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -31,6 +31,7 @@
 #include <xen/nospec.h>
 #include <xen/vm_event.h>
 #include <xen/console.h>
+#include <xen/vuart.h>
 #include <asm/shadow.h>
 #include <asm/hap.h>
 #include <asm/current.h>
@@ -702,6 +703,10 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc !=3D 0 )
         goto fail1;
=20
+    rc =3D vuart_init(d, NULL);
+    if ( rc !=3D 0 )
+        goto out_vioapic_deinit;
+
     stdvga_init(d);
=20
     rtc_init(d);
@@ -725,6 +730,8 @@ int hvm_domain_initialise(struct domain *d,
     return 0;
=20
  fail2:
+    vuart_deinit(d);
+ out_vioapic_deinit:
     vioapic_deinit(d);
  fail1:
     if ( is_hardware_domain(d) )
@@ -787,6 +794,8 @@ void hvm_domain_destroy(struct domain *d)
     if ( hvm_funcs.domain_destroy )
         alternative_vcall(hvm_funcs.domain_destroy, d);
=20
+    vuart_deinit(d);
+
     vioapic_deinit(d);
=20
     XFREE(d->arch.hvm.pl_time);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index eafd5cfc903d..1ecc7c2cae32 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -468,6 +468,7 @@ struct arch_domain
 #define X86_EMU_IOMMU    XEN_X86_EMU_IOMMU
 #define X86_EMU_USE_PIRQ XEN_X86_EMU_USE_PIRQ
 #define X86_EMU_VPCI     XEN_X86_EMU_VPCI
+#define X86_EMU_NS16550  XEN_X86_EMU_NS16550
 #else
 #define X86_EMU_LAPIC    0
 #define X86_EMU_HPET     0
@@ -479,6 +480,7 @@ struct arch_domain
 #define X86_EMU_IOMMU    0
 #define X86_EMU_USE_PIRQ 0
 #define X86_EMU_VPCI     0
+#define X86_EMU_NS16550  0
 #endif
=20
 #define X86_EMU_PIT     XEN_X86_EMU_PIT
@@ -489,7 +491,7 @@ struct arch_domain
                                  X86_EMU_IOAPIC | X86_EMU_PIC |         \
                                  X86_EMU_VGA | X86_EMU_IOMMU |          \
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
-                                 X86_EMU_VPCI)
+                                 X86_EMU_VPCI | X86_EMU_NS16550)
=20
 #define has_vlapic(d)      (!!((d)->emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->emulation_flags & X86_EMU_HPET))
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/a=
sm/hvm/domain.h
index 333501d5f2ac..9945b16d1a6e 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -149,6 +149,10 @@ struct hvm_domain {
 #ifdef CONFIG_MEM_SHARING
     struct mem_sharing_domain mem_sharing;
 #endif
+
+#ifdef CONFIG_VUART_NS16550
+    void *vuart; /* Virtual UART handle. */
+#endif
 };
=20
 #endif /* __ASM_X86_HVM_DOMAIN_H__ */
diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
index 02f7dd6dc1a1..ebefd90d913e 100644
--- a/xen/common/emul/vuart/Kconfig
+++ b/xen/common/emul/vuart/Kconfig
@@ -3,4 +3,52 @@ config HAS_VUART
=20
 menu "UART Emulation"
=20
+config VUART_NS16550
+=09bool "NS16550-compatible UART Emulation" if EXPERT
+=09depends on X86 && HVM
+=09select HAS_VUART
+=09help
+=09  In-hypervisor NS16550/NS16x50 UART emulation.
+
+=09  Only legacy PC I/O ports are emulated.
+
+=09  This is strictly for testing purposes (such as early HVM guest consol=
e),
+=09  and not appropriate for use in production.
+
+choice VUART_NS16550_PC
+=09prompt "IBM PC COM resources"
+=09depends on VUART_NS16550
+=09default VUART_NS16550_PC_COM1
+=09help
+=09  Default emulated NS16550 resources.
+
+config VUART_NS16550_PC_COM1
+=09bool "COM1 (I/O port 0x3f8, IRQ#4)"
+
+config VUART_NS16550_PC_COM2
+=09bool "COM2 (I/O port 0x2f8, IRQ#3)"
+
+config VUART_NS16550_PC_COM3
+=09bool "COM3 (I/O port 0x3e8, IRQ#4)"
+
+config VUART_NS16550_PC_COM4
+=09bool "COM4 (I/O port 0x2e8, IRQ#3)"
+
+endchoice
+
+config VUART_NS16550_LOG_LEVEL
+=09int "UART emulator verbosity level"
+=09range 0 3
+=09default "1"
+=09depends on VUART_NS16550
+=09help
+=09  Set the default log level of UART emulator.
+=09  See include/xen/config.h for more details.
+
+config VUART_NS16550_DEBUG
+=09bool "UART emulator development debugging"
+=09depends on VUART_NS16550
+=09help
+=09  Enable development debugging.
+
 endmenu
diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefil=
e
index c6400b001e85..85650ca5d8ce 100644
--- a/xen/common/emul/vuart/Makefile
+++ b/xen/common/emul/vuart/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_HAS_VUART) +=3D vuart.o
+obj-$(CONFIG_VUART_NS16550) +=3D vuart-ns16550.o
diff --git a/xen/common/emul/vuart/vuart-ns16550.c b/xen/common/emul/vuart/=
vuart-ns16550.c
new file mode 100644
index 000000000000..48bbf58264fe
--- /dev/null
+++ b/xen/common/emul/vuart/vuart-ns16550.c
@@ -0,0 +1,1009 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * NS16550-compatible UART Emulator.
+ *
+ * See:
+ * - Serial and UART Tutorial:
+ *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-uar=
t_en.pdf
+ * - UART w/ 16 byte FIFO:
+ *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
+ * - UART w/ 64 byte FIFO:
+ *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
+ *
+ * Limitations:
+ * - Only x86;
+ * - Only HVM domains support (build-time), PVH domains are not supported =
yet;
+ * - Only legacy COM{1,2,3,4} resources via Kconfig, custom I/O ports/IRQs
+ *   are not supported;
+ * - Only Xen console as a backend, no inter-domain communication (similar=
 to
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
+#include <xen/8250-uart.h>
+#include <xen/console.h>
+#include <xen/iocap.h>
+#include <xen/ioreq.h>
+#include <xen/resource.h>
+#include <xen/vuart.h>
+#include <xen/xvmalloc.h>
+
+#include <public/io/console.h>
+
+#define pr_err(fmt, args...) do { \
+    gprintk(KERN_ERR, pr_fmt(fmt), ## args); \
+} while (0)
+
+#define pr_warn(fmt, args...) do { \
+    if ( pr_log_level >=3D 1) \
+        gprintk(KERN_WARNING, pr_fmt(fmt), ## args); \
+} while (0)
+
+#define pr_info(fmt, args...) do { \
+    if ( pr_log_level >=3D 2 ) \
+        gprintk(KERN_INFO, pr_fmt(fmt), ## args); \
+} while (0)
+
+#define pr_debug(fmt, args...) do { \
+    if ( pr_log_level >=3D 3 ) \
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
+#ifdef CONFIG_VUART_NS16550_DEBUG
+#define guest_prefix            "FROM GUEST "
+#else
+#define guest_prefix            ""
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
+ * - Emulated registers [0..NS16550_REGS_NUM] are R/W registers for DLAB=
=3D0.
+ * - DLAB=3D1, R/W, DLL            =3D NS16550_REGS_NUM + 0
+ * - DLAB=3D1, R/W, DLM            =3D NS16550_REGS_NUM + 1
+ * -         R/O, IIR (IIR_THR)  =3D NS16550_REGS_NUM + 2
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
+    uint64_t io_addr;                   /* Emulated I/O region base addres=
s */
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
+static const struct virtdev_desc x86_pc_uarts[4] =3D {
+    [0] =3D {
+        .name =3D "COM1",
+        .res =3D (const struct resource[]){
+            { .type =3D IORESOURCE_IO,  .addr =3D 0x3f8, .size =3D NS16550=
_REGS_NUM },
+            { .type =3D IORESOURCE_IRQ, .addr =3D 4,     .size =3D 1 },
+            { .type =3D IORESOURCE_UNKNOWN },
+        },
+    },
+    [1] =3D {
+        .name =3D "COM2",
+        .res =3D (const struct resource[]){
+            { .type =3D IORESOURCE_IO,  .addr =3D 0x2f8, .size =3D NS16550=
_REGS_NUM },
+            { .type =3D IORESOURCE_IRQ, .addr =3D 3,     .size =3D 1 },
+            { .type =3D IORESOURCE_UNKNOWN },
+        },
+    },
+    [2] =3D {
+        .name =3D "COM3",
+        .res =3D (const struct resource[]){
+            { .type =3D IORESOURCE_IO,  .addr =3D 0x3e8, .size =3D NS16550=
_REGS_NUM },
+            { .type =3D IORESOURCE_IRQ, .addr =3D 4,     .size =3D 1 },
+            { .type =3D IORESOURCE_UNKNOWN },
+        },
+    },
+    [3] =3D {
+        .name =3D "COM4",
+        .res =3D (const struct resource[]){
+            { .type =3D IORESOURCE_IO,  .addr =3D 0x2e8, .size =3D NS16550=
_REGS_NUM },
+            { .type =3D IORESOURCE_IRQ, .addr =3D 3,     .size =3D 1 },
+            { .type =3D IORESOURCE_UNKNOWN },
+        },
+    },
+};
+
+static bool ns16550_fifo_rx_empty(const struct vuart_ns16550 *vdev)
+{
+    const struct xencons_interface *cons =3D &vdev->cons;
+
+    return cons->in_prod =3D=3D cons->in_cons;
+}
+
+static bool ns16550_fifo_rx_full(const struct vuart_ns16550 *vdev)
+{
+    const struct xencons_interface *cons =3D &vdev->cons;
+
+    return cons->in_prod - cons->in_cons =3D=3D ARRAY_SIZE(cons->in);
+}
+
+static void ns16550_fifo_rx_reset(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons =3D &vdev->cons;
+
+    cons->in_cons =3D cons->in_prod;
+}
+
+static int ns16550_fifo_rx_getchar(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons =3D &vdev->cons;
+    int rc;
+
+    if ( ns16550_fifo_rx_empty(vdev) )
+    {
+        pr_debug("%s: RX FIFO empty\n", vdev->name);
+        rc =3D -ENODATA;
+    }
+    else
+    {
+        rc =3D cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
+        cons->in_cons++;
+    }
+
+    return rc;
+}
+
+static int ns16550_fifo_rx_putchar(struct vuart_ns16550 *vdev, char c)
+{
+    struct xencons_interface *cons =3D &vdev->cons;
+    int rc;
+
+    /*
+     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the conte=
nts
+     * of the THR.
+     */
+    if ( ns16550_fifo_rx_full(vdev) )
+    {
+        pr_debug("%s: RX FIFO full; resetting\n", vdev->name);
+        ns16550_fifo_rx_reset(vdev);
+        rc =3D -ENOSPC;
+    }
+    else
+        rc =3D 0;
+
+    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] =3D c;
+    cons->in_prod++;
+
+    return rc;
+}
+
+static bool ns16550_fifo_tx_empty(const struct vuart_ns16550 *vdev)
+{
+    const struct xencons_interface *cons =3D &vdev->cons;
+
+    return cons->out_prod =3D=3D cons->out_cons;
+}
+
+static void ns16550_fifo_tx_reset(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons =3D &vdev->cons;
+
+    cons->out_prod =3D 0;
+    ASSERT(cons->out_cons =3D=3D cons->out_prod);
+}
+
+/*
+ * Flush cached output to Xen console.
+ */
+static void ns16550_fifo_tx_flush(struct vuart_ns16550 *vdev)
+{
+    struct xencons_interface *cons =3D &vdev->cons;
+
+    if ( ns16550_fifo_tx_empty(vdev) )
+        return;
+
+    ASSERT(cons->out_prod < ARRAY_SIZE(cons->out));
+    cons->out[cons->out_prod] =3D '\0';
+    cons->out_prod++;
+
+    guest_printk(vdev->owner, guest_prefix "%s", cons->out);
+
+    ns16550_fifo_tx_reset(vdev);
+}
+
+/*
+ * Accumulate guest OS output before sending to Xen console.
+ */
+static void ns16550_fifo_tx_putchar(struct vuart_ns16550 *vdev, char ch)
+{
+    struct xencons_interface *cons =3D &vdev->cons;
+
+    if ( !is_console_printable(ch) )
+        return;
+
+    if ( ch !=3D '\0' )
+    {
+        cons->out[cons->out_prod] =3D ch;
+        cons->out_prod++;
+    }
+
+    if ( cons->out_prod =3D=3D ARRAY_SIZE(cons->out) - 1 ||
+         ch =3D=3D '\n' || ch =3D=3D '\0' )
+        ns16550_fifo_tx_flush(vdev);
+}
+
+static inline uint8_t cf_check ns16550_dlab_get(const struct vuart_ns16550=
 *vdev)
+{
+    return vdev->regs[UART_LCR] & UART_LCR_DLAB ? 1 : 0;
+}
+
+static bool cf_check ns16550_iir_check_lsi(const struct vuart_ns16550 *vde=
v)
+{
+    return !!(vdev->regs[UART_LSR] & UART_LSR_MASK);
+}
+
+static bool cf_check ns16550_iir_check_rda(const struct vuart_ns16550 *vde=
v)
+{
+    return !ns16550_fifo_rx_empty(vdev);
+}
+
+static bool cf_check ns16550_iir_check_thr(const struct vuart_ns16550 *vde=
v)
+{
+    return !!(vdev->regs[NS16550_REGS_NUM + UART_IIR] & UART_IIR_THR);
+}
+
+static bool cf_check ns16550_iir_check_msi(const struct vuart_ns16550 *vde=
v)
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
+    } iir_by_prio[] =3D {
+        [0] =3D { ns16550_iir_check_lsi, UART_IER_ELSI,   UART_IIR_LSI },
+        [1] =3D { ns16550_iir_check_rda, UART_IER_ERDAI,  UART_IIR_RDA },
+        [2] =3D { ns16550_iir_check_thr, UART_IER_ETHREI, UART_IIR_THR },
+        [3] =3D { ns16550_iir_check_msi, UART_IER_EMSI,   UART_IIR_MSI },
+    };
+    const uint8_t *regs =3D vdev->regs;
+    uint8_t iir =3D 0;
+    unsigned int i;
+
+    /*
+     * NB: every interaction w/ NS16550 registers (except DLAB=3D1) goes
+     * through that call.
+     */
+    ASSERT(spin_is_locked(&vdev->lock));
+
+    for ( i =3D 0; i < ARRAY_SIZE(iir_by_prio); i++ )
+    {
+        if ( (regs[UART_IER] & iir_by_prio[i].ier) &&
+             iir_by_prio[i].check(vdev) )
+            break;
+
+    }
+    if ( i =3D=3D ARRAY_SIZE(iir_by_prio) )
+        iir |=3D UART_IIR_NOINT;
+    else
+        iir |=3D iir_by_prio[i].iir;
+
+    if ( regs[UART_FCR] & UART_FCR_ENABLE )
+        iir |=3D UART_IIR_FE;
+
+    return iir;
+}
+
+static void ns16550_irq_assert(const struct vuart_ns16550 *vdev)
+{
+    struct domain *d =3D vdev->owner;
+    int vector;
+
+    if ( has_vpic(d) ) /* HVM */
+        vector =3D hvm_isa_irq_assert(d, vdev->irq, vioapic_get_vector);
+    else
+        ASSERT_UNREACHABLE();
+
+    pr_debug("%s: IRQ#%d vector %d assert\n", vdev->name, vdev->irq, vecto=
r);
+}
+
+static void ns16550_irq_deassert(const struct vuart_ns16550 *vdev)
+{
+    struct domain *d =3D vdev->owner;
+
+    if ( has_vpic(d) ) /* HVM */
+        hvm_isa_irq_deassert(d, vdev->irq);
+    else
+        ASSERT_UNREACHABLE();
+
+    pr_debug("%s: IRQ#%d deassert\n", vdev->name, vdev->irq);
+}
+
+/*
+ * Assert/deassert virtual NS16550 interrupt line.
+ */
+static void ns16550_irq_check(const struct vuart_ns16550 *vdev)
+{
+    uint8_t iir =3D ns16550_iir_get(vdev);
+
+    if ( iir & UART_IIR_NOINT )
+        ns16550_irq_assert(vdev);
+    else
+        ns16550_irq_deassert(vdev);
+
+    pr_debug("%s: IRQ#%d IIR 0x%02x %s\n", vdev->name, vdev->irq, iir,
+             (iir & UART_IIR_NOINT) ? "deassert" : "assert");
+}
+
+/*
+ * Emulate 8-bit write access to NS16550 register.
+ */
+static int ns16550_io_write8(
+    struct vuart_ns16550 *vdev, uint32_t reg, uint8_t *data)
+{
+    uint8_t *regs =3D vdev->regs;
+    uint8_t val =3D *data;
+    int rc =3D 0;
+
+    if ( ns16550_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UART=
_DLM) )
+        regs[NS16550_REGS_NUM + reg] =3D val;
+    else
+    {
+        switch ( reg )
+        {
+        case UART_THR:
+            if ( regs[UART_MCR] & UART_MCR_LOOP )
+            {
+                (void)ns16550_fifo_rx_putchar(vdev, val);
+                regs[UART_LSR] |=3D UART_LSR_OE;
+            }
+            else
+                ns16550_fifo_tx_putchar(vdev, val);
+
+            regs[NS16550_REGS_NUM + UART_IIR] |=3D UART_IIR_THR;
+
+            break;
+
+        case UART_IER:
+            /*
+             * NB: Make sure THR interrupt is re-triggered once guest OS
+             * re-enabled ETHREI in EIR.
+             */
+            if ( val & regs[UART_IER] & UART_IER_ETHREI )
+                regs[NS16550_REGS_NUM + UART_IIR] |=3D UART_IIR_THR;
+
+            regs[UART_IER] =3D val & UART_IER_MASK;
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
+                val &=3D UART_FCR_ENABLE | UART_FCR_DMA | UART_FCR_TRG_MAS=
K;
+            else
+                val =3D 0;
+
+            regs[UART_FCR] =3D val;
+
+            break;
+
+        case UART_LCR:
+            regs[UART_LCR] =3D val;
+            break;
+
+        case UART_MCR: {
+            uint8_t msr_curr, msr_next, msr_delta;
+
+            msr_curr =3D regs[UART_MSR];
+            msr_next =3D 0;
+            msr_delta =3D 0;
+
+            if ( val & UART_MCR_RESERVED0 )
+                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_MCR_RESERVED0);
+
+            if ( val & UART_MCR_TCRTLR )
+                pr_warn("%s: MCR: not supported: %x\n",
+                        vdev->name, UART_MCR_TCRTLR);
+
+            if ( val & UART_MCR_RESERVED1 )
+                pr_warn("%s: MCR: attempt to set reserved bit: %x\n",
+                        vdev->name, UART_MCR_RESERVED1);
+
+            /* Set modem status */
+            if ( val & UART_MCR_LOOP )
+            {
+                if ( val & UART_MCR_DTR )
+                    msr_next |=3D UART_MSR_DSR;
+                if ( val & UART_MCR_RTS )
+                    msr_next |=3D UART_MSR_CTS;
+                if ( val & UART_MCR_OUT1 )
+                    msr_next |=3D UART_MSR_RI;
+                if ( val & UART_MCR_OUT2 )
+                    msr_next |=3D UART_MSR_DCD;
+            }
+            else
+                msr_next |=3D UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
+
+            /* Calculate changes in modem status */
+            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
+                msr_delta |=3D UART_MSR_DCTS;
+            if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS) )
+                msr_delta |=3D UART_MSR_DDSR;
+            if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
+                msr_delta |=3D UART_MSR_TERI;
+            if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
+                msr_delta |=3D UART_MSR_DDCD;
+
+            regs[UART_MCR] =3D val & UART_MCR_MASK;
+            regs[UART_MSR] =3D msr_next | msr_delta;
+
+            break;
+        }
+
+        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
+        case UART_SCR:
+            regs[UART_SCR] =3D val;
+            break;
+
+        case UART_LSR: /* RO */
+        case UART_MSR: /* RO */
+        default:
+            rc =3D -EINVAL;
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
+    uint16_t val =3D *data;
+    int rc;
+
+    if ( ns16550_dlab_get(vdev) && reg =3D=3D UART_DLL )
+    {
+        vdev->regs[NS16550_REGS_NUM + UART_DLL] =3D val & 0xff;
+        vdev->regs[NS16550_REGS_NUM + UART_DLM] =3D (val >> 8) & 0xff;
+        rc =3D 0;
+    }
+    else
+        rc =3D -EINVAL;
+
+    return rc;
+}
+
+/*
+ * Emulate write access to NS16550 register.
+ */
+static int ns16550_io_write(
+    struct vuart_ns16550 *vdev, uint8_t reg, uint32_t size, uint32_t *data=
)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc =3D ns16550_io_write8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc =3D ns16550_io_write16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        rc =3D -EINVAL;
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
+    uint8_t *regs =3D vdev->regs;
+    uint8_t val =3D 0xff;
+    int rc =3D 0;
+
+    if ( ns16550_dlab_get(vdev) && (reg =3D=3D UART_DLL || reg =3D=3D UART=
_DLM) )
+        val =3D regs[NS16550_REGS_NUM + reg];
+    else {
+        switch ( reg )
+        {
+        case UART_RBR:
+            /* NB: do not forget to clear overrun condition */
+            regs[UART_LSR] &=3D ~UART_LSR_OE;
+
+            rc =3D ns16550_fifo_rx_getchar(vdev);
+            if ( rc >=3D 0 )
+                val =3D (uint8_t)rc;
+
+            rc =3D 0;
+            break;
+
+        case UART_IER:
+            val =3D regs[UART_IER];
+            break;
+
+        case UART_IIR: /* RO */
+            val =3D ns16550_iir_get(vdev);
+
+            /* NB: clear IIR scratch location */
+            if ( val & UART_IIR_THR )
+                regs[NS16550_REGS_NUM + UART_IIR] &=3D ~UART_IIR_THR;
+
+            break;
+
+        case UART_LCR:
+            val =3D regs[UART_LCR];
+            break;
+
+        case UART_MCR:
+            val =3D regs[UART_MCR];
+            break;
+
+        case UART_LSR:
+            val =3D regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
+            if ( ns16550_fifo_rx_empty(vdev) )
+                val &=3D ~UART_LSR_DR;
+            else
+                val |=3D UART_LSR_DR;
+
+            regs[UART_LSR] =3D val & ~UART_LSR_MASK;
+
+            break;
+
+        case UART_MSR:
+            val =3D regs[UART_MSR];
+            regs[UART_MSR] &=3D ~UART_MSR_CHANGE;
+            break;
+
+        case UART_SCR:
+            val =3D regs[UART_SCR];
+            break;
+
+        default:
+            rc =3D -EINVAL;
+            break;
+        }
+
+        ns16550_irq_check(vdev);
+    }
+
+    *data =3D val;
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
+    uint16_t val =3D 0xffff;
+    int rc =3D -EINVAL;
+
+    if ( ns16550_dlab_get(vdev) && reg =3D=3D UART_DLL )
+    {
+        val =3D vdev->regs[NS16550_REGS_NUM + UART_DLM] << 8 |
+              vdev->regs[NS16550_REGS_NUM + UART_DLL];
+        rc =3D 0;
+    }
+
+    *data =3D val;
+
+    return rc;
+}
+
+/*
+ * Emulate read access to NS16550 register.
+ */
+static int ns16550_io_read(
+    struct vuart_ns16550 *vdev, uint8_t reg, uint32_t size, uint32_t *data=
)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc =3D ns16550_io_read8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc =3D ns16550_io_read16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        *data =3D 0xffffffff;
+        rc =3D -EINVAL;
+        break;
+    }
+
+    return rc;
+}
+
+static void cf_check ns16550_dump_state(const struct domain *d)
+{
+    struct vuart_ns16550 *vdev =3D d->arch.hvm.vuart;
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
+    cons =3D &vdev->cons;
+    regs =3D &vdev->regs[0];
+
+    printk("Virtual " pr_prefix " (%s) I/O port 0x%04"PRIx64" IRQ#%d owner=
 %pd\n",
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
+    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DLM =
%02"PRIx8"\n",
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
+ * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enab=
led.
+ */
+static int cf_check ns16550_io_handle(
+    int dir, unsigned int addr, unsigned int size, uint32_t *data)
+{
+#define op(dir)     (((dir) =3D=3D IOREQ_WRITE) ? 'W' : 'R')
+    struct domain *d =3D rcu_lock_current_domain();
+    struct vuart_ns16550 *vdev =3D d->arch.hvm.vuart;
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
+    if ( d !=3D vdev->owner )
+    {
+        pr_err("%s: %c io 0x%04x %d: does not match current domain %pv\n",
+                vdev->name, op(dir), addr, size, d);
+
+        ASSERT_UNREACHABLE();
+        goto out;
+    }
+
+    reg =3D addr - vdev->io_addr;
+    if ( !IS_ALIGNED(reg, size) )
+    {
+        pr_err("%s: %c 0x%04x %d: unaligned access\n",
+                vdev->name, op(dir), addr, size);
+        goto out;
+    }
+
+    dlab =3D ns16550_dlab_get(vdev);
+    if ( reg >=3D NS16550_REGS_NUM )
+    {
+        pr_err("%s: %c io 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRIx32": =
not implemented\n",
+                vdev->name, op(dir), addr, size,
+                dlab, reg, *data);
+        goto out;
+    }
+
+    spin_lock(&vdev->lock);
+
+    if ( dir =3D=3D IOREQ_WRITE )
+    {
+        pr_debug("%s: %c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRIx32"\n"=
,
+                 vdev->name, op(dir), addr, size,
+                 dlab, reg, *data);
+        rc =3D ns16550_io_write(vdev, reg, size, data);
+    }
+    else
+    {
+        rc =3D ns16550_io_read(vdev, reg, size, data);
+        pr_debug("%s: %c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRIx32"\n"=
,
+                 vdev->name, op(dir), addr, size,
+                 dlab, reg, *data);
+    }
+    if ( rc < 0 )
+        pr_err("%s: %c 0x%04x %d: DLAB=3D%d %02"PRIx32" 0x%08"PRIx32": uns=
upported access\n",
+               vdev->name, op(dir), addr, size,
+               dlab, reg, *data);
+
+    spin_unlock(&vdev->lock);
+#ifdef CONFIG_VUART_NS16550_DEBUG
+    ns16550_dump_state(d);
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
+                                 struct vuart_params *params)
+{
+    const struct virtdev_desc *desc =3D &x86_pc_uarts[X86_PC_UART_IDX];
+    const struct resource *r =3D desc->res;
+    const uint16_t divisor =3D (UART_CLOCK_HZ / 115200) >> 4;
+    struct vuart_ns16550 *vdev;
+    int rc;
+
+    BUG_ON(d->arch.hvm.vuart);
+
+    if ( !is_hvm_domain(d) )
+    {
+        pr_err("%s: not an HVM domain\n", desc->name);
+        return -ENOSYS;
+    }
+
+    vdev =3D xvzalloc(typeof(*vdev));
+    if ( !vdev )
+    {
+        pr_err("%s: failed to allocate memory\n", desc->name);
+        return -ENOMEM;
+    }
+
+    for_each_resource(r)
+    {
+        if ( r->type & IORESOURCE_IO )
+        {
+            /* Disallow sharing physical I/O port */
+            rc =3D ioports_deny_access(d, r->addr, r->addr + r->size - 1);
+            if ( rc )
+            {
+                pr_err("%s: virtual I/O port range [0x%04x"PRIx64"..0x%04x=
"PRIx64"]: conflict w/ physical range\n",
+                        desc->name,
+                        (unsigned int)r->addr,
+                        (unsigned int)(r->addr + r->size - 1));
+                return rc;
+            }
+
+            register_portio_handler(d, r->addr, r->size, ns16550_io_handle=
);
+
+            vdev->io_addr =3D r->addr;
+            vdev->io_size =3D r->size;
+        }
+        else if ( r->type & IORESOURCE_IRQ )
+        {
+            /* Disallow sharing physical IRQ */
+            rc =3D irq_deny_access(d, r->addr);
+            if ( rc )
+            {
+                pr_err("%s: virtual IRQ#%"PRIu64": conflict w/ physical IR=
Q: %d\n",
+                        desc->name, r->addr, rc);
+                return rc;
+            }
+
+            vdev->irq =3D r->addr;
+        }
+        else
+            ASSERT_UNREACHABLE();
+    }
+
+    spin_lock_init(&vdev->lock);
+
+    vdev->owner =3D d;
+    vdev->name =3D desc->name;
+
+    /* NB: report 115200 baud rate */
+    vdev->regs[NS16550_REGS_NUM + UART_DLL] =3D divisor & 0xff;
+    vdev->regs[NS16550_REGS_NUM + UART_DLM] =3D (divisor >> 8) & 0xff;
+
+    /* NS16550 shall assert UART_IIR_THR whenever transmitter is empty. */
+    vdev->regs[NS16550_REGS_NUM + UART_IIR] =3D UART_IIR_THR;
+
+    d->arch.hvm.vuart =3D vdev;
+
+    spin_lock(&vdev->lock);
+    ns16550_irq_check(vdev);
+    spin_unlock(&vdev->lock);
+
+    return 0;
+}
+
+static void cf_check ns16550_deinit(struct domain *d)
+{
+    struct vuart_ns16550 *vdev =3D d->arch.hvm.vuart;
+
+    if ( !vdev )
+        return;
+
+    spin_lock(&vdev->lock);
+
+    ns16550_fifo_tx_flush(vdev);
+
+    spin_unlock(&vdev->lock);
+
+    XVFREE(d->arch.hvm.vuart);
+}
+
+static int cf_check ns16550_put_rx(struct domain *d, char ch)
+{
+    struct vuart_ns16550 *vdev =3D d->arch.hvm.vuart;
+    uint8_t *regs;
+    uint8_t dlab;
+    int rc;
+
+    ASSERT(d =3D=3D vdev->owner);
+    if ( !vdev )
+        return -ENODEV;
+
+    spin_lock(&vdev->lock);
+
+    dlab =3D ns16550_dlab_get(vdev);
+    regs =3D vdev->regs;
+
+    if ( dlab )
+    {
+        pr_debug("%s: THR/RBR access disabled: DLAB=3D1\n", vdev->name);
+        rc =3D -EBUSY;
+    }
+    else if ( regs[UART_MCR] & UART_MCR_LOOP )
+    {
+        pr_debug("%s: THR/RBR access disabled: loopback mode\n", vdev->nam=
e);
+        rc =3D -EBUSY;
+    }
+    else
+    {
+        uint8_t val =3D 0;
+
+        rc =3D ns16550_fifo_rx_putchar(vdev, ch);
+        if ( rc =3D=3D -ENOSPC )
+            val |=3D UART_LSR_OE;
+
+        /* NB: UART_LSR_DR is also set when UART_LSR is accessed. */
+        regs[UART_LSR] |=3D UART_LSR_DR | val;
+
+        /*
+         * Echo the user input on Xen console iff Xen console input is own=
ed
+         * by NS16550 domain.
+         * NB: use 'console_timestamps=3Dnone' to disable Xen timestamps.
+         */
+        if ( is_console_printable(ch) )
+            guest_printk(d, "%c", ch);
+
+        /* FIXME: check FCR when to fire an interrupt */
+        ns16550_irq_check(vdev);
+    }
+
+    spin_unlock(&vdev->lock);
+#ifdef CONFIG_VUART_NS16550_DEBUG
+    ns16550_dump_state(d);
+#endif
+
+    return rc;
+}
+
+static const struct vuart_ops ns16550_ops =3D {
+    .add_node   =3D NULL,
+    .init       =3D ns16550_init,
+    .deinit     =3D ns16550_deinit,
+    .dump_state =3D ns16550_dump_state,
+    .put_rx     =3D ns16550_put_rx,
+};
+
+VUART_REGISTER(ns16550, &ns16550_ops);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
index 14a7f8bd8b79..7971813a723d 100644
--- a/xen/common/emul/vuart/vuart.c
+++ b/xen/common/emul/vuart/vuart.c
@@ -99,6 +99,10 @@ bool domain_has_vuart(const struct domain *d)
 {
     uint32_t mask =3D 0;
=20
+#ifdef CONFIG_VUART_NS16550
+    mask |=3D XEN_X86_EMU_NS16550;
+#endif
+
     return !!(d->emulation_flags & mask);
 }
=20
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x8=
6/xen.h
index fc2487986642..f905e1252c70 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -283,13 +283,15 @@ struct xen_arch_domainconfig {
 #define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
 #define _XEN_X86_EMU_VPCI           10
 #define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
+#define _XEN_X86_EMU_NS16550        11
+#define XEN_X86_EMU_NS16550         (1U<<_XEN_X86_EMU_NS16550)
=20
 #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET =
|  \
                                      XEN_X86_EMU_PM | XEN_X86_EMU_RTC |   =
   \
                                      XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC =
|  \
                                      XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |=
   \
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIR=
Q |\
-                                     XEN_X86_EMU_VPCI)
+                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_NS1655=
0)
     uint32_t emulation_flags;
=20
 /*
diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
index 5d103631288d..56fb8101edd6 100644
--- a/xen/include/xen/resource.h
+++ b/xen/include/xen/resource.h
@@ -31,4 +31,7 @@ struct resource {
=20
 #define resource_size(res)      ((res)->size)
=20
+#define for_each_resource(res) \
+    for ( ; (res) && (res)->type !=3D IORESOURCE_UNKNOWN; (res)++ )
+
 #endif /* XEN__RESOURCE_H */
--=20
2.34.1




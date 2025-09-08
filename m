Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97FB49B94
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115534.1462087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9X-0007mH-BI; Mon, 08 Sep 2025 21:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115534.1462087; Mon, 08 Sep 2025 21:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9X-0007jq-8G; Mon, 08 Sep 2025 21:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1115534;
 Mon, 08 Sep 2025 21:11:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9V-0007WA-Az
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:11:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9U-000FSB-2w;
 Mon, 08 Sep 2025 21:11:52 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9U-000gJy-35;
 Mon, 08 Sep 2025 21:11:52 +0000
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
	bh=qtj1opA8VkUAwTTzkkLeUXZOZ7qNdbdQYOa9K1xcC1Q=; b=tMspcYbtuIWeGzDIyTx++hdG1K
	UbyBmS8gKQrHrsLo/rG2JULC1rKMVOvb1I3c5QCK+GMdRU1KShCIxW9OzhM7Uz/0Qj42ZUS0es81u
	0h5crhOHhQ8nsq12QUSbFtLtRMURXylaz0E7NJiNepKL2ZftI4V0JIE+s4HLxeZgBXdc=;
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
Subject: [PATCH v7 01/16] emul/vuart: introduce framework for UART emulators
Date: Mon,  8 Sep 2025 14:11:34 -0700
Message-ID: <20250908211149.279143-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Introduce a driver framework to abstract UART emulators in the hypervisor.

That allows for architecture-independent handling of virtual UARTs in the
console driver and simplifies enabling new UART emulators.

The framework is built under CONFIG_VUART_FRAMEWORK, which will be
automatically enabled once the user enables any UART emulator.

Current implementation supports maximum of one vUART of each kind per domain.

Use new domain_has_vuart() in the console driver code to check whether to
forward console input to the domain using vUART.

Enable console forwarding over vUART for hardware domains with a vUART. That
enables console forwarding to dom0 on x86, since console can be forwarded only
to Xen, dom0 and pvshim on x86 as of now.

Note: existing vUARTs are deliberately *not* hooked to the new framework to
minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and "vuart" (i.e.
minimalistic MMIO-mapped dtuart for hwdoms on Arm) are kept unmodified.

No functional changes for non-x86 architectures.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- addresses Mykola's feedback
- some renaming (vuart_find_by_flags())
- added extra checks to put_rx and dump_state
- fixed vuart_init() error path
- simplified some checks during vUART state 'search'
---
 xen/arch/arm/xen.lds.S         |   1 +
 xen/arch/ppc/xen.lds.S         |   1 +
 xen/arch/riscv/xen.lds.S       |   1 +
 xen/arch/x86/xen.lds.S         |   1 +
 xen/common/Kconfig             |   2 +
 xen/common/Makefile            |   1 +
 xen/common/emul/Kconfig        |   6 ++
 xen/common/emul/Makefile       |   1 +
 xen/common/emul/vuart/Kconfig  |   6 ++
 xen/common/emul/vuart/Makefile |   1 +
 xen/common/emul/vuart/vuart.c  | 165 +++++++++++++++++++++++++++++++++
 xen/common/keyhandler.c        |   3 +
 xen/drivers/char/console.c     |   6 +-
 xen/include/xen/sched.h        |   4 +
 xen/include/xen/serial.h       |   3 +
 xen/include/xen/vuart.h        | 115 +++++++++++++++++++++++
 xen/include/xen/xen.lds.h      |  10 ++
 17 files changed, 326 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/emul/Kconfig
 create mode 100644 xen/common/emul/Makefile
 create mode 100644 xen/common/emul/vuart/Kconfig
 create mode 100644 xen/common/emul/vuart/Makefile
 create mode 100644 xen/common/emul/vuart/vuart.c
 create mode 100644 xen/include/xen/vuart.h

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index db17ff1efa98..cd05b18770f4 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -58,6 +58,7 @@ SECTIONS
        *(.rodata)
        *(.rodata.*)
        VPCI_ARRAY
+       VUART_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 1de0b77fc6b9..f9d4e5b0dcd8 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -52,6 +52,7 @@ SECTIONS
         *(.rodata)
         *(.rodata.*)
         VPCI_ARRAY
+        VUART_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index edcadff90bfe..59dcaa5fef9a 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -47,6 +47,7 @@ SECTIONS
         *(.rodata)
         *(.rodata.*)
         VPCI_ARRAY
+        VUART_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 966e514f2034..d877b93a6964 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -132,6 +132,7 @@ SECTIONS
        *(.rodata)
        *(.rodata.*)
        VPCI_ARRAY
+       VUART_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 76f9ce705f7a..78a32b69e2b2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -676,4 +676,6 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+source "common/emul/Kconfig"
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 0c7d0f5d46e1..8c8462565050 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domid.o
+obj-y += emul/
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
diff --git a/xen/common/emul/Kconfig b/xen/common/emul/Kconfig
new file mode 100644
index 000000000000..7c6764d1756b
--- /dev/null
+++ b/xen/common/emul/Kconfig
@@ -0,0 +1,6 @@
+menu "Domain Emulation Features"
+	visible if EXPERT
+
+source "common/emul/vuart/Kconfig"
+
+endmenu
diff --git a/xen/common/emul/Makefile b/xen/common/emul/Makefile
new file mode 100644
index 000000000000..ae0b575c3901
--- /dev/null
+++ b/xen/common/emul/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VUART_FRAMEWORK) += vuart/
diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
new file mode 100644
index 000000000000..ce1b976b7da7
--- /dev/null
+++ b/xen/common/emul/vuart/Kconfig
@@ -0,0 +1,6 @@
+config VUART_FRAMEWORK
+	bool
+
+menu "UART Emulation"
+
+endmenu
diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
new file mode 100644
index 000000000000..97f792dc6641
--- /dev/null
+++ b/xen/common/emul/vuart/Makefile
@@ -0,0 +1 @@
+obj-y += vuart.o
diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
new file mode 100644
index 000000000000..ba89d608aeb2
--- /dev/null
+++ b/xen/common/emul/vuart/vuart.c
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * UART emulator framework.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#include <xen/err.h>
+#include <xen/sched.h>
+#include <xen/vuart.h>
+#include <xen/xvmalloc.h>
+
+#define for_each_emulator(e) \
+    for ( e = vuart_array_start; e < vuart_array_end; e++ )
+
+extern const struct vuart_emulator vuart_array_start[];
+extern const struct vuart_emulator vuart_array_end[];
+
+static const struct vuart_emulator *
+vuart_match_by_compatible(const struct domain *d, const char *compat)
+{
+    const struct vuart_emulator *emulator;
+
+    for_each_emulator(emulator)
+        if ( emulator->compatible &&
+             !strncmp(compat, emulator->compatible,
+                      strlen(emulator->compatible)) )
+            return emulator;
+
+    return NULL;
+}
+
+const static struct vuart *
+vuart_find_by_flags(const struct domain *d, unsigned int flags)
+{
+    const struct vuart *vuart = d->console.vuart;
+
+    if ( vuart && (vuart->flags & flags) )
+        return vuart;
+
+    return NULL;
+}
+
+struct vuart *vuart_find_by_io_range(struct domain *d, unsigned long addr,
+                                     unsigned long size)
+{
+    struct vuart *vuart = d->console.vuart;
+
+    if ( vuart &&
+         addr >= vuart->info->base_addr &&
+         addr + size - 1 <= vuart->info->base_addr + vuart->info->size - 1 )
+        return vuart;
+
+    return NULL;
+}
+
+int vuart_init(struct domain *d, const struct vuart_info *info)
+{
+    const struct vuart_emulator *emulator;
+    struct vuart *vuart;
+    int rc;
+
+    if ( d->console.vuart )
+        return -EBUSY;
+
+    emulator = vuart_match_by_compatible(d, info->compatible);
+    if ( !emulator )
+        return -ENODEV;
+
+    vuart = xzalloc(typeof(*vuart));
+    if ( !vuart )
+        return -ENOMEM;
+
+    vuart->info = xvzalloc(typeof(*vuart->info));
+    if ( !vuart->info )
+    {
+        rc = -ENOMEM;
+        goto err_out1;
+    }
+    memcpy(vuart->info, info, sizeof(*info));
+
+    vuart->vdev = emulator->alloc(d, vuart->info);
+    if ( IS_ERR(vuart->vdev) )
+    {
+        rc = PTR_ERR(vuart->vdev);
+        goto err_out2;
+    }
+
+    vuart->emulator = emulator;
+    vuart->owner = d;
+    vuart->flags |= VUART_CONSOLE_INPUT;
+
+    d->console.input_allowed = true;
+    d->console.vuart = vuart;
+
+    return 0;
+
+ err_out2:
+    xvfree(vuart->info);
+ err_out1:
+    xvfree(vuart);
+
+    return rc;
+}
+
+/*
+ * Release any resources taken by UART emulators.
+ *
+ * NB: no flags are cleared, since currently exit() is called only during
+ * domain destroy.
+ */
+void vuart_deinit(struct domain *d)
+{
+    struct vuart *vuart = d->console.vuart;
+
+    if ( vuart )
+    {
+        vuart->emulator->free(vuart->vdev);
+        xvfree(vuart->info);
+    }
+    XVFREE(d->console.vuart);
+}
+
+/*
+ * Print emulated UART state on the console.
+ *
+ * Must be called under rcu_lock_domain().
+ */
+void vuart_dump_state(const struct domain *d)
+{
+    struct vuart *vuart = d->console.vuart;
+
+    if ( vuart && vuart->emulator->dump_state )
+        vuart->emulator->dump_state(vuart->vdev);
+}
+
+/*
+ * Put character to the first emulated UART's FIFO with the physical console
+ * forwarding enabled.
+ *
+ * Must be called under rcu_lock_domain().
+ */
+int vuart_put_rx(struct domain *d, char c)
+{
+    const struct vuart *vuart = vuart_find_by_flags(d, VUART_CONSOLE_INPUT);
+
+    if ( vuart && vuart->emulator->put_rx )
+        return vuart->emulator->put_rx(vuart->vdev, c);
+
+    return  -ENODEV;
+}
+
+bool domain_has_vuart(const struct domain *d)
+{
+    return vuart_find_by_flags(d, VUART_CONSOLE_INPUT);
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
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index cb6df2823b00..156e64d9eb58 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -22,6 +22,7 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
+#include <xen/vuart.h>
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
@@ -352,6 +353,8 @@ static void cf_check dump_domains(unsigned char key)
                            v->periodic_period / 1000000);
             }
         }
+
+        vuart_dump_state(d);
     }
 
     for_each_domain ( d )
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9bd5b4825da6..d5164897a776 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/vuart.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -596,11 +597,12 @@ static void __serial_rx(char c)
     if ( !d )
         return;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && !domain_has_vuart(d) )
     {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
+         * NB: must be the first check: hardware domain may have emulated UART.
          */
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
@@ -611,6 +613,8 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
+    else if ( domain_has_vuart(d) )
+        rc = vuart_put_rx(d, c);
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     else
         /* Deliver input to the emulated UART. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce37..613f4596e33d 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -23,6 +23,7 @@
 #include <asm/atomic.h>
 #include <asm/current.h>
 #include <xen/vpci.h>
+#include <xen/vuart.h>
 #include <xen/wait.h>
 #include <public/xen.h>
 #include <public/domctl.h>
@@ -660,6 +661,9 @@ struct domain
     struct {
         /* Permission to take ownership of the physical console input. */
         bool input_allowed;
+#ifdef CONFIG_VUART_FRAMEWORK
+        struct vuart *vuart;
+#endif
     } console;
 } __aligned(PAGE_SIZE);
 
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 8e1844555208..123eee67df35 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -36,6 +36,9 @@ struct vuart_info {
     unsigned long data_off;     /* Data register offset */
     unsigned long status_off;   /* Status register offset */
     unsigned long status;       /* Ready status value */
+    unsigned int irq;           /* Interrupt */
+    char compatible[16];        /* Compatible string */
+    char name[16];              /* User-friendly name */
 };
 
 struct serial_port {
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
new file mode 100644
index 000000000000..55828f8498ce
--- /dev/null
+++ b/xen/include/xen/vuart.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * UART emulator framework.
+ *
+ * Copyright 2025 Ford Motor Company
+ */
+
+#ifndef XEN_VUART_H
+#define XEN_VUART_H
+
+#include <xen/serial.h>
+#include <public/xen.h>
+
+struct vuart_emulator;
+
+enum {
+    VUART_CONSOLE_INPUT = BIT(0, U), /* Physical console input forwarding. */
+};
+
+/*
+ * FIXME: #ifdef is temporary to avoid clash with
+ *   arch/arm/include/asm/domain.h
+ */
+#ifdef CONFIG_VUART_FRAMEWORK
+struct vuart {
+    const struct vuart_emulator *emulator;
+    struct vuart_info *info;
+    struct domain *owner;
+    unsigned int flags;
+    void *vdev;
+};
+#endif
+
+struct vuart_emulator {
+    /* UART compatible string. Cannot be NULL or empty. */
+    const char *compatible;
+
+    /*
+     * Allocate emulated UART state (RX/TX FIFOs, locks, initialize registers,
+     * hook I/O handlers, etc.)
+     * Cannot be NULL.
+     */
+    void *(*alloc)(struct domain *d, const struct vuart_info *info);
+
+    /*
+     * Release resources used to emulate UART state (flush RX/TX FIFOs, unhook
+     * I/O handlers, etc.).
+     * Cannot be NULL.
+     */
+    void (*free)(void *arg);
+
+    /*
+     * Print emulated UART state, including registers, on the console.
+     * Can be NULL.
+     */
+    void (*dump_state)(void *arg);
+
+    /*
+     * Place character to the emulated RX FIFO.
+     * Used to forward physical console input to the guest OS.
+     * Can be NULL.
+     */
+    int (*put_rx)(void *arg, char c);
+};
+
+#define VUART_REGISTER(name, x) \
+    static const struct vuart_emulator name##_entry \
+        __used_section(".data.rel.ro.vuart") = x
+
+struct vuart *vuart_find_by_io_range(struct domain *d,
+                                     unsigned long base_addr,
+                                     unsigned long size);
+
+int vuart_put_rx(struct domain *d, char c);
+
+#ifdef CONFIG_VUART_FRAMEWORK
+
+int vuart_init(struct domain *d, const struct vuart_info *info);
+void vuart_deinit(struct domain *d);
+void vuart_dump_state(const struct domain *d);
+bool domain_has_vuart(const struct domain *d);
+
+#else
+
+static inline int vuart_init(struct domain *d, const struct vuart_info *info)
+{
+    return 0;
+}
+
+static inline void vuart_deinit(struct domain *d)
+{
+}
+
+static inline void vuart_dump_state(const struct domain *d)
+{
+}
+
+static inline bool domain_has_vuart(const struct domain *d)
+{
+    return false;
+}
+
+#endif /* CONFIG_VUART_FRAMEWORK */
+
+#endif /* XEN_VUART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index b126dfe88792..2d65f32ddad3 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -194,4 +194,14 @@
 #define VPCI_ARRAY
 #endif
 
+#ifdef CONFIG_VUART_FRAMEWORK
+#define VUART_ARRAY              \
+       . = ALIGN(POINTER_ALIGN); \
+       vuart_array_start = .;    \
+       *(.data.rel.ro.vuart)     \
+       vuart_array_end = .;
+#else
+#define VUART_ARRAY
+#endif
+
 #endif /* __XEN_LDS_H__ */
-- 
2.51.0



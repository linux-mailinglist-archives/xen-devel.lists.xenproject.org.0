Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822A37B2EA
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 02:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126079.237334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgcV4-0008VC-Ec; Wed, 12 May 2021 00:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126079.237334; Wed, 12 May 2021 00:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgcV4-0008Re-Aa; Wed, 12 May 2021 00:13:18 +0000
Received: by outflank-mailman (input) for mailman id 126079;
 Wed, 12 May 2021 00:13:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+k7y=KH=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lgcV2-0008RY-L2
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 00:13:16 +0000
Received: from mail-io1-xd32.google.com (unknown [2607:f8b0:4864:20::d32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 310636a8-58dd-48c1-a821-9896e8cf632e;
 Wed, 12 May 2021 00:13:09 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n40so4186070ioz.4
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 17:13:09 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id v12sm7445080iom.6.2021.05.11.17.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 17:13:07 -0700 (PDT)
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
X-Inumbo-ID: 310636a8-58dd-48c1-a821-9896e8cf632e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8XhKreRLzZDKQ0B9rX4Ogf9dU/EKX6rpLfg0ZJ5unGU=;
        b=qI/Lz5w8o5O1exMgq6hXJltZkKpsWpEt5wNzAwy/ML9zuCNKMqPH5ibwyf+/j60COm
         /WFtThKLoJCC0GHC+9PM0Gh9nvB1P8hzKFky01/PxnNhxF0H0MRzypDm7E5BlyVx9R11
         EJqIWsP8NIyMLCt1+D0sLrJvmFahMgiPUT/nhVKbgLuqKnbVa2xdp5bAFaAMc900mDWt
         AZNAekoTvI2Q+e8mMFP2IKjTn5ZA13ZC6jw/Kwp5nD0WvEXo7sfiazl11q0s5kcr35QA
         EQDFIlCEAbLRcJ3YLw4I4tV4oLA8pVAbSqIy92bPR7TWKb23q9ZC+QgzHPgrLV1tM5GD
         vR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8XhKreRLzZDKQ0B9rX4Ogf9dU/EKX6rpLfg0ZJ5unGU=;
        b=kFU25m0z2hCu3Z5b6lkHT4khtljBR5LoGEo8HtmMw5gIEQ32EmnNb3CI+QVIwVOl0N
         6vMIUp3fvwTks9d4b0Y71MIbvdInr5RxVfSB0vW21qj6VBpqEXcbg0iGL+bwDvMC0qSS
         zfTyammE5gdzMw6fevq7AnNjv9V6dYQAtFKotxRFidESw0WZFQ/HLJ9skENZqqICYRZQ
         svCtN/qDIyl8dYuNs5WsfWfNeocPLanq0s9b2W/wnb9qBkr58KPOJrden8HiobHf/NDL
         EQ5c9HwuerloqOFMO9u2WMGQPsYV2mT663lhEELcGALgRevZ8L8EklRw1WJgNkhqCLZM
         9K9g==
X-Gm-Message-State: AOAM532TxgqRn0eze4pDylQhYiFBvCiRbW6kPzuTwtGfq5XmIGUDPsHw
	10k1MtRpm6JupCQXFOdeQ5aX6e3JKUwdgg==
X-Google-Smtp-Source: ABdhPJyguaqxyO3JVmJhZbEceLYXcJfbWcpaXzOgPQNhWMVRfuZGlW7lXa3gMzu/bv7fm0Bsz/iQ+g==
X-Received: by 2002:a05:6602:3427:: with SMTP id n39mr16361151ioz.157.1620778388208;
        Tue, 11 May 2021 17:13:08 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] drivers/char: Add USB3 debug capability driver
Date: Tue, 11 May 2021 18:12:40 -0600
Message-Id: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the xHCI debug capability (DbC). The DbC provides
a SuperSpeed serial link between a debug target running Xen and a
debug host. To use it you will need a USB3 A/A debug cable plugged into
a root port on the target machine. Recent kernels report the existence
of the DbC capability at

  /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00

The host machine should have the usb_debug.ko module on the system
(the cable can be plugged into any port on the host side). After the
host usb_debug enumerates the DbC, it will create a /dev/ttyUSB<n> file
that can be used with things like minicom.

To use the DbC as a console, pass `console=dbgp dbgp=xhci`
on the xen command line. This will select the first host controller
found that implements the DbC. Other variations to 'dbgp=' are accepted,
please see xen-command-line.pandoc for more. Remote GDB is also supported
with `gdb=dbgp dbgp=xhci`. Note that to see output and/or provide input
after dom0 starts, DMA remapping of the host controller must be
disabled.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 MAINTAINERS                       |    6 +
 docs/misc/xen-command-line.pandoc |   19 +-
 xen/arch/x86/Kconfig              |    1 -
 xen/arch/x86/setup.c              |    1 +
 xen/drivers/char/Kconfig          |   15 +
 xen/drivers/char/Makefile         |    1 +
 xen/drivers/char/xhci-dbc.c       | 1122 +++++++++++++++++++++++++++++
 xen/drivers/char/xhci-dbc.h       |  621 ++++++++++++++++
 xen/include/asm-x86/fixmap.h      |    4 +
 xen/include/xen/serial.h          |   15 +
 10 files changed, 1803 insertions(+), 2 deletions(-)
 create mode 100644 xen/drivers/char/xhci-dbc.c
 create mode 100644 xen/drivers/char/xhci-dbc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d46b08a0d2..3f38c022a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -620,6 +620,12 @@ F:	tools/xentrace/
 F:	xen/common/trace.c
 F:	xen/include/xen/trace.h
 
+XHCI DBC DRIVER
+M:      Connor Davis <connojdavis@gmail.com>
+S:      Maintained
+F:      xen/drivers/char/xhci-dbc.c
+F:      xen/drivers/char/xhci-dbc.h
+
 XSM/FLASK
 M:	Daniel De Graaf <dgdegra@tycho.nsa.gov>
 S:	Supported
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index c32a397a12..1b63432806 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -714,9 +714,26 @@ Available alternatives, with their meaning, are:
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
 
-Specify the USB controller to use, either by instance number (when going
+Specify the EHCI USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
+If you have a system with an xHCI USB controller that supports the Debug
+Capability (DbC), you can use
+
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
+
+To use this, you need a USB3 A/A debugging cable plugged into a SuperSpeed
+root port on the target machine. Recent kernels expose the existence of the
+DbC at /sys/kernel/debug/usb/xhci/<seg>:<bus>:<slot>.<func>/reg-ext-dbc:00.
+Note that to see output and process input after dom0 is started, you need to
+ensure that the host controller's DMA is not remapped (e.g. with
+dom0-iommu=passthrough).
+
+Finally, be sure that usb_debug.ko is present on the debug host, as the DbC
+emulates a USB debug device that is bound to usb_debug, which in turn
+creates a /dev/ttyUSB<n> file that can be used with things like minicom
+and gdb.
+
 ### debug_stack_lines
 > `= <integer>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index e55e029b79..469227f66b 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -11,7 +11,6 @@ config X86
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
-	select HAS_EHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
 	select HAS_IOPORTS
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8105dc36bb..4612f3e8b8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -924,6 +924,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     ns16550.irq     = 3;
     ns16550_init(1, &ns16550);
     ehci_dbgp_init();
+    xhci_dbc_init();
     console_init_preirq();
 
     if ( pvh_boot )
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..a48ca69a87 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -63,6 +63,21 @@ config HAS_SCIF
 config HAS_EHCI
 	bool
 	depends on X86
+        default y if !HAS_XHCI_DBC
 	help
 	  This selects the USB based EHCI debug port to be used as a UART. If
 	  you have an x86 based system with USB, say Y.
+
+config HAS_XHCI_DBC
+	bool "xHCI Debug Capability driver"
+	depends on X86 && HAS_PCI
+	help
+	  This selects the xHCI Debug Capabilty to be used as a UART.
+
+config XHCI_FIXMAP_PAGES
+        int "Number of fixmap entries to allocate for the xHC"
+	depends on HAS_XHCI_DBC
+        default 16
+        help
+          This should equal the size (in 4K pages) of the first 64-bit
+          BAR of the host controller in which the DbC is being used.
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index 7c646d771c..c2cb8c09b7 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
 obj-$(CONFIG_HAS_OMAP) += omap-uart.o
 obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
+obj-$(CONFIG_HAS_XHCI_DBC) += xhci-dbc.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
new file mode 100644
index 0000000000..5e22f4a601
--- /dev/null
+++ b/xen/drivers/char/xhci-dbc.c
@@ -0,0 +1,1122 @@
+/*
+ * xen/drivers/char/xhci-dbc.c
+ *
+ * Driver for USB xHCI Debug Capability
+ * ported from https://github.com/connojd/xue.git
+ *
+ * Copyright (C) 2019 Assured Information Security, Inc.
+ * Copyright (C) 2021 Connor Davis <connojdavis@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without restriction,
+ * including without limitation the rights to use, copy, modify, merge,
+ * publish, distribute, sublicense, and/or sell copies of the Software,
+ * and to permit persons to whom the Software is furnished to do so,
+ * subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "xhci-dbc.h"
+
+#include <xen/param.h>
+#include <xen/pci.h>
+#include <xen/serial.h>
+#include <xen/timer.h>
+
+#include <asm/fixmap.h>
+
+/*
+ * To use the DbC as a serial console, pass in the following string
+ * param (in addition to console=dbgp):
+ *
+ *   dbgp=xhci | xhci[0-9] | xhci@pci<bus>:<dev>.<func>
+ *
+ * The first variant uses the first compatible xhci controller found.
+ * The second looks for the n'th xhci with a DbC. Both use breadth-first
+ * search of the PCI bus. The last uses the pci string to specify the
+ * BDF of the USB3 host controller you want to use.
+ * PCI segments > 0 are not supported.
+ */
+static char __initdata opt_dbgp[30];
+string_param("dbgp", opt_dbgp);
+
+static struct xhci_dbc xhci_dbc;
+
+/* Buffers for raw data referenced by struct data_ring */
+static char data_out[DATA_RING_SIZE] __aligned(PAGE_SIZE);
+static char data_in[DATA_RING_SIZE] __aligned(PAGE_SIZE);
+
+/* Ring segments must not straddle a 64K boundary */
+static struct trb trb_evt[TRB_RING_SIZE] __aligned(TRB_RING_ALIGN);
+static struct trb trb_out[TRB_RING_SIZE] __aligned(TRB_RING_ALIGN);
+static struct trb trb_in[TRB_RING_SIZE] __aligned(TRB_RING_ALIGN);
+
+/* Port variable for timer handling */
+static DEFINE_PER_CPU(struct serial_port *, poll_port);
+
+static void init_strings(struct xhci_dbc *dbc)
+{
+    struct dbc_info_ctx *info = &dbc->ctx.info;
+    struct dbc_str_desc *dbc_str = &dbc->strings;
+    struct usb_str_desc *usb_str = (struct usb_str_desc *)&dbc_str->string0;
+
+    const char manufacturer[] = "Xen Project";
+    const char product[] = "Xen DbC Device";
+    const char serial[] = "0001";
+
+    uint32_t length = 0;
+
+    /*
+     * Each string is converted to UTF16, plus one byte for bLength and
+     * one byte for bDescriptorType.
+     */
+    BUILD_BUG_ON(sizeof(manufacturer) * 2 + 2 >= DBC_MAX_STR_SIZE);
+    BUILD_BUG_ON(sizeof(product) * 2 + 2 >= DBC_MAX_STR_SIZE);
+    BUILD_BUG_ON(sizeof(serial) * 2 + 2 >= DBC_MAX_STR_SIZE);
+
+    /* string0 specifies the LANGIDs supported... */
+    usb_str->bLength = 4;
+    usb_str->bDescriptorType = USB_DT_STRING;
+    usb_str->wData[0] = cpu_to_le16(USB_LANGID_ENGLISH);
+    length |= usb_str->bLength;
+
+    /* ...the others are UTF16LE-encoded strings */
+    usb_str = (struct usb_str_desc *)&dbc_str->manufacturer;
+    usb_str->bLength = 2 + (2 * strlen(manufacturer));
+    usb_str->bDescriptorType = USB_DT_STRING;
+    length |= ((uint32_t)usb_str->bLength << 8);
+    copy_utf16le(usb_str->wData, manufacturer);
+
+    usb_str = (struct usb_str_desc *)&dbc_str->product;
+    usb_str->bLength = 2 + (2 * strlen(product));
+    usb_str->bDescriptorType = USB_DT_STRING;
+    length |= ((uint32_t)usb_str->bLength << 16);
+    copy_utf16le(usb_str->wData, product);
+
+    usb_str = (struct usb_str_desc *)&dbc_str->serial;
+    usb_str->bLength = 2 + (2 * strlen(serial));
+    usb_str->bDescriptorType = USB_DT_STRING;
+    length |= ((uint32_t)usb_str->bLength << 24);
+    copy_utf16le(usb_str->wData, serial);
+
+    memset(info, 0, sizeof(*info));
+
+    info->string0 = cpu_to_le64(virt_to_maddr(dbc_str->string0));
+    info->manufacturer = cpu_to_le64(virt_to_maddr(dbc_str->manufacturer));
+    info->product = cpu_to_le64(virt_to_maddr(dbc_str->product));
+    info->serial = cpu_to_le64(virt_to_maddr(dbc_str->serial));
+    info->length = cpu_to_le32(length);
+}
+
+/*
+ * Initialize the endpoint as specified in sections 7.6.3.2
+ * and 7.6.9.2. Each DbC endpoint has Bulk type, so MaxPStreams,
+ * LSA, HID, CErr, FE, Interval, Mult, and Max ESIT Payload
+ * fields are all 0.
+ */
+static inline void init_endpoint(struct xhci_dbc *dbc,
+                                 uint32_t type,
+                                 uint64_t trdp)
+{
+    struct dbc_ep_ctx *ep;
+    const uint32_t max_pkt = EP_MAX_PKT_SIZE << 16;
+    const uint32_t max_burst = dbc_max_burst(dbc) << 8;
+
+    ep = (type == EP_TYPE_BULK_OUT) ? &dbc->ctx.ep_out
+                                    : &dbc->ctx.ep_in;
+    memset(ep, 0, sizeof(*ep));
+
+    ep->data1 = cpu_to_le32(max_pkt | max_burst | (type << 3));
+    ep->trdp = cpu_to_le64(trdp | EP_INITIAL_DCS);
+    ep->data2 = cpu_to_le32(EP_AVG_TRB_LENGTH);
+}
+
+static inline void init_xfer_ring(struct trb_ring *ring,
+                                  struct trb *trb,
+                                  int size)
+{
+    struct trb *last_trb;
+
+    memset(trb, 0, size * sizeof(*trb));
+
+    ring->trb = trb;
+    ring->enq = 0;
+    ring->deq = 0;
+    ring->cycle = 1;
+
+    /*
+     * Transfer rings must have a link TRB that points to the next segment.
+     * Currently only one-segment rings are supported, so setup a link TRB
+     * pointing back to the beginning.
+     */
+
+    last_trb = &trb[size - 1];
+
+    trb_set_type(last_trb, TRB_TYPE_LINK);
+    trb_link_set_toggle_cycle(last_trb);
+    trb_link_set_rsp(last_trb, virt_to_maddr(trb));
+}
+
+static inline void init_event_ring(struct trb_ring *ring,
+                                   struct trb *trb,
+                                   int size)
+{
+    memset(trb, 0, size * sizeof(*trb));
+
+    ring->trb = trb;
+    ring->enq = 0;
+    ring->deq = 0;
+    ring->cycle = 1;
+}
+
+static inline void init_data_ring(struct data_ring *ring,
+                                  char *data,
+                                  int size)
+{
+    memset(data, 0, size);
+
+    ring->buf = data;
+    ring->enq = 0;
+    ring->deq = 0;
+    ring->dma_addr = virt_to_maddr(data);
+}
+
+static inline void init_erst(struct xhci_dbc *dbc, uint64_t erdp, int size)
+{
+    /* Only one-segment rings are supported */
+    BUILD_BUG_ON(DBC_ERSTSZ != 1);
+
+    memset(dbc->erst, 0, sizeof(dbc->erst));
+
+    dbc->erst[0].base = cpu_to_le64(erdp);
+    dbc->erst[0].size = cpu_to_le16(size);
+}
+
+/*
+ * Map in the registers. Section 5.2.1 of the xHCI spec
+ * mandates that the first two BARs must be implemented as a
+ * 64-bit MMIO region that includes all of the xHC's registers.
+ */
+static int xhci_map_regs(struct xhci_dbc *dbc)
+{
+    uint64_t phys, size, pages;
+    int fix = FIX_XHCI_END;
+
+    BUILD_BUG_ON(CONFIG_XHCI_FIXMAP_PAGES <= 0);
+
+    if ( pci_size_mem_bar(dbc->sbdf, PCI_BASE_ADDRESS_0, &phys, &size, 0)
+         != 2 )
+        return -EINVAL;
+
+    if ( size < PAGE_SIZE )
+        return -EINVAL;
+
+    if ( (phys & ~PAGE_MASK) || (size & ~PAGE_MASK) )
+        return -EINVAL;
+
+    pages = size / PAGE_SIZE;
+
+    if ( pages > CONFIG_XHCI_FIXMAP_PAGES )
+        return -EINVAL;
+
+    for ( uint64_t p = 0; p < pages; p++ )
+    {
+        set_fixmap_nocache(fix--, phys);
+        phys += PAGE_SIZE;
+    }
+
+    dbc->mmio_paddr = phys;
+    dbc->mmio_pages = pages;
+    dbc->xhc_regs = (uint8_t __iomem *)fix_to_virt(FIX_XHCI_END);
+
+    return 0;
+}
+
+static void xhci_unmap_regs(struct xhci_dbc *dbc)
+{
+    int fix = FIX_XHCI_END;
+
+    for ( uint64_t p = 0; p < dbc->mmio_pages; p++ )
+        clear_fixmap(fix--);
+
+    dbc->xhc_regs = NULL;
+}
+
+static inline void xhci_enable_mmio_and_dma(const struct xhci_dbc *dbc)
+{
+    uint8_t cmd = pci_conf_read8(dbc->sbdf, PCI_COMMAND);
+
+    cmd |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
+    pci_conf_write8(dbc->sbdf, PCI_COMMAND, cmd);
+}
+
+/*
+ * Search for an xHCI extended capability. If start is 0, then begin the search
+ * at the beginning of the list. Otherwise, start is the offset from the
+ * beginning of the xHC's registers. Note this function will return the _next_
+ * capability with id == @capid, so if start points to a cap with @capid X on
+ * entry, this will return the offset of the next cap with @capid X (or 0
+ * if there is none).
+ */
+static uint32_t xhci_find_next_cap(const struct xhci_dbc *dbc,
+                                   uint32_t start,
+                                   uint32_t capid)
+{
+    const uint8_t __iomem *cap;
+    uint32_t val, id, next, offset;
+
+    offset = start;
+    if ( !offset )
+    {
+        const uint32_t xecp = readl(&dbc->xhc_regs[XHCI_HCCPARAMS1]) >> 16;
+        if ( !xecp )
+            return 0;
+
+        offset = xecp << 2;
+    }
+
+    do {
+        cap = dbc->xhc_regs + offset;
+        val = readl(cap);
+        id = val & 0xFF;
+
+        if ( offset != start && (id == capid) )
+            return offset;
+
+        next = (val & 0xFF00) >> 8;
+        offset += next << 2;
+    } while ( next );
+
+    return 0;
+}
+
+static int dbc_find_regs(struct xhci_dbc *dbc)
+{
+    uint32_t offset = xhci_find_next_cap(dbc, 0, XHCI_CAPID_DBC);
+
+    if ( !offset )
+        return -ENODEV;
+
+    dbc->dbc_regs = (struct dbc_regs __iomem *)(dbc->xhc_regs + offset);
+    return 0;
+}
+
+static void dbc_ring_doorbell(struct xhci_dbc *dbc, int doorbell)
+{
+    uint32_t db;
+    struct dbc_regs __iomem *regs = dbc->dbc_regs;
+    uint32_t ctrl = readl(&regs->ctrl);
+
+    if ( ctrl & CTRL_DRC )
+    {
+        /* Re-arm the doorbell */
+        writel(ctrl | CTRL_DRC, &regs->ctrl);
+    }
+
+    if ( !(ctrl & CTRL_DCR) )
+        return;
+
+    if ( doorbell == DOORBELL_OUT && (ctrl & CTRL_HOT) )
+        return;
+
+    if ( doorbell == DOORBELL_IN && (ctrl & CTRL_HIT) )
+        return;
+
+    db = (readl(&regs->db) & 0xFFFF00FF) | (doorbell << 8);
+    writel(db, &regs->db);
+}
+
+static inline void dbc_stop(const struct xhci_dbc *dbc)
+{
+    uint32_t ctrl = readl(&dbc->dbc_regs->ctrl);
+
+    writel(ctrl & ~CTRL_DCE, &dbc->dbc_regs->ctrl);
+    readl_poll(&dbc->dbc_regs->ctrl, dbc_off, POLL_LIMIT);
+}
+
+static void dbc_init(struct xhci_dbc *dbc, uint64_t erdp)
+{
+    uint64_t ordp = virt_to_maddr(trb_out);
+    uint64_t irdp = virt_to_maddr(trb_in);
+
+    init_xfer_ring(&dbc->trb_out_ring, trb_out, TRB_RING_SIZE);
+    init_xfer_ring(&dbc->trb_in_ring, trb_in, TRB_RING_SIZE);
+
+    init_data_ring(&dbc->data_out_ring, data_out, DATA_RING_SIZE);
+    init_data_ring(&dbc->data_in_ring, data_in, DATA_RING_SIZE);
+
+    init_event_ring(&dbc->trb_evt_ring, trb_evt, TRB_RING_SIZE);
+    init_erst(dbc, erdp, TRB_RING_SIZE);
+    init_strings(dbc);
+
+    init_endpoint(dbc, EP_TYPE_BULK_OUT, ordp);
+    init_endpoint(dbc, EP_TYPE_BULK_IN, irdp);
+}
+
+static void dbc_reset(struct xhci_dbc *dbc)
+{
+    struct dbc_regs __iomem *regs;
+    uint64_t erdp, cp, erstba;
+    uint32_t erstsz, ddi;
+
+    BUILD_BUG_ON(DATA_RING_SIZE > TRB_MAX_XFER);
+
+    /* Make sure we start from the DbC-Off state */
+    dbc_stop(dbc);
+
+    erdp = virt_to_maddr(trb_evt);
+    dbc_init(dbc, erdp);
+
+    regs = dbc->dbc_regs;
+
+    erstsz = (readl(&regs->erstsz) & 0xFFFF0000) | DBC_ERSTSZ;
+    writel(erstsz, &regs->erstsz);
+
+    erstba = (lo_hi_readq(&regs->erstba) & 0xF) | virt_to_maddr(&dbc->erst);
+    lo_hi_writeq(erstba, &regs->erstba);
+
+    erdp |= lo_hi_readq(&regs->erdp) & 0x8;
+    lo_hi_writeq(erdp, &regs->erdp);
+
+    cp = (lo_hi_readq(&regs->cp) & 0xF) | virt_to_maddr(&dbc->ctx);
+    lo_hi_writeq(cp, &regs->cp);
+
+    ddi = (DBC_VENDOR << 16) | DBC_PROTOCOL;
+    writel(ddi, &regs->ddi1);
+
+    ddi = (DBC_REVISION << 16) | DBC_PRODUCT;
+    writel(ddi, &regs->ddi2);
+}
+
+static int dbc_start(const struct xhci_dbc *dbc)
+{
+    uint32_t ctrl, portsc;
+    struct dbc_regs __iomem *regs = dbc->dbc_regs;
+    const int max_try = 2;
+
+    for ( int try = 0; try < max_try; try++ )
+    {
+        ctrl = readl(&regs->ctrl);
+        writel(ctrl | CTRL_DCE | CTRL_LSE, &regs->ctrl);
+
+        ctrl = readl_poll(&regs->ctrl, dbc_on, POLL_LIMIT);
+        if ( !dbc_on(ctrl) )
+            return -ENODEV;
+
+        /* Wait for transition to DbC-Enabled state */
+        portsc = readl_poll(&regs->portsc, dbc_enabled, POLL_LIMIT);
+        if ( !dbc_enabled(portsc) )
+            return -ENODEV;
+
+        /*
+         * Now we're DbC-Enabled, wait for the host to enumerate the
+         * DbC capability and bring us to the DbC-Configured state.
+         */
+        ctrl = readl_poll(&regs->ctrl, dbc_configured, POLL_LIMIT);
+        if ( !dbc_configured(ctrl) )
+        {
+            /*
+             * Clear port status change bits. If a tPortConfigurationTimeout
+             * is the reason we failed to configure, then we must clear
+             * PORTSC.CEC manually. If we failed for another reason
+             * (e.g. an LTSSM substate polling timeout or warm reset), then
+             * the relevant status bits in PORTSC will be cleared upon
+             * clearing CTRL_DCE.
+             */
+            portsc = readl(&regs->portsc);
+            writel(portsc | PORTSC_CEC, &regs->portsc);
+            dbc_stop(dbc);
+
+            continue;
+        }
+
+        return 0;
+    }
+
+    return -ENODEV;
+}
+
+static inline int dbc_state(const struct xhci_dbc *dbc)
+{
+    uint32_t ctrl = readl(&dbc->dbc_regs->ctrl);
+    uint32_t portsc = readl(&dbc->dbc_regs->portsc);
+    uint32_t pls = (portsc & PORTSC_PLS) >> 5;
+
+    if (!(ctrl & CTRL_DCE))
+        return DBC_OFF;
+
+    if (!(portsc & PORTSC_CCS))
+        return DBC_DISCONNECTED;
+
+    if (ctrl & CTRL_DCR)
+        return DBC_CONFIGURED;
+
+    if (portsc & PORTSC_PR)
+        return DBC_RESETTING;
+
+    if (pls == DBC_PLS_INACTIVE)
+        return DBC_ERROR;
+
+    if (pls == DBC_PLS_DISABLED)
+        return DBC_DISABLED;
+
+    return DBC_ENABLED;
+}
+
+static inline void dbc_port_disable(const struct xhci_dbc *dbc)
+{
+    uint32_t portsc = readl(&dbc->dbc_regs->portsc);
+
+    writel(portsc & ~PORTSC_PED, &dbc->dbc_regs->portsc);
+    readl_poll(&dbc->dbc_regs->portsc, port_disabled, POLL_LIMIT);
+}
+
+static inline void dbc_port_enable(const struct xhci_dbc *dbc)
+{
+    uint32_t portsc = readl(&dbc->dbc_regs->portsc);
+
+    writel(portsc | PORTSC_PED, &dbc->dbc_regs->portsc);
+    readl_poll(&dbc->dbc_regs->portsc, port_enabled, POLL_LIMIT);
+}
+
+static inline void dbc_handle_psc_event(const struct xhci_dbc *dbc)
+{
+    uint32_t portsc = readl(&dbc->dbc_regs->portsc);
+
+    portsc |= PORTSC_PSC_MASK;
+    writel(portsc, &dbc->dbc_regs->portsc);
+}
+
+static void dbc_handle_out_xfer_event(struct xhci_dbc *dbc,
+                                      const struct trb *event)
+{
+    struct trb_ring *trb_ring = &dbc->trb_out_ring;
+
+    if ( trb_xfer_event_cc(event) == TRB_CC_TRANSACTION_ERROR)
+    {
+        uint32_t ctrl = readl(&dbc->dbc_regs->ctrl);
+
+        if ( (ctrl & CTRL_DRC) &&
+             ep_state(&dbc->ctx.ep_out) == EP_STATE_DISABLED )
+        {
+            uint32_t bytes_left = trb_xfer_event_len(event);
+
+            if ( bytes_left )
+            {
+                /*
+                 * In this case we left the DBC_CONFIGURED state after
+                 * partially transfering a TRB. Recover by re-queueing
+                 * the left over bytes. See section 7.6.4.4 for more
+                 * details on this behavior.
+                 */
+                uint64_t idx = (trb_xfer_event_ptr(event) & TRB_RING_MASK) /
+                                sizeof(struct trb);
+
+                struct trb *orig_trb = &trb_ring->trb[idx];
+
+                uint64_t dma = trb_norm_buf(orig_trb) +
+                               trb_norm_len(orig_trb) - bytes_left;
+
+                trb_norm_set_buf(orig_trb, dma);
+                trb_norm_set_len(orig_trb, bytes_left);
+
+                /*
+                 * Make sure the xHC schedules this TRB when the doorbell
+                 * is rung later.
+                 */
+                dbc->ctx.ep_out.trdp = cpu_to_le64(virt_to_maddr(orig_trb));
+            }
+        }
+    }
+
+    trb_ring->deq = (trb_xfer_event_ptr(event) & TRB_RING_MASK) /
+                    sizeof(struct trb);
+}
+
+static void dbc_handle_in_xfer_event(struct xhci_dbc *dbc,
+                                     const struct trb *event)
+{
+    uint32_t idx = (trb_xfer_event_ptr(event) & TRB_RING_MASK) /
+                   sizeof(struct trb);
+    struct trb *orig_trb = &dbc->trb_in_ring.trb[idx];
+    uint32_t bytes_rcvd = trb_norm_len(orig_trb) - trb_xfer_event_len(event);
+    struct data_ring *in_ring = &dbc->data_in_ring;
+    struct trb_ring *trb_ring = &dbc->trb_in_ring;
+
+    if ( in_ring->enq + bytes_rcvd >= DATA_RING_SIZE )
+        in_ring->enq = bytes_rcvd - (DATA_RING_SIZE - in_ring->enq);
+    else
+        in_ring->enq += bytes_rcvd;
+
+    trb_ring->deq = ((trb_xfer_event_ptr(event) & TRB_RING_MASK) /
+                     sizeof(struct trb)) + 1;
+    trb_ring->deq &= TRB_RING_SIZE - 1;
+}
+
+static void dbc_handle_xfer_event(struct xhci_dbc *dbc,
+                                  const struct trb *event)
+{
+    int epid = trb_xfer_event_epid(event);
+
+    if ( epid == XDBC_EPID_OUT || epid == XDBC_EPID_OUT_INTEL )
+        dbc_handle_out_xfer_event(dbc, event);
+    else if ( epid == XDBC_EPID_IN || epid == XDBC_EPID_IN_INTEL )
+        dbc_handle_in_xfer_event(dbc, event);
+}
+
+static void dbc_process_events(struct xhci_dbc *dbc)
+{
+    struct trb_ring *evt_ring = &dbc->trb_evt_ring;
+    struct trb *evt = &evt_ring->trb[evt_ring->deq];
+    bool update_erdp = false;
+
+    while ( trb_cycle(evt) == evt_ring->cycle )
+    {
+        /*
+         * The xHC performs a release with the cycle bit to publish
+         * the TRB's contents. Add the corresponding acquire here.
+         */
+        rmb();
+
+        switch ( trb_type(evt) )
+        {
+        case TRB_TYPE_PSC_EVENT:
+            dbc_handle_psc_event(dbc);
+            break;
+        case TRB_TYPE_XFER_EVENT:
+            dbc_handle_xfer_event(dbc, evt);
+            break;
+        default:
+            break;
+        }
+
+        if ( evt_ring->deq == TRB_RING_SIZE - 1 )
+            evt_ring->cycle ^= 1;
+
+        evt_ring->deq = (evt_ring->deq + 1) & (TRB_RING_SIZE - 1);
+        evt = &evt_ring->trb[evt_ring->deq];
+        update_erdp = true;
+    }
+
+    if ( update_erdp )
+    {
+        uint64_t erdp = lo_hi_readq(&dbc->dbc_regs->erdp);
+
+        erdp &= ~TRB_RING_MASK;
+        erdp |= evt_ring->deq * sizeof(struct trb);
+
+        lo_hi_writeq(erdp, &dbc->dbc_regs->erdp);
+    }
+}
+
+static int dbc_handle_state(struct xhci_dbc *dbc)
+{
+    switch ( dbc_state(dbc) )
+    {
+    case DBC_OFF:
+        dbc_reset(dbc);
+        return dbc_start(dbc);
+    case DBC_DISABLED:
+        dbc_port_enable(dbc);
+        break;
+    case DBC_ERROR:
+        /*
+         * Try to toggle the port (without releasing it) to re-enumerate,
+         * lest we get stuck if the host never issues a hot or warm reset.
+         */
+        dbc_port_disable(dbc);
+        dbc_port_enable(dbc);
+        break;
+    default:
+        /*
+         * There are no other states in which we can actually do
+         * anything to cause a transition to DBC_CONFIGURED; we just
+         * have to wait on the hardware to transition.
+         */
+        break;
+    }
+
+    return 0;
+}
+
+static void dbc_queue_xfer(struct trb_ring *ring,
+                           uint64_t dma,
+                           uint32_t len)
+{
+    struct trb *trb;
+
+    if (ring->enq == TRB_RING_SIZE - 1) {
+        /*
+         * We have to make sure the xHC processes the link TRB in order
+         * for wrap-around to work properly. We do this by marking the
+         * xHC as owner of the link TRB by setting the TRB's cycle bit
+         * (just like with normal TRBs).
+         */
+        struct trb *link = &ring->trb[ring->enq];
+
+        /* Release TRB fields */
+        wmb();
+        trb_set_cycle(link, ring->cycle);
+
+        ring->enq = 0;
+        ring->cycle ^= 1;
+    }
+
+    trb = &ring->trb[ring->enq];
+    trb_set_type(trb, TRB_TYPE_NORMAL);
+
+    trb_norm_set_buf(trb, dma);
+    trb_norm_set_len(trb, len);
+    trb_norm_set_ioc(trb);
+
+    /* Release TRB fields */
+    wmb();
+    trb_set_cycle(trb, ring->cycle);
+
+    ring->enq++;
+}
+
+static void dbc_queue_tx_data(struct xhci_dbc *dbc)
+{
+    paddr_t dma;
+    uint64_t len;
+
+    struct data_ring *out_ring = &dbc->data_out_ring;
+    struct trb_ring *trb_ring = &dbc->trb_out_ring;
+
+    if ( out_ring->enq == out_ring->deq )
+        return;
+
+    dma = out_ring->dma_addr + out_ring->deq;
+
+    if ( out_ring->enq > out_ring->deq )
+    {
+        len = out_ring->enq - out_ring->deq;
+        dbc_queue_xfer(trb_ring, dma, len);
+    }
+    else
+    {
+        len = DATA_RING_SIZE - out_ring->deq;
+        dbc_queue_xfer(trb_ring, dma, len);
+
+        if ( out_ring->enq )
+            dbc_queue_xfer(trb_ring, out_ring->dma_addr, out_ring->enq);
+    }
+
+    out_ring->deq = out_ring->enq;
+}
+
+static void dbc_queue_rx_data(struct xhci_dbc *dbc)
+{
+    struct data_ring *in_ring = &dbc->data_in_ring;
+    struct trb_ring *trb_ring = &dbc->trb_in_ring;
+
+    if ( in_ring->enq + MAX_RX_SIZE <= DATA_RING_SIZE )
+        dbc_queue_xfer(trb_ring, in_ring->dma_addr + in_ring->enq, MAX_RX_SIZE);
+    else
+    {
+        uint64_t first_len = DATA_RING_SIZE - in_ring->enq;
+
+        dbc_queue_xfer(trb_ring, in_ring->dma_addr + in_ring->enq, first_len);
+        dbc_queue_xfer(trb_ring, in_ring->dma_addr, MAX_RX_SIZE - first_len);
+    }
+}
+
+static void dbc_flush_locked(struct xhci_dbc *dbc)
+{
+    if ( dbc->unsafe )
+        return;
+
+    xhci_enable_mmio_and_dma(dbc);
+
+    if ( dbc_handle_state(dbc) )
+        return;
+
+    dbc_process_events(dbc);
+    dbc_queue_tx_data(dbc);
+    dbc_ring_doorbell(dbc, DOORBELL_OUT);
+}
+
+static void dbc_flush(struct serial_port *port)
+{
+    unsigned long flags;
+    struct xhci_dbc *dbc = (struct xhci_dbc *)port->uart;
+
+    spin_lock_irqsave(&dbc->lock, flags);
+    dbc_flush_locked(dbc);
+    spin_unlock_irqrestore(&dbc->lock, flags);
+}
+
+static int dbc_reset_prepare(struct xhci_dbc *dbc)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&dbc->lock, flags);
+
+    if ( dbc->unsafe )
+        goto out;
+
+    /* Drain pending transfers and events */
+    dbc_flush_locked(dbc);
+    dbc_stop(dbc);
+
+    /*
+     * We aren't allowed to touch any MMIO regs until the host
+     * controller is done resetting as indicated by dbc_reset_done.
+     */
+    dbc->unsafe = true;
+
+out:
+    spin_unlock_irqrestore(&dbc->lock, flags);
+    return 0;
+}
+
+static int dbc_reset_done(struct xhci_dbc *dbc)
+{
+    int rc;
+    unsigned long flags;
+
+    spin_lock_irqsave(&dbc->lock, flags);
+
+    if ( !dbc->unsafe )
+        goto out;
+
+    dbc->unsafe = false;
+    dbc_reset(dbc);
+
+    rc = dbc_start(dbc);
+
+out:
+    spin_unlock_irqrestore(&dbc->lock, flags);
+    return 0;
+}
+
+int dbgp_op(const struct physdev_dbgp_op *op)
+{
+    struct xhci_dbc *dbc = &xhci_dbc;
+
+    if ( !dbc->dbc_regs )
+        return 0;
+
+    switch ( op->bus )
+    {
+    case PHYSDEVOP_DBGP_BUS_UNKNOWN:
+        /* Only PCI is supported ATM */
+        return -EINVAL;
+    case PHYSDEVOP_DBGP_BUS_PCI:
+        if ( PCI_SEG(dbc->sbdf.sbdf) != op->u.pci.seg ||
+             PCI_BUS(dbc->sbdf.sbdf) != op->u.pci.bus ||
+             PCI_DEVFN2(dbc->sbdf.sbdf) != op->u.pci.devfn )
+            return -ENODEV;
+        break;
+    default:
+        return -EINVAL;
+    }
+
+    switch ( op->op )
+    {
+    case PHYSDEVOP_DBGP_RESET_PREPARE:
+        return dbc_reset_prepare(dbc);
+    case PHYSDEVOP_DBGP_RESET_DONE:
+        return dbc_reset_done(dbc);
+    default:
+        return -EINVAL;
+    }
+}
+
+static void dbc_putc(struct serial_port *port, char c)
+{
+    struct xhci_dbc *dbc = port->uart;
+    struct data_ring *ring = &dbc->data_out_ring;
+
+    ring->buf[ring->enq] = c;
+    ring->enq = (ring->enq + 1) & (DATA_RING_SIZE - 1);
+}
+
+static int dbc_getc(struct serial_port *port, char *c)
+{
+    int rc;
+    unsigned long flags;
+
+    struct xhci_dbc *dbc = port->uart;
+    struct data_ring *ring = &dbc->data_in_ring;
+
+    rc = 0;
+
+    spin_lock_irqsave(&port->tx_lock, flags);
+    spin_lock_irqsave(&dbc->lock, flags);
+
+    /*
+     * If the port is synchronous we need to ring the doorbell
+     * and process events manually here instead of relying on
+     * the timer callback. Hence taking tx_lock prior to checking
+     * port->sync.
+     */
+    if ( port->sync )
+    {
+        if ( dbc->unsafe )
+            goto out;
+
+        if ( dbc->trb_in_ring.enq == dbc->trb_in_ring.deq )
+        {
+            dbc_queue_rx_data(dbc);
+            dbc_ring_doorbell(dbc, DOORBELL_IN);
+        }
+
+        dbc_process_events(dbc);
+    }
+
+    if ( ring->enq != ring->deq )
+    {
+        *c = ring->buf[ring->deq];
+        ring->deq = (ring->deq + 1) & (DATA_RING_SIZE - 1);
+        rc = 1;
+    }
+
+out:
+    spin_unlock_irqrestore(&dbc->lock, flags);
+    spin_unlock_irqrestore(&port->tx_lock, flags);
+
+    return rc;
+}
+
+static void dbc_rx_poll(struct cpu_user_regs *regs)
+{
+    unsigned long flags;
+
+    struct serial_port *port = this_cpu(poll_port);
+    struct xhci_dbc *dbc = port->uart;
+
+    spin_lock_irqsave(&dbc->lock, flags);
+
+    if ( dbc->unsafe )
+        goto out;
+
+    dbc_process_events(dbc);
+
+    if ( dbc->trb_in_ring.enq == dbc->trb_in_ring.deq )
+    {
+        dbc_queue_rx_data(dbc);
+        dbc_ring_doorbell(dbc, DOORBELL_IN);
+    }
+
+out:
+    spin_unlock_irqrestore(&dbc->lock, flags);
+
+    while ( dbc->data_in_ring.enq != dbc->data_in_ring.deq )
+        serial_rx_interrupt(port, regs);
+
+    set_timer(&dbc->timer, NOW() + MILLISECS(5));
+}
+
+static void dbc_handle_timer(void *data)
+{
+    this_cpu(poll_port) = data;
+
+#ifdef run_in_exception_handler
+    run_in_exception_handler(dbc_rx_poll);
+#else
+    dbc_rx_poll(guest_cpu_user_regs());
+#endif
+}
+
+static void __init dbc_init_postirq(struct serial_port *port)
+{
+    struct xhci_dbc *dbc = port->uart;
+
+    if ( !dbc->dbc_regs )
+        return;
+
+    init_timer(&dbc->timer, dbc_handle_timer, port, 0);
+    set_timer(&dbc->timer, NOW() + MILLISECS(5));
+}
+
+static struct uart_driver __read_mostly dbc_driver = {
+    .init_postirq = dbc_init_postirq,
+    .putc         = dbc_putc,
+    .flush        = dbc_flush,
+    .getc         = dbc_getc
+};
+
+static bool __init xhci_detect(uint32_t bus,
+                               uint32_t dev,
+                               uint32_t func)
+{
+    uint32_t hdr, class;
+    pci_sbdf_t sbdf = PCI_SBDF(0, bus, dev, func);
+
+    hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+    if ( (hdr != PCI_HEADER_TYPE_NORMAL) &&
+         (hdr != (PCI_HEADER_TYPE_NORMAL | 0x80)) )
+        return false;
+
+    class = pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8;
+    if ( class != XHCI_PCI_CLASS )
+        return false;
+
+    return true;
+}
+
+/*
+ * This implements the handoff algorithm described in section 4.22.1.
+ * It is adapted to xen from linux:
+ *     drivers/usb/early/xhci-dbc.c:xdbc_bios_handoff
+ *     Copyright (C) 2016 Intel Corporation
+ * and
+ *     drivers/usb/host/pci-quirks.c:quirk_usb_handoff_xhci
+ *     Copyright (C) 1999 Martin Mares <mj@ucw.cz>
+ */
+static void __init dbc_bios_handoff(const struct xhci_dbc *dbc)
+{
+    uint32_t __iomem *legacy;
+    uint32_t val;
+    uint32_t offset = xhci_find_next_cap(dbc, 0, XHCI_CAPID_LEGACY);
+
+    if ( !offset )
+        return;
+
+    legacy = (uint32_t __iomem *)(dbc->xhc_regs + offset);
+    val = readl(legacy);
+
+    writel(val | XHCI_OS_OWNED, legacy);
+
+    /*
+     * We are supposed to wait at most one second for the BIOS to
+     * clear its ownership bit. Provide an approximation with
+     * cpu_relax since early_time_init hasn't been called (and
+     * therefore udelay isn't available) yet.
+     */
+
+    val = readl_poll(legacy, xhci_os_owned, POLL_LIMIT);
+    if ( !xhci_os_owned(val) )
+        /* BIOS lost their chance, all your usb are belong to us */
+        writel(val & ~XHCI_BIOS_OWNED, legacy);
+
+    /* Now disable SMIs in the USBLEGCTLSTS register */
+    val = readl(legacy + 4);
+    val &= XHCI_LEGACY_DISABLE_SMI;
+    val |= XHCI_LEGACY_SMI_EVENTS;
+
+    writel(val, legacy + 4);
+}
+
+int __init xhci_find(unsigned long num, uint32_t *b, uint32_t *d, uint32_t *f)
+{
+    uint32_t bus, dev, func;
+    unsigned long count = 0;
+
+    for ( bus = 0; bus < 256; bus++ )
+    {
+        for ( dev = 0; dev < 32; dev++ )
+        {
+            for ( func = 0; func < 8; func++ )
+            {
+                if ( !pci_device_detect(0, bus, dev, func) )
+                {
+                    if ( !func )
+                        break;
+                    continue;
+                }
+
+                if ( !xhci_detect(bus, dev, func) || count++ != num )
+                {
+                    pci_sbdf_t sbdf = PCI_SBDF(0, bus, dev, func);
+                    uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+
+                    /* Go to next dev if this one isn't multi-function */
+                    if ( !func && !(hdr & 0x80) )
+                        break;
+                    continue;
+                }
+                else
+                {
+                    *b = bus;
+                    *d = dev;
+                    *f = func;
+
+                    return 0;
+                }
+            }
+        }
+    }
+
+    return -ENODEV;
+}
+
+static int __init xhci_parse_param(uint32_t *bus, uint32_t *dev, uint32_t *func)
+{
+    if ( strncmp(opt_dbgp, "xhci", 4) )
+        return -ENODEV;
+
+    if ( isdigit(opt_dbgp[4]) || !opt_dbgp[4] )
+    {
+        unsigned long num = 0;
+
+        if ( opt_dbgp[4] )
+            num = simple_strtoul(opt_dbgp + 4, NULL, 10);
+
+        if ( xhci_find(num, bus, dev, func) )
+            return -ENODEV;
+    }
+    else if ( !strncmp(opt_dbgp, "xhci@pci", 8) )
+    {
+        if ( !parse_pci(opt_dbgp + 8, NULL, bus, dev, func) )
+            return -ENODEV;
+
+        if ( !pci_device_detect(0, *bus, *dev, *func) )
+            return -ENODEV;
+
+        if ( !xhci_detect(*bus, *dev, *func) )
+            return -ENODEV;
+    }
+    else
+        return -ENODEV;
+
+    return 0;
+}
+
+void __init xhci_dbc_init(void)
+{
+    uint32_t bus, dev, func;
+    struct xhci_dbc *dbc = &xhci_dbc;
+
+    if ( xhci_parse_param(&bus, &dev, &func) )
+        return;
+
+    dbc->sbdf = PCI_SBDF(0, bus, dev, func);
+    xhci_enable_mmio_and_dma(dbc);
+
+    if ( xhci_map_regs(dbc) )
+        return;
+
+    if ( dbc_find_regs(dbc) )
+        goto unmap;
+
+    spin_lock_init(&dbc->lock);
+
+    dbc_bios_handoff(dbc);
+    dbc_reset(dbc);
+
+    if ( dbc_start(dbc) )
+        goto stop;
+
+    serial_register_uart(SERHND_DBGP, &dbc_driver, dbc);
+    return;
+
+stop:
+    dbc_stop(dbc);
+
+unmap:
+    xhci_unmap_regs(dbc);
+}
diff --git a/xen/drivers/char/xhci-dbc.h b/xen/drivers/char/xhci-dbc.h
new file mode 100644
index 0000000000..34f51933a9
--- /dev/null
+++ b/xen/drivers/char/xhci-dbc.h
@@ -0,0 +1,621 @@
+/*
+ * xen/drivers/char/xhci-dbc.h
+ *
+ * Driver for USB xHCI Debug Capability
+ * ported from https://github.com/connojd/xue.git
+ *
+ * Copyright (C) 2019 Assured Information Security, Inc.
+ * Copyright (C) 2021 Connor Davis <connojdavis@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without restriction,
+ * including without limitation the rights to use, copy, modify, merge,
+ * publish, distribute, sublicense, and/or sell copies of the Software,
+ * and to permit persons to whom the Software is furnished to do so,
+ * subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <xen/lib.h>
+#include <xen/page-size.h>
+#include <xen/pci.h>
+#include <xen/spinlock.h>
+
+#include <asm/byteorder.h>
+#include <asm/io.h>
+
+/* USB string descriptor values */
+#define USB_DT_STRING      3
+#define USB_LANGID_ENGLISH 0x0409
+#define DBC_MAX_STR_SIZE   64
+
+/* Number of DbC event ring segments */
+#define DBC_ERSTSZ  1
+
+/* DbC control register */
+#define CTRL_DCR    (1U << 0)
+#define CTRL_LSE    (1U << 1)
+#define CTRL_HOT    (1U << 2)
+#define CTRL_HIT    (1U << 3)
+#define CTRL_DRC    (1U << 4)
+#define CTRL_DCE    (1U << 31)
+
+/* DbC port status change register */
+#define PORTSC_CCS  (1U << 0)
+#define PORTSC_PED  (1U << 1)
+#define PORTSC_PR   (1U << 4)
+#define PORTSC_PLS  (0xFU << 5)
+#define PORTSC_CSC  (1U << 17)
+#define PORTSC_PRC  (1U << 21)
+#define PORTSC_PLC  (1U << 22)
+#define PORTSC_CEC  (1U << 23)
+
+/* Port status change bits must be cleared for further event generation */
+#define PORTSC_PSC_MASK (PORTSC_CSC|PORTSC_PRC|PORTSC_PLC|PORTSC_CEC)
+
+/* TRB types */
+#define TRB_TYPE_NORMAL      1
+#define TRB_TYPE_LINK        6
+#define TRB_TYPE_XFER_EVENT  32
+#define TRB_TYPE_PSC_EVENT   34
+
+/* TRB completion codes */
+#define TRB_CC_TRANSACTION_ERROR  4
+
+#define TRB_MAX_XFER       (PAGE_SIZE * 16)
+#define TRB_PER_PAGE       (PAGE_SIZE / sizeof(struct trb))
+#define TRB_RING_ORDER     2
+#define TRB_RING_PAGES     (1U << TRB_RING_ORDER)
+#define TRB_RING_SIZE      (TRB_PER_PAGE * TRB_RING_PAGES)
+#define TRB_RING_MASK      ((TRB_RING_SIZE * sizeof(struct trb)) - 1)
+#define TRB_RING_ALIGN     (PAGE_SIZE * 16)
+
+/* DbC endpoint values */
+#define EP_STATE_DISABLED  0
+#define EP_STATE_RUNNING   1
+#define EP_STATE_HALTED    2
+#define EP_STATE_STOPPED   3
+#define EP_STATE_ERROR     4
+#define EP_TYPE_BULK_OUT   2
+#define EP_TYPE_BULK_IN    6
+#define EP_MAX_PKT_SIZE    1024
+#define EP_AVG_TRB_LENGTH  (3 * 1024)
+#define EP_INITIAL_DCS     1
+
+#define TRB_TYPE_MASK               0xFC00
+#define TRB_TYPE_SHIFT              10
+#define TRB_CYCLE_MASK              0x1
+#define TRB_EVENT_EPID_MASK         0x1F0000
+#define TRB_EVENT_EPID_SHIFT        16
+#define TRB_EVENT_CC_SHIFT          24
+#define TRB_EVENT_LEN_MASK          0x1FFFF
+#define TRB_NORM_LEN_MASK           0x1FFFF
+#define TRB_NORM_IOC_MASK           0x20
+#define TRB_LINK_TOGGLE_CYCLE_MASK  0x2
+#define EP_STATE_MASK               0x7
+#define MAX_BURST_MASK              0xFF0000
+#define MAX_BURST_SHIFT             16
+
+/*
+ * The following comment and XDBC_EPID_* values are taken from
+ * linux/drivers/usb/early/xhci-dbc.h:
+ *
+ * These are the "Endpoint ID" (also known as "Context Index") values for the
+ * OUT Transfer Ring and the IN Transfer Ring of a Debug Capability Context data
+ * structure.
+ * According to the "eXtensible Host Controller Interface for Universal Serial
+ * Bus (xHCI)" specification, section "7.6.3.2 Endpoint Contexts and Transfer
+ * Rings", these should be 0 and 1, and those are the values AMD machines give
+ * you; but Intel machines seem to use the formula from section "4.5.1 Device
+ * Context Index", which is supposed to be used for the Device Context only.
+ * Luckily the values from Intel don't overlap with those from AMD, so we can
+ * just test for both.
+ */
+#define XDBC_EPID_OUT		0
+#define XDBC_EPID_IN		1
+#define XDBC_EPID_OUT_INTEL	2
+#define XDBC_EPID_IN_INTEL	3
+
+/*
+ * The doorbell target is written to the doorbell register to
+ * notify hardware that the respective transfer ring's enqueue
+ * pointer has been updated (i.e., data is ready to be transfered).
+ */
+#define DOORBELL_OUT     0
+#define DOORBELL_IN      1
+
+#define DATA_RING_ORDER  2
+#define DATA_RING_PAGES  (1UL << DATA_RING_ORDER)
+#define DATA_RING_SIZE   (PAGE_SIZE * DATA_RING_PAGES)
+#define DATA_RING_MASK   (DATA_RING_SIZE - 1)
+
+#define MAX_RX_SIZE      EP_MAX_PKT_SIZE
+
+#define DBC_PROTOCOL     0x0001 /* Remote GDB */
+#define DBC_VENDOR       0x1D6B /* Linux Foundation */
+#define DBC_PRODUCT      0x0010
+#define DBC_REVISION     0x0000
+
+/*
+ * xHCI PCI class code
+ *
+ * Bits 7:0   - 0x30: USB3 host controller compliant with xHCI
+ * Bits 15:8  - 0x03: USB host controller
+ * Bits 23:16 - 0x0C: Serial bus controller
+ */
+#define XHCI_PCI_CLASS   0x0C0330
+
+/*
+ * Byte offset from the base of the xHC's MMIO
+ * region to the HCCPARAMS1 capability register
+ */
+#define XHCI_HCCPARAMS1  0x10
+
+/* Extended xHCI capabilities we care about */
+#define XHCI_CAPID_LEGACY  1
+#define XHCI_CAPID_DBC     10
+
+/* Legacy ownership bits */
+#define XHCI_BIOS_OWNED  (1 << 16)
+#define XHCI_OS_OWNED    (1 << 24)
+
+/* The set bits here are RsvdP, the RW SMI bits are clear */
+#define XHCI_LEGACY_DISABLE_SMI ((0x7 << 17) | (0xff << 5) | (0x7 << 1))
+
+/* SMI events, RW1C */
+#define XHCI_LEGACY_SMI_EVENTS  (0x7 << 29)
+
+/* DbC states */
+enum {
+    DBC_OFF,
+    DBC_DISCONNECTED,
+    DBC_DISABLED,
+    DBC_ENABLED,
+    DBC_ERROR,
+    DBC_RESETTING,
+    DBC_CONFIGURED
+};
+
+/* Port link states */
+enum {
+    DBC_PLS_U0,
+    DBC_PLS_U1,
+    DBC_PLS_U2,
+    DBC_PLS_U3,
+    DBC_PLS_DISABLED,
+    DBC_PLS_RXDETECT,
+    DBC_PLS_INACTIVE,
+    DBC_PLS_POLLING,
+    DBC_PLS_RECOVERY,
+    DBC_PLS_HOT_RESET
+};
+
+/*
+ * struct trb - xHC transfer request block
+ *
+ * TRBs come in several flavors, but the DbC mainly deals with
+ * event and normal TRB types. The fields' meanings vary depending
+ * on the type (which is always defined in bits @ctrl[15:10]).
+ *
+ * Normal TRBs are placed onto transfer rings and point to data
+ * that the xHC should read or write. In turn, the xHC produces
+ * event TRBs on the the event ring, which are processed by the driver.
+ */
+struct trb {
+    __le64 params;
+    __le32 status;
+    __le32 ctrl;
+};
+
+/*
+ * struct erst_segment - Event ring segment
+ *
+ * Specifies a physically contiguous region of event TRBs. The region must
+ * not straddle a 64K boundary.
+ *
+ * @base the 64-byte aligned physical address of the segment
+ * @size the number of TRBs in the segment. Must be in [16, 4096].
+ */
+struct erst_segment {
+    __le64 base;
+    __le16 size;
+    __le16 __rsvdz[3];
+};
+
+/*
+ * struct dbc_info_ctx - Physical addresses for the DbC's USB
+ * String Descriptors.
+ *
+ * @string0 - address for languages supported
+ * @manufacturer - address for manufacturer
+ * @product - address for product
+ * @serial - address for serial number
+ * @length - each byte contains the length of the corresponding string
+ *           in bytes, e.g., byte 0 of @length is the number of
+ *           bytes of string0.
+ */
+struct dbc_info_ctx {
+    __le64 string0;
+    __le64 manufacturer;
+    __le64 product;
+    __le64 serial;
+    __le32 length;
+    __le32 __rsvdz[7];
+};
+
+/*
+ * struct dbc_ep_ctx - DbC endpoint context
+ *
+ * Describes a single bulk transfer ring. The DbC has two bulk endpoints:
+ * one for IN transfers, one for OUT. The field values required for the DbC
+ * are specified in sections 7.6.3.2 and 7.6.9.2.
+ */
+struct dbc_ep_ctx {
+   __le32 data0;
+   __le32 data1;
+   __le64 trdp;
+   __le32 data2;
+   __le32 __rsvdo[11];
+};
+
+/*
+ * struct dbc_ctx - DbC context
+ *
+ * Container for the USB string and endpoint contexts.
+ */
+struct dbc_ctx {
+    struct dbc_info_ctx info;
+    struct dbc_ep_ctx ep_out;
+    struct dbc_ep_ctx ep_in;
+};
+
+/*
+ * struct dbc_regs
+ *
+ * The registers are a subset of the xHC's MMIO registers
+ * and are found by traversing the xHC's capability list.
+ *
+ * @id - extended capability ID
+ * @db - doorbell register, written by software whenever new TRBs
+ *       are ready for consumption.
+ * @erstsz - number of entries in the event ring segment stable (ERST).
+ * @erstba - phys address of the ERST, value must be 64-byte aligned.
+ * @erdp - event ring dequeue pointer, updated as software consumes events.
+ * @ctrl - control register
+ * @st - status register
+ * @portsc - port status and control register
+ * @cp - phys address of the DbC context, value must be 16-byte aligned.
+ * @ddi1 - DbC protocol and vendor ID
+ * @ddi2 - device revision and product ID
+ */
+struct dbc_regs {
+    __le32 id;
+    __le32 db;
+    __le32 erstsz;
+    __le32 __rsvdz;
+    __le64 erstba;
+    __le64 erdp;
+    __le32 ctrl;
+    __le32 st;
+    __le32 portsc;
+    __le32 __rsvdp;
+    __le64 cp;
+    __le32 ddi1;
+    __le32 ddi2;
+};
+
+/*
+ * struct trb_ring
+ *
+ * The DbC uses three TRB rings: one event ring and two bulk transfer rings
+ * (one for each direction). The hardware produces Event TRBs onto the event
+ * ring and the driver code produces Normal TRBs onto the transfer rings.
+ *
+ * @trb array of trbs
+ * @enq offset into @trb at which the next trb is produced
+ * @deq offset of the most recently consumed trb
+ * @cycle the bit that determines the ownership of any given
+ *        trb in the ring. Both the driver and hardware have internal
+ *        copies that toggle as the ring is traversed.
+ */
+struct trb_ring {
+    struct trb *trb;
+    unsigned int enq;
+    unsigned int deq;
+    unsigned int cycle;
+};
+
+/*
+ * struct data_ring
+ *
+ * The raw bytes sent from Xen and received from the debug host are buffered
+ * into a data_ring. When the uart is flush()'ed, the bytes are queued into
+ * a TRB on the appropriate transfer ring.
+ *
+ * @buf the buffer for the data
+ * @enq end of buffered data
+ * @deq beginning of buffered data
+ * @dma_addr physical address of @buf
+ */
+struct data_ring {
+    char *buf;
+    unsigned int enq;
+    unsigned int deq;
+    paddr_t dma_addr;
+};
+
+/* USB string descriptor */
+struct usb_str_desc {
+    __u8 bLength;
+    __u8 bDescriptorType;
+    __le16 wData[1];
+};
+
+/*
+ * DbC device strings. string0 is special in that it encodes
+ * the supported LANGIDs of the DbC device. The others are
+ * UTF16LE-encoded character strings
+ */
+struct dbc_str_desc {
+    char string0[DBC_MAX_STR_SIZE];
+    char manufacturer[DBC_MAX_STR_SIZE];
+    char product[DBC_MAX_STR_SIZE];
+    char serial[DBC_MAX_STR_SIZE];
+};
+
+/*
+ * struct xhci_dbc
+ *
+ * @sbdf - location of the HC on the PCI bus
+ * @lock - used for synchronizing safety checks
+ * @timer - used to inject RX interrupts
+ * @unsafe - when true, MMIO accesses are not permitted. This applies
+ *           for a small window of time after dom0 resets the HC until
+ *           the HC clears the Controller Not Ready (CNR) bit
+ *           sandwiched between the PHYSDEVOP_DBGP_RESET_PREPARE and
+ *           PHYSDEVOP_DBGP_RESET_DONE hypercalls.
+ * @mmio_paddr - base address of the HC's MMIO region
+ * @mmio_pages - number of 4K pages of the HC's MMIO region
+ * @xhc_regs - fixmapped value of mmio_paddr
+ * @dbc_regs - base address of the DbC registers
+ * @trb_evt_ring - event ring. The driver consumes TRBs off of
+ *                 this ring.
+ * @trb_out_ring - OUT transfer ring. Data written by Xen is referenced
+ *                 by TRBs placed onto this ring.
+ * @trb_in_ring - IN transfer ring. When the port is !sync, a timer
+ *                interrupt places TRBs onto this ring, otherwise the TRB
+ *                is queued directly by dbc_getc.
+ * @data_out_ring - circular buffer for data written by Xen
+ * @data_in_ring - circular buffer for data received from debug host
+ * @strings - USB string data
+ * @ctx - string and endpoint context
+ * @erst - event ring segment table. All event and transfer rings use
+ *         only one segment.
+ */
+struct xhci_dbc {
+    pci_sbdf_t sbdf;
+    spinlock_t lock;
+    struct timer timer;
+    bool unsafe;
+    uint64_t mmio_paddr;
+    uint64_t mmio_pages;
+    uint8_t __iomem *xhc_regs;
+    struct dbc_regs __iomem *dbc_regs;
+    struct trb_ring trb_evt_ring;
+    struct trb_ring trb_out_ring;
+    struct trb_ring trb_in_ring;
+    struct data_ring data_out_ring;
+    struct data_ring data_in_ring;
+    struct dbc_str_desc strings __aligned(64);
+    struct dbc_ctx ctx __aligned(64);
+    struct erst_segment erst[DBC_ERSTSZ] __aligned(64);
+};
+
+/*
+ * Type used for polling predicates over 32-bit MMIO register values.
+ * Return true when polling should stop, false otherwise.
+ */
+typedef bool (*poll_pred_t)(uint32_t val);
+
+#define POLL_LIMIT 10000000
+
+static uint32_t readl_poll(const uint32_t __iomem *ptr,
+                           poll_pred_t done,
+                           unsigned int limit)
+{
+    unsigned int i = 0;
+    uint32_t val = readl(ptr);
+
+    while ( !done(val) && i++ < limit )
+    {
+        cpu_relax();
+        val = readl(ptr);
+    }
+
+    return val;
+}
+
+static inline bool xhci_os_owned(uint32_t legacy)
+{
+    return (legacy & (XHCI_BIOS_OWNED | XHCI_OS_OWNED)) == XHCI_OS_OWNED;
+}
+
+static inline bool dbc_enabled(uint32_t portsc)
+{
+    return (portsc & (PORTSC_CCS | PORTSC_PED)) == (PORTSC_CCS | PORTSC_PED);
+}
+
+static inline bool dbc_configured(uint32_t ctrl)
+{
+    return (ctrl & CTRL_DCR) != 0;
+}
+
+static inline bool dbc_on(uint32_t ctrl)
+{
+    return (ctrl & CTRL_DCE) != 0;
+}
+
+static inline bool dbc_off(uint32_t ctrl)
+{
+    return (ctrl & CTRL_DCE) == 0;
+}
+
+/* Imported from include/linux/io-64-nonatomic-lo-hi.h */
+static inline __u64 lo_hi_readq(const volatile void __iomem *addr)
+{
+	const volatile u32 __iomem *p = addr;
+	u32 low, high;
+
+	low = readl(p);
+	high = readl(p + 1);
+
+	return low + ((u64)high << 32);
+}
+
+/* Imported from include/linux/io-64-nonatomic-lo-hi.h */
+static inline void lo_hi_writeq(__u64 val, volatile void __iomem *addr)
+{
+	const volatile u8 __iomem *p = addr;
+
+	writel(val, p);
+	writel(val >> 32, p + 4);
+}
+
+static inline void copy_utf16le(u16 *wstr, const char *s)
+{
+    int len = strlen(s);
+
+    for ( int i = 0; i < len; i++ )
+        wstr[i] = cpu_to_le16(s[i]);
+}
+
+
+static inline void trb_set_type(struct trb *trb, uint32_t type)
+{
+    uint32_t ctrl = le32_to_cpu(trb->ctrl);
+
+    ctrl &= ~TRB_TYPE_MASK;
+    ctrl |= type << TRB_TYPE_SHIFT;
+
+    trb->ctrl = cpu_to_le32(ctrl);
+}
+
+static inline int trb_type(const struct trb *trb)
+{
+    return (le32_to_cpu(trb->ctrl) & TRB_TYPE_MASK) >> TRB_TYPE_SHIFT;
+}
+
+
+static inline void trb_set_cycle(struct trb *trb, uint32_t cyc)
+{
+    uint32_t ctrl = le32_to_cpu(trb->ctrl);
+
+    ctrl &= ~TRB_CYCLE_MASK;
+    ctrl |= cyc;
+
+    trb->ctrl = cpu_to_le32(ctrl);
+}
+
+static inline int trb_cycle(const struct trb *trb)
+{
+    return le32_to_cpu(trb->ctrl) & TRB_CYCLE_MASK;
+}
+
+static inline int trb_xfer_event_epid(const struct trb *trb)
+{
+    return (le32_to_cpu(trb->ctrl) & TRB_EVENT_EPID_MASK)
+           >> TRB_EVENT_EPID_SHIFT;
+}
+
+static inline int trb_xfer_event_cc(const struct trb *trb)
+{
+    return le32_to_cpu(trb->status) >> TRB_EVENT_CC_SHIFT;
+}
+
+static inline uint64_t trb_xfer_event_ptr(const struct trb *trb)
+{
+    return le64_to_cpu(trb->params);
+}
+
+static inline uint32_t trb_xfer_event_len(const struct trb *trb)
+{
+    return le32_to_cpu(trb->status) & TRB_EVENT_LEN_MASK;
+}
+
+static inline void trb_norm_set_buf(struct trb *trb, uint64_t dma)
+{
+    trb->params = cpu_to_le64(dma);
+}
+
+static inline void trb_norm_set_len(struct trb *trb, uint32_t len)
+{
+    uint32_t status = le32_to_cpu(trb->status);
+
+    status &= ~TRB_EVENT_LEN_MASK;
+    status |= len;
+
+    trb->status = cpu_to_le32(status);
+}
+
+static inline uint64_t trb_norm_buf(const struct trb *trb)
+{
+    return le64_to_cpu(trb->params);
+}
+
+static inline uint32_t trb_norm_len(const struct trb *trb)
+{
+    return le32_to_cpu(trb->status) & TRB_NORM_LEN_MASK;
+}
+
+static inline void trb_norm_set_ioc(struct trb *trb)
+{
+    uint32_t ctrl = le32_to_cpu(trb->ctrl);
+
+    ctrl |= TRB_NORM_IOC_MASK;
+    trb->ctrl = cpu_to_le32(ctrl);
+}
+
+static inline void trb_link_set_toggle_cycle(struct trb *trb)
+{
+    uint32_t ctrl = le32_to_cpu(trb->ctrl);
+
+    ctrl |= TRB_LINK_TOGGLE_CYCLE_MASK;
+    trb->ctrl = cpu_to_le32(ctrl);
+}
+
+static inline void trb_link_set_rsp(struct trb *trb, uint64_t rsp)
+{
+    trb->params = cpu_to_le64(rsp);
+}
+
+static inline bool port_disabled(uint32_t portsc)
+{
+    return (portsc & PORTSC_PED) == 0;
+}
+
+static inline bool port_enabled(uint32_t portsc)
+{
+    return (portsc & PORTSC_PED) != 0;
+}
+
+static inline uint32_t ep_state(const struct dbc_ep_ctx *ctx)
+{
+    return le32_to_cpu(ctx->data0) & EP_STATE_MASK;
+}
+
+static inline uint32_t dbc_max_burst(const struct xhci_dbc *dbc)
+{
+    return (readl(&dbc->dbc_regs->ctrl) & MAX_BURST_MASK)
+           >> MAX_BURST_SHIFT;
+}
diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fixmap.h
index 0db314baeb..35f9b38d97 100644
--- a/xen/include/asm-x86/fixmap.h
+++ b/xen/include/asm-x86/fixmap.h
@@ -43,6 +43,10 @@ enum fixed_addresses {
     FIX_COM_BEGIN,
     FIX_COM_END,
     FIX_EHCI_DBGP,
+#ifdef CONFIG_HAS_XHCI_DBC
+    FIX_XHCI_BASE,
+    FIX_XHCI_END = FIX_XHCI_BASE + CONFIG_XHCI_FIXMAP_PAGES - 1,
+#endif
 #ifdef CONFIG_XEN_GUEST
     FIX_PV_CONSOLE,
     FIX_XEN_SHARED_INFO,
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 6548f0b0a9..85098de590 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -170,7 +170,22 @@ struct ns16550_defaults {
     unsigned long io_base; /* default io_base address */
 };
 void ns16550_init(int index, struct ns16550_defaults *defaults);
+
+#ifdef CONFIG_HAS_EHCI
 void ehci_dbgp_init(void);
+#else
+static inline void ehci_dbgp_init(void)
+{
+}
+#endif
+
+#ifdef CONFIG_HAS_XHCI_DBC
+void xhci_dbc_init(void);
+#else
+static inline void xhci_dbc_init(void)
+{
+}
+#endif
 
 void arm_uart_init(void);
 

base-commit: d4fb5f166c2bfbaf9ba0de69da0d411288f437a9
-- 
2.31.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C55809DC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374928.607140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGB7J-0002kj-Em; Tue, 26 Jul 2022 03:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374928.607140; Tue, 26 Jul 2022 03:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGB7J-0002iJ-B9; Tue, 26 Jul 2022 03:20:17 +0000
Received: by outflank-mailman (input) for mailman id 374928;
 Tue, 26 Jul 2022 03:20:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGB7H-0002i7-2v
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:20:15 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da854759-0c91-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:20:11 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A62D5C00D8;
 Mon, 25 Jul 2022 23:20:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 25 Jul 2022 23:20:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:20:07 -0400 (EDT)
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
X-Inumbo-ID: da854759-0c91-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805609; x=1658892009; bh=rHEDfxRD/a
	8Xy6nGoB/Ufb5Aee8IzVX8gl6KkLM1ayE=; b=wAW4LsScsEW9GwH8cMjG+uZruz
	swQVvOLcmRP432nunHw3PdVzK/JeUdFn/IemDIhi9hK2hAnCXOqXBao7CC7s0sKS
	HVs5OvEKa60wTESaX2isJ6Wpg1jsf71ZFBt5og0hVPtSp7jF9bOE4W86DlaEEvMH
	mifLdxyE5Rfai7w21f3QU7JEfm+zpf4wBsj2Yk9RjPeyfrZo75/QaB4u11JWUP2I
	ymRb2pJVJhFqGDalglsiIEHzUqp2rQz95EjWssVy2SbHOzZtOMvI+rJDICWceXss
	pGeBgAdl4W2zEY7lXMR7EV3+MAg1vMcNKzf8+uO6Lfv6z2qmnImaPOz88BBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805609; x=
	1658892009; bh=rHEDfxRD/a8Xy6nGoB/Ufb5Aee8IzVX8gl6KkLM1ayE=; b=X
	2ZR3MWRXVWuT1Gyp77fS/gPkYCZZY3kHkIKuoiOBCgtZk6RaSRxIX4ehC/L3NMHm
	ptnmoEeG/WQrCxiGOXdAHqe7sStwQmjGZBAwVwW2qyOYPo1HKlClF9jEkz5w7tuD
	R/M5QNd0CURCOWkPiCVCMhasTv1EPj46C1nO3W7rmxITq7WKe4U4sl5zqe8Br/mU
	trHUU2rB+lDdKGN3FdhaZkEQKRvzEGq5Tjc8MJd5HoIPli8FRwDmnXIOv0tJdTtW
	V7b//5x47+YLLEkZQIlIEAQ8IqHenB7B/OxV8+8uvT8PLFmPF5z5Wt6Rgp0NvWZD
	+Awu3VllUrdMfbvkjQdkg==
X-ME-Sender: <xms:aF3fYmdmBaPa-7B5Pudr97BCw0T3l6gpfDEIvToIyO8Avuny9bhqRA>
    <xme:aF3fYgNAN0T3YlTAvbdE1oIopp6kpBVggUO45CjzjDWewk-2H_7HsxkGjoANUSK_m
    J9JbzTQqDN5xg>
X-ME-Received: <xmr:aF3fYnhLLUP2I22a2cz0vq2bueUUlqIvxb4EkrZvReVEQxc6dLA94oYMGTMg2pStP9_xKypuUjV33_TvKiFz1EgKUzBYwIqGYH_jaLYMdLEySPpSKWfg2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeek
    udejueeuudetudffffdtheetteeileekkeefjeeljefhkeelffevueffkeelfeenucffoh
    hmrghinhepghhithhhuhgsrdgtohhmpdhgnhhurdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:aF3fYj9emjMXKU2GkEq0t-SMcxbYytB3CuxuYnczX9bQWeGJv5uY5w>
    <xmx:aF3fYit_vmnaQ8RcEdorSOJ_1OfxeFYohWJyYfEHZvOpkn9iKrn3Yw>
    <xmx:aF3fYqFj5zJ8O8MqMvNdNLqinLW6_S0QhBvLz3qDKLF8ahAZuQIOPQ>
    <xmx:aV3fYv_QTNQKLQ-WDFGU2BLTpZ0L1ZY61SEKfq4yHhWZoXiRhdJy8Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Date: Tue, 26 Jul 2022 05:19:56 +0200
Message-Id: <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Connor Davis <davisc@ainfosec.com>

[Connor]
Xue is a cross-platform USB 3 debugger that drives the Debug
Capability (DbC) of xHCI-compliant host controllers. This patch
implements the operations needed for xue to initialize the host
controller's DbC and communicate with it. It also implements a struct
uart_driver that uses xue as a backend. Note that only target -> host
communication is supported for now. To use Xue as a console, add
'console=dbgp dbgp=xhci' to the command line.

[Marek]
The Xue driver is taken from https://github.com/connojd/xue and heavily
refactored to fit into Xen code base. Major changes include:
- rename to xhci_dbc
- drop support for non-Xen systems
- drop xue_ops abstraction
- use Xen's native helper functions for PCI access
- move all the code to xue.c, drop "inline"
- build for x86 only
- annotate functions with cf_check
- adjust for Xen's code style

At this stage, only the first xHCI is considered. Later patch adds
support for choosing specific one.
The driver is initiallized before memory allocator works, so all the
transfer buffers (about 230KiB of them) are allocated statically and will
use memory even if XUE console is not selected. The driver can be
disabled build time to reclaim this memory.

Signed-off-by: Connor Davis <davisc@ainfosec.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- rename to xhci-dbc
- add empty stub for xhci_dbc_uart_init(), to avoid #ifdef in setup.c
- use PCI_BASE_ADDRESS_MEM_MASK
- make strings init more readable
- avoid infinite extended caps lookup
- size the whole 64bit BAR
- rename CONFIG_HAS_XHCI to CONFIG_XHCI
- use cpu_relax(), drop xue_sys_pause()
- disable memory decoding for the BAR sizing time, and enable it
  explicitly
- drop mmio_size field - it's used only in init_xhc() function
  internally
- use readl()/writel() for accessing MMIO
- add pci_ro_device(), to protect device before later patch(es) add
  other protections
- fix setting dequeue pointer based on events: TRB ring was page
  aligned, not 16-page aligned, so just taking DBC_TRB_RING_MASK bits
  doesn't work; instead, calculate distance from the ring beginning;
  while at it, fix off by one error there; dequeue pointer isn't used
  much yet, but it will be useful for RX handling
- split dbc_ensure_running() out of dbc_flush() - it make dbc_flush()
  more logical, and will make even more sense with RX support added
- make enum names upper case

Changes in v2:
- drop #pragma pack
- fix indentation in Kconfig
- minor style fixes
- use cache_flush()
- mark init functions as __init, and return bool
- fix PCI_SBDF usage, use constants from pci_regs.h
- add command line docs
- allow disabling the driver in menuconfig, to reclaim 2MB allocated
  memory
- guard unused debug functions with #ifdef XUE_DEBUG
---
 docs/misc/xen-command-line.pandoc |    5 +-
 xen/arch/x86/include/asm/fixmap.h |    4 +-
 xen/arch/x86/setup.c              |    1 +-
 xen/drivers/char/Kconfig          |    9 +-
 xen/drivers/char/Makefile         |    1 +-
 xen/drivers/char/xhci-dbc.c       | 1024 ++++++++++++++++++++++++++++++-
 xen/include/xen/serial.h          |    5 +-
 7 files changed, 1049 insertions(+)
 create mode 100644 xen/drivers/char/xhci-dbc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index da18172e50c5..f936283cd187 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -721,10 +721,15 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xhci`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
+Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability (output
+only). XHCI driver will wait indefinitely for the debug host to connect - make
+sure the cable is connected.
+
 ### debug_stack_lines
 > `= <integer>`
 
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 20746afd0a2a..bc39ffe896b1 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -25,6 +25,8 @@
 #include <asm/msi.h>
 #include <acpi/apei.h>
 
+#define MAX_XHCI_PAGES 16
+
 /*
  * Here we define all the compile-time 'special' virtual
  * addresses. The point is to have a constant address at
@@ -43,6 +45,8 @@ enum fixed_addresses {
     FIX_COM_BEGIN,
     FIX_COM_END,
     FIX_EHCI_DBGP,
+    FIX_XHCI_BEGIN,
+    FIX_XHCI_END = FIX_XHCI_BEGIN + MAX_XHCI_PAGES - 1,
 #ifdef CONFIG_XEN_GUEST
     FIX_PV_CONSOLE,
     FIX_XEN_SHARED_INFO,
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f08b07b8dea6..e05189f64997 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -950,6 +950,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     ns16550.irq     = 3;
     ns16550_init(1, &ns16550);
     ehci_dbgp_init();
+    xhci_dbc_uart_init();
     console_init_preirq();
 
     if ( pvh_boot )
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index dec58bc99360..06350c387371 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -84,3 +84,12 @@ config SERIAL_TX_BUFSIZE
 	  the nearest power of 2.
 
 	  Default value is 16384 (16kiB).
+
+config XHCI
+	bool "XHCI DbC UART driver"
+	depends on X86
+	help
+	  This selects the USB based XHCI debug capability to be usable as a UART.
+	  Enabling this option makes Xen use extra ~230KiB memory, even if XHCI UART
+	  is not selected.
+	  If you have an x86 based system with USB3, say Y.
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index 14e67cf072d7..e7e374775d32 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
 obj-$(CONFIG_HAS_OMAP) += omap-uart.o
 obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
+obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
new file mode 100644
index 000000000000..f0e60d1b86aa
--- /dev/null
+++ b/xen/drivers/char/xhci-dbc.c
@@ -0,0 +1,1024 @@
+/*
+ * drivers/char/xhci-dbc.c
+ *
+ * Xen port for the xue debugger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2019 Assured Information Security.
+ */
+
+#include <xen/delay.h>
+#include <xen/mm.h>
+#include <xen/param.h>
+#include <xen/serial.h>
+#include <xen/timer.h>
+#include <xen/types.h>
+#include <asm/fixmap.h>
+#include <asm/io.h>
+#include <asm/string.h>
+#include <asm/system.h>
+
+/* uncomment to have dbc_uart_dump() debug function */
+/* #define DBC_DEBUG 1 */
+
+#define DBC_POLL_INTERVAL 100 /* us */
+
+#define DBC_PAGE_SIZE 4096U
+
+/* Supported xHC PCI configurations */
+#define DBC_XHC_CLASSC 0xC0330U
+
+/* DbC idVendor and idProduct */
+#define DBC_DBC_VENDOR 0x1D6B
+#define DBC_DBC_PRODUCT 0x0010
+#define DBC_DBC_PROTOCOL 0x0000
+
+/* DCCTRL fields */
+#define DBC_CTRL_DCR 0
+#define DBC_CTRL_HOT 2
+#define DBC_CTRL_HIT 3
+#define DBC_CTRL_DRC 4
+#define DBC_CTRL_DCE 31
+
+/* DCPORTSC fields */
+#define DBC_PSC_PED 1
+#define DBC_PSC_CSC 17
+#define DBC_PSC_PRC 21
+#define DBC_PSC_PLC 22
+#define DBC_PSC_CEC 23
+
+#define DBC_PSC_ACK_MASK                                                       \
+    ((1UL << DBC_PSC_CSC) | (1UL << DBC_PSC_PRC) | (1UL << DBC_PSC_PLC) |      \
+     (1UL << DBC_PSC_CEC))
+
+#define dbc_debug(...) printk("dbc debug: " __VA_ARGS__)
+#define dbc_alert(...) printk("dbc alert: " __VA_ARGS__)
+#define dbc_error(...) printk("dbc error: " __VA_ARGS__)
+
+/******************************************************************************
+ * TRB ring (summarized from the manual):
+ *
+ * TRB rings are circular queues of TRBs shared between the xHC and the driver.
+ * Each ring has one producer and one consumer. The DbC has one event
+ * ring and two transfer rings; one IN and one OUT.
+ *
+ * The DbC hardware is the producer on the event ring, and
+ * dbc driver is the consumer. This means that event TRBs are read-only from
+ * the dbc driver.
+ *
+ * OTOH, dbc drive is the producer of transfer TRBs on the two transfer
+ * rings, so dbc driver enqueues transfers, and the hardware dequeues
+ * them. The dequeue pointer of a transfer ring is read by
+ * dbc driver by examining the latest transfer event TRB on the event ring. The
+ * transfer event TRB contains the address of the transfer TRB that generated
+ * the event.
+ *
+ * To make each transfer ring circular, the last TRB must be a link TRB, which
+ * points to the beginning of the next queue. Note that this implementation
+ * does not support multiple segments, so each link TRB points back to the
+ * beginning of its own segment.
+ ******************************************************************************/
+
+/* TRB types */
+enum {
+    XHCI_TRB_NORM = 1,
+    XHCI_TRB_LINK = 6,
+    XHCI_TRB_TFRE = 32,
+    XHCI_TRB_PSCE = 34
+};
+
+/* TRB completion codes */
+enum {
+    XHCI_TRB_CC_SUCCESS = 1,
+    XHCI_TRB_CC_TRB_ERR = 5,
+};
+
+/* DbC endpoint types */
+enum {
+    XHCI_EP_BULK_OUT = 2,
+    XHCI_EP_BULK_IN = 6,
+};
+
+/* DMA/MMIO structures */
+struct xhci_trb {
+    uint64_t params;
+    uint32_t status;
+    uint32_t ctrl;
+};
+
+/* log2(sizeof(struct xhci_trb)) */
+#define XHCI_TRB_SHIFT 4
+
+struct xhci_erst_segment {
+    uint64_t base;
+    uint16_t size;
+    uint8_t rsvdz[6];
+};
+
+/* Arbitrary length, must fit every DBC_STRING_* */
+#define MAX_STRING_LENGTH 16
+
+#define DBC_STRINGS_COUNT 4
+#define DBC_STRING_LANGID "\x09\x04"
+#define DBC_STRING_MANUFACTURER "Xen"
+#define DBC_STRING_PRODUCT "Debug console"
+#define DBC_STRING_SERIAL "0"
+
+#define XHCI_DT_STRING 3
+
+struct xhci_string_descriptor {
+    uint8_t size;
+    uint8_t type;
+    uint16_t string[MAX_STRING_LENGTH];
+};
+
+#define DBC_CTX_SIZE 16
+#define DBC_CTX_BYTES (DBC_CTX_SIZE * 4)
+
+struct xhci_dbc_ctx {
+    union {
+        uint32_t info[DBC_CTX_SIZE];
+        struct {
+            uint64_t string0_ptr;
+            uint64_t manufacturer_ptr;
+            uint64_t product_ptr;
+            uint64_t serial_ptr;
+            uint8_t string0_size;
+            uint8_t manufacturer_size;
+            uint8_t product_size;
+            uint8_t serial_size;
+        };
+    };
+    uint32_t ep_out[DBC_CTX_SIZE];
+    uint32_t ep_in[DBC_CTX_SIZE];
+};
+
+struct dbc_reg {
+    uint32_t id;
+    uint32_t db;
+    uint32_t erstsz;
+    uint32_t rsvdz;
+    uint64_t erstba;
+    uint64_t erdp;
+    uint32_t ctrl;
+    uint32_t st;
+    uint32_t portsc;
+    uint32_t rsvdp;
+    uint64_t cp;
+    uint32_t ddi1;
+    uint32_t ddi2;
+};
+
+#define DBC_TRB_MAX_TFR (DBC_PAGE_SIZE << 4)
+#define DBC_TRB_PER_PAGE (DBC_PAGE_SIZE / sizeof(struct xhci_trb))
+
+/* Defines the size in bytes of TRB rings as 2^DBC_TRB_RING_ORDER * 4096 */
+#ifndef DBC_TRB_RING_ORDER
+#define DBC_TRB_RING_ORDER 4
+#endif
+#define DBC_TRB_RING_CAP (DBC_TRB_PER_PAGE * (1 << DBC_TRB_RING_ORDER))
+#define DBC_TRB_RING_BYTES (DBC_TRB_RING_CAP * sizeof(struct xhci_trb))
+#define DBC_TRB_RING_MASK (DBC_TRB_RING_BYTES - 1U)
+
+struct xhci_trb_ring {
+    struct xhci_trb *trb; /* Array of TRBs */
+    uint32_t enq; /* The offset of the enqueue ptr */
+    uint32_t deq; /* The offset of the dequeue ptr */
+    uint8_t cyc; /* Cycle state toggled on each wrap-around */
+    uint8_t db; /* Doorbell target */
+    uint64_t dma; /* Physical address (for the device) */
+};
+
+#define DBC_DB_OUT 0x0
+#define DBC_DB_IN 0x1
+#define DBC_DB_INVAL 0xFF
+
+/* Defines the size in bytes of work rings as 2^DBC_WORK_RING_ORDER * 4096 */
+#ifndef DBC_WORK_RING_ORDER
+#define DBC_WORK_RING_ORDER 3
+#endif
+#define DBC_WORK_RING_CAP (DBC_PAGE_SIZE * (1 << DBC_WORK_RING_ORDER))
+#define DBC_WORK_RING_BYTES DBC_WORK_RING_CAP
+
+#if DBC_WORK_RING_CAP > DBC_TRB_MAX_TFR
+#error "DBC_WORK_RING_ORDER must be at most 4"
+#endif
+
+struct dbc_work_ring {
+    uint8_t *buf;
+    uint32_t enq;
+    uint32_t deq;
+    uint64_t dma;
+};
+
+struct dbc {
+    struct dbc_reg __iomem *dbc_reg;
+    struct xhci_dbc_ctx *dbc_ctx;
+    struct xhci_erst_segment *dbc_erst;
+    struct xhci_trb_ring dbc_ering;
+    struct xhci_trb_ring dbc_oring;
+    struct xhci_trb_ring dbc_iring;
+    struct dbc_work_ring dbc_owork;
+    struct xhci_string_descriptor *dbc_str;
+
+    pci_sbdf_t sbdf;
+    uint64_t xhc_mmio_phys;
+    uint64_t xhc_dbc_offset;
+    void __iomem *xhc_mmio;
+
+    bool open;
+};
+
+static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
+{
+    size_t i;
+
+    if ( size != MAX_XHCI_PAGES * DBC_PAGE_SIZE )
+        return NULL;
+
+    for ( i = FIX_XHCI_END; i >= FIX_XHCI_BEGIN; i-- )
+    {
+        set_fixmap_nocache(i, phys);
+        phys += DBC_PAGE_SIZE;
+    }
+
+    /*
+     * The fixmap grows downward, so the lowest virt is
+     * at the highest index
+     */
+    return fix_to_virt(FIX_XHCI_END);
+}
+
+static bool __init dbc_init_xhc(struct dbc *dbc)
+{
+    uint32_t bar0;
+    uint64_t bar1;
+    uint64_t bar_size;
+    uint64_t devfn;
+    uint16_t cmd;
+    size_t xhc_mmio_size;
+
+    /*
+     * Search PCI bus 0 for the xHC. All the host controllers supported so far
+     * are part of the chipset and are on bus 0.
+     */
+    for ( devfn = 0; devfn < 256; devfn++ )
+    {
+        pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
+        uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+
+        if ( hdr == 0 || hdr == 0x80 )
+        {
+            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == DBC_XHC_CLASSC )
+            {
+                dbc->sbdf = sbdf;
+                break;
+            }
+        }
+    }
+
+    if ( !dbc->sbdf.sbdf )
+    {
+        dbc_error("Compatible xHC not found on bus 0\n");
+        return false;
+    }
+
+    /* ...we found it, so parse the BAR and map the registers */
+    bar0 = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
+    bar1 = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_1);
+
+    /* IO BARs not allowed; BAR must be 64-bit */
+    if ( (bar0 & PCI_BASE_ADDRESS_SPACE) != PCI_BASE_ADDRESS_SPACE_MEMORY ||
+         (bar0 & PCI_BASE_ADDRESS_MEM_TYPE_MASK) != PCI_BASE_ADDRESS_MEM_TYPE_64 )
+        return false;
+
+    cmd = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
+    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
+
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, 0xFFFFFFFF);
+    bar_size = pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_0);
+    bar_size |= (uint64_t)pci_conf_read32(dbc->sbdf, PCI_BASE_ADDRESS_1) << 32;
+    xhc_mmio_size = ~(bar_size & PCI_BASE_ADDRESS_MEM_MASK) + 1;
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, bar0);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, bar1);
+
+    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
+
+    dbc->xhc_mmio_phys = (bar0 & PCI_BASE_ADDRESS_MEM_MASK) | (bar1 << 32);
+    dbc->xhc_mmio = dbc_sys_map_xhc(dbc->xhc_mmio_phys, xhc_mmio_size);
+
+    if ( dbc->xhc_mmio == NULL )
+        return false;
+
+    if ( (cmd & PCI_COMMAND_MEMORY) == 0 )
+        pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
+
+    return true;
+}
+
+/**
+ * The first register of the debug capability is found by traversing the
+ * host controller's capability list (xcap) until a capability
+ * with ID = 0xA is found. The xHCI capability list begins at address
+ * mmio + (HCCPARAMS1[31:16] << 2).
+ */
+static struct dbc_reg __iomem *xhci_find_dbc(struct dbc *dbc)
+{
+    uint32_t *xcap;
+    uint32_t xcap_val;
+    uint32_t next;
+    uint32_t id = 0;
+    uint8_t *mmio = (uint8_t *)dbc->xhc_mmio;
+    uint32_t *hccp1 = (uint32_t *)(mmio + 0x10);
+    const uint32_t DBC_ID = 0xA;
+    int ttl = 48;
+
+    xcap = (uint32_t *)dbc->xhc_mmio;
+    /*
+     * This is initially an offset to the first capability. All the offsets
+     * (both in HCCP1 and then next capability pointer are dword-based.
+     */
+    next = (readl(hccp1) & 0xFFFF0000) >> 16;
+
+    while ( id != DBC_ID && next && ttl-- )
+    {
+        xcap += next;
+        xcap_val = readl(xcap);
+        id = xcap_val & 0xFF;
+        next = (xcap_val & 0xFF00) >> 8;
+    }
+
+    if ( id != DBC_ID )
+        return NULL;
+
+    dbc->xhc_dbc_offset = (uint64_t)xcap - (uint64_t)mmio;
+    return (struct dbc_reg __iomem *)xcap;
+}
+
+/**
+ * Fields with the same interpretation for every TRB type (section 4.11.1).
+ * These are the fields defined in the TRB template, minus the ENT bit. That
+ * bit is the toggle cycle bit in link TRBs, so it shouldn't be in the
+ * template.
+ */
+static uint32_t xhci_trb_cyc(const struct xhci_trb *trb)
+{
+    return trb->ctrl & 0x1;
+}
+
+static uint32_t xhci_trb_type(const struct xhci_trb *trb)
+{
+    return (trb->ctrl & 0xFC00) >> 10;
+}
+
+static void xhci_trb_set_cyc(struct xhci_trb *trb, uint32_t c)
+{
+    trb->ctrl &= ~0x1U;
+    trb->ctrl |= c;
+}
+
+static void xhci_trb_set_type(struct xhci_trb *trb, uint32_t t)
+{
+    trb->ctrl &= ~0xFC00U;
+    trb->ctrl |= (t << 10);
+}
+
+/* Fields for normal TRBs */
+static void xhci_trb_norm_set_buf(struct xhci_trb *trb, uint64_t addr)
+{
+    trb->params = addr;
+}
+
+static void xhci_trb_norm_set_len(struct xhci_trb *trb, uint32_t len)
+{
+    trb->status &= ~0x1FFFFU;
+    trb->status |= len;
+}
+
+static void xhci_trb_norm_set_ioc(struct xhci_trb *trb)
+{
+    trb->ctrl |= 0x20;
+}
+
+/**
+ * Fields for Transfer Event TRBs (see section 6.4.2.1). Note that event
+ * TRBs are read-only from software
+ */
+static uint64_t xhci_trb_tfre_ptr(const struct xhci_trb *trb)
+{
+    return trb->params;
+}
+
+static uint32_t xhci_trb_tfre_cc(const struct xhci_trb *trb)
+{
+    return trb->status >> 24;
+}
+
+/* Fields for link TRBs (section 6.4.4.1) */
+static void xhci_trb_link_set_rsp(struct xhci_trb *trb, uint64_t rsp)
+{
+    trb->params = rsp;
+}
+
+static void xhci_trb_link_set_tc(struct xhci_trb *trb)
+{
+    trb->ctrl |= 0x2;
+}
+
+static void xhci_trb_ring_init(const struct dbc *dbc,
+                              struct xhci_trb_ring *ring, int producer,
+                              int doorbell)
+{
+    memset(ring->trb, 0, DBC_TRB_RING_CAP * sizeof(ring->trb[0]));
+
+    ring->enq = 0;
+    ring->deq = 0;
+    ring->cyc = 1;
+    ring->db = (uint8_t)doorbell;
+    ring->dma = virt_to_maddr(ring->trb);
+
+    /*
+     * Producer implies transfer ring, so we have to place a
+     * link TRB at the end that points back to trb[0]
+     */
+    if ( producer )
+    {
+        struct xhci_trb *trb = &ring->trb[DBC_TRB_RING_CAP - 1];
+        xhci_trb_set_type(trb, XHCI_TRB_LINK);
+        xhci_trb_link_set_tc(trb);
+        xhci_trb_link_set_rsp(trb, virt_to_maddr(ring->trb));
+    }
+}
+
+static int xhci_trb_ring_full(const struct xhci_trb_ring *ring)
+{
+    return ((ring->enq + 1) & (DBC_TRB_RING_CAP - 1)) == ring->deq;
+}
+
+static int dbc_work_ring_full(const struct dbc_work_ring *ring)
+{
+    return ((ring->enq + 1) & (DBC_WORK_RING_CAP - 1)) == ring->deq;
+}
+
+static uint64_t dbc_work_ring_size(const struct dbc_work_ring *ring)
+{
+    if ( ring->enq >= ring->deq )
+        return ring->enq - ring->deq;
+
+    return DBC_WORK_RING_CAP - ring->deq + ring->enq;
+}
+
+static void dbc_push_trb(struct dbc *dbc, struct xhci_trb_ring *ring,
+                         uint64_t dma, uint64_t len)
+{
+    struct xhci_trb trb;
+
+    if ( ring->enq == DBC_TRB_RING_CAP - 1 )
+    {
+        /*
+         * We have to make sure the xHC processes the link TRB in order
+         * for wrap-around to work properly. We do this by marking the
+         * xHC as owner of the link TRB by setting the TRB's cycle bit
+         * (just like with normal TRBs).
+         */
+        struct xhci_trb *link = &ring->trb[ring->enq];
+        xhci_trb_set_cyc(link, ring->cyc);
+
+        ring->enq = 0;
+        ring->cyc ^= 1;
+    }
+
+    trb.params = 0;
+    trb.status = 0;
+    trb.ctrl = 0;
+
+    xhci_trb_set_type(&trb, XHCI_TRB_NORM);
+    xhci_trb_set_cyc(&trb, ring->cyc);
+
+    xhci_trb_norm_set_buf(&trb, dma);
+    xhci_trb_norm_set_len(&trb, (uint32_t)len);
+    xhci_trb_norm_set_ioc(&trb);
+
+    ring->trb[ring->enq++] = trb;
+    cache_flush(&ring->trb[ring->enq - 1], sizeof(trb));
+}
+
+static int64_t dbc_push_work(struct dbc *dbc, struct dbc_work_ring *ring,
+                             const char *buf, unsigned int len)
+{
+    unsigned int i = 0;
+    unsigned int end, start = ring->enq;
+
+    while ( !dbc_work_ring_full(ring) && i < len )
+    {
+        ring->buf[ring->enq] = buf[i++];
+        ring->enq = (ring->enq + 1) & (DBC_WORK_RING_CAP - 1);
+    }
+
+    end = ring->enq;
+
+    if ( end > start )
+        cache_flush(&ring->buf[start], end - start);
+    else if ( i > 0 )
+    {
+        cache_flush(&ring->buf[start], DBC_WORK_RING_CAP - start);
+        cache_flush(&ring->buf[0], end);
+    }
+
+    return i;
+}
+
+/*
+ * Note that if IN transfer support is added, then this
+ * will need to be changed; it assumes an OUT transfer ring only
+ */
+static void dbc_pop_events(struct dbc *dbc)
+{
+    struct dbc_reg *reg = dbc->dbc_reg;
+    struct xhci_trb_ring *er = &dbc->dbc_ering;
+    struct xhci_trb_ring *tr = &dbc->dbc_oring;
+    struct xhci_trb *event = &er->trb[er->deq];
+    uint64_t erdp = readq(&reg->erdp);
+    uint32_t portsc;
+    uint64_t event_ptr;
+    unsigned int trb_idx;
+
+    BUILD_BUG_ON((1 << XHCI_TRB_SHIFT) != sizeof(struct xhci_trb));
+
+    rmb();
+
+    while ( xhci_trb_cyc(event) == er->cyc )
+    {
+        switch (xhci_trb_type(event))
+        {
+        case XHCI_TRB_TFRE:
+            event_ptr = xhci_trb_tfre_ptr(event);
+            /*
+             * trb_idx is just completed TRB, so set the dequeue ptr one
+             * position further.
+             */
+            if ( event_ptr - tr->dma < DBC_TRB_RING_BYTES )
+            {
+                trb_idx = (event_ptr - tr->dma) >> XHCI_TRB_SHIFT;
+                tr->deq = (trb_idx + 1) & (DBC_TRB_RING_CAP - 1);
+            }
+            else
+                dbc_alert("event: TRB 0x%lx not found in any ring\n",
+                          event_ptr);
+            break;
+        case XHCI_TRB_PSCE:
+            portsc = readl(&reg->portsc);
+            portsc |= DBC_PSC_ACK_MASK & portsc;
+            writel(portsc, &reg->portsc);
+            break;
+        default:
+            break;
+        }
+
+        er->cyc = (er->deq == DBC_TRB_RING_CAP - 1) ? er->cyc ^ 1 : er->cyc;
+        er->deq = (er->deq + 1) & (DBC_TRB_RING_CAP - 1);
+        event = &er->trb[er->deq];
+    }
+
+    erdp = er->dma + (er->deq << XHCI_TRB_SHIFT);
+    wmb();
+    writeq(erdp, &reg->erdp);
+}
+
+/**
+ * dbc_init_ep
+ *
+ * Initializes the endpoint as specified in sections 7.6.3.2 and 7.6.9.2.
+ * Each endpoint is Bulk, so the MaxPStreams, LSA, HID, CErr, FE,
+ * Interval, Mult, and Max ESIT Payload fields are all 0.
+ *
+ * Max packet size: 1024
+ * Max burst size: debug mbs (from dbc_reg->ctrl register)
+ * EP type: 2 for OUT bulk, 6 for IN bulk
+ * TR dequeue ptr: physical base address of transfer ring
+ * Avg TRB length: software defined (see 4.14.1.1 for suggested defaults)
+ */
+static void dbc_init_ep(uint32_t *ep, uint64_t mbs, uint32_t type,
+                        uint64_t ring_dma)
+{
+    memset(ep, 0, DBC_CTX_BYTES);
+
+    ep[1] = (1024 << 16) | ((uint32_t)mbs << 8) | (type << 3);
+    ep[2] = (ring_dma & 0xFFFFFFFF) | 1;
+    ep[3] = ring_dma >> 32;
+    ep[4] = 3 * 1024;
+}
+
+static void dbc_init_string_single(struct xhci_string_descriptor *string,
+                                   char *ascii_str,
+                                   uint64_t *str_ptr,
+                                   uint8_t *str_size_ptr)
+{
+    size_t i, len = strlen(ascii_str);
+
+    string->size = offsetof(typeof(*string), string) + len * 2;
+    string->type = XHCI_DT_STRING;
+    /* ASCII to UTF16 conversion */
+    for (i = 0; i < len; i++)
+        string->string[i] = ascii_str[i];
+    *str_ptr = virt_to_maddr(string);
+    *str_size_ptr = string->size;
+}
+
+/* Initialize the DbC info with USB string descriptor addresses */
+static void dbc_init_strings(struct dbc *dbc, uint32_t *info)
+{
+    BUILD_BUG_ON(sizeof(DBC_STRING_LANGID) > MAX_STRING_LENGTH);
+    BUILD_BUG_ON(sizeof(DBC_STRING_MANUFACTURER) > MAX_STRING_LENGTH);
+    BUILD_BUG_ON(sizeof(DBC_STRING_PRODUCT) > MAX_STRING_LENGTH);
+    BUILD_BUG_ON(sizeof(DBC_STRING_SERIAL) > MAX_STRING_LENGTH);
+
+    dbc_init_string_single(&dbc->dbc_str[0], DBC_STRING_LANGID,
+                           &dbc->dbc_ctx->string0_ptr,
+                           &dbc->dbc_ctx->string0_size);
+    dbc_init_string_single(&dbc->dbc_str[1], DBC_STRING_MANUFACTURER,
+                           &dbc->dbc_ctx->manufacturer_ptr,
+                           &dbc->dbc_ctx->manufacturer_size);
+    dbc_init_string_single(&dbc->dbc_str[2], DBC_STRING_PRODUCT,
+                           &dbc->dbc_ctx->product_ptr,
+                           &dbc->dbc_ctx->product_size);
+    dbc_init_string_single(&dbc->dbc_str[3], DBC_STRING_SERIAL,
+                           &dbc->dbc_ctx->serial_ptr,
+                           &dbc->dbc_ctx->serial_size);
+}
+
+static void dbc_enable_dbc(struct dbc *dbc)
+{
+    struct dbc_reg *reg = dbc->dbc_reg;
+
+    wmb();
+    writel(readl(&reg->ctrl) | (1U << DBC_CTRL_DCE), &reg->ctrl);
+    wmb();
+
+    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCE)) == 0 )
+        cpu_relax();
+
+    wmb();
+    writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
+    wmb();
+
+    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
+        cpu_relax();
+}
+
+static void dbc_disable_dbc(struct dbc *dbc)
+{
+    struct dbc_reg *reg = dbc->dbc_reg;
+
+    writel(readl(&reg->portsc) & ~(1U << DBC_PSC_PED), &reg->portsc);
+    wmb();
+    writel(readl(&reg->ctrl) & ~(1U << DBC_CTRL_DCE), &reg->ctrl);
+
+    while ( readl(&reg->ctrl) & (1U << DBC_CTRL_DCE) )
+        cpu_relax();
+}
+
+static int dbc_init_dbc(struct dbc *dbc)
+{
+    uint64_t erdp = 0;
+    uint64_t mbs = 0;
+    uint16_t cmd;
+    struct dbc_reg *reg = xhci_find_dbc(dbc);
+
+    if ( !reg )
+        return 0;
+
+    dbc->dbc_reg = reg;
+    dbc_disable_dbc(dbc);
+
+    xhci_trb_ring_init(dbc, &dbc->dbc_ering, 0, DBC_DB_INVAL);
+    xhci_trb_ring_init(dbc, &dbc->dbc_oring, 1, DBC_DB_OUT);
+    xhci_trb_ring_init(dbc, &dbc->dbc_iring, 1, DBC_DB_IN);
+
+    erdp = virt_to_maddr(dbc->dbc_ering.trb);
+    if ( !erdp )
+        return 0;
+
+    memset(dbc->dbc_erst, 0, sizeof(*dbc->dbc_erst));
+    dbc->dbc_erst->base = erdp;
+    dbc->dbc_erst->size = DBC_TRB_RING_CAP;
+
+    mbs = (readl(&reg->ctrl) & 0xFF0000) >> 16;
+
+    memset(dbc->dbc_ctx, 0, sizeof(*dbc->dbc_ctx));
+    dbc_init_strings(dbc, dbc->dbc_ctx->info);
+    dbc_init_ep(dbc->dbc_ctx->ep_out, mbs, XHCI_EP_BULK_OUT,
+                dbc->dbc_oring.dma);
+    dbc_init_ep(dbc->dbc_ctx->ep_in, mbs, XHCI_EP_BULK_IN,
+                dbc->dbc_iring.dma);
+
+    writel(1, &reg->erstsz);
+    writeq(virt_to_maddr(dbc->dbc_erst), &reg->erstba);
+    writeq(erdp, &reg->erdp);
+    writeq(virt_to_maddr(dbc->dbc_ctx), &reg->cp);
+    writel((DBC_DBC_VENDOR << 16) | DBC_DBC_PROTOCOL, &reg->ddi1);
+    writel(DBC_DBC_PRODUCT, &reg->ddi2);
+
+    cache_flush(dbc->dbc_ctx, sizeof(*dbc->dbc_ctx));
+    cache_flush(dbc->dbc_erst, sizeof(*dbc->dbc_erst));
+    cache_flush(dbc->dbc_ering.trb, DBC_TRB_RING_BYTES);
+    cache_flush(dbc->dbc_oring.trb, DBC_TRB_RING_BYTES);
+    cache_flush(dbc->dbc_iring.trb, DBC_TRB_RING_BYTES);
+    cache_flush(dbc->dbc_owork.buf, DBC_WORK_RING_BYTES);
+
+    cmd = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
+    pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd | PCI_COMMAND_MASTER);
+
+    return 1;
+}
+
+static void dbc_init_work_ring(struct dbc *dbc,
+                               struct dbc_work_ring *wrk)
+{
+    wrk->enq = 0;
+    wrk->deq = 0;
+    wrk->dma = virt_to_maddr(wrk->buf);
+}
+
+/**
+ * Initialize the DbC and enable it for transfers. First map in the DbC
+ * registers from the host controller's MMIO region. Then allocate and map
+ * DMA for the event and transfer rings. Finally, enable the DbC for
+ * the host to enumerate. On success, the DbC is ready to send packets.
+ *
+ * @param dbc the dbc to open (!= NULL)
+ * @return true iff dbc_open succeeded
+ */
+static bool __init dbc_open(struct dbc *dbc)
+{
+    if ( !dbc )
+        return false;
+
+    if ( !dbc_init_xhc(dbc) )
+        return false;
+
+    if ( !dbc_init_dbc(dbc) )
+        return false;
+
+    dbc_init_work_ring(dbc, &dbc->dbc_owork);
+    dbc_enable_dbc(dbc);
+    dbc->open = true;
+
+    return true;
+}
+
+/*
+ * Ensure DbC is still running, handle events, and possibly re-enable if cable
+ * was re-plugged. Returns true if DbC is operational.
+ */
+static bool dbc_ensure_running(struct dbc *dbc)
+{
+    struct dbc_reg *reg = dbc->dbc_reg;
+    uint32_t ctrl;
+    uint32_t cmd;
+
+    dbc_pop_events(dbc);
+
+    ctrl = readl(&reg->ctrl);
+    if ( !(ctrl & (1U << DBC_CTRL_DCR)) )
+    {
+        return false;
+    }
+
+    if ( ctrl & (1U << DBC_CTRL_DRC) )
+    {
+        writel(ctrl | (1U << DBC_CTRL_DRC), &reg->ctrl);
+        writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
+        wmb();
+    }
+
+    return true;
+}
+
+/**
+ * Commit the pending transfer TRBs to the DbC. This notifies
+ * the DbC of any previously-queued data on the work ring and
+ * rings the doorbell.
+ *
+ * @param dbc the dbc to flush
+ * @param trb the ring containing the TRBs to transfer
+ * @param wrk the work ring containing data to be flushed
+ */
+static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
+                      struct dbc_work_ring *wrk)
+{
+    struct dbc_reg *reg = dbc->dbc_reg;
+    uint32_t db = (readl(&reg->db) & 0xFFFF00FF) | (trb->db << 8);
+
+    if ( xhci_trb_ring_full(trb) )
+        return;
+
+    if ( wrk->enq == wrk->deq )
+        return;
+    else if ( wrk->enq > wrk->deq )
+    {
+        dbc_push_trb(dbc, trb, wrk->dma + wrk->deq, wrk->enq - wrk->deq);
+        wrk->deq = wrk->enq;
+    }
+    else
+    {
+        dbc_push_trb(dbc, trb, wrk->dma + wrk->deq,
+                     DBC_WORK_RING_CAP - wrk->deq);
+        wrk->deq = 0;
+        if ( wrk->enq > 0 && !xhci_trb_ring_full(trb) )
+        {
+            dbc_push_trb(dbc, trb, wrk->dma, wrk->enq);
+            wrk->deq = wrk->enq;
+        }
+    }
+
+    wmb();
+    writel(db, &reg->db);
+}
+
+/**
+ * Queue a single character to the DbC. A transfer TRB will be created
+ * if the character is a newline and the DbC will be notified that data is
+ * available for writing to the debug host.
+ *
+ * @param dbc the dbc to write to
+ * @param c the character to write
+ * @return the number of bytes written
+ */
+static int64_t dbc_putc(struct dbc *dbc, char c)
+{
+    if ( !dbc_push_work(dbc, &dbc->dbc_owork, &c, 1) )
+        return 0;
+
+    if ( !dbc_ensure_running(dbc) )
+        return 1;
+
+    if ( c == '\n' )
+        dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
+
+    return 1;
+}
+
+struct dbc_uart {
+    struct dbc dbc;
+    struct timer timer;
+    spinlock_t *lock;
+};
+
+static struct dbc_uart dbc_uart;
+
+static void cf_check dbc_uart_poll(void *data)
+{
+    struct serial_port *port = data;
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+    unsigned long flags = 0;
+
+    if ( spin_trylock_irqsave(&port->tx_lock, flags) )
+    {
+        if ( dbc_ensure_running(dbc) )
+        {
+            dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
+            dbc_enqueue_in(dbc, &dbc->dbc_iring, &dbc->dbc_iwork);
+        }
+        spin_unlock_irqrestore(&port->tx_lock, flags);
+    }
+
+    serial_tx_interrupt(port, guest_cpu_user_regs());
+    set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
+}
+
+static void __init cf_check dbc_uart_init_preirq(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    uart->lock = &port->tx_lock;
+}
+
+static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+
+    serial_async_transmit(port);
+    init_timer(&uart->timer, dbc_uart_poll, port, 0);
+    set_timer(&uart->timer, NOW() + MILLISECS(1));
+
+    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
+        printk(XENLOG_WARNING
+               "Failed to mark read-only %pp used for XHCI console\n",
+               &uart->dbc.sbdf);
+}
+
+static int cf_check dbc_uart_tx_ready(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    return DBC_WORK_RING_CAP - dbc_work_ring_size(&dbc->dbc_owork);
+}
+
+static void cf_check dbc_uart_putc(struct serial_port *port, char c)
+{
+    struct dbc_uart *uart = port->uart;
+    dbc_putc(&uart->dbc, c);
+}
+
+static void cf_check dbc_uart_flush(struct serial_port *port)
+{
+    s_time_t goal;
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    if ( dbc_ensure_running(dbc) )
+        dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
+
+    goal = NOW() + MICROSECS(DBC_POLL_INTERVAL);
+    if ( uart->timer.expires > goal )
+        set_timer(&uart->timer, goal);
+}
+
+static struct uart_driver dbc_uart_driver = {
+    .init_preirq = dbc_uart_init_preirq,
+    .init_postirq = dbc_uart_init_postirq,
+    .tx_ready = dbc_uart_tx_ready,
+    .putc = dbc_uart_putc,
+    .flush = dbc_uart_flush,
+};
+
+static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
+static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
+static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
+static struct xhci_erst_segment erst __aligned(64);
+static struct xhci_dbc_ctx ctx __aligned(64);
+static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
+static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
+static char __initdata opt_dbgp[30];
+
+string_param("dbgp", opt_dbgp);
+
+void __init xhci_dbc_uart_init(void)
+{
+    struct dbc_uart *uart = &dbc_uart;
+    struct dbc *dbc = &uart->dbc;
+
+    if ( strncmp(opt_dbgp, "xhci", 4) )
+        return;
+
+    memset(dbc, 0, sizeof(*dbc));
+
+    dbc->dbc_ctx = &ctx;
+    dbc->dbc_erst = &erst;
+    dbc->dbc_ering.trb = evt_trb;
+    dbc->dbc_oring.trb = out_trb;
+    dbc->dbc_iring.trb = in_trb;
+    dbc->dbc_owork.buf = out_wrk_buf;
+    dbc->dbc_str = str_buf;
+
+    if ( dbc_open(dbc) )
+        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
+}
+
+#ifdef DBC_DEBUG
+static void dbc_dump(struct dbc *dbc)
+{
+    struct dbc_reg *r = dbc->dbc_reg;
+
+    dbc_debug("XHCI DBC DUMP:\n");
+    dbc_debug("    ctrl: 0x%x stat: 0x%x psc: 0x%x\n",
+              readl(&r->ctrl), readl(&r->st), readl(&r->portsc));
+    dbc_debug("    id: 0x%x, db: 0x%x\n",
+              readl(&r->id), readl(&r->db));
+    dbc_debug("    erstsz: %u, erstba: 0x%lx\n",
+              readl(&r->erstsz), readq(&r->erstba));
+    dbc_debug("    erdp: 0x%lx, cp: 0x%lx\n",
+              readq(&r->erdp), readq(&r->cp));
+    dbc_debug("    ddi1: 0x%x, ddi2: 0x%x\n",
+              readl(&r->ddi1), readl(&r->ddi2));
+    dbc_debug("    erstba == virt_to_dma(erst): %d\n",
+              readq(&r->erstba) == virt_to_maddr(dbc->dbc_erst));
+    dbc_debug("    erdp == virt_to_dma(erst[0].base): %d\n",
+              readq(&r->erdp) == dbc->dbc_erst[0].base);
+    dbc_debug("    cp == virt_to_dma(ctx): %d\n",
+              readq(&r->cp) == virt_to_maddr(dbc->dbc_ctx));
+}
+
+static void dbc_uart_dump(void)
+{
+    struct dbc_uart *uart = &dbc_uart;
+    struct dbc *dbc = &uart->dbc;
+
+    dbc_dump(dbc);
+}
+#endif
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 6548f0b0a9cf..181e026967bc 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -171,6 +171,11 @@ struct ns16550_defaults {
 };
 void ns16550_init(int index, struct ns16550_defaults *defaults);
 void ehci_dbgp_init(void);
+#ifdef CONFIG_XHCI
+void xhci_dbc_uart_init(void);
+#else
+static void inline xhci_dbc_uart_init(void) {};
+#endif
 
 void arm_uart_init(void);
 
-- 
git-series 0.9.1


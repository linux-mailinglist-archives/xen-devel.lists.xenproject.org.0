Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A4540169
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343347.568687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEo-0006a2-Cx; Tue, 07 Jun 2022 14:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343347.568687; Tue, 07 Jun 2022 14:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEo-0006Xa-7w; Tue, 07 Jun 2022 14:31:18 +0000
Received: by outflank-mailman (input) for mailman id 343347;
 Tue, 07 Jun 2022 14:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEm-00061K-Er
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:16 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac4aee9-e66e-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:31:12 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 115835C01B2;
 Tue,  7 Jun 2022 10:31:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 Jun 2022 10:31:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:10 -0400 (EDT)
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
X-Inumbo-ID: 7ac4aee9-e66e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612272; x=1654698672; bh=Z7Lr0j0M2K
	aSvcNr1cRj7+FQLB0GDunqIgj6YEaiVuo=; b=QMbE85kSJ2KvhvxcyHDARQoyz7
	ss3tdAXA6hhXhNY5rR01dfLXxLe8d0c4cdWskt5OrXN8KswNxKKwijkv+32BtP84
	nNv64e+cu8rBlsOg3PjNH2UvfxK//wGv3fCXdvvr01m93bcS4UEUEDhchdaCib7N
	XWhSe6EhBfMYJnOycAp33d24H3v67YUA4ti3w5RHvMME7Th9DGmXJmpZiqBW714H
	J/MawPI1Wl63DpSnmcyhUPlEelgnK+EWRykBSEK4eqEhcdVDD5wWetOusgDZhBh8
	SeS9mc+1Owm9/DAceXupmUoDJLPntN/d5SJoGXIsF1NPZ8skU7OCSUm5kp5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612272; x=
	1654698672; bh=Z7Lr0j0M2KaSvcNr1cRj7+FQLB0GDunqIgj6YEaiVuo=; b=W
	cnEKzUcDZSkoZc7lWP7fzxcKOMq8LLrQxv/gz5SVITEkBIcKcLrEp49bgAi9U7QC
	JEDyFC4/HS7K83/OZJyU/viGV2+w4oqCaX5WnKfqiimSvpcf1AlDfmdhRu3Idou9
	zxRgeoPsYTcVP3M/VUIIutFVivaWHWzHDnEIhGY6vWnLNOFYoPtuu6DfLvuRrQKy
	XlrP6UcmqLlgx16YvRsfY7WXQOaTE6V6aNdCIIQ3vmY2DP1DJakEgQh1dNT9qR8+
	n3jQkwOJGi9nVFk6KQIVQuDhsYAgckXcuvhTHNWQ5DIitXGzRqpOJOFIJXxxlKs6
	OAxYwWr+kObgJqW8BgxFg==
X-ME-Sender: <xms:L2GfYoQ_g3ghj2SiokYyzf8idYmuuaR531c5w0yrQ5sAPuX0u1NklA>
    <xme:L2GfYly_mIiaZDyABWWeso_tZLZbR41jwP7cAirt9QQKXJZU0AWzEOgKp6eZ1vNX4
    FD9LMT7n2mL9g>
X-ME-Received: <xmr:L2GfYl16Jo0W6LyPZNqpPPccYFSGbxEBvVlMeI0UERFFJZToC6_xcDtoeR0f3wc-Gx7l7cpqAqiug07_oc-svGDQvpNER1jra5RXjCu0E-EYnOFR2lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeek
    udejueeuudetudffffdtheetteeileekkeefjeeljefhkeelffevueffkeelfeenucffoh
    hmrghinhepghhithhhuhgsrdgtohhmpdhgnhhurdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:L2GfYsAT8WN8-047dna1FXCce8uBHEmyfv6-LjOIuVtXgzv2UfcOXQ>
    <xmx:L2GfYhitpxY_BsPw15DOAy9niR39dsIeqeT8h9G9c-FmKkyj7RPxEQ>
    <xmx:L2GfYorf7i3FRO3hrFGHUlMdKGCAI0-tRppIPf6Br127j5F4sjJRSg>
    <xmx:MGGfYpjYYAjijg1wzh3abvcVoSsenGd-sb3l8Vtg0EAtpLU-cfgpag>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Connor Davis <davisc@ainfosec.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 01/10] drivers/char: Add support for Xue USB3 debugger
Date: Tue,  7 Jun 2022 16:30:07 +0200
Message-Id: <87c73737fe8ec6d9fe31c844b72b6c979b90c25d.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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
'console=dbgp dbgp=xue' to the command line.

[Marek]
The Xue driver is taken from https://github.com/connojd/xue and heavily
refactored to fit into Xen code base. Major changes include:
- drop support for non-Xen systems
- drop xue_ops abstraction
- use Xen's native helper functions for PCI access
- move all the code to xue.c, drop "inline"
- build for x86 only
- annotate functions with cf_check
- adjust for Xen's code style

Signed-off-by: Connor Davis <davisc@ainfosec.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/Kconfig              |   1 +-
 xen/arch/x86/include/asm/fixmap.h |   4 +-
 xen/arch/x86/setup.c              |   1 +-
 xen/drivers/char/Kconfig          |   7 +-
 xen/drivers/char/Makefile         |   1 +-
 xen/drivers/char/xue.c            | 957 +++++++++++++++++++++++++++++++-
 xen/include/xen/serial.h          |   1 +-
 7 files changed, 972 insertions(+)
 create mode 100644 xen/drivers/char/xue.c

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 06d6fbc86478..9260f464d478 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -13,6 +13,7 @@ config X86
 	select HAS_COMPAT
 	select HAS_CPUFREQ
 	select HAS_EHCI
+	select HAS_XHCI
 	select HAS_EX_TABLE
 	select HAS_FAST_MULTIPLY
 	select HAS_IOPORTS
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
index 53a73010e029..801081befa78 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -946,6 +946,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
     ns16550.irq     = 3;
     ns16550_init(1, &ns16550);
     ehci_dbgp_init();
+    xue_uart_init();
     console_init_preirq();
 
     if ( pvh_boot )
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e5f7b1d8eb8a..55d35af960e5 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -74,3 +74,10 @@ config HAS_EHCI
 	help
 	  This selects the USB based EHCI debug port to be used as a UART. If
 	  you have an x86 based system with USB, say Y.
+
+config HAS_XHCI
+	bool
+	depends on X86
+	help
+      This selects the USB based XHCI debug capability to be used as a UART. If
+      you have an x86 based system with USB3, say Y.
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index 14e67cf072d7..bda1e44d3f39 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
 obj-$(CONFIG_HAS_OMAP) += omap-uart.o
 obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
+obj-$(CONFIG_HAS_XHCI) += xue.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
new file mode 100644
index 000000000000..e95dd09d39a8
--- /dev/null
+++ b/xen/drivers/char/xue.c
@@ -0,0 +1,957 @@
+/*
+ * drivers/char/xue.c
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
+#include <xen/types.h>
+#include <asm/string.h>
+#include <asm/system.h>
+#include <xen/serial.h>
+#include <xen/timer.h>
+#include <xen/param.h>
+#include <asm/fixmap.h>
+#include <asm/io.h>
+#include <xen/mm.h>
+
+#define XUE_POLL_INTERVAL 100 /* us */
+
+#define XUE_PAGE_SIZE 4096ULL
+
+/* Supported xHC PCI configurations */
+#define XUE_XHC_CLASSC 0xC0330ULL
+
+/* DbC idVendor and idProduct */
+#define XUE_DBC_VENDOR 0x1D6B
+#define XUE_DBC_PRODUCT 0x0010
+#define XUE_DBC_PROTOCOL 0x0000
+
+/* DCCTRL fields */
+#define XUE_CTRL_DCR 0
+#define XUE_CTRL_HOT 2
+#define XUE_CTRL_HIT 3
+#define XUE_CTRL_DRC 4
+#define XUE_CTRL_DCE 31
+
+/* DCPORTSC fields */
+#define XUE_PSC_PED 1
+#define XUE_PSC_CSC 17
+#define XUE_PSC_PRC 21
+#define XUE_PSC_PLC 22
+#define XUE_PSC_CEC 23
+
+#define XUE_PSC_ACK_MASK                                                       \
+    ((1UL << XUE_PSC_CSC) | (1UL << XUE_PSC_PRC) | (1UL << XUE_PSC_PLC) |      \
+     (1UL << XUE_PSC_CEC))
+
+#define xue_debug(...) printk("xue debug: " __VA_ARGS__)
+#define xue_alert(...) printk("xue alert: " __VA_ARGS__)
+#define xue_error(...) printk("xue error: " __VA_ARGS__)
+
+/******************************************************************************
+ * TRB ring (summarized from the manual):
+ *
+ * TRB rings are circular queues of TRBs shared between the xHC and the driver.
+ * Each ring has one producer and one consumer. The DbC has one event
+ * ring and two transfer rings; one IN and one OUT.
+ *
+ * The DbC hardware is the producer on the event ring, and
+ * xue is the consumer. This means that event TRBs are read-only from
+ * the xue.
+ *
+ * OTOH, xue is the producer of transfer TRBs on the two transfer
+ * rings, so xue enqueues transfers, and the hardware dequeues
+ * them. The dequeue pointer of a transfer ring is read by
+ * xue by examining the latest transfer event TRB on the event ring. The
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
+    xue_trb_norm = 1,
+    xue_trb_link = 6,
+    xue_trb_tfre = 32,
+    xue_trb_psce = 34
+};
+
+/* TRB completion codes */
+enum { xue_trb_cc_success = 1, xue_trb_cc_trb_err = 5 };
+
+/* DbC endpoint types */
+enum { xue_ep_bulk_out = 2, xue_ep_bulk_in = 6 };
+
+/* DMA/MMIO structures */
+#pragma pack(push, 1)
+struct xue_trb {
+    uint64_t params;
+    uint32_t status;
+    uint32_t ctrl;
+};
+
+struct xue_erst_segment {
+    uint64_t base;
+    uint16_t size;
+    uint8_t rsvdz[6];
+};
+
+#define XUE_CTX_SIZE 16
+#define XUE_CTX_BYTES (XUE_CTX_SIZE * 4)
+
+struct xue_dbc_ctx {
+    uint32_t info[XUE_CTX_SIZE];
+    uint32_t ep_out[XUE_CTX_SIZE];
+    uint32_t ep_in[XUE_CTX_SIZE];
+};
+
+struct xue_dbc_reg {
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
+#pragma pack(pop)
+
+#define XUE_TRB_MAX_TFR (XUE_PAGE_SIZE << 4)
+#define XUE_TRB_PER_PAGE (XUE_PAGE_SIZE / sizeof(struct xue_trb))
+
+/* Defines the size in bytes of TRB rings as 2^XUE_TRB_RING_ORDER * 4096 */
+#ifndef XUE_TRB_RING_ORDER
+#define XUE_TRB_RING_ORDER 4
+#endif
+#define XUE_TRB_RING_CAP (XUE_TRB_PER_PAGE * (1ULL << XUE_TRB_RING_ORDER))
+#define XUE_TRB_RING_BYTES (XUE_TRB_RING_CAP * sizeof(struct xue_trb))
+#define XUE_TRB_RING_MASK (XUE_TRB_RING_BYTES - 1U)
+
+struct xue_trb_ring {
+    struct xue_trb *trb; /* Array of TRBs */
+    uint32_t enq; /* The offset of the enqueue ptr */
+    uint32_t deq; /* The offset of the dequeue ptr */
+    uint8_t cyc; /* Cycle state toggled on each wrap-around */
+    uint8_t db; /* Doorbell target */
+};
+
+#define XUE_DB_OUT 0x0
+#define XUE_DB_IN 0x1
+#define XUE_DB_INVAL 0xFF
+
+/* Defines the size in bytes of work rings as 2^XUE_WORK_RING_ORDER * 4096 */
+#ifndef XUE_WORK_RING_ORDER
+#define XUE_WORK_RING_ORDER 3
+#endif
+#define XUE_WORK_RING_CAP (XUE_PAGE_SIZE * (1ULL << XUE_WORK_RING_ORDER))
+#define XUE_WORK_RING_BYTES XUE_WORK_RING_CAP
+
+#if XUE_WORK_RING_CAP > XUE_TRB_MAX_TFR
+#error "XUE_WORK_RING_ORDER must be at most 4"
+#endif
+
+struct xue_work_ring {
+    uint8_t *buf;
+    uint32_t enq;
+    uint32_t deq;
+    uint64_t dma;
+};
+
+struct xue {
+    struct xue_dbc_reg *dbc_reg;
+    struct xue_dbc_ctx *dbc_ctx;
+    struct xue_erst_segment *dbc_erst;
+    struct xue_trb_ring dbc_ering;
+    struct xue_trb_ring dbc_oring;
+    struct xue_trb_ring dbc_iring;
+    struct xue_work_ring dbc_owork;
+    char *dbc_str;
+
+    pci_sbdf_t sbdf;
+    uint64_t xhc_mmio_phys;
+    uint64_t xhc_mmio_size;
+    uint64_t xhc_dbc_offset;
+    void *xhc_mmio;
+
+    int open;
+};
+
+static void xue_sys_pause(void)
+{
+    __asm volatile("pause" ::: "memory");
+}
+
+static void *xue_sys_map_xhc(uint64_t phys, uint64_t size)
+{
+    size_t i;
+
+    if ( size != MAX_XHCI_PAGES * XUE_PAGE_SIZE )
+        return NULL;
+
+    for ( i = FIX_XHCI_END; i >= FIX_XHCI_BEGIN; i-- )
+    {
+        set_fixmap_nocache(i, phys);
+        phys += XUE_PAGE_SIZE;
+    }
+
+    /*
+     * The fixmap grows downward, so the lowest virt is
+     * at the highest index
+     */
+    return fix_to_virt(FIX_XHCI_END);
+}
+
+static void xue_flush_range(struct xue *xue, void *ptr, uint32_t bytes)
+{
+    uint32_t i;
+
+    const uint32_t clshft = 6;
+    const uint32_t clsize = (1UL << clshft);
+    const uint32_t clmask = clsize - 1;
+
+    uint32_t lines = (bytes >> clshft);
+    lines += (bytes & clmask) != 0;
+
+    for ( i = 0; i < lines; i++ )
+        clflush((void *)((uint64_t)ptr + (i * clsize)));
+}
+
+static int xue_init_xhc(struct xue *xue)
+{
+    uint32_t bar0;
+    uint64_t bar1;
+    uint64_t devfn;
+
+    /*
+     * Search PCI bus 0 for the xHC. All the host controllers supported so far
+     * are part of the chipset and are on bus 0.
+     */
+    for ( devfn = 0; devfn < 256; devfn++ ) {
+        uint32_t dev = (devfn & 0xF8) >> 3;
+        uint32_t fun = devfn & 0x07;
+        pci_sbdf_t sbdf = PCI_SBDF(0, dev, fun);
+        uint32_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
+
+        if ( hdr == 0 || hdr == 0x80 )
+        {
+            if ( (pci_conf_read32(sbdf, PCI_CLASS_REVISION) >> 8) == XUE_XHC_CLASSC )
+            {
+                xue->sbdf = sbdf;
+                break;
+            }
+        }
+    }
+
+    if ( !xue->sbdf.sbdf )
+    {
+        xue_error("Compatible xHC not found on bus 0\n");
+        return 0;
+    }
+
+    /* ...we found it, so parse the BAR and map the registers */
+    bar0 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0);
+    bar1 = pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_1);
+
+    /* IO BARs not allowed; BAR must be 64-bit */
+    if ( (bar0 & 0x1) != 0 || ((bar0 & 0x6) >> 1) != 2 )
+        return 0;
+
+    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, 0xFFFFFFFF);
+    xue->xhc_mmio_size = ~(pci_conf_read32(xue->sbdf, PCI_BASE_ADDRESS_0) & 0xFFFFFFF0) + 1;
+    pci_conf_write32(xue->sbdf, PCI_BASE_ADDRESS_0, bar0);
+
+    xue->xhc_mmio_phys = (bar0 & 0xFFFFFFF0) | (bar1 << 32);
+    xue->xhc_mmio = xue_sys_map_xhc(xue->xhc_mmio_phys, xue->xhc_mmio_size);
+
+    return xue->xhc_mmio != NULL;
+}
+
+/**
+ * The first register of the debug capability is found by traversing the
+ * host controller's capability list (xcap) until a capability
+ * with ID = 0xA is found. The xHCI capability list begins at address
+ * mmio + (HCCPARAMS1[31:16] << 2)
+ */
+static struct xue_dbc_reg *xue_find_dbc(struct xue *xue)
+{
+    uint32_t *xcap;
+    uint32_t next;
+    uint32_t id;
+    uint8_t *mmio = (uint8_t *)xue->xhc_mmio;
+    uint32_t *hccp1 = (uint32_t *)(mmio + 0x10);
+    const uint32_t DBC_ID = 0xA;
+
+    /**
+     * Paranoid check against a zero value. The spec mandates that
+     * at least one "supported protocol" capability must be implemented,
+     * so this should always be false.
+     */
+    if ( (*hccp1 & 0xFFFF0000) == 0 )
+        return NULL;
+
+    xcap = (uint32_t *)(mmio + (((*hccp1 & 0xFFFF0000) >> 16) << 2));
+    next = (*xcap & 0xFF00) >> 8;
+    id = *xcap & 0xFF;
+
+    /**
+     * Table 7-1 states that 'next' is relative to
+     * the current value of xcap and is a dword offset.
+     */
+    while ( id != DBC_ID && next ) {
+        xcap += next;
+        id = *xcap & 0xFF;
+        next = (*xcap & 0xFF00) >> 8;
+    }
+
+    if ( id != DBC_ID )
+        return NULL;
+
+    xue->xhc_dbc_offset = (uint64_t)xcap - (uint64_t)mmio;
+    return (struct xue_dbc_reg *)xcap;
+}
+
+/**
+ * Fields with the same interpretation for every TRB type (section 4.11.1).
+ * These are the fields defined in the TRB template, minus the ENT bit. That
+ * bit is the toggle cycle bit in link TRBs, so it shouldn't be in the
+ * template.
+ */
+static uint32_t xue_trb_cyc(const struct xue_trb *trb)
+{
+    return trb->ctrl & 0x1;
+}
+
+static uint32_t xue_trb_type(const struct xue_trb *trb)
+{
+    return (trb->ctrl & 0xFC00) >> 10;
+}
+
+static void xue_trb_set_cyc(struct xue_trb *trb, uint32_t c)
+{
+    trb->ctrl &= ~0x1UL;
+    trb->ctrl |= c;
+}
+
+static void xue_trb_set_type(struct xue_trb *trb, uint32_t t)
+{
+    trb->ctrl &= ~0xFC00UL;
+    trb->ctrl |= (t << 10);
+}
+
+/* Fields for normal TRBs */
+static void xue_trb_norm_set_buf(struct xue_trb *trb, uint64_t addr)
+{
+    trb->params = addr;
+}
+
+static void xue_trb_norm_set_len(struct xue_trb *trb, uint32_t len)
+{
+    trb->status &= ~0x1FFFFUL;
+    trb->status |= len;
+}
+
+static void xue_trb_norm_set_ioc(struct xue_trb *trb)
+{
+    trb->ctrl |= 0x20;
+}
+
+/**
+ * Fields for Transfer Event TRBs (see section 6.4.2.1). Note that event
+ * TRBs are read-only from software
+ */
+static uint64_t xue_trb_tfre_ptr(const struct xue_trb *trb)
+{
+    return trb->params;
+}
+
+static uint32_t xue_trb_tfre_cc(const struct xue_trb *trb)
+{
+    return trb->status >> 24;
+}
+
+/* Fields for link TRBs (section 6.4.4.1) */
+static void xue_trb_link_set_rsp(struct xue_trb *trb, uint64_t rsp)
+{
+    trb->params = rsp;
+}
+
+static void xue_trb_link_set_tc(struct xue_trb *trb)
+{
+    trb->ctrl |= 0x2;
+}
+
+static void xue_trb_ring_init(const struct xue *xue,
+                              struct xue_trb_ring *ring, int producer,
+                              int doorbell)
+{
+    memset(ring->trb, 0, XUE_TRB_RING_CAP * sizeof(ring->trb[0]));
+
+    ring->enq = 0;
+    ring->deq = 0;
+    ring->cyc = 1;
+    ring->db = (uint8_t)doorbell;
+
+    /*
+     * Producer implies transfer ring, so we have to place a
+     * link TRB at the end that points back to trb[0]
+     */
+    if ( producer )
+    {
+        struct xue_trb *trb = &ring->trb[XUE_TRB_RING_CAP - 1];
+        xue_trb_set_type(trb, xue_trb_link);
+        xue_trb_link_set_tc(trb);
+        xue_trb_link_set_rsp(trb, virt_to_maddr(ring->trb));
+    }
+}
+
+static int xue_trb_ring_full(const struct xue_trb_ring *ring)
+{
+    return ((ring->enq + 1) & (XUE_TRB_RING_CAP - 1)) == ring->deq;
+}
+
+static int xue_work_ring_full(const struct xue_work_ring *ring)
+{
+    return ((ring->enq + 1) & (XUE_WORK_RING_CAP - 1)) == ring->deq;
+}
+
+static uint64_t xue_work_ring_size(const struct xue_work_ring *ring)
+{
+    if ( ring->enq >= ring->deq )
+        return ring->enq - ring->deq;
+
+    return XUE_WORK_RING_CAP - ring->deq + ring->enq;
+}
+
+static void xue_push_trb(struct xue *xue, struct xue_trb_ring *ring,
+                         uint64_t dma, uint64_t len)
+{
+    struct xue_trb trb;
+
+    if ( ring->enq == XUE_TRB_RING_CAP - 1 )
+    {
+        /*
+         * We have to make sure the xHC processes the link TRB in order
+         * for wrap-around to work properly. We do this by marking the
+         * xHC as owner of the link TRB by setting the TRB's cycle bit
+         * (just like with normal TRBs).
+         */
+        struct xue_trb *link = &ring->trb[ring->enq];
+        xue_trb_set_cyc(link, ring->cyc);
+
+        ring->enq = 0;
+        ring->cyc ^= 1;
+    }
+
+    trb.params = 0;
+    trb.status = 0;
+    trb.ctrl = 0;
+
+    xue_trb_set_type(&trb, xue_trb_norm);
+    xue_trb_set_cyc(&trb, ring->cyc);
+
+    xue_trb_norm_set_buf(&trb, dma);
+    xue_trb_norm_set_len(&trb, (uint32_t)len);
+    xue_trb_norm_set_ioc(&trb);
+
+    ring->trb[ring->enq++] = trb;
+    xue_flush_range(xue, &ring->trb[ring->enq - 1], sizeof(trb));
+}
+
+static int64_t xue_push_work(struct xue *xue, struct xue_work_ring *ring,
+                             const char *buf, int64_t len)
+{
+    int64_t i = 0;
+    uint32_t start = ring->enq;
+    uint32_t end = 0;
+
+    while ( !xue_work_ring_full(ring) && i < len )
+    {
+        ring->buf[ring->enq] = buf[i++];
+        ring->enq = (ring->enq + 1) & (XUE_WORK_RING_CAP - 1);
+    }
+
+    end = ring->enq;
+
+    if ( end > start )
+        xue_flush_range(xue, &ring->buf[start], end - start);
+    else if ( i > 0 )
+    {
+        xue_flush_range(xue, &ring->buf[start], XUE_WORK_RING_CAP - start);
+        xue_flush_range(xue, &ring->buf[0], end);
+    }
+
+    return i;
+}
+
+/*
+ * Note that if IN transfer support is added, then this
+ * will need to be changed; it assumes an OUT transfer ring only
+ */
+static void xue_pop_events(struct xue *xue)
+{
+    const int trb_shift = 4;
+
+    struct xue_dbc_reg *reg = xue->dbc_reg;
+    struct xue_trb_ring *er = &xue->dbc_ering;
+    struct xue_trb_ring *tr = &xue->dbc_oring;
+    struct xue_trb *event = &er->trb[er->deq];
+    uint64_t erdp = reg->erdp;
+
+    rmb();
+
+    while ( xue_trb_cyc(event) == er->cyc ) {
+        switch (xue_trb_type(event)) {
+        case xue_trb_tfre:
+            if ( xue_trb_tfre_cc(event) != xue_trb_cc_success )
+            {
+                xue_alert("tfre error cc: %u\n", xue_trb_tfre_cc(event));
+                break;
+            }
+            tr->deq =
+                (xue_trb_tfre_ptr(event) & XUE_TRB_RING_MASK) >> trb_shift;
+            break;
+        case xue_trb_psce:
+            reg->portsc |= (XUE_PSC_ACK_MASK & reg->portsc);
+            break;
+        default:
+            break;
+        }
+
+        er->cyc = (er->deq == XUE_TRB_RING_CAP - 1) ? er->cyc ^ 1 : er->cyc;
+        er->deq = (er->deq + 1) & (XUE_TRB_RING_CAP - 1);
+        event = &er->trb[er->deq];
+    }
+
+    erdp &= ~XUE_TRB_RING_MASK;
+    erdp |= (er->deq << trb_shift);
+    wmb();
+    reg->erdp = erdp;
+}
+
+/**
+ * xue_init_ep
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
+static void xue_init_ep(uint32_t *ep, uint64_t mbs, uint32_t type,
+                        uint64_t ring_dma)
+{
+    memset(ep, 0, XUE_CTX_BYTES);
+
+    ep[1] = (1024 << 16) | ((uint32_t)mbs << 8) | (type << 3);
+    ep[2] = (ring_dma & 0xFFFFFFFF) | 1;
+    ep[3] = ring_dma >> 32;
+    ep[4] = 3 * 1024;
+}
+
+/* Initialize the DbC info with USB string descriptor addresses */
+static void xue_init_strings(struct xue *xue, uint32_t *info)
+{
+    uint64_t *sda;
+
+    /* clang-format off */
+    const char strings[] = {
+        6,  3, 9, 0, 4, 0,
+        8,  3, 'A', 0, 'I', 0, 'S', 0,
+        30, 3, 'X', 0, 'u', 0, 'e', 0, ' ', 0,
+               'D', 0, 'b', 0, 'C', 0, ' ', 0,
+               'D', 0, 'e', 0, 'v', 0, 'i', 0, 'c', 0, 'e', 0,
+        4, 3, '0', 0
+    };
+    /* clang-format on */
+
+    memcpy(xue->dbc_str, strings, sizeof(strings));
+
+    sda = (uint64_t *)&info[0];
+    sda[0] = virt_to_maddr(xue->dbc_str);
+    sda[1] = sda[0] + 6;
+    sda[2] = sda[0] + 6 + 8;
+    sda[3] = sda[0] + 6 + 8 + 30;
+    info[8] = (4 << 24) | (30 << 16) | (8 << 8) | 6;
+}
+
+static void xue_dump(struct xue *xue)
+{
+    struct xue_dbc_reg *r = xue->dbc_reg;
+
+    xue_debug("XUE DUMP:\n");
+    xue_debug("    ctrl: 0x%x stat: 0x%x psc: 0x%x\n", r->ctrl, r->st,
+              r->portsc);
+    xue_debug("    id: 0x%x, db: 0x%x\n", r->id, r->db);
+#if defined(__XEN__) || defined(VMM)
+    xue_debug("    erstsz: %u, erstba: 0x%lx\n", r->erstsz, r->erstba);
+    xue_debug("    erdp: 0x%lx, cp: 0x%lx\n", r->erdp, r->cp);
+#else
+    xue_debug("    erstsz: %u, erstba: 0x%llx\n", r->erstsz, r->erstba);
+    xue_debug("    erdp: 0x%llx, cp: 0x%llx\n", r->erdp, r->cp);
+#endif
+    xue_debug("    ddi1: 0x%x, ddi2: 0x%x\n", r->ddi1, r->ddi2);
+    xue_debug("    erstba == virt_to_dma(erst): %d\n",
+              r->erstba == virt_to_maddr(xue->dbc_erst));
+    xue_debug("    erdp == virt_to_dma(erst[0].base): %d\n",
+              r->erdp == xue->dbc_erst[0].base);
+    xue_debug("    cp == virt_to_dma(ctx): %d\n",
+              r->cp == virt_to_maddr(xue->dbc_ctx));
+}
+
+static void xue_enable_dbc(struct xue *xue)
+{
+    struct xue_dbc_reg *reg = xue->dbc_reg;
+
+    wmb();
+    reg->ctrl |= (1UL << XUE_CTRL_DCE);
+    wmb();
+
+    while ( (reg->ctrl & (1UL << XUE_CTRL_DCE)) == 0 )
+        xue_sys_pause();
+
+    wmb();
+    reg->portsc |= (1UL << XUE_PSC_PED);
+    wmb();
+
+    while ( (reg->ctrl & (1UL << XUE_CTRL_DCR)) == 0 )
+        xue_sys_pause();
+}
+
+static void xue_disable_dbc(struct xue *xue)
+{
+    struct xue_dbc_reg *reg = xue->dbc_reg;
+
+    reg->portsc &= ~(1UL << XUE_PSC_PED);
+    wmb();
+    reg->ctrl &= ~(1UL << XUE_CTRL_DCE);
+
+    while ( reg->ctrl & (1UL << XUE_CTRL_DCE) )
+        xue_sys_pause();
+}
+
+static int xue_init_dbc(struct xue *xue)
+{
+    uint64_t erdp = 0;
+    uint64_t out = 0;
+    uint64_t in = 0;
+    uint64_t mbs = 0;
+    struct xue_dbc_reg *reg = xue_find_dbc(xue);
+
+    if ( !reg )
+        return 0;
+
+    xue->dbc_reg = reg;
+    xue_disable_dbc(xue);
+
+    xue_trb_ring_init(xue, &xue->dbc_ering, 0, XUE_DB_INVAL);
+    xue_trb_ring_init(xue, &xue->dbc_oring, 1, XUE_DB_OUT);
+    xue_trb_ring_init(xue, &xue->dbc_iring, 1, XUE_DB_IN);
+
+    erdp = virt_to_maddr(xue->dbc_ering.trb);
+    if ( !erdp )
+        return 0;
+
+    memset(xue->dbc_erst, 0, sizeof(*xue->dbc_erst));
+    xue->dbc_erst->base = erdp;
+    xue->dbc_erst->size = XUE_TRB_RING_CAP;
+
+    mbs = (reg->ctrl & 0xFF0000) >> 16;
+    out = virt_to_maddr(xue->dbc_oring.trb);
+    in = virt_to_maddr(xue->dbc_iring.trb);
+
+    memset(xue->dbc_ctx, 0, sizeof(*xue->dbc_ctx));
+    xue_init_strings(xue, xue->dbc_ctx->info);
+    xue_init_ep(xue->dbc_ctx->ep_out, mbs, xue_ep_bulk_out, out);
+    xue_init_ep(xue->dbc_ctx->ep_in, mbs, xue_ep_bulk_in, in);
+
+    reg->erstsz = 1;
+    reg->erstba = virt_to_maddr(xue->dbc_erst);
+    reg->erdp = erdp;
+    reg->cp = virt_to_maddr(xue->dbc_ctx);
+    reg->ddi1 = (XUE_DBC_VENDOR << 16) | XUE_DBC_PROTOCOL;
+    reg->ddi2 = XUE_DBC_PRODUCT;
+
+    xue_flush_range(xue, xue->dbc_ctx, sizeof(*xue->dbc_ctx));
+    xue_flush_range(xue, xue->dbc_erst, sizeof(*xue->dbc_erst));
+    xue_flush_range(xue, xue->dbc_ering.trb, XUE_TRB_RING_BYTES);
+    xue_flush_range(xue, xue->dbc_oring.trb, XUE_TRB_RING_BYTES);
+    xue_flush_range(xue, xue->dbc_iring.trb, XUE_TRB_RING_BYTES);
+    xue_flush_range(xue, xue->dbc_owork.buf, XUE_WORK_RING_BYTES);
+
+    return 1;
+}
+
+static void xue_init_work_ring(struct xue *xue,
+                               struct xue_work_ring *wrk)
+{
+    wrk->enq = 0;
+    wrk->deq = 0;
+    wrk->dma = virt_to_maddr(wrk->buf);
+}
+
+/* @endcond */
+
+/**
+ * Initialize the DbC and enable it for transfers. First map in the DbC
+ * registers from the host controller's MMIO region. Then allocate and map
+ * DMA for the event and transfer rings. Finally, enable the DbC for
+ * the host to enumerate. On success, the DbC is ready to send packets.
+ *
+ * @param xue the xue to open (!= NULL)
+ * @param ops the xue ops to use (!= NULL)
+ * @param sys the system-specific data (may be NULL)
+ * @return 1 iff xue_open succeeded
+ */
+static int64_t xue_open(struct xue *xue)
+{
+    if ( !xue )
+        return 0;
+
+    if ( !xue_init_xhc(xue) )
+        return 0;
+
+    if ( !xue_init_dbc(xue) )
+        return 0;
+
+    xue_init_work_ring(xue, &xue->dbc_owork);
+    xue_enable_dbc(xue);
+    xue->open = 1;
+
+    return 1;
+}
+
+/**
+ * Commit the pending transfer TRBs to the DbC. This notifies
+ * the DbC of any previously-queued data on the work ring and
+ * rings the doorbell.
+ *
+ * @param xue the xue to flush
+ * @param trb the ring containing the TRBs to transfer
+ * @param wrk the work ring containing data to be flushed
+ */
+static void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
+                      struct xue_work_ring *wrk)
+{
+    struct xue_dbc_reg *reg = xue->dbc_reg;
+    uint32_t db = (reg->db & 0xFFFF00FF) | (trb->db << 8);
+
+    if ( xue->open && !(reg->ctrl & (1UL << XUE_CTRL_DCE)) )
+    {
+        if ( !xue_init_dbc(xue) )
+            return;
+
+        xue_init_work_ring(xue, &xue->dbc_owork);
+        xue_enable_dbc(xue);
+    }
+
+    xue_pop_events(xue);
+
+    if ( !(reg->ctrl & (1UL << XUE_CTRL_DCR)) )
+    {
+        xue_error("DbC not configured");
+        return;
+    }
+
+    if ( reg->ctrl & (1UL << XUE_CTRL_DRC) )
+    {
+        reg->ctrl |= (1UL << XUE_CTRL_DRC);
+        reg->portsc |= (1UL << XUE_PSC_PED);
+        wmb();
+    }
+
+    if ( xue_trb_ring_full(trb) )
+        return;
+
+    if ( wrk->enq == wrk->deq )
+        return;
+    else if ( wrk->enq > wrk->deq )
+    {
+        xue_push_trb(xue, trb, wrk->dma + wrk->deq, wrk->enq - wrk->deq);
+        wrk->deq = wrk->enq;
+    }
+    else
+    {
+        xue_push_trb(xue, trb, wrk->dma + wrk->deq,
+                     XUE_WORK_RING_CAP - wrk->deq);
+        wrk->deq = 0;
+        if ( wrk->enq > 0 && !xue_trb_ring_full(trb) )
+        {
+            xue_push_trb(xue, trb, wrk->dma, wrk->enq);
+            wrk->deq = wrk->enq;
+        }
+    }
+
+    wmb();
+    reg->db = db;
+}
+
+/**
+ * Queue a single character to the DbC. A transfer TRB will be created
+ * if the character is a newline and the DbC will be notified that data is
+ * available for writing to the debug host.
+ *
+ * @param xue the xue to write to
+ * @param c the character to write
+ * @return the number of bytes written
+ */
+static int64_t xue_putc(struct xue *xue, char c)
+{
+    if ( !xue_push_work(xue, &xue->dbc_owork, &c, 1) )
+        return 0;
+
+    if ( c == '\n' )
+        xue_flush(xue, &xue->dbc_oring, &xue->dbc_owork);
+
+    return 1;
+}
+
+struct xue_uart {
+    struct xue xue;
+    struct timer timer;
+    spinlock_t *lock;
+};
+
+static struct xue_uart xue_uart;
+
+static void cf_check xue_uart_poll(void *data)
+{
+    struct serial_port *port = data;
+    struct xue_uart *uart = port->uart;
+    struct xue *xue = &uart->xue;
+    unsigned long flags = 0;
+
+    if ( spin_trylock_irqsave(&port->tx_lock, flags) )
+    {
+        xue_flush(xue, &xue->dbc_oring, &xue->dbc_owork);
+        spin_unlock_irqrestore(&port->tx_lock, flags);
+    }
+
+    serial_tx_interrupt(port, guest_cpu_user_regs());
+    set_timer(&uart->timer, NOW() + MICROSECS(XUE_POLL_INTERVAL));
+}
+
+static void __init cf_check xue_uart_init_preirq(struct serial_port *port)
+{
+    struct xue_uart *uart = port->uart;
+    uart->lock = &port->tx_lock;
+}
+
+static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
+{
+    struct xue_uart *uart = port->uart;
+
+    serial_async_transmit(port);
+    init_timer(&uart->timer, xue_uart_poll, port, 0);
+    set_timer(&uart->timer, NOW() + MILLISECS(1));
+}
+
+static int cf_check xue_uart_tx_ready(struct serial_port *port)
+{
+    struct xue_uart *uart = port->uart;
+    struct xue *xue = &uart->xue;
+
+    return XUE_WORK_RING_CAP - xue_work_ring_size(&xue->dbc_owork);
+}
+
+static void cf_check xue_uart_putc(struct serial_port *port, char c)
+{
+    struct xue_uart *uart = port->uart;
+    xue_putc(&uart->xue, c);
+}
+
+static void cf_check xue_uart_flush(struct serial_port *port)
+{
+    s_time_t goal;
+    struct xue_uart *uart = port->uart;
+    struct xue *xue = &uart->xue;
+
+    xue_flush(xue, &xue->dbc_oring, &xue->dbc_owork);
+
+    goal = NOW() + MICROSECS(XUE_POLL_INTERVAL);
+    if ( uart->timer.expires > goal )
+        set_timer(&uart->timer, goal);
+}
+
+static struct uart_driver xue_uart_driver = {
+    .init_preirq = xue_uart_init_preirq,
+    .init_postirq = xue_uart_init_postirq,
+    .endboot = NULL,
+    .suspend = NULL,
+    .resume = NULL,
+    .tx_ready = xue_uart_tx_ready,
+    .putc = xue_uart_putc,
+    .flush = xue_uart_flush,
+    .getc = NULL
+};
+
+static struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
+static struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
+static struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
+static struct xue_erst_segment erst __aligned(64);
+static struct xue_dbc_ctx ctx __aligned(64);
+static uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
+static char str_buf[XUE_PAGE_SIZE] __aligned(64);
+static char __initdata opt_dbgp[30];
+
+string_param("dbgp", opt_dbgp);
+
+void __init xue_uart_init(void)
+{
+    struct xue_uart *uart = &xue_uart;
+    struct xue *xue = &uart->xue;
+
+    if ( strncmp(opt_dbgp, "xue", 3) )
+        return;
+
+    memset(xue, 0, sizeof(*xue));
+
+    xue->dbc_ctx = &ctx;
+    xue->dbc_erst = &erst;
+    xue->dbc_ering.trb = evt_trb;
+    xue->dbc_oring.trb = out_trb;
+    xue->dbc_iring.trb = in_trb;
+    xue->dbc_owork.buf = wrk_buf;
+    xue->dbc_str = str_buf;
+
+    xue_open(xue);
+
+    serial_register_uart(SERHND_DBGP, &xue_uart_driver, &xue_uart);
+}
+
+void xue_uart_dump(void)
+{
+    struct xue_uart *uart = &xue_uart;
+    struct xue *xue = &uart->xue;
+
+    xue_dump(xue);
+}
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 6548f0b0a9cf..803e24cda0b6 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -171,6 +171,7 @@ struct ns16550_defaults {
 };
 void ns16550_init(int index, struct ns16550_defaults *defaults);
 void ehci_dbgp_init(void);
+void xue_uart_init(void);
 
 void arm_uart_init(void);
 
-- 
git-series 0.9.1


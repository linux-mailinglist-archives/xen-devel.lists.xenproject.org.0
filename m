Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA353E02C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342177.567350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bz-0001Gh-O2; Mon, 06 Jun 2022 03:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342177.567350; Mon, 06 Jun 2022 03:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bz-00013b-Bu; Mon, 06 Jun 2022 03:41:03 +0000
Received: by outflank-mailman (input) for mailman id 342177;
 Mon, 06 Jun 2022 03:41:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bw-0006AI-69
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:41:00 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a80778f-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:59 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D86E5C00D9;
 Sun,  5 Jun 2022 23:40:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 05 Jun 2022 23:40:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:57 -0400 (EDT)
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
X-Inumbo-ID: 7a80778f-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486858; x=1654573258; bh=Ul/YTZELjd
	XhM4yte1+Tqag6FgjJfdtEGmy0W8pthfU=; b=ODhMNVSmVnU+BovLPcl9pPwYol
	vgV/TPSH8AnyApCoRV37VwaQBaTdew7GP5M3kL7Vgj23TjpnM6f9cvuBPgUBSDY/
	AUHh/R8HqIRw1IY8xqxM4s4DswLhOJxne8V65TvrVOTF6dYwm598m8p/yNN/LgfK
	NZaxJocsBshN8IJ+n7YJY43teIoW6gRKGsu/mXmZZyJ1u+ffO3ZWUcGHBw+mL/Ht
	3YW8cAVDMsrbVEL14J2upacDPWqexqz7vBheU468FlnB0dJzsXEaUYFqFJqtONvs
	JnOEG56vlKyPdnT/qycODnr2TFL0mtNgv8Z4KHADArZISoJ8mXwMJmxXOjCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486858; x=
	1654573258; bh=Ul/YTZELjdXhM4yte1+Tqag6FgjJfdtEGmy0W8pthfU=; b=H
	suzKn2Dd738Q1vwBxYukEroFNsufQJddh/iizV9eAY9HQy3+DB+EXVF4HtfcLq5+
	ds0kHEwJ/ou3x7dzPw0xH4hRSu/SI0I4jQlZXUtfhauoiiXNCVmKdiYFjiqo6suM
	bRwnPkVPdlo/cozd7u8zB9nCx/zNeVt4DtIZ7RMMhY5uilfqut0svYg4i02abqw2
	MoESh5Xluc9vOouB/Y9eZQKR5+nc9KjV0Tfh0KUr3olyFQSlylgY/LrUxyd0IW4V
	mORk2Zbs+ohdDYmxemPQIcLnseOX8JYHEwQcTQM1pNx9rdTvIvW7DLjC2RVc17bs
	KS4dmqvwSta545M1uRDmQ==
X-ME-Sender: <xms:SnedYgKiZmbTZd-KPzPKLCAv0KJLLoiMofrRk-Vd0eLJc27pP4zmNA>
    <xme:SnedYgLjDi0wsvijAWwe25vL0WtM4-n7E-dPUd2oPsM1-KXHsn8nMIkAaH8mYDYBd
    -DJxLcYRoC3fQ>
X-ME-Received: <xmr:SnedYgvMgojUOIbe4MHTNpgRKlZezKDkSpPQEKNPQu0YqE3RzbhEQZb1SWuHImXYin5-i1SpgwnpmNPAPTA0uwbn2TxIEaw5624zq2RsXDx2L_T1sTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:SnedYtYuCozn_drnUtE09-0-J3E-oJ_2NkahLxz-E1WnE0YbrMwf-A>
    <xmx:SnedYnb59cNmy_C4moKOkfrlt4mSuQm9z9KrBXJCdp9cIji6LvH8cg>
    <xmx:SnedYpDXiTtw3okCKQaUsXDy3fyg6p30uN5lcr_8q524u_b5R_E2qg>
    <xmx:SnedYixIaBy1t2wVMOSbn8UC9TlY8K5L74_FhCeAfUXBijF1mzroeg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 12/12] xue: allow driving the reset of XHCI by a domain while Xen uses DbC
Date: Mon,  6 Jun 2022 05:40:24 +0200
Message-Id: <2f7660330861b1c6db9520332bee20388178c162.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

That's possible, because the capability was designed specifically to
allow separate driver handle it, in parallel to unmodified xhci driver
(separate set of registers, pretending the port is "disconnected" for
the main xhci driver etc). It works with Linux dom0, although requires
an awful hack - re-enabling bus mastering behind dom0's backs.
Linux driver does similar thing - see
drivers/usb/early/xhci-dbc.c:xdbc_handle_events().

To avoid Linux messing with the DbC, mark this MMIO area as read-only.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xue.c | 13 +++++++------
 xen/include/xue.h      | 10 ++++++++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index ff62b868e906..437ed6468630 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -27,6 +27,7 @@
 #include <xen/timer.h>
 #include <xen/param.h>
 #include <xen/iommu.h>
+#include <xen/rangeset.h>
 #include <xue.h>
 
 #define XUE_POLL_INTERVAL 100 /* us */
@@ -71,12 +72,12 @@ static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
     init_timer(&uart->timer, xue_uart_poll, port, 0);
     set_timer(&uart->timer, NOW() + MILLISECS(1));
 
-    if ( pci_ro_device(0, (uart->xue.xhc_cf8 >> 16) & 0xff,
-                          (uart->xue.xhc_cf8 >> 8) & 0xff) )
-            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
-                   (uart->xue.xhc_cf8 >> 16) & 0xff,
-                   (uart->xue.xhc_cf8 >> 11) & 0x1f,
-                   (uart->xue.xhc_cf8 >> 8) & 0x0f);
+#ifdef CONFIG_X86
+    if ( rangeset_add_range(mmio_ro_ranges,
+                PFN_DOWN(uart->xue.xhc_mmio_phys + uart->xue.xhc_dbc_offset),
+                PFN_UP(uart->xue.xhc_mmio_phys + uart->xue.xhc_dbc_offset + sizeof(*uart->xue.dbc_reg)) - 1) )
+        printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
+#endif
 }
 
 static int cf_check xue_uart_tx_ready(struct serial_port *port)
diff --git a/xen/include/xue.h b/xen/include/xue.h
index b1f304958679..87b821429fd8 100644
--- a/xen/include/xue.h
+++ b/xen/include/xue.h
@@ -1818,6 +1818,7 @@ static inline void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
 {
     struct xue_dbc_reg *reg = xue->dbc_reg;
     uint32_t db = (reg->db & 0xFFFF00FF) | (trb->db << 8);
+    uint32_t cmd;
 
     if (xue->open && !(reg->ctrl & (1UL << XUE_CTRL_DCE))) {
         if (!xue_init_dbc(xue)) {
@@ -1829,6 +1830,15 @@ static inline void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
         xue_enable_dbc(xue);
     }
 
+    /* Re-enable bus mastering, if dom0 (or other) disabled it in the meantime. */
+    cmd = xue_pci_read(xue, xue->xhc_cf8, 1);
+#define XUE_XHCI_CMD_REQUIRED (PCI_COMMAND_MEMORY|PCI_COMMAND_MASTER)
+    if ((cmd & XUE_XHCI_CMD_REQUIRED) != XUE_XHCI_CMD_REQUIRED) {
+        cmd |= XUE_XHCI_CMD_REQUIRED;
+        xue_pci_write(xue, xue->xhc_cf8, 1, cmd);
+    }
+#undef XUE_XHCI_CMD_REQUIRED
+
     xue_pop_events(xue);
 
     if (!(reg->ctrl & (1UL << XUE_CTRL_DCR))) {
-- 
git-series 0.9.1


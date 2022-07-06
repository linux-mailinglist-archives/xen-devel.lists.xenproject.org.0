Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E3568CEF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362340.592422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971Y-0002Ir-9U; Wed, 06 Jul 2022 15:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362340.592422; Wed, 06 Jul 2022 15:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971X-0002CL-TY; Wed, 06 Jul 2022 15:33:07 +0000
Received: by outflank-mailman (input) for mailman id 362340;
 Wed, 06 Jul 2022 15:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971V-00081g-Ab
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:33:05 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed224e52-fd40-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:33:04 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D0C825C0110;
 Wed,  6 Jul 2022 11:33:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Jul 2022 11:33:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:33:02 -0400 (EDT)
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
X-Inumbo-ID: ed224e52-fd40-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121583; x=1657207983; bh=KNhvo36Hm8
	tSnLm7qCfjQ1noa8heK9BU5yJ49iE2Lhk=; b=HSypKNz25Y14o8CyLUGEofqSJg
	EJfpN4QdMgtqN34Hr5RO8lHjz/MwFhm2jCEcQPUr9ViUMyVbNerNRnby//AtDXBi
	EpZQQl5X1y9gfat2DF3JREpYAlMEENFWCyvfThYzTK9XmXZtStTpcd0T0kJElpVb
	qN8zhftrdo8G3HziPCoJWQ3U/IHKNaTEXOjejCwL4dW6Xa39LRDtGGZGgYw+Kqa0
	6cNpQWmEGfp+Dc2iAl/HRO3V+9YuQKo98WWaKFJ9dESPIsfhOVC9WzmFUZVYt8MZ
	/xYFgRe2E8O4dApOyua8QFngnAwogqwuHZNG/9XvoyccKcjGwPqvepaamlqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121583; x=
	1657207983; bh=KNhvo36Hm8tSnLm7qCfjQ1noa8heK9BU5yJ49iE2Lhk=; b=r
	iVuK09+RakN3kOEDen/O7hbwhoaNctm4nmTc9u7ePOGg7WnUrLTgn9FYSmzN2tUZ
	nupq6/kxBt6vAhnBvqU1plndnrs7+w8ucIuWs8VX0XsTWC5x7QKi3gMOb4oqqjK/
	zHaTmjIlGS31XDo0GwD6xwD3tyfGTl2IMMpCyy28qjtvT8NFlPoGCZAqP1kWmGba
	Db3XXbc6yYkwdpq4Mf9kC/X3qWkh347cCufR7QCAUB2Qa6khS/0Q2KtM0h9VY6Iq
	pkb9nEnqYIux6vZxpaKpsX6/GYvIHZtQbNor9BEGeImhzBIbpl+1ChNYt5l2EppK
	L2moXbCFatOPIgOTMyEOw==
X-ME-Sender: <xms:L6vFYq9qI6JVYcE2AdfRZ7zvEpiGnwj2XYyYgZ-9osAqnbbHeBqflA>
    <xme:L6vFYqvCNz6pfuIrFa4gd77jOKBbD2iOyAjpDbK_CXJfQSSyHfcMGFINcKI-IDzgL
    LTeiOwnR68KoA>
X-ME-Received: <xmr:L6vFYgDdp03sARCBzPKzG44BiXsKL98r0Y4HeeDx-om6SVMm_ShiT2DQbpWPCwMFSDqiKaCL_L4Bfg-SCDnKuMGvZV8FBPEqNNZFAYG8_hNCpcnulEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:L6vFYieF6uEOgDnUbnN0tKkiqh6KboloYDMUHJ2ghsvxkN5wxOxgRQ>
    <xmx:L6vFYvN_s7L6IwN4-xpXoSp41-JKu97RO5GwysUMGDJLTQ3vxoUmbA>
    <xmx:L6vFYsloTIq_ufnmEL_dnbSnnbOmxR6mtTHzvszGPfMw6FBEPVu-Tw>
    <xmx:L6vFYq2dMmxQwEScMy4ypntHFAV_5kZQ4TveU1WnFFwwU6ymjohJnw>
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
Subject: [PATCH v2 9/9] xue: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Wed,  6 Jul 2022 17:32:14 +0200
Message-Id: <a1becf0ed2a19304ce122540e67675c06aee1702.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
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
 xen/drivers/char/xue.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index a6c49bb43e97..3461e51e746a 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -27,6 +27,7 @@
 #include <xen/timer.h>
 #include <xen/param.h>
 #include <xen/iommu.h>
+#include <xen/rangeset.h>
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <xen/mm.h>
@@ -807,6 +808,7 @@ static void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
 {
     struct xue_dbc_reg *reg = xue->dbc_reg;
     uint32_t db = (reg->db & 0xFFFF00FF) | (trb->db << 8);
+    uint32_t cmd;
 
     if ( xue->open && !(reg->ctrl & (1UL << XUE_CTRL_DCE)) )
     {
@@ -817,6 +819,16 @@ static void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
         xue_enable_dbc(xue);
     }
 
+    /* Re-enable bus mastering, if dom0 (or other) disabled it in the meantime. */
+    cmd = pci_conf_read16(xue->sbdf, PCI_COMMAND);
+#define XUE_XHCI_CMD_REQUIRED (PCI_COMMAND_MEMORY|PCI_COMMAND_MASTER)
+    if ( (cmd & XUE_XHCI_CMD_REQUIRED) != XUE_XHCI_CMD_REQUIRED )
+    {
+        cmd |= XUE_XHCI_CMD_REQUIRED;
+        pci_conf_write16(xue->sbdf, PCI_COMMAND, cmd);
+    }
+#undef XUE_XHCI_CMD_REQUIRED
+
     xue_pop_events(xue);
 
     if ( !(reg->ctrl & (1UL << XUE_CTRL_DCR)) )
@@ -916,6 +928,13 @@ static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
     serial_async_transmit(port);
     init_timer(&uart->timer, xue_uart_poll, port, 0);
     set_timer(&uart->timer, NOW() + MILLISECS(1));
+
+#ifdef CONFIG_X86
+    if ( rangeset_add_range(mmio_ro_ranges,
+                PFN_DOWN(uart->xue.xhc_mmio_phys + uart->xue.xhc_dbc_offset),
+                PFN_UP(uart->xue.xhc_mmio_phys + uart->xue.xhc_dbc_offset + sizeof(*uart->xue.dbc_reg)) - 1) )
+        printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
+#endif
 }
 
 static int cf_check xue_uart_tx_ready(struct serial_port *port)
-- 
git-series 0.9.1


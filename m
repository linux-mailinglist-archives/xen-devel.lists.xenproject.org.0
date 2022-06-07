Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4491540172
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343355.568773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaF1-0000dl-21; Tue, 07 Jun 2022 14:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343355.568773; Tue, 07 Jun 2022 14:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaF0-0000U8-Ob; Tue, 07 Jun 2022 14:31:30 +0000
Received: by outflank-mailman (input) for mailman id 343355;
 Tue, 07 Jun 2022 14:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEy-000619-2q
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:28 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8319eddd-e66e-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 16:31:26 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 546365C01BE;
 Tue,  7 Jun 2022 10:31:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Jun 2022 10:31:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:25 -0400 (EDT)
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
X-Inumbo-ID: 8319eddd-e66e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612286; x=1654698686; bh=sGlhYvcRcQ
	5DJkbewOsNiwax4QikybgKWGNbHy1b/To=; b=XGPSWXvQbtm+CS+eaOfrElY0ut
	zgiez65mQYYyvwyfMyrXmcXC9yY4jonAu8A6H07J+cLVqAMNKgp14DHkLbOIn7uS
	xQPhUhVE2rR02HvD5esvwfM6/Zed6GgmgtGsLeboi4GOzMkHwL/OEoQ5H93EfUrx
	2+4Xio2CVonGty74H3TOdnKDmrFTfsXpp0Ew+V/ewSusMoCbXopF2R6eorFhRBdx
	r89oAfQbFNc7Vjq4FuUlw5fX1CfYkVcotG/Ya4yFX+blwIJaLXisKC9SgkIiuP08
	z+oxVyKDPKBjJy7Qsh97WwCpIMtMes+DDcLJ2tpQ7OvHhd5Mg31kSGGmT4yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612286; x=
	1654698686; bh=sGlhYvcRcQ5DJkbewOsNiwax4QikybgKWGNbHy1b/To=; b=h
	8K3dtAM37ho2kR1GuCG0lGqQezLmA9O5PF6EhvBk3e75yilPIQo7CqQ06r6WivfL
	aZFXj9hDqUxkBUJFZ8G6s2qaEloZ3LKpLH3GhjuKNtN5h38BGqe739R0huqj+fSm
	aNSD+GMOFdRYp82kpomLwDrZSNIjL59WzjsQQeN4PUv58SeSkiWG/W8Cm3qNmnmR
	zzbZQw1hhdaXq5YK5u5qcOHcX4h2gqLUO1lx5TLVP3dLLuuHMk+3nMFreLMxe55F
	8kAPia2ck5TzlxbYEbAgxoCgqQBQE7h7ubE1x/J0Sv8w4nUWcRlf5yiY9PSX6H+b
	O/x7daW3163aBDgr8jSWA==
X-ME-Sender: <xms:PmGfYivtkpu2khFqG9Vh0vmXdTta1nJxKMksidyCpqjDiXejRuwKYg>
    <xme:PmGfYne5PXRi7FD4S3F4lDFlVkvJ8lD1PdhDMf5-l4jvY-5V1ytq-brQm881UJPbX
    QHrMJTmu8bnbw>
X-ME-Received: <xmr:PmGfYtw5_RX_9XR04XErXjsRes5pgkv3HOLfR70Rpwv5wtSmQ4mrhUdRKa7-sXdTDleAsdrjb7mZ_Ui27J7JS49esVqLJJh7D84r-RsuQB7vAT6bpJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PmGfYtO2gELOatYkZUZh3S_WwwJAn4WVd_2OOQ2v9FZP9O8ex5_McA>
    <xmx:PmGfYi8u17Vyxa0depxYDXOyhS9XdySeQBjIlkqMxz_7hyPbMzroVg>
    <xmx:PmGfYlWAV5b1Yrs8rAbAm1vUzh2HLv7EDJWA4gfbbOmknYSyc4mhQg>
    <xmx:PmGfYpnf7W43aXkRbQMVNS_UNQyN9mbagXj3jFyPSg6UYofFVr8IPQ>
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
Subject: [PATCH v1 10/10] xue: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Tue,  7 Jun 2022 16:30:16 +0200
Message-Id: <9c35e0e4ac14a273ed59fab22034fa11a264e394.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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
index 6fd26c3d38a8..85aed0bccbbf 100644
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
@@ -846,6 +847,7 @@ static void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
 {
     struct xue_dbc_reg *reg = xue->dbc_reg;
     uint32_t db = (reg->db & 0xFFFF00FF) | (trb->db << 8);
+    uint32_t cmd;
 
     if ( xue->open && !(reg->ctrl & (1UL << XUE_CTRL_DCE)) )
     {
@@ -856,6 +858,16 @@ static void xue_flush(struct xue *xue, struct xue_trb_ring *trb,
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
@@ -955,6 +967,13 @@ static void __init cf_check xue_uart_init_postirq(struct serial_port *port)
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


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1BF5EF6AA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413796.657706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtfP-0006Mn-VN; Thu, 29 Sep 2022 13:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413796.657706; Thu, 29 Sep 2022 13:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtfP-0006Ix-RK; Thu, 29 Sep 2022 13:33:31 +0000
Received: by outflank-mailman (input) for mailman id 413796;
 Thu, 29 Sep 2022 13:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OnIM=2A=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1odtfO-0005tj-Tj
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:33:31 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d1eb5f4-3ffb-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 15:33:29 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 024475C00CF;
 Thu, 29 Sep 2022 09:33:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 29 Sep 2022 09:33:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 09:33:26 -0400 (EDT)
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
X-Inumbo-ID: 4d1eb5f4-3ffb-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664458407; x=1664544807; bh=qgXc+yc9Ry
	MnxEvi8RZARrA6p2JmQMlq7M1cItFijWE=; b=X6O2BdtiKpBYB5bgMgn7AgtQnu
	ZjxFCTJhi56VsQP2un9+b/IkcNcrXEIDsUtu6RlKGHTcCUmlsvD14mZ7yGCpTnOW
	Lu/3w2NL+IfE4/IY9/+8ZvR+lDrGQsRQLYb7YcLFfKLLVeKNI3WFoZW5tyFPO70d
	h0i2cNxoTBeKPzk3/i8+XtGaVrzu2/ibc6uumo9lLRfQ/SKSzB1q/5VojGAV7NQu
	VBRUuSRVzB73gb6Qwyx+UK5vloq2PFXJPN9fFyMKOy59CU4qiWH77R0VHPB0dlJq
	Wu59cw7i3hZibjxHrb9uy439rD8a4uOmYHVExGjmDEF2jyCtHhajAAH3+7/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664458407; x=
	1664544807; bh=qgXc+yc9RyMnxEvi8RZARrA6p2JmQMlq7M1cItFijWE=; b=K
	iSjwQ8O8Y6D6pGICQNeiOl6hlUXXxAh8w6Vm1sUGGzSjUilxovjGzjNqYKlwIflR
	lONxo2jxLqpn0t2cppCuiqlLRNhpqg1hMa2yjttMwBvYWCjD33azP9PbVLNXdJrY
	4iz4D72Q3dMsMn/sBEA9EP9UcOYAyiCm+ituukQ1LiPph9blSvoHrJXz1Z6/Fn1H
	Y2ONZ3wUVsV2zJzzojiRLj646kG+U7i1JtjrtSuaZJ12IDfZfR3b0dx9zIq+vvSS
	YRMuyfjCdBYt4U4Rf1vOnULlsnNaKCZW6lOF6eHEIDIBRwcug4Q71ZLk/28eUFxo
	UMOEr1YdYYvOkvlRE20LQ==
X-ME-Sender: <xms:p541Y4gzRiOY1qKnUQWwHYopLfB1EJBAlhnABWjLUc25EV73ZuB-OQ>
    <xme:p541YxA9htAH5IfCqu99eKZMFxXRNiSrhsOeLurQbs89Qhzd6RzuQQ7IFaVqsl0kn
    BYJ_CukUNhNtw>
X-ME-Received: <xmr:p541YwG4JIbAVLafkQGL1Oo0Z10G1t-ymkbxRVIMO7-t4J-R3tixptys4eA-CgE-0S_IrVfjPtIMijEvHiXmsBZ8RBwOGF5efCFTi-tIHXMnyeMByhHRcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:p541Y5Sqwt7Kr5P4whejCupajSuFWki1QdGvMLkzXpO2MmASheQXmQ>
    <xmx:p541Y1xd15LF_gwdj1-88mvzpr4LvRxqKgAIN7gWSSoMsYoY0BIWyA>
    <xmx:p541Y34ESl0HypJOvZdO9-aZ-bWgGEoDIPXRxQBuYZVqePo1_JX6Wg>
    <xmx:p541Y4pX0nfAaJvjatucDx_4QpMDQwXcc4Aa-kr2W-I6hhON_K6VZw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 2/2] drivers/char: suspend handling in XHCI console driver
Date: Thu, 29 Sep 2022 15:33:13 +0200
Message-Id: <5ebc3a1176fcb9f1e4852826edfe67fe62062d05.1664458360.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
References: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similar to the EHCI driver - save/restore relevant BAR and command
register, re-configure DbC on resume and stop/start timer.
On resume trigger sending anything that was queued in the meantime.
Save full BAR value, instead of just the address part, to ease restoring
on resume.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v8:
 - move 'bool suspended' to other bools
New in v7

Without this patch, the console is broken after S3, and in some cases
the suspend doesn't succeed at all (when xhci console is enabled).

Very similar (if not the same) functions might be used for coordinated
reset handling. I tried to include it in this patch too, but it's a bit
more involved, mostly due to share=yes case (PHYSDEVOP_dbgp_op can be
called by the hardware domain only).
---
 xen/drivers/char/xhci-dbc.c | 55 +++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 43ed64a004e2..86f6df6bef67 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -251,14 +251,17 @@ struct dbc {
     struct xhci_string_descriptor *dbc_str;
 
     pci_sbdf_t sbdf;
-    uint64_t xhc_mmio_phys;
+    uint64_t bar_val;
     uint64_t xhc_dbc_offset;
     void __iomem *xhc_mmio;
 
     bool enable; /* whether dbgp=xhci was set at all */
     bool open;
+    bool suspended;
     enum xhci_share share;
     unsigned int xhc_num; /* look for n-th xhc */
+    /* state saved across suspend */
+    uint16_t pci_cr;
 };
 
 static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
@@ -358,8 +361,9 @@ static bool __init dbc_init_xhc(struct dbc *dbc)
 
     pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
 
-    dbc->xhc_mmio_phys = (bar0 & PCI_BASE_ADDRESS_MEM_MASK) | (bar1 << 32);
-    dbc->xhc_mmio = dbc_sys_map_xhc(dbc->xhc_mmio_phys, xhc_mmio_size);
+    dbc->bar_val = bar0 | (bar1 << 32);
+    dbc->xhc_mmio = dbc_sys_map_xhc(dbc->bar_val & PCI_BASE_ADDRESS_MEM_MASK,
+                                    xhc_mmio_size);
 
     if ( dbc->xhc_mmio == NULL )
         return false;
@@ -979,6 +983,9 @@ static bool dbc_ensure_running(struct dbc *dbc)
     uint32_t ctrl;
     uint16_t cmd;
 
+    if ( dbc->suspended )
+        return false;
+
     if ( dbc->share != XHCI_SHARE_NONE )
     {
         /*
@@ -1213,9 +1220,11 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
      * page, so keep it simple.
      */
     if ( rangeset_add_range(mmio_ro_ranges,
-                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
-                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
-                       sizeof(*uart->dbc.dbc_reg)) - 1) )
+                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+                         uart->dbc.xhc_dbc_offset),
+                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+                       uart->dbc.xhc_dbc_offset +
+                sizeof(*uart->dbc.dbc_reg)) - 1) )
         printk(XENLOG_INFO
                "Error while adding MMIO range of device to mmio_ro_ranges\n");
 #endif
@@ -1255,6 +1264,38 @@ static void cf_check dbc_uart_flush(struct serial_port *port)
         set_timer(&uart->timer, goal);
 }
 
+static void cf_check dbc_uart_suspend(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    dbc_pop_events(dbc);
+    stop_timer(&uart->timer);
+    dbc->pci_cr = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
+    dbc->suspended = true;
+}
+
+static void cf_check dbc_uart_resume(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, dbc->bar_val & 0xFFFFFFFF);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, dbc->bar_val >> 32);
+    pci_conf_write16(dbc->sbdf, PCI_COMMAND, dbc->pci_cr);
+
+    if ( !dbc_init_dbc(dbc) )
+    {
+        dbc_error("resume failed\n");
+        return;
+    }
+
+    dbc_enable_dbc(dbc);
+    dbc->suspended = false;
+    dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
+    set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
+}
+
 static struct uart_driver dbc_uart_driver = {
     .init_preirq = dbc_uart_init_preirq,
     .init_postirq = dbc_uart_init_postirq,
@@ -1262,6 +1303,8 @@ static struct uart_driver dbc_uart_driver = {
     .putc = dbc_uart_putc,
     .getc = dbc_uart_getc,
     .flush = dbc_uart_flush,
+    .suspend = dbc_uart_suspend,
+    .resume = dbc_uart_resume,
 };
 
 /* Those are accessed via DMA. */
-- 
git-series 0.9.1


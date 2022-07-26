Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9965809EF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374942.607238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAd-0005mR-Or; Tue, 26 Jul 2022 03:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374942.607238; Tue, 26 Jul 2022 03:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAd-0005gr-0t; Tue, 26 Jul 2022 03:23:43 +0000
Received: by outflank-mailman (input) for mailman id 374942;
 Tue, 26 Jul 2022 03:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAa-0003P0-SQ
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:40 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a688ba-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:40 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 365C65C00C4;
 Mon, 25 Jul 2022 23:23:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 25 Jul 2022 23:23:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:37 -0400 (EDT)
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
X-Inumbo-ID: 57a688ba-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805819; x=1658892219; bh=3kwK8JcWbh
	LtjVsgq8YPYw4utn8O/FJoTtsnfytYm9A=; b=jY+5mrm5AnkRJ55gXNeVKy+7ya
	hVLHsSlfuBpNYRTCXGgH6Z+gnuxjKtFCZktjgc+b3bMDYVPWWiMRjQTALmhJkZGv
	wtEGGsoj/7j9Twk9ODa2AOx/alSMP2fMBgIr7GVmKszSTm9i2xy2AE/1Wsr1Et5e
	KZGlqy1zX69hipxq1Kle1k888w8ehv88MOkPzbRCsnqyO/JHy2uB8Ar9rEjo+hmI
	uu+Njn1uj1Ld8vRKQDGAMjexbJyeeyX1xGknPIlZ2Z0+nPTKWsRIb2HLqsjnvjAO
	H1PxcPxGl/kAALW5cpAOMTiNhcYsNP/ou/ROyzMEcYmNyZUE+VZ8FI5WZY3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805819; x=
	1658892219; bh=3kwK8JcWbhLtjVsgq8YPYw4utn8O/FJoTtsnfytYm9A=; b=R
	XD6WVK0xA+m0sWGLNWwKOcwsKeTCIEkq2bHNbRPbs+cZkS/ppAjgsy3/LBR1qRU7
	UuVpjmr7e8BXKmOFS7wj3ENtLKqjeCzn+JOCWhaCB7BgqBa7Ce5m8SDM7I61t9Yi
	2/a4KBtEWlSlD2HZLh04CbzLhZyGTNs0o/g/mP/ePVEFRb8cyd38ucyWZzZQs2Bh
	tO0d415yWzzEtu9vMmFB7reLFai9R1xWxDZeH8Vc1Ta6k7W40rbH8xfqi8t7TgzH
	e+V7bUDNMlqeLlSkYlHY4qoBR4zdc3LbgAUWWy+P+8zA0WDC4OMxTcgRsxXNgXU/
	ZCywdOcrl2hxbFAMlysCw==
X-ME-Sender: <xms:O17fYmPK1poM1JF9EUsNBhjY3qkqpcfHPiR4OEsAI0z3e238LjWyHg>
    <xme:O17fYk86g5yGYMWOxkDbgU56O3l0-xyuFLFngeXqo7U1UR7okdUJWmih7203DpuQ2
    e2eR3Am-Haetw>
X-ME-Received: <xmr:O17fYtQld8QJE2dx0ozffvvAQG_tvT0IqjAXLpu0DT1eePP_zGMMJBw0oaJpQbZQ-GK4Rj7WOHpZfpE9hV5J2pjME4mjHLkPyv0-YBrfjObzlcAvkLn7Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:O17fYmv_Cq8BtnmdTwhZqt8Jp86Fuq9ZkU_VhIzMxpI8tPUE8kxZ9Q>
    <xmx:O17fYuemEObBVSXTW4ZqLE59M-nKa_1Bn8qoTVth9DfAaTjFTqeQYw>
    <xmx:O17fYq025ZrZxadBKKbqnZA1_aUTZZRYzjJfXDzRUQ7BA5x-VBZHrg>
    <xmx:O17fYrFEobGfGKGx93WBh1Hiyh6CKwHLEkRcvQWkYAAe1cgHKM4Fsg>
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
Subject: [PATCH v3 08/10] drivers/char: mark DMA buffers as reserved for the XHCI
Date: Tue, 26 Jul 2022 05:23:13 +0200
Message-Id: <b35f5a68502352396cf6d95cc726bfdeb72639c9.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The important part is to include those buffers in IOMMU page table
relevant for the USB controller. Otherwise, DbC will stop working as
soon as IOMMU is enabled, regardless of to which domain device assigned
(be it xen or dom0).
If the device is passed through to dom0 or other domain (see later
patches), that domain will effectively have access to those buffers too.
It does give such domain yet another way to DoS the system (as is the
case when having PCI device assigned already), but also possibly steal
the console ring content. Thus, such domain should be a trusted one.
In any case, prevent anything else being placed on those pages by adding
artificial padding.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- adjust for xhci-dbc rename
- do not raise MAX_USER_RMRR_PAGES
- adjust alignment of DMA buffers
---
 xen/drivers/char/xhci-dbc.c | 42 +++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 14a2d3eb0ee2..546231a75894 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/delay.h>
+#include <xen/iommu.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/serial.h>
@@ -1046,13 +1047,20 @@ static struct uart_driver dbc_uart_driver = {
     .flush = dbc_uart_flush,
 };
 
-static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
-static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
-static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
-static struct xhci_erst_segment erst __aligned(64);
-static struct xhci_dbc_ctx ctx __aligned(64);
-static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
-static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
+struct dbc_dma_bufs {
+    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
+    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
+    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
+    uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
+    struct xhci_erst_segment erst __aligned(16);
+    struct xhci_dbc_ctx ctx __aligned(16);
+    struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
+    /*
+     * Don't place anything else on this page - it will be
+     * DMA-reachable by the USB controller.
+     */
+};
+static struct dbc_dma_bufs dbc_dma_bufs __section(".bss.page_aligned");
 static char __initdata opt_dbgp[30];
 
 string_param("dbgp", opt_dbgp);
@@ -1087,16 +1095,22 @@ void __init xhci_dbc_uart_init(void)
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
 
-    dbc->dbc_ctx = &ctx;
-    dbc->dbc_erst = &erst;
-    dbc->dbc_ering.trb = evt_trb;
-    dbc->dbc_oring.trb = out_trb;
-    dbc->dbc_iring.trb = in_trb;
-    dbc->dbc_owork.buf = out_wrk_buf;
-    dbc->dbc_str = str_buf;
+    dbc->dbc_ctx = &dbc_dma_bufs.ctx;
+    dbc->dbc_erst = &dbc_dma_bufs.erst;
+    dbc->dbc_ering.trb = dbc_dma_bufs.evt_trb;
+    dbc->dbc_oring.trb = dbc_dma_bufs.out_trb;
+    dbc->dbc_iring.trb = dbc_dma_bufs.in_trb;
+    dbc->dbc_owork.buf = dbc_dma_bufs.out_wrk_buf;
+    dbc->dbc_str = dbc_dma_bufs.str_buf;
 
     if ( dbc_open(dbc) )
+    {
+        iommu_add_extra_reserved_device_memory(
+                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
+                PFN_UP(sizeof(dbc_dma_bufs)),
+                uart->dbc.sbdf.sbdf);
         serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
+    }
 }
 
 #ifdef DBC_DEBUG
-- 
git-series 0.9.1


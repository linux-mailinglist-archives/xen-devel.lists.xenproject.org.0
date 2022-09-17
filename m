Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8DC5BB5A5
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408203.650967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvs-00041A-1U; Sat, 17 Sep 2022 02:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408203.650967; Sat, 17 Sep 2022 02:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvr-0003w9-UC; Sat, 17 Sep 2022 02:51:51 +0000
Received: by outflank-mailman (input) for mailman id 408203;
 Sat, 17 Sep 2022 02:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvq-0002wS-75
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:50 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aca1c01f-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:49 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 684DC5C00AC;
 Fri, 16 Sep 2022 22:51:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 16 Sep 2022 22:51:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:47 -0400 (EDT)
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
X-Inumbo-ID: aca1c01f-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383108; x=1663469508; bh=oHCR6T8UU3
	IPX2fsRqB667MqjSnGtYktvgSa8odFN3E=; b=VtRY7XJHW0MmqBXTNZOzMQDbk+
	pdw2+49IlbBVkCsKnAw1b8hWIp1pfe26bAMPM0IuKRoulWyjckGluxmeGvF9eUjc
	Dqqq4bV7g6EJrmmR+DxO2cxvKX8jrrPXSmZ7KHWImZOoQqIxf207X6yKEjawSLd/
	QMPwgp09KifZnX5AzrDVhXElhjsVImroDIcqoZAybBVvqjcOW4T0HKmFetS2sImE
	RB/UAdcVBVdSp1f+0vrI0Wg8bE2ZG5r0zvJ/4bziq5W3sRGPn7QxO3g3OK0n4rcU
	W1Jjny+CGVQRwwApe1dlFG3AUlwC5ajFc6KV/TjHFxyqq5ZHJx0iBFSKXnIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383108; x=
	1663469508; bh=oHCR6T8UU3IPX2fsRqB667MqjSnGtYktvgSa8odFN3E=; b=i
	uSvItKX15NTQV2CPBU+v9LDvxdz9FnZps+3saZyAsoCt6cFP86+vsuQLc0KDxXRS
	l2gfxYrv2wA52tVd2QfzVMb5RMcdLL439dJwjFUQ8hg47DqgwUViXOW85r0qKuHH
	GLl2t+N5KQDU8a7yjbe34a84ZjRdpVU4ho4ecQI0mvVZ4++xf8PBoVJZriG7gM9t
	6TMpHbMsnWNMmULc7GLcCb14hO2TiWPM9yEjpc7cOmzbAj9BrEg2vGt8qwpEbk/H
	66e2f101NWldTbaEYdKABA5z8aMS9tJfJQc7a3WNP650jdC3YmRfc9sqWB6JOe7p
	HzyTbBn8wiyaxBqZO68XA==
X-ME-Sender: <xms:RDYlYzpwZ1EHQv9QiiCBTn3gLmeBB-1dnutwRQEchWfQMNGfntVNPg>
    <xme:RDYlY9oATaHOYRXe_HcnhSDrDX8lKgzsG7LAkOBqf40UdHd_ARPKyBZp-gSUZnaJW
    GkJphv5Kglk6Q>
X-ME-Received: <xmr:RDYlYwOR5aiJ79RROSoiFZtvEV3fZPgFpf3iD0QLmJDIUJJ7b9Fu2mndVOJmmygzjH2RjOaKkoZgVWSizfdkOSfT2bel4_gtZb_SrtgDc5fCp81W5cMqjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RDYlY27crrcx8y6Rw3YD49VMJGNj248na_AIRBOihckxb0OsVso8_Q>
    <xmx:RDYlYy5zKiWx0AA297vQO1mIfy25rE3nUr7P2ogXbV8F_6xYe26rWA>
    <xmx:RDYlY-j63Ilq0x_9B7bUT4_2SMwenwyZ0IELDnKNasWnf8ThqeLNAg>
    <xmx:RDYlY0QCOX3lsGtPPpKnbpT7Z-yJ2eWqNdUWoE3TY9fNmxJe1YrxdA>
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
Subject: [PATCH v7 04/11] drivers/char: mark DMA buffers as reserved for the XHCI
Date: Sat, 17 Sep 2022 04:51:23 +0200
Message-Id: <cf37a6351afcd5cc77e3b916f2ff5058bdf8074c.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
- add missing alignment
Changes in v3:
- adjust for xhci-dbc rename
- do not raise MAX_USER_RMRR_PAGES
- adjust alignment of DMA buffers
---
 xen/drivers/char/xhci-dbc.c | 43 +++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 4712faaabef7..f55f73e382fc 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/delay.h>
+#include <xen/iommu.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/serial.h>
@@ -1051,13 +1052,21 @@ static struct uart_driver dbc_uart_driver = {
 };
 
 /* Those are accessed via DMA. */
-static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
-static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
-static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
-static struct xhci_erst_segment erst __aligned(16);
-static struct xhci_dbc_ctx ctx __aligned(16);
-static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
-static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
+struct dbc_dma_bufs {
+    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
+    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
+    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
+    uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
+    struct xhci_erst_segment erst __aligned(16);
+    struct xhci_dbc_ctx ctx __aligned(16);
+    struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
+    /*
+     * Don't place anything else on this page - it will be
+     * DMA-reachable by the USB controller.
+     */
+};
+static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    dbc_dma_bufs;
 
 static int __init xhci_parse_dbgp(const char *opt_dbgp)
 {
@@ -1104,16 +1113,22 @@ void __init xhci_dbc_uart_init(void)
     if ( !dbc->enable )
         return;
 
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
+                uart->dbc.sbdf);
         serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
+    }
 }
 
 #ifdef DBC_DEBUG
-- 
git-series 0.9.1


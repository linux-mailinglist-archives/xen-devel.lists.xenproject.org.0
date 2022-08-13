Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E189591835
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386026.621959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7g-0003Ru-3i; Sat, 13 Aug 2022 01:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386026.621959; Sat, 13 Aug 2022 01:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7f-0003O7-TI; Sat, 13 Aug 2022 01:39:31 +0000
Received: by outflank-mailman (input) for mailman id 386026;
 Sat, 13 Aug 2022 01:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7d-0000pT-8j
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:29 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4d595ca-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:28 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F0375C00C5;
 Fri, 12 Aug 2022 21:39:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 12 Aug 2022 21:39:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:26 -0400 (EDT)
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
X-Inumbo-ID: c4d595ca-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354767; x=1660441167; bh=Oi+UgP31Q9
	mWTQWpvO49YYf7Gk2wpvlDWMMezZSDVMM=; b=DNV1W7qiesrwFicIl1P6ctq46X
	ec6f/kAvHHCcFldFcwmCIyHGWg3rhi85aj/OSi/Z9AwK5XlQ3bHBRjEojhBvvRKg
	7MU1RkMl3Xe66e+6zZI07r09zdcXMKaTIYZtMkzEvr9RmltBeYeNothBiq9o8gTk
	aDQ1ThV08L6MPiVHTzqsNS8tdjoMdC/mv0RF1J5LXBpzbfjuuR2c8ikZuhgDl0+7
	XXkSNmR+E7u0PZVsKBxq5TaZThPqLps191KnV4z11iGrcA/l4ftrTtLSuhs5zCr5
	MbsMNELaJNUpv0qNaWXtwh6xnbMsQFgIoRPB/elqQK/PLLtz7peJfucDOmLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354767; x=
	1660441167; bh=Oi+UgP31Q9mWTQWpvO49YYf7Gk2wpvlDWMMezZSDVMM=; b=n
	7ZaongCdHdIrVtXwGPboCVfenjGaQ4eEVAEedE9F5jrgALOP9Nrm74xVHGPw+rcU
	j5pbuBRyPWSt+Q4D5RhmKdRxgavYZ3uxu4rReVMyN5jHkn2KLp3jcVHoeS3j7X8O
	2cpWn0OCxPIRy99rEEdYzKrsBeG0ygmz3ZocTVNpGM3Ib9+4/kM4yKiKAd7sDx3k
	pF4/scFXK2S0X1UEblt1B5QBT8j4nNvvjpNKAmYGqhMBhB3O7rDe/aYcFdGu96aH
	SF/ifRBhh4e3NtM+wb8dHdPwske6/tYhWuJKCLKJZ9PP9B3Rf7oK3nZ46+1p6+p2
	Xi6pc28BMVwMGmNHxod2A==
X-ME-Sender: <xms:zwD3Yp8-dQS_kFEpWsocRTvwRYiXKFv5kAXF2xGRBZDyKVdq8D95NQ>
    <xme:zwD3YtufuCAWT366r3nmwY0zBSmyJqSOCEnvSeJ9UQ6Mepu43T8jpervNxWKKtwDw
    NNfsRJK3W08wA>
X-ME-Received: <xmr:zwD3YnAqfw2CKgLiBzuuXNv1keRK4rI5YbOdM3mkBLk93Wv1UI8y_sp_-jzJVi6CRC42n4jPjRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:zwD3YtcdaYOaYWfxT-3-jIULoHm8w48ocHeJrD4ehpiUsf-CCY63Xg>
    <xmx:zwD3YuOiCJU0FSkUnys1vdDe4b9qGdAE8soD4Gn0jvwch8WGSSSwuA>
    <xmx:zwD3YvnoL7tFhbP6soog3fQ7fAEt9UriBUm9Si9Sz3zCja-A6U_Ang>
    <xmx:zwD3Yl3X_BfNH0GI5jOYwSOJfWkuvchGCkGfNNbi9zOLhvPNksNPtA>
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
Subject: [PATCH v4 09/11] drivers/char: mark DMA buffers as reserved for the XHCI
Date: Sat, 13 Aug 2022 03:38:59 +0200
Message-Id: <b3d917bd1d46393857bd82bcdef9d4486d8f3945.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
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
index ca7d4a62139e..8d83d8307fcd 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/delay.h>
+#include <xen/iommu.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/serial.h>
@@ -1050,13 +1051,20 @@ static struct uart_driver dbc_uart_driver = {
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
+static struct dbc_dma_bufs dbc_dma_bufs __section(".bss.page_aligned");
 
 static char __initdata opt_dbgp[30];
 
@@ -1093,16 +1101,22 @@ void __init xhci_dbc_uart_init(void)
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
+                uart->dbc.sbdf);
         serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
+    }
 }
 
 #ifdef DBC_DEBUG
-- 
git-series 0.9.1


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951159C2B1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391474.629375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L6-00052N-PD; Mon, 22 Aug 2022 15:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391474.629375; Mon, 22 Aug 2022 15:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L6-0004z9-Ll; Mon, 22 Aug 2022 15:27:44 +0000
Received: by outflank-mailman (input) for mailman id 391474;
 Mon, 22 Aug 2022 15:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9L4-0003Dm-7a
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:42 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f58f1b07-222e-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 17:27:41 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0FC4C3200A7C;
 Mon, 22 Aug 2022 11:27:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Aug 2022 11:27:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:37 -0400 (EDT)
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
X-Inumbo-ID: f58f1b07-222e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182058; x=1661268458; bh=Pn0LnI5h21
	OlMhhNf4aZSkh56wy/E8EA+91CFTzjTe4=; b=sQoAuQiUsytXAe6aZHkD3+nj/X
	xURp8nmsI7ApvsEWjNBjeApnAbI4pWcrS9PnwrbQqWkpZyGhE2cyn4oodoEdrdry
	s7FlHAUaxVpc6q2ScG4DMuRu3CbRAD084xqypbz/l+HA6LKm+K3nLPy8f6Tj6qPE
	ZDa/2BV6igTN9e1tlmCv91a3y+7/PDHhxhuL6sgGzspYq1JgeY3IBEYJfPW+ktkT
	K1oAaT3aVJe0GYzlrPWnDiIoSybk+jW/GYmawFjkmDoFAMXLIxPN5MTnSFqqSQjr
	dguBqCXJ4S2wvTz3eCa+ZvhZ0CA+zyclnaAZUhYWuxRdqqZrwYESeBv6i3ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182058; x=
	1661268458; bh=Pn0LnI5h21OlMhhNf4aZSkh56wy/E8EA+91CFTzjTe4=; b=i
	ZYZUoPMkCUWowlR78BN8JB51gue35CmgOobDn5H2tBjnJT/0WGwC7Op6Fm6eUijM
	MgjNETPMAr2Lvw1fqZlvl3COiFzlPJSJ9ckAh8r/tU7Bi/SkYumFZx65LdTDvcTc
	spUbh5BtE1mhFsc23TfWa20T6Ag9eCyXAd22zTZppB2ugRQM+CjCT0ko2dp8JJaQ
	f5Ow9QXbizvng4juHYkCMoy/7HCqu3z5YMo1frJXC2E8uQP26OzS861C1Cj0oylj
	E675Nw9jpoihACjNxid9KjIIq1bc4wDUMg8WcPaecF6qPN95C7CzlqLBxxFm8FtM
	t2Ryg1L3Wy+TLvbwSEsMA==
X-ME-Sender: <xms:aqADY3M8zXrULpX6MTLdaAK9CKpB_SBq0Q0Bivic5zZwed2q-vJT2g>
    <xme:aqADYx8rrGlW4_mWHPWrDaO8vYPemh4nnBdpnfc6y8WZJdnyzz2xYfOiRiSqjwslZ
    NL7NQXbzx4dSw>
X-ME-Received: <xmr:aqADY2SOAEfu2_nVjR60vniM9Tto4RvI1vyPu2lPyJzta92dU1_7XrSKxDBzDPQ9DB07cCyfJSPI7K5odzAtPUO7Xr_wycfBaLVf5gBhL6zcAzntZux9nQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:aqADY7vkPfyAhkyJtP-YOwFMH_KhmTiuJhAmQPBhUb6Dwrx3t9S9mw>
    <xmx:aqADY_cpgkQnoMx3fY6A5IewMXObgem_7Kwwexumc_EQciCJHEK03A>
    <xmx:aqADY31kun81UnMOIGJjq1b-II8X4MtayWr2Ldco-EToVLRcvkNB7g>
    <xmx:aqADYwEpMHxbaL02s88oRAi0njlbjGkQqy4IhJyBNGL9whT-cnqGzA>
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
Subject: [PATCH v5 6/9] drivers/char: mark DMA buffers as reserved for the XHCI
Date: Mon, 22 Aug 2022 17:27:06 +0200
Message-Id: <58476e4d0ce2b819050393f137603d2a9294d40a.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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
index eb35e3a2ee4f..32e9efeb0f77 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/delay.h>
+#include <xen/iommu.h>
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/serial.h>
@@ -1050,13 +1051,21 @@ static struct uart_driver dbc_uart_driver = {
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
 
 static char __initdata opt_dbc[30];
 
@@ -1093,16 +1102,22 @@ void __init xhci_dbc_uart_init(void)
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
         serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart);
+    }
 }
 
 #ifdef DBC_DEBUG
-- 
git-series 0.9.1


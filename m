Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5AF5AB149
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397607.638286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YW-0001V5-Bk; Fri, 02 Sep 2022 13:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397607.638286; Fri, 02 Sep 2022 13:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YW-0001OZ-4K; Fri, 02 Sep 2022 13:17:56 +0000
Received: by outflank-mailman (input) for mailman id 397607;
 Fri, 02 Sep 2022 13:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YU-0008Qk-Hg
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:54 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a67b516d-2ac1-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:17:53 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A9EB5C00DF;
 Fri,  2 Sep 2022 09:17:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 02 Sep 2022 09:17:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:51 -0400 (EDT)
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
X-Inumbo-ID: a67b516d-2ac1-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124672; x=1662211072; bh=VSr0av52FF
	/X96STc3yWhqiOBdkk8IpIl/76LTRVqS8=; b=bvJnfZONgbdEufAMPx0W/BddyU
	UTXbCqFPp0Lmy8qDJEPEDviSh7J+Bac5c1+tUpWlsRtABIwsyxzMcIyL2Mv8zlHk
	sC3D04ipDzNbTd0mdqTd5rs3tltqirW4coPOGC0B27TW7n3j5D4jIUSU7P6n215X
	TvXzpJ0OylCbwSCoKF3SXv3cBq3OrudeZ7guOyanqVrONhqYL9hlPdJcP13oaQrj
	uu82lSyrEmptxfTKBOnHR8cRDqCJ1kQK8jKRzB2RQ9y/Th++V6x6TcNYTBRs1dU0
	e2ePcuKk1VqnZtnKhA34Wn4ZQWP/IHpK7ic3g9egRKn3LDvBTi6GQBHt++qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124672; x=
	1662211072; bh=VSr0av52FF/X96STc3yWhqiOBdkk8IpIl/76LTRVqS8=; b=B
	XC/2KNbMOt//W1bN4mt0XvC2Lityps22BgHcoWptFd8r5UDbt/P0nNUCCsQPcV8j
	ZSQVFyfdFV3HaLKJP2UE5nENEkCtoZCEySo2Y6jDOSe1Dv4EJN4EDAEhzVY9INRj
	Hdi06pgxWr8KNuGpVHKIDkyQIVB2FQkFTCKJWYyyF5dFbojXOdx879jspziBd7Rz
	5lyjh9yfG0vAeEtaM77qv974ZLz6crXljmbeU4Jf/S93XmtCKYLP5N4KHk5FcVUZ
	Fio+WXFSSKCetm6OHt3+NV0vjt89laz1sTcTE4xKwosKVLKAr2KWRNVi7CY4PsQn
	UXY/4C9/dt48w+DUOATRg==
X-ME-Sender: <xms:gAISY_rPk4ELAvBsdUcBfaAXvGLYB7Tb4LdchRes44AKFsdJBxhn0A>
    <xme:gAISY5pFOMfSWWtJO7CQf9EmH_9uvFkxskYKnla2YUveMNUKfQElTctaHP92RCO7o
    I6nKq65hvXn2w>
X-ME-Received: <xmr:gAISY8NW1g6y1Ylie567UDDflnkteZG5Sn-4AkIyUcZU6ddTeWTSTXIrWtZKQYU_uchyF_JFYrt7A897MjUMxisFP1iNzM9WJqHkV7D8803tKalQiQt1KA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:gAISYy6P3T2n-rlx0jPEaoERFrRcZpW5T2OFbu64OKYCh8l_N5gbww>
    <xmx:gAISY-4OpYS1CYhageueaspOs_xW19qm6l8PB2Bjf9kFR0d1vbTxXA>
    <xmx:gAISY6jL_20RO3aNUclT1SeHzOygvn9VgRg7SeI7ZVrMpEEwP9NRHA>
    <xmx:gAISYwQ5ZTdHukQeVFpShf99Kau1WajaVcj_A7nUWz2dvtnB5R7zUQ>
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
Subject: [PATCH v6 06/10] drivers/char: mark DMA buffers as reserved for the XHCI
Date: Fri,  2 Sep 2022 15:17:27 +0200
Message-Id: <c6a6e01e81797592b106f1557a5a64aac5a4b717.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
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
index 8da76282259a..fc9745f7c2ac 100644
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
@@ -1103,16 +1112,22 @@ void __init xhci_dbc_uart_init(void)
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


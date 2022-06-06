Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6453E02E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342173.567325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bv-0000PY-MF; Mon, 06 Jun 2022 03:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342173.567325; Mon, 06 Jun 2022 03:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bv-0000EZ-Br; Mon, 06 Jun 2022 03:40:59 +0000
Received: by outflank-mailman (input) for mailman id 342173;
 Mon, 06 Jun 2022 03:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bt-0006LY-6L
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:57 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78aa8a0a-e54a-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 05:40:56 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A3D45C00B0;
 Sun,  5 Jun 2022 23:40:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 05 Jun 2022 23:40:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:54 -0400 (EDT)
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
X-Inumbo-ID: 78aa8a0a-e54a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486855; x=1654573255; bh=GtGzwElcnt
	Lkp+5KlVnKOJoP8pGSO5IG2VUoVVDwK7c=; b=Bg0fF7DTBeCgzVA0LNP6vSeH1Q
	1OB5C3aTEjXpNqmG+oYnnLfamf2ZaaicKWuv7EM+8lYxq8k268pCfe+L27oEXpgu
	whbDko5RJBACdRywSdg8oxvXnqSJnLfcSqZc8wmEsEPJbcyndLjcdKmtfJhzOMHj
	cOoAp8WnGms8//keHBb9gwZ5HTgF3M4RCh1P7ywj/Ze7YOf7cDCZbJVtw8RBMvV9
	sHwMC88QUJuHcJxUX/GZRocP0qBk+IbrdFYPbtka2RBVlWv/sbAiD7QR3BKMQZGZ
	l17Lp9Z8AA5101ExmYk121SNjAotISU68k95kjAmCYXu+S2w2/t9q6yV2wgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486855; x=
	1654573255; bh=GtGzwElcntLkp+5KlVnKOJoP8pGSO5IG2VUoVVDwK7c=; b=K
	bZgKOu3WOFZ5Zhqjrv+muQsi/hcSa6CrxOO1wYyqaEzQ8gtdQwFtE/0z1nhMVXcC
	TjXrReM6re8Z9SJA9C2M349Bsh+MmOlZDz0PEciHNl4Ta11ExcWvqS8ExIVmiQTp
	XIuCuy7n1/mwg0HDBa2nhKZZsxW6DIDX9wCquZuuPdEI6cfBkGZ/MEQXYOrww9kk
	IGoysPSVrVOC/3KQ+DcMcRT3mqOfmo5mlKNrJy2STWc+qCctvMlI573otSEOaz0s
	YtzcnvhECXyGaEGffqUqdmCLDuSL/nv3VniEZM+QtWg4TlWTlwFccXGz109e7jj6
	J8a5yS2H/Wkwk6G0+DygQ==
X-ME-Sender: <xms:R3edYqew8ASbESIylszDxCJ8Fo6RoMV9c3ZfshRhb6YJcHj9Uq7C2A>
    <xme:R3edYkNdG025BFxsKTqBbRFOhkKvfi3SEyvZmOwTZc1NKUaXhvdU9qzTixSlaUrG9
    upey8gi945tnA>
X-ME-Received: <xmr:R3edYrg_lXVN8x960K06R45vIul-9av6ums0no_0Zfzl0laKwob9X2O3-nZzKJh1phkLZDZA-wyIkkJeFiIo-R1pALVh4uZX5IDIkv89_8FMNeoSOtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:R3edYn_dTrpJrMe4pV_n1MCQhj6Ebvnh1REPa5tzz2kVrx1GKgQ17w>
    <xmx:R3edYmst7L3ZhDoKZjiAwNPs8E3Tug_9PL6xJ6wv4q52K_be_m62bw>
    <xmx:R3edYuEU6DcWo8I5fT4wUUIdKby6C0p5TgwK_PyLY920UmseT_5Sng>
    <xmx:R3edYqiNl3nvUXxNF1ssdQF7jMGKx4WLtfuBTVODgHABghkTNppPMg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 10/12] xue: mark DMA buffers as reserved for the device
Date: Mon,  6 Jun 2022 05:40:22 +0200
Message-Id: <2080c30addd42a0a6d72c4608da54cbc3fe2d860.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
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
 xen/drivers/char/xue.c             | 46 ++++++++++++++++++++-----------
 xen/drivers/passthrough/vtd/dmar.c |  2 +-
 2 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index 632141715d4d..8863b996c619 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -26,6 +26,7 @@
 #include <xen/serial.h>
 #include <xen/timer.h>
 #include <xen/param.h>
+#include <xen/iommu.h>
 #include <xue.h>
 
 #define XUE_POLL_INTERVAL 100 /* us */
@@ -110,13 +111,21 @@ static struct uart_driver xue_uart_driver = {
     .getc = NULL
 };
 
-static struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
-static struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
-static struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
-static struct xue_erst_segment erst __aligned(64);
-static struct xue_dbc_ctx ctx __aligned(64);
-static uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
-static char str_buf[XUE_PAGE_SIZE] __aligned(64);
+struct xue_dma_bufs {
+    struct xue_trb evt_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
+    struct xue_trb out_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
+    struct xue_trb in_trb[XUE_TRB_RING_CAP] __aligned(XUE_PAGE_SIZE);
+    struct xue_erst_segment erst __aligned(64);
+    struct xue_dbc_ctx ctx __aligned(64);
+    uint8_t wrk_buf[XUE_WORK_RING_CAP] __aligned(XUE_PAGE_SIZE);
+    char str_buf[XUE_PAGE_SIZE] __aligned(64);
+    /*
+     * Don't place anything else on this page - it will be
+     * DMA-reachable by the USB controller.
+     */
+    char _pad[0] __aligned(XUE_PAGE_SIZE);
+};
+static struct xue_dma_bufs xue_dma_bufs __aligned(XUE_PAGE_SIZE);
 static char __initdata opt_dbgp[30];
 
 string_param("dbgp", opt_dbgp);
@@ -149,17 +158,24 @@ void __init xue_uart_init(void)
         xue->xhc_cf8 = (1UL << 31) | (bus << 16) | (slot << 11) | (func << 8);
     }
 
-    xue->dbc_ctx = &ctx;
-    xue->dbc_erst = &erst;
-    xue->dbc_ering.trb = evt_trb;
-    xue->dbc_oring.trb = out_trb;
-    xue->dbc_iring.trb = in_trb;
-    xue->dbc_owork.buf = wrk_buf;
-    xue->dbc_str = str_buf;
+
+    xue->dbc_ctx = &xue_dma_bufs.ctx;
+    xue->dbc_erst = &xue_dma_bufs.erst;
+    xue->dbc_ering.trb = xue_dma_bufs.evt_trb;
+    xue->dbc_oring.trb = xue_dma_bufs.out_trb;
+    xue->dbc_iring.trb = xue_dma_bufs.in_trb;
+    xue->dbc_owork.buf = xue_dma_bufs.wrk_buf;
+    xue->dbc_str = xue_dma_bufs.str_buf;
 
     xue->dma_allocated = 1;
     xue->sysid = xue_sysid_xen;
-    xue_open(xue, &xue_ops, NULL);
+    if (xue_open(xue, &xue_ops, NULL))
+    {
+        iommu_add_extra_reserved_device_memory(
+                PFN_DOWN(virt_to_maddr(&xue_dma_bufs)),
+                PFN_UP(sizeof(xue_dma_bufs)),
+                (uart->xue.xhc_cf8 >> 8) & 0xffff);
+    }
 
     serial_register_uart(SERHND_DBGP, &xue_uart_driver, &xue_uart);
 }
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 661a182b08d9..2caa3e9ad1b0 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -845,7 +845,7 @@ out:
     return ret;
 }
 
-#define MAX_USER_RMRR_PAGES 16
+#define MAX_USER_RMRR_PAGES 64
 #define MAX_USER_RMRR 10
 
 /* RMRR units derived from command line rmrr option. */
-- 
git-series 0.9.1


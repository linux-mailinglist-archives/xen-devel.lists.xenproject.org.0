Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1C540171
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343354.568762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEz-0000Fv-2A; Tue, 07 Jun 2022 14:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343354.568762; Tue, 07 Jun 2022 14:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEy-0000B4-S5; Tue, 07 Jun 2022 14:31:28 +0000
Received: by outflank-mailman (input) for mailman id 343354;
 Tue, 07 Jun 2022 14:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEw-000619-K1
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:26 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 823b965b-e66e-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 16:31:25 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D8C015C01A9;
 Tue,  7 Jun 2022 10:31:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 07 Jun 2022 10:31:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:23 -0400 (EDT)
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
X-Inumbo-ID: 823b965b-e66e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612284; x=1654698684; bh=bVSELf5uLQ
	6uKc/B+4q8TUi8lxYysoFD6qxpJaiy/dU=; b=XVGLR8gbDGDMJ01qLDdQa2s0RW
	bwVjQzaCsTdHatp1qUKzzjlbTwJBKXg25OCF8wYvZoSvKl2f0VECtYye3DpnBRPu
	bwqERkdJ/khzDWLbSUPfEgy99MlYjf2jxwzfvzx7h3FquGFG2jhHjRF70K6vtGag
	ayYkckmyyfCZHRWYSi4EXr0Wiq7h38KIV6kapI6wxAqwCTeVm3B6jUdfKHPMpiWu
	bVhxKOctQKzqe7gnWHNE97EeRaHp5DMtQCO/hxvP2N8B56SDWLV/fGtMALZLjUQZ
	LdDK9KL+XOSGIRbglmwISUMKXVsrglYW4cK8nHHudh7voVstTI80rKYKDYHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612284; x=
	1654698684; bh=bVSELf5uLQ6uKc/B+4q8TUi8lxYysoFD6qxpJaiy/dU=; b=S
	29bcsaAtrem1xMhKQHKkXzBYB57nkIGxGhCiFTiin1F7h/K0pUe6G8mMH62j1zuC
	kON8mTJN0pcJPMODq6oAaPudqfOeWpc02sNX9vpBFD5qGlwlI+X3wCNYR+scmnhA
	l6FC3IBFIrz3g9/j3l7vrZ+YvRF7g1Nj39yiLG/iYe45ymogY0ZFplYnQw/23Rej
	m8MbDF40qsRSCYR4LScwt+2YX0oYfSO617v7EwUgegQER+t8wbH3tLyaL5VRDpuF
	hX6OzsaTnNrpp/FXe4dQzBSeirp6mPZos/WvDk+kxq/8pcfNqLk+vR2YGiU5gGvT
	xWL8L684T7FmSsLoRdjog==
X-ME-Sender: <xms:PGGfYs6zgr0jaxbThCymxdp1MXrvda5TvEdmEJAfij-8f42qYCyHig>
    <xme:PGGfYt6-D8zFTfsPCBAyK_5fqxuR8fEvrrNWsnomq6fexofxleNl9aH5gVmoeH1WD
    oFMnPdA6Jd_Eg>
X-ME-Received: <xmr:PGGfYrcQOHgC8ky9q3Td8DkbwK4RDRXxVC1WrRod5OF-_nTDNX_3fv4t_a_fTGpXLuj3Xn-xMnZufQmRdBkiJ45-gtW5B0sOPTSQsZ6QYe0NyKGc_Es>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PGGfYhL0eu40Z3-R6hE2Fl30oqcE1qTxjNWM8kflqFWwI1qR6RBQQw>
    <xmx:PGGfYgLcfdrpmn53m1LYlf0LYTL5Ie6nZl34eTNza-8F3RFyhydF7A>
    <xmx:PGGfYiwV_ynWb3Ou5T3iBK0TpCp3kpGH5chzYyX71CZpO1ZHcO9yYQ>
    <xmx:PGGfYo-oXIg3gy5mA5DCK92vITUFzeJ4MrsrKq3b2wHTpYwpTSEjHg>
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
Subject: [PATCH v1 09/10] xue: mark DMA buffers as reserved for the device
Date: Tue,  7 Jun 2022 16:30:15 +0200
Message-Id: <f1f5d65f08915f9977d46e0dc2ffb9296298cd3a.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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

Using this API for DbC pages requires raising MAX_USER_RMRR_PAGES.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/char/xue.c             | 45 ++++++++++++++++++++-----------
 xen/drivers/passthrough/vtd/dmar.c |  2 +-
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index b253426a95f8..6fd26c3d38a8 100644
--- a/xen/drivers/char/xue.c
+++ b/xen/drivers/char/xue.c
@@ -26,6 +26,7 @@
 #include <xen/serial.h>
 #include <xen/timer.h>
 #include <xen/param.h>
+#include <xen/iommu.h>
 #include <asm/fixmap.h>
 #include <asm/io.h>
 #include <xen/mm.h>
@@ -995,13 +996,21 @@ static struct uart_driver xue_uart_driver = {
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
@@ -1033,15 +1042,21 @@ void __init xue_uart_init(void)
         xue->sbdf = PCI_SBDF(0, bus, slot, func);
     }
 
-    xue->dbc_ctx = &ctx;
-    xue->dbc_erst = &erst;
-    xue->dbc_ering.trb = evt_trb;
-    xue->dbc_oring.trb = out_trb;
-    xue->dbc_iring.trb = in_trb;
-    xue->dbc_owork.buf = wrk_buf;
-    xue->dbc_str = str_buf;
+    xue->dbc_ctx = &xue_dma_bufs.ctx;
+    xue->dbc_erst = &xue_dma_bufs.erst;
+    xue->dbc_ering.trb = xue_dma_bufs.evt_trb;
+    xue->dbc_oring.trb = xue_dma_bufs.out_trb;
+    xue->dbc_iring.trb = xue_dma_bufs.in_trb;
+    xue->dbc_owork.buf = xue_dma_bufs.wrk_buf;
+    xue->dbc_str = xue_dma_bufs.str_buf;
 
-    xue_open(xue);
+    if ( xue_open(xue) )
+    {
+        iommu_add_extra_reserved_device_memory(
+                PFN_DOWN(virt_to_maddr(&xue_dma_bufs)),
+                PFN_UP(sizeof(xue_dma_bufs)),
+                uart->xue.sbdf.sbdf);
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


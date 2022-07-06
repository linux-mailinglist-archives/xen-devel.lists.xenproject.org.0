Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF53568CEC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362339.592409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971W-0001w1-H9; Wed, 06 Jul 2022 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362339.592409; Wed, 06 Jul 2022 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971W-0001im-7Z; Wed, 06 Jul 2022 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 362339;
 Wed, 06 Jul 2022 15:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971T-00081g-OE
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:33:03 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec2a991e-fd40-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:33:02 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 389A05C0143;
 Wed,  6 Jul 2022 11:33:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Jul 2022 11:33:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:33:00 -0400 (EDT)
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
X-Inumbo-ID: ec2a991e-fd40-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121582; x=1657207982; bh=Eq84+x/gpm
	KZZ+zmuklaLt+FseOD4ttC2HJ0766Jnt4=; b=hdYwMC+EKepNtFMV62HBLMx6DX
	2/bNz/1JTmvwst161sTqM5pbMQ1+evWDgU6l8T2X4FgOw6MlqyQjiDu/ZD9aH3gM
	vC1Z7dpymX9g+Neg4UcMLR3PamkmtRC6gi0CT8qmMbYzgIG2pClm71V4yk/0r4Q3
	rn3tDu+Fo05b2cCfHqAdaDZ1HroQnSKvNboGwO1G2vGZCYSyZIQVbYZOuaXjm5NM
	yEv8GABSWqYfN7qLXNraQFaqT4gARB6iuSosZ8MM32rhNO+spzInEZrZrWPxJAwd
	HK8Pc1R7m9tpyvRqCALy+oh7OAFm1fOuXpCipduOY40NZMQJoJs9z1UAoKQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121582; x=
	1657207982; bh=Eq84+x/gpmKZZ+zmuklaLt+FseOD4ttC2HJ0766Jnt4=; b=s
	WVpQNg50CH28xPgvzg7I2ZWewg2wzY0XkUNrHReV2tGrixzC5Sbdn/5hFP623Y4o
	ppH5SfpSD1MUg8lXnSqVOBJ2xcR3iSR9ZNfpXiKrziVAhOPicxi0pQyLQQNxwixn
	+emgYL5SLYfsGTL/7YEkvhA4dx69NxvRF6SRYx/k9VLpP9wayaAMzImvuXig8noa
	9ZtSJftPqSZvY0m4zDCxghlt4r6uQp+A41X/BJZ3vuSPwqFHtVbUYDnMq1J+yzwc
	YYHqWJdbiDtRmT7Bq1zq3rWt514la6SCWcPT/xDC9lrk6PPWJbVglag6KjpUbkau
	6U9D1iix3i/rMcm0b65eQ==
X-ME-Sender: <xms:LqvFYm8FQgPP6qJtvnBMM-k9d4hzXBhQxwpoFzS7RjBVkGn3W7h91w>
    <xme:LqvFYmsmSEB1EjKOzdLzHHo02nP-ADn8wgvU-X77k0a61_6UPUsunX4A_CmC4LoxF
    nUNoIFJOf_j2w>
X-ME-Received: <xmr:LqvFYsDVQF0zmLHcg_15XCBI1VOh3t98yxqmYd3MNnV9gnBvr3bndhwujxp_k9D6DhiqBEh1Mt91ewM67IM4MwapMRmHkDwPlWAxFhOsAMru30VUSmc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LqvFYufuiMbcSb-pQRhVzzcfIZMnXU5FNtx6jsa-14_WtVnLqfKN4Q>
    <xmx:LqvFYrMGKVot9lLvGdrgRWhwJ2Vr7MEKGcxdnCGxIvVCDEIQGkNYBQ>
    <xmx:LqvFYolIZyfqHUfCPTpQEuE8NaRJDwtpf6qPnINLMMhZ6H4JeHN3MQ>
    <xmx:LqvFYnCkhxnsofJVu-01VryMh-qHrKUtNZgsuMNW9c2Twh1OweR1Rw>
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
Subject: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device
Date: Wed,  6 Jul 2022 17:32:13 +0200
Message-Id: <0a30e15d9195d0cd09a5ea94297dc8a74bc12c97.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
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
 xen/drivers/char/xue.c             | 43 ++++++++++++++++++++-----------
 xen/drivers/passthrough/vtd/dmar.c |  2 +-
 2 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/xue.c b/xen/drivers/char/xue.c
index 9d48068a5fba..a6c49bb43e97 100644
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
@@ -952,13 +953,21 @@ static struct uart_driver xue_uart_driver = {
     .flush = xue_uart_flush,
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
@@ -990,16 +999,22 @@ void __init xue_uart_init(void)
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
 
     if ( xue_open(xue) )
+    {
+        iommu_add_extra_reserved_device_memory(
+                PFN_DOWN(virt_to_maddr(&xue_dma_bufs)),
+                PFN_UP(sizeof(xue_dma_bufs)),
+                uart->xue.sbdf.sbdf);
         serial_register_uart(SERHND_DBGP, &xue_uart_driver, &xue_uart);
+    }
 }
 
 #ifdef XUE_DEBUG
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


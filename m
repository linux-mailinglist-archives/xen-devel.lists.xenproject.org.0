Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5224D4973
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 15:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288418.489045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSJrx-0001qD-R1; Thu, 10 Mar 2022 14:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288418.489045; Thu, 10 Mar 2022 14:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSJrx-0001lw-KG; Thu, 10 Mar 2022 14:34:21 +0000
Received: by outflank-mailman (input) for mailman id 288418;
 Thu, 10 Mar 2022 14:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g47H=TV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nSJrw-0001j9-93
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 14:34:20 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aff97be-a07f-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 15:34:19 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 657353200D25;
 Thu, 10 Mar 2022 09:34:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 10 Mar 2022 09:34:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Mar 2022 09:34:15 -0500 (EST)
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
X-Inumbo-ID: 2aff97be-a07f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=GGlD5fqFfDHwCS2CyKZrzEWK6VNmaqqEkjCd1dwys
	3E=; b=nAvSF+HvetmwTrmYzR6hO9z+RwIur5L+Wzpzs53Y+EDx6rtWWpis2HmnW
	wD9irOAuXdFBeXR4Pc9VQ6siRcIS7il7fM5mbiylWIHapF5Wys/Cv0dksb5nbeAJ
	teU3LTA0xooEG3BT95Bp5OHEppoKmvHAU6zSbgottfW8Y1B5rzOqP0rLuS2VOeph
	13Nd9MIO81Z4jS/ZEk0Jc2hF6qGg7EiWoMwTzmCn/N8G03I2DL2DloDmcxAD9Kvm
	866eugbxBF1hKfcuSJSW9dpiWbZPcRK7NEzoA5PQHDxmlNA5awBV5/OXag4TyUQT
	JiBhY17fAIWxhumMehCGM9IPWQl1g==
X-ME-Sender: <xms:aAwqYrMSVgRddA7mjT6DbuALnmXrJIRKntdyGWTVSc2Mouo800OE4g>
    <xme:aAwqYl_kbOxu671-XH0HkN0jPqiqUMft9Ckb5rsXvwUK-PoVfndG9qTIUmlpn_p99
    2ZLba3VLJRRYg>
X-ME-Received: <xmr:aAwqYqTufmDynZ3IppvqtZWmGikaS8639Y4EfyZhhs1qDOMlsBQLWG5USa-fl9tMifV3TShzPkURtmLKaGMWssJyLccXbgVDLlYvbvo5N6lgFFnwK4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvtddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtohfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeek
    jefhkeffkeekkeffiefhhffhledtgfejleeikeevffegfeelueehueeuleeljeenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:aAwqYvtfhpxGzH8QaI9b4L8xGIBplfmX2Cfe-Kx5jogx6J2_jNy3iw>
    <xmx:aAwqYjckGsGfkSmkIuDlIPCGf0WgFv0BP0cfCgZWgdoAxHhrIsNvUA>
    <xmx:aAwqYr1xRUqwuS4kxt5cFqLzZO7eFmiBQz7V1XVBQuzJR6IF1Ywbuw>
    <xmx:aAwqYkHAMwT77VMOCgjL3cwRY-Dil_fAerfnavWRv2oQwDBorAjJLA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] ns16550: Add support for Intel LPSS UART
Date: Thu, 10 Mar 2022 15:34:03 +0100
Message-Id: <20220310143403.50944-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

This adds support for serial console as found in a laptop with TGL-LP
(StarBook MkV). Since the device is on the bus 0, it needs to be enabled
via "com1=...,amt", not just "...,pci".

Device specification is in Intel docs 631119-007 and 631120-001.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
This adds only a single device (UART#2) to the table - the only one I
have present, but the specification includes other device ids too. Should I
add them too? I don't have a way to test that, though.
---
 xen/drivers/char/ns16550.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2d7c8c11bc69..edf981db22f4 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -91,6 +91,7 @@ struct ns16550_config {
         param_exar_xr17v352,
         param_exar_xr17v354,
         param_exar_xr17v358,
+        param_intel_lpss,
     } param;
 };
 
@@ -822,6 +823,16 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .mmio = 1,
         .max_ports = 8,
     },
+    [param_intel_lpss] = {
+        .uart_offset = 0x000,
+        .reg_shift = 2,
+        .reg_width = 1,
+        .fifo_size = 64,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = 1,
+        .mmio = 1,
+        .max_ports = 1,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1066,6 +1077,12 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x0358,
         .param = param_exar_xr17v358
     },
+    /* Intel Corp. TGL-LP LPSS PCI */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa0c7,
+        .param = param_intel_lpss
+    },
 };
 
 static int __init
-- 
2.31.1



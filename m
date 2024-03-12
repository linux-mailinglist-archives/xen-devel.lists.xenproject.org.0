Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF138798EC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 17:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691955.1078614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4x6-0005Yq-4g; Tue, 12 Mar 2024 16:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691955.1078614; Tue, 12 Mar 2024 16:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4x6-0005Wc-1t; Tue, 12 Mar 2024 16:26:08 +0000
Received: by outflank-mailman (input) for mailman id 691955;
 Tue, 12 Mar 2024 16:26:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk4x4-0005WW-0t
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 16:26:06 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ec0686-e08d-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 17:26:01 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id A04A81C00107;
 Tue, 12 Mar 2024 12:25:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 12 Mar 2024 12:25:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 12:25:53 -0400 (EDT)
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
X-Inumbo-ID: 34ec0686-e08d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1710260755; x=1710347155; bh=NwcXswoAPzQCq70LrrXUbpoKQWinPR2b
	G2OYKwUeiIk=; b=NdyzPkKfBUnMCRDXJkCF5Efyra+fwbVJBjS+/qpCdrw8U8f4
	+QLm6/ZkLwx70P8eQzOuGrt0eDN2P0WiZTSCu+nBmgHa3x+cxhdIV3Dw82V5EwN5
	tuN9waxgYPY5ZacOoPegaKWcaD8D0iFaNPu+I3rFpu6wb5zGvkos1crhpmm2KxaA
	IqkLe6OvINtXHvoo1OUeGRtdGOc7cYV86meh19WtRPPjI1cqY85MJY4pOoDmnJQm
	iclMOetVya90OvHhsRRde+DHTkhLx0w1Z8t1wWOCjeJyVKAN66daSj8/xCpg0PSD
	2CBEvG903l17JqRsdh2LpNIafV8YjNRE8PrD+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1710260755; x=1710347155; bh=NwcXswoAPzQCq
	70LrrXUbpoKQWinPR2bG2OYKwUeiIk=; b=TrL+78tDNL6FQSO6FRdSMc+tja5Ce
	x0VchrnpX1r/M+hLHObz1k07WF1XfmGPSu6bfXkRCckD1wUleXs+l1onRAZFzW/e
	vHkT6QPb394eblf2pbGctHlKLrmL74iHzr5Rw/AqqRX7tamdZgp4kBCd0u8IyP3P
	tJMMHYFbxZRqnj2G/3iUOhdBpZmACmGj+1OcUoZKRK7FMcd5jhKslxW1fedmQhFq
	YrLVU1LyYfVB7DJNBBSl8Z5Q9tQeyPGawwgz2mNP/w6+hxuUwpnwCk0MZsL8m26k
	8ud0irLwN5gTMemH5HREfiZRUN4zrwZhJZwOEXPwHTv5JbcoH2lhDVW4A==
X-ME-Sender: <xms:EoLwZYYhSn2n3-qIrv87FKX4_EKBU5jObj7-IWzr2r-fIXvevJSMgQ>
    <xme:EoLwZTbGLFbd3qtn2J2vkW2bg3VTDr6o0P_cCMGZJo8HByEOiwP5G6tUbJyApssqy
    AsCtlA6Z5_-lg>
X-ME-Received: <xmr:EoLwZS9BTXBiMbMyUO60PLVa4zbIVYfZU2WlPzAK7GaPokTHunjM1aiJxGB9SxXcjbAsgrR7q7l9kCmwnP73Cm3Fxp8InONHBJeD8CriyUP46hJ7xWY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:EoLwZSpnrFeUCBue2np7WZQJXxbOqgjh_TiY5sSF3gnaP5wEv8h3sQ>
    <xmx:EoLwZTptE_wT6-LE5DW4TQWldi0MQk65EbNr-_sc7dqJtCb4i2Bjeg>
    <xmx:EoLwZQQ6xkYtWJbQ7cIV-h0tqPwQeThD2AgM9SX4GfOFksOQVDqSXw>
    <xmx:EoLwZTrd06BQOBQT-uNnSgzUOlUADVaJa5etABH9qFhoz-7uD6APbw>
    <xmx:E4LwZQjCd_aEy4FdJJW17iEPhGPMazR8nNYwyqZ2d2KhFjXC-xbgQXpWJKU>
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
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] IOMMU: store name for extra reserved device memory
Date: Tue, 12 Mar 2024 17:25:14 +0100
Message-ID: <20240312162541.384793-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be useful for error reporting in a subsequent patch.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v2
---
 xen/drivers/char/xhci-dbc.c     | 3 ++-
 xen/drivers/passthrough/iommu.c | 5 ++++-
 xen/include/xen/iommu.h         | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 3bf389be7d0b..8e2037f1a5f7 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1421,7 +1421,8 @@ void __init xhci_dbc_uart_init(void)
         iommu_add_extra_reserved_device_memory(
                 PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
                 PFN_UP(sizeof(dbc_dma_bufs)),
-                uart->dbc.sbdf);
+                uart->dbc.sbdf,
+                "XHCI console");
         serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
     }
 }
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 996c31be1284..03587c0cd680 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -682,6 +682,7 @@ struct extra_reserved_range {
     unsigned long start;
     unsigned long nr;
     pci_sbdf_t sbdf;
+    const char *name;
 };
 static unsigned int __initdata nr_extra_reserved_ranges;
 static struct extra_reserved_range __initdata
@@ -689,7 +690,8 @@ static struct extra_reserved_range __initdata
 
 int __init iommu_add_extra_reserved_device_memory(unsigned long start,
                                                   unsigned long nr,
-                                                  pci_sbdf_t sbdf)
+                                                  pci_sbdf_t sbdf,
+                                                  const char *name)
 {
     unsigned int idx;
 
@@ -700,6 +702,7 @@ int __init iommu_add_extra_reserved_device_memory(unsigned long start,
     extra_reserved_ranges[idx].start = start;
     extra_reserved_ranges[idx].nr = nr;
     extra_reserved_ranges[idx].sbdf = sbdf;
+    extra_reserved_ranges[idx].name = name;
 
     return 0;
 }
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 9621459c63ee..b7829dff4588 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -329,7 +329,8 @@ struct iommu_ops {
  */
 extern int iommu_add_extra_reserved_device_memory(unsigned long start,
                                                   unsigned long nr,
-                                                  pci_sbdf_t sbdf);
+                                                  pci_sbdf_t sbdf,
+                                                  const char *name);
 /*
  * To be called by specific IOMMU driver during initialization,
  * to fetch ranges registered with iommu_add_extra_reserved_device_memory().
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B288D4D3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 03:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698289.1089798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJRg-0001XM-Mq; Wed, 27 Mar 2024 02:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698289.1089798; Wed, 27 Mar 2024 02:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJRg-0001UG-JB; Wed, 27 Mar 2024 02:55:20 +0000
Received: by outflank-mailman (input) for mailman id 698289;
 Wed, 27 Mar 2024 02:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpJRe-0001U3-LN
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 02:55:18 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a39b59-ebe5-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 03:55:17 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id 2253013800D7;
 Tue, 26 Mar 2024 22:55:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 26 Mar 2024 22:55:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 22:55:14 -0400 (EDT)
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
X-Inumbo-ID: 70a39b59-ebe5-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1711508116; x=1711594516; bh=iR3RPwsjfqGgzxywcjM0OhjhFEhCgiiP
	JbMrbI5Zuwg=; b=VLK8ulKmr9ZkVPSIV9hmARgWOkK+fBJsr7vD61EeCQ2kwCbm
	NqAZoYDx0DgJO4poyZJp5A9nFIAONdpWTMYA4nUF3R27N60RwD1uvWtjZfeouM+m
	dBzHihoM8Ty1gueMNLhhlo/xplBmcrV1DDSPb1kR0N7a6NOwbyRFqX5Rlgw8bant
	di54PX0hWOwZCuNZi1CGbw20nrlMvDnXOCMEreORYwD0MaJYLsvIRPBm+kDguECu
	v5BAThKgxNwFE476yKw4wZDc/PZMoclvoyMU0FEUSm6PBXXE4hDo0T9t0zmITLBC
	DOUPuY+dNp77xClHXxTjQpvo786WmlYJcQ46uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1711508116; x=1711594516; bh=iR3RPwsjfqGgz
	xywcjM0OhjhFEhCgiiPJbMrbI5Zuwg=; b=kVr9UoO3CmIwIJ+s7xK9rnEd//d4E
	whS9jCN3ZCwi7bBVGnqAoRCR9+v2mv+b+LSVkZH6QkRlsvxafqRcdn+rDhIm9Soe
	TASs9GfsvEkrhw4gxpO/F7itccFEMVQBVeLT5rPDVn97x+kDMtlhH52ymR8YyuLh
	bGCye4mW6FvFkWgcKXOWIRJ54YbLHxR19Dj26+IAbhSlFwl3cfLINLhbggWLHALT
	6tl1yQEe8DyOHrDfAvARowMAIwU9wKUpKp9Nhm+YBc7WiglLQV++oJoQoW1bOQwm
	/+tuMOCXiMF8oDJUHzaH+a67F84b8g5oMqN9blNqUc05NlcCEuspKix3A==
X-ME-Sender: <xms:k4oDZjTzY57aK_wE5HqN3hqP-9wZb9ADNmn-BNMcC4yUCsOCSXB1yg>
    <xme:k4oDZkxh9dDo7NyYxfqtHUOJku8l6Tm6kFylSuSYzav95hCCRE2PLpkK3E0j0Gkpj
    NifF7i1qjg7gw>
X-ME-Received: <xmr:k4oDZo0NVf8aHx40EZdbXhK7rBYJ5Z7ZlRhpHGTkAZpC6x0FO1_m01K43XymoCHImSp32VRmtMYimovAX7267moyqfTEFOvZSJaR9BqLlPbV1DDGExo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:k4oDZjDfQioPQvmCac6Ax8L2qmrgeNhRliR1PNO04ZqT9unIJEuGtA>
    <xmx:k4oDZsjrga-Y73y_7b_hHrWwnKrhj0iXL7_qWy2nklyTqRHpamexlw>
    <xmx:k4oDZnqwbcG4xZGcfPWwfZIwT3kN7UuDWHiI9RhhCTwT43T5msuCLw>
    <xmx:k4oDZnhRV9cC_jE_q8mYZ1pVaQeWjIbTVFtEIbo0JPoBi_i7bwXRSg>
    <xmx:lIoDZhYA2_qegL6ztbkYfLXV95vgBOrMytlQPMeQqAMxZZPVTii_hQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/2] IOMMU: store name for extra reserved device memory
Date: Wed, 27 Mar 2024 03:53:10 +0100
Message-ID: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It will be useful for error reporting in a subsequent patch.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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



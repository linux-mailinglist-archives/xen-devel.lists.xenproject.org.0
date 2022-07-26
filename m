Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631F5809ED
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374939.607205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAZ-0004lL-0C; Tue, 26 Jul 2022 03:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374939.607205; Tue, 26 Jul 2022 03:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAY-0004hn-M6; Tue, 26 Jul 2022 03:23:38 +0000
Received: by outflank-mailman (input) for mailman id 374939;
 Tue, 26 Jul 2022 03:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAX-0003P0-3o
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:37 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 556b9709-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:36 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 757E45C00CC;
 Mon, 25 Jul 2022 23:23:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Jul 2022 23:23:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:34 -0400 (EDT)
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
X-Inumbo-ID: 556b9709-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805815; x=1658892215; bh=r/M8YO8NxS
	0KXBQpVOXd9NU+IPTWyvROd1xBgr9fbs4=; b=vXZrlGKoAaUGT1udv1cL6dhpyg
	wCRG4ZpDq9IXG21Z6avFkoAdI66wWzgq3BO6INFDP882IlG/BHY3XM+qiTAqNaLN
	bJOODnXTsmVrtoJgBNsgywuJDSX+QZcCYcYygy7mUP0zzIyxVIL7P6l+7+epJfM7
	eh+EjlsfGDUOTgGGSG+FFPkCv33FzmLXrvcElFXPzlAkF4/1PAU4+WgP30D20uOj
	fR9+yZRDzaW3JVAiW5IxrVlKT0R7+vtCSwYQzYtDOXiP766jNgzVffmwRQNJZSZy
	3E3Vynw88a+IjzIbo1A3/dO5yZKjoLu8DatbYTKjU4/KFAR++S9BgSrRYkHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805815; x=
	1658892215; bh=r/M8YO8NxS0KXBQpVOXd9NU+IPTWyvROd1xBgr9fbs4=; b=S
	n5ZcBWVs6JXO2qrBfnsQe5Fx4mMs60ftfsPf8MiNJp74+jEiyT824eDwhb2U8U2o
	fPSO1VKu0QGCIzIYSubMa5831nCxv7X7jGQz6lk9seQl6XR/yGCUqZvLAAeNxR5j
	GXq2V26Sls4wMtPHkZgusNwMHvyH1DRFy/zF8aTLfTxJUNigdqR3DKoFytvAH6O6
	UxwdvDD0LtBlW9RAyzaGb7kSAezM1jxZwQRFdkNnFwaD1h2NOY+eC0Mya+drY3tf
	hH8SbOFTQ2U6QDi1gzL4+/Yq+gOGt84xZ4IYYrFbPNXw0EM9FkPKzFzTD0m7ymoF
	Kzgy59Y7vJ0OaOVICXtnA==
X-ME-Sender: <xms:N17fYr7Wq6UJeoX68WxTamqccq0bF2jvqmJUpYeEXnNNSjEu_Uwijg>
    <xme:N17fYg4_N_AfJC3Mjxp2uxK6ZxQMlXtNNeKr7IXRg6p0GYd4zv6QkM7SOkv37-mkY
    JOWxIsN3tHPpQ>
X-ME-Received: <xmr:N17fYifFdCbHGSyvLCQiej_nOujbaE4If3jB28V32iIpyMPDT3K_We8RmzewykSSP_JIofxMOq-J2jdVcyrtQr2QOMWv4UTiX5YCVa_gmvIFySAd2ovY1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:N17fYsJnsB-AQ9D10SCXEmwDgCXiHhvmxg4SMqr0sYLRq7tY30vWPA>
    <xmx:N17fYvI9cBoA9_jNBIvLlPzFMEhLV4sg0KPEUt6QloZYdUrZG4nYCw>
    <xmx:N17fYlxocJFEbuCWZrqgoSIx_wF6bavD97XOAIHX1Jd9kxumaGc65A>
    <xmx:N17fYmVXth0yuYNVNfdzHhBBMBKHtvUyoSuDsUEZgb-iAVxnpDy1zQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 05/10] IOMMU: add common API for device reserved memory
Date: Tue, 26 Jul 2022 05:23:10 +0200
Message-Id: <6a99f9b99b419a20e895d54db2e345c80270248c.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add API similar to rmrr= and ivmd= arguments, but in a common code. This
will allow drivers to register reserved memory regardless of the IOMMU
vendor.
The direct reason for this API is xhci-dbc console driver (aka xue),
that needs to use DMA. But future change may unify command line
arguments for user-supplied reserved memory, and it may be useful for
other drivers in the future too.

This commit just introduces an API, subsequent patches will plug it in
appropriate places. The reserved memory ranges needs to be saved
locally, because at the point when they are collected, Xen doesn't know
yet which IOMMU driver will be used.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
 - adjust code style
---
 xen/drivers/passthrough/iommu.c | 45 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/iommu.h         | 13 ++++++++++-
 2 files changed, 58 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 77f64e61748d..74efd865ab69 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -651,6 +651,51 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
+#define MAX_EXTRA_RESERVED_RANGES 20
+struct extra_reserved_range {
+    unsigned long start;
+    unsigned long nr;
+    uint32_t sbdf;
+};
+static unsigned int __initdata nr_extra_reserved_ranges;
+static struct extra_reserved_range __initdata
+    extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];
+
+int iommu_add_extra_reserved_device_memory(unsigned long start,
+                                           unsigned long nr,
+                                           uint32_t sbdf)
+{
+    unsigned int idx;
+
+    if ( nr_extra_reserved_ranges >= MAX_EXTRA_RESERVED_RANGES )
+        return -ENOMEM;
+
+    idx = nr_extra_reserved_ranges++;
+    extra_reserved_ranges[idx].start = start;
+    extra_reserved_ranges[idx].nr = nr;
+    extra_reserved_ranges[idx].sbdf = sbdf;
+
+    return 0;
+}
+
+int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
+{
+    unsigned int idx;
+    int ret;
+
+    for ( idx = 0; idx < nr_extra_reserved_ranges; idx++ )
+    {
+        ret = func(extra_reserved_ranges[idx].start,
+                   extra_reserved_ranges[idx].nr,
+                   extra_reserved_ranges[idx].sbdf,
+                   ctxt);
+        if ( ret < 0 )
+            return ret;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 79529adf1fa5..aa87c3fd9ebc 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -297,6 +297,19 @@ struct iommu_ops {
 #endif
 };
 
+/*
+ * To be called by Xen internally, to register extra RMRR/IVMD ranges.
+ * Needs to be called before IOMMU initialization.
+ */
+extern int iommu_add_extra_reserved_device_memory(unsigned long start,
+                                                  unsigned long nr,
+                                                  uint32_t sbdf);
+/*
+ * To be called by specific IOMMU driver during initialization,
+ * to fetch ranges registered with iommu_add_extra_reserved_device_memory().
+ */
+extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
+
 #include <asm/iommu.h>
 
 #ifndef iommu_call
-- 
git-series 0.9.1


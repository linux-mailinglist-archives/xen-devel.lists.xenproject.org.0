Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC553E037
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342170.567295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bs-00081W-8M; Mon, 06 Jun 2022 03:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342170.567295; Mon, 06 Jun 2022 03:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3br-0007td-Um; Mon, 06 Jun 2022 03:40:55 +0000
Received: by outflank-mailman (input) for mailman id 342170;
 Mon, 06 Jun 2022 03:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bp-0006AI-KJ
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:53 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 767fca2c-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:52 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D2ECA5C0067;
 Sun,  5 Jun 2022 23:40:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 05 Jun 2022 23:40:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:50 -0400 (EDT)
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
X-Inumbo-ID: 767fca2c-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486851; x=1654573251; bh=9Z09zPwAMV
	UfGBsTlLDLpiIwvOBt3luu8w7C4olNcaY=; b=rfKtrEAxCdTEyWbp73pYhMWN6/
	786II0vy2qb982ghSlOhqlBaiBfdCYJYHM7lo0cK4DRoSsHLQiUrNNZPOUqy4VFR
	qbwFZMTMjo+WphmQhUnz/kRGRp4yGzSUBGGbSuHUP2ylk0tpfcB+EVFKNvDSNhRy
	xEYe7WosfAUF586LGgxo24t2Qmz3cdvgClydzreRnkhodSDijzUGRwke1wQRp5kp
	awAkewluaX9KGPuI8q054T4xzynQyTjb+wgi4ARQXggI38aD86pEu63WaXY1STDN
	Gl/MQchrJepiJE/MMrvJh2ZD7Hqgc1uIMsRjbgIc2fSfWeuATXdPDV0ZhmtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486851; x=
	1654573251; bh=9Z09zPwAMVUfGBsTlLDLpiIwvOBt3luu8w7C4olNcaY=; b=R
	JvWzyPG/YtFe/BIlHdR7UejC82pvAzRXFlCROrJfOWORsaZN8fKD4iwMROYjCC3c
	Zo54r0ilw5MiWF6oHg1tKFc7dlmspwJOKju37OwkU9jLyTmjPQ9EuhLQE5mqKTAp
	aCGQXFK9OkmbL825GBaJFTalfCo7leWkituOOd9TPuw373W+bNPNQB1KWXKHKufc
	NkP6CqM+AeK8yKlHlUGo13nw55GbWwODYBu2S0Zu9ZHIrz9FfjSLr0d3vbFmsmJz
	VQU/d2DWlfyGq6cnAtXdu5xlTWs+t2Ne6DhkEgxEE2T/n6NmtDochWlBu858sSr2
	zyX8sJ9JEbtGLu4J7CQiQ==
X-ME-Sender: <xms:Q3edYnwO7bQVWiMN3-IOTS4I02TRTwwRJbDtUaPCEWxcXnfPJdvxZg>
    <xme:Q3edYvSuOC6k-_aqrrYZnKqnvp3yCOrTQxP_endrVJE2yUNz-wOxuljfDvJC8Fzlg
    guqFDuZkIcQTw>
X-ME-Received: <xmr:Q3edYhUOonOVpVJTpeSphw6wXeEvjyDRSuiQg8RKwL47l5SmpxBEk3F9eIH-_Zdjjx8JVJXE2kIhAYJuxOm5zU8fxo2KvBM3qT5YAqF8fwNqcq7qeLI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Q3edYhhJ5krkcRvyqHDidOkKuHvf0K_naO6OQdlm1TiEmQo6oSSdNg>
    <xmx:Q3edYpBzHDgx6nbwhl_IImREVH8Vcs-m4RhoAg3Cn9FkIWb-F6qsrQ>
    <xmx:Q3edYqIwl121yafWzxRtX8eOPxQkX1Bs_v2DAwndIS3rwiB8jjpS5A>
    <xmx:Q3edYsNiDMhV-eaBjxKZ0bzq7NLvx6NV6HRlgOFQFiz1zh29XycmMA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 07/12] IOMMU: add common API for device reserved memory
Date: Mon,  6 Jun 2022 05:40:19 +0200
Message-Id: <8ba3e1cbfc7ee1d0a5da54e47f33a14c526691d3.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
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
 xen/drivers/passthrough/iommu.c | 40 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/iommu.h         | 11 +++++++++-
 2 files changed, 51 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 9393d987c788..5c4162912359 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -654,6 +654,46 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
+#define MAX_EXTRA_RESERVED_RANGES 20
+struct extra_reserved_range {
+    xen_pfn_t start;
+    xen_ulong_t nr;
+    u32 sbdf;
+};
+static unsigned int __initdata nr_extra_reserved_ranges;
+static struct extra_reserved_range __initdata extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];
+
+int iommu_add_extra_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr, u32 sbdf)
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
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index e0f82712ed73..97424130247c 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -296,6 +296,17 @@ struct iommu_ops {
 #endif
 };
 
+/*
+ * To be called by Xen internally, to register extra RMRR/IVMD ranges.
+ * Needs to be called before IOMMU initialization.
+ */
+extern int iommu_add_extra_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr, u32 sbdf);
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


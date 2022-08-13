Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D726A591830
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386021.621926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7c-0002Vd-K1; Sat, 13 Aug 2022 01:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386021.621926; Sat, 13 Aug 2022 01:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7c-0002Tl-E6; Sat, 13 Aug 2022 01:39:28 +0000
Received: by outflank-mailman (input) for mailman id 386021;
 Sat, 13 Aug 2022 01:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7Z-0000pT-U6
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:26 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c29db90e-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:25 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D71055C00C6;
 Fri, 12 Aug 2022 21:39:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 12 Aug 2022 21:39:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:22 -0400 (EDT)
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
X-Inumbo-ID: c29db90e-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354763; x=1660441163; bh=EyR4BMMeMw
	9tieHV7Sk5gSTuErx4B02LT36mG4NGEH0=; b=aRHdTaA4+Rdd3ifESI0vcKZrxa
	sGLRUkA74Z37Hmr6MyEKAreKXBq6oS8QTmO89wJVOSzmc86CfJFr5OrGIqiLfvNO
	hDctagagEZX6t+wESJ5Usxos2DTJ1wRxdALgZZTjODRrlRqne/PtMKNAsOHTAgrn
	zDn4KVxcryGLpjATAMTqXnOeGpug2lN1UUH1vRG4esNq/R3cixNedS0eCg113Box
	WJ/vnsB3l1dnOW/mMfiANCB/WzE2BTrmyqPmMf57SCNn0d7I/P2oEY42+TiErJBt
	ljha5HAqM27VU1DHk2zT3VXX9c/wprQ3zFarKoSq2Vt8joxYlkPiAHVSjh1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354763; x=
	1660441163; bh=EyR4BMMeMw9tieHV7Sk5gSTuErx4B02LT36mG4NGEH0=; b=t
	QrCFaZy2neIE40HSrCwSd2ow2tpjSNBafseD8vPxvgwqbYtgCCdsKePJTUadMe4O
	RKDWIWmXHKTDOmpGd0foGTh3Ev5jo94QtbQNVuDLoBOABRA56ER833/SkJXA1O+L
	z/jIckPl0Gl7p9dfJehSr2wm9sJOoIPPf/1/4plzD59B49RXKkOYd1qrELXie4Ay
	HESpM0EfXVqxHe8m5trqJIsjmB5mRPDolHWnfAxidg7JMTVG1L21ygjDFflWj0jN
	94n7niFPLLo5yiiuoX7Fqvbn3CJ08wdVRkCE0SoaT1r1ECO6XO/A396LC0txOIND
	+Ph11IjfLle06C1pH6c8w==
X-ME-Sender: <xms:ywD3Yh3jlekQtfHUGAPms7ioaBHdNQ0QK3jcEb5AEpFyt9zyoqog0w>
    <xme:ywD3YoHdj-uUKQoQzs0GWCUD49kEb_iQy-Dxq8ak1Ja2Kqc6B8ElUiIK6WoQEMmz5
    zl_v-hvktYOQw>
X-ME-Received: <xmr:ywD3Yh6Oj5Vc0nRfDfbJnCxmoHEGuJW3SoK1hpFY7ej2gG3o2VYTZk-JLQ5vfjNylJPTILuRcCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ywD3Yu3iWfSNOqN-_f6x0gkf1APuOhaNEa4mEGRL6RCam28n8hNPXg>
    <xmx:ywD3YkFR5sDmdz21Oc2Lg2owfbazGT4e1lgHi8bnrJHYeXXG6LCy6g>
    <xmx:ywD3Yv-a49Vb_vQurCvigzak-GfTcL1hjsE6TvyPVvTBWX6id-dyrQ>
    <xmx:ywD3YpTlV8QeV3uBo7fuaAyp7mSYAX3rRrOjxZVwNJM4z0ZtVPWPfA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 06/11] IOMMU: add common API for device reserved memory
Date: Sat, 13 Aug 2022 03:38:56 +0200
Message-Id: <2688e04266c71b3f0f9a60e2bd5fdb11776a9ef6.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
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
Changes in v4:
- mark functions as __init
- use pci_sbdf_t type
Changes in v3:
 - adjust code style
---
 xen/drivers/passthrough/iommu.c | 45 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/iommu.h         | 13 ++++++++++-
 2 files changed, 58 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 134cdb47e0dc..0c96c760fd23 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -669,6 +669,51 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
 
+#define MAX_EXTRA_RESERVED_RANGES 20
+struct extra_reserved_range {
+    unsigned long start;
+    unsigned long nr;
+    pci_sbdf_t sbdf;
+};
+static unsigned int __initdata nr_extra_reserved_ranges;
+static struct extra_reserved_range __initdata
+    extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];
+
+int __init iommu_add_extra_reserved_device_memory(unsigned long start,
+                                           unsigned long nr,
+                                           pci_sbdf_t sbdf)
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
+int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
+{
+    unsigned int idx;
+    int ret;
+
+    for ( idx = 0; idx < nr_extra_reserved_ranges; idx++ )
+    {
+        ret = func(extra_reserved_ranges[idx].start,
+                   extra_reserved_ranges[idx].nr,
+                   extra_reserved_ranges[idx].sbdf.sbdf,
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
index 1240d7762d99..5a4c04303dd2 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -304,6 +304,19 @@ struct iommu_ops {
 #endif
 };
 
+/*
+ * To be called by Xen internally, to register extra RMRR/IVMD ranges.
+ * Needs to be called before IOMMU initialization.
+ */
+extern int iommu_add_extra_reserved_device_memory(unsigned long start,
+                                                  unsigned long nr,
+                                                  pci_sbdf_t sbdf);
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


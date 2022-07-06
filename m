Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32E568CE8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362336.592382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971Q-00017g-Cg; Wed, 06 Jul 2022 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362336.592382; Wed, 06 Jul 2022 15:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971Q-00011f-5l; Wed, 06 Jul 2022 15:33:00 +0000
Received: by outflank-mailman (input) for mailman id 362336;
 Wed, 06 Jul 2022 15:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971O-00081g-OS
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:32:58 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e934b572-fd40-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 17:32:58 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 40BA75C010B;
 Wed,  6 Jul 2022 11:32:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 06 Jul 2022 11:32:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:32:56 -0400 (EDT)
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
X-Inumbo-ID: e934b572-fd40-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121577; x=1657207977; bh=ugqnVzOyfv
	4jmGK3lamfJM0o6KeQBk0JkpJmDYjEpP4=; b=ilQbqMYO7lq2qfPQyIr8RvB85w
	6g9JsNgj4wb6wzOMOE78OMT++eZaQ8cIjK8q50Ib0Kf2P2HCBDfqvdXefoiYIEba
	22yM0XUDhcSj7L3/03nsvPNAxOlIjXAYObv5BSCL6Hamc4QnSfK0D680N09u2UNa
	xD2TGL0p0Axp12gbGDhmczFjfiigTW8xiilQMIjLaTmylx+BCf9QkxoUrGegPJsY
	IQ84JZUMnw3VFUBfi4xDVCwHq7FsNJuwAgSg3JuO2Jv5dHPS5E/4KL9A7FAF25YR
	Ogh1pT0yq5ahJkiiMWwL/+YveNuvWcWr0XTiopn1VmnnVR4TZYAvi+IMgOcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121577; x=
	1657207977; bh=ugqnVzOyfv4jmGK3lamfJM0o6KeQBk0JkpJmDYjEpP4=; b=M
	6HFayEfAIjcXBe94I2gyjSLy3oulfGc8tAiaHgEkpr14I+vDV0ogAbbibU6XD6gL
	8cNLhxlSU4fANxMp/f0EfbeJYx7xBLxHRCIzOY1TXchCyo4LPTgCVGJ0Zunf8+3w
	7u3S1Z67IfsVhz3VbhHjPfv5JnmAClOxD47xfMKwBd1Xt8iafn2RpI5gyjUqlTjQ
	X/w+QocjPoXX5/1mZDZGPej63lPbjmRG8FIj5WO19aj4hnVgvUc0bBswvufpRDeg
	phRz/3eLfL+7egjvCFayhUrpWtB7thUCltZcRXO5AIP+p3EZE43ASJs+VsZYBt5I
	Y984faiXl7yGiWjy7jhWg==
X-ME-Sender: <xms:KavFYrXdZ-S425ArbyVex5U_g5KU9KgMfBePZMfN4QNK4HuU5gHcwA>
    <xme:KavFYjkgPDJUXtXfe3LMTZuj8Kiczn_2Aoc016PqBNNGKNQgxybj1DgizOG9xSLmX
    eWMmOdVBiMzWQ>
X-ME-Received: <xmr:KavFYnZGeYKaqMLTuRW6MDkS0_wLrmQnfbT3kzrqxDj7uCkMNnIEz9hg0GPtcpSMoe24panlD80jAVhwO0i5QgqIpCramEZQ-1wnZdfaKmVG618b5aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:KavFYmVwnBC-w1MgQkjYtx90ifzODOwqK3b0b-V5Ies9lZohqREL4g>
    <xmx:KavFYlld9g4yidq2N_fYPlko1wtVFHHLEdy7iI-Fn5MufBFJRWB4Bg>
    <xmx:KavFYjdRtnMn6pYWxBLgDwqLa72kF3IfupX5iEvSYcvCIQthutavoQ>
    <xmx:KavFYqxcZHOOc8iBOLOp584i3OnOQTiMkmEadNxhXaXJKAGHCIhPsQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/9] IOMMU: add common API for device reserved memory
Date: Wed,  6 Jul 2022 17:32:10 +0200
Message-Id: <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
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
index 75df3aa8ddaa..257691ad19ef 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -651,6 +651,46 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
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
index 79529adf1fa5..7640f40d77b5 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -297,6 +297,17 @@ struct iommu_ops {
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


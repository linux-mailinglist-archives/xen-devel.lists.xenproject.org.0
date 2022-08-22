Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE0559C2B5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391471.629348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L1-0004A7-5M; Mon, 22 Aug 2022 15:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391471.629348; Mon, 22 Aug 2022 15:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L1-00045r-0K; Mon, 22 Aug 2022 15:27:39 +0000
Received: by outflank-mailman (input) for mailman id 391471;
 Mon, 22 Aug 2022 15:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9Kz-0003iu-Ao
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:37 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1599435-222e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 17:27:34 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4190D3200A50;
 Mon, 22 Aug 2022 11:27:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Aug 2022 11:27:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:30 -0400 (EDT)
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
X-Inumbo-ID: f1599435-222e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182051; x=1661268451; bh=MP94SeiKov
	HRK4tURowdKY0S3+uktUUWGY/VTPo7IQM=; b=rVpDZoD2EgVX+qb2vU7p3HE/9m
	XcT4UVqyjRZuGxqiSWPtxz68mY1eKv10MIdNIhUEXNv15BJsbJE63PrD1008ZN62
	wI4RCJ+6hrscsRfkSomTmKqYB3Rqfu6htE4e09Gaq2SkXZmRepVIP9LEG9QLFQwv
	7bK8hoqnIkmQa5JJgxyNKI37xLzxhdr5VxhkHvKJG8eqAveK6NEQ9tOdlpPXF1tP
	+MAAPlwvZdPWT1zE+jVzXwXbdB0J8DG6eWZED8P7TlwXBMZPsAUfbnOUnf7x7uyd
	QIt2a5FFGOGVbE2XrPcuG8zGknhQfl/He9Yd2uDSJ+vQgA2zRAmrVltUPB2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182051; x=
	1661268451; bh=MP94SeiKovHRK4tURowdKY0S3+uktUUWGY/VTPo7IQM=; b=v
	YYp6GZrJaYSmsY8/pPoywMyt2ZxSMjwhaI4DQ53g+gmUhjrIddgEvuQtXtF4SGsm
	QWGaqBTZM/UoeVWGLfU5XOIGW4XpB2a24o5epCKqbsuGPDfO6L71HiLKjZNkUi7R
	YaQXnFvJeJXhiNszjcCNuRlZzSs2WxffSzG3aIKOGHhvW8eENsRSRdEF281XQN+T
	65TGENKlPbU03R9vP0lCq/vGIglxVjwhMvk396+HsLDuSRJti6CMIbt2sPie2DEv
	muI92oOA2j2BgZeN2TA0Nr9nyYGAcYn9WLnpx1ELBNAIRVRj8P3Bq7V2nBsYmEQP
	GYQrykhvtNqlcmT9Zxs6g==
X-ME-Sender: <xms:Y6ADYwlxW0KelMwTN6mJz-V3N8bEjK23H7adrHvG7INh03DWh4qI4g>
    <xme:Y6ADY_1Sv7IXfCJl8YNr6jVIoDQez7UHgpoCQgdLS4L2GPNUuopwS-yCkDZtLQiio
    7yazQXJnk3Z3w>
X-ME-Received: <xmr:Y6ADY-r7od4lo0tbnbuQnMbFXCfMf6Lzy7swLRrnfzSCJu3oDDc8_5_Nnv7SgzdRSzbSICehEjGpZHrG9yfQi-oZhblsgzZrOdJ5y5i4AuYIeziN9a-lig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Y6ADY8nq579-mfKrIZ8zrJSd1Cvxb_4lCUznjRSUaND-cfDxkchlhw>
    <xmx:Y6ADY-1RPw7O5M7gdjzHqQvvPl0q-LYP2XqO1GG-AKjmg8OISQiPwg>
    <xmx:Y6ADYzts84H-nzzT6wjbx_HDUbt9aykJzP0H1Itifh_2B6mVpi4n_Q>
    <xmx:Y6ADY8DPF_Ejrw3nEYkzTVuHSJkTw6HfIzrbrmjRLWXAf7UwsE_94Q>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 3/9] IOMMU: add common API for device reserved memory
Date: Mon, 22 Aug 2022 17:27:03 +0200
Message-Id: <3ee5187c066ad12e3717df6fed41de99172271b0.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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
Changes in v5:
- fix indentation, keep full "reserved_device_memory" for consistency
  with iommu_get_reserved_device_memory
Changes in v4:
- mark functions as __init
- use pci_sbdf_t type
Changes in v3:
 - adjust code style
---
 xen/drivers/passthrough/iommu.c | 46 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/iommu.h         | 14 ++++++++++-
 2 files changed, 60 insertions(+)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 134cdb47e0dc..5e2a720d29b9 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -669,6 +669,52 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
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
+                                                  unsigned long nr,
+                                                  pci_sbdf_t sbdf)
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
+int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
+                                                  void *ctxt)
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
index 1240d7762d99..4f22fc1bed55 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -304,6 +304,20 @@ struct iommu_ops {
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
+extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
+                                                  void *ctxt);
+
 #include <asm/iommu.h>
 
 #ifndef iommu_call
-- 
git-series 0.9.1


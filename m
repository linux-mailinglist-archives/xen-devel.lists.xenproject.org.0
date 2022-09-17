Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB1F5BB5A6
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408201.650947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvq-0003UH-GC; Sat, 17 Sep 2022 02:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408201.650947; Sat, 17 Sep 2022 02:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvq-0003S0-9z; Sat, 17 Sep 2022 02:51:50 +0000
Received: by outflank-mailman (input) for mailman id 408201;
 Sat, 17 Sep 2022 02:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvo-0002wS-6q
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:48 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab09f4b6-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:46 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BC6215C00AC;
 Fri, 16 Sep 2022 22:51:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 16 Sep 2022 22:51:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:44 -0400 (EDT)
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
X-Inumbo-ID: ab09f4b6-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383105; x=1663469505; bh=9gt4X0S6LT
	y3mZR525t0hd3leGbrVBuq9ANTQAYGNoU=; b=G7Jt9cFJQUz9cIycj5qrKJzoJd
	dAhbUQurOCRLigF5InxZ5ibTGHJVCebuPSKqHQen4LEuSxh3ZWw2vmnfcJhmvTZk
	TD/E/Aso7HHdHTnnYwdcnvox5JQ9b+FiGQ6/3HfmVyYdXMxzC2GIektGEmkJGXbP
	w0VaqZXAPOnSRNKZuYONon3+A2R0IPtNymwZKiB3RxIV8f75fhQK9+qQc/72ZdqZ
	EAqC/7myQAoqzlcJhnZm3gSU7mVC3OP7B0dgtoFxnaokeg5JCHu4OrSC4d5ju5gt
	tV5qa5/50vZyweGQj2qA3dwcfUvxEuWsyUXGUhJPoDhjexu5xJb5u3oNgdHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383105; x=
	1663469505; bh=9gt4X0S6LTy3mZR525t0hd3leGbrVBuq9ANTQAYGNoU=; b=n
	gBOf7m0bX4tptvMoQn64Qmiv67aIP9wowae+iD2hbHttJo3g+iWhNmWV4QKczD0s
	AM+gNK2qanRXd2eHyT88fCxCRZWF8xXhpgdmHN6cjoNL/YmFqTc4cRKHYU7gfE0Z
	pxoIZvD0tQx9fNwJCAJwHPfVOHqR3+Ed4KI0H0zi9JFJTAp/HlYi2Qv42KMVxax5
	8y60J0zVW/bTXTi9n1i8/SLIYMIMzY0b/BOw/wqWcWFays6/uPGEuidIAfKYau39
	S7JBkGy8J3sEKLFkUhaSov5CPLfPZ9D2ClwrBVmMJppaVUmXyB85TWQAA7tK1noq
	tz7gUlirUlJNUNeqgpSiA==
X-ME-Sender: <xms:QTYlY0R-fjNGga289neMWinCQWUSYmcddmZkf3O0PJa5iuJQRMFw9w>
    <xme:QTYlYxz38jjukxldzV9rSGPxvtYrEfgq8tKBszt0XufXaT7NlQHqEYpRkJfjm3EQ1
    hAak-sHrwUAPg>
X-ME-Received: <xmr:QTYlYx23ppbhXimbxeH-QII86-3Z8MQIXn6sVLPB8xlhmtsQpGFKIO9-lIEgPORJ-svTKwdKCCRqYe3OOKfk-uPIwOibuBRrFNDdWJv3Ggq_LX-UkG_prQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QTYlY4BxHycI0hBkVxWqHnoX8yVMP34jeYSq_BU9Hm3YPqkHsFVrpA>
    <xmx:QTYlY9gXoMb3UsHh_kEbE5F3eU_7oRtA11QgDPGz50epdW4spbeBLA>
    <xmx:QTYlY0rTnDNzCJgyL5T1RoIb0AVq8Qs4ZqTLWb3HdEN0s9L3UaMoZA>
    <xmx:QTYlYwtIdWAsHd8D76Z2HGBccMKRtNpzEPXPBDl_mrb1Fnw-aXXh3g>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 02/11] IOMMU: add common API for device reserved memory
Date: Sat, 17 Sep 2022 04:51:21 +0200
Message-Id: <a4c17676b62c49ee3615cf3885773f799e114162.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
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


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6855AB142
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397603.638247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YT-0000Y5-4G; Fri, 02 Sep 2022 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397603.638247; Fri, 02 Sep 2022 13:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YS-0000Vx-WA; Fri, 02 Sep 2022 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 397603;
 Fri, 02 Sep 2022 13:17:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YR-0000AI-AB
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:51 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3fed716-2ac1-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 15:17:49 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C63345C00F5;
 Fri,  2 Sep 2022 09:17:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 02 Sep 2022 09:17:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:47 -0400 (EDT)
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
X-Inumbo-ID: a3fed716-2ac1-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124668; x=1662211068; bh=9gt4X0S6LT
	y3mZR525t0hd3leGbrVBuq9ANTQAYGNoU=; b=MiatnHshx5d6NgFfeYI+7o46Ue
	SPfZBFlm7w2UWQWZCQUW7WUEtty4PntBA8vUUlVY2bJQ4Y5CRvcKr5z8lEaSx3h8
	qncssvHLqNdz1AIIaTOd9ao5mo1NKMJYg/ZXIkrJvxGhc/i/oC4v0rzvzeS7maBH
	tmMPgrO7+MWQF3pvdJvTzDAoImnhM5tNparXx3QltDF80bUtY74xSOIu5MzO9uIa
	RpzltLDzDtgm51RBU4kHKYGgWKqhLxWFGEXbmMoAxnTgWlJjxaw2NU1oSI0w5HU1
	tomJdiHuKkJq0K29OfiR9+uX4O8Fa/Vk1nx3lRE2VDSjnJP90/4/b9L9HDag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124668; x=
	1662211068; bh=9gt4X0S6LTy3mZR525t0hd3leGbrVBuq9ANTQAYGNoU=; b=b
	4E8kppmTdE9TN6p3Kk9pvHk7Z68gAHJBaDhQJO+o6YAmIqqhcEa2z0HSK+1TUz0P
	GgVJ4QW4oS5SxfNGBG1i3lm5oHFk/BvrsCODxhzMaZ04yfB/QY8P087NmM8vToF5
	X2a/OwPtGUK/miBURJFQ6aNi1dTt1NobDR5e4Llv5yn//hnUeyREP951GgOotjdR
	eLz8gCaxdVyG4kcvo2RLOuDNwvQL5K6saQnzJRF0fuxgjQnCRFXhNC8oR0QpIRF3
	xYcv8J1JofGVUOVIJwjsWZqFuc/Tj4EY0JYBcnd+W/gVHgTKgJqLEChYv42dPMiZ
	g93R6e7T1uchZEtiee6vQ==
X-ME-Sender: <xms:fAISY0lQ7WAqVFqET3SILDK_TeY84nyCDztL70STBFGciEaNd5QPtA>
    <xme:fAISYz3hbhRBjublUV-PwWr9_xI79yTA3A5Jw3c-o1xWVcO_bqZMjbrAPWCrUAKxz
    DQ-uLs-a8izTQ>
X-ME-Received: <xmr:fAISYyoNL9NxUG1ibfY-6R85xBK_srYo0CoKqkRWMOj_UcSfjgxS0Re0GEy6POSy2DrWQWfSsQHUe3sY6xHjvCL5w8MEtYW9hR4ftxgMzEDr5wzlMZCtcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:fAISYwnDdwTKXC9l7iU3-1_saqDzNcjuyPFZkF1jS_rLB2so52hhow>
    <xmx:fAISYy3lx1aYhRFcNPuPcHzP-QYe3-HY6K1koMOs5xELW-R9kPHEbw>
    <xmx:fAISY3ueZVfuT3UEnDIXyzTVbuCG4KrHp2DtWe_Mt7qFipKUH4iFNw>
    <xmx:fAISYwCLZyZWFVLCHQ2QTENl24lCOVSt1hMbvI-r-6aHe_GL5_YhUA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 03/10] IOMMU: add common API for device reserved memory
Date: Fri,  2 Sep 2022 15:17:24 +0200
Message-Id: <3a1badcd90731d64950f4f80afbebbd042494f0b.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
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


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD654016C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343351.568732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEv-0007ot-A9; Tue, 07 Jun 2022 14:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343351.568732; Tue, 07 Jun 2022 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEv-0007kc-3S; Tue, 07 Jun 2022 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 343351;
 Tue, 07 Jun 2022 14:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEs-00061K-Ln
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:22 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8016fee5-e66e-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:31:21 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E625E5C01DB;
 Tue,  7 Jun 2022 10:31:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 07 Jun 2022 10:31:20 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:19 -0400 (EDT)
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
X-Inumbo-ID: 8016fee5-e66e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612280; x=1654698680; bh=9Z09zPwAMV
	UfGBsTlLDLpiIwvOBt3luu8w7C4olNcaY=; b=KwbseHJmSVm51Z4o4plrUu7Ohp
	WVSyTi0N9mwuNZ5H4GKcEGFy99iQyEg3SqnjTjmz+HXBqcmZrLBh9bdsVIAbd3mM
	jqiGXk+YgoY1X999yxsd10+7zuAMz+nygATXfwDxn22y8YetIo0WSxKrdnQiJU0F
	GuTfm5Kr8xbjSq9HfoUWsm27UjPOs4vtkXVD1WmASb7240SNJWME6kRvJlupuVJR
	1hVkN22/N3rGtwX/leE4OyTS7x9jDAvXU9OXBzaKzu7E8mHb0bqyMCi3Kgq60ivX
	paFC194VSGV3S9oQmdNsV3yKRBfHb2ukJ3hr1RHX81Bk8yet27T8vGsmNlZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612280; x=
	1654698680; bh=9Z09zPwAMVUfGBsTlLDLpiIwvOBt3luu8w7C4olNcaY=; b=Y
	OhGYlkT512yD3GpdI3c0a8g3LpUsSWdrGUyjXKpl92I+gf2PypmHCAaIOPyOXZ5k
	esJ+pnxpMC6Rjgedvb/0ej8yZw4eUfu8fFxyEmylfElmqrN3VHOnB13RycpbnCz9
	wzqSxIK1LI4TWHQ8UUbgJnAJgzO6jbgaRx5FqQcA06Pyd9BZS/abQlZWUzXS27Yv
	xqMRhhyQ0+Q6hZG/CUR8bn8hspxbTJAS7Dg+4g4fCrMqcl5dxWt63Uzlt8cgnM7h
	FtXmlqvXtD9SULnuPbuB9FljoKLpuH6uZr0N4cg3g/Rl5EZ3o54JQML6R4PWLm4O
	HQgP5LNfJS6/5ONAcDR9w==
X-ME-Sender: <xms:OGGfYsBWBUWN1OagrZucFB29kr0k-dAjBoYPzL8fE_7qh4PvL0Z-lw>
    <xme:OGGfYuiLLPBE7cTUCr-v4vT74GSCnvNBWU4qq_UO5nLAm3lzOieq-NuYTRWj4O_JY
    3eS_JcwpN74yA>
X-ME-Received: <xmr:OGGfYvlZ6mkMw3zq908jtmIAgaq1GwWowVZ1hTqHFV8KboM2TsmNlDEqWMwcq9ZKSm6J4rfIg1pBdSVdffnTePwr53p-EtoOJnrDh07Nnmb8siDhc88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:OGGfYixxDcoh7wkTuKFpcnRGGk005AD1p6pffliHYo3dn1fvrIdkVw>
    <xmx:OGGfYhR8OtTo_nopHsz-w9NBa-0RUInEMfw-lja4-JxZMuqu4nfLbA>
    <xmx:OGGfYtZotyPdShqATimJwHbBnE5bJ9OKtPszLGyXUI1C0ryMeHn6fw>
    <xmx:OGGfYsd3Scal2QVaG3NzdfQ6t3cZ4LC1F_OzBhINmmeds8A-a_cIBw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 06/10] IOMMU: add common API for device reserved memory
Date: Tue,  7 Jun 2022 16:30:12 +0200
Message-Id: <9a5b2f380244c0932b3c2c9ada7346a4d6a0433d.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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


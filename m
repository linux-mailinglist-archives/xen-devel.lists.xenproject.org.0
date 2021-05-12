Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDF37D42A
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 22:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126374.237934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJT-0005ie-MP; Wed, 12 May 2021 20:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126374.237934; Wed, 12 May 2021 20:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJT-0005fk-IL; Wed, 12 May 2021 20:18:35 +0000
Received: by outflank-mailman (input) for mailman id 126374;
 Wed, 12 May 2021 20:18:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgvJR-00053i-UB
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 20:18:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a7d3754-4079-4430-a3bb-5eac1d4e94f1;
 Wed, 12 May 2021 20:18:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B2C361422;
 Wed, 12 May 2021 20:18:28 +0000 (UTC)
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
X-Inumbo-ID: 5a7d3754-4079-4430-a3bb-5eac1d4e94f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620850708;
	bh=trsGadIQLNKKCXatZO0q0DocnFfhaO1AxO8nVb8w9MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aO6VInjY6ndrYTvyGcoofX87u0DhSLAIbZ4pk+S+22qXkOzEWJiYPbKKyB66ULAbr
	 Ez1XQgUO11lRcmTm0tegcEbr0o1MpI77EsK4U0uleRHQUDVoW7S3JNRK/7fsRJ55zv
	 eRBbop6Cmt4odtv8kfuIc/IlsU35LtGBJDuT+N3lFmbhnOovGGOXA0ostEPTbZnrxR
	 Iv19y4rS+AG0b1VuEnJWzsdwMOhAxjWZV2mC0b5eWFAKHTiTtVto+4AHKn2/JeOw9T
	 9jf1XMRwgsnuKo9jffD/Faxrw6Wd8fvAniEbLr6DDoHoWpwCvUEe0LnObLHMeKztzC
	 SEcUF38QTS2gw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	hch@lst.de,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 3/3] xen/swiotlb: check if the swiotlb has already been initialized
Date: Wed, 12 May 2021 13:18:23 -0700
Message-Id: <20210512201823.1963-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

xen_swiotlb_init calls swiotlb_late_init_with_tbl, which fails with
-ENOMEM if the swiotlb has already been initialized.

Add an explicit check io_tlb_default_mem != NULL at the beginning of
xen_swiotlb_init. If the swiotlb is already initialized print a warning
and return -EEXIST.

On x86, the error propagates.

On ARM, we don't actually need a special swiotlb buffer (yet), any
buffer would do. So ignore the error and continue.

CC: boris.ostrovsky@oracle.com
CC: jgross@suse.com
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>
---
Changes in v2:
- use pr_warn
- add reviewed-by
---
 arch/arm/xen/mm.c         | 8 +++++++-
 drivers/xen/swiotlb-xen.c | 5 +++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 223b1151fd7d..a7e54a087b80 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -138,9 +138,15 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
+	int rc;
+
 	if (!xen_swiotlb_detect())
 		return 0;
-	xen_swiotlb_init();
+
+	rc = xen_swiotlb_init();
+	/* we can work with the default swiotlb */
+	if (rc < 0 && rc != -EEXIST)
+		return rc;
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 4c89afc0df62..24d11861ac7d 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -164,6 +164,11 @@ int __ref xen_swiotlb_init(void)
 	int rc = -ENOMEM;
 	char *start;
 
+	if (io_tlb_default_mem != NULL) {
+		pr_warn("swiotlb buffer already initialized\n");
+		return -EEXIST;
+	}
+
 retry:
 	m_ret = XEN_SWIOTLB_ENOMEM;
 	order = get_order(bytes);
-- 
2.17.1



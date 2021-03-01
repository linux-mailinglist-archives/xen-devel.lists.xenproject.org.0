Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE6327876
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91277.172483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdG0-0003GC-FT; Mon, 01 Mar 2021 07:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91277.172483; Mon, 01 Mar 2021 07:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdG0-0003Fd-Ba; Mon, 01 Mar 2021 07:46:20 +0000
Received: by outflank-mailman (input) for mailman id 91277;
 Mon, 01 Mar 2021 07:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdFy-00036y-E0
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:46:18 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f8fe213-b4ce-4d70-a9c9-b55cac12f660;
 Mon, 01 Mar 2021 07:46:15 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdFm-00FRDp-Lh; Mon, 01 Mar 2021 07:46:08 +0000
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
X-Inumbo-ID: 3f8fe213-b4ce-4d70-a9c9-b55cac12f660
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JFey0nQH0q27BLg8sKUeuXSyZDiQiQFLOD6BixvKeyU=; b=NOzDrThXk5sQLHtG3a7GXeBGS9
	H2XGITYrLulEacH0a8AvtD4GcR3a2s77sP1xJjnehH3ArsbGm+hD5Yg+R4px9hPi+g+Hqawj5XasA
	USCZkvxqssnycydmnC4rU9Kn3Dp7ojnB+xcinZ1+dr2f3ywKfxV6zOcD7Kwh/7lBlruP/9QUg21lZ
	FZB2z4KkS3r112xjPrzwRHn0SffHvc9LiSxaQmlgIEzvoxWUQ9A+bGnTQDUWoUtbAOlVvg3mcywgr
	5zo9Ej6FKEwbLIhTjZHYLebzvkQLYCHjA/PtqDXKiu7RlyNYJviJ7iXcpJ36kfbd/1Ijq+NNQpDOs
	QO9Tuoyw==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 09/14] swiotlb: lift the double initialization protection from xen-swiotlb
Date: Mon,  1 Mar 2021 08:44:31 +0100
Message-Id: <20210301074436.919889-10-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Lift the double initialization protection from xen-swiotlb to the core
code to avoid exposing too many swiotlb internals.  Also upgrade the
check to a warning as it should not happen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 -------
 kernel/dma/swiotlb.c      | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 1a31ddf7139799..060eeb056486f5 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -172,12 +172,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	bytes = nslabs << IO_TLB_SHIFT;
 	order = get_order(bytes);
 
-	/*
-	 * IO TLB memory already allocated. Just use it.
-	 */
-	if (io_tlb_start != 0)
-		goto end;
-
 	/*
 	 * Get IO TLB memory from any location.
 	 */
@@ -232,7 +226,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	} else
 		rc = swiotlb_late_init_with_tbl(start, nslabs);
 
-end:
 	if (!rc)
 		swiotlb_set_max_segment(PAGE_SIZE);
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 388d9be35b5795..ebe7c123e27e52 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -229,6 +229,10 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 	unsigned long i, bytes;
 	size_t alloc_size;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
@@ -367,6 +371,10 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
 	unsigned long i, bytes;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
-- 
2.29.2



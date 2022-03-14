Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA54D7BB0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:32:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289936.491658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBK-00059l-Vw; Mon, 14 Mar 2022 07:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289936.491658; Mon, 14 Mar 2022 07:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfBK-00056q-Sw; Mon, 14 Mar 2022 07:31:54 +0000
Received: by outflank-mailman (input) for mailman id 289936;
 Mon, 14 Mar 2022 07:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BEku=TZ=bombadil.srs.infradead.org=BATV+605a0c0c3369109790a8+6777+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nTfBJ-00056d-53
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:31:54 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf30f5d3-a368-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:31:50 +0100 (CET)
Received: from [46.140.54.162] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfB4-0044TV-Ja; Mon, 14 Mar 2022 07:31:39 +0000
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
X-Inumbo-ID: cf30f5d3-a368-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7KIhJt40I1ofu47+zsRTUJkoQ8fUOXBHfwlYnVCC3M8=; b=W+WZjoWPy3YFymvGdgW5PlFiLN
	2oqlLSAIhYam5081YLU/1idoDC+4RE6JSCHC36ZpyAX2RqypK3I1dmx8MCT9usY2EtHAr7dVoXXgU
	ta3E9aQ+CvKo576fFUXY4Js12Sk2bnGPPWnIQ4WEXMdZ1jHX3vWNfFRBg0PeEX9CY8ebeHWNaHoXD
	Ldd6MPElBlKE1uL77ytbpRl/zJ8WlwYmmUjnWfYBgb8pX+tGeT/H2o/rs+/tYOYrp3RlS4F5EEmz/
	9eJYZaX/9N3HVPvuYUruScc8MIxDSXJGJKLArbTW8hiz/DoUu0s0GNqz7Lk4SBui3qiJz+6Yua/Fj
	GAY/ztJQ==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 02/15] swiotlb: make swiotlb_exit a no-op if SWIOTLB_FORCE is set
Date: Mon, 14 Mar 2022 08:31:16 +0100
Message-Id: <20220314073129.1862284-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314073129.1862284-1-hch@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

If force bouncing is enabled we can't release the buffers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 kernel/dma/swiotlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 908eac2527cb1..af9d257501a64 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -369,6 +369,9 @@ void __init swiotlb_exit(void)
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 
+	if (swiotlb_force == SWIOTLB_FORCE)
+		return;
+
 	if (!mem->nslabs)
 		return;
 
-- 
2.30.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E844C89D9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 11:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281113.479317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08N-0003HT-K9; Tue, 01 Mar 2022 10:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281113.479317; Tue, 01 Mar 2022 10:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP08N-00038H-EC; Tue, 01 Mar 2022 10:53:35 +0000
Received: by outflank-mailman (input) for mailman id 281113;
 Tue, 01 Mar 2022 10:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA0s=TM=bombadil.srs.infradead.org=BATV+e5026ef6e36407c4b08a+6764+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nP08M-00031a-MV
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 10:53:34 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d658ee84-994d-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 11:53:34 +0100 (CET)
Received: from [2.53.44.23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP08A-00GCxm-Dw; Tue, 01 Mar 2022 10:53:23 +0000
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
X-Inumbo-ID: d658ee84-994d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8kkkqKTmx4an5HwtAkctrRmIlb8tNewwdnwFgQaeBs4=; b=jLl0j4bSOfVgHsr3MQ5Bv5W25W
	eBCL+ezlRGLhWYJUDEMLnfnY03XvNmRuJ3NVkaIN+j91e7hLR85KeZAUrre7FDsYIGG5LJVefqfFQ
	aBw4XS4clVWlj8OlW5+no9SoBD1TeUv7rQYDWrKf4OHZIcAUPacEQWejKAQpzWZV4sMB16ogBdJNd
	BYo+cef7t0HrzSLXHOj4597NsWHTixNewjzb8+eB6sepbzbOCAKRdiYjQ0SKHJwpHXjDNI+7jB/Nl
	V6d7NCk96h2kf6oMslvOoIEJGHn3fDqOVyBakQxgHeZAYF5ayU7+PWsZkl0kSLTP/USHzDRJXcvab
	v9YgSnow==;
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
Subject: [PATCH 02/12] swiotlb: make swiotlb_exit a no-op if SWIOTLB_FORCE is set
Date: Tue,  1 Mar 2022 12:53:01 +0200
Message-Id: <20220301105311.885699-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301105311.885699-1-hch@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
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
index bfc56cb217059..64b390136f9ef 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -378,6 +378,9 @@ void __init swiotlb_exit(void)
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 
+	if (swiotlb_force == SWIOTLB_FORCE)
+		return;
+
 	if (!mem->nslabs)
 		return;
 
-- 
2.30.2



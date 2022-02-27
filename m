Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01914C5C2F
	for <lists+xen-devel@lfdr.de>; Sun, 27 Feb 2022 15:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279953.477752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOKa4-00036z-L4; Sun, 27 Feb 2022 14:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279953.477752; Sun, 27 Feb 2022 14:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOKa4-00030I-Fv; Sun, 27 Feb 2022 14:31:24 +0000
Received: by outflank-mailman (input) for mailman id 279953;
 Sun, 27 Feb 2022 14:31:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKox=TK=bombadil.srs.infradead.org=BATV+9eb748f383daf30c13ac+6762+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nOKa2-0002ik-JY
 for xen-devel@lists.xenproject.org; Sun, 27 Feb 2022 14:31:22 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc18f39-97d9-11ec-8eba-a37418f5ba1a;
 Sun, 27 Feb 2022 15:31:19 +0100 (CET)
Received: from [213.208.157.39] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOKZk-009NuE-Cz; Sun, 27 Feb 2022 14:31:04 +0000
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
X-Inumbo-ID: ebc18f39-97d9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+WiBOXA0MRDZn1kqTV3ww0Ba1VAfcBaU/VHzqZHaxWQ=; b=UcMvfw8PmtRTqsFC3KR7eGE16Z
	ScdqwnvCgitmv45Q5ry3OAtO9pAZicvl9XYX8rtjmHIqsoPld+fqpCFXgiJWUTVNQXrtRr5+gJ7G9
	zNDGvmhjJvotR5KJmi+LerfiLBEJ8+g/DV8hmCvfEcASMbpdUSh3+Ys0hMCj0wzEo22LHDc5AFJm3
	460k5swhB+imd2zecCUtx/NDpMxrE8s8/T/tQZp56g/hNMchq2zBI1AwK8BJ9KguClDyChdet3gjn
	MlZpKgk5YExrCKU0+vtPE1aDMIW2Hw5Nk4N8c/3a/rZIJTo3dD7J9ofdhbwHjFQZ6o6APbGFVdnMk
	lx+LUO+Q==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
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
Subject: [PATCH 02/11] swiotlb: make swiotlb_exit a no-op if SWIOTLB_FORCE is set
Date: Sun, 27 Feb 2022 15:30:46 +0100
Message-Id: <20220227143055.335596-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227143055.335596-1-hch@lst.de>
References: <20220227143055.335596-1-hch@lst.de>
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
index f1e7ea160b433..36fbf1181d285 100644
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



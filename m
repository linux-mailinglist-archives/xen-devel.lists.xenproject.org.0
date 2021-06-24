Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A062E3B3331
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 17:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146914.270527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRit-0003P4-Pd; Thu, 24 Jun 2021 15:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146914.270527; Thu, 24 Jun 2021 15:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRit-0003Mw-MS; Thu, 24 Jun 2021 15:56:59 +0000
Received: by outflank-mailman (input) for mailman id 146914;
 Thu, 24 Jun 2021 15:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRis-0002ED-3q
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:56:58 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 630627be-6f8c-45eb-bdd4-27bef3c2bce7;
 Thu, 24 Jun 2021 15:56:42 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso3770258pjp.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:56:42 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id t13sm3434704pfq.173.2021.06.24.08.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:56:41 -0700 (PDT)
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
X-Inumbo-ID: 630627be-6f8c-45eb-bdd4-27bef3c2bce7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k2v4ULCUV3P/ZykooMt4RnFrTyFS8LVxGS67nnIjZ/E=;
        b=QrT3tJse9UwGIKHlr8MsnQ/5shpb9vzqfj7YMQ2fYijn7FCRoIijuokKPkX0W4emjg
         zIW9mO8KXkFug0OUuL1YqRloVsCf7/HNDUAAE7RH/8xRS3Mt1GINoLA/1NQjeCh/6ZZs
         IZdWLInrLmUEvcR0rzL0waTaUCb67EWeMYbx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k2v4ULCUV3P/ZykooMt4RnFrTyFS8LVxGS67nnIjZ/E=;
        b=hmayg/KplL7q+j00gMpJ4RezvQR59D6niSNyDdrNGQcLWsbR6HLQI8/erFSbOIXs4q
         ePDRDKdinnsw8r/mI3zfQPteq40iTgGC4k7zaiynVQduzRDuhr8E4NepYND9u5VYWF7B
         +Ig3W3Mw99MyWvCBXmlbAdE03z89cKMSE7n/GzwpLYGeDKUcYi16WDZCQufNi13zZc5L
         V9tKvD40362/Wc9/TD3KW5HA3MGGfbYdecWOB8PLVt840XRw2dHIwC5Db/AhJZDykIoi
         rG4wrLr7KzRxldE4IXNXcofDU8urfi+cwbH0Ce7bF6cr+bIktZKua+jmMIZUjrTj1QyK
         mfmg==
X-Gm-Message-State: AOAM533vOL0y8fIoYVhKaCPRFKeEFh/c3XJJnJIelBNr6CovxlCG7xFF
	Ekg04oM8YeCFjCo2xd+MDE+lvA==
X-Google-Smtp-Source: ABdhPJzbejiNIcTS+DoAyoRSN0idnXT3+mB1g+t9ZbfEjTYMX6+0aJ+6gkXmZUbbSTOePShgS47cWw==
X-Received: by 2002:a17:90b:1bc6:: with SMTP id oa6mr15922344pjb.151.1624550201945;
        Thu, 24 Jun 2021 08:56:41 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: [PATCH v15 07/12] swiotlb: Move alloc_size to swiotlb_find_slots
Date: Thu, 24 Jun 2021 23:55:21 +0800
Message-Id: <20210624155526.2775863-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename find_slots to swiotlb_find_slots and move the maintenance of
alloc_size to it for better code reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 kernel/dma/swiotlb.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0d294bbf274c..b41d16e92cf6 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -432,8 +432,8 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int find_slots(struct device *dev, phys_addr_t orig_addr,
-		size_t alloc_size)
+static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
+			      size_t alloc_size)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
@@ -444,6 +444,7 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
 	unsigned int nslots = nr_slots(alloc_size), stride;
 	unsigned int index, wrap, count = 0, i;
+	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned long flags;
 
 	BUG_ON(!nslots);
@@ -488,8 +489,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++)
+	for (i = index; i < index + nslots; i++) {
 		mem->slots[i].list = 0;
+		mem->slots[i].alloc_size =
+			alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
+	}
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
@@ -530,7 +534,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
-	index = find_slots(dev, orig_addr, alloc_size + offset);
+	index = swiotlb_find_slots(dev, orig_addr, alloc_size + offset);
 	if (index == -1) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
@@ -544,11 +548,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * This is needed when we sync the memory.  Then we sync the buffer if
 	 * needed.
 	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
 		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-		mem->slots[index + i].alloc_size =
-			alloc_size - (i << IO_TLB_SHIFT);
-	}
 	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-- 
2.32.0.288.g62a8d224e6-goog



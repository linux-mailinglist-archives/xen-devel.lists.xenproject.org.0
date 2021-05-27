Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7008392EDA
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133264.248462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFfn-0003um-5d; Thu, 27 May 2021 13:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133264.248462; Thu, 27 May 2021 13:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFfn-0003rV-1w; Thu, 27 May 2021 13:03:39 +0000
Received: by outflank-mailman (input) for mailman id 133264;
 Thu, 27 May 2021 13:03:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFcr-0008B4-81
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:00:37 +0000
Received: from mail-pf1-x430.google.com (unknown [2607:f8b0:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26ed9e2f-dcab-4dd2-8b89-9bd645ed4578;
 Thu, 27 May 2021 13:00:14 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id q25so538850pfn.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:00:14 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id m84sm1905689pfd.41.2021.05.27.06.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:00:13 -0700 (PDT)
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
X-Inumbo-ID: 26ed9e2f-dcab-4dd2-8b89-9bd645ed4578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w2PiQmD1cuLTolB92EeZQujQ/2l5n9gaMPeHb2aHq3I=;
        b=h56T1h46NuCHAXLEDOrFtGzPeGkXpqjaVqU2Id3/ScnxpcTFZFB+NgniQLXbdnzuUx
         QD0APsw9ZjoeJMpeIHj0tuMfdo+wG/iO7GBpb84AqyFHYbVnubqVV+LlaPHYPYnvVgbR
         tJ7ATJhWs9UvVNPUNH5hquxvKLueKDOrXLp9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w2PiQmD1cuLTolB92EeZQujQ/2l5n9gaMPeHb2aHq3I=;
        b=FyfcJkYGfYUh9QDTmex4khUPGIakqklvXPKJNSf0WinsowiYBCVwBuk10+4ptQv/Zp
         RB5y+3A3V7KITbW/s+47ftG+G0qwYWnhV36t1CIDhNj/jtKNIXAZvW/J3tZqs/JbmKnV
         ziuHYIExvpQtnxqYsId+tLumYrPyjl3VjTistTtx6eXFY7/E5fAHuGkvGz21IFlqPMoi
         y2RlG+d9ngAofsDsQmeOI0CpELf/6ciiW4pS9Q4I7RLamOHU9wR8KNY+A5Blta5ObHhX
         YVN9Xze6IBbGK7NFQw0oUuS7vh3Xja05VdidQhkLdekPwrcQhXnUiGrZSt9qlfMZP36o
         uoPQ==
X-Gm-Message-State: AOAM531ePA/yaZCuSLvj+d1MjpBitHbxVUEwsW41AJNZ/UcTFvgpLEgp
	f8u3zEqQ4Im8WH9lwTSuVUSA9g==
X-Google-Smtp-Source: ABdhPJwPKvUueO3/tWMtqAGArtGFSFkKVOYPoppJ9Pk4xAfchfGgkSrJtv/ImJCVwl16f+ZRC2hwVw==
X-Received: by 2002:a63:5c01:: with SMTP id q1mr3600625pgb.447.1622120414085;
        Thu, 27 May 2021 06:00:14 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v8 09/15] swiotlb: Move alloc_size to find_slots
Date: Thu, 27 May 2021 20:58:39 +0800
Message-Id: <20210527125845.1852284-10-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527125845.1852284-1-tientzu@chromium.org>
References: <20210527125845.1852284-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the maintenance of alloc_size to find_slots for better code
reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index fa7f23fffc81..88b3471ac6a8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -482,8 +482,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++)
+	for (i = index; i < index + nslots; i++) {
 		mem->slots[i].list = 0;
+		mem->slots[i].alloc_size =
+			alloc_size - ((i - index) << IO_TLB_SHIFT);
+	}
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
@@ -538,11 +541,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
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
2.31.1.818.g46aad6cb9e-goog



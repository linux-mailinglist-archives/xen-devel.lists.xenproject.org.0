Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFDA3A4532
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140443.259541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj5M-0003YN-9Y; Fri, 11 Jun 2021 15:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140443.259541; Fri, 11 Jun 2021 15:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj5M-0003Uu-4o; Fri, 11 Jun 2021 15:28:40 +0000
Received: by outflank-mailman (input) for mailman id 140443;
 Fri, 11 Jun 2021 15:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj5K-0001UV-K4
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:28:38 +0000
Received: from mail-pg1-x52b.google.com (unknown [2607:f8b0:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6f7187-f193-4ce3-bb8f-39b8d35ecf16;
 Fri, 11 Jun 2021 15:28:25 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n12so2729693pgs.13
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:28:25 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id u24sm5764598pfm.156.2021.06.11.08.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:28:23 -0700 (PDT)
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
X-Inumbo-ID: cc6f7187-f193-4ce3-bb8f-39b8d35ecf16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bmASqPhRufrL8xgJ1lr0aYPEW2vwCzgwqGTzlcTpKYs=;
        b=VEX8i0DIIoAo+ElXJJaiZoSDgtnFLF/I1TK84grpmdSi4SdYlXjC9TQ850lntV+P5S
         831kSO2v3dGqaOBGzqf/letn3Nd8SFR1zZSHZzcvG9QoeKAD5MpmBTmIAKv31z3N4Dib
         pBY3Kg/UV3b1u2uzwExihRDf6okRk8gDOvA7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bmASqPhRufrL8xgJ1lr0aYPEW2vwCzgwqGTzlcTpKYs=;
        b=ENCqtk5zJUMYyJFyORc69nL7Qf6f7/3FH+uGgaDwTaXv2TrasPrXulWuVvBf/0CBIh
         Ce/FjF2AIObBIzwf9Mxdx0z8blEEAlIt/eYAz6bt2oN1ZoHe0ddev2RvievL0OK19WEz
         OCNr62X/BBD83ydwqjketdU1bB0ckHiHAwSfiebEhVC5oOJOFjtXZlZ4OiNvU12100qB
         smmL4K8AGNWOGBJqjUVyCoPd5bhPyZyBHLC4LGOMQHONHsZsh3EhMi+QXelhTcPq/t1N
         Ew0U3PQxEi75I2BUANHnJ6DMq7qIWIXMbFl0hLIuJ6lKVkg1mj9ptPihJqVX0aHR/IzJ
         +uJQ==
X-Gm-Message-State: AOAM532WGfbUlDzDUB/Uca58r5FWzC2tDWOzt6jSUirDS4CGk7+TuPIj
	t+XQc/BK+6cxyiEpo7EM3+YiVQ==
X-Google-Smtp-Source: ABdhPJxcN6GQyaDPIchNmU5M9fts7obcNJdbHA864T6brE5WTlPTfm/9dx+UosM5tapLbm55ICy5Kg==
X-Received: by 2002:a62:7b4c:0:b029:2e9:cec2:e252 with SMTP id w73-20020a627b4c0000b02902e9cec2e252mr8677730pfc.56.1623425304239;
        Fri, 11 Jun 2021 08:28:24 -0700 (PDT)
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
Subject: [PATCH v9 08/14] swiotlb: Move alloc_size to find_slots
Date: Fri, 11 Jun 2021 23:26:53 +0800
Message-Id: <20210611152659.2142983-9-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the maintenance of alloc_size to find_slots for better code
reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e5ccc198d0a7..364c6c822063 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -486,8 +486,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
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
@@ -542,11 +545,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
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
2.32.0.272.g935e593368-goog



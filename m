Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670EB367BF6
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115114.219515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUVQ-0002Om-En; Thu, 22 Apr 2021 08:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115114.219515; Thu, 22 Apr 2021 08:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUVQ-0002O3-8u; Thu, 22 Apr 2021 08:16:12 +0000
Received: by outflank-mailman (input) for mailman id 115114;
 Thu, 22 Apr 2021 08:16:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqrU=JT=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lZUVP-0002Na-A6
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:16:11 +0000
Received: from mail-pg1-x531.google.com (unknown [2607:f8b0:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37d1ead6-02b3-4a71-9b80-871cf6cd622a;
 Thu, 22 Apr 2021 08:16:10 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id p12so32300326pgj.10
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 01:16:10 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id t21sm1376416pfg.211.2021.04.22.01.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:16:09 -0700 (PDT)
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
X-Inumbo-ID: 37d1ead6-02b3-4a71-9b80-871cf6cd622a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZUOlaxQDRJ4owOuYTcW5CKLhIM5yKECKO1qTEYWZIg=;
        b=Te5Gk+1sRcVC38swcqBEUjXxCH7tPVvd0mbGX1Wwm2DZGR6oQAt2p48rJuAqXxnZ1G
         B6y5TEaEuZ03C7wcap+3lptAydpEMh9xeJqVUa9U/PT2VvzS2R7M5JFIpAJEQCDWGzOE
         98eoN1gQ0pvlEfYjZOqLfgxvbW3n0p1s0Rg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZUOlaxQDRJ4owOuYTcW5CKLhIM5yKECKO1qTEYWZIg=;
        b=OlDzjQXv/Bdx1aZplEuvoJkZ9aH8SXpClOpx1REx1WOWscW5IhEXxiUDXXhXuMU8g8
         5M1BELDchwtHankxo0XTB3Qr0jSLoljLtuZpWfwoi0R6sIwNXh4bbKcxVai2XqiGsrGV
         TYjtkGtC4NFD08FpsaxfkbFsGLACS8yLYyOjvcoZynyNbMKbVD2o40EtKPZEfwZX3PtI
         JkZlVGbxuRirDNkrM1gtoztqnBRnFUMK/HsGcuNlvZRAwZ9+919kvH+1wvWfFCHplVrs
         B7s2UhmdlI7cDg30Vj32RIggYbvVZhdWFRAYCjesk+s3c640GU4vdi/Kh8g15k+9W9fO
         LJwQ==
X-Gm-Message-State: AOAM533oCHMEpG140kjhz6KvNGtjpYrDgr08GtdaMz6XOJgsD7Ai9G/l
	Hm5WezDsLiEXW+BHBYaSCW36yA==
X-Google-Smtp-Source: ABdhPJwNm9rBbG87w+RNtKc5UkLPG+k/T7GR5T9yig5hQwH4n8FewG7IrH0HY5kbawXYuwkg29Z0TA==
X-Received: by 2002:a62:68c4:0:b029:226:5dc5:4082 with SMTP id d187-20020a6268c40000b02902265dc54082mr2210480pfc.48.1619079369993;
        Thu, 22 Apr 2021 01:16:09 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>,
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
	nouveau@lists.freedesktop.org,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 06/16] swiotlb: Add a new get_io_tlb_mem getter
Date: Thu, 22 Apr 2021 16:14:58 +0800
Message-Id: <20210422081508.3942748-7-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new getter, get_io_tlb_mem, to help select the io_tlb_mem struct.
The restricted DMA pool is preferred if available.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 03ad6e3b4056..b469f04cca26 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_SWIOTLB_H
 #define __LINUX_SWIOTLB_H
 
+#include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -102,6 +103,16 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem *io_tlb_default_mem;
 
+static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
+{
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev && dev->dma_io_tlb_mem)
+		return dev->dma_io_tlb_mem;
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
+	return io_tlb_default_mem;
+}
+
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = io_tlb_default_mem;
-- 
2.31.1.368.gbe11c130af-goog



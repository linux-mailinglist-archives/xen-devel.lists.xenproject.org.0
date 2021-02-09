Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09702314895
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83128.153978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPR-0002Da-5I; Tue, 09 Feb 2021 06:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83128.153978; Tue, 09 Feb 2021 06:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPR-0002D2-1f; Tue, 09 Feb 2021 06:22:01 +0000
Received: by outflank-mailman (input) for mailman id 83128;
 Tue, 09 Feb 2021 06:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MPP-0002CP-93
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:21:59 +0000
Received: from mail-pl1-x62e.google.com (unknown [2607:f8b0:4864:20::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a10e0d0-ec6a-498b-990d-14c632b15aae;
 Tue, 09 Feb 2021 06:21:58 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id y10so9168900plk.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:21:58 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id a24sm22136125pff.18.2021.02.08.22.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:21:57 -0800 (PST)
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
X-Inumbo-ID: 8a10e0d0-ec6a-498b-990d-14c632b15aae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypYSGMF0E/cBAHmG+5MgTYKeSo3o0eLQF2YTe8sYrHU=;
        b=nuyunksJVzuVGUJwTZPlPVCVdAk7PqLR5/eJIWK+czvsKm+Rv5adeEB/7QzXpfJ6Qb
         eTQmwh//uII6ybrnF53ZsBr2I2SswetGJe9SJ79VWxXwIXylAfF5A0x6o0MD+aeanu4S
         AHLyX/KnrhYHKwiWZolFO//7UXaKKEQSkWti8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypYSGMF0E/cBAHmG+5MgTYKeSo3o0eLQF2YTe8sYrHU=;
        b=XL3vaxdA7H1QeHirmFBt1FjX1pSjMloNotxMPxzIq9A+C3osCdaQ1AGdijRp34cvA0
         6N1fYeu+0/WNfQNPiOTd6OgYq235Fcr8q17OEyygSEyvAVe2N0fDHZ8t+G/w+/7PHmUn
         aRhpuNS7TCuKP2+67suogEpxFk0VZPDh/EnUZF8YEAl89Fgo5+7eHGNuuL6/WEXPV77X
         0u+enS5I4hlQd20104pmq9dj58dy4tjs1uIfpGxzxGWa+rMwph1vZnW3ZeVG+C4zgEV8
         O9hDFUvgeAXk50dGqXiT9NQfma1eTlC02rRZMIzfeF3WpCZ+ACU1z8FIWlD3ny90VZ3K
         qKyw==
X-Gm-Message-State: AOAM5330TSK7fAZirgG8TjA+e5hbcwc6M+QAdxNsreoMT48GFYeHrxo3
	gtfGGAgYi+rr4b5Qzrre3PuLSw==
X-Google-Smtp-Source: ABdhPJywOf1kdt/G4UCY0rOH88voPYoRmAlcet1VV4EMdbEytPdXO083Yd5o1179zNV2rDMmBilckQ==
X-Received: by 2002:a17:90a:df87:: with SMTP id p7mr663033pjv.99.1612851717915;
        Mon, 08 Feb 2021 22:21:57 -0800 (PST)
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
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 02/14] swiotlb: Move is_swiotlb_buffer() to swiotlb.c
Date: Tue,  9 Feb 2021 14:21:19 +0800
Message-Id: <20210209062131.2300005-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move is_swiotlb_buffer() to swiotlb.c and make io_tlb_{start,end}
static, so we can entirely hide struct swiotlb inside of swiotlb.c in
the following patches.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 7 +------
 kernel/dma/swiotlb.c    | 7 ++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 83200f3b042a..041611bf3c2a 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -70,13 +70,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
-extern phys_addr_t io_tlb_start, io_tlb_end;
-
-static inline bool is_swiotlb_buffer(phys_addr_t paddr)
-{
-	return paddr >= io_tlb_start && paddr < io_tlb_end;
-}
 
+bool is_swiotlb_buffer(phys_addr_t paddr);
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e180211f6ad9..678490d39e55 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -69,7 +69,7 @@ enum swiotlb_force swiotlb_force;
  * swiotlb_tbl_sync_single_*, to see if the memory was in fact allocated by this
  * API.
  */
-phys_addr_t io_tlb_start, io_tlb_end;
+static phys_addr_t io_tlb_start, io_tlb_end;
 
 /*
  * The number of IO TLB blocks (in groups of 64) between io_tlb_start and
@@ -719,6 +719,11 @@ bool is_swiotlb_active(void)
 	return io_tlb_end != 0;
 }
 
+bool is_swiotlb_buffer(phys_addr_t paddr)
+{
+	return paddr >= io_tlb_start && paddr < io_tlb_end;
+}
+
 phys_addr_t get_swiotlb_start(void)
 {
 	return io_tlb_start;
-- 
2.30.0.478.g8a0d178c01-goog



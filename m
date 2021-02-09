Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1559314897
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83131.154015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPm-0002Sz-85; Tue, 09 Feb 2021 06:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83131.154015; Tue, 09 Feb 2021 06:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPm-0002SF-4K; Tue, 09 Feb 2021 06:22:22 +0000
Received: by outflank-mailman (input) for mailman id 83131;
 Tue, 09 Feb 2021 06:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MPk-0002Rf-Mf
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:22:20 +0000
Received: from mail-pl1-x62d.google.com (unknown [2607:f8b0:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e444da7-3acf-4b43-96a3-de85db326b31;
 Tue, 09 Feb 2021 06:22:20 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id a16so9162295plh.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:22:20 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id g17sm21205826pfq.135.2021.02.08.22.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:18 -0800 (PST)
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
X-Inumbo-ID: 9e444da7-3acf-4b43-96a3-de85db326b31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9SQyVkSYwcHNPQBFHoCQtFFFjCENqy21v8WbruxTyIQ=;
        b=S8b7bks4s14Aq0h3NWBRKYyM5rNroqOh0mjkOQqRPPLHlWF1b/82tP2JW6Ak+XahaS
         vuqFZkcLranydMu7pllFHxd5nuNgxoGZIBPnWrP05Of2B7XaG8dtqQLOaoHbIZQ1OzXK
         3qWvUM55PHjPtT5jCfFBuHsTloYPqv037Cmok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9SQyVkSYwcHNPQBFHoCQtFFFjCENqy21v8WbruxTyIQ=;
        b=V8EaYOQ/SRVEKXMNpWzKzgYZEgVLcFIY7Cm/UDnvGB8e66jrwAqhSJGnbiu4eN1oIv
         Xr2yD1xo4b3Bj1llQzUDg+ax5z+IeRik95sy8IDm50hBoxGQlIuvtXYkap16MoBAbYX0
         Dtxogc7aHqsvXTW2Z1vUCoQoB/nWMcHRzkGRxrQGGO3yzal1Vi8HWxCpglZ8nlVgiF3X
         hfYRAtm7CvAvpukJjRmCsFlNL7aitQTEwEwViSdYWrUxCM/Gm45oOy6PJACgV+INhSZM
         s0DJG0ur9zsuVhqj2VmLiObACfu2m6Iw+fdGBlnzJ63f0P80KbgMjMZlayBRSdHx3iAB
         FU+A==
X-Gm-Message-State: AOAM531dR4/fLnwzUs6tIHn0/T7dl6LR+UejouSNVLaM6ZCfn2/YHwfy
	HRrJFfPq4FD0Rpup1eZg2eVQAg==
X-Google-Smtp-Source: ABdhPJxcpi2bQzo5Ag59ySIm3BqsShiYpJbthB3TKnbwDYfpDCilPQMTJU6vCjKSHchn3Ia3PqrJPA==
X-Received: by 2002:a17:90a:654a:: with SMTP id f10mr2534268pjs.202.1612851739435;
        Mon, 08 Feb 2021 22:22:19 -0800 (PST)
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
Subject: [PATCH v4 05/14] swiotlb: Add DMA_RESTRICTED_POOL
Date: Tue,  9 Feb 2021 14:21:22 +0800
Message-Id: <20210209062131.2300005-6-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 479fc145acfc..97ff9f8dd3c8 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -83,6 +83,20 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config DMA_RESTRICTED_POOL
+	bool "DMA Restricted Pool"
+	depends on OF && OF_RESERVED_MEM
+	select SWIOTLB
+	help
+	  This enables support for restricted DMA pools which provide a level of
+	  DMA memory protection on systems with limited hardware protection
+	  capabilities, such as those lacking an IOMMU.
+
+	  For more information see
+	  <Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt>
+	  and <kernel/dma/swiotlb.c>.
+	  If unsure, say "n".
+
 #
 # Should be selected if we can mmap non-coherent mappings to userspace.
 # The only thing that is really required is a way to set an uncached bit
-- 
2.30.0.478.g8a0d178c01-goog



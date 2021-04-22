Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20204367BF0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 10:16:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115107.219490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUVA-0002CM-IW; Thu, 22 Apr 2021 08:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115107.219490; Thu, 22 Apr 2021 08:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUVA-0002Bq-F4; Thu, 22 Apr 2021 08:15:56 +0000
Received: by outflank-mailman (input) for mailman id 115107;
 Thu, 22 Apr 2021 08:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqrU=JT=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lZUV8-0002Ax-FN
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:15:54 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31b9c096-997f-4220-92ad-def4642675fc;
 Thu, 22 Apr 2021 08:15:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso531355pjn.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 01:15:53 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id bk6sm4233324pjb.10.2021.04.22.01.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:15:52 -0700 (PDT)
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
X-Inumbo-ID: 31b9c096-997f-4220-92ad-def4642675fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4dyB3xlmvkfx6+ggy7Uv640xgq260Lfsxi7yqvhCZI=;
        b=kLFGcuOQrccDqfD9J76t1/kDLyymEf5QZdonwnYtBNPLHycZjLGV1OskzqU8d8CBT2
         dFZ2kyndUcgD1g6WATSmnvKXnlXdau6lSM6AakeoAvt1oeObRayZc+uNuTgzJ9Ur1iuG
         1ryoegnb2fqqmY98GaQlrYL4hIv1GoXoL11Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4dyB3xlmvkfx6+ggy7Uv640xgq260Lfsxi7yqvhCZI=;
        b=omeS8wn9U/pOnHeWDtafnVSm8AMa6SAEddXSBSZCkoBunsxXsGYyT0Ii2NgaFwKEZY
         zvWc2vEZzRU/wQyPPNe6o+GrYeVO5cRh0QdHVuSaPiLPAAmFfOf98x25Gct+wVLV8uSx
         CPJo2zszLINYX4fl7I8aksI+fV+zMVILjLqvVc9F7RD1dydjIjF4iwQZq/YaYp4/sday
         rJYCkmhXt/zujqYuiF3GykLagPL2AoJOyIJTWqb/YwvdUfpTFjaVWFDSTobiGAoHv/dn
         0PnMa6hkI0+IuZFiosdyPbtELCD/mc8CRLEdDxogMC0ZRiB7EO7WrciGdh0jkBV2eKjr
         pZFQ==
X-Gm-Message-State: AOAM530aZ4uKNbEE3kd8QMq6HNX30vrDbZPxIXt4acOlcC3dDTkyJgHD
	ReaYl1+kru9DpFRnOo/YEBg2cg==
X-Google-Smtp-Source: ABdhPJzaPOcvkpo4oh1A/JsjcQqzOO/tc1NI/mmGYHMg9yfM2pWhcv0q011OgU/0UUPri4B/30xsPg==
X-Received: by 2002:a17:90b:14c4:: with SMTP id jz4mr2772455pjb.144.1619079353175;
        Thu, 22 Apr 2021 01:15:53 -0700 (PDT)
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
Subject: [PATCH v5 04/16] swiotlb: Add DMA_RESTRICTED_POOL
Date: Thu, 22 Apr 2021 16:14:56 +0800
Message-Id: <20210422081508.3942748-5-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b405508743..3e961dc39634 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -80,6 +80,20 @@ config SWIOTLB
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
2.31.1.368.gbe11c130af-goog



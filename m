Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4D73A4503
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140418.259474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj4I-0008Ls-A9; Fri, 11 Jun 2021 15:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140418.259474; Fri, 11 Jun 2021 15:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrj4I-0008It-6T; Fri, 11 Jun 2021 15:27:34 +0000
Received: by outflank-mailman (input) for mailman id 140418;
 Fri, 11 Jun 2021 15:27:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrj4G-0008HP-5z
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:27:32 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f0b04a3-6f21-4efd-98a3-a9fc29516775;
 Fri, 11 Jun 2021 15:27:31 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so6030754pjp.4
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:27:31 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:33c8:8e01:1161:6797])
 by smtp.gmail.com with UTF8SMTPSA id fs10sm10781936pjb.31.2021.06.11.08.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:27:30 -0700 (PDT)
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
X-Inumbo-ID: 5f0b04a3-6f21-4efd-98a3-a9fc29516775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POwdGvWH9uF6GuFYGDpfWh3gBTCdeay2Nuv62kz+670=;
        b=C9jITNUpsFL469uBCWw+ylcEXmDJHC24qGoWeq47lXmwrDoiFy9SQ+nYUnDf9eoUhJ
         UQMk8xg5DYQsIoGnRwISCRXEWnbFfVNYAqeVla6v7rlivkLs9OCXtvoP8+LC1h0SWDED
         3sRx2R1OhX94fVL71OHRWyugi7Thhky5EB+DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POwdGvWH9uF6GuFYGDpfWh3gBTCdeay2Nuv62kz+670=;
        b=UZ5JLewqqqqIftpNwr9/BuC9ZZgMqHQRNQGbf3JT0HcUbYynZr2IXpdWGG5lvW9TW7
         ntfC9+a4sRGsZfTabIVSvl639MDolgTwAkOILESnfxcf+KFLR6Pw1OcPRyDU2nwb1pid
         Qaivod7QYMGydLliIVTdpl+qH/5/Z9DitO8wVhDFVe25ltnOU0A7ptPKDDbEt/G2aBlS
         kMAvpiM1wFjJKoinPsumI4TGhRONwwkXgDLOJarzrPVhXjf9HZ49q6w8JuZZwY+Jl84W
         KO121uaMrt61gXXApFHGw44Uhdx7EjMIkN8a7pNSYLyrGnDYciVEMo7IOzc0/pC5lmFM
         Kx4w==
X-Gm-Message-State: AOAM531unb8tM0HGj93UOteyAeCgILyQu8PO0ARp4hvr6YY8oUPI1bAY
	vtMFbc5ofR9HZlcq7P+QvrgdYw==
X-Google-Smtp-Source: ABdhPJye589iRfRWyEdkeIKw72OE8rv2dNVWo6QIa4VZn02HOM9CDAmVKp9644S+z7efQaweuHXMtA==
X-Received: by 2002:a17:90a:7bce:: with SMTP id d14mr5098913pjl.38.1623425250808;
        Fri, 11 Jun 2021 08:27:30 -0700 (PDT)
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
Subject: [PATCH v9 02/14] swiotlb: Refactor swiotlb_create_debugfs
Date: Fri, 11 Jun 2021 23:26:47 +0800
Message-Id: <20210611152659.2142983-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611152659.2142983-1-tientzu@chromium.org>
References: <20210611152659.2142983-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools, e.g. restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1a1208c81e85..8a3e2b3b246d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -64,6 +64,9 @@
 enum swiotlb_force swiotlb_force;
 
 struct io_tlb_mem *io_tlb_default_mem;
+#ifdef CONFIG_DEBUG_FS
+static struct dentry *debugfs_dir;
+#endif
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -664,18 +667,24 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-
-	if (!mem)
-		return 0;
-	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+}
+
+static int __init swiotlb_create_default_debugfs(void)
+{
+	struct io_tlb_mem *mem = io_tlb_default_mem;
+
+	debugfs_dir = debugfs_create_dir("swiotlb", NULL);
+	if (mem) {
+		mem->debugfs = debugfs_dir;
+		swiotlb_create_debugfs_files(mem);
+	}
 	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+late_initcall(swiotlb_create_default_debugfs);
 
 #endif
-- 
2.32.0.272.g935e593368-goog



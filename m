Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE3B3AD725
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jun 2021 05:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145027.266878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRr8-0001S9-Ia; Sat, 19 Jun 2021 03:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145027.266878; Sat, 19 Jun 2021 03:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRr8-0001PU-EZ; Sat, 19 Jun 2021 03:41:14 +0000
Received: by outflank-mailman (input) for mailman id 145027;
 Sat, 19 Jun 2021 03:41:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oaj8=LN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1luRr7-0001Ok-Dy
 for xen-devel@lists.xenproject.org; Sat, 19 Jun 2021 03:41:13 +0000
Received: from mail-pg1-x533.google.com (unknown [2607:f8b0:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6564cac7-5fb1-43f6-bec5-edb14cd76b9f;
 Sat, 19 Jun 2021 03:41:12 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id u190so5614287pgd.8
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 20:41:12 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:4a46:e208:29e8:e076])
 by smtp.gmail.com with UTF8SMTPSA id 25sm10160700pgp.51.2021.06.18.20.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 20:41:11 -0700 (PDT)
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
X-Inumbo-ID: 6564cac7-5fb1-43f6-bec5-edb14cd76b9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87F32lyNJPVTVtO+0wV8iOXVR4FYPSJ8Efeoe/l3AWY=;
        b=i1ENWaFNKwGMCMiAeHBUHeHeWCgJo2DMoHTJ8FYIFrvt5MmhJ7OFiSW0SvgsImDco7
         eyyIqWu+/Z0bEeYC6m5AiJ1SXr0nn6NCHriX3ZUuh6wWoj4iO9mtnXQIU1hsa49/kNzW
         JSXwJ+CCVTQ+vErOyYxRYe6Lgoq4CUcXaMXXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87F32lyNJPVTVtO+0wV8iOXVR4FYPSJ8Efeoe/l3AWY=;
        b=l+iJHq5yTHS/+iZKHg0H8GhLXwM50Ks0cl0QeMdx+DceBCxxbEruAwMa7mP8rL6Srw
         wUET2O7hO3v0DFflS89PGm15/n+m4i1+TbQOLjylhsvwOOAtwbpdFLPNLQVoAsEQxgwA
         2sijtA5/fXxqbDn8Q74zWaKWAYa2aNSp+rcpOFZILsPjMmxtZYjzt20Hn2wYWsbI7Isz
         eHEaLIHyzqBHcxSNDku6oR5ANg89o0286mZ+vno8Jxx2p5EDyFYYNT2//htdLlLp6Hr9
         juEDv4hgOqzHCB3SQL3TJAxyrz0NBixkbA4r30+EpEodFmq9bm/Aw0mk7Qhak9J25NVh
         LfUA==
X-Gm-Message-State: AOAM533b3hiLKpKw66gOVYq1080fWUbEMfll8pHL4/kjnrA3ga0z4Tme
	JmB/a0666Dwek6AWb4HntIa7fA==
X-Google-Smtp-Source: ABdhPJyiBODmYapISErXaci/paTftzSQoq4G3MHhJ6blBXA4Xk2Rt3t9DUi7Q/sURCxYsvPxcPxH7g==
X-Received: by 2002:a63:4915:: with SMTP id w21mr13046659pga.363.1624074072021;
        Fri, 18 Jun 2021 20:41:12 -0700 (PDT)
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
	thomas.lendacky@amd.com
Subject: [PATCH v14 02/12] swiotlb: Refactor swiotlb_create_debugfs
Date: Sat, 19 Jun 2021 11:40:33 +0800
Message-Id: <20210619034043.199220-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210619034043.199220-1-tientzu@chromium.org>
References: <20210619034043.199220-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 kernel/dma/swiotlb.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1f9b2b9e7490..ede66df6835b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -671,19 +671,26 @@ bool is_swiotlb_active(void)
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
+static struct dentry *debugfs_dir;
 
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
2.32.0.288.g62a8d224e6-goog



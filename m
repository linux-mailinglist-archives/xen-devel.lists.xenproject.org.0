Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49103B330A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 17:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146893.270472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRhv-0008Tp-CI; Thu, 24 Jun 2021 15:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146893.270472; Thu, 24 Jun 2021 15:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRhv-0008RW-81; Thu, 24 Jun 2021 15:55:59 +0000
Received: by outflank-mailman (input) for mailman id 146893;
 Thu, 24 Jun 2021 15:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRht-0008QL-Pt
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:55:57 +0000
Received: from mail-pg1-x52e.google.com (unknown [2607:f8b0:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2733aba1-665c-4386-894c-6259c438ad9e;
 Thu, 24 Jun 2021 15:55:57 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id a2so5059784pgi.6
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:55:57 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id la18sm5913675pjb.55.2021.06.24.08.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:55:56 -0700 (PDT)
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
X-Inumbo-ID: 2733aba1-665c-4386-894c-6259c438ad9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87F32lyNJPVTVtO+0wV8iOXVR4FYPSJ8Efeoe/l3AWY=;
        b=fPyR7LNfa+/lU3WGWQPO3NZkUjo26lxHQdRzo89jZMyBjRWMed8i0Y6RqoJEyweboI
         IubDRG9d7RiT3UTHReJE0MAliYBlmMLlLps0zkeHlwgKitR9Va5Y9JWu2QIhfoUNH31f
         Sz4HZ90/m+NBhkrEaC1sLlamv48IpLCMUi5TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87F32lyNJPVTVtO+0wV8iOXVR4FYPSJ8Efeoe/l3AWY=;
        b=HYfwdu1wgg8FskX/jl3/TMyHQLoITmvhEeGzvK2qEyDVWDJzpP/D7TqvYJBIDHng1Q
         elNDXwtyHkammEOmEB5tShJy4KuVT03fxOyYmccKegZDgXAk/rTW0Bk5y/MN/ijBxSyW
         A5PglIlR4EHIJNHV/0nAe/MDBcomRzcZNSrkd3xO17QzzH5X4ZZ7qPM1+TNArJK0T7CO
         NACJq0oEwusxfEeoy3EV+WpLDBZFg2O5W+FhLUGPT0+Q3BTIhZCc61QNGXGzMsbLDlN8
         JtXVIMJ+zT/vnohBXBMj8zSInh/aWqmk5Q7PHSV+KCMqCacTOdjAvnwfxTpsC4NPtJVF
         FYUQ==
X-Gm-Message-State: AOAM530qtxkYcdqzDXUuoPTbnwdjBxK/Y1HMt98OikCA5FO9ksO+b71q
	oVbz++2lIOfUQiJdQV/3TJwJqQ==
X-Google-Smtp-Source: ABdhPJxQx3pwzFqcBdR/DNm2W1TpNOCeT4sa0oGntLB2nXanycaT15P3BNOzlPmGxyWI5Z+ImzxIzA==
X-Received: by 2002:a63:4e4d:: with SMTP id o13mr5258697pgl.361.1624550156451;
        Thu, 24 Jun 2021 08:55:56 -0700 (PDT)
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
Subject: [PATCH v15 02/12] swiotlb: Refactor swiotlb_create_debugfs
Date: Thu, 24 Jun 2021 23:55:16 +0800
Message-Id: <20210624155526.2775863-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A875C708306
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 15:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536354.834596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdud-0006aq-1Z; Thu, 18 May 2023 13:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536354.834596; Thu, 18 May 2023 13:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzduc-0006XJ-Tx; Thu, 18 May 2023 13:43:22 +0000
Received: by outflank-mailman (input) for mailman id 536354;
 Thu, 18 May 2023 13:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cezo=BH=bombadil.srs.infradead.org=BATV+e1e315a83c1522261844+7207+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1pzdub-0006Tn-QF
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 13:43:21 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c14798-f581-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 15:43:18 +0200 (CEST)
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduN-00D6T3-0S; Thu, 18 May 2023 13:43:07 +0000
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
X-Inumbo-ID: f1c14798-f581-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NrwaDXndPVrlGW4jqCyf20MCAXo0YJy7aoO3FDItFxI=; b=lh9YNaJgqjsQ4ABDzfBXPDYhnF
	0rgvGegVpdV31RoZMvM9hbEbN94AXBXG4zrc9vSce86yoaAY93okWrN31ceblBj4ur0q1+YmfM6Hg
	v2JiJP+oecPzr+HP7G86rf0eM/dmlMOfuhqIhS4tMRcj+JGXLecrE0QZepRPPoZJwkQxnA+j3FdZt
	RlxkFpSPRj7ljl509O3DDGybPMxj20tGTo404+biDFXzMLHmhd46mUIWs42T8tBhOx2EJsaRBCXG2
	KFhN7YElPvMIUpYDvbAlPmwYYGOnFHuhw97nSyrLo0FGUtm5W07Q29cDo0EwumNuBftywhBKx3uyT
	dshNqNvg==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 4/4] swiotlb: unexport is_swiotlb_active
Date: Thu, 18 May 2023 15:42:53 +0200
Message-Id: <20230518134253.909623-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518134253.909623-1-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Drivers have no business looking at dma-mapping or swiotlb internals.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index af2e304c672c43..9f1fd28264a067 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -921,7 +921,6 @@ bool is_swiotlb_active(struct device *dev)
 
 	return mem && mem->nslabs;
 }
-EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.39.2



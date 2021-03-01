Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1D327869
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 08:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91258.172387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdEv-0002Vv-W2; Mon, 01 Mar 2021 07:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91258.172387; Mon, 01 Mar 2021 07:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdEv-0002VQ-SH; Mon, 01 Mar 2021 07:45:13 +0000
Received: by outflank-mailman (input) for mailman id 91258;
 Mon, 01 Mar 2021 07:45:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LLJP=H7=casper.srs.infradead.org=batv+bce9324c41c3486454c7+6399+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1lGdEu-0002U2-8f
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 07:45:12 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e972874d-e2ae-475e-9525-0ade0ca379b4;
 Mon, 01 Mar 2021 07:45:05 +0000 (UTC)
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdEa-00FR4x-UN; Mon, 01 Mar 2021 07:44:54 +0000
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
X-Inumbo-ID: e972874d-e2ae-475e-9525-0ade0ca379b4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jOUIvbpH1p3Q/dfE+7zDHmmKowLb7E/HssGmywq4qaM=; b=iiWXchTzp1z6tMwlARGVdg7qFd
	Jl5fCXY5v6vpmDrkF3TdnBigIdjyRi1EYbprKN/1D4IWDPlTOnJ7qGmZuPx8fCSdhV6gYXkdVXilz
	lMRq0qveYM+qGvCgIg+kOUnvXAV2GvvUvDQNP6xUFLQw1EBbP4PWEhY5Dt7Efsr5yOvBwA+G5tdDL
	IXM4bsZPzfNakZV6/kSBDPUsMIZLv9Shumi2xDaFpURz7TXDi9YPfYWJ+n8Xb4hRpph8JY36bzgpN
	I1aPhiWMrPFf4XDSHTeM18WNJetLSA8Rk2qjCMPvrj9Zx9X1OfH9nLC1/QFByOA9CBTSSNP3VF0/O
	sAzslN5g==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 01/14] powerpc/svm: stop using io_tlb_start
Date: Mon,  1 Mar 2021 08:44:23 +0100
Message-Id: <20210301074436.919889-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the local variable that is passed to swiotlb_init_with_tbl for
freeing the memory in the failure case to isolate the code a little
better from swiotlb internals.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/pseries/svm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a93e..1d829e257996fb 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -55,9 +55,9 @@ void __init svm_swiotlb_init(void)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
 		return;
 
-	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
-				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+
+	memblock_free_early(__pa(vstart),
+			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
-- 
2.29.2



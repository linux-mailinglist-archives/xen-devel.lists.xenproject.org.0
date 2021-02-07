Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE53125D3
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82429.152233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdD-00044u-ME; Sun, 07 Feb 2021 16:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82429.152233; Sun, 07 Feb 2021 16:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdD-00044F-I3; Sun, 07 Feb 2021 16:09:51 +0000
Received: by outflank-mailman (input) for mailman id 82429;
 Sun, 07 Feb 2021 16:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8mdC-00042X-Hs
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:09:50 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2f4a4d4-4f43-46c1-9e8e-10f239eba289;
 Sun, 07 Feb 2021 16:09:43 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mcz-004tm4-Bg; Sun, 07 Feb 2021 16:09:38 +0000
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
X-Inumbo-ID: d2f4a4d4-4f43-46c1-9e8e-10f239eba289
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ud3Ea8LmZI8vUpOxMZKE5jSGVPMWnEsLwfRS0dNFbE0=; b=CqX4vXqbmh6QXJAg3YewZtxxcH
	a2xzhphD8VLBCm3tOSIRvmJqwHwT1+K8P/oc1ldXlA56muOJ0R30QDUGLXMU1HJMX2h3xNCEKCkPP
	7qqxpgtnv2BkqiGDNANYGx4IELardjX+PUkA0qNFFBY1MW/3JChiJHBxfp/YWzQ0E5F3Mdp2/OVh/
	9g6CysD+IM/6jxu/nwmnHPlUGiXtrFDZqSz6+yq/nbOb+l23UwU03aaZmuiZR4BRT9NtcFg9QyoSB
	THL9WiHFfyXyVjQSg87GaF+1IBS1WU5j2owUfxHwogo5pylPoK7SW5yRVtUK+9TksokO0o2L+sabB
	bODKCAsQ==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 1/8] powerpc/svm: stop using io_tlb_start
Date: Sun,  7 Feb 2021 17:09:27 +0100
Message-Id: <20210207160934.2955931-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Use the local variable that is passed to swiotlb_init_with_tbl for
freeing the memory in the failure case to isolate the code a little
better from swiotlb internals.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/pseries/svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a93e..b9968ac7cc0789 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -56,7 +56,7 @@ void __init svm_swiotlb_init(void)
 		return;
 
 	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
+		memblock_free_early(__pa(vstart),
 				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
-- 
2.29.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF8A37D429
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 22:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126373.237921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJQ-0005PJ-CC; Wed, 12 May 2021 20:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126373.237921; Wed, 12 May 2021 20:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJQ-0005LR-8n; Wed, 12 May 2021 20:18:32 +0000
Received: by outflank-mailman (input) for mailman id 126373;
 Wed, 12 May 2021 20:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgvJN-00053u-UJ
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 20:18:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ec0c904-6615-4f9e-9af4-e77e4ba4086b;
 Wed, 12 May 2021 20:18:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6BFC61421;
 Wed, 12 May 2021 20:18:27 +0000 (UTC)
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
X-Inumbo-ID: 9ec0c904-6615-4f9e-9af4-e77e4ba4086b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620850708;
	bh=ikG741femM1u5L3PYlYRG1oNEZycqnQin0LDEK63UdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RShGZVhkT1+Cv9URRAR9hvRdm2lnVpZ/vDKhwwndQErexmq58V6abEelgnec4DX+x
	 Iq/powaDhH+V5WHSLB3ryZogB1b2sgnkPU7EiP0/MRRG/nwzIzV/Q5Srxs0gqbB+cH
	 14MZp+GtgTMFCs0Ih8T5Uvn9iByb8FozTPHOAcZHiN5n9RknvNAxd+0RQUcHqLXTeM
	 jofPjb49sy0g5sdVuYrjnmuG6NNqjf0n9H6kCmi+4WL9vnyH3UOIud8DubTi7dXVH/
	 FrXkN9yBf13D6H+TzEtt8Qy8V5lcj65NtVqeobNFzPY2KnlgJ0bWtvyv2fiu58p57T
	 I20jFea37G0/w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	hch@lst.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 2/3] arm64: do not set SWIOTLB_NO_FORCE when swiotlb is required
Date: Wed, 12 May 2021 13:18:22 -0700
Message-Id: <20210512201823.1963-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>

From: Christoph Hellwig <hch@lst.de>

Although SWIOTLB_NO_FORCE is meant to allow later calls to swiotlb_init,
today dma_direct_map_page returns error if SWIOTLB_NO_FORCE.

For now, without a larger overhaul of SWIOTLB_NO_FORCE, the best we can
do is to avoid setting SWIOTLB_NO_FORCE in mem_init when we know that it
is going to be required later (e.g. Xen requires it).

CC: boris.ostrovsky@oracle.com
CC: jgross@suse.com
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: linux-arm-kernel@lists.infradead.org
Fixes: 2726bf3ff252 ("swiotlb: Make SWIOTLB_NO_FORCE perform no allocation")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

---
Changes in v2:
- patch split
---
 arch/arm64/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 16a2b2b1c54d..e55409caaee3 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -43,6 +43,7 @@
 #include <linux/sizes.h>
 #include <asm/tlb.h>
 #include <asm/alternative.h>
+#include <asm/xen/swiotlb-xen.h>
 
 /*
  * We need to be able to catch inadvertent references to memstart_addr
@@ -482,7 +483,7 @@ void __init mem_init(void)
 	if (swiotlb_force == SWIOTLB_FORCE ||
 	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
 		swiotlb_init(1);
-	else
+	else if (!xen_swiotlb_detect())
 		swiotlb_force = SWIOTLB_NO_FORCE;
 
 	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
-- 
2.17.1



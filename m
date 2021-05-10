Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85097377E5F
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124952.235248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1TK-0008ND-Ac; Mon, 10 May 2021 08:41:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124952.235248; Mon, 10 May 2021 08:41:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1TK-0008LI-7D; Mon, 10 May 2021 08:41:02 +0000
Received: by outflank-mailman (input) for mailman id 124952;
 Mon, 10 May 2021 08:41:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5bM6=KF=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lg1TI-0008L0-Nu
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:00 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3cecc12-879e-4590-b63c-63de5ed460ab;
 Mon, 10 May 2021 08:40:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4D61467373; Mon, 10 May 2021 10:40:57 +0200 (CEST)
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
X-Inumbo-ID: e3cecc12-879e-4590-b63c-63de5ed460ab
Date: Mon, 10 May 2021 10:40:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Julien Grall <julien@xen.org>
Cc: f.fainelli@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org,
	osstest service owner <osstest-admin@xenproject.org>, hch@lst.de,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	iommu@lists.linux-foundation.org
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re:
 [linux-linus test] 161829: regressions - FAIL)
Message-ID: <20210510084057.GA933@lst.de>
References: <osstest-161829-mainreport@xen.org> <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, May 08, 2021 at 12:32:37AM +0100, Julien Grall wrote:
> The pointer dereferenced seems to suggest that the swiotlb hasn't been 
> allocated. From what I can tell, this may be because swiotlb_force is set 
> to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running on top 
> of Xen.
>
> I am not entirely sure what would be the correct fix. Any opinions?

Can you try something like the patch below (not even compile tested, but
the intent should be obvious?


diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 16a2b2b1c54d..7671bc153fb1 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -44,6 +44,8 @@
 #include <asm/tlb.h>
 #include <asm/alternative.h>
 
+#include <xen/arm/swiotlb-xen.h>
+
 /*
  * We need to be able to catch inadvertent references to memstart_addr
  * that occur (potentially in generic code) before arm64_memblock_init()
@@ -482,7 +484,7 @@ void __init mem_init(void)
 	if (swiotlb_force == SWIOTLB_FORCE ||
 	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
 		swiotlb_init(1);
-	else
+	else if (!IS_ENABLED(CONFIG_XEN) || !xen_swiotlb_detect())
 		swiotlb_force = SWIOTLB_NO_FORCE;
 
 	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);


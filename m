Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF97379C3F
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 03:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125576.236365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgHTq-0002mW-NP; Tue, 11 May 2021 01:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125576.236365; Tue, 11 May 2021 01:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgHTq-0002kT-K9; Tue, 11 May 2021 01:46:38 +0000
Received: by outflank-mailman (input) for mailman id 125576;
 Tue, 11 May 2021 01:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgHTo-0002kN-PC
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 01:46:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8c8eaf0-c322-4265-8e46-7e1ecd33da81;
 Tue, 11 May 2021 01:46:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 416A161629;
 Tue, 11 May 2021 01:46:35 +0000 (UTC)
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
X-Inumbo-ID: b8c8eaf0-c322-4265-8e46-7e1ecd33da81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620697595;
	bh=zRFH7hcgqBzuVJGwApqdrtTvpvj+GmXyjHWNsw6DGg8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SrbUmQ3XfUDBVScU7RGYGh+COsif34UcsKqoTgGV9vf8XRs8R1lfXDv2Rg8m5+EF9
	 CJPluc1/MQWvbLjpb0BVOfrQVGN/CpceyyrZMmsRnCPL3kqtV6OlO3OEzsslK/qv7R
	 zfl2Tf8Vw+0CIzNstymmxgXrqQa0cXQFMxMCpH3x+EScqVCBhtS+W0OWy9oXkU1Diw
	 G6RzBgQ9DfY0kzP1vEIMFq5Dn15X6EwBB3uZAB8JhvRKGL4JvgSEGm4RjP4loHchpQ
	 dnVwpyniLe2sjqdRGm4CgKX7WruGCQeIvlzp1r0kmQMvORLOQOTUtZolCtGmlfMEQH
	 t7e1j5rQsPpEw==
Date: Mon, 10 May 2021 18:46:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
cc: Julien Grall <julien@xen.org>, f.fainelli@gmail.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    linux-kernel@vger.kernel.org, 
    osstest service owner <osstest-admin@xenproject.org>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    iommu@lists.linux-foundation.org
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re: [linux-linus
 test] 161829: regressions - FAIL)
In-Reply-To: <20210510084057.GA933@lst.de>
Message-ID: <alpine.DEB.2.21.2105101818260.5018@sstabellini-ThinkPad-T480s>
References: <osstest-161829-mainreport@xen.org> <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 May 2021, Christoph Hellwig wrote:
> On Sat, May 08, 2021 at 12:32:37AM +0100, Julien Grall wrote:
> > The pointer dereferenced seems to suggest that the swiotlb hasn't been 
> > allocated. From what I can tell, this may be because swiotlb_force is set 
> > to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running on top 
> > of Xen.
> >
> > I am not entirely sure what would be the correct fix. Any opinions?
> 
> Can you try something like the patch below (not even compile tested, but
> the intent should be obvious?
> 
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 16a2b2b1c54d..7671bc153fb1 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -44,6 +44,8 @@
>  #include <asm/tlb.h>
>  #include <asm/alternative.h>
>  
> +#include <xen/arm/swiotlb-xen.h>
> +
>  /*
>   * We need to be able to catch inadvertent references to memstart_addr
>   * that occur (potentially in generic code) before arm64_memblock_init()
> @@ -482,7 +484,7 @@ void __init mem_init(void)
>  	if (swiotlb_force == SWIOTLB_FORCE ||
>  	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
>  		swiotlb_init(1);
> -	else
> +	else if (!IS_ENABLED(CONFIG_XEN) || !xen_swiotlb_detect())
>  		swiotlb_force = SWIOTLB_NO_FORCE;
>  
>  	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);

The "IS_ENABLED(CONFIG_XEN)" is not needed as the check is already part
of xen_swiotlb_detect().


But let me ask another question first. Do you think it makes sense to have:

	if (swiotlb_force == SWIOTLB_NO_FORCE)
		return 0;

at the beginning of swiotlb_late_init_with_tbl? I am asking because
swiotlb_late_init_with_tbl is meant for special late initializations,
right? It shouldn't really matter the presence or absence of
SWIOTLB_NO_FORCE in regards to swiotlb_late_init_with_tbl. Also the
commit message for "swiotlb: Make SWIOTLB_NO_FORCE perform no
allocation" says that "If a platform was somehow setting
swiotlb_no_force and a later call to swiotlb_init() was to be made we
would still be proceeding with allocating the default SWIOTLB size
(64MB)." Our case here is very similar, right? So the allocation should
proceed?


Which brings me to a separate unrelated issue, still affecting the path
xen_swiotlb_init -> swiotlb_late_init_with_tbl. If swiotlb_init(1) is
called by mem_init then swiotlb_late_init_with_tbl will fail due to the
check:

    /* protect against double initialization */
    if (WARN_ON_ONCE(io_tlb_default_mem))
        return -ENOMEM;

xen_swiotlb_init is meant to ask Xen to make a bunch of pages physically
contiguous. Then, it initializes the swiotlb buffer based on those
pages. So it is a problem that swiotlb_late_init_with_tbl refuses to
continue. However, in practice it is not a problem today because on ARM
we don't actually make any special requests to Xen to make the pages
physically contiguous (yet). See the empty implementation of
arch/arm/xen/mm.c:xen_create_contiguous_region. I don't know about x86.

So maybe we should instead do something like the appended?


diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index f8f07469d259..f5a3638d1dee 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -152,6 +152,7 @@ static int __init xen_mm_init(void)
 	struct gnttab_cache_flush cflush;
 	if (!xen_swiotlb_detect())
 		return 0;
+	swiotlb_exit();
 	xen_swiotlb_init();
 
 	cflush.op = 0;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8ca7d505d61c..f17be37298a7 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -285,9 +285,6 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
 	struct io_tlb_mem *mem;
 
-	if (swiotlb_force == SWIOTLB_NO_FORCE)
-		return 0;
-
 	/* protect against double initialization */
 	if (WARN_ON_ONCE(io_tlb_default_mem))
 		return -ENOMEM;


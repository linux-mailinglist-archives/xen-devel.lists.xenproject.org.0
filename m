Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F837AC4E
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 18:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125835.236865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVXl-0003Jw-QK; Tue, 11 May 2021 16:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125835.236865; Tue, 11 May 2021 16:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVXl-0003HJ-NI; Tue, 11 May 2021 16:47:37 +0000
Received: by outflank-mailman (input) for mailman id 125835;
 Tue, 11 May 2021 16:47:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgVXk-0003HA-DJ
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:47:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c18b3f20-4cf1-4a9e-b466-2ae63ea33481;
 Tue, 11 May 2021 16:47:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D8BB613CF;
 Tue, 11 May 2021 16:47:34 +0000 (UTC)
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
X-Inumbo-ID: c18b3f20-4cf1-4a9e-b466-2ae63ea33481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620751654;
	bh=hU+yLFeBxlaW2RjWGMkuL1C1oCUtCvrztFZPdNLLPBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dQ7Nr6QvpTPOXyPELC3zxv3QGr57GJrhhYd3bGSTX0Iei81QLLsBw4ch3MIBZsVMj
	 5dhtEb+zrDfe8NTwEI0pwv6ZPuUNSRued0gn56rDquIg1cLKdu+jfBwsBL1m3PKI9j
	 vD28w5PlnJi1O7OV7Tnu+QUBbbV3bVW5u8CTn2jFK8rNp8Yfpb6m5H8S//XvS9hM9Z
	 wmUYWjtqadwsU6qbSoUcenWgfVa5CQncuRi5yNGPkOVpnwGDweg5OoEwI6DPhdI/QD
	 VLF64GgmnZfE/ldwBKK4pEPd+pf2uH2oaott7rrYZ2/WxAxxhp7MThGl3/yOAfvqXu
	 liiCAYj1dXyvA==
Date: Tue, 11 May 2021 09:47:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    f.fainelli@gmail.com, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    linux-kernel@vger.kernel.org, 
    osstest service owner <osstest-admin@xenproject.org>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    iommu@lists.linux-foundation.org
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re: [linux-linus
 test] 161829: regressions - FAIL)]
In-Reply-To: <20210511063558.GA7605@lst.de>
Message-ID: <alpine.DEB.2.21.2105110925430.5018@sstabellini-ThinkPad-T480s>
References: <osstest-161829-mainreport@xen.org> <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de> <alpine.DEB.2.21.2105101818260.5018@sstabellini-ThinkPad-T480s> <20210511063558.GA7605@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 May 2021, Christoph Hellwig wrote:
> On Mon, May 10, 2021 at 06:46:34PM -0700, Stefano Stabellini wrote:
> > On Mon, 10 May 2021, Christoph Hellwig wrote:
> > > On Sat, May 08, 2021 at 12:32:37AM +0100, Julien Grall wrote:
> > > > The pointer dereferenced seems to suggest that the swiotlb hasn't been 
> > > > allocated. From what I can tell, this may be because swiotlb_force is set 
> > > > to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running on top 
> > > > of Xen.
> > > >
> > > > I am not entirely sure what would be the correct fix. Any opinions?
> > > 
> > > Can you try something like the patch below (not even compile tested, but
> > > the intent should be obvious?
> > > 
> > > 
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index 16a2b2b1c54d..7671bc153fb1 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -44,6 +44,8 @@
> > >  #include <asm/tlb.h>
> > >  #include <asm/alternative.h>
> > >  
> > > +#include <xen/arm/swiotlb-xen.h>
> > > +
> > >  /*
> > >   * We need to be able to catch inadvertent references to memstart_addr
> > >   * that occur (potentially in generic code) before arm64_memblock_init()
> > > @@ -482,7 +484,7 @@ void __init mem_init(void)
> > >  	if (swiotlb_force == SWIOTLB_FORCE ||
> > >  	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
> > >  		swiotlb_init(1);
> > > -	else
> > > +	else if (!IS_ENABLED(CONFIG_XEN) || !xen_swiotlb_detect())
> > >  		swiotlb_force = SWIOTLB_NO_FORCE;
> > >  
> > >  	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
> > 
> > The "IS_ENABLED(CONFIG_XEN)" is not needed as the check is already part
> > of xen_swiotlb_detect().
> 
> As far as I can tell the x86 version of xen_swiotlb_detect has a
> !CONFIG_XEN stub.  The arm/arm64 version in uncoditionally declared, but
> the implementation only compiled when Xen support is enabled.

The implementation of xen_swiotlb_detect should work fine if
!CONFIG_XEN, but the issue is that it is implemented in
arch/arm/xen/mm.c, so it is not going to be available.

I think it would be good to turn it into a static inline so that we can
call it from arch/arm64/mm/init.c and other similar places with or
without CONFIG_XEN, see appended patch below. It compiles without
CONFIG_XEN.


> > But let me ask another question first. Do you think it makes sense to have:
> > 
> > 	if (swiotlb_force == SWIOTLB_NO_FORCE)
> > 		return 0;
> > 
> > at the beginning of swiotlb_late_init_with_tbl? I am asking because
> > swiotlb_late_init_with_tbl is meant for special late initializations,
> > right? It shouldn't really matter the presence or absence of
> > SWIOTLB_NO_FORCE in regards to swiotlb_late_init_with_tbl. Also the
> > commit message for "swiotlb: Make SWIOTLB_NO_FORCE perform no
> > allocation" says that "If a platform was somehow setting
> > swiotlb_no_force and a later call to swiotlb_init() was to be made we
> > would still be proceeding with allocating the default SWIOTLB size
> > (64MB)." Our case here is very similar, right? So the allocation should
> > proceed?
> 
> Well, right now SWIOTLB_NO_FORCE is checked in dma_direct_map_page.
> We need to clean all this up a bit, especially with the work to support
> multiple swiotlb buffers, but I think for now this is the best we can
> do.

OK


> > Which brings me to a separate unrelated issue, still affecting the path
> > xen_swiotlb_init -> swiotlb_late_init_with_tbl. If swiotlb_init(1) is
> > called by mem_init then swiotlb_late_init_with_tbl will fail due to the
> > check:
> > 
> >     /* protect against double initialization */
> >     if (WARN_ON_ONCE(io_tlb_default_mem))
> >         return -ENOMEM;
> > 
> > xen_swiotlb_init is meant to ask Xen to make a bunch of pages physically
> > contiguous. Then, it initializes the swiotlb buffer based on those
> > pages. So it is a problem that swiotlb_late_init_with_tbl refuses to
> > continue. However, in practice it is not a problem today because on ARM
> > we don't actually make any special requests to Xen to make the pages
> > physically contiguous (yet). See the empty implementation of
> > arch/arm/xen/mm.c:xen_create_contiguous_region. I don't know about x86.
> > 
> > So maybe we should instead do something like the appended?
> 
> So I'd like to change the core swiotlb initialization to just use
> a callback into the arch/xen code to make the pages contigous and
> kill all that code duplication.  Together with the multiple swiotlb
> buffer work I'd rather avoid churn that goes into a different direction
> if possible.

That's a much better plan. It is also not super urgent, so maybe for now
we could add an explicit check for io_tlb_default_mem != NULL at the
beginning of xen_swiotlb_init? So that at least we can fail explicitly
or ignore it explicitly rather than by accident.


---


diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index f8f07469d259..223b1151fd7d 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -135,18 +135,6 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 	return;
 }
 
-int xen_swiotlb_detect(void)
-{
-	if (!xen_domain())
-		return 0;
-	if (xen_feature(XENFEAT_direct_mapped))
-		return 1;
-	/* legacy case */
-	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
-		return 1;
-	return 0;
-}
-
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
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
diff --git a/include/xen/arm/swiotlb-xen.h b/include/xen/arm/swiotlb-xen.h
index 2994fe6031a0..33336ab58afc 100644
--- a/include/xen/arm/swiotlb-xen.h
+++ b/include/xen/arm/swiotlb-xen.h
@@ -2,6 +2,19 @@
 #ifndef _ASM_ARM_SWIOTLB_XEN_H
 #define _ASM_ARM_SWIOTLB_XEN_H
 
-extern int xen_swiotlb_detect(void);
+#include <xen/features.h>
+#include <xen/xen.h>
+
+static inline int xen_swiotlb_detect(void)
+{
+	if (!xen_domain())
+		return 0;
+	if (xen_feature(XENFEAT_direct_mapped))
+		return 1;
+	/* legacy case */
+	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
+		return 1;
+	return 0;
+}
 
 #endif /* _ASM_ARM_SWIOTLB_XEN_H */


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3727D3CB9DD
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 17:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157609.290269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Pmp-0005ra-CD; Fri, 16 Jul 2021 15:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157609.290269; Fri, 16 Jul 2021 15:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4Pmp-0005pe-92; Fri, 16 Jul 2021 15:29:59 +0000
Received: by outflank-mailman (input) for mailman id 157609;
 Fri, 16 Jul 2021 15:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4Pmn-0005pY-GH
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 15:29:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac7a86ca-e64a-11eb-898d-12813bfff9fa;
 Fri, 16 Jul 2021 15:29:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5133E613E3;
 Fri, 16 Jul 2021 15:29:55 +0000 (UTC)
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
X-Inumbo-ID: ac7a86ca-e64a-11eb-898d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626449395;
	bh=gwbpEM2I/t3yULslsQrJ4ImN5wzlSWPQIZoIz0IW+1s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f4ofUif5kH18TRPd4Y5z3aE1G7LQpbotUnjc8VuGp2I0yUtnZmdrMkMmoSR88EIa+
	 93kwmtIAUZ+oxmpJDNFFwxMEHn0SbGInIDxf63X8rFRBR/PMU2qW79TzYbsdKUXP6E
	 TUlYwbBlP/kaK9xxZMt+hsAHUqpt7w2RQi8IUzGxo22CMlgSQ1xq/KON5g8oKnjDtG
	 K1m2MpWwWkYQGM59WC2at2zpyln+B+Pz1po9li/5AK7BX73kdWyYxj8uTBAb1OJoMe
	 bW9dDdfbJ+KUVFSQqbzf2kBoLOQu77gYyJ+5VtTHbUVbGYj6U6W33FpA43P3eumjUD
	 88TIOyOE730zQ==
Date: Fri, 16 Jul 2021 08:29:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Skakun <rm.skakun@gmail.com>
cc: Christoph Hellwig <hch@lst.de>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Andrii Anisov <andrii_anisov@epam.com>, 
    Roman Skakun <Roman_Skakun@epam.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc
 addresses
In-Reply-To: <CADu_u-OYA+Z_y-DBLxyUYGhmLVMtLggmZ_SnRiEtw9EGrO4oGg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2107160828430.3916@sstabellini-ThinkPad-T480s>
References: <20210715170011.GA17324@lst.de> <20210716083934.154992-1-rm.skakun@gmail.com> <20210716093551.GA17981@lst.de> <CADu_u-OYA+Z_y-DBLxyUYGhmLVMtLggmZ_SnRiEtw9EGrO4oGg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2042327733-1626449395=:3916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2042327733-1626449395=:3916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 16 Jul 2021, Roman Skakun wrote:
> > Technically this looks good.  But given that exposing a helper
> > that does either vmalloc_to_page or virt_to_page is one of the
> > never ending MM discussions I don't want to get into that discussion
> > and just keep it local in the DMA code.
> >
> > Are you fine with me applying this version?
> 
> Looks good to me, thanks!
> But, Stefano asked me about using created helper in the
> xen_swiotlb_free_coherent()
> and I created a patch according to this mention.
> 
> We can merge this patch and create a new one for
> xen_swiotlb_free_coherent() later.

Yeah, no worries, I didn't know that exposing dma_common_vaddr_to_page
was problematic.

This patch is fine by me.


> пт, 16 июл. 2021 г. в 12:35, Christoph Hellwig <hch@lst.de>:
> >
> > Technically this looks good.  But given that exposing a helper
> > that does either vmalloc_to_page or virt_to_page is one of the
> > never ending MM discussions I don't want to get into that discussion
> > and just keep it local in the DMA code.
> >
> > Are you fine with me applying this version?
> >
> > ---
> > From 40ac971eab89330d6153e7721e88acd2d98833f9 Mon Sep 17 00:00:00 2001
> > From: Roman Skakun <Roman_Skakun@epam.com>
> > Date: Fri, 16 Jul 2021 11:39:34 +0300
> > Subject: dma-mapping: handle vmalloc addresses in
> >  dma_common_{mmap,get_sgtable}
> >
> > xen-swiotlb can use vmalloc backed addresses for dma coherent allocations
> > and uses the common helpers.  Properly handle them to unbreak Xen on
> > ARM platforms.
> >
> > Fixes: 1b65c4e5a9af ("swiotlb-xen: use xen_alloc/free_coherent_pages")
> > Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> > Reviewed-by: Andrii Anisov <andrii_anisov@epam.com>
> > [hch: split the patch, renamed the helpers]
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  kernel/dma/ops_helpers.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/dma/ops_helpers.c b/kernel/dma/ops_helpers.c
> > index 910ae69cae77..af4a6ef48ce0 100644
> > --- a/kernel/dma/ops_helpers.c
> > +++ b/kernel/dma/ops_helpers.c
> > @@ -5,6 +5,13 @@
> >   */
> >  #include <linux/dma-map-ops.h>
> >
> > +static struct page *dma_common_vaddr_to_page(void *cpu_addr)
> > +{
> > +       if (is_vmalloc_addr(cpu_addr))
> > +               return vmalloc_to_page(cpu_addr);
> > +       return virt_to_page(cpu_addr);
> > +}
> > +
> >  /*
> >   * Create scatter-list for the already allocated DMA buffer.
> >   */
> > @@ -12,7 +19,7 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
> >                  void *cpu_addr, dma_addr_t dma_addr, size_t size,
> >                  unsigned long attrs)
> >  {
> > -       struct page *page = virt_to_page(cpu_addr);
> > +       struct page *page = dma_common_vaddr_to_page(cpu_addr);
> >         int ret;
> >
> >         ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> > @@ -32,6 +39,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
> >         unsigned long user_count = vma_pages(vma);
> >         unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> >         unsigned long off = vma->vm_pgoff;
> > +       struct page *page = dma_common_vaddr_to_page(cpu_addr);
> >         int ret = -ENXIO;
> >
> >         vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
> > @@ -43,7 +51,7 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
> >                 return -ENXIO;
> >
> >         return remap_pfn_range(vma, vma->vm_start,
> > -                       page_to_pfn(virt_to_page(cpu_addr)) + vma->vm_pgoff,
> > +                       page_to_pfn(page) + vma->vm_pgoff,
> >                         user_count << PAGE_SHIFT, vma->vm_page_prot);
> >  #else
> >         return -ENXIO;
> > --
> > 2.30.2
> >
> 
> 
> -- 
> Best Regards, Roman.
> 
--8323329-2042327733-1626449395=:3916--


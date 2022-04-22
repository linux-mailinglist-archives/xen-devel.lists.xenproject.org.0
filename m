Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01050C0B2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 22:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311232.528367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhzuk-0007Xw-GK; Fri, 22 Apr 2022 20:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311232.528367; Fri, 22 Apr 2022 20:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhzuk-0007Tm-CV; Fri, 22 Apr 2022 20:30:02 +0000
Received: by outflank-mailman (input) for mailman id 311232;
 Fri, 22 Apr 2022 20:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhzui-0007KR-Qe
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 20:30:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9b0dc89-c27a-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 22:29:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8F8361772;
 Fri, 22 Apr 2022 20:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21FFC385A4;
 Fri, 22 Apr 2022 20:29:55 +0000 (UTC)
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
X-Inumbo-ID: f9b0dc89-c27a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650659396;
	bh=P7rt1gadbKOBoGiZRhZ6zWKaJDOi0iWtl4Li0IVE+ho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JD/2AiRdv59h80FLcy4j0yOh6qD1OiyfGW+SCzJggo6ZQZE+RI3C3DQv+x0Ud8sdz
	 eYz1q3MkRuXb7GmdcdCRYhXlg7x90eeBdwc+5kqjg3vT664rqwO+Qd4cgqQeBu1AK5
	 CGWQDB5MJgHeWXfM7CeM2jEQjRX8zhz7HfYJXlVKeLIPU9XYZUVxlSdhoBaG4XFbY5
	 BxaOHtwhXRuNsv/B56GWoYVwh4AocC3/8uvJAS5/c5o8AMKnyVa/6h+cWCKkc61kGd
	 kxUmWMO57aiDeCoOMzyu/2HHRYCHHfe7qHSEqlNlV/RhF+fLUDwXa8eKVdXrgA200M
	 487Y3CfyFlHdw==
Date: Fri, 22 Apr 2022 13:29:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Rahul Singh <Rahul.Singh@arm.com>, Christoph Hellwig <hch@lst.de>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <86bc7ae3-d7af-5f6e-d246-b53a4fa8bc79@suse.com>
Message-ID: <alpine.DEB.2.22.394.2204221319490.915916@ubuntu-linux-20-04-desktop>
References: <20220415063705.GA24262@lst.de> <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop> <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com> <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop> <49E3535A-5672-4047-AF86-05D5597C7019@arm.com>
 <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop> <5C7EC3F4-9126-46E8-9321-60878357F939@arm.com> <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop> <12279FAE-2141-469E-A424-9984348E84BB@arm.com>
 <alpine.DEB.2.22.394.2204211444190.915916@ubuntu-linux-20-04-desktop> <20220422050405.GA10195@lst.de> <105DB518-DB5B-47F8-852F-C997678BBCE6@arm.com> <86bc7ae3-d7af-5f6e-d246-b53a4fa8bc79@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Apr 2022, Juergen Gross wrote:
> On 22.04.22 13:34, Rahul Singh wrote:
> > Hello Stefano, Christoph,
> > 
> > > On 22 Apr 2022, at 6:04 am, Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > On Thu, Apr 21, 2022 at 03:01:32PM -0700, Stefano Stabellini wrote:
> > > > swiotlb-xen: handle DMA_ATTR_NO_KERNEL_MAPPING
> > > > 
> > > > If DMA_ATTR_NO_KERNEL_MAPPING is set then the returned vaddr is a struct
> > > > *page instead of the virtual mapping of the buffer.
> > > > 
> > > > In xen_swiotlb_alloc_coherent, do not call virt_to_page, instead use the
> > > > returned pointer directly. Also do not memset the buffer or struct page
> > > > to zero.
> > > > 
> > > > In xen_swiotlb_free_coherent, check DMA_ATTR_NO_KERNEL_MAPPING and set
> > > > the page pointer appropriately.
> > > 
> > > Something like that should work, but it makes swiotlb-xen poke even
> > > more into the opaque dma-direct internals.  I'd rather do something
> > > like the patch below that uses the dma_direct allocator directly for
> > > arm, and simplifies the xen-swiotlb allocator now that it just needs
> > > to cater to the x86 case:
> > > 
> > > diff --git a/arch/arm/include/asm/xen/page-coherent.h
> > > b/arch/arm/include/asm/xen/page-coherent.h
> > > deleted file mode 100644
> > > index 27e984977402b..0000000000000
> > > --- a/arch/arm/include/asm/xen/page-coherent.h
> > > +++ /dev/null
> > > @@ -1,2 +0,0 @@
> > > -/* SPDX-License-Identifier: GPL-2.0 */
> > > -#include <xen/arm/page-coherent.h>
> > > diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> > > index a7e54a087b802..6e603e5fdebb1 100644
> > > --- a/arch/arm/xen/mm.c
> > > +++ b/arch/arm/xen/mm.c
> > > @@ -118,23 +118,6 @@ bool xen_arch_need_swiotlb(struct device *dev,
> > > 		!dev_is_dma_coherent(dev));
> > > }
> > > 
> > > -int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> > > -				 unsigned int address_bits,
> > > -				 dma_addr_t *dma_handle)
> > > -{
> > > -	if (!xen_initial_domain())
> > > -		return -EINVAL;
> > > -
> > > -	/* we assume that dom0 is mapped 1:1 for now */
> > > -	*dma_handle = pstart;
> > > -	return 0;
> > > -}
> > > -
> > > -void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int
> > > order)
> > > -{
> > > -	return;
> > > -}
> > > -
> > > static int __init xen_mm_init(void)
> > > {
> > > 	struct gnttab_cache_flush cflush;
> > > diff --git a/arch/arm64/include/asm/xen/page-coherent.h
> > > b/arch/arm64/include/asm/xen/page-coherent.h
> > > deleted file mode 100644
> > > index 27e984977402b..0000000000000
> > > --- a/arch/arm64/include/asm/xen/page-coherent.h
> > > +++ /dev/null
> > > @@ -1,2 +0,0 @@
> > > -/* SPDX-License-Identifier: GPL-2.0 */
> > > -#include <xen/arm/page-coherent.h>
> > > diff --git a/arch/x86/include/asm/xen/page-coherent.h
> > > b/arch/x86/include/asm/xen/page-coherent.h
> > > deleted file mode 100644
> > > index 63cd41b2e17ac..0000000000000
> > > --- a/arch/x86/include/asm/xen/page-coherent.h
> > > +++ /dev/null
> > > @@ -1,24 +0,0 @@
> > > -/* SPDX-License-Identifier: GPL-2.0 */
> > > -#ifndef _ASM_X86_XEN_PAGE_COHERENT_H
> > > -#define _ASM_X86_XEN_PAGE_COHERENT_H
> > > -
> > > -#include <asm/page.h>
> > > -#include <linux/dma-mapping.h>
> > > -
> > > -static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t
> > > size,
> > > -		dma_addr_t *dma_handle, gfp_t flags,
> > > -		unsigned long attrs)
> > > -{
> > > -	void *vstart = (void*)__get_free_pages(flags, get_order(size));
> > > -	*dma_handle = virt_to_phys(vstart);
> > > -	return vstart;
> > > -}
> > > -
> > > -static inline void xen_free_coherent_pages(struct device *hwdev, size_t
> > > size,
> > > -		void *cpu_addr, dma_addr_t dma_handle,
> > > -		unsigned long attrs)
> > > -{
> > > -	free_pages((unsigned long) cpu_addr, get_order(size));
> > > -}
> > > -
> > > -#endif /* _ASM_X86_XEN_PAGE_COHERENT_H */
> > > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > > index 47aebd98f52f5..557edb9c54879 100644
> > > --- a/drivers/xen/swiotlb-xen.c
> > > +++ b/drivers/xen/swiotlb-xen.c
> > > @@ -36,7 +36,6 @@
> > > #include <xen/hvc-console.h>
> > > 
> > > #include <asm/dma-mapping.h>
> > > -#include <asm/xen/page-coherent.h>
> > > 
> > > #include <trace/events/swiotlb.h>
> > > #define MAX_DMA_BITS 32
> > > @@ -104,6 +103,7 @@ static int is_xen_swiotlb_buffer(struct device *dev,
> > > dma_addr_t dma_addr)
> > > 	return 0;
> > > }
> > > 
> > > +#ifdef CONFIG_X86
> > > static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> > > {
> > > 	int rc;
> > > @@ -129,6 +129,12 @@ static int xen_swiotlb_fixup(void *buf, unsigned long
> > > nslabs)
> > > 	} while (i < nslabs);
> > > 	return 0;
> > > }
> > > +#else
> > > +static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> > > +{
> > > +	return 0;
> > > +}
> > > +#endif
> > > 
> > > enum xen_swiotlb_err {
> > > 	XEN_SWIOTLB_UNKNOWN = 0,
> > > @@ -256,97 +262,60 @@ void __init xen_swiotlb_init_early(void)
> > > 		panic("Cannot allocate SWIOTLB buffer");
> > > 	swiotlb_set_max_segment(PAGE_SIZE);
> > > }
> > > -#endif /* CONFIG_X86 */
> > > 
> > > static void *
> > > -xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
> > > -			   dma_addr_t *dma_handle, gfp_t flags,
> > > -			   unsigned long attrs)
> > > +xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
> > > +		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> > > {
> > > -	void *ret;
> > > +	u64 dma_mask = dev->coherent_dma_mask;
> > > 	int order = get_order(size);
> > > -	u64 dma_mask = DMA_BIT_MASK(32);
> > > 	phys_addr_t phys;
> > > -	dma_addr_t dev_addr;
> > > -
> > > -	/*
> > > -	* Ignore region specifiers - the kernel's ideas of
> > > -	* pseudo-phys memory layout has nothing to do with the
> > > -	* machine physical layout.  We can't allocate highmem
> > > -	* because we can't return a pointer to it.
> > > -	*/
> > > -	flags &= ~(__GFP_DMA | __GFP_HIGHMEM);
> > > +	void *ret;
> > > 
> > > -	/* Convert the size to actually allocated. */
> > > +	/* Align the allocation to the Xen page size */
> > > 	size = 1UL << (order + XEN_PAGE_SHIFT);
> > > 
> > > -	/* On ARM this function returns an ioremap'ped virtual address for
> > > -	 * which virt_to_phys doesn't return the corresponding physical
> > > -	 * address. In fact on ARM virt_to_phys only works for kernel direct
> > > -	 * mapped RAM memory. Also see comment below.
> > > -	 */
> > > -	ret = xen_alloc_coherent_pages(hwdev, size, dma_handle, flags, attrs);
> > > -
> > > +	ret = (void *)__get_free_pages(flags, get_order(size));
> > > 	if (!ret)
> > > 		return ret;
> > > -
> > > -	if (hwdev && hwdev->coherent_dma_mask)
> > > -		dma_mask = hwdev->coherent_dma_mask;
> > > -
> > > -	/* At this point dma_handle is the dma address, next we are
> > > -	 * going to set it to the machine address.
> > > -	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
> > > -	 * to *dma_handle. */
> > > -	phys = dma_to_phys(hwdev, *dma_handle);
> > > -	dev_addr = xen_phys_to_dma(hwdev, phys);
> > > -	if (((dev_addr + size - 1 <= dma_mask)) &&
> > > -	    !range_straddles_page_boundary(phys, size))
> > > -		*dma_handle = dev_addr;
> > > -	else {
> > > -		if (xen_create_contiguous_region(phys, order,
> > > -						 fls64(dma_mask), dma_handle)
> > > != 0) {
> > > -			xen_free_coherent_pages(hwdev, size, ret,
> > > (dma_addr_t)phys, attrs);
> > > -			return NULL;
> > > -		}
> > > -		*dma_handle = phys_to_dma(hwdev, *dma_handle);
> > > +	phys = virt_to_phys(ret);
> > > +
> > > +	*dma_handle = xen_phys_to_dma(dev, phys);
> > > +	if (*dma_handle + size - 1 > dma_mask ||
> > > +	    range_straddles_page_boundary(phys, size)) {
> > > +		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
> > > +				dma_handle) != 0)
> > > +			goto out_free_pages;
> > > 		SetPageXenRemapped(virt_to_page(ret));
> > > 	}
> > > +
> > > 	memset(ret, 0, size);
> > > 	return ret;
> > > +
> > > +out_free_pages:
> > > +	free_pages((unsigned long)ret, get_order(size));
> > > +	return NULL;
> > > }
> > > 
> > > static void
> > > -xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
> > > -			  dma_addr_t dev_addr, unsigned long attrs)
> > > +xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
> > > +		dma_addr_t dma_handle, unsigned long attrs)
> > > {
> > > +	phys_addr_t phys = virt_to_phys(vaddr);
> > > 	int order = get_order(size);
> > > -	phys_addr_t phys;
> > > -	u64 dma_mask = DMA_BIT_MASK(32);
> > > -	struct page *page;
> > > -
> > > -	if (hwdev && hwdev->coherent_dma_mask)
> > > -		dma_mask = hwdev->coherent_dma_mask;
> > > -
> > > -	/* do not use virt_to_phys because on ARM it doesn't return you the
> > > -	 * physical address */
> > > -	phys = xen_dma_to_phys(hwdev, dev_addr);
> > > 
> > > 	/* Convert the size to actually allocated. */
> > > 	size = 1UL << (order + XEN_PAGE_SHIFT);
> > > 
> > > -	if (is_vmalloc_addr(vaddr))
> > > -		page = vmalloc_to_page(vaddr);
> > > -	else
> > > -		page = virt_to_page(vaddr);
> > > +	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
> > > +	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
> > > +	    	return;
> > > 
> > > -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> > > -		     range_straddles_page_boundary(phys, size)) &&
> > > -	    TestClearPageXenRemapped(page))
> > > +	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
> > > 		xen_destroy_contiguous_region(phys, order);
> > > -
> > > -	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
> > > -				attrs);
> > > +	free_pages((unsigned long)vaddr, get_order(size));
> > > }
> > > +#endif /* CONFIG_X86 */
> > > 
> > > /*
> > >   * Map a single buffer of the indicated size for DMA in streaming mode.
> > > The
> > > @@ -549,8 +518,13 @@ xen_swiotlb_dma_supported(struct device *hwdev, u64
> > > mask)
> > > }
> > > 
> > > const struct dma_map_ops xen_swiotlb_dma_ops = {
> > > +#ifdef CONFIG_X86
> > > 	.alloc = xen_swiotlb_alloc_coherent,
> > > 	.free = xen_swiotlb_free_coherent,
> > > +#else
> > > +	.alloc = dma_direct_alloc,
> > > +	.free = dma_direct_free,
> > > +#endif
> > > 	.sync_single_for_cpu = xen_swiotlb_sync_single_for_cpu,
> > > 	.sync_single_for_device = xen_swiotlb_sync_single_for_device,
> > > 	.sync_sg_for_cpu = xen_swiotlb_sync_sg_for_cpu,
> > > diff --git a/include/xen/arm/page-coherent.h
> > > b/include/xen/arm/page-coherent.h
> > > deleted file mode 100644
> > > index b9cc11e887ed5..0000000000000
> > > --- a/include/xen/arm/page-coherent.h
> > > +++ /dev/null
> > > @@ -1,20 +0,0 @@
> > > -/* SPDX-License-Identifier: GPL-2.0 */
> > > -#ifndef _XEN_ARM_PAGE_COHERENT_H
> > > -#define _XEN_ARM_PAGE_COHERENT_H
> > > -
> > > -#include <linux/dma-mapping.h>
> > > -#include <asm/page.h>
> > > -
> > > -static inline void *xen_alloc_coherent_pages(struct device *hwdev, size_t
> > > size,
> > > -		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> > > -{
> > > -	return dma_direct_alloc(hwdev, size, dma_handle, flags, attrs);
> > > -}
> > > -
> > > -static inline void xen_free_coherent_pages(struct device *hwdev, size_t
> > > size,
> > > -		void *cpu_addr, dma_addr_t dma_handle, unsigned long attrs)
> > > -{
> > > -	dma_direct_free(hwdev, size, cpu_addr, dma_handle, attrs);
> > > -}
> > > -
> > > -#endif /* _XEN_ARM_PAGE_COHERENT_H */
> > 
> > Thanks for sharing the patch to fix the issue.
> > I tested both the patches and both the patches work fine.
> 
> I guess you fixed Stefano's patch (the line "virt_to_page(ret);" was missing
> a "page = ").
> 
> I'd be in favor of Christoph's patch, assuming it will work on x86, too.

I also prefer Christoph's patch :-)

It is great to remove xen_alloc_coherent_pages/xen_free_coherent_pages
for ARM. We can safely remove them because on ARM we can only use
swiotlb-xen when the domain is 1:1 mapped. So it is impossible to get
into a situation where memory allocated expected to be contiguous is not
actually contiguous.

So, from an ARM point of view, it is great. However,
DMA_ATTR_NO_KERNEL_MAPPING wouldn't work on x86 still? I don't know if
matters.

Then a small NIT: the declaration of xen_create_contiguous_region and
xen_destroy_contiguous_region should be moved away from
include/xen/xen-ops.h to an arch/x86 specific header. For instance to
arch/x86/include/asm/xen/swiotlb-xen.h. Or at least the #ifdef in
include/xen/xen-ops.h should change, currently it is:

#if defined(CONFIG_XEN_PV) || defined(CONFIG_ARM) || defined(CONFIG_ARM64)
int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
				unsigned int address_bits,
				dma_addr_t *dma_handle);
void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order);
#endif


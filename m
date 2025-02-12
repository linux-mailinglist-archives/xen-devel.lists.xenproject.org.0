Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B09A33156
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 22:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886758.1296371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiK3u-0003J1-7W; Wed, 12 Feb 2025 21:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886758.1296371; Wed, 12 Feb 2025 21:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiK3u-0003H6-24; Wed, 12 Feb 2025 21:14:26 +0000
Received: by outflank-mailman (input) for mailman id 886758;
 Wed, 12 Feb 2025 21:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiK3s-0003H0-58
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 21:14:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53709925-e986-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 22:14:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 685DD5C53AB;
 Wed, 12 Feb 2025 21:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE131C4CEDF;
 Wed, 12 Feb 2025 21:14:17 +0000 (UTC)
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
X-Inumbo-ID: 53709925-e986-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739394859;
	bh=dIqhk3djFsc3cAOqbHbhVUyG0+f+BY8S2yEkmEIiT0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FM39xked9CJJ3VZLi/LCH1yVlQqygsPF/WnRs/3TQ2j433zTnyeI/p/Ijho6DIq/3
	 pvz7mYSzGYJqWeTLWKAjh/TnwSYjLq9cu34OsSH0+Zh+yfa+qGZ4izxvs0yxwa2OGX
	 4pOYDBnRURLqRKCtB0g0cNc+J8IYSNo8n4BUz5UTmBRQVG9w0Ch2btNJpcBjRa9fQy
	 Vrf7A139Fu0Jfb+nVA/cgfyGSzvuus8wMazx1h2r87V07jE5/ONnaSj6Njh8KOkbbX
	 y23UCGj69P19iTesAWohj3PGUSbj3zisSvm7na3Q0LZ0YU0yg3/hNwweBzimQlI2+t
	 lpNCWwV7fRtMQ==
Date: Wed, 12 Feb 2025 13:14:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, 
    x86@kernel.org, iommu@lists.linux.dev, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
In-Reply-To: <b7bc43f9-47e6-4994-bba9-5c8be92a8e52@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502121310320.619090@ubuntu-linux-20-04-desktop>
References: <20250211120432.29493-1-jgross@suse.com> <20250211120432.29493-3-jgross@suse.com> <alpine.DEB.2.22.394.2502111728560.619090@ubuntu-linux-20-04-desktop> <b7bc43f9-47e6-4994-bba9-5c8be92a8e52@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-226463992-1739394832=:619090"
Content-ID: <alpine.DEB.2.22.394.2502121313580.619090@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-226463992-1739394832=:619090
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502121313581.619090@ubuntu-linux-20-04-desktop>

On Wed, 12 Feb 2025, Jürgen Groß wrote:
> On 12.02.25 02:30, Stefano Stabellini wrote:
> > On Tue, 11 Feb 2025, Juergen Gross wrote:
> > > In case xen_swiotlb_alloc_coherent() needed to create a contiguous
> > > region only for other reason than the memory not being compliant with
> > > the device's DMA mask, there is no reason why this contiguous region
> > > should be destroyed by xen_swiotlb_free_coherent() later. Destroying
> > > this region should be done only, if the memory of the region was
> > > allocated with more stringent placement requirements than the memory
> > > it did replace.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   arch/x86/include/asm/xen/swiotlb-xen.h |  5 +++--
> > >   arch/x86/xen/mmu_pv.c                  | 18 ++++++++++++------
> > >   drivers/xen/swiotlb-xen.c              | 11 +++++++----
> > >   3 files changed, 22 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/arch/x86/include/asm/xen/swiotlb-xen.h
> > > b/arch/x86/include/asm/xen/swiotlb-xen.h
> > > index abde0f44df57..a353f20c7e79 100644
> > > --- a/arch/x86/include/asm/xen/swiotlb-xen.h
> > > +++ b/arch/x86/include/asm/xen/swiotlb-xen.h
> > > @@ -4,8 +4,9 @@
> > >     int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
> > >   int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
> > > -				unsigned int address_bits,
> > > -				dma_addr_t *dma_handle);
> > > +				 unsigned int address_bits,
> > > +				 dma_addr_t *dma_handle,
> > > +				 unsigned int *address_bits_in);
> > >   void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int
> > > order);
> > >     #endif /* _ASM_X86_SWIOTLB_XEN_H */
> > > diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> > > index 2c70cd35e72c..fb586238f7c4 100644
> > > --- a/arch/x86/xen/mmu_pv.c
> > > +++ b/arch/x86/xen/mmu_pv.c
> > > @@ -2208,19 +2208,22 @@ void __init xen_init_mmu_ops(void)
> > >   static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
> > >     #define VOID_PTE (mfn_pte(0, __pgprot(0)))
> > > -static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
> > > -				unsigned long *in_frames,
> > > -				unsigned long *out_frames)
> > > +static int xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
> > > +			     unsigned long *in_frames,
> > > +			     unsigned long *out_frames)
> > >   {
> > >   	int i;
> > > +	u64 address_bits = 0;
> > >   	struct multicall_space mcs;
> > >     	xen_mc_batch();
> > >   	for (i = 0; i < (1UL<<order); i++, vaddr += PAGE_SIZE) {
> > >   		mcs = __xen_mc_entry(0);
> > >   -		if (in_frames)
> > > +		if (in_frames) {
> > >   			in_frames[i] = virt_to_mfn((void *)vaddr);
> > > +			address_bits |= in_frames[i] << PAGE_SHIFT;
> > > +		}
> > >     		MULTI_update_va_mapping(mcs.mc, vaddr, VOID_PTE, 0);
> > >   		__set_phys_to_machine(virt_to_pfn((void *)vaddr),
> > > INVALID_P2M_ENTRY);
> > > @@ -2229,6 +2232,8 @@ static void xen_zap_pfn_range(unsigned long vaddr,
> > > unsigned int order,
> > >   			out_frames[i] = virt_to_pfn((void *)vaddr);
> > >   	}
> > >   	xen_mc_issue(0);
> > > +
> > > +	return fls64(address_bits);
> > >   }
> > >     /*
> > > @@ -2321,7 +2326,8 @@ static int xen_exchange_memory(unsigned long
> > > extents_in, unsigned int order_in,
> > >     int xen_create_contiguous_region(phys_addr_t pstart, unsigned int
> > > order,
> > >   				 unsigned int address_bits,
> > > -				 dma_addr_t *dma_handle)
> > > +				 dma_addr_t *dma_handle,
> > > +				 unsigned int *address_bits_in)
> > >   {
> > >   	unsigned long *in_frames = discontig_frames, out_frame;
> > >   	unsigned long  flags;
> > > @@ -2336,7 +2342,7 @@ int xen_create_contiguous_region(phys_addr_t pstart,
> > > unsigned int order,
> > >   	spin_lock_irqsave(&xen_reservation_lock, flags);
> > >     	/* 1. Zap current PTEs, remembering MFNs. */
> > > -	xen_zap_pfn_range(vstart, order, in_frames, NULL);
> > > +	*address_bits_in = xen_zap_pfn_range(vstart, order, in_frames, NULL);
> > >     	/* 2. Get a new contiguous memory extent. */
> > >   	out_frame = virt_to_pfn((void *)vstart);
> > > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > > index 26c62e0d34e9..3f3724f53914 100644
> > > --- a/drivers/xen/swiotlb-xen.c
> > > +++ b/drivers/xen/swiotlb-xen.c
> > > @@ -118,6 +118,7 @@ int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> > >   	int rc;
> > >   	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
> > >   	unsigned int i, dma_bits = order + PAGE_SHIFT;
> > > +	unsigned int dummy;
> > >   	dma_addr_t dma_handle;
> > >   	phys_addr_t p = virt_to_phys(buf);
> > >   @@ -129,7 +130,7 @@ int xen_swiotlb_fixup(void *buf, unsigned long
> > > nslabs)
> > >   		do {
> > >   			rc = xen_create_contiguous_region(
> > >   				p + (i << IO_TLB_SHIFT), order,
> > > -				dma_bits, &dma_handle);
> > > +				dma_bits, &dma_handle, &dummy);
> > >   		} while (rc && dma_bits++ < MAX_DMA_BITS);
> > >   		if (rc)
> > >   			return rc;
> > > @@ -144,6 +145,7 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t
> > > size,
> > >   		dma_addr_t *dma_handle, gfp_t flags, unsigned long attrs)
> > >   {
> > >   	u64 dma_mask = dev->coherent_dma_mask;
> > > +	unsigned int address_bits = fls64(dma_mask), address_bits_in;
> > >   	int order = get_order(size);
> > >   	phys_addr_t phys;
> > >   	void *ret;
> > > @@ -160,10 +162,11 @@ xen_swiotlb_alloc_coherent(struct device *dev,
> > > size_t size,
> > >   	if (*dma_handle + size - 1 > dma_mask ||
> > >   	    range_straddles_page_boundary(phys, size) ||
> > >   	    range_requires_alignment(phys, size)) {
> > > -		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
> > > -				dma_handle) != 0)
> > > +		if (xen_create_contiguous_region(phys, order, address_bits,
> > > +						 dma_handle,
> > > &address_bits_in))
> > >   			goto out_free_pages;
> > > -		SetPageXenRemapped(virt_to_page(ret));
> > > +		if (address_bits_in > address_bits)
> > > +			SetPageXenRemapped(virt_to_page(ret));
> > 
> > This has the unfortunate side effect of making "PageXenRemapped"
> > unreliable as an indicator of whether a page has been remapped. A page
> > could still be remapped without the "PageXenRemapped" bit being set.
> > 
> > I recommend adding an in-code comment to clarify this behavior.
> 
> The PageXenRemapped bit is used only for determining whether
> xen_destroy_contiguous_region() should be called. And by not setting the bit
> I'm avoiding to call xen_destroy_contiguous_region() later. So I don't see any
> unfortunate side effect.

While the purpose of PageXenRemapped is to determine whether
xen_destroy_contiguous_region() should be called for the region, the
name "PageXenRemapped" suggests more generically that the region is
remapped.

Without this patch, all the regions that are remapped have
PageXenRemapped set. The name matches its meaning. (Also,
xen_destroy_contiguous_region() is called an them.)

With this patch, not all the regions that are remapped have
PageXenRemapped set. The name does not match its meaning.
--8323329-226463992-1739394832=:619090--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E650AB24
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 00:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310487.527352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nherr-0003jM-Qh; Thu, 21 Apr 2022 22:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310487.527352; Thu, 21 Apr 2022 22:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nherr-0003gs-NQ; Thu, 21 Apr 2022 22:01:39 +0000
Received: by outflank-mailman (input) for mailman id 310487;
 Thu, 21 Apr 2022 22:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nherq-0003gl-3E
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 22:01:38 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cc71d17-c1be-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 00:01:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62834B826CB;
 Thu, 21 Apr 2022 22:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9BEC385A5;
 Thu, 21 Apr 2022 22:01:33 +0000 (UTC)
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
X-Inumbo-ID: 9cc71d17-c1be-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650578494;
	bh=1tesikSwyZurh75SXK/LLwrfwkYRq134cw9ak39qSa8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VafdCrHrOxUod/JDNWujyqsqKTuRkPUdR5CiZ0O9WW+NZY5+wBQGxSc/BKEaxLJUq
	 70gCZPPdVVnHkNRX8Zmmnbaj3ab4E8B7wChvFhERnPZrLZRi9I3/luaEmg19mh++Rx
	 QzfdSh5MnD21oexo7OEdzBjuBnysIYhbc/OrvFHmP7NEznecxCQeDGHF0JAespyb+W
	 VrhV6mlRiB+9KXVwc6MTRuiLXetOSwuegr+ZP3fP7ZmrkywWPD3QaMpl0s0X2jRt0t
	 3pZBDUUogeaA1kgJey0Sn3csqEmriB2CemCtvYK1LcXwOfR4FI5mB72Ji4B4at2e4z
	 Mmz3LJZO/IndA==
Date: Thu, 21 Apr 2022 15:01:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Christoph Hellwig <hch@lst.de>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Subject: Re: xen-swiotlb issue when NVMe driver is enabled in Dom0 on ARM
In-Reply-To: <12279FAE-2141-469E-A424-9984348E84BB@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204211444190.915916@ubuntu-linux-20-04-desktop>
References: <C82612B1-FED5-4139-9B87-FB33DD81F01A@arm.com> <alpine.DEB.2.22.394.2204131354190.3066615@ubuntu-linux-20-04-desktop> <8C511888-6183-421E-A4C7-B271DAF46696@arm.com> <alpine.DEB.2.22.394.2204141329290.894007@ubuntu-linux-20-04-desktop>
 <20220415063705.GA24262@lst.de> <alpine.DEB.2.22.394.2204150917390.915916@ubuntu-linux-20-04-desktop> <4BC65913-EB0A-441C-A09C-4175697BDE9D@arm.com> <alpine.DEB.2.22.394.2204181225340.915916@ubuntu-linux-20-04-desktop> <49E3535A-5672-4047-AF86-05D5597C7019@arm.com>
 <alpine.DEB.2.22.394.2204191933450.915916@ubuntu-linux-20-04-desktop> <5C7EC3F4-9126-46E8-9321-60878357F939@arm.com> <alpine.DEB.2.22.394.2204201523390.915916@ubuntu-linux-20-04-desktop> <12279FAE-2141-469E-A424-9984348E84BB@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1560539718-1650577465=:915916"
Content-ID: <alpine.DEB.2.22.394.2204211444270.915916@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1560539718-1650577465=:915916
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204211444271.915916@ubuntu-linux-20-04-desktop>

On Thu, 21 Apr 2022, Rahul Singh wrote:
> > On 20 Apr 2022, at 11:46 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Wed, 20 Apr 2022, Rahul Singh wrote:
> >>> On 20 Apr 2022, at 3:36 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>>> Then there is xen_swiotlb_init() which allocates some memory for
> >>>>> swiotlb-xen at boot. It could lower the total amount of memory
> >>>>> available, but if you disabled swiotlb-xen like I suggested,
> >>>>> xen_swiotlb_init() still should get called and executed anyway at boot
> >>>>> (it is called from arch/arm/xen/mm.c:xen_mm_init). So xen_swiotlb_init()
> >>>>> shouldn't be the one causing problems.
> >>>>> 
> >>>>> That's it -- there is nothing else in swiotlb-xen that I can think of.
> >>>>> 
> >>>>> I don't have any good ideas, so I would only suggest to add more printks
> >>>>> and report the results, for instance:
> >>>> 
> >>>> As suggested I added the more printks but only difference I see is the size apart
> >>>> from that everything looks same .
> >>>> 
> >>>> Please find the attached logs for xen and native linux boot.
> >>> 
> >>> One difference is that the order of the allocations is significantly
> >>> different after the first 3 allocations. It is very unlikely but
> >>> possible that this is an unrelated concurrency bug that only occurs on
> >>> Xen. I doubt it.
> >> 
> >> I am not sure but just to confirm with you, I see below logs in every scenario.
> >> SWIOTLB memory allocated by linux swiotlb and used by xen-swiotlb. Is that okay or it can cause some issue.
> >> 
> >> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> >> [    0.000000] software IO TLB: mapped [mem 0x00000000f4000000-0x00000000f8000000] (64MB)
> >> 
> >> snip from int __ref xen_swiotlb_init(int verbose, bool early)
> >> /*                                                                         
> >>      * IO TLB memory already allocated. Just use it.                           
> >>      */                                                                        
> >>     if (io_tlb_start != 0) {                                                   
> >>         xen_io_tlb_start = phys_to_virt(io_tlb_start);                         
> >>         goto end;                                                              
> >>     }
> > 
> > Unfortunately there is nothing obvious in the logs. I think we need to
> > look at the in-details executions of Linux on Xen with swiotlb-xen and
> > Linux on Xen without swiotlb-xen. The comparison with Linux on native is
> > not very interesting because the memory layout is a bit different.
> > 
> > The comparison between the two executions should be simple because
> > swiotlb-xen should be transparent: in this simple case swiotlb-xen
> > should end up calling always the same functions that would end up being
> > called anyway without swiotlb-xen. Basically, it should only add a
> > couple of extra steps in between, nothing else.
> > 
> > As we have already discussed:
> > 
> > - [no swiotlb-xen] dma_alloc_attrs --> dma_direct_alloc
> > - [swiotlb-xen] dma_alloc_attrs --> xen_swiotlb_alloc_coherent --> dma_direct_alloc
> > 
> > The result should be identical. In xen_swiotlb_alloc_coherent the code
> > path taken should be:
> > 
> > - xen_alloc_coherent_pages
> > - if (((dev_addr + size - 1 <= dma_mask)) &&
> >      !range_straddles_page_boundary(phys, size)) {
> >      *dma_handle = dev_addr;
> > - return ret
> > 
> > So basically, it should make zero difference. That is expected because
> > swiotlb-xen really only comes into play for domU pages. For booting
> > dom0, it should only be a "useless" indirection.
> > 
> > In the case of xen_swiotlb_map_page, it should be similar. The path
> > taken should be:
> > 
> > 	if (dma_capable(dev, dev_addr, size, true) &&
> > 	    !range_straddles_page_boundary(phys, size) &&
> > 		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
> > 		swiotlb_force != SWIOTLB_FORCE)
> > 		goto done;
> > 
> > which I think should correspond to this prints in your logs at line 400:
> > 
> >    DEBUG xen_swiotlb_map_page 400 phys=80003c4f000 dev_addr=80003c4f000
> > 
> > So that should be OK too. If different paths are taken, then we have a
> > problem. If the paths above are taken there should be zero difference
> > between the swiotlb-xen and the non-swiotlb-xen cases.
> > 
> > Which brings me to your question about xen_swiotlb_init and this
> > message:
> > 
> >    software IO TLB: mapped [mem 0x00000000f4000000-0x00000000f8000000] (64MB)
> > 
> > The swiotlb-xen buffer should *not* be used if the code paths taken are
> > the ones above. So it doesn't matter if it is allocated or not. You
> > could comment out the code in xen_swiotlb_init and everything should
> > still behave the same.
> > 
> > Finally, my suggestion. Considering all the above, I would look *very*
> > closely at the execution of Linux on Xen with and without swiotlb-xen.
> > The differences should be really minimal. Adds prints to all the
> > swiotlb-xen functions, but really only the following should matter:
> > - xen_swiotlb_alloc_coherent
> > - xen_swiotlb_map_page
> > - xen_swiotlb_unmap_page
> > 
> > What are the differences between the two executions? From the logs:
> > 
> > - the allocation of the swiotlb-xen buffer which leads to 64MB of less
> >  memory available, but actually if you compared to Linux on Xen
> >  with/without swiotlb-xen this different would go away because
> >  xen_swiotlb_init would be called in both cases anyway
> > 
> > - the size upgrade in xen_swiotlb_alloc_coherent: I can see several
> >  instances of the allocation size being increased. Is that causing the
> >  problem? It seems unlikely and you have already verified it is not the
> >  case by removing the size increase in xen_swiotlb_alloc_coherent
> > 
> > - What else is different? There *must* be something, but it is not
> >  showing in the logs so far.
> > 
> > 
> > The only other observation that I have, but it doesn't help, is that the
> > failure happens on the second 4MB allocation when there is another
> > concurrent memory allocation of 4K. Neither the 4MB nor the 4K are
> > size-upgrades by xen_swiotlb_alloc_coherent.
> > 
> > 4MB is an larger-than-usual size, but it shouldn't make that much of a
> > difference. Is that problem that the 4MB have to be contiguous? I don't
> > see how swiotlb-xen could have an impact in that regard, if not for the
> > size increase in xen_swiotlb_alloc_coherent.
> > 
> > Please let me know what you find.
> 
> I debug the issue more today and found out that the only difference when
> calling dma_alloc_attrs() from the NVMe driver [1] and the other driver is the
> attribute “DMA_ATTR_NO_KERNEL_MAPPING". 

This is progress!


> I remove the attribute "DMA_ATTR_NO_KERNEL_MAPPING” before
> calling the xen_alloc_coherent_pages() , NVMe DMA allocation is successful
> and the issue is not observed.
> 
> Do you have any idea why attribute DMA_ATTR_NO_KERNEL_MAPPING is
> causing the the issue with xen-swiotlb.

Yes, if you look at xen_swiotlb_free_coherent, it is clear that things
won't work for the DMA_ATTR_NO_KERNEL_MAPPING case. Can you have a try
at the patch below?

---
swiotlb-xen: handle DMA_ATTR_NO_KERNEL_MAPPING

If DMA_ATTR_NO_KERNEL_MAPPING is set then the returned vaddr is a struct
*page instead of the virtual mapping of the buffer.

In xen_swiotlb_alloc_coherent, do not call virt_to_page, instead use the
returned pointer directly. Also do not memset the buffer or struct page
to zero.

In xen_swiotlb_free_coherent, check DMA_ATTR_NO_KERNEL_MAPPING and set
the page pointer appropriately.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..22d8779d3ac0 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -318,15 +318,21 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	    !range_straddles_page_boundary(phys, size))
 		*dma_handle = dev_addr;
 	else {
+		struct page *page;
+
 		if (xen_create_contiguous_region(phys, order,
 						 fls64(dma_mask), dma_handle) != 0) {
 			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
 			return NULL;
 		}
 		*dma_handle = phys_to_dma(hwdev, *dma_handle);
-		SetPageXenRemapped(virt_to_page(ret));
+
+		if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+			page = ret;
+		else
+			virt_to_page(ret);
+		SetPageXenRemapped(page);
 	}
-	memset(ret, 0, size);
 	return ret;
 }
 
@@ -349,7 +355,9 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
-	if (is_vmalloc_addr(vaddr))
+	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		page = vaddr;
+	else if (is_vmalloc_addr(vaddr))
 		page = vmalloc_to_page(vaddr);
 	else
 		page = virt_to_page(vaddr);
--8323329-1560539718-1650577465=:915916--


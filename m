Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C98978C3C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 02:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798518.1208731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spGoN-000420-A4; Sat, 14 Sep 2024 00:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798518.1208731; Sat, 14 Sep 2024 00:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spGoN-0003zt-7I; Sat, 14 Sep 2024 00:38:51 +0000
Received: by outflank-mailman (input) for mailman id 798518;
 Sat, 14 Sep 2024 00:38:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1spGoL-0003zn-Ev
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2024 00:38:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b03c79-7231-11ef-a0b5-8be0dac302b0;
 Sat, 14 Sep 2024 02:38:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B37E5C0295;
 Sat, 14 Sep 2024 00:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41336C4CEC0;
 Sat, 14 Sep 2024 00:38:44 +0000 (UTC)
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
X-Inumbo-ID: b3b03c79-7231-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726274325;
	bh=xPV8+ZCZJcBdtoPdBMxViz7qFsscKin9fUcUeIj1Das=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IvdbTk0qtd4kv3EfRvhJuttLjW3wI/AaYCcs7hTeWEW6MqTOT1+S1Kfkw9qbfJpS6
	 sT2wWYpJ2h/HfHJQmeFREzvUXXoI3z5FiXFDc3vtRx1oqGfiekJ62ApfahE818lPhs
	 3+WNpwNyFhD1JQA5EOY/47tZ6dGUXxX6k8NOPdGOMGYj9XZlFAZLaeA9Q2iRiolSsd
	 xfkCowhZtEn7sRRuROXJMO/pjSo3xwK3RVMeRPwE0a+jBFxfQWYWhsahFU5zTISYi5
	 umMVtk0N2Mhf2HhpfoP54Hc6PapCaPWT7ZUvXymslbMS31ETfwCyGcKW9DUFbSCyUJ
	 2JzXKNEK9i/Kw==
Date: Fri, 13 Sep 2024 17:38:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    iommu@lists.linux.dev
Subject: Re: [PATCH] xen/swiotlb: add alignment check for dma buffers
In-Reply-To: <a0b0dec5-03c1-4b69-aa0e-65771251d859@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409131728420.1417852@ubuntu-linux-20-04-desktop>
References: <20240913145655.10076-1-jgross@suse.com> <a0b0dec5-03c1-4b69-aa0e-65771251d859@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Sep 2024, Jan Beulich wrote:
> On 13.09.2024 16:56, Juergen Gross wrote:
> > --- a/drivers/xen/swiotlb-xen.c
> > +++ b/drivers/xen/swiotlb-xen.c
> > @@ -78,9 +78,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
> >  {
> >  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
> >  	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
> > +	unsigned int order = get_order(size);
> >  
> >  	next_bfn = pfn_to_bfn(xen_pfn);
> >  
> > +	/* If buffer is physically aligned, ensure DMA alignment. */
> > +	if (IS_ALIGNED(p, 1UL << (order + PAGE_SHIFT)) &&
> 
> Why this check? xen_swiotlb_alloc_coherent() guarantees it, while
> xen_swiotlb_free_coherent() only checks properties of the original
> allocation. And for xen_swiotlb_map_page() this looks actively
> wrong to me, in case that function was called with offset non-zero.

I understand xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent
not needing the check, but I think we might need the check for
xen_swiotlb_map_page. At that point, I would keep the check for all
callers. Unless there is another way to detect whether the mapping needs
alignment specifically for map_page?

For the offset, in theory if the device needs alignment, the offset
should be zero? If the offset is not zero, then there should be no
alignment requirement. The way Juergen wrote the check, we would take
the fast path if offset != zero, which makes sense to me.


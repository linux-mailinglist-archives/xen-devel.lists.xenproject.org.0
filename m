Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED170B723
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 09:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537785.837299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q10P2-0007Oh-Mw; Mon, 22 May 2023 07:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537785.837299; Mon, 22 May 2023 07:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q10P2-0007Lm-KF; Mon, 22 May 2023 07:56:24 +0000
Received: by outflank-mailman (input) for mailman id 537785;
 Mon, 22 May 2023 07:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+bL=BL=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1q10LQ-0007FT-Rm
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 07:52:41 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f50eddf-f875-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 09:52:39 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id EF59213B56F;
 Mon, 22 May 2023 09:52:36 +0200 (CEST)
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
X-Inumbo-ID: 9f50eddf-f875-11ed-b22d-6b7b168915f2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1684741957; bh=jsaH7ZUR8wFCXeTPqJ2mL6nQoFiuy/hnhhZO4oD2tJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fXLslpJh2pwyFKw46yDmLuFNtmDG417D/1pluDHbFUpLWOwxyyXphbZ+9lLt3heq7
	 TOb5LFM2ep8I/lYW4Rxr5pHLuRjmIlNZoYtrmqI1HI1Aj8EtmH0K1aKdNONSyGD1Py
	 XdEor7u4dVunv3kxrnDKD6H6CPX2AwcjRZNJe7gb2lMO9/J9SGd4Q4jlhu1PXBOR9X
	 umCg5oPeTTUZBH6IYcTRYkSLv2mz+GU1YhZ1d2/UJvK2yGwyYjAY4LOa34SP/h5Vwo
	 3uqicj2hzNb+4IDukPrPnygCZF3c4jC6VDTzVjC0Yz6vqF4Y4Ik5ldeKmw8O39I5xE
	 IgfjiqYv6v6TQ==
Date: Mon, 22 May 2023 09:52:36 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Marek =?UTF-8?B?TWFyY3p5?=
 =?UTF-8?B?a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when
 xen-pcifront is enabling
Message-ID: <20230522095236.27460d93@meshulam.tesarici.cz>
In-Reply-To: <20230520062103.GA1225@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
	<20230518134253.909623-3-hch@lst.de>
	<ZGZr/xgbUmVqpOpN@mail-itl>
	<20230519040405.GA10818@lst.de>
	<ZGdLErBzi9MANL3i@mail-itl>
	<20230519124118.GA5869@lst.de>
	<8617570c-6dc4-74f5-7418-98f04f7e0ece@citrix.com>
	<20230519125857.GA6994@lst.de>
	<20230520062103.GA1225@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Christoph,

On Sat, 20 May 2023 08:21:03 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Fri, May 19, 2023 at 02:58:57PM +0200, Christoph Hellwig wrote:
> > On Fri, May 19, 2023 at 01:49:46PM +0100, Andrew Cooper wrote:  
> > > > The alternative would be to finally merge swiotlb-xen into swiotlb, in
> > > > which case we might be able to do this later.  Let me see what I can
> > > > do there.  
> > > 
> > > If that is an option, it would be great to reduce the special-cashing.  
> > 
> > I think it's doable, and I've been wanting it for a while.  I just
> > need motivated testers, but it seems like I just found at least two :)  
> 
> So looking at swiotlb-xen it does these off things where it takes a value
> generated originally be xen_phys_to_dma, then only does a dma_to_phys
> to go back and call pfn_valid on the result.  Does this make sense, or
> is it wrong and just works by accident?  I.e. is the patch below correct?
> 
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 67aa74d201627d..3396c5766f0dd8 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -90,9 +90,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>  
>  static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
>  {
> -	unsigned long bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
> -	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
> -	phys_addr_t paddr = (phys_addr_t)xen_pfn << XEN_PAGE_SHIFT;
> +	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);


I'm no big Xen expert, but I think this is wrong. Let's go through it
line by line:

- bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));

  Take the DMA address (as seen by devices on the bus), convert it to a
  physical address (as seen by the CPU on the bus) and shift it right
  by XEN_PAGE_SHIFT. The result is a Xen machine PFN.

- xen_pfn = bfn_to_local_pfn(bfn);

  Take the machine PFN and converts it to a physical PFN.

- paddr = (phys_addr_t)xen_pfn << XEN_PAGE_SHIFT;

  Convert the physical PFN to a physical address.

The important thing here is that Xen PV does not have auto-translated
physical addresses, so physical address != machine address. Physical
addresses in Xen PV domains are "artificial", used by the kernel to
index the mem_map array, so a PFN can be easily converted to a struct
page pointer and back. However, these addresses are never used by
hardware, not even by CPU. The addresses used by the CPU are called
machine addresses. There is no address translation between VCPUs and
CPUs, because a PV domain runs directly on the CPU. After all, that's
why it is called _para_virtualized.

HTH
Petr T


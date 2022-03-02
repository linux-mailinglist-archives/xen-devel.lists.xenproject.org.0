Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFEA4C9EFB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 09:15:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282040.480591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPK8c-0001g7-GY; Wed, 02 Mar 2022 08:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282040.480591; Wed, 02 Mar 2022 08:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPK8c-0001df-Dc; Wed, 02 Mar 2022 08:15:10 +0000
Received: by outflank-mailman (input) for mailman id 282040;
 Wed, 02 Mar 2022 08:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYeN=TN=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nPK8b-0001dZ-JU
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 08:15:09 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df9e52f2-9a00-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 09:15:08 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 527A368BEB; Wed,  2 Mar 2022 09:15:01 +0100 (CET)
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
X-Inumbo-ID: df9e52f2-9a00-11ec-8539-5f4723681683
Date: Wed, 2 Mar 2022 09:15:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220302081500.GB23075@lst.de>
References: <20220301105311.885699-1-hch@lst.de> <20220301105311.885699-12-hch@lst.de> <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 01, 2022 at 06:55:47PM -0800, Stefano Stabellini wrote:
> Unrelated to this specific patch series: now that I think about it, if
> io_tlb_default_mem.nslabs is already allocated by the time xen_mm_init
> is called, wouldn't we potentially have an issue with the GFP flags used
> for the earlier allocation (e.g. GFP_DMA32 not used)? Maybe something
> for another day.

swiotlb_init allocates low memory from meblock, which is roughly
equivalent to GFP_DMA allocations, so we'll be fine.

> > @@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
> >  	if (!xen_swiotlb_detect())
> >  		return 0;
> >  
> > -	rc = xen_swiotlb_init();
> >  	/* we can work with the default swiotlb */
> > -	if (rc < 0 && rc != -EEXIST)
> > -		return rc;
> > +	if (!io_tlb_default_mem.nslabs) {
> > +		if (!xen_initial_domain())
> > +			return -EINVAL;
> 
> I don't think we need this xen_initial_domain() check. It is all
> already sorted out by the xen_swiotlb_detect() check above.

Is it?

static inline int xen_swiotlb_detect(void)
{
	if (!xen_domain())
		return 0;
	if (xen_feature(XENFEAT_direct_mapped))
		return 1;
	/* legacy case */
	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
		return 1;
	return 0;
}

I think I'd keep it as-is for now, as my planned next step would be to
fold xen-swiotlb into swiotlb entirely.


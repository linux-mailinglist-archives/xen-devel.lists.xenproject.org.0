Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA771285850
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 08:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3321.9625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ2Un-00019M-AP; Wed, 07 Oct 2020 06:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3321.9625; Wed, 07 Oct 2020 06:00:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ2Un-00018x-6p; Wed, 07 Oct 2020 06:00:13 +0000
Received: by outflank-mailman (input) for mailman id 3321;
 Wed, 07 Oct 2020 06:00:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HSOu=DO=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kQ2Ul-00018r-SD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 06:00:11 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51a96415-3d73-4d31-a9a9-fa9e3514929f;
 Wed, 07 Oct 2020 06:00:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1BC7D68B02; Wed,  7 Oct 2020 08:00:09 +0200 (CEST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HSOu=DO=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kQ2Ul-00018r-SD
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 06:00:11 +0000
X-Inumbo-ID: 51a96415-3d73-4d31-a9a9-fa9e3514929f
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 51a96415-3d73-4d31-a9a9-fa9e3514929f;
	Wed, 07 Oct 2020 06:00:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1BC7D68B02; Wed,  7 Oct 2020 08:00:09 +0200 (CEST)
Date: Wed, 7 Oct 2020 08:00:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: Re: xen-swiotlb vs phys_to_dma
Message-ID: <20201007060008.GA10125@lst.de>
References: <20201002123436.GA30329@lst.de> <alpine.DEB.2.21.2010021313010.10908@sstabellini-ThinkPad-T480s> <20201006082656.GB10243@lst.de> <alpine.DEB.2.21.2010061325230.10908@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010061325230.10908@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Oct 06, 2020 at 01:46:12PM -0700, Stefano Stabellini wrote:
> OK, this makes a lot of sense, and I like the patch because it makes the
> swiotlb interface clearer.
> 
> Just one comment below.
> 

> > +phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
> > +		size_t mapping_size, size_t alloc_size,
> > +		enum dma_data_direction dir, unsigned long attrs)
> >  {
> > +	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(dev, io_tlb_start);
> 
> This is supposed to be hwdev, not dev

Yeah, te compiler would be rather unhappy oterwise.

I'll resend it after the dma-mapping and Xen trees are merged by Linus
to avoid a merge conflict.


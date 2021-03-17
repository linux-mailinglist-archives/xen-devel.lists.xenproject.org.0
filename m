Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7FF33F7A9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 18:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98774.187586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMaQV-00076V-Mf; Wed, 17 Mar 2021 17:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98774.187586; Wed, 17 Mar 2021 17:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMaQV-000768-Iv; Wed, 17 Mar 2021 17:57:47 +0000
Received: by outflank-mailman (input) for mailman id 98774;
 Wed, 17 Mar 2021 17:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+YAO=IP=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lMaQU-000763-OC
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 17:57:46 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82fd35b1-43bd-4e86-8796-7be9ea12fd7a;
 Wed, 17 Mar 2021 17:57:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6243568BFE; Wed, 17 Mar 2021 18:57:42 +0100 (CET)
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
X-Inumbo-ID: 82fd35b1-43bd-4e86-8796-7be9ea12fd7a
Date: Wed, 17 Mar 2021 18:57:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Michael Ellerman <mpe@ellerman.id.au>,
	iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	Claire Chang <tientzu@chromium.org>, linuxppc-dev@lists.ozlabs.org,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH 12/14] swiotlb: move global variables into a new
 io_tlb_mem structure
Message-ID: <20210317175742.GA29280@lst.de>
References: <20210301074436.919889-1-hch@lst.de> <20210301074436.919889-13-hch@lst.de> <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com> <20210317135327.GA10797@lst.de> <YFJBvFjtZUiBQj4k@Konrads-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFJBvFjtZUiBQj4k@Konrads-MacBook-Pro.local>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Mar 17, 2021 at 01:51:56PM -0400, Konrad Rzeszutek Wilk wrote:
> On Wed, Mar 17, 2021 at 02:53:27PM +0100, Christoph Hellwig wrote:
> > On Wed, Mar 17, 2021 at 01:42:07PM +0000, Konrad Rzeszutek Wilk wrote:
> > > > -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
> > > > -	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > > -	if (!io_tlb_alloc_size)
> > > > -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> > > > -		      __func__, alloc_size, PAGE_SIZE);
> > > 
> > > Shouldn't this be converted to:
> > > 	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > 	if (...)
> > > 
> > > Seems that it got lost in the search and replace?
> > 
> > Yes, I messed that up during the rebase.  That being said it magically
> > gets fixed in the next patch..
> 
> Yes. However if someone does a bisection they are going to be mighty unhappy
> with you.

Sure, I was planning on fixing it anyway.  Just waiting for feedback
on the rest of the patches before doing a respin.


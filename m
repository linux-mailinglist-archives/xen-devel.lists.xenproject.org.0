Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7041002E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 22:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189688.339538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRK6Q-0004ZB-2v; Fri, 17 Sep 2021 20:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189688.339538; Fri, 17 Sep 2021 20:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRK6P-0004XO-W1; Fri, 17 Sep 2021 20:04:53 +0000
Received: by outflank-mailman (input) for mailman id 189688;
 Fri, 17 Sep 2021 20:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WA1=OH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mRK6O-0004XI-QF
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 20:04:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b27a69a9-28b1-4f14-bfe1-52bd1bf787c7;
 Fri, 17 Sep 2021 20:04:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18D11611C3;
 Fri, 17 Sep 2021 20:04:51 +0000 (UTC)
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
X-Inumbo-ID: b27a69a9-28b1-4f14-bfe1-52bd1bf787c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631909091;
	bh=mEyjE0OtAQmdOBy6JF1uWMiaz+LsaQ2TOO9N0GzD4q8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TwffbNS4RL5k7jgYAk9bPvqGar9gPSXlDk7tGrFRJS6vG73q/79FwFr4xCCJNw66u
	 faPcb3eKXbUXcWv89rMvuYi/3EqZIZqPynZ0WV/pN974Hj6SuS9OvfoEUzia0kGSgw
	 mzsjR/DoMpf7tw4UA3fGaUygmCF//mPQMFR0RSwEkTVgEGfu0fJtHyKA2mJa1p15cL
	 7iBAO8W5stpj5jk+KUlDxzg1MU6JehWVMawg6sskx2DvAncMAwMtsqXL9ioGWwOMYY
	 VslTVrm1j8TiDQ36VTupNVotaWGVYguVOhI/f4EI09U3JMvFkddeor/0PdlCclJ7XV
	 T6eyo4p4Y6/pA==
Date: Fri, 17 Sep 2021 13:04:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "hch@lst.de" <hch@lst.de>, Konrad Wilk <konrad.wilk@oracle.com>, 
    "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH v2 1/4] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
In-Reply-To: <7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com>
Message-ID: <alpine.DEB.2.21.2109171304380.21985@sstabellini-ThinkPad-T480s>
References: <164e58ff-2edd-2c99-ac3d-e18eb06ff731@suse.com> <7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Sep 2021, Jan Beulich wrote:
> While the hypervisor hasn't been enforcing this, we would still better
> avoid issuing requests with GFNs not aligned to the requested order.
> Instead of altering the value also in the call to panic(), drop it
> there for being static and hence easy to determine without being part
> of the panic message.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I question how useful it is to wrap "bytes" in PAGE_ALIGN(), when it is
> a multiple of a segment's size anyway (or at least was supposed to be,
> prior to "swiotlb-xen: maintain slab count properly"). But that's
> perhaps yet another separate patch.
> ---
> v2: Drop logging of alignment. Wrap lines.
> 
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -230,10 +230,11 @@ retry:
>  	/*
>  	 * Get IO TLB memory from any location.
>  	 */
> -	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	start = memblock_alloc(PAGE_ALIGN(bytes),
> +			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	if (!start)
> -		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
> -		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
> +		panic("%s: Failed to allocate %lu bytes\n",
> +		      __func__, PAGE_ALIGN(bytes));
>  
>  	/*
>  	 * And replace that memory with pages under 4GB.
> 


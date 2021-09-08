Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D634034A1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 08:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181476.328603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrXI-0003kA-Sw; Wed, 08 Sep 2021 06:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181476.328603; Wed, 08 Sep 2021 06:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrXI-0003hA-PP; Wed, 08 Sep 2021 06:58:20 +0000
Received: by outflank-mailman (input) for mailman id 181476;
 Wed, 08 Sep 2021 06:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrXG-0003h4-TA
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 06:58:18 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e0cca89-1a5b-425a-8854-31c4169a11bb;
 Wed, 08 Sep 2021 06:58:18 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrWF-008a9l-56; Wed, 08 Sep 2021 06:57:29 +0000
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
X-Inumbo-ID: 4e0cca89-1a5b-425a-8854-31c4169a11bb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yqhbwzwdJH8qRS1MarFWp8lRnwDdQKIjHrVncEEHPh8=; b=fgBDwHw7l63tdQPsH7I2iUXyMZ
	u6GLvgy1FAu0zukPtZrZWZAGYTkNv93qLQ0SzlM4o/dSNEZZB34rJlFBTv+g/qg2PSEBxfH0qrtEq
	40iF+eI7p8r9HBX4e+qdIj0FiX5kR8x0Cn7qtaYsW6Hvb2GMjQzPi+kaNS7GQYVkm5RdE447u5hGc
	0550qzIoVi9MtzwZPjO8uku14gwMEt+yVYO9XZqzB0c2z092Fp/J7HiOH1tOmYfikBtfWZVXUaXy0
	tBjOyYM79QvEb39a4jsRkH0T1KaIT2OpzIi4U5yUtMw5Yt8jo0gL7SIhFqjH9BrADxVv9XMb5RgYq
	euwSfHxg==;
Date: Wed, 8 Sep 2021 07:57:15 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
Message-ID: <YThey/iyCxi5NUwC@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:05:32PM +0200, Jan Beulich wrote:
> While the hypervisor hasn't been enforcing this, we would still better
> avoid issuing requests with GFNs not aligned to the requested order.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder how useful it is to include the alignment in the panic()
> message. I further wonder how useful it is to wrap "bytes" in
> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
> least was supposed to be, prior to "swiotlb-xen: maintain slab count
> properly").
> 
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -231,10 +231,10 @@ retry:
>  	/*
>  	 * Get IO TLB memory from any location.
>  	 */
> -	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	start = memblock_alloc(PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	if (!start)
> -		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
> -		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
> +		panic("%s: Failed to allocate %lu bytes align=%#x\n",
> +		      __func__, PAGE_ALIGN(bytes), IO_TLB_SEGSIZE << IO_TLB_SHIFT);

CAn you avoid the overly long lines here?  A good way to make it more
readable would be a variable to hold the byte count.


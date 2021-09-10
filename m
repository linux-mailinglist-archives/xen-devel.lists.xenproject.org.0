Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8624073B6
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184831.333597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpfX-00046L-99; Fri, 10 Sep 2021 23:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184831.333597; Fri, 10 Sep 2021 23:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpfX-00043c-63; Fri, 10 Sep 2021 23:10:51 +0000
Received: by outflank-mailman (input) for mailman id 184831;
 Fri, 10 Sep 2021 23:10:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpfV-00043W-FY
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:10:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54f67aa9-128c-11ec-b291-12813bfff9fa;
 Fri, 10 Sep 2021 23:10:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABDA0611F0;
 Fri, 10 Sep 2021 23:10:47 +0000 (UTC)
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
X-Inumbo-ID: 54f67aa9-128c-11ec-b291-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631315447;
	bh=v1M29iLRAqXSSDeBk/51fpGq9pHOSqcyUCgaAF8VAks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CBNorB/E8eA4w72YHFfKWHdfNeYfLRgu481B0NG49YWlcZNiRl21G0kW8qFKFcUyl
	 9+1kpAGY7w8oqTJXqHar70mSo6y7vvVMwf7rC2Mk1N09IZ1bVCCRvRD/kUC346aqAa
	 ezIHSfK8Z+DPikcCY9NF05wUXu7vYkK5kRCziaAISfQ0iSlzJtuRXpQUUfM0Z1amIt
	 mQqUgGgDJu42/YOhnHZECQ49308v1jTikLOlIli5MrOL4oP17VizTYxYK07OKeKiHl
	 sGzGSELnh5pTLmCHqp3KosfbvXmqJGn8XTWiQPV354xR4Tj/kC3O0e7N/hHRruUe0I
	 PYgQ3ysxxAHMQ==
Date: Fri, 10 Sep 2021 16:10:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 03/12] swiotlb-xen: maintain slab count properly
In-Reply-To: <dc054cb0-bec4-4db0-fc06-c9fc957b6e66@suse.com>
Message-ID: <alpine.DEB.2.21.2109101610380.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <dc054cb0-bec4-4db0-fc06-c9fc957b6e66@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> Generic swiotlb code makes sure to keep the slab count a multiple of the
> number of slabs per segment. Yet even without checking whether any such
> assumption is made elsewhere, it is easy to see that xen_swiotlb_fixup()
> might alter unrelated memory when calling xen_create_contiguous_region()
> for the last segment, when that's not a full one - the function acts on
> full order-N regions, not individual pages.
> 
> Align the slab count suitably when halving it for a retry. Add a build
> time check and a runtime one. Replace the no longer useful local
> variable "slabs" by an "order" one calculated just once, outside of the
> loop. Re-use "order" for calculating "dma_bits", and change the type of
> the latter as well as the one of "i" while touching this anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -106,27 +106,26 @@ static int is_xen_swiotlb_buffer(struct
>  
>  static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
>  {
> -	int i, rc;
> -	int dma_bits;
> +	int rc;
> +	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
> +	unsigned int i, dma_bits = order + PAGE_SHIFT;
>  	dma_addr_t dma_handle;
>  	phys_addr_t p = virt_to_phys(buf);
>  
> -	dma_bits = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT) + PAGE_SHIFT;
> +	BUILD_BUG_ON(IO_TLB_SEGSIZE & (IO_TLB_SEGSIZE - 1));
> +	BUG_ON(nslabs % IO_TLB_SEGSIZE);
>  
>  	i = 0;
>  	do {
> -		int slabs = min(nslabs - i, (unsigned long)IO_TLB_SEGSIZE);
> -
>  		do {
>  			rc = xen_create_contiguous_region(
> -				p + (i << IO_TLB_SHIFT),
> -				get_order(slabs << IO_TLB_SHIFT),
> +				p + (i << IO_TLB_SHIFT), order,
>  				dma_bits, &dma_handle);
>  		} while (rc && dma_bits++ < MAX_DMA_BITS);
>  		if (rc)
>  			return rc;
>  
> -		i += slabs;
> +		i += IO_TLB_SEGSIZE;
>  	} while (i < nslabs);
>  	return 0;
>  }
> @@ -210,7 +209,7 @@ retry:
>  error:
>  	if (repeat--) {
>  		/* Min is 2MB */
> -		nslabs = max(1024UL, (nslabs >> 1));
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
>  		bytes = nslabs << IO_TLB_SHIFT;
>  		pr_info("Lowering to %luMB\n", bytes >> 20);
>  		goto retry;
> @@ -245,7 +244,7 @@ retry:
>  		memblock_free(__pa(start), PAGE_ALIGN(bytes));
>  		if (repeat--) {
>  			/* Min is 2MB */
> -			nslabs = max(1024UL, (nslabs >> 1));
> +			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
>  			bytes = nslabs << IO_TLB_SHIFT;
>  			pr_info("Lowering to %luMB\n", bytes >> 20);
>  			goto retry;
> 


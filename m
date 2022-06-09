Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E875442EC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344578.570135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzAPk-0002Hm-Kp; Thu, 09 Jun 2022 05:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344578.570135; Thu, 09 Jun 2022 05:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzAPk-0002FS-I2; Thu, 09 Jun 2022 05:09:00 +0000
Received: by outflank-mailman (input) for mailman id 344578;
 Thu, 09 Jun 2022 05:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmT3=WQ=bombadil.srs.infradead.org=BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nzAPi-0002FG-QN
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:08:58 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ab486e-e7b2-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 07:08:57 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzAPe-00Gnin-I4; Thu, 09 Jun 2022 05:08:54 +0000
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
X-Inumbo-ID: 43ab486e-e7b2-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1370MvjFrg636nlGFXu8CpOfBg8+mRgqzhQ7YScZLE8=; b=z4YKvf9NkWQn8P4v8bwSUJFMzO
	wFYfxYFg0PkZgnD659U4rh7iitXqzKlNSVwWTA1C2nrNn5h07lgmlJhc0ReHis19xaonefaZB6sxZ
	+V+P9DVDmD/46UTQmN/JjdZTZZAQC5fMv8RMAMMUgf2fXLubCn2cMrYDqfdfylD9qDdZdNi8P/Svh
	J+9KZ2qoXLt20f3lL7nsIP15svEtGRlcPZ9rH5GjuL/37Zo1WS6wUeHHKMNr3CNoOja+2Q00FXJVs
	gHmBMVQKXvRtoRkoEQ8E3W/0xik7QAo//cz+ATtxhmw/3yPF5rc4z1d9FC8BroUGeyAeuXFwnjhyj
	BRV2y6Ug==;
Date: Wed, 8 Jun 2022 22:08:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, hch@infradead.org,
	m.szyprowski@samsung.com, jgross@suse.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	sstabellini@kernel.org, mpe@ellerman.id.au, konrad.wilk@oracle.com,
	mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH RFC v1 3/7] swiotlb-xen: support highmem for xen specific
 code
Message-ID: <YqGAZoG6/pVX9NqN@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-4-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-4-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 08, 2022 at 05:55:49PM -0700, Dongli Zhang wrote:
> @@ -109,19 +110,25 @@ int xen_swiotlb_fixup(void *buf, unsigned long nslabs, bool high)
>  	int rc;
>  	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	unsigned int i, dma_bits = order + PAGE_SHIFT;
> +	unsigned int max_dma_bits = MAX_DMA32_BITS;
>  	dma_addr_t dma_handle;
>  	phys_addr_t p = virt_to_phys(buf);
>  
>  	BUILD_BUG_ON(IO_TLB_SEGSIZE & (IO_TLB_SEGSIZE - 1));
>  	BUG_ON(nslabs % IO_TLB_SEGSIZE);
>  
> +	if (high) {
> +		dma_bits = MAX_DMA64_BITS;
> +		max_dma_bits = MAX_DMA64_BITS;
> +	}
> +

I think you really want to pass the addressing bits or mask to the
remap callback and not do magic with a 'high' flag here.


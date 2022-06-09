Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A85442FA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344596.570158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzATs-00047h-JH; Thu, 09 Jun 2022 05:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344596.570158; Thu, 09 Jun 2022 05:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzATs-00045a-EU; Thu, 09 Jun 2022 05:13:16 +0000
Received: by outflank-mailman (input) for mailman id 344596;
 Thu, 09 Jun 2022 05:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmT3=WQ=bombadil.srs.infradead.org=BATV+a39afe573ddbd6ff3389+6864+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nzANy-0000o0-Iz
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:07:10 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02aeebc7-e7b2-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 07:07:09 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzANu-00GnN3-B4; Thu, 09 Jun 2022 05:07:06 +0000
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
X-Inumbo-ID: 02aeebc7-e7b2-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TvPXHMQO6PU//nHDA0WgcCETKSRRfJH2DEgRCxwDbVs=; b=kYmHjR7gMPF1i+IrBOvuM8YJYv
	JS56zj46eCdXv6HizKLwWK6BBJX65b+pjfOUjohLpFK2UZWT0nc39riUnjJa9KdbSNswiMY1Wf8pW
	BeK204Hw7PCKtQiDfxkbHFRDDBh4d7SeK4+7H/ecJcy6NPU9wTuqwFvK+vowvACpLgMReGOnkxRTZ
	5cCR0G2QrtAuXf7Msmn6xuLzKhR7rk7bI0LOAHyZBtYiAE/U219aV9w9pAMoHOBXScvVJzJ1ITweb
	q41BtyqfX5T02Awsmk9AVmPe1SxBXJvV+k6GtG4ovM5N310b1iJCPRLX5pcqbpP2HDax2X2Zm/YmJ
	KajG5p+w==;
Date: Wed, 8 Jun 2022 22:07:06 -0700
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
Subject: Re: [PATCH RFC v1 6/7] virtio: use io_tlb_high_mem if it is active
Message-ID: <YqF/+tqMA7GtjfAY@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-7-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-7-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 08, 2022 at 05:55:52PM -0700, Dongli Zhang wrote:
>  /* Unique numbering for virtio devices. */
> @@ -241,6 +243,12 @@ static int virtio_dev_probe(struct device *_d)
>  	u64 device_features;
>  	u64 driver_features;
>  	u64 driver_features_legacy;
> +	struct device *parent = dev->dev.parent;
> +	u64 dma_mask = min_not_zero(*parent->dma_mask,
> +				    parent->bus_dma_limit);
> +
> +	if (dma_mask == DMA_BIT_MASK(64))
> +		swiotlb_use_high(parent);

The driver already very clearly communicated its addressing
requirements.  The underlying swiotlb code needs to transparently
pick the right pool.



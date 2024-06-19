Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A74B90F40B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 18:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743926.1150926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyCG-0006pH-0E; Wed, 19 Jun 2024 16:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743926.1150926; Wed, 19 Jun 2024 16:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyCF-0006nX-Tg; Wed, 19 Jun 2024 16:30:07 +0000
Received: by outflank-mailman (input) for mailman id 743926;
 Wed, 19 Jun 2024 16:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ucR9=NV=ziepe.ca=jgg@srs-se1.protection.inumbo.net>)
 id 1sJyCE-0006iH-62
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 16:30:06 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1719ca-2e59-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 18:30:03 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-797f222c9f9so375414385a.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 09:30:03 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5ee8bc0sm79593276d6.121.2024.06.19.09.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 09:30:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJyC8-0059Sy-QH;
 Wed, 19 Jun 2024 13:30:00 -0300
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
X-Inumbo-ID: 2e1719ca-2e59-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718814602; x=1719419402; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3c7XeNS34MogaG1zO0Gxm1rH0neHp06/RmAfCCHTdTs=;
        b=VxuUqWdULIrVLjBXv76NDuX2GesmZVDlc3xW9WM80HfAJOIhuB7YTWgggl1WJfCcex
         /7WRTSAcRU7JqKA84Dn5RrnjAcJJdOEeSXFLAJxrm5Jr6EwzV5qUHfd5Wo8Vwha+8y+g
         cjtPgpYbJFKG32SGRh3gX+ARSyRsWaqTpf7IXXKzla5txjyCiDJcpG2jIlQK0SoxCBbR
         0Ngqt7ql55nGO7ufO5HQa/3AXh9C140WpeACqsHx0zkZhyKuFltlMmQirkqQsTmE2Wow
         c0GqWRzaNsZHp/vDH+OQUP5OBS8LQ3TZyD9P+vmRtTTAmxdE9yH8DOIQFW6VWzcZtDry
         7pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718814602; x=1719419402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c7XeNS34MogaG1zO0Gxm1rH0neHp06/RmAfCCHTdTs=;
        b=D9PzISYXCvf429oySpuCmdpgPjY9hIe7zMo3arsmaoZ3Vl96R67omh02q0mTG6Jhc+
         I0Q5zIRb4EQ6kUmT7y0U1hSVEFoJ15FHU8pkqbk8rmOQRsj+LtcbnUXAEBGaeiQiXUwr
         4impiwQ+bVoOq0ZtI6IQUstsDvypYZMT2D8tQuj0I3vkBWPtySMc2F9Johvtm84L0jXD
         TxEiR3Zhe++ZNXclSvP6+VZB+mONQqiMxK4u70g4uQOmsMLLip+aXZX0Zj0adzLGp3wy
         te3QS94VKxtgxfGh7CGNxItNsm9oMaCwSQKvUOzGfA7j3jq4RxLdQ/WCz+0RDHpTmCnu
         SC4g==
X-Gm-Message-State: AOJu0YwhJWh5pqdYr+xgtoJBaBDj47zqi/2O6uZW26sOmJGDLLWP1ShI
	uwU8lEUfjgeazAqpAR7+eonXoUb5xnTUK9lGnTA12XNcJeo53mAAl9ZlMq2emoMvxyAHpYf1Ah+
	p
X-Google-Smtp-Source: AGHT+IFNd2KMs9vwOpIBWhDkSpGzT3UnUk3IdJB0sc4eGBGCnxklfZldC9FeJXialSmZ2UnfepoWDA==
X-Received: by 2002:ad4:4484:0:b0:6b5:6a1:f899 with SMTP id 6a1803df08f44-6b506a1fbf6mr19249466d6.10.1718814602415;
        Wed, 19 Jun 2024 09:30:02 -0700 (PDT)
Date: Wed, 19 Jun 2024 13:30:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] iommu/xen: Add Xen PV-IOMMU driver
Message-ID: <20240619163000.GK791043@ziepe.ca>
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>

On Thu, Jun 13, 2024 at 01:50:22PM +0000, Teddy Astie wrote:

> +struct iommu_domain *xen_iommu_domain_alloc(unsigned type)
> +{
> +	struct xen_iommu_domain *domain;
> +	u16 ctx_no;
> +	int ret;
> +
> +	if (type & IOMMU_DOMAIN_IDENTITY) {
> +		/* use default domain */
> +		ctx_no = 0;

Please use the new ops, domain_alloc_paging and the static identity domain.

> +static struct iommu_group *xen_iommu_device_group(struct device *dev)
> +{
> +	if (!dev_is_pci(dev))
> +		return ERR_PTR(-ENODEV);
> +

device_group is only called after probe_device, since you already
exclude !pci during probe there is no need for this wrapper, just set
the op directly to pci_device_group.

> +static void xen_iommu_release_device(struct device *dev)
> +{
> +	int ret;
> +	struct pci_dev *pdev;
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_reattach_device,
> +		.flags = 0,
> +		.ctx_no = 0 /* reattach device back to default context */
> +	};

Consider if you can use release_domain for this, I think this is
probably a BLOCKED domain behavior.

> +	if (!dev_is_pci(dev))
> +		return;

No op is ever called on a non-probed device, remove all these checks.

> +static int xen_iommu_map_pages(struct iommu_domain *domain, unsigned long iova,
> +							   phys_addr_t paddr, size_t pgsize, size_t pgcount,
> +							   int prot, gfp_t gfp, size_t *mapped)
> +{
> +	size_t xen_pg_count = (pgsize / XEN_PAGE_SIZE) * pgcount;
> +	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
> +	struct pv_iommu_op op = {
> +		.subop_id = IOMMUOP_map_pages,
> +		.flags = 0,
> +		.ctx_no = dom->ctx_no
> +	};
> +	/* NOTE: paddr is actually bound to pfn, not gfn */
> +	uint64_t pfn = addr_to_pfn(paddr);
> +	uint64_t dfn = addr_to_pfn(iova);
> +	int ret = 0;
> +
> +	if (WARN(!dom->ctx_no, "Tried to map page to default context"))
> +		return -EINVAL;

A paging domain should be the only domain ops that have a populated
map so this should be made impossible by construction.

Jason


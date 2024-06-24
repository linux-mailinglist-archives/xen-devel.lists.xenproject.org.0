Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F99153EC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 18:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746844.1154060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLmcn-0002ym-4P; Mon, 24 Jun 2024 16:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746844.1154060; Mon, 24 Jun 2024 16:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLmcn-0002w8-1A; Mon, 24 Jun 2024 16:33:01 +0000
Received: by outflank-mailman (input) for mailman id 746844;
 Mon, 24 Jun 2024 16:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=keLG=N2=ziepe.ca=jgg@srs-se1.protection.inumbo.net>)
 id 1sLmcl-0002w1-2y
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 16:32:59 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6968fc70-3247-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 18:32:57 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6b50aeb2f31so22423496d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 09:32:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b534b6fb20sm22033996d6.58.2024.06.24.09.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 09:32:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sLmcg-006IKk-RH;
 Mon, 24 Jun 2024 13:32:54 -0300
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
X-Inumbo-ID: 6968fc70-3247-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1719246776; x=1719851576; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpMz2kHegp9vo5OTJS7oY+W3qVaSD/B67evxfsa33FE=;
        b=ST97m5bXeWsyJCz7O0VWTegpBNM/02MZcwQYxafx4ZEgBnFVPiw+MrbIjssZ9yJgTi
         StQwbgZyBdWzLfOQMQ3S3zteIVlNUl1W9mmO6db0dXZz0evdNMN/nuMF0GJL3g+pt/KE
         4O2zNioGnZZ+27OxcwZIzqYXnRSiXo69yz/6Cxq5SmMOETAI/ONzIJJk6KpdntCUtQZ4
         fHyBAoecufb+Wz62uWKh9uRTtY8bdpw3mQut2+jBbTt0BWTfjDuINCrabeWtcn0mflg4
         HhZzA+aOGmA04dw4r7kCF4ykavFvxdAlrL9ynScTTPBn248deeochEmIlOHMBYH1ebJ2
         CV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246776; x=1719851576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpMz2kHegp9vo5OTJS7oY+W3qVaSD/B67evxfsa33FE=;
        b=jUUc6Nv/Tgm4oXsMkp8H65cYVB8Qo1DLuOCszr12dZK4NDtzJHcG9lruU/YP84NC89
         oX+0F8oLuskTUnah1lnlXMpQXM/ZvaA8xrf56eCLdcS3Bbvpdnj1URhjQSQ4RuPqyUEb
         ZvqRdNm2zs9FevZ5eyjSImX0OFoEeOIW0MhnQEttcVP6HXSydyGLD4NW7puzkRoXUbzK
         Do6mZMA0XYopITW2HGvcrGvf02VbxBwX5uMbbG7LTfIKHuulmar4mX7+iscIimtgYLpG
         Wcmxg1P1bPsWnQk+gyOuAtUKC/g7g4dhfujt78+sFxGq6DdGZV1+rWmbjhb24n78r53c
         2yPg==
X-Forwarded-Encrypted: i=1; AJvYcCUdLkxSaUBh8c9RJSHBEXULwC30R6US1T5XtMjCsakewLJnPf8P+XHrWmD3djVzk0kmZR7lM037SI5WBVorvCtg9DaApn42nQ2wDcJTAZs=
X-Gm-Message-State: AOJu0YxhQJFttuUMnLoFnKutIzeYXf4OU+KETFrf+cC49s51JnqNvImt
	SkB73CfECQykhbtd1jPdAnn75tXOEWkeOoEdPxi/zoR3yyquZGljrEeATwFRgt4=
X-Google-Smtp-Source: AGHT+IFVDnqWLATdM12qOV0Xx5fReCHDSylxa7RaE0YpsUi44goG84xt3tUjEqTTeXwKdKL1wee4zg==
X-Received: by 2002:a0c:f585:0:b0:6b5:1c0:381d with SMTP id 6a1803df08f44-6b540aa47d4mr55523686d6.43.1719246775914;
        Mon, 24 Jun 2024 09:32:55 -0700 (PDT)
Date: Mon, 24 Jun 2024 13:32:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Robin Murphy <robin.murphy@arm.com>, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2] iommu/xen: Add Xen PV-IOMMU driver
Message-ID: <20240624163254.GT791043@ziepe.ca>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
 <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
 <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>

On Mon, Jun 24, 2024 at 02:36:45PM +0000, Teddy Astie wrote:
> >> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
> >> +{
> >> +    switch (cap) {
> >> +    case IOMMU_CAP_CACHE_COHERENCY:
> >> +        return true;
> >
> > Will the PV-IOMMU only ever be exposed on hardware where that really is
> > always true?
> >
> 
> On the hypervisor side, the PV-IOMMU interface always implicitely flush
> the IOMMU hardware on map/unmap operation, so at the end of the
> hypercall, the cache should be always coherent IMO.

Cache coherency is a property of the underlying IOMMU HW and reflects
the ability to prevent generating transactions that would bypass the
cache.

On AMD and Intel IOMMU HW this maps to a bit in their PTEs that must
always be set to claim this capability.

No ARM SMMU supports it yet.

If you imagine supporting ARM someday then this can't be a fixed true.

> Unmap failing should be exceptionnal, but is possible e.g with
> transparent superpages (like Xen IOMMU drivers do). Xen drivers folds
> appropriate contiguous mappings into superpages entries to optimize
> memory usage and iotlb. However, if you unmap in the middle of a region
> covered by a superpage entry, this is no longer a valid superpage entry,
> and you need to allocate and fill the lower levels, which is faillible
> if lacking memory.

This doesn't seem necessary. From an IOMMU perspective the contract is
that whatever gets mapped must be wholly unmapped and the unmap cannot
fail.

Failing to unmap causes big problems for iommufd and vfio as it is
about to free to the memory underlying the maps. Nothing good will
happen after this.

An implementation should rely on the core code to provide the
contiguous ranges and not attempt to combine mappings across two
map_pages() calls. If it does this it can refuse to unmap a slice of a
superpage, and thus it never has to allocate memory during unmap.

> While mapping on top of another mapping is ok for us (it's just going to
> override the previous mapping), I definetely agree that having the
> address space messed up is not good.

Technically map_pages should fail if it is already populated, but
nothing should ever do that.

Jason


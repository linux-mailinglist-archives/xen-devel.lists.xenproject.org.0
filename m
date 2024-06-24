Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40C915617
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 19:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746887.1154114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLnxi-0000tB-TB; Mon, 24 Jun 2024 17:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746887.1154114; Mon, 24 Jun 2024 17:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLnxi-0000qj-Pz; Mon, 24 Jun 2024 17:58:42 +0000
Received: by outflank-mailman (input) for mailman id 746887;
 Mon, 24 Jun 2024 17:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=keLG=N2=ziepe.ca=jgg@srs-se1.protection.inumbo.net>)
 id 1sLnxh-0000qd-Nk
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 17:58:41 +0000
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [2607:f8b0:4864:20::a33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6283eb76-3253-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 19:58:39 +0200 (CEST)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4ef52e9038bso1013616e0c.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 10:58:39 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b52b16e9basm27595606d6.6.2024.06.24.10.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 10:58:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sLnxd-006Xh6-9b;
 Mon, 24 Jun 2024 14:58:37 -0300
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
X-Inumbo-ID: 6283eb76-3253-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1719251918; x=1719856718; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YNU8knWMPYNyTHBdJSdgkQoEg3G3ja7Wms4FhBvjjDA=;
        b=fzhkM2xAyH75CjAOJMIDCfDxjn0Vta0SWkR7eULNvy7WfqNuzzgJsWb3SrTo4yittp
         HPBv4o1WY0UDt9G3Gpn76CXDKYq8TcYEiijoyRSCm9Bb9C/n1yQ1StH3dsn6XKLgSayE
         EEbeYnaHmCncwacdSXN+V/h7VaODPpePkMNNLCEAhWhLGbFvQ+iI7cO/kYWSaUvGynmB
         BFTMktCr+TcbpCCQc3Bd1DnfZNwev7wNxVBYOGhr2ZhU/qRjcIDSAOxLGIp9+4QdROOk
         s+tR8pSfWy5Q9UpRBP6g+2BjWRn2W+2HhwhwM48koOUTZK7coMkSBC3juUdkaSoBDzjt
         xWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719251918; x=1719856718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNU8knWMPYNyTHBdJSdgkQoEg3G3ja7Wms4FhBvjjDA=;
        b=gqelAyGGEmdd2EMulrL7v9SxIMqN/rEB1WDE0KxENYyAPdW93Vx+BhfF/uetS1UShL
         hlj9q9DrC26LHJgsf2t+j0a/xRxLEaA7rB2XGYH0wxWdTfIvaeaMBd0lC3NHMXzNckv/
         vchOTe3ridEXlsOp5CIKfZKwpsiE6OXCoi7qV+bXRc73dtXKcXYhG0fXil5LTiFHUYGL
         DycV65EwB1KPUv8Iasdh+VlWZIKamTXSTi9foHGWqTHuswkZv3SYFxYRhVwwjMC6S/oz
         SD9+SXHgvCj69RLTEVxchWEDwTGXnBWZH/UIjW/0rgUAcl6cD/z/8oNEh1m7iSTL6DAj
         z2yA==
X-Forwarded-Encrypted: i=1; AJvYcCVvaMcB/rcJUy/IdjRgRF6eaUIcUj1VjPdY53DpLNtUsYVqtHwZKlq8rLV76INtKvUVimhkxhhHEyOArjOm2ch6p+fXd3BieCbQhqMSa54=
X-Gm-Message-State: AOJu0YyY7nd1BA8lGiTrvXkMLebowQnrmxydhnobYofdRkC5i7X18Bcx
	gyEWuhqhOLHPiAMhey59AHcSX/G82QFM8v8Mqy2brGgaIwLSZaUu8bp4aCnV6b0=
X-Google-Smtp-Source: AGHT+IHnxjwk5Cm5dZlOx9nn6fHrrP01/ltJJzH9RVjyIzHnxznz3vpGsR7mP8tFLfdcH8bmSz9Pjw==
X-Received: by 2002:a05:6122:98a:b0:4ed:36f:9b38 with SMTP id 71dfb90a1353d-4ef6d82bd90mr4091612e0c.9.1719251918209;
        Mon, 24 Jun 2024 10:58:38 -0700 (PDT)
Date: Mon, 24 Jun 2024 14:58:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Robin Murphy <robin.murphy@arm.com>, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2] iommu/xen: Add Xen PV-IOMMU driver
Message-ID: <20240624175837.GU791043@ziepe.ca>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
 <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
 <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
 <20240624163254.GT791043@ziepe.ca>
 <900edf8a-885c-4bf3-84bd-5e7b165a1ed7@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <900edf8a-885c-4bf3-84bd-5e7b165a1ed7@linux.microsoft.com>

On Mon, Jun 24, 2024 at 10:36:13AM -0700, Easwar Hariharan wrote:
> Hi Jason,
> 
> On 6/24/2024 9:32 AM, Jason Gunthorpe wrote:
> > On Mon, Jun 24, 2024 at 02:36:45PM +0000, Teddy Astie wrote:
> >>>> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
> >>>> +{
> >>>> +    switch (cap) {
> >>>> +    case IOMMU_CAP_CACHE_COHERENCY:
> >>>> +        return true;
> >>>
> >>> Will the PV-IOMMU only ever be exposed on hardware where that really is
> >>> always true?
> >>>
> >>
> >> On the hypervisor side, the PV-IOMMU interface always implicitely flush
> >> the IOMMU hardware on map/unmap operation, so at the end of the
> >> hypercall, the cache should be always coherent IMO.
> > 
> > Cache coherency is a property of the underlying IOMMU HW and reflects
> > the ability to prevent generating transactions that would bypass the
> > cache.
> > 
> > On AMD and Intel IOMMU HW this maps to a bit in their PTEs that must
> > always be set to claim this capability.
> > 
> > No ARM SMMU supports it yet.
> > 
> 
> Unrelated to this patch: Both the arm-smmu and arm-smmu-v3 drivers claim
> this capability if the device tree/IORT table have the corresponding flags.

Oh sorry, I misread this, as the ENFORCED version, so it isn't quite
right.

ENFORCED is as above

Just normal CACHE_COHERENCY requires just HW support and any
enablement in the IOMMU.

AMD and Intel are always enabled

ARM requires HW support and possibly some specific iommu programming.

> I read through DEN0049 to determine what are the knock-on effects, or
> equivalently the requirements to set those flags in the IORT, but came
> up empty. Could you help with what I'm missing to resolve the apparent
> contradiction between your statement and the code?

The flags are set if the underlying HW can do the coherency work, and
Linux has the IOMMU (STE/ioptes) set to work with that.

Map/unmap cache flushing during the hypercall is not a substitution,
Linux still needs to know if streaming DMA requires the flushes.

Jason


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8067F10CA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 11:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636563.992168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51qy-0007LR-DB; Mon, 20 Nov 2023 10:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636563.992168; Mon, 20 Nov 2023 10:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51qy-0007Jl-AQ; Mon, 20 Nov 2023 10:50:08 +0000
Received: by outflank-mailman (input) for mailman id 636563;
 Mon, 20 Nov 2023 10:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r51qw-0007EV-HP
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 10:50:06 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f2cdc2f-8792-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 11:50:03 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so15910145e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 02:50:03 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040841e79715sm13171503wmq.27.2023.11.20.02.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 02:50:02 -0800 (PST)
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
X-Inumbo-ID: 8f2cdc2f-8792-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700477403; x=1701082203; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5jgu/bErV6Zkl1lCSAcG8Wpi+sjXKwC/YP49vG3F3w=;
        b=C1zdejr7LUr4oo8/qAODET87wKJCK1tovyrS2F8U7M2qv4Xn3ibJy4Xg+/Muq1vode
         1T3+LMPI6hS7EaqtpHuihfbqCciJtHzu58SYx3l4hx0PTqIY4ybG6M0stPoKD41JcgeQ
         sLw0MhtEVQhU4jPl7DCmsZ1UyrSK8oBrJGhPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700477403; x=1701082203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5jgu/bErV6Zkl1lCSAcG8Wpi+sjXKwC/YP49vG3F3w=;
        b=EHaNM3CYo52Z4nAdRCfzxcR8gcNI7WACFy8reVBVnwR6gIKD5wQFrp8dyM9ADKEA3r
         zXdoIPAP6ESYyLduJb0WbGiYEi5YjQe58qAuO80POndDRqz44XSQych6NPZWZAQRDZ4d
         ZyXoRRwEs/JtcYRVRuK0T/WSnJWBZN6nplcrJZdJy0BylxauAF+tBGPxLdhfZBCnU6jG
         4Mk+NhDz3sD/1+/sZoJjTv0nQbgRqFbt3hLVOrBphiqdYK/97XOvn00zKg09q3Fby6SU
         oh+Tevi523AAlIsfueQvdDq0FsWFCRvyh1Mivb/FPWLqp20j/Gkn7V82h41QZRhXy3SP
         714Q==
X-Gm-Message-State: AOJu0Yz3h15HxCkrHURkfNSNlxuRHs0mJh6DAnSLsouf3pG+x3Y5Y5/E
	/SE+W03tGdaLSU3ftHeU2ePYELw2VWScrtZIh88=
X-Google-Smtp-Source: AGHT+IH4fwreD+WckQCIVT/YooDCojPBmvkFSwgRG4fcJnHIP3uAamUnxObsBQnGg9cFnvSgdG3t+Q==
X-Received: by 2002:a05:600c:350a:b0:409:19a0:d247 with SMTP id h10-20020a05600c350a00b0040919a0d247mr5802715wmq.18.1700477402697;
        Mon, 20 Nov 2023 02:50:02 -0800 (PST)
Date: Mon, 20 Nov 2023 11:50:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Message-ID: <ZVs52elOtWbTaD0i@macbook.local>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
 <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
 <ZVs0fvUQI9C7NRc5@macbook.local>
 <f414730f-307d-4ef6-9aaa-a861925fdab4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f414730f-307d-4ef6-9aaa-a861925fdab4@suse.com>

On Mon, Nov 20, 2023 at 11:37:43AM +0100, Jan Beulich wrote:
> On 20.11.2023 11:27, Roger Pau Monné wrote:
> > On Mon, Nov 20, 2023 at 10:45:29AM +0100, Jan Beulich wrote:
> >> On 17.11.2023 12:55, Andrew Cooper wrote:
> >>> On 17/11/2023 9:47 am, Roger Pau Monne wrote:
> >>>>      /*
> >>>> -     * Choose the number of levels for the IOMMU page tables.
> >>>> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
> >>>> -     *   RAM) above the 512G boundary.
> >>>> -     * - HVM could in principle use 3 or 4 depending on how much guest
> >>>> -     *   physical address space we give it, but this isn't known yet so use 4
> >>>> -     *   unilaterally.
> >>>> -     * - Unity maps may require an even higher number.
> >>>> +     * Choose the number of levels for the IOMMU page tables, taking into
> >>>> +     * account unity maps.
> >>>>       */
> >>>> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
> >>>> -            is_hvm_domain(d)
> >>>> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
> >>>> -            : get_upper_mfn_bound() + 1),
> >>>> -        amd_iommu_min_paging_mode);
> >>>> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
> >>>
> >>> I think these min/max variables can be dropped now we're not doing
> >>> variable height IOMMU pagetables, which further simplifies this expression.
> >>
> >> Did you take unity maps into account? At least $subject and comment looks
> >> to not be consistent in this regard: Either unity maps need considering
> >> specially (and then we don't uniformly use the same depth), or they don't
> >> need mentioning in the comment (anymore).
> > 
> > Unity maps that require an address width > DEFAULT_DOMAIN_ADDRESS_WIDTH
> > will currently only work on PV at best, as HVM p2m code is limited to
> > 4 level page tables, so even if the IOMMU page tables support a
> > greater address width the call to map such regions will trigger an
> > error in the p2m code way before attempting to create any IOMMU
> > mappings.
> > 
> > We could do:
> > 
> > hd->arch.amd.paging_mode =
> >     is_hvm_domain(d) ? pgmode : max(pgmode, amd_iommu_min_paging_mode);
> > 
> > Putting IVMD/RMRR regions that require the usage of 5 level page
> > tables would be a very short sighted move by vendors IMO.
> > 
> > And will put us back in a situation where PV vs HVM can get different
> > IOMMU page table levels, which is undesirable.  It might be better to
> > just assume all domains use DEFAULT_DOMAIN_ADDRESS_WIDTH and hide
> > devices that have IVMD/RMRR regions above that limit.
> 
> That's a possible approach, yes. To be honest, I was actually hoping we'd
> move in a different direction: Do away with the entirely arbitrary
> DEFAULT_DOMAIN_ADDRESS_WIDTH, and use actual system properties instead.

Hm, yes, that might be a sensible approach, but right now I don't want
to block this series on such (likely big) piece of work.  I think we
should aim for HVM and PV to have the same IOMMU page table levels,
and that's currently limited by the p2m code only supporting 4 levels.

> Whether having PV and HVM have uniform depth is indeed desirable is also
> not entirely obvious to me. Having looked over patch 3 now, it also
> hasn't become clear to me why the change here is actually a (necessary)
> prereq.

Oh, it's a prereq because I've found AMD systems that have reserved
regions > 512GB, but no RAM past that region.  arch_iommu_hwdom_init()
would fail on those systems when patch 3/3 was applied, as then
reserved regions past the last RAM address are also mapped in
arch_iommu_hwdom_init().

Thanks, Roger.


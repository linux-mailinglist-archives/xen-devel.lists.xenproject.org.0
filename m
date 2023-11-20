Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9367F1298
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 13:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636681.992378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52yO-0002Sz-QV; Mon, 20 Nov 2023 12:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636681.992378; Mon, 20 Nov 2023 12:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52yO-0002Qz-NB; Mon, 20 Nov 2023 12:01:52 +0000
Received: by outflank-mailman (input) for mailman id 636681;
 Mon, 20 Nov 2023 12:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r52yN-0002Qt-Bs
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 12:01:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964b1122-879c-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 13:01:50 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso17199585e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 04:01:50 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5d61c1000000b00332cb8fd5b7sm693352wrv.67.2023.11.20.04.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:01:49 -0800 (PST)
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
X-Inumbo-ID: 964b1122-879c-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700481709; x=1701086509; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m8V6AfJdcPcxDFtN0eGZ2PlgKo6saqWElPxwXFF+2tQ=;
        b=lZ78NUs5xlA344BnWb014Wd5FtyNnRqhiFHGQBXWIFvVWNqlE1uAuUCph9ct5kwOmc
         5BbUfBqw69wG37OUYX+syDelkQ7Gi7oLHXb5yuEuU2S58ZsAm5uASs+qL03ZTwKpC4Aa
         z/5DlM5OFxP5Cosv8H1Tm1C8U531RUrQLFVWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700481709; x=1701086509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8V6AfJdcPcxDFtN0eGZ2PlgKo6saqWElPxwXFF+2tQ=;
        b=nkp/ow1ieznYb+wXZWOeo2qb7cMfGy6C4I4P/5E9exttUExMhiHmb5c2cbJX+fAroR
         yMROuuvelF6N7Kts56O6effAVXxXRY9E7gHF56+Q1RJLCxHHof39aiRX/Wfn6FXfMQOL
         siwsRLeJvcpS3aAirGdqgY1quxbLW+4IXGHxaAL3hgQviojtqkkVATeCw0qcw/NNCAHS
         wovnldpHDTD3i1qJbUyMilhUwVE+Y6hRlZOs9sgvbsSR9JAYpvoUCNr0rC3jq3G6+zUV
         hEsbTuaoJBoTNuXDzx/QixhMWiQoEgBCacKb1cL7KErDGOxQQHM5CQqGz0I6sbGntut/
         Ks/Q==
X-Gm-Message-State: AOJu0Yw+d/6ktSbCfNTNgq41NFxd2nYzCqEvHhG9/RF1xdHkIBYcD4PX
	5fMroj4nQCs8xKUlaHEhbNbO5g==
X-Google-Smtp-Source: AGHT+IEk1Mu0Cm3kge8q3rp+/1FukqtmUc+/R89Y7bU4Azt2Lu8JZhyh4DCiWp3vnZyg+hHFIyOkxQ==
X-Received: by 2002:a5d:64c6:0:b0:332:c527:66e8 with SMTP id f6-20020a5d64c6000000b00332c52766e8mr2151394wri.7.1700481709552;
        Mon, 20 Nov 2023 04:01:49 -0800 (PST)
Date: Mon, 20 Nov 2023 13:01:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] amd-vi: use the same IOMMU page table levels for PV
 and HVM
Message-ID: <ZVtKrKTyGli-Uj9H@macbook.local>
References: <20231117094749.81091-1-roger.pau@citrix.com>
 <20231117094749.81091-2-roger.pau@citrix.com>
 <e90d416e-f4dd-4b2c-9247-0e3aa35c26d9@citrix.com>
 <0392fe23-7589-4dc2-b664-1e7e01c3914d@suse.com>
 <ZVs0fvUQI9C7NRc5@macbook.local>
 <f414730f-307d-4ef6-9aaa-a861925fdab4@suse.com>
 <ZVs52elOtWbTaD0i@macbook.local>
 <a857c016-7cc7-48ed-968a-8a9f2748c8d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a857c016-7cc7-48ed-968a-8a9f2748c8d3@suse.com>

On Mon, Nov 20, 2023 at 12:34:45PM +0100, Jan Beulich wrote:
> On 20.11.2023 11:50, Roger Pau Monné wrote:
> > On Mon, Nov 20, 2023 at 11:37:43AM +0100, Jan Beulich wrote:
> >> On 20.11.2023 11:27, Roger Pau Monné wrote:
> >>> On Mon, Nov 20, 2023 at 10:45:29AM +0100, Jan Beulich wrote:
> >>>> On 17.11.2023 12:55, Andrew Cooper wrote:
> >>>>> On 17/11/2023 9:47 am, Roger Pau Monne wrote:
> >>>>>>      /*
> >>>>>> -     * Choose the number of levels for the IOMMU page tables.
> >>>>>> -     * - PV needs 3 or 4, depending on whether there is RAM (including hotplug
> >>>>>> -     *   RAM) above the 512G boundary.
> >>>>>> -     * - HVM could in principle use 3 or 4 depending on how much guest
> >>>>>> -     *   physical address space we give it, but this isn't known yet so use 4
> >>>>>> -     *   unilaterally.
> >>>>>> -     * - Unity maps may require an even higher number.
> >>>>>> +     * Choose the number of levels for the IOMMU page tables, taking into
> >>>>>> +     * account unity maps.
> >>>>>>       */
> >>>>>> -    hd->arch.amd.paging_mode = max(amd_iommu_get_paging_mode(
> >>>>>> -            is_hvm_domain(d)
> >>>>>> -            ? 1UL << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
> >>>>>> -            : get_upper_mfn_bound() + 1),
> >>>>>> -        amd_iommu_min_paging_mode);
> >>>>>> +    hd->arch.amd.paging_mode = max(pgmode, amd_iommu_min_paging_mode);
> >>>>>
> >>>>> I think these min/max variables can be dropped now we're not doing
> >>>>> variable height IOMMU pagetables, which further simplifies this expression.
> >>>>
> >>>> Did you take unity maps into account? At least $subject and comment looks
> >>>> to not be consistent in this regard: Either unity maps need considering
> >>>> specially (and then we don't uniformly use the same depth), or they don't
> >>>> need mentioning in the comment (anymore).
> >>>
> >>> Unity maps that require an address width > DEFAULT_DOMAIN_ADDRESS_WIDTH
> >>> will currently only work on PV at best, as HVM p2m code is limited to
> >>> 4 level page tables, so even if the IOMMU page tables support a
> >>> greater address width the call to map such regions will trigger an
> >>> error in the p2m code way before attempting to create any IOMMU
> >>> mappings.
> >>>
> >>> We could do:
> >>>
> >>> hd->arch.amd.paging_mode =
> >>>     is_hvm_domain(d) ? pgmode : max(pgmode, amd_iommu_min_paging_mode);
> >>>
> >>> Putting IVMD/RMRR regions that require the usage of 5 level page
> >>> tables would be a very short sighted move by vendors IMO.
> >>>
> >>> And will put us back in a situation where PV vs HVM can get different
> >>> IOMMU page table levels, which is undesirable.  It might be better to
> >>> just assume all domains use DEFAULT_DOMAIN_ADDRESS_WIDTH and hide
> >>> devices that have IVMD/RMRR regions above that limit.
> >>
> >> That's a possible approach, yes. To be honest, I was actually hoping we'd
> >> move in a different direction: Do away with the entirely arbitrary
> >> DEFAULT_DOMAIN_ADDRESS_WIDTH, and use actual system properties instead.
> > 
> > Hm, yes, that might be a sensible approach, but right now I don't want
> > to block this series on such (likely big) piece of work.  I think we
> > should aim for HVM and PV to have the same IOMMU page table levels,
> > and that's currently limited by the p2m code only supporting 4 levels.
> 
> No, I certainly don't mean to introduce a dependency there. Yet what
> you do here goes actively against that possible movement in the other
> direction: What "actual system properties" are differs between PV and
> HVM (host properties vs guest properties), and hence there would
> continue to be a (possible) difference in depth between the two.

Might be.  Overall seems like more complexity for a little win.

The simplest option would be to unconditionally use the maximum page
table levels supported by both the CPU and the IOMMU.

> >> Whether having PV and HVM have uniform depth is indeed desirable is also
> >> not entirely obvious to me. Having looked over patch 3 now, it also
> >> hasn't become clear to me why the change here is actually a (necessary)
> >> prereq.
> > 
> > Oh, it's a prereq because I've found AMD systems that have reserved
> > regions > 512GB, but no RAM past that region.  arch_iommu_hwdom_init()
> > would fail on those systems when patch 3/3 was applied, as then
> > reserved regions past the last RAM address are also mapped in
> > arch_iommu_hwdom_init().
> 
> Hmm, interesting. I can't bring together "would fail" and "are also
> mapped" though, unless the latter was meant to say "are attempted to
> also be mapped", in which case I could at least see room for failure.

Yes, "are attempted to also be mapped", and that attempt fails.  I
would assume that "would fail" was already connected to "also mapped",
but maybe it's not clear enough.

> Yet still this would then feel like an issue with the last patch alone,
> which the change here is merely avoiding (without this being a strict
> prereq). Instead I'd expect us to use 4 levels whenever there are any
> kind of regions (reserved or not) above 512G. Without disallowing use
> of 3 levels on other (smaller) systems.

While reserved regions are the ones that made me realize about this
IOMMU page table difference, what about device MMIO regions?

There's no limitation that avoids MMIO regions from living past the
last RAM address, and possibly above the 512GB mark.

If anything for PV we should limit page table levels based on the
supported paddr bits reported by the CPU, but limiting it based on the
memory map seems plain bogus.

Thanks, Roger.


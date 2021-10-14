Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71E42E4E7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 01:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209643.366159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbAUd-00075w-Bv; Thu, 14 Oct 2021 23:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209643.366159; Thu, 14 Oct 2021 23:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbAUd-00073q-8L; Thu, 14 Oct 2021 23:50:35 +0000
Received: by outflank-mailman (input) for mailman id 209643;
 Thu, 14 Oct 2021 23:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGop=PC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mbAUb-00073i-M2
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 23:50:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8452c0d6-2d49-11ec-8211-12813bfff9fa;
 Thu, 14 Oct 2021 23:50:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D456B60FDA;
 Thu, 14 Oct 2021 23:50:30 +0000 (UTC)
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
X-Inumbo-ID: 8452c0d6-2d49-11ec-8211-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634255431;
	bh=RKNmVoYNxdnpzMYxxYcm4flnvFopG/Vk/BaBEJLew54=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F0ONuDybnF3lQl/6CmixV7atdro/iWAqkg4TlCjkqxdC629KDwWDLzcP98vraShY5
	 57RVsEEJVGOwu3ngH915QhNvvcDxvvg0U4kClHhiF68O5029L1awHLXLtuaTJEIoyP
	 3aFzDBOJ4iijRvsf+eZ3RtLJG5DwfgQuNcKm3juTvOeDPo4BX6OknhRnnsDXOAIwEn
	 gfn+73PEynoU3aOhUMMpSnJp2G4s+9j8tCuUsbIs/rwzdXruhxpey4qE0n7Omj7Gdr
	 K2Qn0Xs3exWcrCkz8VHQ2mrMnG1d5MUx+kAQdkZ6apLQ3GSOvDcqzOzq3S0KNzUjgE
	 jcqshmEEo5XIg==
Date: Thu, 14 Oct 2021 16:50:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Michal Orzel <michal.orzel@arm.com>, 
    Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
In-Reply-To: <24936.28385.679884.535704@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2110141343450.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com> <7bdac405-a889-15e1-be19-5876f7253855@xen.org> <24926.53690.621007.507249@mariner.uk.xensource.com> <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
 <24927.7235.736221.270358@mariner.uk.xensource.com> <8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com> <cover.1634221830.git.bertrand.marquis@arm.com> <fd9c54a381daa52436b0a1b27cf1bba8e7ff9af9.1634221830.git.bertrand.marquis@arm.com>
 <24936.28385.679884.535704@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Oct 2021, Ian Jackson wrote:
> (Replying to both the earlier subthread on v5 and to the new v6
> patch.)
> 
> Bertrand Marquis writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in libxl"):
> > Now you suggest to add a new field arm_vpci in libxl__domain_create_state.
> 
> Hi.  I was handwaving, hence "probably" :-).  I hadn't actually looked
> at the existing code to see precisely how it would fit.
> 
> > Once we have done that I will need to access this structure to know if I need
> > to add the DT part and somehow to give it a value depending something which
> > for now would the number of pcidevs as there will be no user parameter anymore.
> 
> Right.
> 
> I looked at libxl_arm.c again:
> 
> It seems that the main entrypoint to all this is libxl__prepare_dtb,
> and it is that function you want to do new stuff.  That gets
> libxl_domain_build_info (which is specified by the IDL and comes from
> outside libxl, subject to libxl's default-filling machinery) and
> libxl__domain_build_state (which is the general state struct).
> 
> The information you need is is libxl_domain_create_info.
> libxl__domain_config_setdefault already arranges to set
> c_info->passthrough based on the number of PCI PT devices
> (search for `need_pt` in libxl_create.c).
> 
> That is, as I understand it on ARM vpci should be enabled if
> passthrough is enabled and not otherwise.  That is precisely what
> the variable c_info->passthrough is.
> 
> There is a slight issue because of the distinction between create_info
> and build_info and domain_config (and, the corresponding _state)
> structs.  Currently the DT code ony gets b_info, not the whole
> libxl_domain_config.  These distinctions largely historical nowadays.
> Certainly there is no reason not to pass a pointer to the whole
> libxl_domain_config, rather than just libxl_domain_build_info, into
> libxl__arch_domain_init_hw_description.
> 
> So I think the right approach for this looks something like this:
> 
> 1. Change libxl__arch_domain_init_hw_description to take
>    libxl_domain_config* rather than libxl_domain_build_info*.
>    libxl_domain_config contains libxl_domain_build_info so
>    this is easy.
> 
>    If you put in a convenience alias variable for the
>    libxl_domain_build_info* you can avoid extra typing in the function
>    body.  (If you call the convenience alias `info` you won't need to
>    change the body at all, but maybe `info` isn't the best name so you
>    could rename it to `b_info` maybe; up to you.)
> 
> 2. Make the same change to libxl__prepare_dtb.
> 
> 3. Now you can use d_config->c_info.passthrough to gate the addition
>    of the additional stuff to the DT.  Ie, that is a respin of this
>    patch 3/3.
> 
> 1 and 2 need to be separated out from 3, in a different patch (or two
> different patches) added to this series before what is now 3/3.  Ie
> 1+2, or 1 and 2 separately, should be pure plumbing changes with no
> functional change.
> 
> I hope this is helpful.

The explanation is clear and makes sense to me too.

FYI I suggested something similar and Rahul agreed on it; in fact, he
seemed to have already made the change and tested it:
https://marc.info/?l=xen-devel&m=163362066215155

I am just mentioning it in case Bertrand might be able to find Rahul's
updated patch somewhere and it might be useful as a base for his work.

The rest looks good, including the new changes.


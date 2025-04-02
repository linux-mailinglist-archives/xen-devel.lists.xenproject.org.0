Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E102A797DF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 23:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936102.1337417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05xa-0002Sd-Na; Wed, 02 Apr 2025 21:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936102.1337417; Wed, 02 Apr 2025 21:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u05xa-0002QW-Ku; Wed, 02 Apr 2025 21:49:22 +0000
Received: by outflank-mailman (input) for mailman id 936102;
 Wed, 02 Apr 2025 21:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u05xZ-0002QQ-CX
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 21:49:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 545b55ab-100c-11f0-9eaa-5ba50f476ded;
 Wed, 02 Apr 2025 23:49:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E4E485C689D;
 Wed,  2 Apr 2025 21:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE808C4CEDD;
 Wed,  2 Apr 2025 21:49:15 +0000 (UTC)
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
X-Inumbo-ID: 545b55ab-100c-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743630557;
	bh=ecnnbyPtWEqCBgoLWsWF93nY7KLOkv/2yxHzkcCVAOI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bgeGGNqE4NEi3SMx+onifC4Eebo2I0zctFzuQB7RbC8zPHmCHMP+SrnN9Tz5RwpKA
	 7S4hmVJAOpd9km7zJbWRfAzvQzZ2i7pEdZNobvrg+7o9BmtcdVR6flyi0KBzV9JBP1
	 CCkpoH6Q7xkOtDlTV3BUl1pdyN4nCmYqUBbKhRB1Q57j7XnWk7N+o1sUW5GqEMDCaP
	 eSBd2PE1b2Q581iBKsO2wSRXutQL7FLMv+RyWhj6KfYQnVkyp+ma3+KPfBZSad5GWf
	 JM4RPIrp7r4kdxNahG2wTK2Y0CASa9pi8Aj0rRtLqPxbrLaVC9oafK1NAMOBRdsPfy
	 iyWSMPrYEbVYA==
Date: Wed, 2 Apr 2025 14:49:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 6/6] xen/arm: Add capabilities to dom0less
In-Reply-To: <0d36750a-34d2-460b-a021-5afb7c2e7039@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504021446121.3529306@ubuntu-linux-20-04-desktop>
References: <20250331214321.205331-1-jason.andryuk@amd.com> <20250331214321.205331-7-jason.andryuk@amd.com> <alpine.DEB.2.22.394.2504011654320.3098208@ubuntu-linux-20-04-desktop> <0d36750a-34d2-460b-a021-5afb7c2e7039@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Apr 2025, Jason Andryuk wrote:
> On 2025-04-01 20:03, Stefano Stabellini wrote:
> > On Mon, 31 Mar 2025, Jason Andryuk wrote:
> > > Add capabilities property to dom0less to allow building a
> > > disaggregated system.  Only a single hardware domain and single xenstore
> > > domain can be specified.  Multiple control domains are possible.
> > > 
> > > Introduce bootfdt.h to contain these constants.
> > > 
> > > When using the hardware or xenstore capabilities, adjust the grant and
> > > event channel limits similar to dom0.
> > > 
> > > For a hardware domain, require an IOMMU and disallow specifying a vpl011
> > > console or nr_spis.
> > > 
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > ---
> > > v2:
> > > Fix comment style
> > > Make DOMAIN_CAPS_* unsigned
> > > Remove forced directmap & iommu
> > > Require iommu with use of hardware domain
> > > Limit to a single xenstore domain
> > > 
> > > There is overlap with hyperlaunch.  The numeric values are the same.
> > > Hyperlaunch doesn't expose the values in a public header as done here.
> > > Is this to be expected for dom0less?  It seems most of dom0less isn't in
> > > a header, but just in docs.
> > > 
> > > Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
> > > domain-level capabilities.
> > > 
> > > Only a single xenstore and hardware domain make sense.  Hardware domain
> > > receiving all hardware can only have a single domain.
> > > 
> > > For Xenstore, the logic latches the single xs_domid and uses that for
> > > all domains.  Also, only a single domain can register for VIRQ_DOM_EXC.
> > > ---
> 
> > > @@ -1020,6 +1023,40 @@ void __init create_domUs(void)
> > >           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
> > >               panic("No more domain IDs available\n");
> > >   +        if ( dt_property_read_u32(node, "capabilities", &val) )
> > > +        {
> > > +            if ( val & ~DOMAIN_CAPS_MASK )
> > > +                panic("Invalid capabilities (%"PRIx32")\n", val);
> > > +
> > > +            if ( val & DOMAIN_CAPS_CONTROL )
> > > +                flags |= CDF_privileged;
> > > +
> > > +            if ( val & DOMAIN_CAPS_HARDWARE )
> > > +            {
> > > +                if ( hardware_domain )
> > > +                    panic("Only 1 hardware domain can be specified!
> > > (%pd)\n",
> > > +                           hardware_domain);
> > > +
> > > +                if ( !iommu_enabled )
> > > +                    panic("iommu required for dom0less hardware
> > > domain\n");
> > 
> > The panic is OK if "direct-map" is not specified. We need to check for
> > direct-map before panic'ing.
> 
> Ok, I guess I misunderstood Julien's comment - I thought he wanted to require
> an iommu.  I can re-work it.

There are some subtleties here that it is best to clarify.

Julien asked for the hardware domain not to imply 1:1 memory mapping. If
the hardware domain has memory not mapped 1:1, then the IOMMU is
required. However, a user could still explicitly request the hardware
domain to be 1:1 mapped with the direct-map property, in that case the
IOMMU is optional.


> !direct-map && !iommu will panic.  Any other combination of direct-map and
> iommu will be allowed.

I think that's correct


> Hmmm, "passthrough" and "multiboot,device-tree" are essentially ignored for
> hwdom right now.  I'll require them to be unset for hwdom.

Good idea


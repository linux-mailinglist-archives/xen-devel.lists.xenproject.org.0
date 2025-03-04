Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD131A4ED30
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 20:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901476.1309430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXqQ-0002Ef-Mv; Tue, 04 Mar 2025 19:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901476.1309430; Tue, 04 Mar 2025 19:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpXqQ-0002C5-Jy; Tue, 04 Mar 2025 19:22:22 +0000
Received: by outflank-mailman (input) for mailman id 901476;
 Tue, 04 Mar 2025 19:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpXqP-0002Bz-8N
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 19:22:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fce1013d-f92d-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 20:22:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0DFB6A45D69;
 Tue,  4 Mar 2025 19:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D3BC4CEE5;
 Tue,  4 Mar 2025 19:22:16 +0000 (UTC)
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
X-Inumbo-ID: fce1013d-f92d-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741116137;
	bh=CcB8PXb278TQXOqhWNEkI/Yuy9rwtR8Sli6My9q2gME=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DbYfvSgk3NG12PDvjOQ1p0g8orqiPGDn/+JJBa3nHndYz2dSYNIJpHRuIvli4TCsF
	 cKZ7PcEts2EFWjQfQLTcl+2bPmfNE6fMjJpjqXUIRH+vBl+YSX0EL27fzatZ9gw3hX
	 gPb0DPIwtIb2hU5x8lI3a1NxEjEEPIQdyw3VwMOfQwyTEW9jdGgLd2q0xs3tt24S6R
	 DREGnC9VJQqaUtfr8ZvwPC5YW7y/7SiMgvaIEtWyzh0ol254tLHWKrVR51kL0HtBTA
	 Rc3+p2anW39crxzafZecyjzytYoe+ohXmnYRRsdDvHu43eH6sNUPRQsqPVqJakG/US
	 /oS0ZTPauBTTA==
Date: Tue, 4 Mar 2025 11:22:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
In-Reply-To: <1c4844a0-89e7-4699-894a-4957fedc4dee@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503041120430.1303386@ubuntu-linux-20-04-desktop>
References: <20250218095130.2666580-1-luca.fancellu@arm.com> <20250218095130.2666580-2-luca.fancellu@arm.com> <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com> <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com> <cc864728-0302-4ddc-88e0-c5330e3dc409@suse.com>
 <59D691D9-5A06-49C1-8B0C-E874029A97C6@arm.com> <1c4844a0-89e7-4699-894a-4957fedc4dee@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1650915289-1741116055=:1303386"
Content-ID: <alpine.DEB.2.22.394.2503041121050.1303386@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1650915289-1741116055=:1303386
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2503041121051.1303386@ubuntu-linux-20-04-desktop>

On Wed, 19 Feb 2025, Jan Beulich wrote:
> On 19.02.2025 16:25, Luca Fancellu wrote:
> >> On 19 Feb 2025, at 13:30, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 19.02.2025 14:06, Luca Fancellu wrote:
> >>>> On 19 Feb 2025, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> As per the
> >>>> respective revlog entry, this change looks to belong into whatever is
> >>>> going to be done to deal with the one Arm use of the macro. Or maybe
> >>>> it's unneeded altogether.
> >>>
> >>> I didn’t understand that you were opposing to protecting iommu_use_hap_pt() when
> >>> !HAS_PASSTHROUGH, I thought you were referring only to the stub in the #else
> >>> branch.
> >>> Can I ask why?
> >>
> >> Sure. And no, I'm not against the extra protection. I'm against unnecessary
> >> code churn. That is, any such a re-arrangement wants to have some kind of
> >> justification.
> > 
> > ok, yes the justification is that MPU system will be built with !HAS_PASSTHROUGH,
> > but there is a common function (p2m_set_way_flush) to MMU/MPU subsystem that
> > I would like to keep common, to do so I have to hide the macro in this particular
> > configuration and afterwards I have two choices:
> > 
> > 1) provide a stub implementation on the Arm side
> > 2) provide a stub implementation in iommu.h
> > 
> > number 2 felt better because it could be applied on any Xen configuration without
> > HAS_PASSTHROUGH, even if at the moment there is only MPU.
> > 
> > Number 1 let the possibility for the specific configuration to choose what to do in absence
> > of HAS_PASSTHROUGH.
> > 
> > Now I would like your view on what would be acceptable here.
> 
> I think I indicated earlier that I'd like the Arm maintainers to voice
> their preference. Doing it in iommu.h may be okay, but also may not be.
> Yet to decide that very Arm use of the macro needs taking into account,
> and I lack context there.

I think that doing it in iommu.h is fine

--8323329-1650915289-1741116055=:1303386--


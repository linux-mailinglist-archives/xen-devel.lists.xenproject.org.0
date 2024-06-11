Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28E903762
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738176.1144836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxP1-0002y1-PU; Tue, 11 Jun 2024 09:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738176.1144836; Tue, 11 Jun 2024 09:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxP1-0002v9-KZ; Tue, 11 Jun 2024 09:02:51 +0000
Received: by outflank-mailman (input) for mailman id 738176;
 Tue, 11 Jun 2024 09:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGxOz-0002v3-Rs
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:02:49 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f939c65-27d1-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 11:02:48 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6b060f0f48aso4458856d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:02:48 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b04f6c3a68sm55361436d6.52.2024.06.11.02.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 02:02:46 -0700 (PDT)
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
X-Inumbo-ID: 5f939c65-27d1-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718096567; x=1718701367; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtDEpSuaBXCZz37XDOSHA0WZI0YDApNnvtidOUUCopk=;
        b=Px4r9oa94V7AY6fsTrUgB3qHstuPQeIEHKC180KueseVUa1yV7IFOCTKCWNHeJSJnf
         P5SYmrEKBI4kY4nqgT0fFXJksV7rk7nb5t2yBdk4m0WDwCAs81KWkECOrPhalimZGAFl
         xLe87kreWC8kecBROBu+UHB2rk+/T0QgyMzgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096567; x=1718701367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtDEpSuaBXCZz37XDOSHA0WZI0YDApNnvtidOUUCopk=;
        b=G4xq/R2iXlPBPsyCmrtY25gC5UVSviuaP5kDfz44FZTgvOPgBetpacecdJ1WRWjFSK
         UrUqBqvh+NQURQErhsIhIl5Kh1v5RUkZeQP4ghDE66xegrStQ10+kI2btFzLipKFSXdC
         /cwEwKwreS3g1Ksq8CatjhlF7cjmpJw1/G1ZUlSalPttgnxTguYvgN8G8E8jcSWgAS/Z
         FZjJQBzU4r3TzJHeqKP/gcLv/2AocxxycFhShKrtteipMgwEgRRWHyq60rW0SZUVEiaR
         grvNEeO36enjew2q7G58FJ/tct1xauABFhfLZKsoR/RFWaw4qYFeDSooeKsQRLzidI2B
         LHSw==
X-Gm-Message-State: AOJu0Yx625VFGNCR6xcVvGgoHHuGD8AJQH0clpoms1XFxF3/BCyO6Wna
	6jQmGUhE5TF0I56+H9FC4PYJTttbX8QtfHl1H7NMDh6zoj3HwpNUSEKE0jwUQVBj7rgXmmQatRy
	g
X-Google-Smtp-Source: AGHT+IHYAOsR7T+GCbYwnw/K/cTCXmexF2H8IXYqNYtlu8BmsqLRMk5tpAB3K3uZjuV6fKgl9mPEmA==
X-Received: by 2002:a05:6214:4a8f:b0:6b0:6837:752c with SMTP id 6a1803df08f44-6b068377582mr100067436d6.24.1718096566977;
        Tue, 11 Jun 2024 02:02:46 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:02:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
Message-ID: <ZmgStGbVRuGaNUD_@macbook>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook>
 <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a11259be-7114-4332-b873-d1b163687a3e@suse.com>

On Tue, Jun 11, 2024 at 10:26:32AM +0200, Jan Beulich wrote:
> On 11.06.2024 09:41, Roger Pau Monné wrote:
> > On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
> >> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
> >> access to actual MMIO space should not generally be restricted to UC
> >> only; especially video frame buffer accesses are unduly affected by such
> >> a restriction. Permit PAT use for directly assigned MMIO as long as the
> >> domain is known to have been granted some level of cache control.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Considering that we've just declared PVH Dom0 "supported", this may well
> >> qualify for 4.19. The issue was specifically very noticable there.
> >>
> >> The conditional may be more complex than really necessary, but it's in
> >> line with what we do elsewhere. And imo better continue to be a little
> >> too restrictive, than moving to too lax.
> >>
> >> --- a/xen/arch/x86/mm/p2m-ept.c
> >> +++ b/xen/arch/x86/mm/p2m-ept.c
> >> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
> >>  
> >>      if ( !mfn_valid(mfn) )
> >>      {
> >> -        *ipat = true;
> >> +        *ipat = type != p2m_mmio_direct ||
> >> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
> > 
> > Looking at this, shouldn't the !mfn_valid special case be removed, and
> > mfns without a valid page be processed normally, so that the guest
> > MTRR values are taken into account, and no iPAT is enforced?
> 
> Such removal is what, in the post commit message remark, I'm referring to
> as "moving to too lax". Doing so might be okay, but will imo be hard to
> prove to be correct for all possible cases. Along these lines goes also
> that I'm adding the IOMMU-enabled and cache-flush checks: In principle
> p2m_mmio_direct should not be used when neither of these return true. Yet
> a similar consideration would apply to the immediately subsequent if().
> 
> Removing this code would, in particular, result in INVALID_MFN getting a
> type of WB by way of the subsequent if(), unless the type there would
> also be p2m_mmio_direct (which, as said, it ought to never be for non-
> pass-through domains). That again _may_ not be a problem as long as such
> EPT entries would never be marked present, yet that's again difficult to
> prove.

My understanding is that the !mfn_valid() check was a way to detect
MMIO regions in order to exit early and set those to UC.  I however
don't follow why the guest MTRR settings shouldn't also be applied to
those regions.

I'm also confused by your comment about "as such EPT entries would
never be marked present": non-present EPT entries don't even get into
epte_get_entry_emt(), and hence we could assert in epte_get_entry_emt
that mfn != INVALID_MFN?

> I was in fact wondering whether to special-case INVALID_MFN in the change
> I'm making. Question there is: Are we sure that by now we've indeed got
> rid of all arithmetic mistakenly done on MFN variables happening to hold
> INVALID_MFN as the value? IOW I fear that there might be code left which
> would pass in INVALID_MFN masked down to a 2M or 1G boundary. At which
> point checking for just INVALID_MFN would end up insufficient. If we
> meant to rely on this (tagging possible leftover issues as bugs we don't
> mean to attempt to cover for here anymore), then indeed the mfn_valid()
> check could be replaced by a comparison with INVALID_MFN (following a
> pattern we've been slowly trying to carry through elsewhere, especially
> in shadow code). Yet it could still not be outright dropped imo.
> 
> Furthermore simply dropping (or replacing as per above) that check won't
> work either: Further down in the function we use mfn_to_page(), which
> requires an up-front mfn_valid() check. That said, this code looks
> partly broken to me anyway: For a 1G page mfn_valid() on the start of it
> doesn't really imply all parts of it are valid. I guess I need to make a
> 2nd patch to address that as well, which may then want to be a prereq
> change to the one here (if we decided to go the route you're asking for).

I see, yes, the loop over the special pages array will need to be
adjusted to account for mfn_to_page() possibly returning NULL.

Overall I don't understand the need for this special case for
!mfn_valid().  The rest of special cases we have (the special pages
and domains without devices or MMIO regions assigned) are performance
optimizations which I do understand.  Yet the special casing of
!mfn_valid regions bypassing guest MTRR settings seems bogus to me.

> 
> > I also think this likely wants a:
> > 
> > Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> 
> Oh, indeed, I should have dug out when this broke. I didn't because I
> knew this mfn_valid() check was there forever, neglecting that it wasn't
> always (almost) first.
> 
> > As AFAICT before that commit direct MMIO regions would set iPAT to WB,
> > which would result in the correct attributes (albeit guest MTRR was
> > still ignored).
> 
> Two corrections here: First iPAT is a boolean; it can't be set to WB.
> And then what was happening prior to that change was that for the APIC
> access page iPAT was set to true, thus forcing WB there. iPAT was left
> set to false for all other p2m_mmio_direct pages, yielding (PAT-
> overridable) UC there.

Right, that behavior was still dubious to me, as I would assume those
regions would also want to fetch the type from guest MTRRs.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFD9039AF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 13:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738289.1145005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzMf-0002Wb-Cz; Tue, 11 Jun 2024 11:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738289.1145005; Tue, 11 Jun 2024 11:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzMf-0002TQ-A1; Tue, 11 Jun 2024 11:08:33 +0000
Received: by outflank-mailman (input) for mailman id 738289;
 Tue, 11 Jun 2024 11:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGzMe-0002TK-4m
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 11:08:32 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeac0481-27e2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 13:08:29 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6b08d661dbaso3853596d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 04:08:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b09131edcbsm1118256d6.25.2024.06.11.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 04:08:28 -0700 (PDT)
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
X-Inumbo-ID: eeac0481-27e2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718104108; x=1718708908; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLdfwikmmiK6vX/ivtXLz8rsFripeFRIuZ/WeVgWS3w=;
        b=LD+iZLWqq8RI0Ko1uwZg07W8npgPSV+uzt4fYNCCwul6G6Bh1WELkDmLnjb+FlG8BE
         yCn/dWuKQl5WL3/nkciXXaPq0qeAyysRWoc9itn6/Q2vFMRI6UZ7zaBBcI71SNj8Yvsw
         qF4eewAHNZnsAqKv0ypuGeqxLwCozKd3UB6Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718104108; x=1718708908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLdfwikmmiK6vX/ivtXLz8rsFripeFRIuZ/WeVgWS3w=;
        b=ToevjBaUb1UWDUmX7aOJpAeBXfRZBZzlDbxwFxqa8QDhdqngF+VJEbYverJ6Iaodto
         UadRLrkFgWaYIyWIHnWwpBkOwFGksAMYEPBqRgj/ElsFvVr6IGO6PNcuuvku8mgq/c1V
         q94So7RfRIChTbJkO68/jaiDsVPmZh/Bs4+RRmBsNcN4+hm2CKpoQOkwjaEY0fpexn2S
         0NnjVu7aYCEgH8l3mpjru/a9odvPE/TFoAyoSnZgXxerUO6VVmYZHVgbLcf5WTX/GRZG
         OYqBRgjubw9e1DjH1L66drKpdcfYtT43G8BBhxqAsK0YxtHyJNoh2pW9xIjvhqZjPTi8
         Zgqw==
X-Gm-Message-State: AOJu0YwbZmzN5ZoulNWIk5aAyrtpo7rXR7gRLfKhIsS6oeF+6MAtJ1zM
	jBg6VOQ0rx34kQdsODLxGGywTza6Iqj3SSvmQIMjDnv0ZsEUKBrXLCa1Ja7il0Q=
X-Google-Smtp-Source: AGHT+IF6VTucfoGipLqrI7yQZdj4uyVvOoLM+nKEaSJe++0hZlY9/pTIIxVUPNNhMRqUEncy5J63uQ==
X-Received: by 2002:a05:6214:568d:b0:6b0:7f36:8ae4 with SMTP id 6a1803df08f44-6b089f41c3emr36419066d6.14.1718104108483;
        Tue, 11 Jun 2024 04:08:28 -0700 (PDT)
Date: Tue, 11 Jun 2024 13:08:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
Message-ID: <ZmgwKmcLDJDhIsl7@macbook>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook>
 <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook>
 <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>

On Tue, Jun 11, 2024 at 11:33:24AM +0200, Jan Beulich wrote:
> On 11.06.2024 11:02, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 10:26:32AM +0200, Jan Beulich wrote:
> >> On 11.06.2024 09:41, Roger Pau Monné wrote:
> >>> On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/mm/p2m-ept.c
> >>>> +++ b/xen/arch/x86/mm/p2m-ept.c
> >>>> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
> >>>>  
> >>>>      if ( !mfn_valid(mfn) )
> >>>>      {
> >>>> -        *ipat = true;
> >>>> +        *ipat = type != p2m_mmio_direct ||
> >>>> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
> >>>
> >>> Looking at this, shouldn't the !mfn_valid special case be removed, and
> >>> mfns without a valid page be processed normally, so that the guest
> >>> MTRR values are taken into account, and no iPAT is enforced?
> >>
> >> Such removal is what, in the post commit message remark, I'm referring to
> >> as "moving to too lax". Doing so might be okay, but will imo be hard to
> >> prove to be correct for all possible cases. Along these lines goes also
> >> that I'm adding the IOMMU-enabled and cache-flush checks: In principle
> >> p2m_mmio_direct should not be used when neither of these return true. Yet
> >> a similar consideration would apply to the immediately subsequent if().
> >>
> >> Removing this code would, in particular, result in INVALID_MFN getting a
> >> type of WB by way of the subsequent if(), unless the type there would
> >> also be p2m_mmio_direct (which, as said, it ought to never be for non-
> >> pass-through domains). That again _may_ not be a problem as long as such
> >> EPT entries would never be marked present, yet that's again difficult to
> >> prove.
> > 
> > My understanding is that the !mfn_valid() check was a way to detect
> > MMIO regions in order to exit early and set those to UC.  I however
> > don't follow why the guest MTRR settings shouldn't also be applied to
> > those regions.
> 
> It's unclear to me whether the original purpose of he check really was
> (just) MMIO. It could as well also have been to cover the (then not yet
> named that way) case of INVALID_MFN.
> 
> As to ignoring guest MTRRs for MMIO: I think that's to be on the safe
> side. We don't want guests to map uncachable memory with a cachable
> memory type. Yet control isn't fine grained enough to prevent just
> that. Hence why we force UC, allowing merely to move to WC via PAT.

Would that be to cover up for guests bugs, or there's a coherency
reason for not allowing guests to access memory using fully guest
chosen cache attributes?

I really wonder whether Xen has enough information to figure out
whether a hole (MMIO region) is supposed to be accessed as UC or
something else.

Your proposed patch already allows guest to set such attributes in
PAT, and hence I don't see why also taking guest MTRRs into account
would be any worse.

> > I'm also confused by your comment about "as such EPT entries would
> > never be marked present": non-present EPT entries don't even get into
> > epte_get_entry_emt(), and hence we could assert in epte_get_entry_emt
> > that mfn != INVALID_MFN?
> 
> I don't think we can. Especially for the call from ept_set_entry() I
> can't spot anything that would prevent the call for non-present entries.
> This may be a mistake, but I can't do anything about it right here.

Hm, I see, then we should explicitly handle INVALID_MFN in
epte_get_entry_emt(), and just return early.

> >>> I also think this likely wants a:
> >>>
> >>> Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> >>
> >> Oh, indeed, I should have dug out when this broke. I didn't because I
> >> knew this mfn_valid() check was there forever, neglecting that it wasn't
> >> always (almost) first.
> >>
> >>> As AFAICT before that commit direct MMIO regions would set iPAT to WB,
> >>> which would result in the correct attributes (albeit guest MTRR was
> >>> still ignored).
> >>
> >> Two corrections here: First iPAT is a boolean; it can't be set to WB.
> >> And then what was happening prior to that change was that for the APIC
> >> access page iPAT was set to true, thus forcing WB there. iPAT was left
> >> set to false for all other p2m_mmio_direct pages, yielding (PAT-
> >> overridable) UC there.
> > 
> > Right, that behavior was still dubious to me, as I would assume those
> > regions would also want to fetch the type from guest MTRRs.
> 
> Well, for the APIC access page we want to prevent it becoming UC. It's MMIO
> from the guest's perspective, yet _we_ know it's really ordinary RAM. For
> actual MMIO see above; the only case where we probably ought to respect
> guest MTRRs is when they say WC (following from what I said further up).
> Yet that's again an independent change to (possibly) make.

For emulated devices we might map regular RAM into what the guest
otherwise thinks it's MMIO.  Maybe the mfn_valid() check should be
inverted, and return WB when the underlying mfn is RAM, and otherwise
use the guest MTRRs to decide the cache attribute?

Thanks, Roger.


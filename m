Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BD903DFA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738450.1145215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1vm-00033t-Os; Tue, 11 Jun 2024 13:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738450.1145215; Tue, 11 Jun 2024 13:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1vm-00032N-MF; Tue, 11 Jun 2024 13:52:58 +0000
Received: by outflank-mailman (input) for mailman id 738450;
 Tue, 11 Jun 2024 13:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sH1vk-00032D-UP
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:52:56 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e724d29c-27f9-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 15:52:55 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7954dcf3158so230878085a.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:52:55 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79557127817sm298719685a.40.2024.06.11.06.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 06:52:53 -0700 (PDT)
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
X-Inumbo-ID: e724d29c-27f9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718113974; x=1718718774; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R0TsreSRtoMQiKoTDWojasdOseqDouGJ98Nj9rOopks=;
        b=j/e0wxyHNb252YaedX1NkXYk9tCF0X6R4TMD7NRE8HfxSXfwwDLrFyYulfFPDfA9aW
         hkfUdpUFD3x0ye3b/lScsfBZiU0K3G6b0jUxm/SdDTizCDYiczq777682ukwmfx2Kzf9
         vR+CvjfdOx+4L358Du5oSbWLdBhRHrlf0bheI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113974; x=1718718774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0TsreSRtoMQiKoTDWojasdOseqDouGJ98Nj9rOopks=;
        b=k6v/FCiIyUoCPsOIYQ+VQpnrF0KZmDv7v8JlA1ONXr6i7YTNqx5iq2y2V/KFmzHzot
         I41SrdAhe72vu1FDEcNYG7BY+5LNODwCwMFVtCW56309abzL9jomLBlCk8j5Va/Cyp6D
         l6676VojdQ1AiHqJW96JwBmzg7bpCoz/r4J0ZBZHhhYMqqzMWR3Z1APapuGGkRPBeCAi
         KOBTWJ9pWJ/dTe+d6ZRuscxePmOSMee/2ch1uR7ISUf53HWG9NV8uXmLOHYq7UJ2Xvzm
         AQZ2ytED+Rcbf8SG+yU4U7OBzmRLxUgxi0GoQYGMHeRGNW4DY43JIIafx45CT2nRoi+a
         aNmw==
X-Gm-Message-State: AOJu0Ywjicb6Rp2mOy16pMPYb4hMG2HEIhvpFv8LNXcTzYLXZBCqhIu7
	Wg/Ai9g9JGxYIENyiTP2vC5nDdRr7RSrIF7BMzjce0DKzjobeIyoemHzuvz6c+0=
X-Google-Smtp-Source: AGHT+IFXFgwbWlA2W7vJSrVyR6otpPEQTBl3eYEZSLdGMgzrlB8xlI7zayO4ZAt9wxfSI/yKwS6MZQ==
X-Received: by 2002:a05:620a:298a:b0:795:fb0e:1eb1 with SMTP id af79cd13be357-795fb0e22e1mr674679185a.63.1718113974325;
        Tue, 11 Jun 2024 06:52:54 -0700 (PDT)
Date: Tue, 11 Jun 2024 15:52:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
Message-ID: <ZmhWtEyuwjTuIAxK@macbook>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook>
 <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook>
 <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
 <ZmgwKmcLDJDhIsl7@macbook>
 <b076dc8d-701e-4a9f-a147-c54673959009@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b076dc8d-701e-4a9f-a147-c54673959009@suse.com>

On Tue, Jun 11, 2024 at 01:52:58PM +0200, Jan Beulich wrote:
> On 11.06.2024 13:08, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 11:33:24AM +0200, Jan Beulich wrote:
> >> On 11.06.2024 11:02, Roger Pau Monné wrote:
> >>> On Tue, Jun 11, 2024 at 10:26:32AM +0200, Jan Beulich wrote:
> >>>> On 11.06.2024 09:41, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
> >>>>>> --- a/xen/arch/x86/mm/p2m-ept.c
> >>>>>> +++ b/xen/arch/x86/mm/p2m-ept.c
> >>>>>> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
> >>>>>>  
> >>>>>>      if ( !mfn_valid(mfn) )
> >>>>>>      {
> >>>>>> -        *ipat = true;
> >>>>>> +        *ipat = type != p2m_mmio_direct ||
> >>>>>> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
> >>>>>
> >>>>> Looking at this, shouldn't the !mfn_valid special case be removed, and
> >>>>> mfns without a valid page be processed normally, so that the guest
> >>>>> MTRR values are taken into account, and no iPAT is enforced?
> >>>>
> >>>> Such removal is what, in the post commit message remark, I'm referring to
> >>>> as "moving to too lax". Doing so might be okay, but will imo be hard to
> >>>> prove to be correct for all possible cases. Along these lines goes also
> >>>> that I'm adding the IOMMU-enabled and cache-flush checks: In principle
> >>>> p2m_mmio_direct should not be used when neither of these return true. Yet
> >>>> a similar consideration would apply to the immediately subsequent if().
> >>>>
> >>>> Removing this code would, in particular, result in INVALID_MFN getting a
> >>>> type of WB by way of the subsequent if(), unless the type there would
> >>>> also be p2m_mmio_direct (which, as said, it ought to never be for non-
> >>>> pass-through domains). That again _may_ not be a problem as long as such
> >>>> EPT entries would never be marked present, yet that's again difficult to
> >>>> prove.
> >>>
> >>> My understanding is that the !mfn_valid() check was a way to detect
> >>> MMIO regions in order to exit early and set those to UC.  I however
> >>> don't follow why the guest MTRR settings shouldn't also be applied to
> >>> those regions.
> >>
> >> It's unclear to me whether the original purpose of he check really was
> >> (just) MMIO. It could as well also have been to cover the (then not yet
> >> named that way) case of INVALID_MFN.
> >>
> >> As to ignoring guest MTRRs for MMIO: I think that's to be on the safe
> >> side. We don't want guests to map uncachable memory with a cachable
> >> memory type. Yet control isn't fine grained enough to prevent just
> >> that. Hence why we force UC, allowing merely to move to WC via PAT.
> > 
> > Would that be to cover up for guests bugs, or there's a coherency
> > reason for not allowing guests to access memory using fully guest
> > chosen cache attributes?
> 
> I think the main reason is that this way we don't need to bother thinking
> of whether MMIO regions may need caches flushed in order for us to be
> sure memory is all up-to-date. But I have no insight into what the
> original reasons here may have been.
> 
> > I really wonder whether Xen has enough information to figure out
> > whether a hole (MMIO region) is supposed to be accessed as UC or
> > something else.
> 
> It certainly hasn't, and hence is erring on the (safe) side of forcing
> UC.

Except that for the vesa framebuffer at least this is a bad choice :).

> > Your proposed patch already allows guest to set such attributes in
> > PAT, and hence I don't see why also taking guest MTRRs into account
> > would be any worse.
> 
> Whatever the guest sets in PAT, UC in EMT will win except fot the
> special case of WC.
> 
> >>>>> I also think this likely wants a:
> >>>>>
> >>>>> Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> >>>>
> >>>> Oh, indeed, I should have dug out when this broke. I didn't because I
> >>>> knew this mfn_valid() check was there forever, neglecting that it wasn't
> >>>> always (almost) first.
> >>>>
> >>>>> As AFAICT before that commit direct MMIO regions would set iPAT to WB,
> >>>>> which would result in the correct attributes (albeit guest MTRR was
> >>>>> still ignored).
> >>>>
> >>>> Two corrections here: First iPAT is a boolean; it can't be set to WB.
> >>>> And then what was happening prior to that change was that for the APIC
> >>>> access page iPAT was set to true, thus forcing WB there. iPAT was left
> >>>> set to false for all other p2m_mmio_direct pages, yielding (PAT-
> >>>> overridable) UC there.
> >>>
> >>> Right, that behavior was still dubious to me, as I would assume those
> >>> regions would also want to fetch the type from guest MTRRs.
> >>
> >> Well, for the APIC access page we want to prevent it becoming UC. It's MMIO
> >> from the guest's perspective, yet _we_ know it's really ordinary RAM. For
> >> actual MMIO see above; the only case where we probably ought to respect
> >> guest MTRRs is when they say WC (following from what I said further up).
> >> Yet that's again an independent change to (possibly) make.
> > 
> > For emulated devices we might map regular RAM into what the guest
> > otherwise thinks it's MMIO.
> 
> Right, and for non-pass-through domains we force everything to WB already.
> 
> >  Maybe the mfn_valid() check should be
> > inverted, and return WB when the underlying mfn is RAM, and otherwise
> > use the guest MTRRs to decide the cache attribute?
> 
> First: Whether WB is correct for RAM isn't known. With some peculiar device
> assigned, the guest may want/need part of its RAM be e.g. WC or WT. (It's
> only without any physical devices assigned that we can be quite sure that
> WB is good for all of RAM.) Therefore, second, I think respecting MTRRs for
> RAM is less likely to cause problems than respecting them for MMIO.
> 
> I think at this point the main question is: Do we want to do things at least
> along the lines of this v1, or do we instead feel certain enough to switch
> the mfn_valid() to a comparison against INVALID_MFN (and perhaps moving it
> up to almost the top of the function)?

My preferred option would be the later, as that would remove a special
casing.  However, I'm unsure how much fallout this could cause - those
caching changes are always tricky and lead to unexpected fallout.

OTOH the current !mfn_valid() check is very restrictive, as it forces
all MMIO to UC.  So by removing it we allow guest chosen types to take
effect, which are likely less restrictive than UC (whether those are
correct is another question).

> One caveat here that I forgot to
> mention before: MFNs taken out of EPT entries will never be INVALID_MFN, for
> the truncation that happens when populating entries. In that case we rely on
> mfn_valid() to be "rejecting" them.

The only caller where mfns from EPT entries are passed to
epte_get_entry_emt() is in resolve_misconfig() AFAICT, and in that
case the EPT entry must be present for epte_get_entry_emt() to be
called.  So it seems to me that epte_get_entry_emt() can never be
called from an mfn constructed from an INVALID_MFN EPT entry (but it's
worth adding an assert for it).

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A3A904117
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 18:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738630.1145449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH4Fv-0007Z4-88; Tue, 11 Jun 2024 16:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738630.1145449; Tue, 11 Jun 2024 16:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH4Fv-0007XZ-56; Tue, 11 Jun 2024 16:21:55 +0000
Received: by outflank-mailman (input) for mailman id 738630;
 Tue, 11 Jun 2024 16:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sH4Fu-0007XT-1B
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 16:21:54 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5423b95-280e-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 18:21:51 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-797a7f9b52eso114272885a.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 09:21:51 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795330b2426sm529069285a.73.2024.06.11.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 09:21:49 -0700 (PDT)
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
X-Inumbo-ID: b5423b95-280e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718122910; x=1718727710; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgcEAoD20pyXujmelPMl1KRx/ATOqc4py2jWXdGdleI=;
        b=g8fGrOjCsB2lhH7FX1SYiZcyt2XZI2mXsXhhjq+sZzkc3ISlwgeDBKiycQlKRebyYy
         Robt0+U7CroVAaDQ0OeWbVamRnEJPChO7sRZNls/ib4bEZqnH8Dq+lyRVMLjiu9bTFFh
         8btGILhHTDSCp94MzdrXrB2xKD6m36V2fdG0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718122910; x=1718727710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgcEAoD20pyXujmelPMl1KRx/ATOqc4py2jWXdGdleI=;
        b=W07g2eyurAh3k6X9D2vZM4C8FgnA4yAhOchbWCzkWphgcyDP4ykPQdEIDLplqcnfXm
         wg0lehtkeREfBlRbwHNCZ541HiyhSpALUU1pkT6cXGOQm2gxjuVzHxkCWctDcNYdeq9l
         +5M2DPCUkuzgI53d84Jv9R8/X8SJu0XcdHXv3fMpW/wBvENmqVKOQR3o6B9iCHliHvf6
         GcTbmustmuN0Cuuh4aNyKnGLAHBrIY8b0EcrA15JqNUXj6Y4TRtzVEAxUk6qkKUNuevo
         rVVgZ6z0RJtMi7qHTm7bZXvj8F1xgS27A2fmbDASoK2scWSt5W6K2/XOOoDsz62exFHM
         Scog==
X-Gm-Message-State: AOJu0YyiWEjqiRABcZ232T7uBoDYspuEaLfoekdh9HHiIZwN4dpnbvhj
	41zu6oweyb4uS9FZ+aW1Wt4XBrMxN9sL2ZxJSTzi7/4dlqmeJZptHC8pwo0d/Gw=
X-Google-Smtp-Source: AGHT+IE2Pd/Q1egGA5IbjzttdKRI0ftwMFmKGnFSUKoVi1Rggkl4QF6W+uKp/VK9T8nZtGB8WNGiUA==
X-Received: by 2002:a05:620a:c50:b0:794:f330:6caa with SMTP id af79cd13be357-7953c49de71mr1389368185a.58.1718122909639;
        Tue, 11 Jun 2024 09:21:49 -0700 (PDT)
Date: Tue, 11 Jun 2024 18:21:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
Message-ID: <Zmh5mw15_FwITnj1@macbook>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook>
 <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook>
 <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
 <ZmgwKmcLDJDhIsl7@macbook>
 <b076dc8d-701e-4a9f-a147-c54673959009@suse.com>
 <ZmhWtEyuwjTuIAxK@macbook>
 <beb67703-c1f0-490a-a3ad-36e2f331f5e4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <beb67703-c1f0-490a-a3ad-36e2f331f5e4@suse.com>

On Tue, Jun 11, 2024 at 04:53:22PM +0200, Jan Beulich wrote:
> On 11.06.2024 15:52, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 01:52:58PM +0200, Jan Beulich wrote:
> >> On 11.06.2024 13:08, Roger Pau Monné wrote:
> >>> I really wonder whether Xen has enough information to figure out
> >>> whether a hole (MMIO region) is supposed to be accessed as UC or
> >>> something else.
> >>
> >> It certainly hasn't, and hence is erring on the (safe) side of forcing
> >> UC.
> > 
> > Except that for the vesa framebuffer at least this is a bad choice :).
> 
> Well, yes, that's where we want WC to be permitted. But for that we only
> need to avoid setting iPAT; we still can uniformly hand back UC. Except
> (as mentioned elsewhere earlier) if the guest uses MTRRs rather than PAT
> to arrange for WC.

If we want to get this into 4.19, we likely want to go your proposed
approach then, as it's less risky.

I think a comment would be helpful to note that the fix here to not
enforce iPAT by still return UC is mostly done to accommodate vesa
regions mapped with PAT attributes to use WC.

I would also like to add some kind of note that special casing
!mfn_valid() might not be needed, but that removing it must be done
carefully to not cause regressions.

> >>>  Maybe the mfn_valid() check should be
> >>> inverted, and return WB when the underlying mfn is RAM, and otherwise
> >>> use the guest MTRRs to decide the cache attribute?
> >>
> >> First: Whether WB is correct for RAM isn't known. With some peculiar device
> >> assigned, the guest may want/need part of its RAM be e.g. WC or WT. (It's
> >> only without any physical devices assigned that we can be quite sure that
> >> WB is good for all of RAM.) Therefore, second, I think respecting MTRRs for
> >> RAM is less likely to cause problems than respecting them for MMIO.
> >>
> >> I think at this point the main question is: Do we want to do things at least
> >> along the lines of this v1, or do we instead feel certain enough to switch
> >> the mfn_valid() to a comparison against INVALID_MFN (and perhaps moving it
> >> up to almost the top of the function)?
> > 
> > My preferred option would be the later, as that would remove a special
> > casing.  However, I'm unsure how much fallout this could cause - those
> > caching changes are always tricky and lead to unexpected fallout.
> 
> Which is the very reason why I tried to avoid going to far with this.
> 
> > OTOH the current !mfn_valid() check is very restrictive, as it forces
> > all MMIO to UC.
> 
> Which is why, in this v1, I'm relaxing only the iPAT part.
> 
> >  So by removing it we allow guest chosen types to take
> > effect, which are likely less restrictive than UC (whether those are
> > correct is another question).
> 
> No, guest chosen types still wouldn't come into play, due to what the
> switch() further down in the function does for p2m_mmio_direct.

Indeed.  That should also be removed if we decide for MMIO cache
attributes to be controlled by guest MTRRs.

> 
> >> One caveat here that I forgot to
> >> mention before: MFNs taken out of EPT entries will never be INVALID_MFN, for
> >> the truncation that happens when populating entries. In that case we rely on
> >> mfn_valid() to be "rejecting" them.
> > 
> > The only caller where mfns from EPT entries are passed to
> > epte_get_entry_emt() is in resolve_misconfig() AFAICT, and in that
> > case the EPT entry must be present for epte_get_entry_emt() to be
> > called.  So it seems to me that epte_get_entry_emt() can never be
> > called from an mfn constructed from an INVALID_MFN EPT entry (but it's
> > worth adding an assert for it).
> 
> Are you sure? I agree for the first of those two calls, but the second
> isn't quite as obvious. There we'd need to first prove that we will
> never create non-present super-page entries. Yet if I'm not mistaken
> for PoD we may create such.

I should go look then, didn't know PoD would do that.

Regards, Roger.


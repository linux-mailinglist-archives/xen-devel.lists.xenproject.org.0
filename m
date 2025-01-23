Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6CA1A41C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 13:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876195.1286561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawEz-0000CP-AZ; Thu, 23 Jan 2025 12:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876195.1286561; Thu, 23 Jan 2025 12:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawEz-0000Ax-7t; Thu, 23 Jan 2025 12:23:21 +0000
Received: by outflank-mailman (input) for mailman id 876195;
 Thu, 23 Jan 2025 12:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tawEy-0000Ar-9n
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 12:23:20 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d399a3de-d984-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 13:23:18 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso3727096a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 04:23:18 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab632fa9f6esm472093166b.115.2025.01.23.04.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:23:16 -0800 (PST)
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
X-Inumbo-ID: d399a3de-d984-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737634997; x=1738239797; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jqyzbacxeoe/hGUk9E85W1gEGbEF6DW25f7NXqDuufc=;
        b=FSfE2rzkPx98irM5pK7njLeIyxYcbd+ViyMuWI925AX5fxtQr8Z+xJaMyQpq1jmGrf
         XbgZslXRrZO13Hq3lfi+CyDlm3jqoMKsZm02quFlIRBqt4rYrvt524ZxEiXmpn7doCM5
         /UNixTTDrLcW79hCC620zZHTNJU8AvDK1Mh1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634997; x=1738239797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqyzbacxeoe/hGUk9E85W1gEGbEF6DW25f7NXqDuufc=;
        b=GUHm5LFy9wG7RFthj7Ejkm6snnpEx7KfrNlB5CRAW+mCA0oXq9eqlZC3riIBrZ5Mb4
         7pcJAdB0AU5mWA+kuv2lUTuwAmrzF0zUssV1eiOAOc0nQEylOlBMzztew5SxCwvXrXoZ
         wlJOg0sZP7ED9p5Yfkw2s8l0frWPbxPX4EvlGS5g6dT10+oaKlSm3qwoGfSsfzuH1D6c
         h5sBLu8V4/thKCk5a6BQj8pPXUjdSLHIRaBOHjLEb4AoyYhFhxRwOgQ8GWnqXTJBslIj
         5tMA6hjmO/gDT+OQlSHvrbzbQQWmVkYLxUYAWKDmdcFrydiVovef36QFlj5LXQGUmQyW
         4EDg==
X-Gm-Message-State: AOJu0Yz8C2XHuA1nGi5Lk3Up+tKn++fj4bhLlxL47LhgU886I3TcmKAX
	SFalt+aVhl5VUgkHto73SEEHKGfMRDWuExo1RIdL3K24WnyB8LUHpHxy2vM5N+Q=
X-Gm-Gg: ASbGncs5zLv7B4oFVrOSvdtl7eLF2e0SHd4rAiVV8IBFwQYOfK76JNs/GOwGp9UR0o7
	OGVjIzg3MYaTZglY7DocSuB8Eq17qvn3SL73MCHEOv5uTbwgRHrNLXGbgOap5/YnNvkaK5+F8V+
	mBNPZ/BMtHXFtaN/MyWwCY5LEwPDugBl0Mb4FVcul5ZgPzqO0x98u6sZkbNli8BjfDZRMe61HT5
	aXZwqMMqPiwutW52kax4/EQG/gwWxbvYkCYeL2nrNI/mG5T2F7uj5zM0qpEuaHwxxrnVXuAt6Q+
	zR/Jjq1AWWfxLHg=
X-Google-Smtp-Source: AGHT+IF4N2JVRlBpG1T/QPKg1+XOsCej1L+ouNhpRhI4mzQ4NrsbquZWlOFokiZosxt9dmmJbsak8w==
X-Received: by 2002:a17:906:d555:b0:ab3:85eb:377c with SMTP id a640c23a62f3a-ab662a63a50mr315122066b.17.1737634997388;
        Thu, 23 Jan 2025 04:23:17 -0800 (PST)
Date: Thu, 23 Jan 2025 13:23:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Manuel Andreas <manuel.andreas@tum.de>
Subject: Re: [PATCH v2 3/5] x86/HVM: correct read/write split at page
 boundaries
Message-ID: <Z5I0s83trDGp1x2V@macbook.local>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <fde70079-4084-4aa6-b76e-becd62a71ddb@suse.com>
 <Z5Euyc91PZsyMP6f@macbook.local>
 <41e6c4a5-d5c4-40a2-a8c6-f6b5bba70f8c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41e6c4a5-d5c4-40a2-a8c6-f6b5bba70f8c@suse.com>

On Thu, Jan 23, 2025 at 10:49:36AM +0100, Jan Beulich wrote:
> On 22.01.2025 18:45, Roger Pau Monné wrote:
> > On Tue, Oct 01, 2024 at 10:49:40AM +0200, Jan Beulich wrote:
> >> The MMIO cache is intended to have one entry used per independent memory
> >> access that an insn does. This, in particular, is supposed to be
> >> ignoring any page boundary crossing. Therefore when looking up a cache
> >> entry, the access'es starting (linear) address is relevant, not the one
> >> possibly advanced past a page boundary.
> >>
> >> In order for the same offset-into-buffer variable to be usable in
> >> hvmemul_phys_mmio_access() for both the caller's buffer and the cache
> >> entry's it is further necessary to have the un-adjusted caller buffer
> >> passed into there.
> >>
> >> Fixes: 2d527ba310dc ("x86/hvm: split all linear reads and writes at page boundary")
> >> Reported-by: Manuel Andreas <manuel.andreas@tum.de>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> This way problematic overlaps are only reduced (to ones starting at the
> >> same address), not eliminated: Assumptions in hvmemul_phys_mmio_access()
> >> go further - if a subsequent access is larger than an earlier one, but
> >> the splitting results in a chunk to cross the end "boundary" of the
> >> earlier access, an assertion will still trigger. Explicit memory
> >> accesses (ones encoded in an insn by explicit or implicit memory
> >> operands) match the assumption afaict (i.e. all those accesses are of
> >> uniform size, and hence they either fully overlap or are mapped to
> >> distinct cache entries).
> >>
> >> Insns accessing descriptor tables, otoh, don't fulfill these
> >> expectations: The selector read (if coming from memory) will always be
> >> smaller than the descriptor being read, and if both (insanely) start at
> >> the same linear address (in turn mapping MMIO), said assertion will kick
> >> in. (The same would be true for an insn trying to access itself as data,
> >> as long as certain size "restrictions" between insn and memory operand
> >> are met. Except that linear_read() disallows insn fetches from MMIO.) To
> >> deal with such, I expect we will need to further qualify (tag) cache
> >> entries, such that reads/writes won't use insn fetch entries, and
> >> implicit-supervisor-mode accesses won't use entries of ordinary
> >> accesses. (Page table accesses don't need considering here for now, as
> >> our page walking code demands page tables to be mappable, implying
> >> they're in guest RAM; such accesses also don't take the path here.)
> >> Thoughts anyone, before I get to making another patch?
> >>
> >> Considering the insn fetch aspect mentioned above I'm having trouble
> >> following why the cache has 3 entries. With insn fetches permitted,
> >> descriptor table accesses where the accessed bit needs setting may also
> >> fail because of that limited capacity of the cache, due to the way the
> >> accesses are done. The read and write (cmpxchg) are independent accesses
> >> from the cache's perspective, and hence we'd need another entry there.
> >> If, otoh, the 3 entries are there to account for precisely this (which
> >> seems unlikely with commit e101123463d2 ["x86/hvm: track large memory
> >> mapped accesses by buffer offset"] not saying anything at all), then we
> >> should be fine in this regard. If we were to permit insn fetches, which
> >> way to overcome this (possibly by allowing the write to re-use the
> >> earlier read's entry in this special situation) would remain to be
> >> determined.
> > 
> > I'm not that familiar with the emulator logic for memory accesses, but
> > it seems like we are adding more and more complexity and special
> > casing.  Maybe it's the only way to go forward, but I wonder if there
> > could be some other way to solve this.  However, I don't think I
> > will have time to look into it, and hence I'm not going to oppose to
> > your proposal.
> 
> I'll see what I can do; it's been quite a while, so I'll first need to
> swap context back in.
> 
> > Are there however some tests, possibly XTF, that we could use to
> > ensure the behavior of accesses is as we expect?
> 
> Manuel's report included an XTF test, which I expect will become a part
> of XTF once this fix went in. I fear though that there is an issue
> Andrew has been pointing out, which may prevent this from happening
> right away (even if with osstest having disappeared that's now only a
> latent issue, until gitlab CI would start exercising XTF): With the
> issue unfixed on older trees (i.e. those remaining after this series
> was backported as appropriate), the new test would fail there.

All this seems (to my possibly untrained eye in the emulator) quite
fragile, so I would feel more comfortable knowing we have some way to
test functionality here don't regress.

> >> @@ -1030,7 +1040,11 @@ static struct hvm_mmio_cache *hvmemul_fi
> >>              return cache;
> >>      }
> >>  
> >> -    if ( !create )
> >> +    /*
> >> +     * Bail if a new entry shouldn't be allocated, utilizing that ->space has
> >                                                       ^rely on ->space having ...
> > Would be easier to read IMO.
> 
> Changed; I'm not overly fussed, yet at the same time I also don't really
> agree with your comment.
> 
> >> @@ -1064,12 +1079,14 @@ static void latch_linear_to_phys(struct
> >>  
> >>  static int hvmemul_linear_mmio_access(
> >>      unsigned long gla, unsigned int size, uint8_t dir, void *buffer,
> >> -    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt, bool known_gpfn)
> >> +    uint32_t pfec, struct hvm_emulate_ctxt *hvmemul_ctxt,
> >> +    unsigned long start, bool known_gpfn)
> > 
> > I think start is a bit ambiguous, start_gla might be clearer (same
> > below for the start parameter).
> 
> Fine with me - changed for all three hvmemul_linear_mmio_*(). It wasn't
> clear to me whether you also meant the local variables in
> linear_{read,write}(); since you said "parameter" I assumed you didn't.

Indeed, I think those are fine as they are local variables.

> If you did, I fear I'd be less happy to make the change there too, for
> "addr" then preferably also wanting to change to "gla". Yet that would
> cause undue extra churn.
> 
> >> @@ -1182,8 +1202,17 @@ static int linear_read(unsigned long add
> >>       * an access that was previously handled as MMIO. Thus it is imperative that
> >>       * we handle this access in the same way to guarantee completion and hence
> >>       * clean up any interim state.
> >> +     *
> >> +     * Care must be taken, however, to correctly deal with crossing RAM/MMIO or
> >> +     * MMIO/RAM boundaries. While we want to use a single cache entry (tagged
> >> +     * by the starting linear address), we need to continue issuing (i.e. also
> >> +     * upon replay) the RAM access for anything that's ahead of or past MMIO,
> >> +     * i.e. in RAM.
> >>       */
> >> -    if ( !hvmemul_find_mmio_cache(hvio, addr, IOREQ_READ, false) )
> >> +    cache = hvmemul_find_mmio_cache(hvio, start, IOREQ_READ, ~0);
> >> +    if ( !cache ||
> >> +         addr + bytes <= start + cache->skip ||
> >> +         addr >= start + cache->size )
> > 
> > Seeing as this bound checks is also used below, could it be a macro or
> > inline function?
> > 
> > is_cached() or similar?
> 
> Hmm. Yes, it's twice the same expression, yet that helper would require
> four parameters. That's a little too much for my taste; I'd prefer to
> keep things as they are. After all there are far more redundancies between
> the two functions.

Oh, indeed that would be 4 parameters.  Anyway, I guess it's fine
as-is then.

Thanks, Roger.


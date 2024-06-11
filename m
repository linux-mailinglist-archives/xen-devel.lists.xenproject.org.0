Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B7903E0E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738455.1145226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1ye-0003t2-7W; Tue, 11 Jun 2024 13:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738455.1145226; Tue, 11 Jun 2024 13:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1ye-0003pr-4K; Tue, 11 Jun 2024 13:55:56 +0000
Received: by outflank-mailman (input) for mailman id 738455;
 Tue, 11 Jun 2024 13:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eM8s=NN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sH1yc-0003pj-LM
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:55:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f2b98b-27fa-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 15:55:52 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57c831b6085so1465481a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:55:52 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c5f19fb43sm7310003a12.19.2024.06.11.06.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:55:51 -0700 (PDT)
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
X-Inumbo-ID: 50f2b98b-27fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718114152; x=1718718952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VjahdgDhEuuGaZuRJ7m00nTtmOvkgS3F6Q8qDGy4Yvo=;
        b=idm2g8a5JrEnxYUPzpG3FuO1JrJ3UyLgloSfs8nQwpYH3nicYK9eKG0ydIfZ/JCfj7
         YrHU+seuVa7a2NheW+40tMZ7zC6dgEMp9M8iLiEy2OL81M1FSMShGb9KUQATFUARfy/m
         7hHqouVRJPVuZqP4Dk4EGn1iOVyQYWhl71S2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718114152; x=1718718952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjahdgDhEuuGaZuRJ7m00nTtmOvkgS3F6Q8qDGy4Yvo=;
        b=MiVOSpY264hnHnrsrPrEMJxlhKZREXlZfIQvY8iTeH40y/miQ0+jDhRBCQ4XujFrl6
         knWoDajQz9Mxkb9VLTReO1PdJ22YT0LRatekHlzNB1AnpTuZblS2ar51pr1anJzJXczP
         DfNpo9QobtyeUSTaYm4XlyJwv5vIpaTOQeVb9Q7lifOkg2g2aJhrsC7YZ5z7umswppxJ
         fhxAATM8V+6NOc9dWJbwGPONErDyVZsS1h/Xjdj+E5g9RIWZ+kcCX38N4hfWpoAScN6X
         cg+ws3t7Ojz/jJiDdGBj0Mfi1qzMjxOVTQmiGCHq05UYBtqV+rMYWdKGj5PwbwZ6yNvK
         bPEQ==
X-Gm-Message-State: AOJu0YzS5S0ITbxdK7AdHjJFycZCgtgGAkYivq7N0bnll+lBGr4Ccx2N
	ISl8Lp8W/fBAkuV5nA368A/VNxYUsT8NY3fKnDwiaOrx+RJFsI/IfQFRkaTWyLk=
X-Google-Smtp-Source: AGHT+IFoLqHQ+z9cMNpUt6LN37JpBz84u84PfN6nTZw6sjy5CBbGisxcP5r9KwVSMLQnZRwE9Afm0Q==
X-Received: by 2002:a50:c308:0:b0:57c:6d89:eaef with SMTP id 4fb4d7f45d1cf-57c6d89f0damr6607154a12.18.1718114151974;
        Tue, 11 Jun 2024 06:55:51 -0700 (PDT)
Message-ID: <42e4d6de-4428-40a9-90d8-1329fbee5a1f@citrix.com>
Date: Tue, 11 Jun 2024 14:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook> <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook> <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2024 10:33 am, Jan Beulich wrote:
> On 11.06.2024 11:02, Roger Pau Monné wrote:
>> On Tue, Jun 11, 2024 at 10:26:32AM +0200, Jan Beulich wrote:
>>> On 11.06.2024 09:41, Roger Pau Monné wrote:
>>>> On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
>>>>> --- a/xen/arch/x86/mm/p2m-ept.c
>>>>> +++ b/xen/arch/x86/mm/p2m-ept.c
>>>>> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
>>>>>  
>>>>>      if ( !mfn_valid(mfn) )
>>>>>      {
>>>>> -        *ipat = true;
>>>>> +        *ipat = type != p2m_mmio_direct ||
>>>>> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
>>>> Looking at this, shouldn't the !mfn_valid special case be removed, and
>>>> mfns without a valid page be processed normally, so that the guest
>>>> MTRR values are taken into account, and no iPAT is enforced?
>>> Such removal is what, in the post commit message remark, I'm referring to
>>> as "moving to too lax". Doing so might be okay, but will imo be hard to
>>> prove to be correct for all possible cases. Along these lines goes also
>>> that I'm adding the IOMMU-enabled and cache-flush checks: In principle
>>> p2m_mmio_direct should not be used when neither of these return true. Yet
>>> a similar consideration would apply to the immediately subsequent if().
>>>
>>> Removing this code would, in particular, result in INVALID_MFN getting a
>>> type of WB by way of the subsequent if(), unless the type there would
>>> also be p2m_mmio_direct (which, as said, it ought to never be for non-
>>> pass-through domains). That again _may_ not be a problem as long as such
>>> EPT entries would never be marked present, yet that's again difficult to
>>> prove.
>> My understanding is that the !mfn_valid() check was a way to detect
>> MMIO regions in order to exit early and set those to UC.  I however
>> don't follow why the guest MTRR settings shouldn't also be applied to
>> those regions.
> It's unclear to me whether the original purpose of he check really was
> (just) MMIO. It could as well also have been to cover the (then not yet
> named that way) case of INVALID_MFN.
>
> As to ignoring guest MTRRs for MMIO: I think that's to be on the safe
> side. We don't want guests to map uncachable memory with a cachable
> memory type. Yet control isn't fine grained enough to prevent just
> that. Hence why we force UC, allowing merely to move to WC via PAT.
>
>> I'm also confused by your comment about "as such EPT entries would
>> never be marked present": non-present EPT entries don't even get into
>> epte_get_entry_emt(), and hence we could assert in epte_get_entry_emt
>> that mfn != INVALID_MFN?
> I don't think we can. Especially for the call from ept_set_entry() I
> can't spot anything that would prevent the call for non-present entries.
> This may be a mistake, but I can't do anything about it right here.
>
>>> I was in fact wondering whether to special-case INVALID_MFN in the change
>>> I'm making. Question there is: Are we sure that by now we've indeed got
>>> rid of all arithmetic mistakenly done on MFN variables happening to hold
>>> INVALID_MFN as the value? IOW I fear that there might be code left which
>>> would pass in INVALID_MFN masked down to a 2M or 1G boundary. At which
>>> point checking for just INVALID_MFN would end up insufficient. If we
>>> meant to rely on this (tagging possible leftover issues as bugs we don't
>>> mean to attempt to cover for here anymore), then indeed the mfn_valid()
>>> check could be replaced by a comparison with INVALID_MFN (following a
>>> pattern we've been slowly trying to carry through elsewhere, especially
>>> in shadow code). Yet it could still not be outright dropped imo.
>>>
>>> Furthermore simply dropping (or replacing as per above) that check won't
>>> work either: Further down in the function we use mfn_to_page(), which
>>> requires an up-front mfn_valid() check. That said, this code looks
>>> partly broken to me anyway: For a 1G page mfn_valid() on the start of it
>>> doesn't really imply all parts of it are valid. I guess I need to make a
>>> 2nd patch to address that as well, which may then want to be a prereq
>>> change to the one here (if we decided to go the route you're asking for).
>> I see, yes, the loop over the special pages array will need to be
>> adjusted to account for mfn_to_page() possibly returning NULL.
> Except that NULL will hardly ever come back there. What we need is an
> explicit mfn_valid() check. I already have a patch, but I'd like to
> submit it only once I know how the v2 of the one here is going to look
> like.
>
>> Overall I don't understand the need for this special case for
>> !mfn_valid().  The rest of special cases we have (the special pages
>> and domains without devices or MMIO regions assigned) are performance
>> optimizations which I do understand.  Yet the special casing of
>> !mfn_valid regions bypassing guest MTRR settings seems bogus to me.
> As said, it may well be that we can (now) switch to comparison against
> INVALID_MFN there, if we're certain MMIO isn't to be covered by this
> (anymore).
>
>>>> I also think this likely wants a:
>>>>
>>>> Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
>>> Oh, indeed, I should have dug out when this broke. I didn't because I
>>> knew this mfn_valid() check was there forever, neglecting that it wasn't
>>> always (almost) first.
>>>
>>>> As AFAICT before that commit direct MMIO regions would set iPAT to WB,
>>>> which would result in the correct attributes (albeit guest MTRR was
>>>> still ignored).
>>> Two corrections here: First iPAT is a boolean; it can't be set to WB.
>>> And then what was happening prior to that change was that for the APIC
>>> access page iPAT was set to true, thus forcing WB there. iPAT was left
>>> set to false for all other p2m_mmio_direct pages, yielding (PAT-
>>> overridable) UC there.
>> Right, that behavior was still dubious to me, as I would assume those
>> regions would also want to fetch the type from guest MTRRs.
> Well, for the APIC access page we want to prevent it becoming UC. It's MMIO
> from the guest's perspective, yet _we_ know it's really ordinary RAM.

It's really not "ordinary" RAM.

For both Intel and AMD, APIC acceleration is triggered based on a memory
operand match in host physical address space, but accesses are
redirected to the (per vCPU) APIC register page.

Intel state that the EPT translation must be a 4k translation, and AMD
state that the NPT perms must be RW.

I can't actually find any statement about cacheability.  I expect this
is because it's never actually accessed.  (Intel go as far as saying
that even if you CLFLUSH against it, because of the redirect, you'll end
up flushing the respective line in the APIC Regs page.)

Irrespective, it appears that the changeability doesn't matter, but I
would recommend against using it as a representative example for the
discussion here.

~Andrew


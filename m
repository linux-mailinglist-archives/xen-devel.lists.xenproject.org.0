Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75969037EA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738191.1144854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxsf-000140-9x; Tue, 11 Jun 2024 09:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738191.1144854; Tue, 11 Jun 2024 09:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxsf-00011E-7F; Tue, 11 Jun 2024 09:33:29 +0000
Received: by outflank-mailman (input) for mailman id 738191;
 Tue, 11 Jun 2024 09:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGxse-00010y-74
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:33:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7719f45-27d5-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 11:33:26 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f1c4800easo239535566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:33:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f392fba29sm50910866b.109.2024.06.11.02.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 02:33:25 -0700 (PDT)
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
X-Inumbo-ID: a7719f45-27d5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718098406; x=1718703206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XQFTv1399tZhTTTL6nPwZ82TtAVPVZCA3Jne/9EUPlc=;
        b=VmUJK4/ixlwMcIgQsEApg95VJv8e6zmFWiqY3xR+z4QPy1QZwnpdAgRtV7rF0zR44N
         SC2C/cZ8dhKc+zqOD1U8+I6uoCgHhL910f9NblGFcb5d4fGa/Ai9lE0BaHxLTttiISTv
         iWiTW6dgUY9ZTAN+KzE350FXGa0WZGuAF4TBJRSip6JRRLkSCCkqaGskIDvZH347MWqS
         l3Vhg1SSvxEr/NAq3GxFTXG4JKTyJ/Cdhs1oqEzKNOklJwEVQxJ1UkmNXAydH3SEKEfM
         mgZh3Co5bUyM6c//qaFh7FxsHYJ+4kamp1q1qk44McK7Tek425MTkyuve74Mt1PmYU1K
         DRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098406; x=1718703206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQFTv1399tZhTTTL6nPwZ82TtAVPVZCA3Jne/9EUPlc=;
        b=BdL8zNu9vayPirbdmwKHdDPZCX4wHDQ5BYFP97CRo0DOBZC9cVkoXiXz/VjRyGZiTv
         njgCgyaeTQFHn9dKtErzhhF8nJMOsPWxp8jur7raXn3p13eNUblAfkV8vr8ajflbfPE+
         gySSMEH6InlJlasFerZbr+/HaY93xm2OAMKfRBIVnSlNQDSHK+jz0BkfJsBJLFIOMP6Z
         /me1CS5vGBWCU44G24lpRmyH9tsrJHKjWYhmAywZc9R2lYcai1nWO6E4wW4DeCxUV36h
         qvtWTu61hxO8vezooOrQVzCmO315R60YDli5r9b+mltgvP0zz1PqO/ygJs2NkxAP8Vhk
         wARQ==
X-Gm-Message-State: AOJu0YwnDHLQ9w2qTsmoVknd8H/TZtGd+rbbKKJ4/MLb8l1LM1KvKTs7
	Zv7mLdZ3VtPRRai/UBgHFWIoRrZUEeLlEapRyns8OuokvQzy/0JUTNXfKXSeyw==
X-Google-Smtp-Source: AGHT+IEDx4acLv0WFhFICqx+rLm9ZVsA5KSr0I4BhGZbEEC1P7W/D4E9ZU41kxMS8JHq2SBDVqKrNg==
X-Received: by 2002:a17:906:1c87:b0:a6f:1106:5dc7 with SMTP id a640c23a62f3a-a6f11065e29mr439712366b.5.1718098405800;
        Tue, 11 Jun 2024 02:33:25 -0700 (PDT)
Message-ID: <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
Date: Tue, 11 Jun 2024 11:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook> <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZmgStGbVRuGaNUD_@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 11:02, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 10:26:32AM +0200, Jan Beulich wrote:
>> On 11.06.2024 09:41, Roger Pau Monné wrote:
>>> On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/p2m-ept.c
>>>> +++ b/xen/arch/x86/mm/p2m-ept.c
>>>> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
>>>>  
>>>>      if ( !mfn_valid(mfn) )
>>>>      {
>>>> -        *ipat = true;
>>>> +        *ipat = type != p2m_mmio_direct ||
>>>> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
>>>
>>> Looking at this, shouldn't the !mfn_valid special case be removed, and
>>> mfns without a valid page be processed normally, so that the guest
>>> MTRR values are taken into account, and no iPAT is enforced?
>>
>> Such removal is what, in the post commit message remark, I'm referring to
>> as "moving to too lax". Doing so might be okay, but will imo be hard to
>> prove to be correct for all possible cases. Along these lines goes also
>> that I'm adding the IOMMU-enabled and cache-flush checks: In principle
>> p2m_mmio_direct should not be used when neither of these return true. Yet
>> a similar consideration would apply to the immediately subsequent if().
>>
>> Removing this code would, in particular, result in INVALID_MFN getting a
>> type of WB by way of the subsequent if(), unless the type there would
>> also be p2m_mmio_direct (which, as said, it ought to never be for non-
>> pass-through domains). That again _may_ not be a problem as long as such
>> EPT entries would never be marked present, yet that's again difficult to
>> prove.
> 
> My understanding is that the !mfn_valid() check was a way to detect
> MMIO regions in order to exit early and set those to UC.  I however
> don't follow why the guest MTRR settings shouldn't also be applied to
> those regions.

It's unclear to me whether the original purpose of he check really was
(just) MMIO. It could as well also have been to cover the (then not yet
named that way) case of INVALID_MFN.

As to ignoring guest MTRRs for MMIO: I think that's to be on the safe
side. We don't want guests to map uncachable memory with a cachable
memory type. Yet control isn't fine grained enough to prevent just
that. Hence why we force UC, allowing merely to move to WC via PAT.

> I'm also confused by your comment about "as such EPT entries would
> never be marked present": non-present EPT entries don't even get into
> epte_get_entry_emt(), and hence we could assert in epte_get_entry_emt
> that mfn != INVALID_MFN?

I don't think we can. Especially for the call from ept_set_entry() I
can't spot anything that would prevent the call for non-present entries.
This may be a mistake, but I can't do anything about it right here.

>> I was in fact wondering whether to special-case INVALID_MFN in the change
>> I'm making. Question there is: Are we sure that by now we've indeed got
>> rid of all arithmetic mistakenly done on MFN variables happening to hold
>> INVALID_MFN as the value? IOW I fear that there might be code left which
>> would pass in INVALID_MFN masked down to a 2M or 1G boundary. At which
>> point checking for just INVALID_MFN would end up insufficient. If we
>> meant to rely on this (tagging possible leftover issues as bugs we don't
>> mean to attempt to cover for here anymore), then indeed the mfn_valid()
>> check could be replaced by a comparison with INVALID_MFN (following a
>> pattern we've been slowly trying to carry through elsewhere, especially
>> in shadow code). Yet it could still not be outright dropped imo.
>>
>> Furthermore simply dropping (or replacing as per above) that check won't
>> work either: Further down in the function we use mfn_to_page(), which
>> requires an up-front mfn_valid() check. That said, this code looks
>> partly broken to me anyway: For a 1G page mfn_valid() on the start of it
>> doesn't really imply all parts of it are valid. I guess I need to make a
>> 2nd patch to address that as well, which may then want to be a prereq
>> change to the one here (if we decided to go the route you're asking for).
> 
> I see, yes, the loop over the special pages array will need to be
> adjusted to account for mfn_to_page() possibly returning NULL.

Except that NULL will hardly ever come back there. What we need is an
explicit mfn_valid() check. I already have a patch, but I'd like to
submit it only once I know how the v2 of the one here is going to look
like.

> Overall I don't understand the need for this special case for
> !mfn_valid().  The rest of special cases we have (the special pages
> and domains without devices or MMIO regions assigned) are performance
> optimizations which I do understand.  Yet the special casing of
> !mfn_valid regions bypassing guest MTRR settings seems bogus to me.

As said, it may well be that we can (now) switch to comparison against
INVALID_MFN there, if we're certain MMIO isn't to be covered by this
(anymore).

>>> I also think this likely wants a:
>>>
>>> Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
>>
>> Oh, indeed, I should have dug out when this broke. I didn't because I
>> knew this mfn_valid() check was there forever, neglecting that it wasn't
>> always (almost) first.
>>
>>> As AFAICT before that commit direct MMIO regions would set iPAT to WB,
>>> which would result in the correct attributes (albeit guest MTRR was
>>> still ignored).
>>
>> Two corrections here: First iPAT is a boolean; it can't be set to WB.
>> And then what was happening prior to that change was that for the APIC
>> access page iPAT was set to true, thus forcing WB there. iPAT was left
>> set to false for all other p2m_mmio_direct pages, yielding (PAT-
>> overridable) UC there.
> 
> Right, that behavior was still dubious to me, as I would assume those
> regions would also want to fetch the type from guest MTRRs.

Well, for the APIC access page we want to prevent it becoming UC. It's MMIO
from the guest's perspective, yet _we_ know it's really ordinary RAM. For
actual MMIO see above; the only case where we probably ought to respect
guest MTRRs is when they say WC (following from what I said further up).
Yet that's again an independent change to (possibly) make.

Jan


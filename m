Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408AB903B1F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 13:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738328.1145055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH03i-0002va-RN; Tue, 11 Jun 2024 11:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738328.1145055; Tue, 11 Jun 2024 11:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH03i-0002t6-NT; Tue, 11 Jun 2024 11:53:02 +0000
Received: by outflank-mailman (input) for mailman id 738328;
 Tue, 11 Jun 2024 11:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH03h-0002sy-02
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 11:53:01 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2650b50a-27e9-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 13:52:59 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57c72d6d5f3so3681544a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 04:52:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c7ef8d914sm4223789a12.71.2024.06.11.04.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 04:52:58 -0700 (PDT)
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
X-Inumbo-ID: 2650b50a-27e9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718106779; x=1718711579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KZpbqDn0Y/BPvQ8JCxbw4Bue1wDMPXTDQt7/Xb+xbmc=;
        b=P2tmtft+hmtHY6vrqbHt6eGwBRhXI9zCl3Oyg6GeTec26Vy1hq72niMrbEWKbkSxBk
         b36jQmEaMIQ9or2FU7LRHI1UQWhio3uVcPEuqbs8mhtmEAVkpQI5zRhgoiqMeaXDWUh1
         0hgzuEMqFgFhLRgnDz2gSs39qpiDJ48/NT5vPsAFwOYJ+lNMzkKl7v6NA6qc36Ne1Na1
         r4K4drE6NYRvggNMFL1NTAAV6Qo6hF84Dqqxe0ubR+/jZ3AItSdQ0mzO4wjI/ORaI5Vb
         RmA6kXVYlHllIFCQxrELuWIuhjzUFvrYE98afbs1eVkQxeE/0VQbIAkZTIhsK5s1G/xZ
         ZZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718106779; x=1718711579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZpbqDn0Y/BPvQ8JCxbw4Bue1wDMPXTDQt7/Xb+xbmc=;
        b=dG51AcergG0Vc4zt7Klo9ewPQ42qbFIloEmeEXTf7+9S2aum8n6hyVn+1Fbj6WrtBv
         /vaR08Jej45DUiMJDFSwKdS+GNR8ir4vWbokds7F1wQS3aqsAvd65PeiXL8I9SvQSKoX
         x/VsLcLnWp0DWBGG2SDFCMaYJM//ipccWxzpRjh7FtsPWSgcsaprjAnTcAjvDzdAp2A0
         wqRiC1D3UbE0jRu9oivCrjEAkrR5AYxJauKAQX6NshNTmv+xr+lr2yDHVL0fhwy73w8P
         QbWAObUBX2S/bRLRo+6DmHuwCpiENLCbxy5R9DaNnof2lFBJ+0H5WNZU4KNiwCagVqvg
         bvHQ==
X-Gm-Message-State: AOJu0YzvOSQ5kyuDztJB5eGpbHrS4KlhG+1y4JfaAM4HAegIDvGciPtY
	zUuIpMt94qwI7pKnqvwVZlTnSP3W+1sZGG4OL8nBNj22uGhOI0HYihcg0SfshA==
X-Google-Smtp-Source: AGHT+IFzWKobZSODZqfS9LJOmwX+h6jUTdWf8BkyZO8sTQihiv03H0EeVUfKfGgRXFtyVmK/vtREEQ==
X-Received: by 2002:a50:cdda:0:b0:57c:7ce3:6cd9 with SMTP id 4fb4d7f45d1cf-57c7ce36e15mr3622795a12.23.1718106779083;
        Tue, 11 Jun 2024 04:52:59 -0700 (PDT)
Message-ID: <b076dc8d-701e-4a9f-a147-c54673959009@suse.com>
Date: Tue, 11 Jun 2024 13:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook> <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook> <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
 <ZmgwKmcLDJDhIsl7@macbook>
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
In-Reply-To: <ZmgwKmcLDJDhIsl7@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 13:08, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 11:33:24AM +0200, Jan Beulich wrote:
>> On 11.06.2024 11:02, Roger Pau Monné wrote:
>>> On Tue, Jun 11, 2024 at 10:26:32AM +0200, Jan Beulich wrote:
>>>> On 11.06.2024 09:41, Roger Pau Monné wrote:
>>>>> On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
>>>>>> --- a/xen/arch/x86/mm/p2m-ept.c
>>>>>> +++ b/xen/arch/x86/mm/p2m-ept.c
>>>>>> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
>>>>>>  
>>>>>>      if ( !mfn_valid(mfn) )
>>>>>>      {
>>>>>> -        *ipat = true;
>>>>>> +        *ipat = type != p2m_mmio_direct ||
>>>>>> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
>>>>>
>>>>> Looking at this, shouldn't the !mfn_valid special case be removed, and
>>>>> mfns without a valid page be processed normally, so that the guest
>>>>> MTRR values are taken into account, and no iPAT is enforced?
>>>>
>>>> Such removal is what, in the post commit message remark, I'm referring to
>>>> as "moving to too lax". Doing so might be okay, but will imo be hard to
>>>> prove to be correct for all possible cases. Along these lines goes also
>>>> that I'm adding the IOMMU-enabled and cache-flush checks: In principle
>>>> p2m_mmio_direct should not be used when neither of these return true. Yet
>>>> a similar consideration would apply to the immediately subsequent if().
>>>>
>>>> Removing this code would, in particular, result in INVALID_MFN getting a
>>>> type of WB by way of the subsequent if(), unless the type there would
>>>> also be p2m_mmio_direct (which, as said, it ought to never be for non-
>>>> pass-through domains). That again _may_ not be a problem as long as such
>>>> EPT entries would never be marked present, yet that's again difficult to
>>>> prove.
>>>
>>> My understanding is that the !mfn_valid() check was a way to detect
>>> MMIO regions in order to exit early and set those to UC.  I however
>>> don't follow why the guest MTRR settings shouldn't also be applied to
>>> those regions.
>>
>> It's unclear to me whether the original purpose of he check really was
>> (just) MMIO. It could as well also have been to cover the (then not yet
>> named that way) case of INVALID_MFN.
>>
>> As to ignoring guest MTRRs for MMIO: I think that's to be on the safe
>> side. We don't want guests to map uncachable memory with a cachable
>> memory type. Yet control isn't fine grained enough to prevent just
>> that. Hence why we force UC, allowing merely to move to WC via PAT.
> 
> Would that be to cover up for guests bugs, or there's a coherency
> reason for not allowing guests to access memory using fully guest
> chosen cache attributes?

I think the main reason is that this way we don't need to bother thinking
of whether MMIO regions may need caches flushed in order for us to be
sure memory is all up-to-date. But I have no insight into what the
original reasons here may have been.

> I really wonder whether Xen has enough information to figure out
> whether a hole (MMIO region) is supposed to be accessed as UC or
> something else.

It certainly hasn't, and hence is erring on the (safe) side of forcing
UC.

> Your proposed patch already allows guest to set such attributes in
> PAT, and hence I don't see why also taking guest MTRRs into account
> would be any worse.

Whatever the guest sets in PAT, UC in EMT will win except fot the
special case of WC.

>>>>> I also think this likely wants a:
>>>>>
>>>>> Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
>>>>
>>>> Oh, indeed, I should have dug out when this broke. I didn't because I
>>>> knew this mfn_valid() check was there forever, neglecting that it wasn't
>>>> always (almost) first.
>>>>
>>>>> As AFAICT before that commit direct MMIO regions would set iPAT to WB,
>>>>> which would result in the correct attributes (albeit guest MTRR was
>>>>> still ignored).
>>>>
>>>> Two corrections here: First iPAT is a boolean; it can't be set to WB.
>>>> And then what was happening prior to that change was that for the APIC
>>>> access page iPAT was set to true, thus forcing WB there. iPAT was left
>>>> set to false for all other p2m_mmio_direct pages, yielding (PAT-
>>>> overridable) UC there.
>>>
>>> Right, that behavior was still dubious to me, as I would assume those
>>> regions would also want to fetch the type from guest MTRRs.
>>
>> Well, for the APIC access page we want to prevent it becoming UC. It's MMIO
>> from the guest's perspective, yet _we_ know it's really ordinary RAM. For
>> actual MMIO see above; the only case where we probably ought to respect
>> guest MTRRs is when they say WC (following from what I said further up).
>> Yet that's again an independent change to (possibly) make.
> 
> For emulated devices we might map regular RAM into what the guest
> otherwise thinks it's MMIO.

Right, and for non-pass-through domains we force everything to WB already.

>  Maybe the mfn_valid() check should be
> inverted, and return WB when the underlying mfn is RAM, and otherwise
> use the guest MTRRs to decide the cache attribute?

First: Whether WB is correct for RAM isn't known. With some peculiar device
assigned, the guest may want/need part of its RAM be e.g. WC or WT. (It's
only without any physical devices assigned that we can be quite sure that
WB is good for all of RAM.) Therefore, second, I think respecting MTRRs for
RAM is less likely to cause problems than respecting them for MMIO.

I think at this point the main question is: Do we want to do things at least
along the lines of this v1, or do we instead feel certain enough to switch
the mfn_valid() to a comparison against INVALID_MFN (and perhaps moving it
up to almost the top of the function)? One caveat here that I forgot to
mention before: MFNs taken out of EPT entries will never be INVALID_MFN, for
the truncation that happens when populating entries. In that case we rely on
mfn_valid() to be "rejecting" them.

Jan


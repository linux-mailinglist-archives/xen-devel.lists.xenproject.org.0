Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBAF90364F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738155.1144815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwpw-0001p3-QC; Tue, 11 Jun 2024 08:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738155.1144815; Tue, 11 Jun 2024 08:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwpw-0001mW-NW; Tue, 11 Jun 2024 08:26:36 +0000
Received: by outflank-mailman (input) for mailman id 738155;
 Tue, 11 Jun 2024 08:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGwpw-00016O-2H
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:26:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fc76610-27cc-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 10:26:34 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso364992266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 01:26:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f188a5162sm291486366b.81.2024.06.11.01.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 01:26:32 -0700 (PDT)
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
X-Inumbo-ID: 4fc76610-27cc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718094393; x=1718699193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i3MvvtXF42y2SpxtapsHIt7Jb43QszZt0LMwTm3bkkQ=;
        b=It85GZcoyoU5ndOeDYXYAJevVD8b8W6tIc/a2A51R/x9JRrEGm/DaR8i/FQwWuIdxO
         NQDqZnrXdOGnL/XDXjRqmn0FlB7NAL2xfAcrGSO5tsoHHN3afEDRiJrBls759hzOvlAx
         eo28cHw5fv3KOGR63BSrkXKOOX0yAG2AhNwJePL5L9GWGemTypW4tUaBY1M8StbDRuhQ
         YFNOz85jZ0BAr4fbgbuAHg6n/9JwFT9uP5Q9edDqizWi/1ogAxvAZ2kpRs5Sc5L9Qhcl
         /nG66UB9QOcN26vVxraNsdvnDeoOW0D4dCOc1jWtLHnITIdWRjwuXH0gHBChYSA0Ph+F
         t+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718094393; x=1718699193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3MvvtXF42y2SpxtapsHIt7Jb43QszZt0LMwTm3bkkQ=;
        b=P6HQJjzo9590LVw43zrCAnBCAUsNgCeEbK4v8qZvbvKU6pni6IqY8HbSet95LsHZaN
         JHHFQyWd79hNUIv3FrBw1iLydt40Bw8dZqlq6V9qSsTE6brH3EnDIj88abUG0oH/Tr6/
         t1kprfjMjgEQRvYyIAHHZ+uf8jW6mhCJZnNtY3cLuEUux0hB/JbtcWb5TUjHYyAW3lhv
         33EILHyH4yQoEx8ucGZcf+tWzA/iZoRHZOtFOTUMN97thQQffTF40lJbldkS1obkwowe
         lSvOr3LUdfunH4ez6maNIB5VjyQVuDr1XDU3Pnsg7O98wkpv3mxARDSHzxBv85MTsfu4
         SqFA==
X-Gm-Message-State: AOJu0YzetLYQTWy+HMYThI109g6ZBLrYHY7XgKBOkfVph+/POBNLKIWI
	MSUqlxkLHxvQvCUG5uV+fb3hgDOONCi4BJdRvUsvH2y/qhP5mhPzXfUXl8p+5Q==
X-Google-Smtp-Source: AGHT+IHv7pa3+obiuK0L5n+LJ3s6BpfzgnjHn+GXWfs83BUVndRPXYU0OaSGuMJJUuKvQDpqtU5o4Q==
X-Received: by 2002:a17:906:eb0f:b0:a6e:f869:d722 with SMTP id a640c23a62f3a-a6ef869d8ccmr530938166b.64.1718094393135;
        Tue, 11 Jun 2024 01:26:33 -0700 (PDT)
Message-ID: <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
Date: Tue, 11 Jun 2024 10:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook>
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
In-Reply-To: <Zmf_k2meED8iG3H5@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 09:41, Roger Pau Monné wrote:
> On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
>> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
>> access to actual MMIO space should not generally be restricted to UC
>> only; especially video frame buffer accesses are unduly affected by such
>> a restriction. Permit PAT use for directly assigned MMIO as long as the
>> domain is known to have been granted some level of cache control.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Considering that we've just declared PVH Dom0 "supported", this may well
>> qualify for 4.19. The issue was specifically very noticable there.
>>
>> The conditional may be more complex than really necessary, but it's in
>> line with what we do elsewhere. And imo better continue to be a little
>> too restrictive, than moving to too lax.
>>
>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
>>  
>>      if ( !mfn_valid(mfn) )
>>      {
>> -        *ipat = true;
>> +        *ipat = type != p2m_mmio_direct ||
>> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
> 
> Looking at this, shouldn't the !mfn_valid special case be removed, and
> mfns without a valid page be processed normally, so that the guest
> MTRR values are taken into account, and no iPAT is enforced?

Such removal is what, in the post commit message remark, I'm referring to
as "moving to too lax". Doing so might be okay, but will imo be hard to
prove to be correct for all possible cases. Along these lines goes also
that I'm adding the IOMMU-enabled and cache-flush checks: In principle
p2m_mmio_direct should not be used when neither of these return true. Yet
a similar consideration would apply to the immediately subsequent if().

Removing this code would, in particular, result in INVALID_MFN getting a
type of WB by way of the subsequent if(), unless the type there would
also be p2m_mmio_direct (which, as said, it ought to never be for non-
pass-through domains). That again _may_ not be a problem as long as such
EPT entries would never be marked present, yet that's again difficult to
prove.

I was in fact wondering whether to special-case INVALID_MFN in the change
I'm making. Question there is: Are we sure that by now we've indeed got
rid of all arithmetic mistakenly done on MFN variables happening to hold
INVALID_MFN as the value? IOW I fear that there might be code left which
would pass in INVALID_MFN masked down to a 2M or 1G boundary. At which
point checking for just INVALID_MFN would end up insufficient. If we
meant to rely on this (tagging possible leftover issues as bugs we don't
mean to attempt to cover for here anymore), then indeed the mfn_valid()
check could be replaced by a comparison with INVALID_MFN (following a
pattern we've been slowly trying to carry through elsewhere, especially
in shadow code). Yet it could still not be outright dropped imo.

Furthermore simply dropping (or replacing as per above) that check won't
work either: Further down in the function we use mfn_to_page(), which
requires an up-front mfn_valid() check. That said, this code looks
partly broken to me anyway: For a 1G page mfn_valid() on the start of it
doesn't really imply all parts of it are valid. I guess I need to make a
2nd patch to address that as well, which may then want to be a prereq
change to the one here (if we decided to go the route you're asking for).

> I also think this likely wants a:
> 
> Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')

Oh, indeed, I should have dug out when this broke. I didn't because I
knew this mfn_valid() check was there forever, neglecting that it wasn't
always (almost) first.

> As AFAICT before that commit direct MMIO regions would set iPAT to WB,
> which would result in the correct attributes (albeit guest MTRR was
> still ignored).

Two corrections here: First iPAT is a boolean; it can't be set to WB.
And then what was happening prior to that change was that for the APIC
access page iPAT was set to true, thus forcing WB there. iPAT was left
set to false for all other p2m_mmio_direct pages, yielding (PAT-
overridable) UC there.

Jan


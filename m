Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CE8B951A
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715589.1117332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QdL-0001S0-Bj; Thu, 02 May 2024 07:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715589.1117332; Thu, 02 May 2024 07:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QdL-0001P1-8x; Thu, 02 May 2024 07:13:35 +0000
Received: by outflank-mailman (input) for mailman id 715589;
 Thu, 02 May 2024 07:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2QdJ-0001Or-Ns
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:13:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b407877-0853-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 09:13:31 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so64836635e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:13:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c469400b0041bc41287cesm889702wmo.16.2024.05.02.00.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:13:30 -0700 (PDT)
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
X-Inumbo-ID: 7b407877-0853-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714634011; x=1715238811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/eop79hcQEtCziVc8UWDGi7axuiN6CblRErcvnW9g0=;
        b=BbVfR6mxRcrCDsjl2xA6WsngtCj2qyX7IfpIVEeaCLcLetVbhJfcAMgMU7gpwWBCja
         /f9saOSOf+2wBxooWmuMH8a94ghEcqGeC6w6bWNeskJx6Es7c+9xLhxYi36QAzCfJAkA
         TOursqywqULOQfFSLLectDAMIS6wKFAOEbspyNT/z3OAdVX8I3jG8/3Kw2p+tErd9TTo
         ymjDWldRtsjQ1KdclUgUo8CnzpL6jU4UnZRBms3tuBZCQ6TGs3lilGM2n3fEnZ/fCz46
         tEFfGyXICXmwQHSqSJ/XBIaWxT/OjrUFU3mefQ3+QHJFg+0hS18EZEVbjqaOPzO+vXLS
         lGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714634011; x=1715238811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/eop79hcQEtCziVc8UWDGi7axuiN6CblRErcvnW9g0=;
        b=T0F+otUdxGbPfE+Q2Ltwyp1DkA2tHHYH5nw3PphsJvwFVHI9nxtYRo+x0PXE82FBxT
         iUEro/KpYCbfD/NHEoOJV7REWUSpm4wknhbk9Ow9toUvfeZfzZNu+2UAiPau9amvYhAM
         T6eZ6a6jiKOzKUGYz5n1BKlJJ5dmNxZ4MSwMyXP+VJmvmilU7ErsBQ98Grf1/Zw58ult
         BGsdEtJIKRX8spZjeSIXo9yfhMN9cQ93xmkOunReT5GWy9BKTbfQB3uMBjrpSm58AwM0
         vebm2F9ZGCmK46RZOJTY1ruxepvWw3a0tM6ZW1KrMJoVxNInxirjo1ebBzIvsSm76PyZ
         ODOw==
X-Forwarded-Encrypted: i=1; AJvYcCXjuhU6IoAYgVTnlm6mUP9vyMYzLaixo1EDCyQ1amSDkfgySurwF73k9Phzuq6DV+Cme/BBvlXOkL/TX449BtfNPBg3woQWWgNes1t2Qkk=
X-Gm-Message-State: AOJu0Yycdt15uMg/C/aWZbVFDOe/42A5sSMmpfqwUF9YGb252DzG+qqh
	HDnFO4FAbDC/wpngbXlPMvNOPDpIQ1y9QHZOhHTLmKtmxIEHHYUzSh0Mhqo/XA==
X-Google-Smtp-Source: AGHT+IEdOiCmd1C0VD738ZsOsEpZ13iJYrJXJWtv/5wZy5oeMQ4oTCM5NmPlgnC89bXZpM6CXq1gGA==
X-Received: by 2002:a05:600c:4f06:b0:416:8efd:1645 with SMTP id l6-20020a05600c4f0600b004168efd1645mr4014043wmq.7.1714634011199;
        Thu, 02 May 2024 00:13:31 -0700 (PDT)
Message-ID: <1bad8afa-68a5-4bb3-92ee-2daefd36fcb5@suse.com>
Date: Thu, 2 May 2024 09:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] xen/x86: Add topology generator
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-7-alejandro.vallejo@cloud.com>
 <c3b4bacd-47c8-403c-ab5c-7a3adf39eeeb@suse.com>
 <e17b2cb1-1482-46e1-844f-22be23a7190a@cloud.com>
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
In-Reply-To: <e17b2cb1-1482-46e1-844f-22be23a7190a@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.05.2024 19:06, Alejandro Vallejo wrote:
> On 26/03/2024 17:02, Jan Beulich wrote:
>> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>>> --- a/tools/include/xenguest.h
>>> +++ b/tools/include/xenguest.h
>>> @@ -843,5 +843,20 @@ enum xc_static_cpu_featuremask {
>>>      XC_FEATUREMASK_HVM_HAP_DEF,
>>>  };
>>>  const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
>>> +
>>> +/**
>>> + * Synthesise topology information in `p` given high-level constraints
>>> + *
>>> + * Topology is given in various fields accross several leaves, some of
>>> + * which are vendor-specific. This function uses the policy itself to
>>> + * derive such leaves from threads/core and cores/package.
>>> + *
>>> + * @param p                   CPU policy of the domain.
>>> + * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
>>> + * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
>>> + */
>>> +void xc_topo_from_parts(struct cpu_policy *p,
>>> +                        uint32_t threads_per_core, uint32_t cores_per_pkg);
>>
>> Do we really want to constrain things to just two (or in fact any fixed number
>> of) levels? Iirc on AMD there already can be up to 4.
> 
> For the time being, I think we should keep it simple(ish).

Perhaps, with (briefly) stating the reason(s) for doing so.

>>> +void xc_topo_from_parts(struct cpu_policy *p,
>>> +                        uint32_t threads_per_core, uint32_t cores_per_pkg)
>>> +{
>>> +    uint32_t threads_per_pkg = threads_per_core * cores_per_pkg;
>>> +    uint32_t apic_id_size;
>>> +
>>> +    if ( p->basic.max_leaf < 0xb )
>>> +        p->basic.max_leaf = 0xb;
>>> +
>>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>>> +
>>> +    /* thread level */
>>> +    p->topo.subleaf[0].nr_logical = threads_per_core;
>>> +    p->topo.subleaf[0].id_shift = 0;
>>> +    p->topo.subleaf[0].level = 0;
>>> +    p->topo.subleaf[0].type = 1;
>>> +    if ( threads_per_core > 1 )
>>> +        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
>>> +
>>> +    /* core level */
>>> +    p->topo.subleaf[1].nr_logical = cores_per_pkg;
>>> +    if ( p->x86_vendor == X86_VENDOR_INTEL )
>>> +        p->topo.subleaf[1].nr_logical = threads_per_pkg;
>>
>> Same concern as in the other patch regarding "== Intel".
> 
> Can you please articulate the concern?

See my replies to patch 5. Exactly the same applies here.

>>> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
>>> +    p->topo.subleaf[1].level = 1;
>>> +    p->topo.subleaf[1].type = 2;
>>> +    if ( cores_per_pkg > 1 )
>>> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);
>>
>> Don't you want to return an error when any of the X_per_Y values is 0?
> 
> I'd rather not.
> 
> The checks on input parameters should be done wherever the inputs are
> taken from. Currently the call site passes threads_per_core=1 and
> cores_per_pkg=1+max_vcpus, so it's all guaranteed to work out.

Hmm, and then have this function produce potentially bogus results?

> Once it comes from xl, libxl should be in charge of the validations.
> Furthermore there's validations the function simply cannot do (nor
> should it) in its current form, like checking that...
> 
>     max_vcpus == threads_per_core * cores_per_pkg * n_pkgs.

But that isn't an equality that needs to hold, is it? It would put
constraints on exposing e.g. HT to a guest with an odd number of
vCPU-s. Imo especially with core scheduling HT-ness wants properly
reflecting from underlying hardware, so core-sched-like behavior in
the guest itself can actually achieve its goals.

>>> +    apic_id_size = p->topo.subleaf[1].id_shift;
>>> +
>>> +    /*
>>> +     * Contrary to what the name might seem to imply. HTT is an enabler for
>>> +     * SMP and there's no harm in setting it even with a single vCPU.
>>> +     */
>>> +    p->basic.htt = true;
>>> +
>>> +    p->basic.lppp = 0xff;
>>> +    if ( threads_per_pkg < 0xff )
>>> +        p->basic.lppp = threads_per_pkg;
>>> +
>>> +    switch ( p->x86_vendor )
>>> +    {
>>> +        case X86_VENDOR_INTEL:
>>> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;
>>> +            for ( size_t i = 0; sl->type &&
>>> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
>>> +            {
>>> +                sl->cores_per_package = cores_per_pkg - 1;
>>> +                sl->threads_per_cache = threads_per_core - 1;
>>
>> IOW the names in struct cpuid_cache_leaf aren't quite correct.
> 
> Because of the - 1, you mean?

Yes. The expressions above simply read as if there was an (obvious)
off-by-1.

> If anything our name is marginally clearer
> than the SDM description. It goes on to say "Add one to the return value
> to get the result" in a [**] note, so it's not something we made up.
> 
> Xen: threads_per_cache => SDM: Maximum number of addressable IDs for
> logical processors sharing this cache
> 
> Xen: cores_per_package => SDM: Maximum number of addressable IDs for
> processor cores in the physical package

I'm afraid I don't follow what you're trying to justify here. Following
SDM naming is generally advisable, yes, but only as far as no confusion
results. Otherwise imo a better name wants picking, with the struct
field declaration then accompanied by a comment clarifying the
difference wrt SDM.

>>> --- a/xen/arch/x86/cpu-policy.c
>>> +++ b/xen/arch/x86/cpu-policy.c
>>> @@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
>>>  
>>>      p->basic.raw[0x8] = EMPTY_LEAF;
>>>  
>>> -    /* TODO: Rework topology logic. */
>>> -    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>>> -
>>>      p->basic.raw[0xc] = EMPTY_LEAF;
>>>  
>>>      p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
>>> @@ -387,6 +384,9 @@ static void __init calculate_host_policy(void)
>>>      recalculate_xstate(p);
>>>      recalculate_misc(p);
>>>  
>>> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
>>> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
>>
>> I don't think this should be zapped from the host policy. It wants zapping
>> from the guest ones instead, imo. The host policy may (will) want using in
>> Xen itself, and hence it should reflect reality.
> 
> Shouldn't Xen be checking its own cached state from the raw policy
> instead? My understanding was that to a first approximation the host
> policy is a template for guest creation. It already has a bunch of
> overrides that don't match the real hardware configuration.

No, raw policy is what comes from hardware, entirely unadjusted for
e.g. command line options of Xen internal restrictions. Any decisions
Xen takes for itself should be based on the host policy (whereas guest
related decisions are to use the respective guest policy).

Jan


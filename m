Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41E90C41D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 09:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742743.1149600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJStG-00018u-IY; Tue, 18 Jun 2024 07:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742743.1149600; Tue, 18 Jun 2024 07:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJStG-00016o-Fs; Tue, 18 Jun 2024 07:04:26 +0000
Received: by outflank-mailman (input) for mailman id 742743;
 Tue, 18 Jun 2024 07:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJStF-00016i-8U
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 07:04:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe3bd8cc-2d40-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 09:04:23 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so605253866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 00:04:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f756ee325sm364933566b.90.2024.06.18.00.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 00:04:22 -0700 (PDT)
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
X-Inumbo-ID: fe3bd8cc-2d40-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718694263; x=1719299063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aZiI4CDsGmd5XRSgfqrLfHXNyPqcl3hxH0aNxpnOtko=;
        b=bRfy5uYPUJmIBOL9ViyvLnUMo3S/J134X0YOsoifTOmGJvLUaZcRnwUc9uJ9LOQmrq
         Fmm0h/V+05mH9kKTqRrw8wYwqCdFtxa2OLqmn1bVx8eggNMjrSIaWhYKPpnooCdbMK+v
         ZZKSAu0Ws3fpc0fcqtIaCZQONHTZORfY6N7sgY0qd+UaM/H5F3qkjpaeHlvvzM1S+dku
         cePEn6jwYvAtbatwPzrXgHZscPGwZVMZi2HTUm+RuhgmW06VMeoTTfK8HumACl94Lf16
         8OCOMRWWVn4UFcdQUfsAebeBzh4Ppmsy0ZkQhAzyoRd9lGY8HwhAinUBzoEejfDBn9sc
         Y38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718694263; x=1719299063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZiI4CDsGmd5XRSgfqrLfHXNyPqcl3hxH0aNxpnOtko=;
        b=wNhxWMWoYW/toG5m9Wlr5BKB97j6sZWmXz5tPbrffeMR4L3GP5I8W5n7HvL2JeJLgp
         WIFvKSNC/3McgVRt0bFTGw+DHVzzPmL0ODpENlBHwq74qdDn0atKCE06fibkYLdMOPFD
         KrCnmcEcZG3IU8odxYvaDIK8UVClM703Ja2S9yrxBZF6upCGqFh+J4ZSIcjFTDsL4JwN
         8/vR5lephYSKo8rlBKTKQrosPHu1Mtf4cjOPnh7iIj4j3ZebSGaUbwesGOltNiLMLQsh
         Gkvoa6Bo8DOdK1Y+BXtYFIylll1lz4YBlQXz35LmZz+3QGnVusFuNhNX8dm90OTDSyUl
         zl4w==
X-Forwarded-Encrypted: i=1; AJvYcCW6yCDxby8FjkPF5MIvElpI2yEBm/hiqjrKUiXs0KlLV0Gkk/5sE6woKi4I3sRcda2lVABjoYo/EeBhKlFiPihLJRFZ4ZXbPVt3aUj6pDc=
X-Gm-Message-State: AOJu0YzDVlBy3D7QPNAmMd/cRNrTgWxGVNSgRPzk8X9auHt4xwZaeUdd
	k32c8GD0JGZtV0b68HnNx/lLYK0YqO3dG/XhVdZNJrVNKxLmoy9ZgB17L4qCyA==
X-Google-Smtp-Source: AGHT+IH2S5tn/jQwfkl8rTT2t3xFY9XCMvMCoIt5K0s8lYzmUpwWzODMSlbH5oPB4tdbJAIgfZrqTQ==
X-Received: by 2002:a17:906:4312:b0:a6f:1839:ed40 with SMTP id a640c23a62f3a-a6f60de267emr714277266b.73.1718694263206;
        Tue, 18 Jun 2024 00:04:23 -0700 (PDT)
Message-ID: <06b0f91a-bb5c-4053-a462-def054c68201@suse.com>
Date: Tue, 18 Jun 2024 09:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-4-andrew.cooper3@citrix.com>
 <8245f0ce-2964-4ecb-a31d-3e182a6d3e0b@suse.com>
 <6b4ed926-8934-4660-98c7-1856d0c90878@citrix.com>
 <cc1b52d8-163f-443c-8418-aba1c7d77ecb@suse.com>
 <af1419dd-c9bf-4f15-b2dd-c3883030d4f4@citrix.com>
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
In-Reply-To: <af1419dd-c9bf-4f15-b2dd-c3883030d4f4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2024 19:30, Andrew Cooper wrote:
> On 17/06/2024 11:25 am, Jan Beulich wrote:
>> On 14.06.2024 20:26, Andrew Cooper wrote:
>>> On 23/05/2024 4:44 pm, Jan Beulich wrote:
>>>> On 23.05.2024 13:16, Andrew Cooper wrote:
>>>>> This is a tangle, but it's a small step in the right direction.
>>>>>
>>>>> xstate_init() is shortly going to want data from the Raw policy.
>>>>> calculate_raw_cpu_policy() is sufficiently separate from the other policies to
>>>>> be safe to do.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Would you mind taking a look at
>>>> https://lists.xen.org/archives/html/xen-devel/2021-04/msg01335.html
>>>> to make clear (to me at least) in how far we can perhaps find common grounds
>>>> on what wants doing when? (Of course the local version I have has been
>>>> constantly re-based, so some of the function names would have changed from
>>>> what's visible there.)
>>> That's been covered several times, at least in part.
>>>
>>> I want to eventually move the host policy too, but I'm not willing to
>>> compound the mess we've currently got just to do it earlier.  It's just
>>> creating even more obstacles to doing it nicely.
>>>
>>> Nothing in this series needs (or indeed should) use the host policy.
>> Hmm, I'm irritated: You talk about host policy here, ...
>>
>>> The same is true of your AMX series.  You're (correctly) breaking the
>>> uniform allocation size and (when policy selection is ordered WRT vCPU
>>> creation, as discussed) it becomes solely depend on the guest policy.
>> ... then guest policy, and ...
>>
>>> xsave.c really has no legitimate use for the host policy once the
>>> uniform allocation size aspect has gone away.
>> ... then host policy again.
> 
> Yes.  Notice how host policy is always referred to in the negative.
> 
> The raw policy should be used for everything pertaining to the
> instruction ABI itself, and the guest policy for sizing information.
> 
>> Whereas my patch switches to using the raw
>> policy, simply to eliminate redundant data.
> 
> Except it doesn't.  The latest posted version of your series contains:
> 
> -static u32 __read_mostly xsave_cntxt_size;
> +#define xsave_cntxt_size (host_cpuid_policy.xstate.max_size | 0)

That's "x86/xstate: replace xsave_cntxt_size and drop XCNTXT_MASK", but
what I referenced in the context here is "x86/xstate: drop
xstate_offsets[] and xstate_sizes[]". If there use of the host policy
is wrong in your opinion, then can you please reply there to clarify
what's wrong with the justification for doing so? (See also below.)

> and you've even stated that I should have acked this patch simply on its
> age.

Well, it's not quite "simply on its age". Part of me thinks that our
rules should permit for things to go in when no-one looked at them
despite reminders, but the other part of me knows that then we'll move
back to what we had in the old days, where all kinds of (subtle or
supposedly obvious) breakage would be introduced. So it's more like
"considering its age, it really should have had replies". Anyway, there
was now a vague promise that this series is going to be helped make
progress in the 4.20 cycle.

> I acked the patches that were good, and you did committed them at the
> time.  Then I put together this series to fix the bugs the latent bugs
> which you were making less latent; this series really is the same one
> discussed back then, and really does have some 2020/2021 author dates in it.
> 
> 
> It is, AFAICT, not safe to move the calculation of the host policy as
> early as you did, without arranging for setup_{force,clear}_cap() to
> edit the host policy synchronously.  Recalculating a second time later
> isn't good enough, because you've created an asymmetry for most of boot
> between two pieces of state which are supposed to be in sync, and that
> you're intentionally starting to use.  So yes - while I do intend to
> eventually make the host policy usable that early too, I'm really not
> happy doing so in a manner that has "ticking timebomb" written all over it.

That's a fair concern. My counter argument is that right now the host
policy can't possibly be used ahead of when its calculated prior to
that patch (i.e. ahead of the 2nd calculation after the patch). Yes,
care will need to be taken (for the time being) to, between the two
points, only access parts which can't change again during the 2nd
calculation.

Considering the plans to invoke identify_cpu() earlier, it simply didn't
appear necessary to, transiently, change setup_{force,clear}_cap().

> As to xsave_cntxt_size, it can (and should) be eliminated entirely when
> xstate_alloc_save_area() can use the guest policy to size the allocation.

Again I'm confused, I'm afraid: xsave_cntxt_size isn't really used for
much guest-ish right now; its main use is in xstate_init(). Hence why
that other patch is replacing it by use of the host policy. Perhaps
you're simply suggesting that its present uses aren't quite right then;
as you say, that sole truly guest related use in xstate_alloc_save_area()
is there only because right now we need to over-estimate the eventual
size needed. For that purpose, host policy is the right thing to use, imo.
xsave_cntxt_size going away altogether at some point is no reason to,
transiently, switch it from being an actual variable to referencing the
host policy. It's just that if it can be made go away earlier, that part
of that other patch could then simply be dropped.

Jan


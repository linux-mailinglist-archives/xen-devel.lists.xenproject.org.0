Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A463BA71403
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927402.1330148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNK7-0007OF-QS; Wed, 26 Mar 2025 09:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927402.1330148; Wed, 26 Mar 2025 09:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNK7-0007MZ-NO; Wed, 26 Mar 2025 09:45:23 +0000
Received: by outflank-mailman (input) for mailman id 927402;
 Wed, 26 Mar 2025 09:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txNK6-0007MT-7u
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:45:22 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083ecf58-0a27-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:45:21 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so3500112f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:45:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9955fbsm16168155f8f.5.2025.03.26.02.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:45:19 -0700 (PDT)
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
X-Inumbo-ID: 083ecf58-0a27-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742982320; x=1743587120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YFHCbk4beyjRveupEah0jIYxfPLznuiZK5A/86Hhkfc=;
        b=eMp4U9hW0aaOJUF5+lRIsjt074p1qiQirGT8VLxoNG/RETPTEqRgu+193HiTiVb14q
         LdWz35kNBKUYrvrhnK2gHNJwl4JskgcN+yt4egmmjxLb5d2fZDR5CzedTcSHdNzLWr/J
         E+JlakwjSdqW92DOGrPCe5Vv+2ZlYD3cg8ZDS85SfklQjJBlaSCYqxa/hk3AS4JPN/zX
         DejkbGrDvyD6qoWcAzQALii4wrMCV2VBvmtGtzRj256dT98vB6Q4AqE29dufH+HspWzW
         mUcRM8CyruXpCwUuhOme5hiyUDu4U+DMk4ZNh4YNRqU6XG0TCA/cXaWCdOQzdRGT1veU
         F4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982320; x=1743587120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFHCbk4beyjRveupEah0jIYxfPLznuiZK5A/86Hhkfc=;
        b=HFk4bMTzwC5djBnr99Rx79YgYnM0NdJlXyqyM7LmKr5H4xtkFhJhI+4rKmM5Ir1K+i
         U1DdobrK6inWNwrq8hOImoSy/tmidDv+fRQgXOkI9JxfIvXEcxGltwjJQQWFELTvR5DX
         hTSd3RJUNkGFp6rQU2BBHa5CqmwtYC5nCReh4fDk+SclZN+fpolY1qCE2aKel7bOq+zl
         0LFwWeiAam/1g0rhNFd06Enr7zoRdNedx9i7T/f2ILHSNv0jJ9ws/KEGhhftyX3RIALp
         KY8Dw38jfVg4solUCjlAk5iVNHruZIRHTGdGxmNK+uN242MqqbQLLdrtOoKYw7dKutWa
         EWtw==
X-Gm-Message-State: AOJu0YxXHvnJt12ha+mZbWR2OeoY7QQgHoKcbA5tv9xOaKBtxoOk7rVG
	fmQ34E8VfBfJ+tCJGEWtH53WV2CeeJ/PefMDQkcBOyrDwQrVCJPCcahzQemDYA==
X-Gm-Gg: ASbGnctTfQfUua4iDd1Eb6+g/NaTNRYMCcqewAQ0ysTQPG9J3OFfLAI7fDdpHa6PG+5
	MLP9jtvk860mZf6NtWm8UD5q3+RGWvjs5u8b7ckEvt4mqRhERMF9MLyyPg7jB9fgP3OJ2VhcwAM
	p/isra7smM2Th36KtFDw9s72Q0QHJgne08a9J+o7Cm+E3zJ01TMajqXG2p9zpkWP8pumpMg/Nua
	pRtNBmgh4SipC/uC/Ld3QmjslsyR9oYy/Avv7yXpS7I1mjpr75zGiM5Yz7ttWCTD8FdwDuVI5pV
	O8j/bfm2u5t6xJkPbCIUFr0HAL6y/uFnFzlgWIub0ialNcpaaV1byMAca5ubL9cy9crd5XcePob
	FXhotCFdcdF/seeUInQnaYg234Yn1gD/fb9viNQnz
X-Google-Smtp-Source: AGHT+IExyjGivCnmQcKfZm/Af4J1LwEgEhABnxzbK1PmlGq59TEeTQT7rf24W94Sw1UxSEQkJSp+Xg==
X-Received: by 2002:a5d:6d08:0:b0:391:3261:ff48 with SMTP id ffacd0b85a97d-3997f92d06dmr20316139f8f.35.1742982320133;
        Wed, 26 Mar 2025 02:45:20 -0700 (PDT)
Message-ID: <59685c88-44c6-43fe-9f6e-1121d51fd76f@suse.com>
Date: Wed, 26 Mar 2025 10:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: expose OEMx ACPI tables to Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c9365d42-c15d-4d93-acd8-106ca46cb7f3@suse.com>
 <Z-PHJk8GT-y1NnHl@macbook.local>
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
In-Reply-To: <Z-PHJk8GT-y1NnHl@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2025 10:21, Roger Pau Monné wrote:
> On Wed, Mar 26, 2025 at 09:45:09AM +0100, Jan Beulich wrote:
>> What they contain we don't know, but we can't sensibly hide them. On my
>> Skylake system OEM1 (with a description of "INTEL  CPU EIST") is what
>> contains all the _PCT, _PPC, and _PSS methods, i.e. about everything
>> needed for cpufreq. (_PSD interestingly are in an SSDT there.)
>>
>> Further OEM2 there has a description of "INTEL  CPU  HWP", while OEM4
>> has "INTEL  CPU  CST". Pretty clearly all three need exposing for
>> cpufreq and cpuidle to work.
>>
>> Fixes: 8b1a5268daf0 ("pvh/dom0: whitelist PVH Dom0 ACPI tables")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Sadly the commit above says nothing at all about the criteria used by
>> which tables would want to be whitelisted.
> 
> I think at that point it was mostly an allow list that enabled me to
> boot PVH on the systems I was testing.  I don't think it was intended
> to be complete, but rather something that we would expand as needed.
> There where many and bigger missing pieces of PVH dom0 when that was
> committed.

To be frank, with that it was premature to declare PVH Dom0 fully supported.
This aspect also isn't mentioned in the caveats in SUPPORT.md.

>> Further tables on said system
>> which weren't blacklisted prior to that commit, yet which also aren't
>> whitelisted are DBGP, DBG2, FIDT, LPIT, MIGT, MSCT, NITR, PCCT, RASF,
>> SVOS, UEFI, WDDT, and WSMT. Even without diving into the details of any
>> of them it seems pretty clear to me that at least some would want
>> whitelisting, too.
> 
> I cannot find any reference about: FIDT, MIGT, NITR, SVOS and WDDT in
> the ACPI spec.

WDDT - Watchdog Descriptor Table (Table 5.6 in spec version 6.5)

> The MSCT I think we don't want to expose, as it's related to topology
> data.
> 
> Regarding RASF I would be slightly worried about the patrol scrub
> feature.  The memory map exposed to dom0 will be different from the
> native one, and there's also the interposed p2m.

Thing is - either kind of Dom0 needs to have a sufficient level of insight
into the host memory map to support memory-related RAS features. Which may
mean that RASF may only be exposed if the Dom0 kernel declares itself as
aware of the need to consider data there to refer to a separate address
space.

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -1010,12 +1010,20 @@ static bool __init pvh_acpi_table_allowe
>>              return true;
>>          else
>>          {
>> +    skip:
>>              printk("Skipping table %.4s in non-ACPI non-reserved region\n",
>>                     sig);
>>              return false;
>>          }
>>      }
>>  
>> +    if ( !strncmp(sig, "OEM", 3) )
>> +    {
>> +        if ( acpi_memory_banned(address, size) )
>> +            goto skip;
>> +        return true;
>> +    }
> 
> I may have put this ahead of the loop, so that the goto label doesn't
> go backwards (which always feels weird to me).

It felt odd to me to put it first; I'm almost always hesitant to add stuff
to the front of something that's already there, due to the possible
implication of "what I add is more important than what was there before".

As to label vs goto placement: It's the other way around for me. C wants
everything else declared before use. Hence I prefer to have labels appear
before their use. I'm actually puzzled by Misra not sharing that view,
and instead having Rule 15.2 (which we haven't adopted yet afaics) to
demand the opposite (and assuming Rule 15.1 is being violated in the
first place).

>> +
> 
> I wonder if additionally we should print tables filtered to dom0 here:
> 
> if ( opt_dom0_verbose )
>     printk("Hidden ACPI Table %.4s\n", sig);
> 
> So that it's more obvious which tables are not exposed.

I, too, thought about that, but assumed it may not have been done before
for a reason. Plus it would want to be a separate change anyway, imo.

Jan


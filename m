Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A605BA60BB0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914024.1319852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0Ta-0001wC-3N; Fri, 14 Mar 2025 08:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914024.1319852; Fri, 14 Mar 2025 08:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0Ta-0001uk-0Z; Fri, 14 Mar 2025 08:33:06 +0000
Received: by outflank-mailman (input) for mailman id 914024;
 Fri, 14 Mar 2025 08:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt0TY-0001tJ-Pl
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:33:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1843369-00ae-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:33:02 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1030023f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:33:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df3512sm5058086f8f.12.2025.03.14.01.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:33:01 -0700 (PDT)
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
X-Inumbo-ID: f1843369-00ae-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741941182; x=1742545982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nwBNWw9Yoa+2bqIsjD0tJzd3lQnt2MxGFLSRe/bpgrY=;
        b=IeuZA16nGh3btQtzarC6bJdvk+Z1TSmbd4I7UieG+YubDVfrSvp9EHmV8Yx8r0Uu/Q
         oaKwJ6kL9Gt/RRkaMS2I+4BQ5evcdtf5hcUYdS3CRo5pvH2yU2//dUa8+HHE02IC454S
         20M5uA4HdxajlHRbw2/e+5KqKl4hdPGWuoSjZHqkvgmBlymM4iikOSLVpoQILTkKe/rh
         YUArKDnDFwNJl56Vs0jxme9+K1VZzCr/x9F1OZDZY16LAtpKvljAwfd9ilAPte5Xx2Yg
         y9vGzbNZ//YQCXop2N8E68r+F6yfT8Czcff4PQk25BUmSSJ2rj6fEuW6ukTfn7D8fNy7
         y3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941182; x=1742545982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwBNWw9Yoa+2bqIsjD0tJzd3lQnt2MxGFLSRe/bpgrY=;
        b=bUen0r/KZfp4E6iv0y4CAjFZ3WBcClvEnlxShFAwfVVxbKsHreowBibZY93dY4W0NI
         fA9dxzpjFEMo/hzwOvHDXb86NYocyf+bJA9o2/BPamVgs0OsJfSNnFrk4Re6+yZmiufo
         jZST7ZnpMhftZZxjZKWp1jwoQZ5yS1MjtDUWR9WHIWcKGwUZ/CTtmLcFZyGA8xejravr
         4FsLMTutykyEC+ulQZstfo7p14TIy0YmauSb0YTBXAEeaNQyAx+KiI9LgzTZ1Bb5pgkd
         BYhDrHVRwOfwr/FM4Pbekh1BJXkHS3MXLRI1eqdweLg0nJhEjgS+SBn4m4ApkxtGtjnr
         zXeA==
X-Forwarded-Encrypted: i=1; AJvYcCVg7nehCz5GUEX4bT18vEnaP8IDJVP5wOGLIe/7PUfyvSTFRHMm30/Nd5bTvtA15ILmYoYL3eEj9U4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMsuf6jLk9Bziyvzek6aZ6KDFrDqJ6FH8l8+PtCcbigdTuSEmf
	p692TegCrLYweb+8iy83jtUHyrCoM3nqc0mKW2QWuZBLrO+lKlceWntXaRag1fO3p7e6GZbQ1sI
	=
X-Gm-Gg: ASbGncvxDgUhsodonI2zadHWpNcGSoc4UXS5dIk5Wu4UcbbOKG7Xxk9oIAKe9zdDCKb
	PnHu0bOcVNb4iDmowFmTI5r7Nub3Znx2MlgsuTyy29YFMuY5xQuhRBOXUXFe9WiMP+3IyaobgJF
	74UNajVJnnaXGNKGYHsAgSm2JyaVtYYNp48i8ktGRHOoNI6ahaVZKuvA+n1GC6WuH6x22hde1qg
	dMUlEaju1qHC6Xof0E0fvfBeqFhaiELXgwO3JFg6aiacTIMV8KCA0cREHlzxtZsPtv1eGUpY2Ip
	p6Lsjz3iLQB2nVV3zRrna3h60wu39F/aIswDjDa+/a+KleJcCAAjA0sHm6w7nsOZ/6uKoNxB8q9
	8jF2YQxFbQ001TVVV/gPl43+Amnz+FA==
X-Google-Smtp-Source: AGHT+IH3LFF91aKNRj9XkaVOf9J2HzBtCvgJYOTz+CWJoNtdam1wyjEg7c7ShBYNGnf9Wz8wpFrM6g==
X-Received: by 2002:a05:6000:470a:b0:391:9b2:f48d with SMTP id ffacd0b85a97d-3971e686fdcmr2238579f8f.33.1741941182048;
        Fri, 14 Mar 2025 01:33:02 -0700 (PDT)
Message-ID: <f5eb7710-c709-46a0-9821-bfc147d8cd53@suse.com>
Date: Fri, 14 Mar 2025 09:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/dom0: placate GCC 12 compile-time errors with
 UBSAN and PVH_GUEST
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-4-roger.pau@citrix.com>
 <eaf90340-929c-4c89-99cf-0383918e9d5a@suse.com>
 <Z9PobmG8lDy-oscG@macbook.local>
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
In-Reply-To: <Z9PobmG8lDy-oscG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 09:27, Roger Pau Monné wrote:
> On Fri, Mar 14, 2025 at 09:10:59AM +0100, Jan Beulich wrote:
>> On 13.03.2025 16:30, Roger Pau Monne wrote:
>>> When building Xen with GCC 12 with UBSAN and PVH_GUEST both enabled the
>>> compiler emits the following errors:
>>>
>>> arch/x86/setup.c: In function '__start_xen':
>>> arch/x86/setup.c:1504:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
>>>  1504 |             end = consider_modules(s, e, reloc_size + mask,
>>>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>  1505 |                                    bi->mods, bi->nr_modules, -1);
>>>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/x86/setup.c:1504:19: note: referencing argument 4 of type 'const struct boot_module[0]'
>>> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
>>>   686 | static uint64_t __init consider_modules(
>>>       |                        ^~~~~~~~~~~~~~~~
>>> arch/x86/setup.c:1535:19: error: 'consider_modules' reading 40 bytes from a region of size 4 [-Werror=stringop-overread]
>>>  1535 |             end = consider_modules(s, e, size, bi->mods,
>>>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>  1536 |                                    bi->nr_modules + relocated, j);
>>>       |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/x86/setup.c:1535:19: note: referencing argument 4 of type 'const struct boot_module[0]'
>>> arch/x86/setup.c:686:24: note: in a call to function 'consider_modules'
>>>   686 | static uint64_t __init consider_modules(
>>>       |                        ^~~~~~~~~~~~~~~~
>>>
>>> This seems to be the result of some function manipulation done by UBSAN
>>> triggering GCC stringops related errors.  Placate the errors by declaring
>>> the function parameter as `const struct *boot_module` instead of `const
>>> struct boot_module[]`.
>>>
>>> Note that GCC 13 seems to be fixed, and doesn't trigger the error when
>>> using `[]`.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/setup.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index 4a32d8491186..bde5d75ea6ab 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -684,7 +684,7 @@ static void __init noinline move_xen(void)
>>>  #undef BOOTSTRAP_MAP_LIMIT
>>>  
>>>  static uint64_t __init consider_modules(
>>> -    uint64_t s, uint64_t e, uint32_t size, const struct boot_module mods[],
>>> +    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,
>>>      unsigned int nr_mods, unsigned int this_mod)
>>>  {
>>>      unsigned int i;
>>
>> While I'm okay-ish with the change, how are we going to make sure it won't be
>> re-introduced? Or something similar be introduced elsewhere?
> 
> I'm afraid I don't have a good response, as I don't even know exactly
> why the error triggers.

One option might be to amend ./CODING_STYLE for dis-encourage [] notation
in function parameters. I wouldn't be happy about us doing so, as I think
that serves a documentation purpose, but compiler deficiencies getting in
the way is certainly higher priority here.

Trying to abstract this (vaguely along the lines of gcc11_wrap()), otoh,
wouldn't be desirable imo, as it would still lose the doc effect, at least
to some degree.

>  We will rely on the CI to start doing
> randconfig builds with UBSAN enabled (see patch 7/7).

Right. Just that randconfig is, well, random in what it covers.

Jan


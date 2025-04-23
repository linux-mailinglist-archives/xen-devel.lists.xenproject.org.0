Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50DFA98378
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964168.1355034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VX4-0005AM-Of; Wed, 23 Apr 2025 08:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964168.1355034; Wed, 23 Apr 2025 08:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VX4-00058I-Lx; Wed, 23 Apr 2025 08:32:38 +0000
Received: by outflank-mailman (input) for mailman id 964168;
 Wed, 23 Apr 2025 08:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7VX2-00058A-Uw
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:32:36 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81533b46-201d-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 10:32:34 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso3734145f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 01:32:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4e9esm18316889f8f.96.2025.04.23.01.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 01:32:33 -0700 (PDT)
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
X-Inumbo-ID: 81533b46-201d-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745397154; x=1746001954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p+1TVD9wtGPWwFF0saiIkE8CuvO573DOYJBruXjrX8Y=;
        b=HkKTguDmkyRA6KYi83yd2opalFUn+XDq2zShmQ61l2hZtTMnxS5VROAd0vYxBluMa1
         nlFspbievd18hJtUf50FifX+RAWFT0MBc8FB+o3X6hCBwlziF29FPt/VSXInJ8lMKSVA
         d+ZEOLcvTtRH9Iy8/0+4PoKXPsNcIevJvBqzNzc6N6chn96MS4mA0Enso2eVd0S6CJdT
         W1nLywTxPmVAVbADoa0tmfHKEs4zTFhpV8n9NemFnBvHKyPxl8Ed0l42SoVsTgPOJ5+z
         Wu8DmH0iZmjpjJFfA/pLV6ARSaa+aJAttXPtQXiAU58QSe/zyM0RUDbS2lLD+CN9imkC
         FJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397154; x=1746001954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+1TVD9wtGPWwFF0saiIkE8CuvO573DOYJBruXjrX8Y=;
        b=stBOUhiTMhikNihTspwAWp+BmG8wgXjOWEJpP+GiRbE4oX45CDpv/eBAhYf2q+0TgZ
         r17gfwNRUJOwrF1SFCOHWPMWFzKHIuwgCrMGwovC+3Dd1jO59AmV+3G1d43yyER4tZOX
         wQMu3cROyKakQi0UhjwPTkde3BnVPc5B4NRfw+OcnIdGOOsxkg3ePh5+ERz+YFvsB6HF
         GttEr6sivWwT6mLsnlP9ucK711VIUI755MZRl/YEmv1e7Z2nL3Sc05f6n/76U3Jklgoj
         voXgmJSfWtO23daUtG0nP90+RuABQd16O3zbQuUfor8hIbouCdy9yc2YI6vjZErxlemB
         a6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr1pOgZXUqwFdHM+mGTlkUsyXBaFZUSBxW7EblCXxjF/rF4MNPKflxtGmBIVkmkYXFq1U3J4d0x1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmUzrWhCjPEDd780DqXY/yr4BK1HBv5GG7Z+1MvQIcye4Xrt/p
	/YMUKNWUUAboY7GsjDRRY4VT/Rrw3TjZkG7tOVRZSNdAPbdWiXJ5ASHbf9fGAQ==
X-Gm-Gg: ASbGncsy6t8nqyT5UExR7UoOh546422g0k29ByJ5bk+1M2qnH6/PAGSv7Ss5tFgAitE
	yVYDvOT9TFqE07yfw+M7w8MB1ENHygp6IlhEDeUt2AVEkDYG1U56To5QYNWyo70+VUdA735POut
	RV1+lL2TwkgeIX0DG4AvhbrWn01hZw7zfCRwT82obVYZRwWTlw4yW1Vd21D8gmjlJDGuxgMolGm
	OvcvTaojH58yqCLPslGFpMfkhEh9sRD5RNHK7nKQ97qM0o3nRQSMX9cczVG/BXkiqrbmSuk2IFt
	bGt4Nk9gpHLZPIjFe4ujlVTu7P4SvVvfNE05/JLZa0FbkvKZOgRZuUBWYz98ovTU6Zi5HKJ1px0
	+h36c27qwjuVpMbKGO3HPNTZjTA==
X-Google-Smtp-Source: AGHT+IGGbZoyY/O5Tbi0W+RScjAUZwI8ZIr5ReUA+L14ny038KRg7vdhwC1ypKn5dZe53Un13Kf55g==
X-Received: by 2002:a05:6000:290b:b0:391:4999:778b with SMTP id ffacd0b85a97d-39efba5b7a9mr15074608f8f.28.1745397153949;
        Wed, 23 Apr 2025 01:32:33 -0700 (PDT)
Message-ID: <b63ff1ca-2752-44fe-8a32-0a721eec1abb@suse.com>
Date: Wed, 23 Apr 2025 10:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-3-roger.pau@citrix.com>
 <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>
 <aAErECZ1Ys-Nufon@macbook.lan>
 <32297a1f-418f-403b-9529-e9f2620e1279@suse.com>
 <aAijCvHMhGKYeSu9@macbook.lan>
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
In-Reply-To: <aAijCvHMhGKYeSu9@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 10:21, Roger Pau Monné wrote:
> On Tue, Apr 22, 2025 at 08:46:13AM +0200, Jan Beulich wrote:
>> On 17.04.2025 18:23, Roger Pau Monné wrote:
>>> On Thu, Apr 17, 2025 at 05:38:54PM +0200, Jan Beulich wrote:
>>>> On 17.04.2025 17:25, Roger Pau Monne wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/x86/hvm/mmio.c
>>>>> @@ -0,0 +1,125 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>> +/*
>>>>> + * MMIO related routines.
>>>>> + *
>>>>> + * Copyright (c) 2025 Cloud Software Group
>>>>> + */
>>>>> +
>>>>> +#include <xen/io.h>
>>>>> +#include <xen/mm.h>
>>>>> +
>>>>> +#include <asm/p2m.h>
>>>>> +
>>>>> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
>>>>> +{
>>>>> +    p2m_type_t t;
>>>>> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
>>>>> +
>>>>> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
>>>>> +           subpage_mmio_find_page(mfn);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * The guest has read access to those regions, and consequently read accesses
>>>>> + * shouldn't fault.  However read-modify-write operations may take this path,
>>>>> + * so handling of reads is necessary.
>>>>> + */
>>>>> +static int cf_check subpage_mmio_read(
>>>>> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
>>>>> +{
>>>>> +    struct domain *d = v->domain;
>>>>> +    unsigned long gfn = PFN_DOWN(addr);
>>>>> +    p2m_type_t t;
>>>>> +    mfn_t mfn;
>>>>> +    struct subpage_ro_range *entry;
>>>>> +    volatile void __iomem *mem;
>>>>> +
>>>>> +    *data = ~0UL;
>>>>> +
>>>>> +    if ( !IS_ALIGNED(len | addr, len) )
>>>>
>>>> What's the point of doing the | ? len can't be misaligned with itself?
>>>
>>> Hm, it's the same form that's used in mmio_ro_emulated_write(), I
>>> assumed it was to catch illegal access lengths, like 3.
>>
>> Oh, I see. But that's not using IS_ALIGNED(), and imo validly so, despite the
>> apparent open-coding. IS_ALIGNED() requires the 2nd argument to be a power of
>> two. The combined check there is folding the power-of-2 one with the is-
>> aligned one.
> 
> Do you think it's worth keeping those checks then?

Yes, I think we should be as strict as possible in what we (try to) emulate.

>  I could do:
> 
> if ( len & (len - 1) || len > 8 || !IS_ALIGNED(addr, len) )
> 
> As a possibly more complete and easier to parse check?

If you dislike the form mmio_ro_emulated_write() uses, sure. However, you
will want to check len to be non-zero, while I'm unsure you need to check
len > 8 - mmio_ro_emulated_write() doesn't have such. Albeit - perhaps
wrongly so; we'd end at the ASSERT_UNREACHABLE() in
subpage_mmio_write_emulate() if a wider store was used. I guess I ought to
make a patch there, and you want to keep the "len > 8".

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57034D22E3A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 08:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204188.1518931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgHwV-0008KD-L1; Thu, 15 Jan 2026 07:38:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204188.1518931; Thu, 15 Jan 2026 07:38:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgHwV-0008Hd-IK; Thu, 15 Jan 2026 07:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1204188;
 Thu, 15 Jan 2026 07:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgHwU-0008HX-FU
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 07:38:54 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a4c567d-f1e5-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 08:38:48 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so447860f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 23:38:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6fc8fbsm4006807f8f.39.2026.01.14.23.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 23:38:46 -0800 (PST)
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
X-Inumbo-ID: 3a4c567d-f1e5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768462727; x=1769067527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hw9nExakTAdhSF2n0j1ihoVsEt+bIL6JKWS08PbtWYw=;
        b=cmdrJcZlUCQyGBFFND06/aTjlXZOC7SOG0G+VBzbbi2GKncreJWeQtK6Sr/fLLhTzk
         ozZTW34oQaHblDmdfg7g8JbUt4MT1mIxfs3b0kQSsYrH+tW5811EEtNfzySmjLhiRXax
         IPhJg37SSby2GSDt93LYw9gCGs59/YthTbwJnfJWfr912XKF3MII8Mr8ReeRgIX/q9zs
         g5j5sZvCbJlU+s8nS7Ru6DcFBUPjvhqOrjc4FUx0hifROLn+54MengVQQdjqC8gUg/JR
         sIpxfbTv2kOymtVjY5T79UpBKd6T8/cow3M0iEN+Oq4huFv7yfEgODWuLkRUrsb2atrO
         68dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462727; x=1769067527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw9nExakTAdhSF2n0j1ihoVsEt+bIL6JKWS08PbtWYw=;
        b=onyFq6F2RqiIil9OoCCTLGXppwdyxdhoxbhM6N6g3smeeVbHM9SHH9uWE0BEIH6Dqq
         6KPDWWgEu6Nu51xaStme3uRmQa3twOW/+fuMCh7f/cIbqzCmnpq29GQk3KoW4X/Sl92G
         HL+G+Tp3FUzPT+w8Kd0YEITNn//xTGH47P8SUZ37LCVTJntT/9zkmeXLdF6GlnsGUBIu
         XO9B/r9vI556rhWt6vAi2mJqq+97kxetAn8y+qs3R80OJWYPXzaYuRrg3Ss/KFf7+mUB
         lhvi94L5sfQAQNszCm9iQq4F9f7PjgYz5W+CNS6X8lLteEjsQd9m2slgr+18DQIPBW0+
         MslQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMRN/nKacaTwf5Sr6+rJH677QLW80AW0pY+Fsyxpb4+3iXf8fq8CRl41Q5+HaDkYzVP6HDiHAkg+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKyr7KzpkT1dh1XRf3zNx+VMbLOwoleElhSI/3DC7el8rbRhtu
	h9UnAi89htONnCyz6ntxw/v0z6iKViBqWYv/lbgNI8P+zyKnvyrmdL/+643tXHNOpA==
X-Gm-Gg: AY/fxX6BTf0AIFUe3mJ62a6Z4VlNLVEYyHbbfQrrnD13oTXGQlpsEf5yuMDBfVR+xbG
	Riw2tfxFlZmT1ujkGZeZoWNOg0srmwRP0ZTEUaFN0Qj21Rixz0O68UXuMqMlEbejRheaxjBYrY0
	HTP26mZ7JukmTF+6nhtGusoYVo0p6+gq0w/g5WiHJwLtEDCn++qv/fCDHhHzXr442qHTbGMH94a
	1M4aEfUudf+rz2RHhSX0GCNeZDuCNdDSmBqdwg/4MH+9Da4fUsGIkntfSHWv/sepjLAjGhjEihi
	Y3mcYGUcN2op9gWQbAGV2+n9G8vwH+1Mlc7up0867zWRwZmB9Y5A9el8ZfA2mcj/AVKx2UwwDWN
	+4ddQeGDEAoglLW2mTzaoBKqV+9/2qATR8Nx8sTOtSvA9NTNHK7f0UhVXJrEPrJg0gizVhIB119
	GgeJw2ptIAlH0FGYTZL1aW/RuK1EiQuDTrFeMHydSONvBwCyeu/SCzujAicQP2+A7Ib79VuvIzC
	mg=
X-Received: by 2002:a05:6000:2010:b0:431:344:5a2d with SMTP id ffacd0b85a97d-4342c543b74mr5852965f8f.41.1768462727052;
        Wed, 14 Jan 2026 23:38:47 -0800 (PST)
Message-ID: <c3667666-c1b8-4fd6-a1ef-3bf67d61844c@suse.com>
Date: Thu, 15 Jan 2026 08:38:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] x86/cpu-policy: define bits of leaf 6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <4d3a3576-2d3c-42ec-8551-18f1f0982e17@suse.com>
 <bc01618c-149c-4a70-996e-5364655b4ab5@suse.com>
 <28910a0e-c6f3-41dd-9a0b-8289218562a0@vates.tech>
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
In-Reply-To: <28910a0e-c6f3-41dd-9a0b-8289218562a0@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2026 17:55, Teddy Astie wrote:
> Le 14/01/2026 à 14:45, Jan Beulich a écrit :
>> ... as far as we presently use them in the codebase.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Or should we make both parts proper featureset elements? At least
>> APERFMPERF could likely be made visible to guests (in principle).
>> ---
>> v3: Use SDM-conforming names. (Sorry Jason, had to drop you R-b once
>>      again.)
>> v2: Use bool and unions.
>>
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -121,7 +121,46 @@ struct cpu_policy
>>               uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>               uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>               uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>> +
>> +            /* Leaf 0x6 - Therm/Perf. */
>> +            union {
>> +                uint32_t _6a;
>> +                struct {
>> +                    bool :1,
>> +                        turbo_boost:1,
>> +                        arat:1,
>> +                        :1,
>> +                        :1,
>> +                        :1,
>> +                        :1,
>> +                        hwp:1,
>> +                        hwp_interrupt:1,
>> +                        hwp_activity_window:1,
>> +                        hwp_epp:1,
>> +                        hwp_request_pkg:1,
>> +                        :1,
>> +                        hdc:1,
>> +                        :1,
>> +                        :1,
>> +                        hwp_peci_override:1,
>> +                        :1,
>> +                        :1,
>> +                        hw_feedback:1;
>> +                };
>> +            };
>> +            union {
>> +                uint32_t _6b;
>> +            };
>> +            union {
>> +                uint32_t _6c;
>> +                struct {
>> +                    bool hw_feedback_cap:1;
>> +                };
>> +            };
>> +            union {
>> +                uint32_t _6d;
>> +            };
>> +
> 
> While I'm ok for the a and c unions, I'm not convinced by the b and d 
> ones (union with just a single uint32_t in it) as it's quite verbose and 
> inconsistent with the rest of the cpu_policy structure.

Indeed for them I wasn't quite certain. I could drop the union wrapping
for now (until individual fields appear), yet then I'd again be on the
edge: Use

            uint32_t _6b;

or

            uint32_t :32;

? Both have their pros and cons. Hence why I went with consistent layout
for all 4 fields. If there was a clear majority preference for either of
the above, I'd be fine to switch.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FABD85F66A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 12:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684353.1064172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6qO-0007QL-Gp; Thu, 22 Feb 2024 11:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684353.1064172; Thu, 22 Feb 2024 11:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6qO-0007NW-E6; Thu, 22 Feb 2024 11:02:24 +0000
Received: by outflank-mailman (input) for mailman id 684353;
 Thu, 22 Feb 2024 11:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd6qM-0007NO-Q5
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 11:02:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da06ca89-d171-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 12:02:21 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so1107493566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 03:02:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907874300b00a3e4efbfdacsm4928763ejc.225.2024.02.22.03.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 03:02:20 -0800 (PST)
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
X-Inumbo-ID: da06ca89-d171-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708599741; x=1709204541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vng0Xhu5bNeOx6NGjpq55auRrEyg23sjRCgd8WKvvMg=;
        b=D3d947bjLSCDRFJp0PjUe3qBiOUqLVbfq/eRjWfoNFasXD/arHUyxWywqWd1mcJOYC
         8YwOZxMu328pOVu8F+ZzPxv9F8koPgjm1X9EctW4l4F08KtohW/ImZpOPPOdmO5Miwda
         94Gw1jA8vp4WZLiREn7HbzIibyAWqJNkFOhBhRJjzjYvQ63+LlLMmFAHfXxXsk+u6c7t
         qDNqzrMDyllxO3EbuXnLA8Eejy1u9J7e/PVnqHlCtZZS5lxBZxAM0dBe8xb/d5fb1Mnv
         MuS+SOtgHYly4kxkZ87cr/6vLVGF4jitL5tADPds5LNdfGOJXGrX4aHVFAWk3TkEcnHW
         lUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599741; x=1709204541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vng0Xhu5bNeOx6NGjpq55auRrEyg23sjRCgd8WKvvMg=;
        b=qdnags2fXsx/OQJAH2UVI8CCcvGh/u4JbXGWd/0EM2L45r/wAm6uYPUf8dDs/MVykr
         +93eCbeI0CUDCs+MuFhNcNu5uOVhtX80rD3p9N3JjlG5nR51bxiNkp6xfpQJ9TJs/eyk
         iRs8ucW6OEM+5G6/N2MkPRMVLbi8x9JIJcYkoEqhQcQfJ1DX5IjLeQMdnAkdNlDnHqQz
         Ok6dPmyOD87CHgpO7gosboymuMsZt+UL74NVwYUQBbXV/NogcKv62U1ISNBhln3zLhtH
         rE/jaUXftX52xuCCpckhLNKl2woESZhoFUXrC54XkqxrnotNaAoE0Za/ouVAM2P2q8OQ
         ltZA==
X-Forwarded-Encrypted: i=1; AJvYcCVkjjFSL2KvrZ2opZehkElQDeVpx4HKg+OOvOi8Yp37Kt7I3LadZ4VCQpSFogqEk8FQcvtez5ULIairRKql0vRXmNTY5pTKlnWfQB1xIzk=
X-Gm-Message-State: AOJu0YzQpDigxl3nFJF4az7Q1UkWBN8UtGZXK3tjT6pYeh2Z79zfxzXc
	5wSjsA1BEu+xBC2aFz1q4EwrjQA8JoHHFeEC0jOHGa0nFIsmrnNsqpe6D4Po/GQcaaxYuv/MzAA
	=
X-Google-Smtp-Source: AGHT+IHCYhqrTEY4kmjioazyb++vPy/MGjCzH1ocMcr+yH6ScBeRCLt617o1eI7vjDoDJNZw74xhyg==
X-Received: by 2002:a17:906:b796:b0:a3f:33c5:ffb5 with SMTP id dt22-20020a170906b79600b00a3f33c5ffb5mr3077706ejb.76.1708599741094;
        Thu, 22 Feb 2024 03:02:21 -0800 (PST)
Message-ID: <ca9b7c65-cd75-4fb0-b6a9-93fe62c03de5@suse.com>
Date: Thu, 22 Feb 2024 12:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hpet: use an atomic add instead of a cmpxchg loop
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-3-roger.pau@citrix.com>
 <d37335f7-ae3c-4dc8-854a-625df275f5da@suse.com> <Zdco8nMu2N4WDWwx@macbook>
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
In-Reply-To: <Zdco8nMu2N4WDWwx@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 11:58, Roger Pau Monné wrote:
> On Thu, Feb 22, 2024 at 11:10:54AM +0100, Jan Beulich wrote:
>> On 22.02.2024 10:05, Roger Pau Monne wrote:
>>> The usage of a cmpxchg loop in hpet_get_channel() is unnecessary, as the same
>>> can be achieved with an atomic increment, which is both simpler to read, and
>>> avoid any need for a loop.
>>>
>>> Note there can be a small divergence in the channel returned if next_channel
>>> overflows, but returned channel will always be in the [0, num_hpets_used)
>>> range, and that's fine for the purpose of balancing HPET channels across CPUs.
>>> This is also theoretical, as there's no system currently with 2^32 CPUs (as
>>> long as next_channel is 32bit width).
>>
>> The code change looks good to me, but I fail to see the connection to
>> 2^32 CPUs. So it feels like I'm missing something, in which case I'd
>> rather not offer any R-b.
> 
> The purpose of hpet_get_channel() is to distribute HPET channels
> across CPUs, so that each CPU gets assigned an HPET channel, balancing
> the number of CPUs that use each channel.
> 
> This is done by (next_channel++ % num_hpets_used), so the value of
> next_channel after this change can be > num_hpets_used, which
> previously wasn't.  This can lead to a different channel returned for
> the 2^32 call to the function, as the counter would overflow.  Note
> calls to the function are restricted to the number of CPUs in the
> host, as per-CPU channel assignment is done only once (and the channel
> is then stored in a per-cpu variable).

That's once per CPU being brought up, not once per CPU in the system.

> Feel free to adjust the commit message if you think all this is too
> much data, or too confusing.

I'll simply drop that last sentence then, without which
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


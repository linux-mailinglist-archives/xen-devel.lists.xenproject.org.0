Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD98C560E
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 14:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721471.1124905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rLQ-0005Zv-El; Tue, 14 May 2024 12:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721471.1124905; Tue, 14 May 2024 12:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rLQ-0005YG-Bm; Tue, 14 May 2024 12:33:24 +0000
Received: by outflank-mailman (input) for mailman id 721471;
 Tue, 14 May 2024 12:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6rLO-0005YA-Vm
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 12:33:22 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 267732e7-11ee-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 14:33:21 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-573061776e8so26546a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 05:33:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bfe2dd1sm7456691a12.58.2024.05.14.05.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 05:33:21 -0700 (PDT)
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
X-Inumbo-ID: 267732e7-11ee-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715690001; x=1716294801; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5YH4ZxQAJt8PMf0AVNDdRHjXLnrivmrZJoJ5IFdocU=;
        b=D7yn3UMhtXgiwk5uHEghFEA98IU1iN2j1kkozGZ7RJC620DHFkmDBdtZEfeygnNewp
         zutst37Vg/JgPADQAIHvqcvJ0RXCz8YcZMEcGxj8zDoMqjLBq+IvkWBEPLn6RXCrwhll
         7IcUcLfZCN2XotVlm1mjLCSqxO+cJ2/FEiacHoiYC1R5jfBaOBZVbh4nQscZSs/8chu+
         D12BQiG6FwaefCDvhisWDhz1+IMTpz6luOQ50PVAztGkKpKC7oS+vrmeZ5/Qe/bliZ9M
         mygipoT6ZTsU2O++ky+M8xVgFcqkszCqZkCitgJEXtVpsYQ0gkrXFXHpOstFxiISpI3s
         G0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715690001; x=1716294801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5YH4ZxQAJt8PMf0AVNDdRHjXLnrivmrZJoJ5IFdocU=;
        b=w+k6zwX5P0nYCQwN2nsGnfmKFH+PGsSXTWU3S0/S/9qtw6FAcvxkMN376Ym67LEHgw
         j/nD89CyZnQl28h8H2YHditqEfd3MM+3ucgWomf93SAdNC8OE1ItRy5JwbubmJOH+lAq
         6JWJUm2Xd0Tj9LwIs4x/mjWWB5fCxqnweKRg4Ols6WD/EOnDB4PTdpvoLVpLIt2rZCfk
         QbH9wDi7DUEBwO4jGl7IhhKgMSq+Cof255lj7O+Ww64ORftHY7PANBh2eCstEZgkE3y5
         6Uyho7oKZNAf3gREM8VYw87Hl/O+FCO9EhHuXcEOwGTCClz0krEAlmX/qzMtjaK6+dCK
         Of5g==
X-Gm-Message-State: AOJu0YwRlsN94uODiYSfe6AL/z4ZmQUHV99/v0E7JayzYsthnyXyPVLT
	IJm4vOj5yt20nUeT4TLvVItrcFTNFg2lE5XrrHDxaAzxm+QPAMbS/HYWxpm39w==
X-Google-Smtp-Source: AGHT+IGUbecmSAF5qaakNoPYwcdtRY4JPWgSypwTu9mQ2uoVDTBXyZa3iH7y1M2sqcnXvDmvQAiFKw==
X-Received: by 2002:a50:a417:0:b0:570:5b70:d76d with SMTP id 4fb4d7f45d1cf-5734d67aacamr8697555a12.28.1715690001300;
        Tue, 14 May 2024 05:33:21 -0700 (PDT)
Message-ID: <9807f36e-429d-4ebf-ae48-3f216330fd41@suse.com>
Date: Tue, 14 May 2024 14:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
 dwmw@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Elias El Yandouzi <eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-8-eliasely@amazon.com> <ZkMxgDPYgaKnmRRE@macbook>
 <87950da7-f765-4656-808f-6c63a29ced3d@suse.com> <ZkM7SK8U1Qsk7E3x@macbook>
 <90621115-e370-49a1-b272-d20f861d6137@suse.com> <ZkNQVh-N9UUPxD7F@macbook>
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
In-Reply-To: <ZkNQVh-N9UUPxD7F@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 13:51, Roger Pau Monné wrote:
> On Tue, May 14, 2024 at 12:26:29PM +0200, Jan Beulich wrote:
>> On 14.05.2024 12:22, Roger Pau Monné wrote:
>>> On Tue, May 14, 2024 at 11:43:14AM +0200, Jan Beulich wrote:
>>>> On 14.05.2024 11:40, Roger Pau Monné wrote:
>>>>> On Mon, May 13, 2024 at 01:40:34PM +0000, Elias El Yandouzi wrote:
>>>>>> @@ -53,6 +55,8 @@ enum fixed_addresses {
>>>>>>      FIX_PV_CONSOLE,
>>>>>>      FIX_XEN_SHARED_INFO,
>>>>>>  #endif /* CONFIG_XEN_GUEST */
>>>>>> +    FIX_PMAP_BEGIN,
>>>>>> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
>>>>>
>>>>> This would better have
>>>>>
>>>>> #ifdef CONFIG_HAS_PMAP
>>>>>
>>>>> guards?
>>>>
>>>> That's useful only when the option can actually be off in certain
>>>> configurations, isn't it?
>>>
>>> My comment earlier on this patch suggested to make CONFIG_HAS_PMAP be
>>> selected by HAS_SECRET_HIDING, rather than being unconditionally
>>> arch-selected (if that's possible, I certainly don't know the usage in
>>> further patches).
>>
>> Right, but in patch 6 HAS_SECRET_HIDING is selected unconditionally,
>> which would then also select HAS_PMAP. If, otoh, HAS_PMAP was selected
>> only when SECRET_HIDING (or whatever its name is going to be), then an
>> #ifdef would indeed be wanted here.
> 
> Oh, indeed, I was meant to tie to SECRET_HIDING and not
> HAS_SECRET_HIDING.  I have to admit (as I've already commented on the
> patch) I don't much like those names, they are far too generic.

And I commented to this same effect on v2 already, without being heard.

Jan


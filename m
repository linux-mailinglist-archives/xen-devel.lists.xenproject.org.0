Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA4829C86
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665528.1035726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZYt-0007s1-3K; Wed, 10 Jan 2024 14:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665528.1035726; Wed, 10 Jan 2024 14:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZYt-0007qS-0C; Wed, 10 Jan 2024 14:28:07 +0000
Received: by outflank-mailman (input) for mailman id 665528;
 Wed, 10 Jan 2024 14:28:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNZYr-0007qM-5d
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:28:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76bc84eb-afc4-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 15:28:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e5508ecb9so13245565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:28:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e30-20020a5d595e000000b0033776a50472sm4046555wri.10.2024.01.10.06.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:28:03 -0800 (PST)
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
X-Inumbo-ID: 76bc84eb-afc4-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704896883; x=1705501683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDzqTAl4diuv1EG4IwpVz89zKVt9xJK8wnRLqqkh1jM=;
        b=DYUhHBKiQIc55BWBZcHzRxaKHOmw7x7mkhjdEebga/jWU2NGBdobXD4j7MkFO4tyKp
         Z6JDWG3f+Y9m16I5Ns5nmr/GrgV2O97Koh8elGbtdBIJnDVnR6vZ0vE6/QVhPO3pYstM
         F/OoUGNTHT2Jt6tZZaWTjjhw04lim7xalx+bIuXN3dPqzBiHjROZwYXpGd2L8hUsFuBF
         Zxk6ZQI56w2st59V6Cl3uEVp5ERC/2HqgCZG/fuUIlGet+kYLPySCXE885UoRTbsMNx+
         6BGIzKWUxP4q2SMf+6/wPA/CfOaxaBs1QwN6eBrJ4HZ0wEJ+y5NsMIYCKXSNTVw+q5t+
         WAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896883; x=1705501683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDzqTAl4diuv1EG4IwpVz89zKVt9xJK8wnRLqqkh1jM=;
        b=I+OZpmtTsl8IdaoSHWP8MuXdJ2IqUI7imVCeBMD52f+U/Lxb8khHlCBP2SHG0UW0Nv
         MKgc808pttk5OC68PpTpLOCL2g1JfpsxVPEIycrJfrp8aL2TJzQ1dm2LlZsisKbV/cW+
         STBB70jj2mG17xKcixWeqexKN2e0NgPyt2CfDuUg4N3+q27LiYqBKwq+idzBvOWAOn3Z
         kfWbNdrqnoWXbqbbZ8wKrxwarbHpkmqzE+O6cjDR9lDDXCxz5GCilu9lrzX2t2W4RtPs
         YqkQ4yfOryUp/PQcgwMLMXy00GyIXze9cNUAiUoIJNfea0/mqbscjYuTDTWtxsFBl4tR
         smCA==
X-Gm-Message-State: AOJu0YzzBI4Gb/KzGBoSojaheNnuWGOBMmBEP1q1eThSTFG3QsXE5BUC
	W6bmE0DR1cuRjh+hWPOM880ubGIMTQi7
X-Google-Smtp-Source: AGHT+IERVX0BD2KQkkT8Z3qD/brgt4Z4JzCTwrEhzbPFrF8lPhK81pdFn4oRel57OgHIWmyR3hDr0w==
X-Received: by 2002:a05:600c:3107:b0:40c:610d:c2bf with SMTP id g7-20020a05600c310700b0040c610dc2bfmr651949wmo.16.1704896883211;
        Wed, 10 Jan 2024 06:28:03 -0800 (PST)
Message-ID: <5c1844d7-162b-430e-a054-274233d8982e@suse.com>
Date: Wed, 10 Jan 2024 15:28:02 +0100
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
 <495da94f-4eff-4098-9f65-b056251704b0@cloud.com>
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
In-Reply-To: <495da94f-4eff-4098-9f65-b056251704b0@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2024 15:16, Alejandro Vallejo wrote:
> Review-to-self after running in Gitlab:
> 
> On 09/01/2024 15:38, Alejandro Vallejo wrote:
>> +    p->basic.lppp = 0xff;
>> +    if ( threads_per_pkg < 0xff )
>> +        p->basic.lppp = threads_per_pkg;
>> +
>> +    switch ( p->x86_vendor )
>> +    {
>> +        case X86_VENDOR_INTEL:
>> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;
>> +            for ( size_t i = 0; sl->type &&
>> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
>> +            {
>> +                sl->cores_per_package = cores_per_pkg - 1;
>> +                sl->threads_per_cache = threads_per_core - 1;
>> +                if ( sl->type == 3 /* unified cache */ )
>> +                    sl->threads_per_cache = threads_per_pkg - 1;
>> +            }
>> +            break;
>> +
>> +        case X86_VENDOR_AMD:
>> +        case X86_VENDOR_HYGON:
> 
> Missing braces around the INTEL block due to the variable declarared
> there. I'll include that in v2 after the rest of the review comments
> come through.

And (just looking at the fragment above) too deep indentation as well.

Jan


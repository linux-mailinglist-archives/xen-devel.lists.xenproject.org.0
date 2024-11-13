Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1FA9C6E8B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 13:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835517.1251386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBC4w-00052Y-7o; Wed, 13 Nov 2024 12:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835517.1251386; Wed, 13 Nov 2024 12:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBC4w-00050G-4R; Wed, 13 Nov 2024 12:02:34 +0000
Received: by outflank-mailman (input) for mailman id 835517;
 Wed, 13 Nov 2024 12:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBC4u-000506-Oa
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 12:02:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c5546e-a1b7-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 13:02:29 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4319399a411so64719895e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 04:02:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970e23sm18103988f8f.18.2024.11.13.04.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 04:02:28 -0800 (PST)
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
X-Inumbo-ID: 27c5546e-a1b7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3YzU1NDZlLWExYjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk5MzQ5LjIxNjgwMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731499348; x=1732104148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RRKzwpnMHSEqbegF5vRDNZdYVHu3zdqL2rj6cftfnB4=;
        b=BkpTrn89eQIN0UsdVr9NPI/hq0T/1RSzdRYQQL0rpCGQXJCUDKwFChcvUY0FY9Cxxv
         UYooPAkB6ZtIVj7unB576jN6B+aF4lQxIIpQ3Lk1eBub/QjfyaqvFAKDmlQx7Le4BN4O
         wy1YQoJHo1tuH53aoUo7yIkwvnDxQwoismjFtus/mRdfIvb8rCaEQezOcRNqBqSVIARf
         XQzjH36Q8coqjkX9ASCszMSMBQkK3B78TmS/S9OD9jKnj8XgnnZ75BAi3TF2Bhmvz/Ze
         fqrmqQZ5LGalPZPd9msIGaaHUFe4tQLnxzs3psi9CbqzVAwdvdc4HA4KjU2VYhCwATJC
         Fc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731499348; x=1732104148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRKzwpnMHSEqbegF5vRDNZdYVHu3zdqL2rj6cftfnB4=;
        b=Q/ShAErhb+j4ehYpJdk9g/eO3flcGeZUXoann8wg05dz/ZJfxoc37CPW94huPp9666
         3IrBgttpdLTVRWOFqv+IpInn8/Ge3m/z8d9cjyGC1It/gZLuF6SL+FQ/rJQIk6d1bnzF
         N0rH/LLEMSjq9asz9s9jZHm4J6JdCA2UjWtrFlnBIJBaAHoUdUdVRdrTSbV/KxO4jMuy
         UtaN32Lmfj6gebaJN2t4ns/doa8HrE65G/1hnzk+f2NrBPgigD2WVdYk1up4sLbJC7kH
         +/vrzp9w2lpQXaNEvIZKQg/GGkRyVsMDqrzFOypuGi14imylBQLHsjDcKCM5YLrTOQA5
         L2mg==
X-Forwarded-Encrypted: i=1; AJvYcCXovr37/hxkbzqNe2AeZzHZd6lNltsgWJIjVzzxZeqnLtQyNgP/2C6eLSPvmgbfHlvA4uaeMRTuJzg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYi+rxhfkEBVvMgArxLXV8YWA5FNN9zNGAwPHXLFAvo42PRFJ1
	U1U/CGMXd/1mfoqXZ0RwSy6g5oGwZQotcQTcLsm0yU12kmRa/Gg1JfRRS5cnWg==
X-Google-Smtp-Source: AGHT+IG9+KdO//sEPb/jrmzg1URuwgNp8c1CxhA/syaADOSgExsqciDzOSOocfpzxQ8vvC8WrTzldQ==
X-Received: by 2002:a5d:6c6d:0:b0:37d:51f8:46fd with SMTP id ffacd0b85a97d-381f186dfcemr16326682f8f.22.1731499348593;
        Wed, 13 Nov 2024 04:02:28 -0800 (PST)
Message-ID: <f87a403a-0664-4383-8ce0-70d5a78bbefd@suse.com>
Date: Wed, 13 Nov 2024 13:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/trampoline: Rationalise the constants to describe
 the size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-3-andrew.cooper3@citrix.com>
 <8217032f-c5ec-4f93-b69f-42ceeae06073@citrix.com>
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
In-Reply-To: <8217032f-c5ec-4f93-b69f-42ceeae06073@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 12:36, Andrew Cooper wrote:
> On 13/11/2024 9:30 am, Andrew Cooper wrote:
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 7930b7c73892..9d3f2b71447e 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -633,7 +633,7 @@ static void __init efi_arch_memory_setup(void)
>>      if ( efi_enabled(EFI_LOADER) )
>>          cfg.size = trampoline_end - trampoline_start;
>>      else
>> -        cfg.size = TRAMPOLINE_SPACE + TRAMPOLINE_STACK_SPACE;
>> +        cfg.size = TRAMPOLINE_SIZE;
> 
> Something I forgot to mention.
> 
> The EFI_LOADER side of this conditional means that the heap isn't valid.
> 
> This includes modelist, vesa_glob_info and vesa_mode_info from video.S,
> but I can't find where they're used at all.

If nothing else, then iirc to hand (whole struct) to Dom0 upon request.

Jan


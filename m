Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F83B1E665
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 12:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074227.1436895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKDG-0000gE-Go; Fri, 08 Aug 2025 10:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074227.1436895; Fri, 08 Aug 2025 10:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukKDG-0000dl-Dj; Fri, 08 Aug 2025 10:20:38 +0000
Received: by outflank-mailman (input) for mailman id 1074227;
 Fri, 08 Aug 2025 10:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ukKDE-0000df-P6
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 10:20:36 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5252e039-7441-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 12:20:35 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-617b36cc489so3791866a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 03:20:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9115562sm13556169a12.59.2025.08.08.03.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 03:20:34 -0700 (PDT)
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
X-Inumbo-ID: 5252e039-7441-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754648434; x=1755253234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=21kcGoK8EU0vLgx4YF/BuAadgiyc9oojaTg6aDJcko0=;
        b=KRBzR0FnTJSHJEHVAKSxXdt7KI6yCH//fXHRPaw94/LTSEcdrBQH7iyo9Zhb39CxN2
         uF6Iw64fTyAhyuIExfu7tklsbWY+Ve9lkjfLQ6E3lptkM4x1B2tHGAI1h7hVzqrrvn6x
         FO/zunKBBbQkoXFfzjQ5qlf0aaPeELDYDSkgFWiNF1A220nGVWYGV0EmU7UuwDPNQh8i
         wyUz5NEoy+plLlRnb1dxEjXyQH3fwUGiPvGBYeH8PxrtszY2KLgyf4eavw/S0eYMDW/h
         eVRxFdoOO9DQaYTCCq2hl5IXxcNJR/RVsLVAqp9t60Q2j2Dvtm6xGJXatnSq87FhRykf
         16jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754648435; x=1755253235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21kcGoK8EU0vLgx4YF/BuAadgiyc9oojaTg6aDJcko0=;
        b=hoYpyx78jC39pvJmwsR/XxcrLmA9OYTAt+gicXqbccdCkgt5gLbCNOLtrZdt7gR9Kt
         K3pkIjaOAirdRcvRqGnPHoThzBK2Oj8ZXvxvFULPBhy0tKJMVy0FSgacYZVXHuxXghR1
         PnKLotXJD1BEu8BwVxbykVaoHB9w3J3QIdPmZLy627RQrjTnsp3VD2HXJCL8Hshu26wY
         SktBVQq/OIHsKAtixZzSd99S1zagiQqPIZbW9gCbE71OXNu8az6SR/ksNECdiNxSzNcv
         tBbpCZW1cLcdq/b9xV1osx2M2FNVmcZeMIprtN41FipNbwBbrKOsnIM5i+txw2+mlmp7
         iTbg==
X-Forwarded-Encrypted: i=1; AJvYcCUiLt0VSxt7ctEHG823m9MAacQ1xVFe32sSa8ckfcgrhD3QNozaKDEflWwH1HoSXWXpf0KXmvZQ7oc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1MPgt6chLA6K6TiBoYCdI7YB4dctESmfIqb9gQ/H9daKBckC/
	kRHwxCisoC5HEa2qMhMZOlacBrJV0NttmaQWAOB3IeS3K3U37pNldU+p0df9Bbo0Pg==
X-Gm-Gg: ASbGncu+3qBlvVO0IlCxsU7Tv+JaaMKL87OgQN4kOt5YxCujOFD8kxSYKnYK3I54N8Z
	gOXwZejA/PZ7vs93pqU1InqwgOiwKjMMERecneA++ncCFvxSXTirnhQs4+RIihVnkk9JgvHezzP
	gLXSJG8dBZamEwG12OHSpRIHajb3iQArocQthXWnBTS9lREMtRDyI2YeFIIrs9T51DTwJVOubwz
	MwN7EGISRZcR4t85/rFX3m1h5Lp7N61WaMk4Gv2WNf1K8aG9XZI3oCdD+MIEImqGwoJGZaG/jH2
	09uf31YyoCz3ezry8lFVD+UTjxb58k+nc1rlcvCkTPF8M/yH6vo868GGOICia2h5bSAStyUtPzk
	/eYQ56scR3lz8HpN7LJwgAmGNSnT8juABuH8Au0vfKm1uPuqKT8i0SORPoBxQTTpjt58UFoAIAI
	QWMIQ7XyY=
X-Google-Smtp-Source: AGHT+IEDjYFBS2M9hzivBWOaOruDtywnG5SvG/wiSgij/xW5Mir1IpzsM0744cBxPrttBdi+x3mT9A==
X-Received: by 2002:a05:6402:234c:b0:615:eeb4:3a26 with SMTP id 4fb4d7f45d1cf-617e2c4bd13mr2054802a12.17.1754648434555;
        Fri, 08 Aug 2025 03:20:34 -0700 (PDT)
Message-ID: <ed663b9f-434c-42e8-921b-b9b4f195b24b@suse.com>
Date: Fri, 8 Aug 2025 12:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] efi: Call FreePages only if needed
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-2-ross.lagerwall@citrix.com>
 <f4c2a251-146d-4121-88ff-8f6d7624d298@suse.com>
 <CAG7k0Eo-CF0=EZTznDU2MYEv9ewB5GDHj9GBaUzCRHZYEZdO6g@mail.gmail.com>
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
In-Reply-To: <CAG7k0Eo-CF0=EZTznDU2MYEv9ewB5GDHj9GBaUzCRHZYEZdO6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2025 12:14, Ross Lagerwall wrote:
> On Wed, Aug 6, 2025 at 7:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.08.2025 18:32, Ross Lagerwall wrote:
>>> If the config file is builtin, cfg.addr will be zero but Xen
>>> unconditionally calls FreePages() on the address.
>>>
>>> Xen may also call FreePages() with a zero address if blexit() is called
>>> after this point since cfg.need_to_free is not set to false.
>>>
>>> The UEFI specification does not say whether calling FreePages() with a
>>> zero address is allowed so let's be cautious and use cfg.need_to_free
>>> properly.
>>
>> Well, no, this paragraph makes no sense. Of course this is allowed, but
>> not as no-op behavior (like free(NULL) would be), but to free memory
>> starting at 0.
> 
> Fair enough. This paragraph could simply be dropped then.
> 
>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>
>> This pretty clearly wants a Fixes: tag, or maybe it even needs to be two.
>> I've checked the original code in 4.2, and things were consistent there,
>> afaics. So breakage was introduced perhaps in one or two of the many
>> re-works.
>>
> 
> Fixes: 8a71d50ed40b ("efi: Enable booting unified
> hypervisor/kernel/initrd images")
> Fixes: 04be2c3a0678 ("efi/boot.c: add file.need_to_free")
> 
> Do you want an updated patch or can these tweaks be done while committing?

If the maintainers have no other requests that require a v2, I'm sure this
can be done while committing.

Jan


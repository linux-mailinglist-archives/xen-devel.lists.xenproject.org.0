Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A898CD609
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728602.1133586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9fB-00049j-8g; Thu, 23 May 2024 14:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728602.1133586; Thu, 23 May 2024 14:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9fB-00048D-64; Thu, 23 May 2024 14:43:25 +0000
Received: by outflank-mailman (input) for mailman id 728602;
 Thu, 23 May 2024 14:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA9fA-000487-0d
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:43:24 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf2cf68-1912-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:43:22 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso1150947566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:43:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a62492a007dsm53930066b.152.2024.05.23.07.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:43:22 -0700 (PDT)
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
X-Inumbo-ID: cdf2cf68-1912-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716475402; x=1717080202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AS/d7sOh47fXukWezPKmzml0EbcN94a3FiVo29oxpP4=;
        b=HkhYxhxLDN9GVDuNEm4b6Tse9AaNYVBlQaEp5dOb8nFQxTxxoZyl6fZZUT0kC3QadA
         2AnKCgJPbflDrTkwBBE8/dyI5rlaeRMxx7d9rd9FpGHTRtg7Im2U/Ty42vfflUzhOX87
         jepCKNvyWPycQGLyArOsECVGGm0y0HLrYThYaQA2jaH/8TVJXIZEa3MFOoyep8FIyQey
         YpgXih7cO3FbcR0XQGgzqL7LodhqeHCwE+W7b2AJ4eFmBN9cuFVqpiAuHjMVy3sziq5F
         E0FJEYZE59hFLV3C19rxC7x0kVVSFKeXR+Gue2Ag77pfhbaneVGJ9mzvL1uFceICycOy
         zatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475402; x=1717080202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AS/d7sOh47fXukWezPKmzml0EbcN94a3FiVo29oxpP4=;
        b=aSPgcE/S5HZRHH3iC2V5x8+RZbYR/AMLcZaLynpmnplWNeFzfg+GKTCB/8cNGUxlD6
         +8MUQDRr2PnslRTDiIVoJ14AGa+TvjVgunJx7a5WHJ30T/PJiIiU8WclZoEaSzJoxYJl
         hpickAIZuZ7sFkl8T+TVaDwLqFw20DcdPw7TMahY1szvdbeZk9QJUdbLNFQWiWDy+GXz
         3FACHiTWYvhdZHfIJ2FJlHilDC6Br96hlpyx1FgROpkfYTgLwfUGdwPrzdkyPlJ455+A
         vSKNBDWJj6eq4VWAVOYV82WVbYFxi1Rv+dWBOs+D+z6dmFkZlzmLC9lXx0TJrO29qmr2
         gKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjit43TDOfG3Qo0XZZQ1wHDkkwxCRbnEzgB9gNdNLPZV2Hxq7wHMF2hVv1XfRDz3bE7CI7T5sLUiApYp0NcLhA/MyECenDotW0CYrRdas=
X-Gm-Message-State: AOJu0YyJCPBQdhjncwXLFJ/V8byKaGUMKhQ8osMYxujIFufKz3GtEm0h
	WqqEz0fC5yZNES51pCufOjRFZGkmxZqo3YbBkfGsKILRiosrGj3U1YCJd6l44A==
X-Google-Smtp-Source: AGHT+IEXG1YiRrFMeEHM2AuCVxLrS56fha12iMkgtMJ5sL9AKytR4o4dzm0txV/ErspQJAtNQCV/fA==
X-Received: by 2002:a17:906:ccd2:b0:a59:a7b7:2b8f with SMTP id a640c23a62f3a-a62280557d1mr358022466b.9.1716475402558;
        Thu, 23 May 2024 07:43:22 -0700 (PDT)
Message-ID: <4424d81a-71d6-4c9b-91b4-19b6f3ca4252@suse.com>
Date: Thu, 23 May 2024 16:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 06/15] x86/p2m: guard altp2m code with
 CONFIG_ALTP2M option
Content-Language: en-US
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
 <29604726-8768-4b33-a8ef-eba6ad112d44@suse.com>
 <71559cd3-c558-4f91-9c6c-227f502645d7@epam.com>
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
In-Reply-To: <71559cd3-c558-4f91-9c6c-227f502645d7@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 12:44, Sergiy Kibrik wrote:
> 16.05.24 14:01, Jan Beulich:
>> On 15.05.2024 11:10, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>>> @@ -670,7 +670,7 @@ static inline bool hvm_hap_supported(void)
>>>   /* returns true if hardware supports alternate p2m's */
>>>   static inline bool hvm_altp2m_supported(void)
>>>   {
>>> -    return hvm_funcs.caps.altp2m;
>>> +    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
>>
>> Which in turn raises the question whether the altp2m struct field shouldn't
>> become conditional upon CONFIG_ALTP2M too (or rather: instead, as the change
>> here then would need to be done differently). Yet maybe that would entail
>> further changes elsewhere, so may well better be left for later.
> 
>   but hvm_funcs.caps.altp2m is only a capability bit -- is it worth to 
> become conditional?

Well, the comment was more based on the overall principle than the actual
space savings that might result. Plus as said - likely that would not work
anyway without further changes elsewhere. So perhaps okay to leave as you
have it.

>>> --- a/xen/arch/x86/mm/Makefile
>>> +++ b/xen/arch/x86/mm/Makefile
>>> @@ -1,7 +1,7 @@
>>>   obj-y += shadow/
>>>   obj-$(CONFIG_HVM) += hap/
>>>   
>>> -obj-$(CONFIG_HVM) += altp2m.o
>>> +obj-$(CONFIG_ALTP2M) += altp2m.o
>>
>> This change I think wants to move to patch 5.
>>
> 
> If this moves to patch 5 then HVM=y && ALTP2M=n configuration 
> combination will break the build in between patch 5 and 6, so I've 
> decided to put it together with fixes of these build failures in patch 6.

Hmm, yes, I think I see what you mean.

> Maybe I can merge patch 5 & 6 together then ?

Perhaps more consistent that way, yes.

Jan


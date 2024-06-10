Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E17901BD9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736964.1143050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZN4-0004Cm-V0; Mon, 10 Jun 2024 07:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736964.1143050; Mon, 10 Jun 2024 07:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZN4-0004Ab-SR; Mon, 10 Jun 2024 07:23:14 +0000
Received: by outflank-mailman (input) for mailman id 736964;
 Mon, 10 Jun 2024 07:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZN3-0004AV-Ip
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:23:13 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af663db-26fa-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 09:23:11 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57c681dd692so2289552a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:23:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f18a33ad8sm161384866b.137.2024.06.10.00.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:23:10 -0700 (PDT)
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
X-Inumbo-ID: 4af663db-26fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718004191; x=1718608991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9TjfTOlDvjR2FjhJaVij3/Cs4UqatQfpVPyMsfBMvgY=;
        b=Fy+ST3wzvhLFQ5KgX2cyEQGDru+KOGXGs93Q+zAKgqu6m3x9QLb9bBxwOofDUnyPO/
         DwZ0mTsiKXmBwokmXhzykz1XbOqTatVJaq86+yx9p2VnBI6p0/GgY62Nz1i8nSnVKrOB
         gE+maQYTVva3SBPp7RbSAPGWNeUFFDrJQbn05XWikqA11zx1vApcIdXksc7aDGT4A+Ys
         tmkomopQJnn3OgRmLbNfI4PmcPX+ic//8QhdzTsyYxWoM1no+UHIi+2hKMyJ2TeLHBDS
         dRMF/yHdySCJctO4nkaxf85PXqSAAcdCBMBjIrjSMu8heJg546UBuoSrGaJkzLRX/fBA
         SwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718004191; x=1718608991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TjfTOlDvjR2FjhJaVij3/Cs4UqatQfpVPyMsfBMvgY=;
        b=Jz0cv8urYrmzA4X6PlABZyj5UzL/+dKFvs96thqplqffr1OF9YTRg46PYFtDczMEvi
         /ldrcdMn8JbYpET22WJ8rPJJo51mWDPwSkdWuZvfw28T5/foGBDvLlk52JzuTKZFK9n3
         iaiXL8c9MXzugjar/tMSnsFpMxCrU7do+oV79vknsjucBL/0phu50AIxTYAO2y8jUhV2
         a8oDI+VL9X8GOT/hlxrsbNLvyofcSRJkJlHECU+gvj2mTQ1TMBRjCbxbYckmaKHlLzcR
         y5s5yiATBxdqvHuRV1qVDhhS5gLvOAsUi4aJmxU2v8Z0kXOLVPquMshNI1TZprWG/ISN
         geIg==
X-Forwarded-Encrypted: i=1; AJvYcCW0GnhBR7ZWFuifZd8OMWvuZ9PuNJCzoc3CVi1Se+5S1LrFeP1EJMxBJbI6yyiPU3jB7x/xcU3fK/loYJdJlMrLBLXhftjpQbFQkLxajKw=
X-Gm-Message-State: AOJu0YzaTG1Dlu2uvX/b8pfdhPqJ1/YokU7K+laa18zql5VoXEXImhjQ
	4pC4dK7V9niaW2nsRVL6ltMiNoHY7GKsCTpsOmU1eCS3d/9Vnw4LeSUZfPSoZw==
X-Google-Smtp-Source: AGHT+IEuTXxUtyHqC7z09FnXVivv41HR0M//BFJRSVrI0BkvUlqdHc+r3S+JBGzweTWPKku5JRt76g==
X-Received: by 2002:a17:906:f354:b0:a6f:13fe:75c9 with SMTP id a640c23a62f3a-a6f13fe7eb2mr204749466b.52.1718004190816;
        Mon, 10 Jun 2024 00:23:10 -0700 (PDT)
Message-ID: <b72ca235-81a5-4a68-94e3-b9d1522a42e4@suse.com>
Date: Mon, 10 Jun 2024 09:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 02/16] x86/altp2m: check if altp2m active when
 giving away p2midx
To: Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9306d31184b8e714c3a10ccc6a2b2c6a80777ddb.1717410850.git.Sergiy_Kibrik@epam.com>
 <7493c91c-070b-4828-a7f9-15d618d49ce5@suse.com>
 <c72ef6c8-6e5a-4533-a049-7636f6387e4b@suse.com>
 <971ed412-c016-4e95-b691-2e6795637c61@epam.com>
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
In-Reply-To: <971ed412-c016-4e95-b691-2e6795637c61@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 11:40, Sergiy Kibrik wrote:
> 07.06.24 10:50, Jan Beulich:
>> On 07.06.2024 09:25, Jan Beulich wrote:
>>> On 03.06.2024 13:09, Sergiy Kibrik wrote:
>>>> @@ -38,9 +34,13 @@ static inline bool altp2m_active(const struct domain *d)
>>>>   }
>>>>   
>>>>   /* Only declaration is needed. DCE will optimise it out when linking. */
>>>> -uint16_t altp2m_vcpu_idx(const struct vcpu *v);
>>>>   void altp2m_vcpu_disable_ve(struct vcpu *v);
>>>>   
>>>>   #endif
>>>>   
>>>> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
>>>> +{
>>>> +    return altp2m_active(v->domain) ? vcpu_altp2m(v).p2midx : 0;
>>>> +}
>>>
>>> While perhaps okay this way as a first step,
>>
>> Hmm, or maybe not. 0 is a valid index, and hence could be misleading
>> at call sites.
> 
> I'm returning 0 index here because implementation of 
> p2m_get_mem_access() for x86 & ARM expects it to be 0 when altp2m not 
> active or not implemented.

Tamas, considering the comment in x86'es p2m_get_mem_access(), what purpose
are d->arch.altp2m_p2m[0] and d->arch.altp2m_eptp[0] then? In case it indeed
is unused, why would p2m_init_altp2m() set up slot 0 in the first place?

Jan


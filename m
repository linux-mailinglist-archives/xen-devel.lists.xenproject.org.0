Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B18B94D4
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:48:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715571.1117301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QEq-0003n6-TF; Thu, 02 May 2024 06:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715571.1117301; Thu, 02 May 2024 06:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QEq-0003ku-Qa; Thu, 02 May 2024 06:48:16 +0000
Received: by outflank-mailman (input) for mailman id 715571;
 Thu, 02 May 2024 06:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2QEp-0003iD-0k
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:48:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f279ba6c-084f-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 08:48:13 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa2fso48503405e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:48:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c359100b0041adf358058sm813451wmq.27.2024.05.01.23.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:48:13 -0700 (PDT)
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
X-Inumbo-ID: f279ba6c-084f-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714632493; x=1715237293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gx1POZzfK9lHz+kf5dqZtJ/lY88gBcic1RTUVhENGYs=;
        b=W04zCkq3oRdKvqtVFFgMqY+bxhpfntnWnHQypAr9BoKJLyOgLObn9dijHXKE/q1AQk
         X7BiaQGfMOEjgqcxKQAwy7gBpegj7M36C7a3crIlI6jUng2suWqGrdoG7OczIQsRN9KV
         1rTeSIDkll/8FszGEXvH9E5TWwKkcWYe1W1ynQAYNU1tKJOutyU4iNstFVfMGQFrFqJM
         MIct0q5v7vc3vtqHIVxbNtgIJH1JZONBbOETpApZR3frpohaSZxuSzXGm9FA7c8fdUqU
         fQVK2uoVtOmZHyqiFePd79Vg6Zp/mcFZdTQ/tDTrX94N53Djndr/mWhHZI5s8GKeqlAd
         eH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632493; x=1715237293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gx1POZzfK9lHz+kf5dqZtJ/lY88gBcic1RTUVhENGYs=;
        b=qeXnLWE9az8EUQMinGv4osI2GSC8a4urDuxSQyawhDYvvr3T54DU6f1GjV90v304oP
         vvxfusst0xLv1szfz6v4a0jD4FeexI+12APX1KFTvnN2tus6jndAxPo/Y7fM9JSDt9lj
         bNpaiooAA0MEqMzLS/mg1z1af2UFh5VZg4hrD+6rcPBH91WECLoQJugVZy3+XMr6mz7B
         gV5HWQ0grAokLBJgZIqPCxXjY/X6nh1nnf35hDf3vYMvRlUArNwwiIwM1jTVejCk0IEG
         usRU1CYH4Ac3ISreTgSgxjgnrqhkuSU1380y4I7304iOY/VECTqpaCgyaBcSMUx3x6aC
         57qg==
X-Forwarded-Encrypted: i=1; AJvYcCXbQHOxIFFg0nCk6HsD0J/kFrRgZhLM9yGUbCl0kjgk2sqiwo7ts8U5+u2HZSGIHiToNHOQ4At1XU+ASm8+Z5M4eL0LPtgU1Uf39YErxeI=
X-Gm-Message-State: AOJu0Ywsi+I/TbTDEGkwXO3S5ZMcTDJOf4jZBZsjcA++S2dESs2nGlv3
	Tl043k9OPNkCnKDE6h1jUWOwjQjcc5GSjmUwSxCypXYPP2cNykyUSg53DDTGtw==
X-Google-Smtp-Source: AGHT+IHxlwGKSsqYyp/KeOt2naWfx4KxvgB7Be3qsTChPDPAtJcz7sNxLF49gWJt+aW6Ag9lSMzTdQ==
X-Received: by 2002:a05:600c:3b06:b0:41c:190:2b94 with SMTP id m6-20020a05600c3b0600b0041c01902b94mr3291909wms.6.1714632493326;
        Wed, 01 May 2024 23:48:13 -0700 (PDT)
Message-ID: <4cd997f9-a517-41f7-862e-37ca5984d48c@suse.com>
Date: Thu, 2 May 2024 08:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 07/27] x86: Map/unmap pages in
 restore_all_guests
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-8-eliasely@amazon.com>
 <a2ce9820-c57a-4690-9dc6-c15d8a1489f4@suse.com>
 <a5ba2399-30a6-4ca4-bb8c-cf8773f862b9@amazon.com>
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
In-Reply-To: <a5ba2399-30a6-4ca4-bb8c-cf8773f862b9@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 18:08, Elias El Yandouzi wrote:
>>> --- a/xen/arch/x86/pv/domain.c
>>> +++ b/xen/arch/x86/pv/domain.c
>>> @@ -288,6 +288,19 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
>>>                                 1U << GDT_LDT_VCPU_SHIFT);
>>>   }
>>>   
>>> +static int pv_create_shadow_root_pt_l1tab(struct vcpu *v)
>>> +{
>>> +    return create_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v),
>>
>> This line looks to be too long. But ...
>>
>>> +                                    1, v->domain->arch.pv.shadow_root_pt_l1tab,
>>> +                                    NULL);
>>> +}
>>> +
>>> +static void pv_destroy_shadow_root_pt_l1tab(struct vcpu *v)
>>> +
>>> +{
>>> +    destroy_perdomain_mapping(v->domain, SHADOW_ROOT_PT_VCPU_VIRT_START(v), 1);
>>> +}
>>
>> ... I'm not convinced of the usefulness of these wrapper functions
>> anyway, even more so that each is used exactly once.
> 
> The wrappers have been introduced to remain consistent with what has 
> been done with GDT/LDT table. I would like to keep them if you don't mind.

Hmm, yes, I can see your point.

>>> @@ -371,6 +394,12 @@ int pv_domain_initialise(struct domain *d)
>>>           goto fail;
>>>       clear_page(d->arch.pv.gdt_ldt_l1tab);
>>>   
>>> +    d->arch.pv.shadow_root_pt_l1tab =
>>> +        alloc_xenheap_pages(0, MEMF_node(domain_to_node(d)));
>>> +    if ( !d->arch.pv.shadow_root_pt_l1tab )
>>> +        goto fail;
>>> +    clear_page(d->arch.pv.shadow_root_pt_l1tab);
>>
>> Looks like you simply cloned the GDT/LDT code. That's covering 128k
>> of VA space per vCPU, though, while here you'd using only 4k. Hence
>> using a full page looks like a factor 32 over-allocation. And once
>> using xzalloc() here instead a further question would be whether to
>> limit to the domain's actual needs - most domains will have far less
>> than 8k vCPU-s. In the common case (up to 512 vCPU-s) a single slot
>> will suffice, at which point a yet further question would be whether
>> to embed the "array" in struct pv_domain instead in that common case
>> (e.g. by using a union).
> 
> I have to admit I don't really understand your suggestion. Could you 
> elaborate a bit more?

The (per vCPU) GDT and LDT are together taking up 128k of VA space.
Whereas you need only 4k. Therefore I was asking why you're over-
allocating by so much.

Jan


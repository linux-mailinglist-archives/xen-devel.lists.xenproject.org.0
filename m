Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA7BCBB4D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 07:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140947.1475590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v75aM-0007XR-Qk; Fri, 10 Oct 2025 05:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140947.1475590; Fri, 10 Oct 2025 05:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v75aM-0007UY-Je; Fri, 10 Oct 2025 05:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1140947;
 Fri, 10 Oct 2025 05:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v75aL-0007US-7Z
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 05:22:33 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e644fef-a599-11f0-9809-7dc792cee155;
 Fri, 10 Oct 2025 07:22:30 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so818547f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 22:22:30 -0700 (PDT)
Received: from ?IPV6:2003:ca:b74b:a84d:5516:3900:45b8:340e?
 (p200300cab74ba84d5516390045b8340e.dip0.t-ipconnect.de.
 [2003:ca:b74b:a84d:5516:3900:45b8:340e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm2352230f8f.32.2025.10.09.22.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 22:22:29 -0700 (PDT)
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
X-Inumbo-ID: 1e644fef-a599-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760073750; x=1760678550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V59PUIm9fMynxywSfaBMLtTyItWqyl02NOfiCCvnsUQ=;
        b=Bj3MaP7KQolZigU0kPUDmZ2cMAGyr2kBXTsgT1CXCmQ2jqG5D6on95AxxYRf1XWpWV
         2wM9mrVFR7slNLKWb/wyftmOA3yga6rkBn+V3+933c4IR7goAvXmHTZC+Cntm8rdUOr9
         Wx/w5g94ULpTicw6JxjRhojiX+2CqyDZUw8tb738kAoBcuxqLxnvrK8OtHUg8PAagXe8
         AiHe06nZHxpDmasxc+Rug5LMDFKFgDqSq3TYyKh0FuOrFF9hIct0bHobJs1nqwTT9p80
         b+SuXL+BAcfzJ7hyVjNKrY5eVJEOPPe5XNXfIwGN7dHJbj0+fCEDu6WPjL7NDR6s/HNO
         ADWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760073750; x=1760678550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V59PUIm9fMynxywSfaBMLtTyItWqyl02NOfiCCvnsUQ=;
        b=AnFYnWcx1xUnEJxInCX20xxmZ30Ns8UQAxKr+ynv9/xK2G1lFdKVb4FPaBnjTQQtnN
         h1kMsyclDFj7EZHbNKpjxM2YqvPBUQgdhKdfbTbTilDxPQ5rXuh8BaW8rK8JcOVxm3I7
         sC1J5tFgyvX3xmLlB/vD8q+G2MGkXr2L43fXTI6p3HE4Ux9LIW5z2uuZJzWcccMFWx4C
         99EmmNdaubplTolRHI/qzw0S41EST4qnlzrpKaC72QjlFLqDVv/xaag8tyZbWxRmSq2I
         mgEXujGIMZhrDiVa3s/mTEmmJO+7pdT93aEw2i/fZNS0HP4VR0BJmnmTanjYZjfSoCkA
         OvUw==
X-Forwarded-Encrypted: i=1; AJvYcCWDb/ntn95OffwKT1a4HhNdchyvT8nC9owj1KVjhzBt98j0HP1/+24apooe6ao+4SZcXuewxnOGsC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDPHysMBamjLNLbwLk5XEHquRE3e0mkgfEYcZ/6CwuQGiIDfq1
	qFtEy9+5Z4wFUQSs4mtYq/rAt7deOLSfMOGfyb0clqpjj0JWqdDZXmoGsN2Dhmczjg==
X-Gm-Gg: ASbGncsW9hNjQwoKawaMcsvbJA7RhIRKqHTG/bPZqWqXFOnB5zH24kZoRCEQgYP23nP
	B5yrWnMOnT0oXfU+daHthkHuZkk/bkEKi05UtQocy3rLkf/jWGNFFx7+kEp+WA/bY0tXiJvJT8g
	2MqJf05oVdRYRu/YEsj2ZTU1kU03os7k+rrbLVkpm1YVCBzLhxn0R9sZoWgH6tr2+EgJGc5kp+c
	fB5b0ry/iNpL+OQKg/o71JKYRQr4wnpdAidZ0M62E5WCkT1yDJ71fwxqMWeY3ydyHSbCpAzbO9x
	gqvloavK+dqsQV96YUOcOwZpi9GNLcriXnKFn2kzS678Wz19FmMfYbAIijSNHTW41b6QZGOcIpO
	CwCncJmJ0L7brRKNm29A3Adg8qt7i1QTc11zcw/erHXFBxFvqzqsk6qqd7zoEz4qjqJj/Ft5S/n
	JVoAz/dXYSIQbMVt/J4coMr0/G4SDq1riA3asA7I5PCN63/Lx0ysDqzW3omJO8wWY6IiBu6IXVl
	2BQTgRzueGLqA==
X-Google-Smtp-Source: AGHT+IHXzTvQxO24/HulUxqKLDknNMWhAuJfape3kmtLevXo/nKMx54FqAkuCwKkaV7tirpDiOHh6Q==
X-Received: by 2002:a05:6000:40dc:b0:3ce:f0a5:d594 with SMTP id ffacd0b85a97d-42666ab297amr6346460f8f.13.1760073750262;
        Thu, 09 Oct 2025 22:22:30 -0700 (PDT)
Message-ID: <1c18a7ff-9cf0-42d9-9817-c64fd6b7688d@suse.com>
Date: Fri, 10 Oct 2025 07:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
 <cb76b42b-e686-4b70-a831-65ec69985a8a@epam.com>
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
In-Reply-To: <cb76b42b-e686-4b70-a831-65ec69985a8a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 18:33, Grygorii Strashko wrote:
> On 08.10.25 19:04, Jan Beulich wrote:
>> On 30.09.2025 14:52, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/hvm/Kconfig
>>> +++ b/xen/arch/x86/hvm/Kconfig
>>> @@ -62,6 +62,16 @@ config ALTP2M
>>>           If unsure, stay with defaults.
>>>   +config VIRIDIAN
>>> +    bool "Hyper-V enlightenments for guests" if EXPERT
>>> +    default y
>>> +    help
>>> +      Support optimizations for Hyper-V guests such as faster hypercalls,
>>> +      efficient timer and interrupt handling, and enhanced paravirtualized
>>> +      I/O. This is to improve performance and compatibility of Windows VMs.
>>
>> What is "paravirtualized I/O" about in this context?
> 
> It was phrased this way and agreed upon from the very beginning [1]
> 
> [1] https://patchwork.kernel.org/project/xen-devel/patch/20250317071919.3766976-1-Sergiy_Kibrik@epam.com/#26305207

Hmm, I'm not sure I would call this "agreed upon". Plus this doesn't answer
my question.

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>>       if ( hvm_tsc_scaling_supported )
>>>           d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>>   -    rc = viridian_domain_init(d);
>>> -    if ( rc )
>>> -        goto fail2;
>>> +    if ( is_viridian_domain(d) )
>>> +    {
>>> +        rc = viridian_domain_init(d);
>>> +        if ( rc )
>>> +            goto fail2;
>>> +    }
>>
>> While this looks okay to me, ...
>>
>>> @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>>>       if ( hvm_funcs.nhvm_domain_relinquish_resources )
>>>           alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>>>   -    viridian_domain_deinit(d);
>>> +    if ( is_viridian_domain(d) )
>>> +        viridian_domain_deinit(d);
>>
>> ... I wonder if viridian_{domain,vcpu}_deinit() better wouldn't be tolerant
>> to be called anyway, thus avoiding the need for conditionals here and below
>> (and perhaps being a little more robust overall). Thoughts?
> 
> I think There are no limits for perfection. But at some point - need to stop.
> 
> Hence Viridian code will be removed from build when !VIRIDIAN - changing above code will
> require to add stubs for viridian_{domain,vcpu}_deinit().

Fair point.

Jan


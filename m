Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2F8129C5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 08:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654306.1021071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDgXd-00030A-PB; Thu, 14 Dec 2023 07:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654306.1021071; Thu, 14 Dec 2023 07:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDgXd-0002xo-Le; Thu, 14 Dec 2023 07:53:57 +0000
Received: by outflank-mailman (input) for mailman id 654306;
 Thu, 14 Dec 2023 07:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDgXc-0002xi-Q1
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 07:53:56 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed590cca-9a55-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 08:53:54 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1e2ded3d9fso937386966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 23:53:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 si10-20020a170906ceca00b00a1e377ea789sm8871093ejb.203.2023.12.13.23.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 23:53:53 -0800 (PST)
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
X-Inumbo-ID: ed590cca-9a55-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702540433; x=1703145233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWSICCGMVQL8q4mV5y32l1cSijarK9RheoZkjBakzOk=;
        b=ZP5s/lptfDkL9PCkyU6pB6rt1inLLM1ELtPuMs45YN39U1CqaGMN2SjERmFrFti8tE
         nSdVEjmRSOlgeNUX73jixvQhI8Y9cWhHgmNqv2LhnIdDqEwzN0HBJ9TMgTL8LNjym1tH
         xs1/sH5NRDMsLFEOmtFyxpjE+HBsJFjKGY6j8aFUfX79WOKxhKgBjZSHrpUqaIyeUOtD
         JtVeulhe6Be1ELixirapQIc5lDNylNNZLmq/4wb4BsXe/g0uoAGML9wBIMeUtEnkBnWj
         2pirFWbGx4KvBHZJELeAd0W1luqUVR8fjfCXQi8rRl6kGeqZpWQYRuKPDBBvye2CNQJ9
         aoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702540433; x=1703145233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWSICCGMVQL8q4mV5y32l1cSijarK9RheoZkjBakzOk=;
        b=qJ1lNfhLemEU29OfVB6MGNre06+6CnaJKxB0+nfOCWHmMmOQUVKhIPc+XbpIK26fc6
         br0stQWklNTKfNZINUi/j6lPz8s4Tr4JtxMF9E3XbdwK93qpbm5gaYPpz50RsBdzkf+6
         AQJY2SEl02+ZT+PmCjY4j9pDmJAvKiiWaK5ExKPXBd7+rhcFAMdPfDyN6Rw42DYrScLS
         7GGkVR8ejkeaXiPgaj9fM25wJ572zkBXsnbncGjwgueLexH1tzdIOR72wbbOKFWL7B1+
         OpDD+ALnYI7nNzqy1775qcOtrQmMHqx2yrT0pVRYrdB5fl10R9r4x0P2v7Kias9jFRjI
         p/9A==
X-Gm-Message-State: AOJu0YxCNg+cFloLtvJbdKuaX8h76YZriAuNmrGO/V3dIC6VPC0UfJLL
	7aAnAYP8umLGzlw3nA2rpnF7
X-Google-Smtp-Source: AGHT+IGlhdceWm2SZUD540asoVWeNJBZ4HF+NeOIH5P1r/rZw4D+hAkrEjN44KpZ4Qpj6kRucFFOkA==
X-Received: by 2002:a17:906:2c6:b0:a1f:9bd2:7f67 with SMTP id 6-20020a17090602c600b00a1f9bd27f67mr4060662ejk.123.1702540433634;
        Wed, 13 Dec 2023 23:53:53 -0800 (PST)
Message-ID: <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
Date: Thu, 14 Dec 2023 08:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 03:05, Stefano Stabellini wrote:
> On Wed, 13 Dec 2023, Jan Beulich wrote:
>> On 11.12.2023 10:14, Nicola Vetrini wrote:
>>> --- a/xen/arch/arm/include/asm/numa.h
>>> +++ b/xen/arch/arm/include/asm/numa.h
>>> @@ -2,8 +2,9 @@
>>>  #define __ARCH_ARM_NUMA_H
>>>  
>>>  #include <xen/mm.h>
>>
>> With this, ...
>>
>>> +#include <xen/types.h>
>>>  
>>> -typedef u8 nodeid_t;
>>> +typedef uint8_t nodeid_t;
>>>  
>>>  #ifndef CONFIG_NUMA
>>>  
>>> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
>>>  #define node_to_cpumask(node)   (cpu_online_map)
>>>  
>>>  /*
>>> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>>> - * is required because the dummy helpers are using it.
>>> + * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
>>> + * this is required because the dummy helpers are using it.
>>>   */
>>> -extern mfn_t first_valid_mfn;
>>
>> ... and this declaration moved to xen/mm.h, how is it going to be possible
>> to do as the adjusted comment says? The compiler will choke on the static
>> after having seen the extern.
> 
> Nicola was just following a review comment by Julien. NUMA has been
> pending for a while and I wouldn't hold this patch back because of it.
> I suggest we go with Julien's request (this version of the patch).
> 
> If you feel strongly about it, please suggest an alternative.

Leaving a TODO comment which cannot actually be carried out is just wrong
imo. And I consider in unfair to ask me to suggest an alternative. The
(imo obvious) alternative is to drop this patch, if no proper change can
be proposed. There's nothing wrong with leaving a violation in place,
when that violation is far from causing any kind of harm. The more that
the place is already accompanied by a (suitable afaict) comment.

Jan


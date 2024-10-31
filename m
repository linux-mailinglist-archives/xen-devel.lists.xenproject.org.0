Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405639B7733
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828502.1243392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RHs-000839-T7; Thu, 31 Oct 2024 09:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828502.1243392; Thu, 31 Oct 2024 09:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RHs-00080S-QJ; Thu, 31 Oct 2024 09:16:16 +0000
Received: by outflank-mailman (input) for mailman id 828502;
 Thu, 31 Oct 2024 09:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6RHr-00080M-74
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:16:15 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f70f94-9768-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 10:16:11 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so428577f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:16:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e67csm1504893f8f.75.2024.10.31.02.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:16:10 -0700 (PDT)
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
X-Inumbo-ID: c4f70f94-9768-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM0ZjcwZjk0LTk3NjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzY2MTcxLjA3MTczNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730366170; x=1730970970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rvtwV5MEtl3Wpwsvg9gUoJDgTgrZsbjGx9k5Vq15b5g=;
        b=JnMvEF/3MuzgfH7AyMsokyd5lHl26iJvS+5zZSMLbzYeMYJBE5raoCEat+aRezAfrb
         ceo+Ea5r0vnmjNZUktYjpj9Pmq0fzXZTC25Qscs5J7SaTWBfyCxkKtQ8sCc/m9SsUNS7
         CqVBWpCNPRWWsyP5pCmBnIuvDR2Cu/yoL45aMJ9V1+Ds95IX+JHPqpqOSLmfxk0fEoRl
         KV6JiPxGPiNhhaUYYsjXVZ+SgxgO9RLCTGs2zjJtdHl3bBg48mZcF0vSCRsnCFQHE1gs
         UjHc2dJ+XN6LPAqk3leB+smFAG90lcw4X2aVPUcOgrBH9Haki07Rn0u2PJrqcC6zIH8q
         dd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366170; x=1730970970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvtwV5MEtl3Wpwsvg9gUoJDgTgrZsbjGx9k5Vq15b5g=;
        b=sY+jp2X4qcJqPwrjwH04noisinEhFhdcJRlAIkkeWYcgp49D4qBSaMHJNitBTr07UO
         Wl+DI+7BzJCjymvk+4PEmEAL1QqA6JTGgQZp9Bn+3FiORB5dn182eGBWAGoyptEvR7Z4
         ZIU7m4BYEKFGST7oFe6j0Rx4s/dkXdAn1XTYcGuhpNR8/NMAgbqkLaq063vqT5BE1HqT
         QUb2wcTYu9l4S50PgVQAunEeIk0HvNKH31ZcaPzbL0pM/IJ8sri8D/euM890f6HFozLm
         nsqRGTx+UEOfSC0xWDS6NGXyn9FqRDBELMGAcFzhGmNDGLtljzDURM3b2X8j97X7uTFQ
         Xj0A==
X-Gm-Message-State: AOJu0YxuDGg/eiMnq3Xxd2YU9XkuJTN3lFQcfmaCpPvDr9QI22cmoHUn
	BSw0rpd/qa4Llmap6vOsgIqv/qHzw1Eb09Z5e5Iqf/MCAqjgGy46jnnnmrDesg==
X-Google-Smtp-Source: AGHT+IFedjwCO4XZM57pkpII234KEYhbW9XY8yCGBY+O15rgN5GUZcmL4+3voO59uttIzvrPqlBUZA==
X-Received: by 2002:a05:6000:188c:b0:381:c5ee:9c00 with SMTP id ffacd0b85a97d-381c5ee9c52mr216352f8f.47.1730366170348;
        Thu, 31 Oct 2024 02:16:10 -0700 (PDT)
Message-ID: <cb97f3b1-2fad-47f7-9d9f-386914623518@suse.com>
Date: Thu, 31 Oct 2024 10:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Extend the guest max policy max
 leaf/subleaves
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20241029175505.2698661-1-andrew.cooper3@citrix.com>
 <ZyH1az6sb2wnVxgu@macbook> <f6494fa2-6de0-4ded-864a-9c011d9ad5f2@citrix.com>
 <ZyISitvz_K_XtvL5@macbook> <3effac8c-b4cf-4d96-a5f6-99def9f7ec1c@citrix.com>
 <ZyJM_DLUkqolD7mD@macbook> <e4d75dee-3cf6-4fc1-9277-ea16ed9e0319@citrix.com>
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
In-Reply-To: <e4d75dee-3cf6-4fc1-9277-ea16ed9e0319@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 17:51, Andrew Cooper wrote:
> On 30/10/2024 3:13 pm, Roger Pau Monné wrote:
>> On Wed, Oct 30, 2024 at 02:45:19PM +0000, Andrew Cooper wrote:
>>> On 30/10/2024 11:03 am, Roger Pau Monné wrote:
>>>> On Wed, Oct 30, 2024 at 10:39:12AM +0000, Andrew Cooper wrote:
>>>>> On 30/10/2024 8:59 am, Roger Pau Monné wrote:
>>>>>> On Tue, Oct 29, 2024 at 05:55:05PM +0000, Andrew Cooper wrote:
>>>>>>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>>>>>>> index b6d9fad56773..78bc9872b09a 100644
>>>>>>> --- a/xen/arch/x86/cpu-policy.c
>>>>>>> +++ b/xen/arch/x86/cpu-policy.c
>>>>>>> @@ -391,6 +391,27 @@ static void __init calculate_host_policy(void)
>>>>>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>>>>>>  }
>>>>>>>  
>>>>>>> +/*
>>>>>>> + * Guest max policies can have any max leaf/subleaf within bounds.
>>>>>>> + *
>>>>>>> + * - Some incoming VMs have a larger-than-necessary feat max_subleaf.
>>>>>>> + * - Some VMs we'd like to synthesise leaves not present on the host.
>>>>>>> + */
>>>>>>> +static void __init guest_common_max_leaves(struct cpu_policy *p)
>>>>>>> +{
>>>>>>> +    p->basic.max_leaf       = ARRAY_SIZE(p->basic.raw) - 1;
>>>>>>> +    p->feat.max_subleaf     = ARRAY_SIZE(p->feat.raw) - 1;
>>>>>>> +    p->extd.max_leaf        = 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/* Guest default policies inherit the host max leaf/subleaf settings. */
>>>>>>> +static void __init guest_common_default_leaves(struct cpu_policy *p)
>>>>>>> +{
>>>>>>> +    p->basic.max_leaf       = host_cpu_policy.basic.max_leaf;
>>>>>>> +    p->feat.max_subleaf     = host_cpu_policy.feat.max_subleaf;
>>>>>>> +    p->extd.max_leaf        = host_cpu_policy.extd.max_leaf;
>>>>>>> +}
>>>>>> I think this what I'm going to ask is future work.  After the
>>>>>> modifications done to the host policy by max functions
>>>>>> (calculate_{hvm,pv}_max_policy()) won't the max {sub,}leaf adjustments
>>>>>> better be done taking into account the contents of the policy, rather
>>>>>> than capping to the host values?
>>>>>>
>>>>>> (note this comment is strictly for guest_common_default_leaves(), the
>>>>>> max version is fine using ARRAY_SIZE).
>>>>> I'm afraid I don't follow.
>>>>>
>>>>> calculate_{pv,hvm}_max_policy() don't modify the host policy.
>>>> Hm, I don't think I've expressed myself clearly, sorry.  Let me try
>>>> again.
>>>>
>>>> calculate_{hvm,pv}_max_policy() extends the host policy by possibly
>>>> setting new features, and such extended policy is then used as the
>>>> base for the PV/HVM default policies.
>>>>
>>>> Won't the resulting policy in calculate_{hvm,pv}_def_policy() risks
>>>> having bits set past the max {sub,}leaf in the host policy, as it's
>>>> based in {hvm,pv}_def_cpu_policy that might have such bits set?
>>> Oh, right.
>>>
>>> This patch doesn't change anything WRT that.
>> Indeed, didn't intend my comment to block it, just that I think at
>> some point the logic in guest_common_default_leaves() will need to be
>> expanded.
>>
>>> But I think you're right that we do risk getting into that case (in
>>> principle at least) because of how guest_common_*_feature_adjustment() work.
>>>
>>> Furthermore, the bug will typically get hidden because we serialise
>>> based on the max_leaf/subleaf, and will discard feature words outside of
>>> the max_leaf/subleaf bounds.
>> Yes, once we serialize it for toolstack consumption the leafs will be
>> implicitly zeroed.
>>
>>> I suppose we probably want a variation of x86_cpu_featureset_to_policy()
>>> which extends the max_leaf/subleaf based on non-zero values in leaves. 
>>> (This already feels like it's going to be an ugly algorithm.)
>> Hm, I was thinking that we would need to adjust
>> guest_common_default_leaves() to properly shrink the max {sub,}leaf
>> fields from the max policies.
> 
> Hmm.  What we'd do is have default inherit max's ARRAY_SIZES(), then do
> all the existing logic, then as the final step, shrink the default
> policies, vaguely per Jan's plan.

Yet, beyond what my present patch has, not below anything the tool stack
has asked for explicitly.

Jan


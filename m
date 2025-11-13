Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA55C56022
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 08:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160656.1488722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJRSH-0003NK-An; Thu, 13 Nov 2025 07:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160656.1488722; Thu, 13 Nov 2025 07:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJRSH-0003LM-8A; Thu, 13 Nov 2025 07:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1160656;
 Thu, 13 Nov 2025 07:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJRSG-0003LG-8v
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 07:09:16 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a964148d-c05f-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 08:09:14 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b727f330dd2so57552366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 23:09:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8d69sm100077266b.50.2025.11.12.23.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 23:09:13 -0800 (PST)
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
X-Inumbo-ID: a964148d-c05f-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763017754; x=1763622554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ILNGvSFxrjslJ+FVYctpHwd4EignvOFY1VWLMWv5W6w=;
        b=L0PXNJG3Gd7oMnobKqWYXecNxJ3kaGczTo0C7AsV7/us1E+jlZ06f3VvY+Amv+Sveu
         Ofd6JRZ1g5+9OF6CT9dedqQWcGsElyRquggDYQvo4jKwHoqKPx9UiVVC99WYR2kZujda
         /nW7ZtonpHTR4csE5fTeeWc0mscfUleZQUDGIXJji0fMlzlrOAuI7Sb8aeb2WEGIl6Ow
         0aY2msigsB+z/pTT8oDiR34NLFVxtdsbv2xhU6+DTIP6zQltneIBDHWx9aSGrWMId6E4
         4sOFFUMeUwSEA5LoEtcRgaoduoc8zi1q8XW4HcASxjXKPyoe9ZHB5eUDP0BE/t7DKATW
         ohkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763017754; x=1763622554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILNGvSFxrjslJ+FVYctpHwd4EignvOFY1VWLMWv5W6w=;
        b=jOFMRj6DQkborLlHEvVJf3a22mbPs5GWrDzEw8mU8ehJTAQUGjA1hinckRllL6o53X
         0Aerfz3TSUNF+Ad1W6OZthWGKlby2EpRJ7g0EylCiqMZqu5euAJgGbX4Sx2bvBJXSPw7
         T2mox3+uRu0+tE6TTQAK1O5SBCpZ1T06ItFQdtvsdPKEjCadGu1ZWKHNigPNP4vgDgsd
         krUcjEvyV3VGqEs0qZrUdpwYt+3kl8Z+kux5+2xsVE2K9k7qUUdkO9ou2kFnGe2k4nZE
         PVrscTVRXNuIP8bgAiYpOfvyYHvtvQVc3O4LSYD5zq2QnU53JFMcY7zMCJE6SIDYCWoJ
         TW2w==
X-Forwarded-Encrypted: i=1; AJvYcCWEAwBRClqyhykWOFYQ4xSAZRmVbyY3J7MdHqfpalLkoz5qQ8J7FGRUbIpZOsry7S9WIkabIYU54bA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXHqL+Txfb0nqEgH6xZ4pb5oGzEa86Bk2F8FB2dbQbYRIIpgcd
	Ny7YpCDp8dyGBbTNKmziOC689Am14lGqMgK8QpXAH+RwWrMpopKxKyx2BDzFsEGaNR9XlbW6RLq
	I2z4=
X-Gm-Gg: ASbGncuSKBRd09vQkidTyRqjpb3blalCRJyWnPthtU3apqGe+HFyT9+Pz+8I2kFFF+z
	EE9nVKdoztXY4+YZLnEvzqI7d91m1cDT0wt8h72Mp1VqcWntcU8jBVamdMxO390Vy7p7Dvhcg3T
	Bxb3gwo3wIS9F/UctKUHq5AHiwjoNTkbl4PY0B4lOqRxQIFRmBqddpumHODfNB+VXSF5ySN1LKD
	kn4HerLGjDpBYWaoO/iJcmPDgPCuSXQp2zL+cvAc0j7K5RsNj2crRlCmsaWXvAsU6sxSMSIkeGC
	ArAn+GIxHN/QnQDsstpsuumiPfCwFpHE4k7z76PdmD6EZtXyMzRC8KZ7LtEU45lbzg15FhCULlG
	Mk8JicrkuEvLuNeT0S6/JpzGGxiHbc4hlaTMIOA3dtotR0PgwCtDP0mN+C3KQ4DeKsg9SIqP0eA
	pTLyyRdEHm7zESNUoAOpIlvGMqgdhNhA6OIQRZytVD0wlWYWZTl1Ef0DHhzCWeuUGq+8b+mZF5o
	wI=
X-Google-Smtp-Source: AGHT+IF4nxhaMlHKtwthd20ueHjaP/nVzGPIxhA445mCHD47K390EQNN1h1nisjI8NSOWWPkUq4KDQ==
X-Received: by 2002:a17:906:eec4:b0:b72:5983:db25 with SMTP id a640c23a62f3a-b7331aac664mr654030666b.32.1763017753876;
        Wed, 12 Nov 2025 23:09:13 -0800 (PST)
Message-ID: <105178e4-4f97-45a6-ba16-f57f5945f9cf@suse.com>
Date: Thu, 13 Nov 2025 08:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <victlira@amd.com>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
 <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
 <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
 <faab050f-677f-469c-8bca-93c55a53165c@suse.com>
 <a858cfd2-c6cc-4ed1-bb12-8cad488f4542@epam.com>
 <be5586a8-bb32-448f-b249-538d1b65f626@suse.com>
 <51f5ea06-96aa-45f7-a90b-50d7be1c10cd@epam.com>
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
In-Reply-To: <51f5ea06-96aa-45f7-a90b-50d7be1c10cd@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.11.2025 18:43, Grygorii Strashko wrote:
> On 12.11.25 15:07, Jan Beulich wrote:
>> On 12.11.2025 12:27, Grygorii Strashko wrote:
>>> On 12.11.25 08:38, Jan Beulich wrote:
>>>> On 11.11.2025 18:52, Grygorii Strashko wrote:
>>>>> On 10.11.25 09:11, Jan Beulich wrote:
>>>>>> On 07.11.2025 19:17, Grygorii Strashko wrote:
>>>>>>> --- a/xen/arch/x86/include/asm/guest_access.h
>>>>>>> +++ b/xen/arch/x86/include/asm/guest_access.h
>>>>>>> @@ -13,26 +13,64 @@
>>>>>>>     #include <asm/hvm/guest_access.h>
>>>>>>>       /* Raw access functions: no type checking. */
>>>>>>> -#define raw_copy_to_guest(dst, src, len)        \
>>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>>>>> -     copy_to_guest_pv(dst, src, len))
>>>>>>> -#define raw_copy_from_guest(dst, src, len)      \
>>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>>>>> -     copy_from_guest_pv(dst, src, len))
>>>>>>> -#define raw_clear_guest(dst,  len)              \
>>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>>> -     clear_user_hvm((dst), (len)) :             \
>>>>>>> -     clear_guest_pv(dst, len))
>>>>>>> -#define __raw_copy_to_guest(dst, src, len)      \
>>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>>>>> -     __copy_to_guest_pv(dst, src, len))
>>>>>>> -#define __raw_copy_from_guest(dst, src, len)    \
>>>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>>>>> -     __copy_from_guest_pv(dst, src, len))
>>>>>>> +static inline bool raw_use_hvm_access(const struct vcpu *v)
>>>>>>> +{
>>>>>>> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
>>>>>>> +}
>>>>>>
>>>>>> Without a full audit (likely tedious and error prone) this still is a
>>>>>> behavioral change for some (likely unintended) use against a system domain
>>>>>> (likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
>>>>>> there. IOW imo the "system domains are implicitly PV" aspect wants
>>>>>> retaining, even if only "just in case". It's okay not to invoke the PV
>>>>>> accessor (but return "len" instead), but it's not okay to invoke the HVM
>>>>>> one.
>>>>>
>>>>> This patch is subset of "constify is_hvm_domain() for PV=n case" attempts.
>>>>>
>>>>> It was made under assumption that:
>>>>> "System domains do not have Guests running, so can't initiate hypecalls and
>>>>>    can not be users of copy_to/from_user() routines. There are no Guest and no user memory".
>>>>> [IDLE, COW, IO, XEN]
>>>>>
>>>>> If above assumption is correct - this patch was assumed safe.
>>>>>
>>>>> if not - it all make no sense, probably.
>>>>
>>>> I wouldn't go as far as saying that. It can be arranged to avid the corner
>>>> case I mentioned, I think.
>>>
>>> do you mean adding "&& !is_system_domain(v->domain)" in raw_use_hvm_access()?
>>
>> No, we want to avoid adding any new any runtime checks.
>>
>>> Hm, I see that vcpu(s) are not even created for system domains in domain_create().
>>> So seems !is_system_domain(v->domain) == true always here.
>>
>> "always" in what sense? It _should_ be always true, but in the unlikely event we
>> have a path where it isn't (which we could be sure of only after a full audit),
>> behavior there shouldn't change in the described problematic way.
>>
>>> Am I missing smth?
>>> Or you meant smth. else?
>>
>> I was thinking of something along the lines of
>>
>>      if ( is_hvm_vcpu(current) )
> 
> this condition will not be constified any more for HVM=y and PV=n

Right, and intentionally so (as explained).

Jan

>>          return ..._hvm();
>>
>>      if ( !IS_ENABLED(CONFIG_PV) )
>>          return len;
>>
>>      return ..._pv();
> 
> Possible benefit will be reduced from:
>    add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
> 
> to:
>    add/remove: 3/8 grow/shrink: 3/89 up/down: 1018/-12087 (-11069)
> 
> Any way it is smth.
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3941981B4AC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 12:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658837.1028242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGu9-0005wy-Dp; Thu, 21 Dec 2023 11:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658837.1028242; Thu, 21 Dec 2023 11:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGu9-0005u8-As; Thu, 21 Dec 2023 11:07:53 +0000
Received: by outflank-mailman (input) for mailman id 658837;
 Thu, 21 Dec 2023 11:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGGu8-0005u0-2H
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 11:07:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9c37f8-9ff1-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 12:07:49 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33679c49fe5so535944f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 03:07:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r16-20020adfe690000000b0033676f9e4cbsm1790745wrm.36.2023.12.21.03.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 03:07:49 -0800 (PST)
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
X-Inumbo-ID: 2d9c37f8-9ff1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703156869; x=1703761669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MIUsNzDu2MAuULJxqzzBHFyHr4mGnirKZ3vhdLar15s=;
        b=RosEtFL/729OwbJKSiiqObc4H7B7LVWAtMdqU+LWzxEMd2g7FMTDYzwJ9FECLj9PCe
         Qe4p2Coev7sciV5z8xLHip7EkSPr5yyaq+d08dDPW+ejYLtF3t4JZ13GQf82DbxAA9aX
         WX7CWMkJHUDgkvIoBKO9ABR+OJvMgbNpOIIulntKm/XZeBmBKEmf4l5bO8lLkUbY9uVU
         EqWZMIJkLivD7obI5rC4andv4Z8X0Yl4O/MwAtDxt4bPMpZ547cgsWCWc9uk5EdAysvL
         UbGt9fU2M6g5u6Vz8nIVg1oisi+cfudiJKmUi1PCuCaFnANI6k2ej0X+TkTBK7Emk9P0
         ksPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703156869; x=1703761669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIUsNzDu2MAuULJxqzzBHFyHr4mGnirKZ3vhdLar15s=;
        b=Rr6BIemTjsaB7G4fmLwBZriPEW02XbEN3uInCzca0LE18qpwqltr9HPV60hkZ+HixI
         Fd5BrEiphuPpyVxC+749e/O8hhk8udxU/zAqbZKNjG+8AcHssEu936AEfeIT8t8LlE0V
         buWXief+60PGAOshOQHO9HZG3Kw+EYAUFYbwUmfXwojWtQckHGEPlxor5YxEpTysDp0n
         ZQFFiABQ0jq6wDlz4sZjf6XXCjTistAbRs7yRmQ3/J2S/grAd0Q9dwToReiiQ7IQQFc7
         TyPa2HbjbGr8ymuP9kK0xATHEEEoSQNqs6VnnYfv2c3L76VDhhPqmpzEL89i/iCgKOZn
         WW/Q==
X-Gm-Message-State: AOJu0YyCNcUxxlZxihexV03SA2aylR8R9FpViGRmWpRS+YKnQQxdP+gm
	3vUa+d1uZvNrhCkBlG9Z8xTT
X-Google-Smtp-Source: AGHT+IGiPDkSnwf8y8OI7S3Vjo73iFxRUtWaUYUa1AgPMYqXNQoGdSDZmSQqlFXogN88DMF3KidRBA==
X-Received: by 2002:a5d:4587:0:b0:336:5c03:c598 with SMTP id p7-20020a5d4587000000b003365c03c598mr653062wrq.58.1703156869420;
        Thu, 21 Dec 2023 03:07:49 -0800 (PST)
Message-ID: <62d04630-59fd-4926-af16-d7b8c20d4b94@suse.com>
Date: Thu, 21 Dec 2023 12:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] xen/spinlock: introduce new type for recursive
 spinlocks
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-4-jgross@suse.com>
 <ea25863a-f5da-4873-89f2-d75b3abb9ef8@xen.org>
 <36331c0f-d495-4263-95a6-e1c5abcac060@suse.com>
 <14f2857f-5afb-4c04-ab84-6b8403f1dbc8@suse.com>
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
In-Reply-To: <14f2857f-5afb-4c04-ab84-6b8403f1dbc8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.12.2023 12:06, Juergen Gross wrote:
> On 21.12.23 11:34, Jan Beulich wrote:
>> On 12.12.2023 13:57, Julien Grall wrote:
>>> On 12/12/2023 09:47, Juergen Gross wrote:
>>>> @@ -109,12 +109,16 @@ struct lock_profile_qhead {
>>>>        spinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                 \
>>>>        static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
>>>>        _LOCK_PROFILE_PTR(l)
>>>> +#define DEFINE_RSPINLOCK(l)                                                   \
>>>> +    rspinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                \
>>>> +    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
>>>> +    _LOCK_PROFILE_PTR(l)
>>>>    
>>>> -#define spin_lock_init_prof(s, l)                                             \
>>>> +#define __spin_lock_init_prof(s, l, locktype)                                 \
>>>
>>> If I am not mistaken the double-underscore prefix is a violation in
>>> MISRA. So can this be renamed to:
>>>
>>> spin_lock_init_prof__()?
>>
>> Is the new parameter needed at all? Can't we use typeof((s)->l) in place of
>> passing the type explicitly?
> 
> IMO spin_lock_init_prof() should be usable for spinlock_t only, and
> rspin_lock_init_prof() for rspinlock_t only. Using typeof() would make
> either of them usable for both types.

Fair point.

Jan


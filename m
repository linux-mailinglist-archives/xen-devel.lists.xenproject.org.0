Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F96A672C1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 12:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919014.1323577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuVA7-0000bc-2V; Tue, 18 Mar 2025 11:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919014.1323577; Tue, 18 Mar 2025 11:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuVA6-0000aA-Vn; Tue, 18 Mar 2025 11:31:10 +0000
Received: by outflank-mailman (input) for mailman id 919014;
 Tue, 18 Mar 2025 11:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuVA5-0000a4-Io
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 11:31:09 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7be6403b-03ec-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 12:31:07 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso21591735e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 04:31:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2bb5f987sm77747325e9.24.2025.03.18.04.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 04:31:06 -0700 (PDT)
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
X-Inumbo-ID: 7be6403b-03ec-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742297467; x=1742902267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kNqdrAYjv6HYdaoOCOyNtMgstgkf2F+GodaW2NexSew=;
        b=RVO3liKhyr9y5hkqfOlh/VdMD9NMIp2UelRdCuTzFsBKvwxOFtvQc73hExSsdvK8cs
         dqhtU7SoYLiIXnUDAsg5WfQfPdvgiEqr9UFKI8X/rNJFx/nqhCneVY5KyHRbuxAqeFaK
         4AcKrJTB3jDiQYwWsHIUp3e4KWkUZdWMAx5c/jlR0NJw0R2pAIWTyOoviM4vqrP5MGXB
         WkHnQo7Ya/HMq0tF7i9yba6MAt/c3Y71Sd1WU8vmdRD717G+Lpg2syCy5w4M3Va5ajmP
         jpxaR02TYrJjc3mJMiouT9GnMGntF58jM305NM4yUIqnpExiE9nggUX40SRon0mR23bl
         laWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742297467; x=1742902267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqdrAYjv6HYdaoOCOyNtMgstgkf2F+GodaW2NexSew=;
        b=NiCegEO7TOuvvBL0REC7G2TuApEENZUN4rsAbRurBKvkWm15tHLx7Br+h44xQFZdAP
         +PZRWKWNgj8IY3nx3JYXs0nYRutU0NEya1sdlxEL5mKrGgbsIO8JNaQdRgWskJfFVMp3
         C8VTBBeLFmnne7ZMkcjweosI27Yh88IgLApTY9DPJAVFZpx5ziB0QMY7pxrjdgJnuAMY
         g5PuSBW3kmjGZ0iPlSBEfNwj1ou/JjIBL/BMmyWHGTEfG1wlOev5yPT2RMuIDUtmLUyJ
         4T4p3df65WT+JhY231k7KITzpu2R9B+CFUP56dKSFR1WIVFAG9CSCrXFuV+j8+30PkNO
         4B3A==
X-Forwarded-Encrypted: i=1; AJvYcCXLyY1PgSifyRKTwsEAnIlSMsTuLD/l0I8LT07wL5+sjEmjDa3ftuic6QX3CYe2D4ZoeziGkdbRBak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH6fqbgK+RwIWm+9Z2l6Nbv6TcxN2U+deEf5EE00XTOOQrhNfk
	Ifhd8UHsgDyRp419J4eykFrKFoJ+2ka2+RhLhltGK7dzqPaZpiUxh8dcjr+1dw==
X-Gm-Gg: ASbGncvpmSe6K+f6Gh82uA5nT+tdIKo47theKXd1wDok1FbNun2+OSmp1YnjFdwYJ+w
	4a3qvC7al83v2WyqyfpKgWzya6UJvgnL0gNMUGugTnPw3K4XkPN+/nWbOCxXw6zyEIXTGbY3f3q
	4FXSQMaW/GnZvYdg0H90D/HNpg1Jpn2wYF4yLCt+dSunw+xcuAIGmUCEORZvdt4fFHYikFQJI3N
	bax2vky0yGiMcf/FdHQerXepfoSa5Rwa69CxOV1pZ8+Ulq7xcYQ9J2J00Tgk8dVCazi19sNut57
	cZWVTexlqRYxZEKx6gyIQJ6MgEZ8yvFE+jQoAVZnb0af/tpnU1KbKbK4jRZ96s26J3M3/Bg/Xy/
	uT7na1ltv/O8tFu7xofxtao6dGrzT8g==
X-Google-Smtp-Source: AGHT+IEIkju/gNd4rM0aDX73QMV10HHKDXCAETLezQ/5QItYNffCQuiG8sLxAYtcDvQwZ9U7RMlCBA==
X-Received: by 2002:a05:600c:1d2a:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43d3b9a4268mr21082145e9.17.1742297466835;
        Tue, 18 Mar 2025 04:31:06 -0700 (PDT)
Message-ID: <1f9a0101-f253-46e1-8b6d-8378d4c84c71@suse.com>
Date: Tue, 18 Mar 2025 12:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250318082945.52019-1-roger.pau@citrix.com>
 <38076c0d-8e1a-4d16-b22c-b1db9460ed1c@suse.com>
 <Z9k0tL30_yLuj5kM@macbook.local>
 <2eabb7bc-0dca-4426-a6ee-49a6ef8968db@suse.com>
 <Z9lO0b7LkCFwmJZv@macbook.local>
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
In-Reply-To: <Z9lO0b7LkCFwmJZv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 11:45, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 11:14:59AM +0100, Jan Beulich wrote:
>> On 18.03.2025 09:54, Roger Pau Monné wrote:
>>> On Tue, Mar 18, 2025 at 09:36:37AM +0100, Jan Beulich wrote:
>>>> On 18.03.2025 09:29, Roger Pau Monne wrote:
>>>>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>>>>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>>>>> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>>>>>      rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>>>>>                                              &msi_desc->remap_index,
>>>>>                                              msg, &data);
>>>>> -    if ( rc > 0 )
>>>>> +    if ( rc >= 0 )
>>>>>      {
>>>>>          for ( i = 1; i < nr; ++i )
>>>>>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>>>>
>>>> I understand that Marek's testing has made clear that this change is needed,
>>>> yet I don't understand it. If we didn't allocate a new index, why would we
>>>> need to update in-memory state, when memory is preserved across S3?
>>>
>>> Is this always the case for device memory? (iow: contents of the BARs
>>> and possibly the PCI config space?)
>>
>> Of course not. But msi_desc[] is in RAM.
> 
> Sorry, I think I didn't understand your earlier question, and hence
> the reply I provided didn't make any sense to you.
> 
>>>> (This
>>>> lack of understanding on my part is why I didn't associate the last
>>>> paragraph of the description with this extra change, when you first sent it
>>>> in this shape on the original thread.)
>>>
>>> At least for the AMD IOMMU driver it seems to be expected.  See how
>>> amd_iommu_resume() performs a pair of disable_iommu() and
>>> enable_iommu() calls, and in the enable_iommu() function there's a
>>> call to set_{msi,x2apic}_affinity() that's expected to (re)set the
>>> interrupts.  Or at least that would be my understanding.
>>>
>>> This change reverts the behavior to what it used to be prior to
>>> 8e60d47cf011 for the suspend and resume paths.  I'm afraid I don't
>>> have a sensible way to test changes in that area, so I cannot
>>> investigate much.
>>
>> So how did you end up considering this may have been the reason for the
>> failure Marek was still seeing with the earlier form of the patch? I'm
>> simply hesitant to ack something that I don't understand at all.
> 
> Oh, I think I know what you are missing, and it's because it's out of
> patch context.  The adjusted chunk in amd_iommu_msi_msg_update_ire()
> does:
> 
>     if ( rc >= 0 )
>     {
>         for ( i = 1; i < nr; ++i )
>             msi_desc[i].remap_index = msi_desc->remap_index + i;
>         msg->data = data;
>     }
> 
> Note how it sets msg->data, as otherwise the field won't be properly
> set, and hence the caller propagating the contents of `msg` to the
> registers would be incorrect.
> 
> The change forces msg->data to be correctly set when returning either
> 0 or 1, so that propagation to the hardware can be done in both
> cases.  Previously the contents of msg->data where only correct when
> returning 1 on AMD.

Oh, I see. The loop is entirely benign in this case. I did look at the
full function, but I didn't make the connection from the writing of
msg->data.

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


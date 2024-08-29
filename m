Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8139645AC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 15:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785862.1195384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjemi-0006iN-Al; Thu, 29 Aug 2024 13:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785862.1195384; Thu, 29 Aug 2024 13:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjemi-0006gI-7v; Thu, 29 Aug 2024 13:01:56 +0000
Received: by outflank-mailman (input) for mailman id 785862;
 Thu, 29 Aug 2024 13:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjemh-0006Be-Fo
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 13:01:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd0e5a86-6606-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 15:01:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86883231b4so65018866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 06:01:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c2fsm76599666b.197.2024.08.29.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 06:01:51 -0700 (PDT)
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
X-Inumbo-ID: dd0e5a86-6606-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724936513; x=1725541313; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=73G/kKffEOfYWnxdHaXi0o5x8TmRZ28dwfnIYa9Gv14=;
        b=NBP9omltPq4QzQrwqkSPIEYImMlQg+rQGYITnzC8EPf8XnxtQV++YMzV/USaZnMNe/
         5RrVUJ1a8AB5g9Lhe+HpqiHBb3XqB7h/r1qrc50U4TKKV5ME7mAQvTpXyHDQPEAS2LW9
         jVEix+oawaciO5emF5mMBO2qLQriagezLY3/eYjiktHEnUV0aPaPizsoh8vHTPsixoe1
         guNXn6Hi/93elIH6SaAallpvc5aAwYlIJi016F8aINz5q9WBMTQEcKGDKsAzXECW+Dd3
         RrCzme1OIoIbPVFAOMfGfKh2ofrRfFrckdkMsVtm30pRzDlrEdSY6EBj2rHZsp2FRNdG
         zetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724936513; x=1725541313;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73G/kKffEOfYWnxdHaXi0o5x8TmRZ28dwfnIYa9Gv14=;
        b=hiMEKO59C7ebBvYFgHSFrB989wcUpCJAgeB63fDCeQcZUadGk01Wca8J1mfiVuc2KQ
         djGkVLxi/+vKIPSj9iu1BGdVdFvb+xihUE8L/lMdfqtdAVw5Vy06WMrcYhKtHhdfNuSt
         Kh2MraXOXtYUIQt9oxPHtLcVL9g3crp8RlB35vBidurjp1ozaqCt05zODFbbf4FP5vUV
         p803mcAthVIbES5YTOqvWu18SB0A/OITfzb78Rg4dGFw11VsFgUHstxbLP8eHCvU6Mhd
         AKPUdSiAG372Fsz/KtT3WjtvhlKZ3/oIFF1NPjsybVMZdGO3nk7OEuRUPwTgrDV48f7U
         eNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIYDD77mfV5LpPDNVwy0fESj1t3oV47F0RTNA2Kb2ede4pUd6JVCylIveMW6bkLpw8kwfftCQYzvY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwEUs4nVmkHRnwYny2mGqq0Nz/c8bRFi4ipjTEFlacVwh2yxg4
	rco92LyYzAYh/QmU9vYlijZvsWL1xUfGNqKvVntqjrU4kkhCp5xdusWmnrJIMaDWlVHn9SuPFIM
	=
X-Google-Smtp-Source: AGHT+IGi1owXCCTKYuOMLksJY+fXvyOdBg6fexDNFCj0II/IpeasckOPWDowW/NPSixbAGYVNcBXww==
X-Received: by 2002:a17:906:6a0d:b0:a86:8f32:3a68 with SMTP id a640c23a62f3a-a897f8fc7dfmr246078066b.37.1724936512220;
        Thu, 29 Aug 2024 06:01:52 -0700 (PDT)
Message-ID: <6e742ccd-71bf-4933-a7e3-c6ab91f4d196@suse.com>
Date: Thu, 29 Aug 2024 15:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] types: replace remaining uses of s32
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
 <0e6b7685-e061-4ace-88fd-86728d765e5a@suse.com>
 <3fa09b21-fb7e-4b3c-91cb-d47c25608771@citrix.com>
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
In-Reply-To: <3fa09b21-fb7e-4b3c-91cb-d47c25608771@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 14:44, Andrew Cooper wrote:
> On 29/08/2024 1:01 pm, Jan Beulich wrote:
>> ... and move the type itself to linux-compat.h.
>>
>> While doing so switch a few adjacent types as well, for (a little bit
>> of) consistency.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> with a minor formatting request.
> 
>> --- a/xen/arch/arm/arm32/livepatch.c
>> +++ b/xen/arch/arm/arm32/livepatch.c
>> @@ -41,11 +41,11 @@ void arch_livepatch_apply(const struct l
>>           * ARM DDI 0406C.c, see A2.3 (pg 45) and A8.8.18 pg (pg 334,335)
>>           *
>>           */
>> -        delta = (s32)func->new_addr - (s32)(func->old_addr + 8);
>> +        delta = (int32_t)func->new_addr - (int32_t)(func->old_addr + 8);
>>  
>>          /* The arch_livepatch_symbol_ok should have caught it. */
>> -        ASSERT(delta >= -(s32)ARCH_LIVEPATCH_RANGE ||
>> -               delta < (s32)ARCH_LIVEPATCH_RANGE);
>> +        ASSERT(delta >= -(int32_t)ARCH_LIVEPATCH_RANGE ||
>> +               delta < (int32_t)ARCH_LIVEPATCH_RANGE);
> 
> Could you vertically like this, like it is ...
> 
>> @@ -203,8 +204,8 @@ static int perform_rel(unsigned char typ
>>           * arch_livepatch_verify_distance can't account of addend so we have
>>           * to do the check here as well.
>>           */
>> -        if ( (s32)val < -(s32)ARCH_LIVEPATCH_RANGE ||
>> -             (s32)val >= (s32)ARCH_LIVEPATCH_RANGE )
>> +        if ( (int32_t)val < -(int32_t)ARCH_LIVEPATCH_RANGE ||
>> +             (int32_t)val >= (int32_t)ARCH_LIVEPATCH_RANGE )
>>              return -EOVERFLOW;
> 
> ... here?

If the Arm folks don't mind - sure, I can. I think though that the latter
only happens to look aligned, without there having been such an intention.
Kind of supported ...

> I'd argue that even this one wants one extra space in the middle, so the
> '-' is further to the right of the >=.

... by this observation of yours.

Jan


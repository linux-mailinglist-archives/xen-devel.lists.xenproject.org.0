Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645488D710
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 08:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698310.1089849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNVX-0002pX-TU; Wed, 27 Mar 2024 07:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698310.1089849; Wed, 27 Mar 2024 07:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNVX-0002nx-PU; Wed, 27 Mar 2024 07:15:35 +0000
Received: by outflank-mailman (input) for mailman id 698310;
 Wed, 27 Mar 2024 07:15:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpNVW-0002np-AX
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 07:15:34 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb577774-ec09-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 08:15:30 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso763658466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 00:15:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m22-20020a1709061ed600b00a46bef6f920sm5100486ejj.102.2024.03.27.00.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 00:15:30 -0700 (PDT)
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
X-Inumbo-ID: cb577774-ec09-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711523730; x=1712128530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=us3vri0WL6DcRRT+Qz6GKdNEgSMy7Gk8UhBt4VZBaDQ=;
        b=AI8h6vPvWWheJoX2gDGm0v6GS3lXEf0ZHLeLwQKzLRtYLN2vaTUQd5bJpyyNEyERvE
         EB6SCk2L7gTxVDa5JfwcYbOOG3K3HQ/R6qHaF/8w5+Bt3N+UlLhwU2gdz45OkaVLp73C
         61wcFxYIs2HY5LY0x+hRzghvGYI9zw7NevwTaI0hTHjoTSbTssw8MT3x6GfYGVStUFAR
         w9oInpxFCAaVqCSSRwqyjSqiJ5hze3dKDVuOG7d5tkofZFPpZK1QNLSPCj3UdDsV35vy
         BmhBFt5fuQ4DgVWt+A7f822BTBPASva5dIMik07UeKY+nyBVeeIbIVHlyXM+keD37+AQ
         P1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711523730; x=1712128530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=us3vri0WL6DcRRT+Qz6GKdNEgSMy7Gk8UhBt4VZBaDQ=;
        b=uxOvF/X4Yfr6RkNvvnSkcakFYzHVLQbkI6kFkrGuNW8oYPg+yuWByWek9zmUj/jEUv
         6VJh/NtUMHYgm4INJ3JBETu+8/p799EpJS+X6N6HyZ6z2jenj0m+IFLQM2SvSReQMQW7
         AoQ9swJKAn6T5oIsBtBC7hfcx5pvzGvjoHFHMLWnA9E+Jg3nSo3PEMV8KYLUr1Skh4BD
         kMsZbB8DVCs21ra7tOcobs28kPZjhu7wTs5reUDqygQuxMvgvFRX4wruDslkAJlpVF9O
         APvp6XAIHsv4IdwmekGn0zOAxELzP0Gq6KBQzoOi/mj9b6xdfN650CqeIChHd2C90kIe
         Oa/Q==
X-Gm-Message-State: AOJu0Yxb0voaJUWL5060MRAMSaPj2+mL/weiy2mC/mv4ucxySYhWaTvD
	QZli/Tbl9cHwcwxmhYuMBi+mJS2Q6IiNngNi7+CDfXRhF++8SOsRvPYdm5AbZQ==
X-Google-Smtp-Source: AGHT+IHOO2TRxPsinQvFcUlHEbIjARG7G9DIoydtkKZCeqgGiLZjMyIHE9KQHCLQMqvzkRmXKoNmIw==
X-Received: by 2002:a17:906:5943:b0:a45:f352:73b0 with SMTP id g3-20020a170906594300b00a45f35273b0mr260881ejr.65.1711523730528;
        Wed, 27 Mar 2024 00:15:30 -0700 (PDT)
Message-ID: <fcd2183e-d506-4683-ace1-73978002c93b@suse.com>
Date: Wed, 27 Mar 2024 08:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <1304a0d2-ff17-4823-9d31-c32eb7b79f30@citrix.com> <ZfryIBR6RECujayD@macbook>
 <815d5bd4-18af-4f5f-b6a5-6302a1d682a2@citrix.com>
 <d3679e6c-f877-4198-8423-26e9734bdd44@xen.org>
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
In-Reply-To: <d3679e6c-f877-4198-8423-26e9734bdd44@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2024 23:08, Julien Grall wrote:
> Hi Andrew,
> 
> On 20/03/2024 14:39, Andrew Cooper wrote:
>> On 20/03/2024 2:26 pm, Roger Pau Monné wrote:
>>> On Wed, Mar 20, 2024 at 02:06:27PM +0000, Andrew Cooper wrote:
>>>> On 20/03/2024 1:57 pm, Roger Pau Monne wrote:
>>>>> There's no reason to force HVM guests to have a valid vcpu_info area when
>>>>> initializing a vCPU, as the vCPU can also be brought online using the local
>>>>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>>>>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>>>>> vcpu_info.
>>>>>
>>>>> Restrict the check against dummy_vcpu_info to only apply to PV guests.
>>>>>
>>>>> Fixes: 192df6f9122d ('x86: allow HVM guests to use hypercalls to bring up vCPUs')
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Thanks for looking into this.  But, do we actually need to force this on
>>>> PV either?
>>> Possibly, having now taken a look at the users it does seem they could
>>> cope with unpopulated vcpu_info_area.
>>>
>>> Part of my understanding was that this was some kind of courtesy to PV
>>> guests in order to prevent starting them without a vcpu_info, which
>>> strictly speaking is not mandatory, but otherwise the guest vCPU won't
>>> be able to receive interrupts, not even IPIs.
>>
>> That's more of a stick than a carrot... "you must set up the area of a
>> CPU before you can bring it online". Except as we've seen, HVM has been
>> fine all along without it.
>>>> The only interesting user of dummy_vcpu_info now is vcpu_info_populate()
>>>> which can cope with any arbitrary vCPU.
>>>>
>>>> I have a suspicion that we can (now) delete these two checks, delete the
>>>> dummy_vcpu_info object, and use a regular NULL pointer in
>>>> vcpu_info_{populate,reset}(), and in doing so, remove one of the bigger
>>>> pieces of PV-absurdity from Xen.
>>> I was expecting this to be something we can backport.  OTOH removing
>>> the check completely (or even getting rid of dummy_vcpu_info) is not
>>> something that we would want to backport.
>>>
>>> I would rather do the removal of dummy_vcpu_info as followup work.
>>
>> I was worried about ARM with your patch, because it's spelt HVM there,
>> rather than PV.
>>
>> However, I'd forgotten that ARM's do_vcpu_op() filters ops down to just
>> VCPUOP_register_{vcpu_info,runstate_memory_area} so VCPUOP_initialise
>> isn't reachable.
>>
>> Therefore, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> It also means ARM can't use any of the PHYS registration yet...
> 
> Whoops. I don't think this was intended. Jan, I don't seem to find any 
> use in Linux. Do you have any patches you could share?

No, I don't. I did all development with hacked up XTF tests, and I was
expecting Linux folks to be looking into making use of the new subops.

Jan

> I would like to 
> give a try on Arm before sending a patch?
> 
> Cheers,
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12912ADABA0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 11:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017087.1394062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5wY-0004FO-LZ; Mon, 16 Jun 2025 09:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017087.1394062; Mon, 16 Jun 2025 09:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5wY-0004Ca-IL; Mon, 16 Jun 2025 09:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1017087;
 Mon, 16 Jun 2025 09:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR5wX-0004CU-TP
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 09:15:53 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f886454-4a92-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 11:15:51 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso7352386a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 02:15:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec897c397sm608227866b.167.2025.06.16.02.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 02:15:50 -0700 (PDT)
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
X-Inumbo-ID: 7f886454-4a92-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750065351; x=1750670151; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zakZW4TQ6czVjCAgC/J66dSaFBWhhBULmtTR8W6ffb4=;
        b=RNLMuLQGCFZ5qlgnXrdCCWdvxQM2PtfoA8HcQWirk71pK8zPhYr4cjgYtVHvV+BQk1
         5ZRLNWEYaWffSUGMt92fwPCpzf9V6OjJmpXmcByA2DltH8yJsBuA681qw6DbIIV5US/u
         +YO456nlzGuzRG2Ss1betQH+WOTzDkvvponruV9esY1C3yvIL7mydoV4s/SPtcea6ufg
         nI+s410LJ8yPEz2KMxCBzx7V8Eh/D3xwfj/a7fDhHoW/V+iLQPiwIHIdg5l0AMCTwCVr
         LN7Wyif6d10XSEhi6iqIFWMtH7o5znQDOpaCzXMkimY/wE6y+NfWxVDrVuGDzFJwb1ru
         iKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065351; x=1750670151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zakZW4TQ6czVjCAgC/J66dSaFBWhhBULmtTR8W6ffb4=;
        b=pxoRLT+8vqaIB7z8/1H2SIkbUU+Wu1zRt8NHalQZnttYB1G0CM9hzF0szO4TJEblm0
         YmvBHrKVLxOi3UTuZfD9/JJpod+yA3edN1x9YrV9264xnNlPJCZ+ChQsZd0dcbuGJg2I
         JJ1Zs0rJeUqiQc15e8PgrQT/Zta8PcDV9fg0OafNa6liBijhWLRe0RhZo9ZCe2vscotE
         x9gv4u2pdJ1fs1YXaKSDsHxKrYzlpCY3xEA9gW/n4BaXBUXDhh3PbrlbOlWXW9ZOHBZ9
         Z4Zz8jvzefX5AwEHLtiaEsuDptvbZDCVEAtHsRIPli9gLZceL5wR8EFv5Ua5k2Y4CMFj
         NkqA==
X-Forwarded-Encrypted: i=1; AJvYcCWNOG8Pkeo3d43SfEmEJDrYjKOUugLo6ywccX+oNrmI15BXDX/Obq8Uf+VpMvJhS3fC2YYCF09i+1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlD9dPDZ+THOItCTfNE3jE4s1imvA8lfNUOJ5frRn0iCsvroiA
	WUZb1KGKGHkuBj454EvRC6qXhkV5YSFGGICNI0pef6mfty5MylKzMG2B3jzJ2VIcSw==
X-Gm-Gg: ASbGncviIOx6u8A+fmQKov5g7JB7YpgveqgQCBUvbFzECoAhhjzVNhZLJoCM2aJXeT1
	G4kkCq42ndbL2AmOihoNRM99pvX79aVVA25POdmDKt7O9eK5cciNlCWRBj26BelTzP09dYAunV6
	cXuZ9qCXh9A0lRaUFpzCnMOZgYoys5CmR/o/dNqtKlrHj82nBKBsEpWfv/QfS6fwAhmchve/mKf
	WCt4zfsKochjsRk2MUNN9RNzYW4A6WElQqQJXAOTW/QE8XKXLBlFxxFC44ZKlWtMMllIC50dMeY
	7UaKwml9Ndd0Vg7YWEZ1CqsGbd34Q/RWg567bu00YhT27dI6wSiBgYvmi5SrQjNsepv4bec7zmf
	/AgFngLB8fdLhj7IWKPQCR8czfgDPcflyHl6+7XyJ4KWgLSo=
X-Google-Smtp-Source: AGHT+IGeP7YdrEj/GzVMGc8LwA7MKUfDRO9xDdgl9D+d9wgz/mJYM7ESi0ud2XKGAU7fArSZn7pDeA==
X-Received: by 2002:a17:906:6a1b:b0:ad5:7234:e4a9 with SMTP id a640c23a62f3a-adfad54b256mr792891766b.28.1750065350914;
        Mon, 16 Jun 2025 02:15:50 -0700 (PDT)
Message-ID: <d156a26c-67a9-4915-a5a2-bf49a4c3e8b5@suse.com>
Date: Mon, 16 Jun 2025 11:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
 XEN_PX_INIT
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-2-Penny.Zheng@amd.com>
 <0d60d42f-d844-41b5-a8ca-bdfe7883d15b@suse.com>
 <DM4PR12MB845179B8BDD9399B0DDB7260E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845179B8BDD9399B0DDB7260E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 11:05, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, June 11, 2025 11:20 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
>> XEN_PX_INIT
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> Accessing to perf.states[] array shall not be only guarded with
>>> user-defined hypercall input, so we add XEN_PX_INIT check to gain safety.
>>
>> What is "guarded with user-defined hypercall input"? And what safety are we
>> lacking?
>>
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -228,10 +228,13 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op
>> *op)
>>>      ret = copy_to_guest(op->u.get_para.affected_cpus,
>>>                          data, op->u.get_para.cpu_num);
>>>
>>> -    for ( i = 0; i < op->u.get_para.freq_num; i++ )
>>> -        data[i] = pmpt->perf.states[i].core_frequency * 1000;
>>> -    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
>>> -                         data, op->u.get_para.freq_num);
>>> +    if ( pmpt->perf.init & XEN_PX_INIT )
>>> +    {
>>> +        for ( i = 0; i < op->u.get_para.freq_num; i++ )
>>> +            data[i] = pmpt->perf.states[i].core_frequency * 1000;
>>> +        ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
>>> +                             data, op->u.get_para.freq_num);
>>> +    }
>>
>> Going from just the code change: You want to avoid copying out frequency values
>> when none have been reported? But when none have been reported, isn't pmpt-
>>> perf.state_count (against which op->u.get_para.freq_num was
>> validated) simply going to be 0? If not, how would callers know that no data was
>> handed back to them?
> 
> I may misunderstand what you've commented on v4 patch "tools/xenpm: Print CPPC parameters for amd-cppc driver", quoting the discussion there,
> "
> This looks questionable all on its own. Where is it that ->perf.states allocation
> is being avoided? I first thought it might be patch 06 which is related, but that
> doesn't look to be it. In any event further down from here there is
> 
>     for ( i = 0; i < op->u.get_para.freq_num; i++ )
>         data[i] = pmpt->perf.states[i].core_frequency * 1000;
> 
> i.e. an access to the array solely based on hypercall input.
> "
> I thought we were indicating a scenario, user accidentally writes the "op->u.get_para.freq_num ", and it leads to accessing out-of-range array slot in CPPC mode. That's the reason why I added this guard

Well, it's not an out-of-range access, but a NULL deref, but yes, the concern voiced
there is related. But that can't be done in an isolated patch, it makes sense only
together with the change to the if() that I did comment on. And even then if it is
guaranteed that perf.state_count is always 0 when perf.states is NULL, we'd be fine
without any change. Yet this latter aspect goes back to the question I had raised
there: "Where is it that ->perf.states allocation is being avoided?"

> Buit as you said at the very beginning,  op->u.get_para.freq_num is validated against pmpt->perf.state_count, so ig the above scenario will not happen, I'll delete this commit.

Not sure yet whether deleting is the right course of action.

Jan


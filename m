Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D96F996DBD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814630.1228234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXgZ-0000OH-Uf; Wed, 09 Oct 2024 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814630.1228234; Wed, 09 Oct 2024 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXgZ-0000Mh-RS; Wed, 09 Oct 2024 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 814630;
 Wed, 09 Oct 2024 14:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syXgY-0000Mb-BW
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:29:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6339eb7-864a-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:29:05 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so1918752a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:29:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c9280ad099sm629809a12.84.2024.10.09.07.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:29:04 -0700 (PDT)
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
X-Inumbo-ID: d6339eb7-864a-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728484145; x=1729088945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dKPOmaEhYZkN1Iu6/2SbFWlqIYR9fqCaCVWEXN7uZUw=;
        b=E08K0OBZ433m5PAKhT3TM+Qa/4ij0w56D07MxMr9t8xZoC4E8/renYMx8ZGnB0bqms
         p9I19joM73RSk2bRdj8ZR463AagyPTXteVDsD0Cw7npJXKPH2CkqncknH4frehBfdmPz
         Uey7rUkdq31uHzX9Rzy/B8QFjEVPKbgwgnaweFEfeVd9BHl1laYho6NPMbQCSmmDjfjS
         VrD/54KCCHWLoYeslYoDeR67wsnxBEqW64ijKUdv4jkBFplCcMabe2L8omeM+/wfT3Bv
         cCFJL7c76Ysl6742i0qwvEMOqKEWCV1qdvPqs77JK/3g5jSq2DmjIPE8ZcGj0oHSHkzp
         w8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484145; x=1729088945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKPOmaEhYZkN1Iu6/2SbFWlqIYR9fqCaCVWEXN7uZUw=;
        b=h71V/iriemkQjnAqMkJK/ibb3gQB6kMxVa4BEdPhONRvGkE71AWUoIsN9aaGFgjXJo
         r4DLHiUs/Yiz+MmTGRsj9TF2Yr4d4IDE9yMDg6CkC7AReJT4S65YZUpQRV2FyIpst3e1
         yMFtdoa1iJ3S8ptfV6NTm4EgS85TxCKQuZDoNe/YJayuSuKbK9GMljeCGzDhdilGDDoT
         ddYSrTnPLXqjZHrQyhj4Qv3iRRsKT9fLfXlao8Ush0/ksDb4GrrT3NixfWzeFOCqs/CS
         krCxiVOuzYwQpNs17ZeVBkZlQmdTaipxc49PhXf7Go+wy1NzO+mkrwggCpEZ+g5vtWdR
         v3gw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5PDRY0rritQqOJAkp0aMQLs5/57yHBa5TwWbjDtKVD+jgiZ3TeGriRZLK3f6CX8ZBy9kDYAdtek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdkhH9+c1EdxovcpyFWPJcJC/uFOdSDQnAQiMvZh2cKRa+ba5l
	0du5ZUltmc/Ns0UlENGmZf/WWdi4P076bVxEHhdPkiqUuquFhNQ+8fLmMdEQdg==
X-Google-Smtp-Source: AGHT+IGsTgUFeg+A2M/uCGAqgAlmoUrdnsoPsLchlKwtVZWMmuitqz4v0e5/Q/Nb3fUQA4x6ezGyPA==
X-Received: by 2002:a05:6402:c44:b0:5c8:a01c:e9b2 with SMTP id 4fb4d7f45d1cf-5c91d0e937amr2775819a12.17.1728484144629;
        Wed, 09 Oct 2024 07:29:04 -0700 (PDT)
Message-ID: <783a1354-4b34-4b21-9949-b2dd27c9a86a@suse.com>
Date: Wed, 9 Oct 2024 16:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/44] x86/boot: convert setup.c mod refs to early_mod
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-9-dpsmith@apertussolutions.com>
 <a2346abb-e332-40a3-88bb-0159f6a359e8@amd.com>
 <f715e69c-928a-49c4-ae72-49c8444b0a9c@apertussolutions.com>
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
In-Reply-To: <f715e69c-928a-49c4-ae72-49c8444b0a9c@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 16:23, Daniel P. Smith wrote:
> On 10/7/24 15:34, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1341,15 +1341,15 @@ void asmlinkage __init noreturn 
>>> __start_xen(unsigned long mbi_p)
>>>       set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>>>       kexec_reserve_area();
>>> -    initial_images = mod;
>>> +    initial_images = bi->mods[0].mod;
>>
>> Isn't this wrong?
>> mod is the array of module_t * of *all* modules, but bi->mods[0].mod is 
>> a single module_t *?
> 
> No it is not wrong:
>    bi->mods[0].mod == __va(mbi->mods_addr)[0]

Yet as it's seemingly wrong, a comment appears to be necessary.

Jan


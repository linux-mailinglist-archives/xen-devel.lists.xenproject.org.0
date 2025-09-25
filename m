Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D31B9D89F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 08:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129905.1469607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fCT-0008ST-Of; Thu, 25 Sep 2025 06:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129905.1469607; Thu, 25 Sep 2025 06:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1fCT-0008PK-KA; Thu, 25 Sep 2025 06:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1129905;
 Thu, 25 Sep 2025 06:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1fCR-0008PC-K0
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 06:11:27 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77ae1da6-99d6-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 08:11:26 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-62fca216e4aso1072008a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 23:11:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a364fee9sm636715a12.16.2025.09.24.23.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 23:11:24 -0700 (PDT)
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
X-Inumbo-ID: 77ae1da6-99d6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758780685; x=1759385485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MBv6ftHUSjPzTuW9B1LXl5PGydN16VlgcmlbMWeGDeI=;
        b=UiqwPpdNzyPkbP0+IizbhhkjrkeZjRPOyplr/uE4nDRMijgQ0+P5rfNselynWJaonV
         2b/uPH4JKekB4esq+mqnjaOhUvfGl10fj/zPgsUgY3QPZeNLeWRtDxyw7OWqIAwWQ98A
         G9SqleLfIigKrxt2AVxPYjZH1KBQUdNkCb4bC76ranFQMlZm4tdzkgpXuCoHTvxD3+pA
         mNMCChKW+qa0aZa7j26sCLiQfA1KeIdiHihBh68GtO2veb8Sf295Tk/q4EiSF+Y9ceG1
         vCNCbsJXceIuysvvmrXF7AIxvoZ5cIEMhdjTwaqKck1RtUsKxUO0X1iLJSoEMWcULmVq
         hM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758780685; x=1759385485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBv6ftHUSjPzTuW9B1LXl5PGydN16VlgcmlbMWeGDeI=;
        b=kz2vZqzRA/pf38s2l4WcoIoMmcjOpzkVUbN75IOyATbFkEg9mjDCG4X/1qb1JlZpDo
         x1D/aod9tnoYtM3xuQ9Q9NuEWRpquv5LY9ref/aqXc9dVT4U13cZSmj2HhC4ce5b9xTQ
         EUSJvksxhNJ2gsa0ZUCsgAAzmlUVH11bVxIAF4kSh1rqW1CGRlAsKeJgdcHOJ2KJIbWh
         UQKpr5wHPLTg62TmP/2qEJYe0fChSJw6upOjGhUoxYKfCdbmGT2eyqsj4fgl8LtXdm28
         zemcjaj3t2lEwUIVi3fSmirPM5qe8u2cgJkkE5t22YUxRSVzwh4g4Vydi+Mbgmlyhid6
         g1nw==
X-Forwarded-Encrypted: i=1; AJvYcCUpJyhipZ76KkbuIAOPd5t5KodJuVjPV91TrdT0/Dj0kQiWQwkIJoRbUSgXkhoSzcSkd5RCaqhsZ2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8GPbUeFVx4dCT1i/ilm/AbOMiN8ACuR7/sf8ecZUrBeBSwovH
	uMEDrpD4ZiCrXygSbv3RcGu36yqf+T7hsBhYEa9E7O9EMY9LLkM1ps9oZ4fKXqERPA==
X-Gm-Gg: ASbGncuBJFZI5ZiGSlrVSK076fGAWgu7a8ihjZjcamJPRhzmJw6Ik/o7vgX5feMwjw2
	4VPEwKm/9g9HP0h/2Rfj7uS2jPH9hA1GQOqZu8T/5yVVVAHs/bFZw4z1wcNN2L/dNqZPPvqBSa8
	akOB/MQ/TCAHSNKaEXa1fs+hrMlx0hbT1/GrF/wXbltdnr1Wxm394n55pF9IX4a+TDyEXU1WaPa
	g2hj/nDW/PGy8kRZTMiPtiUFw1CeXtT2fVbuReo80J4e17LVudbsp6qUAMHtL65I5YKuQ/+MGaz
	eqb0tA97MLqz9GU9a1wy21Elua1kn9wwf4CEkXg8d8vO5h/y4P4LW6W/064po4CzRVzwZgoKHdk
	wODMxZF6UDv3yo5kK/zVJDjRfzSXMmSWIfezGK75xYG7uAYsm4GZLDNVwrSupxF5bFTWr/Z04ce
	RjWvSdhas=
X-Google-Smtp-Source: AGHT+IFLw+dfTHbh1IdN169leXpJQ8ehjhvkJC19+T9DrNY1dZ35CQDZZeee84SxjkSGaashcp4v5A==
X-Received: by 2002:a05:6402:234d:b0:634:54f3:2fbb with SMTP id 4fb4d7f45d1cf-634a292cddcmr1512674a12.3.1758780685412;
        Wed, 24 Sep 2025 23:11:25 -0700 (PDT)
Message-ID: <83116585-65ef-45fa-9358-586ae46753aa@suse.com>
Date: Thu, 25 Sep 2025 08:11:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Jason Andryuk <jason.andryuk@amd.com>, Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-8-Penny.Zheng@amd.com>
 <5a2e887f-d6da-42e2-aff0-efe55b041749@suse.com>
 <1106c080-508b-4328-a636-900ca8377d2d@amd.com>
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
In-Reply-To: <1106c080-508b-4328-a636-900ca8377d2d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2025 18:47, Jason Andryuk wrote:
> On 2025-09-23 11:38, Jan Beulich wrote:
>> On 23.09.2025 06:38, Penny Zheng wrote:
>>> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>>>       else
>>>           strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>>>   
>>> +    /*
>>> +     * In CPPC active mode, we are borrowing governor field to indicate
>>> +     * policy info.
>>> +     */
>>> +    if ( policy->governor->name[0] )
>>
>> amd_cppc_prepare_policy() may leave ->governor set to NULL afaics, so I
>> think you need to add a NULL check here alongside with pulling this out
>> of ...
>>
>>> +        strlcpy(op->u.get_para.s.scaling_governor,
>>> +                policy->governor->name, CPUFREQ_NAME_LEN);
>>> +    else
>>> +        strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
>>> +                CPUFREQ_NAME_LEN);
>>> +
>>>       if ( !cpufreq_is_governorless(op->cpuid) )
>>>       {
>>
>> ... this conditional.
>>
>> The description also continues to not mention the effect for HWP. I'm
>> actually somewhat confused, I suppose (Jason, question mainly to you):
>> HWP falls in the governor-less category, iirc. Yet it doesn't supply
>> a .setpolicy hook, hence __cpufreq_set_policy() goes through the normal
>> governor setting logic. What's the deal here? The answer may affect
>> whether I'd deem the pulling out of the conditional correct (or at least
>> benign) here as to HWP.
> 
> Hi,
> 
> When I wrote HWP, I didn't realize using .setpolicy would bypass the 
> governor code.  Instead, I implemented the no-op HWP governor, since I 
> thought I needed something as a governor.
> 
> set_hwp_para() actually changes the configuration.  HWP only implements 
> the equivalent of amd-cppc-epp autonomous (active) mode.
> 
> So I think HWP could switch to .setpolicy and drop its governor.
> 
> But looking at this hunk:
> 
>  > @@ -321,10 +327,12 @@ static int set_cpufreq_cppc(struct
>  > xen_sysctl_pm_op *op)
>  >      if ( !policy || !policy->governor )
> 
> Doesn't this !policy->governor prevent amd-cppc-epp from setting 
> parameters?

Only if amd_cppc_prepare_policy() took the default case path of its switch(),
aiui. Penny?

Jan

>  >          return -ENOENT;
>  >
>  > -    if ( !hwp_active() )
>  > -        return -EOPNOTSUPP;
>  > +    if ( hwp_active() )
>  > +        return set_hwp_para(policy, &op->u.set_cppc);
>  > +    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
>  > +        return amd_cppc_set_para(policy, &op->u.set_cppc);
>  >
>  > -    return set_hwp_para(policy, &op->u.set_cppc);
>  > +    return -EOPNOTSUPP;
>  >  }
> 
> So there may be other checks that would need dropping or adjusting to 
> support HWP without a governor.
> 
> Thanks,
> Jason



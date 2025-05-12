Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5EAB3CD2
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981811.1368220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVXV-0002Kk-F3; Mon, 12 May 2025 15:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981811.1368220; Mon, 12 May 2025 15:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVXV-0002JD-Bq; Mon, 12 May 2025 15:58:01 +0000
Received: by outflank-mailman (input) for mailman id 981811;
 Mon, 12 May 2025 15:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVXT-0002Io-Ct
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:57:59 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfc952ba-2f49-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 17:57:58 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad1a87d93f7so718547066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:57:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2198b6ebcsm629255866b.185.2025.05.12.08.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:57:57 -0700 (PDT)
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
X-Inumbo-ID: dfc952ba-2f49-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747065478; x=1747670278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=URsiW6etZeVXBbbA4YDam9YA558UTVI6TLs+9tPd8hA=;
        b=R6ZNdu7bgMeqILBcPzPODeR1qBrUAXEBT++84hkx0xR/bMo7B3eJ8Ba6wZfeZ4uD5z
         dfzcnftL5Jhwf+VHtH4JObA4uFAo9j0JSvF4lVRkmSXHezz9ZZ9zYr3gxUMj/R5Xx5gU
         h9M92IrBnqt6YHEUmyGPym/24yPVjB3vl6G8hpnqnNkQgZWt4AqPpj3BsE6Te8ODP/VR
         H6WrkRdmPB+LZ/ugwv9WrT7ASEL8PMq2raqNkQZDFaK9ONBso+4U9tR8a5unMM3lYHDY
         qpdNzbJbW8dVC0Z2iGozMD35o1qsg1G8mwPJWdQK+9GHPdyz2tht5JoDcM0GWl8m/ygZ
         LYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065478; x=1747670278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URsiW6etZeVXBbbA4YDam9YA558UTVI6TLs+9tPd8hA=;
        b=HJNh5Nv+YS1AS/BcsBb888vDXp5ZqzhC+ejpYXzZA9UxHa3NPc8pA1w6mz9m9nfOlT
         wJbFFtud9Tj2OBV0O+KzhqSu16l+ZoZ09VUT3EtPV/pqho8UQm+8Mwa/1g/2Kqd2+RDU
         dn5pCIauxTuc7UXoQHZq6wVC1XeDy7RFDK4pi3VyfTlIQgPZPOLPKE25LWXfnTY9XuQN
         Mzgru1nYVCHS3kdqziWhfSO7wXYTybhEY8SGJwZWRxd7X2a9mRM7XWiEpQUyW6xlU/qV
         g6aQ4Y/3S68Ro2NjPqx/7v8OCwh6Pl48ZXq4wNQqdXr5/APHSr31zH2+xJEbaqEGF4t7
         Ja0w==
X-Forwarded-Encrypted: i=1; AJvYcCW+NJn/vGPtTNMYkI+aeAMn/KdbgGVAAMd1u4L5TBaGHKiM3gpWk9oCDS4z6RZYO2JtcW3+w8fwEPw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTMTejKXnj/uA4Rl4Wnh0Hoh+jr3Unw5RMC9FyGhpuJz2FJUzA
	zkO49kH3ZgKqECslnHdPy1Vb93GEDDgfFR5NG/r/P97UBl+nQC4NzeYPTacqDw==
X-Gm-Gg: ASbGnctwrQOUQclEAV4pE/ng8qesEPWOfZwMEduRYubBbkWaG5zeDAc4/xvFZQIwdFN
	t4Z1nyimWaD/bWveuioA3Mmndx1NgpFIU9tC+C92A21J52tcmRxaua76kUez/KkEVxJE47n0iYi
	cgltSH87TU98cFgeAThtcnDHn930EjebPraQiA3iBu9u/DOwSc6nGTgUxtkQJ3OezgYIi8Q6Jd5
	tpmTgCOmfxO17XTWyDyqc186TteNPFkOw0ulkoN9WzNS3Y7TsrqxhIgVVQYeojJRaQM/AGjBDHu
	H/qs78n61Dc2mxPS7WHefKtPts2dK7WXsDX3X8t2T2EhthhZNZpl0YLGUIjXxmDvaYfQ+oWb1+N
	OMIGRKjA7hsFL2lKOdHosXd3XUNmdSLiZIIAY
X-Google-Smtp-Source: AGHT+IGYzBCPpKKDd6jx8W288tNm6UNLaayrzFAg/SP6KqOZEzURr1agHSigVs4ba4R7TcJO9Rr8jg==
X-Received: by 2002:a17:907:7216:b0:ad3:f3dc:e36d with SMTP id a640c23a62f3a-ad3f3dce636mr251179766b.50.1747065477824;
        Mon, 12 May 2025 08:57:57 -0700 (PDT)
Message-ID: <eeb66db3-623f-4ca8-9ea5-4d89e5b4a824@suse.com>
Date: Mon, 12 May 2025 17:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
 <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
 <889d2b2b-db42-43d2-9da0-dcd130d64d9c@suse.com>
 <DM4PR12MB845196DB77AC3D6FBCC1C69BE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845196DB77AC3D6FBCC1C69BE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2025 05:18, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 29, 2025 7:47 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
>>
>> On 29.04.2025 12:36, Jan Beulich wrote:
>>> On 14.04.2025 09:40, Penny Zheng wrote:
>>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>>> @@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
>>>>
>>>>  static int __init cpufreq_cmdline_parse(const char *s, const char
>>>> *e);
>>>>
>>>> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
>>>> +{
>>>> +    unsigned int count = cpufreq_xen_cnt;
>>>> +
>>>> +    while ( count )
>>>> +    {
>>>> +        if ( cpufreq_xen_opts[--count] == option )
>>>> +            return true;
>>>> +    }
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt
>>>> +option) {
>>>> +    int ret = 0;
>>>> +
>>>> +    if ( cpufreq_opts_contain(option) )
>>>> +    {
>>>> +        const char *cpufreq_opts_str[] = { "CPUFREQ_xen",
>>>> + "CPUFREQ_hwp" };
>>>
>>>         const char *const __initconstrel cpufreq_opts_str[] = {
>>> "CPUFREQ_xen", "CPUFREQ_hwp" };
>>>
>>> (line wrapped suitably, of course) Or maybe even better
>>>
>>>         const char __initconst cpufreq_opts_str[][12] = {
>>> "CPUFREQ_xen", "CPUFREQ_hwp" };
>>>
>>> for the string literals to also end up in .init.rodata.
>>
>> Actually, it didn't even occur to me that there might be a "static" missing here, too.
> 
> Sorry, I may need more explanation, what is the "static" missing you are referring?

In your code cpufreq_opts_str[] is an automatic variable, which the compiler
needs to emit code for in order to instantiate it on the stack. This can be
avoided if you make the array a static variable, as then all construction
occurs at build time.

>> Plus I'm missing any arrangement for the array slots to remain in sync with the
>> corresponding enumerators. With that ...
>>
> 
> Thanks for the detailed instructions, learned and I'll change it to
>         const char __initconst cpufreq_opts_str[][4] = { "xen", "hwp" };
> And for in sync with the corresponding enumerators, maybe we shall add comment here,
>         /* The order of cpufreq string literal must be in sync with  the order in "enum cpufreq_xen_opt" */

Instead of a comment I has rather hoping for some use of dedicated array slot
initializers.

Jan


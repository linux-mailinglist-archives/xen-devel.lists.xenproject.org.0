Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D1993EA7
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 08:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812648.1225430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3aw-0005E4-EJ; Tue, 08 Oct 2024 06:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812648.1225430; Tue, 08 Oct 2024 06:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy3aw-0005Bn-An; Tue, 08 Oct 2024 06:21:18 +0000
Received: by outflank-mailman (input) for mailman id 812648;
 Tue, 08 Oct 2024 06:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy3av-0005Bh-7k
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 06:21:17 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85fefe92-853d-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 08:21:16 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9977360f9fso26655266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 23:21:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9952bd2b24sm240265366b.163.2024.10.07.23.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 23:21:15 -0700 (PDT)
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
X-Inumbo-ID: 85fefe92-853d-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728368475; x=1728973275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZckXbyXPo/+MqlXxLBGb0IGYUR+yj/VGaasMMPb2MC0=;
        b=erUKBBsbSF1BJEmL+aM7Wxzp+XT/r3AIJR23cXrAh2IHXHdO0F4Sn+V+UMqw8FdKAm
         PhqZF3C3XnIoNwQbBJfBbfP5QMlszaBF4EQHAaiQqSlz3iftHpiIJ1xJyL9WHwqQSKAy
         NFWFRdKOw7HZeH7tllONIDKHLDfHKJEDqFpnS7v50Z5ne+iG57paRgWo8NPY8Mm5vdgi
         oNx96VVfibpzPhxZnlgRefaIDNBXOahatq4NNDTk4GgBp4noJEq7CW0teXkgIfqCLDsl
         GGWvOTK4H7N9AGtyEX86B8jKBx/H4ZGVLM24wPGlNXnwaZPXwEl/hg0xofeXEKuCwJ1Z
         ZGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728368475; x=1728973275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZckXbyXPo/+MqlXxLBGb0IGYUR+yj/VGaasMMPb2MC0=;
        b=VkXe8ms75MZsatSH70THoUOgn2Si+z/ptZv4bTrrWqoLE/435TUT8dGj+APwBEWOif
         1RKVfgeldKtE8PW/+9YQ8D2bV6DbhwVle9nf16Q7Gj0LulFA+kHWdilI7wbyraBoCQ8j
         JphgaP5/LwQKZZtgnx6pvWfM+LckToPjHqoC/gPqR40D7krY/HdLElxaez7DYQ4zxP6c
         Uc+y09iE5+GK6dhwFYNyqX7ULpYHmfeCl8qUZqjid8uaD6ePMr5FecW/uxIcef9T3c/A
         PsyiiXQcDVSoKEXncgLJBn0bj0OR3J3tb5W4jo6vGnO7pYxU+mY09W6ZbQmd/v6/l2X3
         mGbw==
X-Forwarded-Encrypted: i=1; AJvYcCUQp2ai1Q9ODeLdt1jocKrlkEqkzHqHiC2qy3w/gKte3mlu2sx2+p0d+K7jqL8ftgxhxcrLfM+gnl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaDXHxv6IKl+znWgR2kl2yFkz+I4rnsGScyXUfJQDv7YpMgBfT
	lQOVo27eflsiItVNDE2SLugy7CLwhX0owL/JdYeAwubh0m9TfXIV/LfWEtYZIw==
X-Google-Smtp-Source: AGHT+IGcO0dTPjYyhMTRJvhTU8esFRsjbXd8xYNt3W/eRrl2D9G+WG7v5nRRYOrQWt/G3xaCWOsNKg==
X-Received: by 2002:a17:907:9281:b0:a7a:97ca:3056 with SMTP id a640c23a62f3a-a991bd0a833mr1358650166b.16.1728368475410;
        Mon, 07 Oct 2024 23:21:15 -0700 (PDT)
Message-ID: <ff8bef04-d17c-427a-820f-3565ffeafde3@suse.com>
Date: Tue, 8 Oct 2024 08:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
 <c27ebb1a-6ca4-41d7-99d8-ea613e3120fc@suse.com>
 <c0ce0c42-6b23-4687-a444-81a617629125@amd.com>
 <dc2ba7dd-fc55-4f4b-a33f-c733bb142efe@suse.com>
 <3b160dfe-9f46-479b-acd6-57f6ca6da72e@xen.org>
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
In-Reply-To: <3b160dfe-9f46-479b-acd6-57f6ca6da72e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.10.2024 23:25, Julien Grall wrote:
> Hi Jan,
> 
> On 24/09/2024 13:22, Jan Beulich wrote:
>> On 24.09.2024 13:54, Ayan Kumar Halder wrote:
>>> Hi Jan,
>>>
>>> On 23/09/2024 11:23, Jan Beulich wrote:
>>>> On 18.09.2024 19:51, Ayan Kumar Halder wrote:
>>>>> Secondary cpus initialization is not yet supported. Thus, we print an
>>>>> appropriate message and put the secondary cpus in WFE state.
>>>>>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>> Changes from :-
>>>>>
>>>>> v1 - 1. NR_CPUS is defined as 1 for MPU
>>>> Not quite, what you do is ...
>>>>
>>>>> --- a/xen/arch/Kconfig
>>>>> +++ b/xen/arch/Kconfig
>>>>> @@ -11,6 +11,7 @@ config NR_CPUS
>>>>>    	default "8" if ARM && RCAR3
>>>>>    	default "4" if ARM && QEMU
>>>>>    	default "4" if ARM && MPSOC
>>>>> +	default "1" if ARM && MPU
>>>>>    	default "128" if ARM
>>>>>    	help
>>>>>    	  Controls the build-time size of various arrays and bitmaps
>>>> ... merely set the default. I wonder how useful that is, the more that
>>>> - as per the description - this is temporary only anyway.
>>>
>>> Yes, I can enforce a build time check like this.
>>>
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -295,6 +295,12 @@ void asmlinkage __init start_xen(unsigned long
>>> fdt_paddr)
>>>        struct domain *d;
>>>        int rc, i;
>>>
>>> +    /*
>>> +     * Currently MPU does not support SMP.
>>> +     */
>>> +#ifdef CONFIG_MPU
>>> +    BUILD_BUG_ON(NR_CPUS > 1);
>>> +#endif
>>>        dcache_line_bytes = read_dcache_line_bytes();
>>>
>>> Does this look ok ?
>>
>> Well, I'd still want to understand the purpose (if I was maintainer of
>> this code at least). You can't bring up secondary processors yet - fine.
>> But why does that mean you want to limit the build to NR_CPUS=1? Any
>> number is fine, but just not useful?
> 
> I have suggested to restrict NR_CPUS because it is not clear whether 
> cpu_up() would even work on MPU. In its current state, it may return an 
> error but could also corrupt the system.
> 
> At least for Xen on Arm, we have no other way to temporarly disable SMP 
> support (aside modify the provided DTB, but I would like to avoid it).

I see. Ayan: Could this be made a little more clear in the description
and / or code comment?

Furthermore I'm then puzzled by the use of BUILD_BUG_ON(). If you want
to prevent people building SMP configs, wouldn't you be better off doing
so right in Kconfig:

config NR_CPUS
	int "Maximum number of CPUs"
	range 1 16383 if !MPU
	range 1 1

or

config NR_CPUS
	int "Maximum number of CPUs"
	range 1 1 if MPU
	range 1 16383

? Since the 2nd form leaves the primary line untouched, I guess I like
this slightly better, despite the outlier then coming first. (The above
would presumably still require the default adjustment that you already
have.)

Finally, having observed interesting build issues with newer gcc when
trying to build UP configs, did you check that Arm actually builds fine
that way with recent-ish gcc?

Jan


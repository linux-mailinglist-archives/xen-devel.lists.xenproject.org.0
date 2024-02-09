Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92E84F4DA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 12:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678661.1056133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYPSp-0005Cg-8e; Fri, 09 Feb 2024 11:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678661.1056133; Fri, 09 Feb 2024 11:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYPSp-0005AF-5L; Fri, 09 Feb 2024 11:54:39 +0000
Received: by outflank-mailman (input) for mailman id 678661;
 Fri, 09 Feb 2024 11:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rYPSn-0005A7-L1
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 11:54:37 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feb7d93f-c741-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 12:54:35 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51168addef1so1585494e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 03:54:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi16-20020a05600c3d9000b004103400259fsm411469wmb.29.2024.02.09.03.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 03:54:34 -0800 (PST)
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
X-Inumbo-ID: feb7d93f-c741-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707479675; x=1708084475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPLiNtHGgwBjYK/1AImqtz9UhjZ/Xjnm0e5OdT1IOEI=;
        b=S8e0ioipGyf8en9Z/nLUKg34kWOqL+0ud47ndYBdRSLaFy4KSrgk8a1qQLpBJxJnxR
         GB69/11FINTNU8rbm4kXn+fbtRJJHDhoxyOaXCCZ04S5MD5tzlzQViwQ53CefjdeDEyJ
         R2V2i0+Jhw29ly5cFu0uvE9oJJ25IONVC3Pr4nNSVln3slYE9pcBCzcmYk6rbcLB+Cdg
         6NFjvvWppmkbSgYPqsAhPEELOXffvg0b8SWLUOmEUwb2j5HRZjcZu4YCbIWJnVWjk82i
         wpW6+jbMb9iKz+9pDSpBcWOpIN3ZzH6WTqdmOpsN7i6JXa2fyiZOE5/8pQW4U/vYr6IL
         zvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707479675; x=1708084475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPLiNtHGgwBjYK/1AImqtz9UhjZ/Xjnm0e5OdT1IOEI=;
        b=Objobosae7y94CrCpppkESx+64zcdBltiiZCbjMpaHqDiixxudVcML0q6Z2JAM46XQ
         /VT3m/xsyD0te0SqWMLADu4UWV+WuxENtSeGkiYMZeJfqja4P65k5H45oOSBDjpF+qY8
         h8stRYYKt6eoK5TgGdQteFcRZfyRFvc8q/Uxc05kukQhl1asl62Xb08dKsCFmHIBCtsP
         0zIvZIhg7LEy6UTsPtSxDXEICi+G8ifgnQxFGf5LTyOw2j6TSEtKabxz3Bpo2TFDS1us
         Ve4rLYF5o9wM0OS+IMAv4lBET+Ckd7Rw4Uvi+INds1zsCm13Pm4IPMW3aP5CcuPYv5U8
         UoWw==
X-Forwarded-Encrypted: i=1; AJvYcCXY3UJhZxT0e8EsvjaGByh7c2HIPaL86OnZNP/vhRO4hwJssvIaQ/t/76bpmBgmM3Ytx0y1y2RawDi5S+wyCNgMHrmvgHz6UJ+xZfUZTQ0=
X-Gm-Message-State: AOJu0YxUUQwTFreJlOArCWpyG5vl2NUFswtt6UPEtFxFrGKuLSw4SbOV
	XYGxFxT+UPHT0OxA5+ZDSX4Jg6B27OKt2ABCllQa85rWfMCgVN5ueVep4OVOZB9gxA0O1OO7q98
	=
X-Google-Smtp-Source: AGHT+IH2uz1ket5tUekJsMpCNATRPtPHaKONfnvdHaiGDhnr0c3hL+mFe8M7H8nlkdhiSsrOjsLrhQ==
X-Received: by 2002:ac2:52b1:0:b0:511:6512:9d3e with SMTP id r17-20020ac252b1000000b0051165129d3emr943125lfm.33.1707479674988;
        Fri, 09 Feb 2024 03:54:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWV9zs4+9ZcLYVw/LFnDDpAh3Cb5rgJEkJxKxJv1FXgZ38ve7QAQAIOIi+j0UVrU1EhxMpLUXW0Yq89SegSrIrqFY9+STLeK0wbDns6OFdTQPgldl4j0wfyjgzLcN0EBwuk3quN6LBgGQGBuM7MRrjcmDIBZJiCr0Wg7JAiIfRXgbInzIUxhlW3M5H5B8dDH3NakPGCxqrgiusl9INLyMB9xjQZKI/U/TKkL47DPeCjMlCwi9PTdJR/vuEaxAsqapxpbup2+ho7Nuf22pGR743qFP2I+p24fl3BY4vj0h9KoQ1bgm2UpoLSwC+ZHbw8/07lXLZTVWSB28SG1ycGfqJNHNf0p2SUHmDf5MhKac85M/uQ6nTtBbIpuRr31zvhkFhuzHEKh7ktoCqDKogPj7dLTjYaK4BdQ3BrJfyzPhx4O3dF/NxmcPNhs/DgMk5ztCM=
Message-ID: <c341164a-0bd9-41f1-a984-718ccb986053@suse.com>
Date: Fri, 9 Feb 2024 12:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/4] xen: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>, sstabellini@kernel.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com>
 <09869431-ed00-4102-93fd-84c697a5c950@suse.com>
 <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
 <41474fe7-c65f-4244-a455-0aaa0e4315e3@suse.com>
 <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com>
 <c6199a60-ecd2-4f8a-b742-199b90e62bac@suse.com>
 <a3586ea2-5ad7-4c64-8e05-00ea0f83518f@bugseng.com>
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
In-Reply-To: <a3586ea2-5ad7-4c64-8e05-00ea0f83518f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2024 10:25, Simone Ballarin wrote:
> On 07/02/24 13:40, Jan Beulich wrote:
>> On 07.02.2024 13:21, Simone Ballarin wrote:
>>> On 07/02/24 11:24, Jan Beulich wrote:
>>>> On 07.02.2024 11:03, Simone Ballarin wrote:
>>>>> On 06/02/24 13:04, Jan Beulich wrote:
>>>>>> On 02.02.2024 16:16, Simone Ballarin wrote:
>>>>>>> --- a/xen/arch/arm/guestcopy.c
>>>>>>> +++ b/xen/arch/arm/guestcopy.c
>>>>>>> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>>>>>     unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>>>>>     {
>>>>>>>         return copy_guest((void *)from, (vaddr_t)to, len,
>>>>>>> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
>>>>>>> +                      /* SAF-4-safe No persistent side effects */
>>>>>>> +                      GVA_INFO(current),
>>>>>>
>>>>>> I _still_ think this leaves ambiguity. The more that you need to look
>>>>>> up GVA_INFO() to recognize what this is about.
>>>>>
>>>>>
>>>>> Just to recap: here the point is that current reads a register with a volatile asm, so the
>>>>> violation is in the expansion of GVA_INFO(current). Both GVA_INFO and current taken alone
>>>>> are completely fine, so this is the only place where a SAF comment can be placed.
>>>>>
>>>>> The exapansion is:
>>>>> ((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&
>>>>>      per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({ uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
>>>>>      (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));
>>>>>
>>>>> My proposals are:
>>>>> 1) address the violation moving the current expansion outside (extra variable);
>>>>> 2) put a more detailed comment to avoid the ambiguity;
>>>>> 3) use an ECL deviation for GVA_INFO(current).
>>>>>
>>>>> Do you have any preference or proposal?
>>>>
>>>> Imo 3 is not an option at all. Probably 1 wouldn't be too bad here, but
>>>> I still wouldn't like it (as matching a general pattern I try to avoid:
>>>> introducing local variables that are used just once and don't meaningfully
>>>> improve e.g. readability). Therefore out of what you list, 2 would remain.
>>>> But I'm not happy with a comment here either - as per above, there's
>>>> nothing that can go wrong here as long as there's only a single construct
>>>> with side effect(s).
>>>>
>>> So, would be changing the SAF in:
>>> /* SAF-<new_id>-safe single item initializer */
>>>
>>> OK for you?
>>
>> A comment, as said, is only the least bad of what you did enumerate. But
>> for this code in particular I'm not a maintainer anyway, so it's not me
>> you need to convince. I'm taking this only as an example for discussing
>> underlying aspects.
> 
> I was generally thinking about the comments of this series, and I've
> just realised that many of them can be summarized by the following sentence:
> 
> "We do not want changes to address violations of R13.1 that are not also violations
> of R13.2"
> 
> MC3R1.R13.2	rule	The value of an expression and its persistent side effects shall be the same under all permitted evaluation orders
> MC3R1.R13.1	rule	Initializer lists shall not contain persistent side effects
> 
> At this point, my proposal is to remove R13.1 from the coding standard and add
> R13.2 (eventually limiting its scope to initializer lists).

I'm afraid I don't understand the "eventually limiting" part.

> Maybe it is better to re-discuss the rule adoption during the next meeting?

Perhaps best. Stefano, could you take note of this?

Jan


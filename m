Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66EA812AC0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654338.1021141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhRC-0007Dt-IY; Thu, 14 Dec 2023 08:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654338.1021141; Thu, 14 Dec 2023 08:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhRC-0007BX-FI; Thu, 14 Dec 2023 08:51:22 +0000
Received: by outflank-mailman (input) for mailman id 654338;
 Thu, 14 Dec 2023 08:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDhRB-0007BP-3J
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:51:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f286fd4c-9a5d-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 09:51:18 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-54c5ed26cf6so9930823a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 00:51:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a50c90c000000b0054da352618asm6425912edh.94.2023.12.14.00.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 00:51:18 -0800 (PST)
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
X-Inumbo-ID: f286fd4c-9a5d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702543878; x=1703148678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PjmcJIYoSqp4uYmY+FikUF0e7Nj0cEaM62W8zVy/8WU=;
        b=bspqkfs02vNSNkLcW2RY+7w2Hz/jayTauSGj9Q5auCJyzVE6NNOYbNakcu1Ip0l6Fa
         0s4L1qRY40WyswawwgRlsZ1YeiS0zQSCW6Ry0/F4jRUzMHUkekVlrJGc4wWD9dfkt33M
         nfUH2Fxa2ubuzKEd5xmgOfWGnmPW+0dUu+rKndzjM3HyXaWIZWE1G+OwmOyD70wb6DRK
         OIr+/r4mPqO4bcyTU6AEsj1pnodHLVZBR0lA0Cs1MVq+SDP7AfGuua/kHUK0rUYDf/7U
         OfdIMDSo3jIK9/2g1ixDIeigTmbQJyYRFee2WGPJfWBe/vG2eR7k+eGHNOch5OoMHLmH
         fssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702543878; x=1703148678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjmcJIYoSqp4uYmY+FikUF0e7Nj0cEaM62W8zVy/8WU=;
        b=AyeFyYwcykYha+VnSuS+cYtRwySg9pDsNx05H2LMTr4kQsT8eYu1vtKRgxPzxsss+a
         TSGBvnnPiy5I9fr1OWZXM+Wn81PAJT7zCqmeBsuuulgeIiPWrUfiunQTVlzQY80Kfi+3
         dx8B3Ik25pFhx4nbLtATQ/sdCHtKhCWgL1kC0/Ga/klpacoDvqafrD09Ta4tf2QJRyDJ
         PHuTYJEqPoRnx7J0oJruWvlqStqIPe1XI4IAOPoLm0mL85SvYkljIvE+6hvdYBkPyWZK
         RoxmupcXgZM5Nc4ldBfRLzblqRsP2VU1/qkNp3Qk+NOWPCC+Ap/16oa3bZLZ0NsMco7B
         7Xlw==
X-Gm-Message-State: AOJu0YyPvJgaavkp6GVE0VVShHVumc7DpAPW1L/V//KLtzHhzN6rwaoQ
	Jyn1bErBMSIxPUOKM3UdJf2L
X-Google-Smtp-Source: AGHT+IHHudoeIFm58su/jQH7iZgPGqGrS/wCgk6xz0aogewNHBVaHH0xD1WmiM77OVmwDp9ys/DJvw==
X-Received: by 2002:a50:c909:0:b0:54c:4837:81da with SMTP id o9-20020a50c909000000b0054c483781damr4672316edh.43.1702543878266;
        Thu, 14 Dec 2023 00:51:18 -0800 (PST)
Message-ID: <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com>
Date: Thu, 14 Dec 2023 09:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
 <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
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
In-Reply-To: <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 09:32, Julien Grall wrote:
> Hi Jan,
> 
> On 14/12/2023 07:53, Jan Beulich wrote:
>> On 14.12.2023 03:05, Stefano Stabellini wrote:
>>> On Wed, 13 Dec 2023, Jan Beulich wrote:
>>>> On 11.12.2023 10:14, Nicola Vetrini wrote:
>>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>>> @@ -2,8 +2,9 @@
>>>>>   #define __ARCH_ARM_NUMA_H
>>>>>   
>>>>>   #include <xen/mm.h>
>>>>
>>>> With this, ...
>>>>
>>>>> +#include <xen/types.h>
>>>>>   
>>>>> -typedef u8 nodeid_t;
>>>>> +typedef uint8_t nodeid_t;
>>>>>   
>>>>>   #ifndef CONFIG_NUMA
>>>>>   
>>>>> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
>>>>>   #define node_to_cpumask(node)   (cpu_online_map)
>>>>>   
>>>>>   /*
>>>>> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>>>>> - * is required because the dummy helpers are using it.
>>>>> + * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
>>>>> + * this is required because the dummy helpers are using it.
>>>>>    */
>>>>> -extern mfn_t first_valid_mfn;
>>>>
>>>> ... and this declaration moved to xen/mm.h, how is it going to be possible
>>>> to do as the adjusted comment says? The compiler will choke on the static
>>>> after having seen the extern.
>>>
>>> Nicola was just following a review comment by Julien. NUMA has been
>>> pending for a while and I wouldn't hold this patch back because of it.
>>> I suggest we go with Julien's request (this version of the patch).
>>>
>>> If you feel strongly about it, please suggest an alternative.
>>
>> Leaving a TODO comment which cannot actually be carried out is just wrong
>> imo. And I consider in unfair to ask me to suggest an alternative. The
>> (imo obvious) alternative is to drop this patch, if no proper change can
>> be proposed. There's nothing wrong with leaving a violation in place,
>> when that violation is far from causing any kind of harm. The more that
>> the place is already accompanied by a (suitable afaict) comment.
> 
> Just to clarify, are you saying you would be happy if the proposal if 
> the TODO is removed?

Removing the bad (new) TODO here is an option. But the previous TODO shouldn't
go away. However, you asking now required me to actually look into Stefano's
request to make an alternative proposal (I still don't see though why it
needed to be me to think about an appropriate solution; probably in the time
I've spent writing replies on this thread, I could have made the change myself).

First, Arm's and PPC's header have this in their !NUMA sections. Much like
Oleksii's putting in quite a bit of effort to reduce redundancy in order to
not further grow it with RISC-V, what's wrong with sorting the !NUMA case
properly as a first step? Move the entire !NUMA section either into xen/numa.h
(eliminating the need for arch-es not supporting NUMA to even have such a
header), or (if need be) to asm-generic/. Then, as a 2nd step (albeit that
could also be done on its own, just the result would be less neat imo), make
the variable in question here extern _only_ when !NUMA. This would then
address the original TODO, so that could then legitimately be dropped. This
would further be a good opportunity to adjust the already stale comment in
page_alloc.c (it's no longer applicable to Arm only).

Jan


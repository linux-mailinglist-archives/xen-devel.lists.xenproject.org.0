Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993CB87CA93
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693708.1082109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3iz-00062u-RP; Fri, 15 Mar 2024 09:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693708.1082109; Fri, 15 Mar 2024 09:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3iz-00060u-Nx; Fri, 15 Mar 2024 09:19:37 +0000
Received: by outflank-mailman (input) for mailman id 693708;
 Fri, 15 Mar 2024 09:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl3ix-00060o-TS
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:19:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a950c6-e2ad-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 10:19:33 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a46682e71a9so181300466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 02:19:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 er18-20020a056402449200b0056899fc9a94sm1504499edb.12.2024.03.15.02.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 02:19:32 -0700 (PDT)
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
X-Inumbo-ID: 22a950c6-e2ad-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710494373; x=1711099173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+FH6yDcVL14ZMcRgd2DqD8HoFaUa7nMaki9Jh2GhZLs=;
        b=XQ/EYcsmpzGjOPKkyFC28Ye7CIMkMymw1uMFKMTFWQ3J+b6k1NX9sTPCA8pYw2bn7Y
         8X8duEuJ9TQmzi4WgZ50uZOeUJvPW9UWIEnSdHwwwH7gKBzZ+KuK5ex9lBs9thnxHP76
         5KCxIN00Ue3f//kJwC7DIHRZcwrEEgUza1x1PmIntOUci9weih30OkDbsSewIyijSS12
         khBsgs+cOyTByK1gz9K0Df9hOMW9JYRQ7pTDBZwA1CFvCjVEqxqd/3YN9bkExz+uT34E
         /qOTfIp/A86IB83hU8NEw8xxzsAvwK1hTEqBYt9wx9OPE0Wj36D9grBkgpiH2SrVzXh2
         JiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710494373; x=1711099173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+FH6yDcVL14ZMcRgd2DqD8HoFaUa7nMaki9Jh2GhZLs=;
        b=e0RpLfHK/X/SWYzO0qfgqD85PqnbUhzLUId/7CLHt9+4RWtb3v2Wwd/mcS7g5jiFUC
         zi/5COlNQXteOx2pyV4VDqsDLm3w3ihkf+68CRB/CKSMnPPOvbT+sd2YgRJEUOZTEUtW
         f/hmmjBz5MM4EvcoapNZcp0gAn/xNETTwInKgGUl5FKbsQ02Gtbu+71tfcFJ/nffE5PN
         WXDkYKgWkGYdtkD+mcO4yGrqxuUgU6osXdiy8rDB093FFj3j5xpjN3+NYak7oMNT89c8
         V7bj/XIovfBKEYtCqfRcYJfrU4JmCt60o7bH4yC9zIFi90mDB/DsVSMvhbvVmugvYPzO
         8f/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcbSPUQxi7UwKm7+613PxrD0g+Nc8iPqcYPSsxgeIhAZPS0SwQoGnGa0F9g5qUbBYbQVDcZV07zL7Otd6xnjp7fvI46ZJiFVEosVijWto=
X-Gm-Message-State: AOJu0YzlJaENtxkfGDJv1YIWneZzuS3x3q6JidWD1xRpQ5wIuc3P1X2E
	V2rhW8ywiAQvI4LRNG0+bdz91mVSZky7TsfVgZJTXU8X4cifJKtBeTBFFIROkg==
X-Google-Smtp-Source: AGHT+IGGZx9URRUGlB985Jfa21wvgb9Uf38mxIs50/v+5Z+e/PqSLsI0x8dnJSO3H2YSYXo9frVTYw==
X-Received: by 2002:a05:6402:388a:b0:568:abe3:52b2 with SMTP id fd10-20020a056402388a00b00568abe352b2mr1541840edb.23.1710494373235;
        Fri, 15 Mar 2024 02:19:33 -0700 (PDT)
Message-ID: <077c0373-6eec-4403-b31e-574c8e8ae067@suse.com>
Date: Fri, 15 Mar 2024 10:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 03/16] misra: add deviations for direct inclusion
 guards
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com>
 <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com>
 <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
 <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com>
 <3e4bb597-3624-418e-93d0-b95042fd27a7@bugseng.com>
 <alpine.DEB.2.22.394.2403141559270.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403141559270.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:59, Stefano Stabellini wrote:
> On Mon, 11 Mar 2024, Simone Ballarin wrote:
>> On 11/03/24 14:56, Jan Beulich wrote:
>>> On 11.03.2024 13:00, Simone Ballarin wrote:
>>>> On 11/03/24 11:08, Jan Beulich wrote:
>>>>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>>>>> --- a/xen/arch/arm/include/asm/hypercall.h
>>>>>> +++ b/xen/arch/arm/include/asm/hypercall.h
>>>>>> @@ -1,3 +1,4 @@
>>>>>> +/* SAF-5-safe direct inclusion guard before */
>>>>>>    #ifndef __XEN_HYPERCALL_H__
>>>>>>    #error "asm/hypercall.h should not be included directly - include
>>>>>> xen/hypercall.h instead"
>>>>>>    #endif
>>>>>> --- a/xen/arch/x86/include/asm/hypercall.h
>>>>>> +++ b/xen/arch/x86/include/asm/hypercall.h
>>>>>> @@ -2,6 +2,7 @@
>>>>>>     * asm-x86/hypercall.h
>>>>>>     */
>>>>>>    +/* SAF-5-safe direct inclusion guard before */
>>>>>>    #ifndef __XEN_HYPERCALL_H__
>>>>>>    #error "asm/hypercall.h should not be included directly - include
>>>>>> xen/hypercall.h instead"
>>>>>>    #endif
>>>>>
>>>>> Iirc it was said that this way checking for correct guards is suppressed
>>>>> altogether in Eclair, which is not what we want. Can you clarify this,
>>>>> please?
>>>>>
>>>>
>>>> My first change was moving this check inside the guard.
>>>> You commented my patch saying that this would be an error because someone
>>>> can
>>>> include it directly if it has already been included indirectly.
>>>> I replied telling that this was the case also before the change.
>>>> You agreed with me, and we decided that the correct thing would be fixing
>>>> the
>>>> check and not apply my temporary change to address the finding.
>>>>
>>>> Considering that the code should be amended, a SAF deviation seems to me
>>>> the most appropriate way for suppressing these findings.
>>>
>>> Since I don't feel your reply addresses my question, asking differently:
>>> With
>>> your change in place, will failure to have proper guards (later) in these
>>> headers still be reported by Eclair?
>>
>> No, if you put something between the check and the guard,
>> no violation will be reported.
> 
> From this email exchange I cannot under if Jan is OK with this patch or
> not.

Whether I'm okay(ish) with the patch here depends on our position towards
the lost checking in Eclair mentioned above. To me it still looks relevant
that checking for a guard occurs, even if that isn't first in a file for
some specific reason.

Jan


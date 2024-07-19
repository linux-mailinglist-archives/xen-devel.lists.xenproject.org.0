Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463F793757C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 11:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760930.1170893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUjYE-000073-V1; Fri, 19 Jul 2024 09:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760930.1170893; Fri, 19 Jul 2024 09:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUjYE-0008Vf-SK; Fri, 19 Jul 2024 09:05:18 +0000
Received: by outflank-mailman (input) for mailman id 760930;
 Fri, 19 Jul 2024 09:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUjYD-0008VZ-GZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 09:05:17 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b28d61-45ae-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 11:05:16 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so20503801fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 02:05:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff59e2d7sm804764b3a.170.2024.07.19.02.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 02:05:14 -0700 (PDT)
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
X-Inumbo-ID: 03b28d61-45ae-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721379915; x=1721984715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUXzVnh1xTxH4tbZMk5I3ZZk1Ii2xC/fZk38ALx3MKI=;
        b=ZJeQv2byykcdDTszzvsWzO5ZAhecDk5+2vuCxs78EJqEVdjTk+4bmoby8mCywnawVZ
         I2/8/AccBQ7bvy99PNCULKRCzuRe4WzVik4pj19I3JMMhyoolK398EqJhKqYLKUkeK1U
         cIrFzCScbpAqsHEZJHbjY/cBBbulSeX+3sniomthFdNLda7U+xiHrKVrtnwziDfntyEi
         29XeotMdf1o5qH+2/ZpcUz54+9Xzb6Wn5Ekj3EBn0ojuOyiKDGDyn0cGb0V3GXwqjMrz
         PKHrzuYQj0+/zfioH6JLXSi5AlrwkB7vACarwlePzJCEJCh2VbBAF/fAm/a5wyQP9OTz
         VTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721379915; x=1721984715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUXzVnh1xTxH4tbZMk5I3ZZk1Ii2xC/fZk38ALx3MKI=;
        b=jrxDiscQ0FVjvWGH2PCaePqCSPMULlJEA8YRwPJ3nzgQP9PUp/h9Aamg+D2t1httAS
         bIkKp47Gsma7gEAxG35t0CR9TnorbiJDXafnkCOkF7nOK3GVNqGbPmvPl0k5JeEtIS/1
         IUJmAYyN08dmFTBd0nKImunFq+hSJKFG98PYDVUCQcnX2x2+ctjO+du2hQ2LyNOI7/x/
         Zq658P4ETHohhWyAblLFuippnOyYiWGXLkeMpo5tdzYEjFOflsui+swbShGSxNloeHmF
         wn8fJQc65DLI8Av4U7EiXNIwSvC/i91qCpOBduIyX6dVHMXZh/4fT/zpcMOic5cNsqs9
         oM5w==
X-Forwarded-Encrypted: i=1; AJvYcCWZxWlqRocanD70bNuMxg5cXD+ktr6/3s8+qxaLaf7n24Z1KvUtoUKR8RTWsmcVA2vTsEIPRE+ENBTO8xM8sEQHlUoe89Nk5yNqCQHmhss=
X-Gm-Message-State: AOJu0YzKfcdiGsAiWE0lyfHZhh7c3ZoAqdZBw9/YYEpeSXHBVFelhR60
	1UsQOcVvZIhRbPVjWfH1PM6bkgaNkuOjA3cdaEDSn4tstyPbNfSs0p4oYFopXw==
X-Google-Smtp-Source: AGHT+IHO+cFrNaabHRy5q3RuXZxp5nDYA4XjUf2Gk5GfbtH6VlIs5n1TctMKTc1CFpaR7XuSBfVlgg==
X-Received: by 2002:a2e:7016:0:b0:2ee:d5e5:ebdd with SMTP id 38308e7fff4ca-2ef05c543eamr31445011fa.8.1721379915294;
        Fri, 19 Jul 2024 02:05:15 -0700 (PDT)
Message-ID: <b1bad3be-4520-48e6-952c-3f1828a0bafa@suse.com>
Date: Fri, 19 Jul 2024 11:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
 <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
 <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
 <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
 <alpine.DEB.2.22.394.2407151736530.3635@ubuntu-linux-20-04-desktop>
 <4893a89d-9ef5-4d86-94b0-042e88588439@suse.com>
 <alpine.DEB.2.22.394.2407161713010.3635@ubuntu-linux-20-04-desktop>
 <013c6cc2-eddf-4beb-b115-01aaaa71faa6@suse.com>
 <alpine.DEB.2.22.394.2407171601540.3635@ubuntu-linux-20-04-desktop>
 <8fd8d6e4-ef29-4ea9-9437-a743c25fe7b9@suse.com>
 <alpine.DEB.2.22.394.2407181457110.4857@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407181457110.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 00:01, Stefano Stabellini wrote:
> On Thu, 18 Jul 2024, Jan Beulich wrote:
>> On 18.07.2024 01:02, Stefano Stabellini wrote:
>>> On Wed, 17 Jul 2024, Jan Beulich wrote:
>>>> On 17.07.2024 02:20, Stefano Stabellini wrote:
>>>>> On Tue, 16 Jul 2024, Jan Beulich wrote:
>>>>>> On 16.07.2024 02:43, Stefano Stabellini wrote:
>>>>>>> On Mon, 15 Jul 2024, Jan Beulich wrote:
>>>>>>>> On 13.07.2024 00:38, Stefano Stabellini wrote:
>>>>>>>>> On Wed, 3 Jul 2024, Jan Beulich wrote:
>>>>>>>>>> I further have to note that, as indicated during the earlier discussion,
>>>>>>>>>> I still cannot see how occasional ambiguity is going to be dealt with.
>>>>>>>>>> IOW from the rules above two different headers could still end up with
>>>>>>>>>> the same guard identifier.
>>>>>>>>>
>>>>>>>>> Maybe something like this?
>>>>>>>>>
>>>>>>>>> "In the event of naming collisions, exceptions to the coding style may
>>>>>>>>> be made at the discretion of the contributor and maintainers."
>>>>>>>>
>>>>>>>> Hmm, maybe I wasn't clear enough then. My take is that the scheme should
>>>>>>>> simply not allow for possible collisions. Neither the contributor nor the
>>>>>>>> reviewer may spot such a collision, and it may therefore take until the
>>>>>>>> first full scan that one is actually noticed. Which I consider too late
>>>>>>>> in the process, even if we already were at the point where commits were
>>>>>>>> checked pre-push.
>>>>>>>
>>>>>>> Looking at the proposal, copy/pasted here for convenience:
>>>>>>>
>>>>>>> - private headers -> <dir>_<filename>_H
>>>>>>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>>>>>>>     - #ifndef ASM_GENERIC_X86_PERCPU_H
>>>>>>>       #define ASM_GENERIC_X86_PERCPU_H
>>>>>>>       //...
>>>>>>>       #endif /* ASM_GENERIC_X86_PERCPU_H */
>>>>>>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>>>>>>>     - #ifndef ASM_X86_DOMAIN_H
>>>>>>>       #define ASM_X86_DOMAIN_H
>>>>>>>       //...
>>>>>>>       #endif /* ASM_X86_DOMAIN_H */
>>>>>>> - xen/include/xen/<filename>.h -> XEN_<filename>_H
>>>>>>> - xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H
>>>>>>>
>>>>>>>
>>>>>>> The only possibility for collision that I can see is from the first
>>>>>>> point:
>>>>>>>
>>>>>>> - private headers -> <dir>_<filename>_H
>>>>>>
>>>>>> I don't think this is the only possibility of collisions. The <subdir>_<filename>
>>>>>> parts can similarly cause problems if either of the two involved names contains
>>>>>> e.g. a dash (which would need converting to an underscore) or an underscore. To
>>>>>> avoid this, the name separators (slashes in the actual file names) there may need
>>>>>> representing by double underscores.
>>>>>
>>>>> I am OK with you two underscores as name separator (slashes in the
>>>>> actual file names). Would you do it for all levels like this?
>>>>>
>>>>> - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>>>>> - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
>>>>> - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>>>>>
>>>>>
>>>>> I think it is better than the below:
>>>>>
>>>>> - arch/arm/arm64/lib/something.h -> ARM_ARM64__LIB__SOMETHING_H
>>>>> - arch/arm/arm32/lib/something.h -> ARM_ARM32__LIB__SOMETHING_H
>>>>> - arch/x86/lib/something.h -> X86_LIB__SOMETHING_H
>>>>
>>>> Hmm, maybe it's indeed better to do it entirely uniformly then.
>>>
>>>
>>> Do we have agreement on the naming convention then? 
>>>
>>>
>>> - private headers -> <dir>__<filename>__H
>>>     - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>>>     - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
>>>     - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>>>
>>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>>>     - include/asm-generic/percpu.h -> ASM_GENERIC_X86_PERCPU_H
>>>
>>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>>>     - arch/x86/include/asm/domain.h -> ASM_X86_DOMAIN_H
>>>
>>> - include/xen -> XEN_<filename>_H
>>>     - include/xen/percpu.h -> XEN_PERCPU_H
>>>
>>>
>>> Or do you prefer the double underscore __  in all cases?
>>
>> It's not so much prefer, but a requirement if we want to be future proof.
>> Even for ASM_GENERIC_* that'll be needed, as your outline above simply
>> doesn't mention the (future) case of there being subdir-s there (see how
>> Linux already has some). Imo the question doesn't even arise for XEN_*,
>> as xen/ has subdir-s already.
> 
> OK. So it becomes:
> 
> - private headers -> <dir>__<filename>_H
>     - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>     - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
>     - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> 
> - asm-generic headers -> ASM_GENERIC__<filename>_H
>     - include/asm-generic/percpu.h -> ASM_GENERIC__X86__PERCPU_H

Nit: There's still a stray _X86_ in here.

Jan

> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM__<architecture>__<subdir>__<filename>_H
>     - arch/x86/include/asm/domain.h -> ASM__X86__DOMAIN_H
> 
> - include/xen -> XEN__<filename>_H
>     - include/xen/percpu.h -> XEN__PERCPU_H
> 
> If we have found agreement then Alessandro could send an update



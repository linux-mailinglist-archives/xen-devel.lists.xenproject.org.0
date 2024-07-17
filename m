Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C1933B1C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 12:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759910.1169601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU1qK-00074Y-Rf; Wed, 17 Jul 2024 10:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759910.1169601; Wed, 17 Jul 2024 10:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU1qK-00072c-Om; Wed, 17 Jul 2024 10:25:04 +0000
Received: by outflank-mailman (input) for mailman id 759910;
 Wed, 17 Jul 2024 10:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sU1qJ-00072W-Qu
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 10:25:03 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3b6dae4-4426-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 12:25:02 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eefeab807dso4844101fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 03:25:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc49fc1sm72182685ad.263.2024.07.17.03.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:25:01 -0700 (PDT)
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
X-Inumbo-ID: d3b6dae4-4426-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721211902; x=1721816702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y6nBG+guUNPk/PSBaIngiNPaND157ntsthiySQreP0=;
        b=ViTynY/cJbb6qUeNpXu9YqtjUqkHGATxuMvdij0H33Ns221tK4HkK8/+qOHQAB3Arm
         Qm+BlUuhLQN4JV1xe+pK+pEnj4h9itgFUcerjowWQvhhtFqEyPWmwmTlzCUQt2KDWx1H
         YyC+DZ0uK6ZKDDuIZm2d5JbqjkMHXbgoy3tYWD7jo6MHk45aqLICuJQmXZC/FhJJQBHr
         rXdzlKXr1+OejpClKGrnpqjF9TN1XyIkjKgJtExKkVJTWJTcYwu/hcgeva8uyWJ+/loo
         tySrMgBkQ8OHx1tXAJTnUVKk7OxIZaMVnt31wM21vWhfEt6Uq9Ui+CC1ttMk0PI49tPT
         3DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721211902; x=1721816702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y6nBG+guUNPk/PSBaIngiNPaND157ntsthiySQreP0=;
        b=xKfeD0gKVhaxDpxFo9X5xrItQG5xYM65Wm40q8rsLc531rHMdSyd8cdPQRm6O20MxU
         g8MXGbQLEwcm6Ofm/PHf/lzuoesyCGfKUR+TNH969wDgxkdOXFUp8P8q/ObeMCeUtA/K
         6ZWOo/8uVTcI6fQ8Su5pOeitWfrFfFMoFdR5uIxjynPFZyRacFz3l7hoDizlsg6e6IFd
         7HtW6MJbr5ujPYZylk/Xa5a8YfXkI3RCKEnsPBxEe4SMWcdtaZGhLKcFlikvqSr1NDIt
         IEDtR6DXMcd/z0IPzbCgULQsY0h1wLgaTXkv4TpUrTZ7NkuNAxLZ/ggyife232+QzwHU
         htWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZIrhluBcPY8ZXTfy0GGvUtwcLW9npvnf1kAP2rvEFWgD/jtGUPs90babl7bn9UjLfMwLmQ8Dtfyix7IZpdwQEchRSWVM2f1Nibw5V4k4=
X-Gm-Message-State: AOJu0YwGjvscsPXXo1SOhngLK6R/9dbB6smnmnrXgU20To4xB5iMiWzU
	9ep7OGrFNoFAT0LdzanxFzW7hPOmLQu6Xh4+bBOUw5nwmrIMBMgQybA3mXIMMw==
X-Google-Smtp-Source: AGHT+IGDWftZnVr1xutcSJnMlqCxHK9Ml9nW0ih/WDiqWKf/Bap63D0duEAiAZgqJMlzK8fY9a2MwQ==
X-Received: by 2002:a2e:9482:0:b0:2ec:1cf1:b74c with SMTP id 38308e7fff4ca-2eefd143aecmr8140321fa.32.1721211901793;
        Wed, 17 Jul 2024 03:25:01 -0700 (PDT)
Message-ID: <013c6cc2-eddf-4beb-b115-01aaaa71faa6@suse.com>
Date: Wed, 17 Jul 2024 12:24:53 +0200
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
In-Reply-To: <alpine.DEB.2.22.394.2407161713010.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 02:20, Stefano Stabellini wrote:
> On Tue, 16 Jul 2024, Jan Beulich wrote:
>> On 16.07.2024 02:43, Stefano Stabellini wrote:
>>> On Mon, 15 Jul 2024, Jan Beulich wrote:
>>>> On 13.07.2024 00:38, Stefano Stabellini wrote:
>>>>> On Wed, 3 Jul 2024, Jan Beulich wrote:
>>>>>> I further have to note that, as indicated during the earlier discussion,
>>>>>> I still cannot see how occasional ambiguity is going to be dealt with.
>>>>>> IOW from the rules above two different headers could still end up with
>>>>>> the same guard identifier.
>>>>>
>>>>> Maybe something like this?
>>>>>
>>>>> "In the event of naming collisions, exceptions to the coding style may
>>>>> be made at the discretion of the contributor and maintainers."
>>>>
>>>> Hmm, maybe I wasn't clear enough then. My take is that the scheme should
>>>> simply not allow for possible collisions. Neither the contributor nor the
>>>> reviewer may spot such a collision, and it may therefore take until the
>>>> first full scan that one is actually noticed. Which I consider too late
>>>> in the process, even if we already were at the point where commits were
>>>> checked pre-push.
>>>
>>> Looking at the proposal, copy/pasted here for convenience:
>>>
>>> - private headers -> <dir>_<filename>_H
>>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>>>     - #ifndef ASM_GENERIC_X86_PERCPU_H
>>>       #define ASM_GENERIC_X86_PERCPU_H
>>>       //...
>>>       #endif /* ASM_GENERIC_X86_PERCPU_H */
>>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>>>     - #ifndef ASM_X86_DOMAIN_H
>>>       #define ASM_X86_DOMAIN_H
>>>       //...
>>>       #endif /* ASM_X86_DOMAIN_H */
>>> - xen/include/xen/<filename>.h -> XEN_<filename>_H
>>> - xen/include/xen/<subdir>/<filename>.h -> XEN_<subdir>_<filename>_H
>>>
>>>
>>> The only possibility for collision that I can see is from the first
>>> point:
>>>
>>> - private headers -> <dir>_<filename>_H
>>
>> I don't think this is the only possibility of collisions. The <subdir>_<filename>
>> parts can similarly cause problems if either of the two involved names contains
>> e.g. a dash (which would need converting to an underscore) or an underscore. To
>> avoid this, the name separators (slashes in the actual file names) there may need
>> representing by double underscores.
> 
> I am OK with you two underscores as name separator (slashes in the
> actual file names). Would you do it for all levels like this?
> 
> - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> 
> 
> I think it is better than the below:
> 
> - arch/arm/arm64/lib/something.h -> ARM_ARM64__LIB__SOMETHING_H
> - arch/arm/arm32/lib/something.h -> ARM_ARM32__LIB__SOMETHING_H
> - arch/x86/lib/something.h -> X86_LIB__SOMETHING_H

Hmm, maybe it's indeed better to do it entirely uniformly then.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475085449F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680273.1058303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBFI-0007hH-TF; Wed, 14 Feb 2024 09:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680273.1058303; Wed, 14 Feb 2024 09:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBFI-0007eq-Pl; Wed, 14 Feb 2024 09:08:00 +0000
Received: by outflank-mailman (input) for mailman id 680273;
 Wed, 14 Feb 2024 09:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raBFH-0007ei-AQ
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:07:59 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bdec29d-cb18-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 10:07:58 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5114b2b3b73so6118635e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:07:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dx2-20020a05600c63c200b0040fdd7cbc8dsm1286762wmb.47.2024.02.14.01.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:07:57 -0800 (PST)
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
X-Inumbo-ID: 8bdec29d-cb18-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707901678; x=1708506478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmjmg7VEdxkzSuaPj3H56MSSyKHu4neqLtCFh8PmLdI=;
        b=Kvxm76aG0yfUysKfhVHegf49UblaDinBvvejnJyeCyS2KWgs9LAjwhCNYs2OCYht56
         K+SuRZLubz96pScrAg44CQZFHDOqHJmCRzw+PvGiK3+8iECAJpTwjzsZ0lYNTGTuOpxK
         FvNXIovAqDCnJ9Y2J8WQvK8nTxXqBzhoTuvVv6JktReea/lfLWrwsOjhCvAxrmHzSgKr
         rDNVN8ACy9WusQgPgWYELgJWF0jtKeH1es8+7FKKY0O3XfnhSOxR7EaCP3NVEvzDP5/Y
         lfufatdrDUUGLJq5IwCPLLbI00dmw23vdZWzubMEsp+K3blXd5bDdOFGk1lhC7sQuPMY
         bBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901678; x=1708506478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmjmg7VEdxkzSuaPj3H56MSSyKHu4neqLtCFh8PmLdI=;
        b=Dh9XHIFIdLJYyUeu26JJm0yOaNcdXHp2Ho0WsdakLoczZG9Z5bwqtf0ropaFBZIa9s
         ExvO7YeBE4VV0No8Dz2rFi6xNNOh4bzWW/SW8nrx7jZsCsJarxmq2R5UsS7tKihvAAhX
         25ZoJcCPNWyoHOOe6lxfJN/FetXLy8y0ed6j5AwnFmqngUHunZaF6ngIp9HcHHHjAEzm
         wFohqy3zCoxY53Bjox6IeH/uq85wHW/cWfbkI3QWJGwHPRcZQaJ15xnecTq1Fw7weFnE
         JCcz1Ahn57jhoWe8A6JNP6JUZhgxPFa0r+wFu3lQ35kL0wkDbffigHV6c4xhgDG0DcCn
         IOpg==
X-Gm-Message-State: AOJu0Yw8IS8mGrWYT6aszYk/PzojcW/gJX8n51a6AgAIwzn7E268EQZL
	lXwJJimjUhfX3+94gkOBc7WX4FZve967n4PSzvxYRhxjvMFyNgKqi4TREO/+NA==
X-Google-Smtp-Source: AGHT+IEjxo5i4Wyw5qFN5W4+zvKJIIXcGgiCjZo2OD6lBnEUdzXTZSAINmJUi25V/KD+ALXjhjNmYg==
X-Received: by 2002:ac2:4bcd:0:b0:511:a024:dbaa with SMTP id o13-20020ac24bcd000000b00511a024dbaamr2117616lfq.3.1707901677731;
        Wed, 14 Feb 2024 01:07:57 -0800 (PST)
Message-ID: <911f37dc-b4d9-42c1-9575-98ef93099976@suse.com>
Date: Wed, 14 Feb 2024 10:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <Zcsp15Aqve11Icjb@macbook> <ec5d0c39-1559-4f10-9574-98cfa0542993@suse.com>
 <ZcswBFHtINB1XMAS@macbook> <db0ce984-88e3-4394-b270-c5db585f8209@suse.com>
 <f3b34d97-17b5-44ef-ad9e-ad04a96754d0@amd.com>
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
In-Reply-To: <f3b34d97-17b5-44ef-ad9e-ad04a96754d0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 17:58, Stewart Hildebrand wrote:
> On 2/13/24 04:05, Jan Beulich wrote:
>> On 13.02.2024 10:01, Roger Pau Monné wrote:
>>> On Tue, Feb 13, 2024 at 09:44:58AM +0100, Jan Beulich wrote:
>>>> On 13.02.2024 09:35, Roger Pau Monné wrote:
>>>>> On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -462,7 +462,8 @@ struct domain
>>>>>>  #ifdef CONFIG_HAS_PCI
>>>>>>      struct list_head pdev_list;
>>>>>>      /*
>>>>>> -     * pci_lock protects access to pdev_list.
>>>>>> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
>>>>>> +     * structure from being removed.
>>>>>>       *
>>>>>>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
>>>>>>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
>>>>>> @@ -628,6 +629,18 @@ struct domain
>>>>>>      unsigned int cdf;
>>>>>>  };
>>>>>>  
>>>>>> +/*
>>>>>> + * Check for use in ASSERTs to ensure that:
>>>>>> + *   1. we can *read* d->pdev_list
>>>>>> + *   2. pdevs (belonging to this domain) do not go away
>>>>>> + *   3. pdevs (belonging to this domain) do not get assigned to other domains
>>>>>
>>>>> I think you can just state that this check ensures there will be no
>>>>> changes to the entries in d->pdev_list, but not the contents of each
>>>>> entry.  No changes to d->pdev_list already ensures not devices can be
>>>>> deassigned or removed from the system, and obviously makes the list
>>>>> safe to iterate against.
>>>>>
>>>>> I would also drop the explicitly mention this is intended for ASSERT
>>>>> usage: there's nothing specific in the code that prevents it from
>>>>> being used in other places (albeit I think that's unlikely).
>>>>
>>>> But pcidevs_locked(), resolving to spin_is_locked(), isn't reliable. The
>>>> assertion usage is best-effort only, without a guarantee that all wrong
>>>> uses would be caught.
>>>
>>> Do we want to protect this with !NDEBUG guards then?
>>
>> Yes, that would look to be desirable.
> 
> We will then also need a definition of pdev_list_is_read_locked() in the
> #else case so we don't risk running into "error: implicit declaration of
> function 'pdev_list_is_read_locked'".
> 
> Such a definition might look like:
> 
> #define pdev_list_is_read_locked(d) ({ (void)d; ASSERT_UNREACHABLE(); false; })
> 
> so that we still evaluate d exactly once in the NDEBUG case.

Except that ASSERT_UNREACHABLE() use is bogus in the NDEBUG case. The
way our ASSERT() works in the NDEBUG case looks to make it sufficient
for there to be

bool pdev_list_is_read_locked(const struct domain *d);

in the #else case (with no implementation anywhere).

>>>>>> + * This check is not suitable for protecting other state or critical regions.
>>>>>> + */
>>>>>> +#define pdev_list_is_read_locked(d) ({                           \
>>>>>
>>>>> I would be tempted to drop at least the '_read_' part from the name,
>>>>> the name is getting a bit too long for my taste.
>>>>
>>>> While I agree with the long-ish aspect, I'm afraid the "read" part is
>>>> crucial. As a result I see no room for shortening.
>>>
>>> OK, if you think that's crucial then I'm not going to argue.
>>>
>>>>>> +        struct domain *d_ = (d);                                 \
>>>>>
>>>>> Why do you need this local domain variable?  Can't you use the d
>>>>> parameter directly?
>>>>
>>>> It would be evaluated then somewhere between 0 and 2 times.
>>>
>>> It's ASSERT code only, so I don't see that as an issue.
>>
>> Fair point.
>>
>>>  Otherwise d_ needs to be made const.
>>
>> Indeed, but for assert-only code I agree the option is slightly better,
>> ideally suitably commented upon.
> 
> Is "the option" here referring to making d_ const, or using d directly
> (with suitable comment)?

The latter.

Jan


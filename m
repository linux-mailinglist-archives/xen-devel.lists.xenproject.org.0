Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE9A852BE6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 10:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679811.1057512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZojj-0007QB-Sb; Tue, 13 Feb 2024 09:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679811.1057512; Tue, 13 Feb 2024 09:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZojj-0007NV-Pa; Tue, 13 Feb 2024 09:05:55 +0000
Received: by outflank-mailman (input) for mailman id 679811;
 Tue, 13 Feb 2024 09:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZoji-0007NN-6D
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 09:05:54 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167a202c-ca4f-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 10:05:52 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-410c1ebf5e4so16856165e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 01:05:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b00411062c123esm3745234wmo.26.2024.02.13.01.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 01:05:51 -0800 (PST)
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
X-Inumbo-ID: 167a202c-ca4f-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707815152; x=1708419952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMyicW2A6mPqi/kvC1Q8vUVbx9Hqce/XZo/ttcaCmF0=;
        b=XM+gOXkGWSN8hfim9caARBdWvil1NJ6iksG4dH7+3n3TXRf5FyxK2IES+uxii6jR31
         jR4lRFyzNg4yKrV54U/aREyfcqG8Pvf4/GM/b1Aj0K3C6VwCpQ5stR1usOx2duaiMln4
         tctRvmHUuEgCLfr2bmIzxLNss1G0C5Z0JkWvlxVLQFRjptDi1mImU0IrghsJ51+haEDl
         9y4nq6zSLXWUVcA+jMH5XioZhK/NjXfWnOkV1fURusdNQxI8zRhMJSKXZrSiAMq9mfjD
         B/yhmUYdYNdIanes+ILRvlp8d2BtBCex62Qvymi6qsbKOlWsjFi/ywxjTm5qGv89Sjd6
         yKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707815152; x=1708419952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMyicW2A6mPqi/kvC1Q8vUVbx9Hqce/XZo/ttcaCmF0=;
        b=FChC6Z9HN8O8QSB4nAOrT5AgyE9Jkw3qVktpEfxi9RTPE0y0JdG3+Kd7h60ln4jGvV
         xISnJT5/vcAYcDzlOcx6ooZxpIWxel3sHV/vGQx/l+Gjj+oJrlCD9SiUdHn2ucqRUbp/
         GliRqseZBh4XxZIoj1L+7vIoqAiHBcahSO91RZxC3JXVz8mOBOBPcEMFNcjZd+iC5Dxu
         xPxfOyvnUh3Inf8LuHh2MnljUL20TZ78AcIg1z0Q/T9HvkiTth1Ugb2qzENtMuIq9kVI
         YY7ddH+G7CwWtS7ptJknKzX9zRP+ByQ4Bl5qwyD9MHJWYyTZZRsLv6fLp9d1dAfhx6gR
         r25A==
X-Forwarded-Encrypted: i=1; AJvYcCXqxIEAYf9rKkYnsNsqfvOFrPnkPxgnJ5EET9kQYYw+qmiwf/EDWhv8iE8q80lxI0CJ9OkFfBZtEvwJrkgCXN/szmD2gut3mKyyax2rsBc=
X-Gm-Message-State: AOJu0Yww1f6LhtiWHEvzs1+WYHMK5w/8sG1yqw6W+xZYqRgkGjsBaHTQ
	Gle+xmCcNl2UWGajcHKV6RyBPzPZt3F6EgY9ESLoLPZ1a5UIzilW4NgRmdFNUg==
X-Google-Smtp-Source: AGHT+IE0BKijW7sROLdJocDekKlqhIY9zlVP0lOuaLywO6CtKW6F/5/pMUCBAjesEG/kX+P91kB8zA==
X-Received: by 2002:a05:600c:1551:b0:410:7bfe:86b5 with SMTP id f17-20020a05600c155100b004107bfe86b5mr9513836wmg.27.1707815151912;
        Tue, 13 Feb 2024 01:05:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCQ6Q0kE60HE89gVS9f/sIDq6LykJltqjGwOIAqVccRu8v+F1a1+xBCaXOlcniPr//Xncj2NaH1llg4Icg2EungtikNDFFHgbgvzor+BJRBfe1aOjP1LPPROBXzyLonm020CzS4SU1n/AcF+Ku8ZN0xXCjpbMOLMpMdM7sW34W4ggqMx5YZIjkvd2Tkp63gVyldM1olZzYJVTdiIxUMhLLHsryp1ci13lSYBTjFAx+UTb0/tpp4OfhWH3YsrpPtNSuV9V0dfQDVUNLDmxQF250O7NtrlOpx5syKJQOJL1yBt+Rs1K6MrnDUoxchYqq3NDRgu2XRnix+HAqq2Sk8GWnY2BvfmNqexhea/4C7xy0ORpzbXBzTx3dMXXRtMerBN/IcwSqT462AZGRdjUevIBs3w==
Message-ID: <db0ce984-88e3-4394-b270-c5db585f8209@suse.com>
Date: Tue, 13 Feb 2024 10:05:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <Zcsp15Aqve11Icjb@macbook> <ec5d0c39-1559-4f10-9574-98cfa0542993@suse.com>
 <ZcswBFHtINB1XMAS@macbook>
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
In-Reply-To: <ZcswBFHtINB1XMAS@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2024 10:01, Roger Pau Monné wrote:
> On Tue, Feb 13, 2024 at 09:44:58AM +0100, Jan Beulich wrote:
>> On 13.02.2024 09:35, Roger Pau Monné wrote:
>>> On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -462,7 +462,8 @@ struct domain
>>>>  #ifdef CONFIG_HAS_PCI
>>>>      struct list_head pdev_list;
>>>>      /*
>>>> -     * pci_lock protects access to pdev_list.
>>>> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
>>>> +     * structure from being removed.
>>>>       *
>>>>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
>>>>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
>>>> @@ -628,6 +629,18 @@ struct domain
>>>>      unsigned int cdf;
>>>>  };
>>>>  
>>>> +/*
>>>> + * Check for use in ASSERTs to ensure that:
>>>> + *   1. we can *read* d->pdev_list
>>>> + *   2. pdevs (belonging to this domain) do not go away
>>>> + *   3. pdevs (belonging to this domain) do not get assigned to other domains
>>>
>>> I think you can just state that this check ensures there will be no
>>> changes to the entries in d->pdev_list, but not the contents of each
>>> entry.  No changes to d->pdev_list already ensures not devices can be
>>> deassigned or removed from the system, and obviously makes the list
>>> safe to iterate against.
>>>
>>> I would also drop the explicitly mention this is intended for ASSERT
>>> usage: there's nothing specific in the code that prevents it from
>>> being used in other places (albeit I think that's unlikely).
>>
>> But pcidevs_locked(), resolving to spin_is_locked(), isn't reliable. The
>> assertion usage is best-effort only, without a guarantee that all wrong
>> uses would be caught.
> 
> Do we want to protect this with !NDEBUG guards then?

Yes, that would look to be desirable.

>>>> + * This check is not suitable for protecting other state or critical regions.
>>>> + */
>>>> +#define pdev_list_is_read_locked(d) ({                           \
>>>
>>> I would be tempted to drop at least the '_read_' part from the name,
>>> the name is getting a bit too long for my taste.
>>
>> While I agree with the long-ish aspect, I'm afraid the "read" part is
>> crucial. As a result I see no room for shortening.
> 
> OK, if you think that's crucial then I'm not going to argue.
> 
>>>> +        struct domain *d_ = (d);                                 \
>>>
>>> Why do you need this local domain variable?  Can't you use the d
>>> parameter directly?
>>
>> It would be evaluated then somewhere between 0 and 2 times.
> 
> It's ASSERT code only, so I don't see that as an issue.

Fair point.

>  Otherwise d_ needs to be made const.

Indeed, but for assert-only code I agree the option is slightly better,
ideally suitably commented upon.

Jan


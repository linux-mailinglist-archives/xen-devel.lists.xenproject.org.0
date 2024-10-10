Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14028997E16
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815551.1229525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synBP-0006tc-OO; Thu, 10 Oct 2024 07:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815551.1229525; Thu, 10 Oct 2024 07:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synBP-0006qN-L4; Thu, 10 Oct 2024 07:01:59 +0000
Received: by outflank-mailman (input) for mailman id 815551;
 Thu, 10 Oct 2024 07:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1synBO-0006qH-38
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:01:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8935949a-86d5-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 09:01:56 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9944c4d5d4so85988866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 00:01:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7ec549csm44046766b.27.2024.10.10.00.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 00:01:55 -0700 (PDT)
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
X-Inumbo-ID: 8935949a-86d5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728543715; x=1729148515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZt+XJYSdwYln561BuqB+yeUg38/33FYKTH8R/LAnPQ=;
        b=EpPxdM7qeP9DzMY/4LRxWAqvjTMWri6umLapYNZUpfApkQou+fwDgUGzPjASVk0QOA
         J/UMoRpFwrw88nczSO1WEEkDCFk1gf+QZcJiicl5Qm/l6lUyPMXCu7GiHbL4ksqTOakA
         jvcn1kN1HkaNmpmJWAkJ5SIBoMinwapTrIbB+cP2m7uySmlS2dIevmIZEKgFlo66ltrT
         AKQsLQDs+ZJzvL89FcrOIuKb20GEpKdAFZA5JZm7iStFr1ZWrbCfWFy1be2ahRjLhWGO
         LWwfAaR1g9sZgZMpuJGWwyYfQSSZ0IRvcvKnk1NEVs9T9tEtLhIYWt3BHCbZ3Uh17ETt
         xzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728543715; x=1729148515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZt+XJYSdwYln561BuqB+yeUg38/33FYKTH8R/LAnPQ=;
        b=qjshJ2q4qgZgXkKgJh/LIbDFyj88n9Ekt2D+N9dskjlstJsKlvVzAI8RRZTU+MOhYN
         eEZ5bBCrOX8Pa0rke/xuypcE9EE62+4f6JHgYO0ztUzgmIPMQpuRgb7geA0+wrSglb0t
         N7Lnlz4THkOAQ774lV+JYtmZ6rNd0xEUPWqMaR7+e9LnXJUEVQqDbGpinrd46gbF7FuW
         SOJx42R8U58CkeFFSPPhglkiZIKqDCojBdMZwW1nOqoYQs9FfOKQVw2bEX5Wv4hH1qa8
         swqLGUBqguw9chkoEnjeQb+LRNDMEo4M4vKvuILhbMUP4F/sSjGP1fOFyBcXuu4LrFte
         KIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyqxaTlXc5ubO8waCvl0cNkgYrVttUDa6QevmzYmy8rBIF8G2RmEs+L/K7mVIgfKUs4GFiw7hvTjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFmv4yBjf/AOs3DnZuolW9NcWTSWmjSHnzIPDTXH2dYYg60IMa
	MEL4o7Yevz4qQjeCZ8lhw1DFFv1/eTIF+Vg/ocWIygfiocHeQBrxWyZz7AnjZA==
X-Google-Smtp-Source: AGHT+IFaW38MP0jnIfnVt55M9aG5wz4Bk+QoZFc2vIZ6r2o4BcPZnjYn6x2Qoefq32VwnIcR6ZTwBA==
X-Received: by 2002:a17:907:60d6:b0:a99:4982:da46 with SMTP id a640c23a62f3a-a998d3299a8mr377605666b.63.1728543715487;
        Thu, 10 Oct 2024 00:01:55 -0700 (PDT)
Message-ID: <756dc3d5-48fd-429f-a5eb-6cb8e99dfe6f@suse.com>
Date: Thu, 10 Oct 2024 09:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Remove config dependency in XEN_PRIVCMD definition
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20241009062014.407310-1-Jiqian.Chen@amd.com>
 <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
 <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
 <8bfaa6cc-2cf1-48e4-828b-e4d356f0b3fc@suse.com>
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
In-Reply-To: <8bfaa6cc-2cf1-48e4-828b-e4d356f0b3fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.10.2024 07:39, Jürgen Groß wrote:
> On 10.10.24 00:46, Stefano Stabellini wrote:
>> On Wed, 9 Oct 2024, Jan Beulich wrote:
>>> On 09.10.2024 08:20, Jiqian Chen wrote:
>>>> Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
>>>> adds a weak reverse dependency to the config XEN_PRIVCMD definition, its
>>>> purpose is to pass the combination of compilation that CONFIG_XEN_PRIVCMD=y
>>>> and CONFIG_XEN_PCIDEV_BACKEND=m, because in that combination, xen-pciback
>>>> is compiled as a module but xen-privcmd is built-in, so xen-privcmd can't
>>>> find the implementation of pcistub_get_gsi_from_sbdf.
>>>>
>>>> But that dependency causes xen-privcmd can't be loaded on domU, because
>>>> dependent xen-pciback is always not be loaded successfully on domU.
>>>>
>>>> To solve above problem and cover original commit's requirement, just remove
>>>> that dependency, because the code "IS_REACHABLE(CONFIG_XEN_PCIDEV_BACKEND)"
>>>> of original commit is enough to meet the requirement.
>>>>
>>>> Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>
>>> This lacks a Reported-by:.
>>>
>>>> --- a/drivers/xen/Kconfig
>>>> +++ b/drivers/xen/Kconfig
>>>> @@ -261,7 +261,6 @@ config XEN_SCSI_BACKEND
>>>>   config XEN_PRIVCMD
>>>>   	tristate "Xen hypercall passthrough driver"
>>>>   	depends on XEN
>>>> -	imply XEN_PCIDEV_BACKEND
>>>>   	default m
>>>>   	help
>>>>   	  The hypercall passthrough driver allows privileged user programs to
>>>
>>> The report wasn't about a build problem, but a runtime one. Removing the
>>> dependency here doesn't change anything in the dependency of xen-privcmd
>>> on xen-pciback, as the use of pcistub_get_gsi_from_sbdf() continues to
>>> exist.
>>>
>>> Consider the case of XEN_PCIDEV_BACKEND=m and XEN_PRIVCMD=m, which
>>> I guess is what Marek is using in his config. Both drivers are available
>>> in such a configuration, yet loading of xen-privcmd then requires to
>>> load xen-pciback first. And that latter load attempt will fail in a DomU.
>>> The two drivers simply may not have any dependency in either direction.
>>
>> The idea is that there should be no hard dependency on
>> pcistub_get_gsi_from_sbdf(). If it is available, the service will be
>> used, otherwise an error will be reported.
>>
>> The problem is that IS_REACHABLE is a compile-time check. What we need
>> is a runtime check instead. Maybe symbol_get or try_module_get ?
> 
> This is a rather clumsy solution IMO.
> 
> I'm seeing the following solutions:
> 
> 1. Don't fail to to load the pciback driver in a DomU, but only disable
>     any functionality.
> 
> 2. Move the drivers/xen/xen-pciback/pci_stub.c functionality in a module
>     of its own, allowing the privcmd driver to be loaded without needing
>     the rest of pciback.
> 
> 3. Add a hook to e.g. drivers/xen/pci.c instead for calling of
>     pcistub_get_gsi_from_sbdf() directly. pciback could register the real
>     call address. If pciback isn't loaded, the hook can return an error.
>     This would remove the explicit dependency of privcmd on pciback.
> 
> I'd prefer the 3rd variant.

Same here - order of preference backwards in the set presented above.
In the meantime the original change may simply need reverting?

Jan


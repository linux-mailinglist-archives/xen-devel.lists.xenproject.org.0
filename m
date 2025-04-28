Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566DA9EB57
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 11:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970325.1359042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KMh-0000Wb-0f; Mon, 28 Apr 2025 09:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970325.1359042; Mon, 28 Apr 2025 09:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9KMg-0000Tu-Ty; Mon, 28 Apr 2025 09:01:26 +0000
Received: by outflank-mailman (input) for mailman id 970325;
 Mon, 28 Apr 2025 09:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9KMe-0000Tm-UF
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 09:01:24 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bec4b8d-240f-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 11:01:23 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso28203745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 02:01:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2ac079sm149652055e9.18.2025.04.28.02.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 02:01:22 -0700 (PDT)
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
X-Inumbo-ID: 5bec4b8d-240f-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745830883; x=1746435683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kIn2I/imRUJcWf2136sPowlWU/VZ8af3YxX4p7cyuyQ=;
        b=LaX7nKUsB8QvOc2srasKnu1IBZeFu+of8U4lDcCCv7lj3ntSWdpWUbmjS3WvkBk4QP
         4avf0ze+EJujpVYOkXoNBZI1yrHLdG2eqc7LILIIlL0clNR8CFFs1f28gG9jEuJopxDc
         KrP9hVP5XqIEJOAPdTqgtEhhvAKJdao1p7Jl90JvjwTPs7Ob/29dyLYz/eT8l3XsHV3W
         ROXnDvmZbsAvdxMaHPMXeCtzl3Y/aoQqAKVTabxUD61AXi8AwYv2SNBa4YHXAje+LF8a
         tfClU9P9k+RvjEr1ChhdG6y8cvnCbypNpTx9jd1Z1tLL2jR6id7xMC0d1WQe6MSbyy6i
         NHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745830883; x=1746435683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIn2I/imRUJcWf2136sPowlWU/VZ8af3YxX4p7cyuyQ=;
        b=celvild3WghmUHlE6P4yFDXcei3+mwQW8sIC+e0NPMgAegveY0wrLjYvftF+2nVtxc
         nWgh2fV1l2bOJHpc58aupABMgjhMsh6U4FElpT0acf5aydLxKC5XyEW+1CnXq8mfGLCH
         B+qjFScq0Jd+paxxgD148+CXgIj4T6UBwKporDqOmc+86YIOc1gd5elf4EwmH+KsJH0o
         9CwGn6rm3qyRwoM6nlGVcFygqYyQAaiFNJ9ckeA76o7EhSMxb+WvKx38wI34CR21P8ni
         KkiViRtiKpnQkM4tjN7QKaI4JPGjiUbQ/43y1GdCPhU4/bxeCULUheMixjzeLCAlKT8m
         p3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoJyTpe0Gh3+2xpT82xMDG7DVAtGt9u6s9Rpuvh9xObyBIK+soFd1It3ui9it5uhjIpf7EL2p4atI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnK9VQRhZwiMxpKUmGGLU0e9uh3nqNyHNYS4L2gnj7K5Jq+Pgh
	mSEBeiN9hmuJq3IYPhYIg7Aule5KaMUF8zhuXhqlal5l8fxWFHl66f6CsSnmwA==
X-Gm-Gg: ASbGncuUq1EPnCyMiGINoXzSqlIRayqOyYL/l1OkoYv5rZsaASCfAj0rgpNvhegR65w
	1TH9jrUSocaGePXbNEZM6411wfJpwiondXP5gOUIchXPlMw9dt5UsZKx65hgfVqRyQaS9MwlKh3
	+Kgx0DJYgu7P9AWzA4JRH3DMFtsrGkGdtkWntwNZyWPFps3ZuYvlTkbym+vsRapXpumzJTGOa9J
	Jns8t7VDGA16ludOV62atep0pmU3G6eahqaTb/HkzlPmIEAYFRVCORsAT/Hqi1jwSGbQ0urr6Z+
	TNpLTYkxMf0PLxeGAQkzeVes3QCkv0lVFVjFMfFMV3KE6Zko4v8+8PO2LHZt3kNp0gV42cVT0Mh
	meEplOhbdNeFoNx+lCw0+csUO2w==
X-Google-Smtp-Source: AGHT+IFn4eGo0QDnYRBOgmpjY2eamob9w6Dvs86/4IDP5ZooTzyHlWaBxbo5pMGbPFGOz2LCqnzysQ==
X-Received: by 2002:a05:600c:138f:b0:439:9737:675b with SMTP id 5b1f17b1804b1-440a65e81e6mr80974275e9.7.1745830882911;
        Mon, 28 Apr 2025 02:01:22 -0700 (PDT)
Message-ID: <b4baad49-f751-42e6-9785-6d71aac3ebc3@suse.com>
Date: Mon, 28 Apr 2025 11:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
 <c33b906f-f9cb-45e5-ac84-28dc687a6f7a@epam.com>
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
In-Reply-To: <c33b906f-f9cb-45e5-ac84-28dc687a6f7a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 10:21, Mykyta Poturai wrote:
> On 17.03.25 17:07, Jan Beulich wrote:
>> On 14.03.2025 14:34, Mykyta Poturai wrote:
>>> --- a/xen/arch/arm/pci/pci.c
>>> +++ b/xen/arch/arm/pci/pci.c
>>> @@ -16,9 +16,18 @@
>>>   #include <xen/device_tree.h>
>>>   #include <xen/errno.h>
>>>   #include <xen/init.h>
>>> +#include <xen/iommu.h>
>>>   #include <xen/param.h>
>>>   #include <xen/pci.h>
>>>   
>>> +bool is_pci_passthrough_enabled(bool dom0)
>>> +{
>>> +    if ( dom0 )
>>> +        return pci_passthrough_enabled || iommu_enabled;
>>
>> As I think I said before - the function's name now no longer expresses
>> what it really checks. That (imo heavily) misleading at the use sites
>> of this function.
> 
> I've spent some more time thinking about how to better deal with this. 
> In the end, I think your earlier suggestion about introducing a new arch 
> specific function is the best approach, but I want to agree on the 
> naming before sending new patches. Would "arch_requires_pci_physdev" be 
> an appropriate name in your opinion?
> 
> At the call sites it will look like this:
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
> 
>          if ( !is_pci_passthrough_enabled() && !arch_requires_pci_physdev())
>              return -EOPNOTSUPP;

There are several questions that affect naming: Is it really "requires"? Is
it really all PCI-related physdevops? Is the ordering of naming elements in
line with what we use elsewhere (arch_ first is, but perhaps either pci or
physdevop wants to move earlier)?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE3A6A1B5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 09:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921478.1325308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBYE-0005MK-TN; Thu, 20 Mar 2025 08:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921478.1325308; Thu, 20 Mar 2025 08:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvBYE-0005Kn-Qf; Thu, 20 Mar 2025 08:46:54 +0000
Received: by outflank-mailman (input) for mailman id 921478;
 Thu, 20 Mar 2025 08:46:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvBYC-0005Kh-QN
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 08:46:52 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dda5343b-0567-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 09:46:50 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3965c995151so240097f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 01:46:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8881539sm22713361f8f.46.2025.03.20.01.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 01:46:49 -0700 (PDT)
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
X-Inumbo-ID: dda5343b-0567-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742460410; x=1743065210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bDNTI3hOaCvuuAVoUZzvEqzOgI7RZ3yM1B3ixcqdrIU=;
        b=CRPAELTRDMtFmGkd0p+lm+Pc1MZrYsLlsZWPDE2tiaLOoFf0UUUxlgszwpP0ZLLifS
         LvXEOJ3KSN27uPc0rS1nL/Szn6HZJbJnh3F83KOTJyFtwos3wx0F+3ZmQsQKxEkcb6JP
         u7LakYfKx1xKl75L7e9N8qu35qj90Ado6tl3ISItgdrfHh72Km01UwkezRbmCuqDryil
         zkUFI6LbcaWhgKtiMYjDg37BrfUxRt3h/T7uKY78BhOBR9gYIb6q0Grdc51A28Imee5B
         2enJ5SDNsZecJaqGMrv/iq/f7LPRA47/xsq5qVH3EptP7jqM/qO9TdZytACp9PDKJWxO
         iKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460410; x=1743065210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDNTI3hOaCvuuAVoUZzvEqzOgI7RZ3yM1B3ixcqdrIU=;
        b=keYSCeDoXagxDyY0IVSyOTAeKTbyPLsH/Nk9pIwbtUR7WkuZR7yis5CzEi/hoWSkg8
         rFk6jg1wrB+tTU9bgP7iAAQM2fMhwH+CHHm37la5SbtnOZa9olEzMGmUgHhYxdC39+XO
         ZAVSoJhbl4LnkZhnUseD7X55PV2tCgUrasGTQaS/k+3Tm0EXELKOuq4urExCv3Vglpgk
         8nnSfoxGRZ7kVk65H/yEoyQNiaO0Nk1NvYfPWyon1+bhP3/L0n2V1GC77ujvQeNCvX8T
         L/KxCbIPWAzQRF8tsTFKhTm86oUXA2Rv7cVIbvw8dDmXodaeBzbXPFECbURZ7IYxmcc1
         bZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCXkW4GG2URt7abW+vkG4nr01B+rcohjqAC1UGiboaH3V7TiOuDDsyoCoohgCWgLAbUOt7PBZG2LlZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+cO8f2XbeTz+QMX48ws5wJfiqhd6EDkoZfzvIbLqgKoP7qUII
	7/7Yw1RIISMiUVHaiTagniK2iPe5Kz2uLfRI7M7bMtCq/oYfSdeX3fvpmFMY+g==
X-Gm-Gg: ASbGncupEQxM9UPTdYCkFwFgFRmBRoZPHiUMH/W98gc5bEvq5shUbf/NyOeoPa7POlj
	VY+69/J8Iu4hnKsNHowvD0NcT4xcLLbvyFj2D3P4n9BpejhFlzvcz8I7O0q8s/zjtT4DW9KPIKW
	ynhfDk0GLCe0IELWFkUIPcFnqC+qefwxFLy7ZN9jNbyiu9icCWJSHMnF+pXTXkQM6x7ZTFjsxTs
	akZ9J3G2R8ROrb3g+HG+sT71jbFeIpY8PBbdXgKt1bPU0eg9DtSHCXoVH4MoLgzqz7W/7OuOeMI
	RUZBfEKHOsPL0EkRpJ/XMuFlRnfCks7RLzYIWLNwCHNvQP/iEYBsjusW6ofPiZ/jxCohz1cvFjj
	oimqIUV55DGVNpNss41r8TJwz41r3RA==
X-Google-Smtp-Source: AGHT+IETvJkaV8jovugjlFnbGluOQspo/xhILLDtqXfBIknQBW5IqoBQGEjP6MyLNtD1xIQh1twrAg==
X-Received: by 2002:a5d:6d06:0:b0:391:30b9:556c with SMTP id ffacd0b85a97d-399739becc7mr6822420f8f.21.1742460410096;
        Thu, 20 Mar 2025 01:46:50 -0700 (PDT)
Message-ID: <318177c1-8bb9-4d30-81a0-6636183f2571@suse.com>
Date: Thu, 20 Mar 2025 09:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-4-Penny.Zheng@amd.com>
 <D8F4G80E0LHU.5GHN1ZVVNHYB@cloud.com>
 <IA1PR12MB8467691D93E223033398DCBCE1D82@IA1PR12MB8467.namprd12.prod.outlook.com>
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
In-Reply-To: <IA1PR12MB8467691D93E223033398DCBCE1D82@IA1PR12MB8467.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 09:02, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> Sent: Thursday, March 13, 2025 8:03 PM
>>
>> Ok, so readconsole is done here. I see how if you're also removing the console
>> handler for the sysctl that's a bit unwiledly to do in one go.
>>
>> I think my earlier remarks still hold in terms of removal of else branches of ifdefs.
>>
>> On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
>>> The following functions is to deal with XEN_SYSCTL_readconsole sub-op,
>>> and shall be wrapped:
>>> - xsm_readconsole
>>> - read_console_ring
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>>  xen/drivers/char/console.c |  2 ++
>>>  xen/include/xen/console.h  |  8 ++++++++
>>>  xen/include/xsm/dummy.h    | 11 ++++++++---
>>>  xen/include/xsm/xsm.h      | 11 ++++++++---
>>>  xen/xsm/dummy.c            |  2 +-
>>>  xen/xsm/flask/hooks.c      |  4 ++--
>>>  6 files changed, 29 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>>> index 2f028c5d44..6e4f3c4659 100644
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -336,6 +336,7 @@ static void conring_puts(const char *str, size_t len)
>>>          conringc = conringp - conring_size;  }
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>  long read_console_ring(struct xen_sysctl_readconsole *op)  {
>>>      XEN_GUEST_HANDLE_PARAM(char) str; @@ -378,6 +379,7 @@ long
>>> read_console_ring(struct xen_sysctl_readconsole *op)
>>>
>>>      return 0;
>>>  }
>>> +#endif /* CONFIG_SYSCTL */
>>>
>>>
>>>  /*
>>> diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
>>> index 83cbc9fbda..e7d5063d82 100644
>>> --- a/xen/include/xen/console.h
>>> +++ b/xen/include/xen/console.h
>>> @@ -7,12 +7,20 @@
>>>  #ifndef __CONSOLE_H__
>>>  #define __CONSOLE_H__
>>>
>>> +#include <xen/errno.h>
>>>  #include <xen/inttypes.h>
>>>  #include <xen/ctype.h>
>>>  #include <public/xen.h>
>>>
>>>  struct xen_sysctl_readconsole;
>>
>> That forward declaration should probably be inside the ifdef
>>
>>> +#ifdef CONFIG_SYSCTL
>>>  long read_console_ring(struct xen_sysctl_readconsole *op);
>>> +#else
>>> +static inline long read_console_ring(struct xen_sysctl_readconsole
>>> +*op) {
>>> +    return -EOPNOTSUPP;
>>> +}
>>> +#endif
>>
>> This is only called from sysctl.c, which will be compiled out. Why is the else
>> needed?
>>
> 
> Because I wrapped the sysctl.c in the last commit.
> If removing the else condition here, the compilation will fail on this commit.
> So either I add #ifdef into read_console_ring function body, or in the last commit,
> I draw back all these unnecessary else conditions, or combine all commits into one
> Any preference? Or any other suggestion?

Munging everything in a single commit may yield unwieldily big a result. Transiently
adding #ifdef in sysctl.c would seem like the cleanest approach to me. In the final
commit it'll (hopefully) be obvious enough then why all of the #ifdef-s are dropped
again.

Jan


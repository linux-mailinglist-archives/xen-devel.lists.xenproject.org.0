Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD1B0D25A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051987.1420470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue76y-0008Bp-Nt; Tue, 22 Jul 2025 07:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051987.1420470; Tue, 22 Jul 2025 07:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue76y-00089j-LJ; Tue, 22 Jul 2025 07:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1051987;
 Tue, 22 Jul 2025 07:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue76x-00089b-GW
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 07:08:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8ee97bd-66ca-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 09:08:25 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so2883400f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 00:08:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e41cfa587sm670000a91.45.2025.07.22.00.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 00:08:24 -0700 (PDT)
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
X-Inumbo-ID: a8ee97bd-66ca-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753168105; x=1753772905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oXp9rQm1y0YekEb7ty/wvgA/L95dQ+GORNmpRyUPO68=;
        b=K30FfCAUn44ITu8d0ei9RGBfN2JSUk3j9YFEFDAgU91qhQX/sYo1CsEFKqH8ns7s9z
         3gzWjsneCtMAf9uheBw/LHvwSNd7lE5Oki651HgMUC7TjPyXWnHZxDqHon+TDoEp1DBu
         /42CVzoomORGun6eijbkkolOWQ6Qs92faLrMifZ2qaF3RTOvj4Z/lLe19m/sFtatVLmg
         +uYU5qhYSiPc88P85SgAPxPwu2JZQ3SoUYfTM78WupMsDCUfhSD3iVjOsXBWf6rCRN0S
         C2qPfC8OBT3x7yb4Tc7hVyeBCdTlr2pYdVpUT20Fow98SPbWxSvjcMQ+3P72ZX8klBFZ
         +tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168105; x=1753772905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXp9rQm1y0YekEb7ty/wvgA/L95dQ+GORNmpRyUPO68=;
        b=rOFyrkPvK67UkIfH+0JiQ+ILqBDXnS/2UKxefNkE+QfxbeKepRS2JdoootSyMp3RlZ
         0CGtI2SryGqBbVxKZ/DWg16d3amMn1rYdbK+5x1808lnE6nEYcFQ7bqFlUCYTbvCfc3g
         t3Rluy4QnjlqFc8wHt8jgnkv0TzYG8mz7VG12ijYjR+7fsI0wq26NHS4b9HKrJOxkyG1
         5iokajIuQ0ovXTYnA6NlPvzPfS9M4zsaiQI/Msp4otwuK+lnySWDgtOO+ISOkcXGTp6y
         RITg3d7N9nM0iwoTJPmGizCWdOOrsAmjqTY5oJCHKcEsJ+KZ911Glk+XL2nDtPUQnRWg
         GWNw==
X-Forwarded-Encrypted: i=1; AJvYcCUYGCGcaXaUTuTRjl3Jv4pHF+ZDjAf6NUapeYD7YOe2NK/9JX1UFLIZD7twfaW4XtWuW0uvMYV9RMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzgb7jiGxrexEdRLu1Ts8CCfoa5S14y/PhWXzg1EZSSWH/f6gPd
	aRcJ1+8Kz9ZKTgq4TE8vxGjRk6ca/XIRq3aQ6sPYKWseWXLisOZW714e0SrSYa3vAA==
X-Gm-Gg: ASbGncsYczlNzCeaL7/0sPBJXn0rjuWbatSIneayYC/FeBV1JjbI80er9DqEWnLW4ma
	OR+5qCG5NXI+fmUcHCe7DEI0q9ms7eglsdc+LjVfC4u21leWjvVunQvWyNvaK+q4taL4ck2XzlG
	FzwIHXejXaXC+d8md+xE4VBDh9dnM/ZmmhU9X/32QGdsPGIjJEZlgTDxbSPhNHbJ5yFmYdoa9gn
	OA5yZ0qDXuEgZPFtxtGk4EIs2molL0qlXmyweaEngYsoTnGm3s4xPhnFsBD7MBZh8OrRxW1uJ1N
	NyOIOaOYMq9vt/bvfGEQy4iTy94EFHIETnj5VllKZ9QlzkQedqFUa35ZlouWspkCsf+dowEUjcb
	OIQ03NS20F1Uzm1W/14fz1voXf+271zq6aXBl1yBgEdOnacG/3uh2UiCRsIVku00mjwF1zTu80e
	JQc3393U8=
X-Google-Smtp-Source: AGHT+IGsDy+ELMInVKre0jFc4d0mMDOzluatU1j2bz5DR7t+2chUkcRvAP7+lqHiGGpHXDEF1xlMCA==
X-Received: by 2002:a5d:5e8e:0:b0:3a4:ed1e:405b with SMTP id ffacd0b85a97d-3b60e53ef6dmr15383001f8f.46.1753168104699;
        Tue, 22 Jul 2025 00:08:24 -0700 (PDT)
Message-ID: <98dceb08-8d6f-4c37-bcac-a9f610860de6@suse.com>
Date: Tue, 22 Jul 2025 09:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-8-Penny.Zheng@amd.com>
 <5238ec09-2a00-4f80-aea6-95a3ab617b0d@suse.com>
 <DM4PR12MB8451571C1DEBBA2F5FA66A87E15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a9443bf4-78ec-4731-8e05-dedd65547ed0@suse.com>
 <DM4PR12MB84512B6BEE55EF0CD281568BE15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84512B6BEE55EF0CD281568BE15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2025 08:59, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, July 22, 2025 1:33 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger
>> Pau Monné <roger.pau@citrix.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>; Julien
>> Grall <julien@xen.org>; Sergiy Kibrik <Sergiy_Kibrik@epam.com>; xen-
>> devel@lists.xenproject.org; Stabellini, Stefano <stefano.stabellini@amd.com>
>> Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
>>
>> On 22.07.2025 07:05, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, July 17, 2025 4:55 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>; Stabellini, Stefano
>>>> <stefano.stabellini@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Andrew Cooper <andrew.cooper3@citrix.com>;
>>>> Roger Pau Monné <roger.pau@citrix.com>; Anthony PERARD
>>>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>;
>>>> Julien Grall <julien@xen.org>; Sergiy Kibrik
>>>> <Sergiy_Kibrik@epam.com>; xen- devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
>>>>
>>>> On 11.07.2025 06:31, Penny Zheng wrote:
>>>>> --- a/xen/common/Makefile
>>>>> +++ b/xen/common/Makefile
>>>>> @@ -49,6 +49,7 @@ obj-y += spinlock.o
>>>>>  obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o  obj-y +=
>>>>> stop_machine.o  obj-y += symbols.o
>>>>> +obj-$(CONFIG_SYSCTL) += sysctl.o
>>>>>  obj-y += tasklet.o
>>>>>  obj-y += time.o
>>>>>  obj-y += timer.o
>>>>> @@ -70,7 +71,6 @@ obj-$(CONFIG_COMPAT) += $(addprefix
>>>>> compat/,domain.o memory.o multicall.o xlat.o  ifneq
>>>>> ($(CONFIG_PV_SHIM_EXCLUSIVE),y) obj-y += domctl.o
>>>>>  obj-$(CONFIG_VM_EVENT) += monitor.o -obj-y += sysctl.o  endif
>>>>>
>>>>>  extra-y := symbols-dummy.o
>>>>
>>>> CI demonstrates that this combination of changes is wrong. The job
>>>> that failed
>>>> (debian-12-x86_64-gcc-ibt) is a randconfig one, and ended up picking
>>>> both SYSCTL=y and PV_SHIM_EXCLUSIVE=y. Which results in sysctl.c
>>>> being built, but domctl.c not being built. Which leaves
>>>> getdomaininfo() undefined, causing linking to fail. In case the next
>>>> pipeline also ends up failing, I'll simply revert that change. In
>>>> case it succeeds, not reverting may be an option, as long as a proper fix shows
>> up pretty quickly.
>>>
>>> I've push commit of " xen: move getdomaininfo() to domain.c " to try to fix the
>> error.
>>
>> And you're reasonably certain that's the only issue? I ask because it is the nature of
>> randconfig to pick random combinations of settings; on a later pipeline I had seen a
>> different failure. I didn't look at that in detail (it may have had to do with the domctl
>> lock or something vaguely similar), which perhaps was a mistake.
> 
> I turned on HVM, HYPERV_GUEST, and VGA when PV_SHIM_EXCLUSIVE is on to track down more linking issues
> All undefined link failure is due to removing PV_SHIM_EXCLUSIVE dependency for CONFIG_HVM, like monitor_traps, domctl_lock_acquire/domctl_lock_release, etc
> I suggest to move domctl_lock_acquire/domctl_lock_release out of domctl.c too, and also "obj-$(CONFIG_VM_EVENT) += monitor.o" out of PV_SHIM_EXCLUSIVE guard

I'm not convinced of that approach; I'm curious what others think. One alternative
would appear to be to have SYSCTL depend on DOMCTL (the latter yet to be introduced).
As it stands, my vote would go towards reverting the final one or two patches. It's
not entirely clear to me though why you say ...

> And above change, fwit, is to fix commit of " xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"  "

... this. My understanding is that the issue became manifest with "xen/sysctl: wrap
around sysctl hypercall", i.e. reverting just that one would suffice at least for
the getdomaininfo() issue. Yet then "above" is ambiguous here, and hence may mean
the domctl lock issue. Which then would indeed suggest we need to revert both.

Jan


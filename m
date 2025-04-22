Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8591A95EA9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 08:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961697.1353044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77T6-0006MS-BO; Tue, 22 Apr 2025 06:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961697.1353044; Tue, 22 Apr 2025 06:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u77T6-0006Ka-8m; Tue, 22 Apr 2025 06:50:56 +0000
Received: by outflank-mailman (input) for mailman id 961697;
 Tue, 22 Apr 2025 06:50:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u77T5-0006KU-5d
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 06:50:55 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 220c5525-1f46-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 08:50:52 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso38133165e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Apr 2025 23:50:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43bef1sm13898306f8f.49.2025.04.21.23.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Apr 2025 23:50:52 -0700 (PDT)
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
X-Inumbo-ID: 220c5525-1f46-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745304652; x=1745909452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DqGAc+NTxDpGdquOAibZ6B2EGrQKikik1OQ6kdoOxuc=;
        b=Zo1v7fRDmViQO9cZokhDjkZwRlh6yS191fqwkCS3dgDLz7T1n7+ySs8tQWHcnmkEwT
         /4+6VDU4rhIZb4JBteZrP2QjJKJEafR5fT/SmUSMF/+730CC+pPTLfw8PIsr9xO3oTwb
         ZyeSLzbI+9HKAZBq0jI2t6t6IdJ+d1wSwaW0nuasfWQ/de2ay4a2Hpmo78bssYXlu/xb
         DDw2YugisbMxSjBIMmIZcUlZ2w468f3ObUp2R5VrKNcvq7zVs17R7n4u3M2mKY3Q7Avt
         zVunNZgmmhsSfk5s+sdPY9bn9AEMtmz84duWHW1+yS5R/GcCWVFMTRM23GTX9g3VdbTm
         2Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304652; x=1745909452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqGAc+NTxDpGdquOAibZ6B2EGrQKikik1OQ6kdoOxuc=;
        b=rE7rtDvSBjTy1uECJeQccNYWCu5EkJ8ps/W/kz8tfXl28zgy+grE6wZiQjFL1NwWky
         J1CgtMDHIoy5MT30GliQwCQ0qyUvu7MDvJPnUU9ybwQT+eKpuHctI6gCu11wTCvx/7kE
         qRCwSaYMV/IFUAoyu4O3Dn0AtMjPzgZLZX9K+lHx7XBg5iI0A+vAncYwLJjYDPrDg0wV
         iWp+msS3nIF+BW35SAT+VC7si8IolgZb7LYxIuALHxKarrZbRpREqdHqB5lW1S1KKVF8
         EHCzMdJoPEVeb5NK63cgcPMzfYy4DNzN+mOSYM9K+tfeXlC9hmuL3c36dZuVjd6S4bOl
         X9hA==
X-Forwarded-Encrypted: i=1; AJvYcCUdmRyIxE61VLUXs28kd4M3hH6JWIcs8liFD7PCl0aYkW8USe+WQpNxTxvBWdYmTmVga+Rpyw7ogSs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxfs4IjB2GZia7DzV4oHhpBeacLQ3jD1ejqUELrnwUCimsoRDQb
	F6jaAMSwb+C4+gT7LrDBzj/Bf+E7CBLh+gyQUNEVBAn9ArBfdXwfWegpSiJ2RQ==
X-Gm-Gg: ASbGncsbT1SsIy8F6iONFLX3Fi9E92zZ50qRQKgiu+ulM3VHariZ4WPU3WHkYAYsqqc
	SgpvgwgQHNAhKzmT7/Rg617tSn1NmNTMkBFBWAeiMFT0WZpkW2qSWi5/fPGCdTfXc/p8SLlFevu
	ZvpT/6eNmxOdl64bq2LLSJcqS9kMfTgH41BGerseTaz5eVQgJY8wJ3uWBgHhwJOdIZv1+i1uiN+
	KNkYupqmsmQpPKe7JiVjgHLGRF7uEiFYzA6e2L72l0Wx4xfItda8i6Dy9QJbyfFdDO3iYu9nvLJ
	vkQ62b9yazk9v3QkqLNp5iaLCyeZciQTA7vCi938JchMB7zdjEcLh+FSmd8KErCUPFeUyTYg5Xn
	1Pj8+xRakZ8EDakF8oy8VTdS8Yw==
X-Google-Smtp-Source: AGHT+IE/pYa9r1/US++OuGixF4dX5miDOM0RtSO+avwsjyYRbHaiI8Hee3tqFtFSnLK3XtFIe+5p0Q==
X-Received: by 2002:a05:600c:1911:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-4406aa8b882mr128079345e9.0.1745304652355;
        Mon, 21 Apr 2025 23:50:52 -0700 (PDT)
Message-ID: <a92a292d-a283-41f2-816d-1db51a6789fb@suse.com>
Date: Tue, 22 Apr 2025 08:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Orzel, Michal" <Michal.Orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-19-Penny.Zheng@amd.com>
 <33b166be-21db-473e-a59a-3779436c0494@suse.com>
 <DM4PR12MB845116DF8BF05D205BD8622FE1BF2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845116DF8BF05D205BD8622FE1BF2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2025 11:46, Penny, Zheng wrote:
> [Public]
> 
> Hi，
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 1, 2025 10:47 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
>> <bertrand.marquis@arm.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Roger Pau Monné <roger.pau@citrix.com>; Alistair Francis
>> <alistair.francis@wdc.com>; Bob Eshleman <bobbyeshleman@gmail.com>;
>> Connor Davis <connojdavis@gmail.com>; Oleksii Kurochko
>> <oleksii.kurochko@gmail.com>; Stabellini, Stefano
>> <stefano.stabellini@amd.com>; Sergiy Kibrik <Sergiy_Kibrik@epam.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
>> arch_do_sysctl
>>
>> On 26.03.2025 06:50, Penny Zheng wrote:
>>> Function arch_do_sysctl is to perform arch-specific sysctl op.
>>> Some functions, like psr_get_info for x86, DTB overlay support for
>>> arm, are solely available through sysctl op, then they all shall be
>>> wrapped with CONFIG_SYSCTL Also, remove all #ifdef CONFIG_SYSCTL-s in
>>> arch-specific sysctl.c, as we put the guardian in Makefile for the
>>> whole file.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> ---
>>> - use "depends on" for config OVERLAY_DTB
>>> - no need to wrap declaration
>>> - add transient #ifdef in sysctl.c for correct compilation
>>> ---
>>>  xen/arch/arm/Kconfig   |  1 +
>>>  xen/arch/arm/Makefile  |  2 +-
>>>  xen/arch/arm/sysctl.c  |  2 --
>>>  xen/arch/riscv/stubs.c |  2 +-
>>>  xen/arch/x86/Makefile  |  2 +-
>>>  xen/arch/x86/psr.c     | 18 ++++++++++++++++++
>>>  xen/arch/x86/sysctl.c  |  2 --
>>>  xen/common/sysctl.c    |  2 ++
>>>  8 files changed, 24 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig index
>>> ffdff1f0a3..aa1b4a6e6b 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -141,6 +141,7 @@ config HAS_ITS
>>>
>>>  config OVERLAY_DTB
>>>     bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
>>> +   depends on SYSCTL
>>>     help
>>>       Dynamic addition/removal of Xen device tree nodes using a dtbo.
>>>
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile index
>>> 4837ad467a..7c6015b84d 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -54,7 +54,7 @@ obj-y += smpboot.o
>>>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>>>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>>>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o -obj-y += sysctl.o
>>> +obj-$(CONFIG_SYSCTL) += sysctl.o
>>>  obj-y += time.o
>>>  obj-y += traps.o
>>>  obj-y += vcpreg.o
>>> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c index
>>> 2d350b700a..32cab4feff 100644
>>> --- a/xen/arch/arm/sysctl.c
>>> +++ b/xen/arch/arm/sysctl.c
>>> @@ -15,7 +15,6 @@
>>>  #include <asm/arm64/sve.h>
>>>  #include <public/sysctl.h>
>>>
>>> -#ifdef CONFIG_SYSCTL
>>>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)  {
>>>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm |
>>> XEN_SYSCTL_PHYSCAP_hap; @@ -23,7 +22,6 @@ void
>> arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>>>
>>> XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);  } -#endif
>>>
>>>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>>>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c index
>>> 7b3f748886..ae865e1972 100644
>>> --- a/xen/arch/riscv/stubs.c
>>> +++ b/xen/arch/riscv/stubs.c
>>> @@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to,
>>> const void __user *from,
>>>
>>>  /* sysctl.c */
>>>
>>> +#ifdef CONFIG_SYSCTL
>>>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>>>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)  {
>>>      BUG_ON("unimplemented");
>>>  }
>>>
>>> -#ifdef CONFIG_SYSCTL
>>>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)  {
>>>      BUG_ON("unimplemented");
>>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile index
>>> f59c9665fd..837eafcbc0 100644
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -79,7 +79,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)  obj-y +=
>>> domctl.o  obj-y += platform_hypercall.o
>>>  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o -obj-y +=
>>> sysctl.o
>>> +obj-$(CONFIG_SYSCTL) += sysctl.o
>>>  endif
>>
>> I think I had indicated before that this shouldn't stay inside the conditional, but
>> move back up. Whether that is to happen here or while addressing my respective
>> comment on patch 01 I can't easily tell.
> 
> We want that "PV_SHIM_EXCLUSIVE likely wants / needs sorting as
> a prereq anyway", does the prereq here mean that prereq in kconfig,
> something like
> ```
> config SYSCTL
>       depends on xxx
> ```

I'm sorry, but I fear I can't interpret what you're saying (possibly asking).

>>> --- a/xen/common/sysctl.c
>>> +++ b/xen/common/sysctl.c
>>> @@ -490,8 +490,10 @@ long
>> do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>>          break;
>>>
>>>      default:
>>> +#ifdef CONFIG_SYSCTL
>>>          ret = arch_do_sysctl(op, u_sysctl);
>>>          copyback = 0;
>>> +#endif
>>>          break;
>>>      }
>>
>> This isn't enough. "ret" is 0 when reaching the default: label, but may not stay 0 for
>> the return from the function. I understand (expect) this is going to be dropped
>> again in the next patch, but even if only transiently needed this should be kept
>> correct imo. Things might be different if patch 02 introduced the option without a
>> prompt, i.e. always enabled. Then all the #ifdef-ary added up to here would be
>> merely syntactic sugar. In fact in that case you could omit all the transient #ifdef
>> that the last patch is going to remove again. Please consider going that route.
>>
>> Otherwise I think the #endif also needs moving up, for copyback to still be cleared
>> here.
>>
> 
> I'll change it to as follows to complement case for CONFIG_SYSCTL==n, plz correct me if I understand wrongly here:
> ```
>       default:
> +#ifdef CONFIG_SYSCTL
>          ret = arch_do_sysctl(op, u_sysctl);
> +#else
> +        ret = -EOPNOTSUPP;
> +#endif
>          copyback = 0;
>          break;
> ```

This is an option, yes, yet I'd like my other outline to be taken into consideration,
too (for imo resulting in less churn overall).

Jan


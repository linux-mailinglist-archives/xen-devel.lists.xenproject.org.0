Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5FA963CE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 11:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962329.1353534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79iR-00057m-Lf; Tue, 22 Apr 2025 09:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962329.1353534; Tue, 22 Apr 2025 09:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79iR-00056K-Id; Tue, 22 Apr 2025 09:14:55 +0000
Received: by outflank-mailman (input) for mailman id 962329;
 Tue, 22 Apr 2025 09:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u79iQ-00056E-Et
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 09:14:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 401ebf99-1f5a-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 11:14:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so35293755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 02:14:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6db173sm163519635e9.32.2025.04.22.02.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 02:14:52 -0700 (PDT)
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
X-Inumbo-ID: 401ebf99-1f5a-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745313293; x=1745918093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iT5sY5OL5ZIc0o2BGYHqECERloywEviExkO+9RPjjz8=;
        b=NmkEPhhrGxZksA3OiWFYncJWFmDNkj2M1RzbCXpXoTBgpAeHwfPHX5AWoUgHSRNkmY
         35ch938tQYMBh92M7AdrTQS7tjExjh/uEGvhtUb9G1I/fD0PjPOxb+wjhGiG+NyjbKUo
         X27DYLbitnmcG5PQGvECgCDZVxRMRddgkqAwuQuSKdowtoqi8gqc2XG3E3aBzvT9EUYb
         mw9HLQ3q8gs0BwAyLQBApO11fQXT/b8EFIVWgEvEoJlivEvcHeUDE9XDhrt2uF6mKT3o
         2ixHdV0LhDITeUUE0hqi74ZQW9k1UTzwUTLh/J8qsfLWXrOzGDc5liCnjd0L23Y005tt
         AGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745313293; x=1745918093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT5sY5OL5ZIc0o2BGYHqECERloywEviExkO+9RPjjz8=;
        b=lMFjDkbHVRj3fLrj6UpcDW2jw903tXK12JdkK/1UZiCID7m0ggNjItgXuetSo6TNnJ
         ey+WMoDWI4mgGokpwKHdCFCX+VtB38rvlqsFVR6Y2csGrtNOrWecy52DDjXobK09U187
         jMXc2Xsp5rmGnetbdwh4GRndQH09HH1wB8pOUCfJpY+qKBLqjVdKG+Exc0TGYf2EJ1J/
         pvpkel4r/v6PgoROI2GVxcyBqDaZ5mwkG24jogpDqyzsAjuMeGPwLV/yD2P5PvSI7luL
         Kt6KGttOcClM93VYtNrwO42NHzpStOlXFOwyeSzYDhKjRK35kRAE/o2y8FF+sWk/81zU
         6F4g==
X-Forwarded-Encrypted: i=1; AJvYcCWKuAQkDsb+/mjzNyRbCZb+HbaX1nxhfEWTjB6VxQzpHow5DYlmBdJbIGqhQ3UharzGUJTWIyyLFdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypOFtwbbIg3znP4Mf4TfHXabanO4Px9MrXiomqO8GO1QUaU63B
	mRW866mx1jbiw+2tZR88z0kOzm5Ei4l+6FQ0ppUjrm1uYqNjy7hrt2Zxzvn6dA==
X-Gm-Gg: ASbGnctwrtexapRtMV/aaPNdYdIaEMBLo90PXKqWLu7QkvEcojRjj29kAHOHoAdLg9t
	Ymgoy7O/auegDDkNSjGXXV7IGDW/2LpzT+r8SF7oXg2OWvr2HqpkHKgmU43t2w3TohlNoNUm55f
	rgPCn9/0h+VIGZHDIvY3xSe6UGDoEnWDCgJ4EnfqO6hF3l6d2S0BQS4grQINZbSX+YmYP+F4Vys
	4KNRqhSOt7SPasz2E6mVGJ544WGQznfw5R+kwnlun8ys71oRuud1ah//G4/BNv+CSARn6meZPwb
	7n7naCi6lXW3C9Rtbq7GFNvpQtUBhDO2QgkrAFGyNpLERQ9s/Mt2wr3r5Mr/P5rj9KO//Clxa/D
	uj7cxXnQPvtMN6iASH6vQ10bCByzXD2jSPqXr
X-Google-Smtp-Source: AGHT+IEERSk8hvlO1qBLtn+eU+VX2W3/VH8SpH4dENG594AiEfD8Vt3s6+r851wJereRqkWCnJS5Cw==
X-Received: by 2002:a05:600c:1e18:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-4406ab7ab1emr143363155e9.3.1745313292580;
        Tue, 22 Apr 2025 02:14:52 -0700 (PDT)
Message-ID: <28142d86-0845-4bb3-a0bb-e4903f898abf@suse.com>
Date: Tue, 22 Apr 2025 11:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/14] xen/riscv: introduce ioremap()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <6d91eeabe2735de93bfcf2a2420e2059a8f35e52.1744126720.git.oleksii.kurochko@gmail.com>
 <84089b6d-efeb-4613-85b9-eb10d11d7338@suse.com>
 <f315bc11-c537-4dca-9e62-a6d3f02733e4@gmail.com>
 <6b226b72-11a4-4004-b42d-0e280de83539@suse.com>
 <bbfdc4a0-54f0-4a9d-aa6d-2cf85ec03411@gmail.com>
 <a71db245-5b0b-435e-8e58-cb43c5162862@suse.com>
 <7d5356a5-53b7-4d1b-82ff-bc6f81a2f445@gmail.com>
 <6f50dea4-60e6-46b0-9363-d943ba553334@suse.com>
 <676c1627-95a0-46a0-b132-3f3ac2fdda01@gmail.com>
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
In-Reply-To: <676c1627-95a0-46a0-b132-3f3ac2fdda01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 10:40, Oleksii Kurochko wrote:
> 
> On 4/17/25 4:49 PM, Jan Beulich wrote:
>> On 17.04.2025 16:37, Oleksii Kurochko wrote:
>>> On 4/17/25 4:24 PM, Jan Beulich wrote:
>>>> On 17.04.2025 16:20, Oleksii Kurochko wrote:
>>>>> On 4/15/25 1:02 PM, Jan Beulich wrote:
>>>>>> On 15.04.2025 12:29, Oleksii Kurochko wrote:
>>>>>>> On 4/10/25 5:13 PM, Jan Beulich wrote:
>>>>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>>>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
>>>>>>>>> ```
>>>>>>>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>>>>>>>> I/O devices and DMA operations are required to access memory coherently and
>>>>>>>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>>>>>>>> regions that are concurrently accessed by external devices can also use the
>>>>>>>>> standard synchronization mechanisms. Implementations that do not conform
>>>>>>>>> to the Unix Platform Specification and/or in which devices do not access
>>>>>>>>> memory coherently will need to use mechanisms
>>>>>>>>> (which are currently platform-specific or device-specific) to enforce
>>>>>>>>> coherency.
>>>>>>>>>
>>>>>>>>> I/O regions in the address space should be considered non-cacheable
>>>>>>>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>>>>>>>> by the PMA if they are not cached by any agent.
>>>>>>>>> ```
>>>>>>>>> and [1]:
>>>>>>>>> ```
>>>>>>>>> The current riscv linux implementation requires SOC system to support
>>>>>>>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>>>>>>>> cannot maintain the coherence and they need support cache clean/invalid
>>>>>>>>> operations to synchronize data.
>>>>>>>>>
>>>>>>>>> Current implementation is no problem with SiFive FU540, because FU540
>>>>>>>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>>>>>>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>>>>>>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>>>>>>>> the whole system with IO-coherency is very expensive.
>>>>>>>>> ```
>>>>>>>>>
>>>>>>>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>>>>>>>> and that ones is going to be supported by Xen have memory coherency
>>>>>>>>> between all I/O devices and CPUs, so it is currently safe to use the
>>>>>>>>> PAGE_HYPERVISOR attribute.
>>>>>>>>> However, in cases where a platform does not support memory coherency, it
>>>>>>>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>>>>>>>> ioremap will be necessary.
>>>>>>>>> For now, a compilation error will be generated to ensure that the need to
>>>>>>>>> update ioremap() is not overlooked.
>>>>>>>>>
>>>>>>>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>>>>>>>> But MMIO access correctness isn't just a matter of coherency. There may not
>>>>>>>> be any caching involved in most cases, or else you may observe significantly
>>>>>>>> delayed or even dropped (folded with later ones) writes, and reads may be
>>>>>>>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>>>>>>>
>>>>>>>>> --- a/xen/arch/riscv/Kconfig
>>>>>>>>> +++ b/xen/arch/riscv/Kconfig
>>>>>>>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>>>>>>>      	string
>>>>>>>>>      	default "arch/riscv/configs/tiny64_defconfig"
>>>>>>>>>      
>>>>>>>>> +config HAS_SVPBMT
>>>>>>>>> +	bool
>>>>>>>>> +	help
>>>>>>>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>>>>>>>> +	  page-based memory types).
>>>>>>>>> +
>>>>>>>>> +	  The memory type for a page contains a combination of attributes
>>>>>>>>> +	  that indicate the cacheability, idempotency, and ordering
>>>>>>>>> +	  properties for access to that page.
>>>>>>>>> +
>>>>>>>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>>>>>>>> ... I kind of expect this extension (or anything else that there might be) will need
>>>>>>>> making use of.
>>>>>>> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
>>>>>>> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
>>>>>>> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
>>>>>>> cores, or it can be fixed at design time, as in SiFive cores.
>>>>>> How would things work if there was a need to map a RAM page uncacheable (via
>>>>>> ioremap() or otherwise)?
>>>>> My understanding is that Svpbmt is only needed when someone wants to change the memory
>>>>> attribute of a page set by PMA.
>>>>>
>>>>> The question is if non-cacheable RAM page is really needed if we have a coherency?
>>>> Aiui coherency here is among CPUs.
>>> ```
>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>> I/O devices and DMA operations are required to access memory coherently and
>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>> regions that are concurrently accessed by external devices can also use the
>>> standard synchronization mechanisms. Implementations that do not conform
>>> to the Unix Platform Specification and/or in which devices do not access
>>> memory coherently will need to use mechanisms
>>> (which are currently platform-specific or device-specific) to enforce
>>> coherency.
>>> ```
>>> Based on this from the spec, coherency here is not only among CPUs.
>>>
>>>
>>>> Properties of devices in the system are
>>>> largely unknown?
>>> Yes, but still not sure what kind of property requires ioremap() which won't work
>>> without Svpmbt. Could you please tell me an example?
>> Well, above you said they all need to access memory coherently. That's the
>> "property" I was referring to.
> 
> Do you mean that device could have a property which tell that it would like to have non-cachable
> region used for that? I haven't seen such property in device tree files.
> 
> Do we have in Xen cases when Xen wants to have map part of RAM as non-cachebale and it is only the
> one option?

On x86 we have the case that IOMMUs may access memory non-coherently. This is
particular means that IOMMU page table updates (which necessarily live in RAM)
need to be done quite carefully. As it's all our code, we deal with the
situation by issuing cache flushes, avoiding the need for UC mappings.

Graphics engines may have similar constraints, aiui. With the driver code not
being part of Xen, we wouldn't be able to use a similar "simplification" there.
UC mappings would be pretty much unavoidable.

> I am also thinking why it can't be used cachable region + barrier (if we don't have memory coherency
> for everything).

Not sure what exactly you're asking here (if anything). An answer would very
likely depend on the specific kind of barrier you're thinking about. The
question would be what, if any, effect a barrier would have on the cache(s).

> Anyway, if it isn't an option to have mapped cacheble region + barrier then there is no any choice
> and the support of Svpmbt is required.

Quite possible.

Jan


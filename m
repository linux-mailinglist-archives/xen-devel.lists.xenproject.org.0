Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE2A92032
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957955.1350943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QYm-0003m6-Us; Thu, 17 Apr 2025 14:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957955.1350943; Thu, 17 Apr 2025 14:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QYm-0003k2-S6; Thu, 17 Apr 2025 14:49:48 +0000
Received: by outflank-mailman (input) for mailman id 957955;
 Thu, 17 Apr 2025 14:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5QYl-0003jw-Fk
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:49:47 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33b749c9-1b9b-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:49:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so651481f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:49:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bdaaf2sm691515ad.13.2025.04.17.07.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:49:44 -0700 (PDT)
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
X-Inumbo-ID: 33b749c9-1b9b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744901384; x=1745506184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ur8+9OlVI+wp20dKdWKhaFm4HZ+aA2TuIWonAM00Ukg=;
        b=QhZvvr+tkjdTj0FhRCwM/mAclPVoZUzggTOo2o6JW2/mNxDLw3nwQ5W4XgYrRZww74
         efZgXVXPLxG3io/34Yax8V0y4tsEzARvZtL5CUwfKJLIsxqfgdKGAHPhRAQq0OYeyshn
         5b0VdQcJ+O/ScV0ajNw01TFVSKjG4NJ+yQ8kQfZHVigIv56XYlwDQ5/+fjUofTZ+lTTp
         bYlNHsnmHjfZ2Frx0/6/9hzsSsjxvJATmXidU1dyerYxOOYPZxjAOpcivJzD1GoDgiCQ
         6lxsx4pgGTxK2EAZNvJHaEzGVNfeRr1nhL+6WRx1HDjbgats0VeWFwe0tmGYNMyjRHeT
         8CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901384; x=1745506184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ur8+9OlVI+wp20dKdWKhaFm4HZ+aA2TuIWonAM00Ukg=;
        b=d2BHz+vxLyi8xzO6rdWiAeNvnKhscH4fZYWACQDRL1uIwoVzQhEK3w+isU+8x8ZoHW
         73eqm+iE86pZ8lkT7HAYuhghdoYSZBNAVIfqYSipTCIMTmYCnxILZ6JmOEvcfy+rnv+e
         rTSq8H264RwHViRW52q4IVqWxYak6Aey4UxVMelnCqTS7P8PFofl2h0cnnkTE7wwF6zd
         ogy+VWltber58oh3Qp7QJKRFJDiVkW2qnw26SqcrqQaD/60Eazs7oODXtvbzA6Gq1lXu
         MNbCQCM4DLoWLuZcI/mSZ47tuvblUA4y9fWYXKUaK4t0bNIdwD40W2+6iyE+FLdOT//U
         6itw==
X-Forwarded-Encrypted: i=1; AJvYcCWz6tFVJsdJ7/X1E9l9S38TLEEJEMAyVj6q9weGLHI5tXrLG7NIznIWKFey1eTtreYtn9yBHtmGMQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0qH2ENk1MlFXIgzOO76h/es1cf0L94jlJz4ZLNHZchuITiueB
	NNqYqOr1dYs3X8cqOvsCwUWVnWehxUupS5Xi+3Dt9x754YEPZYd795/jtq0flw==
X-Gm-Gg: ASbGncsXOX8VP4GkrEhK6lBsUGR2106XMGygT7vb9Xf8qIAakk2F6jVQ2eVn4nlhTKj
	KaONbO8vIxLkuMGH0D9QwivMI+JGd3M4q8VcqUQSf+87GzwizZxuBZxaRLA0tW8xGj7CInzzhht
	EuI4pMdSPBnIenHhGPXJwesH6XeGQWzctvU8iyHel87RFltM//xRwiXr3guHaJa7xz+IQbORSbZ
	ztflFFG6h66lUQHKgwAkiOMS2KRBU7rxyZZDf7Ec2Hev5PwHV9G/Os+CK5HgZ3ae3XCnlt6poYU
	3C+t9XDijjHghgCO1EBH9HLXTRNo3HrBrGbE0aDR7V1sDZg8yQ1VZm0dv3hgpg0sLF/n3/jj/ss
	LVDOA7IoEegzXDTxAEDr4Xgp33KdfIZ+kA3k/
X-Google-Smtp-Source: AGHT+IFc2ZbPJELB0pin/7qbXRDcrnnuDyaxYc+MGohMD3WpDFda05thNlBXy7hk1F8R4zgCJAkUzg==
X-Received: by 2002:a5d:64e2:0:b0:39d:724f:a8a0 with SMTP id ffacd0b85a97d-39ee5ba03e4mr5309111f8f.58.1744901384542;
        Thu, 17 Apr 2025 07:49:44 -0700 (PDT)
Message-ID: <6f50dea4-60e6-46b0-9363-d943ba553334@suse.com>
Date: Thu, 17 Apr 2025 16:49:34 +0200
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
In-Reply-To: <7d5356a5-53b7-4d1b-82ff-bc6f81a2f445@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 16:37, Oleksii Kurochko wrote:
> 
> On 4/17/25 4:24 PM, Jan Beulich wrote:
>> On 17.04.2025 16:20, Oleksii Kurochko wrote:
>>> On 4/15/25 1:02 PM, Jan Beulich wrote:
>>>> On 15.04.2025 12:29, Oleksii Kurochko wrote:
>>>>> On 4/10/25 5:13 PM, Jan Beulich wrote:
>>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
>>>>>>> ```
>>>>>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>>>>>> I/O devices and DMA operations are required to access memory coherently and
>>>>>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>>>>>> regions that are concurrently accessed by external devices can also use the
>>>>>>> standard synchronization mechanisms. Implementations that do not conform
>>>>>>> to the Unix Platform Specification and/or in which devices do not access
>>>>>>> memory coherently will need to use mechanisms
>>>>>>> (which are currently platform-specific or device-specific) to enforce
>>>>>>> coherency.
>>>>>>>
>>>>>>> I/O regions in the address space should be considered non-cacheable
>>>>>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>>>>>> by the PMA if they are not cached by any agent.
>>>>>>> ```
>>>>>>> and [1]:
>>>>>>> ```
>>>>>>> The current riscv linux implementation requires SOC system to support
>>>>>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>>>>>> cannot maintain the coherence and they need support cache clean/invalid
>>>>>>> operations to synchronize data.
>>>>>>>
>>>>>>> Current implementation is no problem with SiFive FU540, because FU540
>>>>>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>>>>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>>>>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>>>>>> the whole system with IO-coherency is very expensive.
>>>>>>> ```
>>>>>>>
>>>>>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>>>>>> and that ones is going to be supported by Xen have memory coherency
>>>>>>> between all I/O devices and CPUs, so it is currently safe to use the
>>>>>>> PAGE_HYPERVISOR attribute.
>>>>>>> However, in cases where a platform does not support memory coherency, it
>>>>>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>>>>>> ioremap will be necessary.
>>>>>>> For now, a compilation error will be generated to ensure that the need to
>>>>>>> update ioremap() is not overlooked.
>>>>>>>
>>>>>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>>>>>> But MMIO access correctness isn't just a matter of coherency. There may not
>>>>>> be any caching involved in most cases, or else you may observe significantly
>>>>>> delayed or even dropped (folded with later ones) writes, and reads may be
>>>>>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>>>>>
>>>>>>> --- a/xen/arch/riscv/Kconfig
>>>>>>> +++ b/xen/arch/riscv/Kconfig
>>>>>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>>>>>     	string
>>>>>>>     	default "arch/riscv/configs/tiny64_defconfig"
>>>>>>>     
>>>>>>> +config HAS_SVPBMT
>>>>>>> +	bool
>>>>>>> +	help
>>>>>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>>>>>> +	  page-based memory types).
>>>>>>> +
>>>>>>> +	  The memory type for a page contains a combination of attributes
>>>>>>> +	  that indicate the cacheability, idempotency, and ordering
>>>>>>> +	  properties for access to that page.
>>>>>>> +
>>>>>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>>>>>> ... I kind of expect this extension (or anything else that there might be) will need
>>>>>> making use of.
>>>>> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
>>>>> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
>>>>> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
>>>>> cores, or it can be fixed at design time, as in SiFive cores.
>>>> How would things work if there was a need to map a RAM page uncacheable (via
>>>> ioremap() or otherwise)?
>>> My understanding is that Svpbmt is only needed when someone wants to change the memory
>>> attribute of a page set by PMA.
>>>
>>> The question is if non-cacheable RAM page is really needed if we have a coherency?
>> Aiui coherency here is among CPUs.
> 
> ```
> For implementations that conform to the RISC-V Unix Platform Specification,
> I/O devices and DMA operations are required to access memory coherently and
> via strongly ordered I/O channels. Therefore, accesses to regular main memory
> regions that are concurrently accessed by external devices can also use the
> standard synchronization mechanisms. Implementations that do not conform
> to the Unix Platform Specification and/or in which devices do not access
> memory coherently will need to use mechanisms
> (which are currently platform-specific or device-specific) to enforce
> coherency.
> ```
> Based on this from the spec, coherency here is not only among CPUs.
> 
> 
>> Properties of devices in the system are
>> largely unknown?
> 
> Yes, but still not sure what kind of property requires ioremap() which won't work
> without Svpmbt. Could you please tell me an example?

Well, above you said they all need to access memory coherently. That's the
"property" I was referring to.

>> (Beyond this there may also be special situations in which
>> one really cares about data going directly to RAM.)
> 
> If there are such special cases, I assume that the firmware or hardware (in the case
> of fixed PMA) will provide a non-cacheable region.

How could they? Firmware may be unaware of specific properties of specific
devices a user adds to a system.

Jan

> In that case, the user should be
> aware of this region and use it for those specific scenarios.
> 
> ~ Oleksii
> 



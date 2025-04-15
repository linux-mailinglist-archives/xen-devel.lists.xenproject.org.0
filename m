Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE99A89B5B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952838.1348071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4e3u-00086z-Du; Tue, 15 Apr 2025 11:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952838.1348071; Tue, 15 Apr 2025 11:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4e3u-00085F-BI; Tue, 15 Apr 2025 11:02:42 +0000
Received: by outflank-mailman (input) for mailman id 952838;
 Tue, 15 Apr 2025 11:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4e3s-000859-Hr
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:02:40 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251be8bc-19e9-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:02:39 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso6982332f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 04:02:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c184sm14076569f8f.30.2025.04.15.04.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 04:02:38 -0700 (PDT)
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
X-Inumbo-ID: 251be8bc-19e9-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744714959; x=1745319759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TQm7wvdMIXO+oDlmAwu2bSzT5keCo/+caFKTgJug5IE=;
        b=Iz+eebu2QmwKQaV0ftAzdCtXbhSUW4TtKkb+VVuO1L3Z9AVxLRIly1Ei2fusmmVq3A
         qZ9sTLGFwTH6V8oLqFb11ivsLf5TC86rwotxIsCdannmYFyExsiRNUzr02jmKdnlnZNu
         ppZzIt2olvYKommHpcMa5PT4M79Sw8Lx3eLMNtZLcFy+kVJ7dU+EVBzeWmmqfk7cr3pF
         lht1+Ix6NV37ZLjHOLNCCnMFS+BSMWjOfzVPtj+DMh+nmm2AWpK3fFksuto3Wn4NhR2l
         +ja08r7J2PvEpRq6nvKGxErbkOPBMoDwCchIgFBZb0COJfX3snEcHySbKAEt/hJ+LdSE
         EyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714959; x=1745319759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQm7wvdMIXO+oDlmAwu2bSzT5keCo/+caFKTgJug5IE=;
        b=qedSwiiA7DYusrIpJpmyRY9DqK5jZH+juZX8Z/yzRNlFW4uoSu0TrXUMZCKwVw6Hct
         snf/Jfxr0/xSmQWH1ahj3yQdipSzO05hugd3MRkL0oZx+JP+9m/U9a4JVSjj+oP3drrY
         jsrQm25JHR91yR5IjVxmkhsNEjpkxgX807DLvPe1o/6ZfUkRdb2WIGH7Kw16mlriEcg1
         +i6CLs64jh12yseWP0L0JVe+4YFMMeLKsV/kDIUAp9DySBwXZf2mUrSFKzcxuqolC7xm
         QWLYp9AWsS3fhZPr1kak/GSw+0XPD0QjVd17xGo/TnktpSaVWYg6cHzSfzLvaIbx4a6R
         4u8w==
X-Forwarded-Encrypted: i=1; AJvYcCWc61fT7KmT4teUlXZX+mIGfhQULQh0hAZXD5B32T2Tn5YvM9owPDccytXq19ejhqp7sSosUnmdnus=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxMb00pBi6IWafR8mqRbivnRgmiTMqdIvSXSWAwAl60d0PwVyh
	sxAHje0pSjxPBt6KAsX2HouzyHYZkU0bLB3h2hwnUMi1TSQa9hHwszjhUUgiqQ==
X-Gm-Gg: ASbGncvUDzOAvhnsMBsJkHBtUhjdpLpF+2DdqOQAa8LRxol8A2MtFmrN9hTPpRlDXqq
	bJjx+PZ45QMs4Y8ngkBL2IqWk3gPSVrmV0rczfpjuI8DODfvNuJTcFSXrllduH1hms6j6Cl0zku
	DkArb/vRkvG22Jd3Z01qkRQRLqEhSGP/477lrwgpZkxsDkHOmbFYbL3RoV8YAUDHkgAn9bPelng
	+Vgt5NwsJr1WC4+8DFHjmMPraDKwh8F+i57hZzShHMt5XzpOdIMQjkcKwtzyxTdg58V6r9pagX3
	SPOFMxPt85TBppzsEa2IwymjKQcSk1v3BZZGQqP6N21h3GdqmocmjUjapGV+/c/IxdKFqzI0Ipg
	WPziN4Gpu9XpvK6iKhqj08zPlJA==
X-Google-Smtp-Source: AGHT+IHgauErYHXhwllQ2xjqFw2JSlFpo42RR1zDyxCBdhkXRBPI0QKaeSBYTjMwIR/5MieIPAh/fA==
X-Received: by 2002:a5d:5f52:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-39ea51f46dfmr11385123f8f.17.1744714958515;
        Tue, 15 Apr 2025 04:02:38 -0700 (PDT)
Message-ID: <6b226b72-11a4-4004-b42d-0e280de83539@suse.com>
Date: Tue, 15 Apr 2025 13:02:37 +0200
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
In-Reply-To: <f315bc11-c537-4dca-9e62-a6d3f02733e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 12:29, Oleksii Kurochko wrote:
> 
> On 4/10/25 5:13 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
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
>>>
>>> I/O regions in the address space should be considered non-cacheable
>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>> by the PMA if they are not cached by any agent.
>>> ```
>>> and [1]:
>>> ```
>>> The current riscv linux implementation requires SOC system to support
>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>> cannot maintain the coherence and they need support cache clean/invalid
>>> operations to synchronize data.
>>>
>>> Current implementation is no problem with SiFive FU540, because FU540
>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>> the whole system with IO-coherency is very expensive.
>>> ```
>>>
>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>> and that ones is going to be supported by Xen have memory coherency
>>> between all I/O devices and CPUs, so it is currently safe to use the
>>> PAGE_HYPERVISOR attribute.
>>> However, in cases where a platform does not support memory coherency, it
>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>> ioremap will be necessary.
>>> For now, a compilation error will be generated to ensure that the need to
>>> update ioremap() is not overlooked.
>>>
>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>> But MMIO access correctness isn't just a matter of coherency. There may not
>> be any caching involved in most cases, or else you may observe significantly
>> delayed or even dropped (folded with later ones) writes, and reads may be
>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>
>>> --- a/xen/arch/riscv/Kconfig
>>> +++ b/xen/arch/riscv/Kconfig
>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>   	string
>>>   	default "arch/riscv/configs/tiny64_defconfig"
>>>   
>>> +config HAS_SVPBMT
>>> +	bool
>>> +	help
>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>> +	  page-based memory types).
>>> +
>>> +	  The memory type for a page contains a combination of attributes
>>> +	  that indicate the cacheability, idempotency, and ordering
>>> +	  properties for access to that page.
>>> +
>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>> ... I kind of expect this extension (or anything else that there might be) will need
>> making use of.
> 
> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
> cores, or it can be fixed at design time, as in SiFive cores.

How would things work if there was a need to map a RAM page uncacheable (via
ioremap() or otherwise)?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208AA4FA6D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902124.1310060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplGI-0003e7-PV; Wed, 05 Mar 2025 09:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902124.1310060; Wed, 05 Mar 2025 09:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tplGI-0003bZ-M1; Wed, 05 Mar 2025 09:41:58 +0000
Received: by outflank-mailman (input) for mailman id 902124;
 Wed, 05 Mar 2025 09:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tplGH-0003bT-Lu
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:41:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1327cbb5-f9a6-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:41:55 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so2801245e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:41:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4310b06sm11942875e9.36.2025.03.05.01.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:41:54 -0800 (PST)
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
X-Inumbo-ID: 1327cbb5-f9a6-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741167715; x=1741772515; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FlmGdk7dfCSsQCDag4+ixlY9iS0gH9TaTK7l5vxfuRs=;
        b=dU5UEf7J7HnHaZJuIRei6dlsl+bQo8mmwJwC8d768HgXCWVKnVs5tiyClv+RSNN9ll
         Cz4sVNcnB1ZTfUbgoLHwtD8mJV78Ld7IsixEugfrlnX8063NPMHqGAZUqjF43aSHMG3n
         KCK1Nsw3UqH/NDxsLjh5NQXeA2iWBBnrybLVYgJmQv9PBIZZfrgepdMfK9R1wUsnAhFX
         oVjI9nMX+igab/NlPVASSadSpDRlWcgkrOwE61B+7ssPmZl4tQq5uXKKehWV2UYt8TDT
         BJYpOfefJboPbcD4qIRjO0wzPXn/vEZblE4HkpK5SAgHwQqAxUNKMK2nbowV09SmndsG
         IeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741167715; x=1741772515;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlmGdk7dfCSsQCDag4+ixlY9iS0gH9TaTK7l5vxfuRs=;
        b=DRvsgaVa/U5P6ZDG8Pn74kP/Ck8hvq5jQm5hEGy4L7KrZBRKbBen5qycSXfz4PO2Jl
         zX2JVePZzB8vZYCoaWWq0Tk1UQj6XFHjqVirFwOIgzV7lo4Hbqh596ACizt7xUyC59LT
         pbhg+5X/QjIdlrvGAOSpO+Ic+pEw6Nt0NGLEa5fXu5lHQzXDx5nszC/iG84mgUTN4a+k
         CkW/SWxsbLNXzvMaiBa+wZLNXmXyaCvDe5lVfsto5eXjqp3sGI49kePvc16dH5EpyJkq
         fZUufQEnXnGabn/y0wN3ddaI9qNkOYe6QOal/nAo4AuybiTcyJ0JD0sEl6OjLE1S/Ce6
         wrYA==
X-Gm-Message-State: AOJu0YwWuR4t8O8NoZ43l4EoEa+N+N0BzSA0jYzOzeUwhgEajj4VL8Vr
	/jaMeWUV9H1fS55YLb2cz8qpIo7oAOHFjJravsX3ItlwsUsm84J18cRvlVOeGQ==
X-Gm-Gg: ASbGncs5jmcSXe905fwjF9HylUXFjQLUs4NrrLBKyyvoxf8YZZvgE7MBpdcz5aev/af
	5syuTEjKNvRr7E5PCDhszFht/I5atXs9hxcJhJRlojFp+lrm3psYDur+nzG6HBi117QbzCkdjvE
	/bZyFI6lNhJqQ0K/zEFPQ7mw32EeBXWl0xacUCxhrb/myVaf3t58Rtokkpu6x4qoOItzKd4elXQ
	M1+ivqXGGfnpXTnuTyFOwLtGxrS4Zy/shu279e7czp0a1PeAdTFNg3OxRNvPeRkPYlRb5ZXoHnh
	uP21uk+yT1xfTCDg4HIcj5IrIabt58Bu378mnb6yN6CqtgvwhDIAdpWbMycduSvWsnq2pT5ujCa
	VOPwaHyv4ljmjkoXjGSU1HxrC1QZymw==
X-Google-Smtp-Source: AGHT+IFG0E4Oqbbm4sT2y8VUVL8I9U4baUQdFPg5AKn/yYRqesJ7Kc6L9G2WE0qCz6nMBaMaY874hg==
X-Received: by 2002:a05:600c:1c07:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43bd29d0474mr15587535e9.25.1741167714707;
        Wed, 05 Mar 2025 01:41:54 -0800 (PST)
Message-ID: <55d4a5ff-e638-4162-96a0-f936c163a1aa@suse.com>
Date: Wed, 5 Mar 2025 10:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msr: expose MSR_FAM10H_MMIO_CONF_BASE on AMD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250303091908.38846-1-roger.pau@citrix.com>
 <915229bd-a930-422e-a915-6414c3224c93@citrix.com>
 <Z8W47V836vSWuAzw@macbook.local>
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
In-Reply-To: <Z8W47V836vSWuAzw@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.03.2025 15:13, Roger Pau Monné wrote:
> On Mon, Mar 03, 2025 at 01:41:15PM +0000, Andrew Cooper wrote:
>> On 03/03/2025 9:19 am, Roger Pau Monne wrote:
>>> The MMIO_CONF_BASE reports the base of the MCFG range on AMD systems.
>>> Currently Linux is unconditionally attempting to read the MSR without a
>>> safe MSR accessor, and since Xen doesn't allow access to it Linux reports
>>> the following error:
>>>
>>> unchecked MSR access error: RDMSR from 0xc0010058 at rIP: 0xffffffff8101d19f (xen_do_read_msr+0x7f/0xa0)
>>> Call Trace:
>>>  <TASK>
>>>  ? ex_handler_msr+0x11e/0x150
>>>  ? fixup_exception+0x81/0x300
>>>  ? exc_general_protection+0x138/0x410
>>>  ? asm_exc_general_protection+0x22/0x30
>>>  ? xen_do_read_msr+0x7f/0xa0
>>>  xen_read_msr+0x1e/0x30
>>>  amd_get_mmconfig_range+0x2b/0x80
>>>  quirk_amd_mmconfig_area+0x28/0x100
>>>  ? quirk_system_pci_resources+0x2b/0x150
>>>  pnp_fixup_device+0x39/0x50
>>>  __pnp_add_device+0xf/0x150
>>>  pnp_add_device+0x3d/0x100
>>>  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
>>>  ? __pfx_pnpacpi_allocated_resource+0x10/0x10
>>>  ? acpi_walk_resources+0xbb/0xd0
>>>  pnpacpi_add_device_handler+0x1f9/0x280
>>>  acpi_ns_get_device_callback+0x104/0x1c0
>>>  ? _raw_spin_unlock_irqrestore+0x18/0x20
>>>  ? down_timeout+0x3a/0x60
>>>  ? _raw_spin_lock_irqsave+0x14/0x40
>>>  acpi_ns_walk_namespace+0x1d0/0x260
>>>  ? _raw_spin_unlock_irqrestore+0x18/0x20
>>>  ? __pfx_acpi_ns_get_device_callback+0x10/0x10
>>>  acpi_get_devices+0x8a/0xb0
>>>  ? __pfx_pnpacpi_add_device_handler+0x10/0x10
>>>  ? __pfx_pnpacpi_init+0x10/0x10
>>>  pnpacpi_init+0x50/0x80
>>>  do_one_initcall+0x46/0x2e0
>>>  kernel_init_freeable+0x1da/0x2f0
>>>  ? __pfx_kernel_init+0x10/0x10
>>>  kernel_init+0x16/0x1b0
>>>  ret_from_fork+0x30/0x50
>>>  ? __pfx_kernel_init+0x10/0x10
>>>  ret_from_fork_asm+0x1b/0x30
>>>  </TASK>
>>>
>>> Such access is conditional to the presence of a device with PnP ID
>>> "PNP0c01", which triggers the execution of the quirk_amd_mmconfig_area()
>>> function.  Note that prior to commit 3fac3734c43a MSR accesses when running
>>> as a PV guest would always use the safe variant, and thus silently handle
>>> the #GP.
>>>
>>> Fix by allowing access to the MSR on AMD systems, returning 0 for
>>> unprivileged domains (MMIO configuration space disabled), and the native
>>> value for the hardware domain.
>>>
>>> The non hardware domain logic will need to be adjusted if in the future we
>>> expose an MCFG region to such domains.
>>>
>>> Write attempts to the MSR will still result in #GP for all domain types.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Changes since v2:
>>>  - Expand commit message to note which device triggers the MSR read.
>>> ---
>>>  xen/arch/x86/msr.c | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
>>> index 1550fd9ec9f3..c1e616a3a757 100644
>>> --- a/xen/arch/x86/msr.c
>>> +++ b/xen/arch/x86/msr.c
>>> @@ -318,6 +318,21 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>>          *val = 0;
>>>          break;
>>>  
>>> +    case MSR_FAM10H_MMIO_CONF_BASE:
>>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>> +            goto gp_fault;
>>> +
>>> +        /*
>>> +         * Report MMIO configuration space is disabled unconditionally for
>>> +         * domUs, as the emulated chipset doesn't support ECAM.  For dom0
>>> +         * return the hardware value.
>>> +         */
>>> +        *val = 0;
>>> +        if ( is_hardware_domain(d) && rdmsr_safe(msr, *val) )
>>> +            goto gp_fault;
>>> +
>>> +        break;
>>
>> It doesn't matter right now, but reporting MMCFG disable is likely to
>> interfere with Q35 support when we do present such a range.
> 
> Yup, that's why I mention that this will likely need  to be adjusted.
> However Linux only reads MMIO_CONF_BASE if a PnP device with ID
> "PNP0c01" is present, not sure whether that's (or will be the case)
> with Q35 support.

Q35 is probably going to be yet more odd when used with AMD CPUs than
the Intel chipset we currently present to guests. But yes, I don't
expect we'd expose AMD-like firmware aspects when presenting an Intel
chipset.

Jan


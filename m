Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F019693AFDB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 12:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764105.1174438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWZGP-0008Ej-Rg; Wed, 24 Jul 2024 10:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764105.1174438; Wed, 24 Jul 2024 10:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWZGP-0008CT-Oj; Wed, 24 Jul 2024 10:30:29 +0000
Received: by outflank-mailman (input) for mailman id 764105;
 Wed, 24 Jul 2024 10:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rh+e=OY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWZGP-0008CN-36
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 10:30:29 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be752453-49a7-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 12:30:28 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so6301321e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 03:30:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a83aedeaesm218371766b.2.2024.07.24.03.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 03:30:26 -0700 (PDT)
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
X-Inumbo-ID: be752453-49a7-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721817027; x=1722421827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CYWwUlUjagtnsd3G+yBkXbF/m7pgcIn0TBF45bTG0fM=;
        b=HxRUYKklEm2wlrZlG5TL+tIQIdkas+g87s3kWO/unzEKy2CO1bJdi50bPVzwZVKyDX
         TkFpWeNANqiAniLF/SLLVpvKYTXfz2RjST7YEG2B1Ljlv9lKPpWd0zDnSoFu9OB+d5m7
         Pi81AflXQ8f59ULqdXRIyWjzwuhlmSL0UwC98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721817027; x=1722421827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYWwUlUjagtnsd3G+yBkXbF/m7pgcIn0TBF45bTG0fM=;
        b=V/E7jbcS1Pa2zm3N7cST5hdnxwYbN2oHJXPNEYbLKAHjLZsE5r6RvyUJV1uJ88D4fk
         ccQ9fsvfMV0jlXDODKgeLQygxB4LKAmg063WfbroET73ntKJ6wziCKj5oscIqM7fH1RY
         MCmXbS2w1txcokkKgQturHHIDVsIt+MwOUDWAREUuE1+MMkSYnGxAmoeo65q9RMLDlSx
         gj+Lt7Vb6jovfXrpb3HlakzNhiBTlnRy6sQZPTBlbYEQ852Idpg6QQf2ien5RxcOevLi
         upYbuIjGre1hI+hixJ9eGzm/HHN7sOj1IzMrD6dUhcXwZyPjGBztNjcpuSVnyHiCIrn6
         O+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXLmOfO2LO9R9Dm+HYYlZ5+x67sOaGJRS9/J/ytFPV+NGXUH6SRbrEheI+8tEcmSs7HvJF5odmZEYoNevYZR/6SxDmZGfYgOI7UWa+MCfI=
X-Gm-Message-State: AOJu0YzhNNEr7e3Zt/5WCLpCcjzrIfA8PlKvPJ3cO3jnqmBYFQ0Uow2J
	1i2aAitcFWKOjV+Gq87JsUsHeyd2ztum2qGbXr1F6S33CS7VmnlR5Rkk1pWU+cw=
X-Google-Smtp-Source: AGHT+IEGPKkALE5OefDWjqUTjQZFoh2BoSGW/4DDSZ4DKrVt9yVaWjQ3Mt9ax0lzx5vvVZss8pWwaQ==
X-Received: by 2002:a05:6512:a86:b0:52e:933f:f1fa with SMTP id 2adb3069b0e04-52fcdab33b9mr1805280e87.61.1721817026831;
        Wed, 24 Jul 2024 03:30:26 -0700 (PDT)
Message-ID: <7125fef0-fe2c-4c6d-bfc8-fdb4dc126905@citrix.com>
Date: Wed, 24 Jul 2024 11:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/printk: Avoid the use of L as a length modifier
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240723174129.67911-1-andrew.cooper3@citrix.com>
 <f88005d5-8c1f-4060-b3b4-7f88d8c42725@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f88005d5-8c1f-4060-b3b4-7f88d8c42725@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/07/2024 8:34 am, Jan Beulich wrote:
> On 23.07.2024 19:41, Andrew Cooper wrote:
>> Coverity complains about it being invalid.  It turns out that it is a GCC-ism
>> to treat ll and L equivalently.  C99 only permits L to mean long double.
>>
>> Convert all uses of L in to alternatives, either l, ll or PRI.64 depending on
>> the operand type.  This in turn removes some unnecessary casts which look to
>> predate us having correct PRI* constants.
> I'm certainly okay with switching to PRI.64 where appropriate. Switching to ll,
> however, means longer string literals for no really good reason. We use all
> sorts of GCC / GNU extensions; I don't see why we shouldn't be permitted to
> also use this one. It's Coverity that wants to cope, imo.

I'm about as unfussed with ll as I am over size_t.  The differences
presented here are not interesting.

> Or, if we really meant to no longer use L, support for it should then imo also
> be purged from vsnprintf().
>
>> I'm disappointed at having to use %ll for __fix_to_virt() in apic.c and
>> io_apic.c.  The expression ends up ULL because of the GB(64) in VMAP_VIRT_END,
>> but can't really be changed without breaking 32bit builds of Xen.
>>
>> One option might be to turn __fix_to_virt() into a proper function, but
>> there's a lot of that infrastructure which should be dedup'd and not left to
>> each arch to copy.
> Maybe it doesn't need us going that far, as ...
>
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -938,7 +938,7 @@ void __init init_apic_mappings(void)
>>          apic_phys = mp_lapic_addr;
>>  
>>      set_fixmap_nocache(FIX_APIC_BASE, apic_phys);
>> -    apic_printk(APIC_VERBOSE, "mapped APIC to %08Lx (%08lx)\n", APIC_BASE,
>> +    apic_printk(APIC_VERBOSE, "mapped APIC to %08llx (%08lx)\n", APIC_BASE,
>>                  apic_phys);
> ... I wonder why we use __fix_to_virt() for APIC_BASE in the first place.
> Using fix_to_virt() would look to be more logical, as all users cast to
> a pointer anyway. Then it could simply be %p here.

That could work.  Lets see how it ends up looking.


>
>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -441,7 +441,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>>              unsigned long long val = ecx;
>>  
>>              val *= ebx;
>> -            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
>> +            printk("CPU%u: TSC: %u Hz * %u / %u = %llu Hz\n",
>>                     smp_processor_id(), ecx, ebx, eax, val / eax);
>>          }
> Maybe change val to be uint64_t instead? That's against what ./CODING_STYLE
> calls for, but would be for a reason (to be able to use PRIu64) here.

Can do.

>
>> --- a/xen/arch/x86/cpu/mcheck/vmce.c
>> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
>> @@ -71,7 +71,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
>>      if ( ctxt->caps & ~guest_mcg_cap & ~MCG_CAP_COUNT & ~MCG_CTL_P )
>>      {
>>          printk(XENLOG_G_ERR
>> -               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#Lx)\n",
>> +               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#llx)\n",
>>                  is_hvm_vcpu(v) ? "HVM" : "PV", ctxt->caps,
>>                  v, guest_mcg_cap & ~MCG_CAP_COUNT);
> guest_mcg_cap is unsigned long and MCG_CAP_COUNT could as well use UL instead
> of ULL, couldn't it?

Well, like ...

>
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -517,7 +517,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>          if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) >
>>               PAGE_SIZE )
>>          {
>> -            printk("VMX: CPU%d VMCS size is too big (%Lu bytes)\n",
>> +            printk("VMX: CPU%d VMCS size is too big (%llu bytes)\n",
>>                     smp_processor_id(),
>>                     vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
>>              return -EINVAL;
>> @@ -564,7 +564,7 @@ static int vmx_init_vmcs_config(bool bsp)
>>          if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
>>               ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
>>          {
>> -            printk("VMX: CPU%d unexpected VMCS size %Lu\n",
>> +            printk("VMX: CPU%d unexpected VMCS size %llu\n",
>>                     smp_processor_id(),
>>                     vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
>>              mismatch = 1;
> Same here for VMX_BASIC_VMCS_SIZE_MASK. We leverage not doing 32-bit builds
> anymore in exactly this way elsewhere.

... this, it is about 32bit builds.

For better or worse, the msr-index cleanup says to use ULL, and this was
so it could be shared into 32bit codebases.  (In this case, I was
thinking HVMLoader and misc bits of userspace.)

~Andrew


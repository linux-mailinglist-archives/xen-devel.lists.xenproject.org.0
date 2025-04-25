Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99090A9D154
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 21:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968467.1358041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8OXX-0007VG-9M; Fri, 25 Apr 2025 19:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968467.1358041; Fri, 25 Apr 2025 19:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8OXX-0007S8-55; Fri, 25 Apr 2025 19:16:47 +0000
Received: by outflank-mailman (input) for mailman id 968467;
 Fri, 25 Apr 2025 19:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c45=XL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u8OXW-0007S1-1F
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 19:16:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1bae5f4-2209-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 21:16:42 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so17618015e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 12:16:41 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e00d8sm64872665e9.35.2025.04.25.12.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 12:16:40 -0700 (PDT)
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
X-Inumbo-ID: d1bae5f4-2209-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745608601; x=1746213401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7yCl7Nxk5kW0l0lZ1snvne7fNXsybkzRk/jJxxXvIrE=;
        b=CC9uIEWnN9QF9B4Hq8GAHOBl4vR6MS7Elh4Tlf7OT5kIAnPrMeBjKPLrmRWZq8cbne
         EZf/lneim0xYoXE1u+VvZ2LkykPJlmMNPaR0VOn6ViuLfIMvzHnKEwbBrKaMhU3g8ukp
         oiFZGw5OeYRhQu85o78Ot4E5oQoS6ulDGrnsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608601; x=1746213401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yCl7Nxk5kW0l0lZ1snvne7fNXsybkzRk/jJxxXvIrE=;
        b=bj/KYEFXPsNM1clYwBy6/jkgiZCLR/xL1ZQUFFp4ga3BdmBNgJJ0swUN6g76bPu7DL
         aeUvcvVn+UEqpnfnpOA19fqkktMoTcQ+ugG0OS0QhXdqJP2WX+6lvtff8IInwMaclmsS
         r2+crgBosN9kzDAjtmwMX1MC/Z+tjQF3Sc/SA007AoJMW6zSClWBWw5WU6OMr5DI4Yeq
         k3FnsAiLCeN9CZ3EqYak7orzpF5STbdddeI3H2GNcbISfOPTKUi5ZLxAlTVm7JUG7zKH
         b06wV4eGDk87JGRq5dgICRhuqa2nd4azPBSd5M6h1mJO1cQfU98z5Ho++Z1ddlGdjk4V
         PWtw==
X-Forwarded-Encrypted: i=1; AJvYcCXXYOyRCiwKaC0fjsOEplebdxikQ1B2Sbd0K2Uubd1Q6h4MPHUEfOt8vcT1vUzXPyOdHyFfEzIi5H0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWaG7/o3FR4quW9KUyVPTcKxO/H0z2v1OY0t1JtJgjvc7BF/Oi
	4PIuJZWdZ1/U0yFWiNq64E/If75diwwQIVuiDqxuoJAFMStkZS3fLpSt/YC+GBc=
X-Gm-Gg: ASbGnct0tCzhlasXElgWqAnJOqm3aHaXPiuJ15XQi/JEQrAuvdMVpfOCWafQjlodGWR
	E6fA5AN+53/3Hs8k1oX2VZDWyytsvtI/idI7Z6pRNaBq3ieL1FirHyvq/RfuOmKrAcLeyzJ2J6C
	gWx1jYFGPzexJpfFoFysSg1y/4xMf7v/vTO20OB5wHnTJYp6HVTu+z0orwJl9irbUcGE5j3PCCz
	+CEnfVxj7gi5HeRu2UK1rLUQQEZcVpAIucQUBdY/+pX4aEkSjH8ZQi2eEgqUQLxa6sAYfAGKGxz
	YYt5AOgaBgz+UCbR2Lzj6S4WvqI9tJXCkxCGEJqBYFip1+pCNGOO+ZG+rP0p3QbiYQxNJXD/oHq
	xslt0zA==
X-Google-Smtp-Source: AGHT+IFl6xErE+Gz3Xytl5p8x5Qg/FbWKPXrmjM8yIfOfkwkEO6+4dEqj11qq5byorp3RVwQ7VWGfA==
X-Received: by 2002:a05:600c:5108:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-440a66a1015mr27159335e9.14.1745608601229;
        Fri, 25 Apr 2025 12:16:41 -0700 (PDT)
Message-ID: <9d6af88c-1ee0-44a4-9907-ce56973f50ab@citrix.com>
Date: Fri, 25 Apr 2025 20:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hyperv: use dynamically allocated page for hypercalls
To: Ariadne Conill <ariadne@ariadne.space>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "Alexander M . Merritt" <alexander@edera.dev>
References: <20250425165148.60408-1-ariadne@ariadne.space>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250425165148.60408-1-ariadne@ariadne.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 5:51 pm, Ariadne Conill wrote:
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> index 6989af38f1..637b4bf335 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -98,10 +97,22 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn = HV_HCALL_MFN;
> +        hv_hcall_page = alloc_xenheap_page();
> +        if ( !hv_hcall_page )
> +        {
> +            printk("Hyper-V: Failed to allocate hypercall trampoline page\n");
> +            return -ENOMEM;
> +        }
> +
> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hv_hcall_page);
> +
> +        mfn = virt_to_mfn(hv_hcall_page);

Up to here is ok; this is just choosing a different page, but...

>          hypercall_msr.enable = 1;
>          hypercall_msr.guest_physical_address = mfn;
>          wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +
> +        start = (unsigned long) hv_hcall_page;
> +        modify_xen_mappings(start, start + PAGE_SIZE, PAGE_HYPERVISOR_RX);

... this and ...

>      }
>      else
>          mfn = hypercall_msr.guest_physical_address;
> @@ -109,9 +120,9 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      BUG_ON(!hypercall_msr.enable);
>  
> -    set_fixmap_x(FIX_X_HYPERV_HCALL, mfn << PAGE_SHIFT);

... this break the case where the overlay is already chosen and cannot move.

It really needs to stay using set_fixmap_x(), which in turn means you
can ...

> diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
> index b76dbf9ccc..b73edca7c6 100644
> --- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
> @@ -20,13 +20,13 @@ static inline uint64_t hv_do_hypercall(uint64_t control, paddr_t input_addr,
>                                         paddr_t output_addr)
>  {
>      uint64_t status;
> -    register unsigned long r8 asm ( "r8" ) = output_addr;
>  
>      /* See TLFS for volatile registers */
> -    asm volatile ( "call hv_hcall_page"
> +    asm volatile ( "mov %[output_addr], %%r8\n"
> +                   "call *%[target_addr]"
>                     : "=a" (status), "+c" (control),
>                       "+d" (input_addr) ASM_CALL_CONSTRAINT
> -                   : "r" (r8)
> +                   : [output_addr] "r" (output_addr), [target_addr] "r" (hv_hcall_page)
>                     : "memory" );

... undo this speculative security vulnerability you've got by not using
INDIRECT_CALL.

The point of FIXMAP_X is to provide a virtual address in the main 1G
range for .text/.data/.rodata/.bss, which can point to an arbitrary
location, and can be regularly CALL'd.

~Andrew


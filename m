Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65568A7DCFB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 14:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939797.1339777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1l9V-0005sV-4l; Mon, 07 Apr 2025 12:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939797.1339777; Mon, 07 Apr 2025 12:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1l9V-0005qJ-0Y; Mon, 07 Apr 2025 12:00:33 +0000
Received: by outflank-mailman (input) for mailman id 939797;
 Mon, 07 Apr 2025 12:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1l9U-0005jy-Fx
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 12:00:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e70bd0d1-13a7-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 14:00:30 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso21790575e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 05:00:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3009680dsm11734751f8f.7.2025.04.07.05.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 05:00:29 -0700 (PDT)
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
X-Inumbo-ID: e70bd0d1-13a7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744027230; x=1744632030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aqfKJMvwGX4LpMTuXlSMbjl0TlfSILIguDWkPVcjdS0=;
        b=edWYBTxfv9LkH03BJvgNa/bt8dp+aRUkkfZfn+ZRVIvQwMutIJJ3au8kEoUWPn5bM4
         kvGc+PxeMQy+9MC1f/27Sh4w7icsNOaqPkhn1E200MlDLJGYIJlzjBdkcxHk4UYnG9/E
         /PlD9ZrA3Mrb6zhi8v7rbka16amuCnV9pt0DINH0ZqkvdoGTNCuBbphpoByDngbPk5tE
         QdZoNwiIXMF1B0rzhjrVhYb1X/QyRnOFDnp3du/0b+8VpitUJJ2keib5wi8SwO7Gce1b
         wROiPHo3VDZoyRH0fDhN0cIEFA7hCQmZyIogF5WnVS55mnC/x42PVhG/foE/Xa1R+DXE
         6sVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027230; x=1744632030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqfKJMvwGX4LpMTuXlSMbjl0TlfSILIguDWkPVcjdS0=;
        b=lgR6Cva9ZsnMMOZYutVvDYRbe6mZmCCZHqdwZUqzRcVw/bM20T7QXahk1eYxxTu1ZN
         yjdFlyOWaGIOuYNI0owVKqiQvU0sHGfIS5WxjWVk+SSz0PHdy4avROL04dbd4QnzpPZg
         l64j+kuTWAzQDyu8MNtUYe8LxM1lk4nD04WT1+M5GdSahPS7ZfbzhvTXN5ymo7JJk2+6
         379cD4NqPCRu3xVXmKt944FFx2pz1b4H7KT4usbJmER5sLri6rvhLPD9K7Sjhq5ShYM3
         ahmClbiRw4eZYZvEVk+8iwyKnXerAhgMvCy8EMoOczthqm62rviuWdhRuj7euQzlWRGp
         VvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnruxrMVmwwrvwvF5GiPMbJXfEAm4x72xaYagKjPE8zGY33bCTgil8BjDGNRfTXvKHDM5mZ3DUJ5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdF2Ulvf7W7ekdmt9/BsB1z4apc47s4H6EwsB0ZW/ffxmrUHlZ
	wUcGT1F8ZDaB/NRCEsmg5tw4sykiE4pfw7gptcI1REb3hcVNDnLRvf2PAKJvpw==
X-Gm-Gg: ASbGncu/GpoX7J1ikK0xz8ism7J6s1yHcNvmECRyNFw6IqJKyOm+TjvlXGDwRcH7t0K
	PkMgPWtEf2ZfMewSLlERLTspeTF7v+A3gU5C4RZZZweqFDkAasUYAar+PSourgVwR7ywTim+Ri6
	/xfJQwPRshbgE0iYmmZUeomr7NQDnpENEtCxw6UYqoWnB2uEg0v4OPos0x+OQb6LtHKltidMRs/
	6XFceweo4qFxGQrgbxPHeSJMmOGhQ71aij6KbA3f4Ah2VEkr/WaOyxpJaV6n9lnfnDwKlCZ3vfi
	aOIxf02TuSQYFP84we8khv3exbuKtgAhBpGbwHhdfw+fPOCcW892RuO8kdG760IY9xBk9gYBtKl
	P1KnDuObMQT/E4IhUyzINU1l1F9rkDA==
X-Google-Smtp-Source: AGHT+IFKZTVY4txPuJi3hXyloAtONm8YueuCP+xVrtVl1zetYUSRJ1CFrJyR1kfvzz5uJkABw3SuGg==
X-Received: by 2002:a5d:584a:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39cba932615mr10964187f8f.29.1744027229947;
        Mon, 07 Apr 2025 05:00:29 -0700 (PDT)
Message-ID: <b400a011-e173-4d6f-b0b7-bcbe59e994cd@suse.com>
Date: Mon, 7 Apr 2025 14:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmx: Drop memory clobbers on VMX instruction wrappers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250407104544.1823150-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250407104544.1823150-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 12:45, Andrew Cooper wrote:
> The use, or not, of memory clobbers on the VMX instructions is complicated.
> 
> There are two separate aspects to consider:
> 
> 1. Originally, the VMX instructions used hardcoded bytes, including memory
>    encodings.  Therefore, the compiler couldn't see the correct relationship
>    between parameters.  The memory clobber for this purpose should have been
>    dropped when switching to mnemonics.
> 
>    This covers INVEPT and INVVPID, each of which has no change in memory, nor
>    in fact the current address space in use.

Yet then they need to come after respective table modifications.

> 2. Most of these instructions operate on a VMCS region.  This is a (mostly)
>    opaque data structure, operated on by physical address.  Again, this hides
>    the relationship between the instructions and the VMCS from the compiler.
> 
>    The processor might use internal state to cache the VMCS (writing it back
>    to memory on VMCLEAR), or it might operate on memory directly.
> 
>    Because the VMCS is opaque (so the compiler has nothing interesting to know
>    about it), and because VMREAD/VMWRITE have chosen not to use a memory
>    clobber (to tell the compiler that something changed), none of the other
>    VMX instructions should use a memory clobber either.

For this, there's actually a good example below, with everything needed in
context.

>    This covers VMXON, VMXOFF, VMPTRLD and VMPTCLEAR.

Nit: The last insn is VMCLEAR.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -754,7 +754,7 @@ static int _vmx_cpu_up(bool bsp)
>                 _ASM_EXTABLE(1b, %l[vmxon_fault])
>                 :
>                 : [addr] "m" (this_cpu(vmxon_region))
> -               : "memory"
> +               :
>                 : vmxon_fail, vmxon_fault );
>  
>      this_cpu(vmxon) = 1;
> @@ -811,7 +811,7 @@ void cf_check vmx_cpu_down(void)
>  
>      BUG_ON(!(read_cr4() & X86_CR4_VMXE));
>      this_cpu(vmxon) = 0;
> -    asm volatile ( "vmxoff" ::: "memory" );
> +    asm volatile ( "vmxoff" );

With the clobber dropped, the compiler is free to re-order the prior store
with the asm(), despite the "volatile", isn't it? [1] This may then be
applicable elsewhere as well.

Jan

[1] Quote: "Note that the compiler can move even volatile asm instructions
            relative to other code, including across jump instructions."


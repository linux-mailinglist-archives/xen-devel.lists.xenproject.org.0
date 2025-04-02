Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13BA78BB3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935530.1336917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuwk-0002hu-HM; Wed, 02 Apr 2025 10:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935530.1336917; Wed, 02 Apr 2025 10:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuwk-0002em-EA; Wed, 02 Apr 2025 10:03:46 +0000
Received: by outflank-mailman (input) for mailman id 935530;
 Wed, 02 Apr 2025 10:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuwj-0002eg-NL
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:03:45 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2f2cff4-0fa9-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 12:03:44 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5329592f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 03:03:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a4482sm16133589f8f.86.2025.04.02.03.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:03:43 -0700 (PDT)
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
X-Inumbo-ID: c2f2cff4-0fa9-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743588224; x=1744193024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+oqq49Ulim8UYSMiHT1yk8DRl/YoWfLnj7lGCKE59aI=;
        b=KxsqAMWcbQ6x5lCLJ50EF5JO4cLy/gYvTmhY5Z4Raejtpurg60izjpQ2ZyuqjXCCV5
         sZCZw8Sew+E/dCxMcmm6I2G3HoGH30ekh4sE90QDiz5AaYgF4q2pFO1Eb5vW9awlQ6by
         0fHrkQBr7KLJZUFa2M1vCd1JIhz9hee3ycV3xARaZImfBuNDW3nc3ml0Ur05dkVaigaF
         BlxRXqtKlJfNxW4Mtzvsx8vQYDV09nSJ14kjVlnkomgSfg/z4GIBXpJwzsNBi2qEAE/u
         TFwhPDAkUTdgnnTBG+YjTplwoi8cNem2DAidMtk85w9cGGDgDqmLW5RAUqmBKc5bDGl3
         GdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588224; x=1744193024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oqq49Ulim8UYSMiHT1yk8DRl/YoWfLnj7lGCKE59aI=;
        b=LemeDPPkS80aFMPAyjiOK80X40Cpmz+FPsluiqjNFfCv6+cho4m5GYWmrXLGwSHdEs
         Jg4hs+uolX7zQCdBLNQyUV8BmJszvwXFMA8KOR2QxaqCMn+zRo/eQQECFG1e+QgoFBMI
         Q0LdW0hc/qbIXRsD4rpCrvOOvDlETLUPqtkmaoSSMYKFbgM6uMirwIu1nTqUNVtjJGPD
         GQ0hnIylYTPDqkAuJPefpYeB4lk+vazQbZrFbQsSNikSOUsBBB0YlzKPc5VL7vjlobKn
         Rg/f8uyuemj0gpTC042oUM+9fNiTLCxywGyOk2cD7JCYJafsRcm1KcC207L3koLQd9pO
         Ke1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2+lAQViJPADLSjQyZ6cffdnfgTltjtaHfYbtcFH0QZ4hu5VqWOTxMld8zqE4v8fMDzA++U+/4rRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDWrmV/jYv7hsNdawcKZusxz7x3yU+Nl6kAM2VLzawseJTlim8
	cZxBiTTV2YeHdZcghAZEZrAlCTRD6MnSfSXw93NvYVbVJLRrfmFJ+W3NJ/RcNA==
X-Gm-Gg: ASbGncs4y1DPrrbRwvKJIvYtTKV96tnk66xgO8YsOJPMUlJ3cQMVTEDhGiWZ7SFEhUR
	r49yWp56OqpOYBu7gSuzaoKbuP08IzJavcnZ+u0NdFLTEgL00bU3foZbYmJS1E8zxVgopwqYLBz
	gjgGX1Kg4lBbQx5lrChScrQHASgWwWuvDKTDeNlBlEIsoWDdAhz84jzfqpSFiGrY0r2JKkwLJO7
	PjsKHan9DtyWng6JzbJUawwtQ4wtUlAN4cXp0Ux5tqBDIp+cuzS7LZqtLcPDvN5nz24hXqNtIgP
	W1HMmaHg+89ZB7wZTJmjb4Ay8wucp2r5a8bSIs977kRX4ktU72CHfJGG0GJsu7KQavva0bIWmpS
	1+gufphhFjyYQzDNKjnRxCPIfYfDPYw==
X-Google-Smtp-Source: AGHT+IH2eLbjB8jfTAWhFWZAm9xWsa4Eg0Pvv8u+BwSmyk6MRuIeo++2R83yk0JJx9AwfV9YiVUkWQ==
X-Received: by 2002:a05:6000:4282:b0:391:4bcb:828f with SMTP id ffacd0b85a97d-39c120de080mr14208464f8f.14.1743588223810;
        Wed, 02 Apr 2025 03:03:43 -0700 (PDT)
Message-ID: <1d73f823-aab3-4648-a5b9-4d0eedc33fc2@suse.com>
Date: Wed, 2 Apr 2025 12:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Use asm goto() in _vmx_cpu_up()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmkhn@proton.me,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
 <20250402095621.1278093-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250402095621.1278093-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 11:56, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -749,30 +749,15 @@ static int _vmx_cpu_up(bool bsp)
>      if ( bsp && (rc = vmx_cpu_up_prepare(cpu)) != 0 )
>          return rc;
>  
> -    switch ( __vmxon(this_cpu(vmxon_region)) )
> -    {
> -    case -2: /* #UD or #GP */
> -        if ( bios_locked &&
> -             test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
> -             (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
> -              !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
> -        {
> -            printk("CPU%d: VMXON failed: perhaps because of TXT settings "
> -                   "in your BIOS configuration?\n", cpu);
> -            printk(" --> Disable TXT in your BIOS unless using a secure "
> -                   "bootloader.\n");
> -            return -EINVAL;
> -        }
> -        /* fall through */
> -    case -1: /* CF==1 or ZF==1 */
> -        printk("CPU%d: unexpected VMXON failure\n", cpu);
> -        return -EINVAL;
> -    case 0: /* success */
> -        this_cpu(vmxon) = 1;
> -        break;
> -    default:
> -        BUG();
> -    }
> +    asm goto ( "1: vmxon %[addr]\n\t"
> +               "jbe %l[vmxon_fail]\n\t"
> +               _ASM_EXTABLE(1b, %l[vmxon_fault])
> +               :
> +               : [addr] "m" (this_cpu(vmxon_region))
> +               :
> +               : vmxon_fail, vmxon_fault );

I must have overlooked this in the RFC - you're losing ...

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -559,25 +559,6 @@ static inline void __vmxoff(void)
>          : : : "memory" );
>  }
>  
> -static inline int __vmxon(u64 addr)
> -{
> -    int rc;
> -
> -    asm volatile ( 
> -        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
> -        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
> -        "2:\n"
> -        ".section .fixup,\"ax\"\n"
> -        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
> -        ".previous\n"
> -        _ASM_EXTABLE(1b, 3b)
> -        : "=q" (rc)
> -        : "0" (0), "a" (&addr)
> -        : "memory");

... the memory barrier here. I will admit I'm not sure I see why it's
there, but if the removal was deliberate, then a sentence wants saying
about this in the description. With that or with it re-added:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Now that you move the printk()s, I also wouldn't mind if you pruned them
some: Un-wrap the format strings and perhaps purge the full stop.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D4BC8EFB
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140526.1475379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pLC-0003qD-W2; Thu, 09 Oct 2025 12:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140526.1475379; Thu, 09 Oct 2025 12:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6pLC-0003nu-TK; Thu, 09 Oct 2025 12:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1140526;
 Thu, 09 Oct 2025 12:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6pLB-0003if-Aa
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:01:49 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bba59c7c-a507-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 14:01:48 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so577373f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 05:01:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d6fb41sm80752225e9.17.2025.10.09.05.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 05:01:47 -0700 (PDT)
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
X-Inumbo-ID: bba59c7c-a507-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760011307; x=1760616107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=La8FiX+CY8bsMqSR9+VGygD6K2rBY98SILCfVOTJvQE=;
        b=ZlvFgz30WMlr0hY3aqQotbOnQKius5EhMYczP1M4Wn7RMFBHDOe/vuZUNo/f9918Hk
         6XpRurRAhbGL96uGrqVWkavJSvyFyvYxPCVrSZLcvYZ9nuNCr7KzaTG5b9XthGhMOEt2
         P37mqfuCCW9cPmOWohqsF/l/LAzc4Y8jRzdnLbbMqrpcA/2b+ouV4MU4LP9Vz18YQW8s
         qUbg2w+R8rZRTE1kCg1DCg45DQpAfiu3pzy9NrjqU6sHVk4V5apUBvzAX6xOEYrplCO5
         dOcoWJQoTUTkpi4k72YOOZMinnriEjUt65z34093hZAPtsJzzj7dryv9fuyEedIaQF+z
         rWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760011307; x=1760616107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La8FiX+CY8bsMqSR9+VGygD6K2rBY98SILCfVOTJvQE=;
        b=Wpvn8e+WE7IoSEPpOgWNhAZcXU9wFjjt1eTI66TC3vvwpxEmoIVkjAd1yq34qlmkmo
         4e8tRnx9dV1vNKNYU42ws7bv78YfB2zNGQsli0hPATiNl7GKLhgBQMjloAiFUVOwdA+/
         1+tKmRMhbIk9dclXZyY1KParCKnfuD2f5keTVnus7hvEzlc0B86rs2lfEd69iy2FCNNn
         8X7ZFKdQWfJJX2BbDIeOFBvX/L67g4bvr+zCiPoIjjjn8oDcuXX+TAFsp3oUlXZMSSzH
         jysXnauuhwj45GKQ5oCc1ojXhk5eCtvKS1x9FO9ybnrmr+MDYFZ8EDLVIf3o6JEsN/aI
         2ZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtuQj8BHe9JesgLgPUj24lLsHWCT3lX77c97CoY6scbuM1hwBgu/fiR9qNu9thPr0WZuuFmX323ok=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAshJeFQdY4SsRLOq+oyht3zVKAwT9Fb5u4cJzbh/RU7Fyv2mf
	bVbDxn1bkEn7D+dJgoQxSWc4s4gaSJ5Bfmx9HqWSIFrQHsdBEPgZfpoAzln9ici5CQ==
X-Gm-Gg: ASbGncvLuaD8jo9OuL2wN38gn+dnabfagXDbTWvKFQYpF7doM3p7NZV1mIVmHwwqWO3
	1viWmXi8WjMqFnXS+0zDhSBPZst1Lygg9WNk2Cb8oos7hiWkPnygbCjN5VhD6p0BWuViu5MQgq6
	CyZXAtaQYg5VD6ewQ8Lx0yqB4m4CiuytAs5YuJeLd+03s7F33ExXFoW4neN5rddYolsU3BX75OZ
	J93TQIvBak/1oi8KKOl0ZYgrVvPcN6/mYB0IysTBdE34EzsUUyI/xS6sVZSZ8kzP2AuKKgniWTH
	0MGerQTOkx0sVsvFMZ6+WINmHJbmcipdOoqvg8Y0KFFKdwJFHrpRfr5lA8lBpbD9J3t4ClNr4qo
	iU6xNZpNfslu4vtn8A7qQRelqqIYtmTbLzvJ4BKuSIQh1nhVcA10omh42CNz3tm1qM5s5WOeKOa
	OzF8u3ncRi4QWy/krTV79L6WOmeLA7vhAYCsKYBNpbYw==
X-Google-Smtp-Source: AGHT+IE5VqTcv+MJyqao0z/KfPXChaZHz/xk9gRkpv6hqsFkvTu2K/FrvAvfinIeGP8u/8Zzq09D+g==
X-Received: by 2002:a05:6000:2c0e:b0:3df:c5e3:55fe with SMTP id ffacd0b85a97d-4266e7dff05mr4736090f8f.29.1760011307518;
        Thu, 09 Oct 2025 05:01:47 -0700 (PDT)
Message-ID: <693b0730-b541-4d24-a83e-64f9b09705c1@suse.com>
Date: Thu, 9 Oct 2025 14:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86: hvm: vlapic: rework WR/rsvdz masks for LVTx
 regs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251009114249.1964387-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251009114249.1964387-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2025 13:42, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Rework LVTx registers masks usage in MMIO/WRMSR write emulation code:
> 
> - do LVTx masks renaming and rearranging to x_WR_MASK/x_RO_MASK
> 
> - rename "vlapic_lvt_mask[]" to "lvt_wr_masks[]" to indicate they define
> writable LVTx regs bits
> 
> - add lvt_rsvdz_masks[] and use it in guest_wrmsr_x2apic() for "Reserved"
> bits checking (RsvdZ, Non-zero writes to reserved bits should cause #GP
> exception)

Didn't we agree that this may better be done in two steps?

> - add LVT_REG_IDX() macro to avoid open coding calculation of LVTx regs
> indexes for lvt_wr_masks[]/lvt_rsvdz_masks[] in many places
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Hi
> 
> Patch created according to discussion [1] and based on [1].
> 
> I've seen patches from Jan [2] a bit late, so sending
> it as is for now.

Just wanted to ask, not the least because I'm increasingly of the opinion
that putting your fix on top of that series might end up being better.
For example, the special treatment of APIC_CMCI then shouldn't be needed
anymore.

> @@ -881,7 +898,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
>      case APIC_LVTERR:       /* LVT Error Reg */
>          if ( vlapic_sw_disabled(vlapic) )
>              val |= APIC_LVT_MASKED;
> -        val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
> +        val &= array_access_nospec(lvt_wr_masks, LVT_REG_IDX(reg));

Just like it's here, ...

> @@ -1013,26 +1030,18 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr, uint64_t val)
>              return X86EMUL_EXCEPTION;
>          break;
>  
> -    case APIC_LVTT:
> -        if ( val & ~(LVT_MASK | APIC_TIMER_MODE_MASK) )
> +    case APIC_CMCI:
> +        if ( val & ~(LVT_WR_MASK | LVT_RO_MASK | APIC_DM_MASK) )
>              return X86EMUL_EXCEPTION;
>          break;
>  
> +    case APIC_LVTT:
>      case APIC_LVTTHMR:
>      case APIC_LVTPC:
> -    case APIC_CMCI:
> -        if ( val & ~(LVT_MASK | APIC_DM_MASK) )
> -            return X86EMUL_EXCEPTION;
> -        break;
> -
>      case APIC_LVT0:
>      case APIC_LVT1:
> -        if ( val & ~LINT_MASK )
> -            return X86EMUL_EXCEPTION;
> -        break;
> -
>      case APIC_LVTERR:
> -        if ( val & ~LVT_MASK )
> +        if ( val & lvt_rsvdz_masks[LVT_REG_IDX(offset)] )

... array_access_nospec() also needs using here.

Jan


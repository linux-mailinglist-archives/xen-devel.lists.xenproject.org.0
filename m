Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5DAA7F5B9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 09:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941483.1340949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u237z-0000ZE-8F; Tue, 08 Apr 2025 07:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941483.1340949; Tue, 08 Apr 2025 07:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u237z-0000Wg-5Q; Tue, 08 Apr 2025 07:12:11 +0000
Received: by outflank-mailman (input) for mailman id 941483;
 Tue, 08 Apr 2025 07:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u237x-0000Wa-Bt
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 07:12:09 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c849a350-1448-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 09:12:08 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso2962624f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 00:12:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f11eb708fsm7312485e9.1.2025.04.08.00.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 00:12:07 -0700 (PDT)
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
X-Inumbo-ID: c849a350-1448-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744096327; x=1744701127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QUObOkx8rvFp79ELXW671pjeJwSoCSeHjS0UtDC6N8w=;
        b=gX65NG8OU4McaSZmFVzp3UD0E5lYP93ofoa0jukHndmXXJf9YWmN1JC6K9CiF64Ixc
         wdAK31VWa3/uqv8GkxDuVtgSfPfcDr5OUegNY8AZzwrpCf01K/+cI6od53agT2IJ5JYy
         I8lRKdCUZjayOVTg8pYueOj7r/qRH38PKrViMbn2oKHxajs6AwWETu25zMis8WpILQ3K
         colY511N48K5ye1KWp2SFIFAlqWiKpQ9dTvtJ9+L2eONnj4vL7x31VPmS0WJ+zXM1fAQ
         CS/MJr7fvUxZT7vghQ2e+xyFdPRGiGXOweJzZ/oNz4qxh8fcTwDitPOPf2GHZB5coqEc
         nnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096327; x=1744701127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUObOkx8rvFp79ELXW671pjeJwSoCSeHjS0UtDC6N8w=;
        b=BloIW242KTXV5C531V3yROOCXPMchJPvxvVs7kh3eL1p+yQXiy1uG1IRzXEmj53hD9
         CoQ81VZ2Igbt0F1QflIw7GB6nC6rHgWtCHDEBdIJB4D3ggKcuAp+iWAr//QGlunbTrF4
         CsFROdMoajZu2OQKe1S+Yd6evSqnonJwbNIHWHqizF9XY/77RF0PTzpI9i/vWYSNvJ+f
         Zo2womE8SAplU6inmRxw70lqaK+LOM2YbPYrXypumJZwcK/5mdcBUQiHAmelSbYEFBfz
         StnjfPEnEbAef/5F/8qk/1SgZZTKnoGdRrHtD+8279hpTRPExVffpRHYPr2MhBBw+gRU
         9rtA==
X-Forwarded-Encrypted: i=1; AJvYcCVi4EuzZn27byLgtzcqjtCn3pYIPTig8MYK3WTK4s5qI/o6EbeVitAzEDJ4oM/rCUMU8bNZsQP8zS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIpC2+E8Leoh6uiuKlRcZu+t1O9ZvrZK/26f0hVfrfhJ9k1fJb
	G3qzjVRB2nNs9lkwTdIHGHVKe3Da3+7YkQCA/vKBAS2aOCf0mFFGjscrF+Ub5qWPmMyrQCrIlKQ
	=
X-Gm-Gg: ASbGncs/a8guzlX7RA18SRvtgX0kegN598pkfPdUZ9QM5eZo1IE9I3jDozUJdvy2cMn
	FLrwy3HM75RQYNaVTNqfNDk53zI8ZFY1zpVJZptzttW5Y5TW9ZkPsn73QlxhdOPnnjOIGrplb8K
	n8QZo5GfzY7XgcbEqiIO3c6NJa9mbm/ORV82KDchW0gB0aHfNL80PFpV8vvLipyxx83eJUboHhV
	CChdnQyRV8TBF7U5XAenYqal512CPUrY9NhkYP5jfTz6+6jXcDENisIJHRN9alAZGSleVsAQk17
	UoqTmtgBMhlOUNGRLg9pRzj7gaTKRdqbXirYmQ3X/7gnvnxswKshOrQw4NNFbBSubO1Ca+9w1XC
	xN4TeRnkeAoC7IBVSqWIceUN9GWMFklDqYYG2IdzB
X-Google-Smtp-Source: AGHT+IGTz0jyl6RnH4mLNAZ1D3WSdUx45SXfk0hNe40adJtF7GPpmEaRtYSS6k958U2bbikQLBsn0Q==
X-Received: by 2002:a5d:648b:0:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39cb35aa6ffmr13095348f8f.34.1744096327434;
        Tue, 08 Apr 2025 00:12:07 -0700 (PDT)
Message-ID: <e6e43d87-4e6d-498f-b234-a2b577fce7b6@suse.com>
Date: Tue, 8 Apr 2025 09:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/vmx: Rework __vmread()/vmread_safe()/vmr()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250408011454.2274613-1-dmukhin@ford.com>
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
In-Reply-To: <20250408011454.2274613-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 03:15, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use `asm goto()` in vmread_safe() to simplify the error handling logic.

This can't be quite right, considering we need to avoid outputs there.

> Update __vmread() to return `unsigned long` as per suggestion in [1].
> Rename __vmread() to vmread_unsafe() to match the behavior.

I disagree with this renaming: See e.g. rdmsr() and rdmsr_safe() that we have.
The common case function wants to not have unnecessary verbosity in its name.
And there's nothing unsafe about it in the general case. Plus if there was
anything unsafe, many of the call sites would require some form of error
handling.

> @@ -1957,38 +1955,44 @@ void cf_check vmx_do_resume(void)
>      hvm_do_resume(v);
>  
>      /* Sync host CR4 in case its value has changed. */
> -    __vmread(HOST_CR4, &host_cr4);
> -    if ( host_cr4 != read_cr4() )
> +    if ( vmread_unsafe(HOST_CR4) != read_cr4() )
>          __vmwrite(HOST_CR4, read_cr4());
>  
>      reset_stack_and_jump(vmx_asm_do_vmentry);
>  }
>  
> -static inline unsigned long vmr(unsigned long field)
> +static inline unsigned long vmread(unsigned long field)
>  {
> -    unsigned long val;
> +    unsigned long value = 0;
>  
> -    return vmread_safe(field, &val) ? 0 : val;
> +    asm goto ( "vmread %[field], %[value]\n\t"
> +               "jmp %l[out]"

Why's the JMP needed here? With it dropped, why's open-coding of vmread_unsafe()
necessary here? And why's the "safe" variant being replaced by the "unsafe" one?

> +               :
> +               : [field] "r" (field), [value] "m" (value)

"value" is an output and hence cannot be just "m" (and hence be an input").
The only option to make such work correctly would be to ...

> +               :

... add a "memory" clobber here. Which may have other unwanted side effects.

> +               : out );
> +out:

Nit (here and elsewhere): Labels indented by at least one blank please. See
./CODING_STYLE.

> +    return value;
>  }
>  
> -#define vmr16(fld) ({             \
> +#define vmread16(fld) ({          \
>      BUILD_BUG_ON((fld) & 0x6001); \
> -    (uint16_t)vmr(fld);           \
> +    (uint16_t)vmread(fld);        \
>  })
>  
> -#define vmr32(fld) ({                         \
> +#define vmread32(fld) ({                      \
>      BUILD_BUG_ON(((fld) & 0x6001) != 0x4000); \
> -    (uint32_t)vmr(fld);                       \
> +    (uint32_t)vmread(fld);                    \
>  })
>  
>  static void vmx_dump_sel(const char *name, uint32_t selector)
>  {
>      uint32_t sel, attr, limit;
>      uint64_t base;
> -    sel = vmr(selector);
> -    attr = vmr(selector + (GUEST_ES_AR_BYTES - GUEST_ES_SELECTOR));
> -    limit = vmr(selector + (GUEST_ES_LIMIT - GUEST_ES_SELECTOR));
> -    base = vmr(selector + (GUEST_ES_BASE - GUEST_ES_SELECTOR));
> +    sel = vmread(selector);
> +    attr = vmread(selector + (GUEST_ES_AR_BYTES - GUEST_ES_SELECTOR));
> +    limit = vmread(selector + (GUEST_ES_LIMIT - GUEST_ES_SELECTOR));
> +    base = vmread(selector + (GUEST_ES_BASE - GUEST_ES_SELECTOR));

The renaming causes entirely unnecessary extra churn here (and of course
elsewhere). The patch is already big enough without this.

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -595,7 +595,7 @@ struct arch_vcpu
>  
>      /* Debug registers. */
>      unsigned long dr[4];
> -    unsigned long dr7; /* Ideally int, but __vmread() needs long. */
> +    unsigned long dr7; /* Ideally int, but vmread_unsafe() needs unsigned long. */
>      unsigned int dr6;

If you left this comment alone, all would be (largely) fine - this particular
aspect could then be tidied in a follow-on path. But vmread_unsafe() specifically
does not need "unsigned long" anymore. The issue was with __vmread() taking a
pointer argument.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -320,16 +320,40 @@ static always_inline void __vmpclear(u64 addr)
>      BUG();
>  }
>  
> -static always_inline void __vmread(unsigned long field, unsigned long *value)
> +static always_inline unsigned long vmread_unsafe(unsigned long field)
>  {
> -    asm volatile ( "vmread %1, %0\n\t"
> -                   /* CF==1 or ZF==1 --> BUG() */
> -                   UNLIKELY_START(be, vmread)
> -                   _ASM_BUGFRAME_TEXT(0)
> -                   UNLIKELY_END_SECTION
> -                   : "=rm" (*value)
> -                   : "r" (field),
> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0) );
> +    unsigned long value;
> +
> +    asm volatile ( "vmread %[field], %[value]\n\t"
> +                   "jc 1f\n\t"
> +                   "jz 1f\n\t"

Why not JBE as it was before?

> +                   "jmp 2f\n\t"
> +                   "1:\n\t"
> +                   "    ud2\n\t"
> +                   "2:"

This is specifically why we used UNLIKELY_*() before. There's no justification
whatsoever in the description for the dropping of its use here.

Plus - where did _ASM_BUGFRAME_TEXT(0) go? A bare UD2 isn't acceptable, as it
won't be possible to associate it back with the respective source line.

> +                   : [value] "=rm" (value)
> +                   : [field] "r" (field) );
> +
> +    return value;
> +}
> +
> +static inline enum vmx_insn_errno vmread_safe(unsigned long field,
> +                                              unsigned long *value)
> +{
> +    asm goto ( "vmread %[field], %[value]\n\t"
> +               "jc %l[vmfail_invalid]\n\t"
> +               "jz %l[vmfail_error]"
> +               :
> +               : [field] "r" (field), [value] "m" (*value)

See comments on the vmr() adjustments you're making.

Jan


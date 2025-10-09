Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3460BC9CDE
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 17:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140760.1475550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6scS-0004Nc-PI; Thu, 09 Oct 2025 15:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140760.1475550; Thu, 09 Oct 2025 15:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6scS-0004Km-Lw; Thu, 09 Oct 2025 15:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1140760;
 Thu, 09 Oct 2025 15:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6scR-0004Kg-PA
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 15:31:51 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 130ed784-a525-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 17:31:50 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42568669606so831274f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 08:31:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ac750sm35749191f8f.24.2025.10.09.08.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 08:31:49 -0700 (PDT)
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
X-Inumbo-ID: 130ed784-a525-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760023909; x=1760628709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=io4dlExgNRKKTV/M/RdL6LIVsz0ciJwFiuOL0cGE/cs=;
        b=EWLejejZfzTOhksveGaf2SU+0jtigYIWkjzhypo1WnPaLfpaD9W1q5CtPZ2kl7aCZn
         KG+5VZdw3foipPb7v+xBZNrL36IzjOvdgO4RQfMf3+OVqSCrzayaOoaf9zZA/DJDq6Ax
         kMiSll9OXagWxE4mb7bZNvDpNESWi4/46T4VZ97ilDSPsUEgbij4QLwh6loEieOy9kc2
         rGjo4IJLWJQr8vR0kSHnMCOk0wrC8XFLB+HfpgzUvXdvCG3fVaFmZbYu19ybRkH+6OGq
         IaXjPi6xsmgVVNSffbxDDxsh75FXdXlrhHDIBiUmQoAhc6r89XmUPgZ/fDR/If5seBSE
         ixUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023909; x=1760628709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io4dlExgNRKKTV/M/RdL6LIVsz0ciJwFiuOL0cGE/cs=;
        b=hmUTW4Pzi4j21QizHYe2686jyOMGX4SW+FvCMUAgV+p+WqxvP7ewUMxatw2jOXD5AI
         VjFY197fjZecZHT/0C3DeRoCX9ddnitQZlVJL1q2dKcr9LuLN6vZrurKdeltjHyKSGFL
         fS/nqMqqQ2Np5Sb+6TJZw/6sitPKmbFPTYyF0+/eihxk3mKSNg5pszuESPQ94IBT2M+d
         yrnMFYZmHzOMwjDeKh7fQxWNZS8razZY0E6q8O0VWgrFI3g06iHDc+wHxjA7qGTWaley
         H9t9ybVMI+xc63pxhDOVvG8j+ZrpTqKIpD2SYZA3/S6SCztxAIwIdPtglEkBwWyuYLqP
         H9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXHjH1iQ+NUa3t8d4Uoz8LyhUoC4KuAlCOKVBUvLcK222F0uXrrZqXj/sjOR4ngScLqmRsNZm7Rjm8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxUb7/4P4FvPSNzUx7j5gyyICLbMFNdWCd0mk+cxFN6DrPrCft
	vj2sM664mPoBn+RsGBs2YfRn7sc+DsRY75ZfwTZjYoY32JvIcRYe7IkW+ndeRDTRXw==
X-Gm-Gg: ASbGnctaufBpbSkEIxmZuaMdBBUwIpZ9vfVJJlt+Mrl9uTiWs4sR/aBC02VqYn3969b
	60naD+gfHeH8jwy8oo6gbWs+WBk9dXJnNuAqDqlVGOuhJAhzwhuU30Tw+IhAgExcJywVOEbjpIk
	hZKIbYKSsSlA6sJMm6ttrtv9mHD2PKK2Xe1st0etV/h2r4pb1WJs1IehlxvxmdZd8ycccD5p1jI
	OZbMmX/r2Etdk5rXKAgumrxXtTl0ORN2AtTa/pEXLa3U06SqJB1m2kuSf1Yt03PiDREoVNU8awh
	wNecHD/7/M8IbiXRAca74Q8eIH4jxEM7sSkAcR9ViGyxw9AVbfB6ccKQAEN8ZC4SSxkNHRt+C/t
	qJDnxmL/qE0Ouy7lbSl30Hl3/Yehjuqlak5YfecngAGodcJoMEvmCrKtkGXG58/ctxbU4bn452h
	fOIJrk3c+jZbRH0urq3v+XC8JgbYd0rws=
X-Google-Smtp-Source: AGHT+IHg5tRS5K7JFOrWcLruS7oaVdYSjpJx9bOFRVJgQY3CqymtocRKxZQ7H6JuNWM1/ESYcKqr3A==
X-Received: by 2002:a05:6000:230e:b0:425:76e3:81c5 with SMTP id ffacd0b85a97d-4266726c314mr5360276f8f.17.1760023909453;
        Thu, 09 Oct 2025 08:31:49 -0700 (PDT)
Message-ID: <f5ae9852-4fa8-4441-9ad9-491e1d1143b9@suse.com>
Date: Thu, 9 Oct 2025 17:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
 <6a3494af-96a7-4092-a8fe-39aee85fc983@epam.com>
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
In-Reply-To: <6a3494af-96a7-4092-a8fe-39aee85fc983@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2025 16:56, Grygorii Strashko wrote:
> On 08.10.25 15:08, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -32,7 +32,16 @@
>>   #include <public/hvm/params.h>
>>   
>>   #define VLAPIC_VERSION                  0x00050014
>> -#define VLAPIC_LVT_NUM                  6
>> +#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
> 
> LVT_REG_IDX is more meaningful.

Not to me. I don't like LVT_BIAS() very much as a name, but if anything I'd
want to replace it by something clearly better (and unambiguous).

>> +
>> +#define LVTS \
>> +    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
>> +
>> +static const unsigned int lvt_reg[] = {
> 
> this is going to be used by vlapic_get_reg()/vlapic_set_reg()
> which both accept "uint32_t reg", so wouldn't it be reasonable
> to use "uint32_t" here too.

Possible, but against ./CODING_STYLE (applies to your other uint32_t remarks,
too).

>> @@ -41,20 +50,21 @@
>>       (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
>>       APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
>>   
>> -static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>> +static const unsigned int lvt_valid[] =
>>   {
>> -     /* LVTT */
>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>> -     /* LVTTHMR */
>> -     LVT_MASK | APIC_DM_MASK,
>> -     /* LVTPC */
>> -     LVT_MASK | APIC_DM_MASK,
>> -     /* LVT0-1 */
>> -     LINT_MASK, LINT_MASK,
>> -     /* LVTERR */
>> -     LVT_MASK
>> +#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
>> +#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
>> +#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
>> +#define LVT0_VALID    LINT_MASK
>> +#define LVT1_VALID    LINT_MASK
>> +#define LVTERR_VALID  LVT_MASK
>> +#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
>> +    LVTS
>> +#undef LVT
>>   };
>>   
>> +#undef LVTS
>> +
> 
> I know people have different coding style/approaches...
> But using self expanding macro-magic in this particular case is over-kill
> - it breaks grep (grep APIC_LVTT will not give all occurrences)
> - it complicates code analyzes and readability
>     - What is array size?
>     - Which array elements actually initialized?
>     - what is the actual element's values?
> - in this particular case - no benefits in terms of code lines.
> 
> It might be reasonable if there would be few dozen of regs (or more),
> but there are only 6(7) and HW spec is old and stable.
> 
> So could there just be:
> static const unsigned int lvt_reg[] = {
>   APIC_LVTT,
>   APIC_LVTTHMR
>   ...
> 
> and
> 
> static const unsigned int lvt_valid[] = {
>   [LVT_REG_IDX(APIC_LVTT)] = (LVT_MASK | APIC_TIMER_MODE_MASK),
>   [LVT_REG_IDX(APIC_LVTTHMR)] = (LVT_MASK | APIC_DM_MASK),
>   ..
> 
> Just fast look at above code gives all info without need to parse all
> these recursive macro.

And with no guarantee at all that the order of entries remains in sync
between all (two now, three later) uses.

>>   #define vlapic_lvtt_period(vlapic)                              \
>>       ((vlapic_get_reg(vlapic, APIC_LVTT) & APIC_TIMER_MODE_MASK) \
>>        == APIC_TIMER_MODE_PERIODIC)
>> @@ -827,16 +837,16 @@ void vlapic_reg_write(struct vcpu *v, un
>>   
>>           if ( !(val & APIC_SPIV_APIC_ENABLED) )
>>           {
>> -            int i;
>> +            unsigned int i,
> 
> uint32_t?
> 
>> +                nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;
> 
> This deserves wrapper (may be static inline)
> Defining multiple vars on the same line makes code less readable as for me.

I don't see multiple variables being defined on this line.

Jan


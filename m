Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46CACCCB45
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 17:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189906.1510629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGja-0008Gb-Sf; Thu, 18 Dec 2025 16:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189906.1510629; Thu, 18 Dec 2025 16:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGja-0008DU-Pa; Thu, 18 Dec 2025 16:20:10 +0000
Received: by outflank-mailman (input) for mailman id 1189906;
 Thu, 18 Dec 2025 16:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWGjZ-0008DO-3T
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 16:20:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68749e14-dc2d-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 17:20:03 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso3640185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 08:20:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324498f8fcsm6074700f8f.24.2025.12.18.08.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 08:20:02 -0800 (PST)
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
X-Inumbo-ID: 68749e14-dc2d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766074803; x=1766679603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AbY1A2navqHGoxYq4ADdTsAQYnXtOjPOmroHMNFGK9w=;
        b=WEu/xXW0zh5YsQw6EHYrBF3LyHx1q8ECuOjlgSnq8mJZvOJW/tkXnjdMAs3phivO39
         idKgBXyf4soXPz6+TLCfpOkBaDwlg+vzTPwRQwmqJPoD9RJMqxPfsMuDOvj3XRUxjSVI
         /PYcr11HuXf4Q7baCSG4AnK1OhuphG7sx1oaODJBiwC0ypfZ8pnFuHlf7Ib0tXWxh+Yk
         Cf8oVn7qEF1P8AIoMRnaU7FjEL/KYYDLf4epOMzh8uDwIM4ZjSS7g5p2pqXv5fMq0w1C
         flMa/PpGwC7VgOz/gYQaF5NJOBj5jXHOkY46Q9jpuc8fVR/XxGolVxNxMvKub9b9DLAC
         UpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074803; x=1766679603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbY1A2navqHGoxYq4ADdTsAQYnXtOjPOmroHMNFGK9w=;
        b=r7+T8xGvIOghFB0zeOYUuTyACQekXax+R/saxNaPSTBcuS7aOUE5Ir9KFpdHVbT7Je
         UG0PaJWRa36z2BJMc3ea3835rUulHkFB6SFQFTwVSRtZMpkGLilKiHAXd+CejIf70Khe
         EzC0gysUfuod5sZ0+EFV1zAsFQQFgRdvVlUca90tHlgnRNorxDBSz9pWpKXumTsip6P0
         F/DyaX/eOsq7vx6f0idiWjovxbn4l3a/K2IliU78MM1UEM8P/dCqBpEfwcfH3oWrfsNk
         +fDh8qpk9YDw8ZeQ5WqS3WtRDah2WD1fi26pxCivoji7+wpSxR+3pmMw6FpBhVZ4aXGu
         skRA==
X-Forwarded-Encrypted: i=1; AJvYcCXopG6S17XWWbwqIxiPyDc/J275PdjXs2rGoQEwpNQAZLufNTK3c7WSnRZUjaKxV8sLZprGeyYulCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU9idX5D9gOenbTEyEB3HUc8v4d7km85NhOmJB3Dv1n7bDtmIP
	Aj48Pm9q0OEh/KXPnteRhdi5rz6nDqQ62TauQBzrXI2jdMoIpMZux/S8K4hJnPncyw==
X-Gm-Gg: AY/fxX5nXewOtN5yn7vTNe+pzETVn9nQRriCBc5Sq5MObmEGHKSkB8EC/nRXjuBgukS
	jwvgoAW2hzin2BPBFLd6WD62QxcNuRNAz8QiJcdxf4hVoCGy+q4NKODCN5YaZENx/2LMkLGTNR0
	yMX2LJCVmUriGvQMnARpPvIRVLO1jhBpGkpvbN+EoC8WO7TSDObTzBaouq5b5A9c6SJbpZt1RAK
	oCsHvAT7XGtbQsUd/I9xSbzXmngxKtkym7I2Glo9kgvutOalyun+/qkhr4sraUON2nV39nqynwm
	57qGAjZXu++iSwuBXo+Q9Dcz647SINtiPxO4NRTC4rbc4vcT36dguCSbJB2d8aGtKyeCeNM35oD
	yfHnH+505FNS9TUCR2E0uhNvuF3Q5AlYYaf+8FX5/VdI+fmWNfjl0gkSloXyn/aA/8o1ps5FqpP
	0j4w3xiySJBWadyy40qtJlPQ11IkQXVKJfYaFsvLHif1qBmxOMvIAloeBEqfIMZ23/c7k9obDqC
	QM=
X-Google-Smtp-Source: AGHT+IEOTg+P7LbaeXXk6v7BKyV2LM9SS6/kk/IOVOALyS1efuaU2rnwCTJWaxO2euhvicWPlH7WdQ==
X-Received: by 2002:a05:600c:4f14:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-47a8f8bd9a7mr246940525e9.9.1766074802678;
        Thu, 18 Dec 2025 08:20:02 -0800 (PST)
Message-ID: <129a076a-6523-4134-98b7-e67b0041b970@suse.com>
Date: Thu, 18 Dec 2025 17:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250930190550.1166875-1-grygorii_strashko@epam.com>
 <26376311-33fb-42fd-a346-417b4faba55e@epam.com>
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
In-Reply-To: <26376311-33fb-42fd-a346-417b4faba55e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 16:32, Grygorii Strashko wrote:
> On 30.09.25 22:05, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The LAPIC LVTx registers have two RO bits:
>> - all: Delivery Status (DS) bit 12
>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>
>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus,
>> and the IRQ is:
>> - or accepted at destination and appears as pending
>>    (vLAPIC Interrupt Request Register (IRR))
>> - or get rejected immediately.
>>
>> The Remote IRR Flag (RIR) behavior emulation is not implemented for
>> LINT0/LINT1 in Xen for now.
>>
>> The current vLAPIC implementations allows guest to write to these RO bits.
>>
>> The vLAPIC LVTx registers write happens in vlapic_reg_write() which expect
>> to implement "Write ignore" access type for RO bits by applying masks from
>> vlapic_lvt_mask[], but vlapic_lvt_mask[] contains incorrect masks which
>> allows writing to RO fields.
>>
>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>> fix it by fixing LVTx registers masks in vlapic_lvt_mask[].
>>
>> In case of WRMSR (guest_wrmsr_x2apic()) access to LVTx registers, the SDM
>> clearly defines access type for "Reserved" bits as RsvdZ (Non-zero writes
>> to reserved bits should cause #GP exception), but contains no statements
>> for RO bits except that they are not "Reserved". So, guest_wrmsr_x2apic()
>> now uses different masks (than vlapic_reg_write()) for checking LVTx
>> registers values for "Reserved" bit settings, which include RO bits and
>> do not cause #GP exception.
>>
>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> Changes in v2:
>> - masks fixed in vlapic_lvt_mask[]
>> - commit msg reworded
>>
>> v1: https://patchwork.kernel.org/project/xen-devel/patch/20250925195558.519568-1-grygorii_strashko@epam.com/>   xen/arch/x86/hvm/vlapic.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 79697487ba90..2ecba8163f48 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -44,15 +44,17 @@
>>   static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>   {
>>        /* LVTT */
>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>> +     (LVT_MASK | APIC_TIMER_MODE_MASK) & ~APIC_SEND_PENDING,
>>        /* LVTTHMR */
>> -     LVT_MASK | APIC_DM_MASK,
>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>>        /* LVTPC */
>> -     LVT_MASK | APIC_DM_MASK,
>> -     /* LVT0-1 */
>> -     LINT_MASK, LINT_MASK,
>> +     (LVT_MASK | APIC_DM_MASK) & ~APIC_SEND_PENDING,
>> +     /* LVT0 */
>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>> +     /* LVT1 */
>> +     LINT_MASK & ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING),
>>        /* LVTERR */
>> -     LVT_MASK
>> +     LVT_MASK & ~APIC_SEND_PENDING,
>>   };
>>   
>>   #define vlapic_lvtt_period(vlapic)                              \
> 
> I'd like to return back here and finally get this issue fixed (and make tests green again).
> 
> So could this simple fix be merged?
> 
> There is also follow up patch [1] which can be still a "follow up" patch or can be made prerequisite patch.
> 
> [XEN] x86: hvm: vlapic: rework WR/rsvdz masks for LVTx regs
> [1] https://patchwork.kernel.org/project/xen-devel/patch/20251009114249.1964387-1-grygorii_strashko@epam.com/

I was really intending for "x86/vLAPIC: CMCI LVT handling" to go first. Which
obviously requires someone to review it ...

Jan


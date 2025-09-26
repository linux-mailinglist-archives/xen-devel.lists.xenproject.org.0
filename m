Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E10BA3653
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 12:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131441.1470531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v264W-0000Yn-OU; Fri, 26 Sep 2025 10:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131441.1470531; Fri, 26 Sep 2025 10:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v264W-0000WZ-LM; Fri, 26 Sep 2025 10:53:04 +0000
Received: by outflank-mailman (input) for mailman id 1131441;
 Fri, 26 Sep 2025 10:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v264U-0000WR-PB
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 10:53:02 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8160cce-9ac6-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 12:53:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b38e5c2e055so55906466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 03:53:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fd0a54sm349560966b.86.2025.09.26.03.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 03:52:59 -0700 (PDT)
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
X-Inumbo-ID: f8160cce-9ac6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758883980; x=1759488780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EqYrefFKk4Wrr3Po6mt7vYWqF5p8dKa88zs5EDkhzww=;
        b=X8kFtyN9HXvt3++QIFdNG51v480puUEc7xA10m8TpRwsNsTgiHZ1eSjTXvt02ESltV
         XmlHcIGdHiL/CLzqyfHcvDhVynvapKqSTYAiXAoLGuO3ebOHfeXjDFqrie7A4O+n43wc
         tEnto5ti7mDZa7u4NZqDh5u+NVcLDF/lcbz11ge6njI+JKjNBYhKVCpEekjmFjFFhrVj
         XiFzSMNoZqEkhYLS3lPTujQ4iuHHOMdsROuC7H72cGZRJRIlHFAHSewtBvps5UBy/te5
         WpYNaW1jb9TqTskkTaz3Ys/q9yI8KsQLKqmWcyvXMg0D2q/1IFHeeQv9GoMyganAH7Jf
         yWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758883980; x=1759488780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqYrefFKk4Wrr3Po6mt7vYWqF5p8dKa88zs5EDkhzww=;
        b=MJ3V7PoMNr0fT53W5s/uASYDqsvmxqlu8Iimu/HnujtLylqZrNDSwIfp1X80o/WMvH
         AM5oM9qona49k74MMGbI1KEyPf/XlmqvK85NPyrLXwRVahFqOmDKL6YBNfRt+UYgsg1W
         PbgvgK1mZ7YUMG40j1ooiflry93t6sl5BfdgyfD1qaUDtu1ClnAcUilpktk2VIUpZClY
         vk0ZAB80y35Mr+Pb1ScXIgXAVziQLiJ+kLDAlMDXXyHlg0kzXLo1BdjtS7uhMrjH7U3c
         kI01iE7AgKHPMPvV73vQ7C2eJws6DZe86/gFqyFsR204wTUZSw9yJZB7P1dtb+Rwtt3l
         iDjw==
X-Forwarded-Encrypted: i=1; AJvYcCWea7QVLKbIXbEVwri3rkXm62CGUs9GkSW+B3sK27ZB2/tArASayVGh8Pjp0kdYtm/F6N1XVXcKKvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/uDk1AChSjLydmZZwpC3hB958a+gOeQ2pAe8iFgbFpxxWgfUC
	FhF1zir5KORhL6AMakbQeiQskMh6WJaRqwRwn10+cAvzaAHbErPC6hJELtmKepY+Yg==
X-Gm-Gg: ASbGncvgb31VUxLO0gCat8mob0lEr7PjQFEMFEfMJ4acxjT0PUDDqZRYS4CUG43YwCt
	UbHSq3cGkNf7YQUycV3KtbErPm6n9nLKz/6U9rgUWwnuhNpR2gdWUyqIrcGcfF8K9/HSDLhI5x+
	Pt7R3YRyJb55n6isMZIs0l04/hKx0Llv6631xkUeXawcJIpse2a2repdvFVBmJNcQ+tyUQRh+av
	almZnZPrdDZM0RF3VJFTUm20uqnIAg4SF4NnkZzioWs4KkZcZisdiyHX17ONXpk55rMSJGMBut5
	uRrc2S3oiAWrwhKEdUVyPKJM+TF+T+vc4jHdDTIvXl6RIhEZORscbcEqWgx0G3KJ+Bx1QsHOUIY
	ycy7+B/1nAj1LYRK7EMgQx2wl9lZBEC+19vWZN8uWDwSk9IAK2YmHsEUfIdw2Ppri+xkO8Zqyi4
	5FQcnJJx+f6G2+qvzIrA==
X-Google-Smtp-Source: AGHT+IFPESowOGbhcCAlni7hquS/57DIFBzYgyaYfbfSMgpdBIjDaMh/2gSBKigD7cWAWzXcENbTDg==
X-Received: by 2002:a17:907:7e91:b0:b2a:dc08:592e with SMTP id a640c23a62f3a-b34bef96395mr628251466b.49.1758883979968;
        Fri, 26 Sep 2025 03:52:59 -0700 (PDT)
Message-ID: <67dd3659-916b-4e64-afe2-e13fdc8d31f0@suse.com>
Date: Fri, 26 Sep 2025 12:52:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250925195558.519568-1-grygorii_strashko@epam.com>
 <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
 <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
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
In-Reply-To: <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2025 12:38, Grygorii Strashko wrote:
> On 26.09.25 11:17, Jan Beulich wrote:
>> On 25.09.2025 21:55, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> The LAPIC LVTx registers have two RO bits:
>>> - all: Delivery Status (DS) bit 12
>>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>>    This bit is reserved for other LVTx regs with RAZ/WI access type (MMIO), while
>>>    WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bits
>>>    (MBZ access type).
>>
>> Question is what the behavior is for writing the r/o (but not reserved) bits.
>> I wasn't able to find any statement in the SDM.
> 
> Me too. Usually RO/WI on most HW.
> For example, LAPIC MMIO "Write" will be ignored (WRMSR will trigger exception).

My remark was specifically about WRMSR, and what you say here contradicts ...

>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -880,6 +880,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
>>>           if ( vlapic_sw_disabled(vlapic) )
>>>               val |= APIC_LVT_MASKED;
>>>           val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
>>> +        val &= ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING);
>>
>> There shouldn't be a 2nd &= here; what needs adding should imo be added to
>> (really: removed from) vlapic_lvt_mask[].
> 
> I'll try it.
> 
>   (Orthogonal to this I wonder whether
>> guest_wrmsr_x2apic() wouldn't better use that array, too.)
> 
> WRMSR checks for MBZ. RO bits are not MBZ, so masks are different.

... what you say here.

>> While looking at this, don't we have an issue with CMCI as well?
> 
> I see no APIC_CMCI write emulation. only read.

guest_wrmsr_x2apic() has

    case APIC_CMCI:

>> guest_{rd,wr}msr_x2apic() handle it, but vlapic_reg_write() doesn't. I.e. on
>> AMD we would fail to deliver #GP when the guest accesses it, while on Intel
>> we would lose the value written. And we also don't set its mask bit in
>> vlapic_do_init(). I guess I need to make a patch ...
> 
> Is'n it depends on CMCI capability exposing to guest?

Yes, that's part of what I was (effectively) saying.

> (have no idea what's CMCI :)

Corrected Machine Check Interrupt.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6846FBA2E82
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 10:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131303.1470450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23dz-0002mu-GJ; Fri, 26 Sep 2025 08:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131303.1470450; Fri, 26 Sep 2025 08:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23dz-0002kb-DU; Fri, 26 Sep 2025 08:17:31 +0000
Received: by outflank-mailman (input) for mailman id 1131303;
 Fri, 26 Sep 2025 08:17:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v23dy-0002kV-8i
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 08:17:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e1c485c-9ab1-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 10:17:29 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b2bddecc51aso277614566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 01:17:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b37b3b46ba0sm118850166b.2.2025.09.26.01.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:17:28 -0700 (PDT)
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
X-Inumbo-ID: 3e1c485c-9ab1-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758874648; x=1759479448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs2I1+OSxuF8Sr6UbB64Dw+Dzy+1s8GX9PeJCHm1Yug=;
        b=X9yyzY8EXinaZ4FFyVBH4o0SioRZ3NLGz9pdkyhssbH1jyHHRyR1Rpqv1FXHRSwHGg
         l+aMKEECPPGNDhMiiozolNDNOuhIBXCW7832OSuVS3DlZn4J6a1O78tk9HqXMqZ+0pJr
         BLlLqTrwBvqCIuQ1tF79NXd1j3rUQK9qdx4AuSb+lzWWyqRlw8Ma56okY3oqjpSjtpHz
         4jhvxKzHlGbTOVZy03UFTqERjW2dP1A1G4RYerwy1AkKo6CKYH6YIltkNQpQayALsN6y
         ZGj5ns3lW3GKpBL+r51XY2wuSpH5CbqPplMxFL2if2MAjJb6I/uSpxtBiB6fm7E0PQkJ
         pAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758874648; x=1759479448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs2I1+OSxuF8Sr6UbB64Dw+Dzy+1s8GX9PeJCHm1Yug=;
        b=CsKQqOyej57J3HNT87MW67BAzvhwCAYOfZXByeqp1iMZWzYwatUqOXs4+x1kY57yLn
         6I85mUsZU2zJVQmw7ig8Jl+jIbJ/cXaPNvN9X5eD0w0es4VFWtaO70pUPsBIkmd/fkV5
         uzVm3XcPgA7QdI6jzQ8FWAP4ap1T4UboJpfJzUj9OHSeIgLNRDnSst1Q2APhS11CJHfO
         L6C0Fj3bb7HUR7xTmn2iDXyU/dQqqthuZft/MNevKLJG9DLxgMn2407BYQ8JP1DtBWzG
         www11dJF1wPOMyugBQTaniNP7neKMGrtuus6u5RJK+yvSeOIHVp14im+iwZLpGz4uzcq
         vLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4mIZUMJGxYf8aF9TprhbUymEF2hcU6OkK186Ha49xtHn68rKOWJBSgeIn5wCBX6W/nv1u8QxLX9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3xpy3NPlyDVYsFUCVcMhUE2e/a8skMFhvS6RPs974yATY5/k1
	FEl05BxOJd15HLACHtT/vV4KwNn6b/IfcZjcw+9zy/b5jCbjlkhs+aQthS5f8n+38w==
X-Gm-Gg: ASbGncttSOPB3Fb/7NiwrmCMIKAmhw/wUNBmPSto+WPiUM3QRpdnw6+AFjZFFBPf/cP
	6UOK8SfuK5i/FHyohml0847Y3biJWe5DaeaFG4P0jHTg0shOrrDjf8SbKyvdGxQPrRWMHEO37o8
	lpm6rsT5YUjrhLlLYvBqGyFC0Yg/RCKeP5CWR8fAlqM+fWo7z36f3GemcsglHipg5t1cuZGPxsQ
	l+2NxIdevmRAI2V2RqkQ5kE0FVQGMEyxbaWRM6ltYks90TgVWWujL7rMiit/fgKMsZWHsjOndJS
	1whz6RQuscbVgMr7AkK9PYM3o8/zbNAxoPzZmZr4dSa0ESOAc+by34AKK//nZWDdVmFz91tAd+q
	ieMGOcG2M4T4Zdv4x5hBt2g8SM6u5q7cDo69qvuTi+lyRNKRCh1b/rA7Gw2QhNsXX/Q/SRZqB3Q
	9LpXrmbKg=
X-Google-Smtp-Source: AGHT+IH9uwwURUyKes29IiQ7UrpZEd9kPHN0CzbT2qqMjD7PLrbGD9+0C4X7WctdtlxEdOpGssZEtQ==
X-Received: by 2002:a17:907:7e88:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-b34bb8f2acemr689961566b.46.1758874648505;
        Fri, 26 Sep 2025 01:17:28 -0700 (PDT)
Message-ID: <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
Date: Fri, 26 Sep 2025 10:17:27 +0200
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
In-Reply-To: <20250925195558.519568-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.09.2025 21:55, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The LAPIC LVTx registers have two RO bits:
> - all: Delivery Status (DS) bit 12
> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>   This bit is reserved for other LVTx regs with RAZ/WI access type (MMIO), while
>   WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bits
>   (MBZ access type).

Question is what the behavior is for writing the r/o (but not reserved) bits.
I wasn't able to find any statement in the SDM.

> and the current vLAPIC implementations allows guest to write to these RO bits.
> 
> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus, and
> the IRQ is:
> - or accepted at destination and appears as pending
>   (vLAPIC Interrupt Request Register (IRR))
> - or get rejected immediately.
> 
> The Remote IRR Flag (RIR) behavior emulation is not implemented for LINT0/LINT1
> in Xen for now.
> 
> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
> fix it by unconditionally cleaning up those bits in vlapic_reg_write().
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Please also add a Fixes: tag when correcting code.

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -880,6 +880,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
>          if ( vlapic_sw_disabled(vlapic) )
>              val |= APIC_LVT_MASKED;
>          val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
> +        val &= ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING);

There shouldn't be a 2nd &= here; what needs adding should imo be added to
(really: removed from) vlapic_lvt_mask[]. (Orthogonal to this I wonder whether
guest_wrmsr_x2apic() wouldn't better use that array, too.)

While looking at this, don't we have an issue with CMCI as well?
guest_{rd,wr}msr_x2apic() handle it, but vlapic_reg_write() doesn't. I.e. on
AMD we would fail to deliver #GP when the guest accesses it, while on Intel
we would lose the value written. And we also don't set its mask bit in
vlapic_do_init(). I guess I need to make a patch ...

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0ABDCBE9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 08:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143145.1476923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8v2I-0008DQ-Vq; Wed, 15 Oct 2025 06:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143145.1476923; Wed, 15 Oct 2025 06:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8v2I-0008BI-T8; Wed, 15 Oct 2025 06:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1143145;
 Wed, 15 Oct 2025 06:30:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oFce=4Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8v2H-0008BB-AE
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 06:30:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fea18eb-a990-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 08:30:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so41240265e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 23:30:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce582b44sm27527042f8f.16.2025.10.14.23.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 23:30:52 -0700 (PDT)
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
X-Inumbo-ID: 7fea18eb-a990-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760509853; x=1761114653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N2lk3IwiyXhY86G35TNA/Wk+0tqfkse1DcY9+BBibyM=;
        b=co8ovcAbn64adpO2gOxoO9xXRa0+swszG5juw3HWVPW8zjOwlcap7QiX+VDhutNp/y
         DqYo9nWG1+dqfrdqrjxTlK2eXFqVMg83eKRlvybymt4WJwb7uUk5EulO0fKnCAMdOSg1
         Q76Aoq72wXupg1JblKLHojOo/+N+8VmJyEhHsAIumjFg9YozupKumdeCVzsBItVVmd4g
         x0TCVMMuuTDqEPJvub/GrL/DqikHiyz566FwYkiCTi3s+nQFzYrCyNM9zoXH8lEfFje6
         gENKq41a8ZD9HjBRCegu8hQRxRkZvN6U3GZhEE+KEFNNfnadl5Trfi6oSlNrl69vNGkT
         d03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760509853; x=1761114653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2lk3IwiyXhY86G35TNA/Wk+0tqfkse1DcY9+BBibyM=;
        b=sKPEyi//mehpwuUpV3DGqqNilhkx5StqBrgymzgRJDluxh4i/SW67rhpI1uHjQD6ue
         fO7Z3pibpLhBElj0WZ7xCrqWW5uNGxPmXvnUOykYLFAydDDXN+0IX2yq7chxWasEuztO
         0Oj9Q1sS+qJvN8upkdmR8G4QJMjnoOEbVsG8+m0oGYQvpfzCXSD5HFk3eajiiYu+zLGF
         kDlVs2qUffZRHh17hv6kcPZtjuRgFrNFoL9e0GwcrK47alD03+jBOIs2bPaSv9KcIrwp
         DLYo8x7vMkF68vPf2c0JgrChRU5HLJPzjgJ0pdT+DF8bad0BdF3QjUPp4WjqKzUA9aX2
         NeuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnUnAycJ2ZJ7Hx6PK0d4xAC3X7kNAiUAgQcDp7Ef2yuJ3gP3aEQtro7wGJfIDLKw+q633Sy6leRuk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK342Pf/A/bSMvsE7i3ai7VvwdFt+PY/fZDyarojjHcNeJwh2H
	XCMnid1HFJF0zQFGpX4fwCuGKzXAIfkM+jRxiHshrfX/u4NetkCl4gV6sCUmZufmRA==
X-Gm-Gg: ASbGncsW+nbV9mjOeWWqdEb9Tk7V8uHT7TETm571CWRAh6m3fZBXZZGibRx4LeQ+Op9
	SwWv82RmA3qfMyvkOt8gbjQiQF3VyRCwPQoG3V6e1WW8GuQlThK8gSPtT2Mf/a9lxBfCVrKuQLA
	VyvuxlvktYhx3rPTdAxsrb139du/1LX5Kku/NeTpKzhPyBDE0dMuIrDmc64mT/KDXyNqgcaYGly
	AOg5zEUfauY3V1F/q20soOb2u/EvpiRdGlcl0qJ0JYE14Mphou8KQ5BH4gtd5j8am8Zwdbly59E
	gvqdeIRfTkj1Y8JlujQs8DZT8QkJ33YIYZzBROj0UqT6NgqCHZirJ0XOxN6WtiexhO3EnhjeNYp
	CFGQZwYEJDXgObUOtz5ub5KkO02DgFAH6nGpcItRltgdw6u1bbivzWnUbNXDn74WYO94QRqCEE/
	Jb6na7PoQ4lC0c+NnrgQfDvuEwy3HWeXXd/OEfzvJysrMXVdA=
X-Google-Smtp-Source: AGHT+IHpJ5zoad1XolKS3VZ7TDk9q89LIewqqCvGhgwuQsfzDXZhjS14M6DLEBf9WbcsLR5wnatEiA==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:7922 with SMTP id 5b1f17b1804b1-471007a7aa1mr6620045e9.6.1760509852974;
        Tue, 14 Oct 2025 23:30:52 -0700 (PDT)
Message-ID: <6ef29e64-56e9-4180-a6f3-411ecbe7dca5@suse.com>
Date: Wed, 15 Oct 2025 08:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
 <bb9dba9c-3011-4c1a-917d-9d83fcc2c967@citrix.com>
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
In-Reply-To: <bb9dba9c-3011-4c1a-917d-9d83fcc2c967@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.10.2025 21:36, Andrew Cooper wrote:
> On 08/10/2025 1:09 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
>>          return X86EMUL_EXCEPTION;
>>  
>>      offset = reg << 4;
>> -    if ( offset == APIC_ICR )
>> +    switch ( offset )
>> +    {
>> +    case APIC_ICR:
>>          high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
>> +        break;
>> +
>> +    case APIC_CMCI:
>> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
>> +            return X86EMUL_EXCEPTION;
>> +        break;
>> +    }
>>  
>>      *val = high | vlapic_read_aligned(vlapic, offset);
>>  
>> @@ -868,6 +881,10 @@ void vlapic_reg_write(struct vcpu *v, un
>>          vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
>>          break;
>>  
>> +    case APIC_CMCI:         /* LVT CMCI */
>> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
>> +            break;
>> +        fallthrough;
>>      case APIC_LVTT:         /* LVT Timer Reg */
>>          if ( vlapic_lvtt_tdt(vlapic) !=
>>               ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE) )
>> @@ -1024,9 +1041,12 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
>>              return X86EMUL_EXCEPTION;
>>          break;
>>  
>> +    case APIC_CMCI:
>> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
>> +            return X86EMUL_EXCEPTION;
>> +        fallthrough;
>>      case APIC_LVTTHMR:
>>      case APIC_LVTPC:
>> -    case APIC_CMCI:
>>          if ( val & ~(LVT_MASK | APIC_DM_MASK) )
>>              return X86EMUL_EXCEPTION;
>>          break;
> 
> This is almost certainly not how real hardware behaves.
> 
> The APIC is a discrete block of logic, whether it's integrated into the
> core or not.  A new LVT is "just" another interrupt source, and if
> nothing is wired into that pin, then it's just a register which never
> produces an interrupt.
> 
> Accessibility of LVT_CMCI will depend on MAXLVT and nothing else.  In
> silicon, I'm pretty sure it will be hardcoded as fully absent or
> present, because I can't see any reason to make this configurable.
> 
> At this point, things get more complicated.
> 
> On Intel, there's no such thing as x2APIC capable (irrespective of
> x2APIC enabled) without LVT_CMCI which is why there are no additional
> access constraints on the register.
> 
> On AMD, there's no LVT_CMCI even on systems which support x2APIC. 
> Instead, ELVTs are used and it is MCE-configuration based which ELVT the
> interrupt is delivered through.
> 
> Choosing a default MAXLVT based on MCG_CMCI_P is probably fine (although
> it certainly is ugly to tie APIC and vMCE together), but controls on the
> access to APIC_CMCI should be based on MAXLVT.

As you ask for it, I can certainly do so. I didn't because the way it's
done now the checks are cheaper overall.

Jan

